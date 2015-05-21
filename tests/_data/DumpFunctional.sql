--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-21 09:56:55 CEST

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
-- TOC entry 179 (class 1259 OID 4277178)
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
-- TOC entry 225 (class 1259 OID 4277657)
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
-- TOC entry 224 (class 1259 OID 4277640)
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
-- TOC entry 217 (class 1259 OID 4277553)
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
-- TOC entry 193 (class 1259 OID 4277344)
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
-- TOC entry 196 (class 1259 OID 4277378)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 4277303)
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
-- TOC entry 212 (class 1259 OID 4277503)
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
-- TOC entry 191 (class 1259 OID 4277328)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 4277372)
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
-- TOC entry 201 (class 1259 OID 4277421)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 4277446)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 4277277)
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
-- TOC entry 180 (class 1259 OID 4277187)
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
-- TOC entry 181 (class 1259 OID 4277198)
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
-- TOC entry 184 (class 1259 OID 4277248)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 4277152)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 4277171)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 4277453)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 4277483)
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
-- TOC entry 221 (class 1259 OID 4277596)
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
-- TOC entry 183 (class 1259 OID 4277228)
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
-- TOC entry 186 (class 1259 OID 4277269)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 4277427)
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
-- TOC entry 185 (class 1259 OID 4277255)
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
-- TOC entry 190 (class 1259 OID 4277320)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 4277439)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 4277544)
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
-- TOC entry 220 (class 1259 OID 4277589)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 4277468)
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
-- TOC entry 200 (class 1259 OID 4277412)
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
-- TOC entry 199 (class 1259 OID 4277402)
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
-- TOC entry 219 (class 1259 OID 4277579)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 4277534)
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
-- TOC entry 173 (class 1259 OID 4277123)
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
-- TOC entry 172 (class 1259 OID 4277121)
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
-- TOC entry 209 (class 1259 OID 4277477)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 4277161)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 4277145)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 4277491)
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
-- TOC entry 203 (class 1259 OID 4277433)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 4277383)
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
-- TOC entry 182 (class 1259 OID 4277220)
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
-- TOC entry 198 (class 1259 OID 4277389)
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
-- TOC entry 218 (class 1259 OID 4277567)
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
-- TOC entry 188 (class 1259 OID 4277289)
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
-- TOC entry 174 (class 1259 OID 4277132)
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
-- TOC entry 223 (class 1259 OID 4277621)
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
-- TOC entry 192 (class 1259 OID 4277335)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 4277460)
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
-- TOC entry 214 (class 1259 OID 4277526)
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
-- TOC entry 194 (class 1259 OID 4277367)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 4277611)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 4277516)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 4277126)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2632 (class 0 OID 4277178)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 4277657)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 4277640)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 4277553)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 4277344)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 4277378)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 4277303)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-555d-8fc6-0a62-47ccffc5b9df	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-555d-8fc6-ac7c-e6f8ce692b3f	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-555d-8fc6-a189-ba58f457a9e1	AL	ALB	008	Albania 	Albanija	\N
00040000-555d-8fc6-14ac-1c916d469c56	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-555d-8fc6-7f89-542099085791	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-555d-8fc6-741f-74d959dbb83f	AD	AND	020	Andorra 	Andora	\N
00040000-555d-8fc6-d8b9-b5104bef09dc	AO	AGO	024	Angola 	Angola	\N
00040000-555d-8fc6-abda-ed7afe36b3ac	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-555d-8fc6-68e7-cae19a5c5917	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-555d-8fc6-e98c-0e9b9229d109	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-555d-8fc6-c327-d83acd275f9d	AR	ARG	032	Argentina 	Argenitna	\N
00040000-555d-8fc6-40cd-6d1facb4469a	AM	ARM	051	Armenia 	Armenija	\N
00040000-555d-8fc6-4d2f-603eb2e1cee6	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-555d-8fc6-b259-40b9b565011b	AU	AUS	036	Australia 	Avstralija	\N
00040000-555d-8fc6-4a56-6f0cb1b9ec0a	AT	AUT	040	Austria 	Avstrija	\N
00040000-555d-8fc6-511f-ebc048a46fe1	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-555d-8fc6-c0ee-34bdbec88626	BS	BHS	044	Bahamas 	Bahami	\N
00040000-555d-8fc6-9e8d-10eaaafca885	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-555d-8fc6-b763-3cce4d09ea5b	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-555d-8fc6-85e3-57a3225ab9e7	BB	BRB	052	Barbados 	Barbados	\N
00040000-555d-8fc6-04c4-6dde23e3f97d	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-555d-8fc6-b979-94c0ffc9b8cf	BE	BEL	056	Belgium 	Belgija	\N
00040000-555d-8fc6-fa82-41bc8ee4ef4c	BZ	BLZ	084	Belize 	Belize	\N
00040000-555d-8fc6-2748-8b6cda0debd0	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-555d-8fc6-85e3-5d559910ce1f	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-555d-8fc6-8f93-a3757b89c333	BT	BTN	064	Bhutan 	Butan	\N
00040000-555d-8fc6-cfbb-5369a409f899	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-555d-8fc6-6269-f1def906cb84	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-555d-8fc6-31ca-baeb7be57c19	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-555d-8fc6-cfc8-a066754a9bff	BW	BWA	072	Botswana 	Bocvana	\N
00040000-555d-8fc6-4224-fab1103cce0c	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-555d-8fc6-9d64-4b46c3dd8279	BR	BRA	076	Brazil 	Brazilija	\N
00040000-555d-8fc6-19a9-b7fb208465a3	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-555d-8fc6-63f8-b3ea62bfe4a0	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-555d-8fc6-05ca-93d0fc9bc9b3	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-555d-8fc6-401a-731ae6870142	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-555d-8fc6-9d89-ee1be497f28f	BI	BDI	108	Burundi 	Burundi 	\N
00040000-555d-8fc6-2c28-35ed1d4ab42c	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-555d-8fc6-7b67-7e3cbac36057	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-555d-8fc6-7384-280597b1fc85	CA	CAN	124	Canada 	Kanada	\N
00040000-555d-8fc6-8abb-2a3dfee57499	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-555d-8fc6-d8c1-448920eac874	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-555d-8fc6-8623-faa6636fa306	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-555d-8fc6-43b5-7e0e433b1417	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-555d-8fc6-3e9c-e22ade418041	CL	CHL	152	Chile 	Čile	\N
00040000-555d-8fc6-db83-06b1683b4aca	CN	CHN	156	China 	Kitajska	\N
00040000-555d-8fc6-5915-869a3a7296ff	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-555d-8fc6-beda-1f3d72eb3415	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-555d-8fc6-5bd1-daf7a40aa7d5	CO	COL	170	Colombia 	Kolumbija	\N
00040000-555d-8fc6-2673-3fd1279e26a3	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-555d-8fc6-6d6b-27536a19b37f	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-555d-8fc6-79c8-e75c477c5167	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-555d-8fc6-7b89-af2ebc497c2d	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-555d-8fc6-d3a9-a8e035df2eef	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-555d-8fc6-0b08-eaf1198d2f21	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-555d-8fc6-c5d2-0e460c43142e	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-555d-8fc6-0667-693fb61fb18c	CU	CUB	192	Cuba 	Kuba	\N
00040000-555d-8fc6-aff5-e1cb5384e43a	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-555d-8fc6-fb23-941d077525db	CY	CYP	196	Cyprus 	Ciper	\N
00040000-555d-8fc6-e2c8-3f5fca01d7e4	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-555d-8fc6-7c6c-ebc978df4354	DK	DNK	208	Denmark 	Danska	\N
00040000-555d-8fc6-cc93-f25adb9ab7c0	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-555d-8fc6-6c78-8fb1104de7a2	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-555d-8fc6-6cae-7a76605ba795	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-555d-8fc6-e78e-fe22e5e2c5bc	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-555d-8fc6-e831-bba9b00bc94c	EG	EGY	818	Egypt 	Egipt	\N
00040000-555d-8fc6-3d68-bc455622951f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-555d-8fc6-bd1a-7f54db064a91	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-555d-8fc6-d19d-4335fb8ca19b	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-555d-8fc6-0273-e96bee84cde2	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-555d-8fc6-ccf0-c3d6cccaef8c	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-555d-8fc6-266a-467eca90c65f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-555d-8fc6-31f6-ac2619ebb27e	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-555d-8fc6-c1c2-aecdcd9bb72e	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-555d-8fc6-af42-1718f92dfe9e	FI	FIN	246	Finland 	Finska	\N
00040000-555d-8fc6-ce08-a64d434cb91a	FR	FRA	250	France 	Francija	\N
00040000-555d-8fc6-a99a-19d8a939e248	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-555d-8fc7-d4f9-a20af127b96c	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-555d-8fc6-d30a-9f2e4e3d9c98	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-555d-8fc6-8350-5c457dc1cc59	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-555d-8fc6-a9c9-421a4008b7e0	GA	GAB	266	Gabon 	Gabon	\N
00040000-555d-8fc6-00d4-e34687eac5a9	GM	GMB	270	Gambia 	Gambija	\N
00040000-555d-8fc6-d6ca-fde8ca2c56dc	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-555d-8fc6-36db-dcbd02b27b53	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-555d-8fc6-1fc5-a11b786f1549	GH	GHA	288	Ghana 	Gana	\N
00040000-555d-8fc6-c10e-2486f718b512	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-555d-8fc6-de41-b4f36922e904	GR	GRC	300	Greece 	Grčija	\N
00040000-555d-8fc6-f3d8-7be41b34aae2	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-555d-8fc6-e030-ea1a8221d07e	GD	GRD	308	Grenada 	Grenada	\N
00040000-555d-8fc6-dfbb-23ada0c66c9d	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-555d-8fc6-eaa8-59f256de4ba0	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-555d-8fc6-6c15-55f5560ea682	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-555d-8fc6-a029-402796211f83	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-555d-8fc6-1b86-8b12fdfc6594	GN	GIN	324	Guinea 	Gvineja	\N
00040000-555d-8fc6-266f-797ef8c6bccf	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-555d-8fc6-9ebb-422f8f6588a0	GY	GUY	328	Guyana 	Gvajana	\N
00040000-555d-8fc6-7c0c-1335be7f3b12	HT	HTI	332	Haiti 	Haiti	\N
00040000-555d-8fc6-2620-9d5365b1fa0e	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-555d-8fc6-0f48-90d218933813	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-555d-8fc6-0e5e-4d9f59faebcf	HN	HND	340	Honduras 	Honduras	\N
00040000-555d-8fc6-5db1-7893c6de56da	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-555d-8fc6-59d9-0f89d9be1a4c	HU	HUN	348	Hungary 	Madžarska	\N
00040000-555d-8fc6-6125-06e231cbab9a	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-555d-8fc6-8f54-a747e3bf018a	IN	IND	356	India 	Indija	\N
00040000-555d-8fc6-8985-85b72633b734	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-555d-8fc6-5d91-bf4c7e82fc22	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-555d-8fc6-4eda-08c4a9cf88e9	IQ	IRQ	368	Iraq 	Irak	\N
00040000-555d-8fc6-dbe1-187ccc27c88b	IE	IRL	372	Ireland 	Irska	\N
00040000-555d-8fc6-ecca-a266db2a541f	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-555d-8fc6-0b92-003ac25c16a8	IL	ISR	376	Israel 	Izrael	\N
00040000-555d-8fc6-8e03-644ed19e455c	IT	ITA	380	Italy 	Italija	\N
00040000-555d-8fc6-52df-64af57714942	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-555d-8fc6-234f-a70eeaf7caa2	JP	JPN	392	Japan 	Japonska	\N
00040000-555d-8fc6-aefe-0d04c7b79e9a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-555d-8fc6-6b5a-980380c174ae	JO	JOR	400	Jordan 	Jordanija	\N
00040000-555d-8fc6-7a20-e4052741fbda	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-555d-8fc6-87ee-44b6b0aa80ca	KE	KEN	404	Kenya 	Kenija	\N
00040000-555d-8fc6-2c5e-e9f19eb42ddf	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-555d-8fc6-40ea-1dbde368e0d3	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-555d-8fc6-d304-eed85459e5ac	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-555d-8fc6-66a2-0a90ba7f0233	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-555d-8fc6-21e1-33862e9cb2c1	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-555d-8fc6-9734-ca8b7cf7172d	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-555d-8fc6-ee80-6ef8135568fc	LV	LVA	428	Latvia 	Latvija	\N
00040000-555d-8fc6-091d-f9d6143e9385	LB	LBN	422	Lebanon 	Libanon	\N
00040000-555d-8fc6-6266-22d852cd3eb9	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-555d-8fc6-245f-48a18a127d29	LR	LBR	430	Liberia 	Liberija	\N
00040000-555d-8fc6-ffe1-b7c7cd1e7081	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-555d-8fc6-b4e5-03fcd51bf93e	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-555d-8fc6-863f-6b2889ebb53f	LT	LTU	440	Lithuania 	Litva	\N
00040000-555d-8fc6-7c3d-0ad2f9960ae5	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-555d-8fc6-7fae-6933e0a4bb93	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-555d-8fc6-7d4d-bf5dea312829	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-555d-8fc6-53f3-2f14abebefd1	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-555d-8fc6-b9aa-fdb320d39820	MW	MWI	454	Malawi 	Malavi	\N
00040000-555d-8fc6-3cd4-02e71dde32c7	MY	MYS	458	Malaysia 	Malezija	\N
00040000-555d-8fc6-466c-edcfc12ac006	MV	MDV	462	Maldives 	Maldivi	\N
00040000-555d-8fc6-1018-64e67321b77a	ML	MLI	466	Mali 	Mali	\N
00040000-555d-8fc6-4532-5033f44bf17b	MT	MLT	470	Malta 	Malta	\N
00040000-555d-8fc6-21d8-3ee53cf42238	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-555d-8fc6-3314-beaa69a2f4f2	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-555d-8fc7-cc11-4619017a2536	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-555d-8fc7-2423-494d7bde8f55	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-555d-8fc7-aef4-3d8e75483464	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-555d-8fc7-8dd1-d34e39dc47fe	MX	MEX	484	Mexico 	Mehika	\N
00040000-555d-8fc7-9d7c-c37d42225618	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-555d-8fc7-d837-f5460613e085	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-555d-8fc7-b798-dc6cca24e681	MC	MCO	492	Monaco 	Monako	\N
00040000-555d-8fc7-1452-f27dde3ef22d	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-555d-8fc7-86cc-e7c2ff9eaaef	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-555d-8fc7-041c-938c94b3331b	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-555d-8fc7-6835-8c6488d63728	MA	MAR	504	Morocco 	Maroko	\N
00040000-555d-8fc7-36a2-2edd7bae16a2	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-555d-8fc7-0f15-aeee38952788	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-555d-8fc7-5c40-6997ea2d39dc	NA	NAM	516	Namibia 	Namibija	\N
00040000-555d-8fc7-e9f0-d260358f6cbd	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-555d-8fc7-aa96-47910ab52264	NP	NPL	524	Nepal 	Nepal	\N
00040000-555d-8fc7-eb7f-c1b51fb9f781	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-555d-8fc7-49ae-bf5f77959f3d	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-555d-8fc7-3447-6d38847ff909	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-555d-8fc7-cf73-b51a22bbc46b	NE	NER	562	Niger 	Niger 	\N
00040000-555d-8fc7-06bc-4779a3e97132	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-555d-8fc7-72a6-6aa0807908bb	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-555d-8fc7-e09c-f12ff195b05b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-555d-8fc7-4356-e8b4d855cf21	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-555d-8fc7-ef07-2622677938ad	NO	NOR	578	Norway 	Norveška	\N
00040000-555d-8fc7-dc75-53008562dcea	OM	OMN	512	Oman 	Oman	\N
00040000-555d-8fc7-a96b-afe213959f29	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-555d-8fc7-5253-76806330148f	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-555d-8fc7-d17a-b69978840c51	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-555d-8fc7-cc46-4f8af4abc098	PA	PAN	591	Panama 	Panama	\N
00040000-555d-8fc7-3d9d-0b9e37c9ad89	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-555d-8fc7-aa53-66165f7b4ea4	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-555d-8fc7-4945-302ca782b531	PE	PER	604	Peru 	Peru	\N
00040000-555d-8fc7-1e54-dc3fb315d422	PH	PHL	608	Philippines 	Filipini	\N
00040000-555d-8fc7-fcf7-ab749ad760ea	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-555d-8fc7-8c36-0bdb2e879087	PL	POL	616	Poland 	Poljska	\N
00040000-555d-8fc7-9564-b17fc05f4bc0	PT	PRT	620	Portugal 	Portugalska	\N
00040000-555d-8fc7-3f03-da347f931d10	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-555d-8fc7-d4df-f66149214198	QA	QAT	634	Qatar 	Katar	\N
00040000-555d-8fc7-439b-5e6fd0c05491	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-555d-8fc7-54e1-c62f2ac9ed76	RO	ROU	642	Romania 	Romunija	\N
00040000-555d-8fc7-1536-f7546307452e	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-555d-8fc7-41de-eecf67d2cec5	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-555d-8fc7-7058-f6cda7f5d0f7	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-555d-8fc7-e992-8174431d685e	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-555d-8fc7-5a41-e2cf6913e622	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-555d-8fc7-ce5c-22cb5619a270	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-555d-8fc7-1bec-4540fa1d36b0	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-555d-8fc7-62ed-c447feb1dba0	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-555d-8fc7-73d2-1a0a69b11200	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-555d-8fc7-a324-2d8f1560200a	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-555d-8fc7-1c24-e4080e871c35	SM	SMR	674	San Marino 	San Marino	\N
00040000-555d-8fc7-8b4b-f92019a68536	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-555d-8fc7-37bf-d6b229b47f22	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-555d-8fc7-9057-ba89c08ef287	SN	SEN	686	Senegal 	Senegal	\N
00040000-555d-8fc7-529e-6b90de76b6c5	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-555d-8fc7-fdb0-27118cf17577	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-555d-8fc7-75ff-68e671fa9e53	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-555d-8fc7-3379-8accf712c3bf	SG	SGP	702	Singapore 	Singapur	\N
00040000-555d-8fc7-8eb8-307fd052e0cb	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-555d-8fc7-323d-b63610c17f34	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-555d-8fc7-ef58-b062aad06663	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-555d-8fc7-621e-ed160906c654	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-555d-8fc7-4c17-606413cbf2f9	SO	SOM	706	Somalia 	Somalija	\N
00040000-555d-8fc7-a948-9bd9a9f572f9	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-555d-8fc7-fc04-bab0b4644bd6	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-555d-8fc7-b90d-ff8bc65973ab	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-555d-8fc7-3ff4-2a5e5b694ac8	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-555d-8fc7-f7be-8d21bddc9736	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-555d-8fc7-b7dd-8211b7a67cfe	SD	SDN	729	Sudan 	Sudan	\N
00040000-555d-8fc7-5496-62b80676be8d	SR	SUR	740	Suriname 	Surinam	\N
00040000-555d-8fc7-ea72-4bc4c4d8b897	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-555d-8fc7-5fb7-43f1707ee296	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-555d-8fc7-5a2d-b8aa4de009b4	SE	SWE	752	Sweden 	Švedska	\N
00040000-555d-8fc7-76c2-3b7f6d43cabe	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-555d-8fc7-495a-779e7273334a	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-555d-8fc7-63ea-559f31b6644a	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-555d-8fc7-46ef-c7e6ccbc9f75	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-555d-8fc7-2dcd-7afb9a88dab6	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-555d-8fc7-82dc-9ed8309b6575	TH	THA	764	Thailand 	Tajska	\N
00040000-555d-8fc7-578b-049cefb970fe	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-555d-8fc7-542c-4bb17c207a8d	TG	TGO	768	Togo 	Togo	\N
00040000-555d-8fc7-9609-36fd5c999d61	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-555d-8fc7-0420-c7540f76efa5	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-555d-8fc7-4137-76624f0c841d	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-555d-8fc7-fec0-04dcf06ac0fc	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-555d-8fc7-a6f7-496585ad1afc	TR	TUR	792	Turkey 	Turčija	\N
00040000-555d-8fc7-9e98-ff6ba181f96e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-555d-8fc7-426b-2f817694708f	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555d-8fc7-c0b5-f69af7517469	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-555d-8fc7-e953-c39f57dcb86f	UG	UGA	800	Uganda 	Uganda	\N
00040000-555d-8fc7-71cd-66550e6acd4d	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-555d-8fc7-a775-7f1893827ce5	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-555d-8fc7-1c1e-e4c9e017cdd9	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-555d-8fc7-751d-77fa8f3d9662	US	USA	840	United States 	Združene države Amerike	\N
00040000-555d-8fc7-cf30-682aa0a9f5aa	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-555d-8fc7-0f96-76a98db55a11	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-555d-8fc7-7c83-1046ed32a421	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-555d-8fc7-18e6-297026866b27	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-555d-8fc7-a1c6-259bca9f812b	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-555d-8fc7-d60b-6d2324a64160	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-555d-8fc7-ddf8-4256118310a4	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555d-8fc7-16e8-c437ba7cb850	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-555d-8fc7-1492-227319e276bc	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-555d-8fc7-4ffe-9036444649fd	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-555d-8fc7-e715-0ee483be70d5	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-555d-8fc7-f502-d79fdc45fb00	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-555d-8fc7-20ce-ccbc0b11f272	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2665 (class 0 OID 4277503)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 4277328)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 4277372)
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
-- TOC entry 2654 (class 0 OID 4277421)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 4277446)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 4277277)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-555d-8fc7-fe8b-fda7a96e6b3b	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-555d-8fc7-8f41-b4f0516525a9	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-555d-8fc7-6b45-40993f19d041	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-555d-8fc7-5cda-a74c8c45fe7e	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-555d-8fc7-0857-d50e11e14516	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-555d-8fc7-9151-2132beeb8ce5	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-555d-8fc7-37c6-f20dbfeb1b61	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-555d-8fc7-ec6d-d6cbc3ae5841	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-555d-8fc7-187d-5b98fcbaca1a	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-555d-8fc7-a576-5f63478f14e9	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-555d-8fc7-335b-8be7d5992341	uprizoritev.faza	array	a:5:{s:7:"osnutek";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:4:"plan";a:1:{s:5:"label";s:14:"Predprodukcija";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
\.


--
-- TOC entry 2633 (class 0 OID 4277187)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-555d-8fc7-70d6-c99cae27035c	00000000-555d-8fc7-0857-d50e11e14516	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-555d-8fc7-c303-177f639038ea	00000000-555d-8fc7-0857-d50e11e14516	00010000-555d-8fc7-7c41-dcedfdc612b9	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-555d-8fc7-7707-96abaf4cecd1	00000000-555d-8fc7-9151-2132beeb8ce5	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2634 (class 0 OID 4277198)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 4277248)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 4277152)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-555d-8fc7-661a-26c23ff87f3d	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-555d-8fc7-cd88-321b75437d35	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-555d-8fc7-89bc-74d7de3e9a70	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-555d-8fc7-abc2-057537a4e75f	Abonma-read	Abonma - branje	f
00030000-555d-8fc7-d245-c382bc9544b8	Abonma-write	Abonma - spreminjanje	f
00030000-555d-8fc7-37c0-4afb30535029	Alternacija-read	Alternacija - branje	f
00030000-555d-8fc7-486f-e9c2de572fc9	Alternacija-write	Alternacija - spreminjanje	f
00030000-555d-8fc7-541f-79c2e984e7cc	Arhivalija-read	Arhivalija - branje	f
00030000-555d-8fc7-a2a9-069a066a2049	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-555d-8fc7-10e8-62dbfc459b01	Besedilo-read	Besedilo - branje	f
00030000-555d-8fc7-fa9b-b462a90670a7	Besedilo-write	Besedilo - spreminjanje	f
00030000-555d-8fc7-2a5d-42e515919923	DogodekIzven-read	DogodekIzven - branje	f
00030000-555d-8fc7-f695-2dcafc974c21	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-555d-8fc7-a8bb-b09a29c40723	Dogodek-read	Dogodek - branje	f
00030000-555d-8fc7-bde9-e2b4a8406c71	Dogodek-write	Dogodek - spreminjanje	f
00030000-555d-8fc7-e194-e6c9c0b8d922	Drzava-read	Drzava - branje	f
00030000-555d-8fc7-31e7-ebe947d9f4c5	Drzava-write	Drzava - spreminjanje	f
00030000-555d-8fc7-6ab2-f0f73261b49a	Funkcija-read	Funkcija - branje	f
00030000-555d-8fc7-7750-0bb04dd51851	Funkcija-write	Funkcija - spreminjanje	f
00030000-555d-8fc7-6f4c-0fbdc4d30edc	Gostovanje-read	Gostovanje - branje	f
00030000-555d-8fc7-e2b3-80192f8eea7d	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-555d-8fc7-ed8e-6bbbac00db8c	Gostujoca-read	Gostujoca - branje	f
00030000-555d-8fc7-5880-345f5a9412ff	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-555d-8fc7-eac9-ab37e3594744	Kupec-read	Kupec - branje	f
00030000-555d-8fc7-64a2-011dd1b68272	Kupec-write	Kupec - spreminjanje	f
00030000-555d-8fc7-5e4d-baf58b3862c4	NacinPlacina-read	NacinPlacina - branje	f
00030000-555d-8fc7-77b7-9ea72f30683f	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-555d-8fc7-7a53-8922e7a69318	Option-read	Option - branje	f
00030000-555d-8fc7-2850-8e1ce7365802	Option-write	Option - spreminjanje	f
00030000-555d-8fc7-92cc-fc252f0881c7	OptionValue-read	OptionValue - branje	f
00030000-555d-8fc7-1ab1-d2b72cc6f241	OptionValue-write	OptionValue - spreminjanje	f
00030000-555d-8fc7-fdde-503f1fb868e9	Oseba-read	Oseba - branje	f
00030000-555d-8fc7-2b9c-30beab3167e0	Oseba-write	Oseba - spreminjanje	f
00030000-555d-8fc7-6ad2-93f263966927	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-555d-8fc7-c0c8-764325b2942c	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-555d-8fc7-736c-a9a1e362077a	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-555d-8fc7-9c47-447aa9406f56	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-555d-8fc7-bf35-0be449b7119d	Pogodba-read	Pogodba - branje	f
00030000-555d-8fc7-4e7b-201dc573c014	Pogodba-write	Pogodba - spreminjanje	f
00030000-555d-8fc7-d138-ba24bc46ceda	Popa-read	Popa - branje	f
00030000-555d-8fc7-67e8-77eb4142ab27	Popa-write	Popa - spreminjanje	f
00030000-555d-8fc7-8054-c7bec9487c2c	Posta-read	Posta - branje	f
00030000-555d-8fc7-6e66-30a692b1f731	Posta-write	Posta - spreminjanje	f
00030000-555d-8fc7-0fb9-90b9b519aa4a	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-555d-8fc7-37e9-b9e09244c97b	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-555d-8fc7-466f-c07abfe3dba8	PostniNaslov-read	PostniNaslov - branje	f
00030000-555d-8fc7-676c-20a33d9f750c	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-555d-8fc7-84cd-d4615d1335e5	Predstava-read	Predstava - branje	f
00030000-555d-8fc7-ea74-ff403b81ec26	Predstava-write	Predstava - spreminjanje	f
00030000-555d-8fc7-6ffc-6a7caaa6a2be	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-555d-8fc7-efc2-7bcb1d653c5e	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-555d-8fc7-8a53-d37d16335af9	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-555d-8fc7-9320-04a70d307773	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-555d-8fc7-599f-c706b6818292	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-555d-8fc7-36ef-97b8a49464bc	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-555d-8fc7-733e-a5471a414d29	Prostor-read	Prostor - branje	f
00030000-555d-8fc7-3284-57bdefff0d83	Prostor-write	Prostor - spreminjanje	f
00030000-555d-8fc7-3880-61ee3fcf724a	Racun-read	Racun - branje	f
00030000-555d-8fc7-eae9-dfc3d3287548	Racun-write	Racun - spreminjanje	f
00030000-555d-8fc7-7fdb-3eda3746ac4b	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-555d-8fc7-b36c-272ae37b238b	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-555d-8fc7-3753-2ed16014c0ca	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-555d-8fc7-f3c4-a028a49a6804	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-555d-8fc7-a3a1-8c66920a3bfd	Rekvizit-read	Rekvizit - branje	f
00030000-555d-8fc7-9752-330642f69cf9	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-555d-8fc7-bcd1-8b46f4d8a7b3	Rezervacija-read	Rezervacija - branje	f
00030000-555d-8fc7-7670-f3efa29c985b	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-555d-8fc7-d3c9-aade868a1907	SedezniRed-read	SedezniRed - branje	f
00030000-555d-8fc7-901a-b1a4e99d3f89	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-555d-8fc7-91e9-fb89342e0396	Sedez-read	Sedez - branje	f
00030000-555d-8fc7-6076-ec3b426452af	Sedez-write	Sedez - spreminjanje	f
00030000-555d-8fc7-1043-f58d6a9dc4f9	Sezona-read	Sezona - branje	f
00030000-555d-8fc7-bac8-c08d50891f9f	Sezona-write	Sezona - spreminjanje	f
00030000-555d-8fc7-0da8-bb260d474a74	Telefonska-read	Telefonska - branje	f
00030000-555d-8fc7-b80b-3cef76b4324e	Telefonska-write	Telefonska - spreminjanje	f
00030000-555d-8fc7-3a67-43c465462293	TerminStoritve-read	TerminStoritve - branje	f
00030000-555d-8fc7-dcbf-0ec0ecb6b669	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-555d-8fc7-d7ce-9be8564fffbe	TipFunkcije-read	TipFunkcije - branje	f
00030000-555d-8fc7-5900-d520deca7548	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-555d-8fc7-f04b-faf7f0626f7b	Trr-read	Trr - branje	f
00030000-555d-8fc7-5449-71f462d6a7e0	Trr-write	Trr - spreminjanje	f
00030000-555d-8fc7-6fc0-5f405bb7cfa1	Uprizoritev-read	Uprizoritev - branje	f
00030000-555d-8fc7-cb51-bcea914c80b0	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-555d-8fc7-3d4d-7711f706fdf5	Vaja-read	Vaja - branje	f
00030000-555d-8fc7-34a4-74106b5ac3a6	Vaja-write	Vaja - spreminjanje	f
00030000-555d-8fc7-5b47-b6ae777b8ca5	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-555d-8fc7-f386-63cd9027f38c	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-555d-8fc7-d43f-575074264e7c	Zaposlitev-read	Zaposlitev - branje	f
00030000-555d-8fc7-af60-1738fc9a3b48	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-555d-8fc7-0a65-e707574e23df	Zasedenost-read	Zasedenost - branje	f
00030000-555d-8fc7-4709-1a026509be76	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-555d-8fc7-39a3-e2aa50bee9ff	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-555d-8fc7-9e8d-09987261b387	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-555d-8fc7-44c1-4a6f84a84c83	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-555d-8fc7-c2b1-0f9a34b4c0a8	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2631 (class 0 OID 4277171)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-555d-8fc7-0622-e356717fee8e	00030000-555d-8fc7-e194-e6c9c0b8d922
00020000-555d-8fc7-ed3d-835be2f241a7	00030000-555d-8fc7-31e7-ebe947d9f4c5
00020000-555d-8fc7-ed3d-835be2f241a7	00030000-555d-8fc7-e194-e6c9c0b8d922
\.


--
-- TOC entry 2659 (class 0 OID 4277453)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 4277483)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 4277596)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2636 (class 0 OID 4277228)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 4277269)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-555d-8fc6-b5dc-a23279db0288	8341	Adlešiči
00050000-555d-8fc6-0dde-67cec7b7eb08	5270	Ajdovščina
00050000-555d-8fc6-1f7d-558718a10e6d	6280	Ankaran/Ancarano
00050000-555d-8fc6-d610-e4ecbf711109	9253	Apače
00050000-555d-8fc6-97bb-1d97d353d092	8253	Artiče
00050000-555d-8fc6-918e-1dc3d1a4a4df	4275	Begunje na Gorenjskem
00050000-555d-8fc6-b073-f5916fed3ed5	1382	Begunje pri Cerknici
00050000-555d-8fc6-f099-13fbf19baf5b	9231	Beltinci
00050000-555d-8fc6-e15d-6eb5f03b7d46	2234	Benedikt
00050000-555d-8fc6-d9ec-affc2501d847	2345	Bistrica ob Dravi
00050000-555d-8fc6-6816-8707c2cfd50b	3256	Bistrica ob Sotli
00050000-555d-8fc6-ea1e-78cc561e35ef	8259	Bizeljsko
00050000-555d-8fc6-70b5-51cbdaf5f3df	1223	Blagovica
00050000-555d-8fc6-f89a-55198a459a95	8283	Blanca
00050000-555d-8fc6-c103-e44a6d273e85	4260	Bled
00050000-555d-8fc6-f37c-391ccf65a4cd	4273	Blejska Dobrava
00050000-555d-8fc6-f7ee-29c742376c93	9265	Bodonci
00050000-555d-8fc6-4667-647b94d28617	9222	Bogojina
00050000-555d-8fc6-6cf9-285f5409e72f	4263	Bohinjska Bela
00050000-555d-8fc6-4aed-a6249af63cfc	4264	Bohinjska Bistrica
00050000-555d-8fc6-b71a-4e1d74a5821d	4265	Bohinjsko jezero
00050000-555d-8fc6-2b51-26cbe9e2085d	1353	Borovnica
00050000-555d-8fc6-f613-3d1018471295	8294	Boštanj
00050000-555d-8fc6-09d4-7be002c8c1bb	5230	Bovec
00050000-555d-8fc6-7f58-de0cdb1e567b	5295	Branik
00050000-555d-8fc6-b63d-18ba3bf7de51	3314	Braslovče
00050000-555d-8fc6-e315-9c04f3aa3906	5223	Breginj
00050000-555d-8fc6-319e-4598908d1208	8280	Brestanica
00050000-555d-8fc6-5bdd-45f27887fbf6	2354	Bresternica
00050000-555d-8fc6-134e-54b823130924	4243	Brezje
00050000-555d-8fc6-ba55-00502d199264	1351	Brezovica pri Ljubljani
00050000-555d-8fc6-bf49-3519fa94ebd1	8250	Brežice
00050000-555d-8fc6-e598-fc2d1a38e787	4210	Brnik - Aerodrom
00050000-555d-8fc6-ba98-dafa0458144e	8321	Brusnice
00050000-555d-8fc6-ca35-2526305ab063	3255	Buče
00050000-555d-8fc6-9cb3-6cab080557be	8276	Bučka 
00050000-555d-8fc6-40f9-85faa901ed4b	9261	Cankova
00050000-555d-8fc6-c8f9-1984d3d3b9a5	3000	Celje 
00050000-555d-8fc6-f94b-ad77ccdddf27	3001	Celje - poštni predali
00050000-555d-8fc6-35af-910ef2c25d54	4207	Cerklje na Gorenjskem
00050000-555d-8fc6-41d8-ee8eb9c20749	8263	Cerklje ob Krki
00050000-555d-8fc6-363a-aab8c5bc9ec3	1380	Cerknica
00050000-555d-8fc6-cce5-1669f6ac80c9	5282	Cerkno
00050000-555d-8fc6-66c3-cc3693ef66d4	2236	Cerkvenjak
00050000-555d-8fc6-60cb-19b4849323e5	2215	Ceršak
00050000-555d-8fc6-1e95-3b754a083560	2326	Cirkovce
00050000-555d-8fc6-8d54-fffc1c01dede	2282	Cirkulane
00050000-555d-8fc6-023e-acd175ea876a	5273	Col
00050000-555d-8fc6-3135-6d0b7ae648e0	8251	Čatež ob Savi
00050000-555d-8fc6-09e1-2c07f35de7c5	1413	Čemšenik
00050000-555d-8fc6-1d42-a8f636178bd4	5253	Čepovan
00050000-555d-8fc6-8376-0090cc7159ca	9232	Črenšovci
00050000-555d-8fc6-be07-41cef9e6ad59	2393	Črna na Koroškem
00050000-555d-8fc6-e7b9-0a3f702d1626	6275	Črni Kal
00050000-555d-8fc6-4588-ee6489555a64	5274	Črni Vrh nad Idrijo
00050000-555d-8fc6-0a9a-f737306bd023	5262	Črniče
00050000-555d-8fc6-a419-f20c857abfeb	8340	Črnomelj
00050000-555d-8fc6-f091-f07ae4d95a44	6271	Dekani
00050000-555d-8fc6-cfe1-01d685dbbbe4	5210	Deskle
00050000-555d-8fc6-5a2a-9dc8b05e75b7	2253	Destrnik
00050000-555d-8fc6-b8c7-9564103c5a4f	6215	Divača
00050000-555d-8fc6-c8a4-720ba8e2b13b	1233	Dob
00050000-555d-8fc6-63e3-025bb0795d0a	3224	Dobje pri Planini
00050000-555d-8fc6-8728-245ec851c139	8257	Dobova
00050000-555d-8fc6-7b42-047f24db1345	1423	Dobovec
00050000-555d-8fc6-6d93-3fb22f205a54	5263	Dobravlje
00050000-555d-8fc6-b437-108c06b94971	3204	Dobrna
00050000-555d-8fc6-b166-aba90070aa37	8211	Dobrnič
00050000-555d-8fc6-b072-76009d5cef5f	1356	Dobrova
00050000-555d-8fc6-16a9-91827e7dc4d4	9223	Dobrovnik/Dobronak 
00050000-555d-8fc6-4a9e-a9f6d72f6e5f	5212	Dobrovo v Brdih
00050000-555d-8fc6-cd39-f82fd1fc3ee1	1431	Dol pri Hrastniku
00050000-555d-8fc6-b09d-34dbda4f2e18	1262	Dol pri Ljubljani
00050000-555d-8fc6-54d7-f893dc499ef8	1273	Dole pri Litiji
00050000-555d-8fc6-4886-f29a4ef0031f	1331	Dolenja vas
00050000-555d-8fc6-7481-4b2710083451	8350	Dolenjske Toplice
00050000-555d-8fc6-5077-c5cc2c376661	1230	Domžale
00050000-555d-8fc6-a5dc-215cd769ed90	2252	Dornava
00050000-555d-8fc6-f3bb-87176ab407fc	5294	Dornberk
00050000-555d-8fc6-55d0-88f55b486987	1319	Draga
00050000-555d-8fc6-e85e-6951faf12b10	8343	Dragatuš
00050000-555d-8fc6-660f-cb6ae6790231	3222	Dramlje
00050000-555d-8fc6-dd30-8561d50a4bad	2370	Dravograd
00050000-555d-8fc6-b9e9-c1b23c6d81a2	4203	Duplje
00050000-555d-8fc6-f7a0-14f4b4ff4e88	6221	Dutovlje
00050000-555d-8fc6-c2b0-1ae1339512c6	8361	Dvor
00050000-555d-8fc6-8561-ee2109c0cf00	2343	Fala
00050000-555d-8fc6-7816-4813033bd46f	9208	Fokovci
00050000-555d-8fc6-bbe9-08bb4ba92d45	2313	Fram
00050000-555d-8fc6-1235-be978bc61beb	3213	Frankolovo
00050000-555d-8fc6-8f7d-041a01b47ad7	1274	Gabrovka
00050000-555d-8fc6-085d-a463dd1797dd	8254	Globoko
00050000-555d-8fc6-2d30-c741e3175eae	5275	Godovič
00050000-555d-8fc6-827a-404707f264a1	4204	Golnik
00050000-555d-8fc6-235c-24e76bbd4e01	3303	Gomilsko
00050000-555d-8fc6-411d-ff7e21bcb3f3	4224	Gorenja vas
00050000-555d-8fc6-b39b-33863c857a8e	3263	Gorica pri Slivnici
00050000-555d-8fc6-6b6b-58ccabc54066	2272	Gorišnica
00050000-555d-8fc6-f326-eecb480c7c61	9250	Gornja Radgona
00050000-555d-8fc6-1a17-ac0b75832093	3342	Gornji Grad
00050000-555d-8fc6-55d1-127961a98244	4282	Gozd Martuljek
00050000-555d-8fc6-6552-fd062e15eb2a	6272	Gračišče
00050000-555d-8fc6-0ef6-521f7dadf023	9264	Grad
00050000-555d-8fc6-ea9a-3bfd5d59e444	8332	Gradac
00050000-555d-8fc6-5358-b23daa6af21e	1384	Grahovo
00050000-555d-8fc6-dcaf-161371f309e9	5242	Grahovo ob Bači
00050000-555d-8fc6-572a-0aa28bd53cce	5251	Grgar
00050000-555d-8fc6-d107-d87a17459899	3302	Griže
00050000-555d-8fc6-1479-4ae42168da53	3231	Grobelno
00050000-555d-8fc6-b8ec-7479874f7e9a	1290	Grosuplje
00050000-555d-8fc6-2670-cd18677ff633	2288	Hajdina
00050000-555d-8fc6-06a7-0a8e216b2766	8362	Hinje
00050000-555d-8fc6-706b-519cc90d458d	2311	Hoče
00050000-555d-8fc6-cf01-0f9560192f94	9205	Hodoš/Hodos
00050000-555d-8fc6-dfb3-c116f9e47f6d	1354	Horjul
00050000-555d-8fc6-cedb-109bb19b0a4b	1372	Hotedršica
00050000-555d-8fc6-95dc-ffd1e2cc4188	1430	Hrastnik
00050000-555d-8fc6-1e70-fafa9e8119e0	6225	Hruševje
00050000-555d-8fc6-bb17-484e4102106f	4276	Hrušica
00050000-555d-8fc6-772e-c9e12d88bc30	5280	Idrija
00050000-555d-8fc6-ff07-edfa8de6303f	1292	Ig
00050000-555d-8fc6-10f5-b179e749dd9e	6250	Ilirska Bistrica
00050000-555d-8fc6-15a9-8e5d5b470c08	6251	Ilirska Bistrica-Trnovo
00050000-555d-8fc6-5018-75a96cdabf2c	1295	Ivančna Gorica
00050000-555d-8fc6-1eb4-c560041cbda3	2259	Ivanjkovci
00050000-555d-8fc6-e790-660e4e9dc4c9	1411	Izlake
00050000-555d-8fc6-4c6c-ffc0110095e3	6310	Izola/Isola
00050000-555d-8fc6-3460-8f37c7977521	2222	Jakobski Dol
00050000-555d-8fc6-e814-2a56774452bb	2221	Jarenina
00050000-555d-8fc6-d5bc-139fb3637d03	6254	Jelšane
00050000-555d-8fc6-5119-315fd0650da6	4270	Jesenice
00050000-555d-8fc6-18c3-05ccbec5b068	8261	Jesenice na Dolenjskem
00050000-555d-8fc6-5768-c330c46b013e	3273	Jurklošter
00050000-555d-8fc6-ed04-052de5b570c1	2223	Jurovski Dol
00050000-555d-8fc6-42af-e9e32a3b24dc	2256	Juršinci
00050000-555d-8fc6-d485-b5603cb086e9	5214	Kal nad Kanalom
00050000-555d-8fc6-0c28-7c0f8a7f45b5	3233	Kalobje
00050000-555d-8fc6-3dd0-31b679874745	4246	Kamna Gorica
00050000-555d-8fc6-3e18-9088c5bf45d5	2351	Kamnica
00050000-555d-8fc6-a05b-a47747c9cc1c	1241	Kamnik
00050000-555d-8fc6-f8fe-603e45c76772	5213	Kanal
00050000-555d-8fc6-3bb9-06ad325764b8	8258	Kapele
00050000-555d-8fc6-b7a8-356929ac2af3	2362	Kapla
00050000-555d-8fc6-4df4-c3e8740fefc2	2325	Kidričevo
00050000-555d-8fc6-0862-3c9df2a36151	1412	Kisovec
00050000-555d-8fc6-4268-8c36d2a9de8d	6253	Knežak
00050000-555d-8fc6-c0bc-66f5ebf79b1e	5222	Kobarid
00050000-555d-8fc6-7a1e-5354e8f5e860	9227	Kobilje
00050000-555d-8fc6-a0c7-05ed087720ad	1330	Kočevje
00050000-555d-8fc6-6ae5-f6002b2146ac	1338	Kočevska Reka
00050000-555d-8fc6-efca-9eb87a7f2011	2276	Kog
00050000-555d-8fc6-198f-164fceea613a	5211	Kojsko
00050000-555d-8fc6-dbeb-7440d28d995b	6223	Komen
00050000-555d-8fc6-cb90-ee39351e6d9a	1218	Komenda
00050000-555d-8fc6-01f7-bff8800a26b0	6000	Koper/Capodistria 
00050000-555d-8fc6-d9dc-7ef31e64aa03	6001	Koper/Capodistria - poštni predali
00050000-555d-8fc6-9fa6-1b8e542672b5	8282	Koprivnica
00050000-555d-8fc6-345b-86e76330c2d7	5296	Kostanjevica na Krasu
00050000-555d-8fc6-68e2-e8b034284dc4	8311	Kostanjevica na Krki
00050000-555d-8fc6-206c-f30efe1dd4c7	1336	Kostel
00050000-555d-8fc6-98d5-dea0ab7f0730	6256	Košana
00050000-555d-8fc6-85eb-96418087dbc1	2394	Kotlje
00050000-555d-8fc6-c2fb-ec458b66f361	6240	Kozina
00050000-555d-8fc6-8bfe-0aebfff997ee	3260	Kozje
00050000-555d-8fc6-5c88-67ba9fed57b1	4000	Kranj 
00050000-555d-8fc6-d60e-d7d42953946f	4001	Kranj - poštni predali
00050000-555d-8fc6-aac7-f593a4462140	4280	Kranjska Gora
00050000-555d-8fc6-1ac1-8fddd3aaef8d	1281	Kresnice
00050000-555d-8fc6-43f0-da69a03ce61f	4294	Križe
00050000-555d-8fc6-12ed-ac96185508d6	9206	Križevci
00050000-555d-8fc6-ac0c-3049f045e897	9242	Križevci pri Ljutomeru
00050000-555d-8fc6-f3bd-85df7c3451a1	1301	Krka
00050000-555d-8fc6-d071-aeb2bad1c400	8296	Krmelj
00050000-555d-8fc6-d68d-98084ff78470	4245	Kropa
00050000-555d-8fc6-8b46-83af278627f7	8262	Krška vas
00050000-555d-8fc6-4198-940e672e882a	8270	Krško
00050000-555d-8fc6-22c7-73e4982aad05	9263	Kuzma
00050000-555d-8fc6-1c80-56a7bdee7fee	2318	Laporje
00050000-555d-8fc6-505e-48ef86b0659b	3270	Laško
00050000-555d-8fc6-c58f-09674d210427	1219	Laze v Tuhinju
00050000-555d-8fc6-98d6-07d6fd6ae583	2230	Lenart v Slovenskih goricah
00050000-555d-8fc6-70be-730997254aa7	9220	Lendava/Lendva
00050000-555d-8fc6-2abd-fd11c5f1d9ef	4248	Lesce
00050000-555d-8fc6-af00-2db8aea0113c	3261	Lesično
00050000-555d-8fc6-56c1-1e11f8020ae5	8273	Leskovec pri Krškem
00050000-555d-8fc6-6ea9-65a2220822d4	2372	Libeliče
00050000-555d-8fc6-ed4d-0d24f96bf5b2	2341	Limbuš
00050000-555d-8fc6-bbfd-d2c461a2e4e5	1270	Litija
00050000-555d-8fc6-07f1-f286fd8af595	3202	Ljubečna
00050000-555d-8fc6-65d7-19ab476e363f	1000	Ljubljana 
00050000-555d-8fc6-2dde-ea0c20becb9e	1001	Ljubljana - poštni predali
00050000-555d-8fc6-6477-7ebe6e014524	1231	Ljubljana - Črnuče
00050000-555d-8fc6-d7d8-2e8a9d34fae1	1261	Ljubljana - Dobrunje
00050000-555d-8fc6-d796-f51ed4b63792	1260	Ljubljana - Polje
00050000-555d-8fc6-c88e-6a5fe9c2fc14	1210	Ljubljana - Šentvid
00050000-555d-8fc6-48f9-291d5fc1d1f2	1211	Ljubljana - Šmartno
00050000-555d-8fc6-b15c-72878b81c25f	3333	Ljubno ob Savinji
00050000-555d-8fc6-4066-004da1c6e768	9240	Ljutomer
00050000-555d-8fc6-fc4c-caebe88437d7	3215	Loče
00050000-555d-8fc6-7459-5e28252a3ed0	5231	Log pod Mangartom
00050000-555d-8fc6-dd14-04f12f3a1973	1358	Log pri Brezovici
00050000-555d-8fc6-7cc9-86baee1c01ce	1370	Logatec
00050000-555d-8fc6-1ddc-c7420f5a78c2	1371	Logatec
00050000-555d-8fc6-a3a7-ade569a3dbf2	1434	Loka pri Zidanem Mostu
00050000-555d-8fc6-c3ee-537affd6defb	3223	Loka pri Žusmu
00050000-555d-8fc6-f2ef-b9a20bca93f6	6219	Lokev
00050000-555d-8fc6-f1c2-5803c3c9a3ee	1318	Loški Potok
00050000-555d-8fc6-7759-c99634787f2a	2324	Lovrenc na Dravskem polju
00050000-555d-8fc6-6d85-f495c524783e	2344	Lovrenc na Pohorju
00050000-555d-8fc6-ec99-7cbb01376468	3334	Luče
00050000-555d-8fc6-61ea-cdcb6fce5d0a	1225	Lukovica
00050000-555d-8fc6-ad08-ac5623283dea	9202	Mačkovci
00050000-555d-8fc6-6394-f01f87347280	2322	Majšperk
00050000-555d-8fc6-05e4-595fa057ac55	2321	Makole
00050000-555d-8fc6-49d5-e8857818371a	9243	Mala Nedelja
00050000-555d-8fc6-584c-55b399f5c9ba	2229	Malečnik
00050000-555d-8fc6-6f47-ad44130b68b0	6273	Marezige
00050000-555d-8fc6-0983-ec4130eae9d4	2000	Maribor 
00050000-555d-8fc6-1cc4-cf591a47d115	2001	Maribor - poštni predali
00050000-555d-8fc6-ae12-b323ec7f1814	2206	Marjeta na Dravskem polju
00050000-555d-8fc6-1370-5d1b2d004933	2281	Markovci
00050000-555d-8fc6-500c-ffb855a77dd3	9221	Martjanci
00050000-555d-8fc6-a959-2b77e9aa96c2	6242	Materija
00050000-555d-8fc6-d0f9-1b7fa73a7c13	4211	Mavčiče
00050000-555d-8fc6-f071-5bd19c017585	1215	Medvode
00050000-555d-8fc6-69de-81d8c0731425	1234	Mengeš
00050000-555d-8fc6-93a8-493112113d69	8330	Metlika
00050000-555d-8fc6-e143-043c9e36c8ad	2392	Mežica
00050000-555d-8fc6-976d-e69105c36f07	2204	Miklavž na Dravskem polju
00050000-555d-8fc6-a46d-b3f6ee9d7784	2275	Miklavž pri Ormožu
00050000-555d-8fc6-3885-b5b26d95d550	5291	Miren
00050000-555d-8fc6-4826-bc82795959cb	8233	Mirna
00050000-555d-8fc6-59fb-40eeb1bb45d8	8216	Mirna Peč
00050000-555d-8fc6-5b72-147949a48d9a	2382	Mislinja
00050000-555d-8fc6-8236-c9186b28ca11	4281	Mojstrana
00050000-555d-8fc6-b240-a859cf8d948b	8230	Mokronog
00050000-555d-8fc6-4ab4-0795d8e8af5e	1251	Moravče
00050000-555d-8fc6-0930-b031157e6be6	9226	Moravske Toplice
00050000-555d-8fc6-a1f0-ff37ac6faec4	5216	Most na Soči
00050000-555d-8fc6-c625-c34af46b0a03	1221	Motnik
00050000-555d-8fc6-0647-153853aa9903	3330	Mozirje
00050000-555d-8fc6-5845-37f0dcf9c119	9000	Murska Sobota 
00050000-555d-8fc6-c507-fcb1f4c5bbd1	9001	Murska Sobota - poštni predali
00050000-555d-8fc6-806c-6afa4d254ca0	2366	Muta
00050000-555d-8fc6-e8d3-9429f91b38d9	4202	Naklo
00050000-555d-8fc6-802b-69d9b3dd93f4	3331	Nazarje
00050000-555d-8fc6-a4a9-59774aac62f5	1357	Notranje Gorice
00050000-555d-8fc6-a91b-b68c09f42f3a	3203	Nova Cerkev
00050000-555d-8fc6-a71d-68e34ab97552	5000	Nova Gorica 
00050000-555d-8fc6-0171-ab1e9bef8ea1	5001	Nova Gorica - poštni predali
00050000-555d-8fc6-fcfa-f0916e91fb76	1385	Nova vas
00050000-555d-8fc6-7aab-6e253ff97465	8000	Novo mesto
00050000-555d-8fc6-ed96-a1b191339935	8001	Novo mesto - poštni predali
00050000-555d-8fc6-5ee5-6e9d476cd08c	6243	Obrov
00050000-555d-8fc6-b7f3-2d4edc3cca34	9233	Odranci
00050000-555d-8fc6-b0de-212ad178bea3	2317	Oplotnica
00050000-555d-8fc6-51e1-639c23a508f6	2312	Orehova vas
00050000-555d-8fc6-1115-590c302c8277	2270	Ormož
00050000-555d-8fc6-88a7-0bd996656e38	1316	Ortnek
00050000-555d-8fc6-4ed5-71189215ece0	1337	Osilnica
00050000-555d-8fc6-c737-4bf366cf6d09	8222	Otočec
00050000-555d-8fc6-9505-2cba94b4e7c0	2361	Ožbalt
00050000-555d-8fc6-86c1-b9884658ae47	2231	Pernica
00050000-555d-8fc6-a0e0-2c4ed2355988	2211	Pesnica pri Mariboru
00050000-555d-8fc6-6899-621d28d06f89	9203	Petrovci
00050000-555d-8fc6-338f-da28f30b2f2e	3301	Petrovče
00050000-555d-8fc6-8365-476008503ace	6330	Piran/Pirano
00050000-555d-8fc6-db9e-f21b4077957e	8255	Pišece
00050000-555d-8fc6-736a-0a00d34747c9	6257	Pivka
00050000-555d-8fc6-f96f-585701c38764	6232	Planina
00050000-555d-8fc6-f206-fdba270b71c3	3225	Planina pri Sevnici
00050000-555d-8fc6-a713-b2e7bf247d74	6276	Pobegi
00050000-555d-8fc6-573d-1b7a2ee3bd35	8312	Podbočje
00050000-555d-8fc6-0bc1-4f99fedc4a5c	5243	Podbrdo
00050000-555d-8fc6-8ff8-db7805d5810c	3254	Podčetrtek
00050000-555d-8fc6-948c-e5d83aaac267	2273	Podgorci
00050000-555d-8fc6-3220-3e2dccbbb024	6216	Podgorje
00050000-555d-8fc6-aaf8-31703df50892	2381	Podgorje pri Slovenj Gradcu
00050000-555d-8fc6-7d89-ff4f399c4885	6244	Podgrad
00050000-555d-8fc6-20a6-666c4088ace2	1414	Podkum
00050000-555d-8fc6-b84f-84ce8012161f	2286	Podlehnik
00050000-555d-8fc6-98e0-e36d354d237f	5272	Podnanos
00050000-555d-8fc6-ddc7-50ef2a27f057	4244	Podnart
00050000-555d-8fc6-9480-d002abdf8adc	3241	Podplat
00050000-555d-8fc6-ad13-ea38aa47ae5e	3257	Podsreda
00050000-555d-8fc6-8bd2-b5b69c4fdcd3	2363	Podvelka
00050000-555d-8fc6-9ba7-d6d2bb559136	2208	Pohorje
00050000-555d-8fc6-0490-dc3b6502ed24	2257	Polenšak
00050000-555d-8fc6-a3e6-ed976c8208cc	1355	Polhov Gradec
00050000-555d-8fc6-5d77-033159555812	4223	Poljane nad Škofjo Loko
00050000-555d-8fc6-ee07-984f6c62a4b1	2319	Poljčane
00050000-555d-8fc6-102f-1e2b68d4168d	1272	Polšnik
00050000-555d-8fc6-ef6e-8bf53ddc2013	3313	Polzela
00050000-555d-8fc6-2ab1-7b62136e0280	3232	Ponikva
00050000-555d-8fc6-60a4-f7bd5f2348b0	6320	Portorož/Portorose
00050000-555d-8fc6-5d79-db3267bf2417	6230	Postojna
00050000-555d-8fc6-cf4e-492050794ceb	2331	Pragersko
00050000-555d-8fc6-66e8-5fe6fea9a58e	3312	Prebold
00050000-555d-8fc6-5230-da4b4ac40d9d	4205	Preddvor
00050000-555d-8fc6-ee19-8a7d503da60f	6255	Prem
00050000-555d-8fc6-b1d0-f0a0149847c9	1352	Preserje
00050000-555d-8fc6-097e-9fa732c0d696	6258	Prestranek
00050000-555d-8fc6-65ac-ff61dbd13902	2391	Prevalje
00050000-555d-8fc6-0805-8aef83116242	3262	Prevorje
00050000-555d-8fc6-4632-e88677906a70	1276	Primskovo 
00050000-555d-8fc6-c1a3-00c9c1539bb6	3253	Pristava pri Mestinju
00050000-555d-8fc6-3e63-3e109c6cb37f	9207	Prosenjakovci/Partosfalva
00050000-555d-8fc6-a3ea-47b3e494153a	5297	Prvačina
00050000-555d-8fc6-081c-39227a75ab10	2250	Ptuj
00050000-555d-8fc6-333e-01ab89438d15	2323	Ptujska Gora
00050000-555d-8fc6-8c2a-b3e1e25b4eb3	9201	Puconci
00050000-555d-8fc6-e13d-5bfdf990238a	2327	Rače
00050000-555d-8fc6-c205-ef87a590385a	1433	Radeče
00050000-555d-8fc6-0762-1805cc90b417	9252	Radenci
00050000-555d-8fc6-1879-63474fe918d5	2360	Radlje ob Dravi
00050000-555d-8fc6-f536-1d3d26ed8830	1235	Radomlje
00050000-555d-8fc6-174e-280ffadb6112	4240	Radovljica
00050000-555d-8fc6-af85-559e2a47c283	8274	Raka
00050000-555d-8fc6-0e2f-d0bc27b049e9	1381	Rakek
00050000-555d-8fc6-19bb-eed2d4573b3a	4283	Rateče - Planica
00050000-555d-8fc6-afaa-990ba6113fee	2390	Ravne na Koroškem
00050000-555d-8fc6-3c3c-dd8c8fde6c65	9246	Razkrižje
00050000-555d-8fc6-c7a8-37e8e7b55775	3332	Rečica ob Savinji
00050000-555d-8fc6-a53f-4251bbefd5be	5292	Renče
00050000-555d-8fc6-0d43-9cffd38812ca	1310	Ribnica
00050000-555d-8fc6-0161-3be4941d70c2	2364	Ribnica na Pohorju
00050000-555d-8fc6-287e-c3d281b44ce1	3272	Rimske Toplice
00050000-555d-8fc6-6fed-4e0bbb0ed244	1314	Rob
00050000-555d-8fc6-844c-fe948255c20d	5215	Ročinj
00050000-555d-8fc6-1d7e-d1cd13674746	3250	Rogaška Slatina
00050000-555d-8fc6-0208-9bcebeab2c52	9262	Rogašovci
00050000-555d-8fc6-b3c8-039283244a7d	3252	Rogatec
00050000-555d-8fc6-48fc-1c03ec67259f	1373	Rovte
00050000-555d-8fc6-107b-0f73da9edd25	2342	Ruše
00050000-555d-8fc6-0c88-b0a250c96379	1282	Sava
00050000-555d-8fc6-0e17-e0e91e68eabe	6333	Sečovlje/Sicciole
00050000-555d-8fc6-23ff-014a812e3f72	4227	Selca
00050000-555d-8fc6-8817-a22495cfba9d	2352	Selnica ob Dravi
00050000-555d-8fc6-ba71-0f483aee5796	8333	Semič
00050000-555d-8fc6-1fc1-63c8c1ee9b77	8281	Senovo
00050000-555d-8fc6-693c-556152e2717c	6224	Senožeče
00050000-555d-8fc6-f1dc-2c8a5d6c1ea5	8290	Sevnica
00050000-555d-8fc6-d2d9-d985886d1106	6210	Sežana
00050000-555d-8fc6-16df-0acc29fd8af2	2214	Sladki Vrh
00050000-555d-8fc6-b44c-0ab4a2eb2861	5283	Slap ob Idrijci
00050000-555d-8fc6-914c-a9c2372a3d45	2380	Slovenj Gradec
00050000-555d-8fc6-d0e3-d6a2f2a4154d	2310	Slovenska Bistrica
00050000-555d-8fc6-c052-e81d775549de	3210	Slovenske Konjice
00050000-555d-8fc6-df50-2b0e5d900ed2	1216	Smlednik
00050000-555d-8fc6-251b-7e879d6ec8d9	5232	Soča
00050000-555d-8fc6-f84c-0dfa96f723b6	1317	Sodražica
00050000-555d-8fc6-f74c-c3978e4d1d60	3335	Solčava
00050000-555d-8fc6-4322-b5f3cacb28c0	5250	Solkan
00050000-555d-8fc6-da34-b01603af47ff	4229	Sorica
00050000-555d-8fc6-1a8c-c51f5a304a46	4225	Sovodenj
00050000-555d-8fc6-ac1a-30438d8d1dd7	5281	Spodnja Idrija
00050000-555d-8fc6-00e4-ab88af3d2d05	2241	Spodnji Duplek
00050000-555d-8fc6-4678-b42c048afee4	9245	Spodnji Ivanjci
00050000-555d-8fc6-78fa-2d971687ca41	2277	Središče ob Dravi
00050000-555d-8fc6-0b15-245f6b68b137	4267	Srednja vas v Bohinju
00050000-555d-8fc6-59da-69eb34ef3f07	8256	Sromlje 
00050000-555d-8fc6-4dcf-5b2b903650cc	5224	Srpenica
00050000-555d-8fc6-f1bc-8278d630934d	1242	Stahovica
00050000-555d-8fc6-ae0b-f73aaaab7de3	1332	Stara Cerkev
00050000-555d-8fc6-5133-b03617ac8f4c	8342	Stari trg ob Kolpi
00050000-555d-8fc6-4dc0-f06bc7ec985f	1386	Stari trg pri Ložu
00050000-555d-8fc6-803f-44898294ddc1	2205	Starše
00050000-555d-8fc6-177d-ce9efef28bb9	2289	Stoperce
00050000-555d-8fc6-c003-090ac9585012	8322	Stopiče
00050000-555d-8fc6-2500-46965184e370	3206	Stranice
00050000-555d-8fc6-b2a6-5de61eaf88cd	8351	Straža
00050000-555d-8fc6-535d-afdea3863c51	1313	Struge
00050000-555d-8fc6-b1a6-68ba3db9a04f	8293	Studenec
00050000-555d-8fc6-d127-87a69c35d307	8331	Suhor
00050000-555d-8fc6-e4f5-c0f43ad6f77b	2233	Sv. Ana v Slovenskih goricah
00050000-555d-8fc6-19cc-518a2e296178	2235	Sv. Trojica v Slovenskih goricah
00050000-555d-8fc6-1e7f-3394ddc6dc1f	2353	Sveti Duh na Ostrem Vrhu
00050000-555d-8fc6-fc17-b823f4d7f0d9	9244	Sveti Jurij ob Ščavnici
00050000-555d-8fc6-a952-fca74ea3d541	3264	Sveti Štefan
00050000-555d-8fc6-edf8-0380f9c78576	2258	Sveti Tomaž
00050000-555d-8fc6-7648-4f33346c559e	9204	Šalovci
00050000-555d-8fc6-7b53-9dc15a7d55c8	5261	Šempas
00050000-555d-8fc6-a40e-0e08e6763b47	5290	Šempeter pri Gorici
00050000-555d-8fc6-c065-6a87633a4f2a	3311	Šempeter v Savinjski dolini
00050000-555d-8fc6-e95c-37d32117331d	4208	Šenčur
00050000-555d-8fc6-d073-eebf41d5ad03	2212	Šentilj v Slovenskih goricah
00050000-555d-8fc6-1419-4fb411ee2502	8297	Šentjanž
00050000-555d-8fc6-9a53-e0fd7bbec6e7	2373	Šentjanž pri Dravogradu
00050000-555d-8fc6-9c58-d0f375179f30	8310	Šentjernej
00050000-555d-8fc6-d234-3dcaf3db8b8c	3230	Šentjur
00050000-555d-8fc6-6398-67c7aafece04	3271	Šentrupert
00050000-555d-8fc6-5879-3f4079396b54	8232	Šentrupert
00050000-555d-8fc6-6631-038f9c06e086	1296	Šentvid pri Stični
00050000-555d-8fc6-4ace-192d333831ee	8275	Škocjan
00050000-555d-8fc6-6e43-d7d75bf9ee19	6281	Škofije
00050000-555d-8fc6-5ba0-4eaf5cf42c38	4220	Škofja Loka
00050000-555d-8fc6-a201-8d40ee93e586	3211	Škofja vas
00050000-555d-8fc6-e71e-97eeccd252d1	1291	Škofljica
00050000-555d-8fc6-2c6d-3ff9a07ffba1	6274	Šmarje
00050000-555d-8fc6-abec-2bb67d18fe21	1293	Šmarje - Sap
00050000-555d-8fc6-5ad2-af51c099984a	3240	Šmarje pri Jelšah
00050000-555d-8fc6-8fb3-bce86f7af12a	8220	Šmarješke Toplice
00050000-555d-8fc6-76b1-5a92a814a5ca	2315	Šmartno na Pohorju
00050000-555d-8fc6-4a1a-0c51b4040d45	3341	Šmartno ob Dreti
00050000-555d-8fc6-42a0-75f23f945e4c	3327	Šmartno ob Paki
00050000-555d-8fc6-fb1d-6415bd7fa5f5	1275	Šmartno pri Litiji
00050000-555d-8fc6-37d7-7dce09566e1c	2383	Šmartno pri Slovenj Gradcu
00050000-555d-8fc6-055d-bf887c4f7b11	3201	Šmartno v Rožni dolini
00050000-555d-8fc6-200f-b7f52e449601	3325	Šoštanj
00050000-555d-8fc6-86c9-9867dd39122c	6222	Štanjel
00050000-555d-8fc6-b9cf-4cddeefe2628	3220	Štore
00050000-555d-8fc6-1ed7-e4f38b4395b4	3304	Tabor
00050000-555d-8fc6-2622-9adec57fba00	3221	Teharje
00050000-555d-8fc6-80a4-7c033d491ef6	9251	Tišina
00050000-555d-8fc6-fd98-611595d8012c	5220	Tolmin
00050000-555d-8fc6-50a6-1cdc778308f7	3326	Topolšica
00050000-555d-8fc6-ea64-45486552d01f	2371	Trbonje
00050000-555d-8fc6-74e2-20c90983484a	1420	Trbovlje
00050000-555d-8fc6-e5f9-7bc8ac31df9e	8231	Trebelno 
00050000-555d-8fc6-6fc4-52c63822a560	8210	Trebnje
00050000-555d-8fc6-92e0-1de6675775ae	5252	Trnovo pri Gorici
00050000-555d-8fc6-3fe3-3668a65d2eec	2254	Trnovska vas
00050000-555d-8fc6-09ec-d2b9213c6546	1222	Trojane
00050000-555d-8fc6-eb74-8d87ce10593f	1236	Trzin
00050000-555d-8fc6-cf20-7fbb41984cb1	4290	Tržič
00050000-555d-8fc6-e2df-201ca765839b	8295	Tržišče
00050000-555d-8fc6-4a19-7d80b06fd21e	1311	Turjak
00050000-555d-8fc6-8e07-143824203bae	9224	Turnišče
00050000-555d-8fc6-072f-73e81ca78fc5	8323	Uršna sela
00050000-555d-8fc6-197b-19d4c8e6d157	1252	Vače
00050000-555d-8fc6-a00e-a6d431e118aa	3320	Velenje 
00050000-555d-8fc6-f956-a6ffbc14f620	3322	Velenje - poštni predali
00050000-555d-8fc6-b058-f582c083a5dd	8212	Velika Loka
00050000-555d-8fc6-2282-b04280ffc96a	2274	Velika Nedelja
00050000-555d-8fc6-0863-9824602f5939	9225	Velika Polana
00050000-555d-8fc6-32df-2c3eb8f83e34	1315	Velike Lašče
00050000-555d-8fc6-080d-82c0afdbeebc	8213	Veliki Gaber
00050000-555d-8fc6-2ce0-4d896da5ece2	9241	Veržej
00050000-555d-8fc6-ec57-f5a59b8a58c0	1312	Videm - Dobrepolje
00050000-555d-8fc6-6537-169de53c5abb	2284	Videm pri Ptuju
00050000-555d-8fc6-ed7a-037209c713b4	8344	Vinica
00050000-555d-8fc6-ea13-3732e02b5b03	5271	Vipava
00050000-555d-8fc6-57bd-25262f132b18	4212	Visoko
00050000-555d-8fc6-fd48-fc653e533eaa	1294	Višnja Gora
00050000-555d-8fc6-5b2d-fffbddee5da6	3205	Vitanje
00050000-555d-8fc6-d27b-9b08a54b1956	2255	Vitomarci
00050000-555d-8fc6-7388-518ade2545f6	1217	Vodice
00050000-555d-8fc6-ebc9-884de96c9bee	3212	Vojnik\t
00050000-555d-8fc6-b1ed-93fc70187b24	5293	Volčja Draga
00050000-555d-8fc6-1c3e-4547b5e50523	2232	Voličina
00050000-555d-8fc6-4d3c-e3eb5d00d0b1	3305	Vransko
00050000-555d-8fc6-dad5-aaf269490bfe	6217	Vremski Britof
00050000-555d-8fc6-bbe5-e87f0f9ed761	1360	Vrhnika
00050000-555d-8fc6-22d2-f157413a8f29	2365	Vuhred
00050000-555d-8fc6-bb8b-f6210295b1d5	2367	Vuzenica
00050000-555d-8fc6-ed5c-1444c03acb1f	8292	Zabukovje 
00050000-555d-8fc6-45a1-f9c4055eb805	1410	Zagorje ob Savi
00050000-555d-8fc6-ab7c-808f04807e44	1303	Zagradec
00050000-555d-8fc6-1b83-20788aaf7530	2283	Zavrč
00050000-555d-8fc6-0fce-3ad9643d9b50	8272	Zdole 
00050000-555d-8fc6-a02b-e8c8cbb60f0c	4201	Zgornja Besnica
00050000-555d-8fc6-793b-e9bdf653c86b	2242	Zgornja Korena
00050000-555d-8fc6-f37f-71b5411242fe	2201	Zgornja Kungota
00050000-555d-8fc6-3dca-7d2c355c5a21	2316	Zgornja Ložnica
00050000-555d-8fc6-5315-b84b381ce0c8	2314	Zgornja Polskava
00050000-555d-8fc6-e812-162dd5ec3066	2213	Zgornja Velka
00050000-555d-8fc6-9eab-4a18cd5f6b77	4247	Zgornje Gorje
00050000-555d-8fc6-eefd-d2e276f33319	4206	Zgornje Jezersko
00050000-555d-8fc6-f87b-a428425d3cf8	2285	Zgornji Leskovec
00050000-555d-8fc6-0743-ecf098479a5d	1432	Zidani Most
00050000-555d-8fc6-09e7-c1d121670e29	3214	Zreče
00050000-555d-8fc6-2e81-8e8291ada9b1	4209	Žabnica
00050000-555d-8fc6-af4c-31dd9a3580d8	3310	Žalec
00050000-555d-8fc6-879a-b4df13ec4109	4228	Železniki
00050000-555d-8fc6-a83d-ab5b8c2d7a40	2287	Žetale
00050000-555d-8fc6-a662-8a12153f59bd	4226	Žiri
00050000-555d-8fc6-dbe6-ce5a6b6a9ea5	4274	Žirovnica
00050000-555d-8fc6-35e5-e2bf9b3d27c0	8360	Žužemberk
\.


--
-- TOC entry 2655 (class 0 OID 4277427)
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
-- TOC entry 2638 (class 0 OID 4277255)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 4277320)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 4277439)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 4277544)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 4277589)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 4277468)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 4277412)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 4277402)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 4277579)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 4277534)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2626 (class 0 OID 4277123)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-555d-8fc7-7c41-dcedfdc612b9	00010000-555d-8fc7-3bb5-0c8c8b40384b	2015-05-21 09:56:55	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROz4fwntxRAccB6QZyptzqyQrQct6Pd16";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2687 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2662 (class 0 OID 4277477)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 4277161)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-555d-8fc7-738e-9a86967a98bd	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-555d-8fc7-cfd9-2df0138ecae0	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-555d-8fc7-0622-e356717fee8e	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-555d-8fc7-545f-69cf85601634	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-555d-8fc7-6f15-2a212a538e53	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-555d-8fc7-ed3d-835be2f241a7	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2628 (class 0 OID 4277145)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-555d-8fc7-7c41-dcedfdc612b9	00020000-555d-8fc7-545f-69cf85601634
00010000-555d-8fc7-3bb5-0c8c8b40384b	00020000-555d-8fc7-545f-69cf85601634
\.


--
-- TOC entry 2664 (class 0 OID 4277491)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 4277433)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 4277383)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 4277220)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 4277389)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 4277567)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 4277289)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2627 (class 0 OID 4277132)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-555d-8fc7-3bb5-0c8c8b40384b	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROCaiwwInh.iwbjhe1Aj8rBwUsRRMD7LK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-555d-8fc7-7c41-dcedfdc612b9	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2676 (class 0 OID 4277621)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 4277335)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 4277460)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 4277526)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 4277367)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 4277611)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 4277516)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2270 (class 2606 OID 4277186)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 4277661)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 4277654)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 4277566)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 4277357)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 4277382)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2306 (class 2606 OID 4277315)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 4277512)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2317 (class 2606 OID 4277333)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 4277376)
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
-- TOC entry 2360 (class 2606 OID 4277425)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 4277452)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 4277287)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2274 (class 2606 OID 4277195)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 4277252)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2276 (class 2606 OID 4277218)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2268 (class 2606 OID 4277175)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2261 (class 2606 OID 4277160)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 4277458)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 4277490)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 4277606)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2284 (class 2606 OID 4277245)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2296 (class 2606 OID 4277275)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 4277431)
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
-- TOC entry 2294 (class 2606 OID 4277265)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2315 (class 2606 OID 4277324)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 4277443)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 4277550)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 4277594)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 4277475)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2358 (class 2606 OID 4277416)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 4277407)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 4277588)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 4277541)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2253 (class 2606 OID 4277131)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 4277481)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 4277149)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2263 (class 2606 OID 4277169)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 4277499)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 4277438)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 4277388)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2281 (class 2606 OID 4277225)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 4277398)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 4277578)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 4277300)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 4277144)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 4277636)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 4277342)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 4277466)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 4277532)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2334 (class 2606 OID 4277371)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 4277620)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 4277525)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2324 (class 1259 OID 4277364)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2282 (class 1259 OID 4277247)
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
-- TOC entry 2373 (class 1259 OID 4277459)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2367 (class 1259 OID 4277445)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2368 (class 1259 OID 4277444)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2319 (class 1259 OID 4277343)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2394 (class 1259 OID 4277515)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2395 (class 1259 OID 4277513)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2396 (class 1259 OID 4277514)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2419 (class 1259 OID 4277608)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2420 (class 1259 OID 4277609)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2421 (class 1259 OID 4277610)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2427 (class 1259 OID 4277639)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2428 (class 1259 OID 4277638)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2429 (class 1259 OID 4277637)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2301 (class 1259 OID 4277302)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2302 (class 1259 OID 4277301)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2286 (class 1259 OID 4277254)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2287 (class 1259 OID 4277253)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2382 (class 1259 OID 4277482)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2337 (class 1259 OID 4277377)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2265 (class 1259 OID 4277176)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2266 (class 1259 OID 4277177)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2387 (class 1259 OID 4277502)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2388 (class 1259 OID 4277501)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2389 (class 1259 OID 4277500)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2311 (class 1259 OID 4277325)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2312 (class 1259 OID 4277327)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2313 (class 1259 OID 4277326)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2347 (class 1259 OID 4277411)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2348 (class 1259 OID 4277409)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2349 (class 1259 OID 4277408)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2350 (class 1259 OID 4277410)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2256 (class 1259 OID 4277150)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2257 (class 1259 OID 4277151)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2376 (class 1259 OID 4277467)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2362 (class 1259 OID 4277432)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2402 (class 1259 OID 4277542)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2403 (class 1259 OID 4277543)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2290 (class 1259 OID 4277267)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 4277266)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2292 (class 1259 OID 4277268)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2406 (class 1259 OID 4277551)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2407 (class 1259 OID 4277552)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2438 (class 1259 OID 4277664)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2439 (class 1259 OID 4277663)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2440 (class 1259 OID 4277666)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2441 (class 1259 OID 4277662)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2442 (class 1259 OID 4277665)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2399 (class 1259 OID 4277533)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2353 (class 1259 OID 4277420)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2354 (class 1259 OID 4277419)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2355 (class 1259 OID 4277417)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2356 (class 1259 OID 4277418)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2243 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2434 (class 1259 OID 4277656)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2435 (class 1259 OID 4277655)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2318 (class 1259 OID 4277334)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2271 (class 1259 OID 4277197)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2272 (class 1259 OID 4277196)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2278 (class 1259 OID 4277226)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2279 (class 1259 OID 4277227)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2342 (class 1259 OID 4277401)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2343 (class 1259 OID 4277400)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2344 (class 1259 OID 4277399)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2325 (class 1259 OID 4277366)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2326 (class 1259 OID 4277362)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2327 (class 1259 OID 4277359)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2328 (class 1259 OID 4277360)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2329 (class 1259 OID 4277358)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2330 (class 1259 OID 4277363)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2331 (class 1259 OID 4277361)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2285 (class 1259 OID 4277246)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2307 (class 1259 OID 4277316)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2308 (class 1259 OID 4277318)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2309 (class 1259 OID 4277317)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2310 (class 1259 OID 4277319)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2361 (class 1259 OID 4277426)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2424 (class 1259 OID 4277607)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2277 (class 1259 OID 4277219)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2300 (class 1259 OID 4277288)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2381 (class 1259 OID 4277476)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2246 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2297 (class 1259 OID 4277276)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2418 (class 1259 OID 4277595)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2264 (class 1259 OID 4277170)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2332 (class 1259 OID 4277365)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2467 (class 2606 OID 4277797)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2470 (class 2606 OID 4277782)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2469 (class 2606 OID 4277787)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2465 (class 2606 OID 4277807)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2471 (class 2606 OID 4277777)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2466 (class 2606 OID 4277802)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2468 (class 2606 OID 4277792)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2452 (class 2606 OID 4277712)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2488 (class 2606 OID 4277892)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2486 (class 2606 OID 4277887)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2487 (class 2606 OID 4277882)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2464 (class 2606 OID 4277772)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2494 (class 2606 OID 4277932)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2496 (class 2606 OID 4277922)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2495 (class 2606 OID 4277927)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2484 (class 2606 OID 4277872)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2505 (class 2606 OID 4277967)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2504 (class 2606 OID 4277972)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2503 (class 2606 OID 4277977)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2506 (class 2606 OID 4277992)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2507 (class 2606 OID 4277987)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2508 (class 2606 OID 4277982)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2458 (class 2606 OID 4277747)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2459 (class 2606 OID 4277742)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 4277722)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 4277717)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2449 (class 2606 OID 4277697)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2490 (class 2606 OID 4277902)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2472 (class 2606 OID 4277812)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2446 (class 2606 OID 4277677)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2445 (class 2606 OID 4277682)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2491 (class 2606 OID 4277917)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2492 (class 2606 OID 4277912)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2493 (class 2606 OID 4277907)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2462 (class 2606 OID 4277752)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 4277762)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2461 (class 2606 OID 4277757)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2476 (class 2606 OID 4277847)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2478 (class 2606 OID 4277837)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2479 (class 2606 OID 4277832)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2477 (class 2606 OID 4277842)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2444 (class 2606 OID 4277667)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2443 (class 2606 OID 4277672)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2489 (class 2606 OID 4277897)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2485 (class 2606 OID 4277877)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2499 (class 2606 OID 4277942)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2498 (class 2606 OID 4277947)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2456 (class 2606 OID 4277732)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2457 (class 2606 OID 4277727)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2455 (class 2606 OID 4277737)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2501 (class 2606 OID 4277952)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2500 (class 2606 OID 4277957)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2513 (class 2606 OID 4278017)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2514 (class 2606 OID 4278012)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2511 (class 2606 OID 4278027)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2515 (class 2606 OID 4278007)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2512 (class 2606 OID 4278022)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2497 (class 2606 OID 4277937)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2480 (class 2606 OID 4277867)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2481 (class 2606 OID 4277862)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2483 (class 2606 OID 4277852)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2482 (class 2606 OID 4277857)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2509 (class 2606 OID 4278002)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2510 (class 2606 OID 4277997)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2463 (class 2606 OID 4277767)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2502 (class 2606 OID 4277962)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2447 (class 2606 OID 4277692)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2448 (class 2606 OID 4277687)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2451 (class 2606 OID 4277702)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2450 (class 2606 OID 4277707)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2473 (class 2606 OID 4277827)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2474 (class 2606 OID 4277822)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2475 (class 2606 OID 4277817)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-21 09:56:56 CEST

--
-- PostgreSQL database dump complete
--

