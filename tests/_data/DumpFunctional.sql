--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-22 16:03:36 CEST

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
-- TOC entry 179 (class 1259 OID 4710960)
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
-- TOC entry 225 (class 1259 OID 4711440)
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
-- TOC entry 224 (class 1259 OID 4711423)
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
-- TOC entry 217 (class 1259 OID 4711336)
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
-- TOC entry 193 (class 1259 OID 4711126)
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
-- TOC entry 196 (class 1259 OID 4711160)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 4711085)
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
-- TOC entry 212 (class 1259 OID 4711285)
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
-- TOC entry 191 (class 1259 OID 4711110)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 4711154)
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
-- TOC entry 201 (class 1259 OID 4711203)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 4711228)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 4711059)
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
-- TOC entry 180 (class 1259 OID 4710969)
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
-- TOC entry 181 (class 1259 OID 4710980)
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
-- TOC entry 184 (class 1259 OID 4711030)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 4710934)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 4710953)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 4711235)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 4711265)
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
-- TOC entry 221 (class 1259 OID 4711378)
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
-- TOC entry 183 (class 1259 OID 4711010)
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
-- TOC entry 186 (class 1259 OID 4711051)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 4711209)
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
-- TOC entry 185 (class 1259 OID 4711037)
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
-- TOC entry 190 (class 1259 OID 4711102)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 4711221)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 4711327)
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
-- TOC entry 220 (class 1259 OID 4711371)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 4711250)
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
-- TOC entry 200 (class 1259 OID 4711194)
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
-- TOC entry 199 (class 1259 OID 4711184)
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
-- TOC entry 219 (class 1259 OID 4711361)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 4711317)
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
-- TOC entry 173 (class 1259 OID 4710905)
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
-- TOC entry 172 (class 1259 OID 4710903)
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
-- TOC entry 209 (class 1259 OID 4711259)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 4710943)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 4710927)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 4711273)
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
-- TOC entry 203 (class 1259 OID 4711215)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 4711165)
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
-- TOC entry 182 (class 1259 OID 4711002)
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
-- TOC entry 198 (class 1259 OID 4711171)
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
-- TOC entry 218 (class 1259 OID 4711350)
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
-- TOC entry 188 (class 1259 OID 4711071)
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
-- TOC entry 174 (class 1259 OID 4710914)
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
-- TOC entry 223 (class 1259 OID 4711403)
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
-- TOC entry 192 (class 1259 OID 4711117)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 4711242)
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
-- TOC entry 214 (class 1259 OID 4711309)
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
-- TOC entry 194 (class 1259 OID 4711149)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 4711393)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 4711299)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 4710908)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2634 (class 0 OID 4710960)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2680 (class 0 OID 4711440)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 4711423)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 4711336)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 4711126)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 4711160)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 4711085)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-555f-3737-c2a2-0a8abad0af4a	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-555f-3737-ed0c-14c8ceac56a8	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-555f-3737-e143-11f5ed15a3cb	AL	ALB	008	Albania 	Albanija	\N
00040000-555f-3737-4c57-659361d680ae	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-555f-3737-e6f8-35f7b6db6109	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-555f-3737-c5a0-91404cb6e904	AD	AND	020	Andorra 	Andora	\N
00040000-555f-3737-933e-fb68c252c7d9	AO	AGO	024	Angola 	Angola	\N
00040000-555f-3737-ba05-c8a5cc40a459	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-555f-3737-5d2d-e98b0fc02a6c	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-555f-3737-c64f-8cc28cebbd5a	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-555f-3737-864f-2eca5cd3ecfa	AR	ARG	032	Argentina 	Argenitna	\N
00040000-555f-3737-547f-601125b427c9	AM	ARM	051	Armenia 	Armenija	\N
00040000-555f-3737-b3ea-dabdcb034e7d	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-555f-3737-9fac-acdb6b5fb9c9	AU	AUS	036	Australia 	Avstralija	\N
00040000-555f-3737-8b1c-fb6d1a25beba	AT	AUT	040	Austria 	Avstrija	\N
00040000-555f-3737-3670-6280f770faca	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-555f-3737-cf38-c06b5065bd4e	BS	BHS	044	Bahamas 	Bahami	\N
00040000-555f-3737-d02e-122fa39c06b9	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-555f-3737-8577-0a0f52b25fb6	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-555f-3737-ae79-cd3c1984dba6	BB	BRB	052	Barbados 	Barbados	\N
00040000-555f-3737-ec65-5d7f7c50f045	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-555f-3737-19dd-0f88fc63bf57	BE	BEL	056	Belgium 	Belgija	\N
00040000-555f-3737-2cc2-a6ab6b3bcdd2	BZ	BLZ	084	Belize 	Belize	\N
00040000-555f-3737-6777-ca1009b3b6cf	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-555f-3737-b71d-bb6d64a59d33	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-555f-3737-079b-2930fabe8d1a	BT	BTN	064	Bhutan 	Butan	\N
00040000-555f-3737-0698-396718fa424d	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-555f-3737-24f4-36a326f0e1f1	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-555f-3737-9e2b-217ca4100820	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-555f-3737-9fb7-85248d3e2e9f	BW	BWA	072	Botswana 	Bocvana	\N
00040000-555f-3737-fd64-9b7514b11066	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-555f-3737-eec7-28c2ffe984cc	BR	BRA	076	Brazil 	Brazilija	\N
00040000-555f-3737-5b22-c8dcf3351e7d	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-555f-3737-ab30-5dad9cc91791	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-555f-3737-67e0-bcdf869d8e4e	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-555f-3737-796b-d28af692d9b8	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-555f-3737-fa55-ec265dd4c752	BI	BDI	108	Burundi 	Burundi 	\N
00040000-555f-3737-b911-2488998b0c5b	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-555f-3737-7165-aea8def1e39d	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-555f-3737-82f3-e097f05bb731	CA	CAN	124	Canada 	Kanada	\N
00040000-555f-3737-6d2d-762d5516ad50	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-555f-3737-1edc-4cc7904a9138	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-555f-3737-8191-d3ce4581bba3	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-555f-3737-476d-08dcce1b6c36	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-555f-3737-b5a9-9e5b11142bce	CL	CHL	152	Chile 	Čile	\N
00040000-555f-3737-dce4-697be8229a8f	CN	CHN	156	China 	Kitajska	\N
00040000-555f-3737-754d-a3ba6bc3dafd	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-555f-3737-444c-023152ab9dd1	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-555f-3737-4912-7fa270225b4a	CO	COL	170	Colombia 	Kolumbija	\N
00040000-555f-3737-7877-54f6759f8887	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-555f-3737-e9e2-7fc7be6ac291	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-555f-3737-2bf7-1ba8dc8fc53f	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-555f-3737-aaf6-c8b85964da34	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-555f-3737-99cd-95cd0f1a3b1d	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-555f-3737-28a4-4f547ec50413	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-555f-3737-0cb8-5411e405803f	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-555f-3737-4978-49c135e939b4	CU	CUB	192	Cuba 	Kuba	\N
00040000-555f-3737-2210-f83064838ce0	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-555f-3737-5055-b148b83a2a59	CY	CYP	196	Cyprus 	Ciper	\N
00040000-555f-3737-1d07-52210a9497ac	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-555f-3737-c0be-533d13025eda	DK	DNK	208	Denmark 	Danska	\N
00040000-555f-3737-e8cb-10f9fcdd2f7c	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-555f-3737-6644-3b178f80b614	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-555f-3737-6759-692fd2699f0f	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-555f-3737-2bd5-58c54da74b1e	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-555f-3737-b4ac-f5d6a10f5177	EG	EGY	818	Egypt 	Egipt	\N
00040000-555f-3737-c39a-145d36eec053	SV	SLV	222	El Salvador 	Salvador	\N
00040000-555f-3737-2d36-f70b6d248f6c	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-555f-3737-1c64-16505876ecc3	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-555f-3737-c843-dac1d51f4f6e	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-555f-3737-3efd-2dac8743fca2	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-555f-3737-6225-7a9af06cff86	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-555f-3737-6b36-28b61794122f	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-555f-3737-6353-da078d2859c0	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-555f-3737-7d9f-19f192777d68	FI	FIN	246	Finland 	Finska	\N
00040000-555f-3737-8e0d-83ba8d186a4f	FR	FRA	250	France 	Francija	\N
00040000-555f-3737-28b6-f91665179126	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-555f-3737-4659-479688938716	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-555f-3737-023e-751aedc770d2	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-555f-3737-98fd-c63c7457e416	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-555f-3737-7908-3c1847b95412	GA	GAB	266	Gabon 	Gabon	\N
00040000-555f-3737-4b6b-b1c480716869	GM	GMB	270	Gambia 	Gambija	\N
00040000-555f-3737-e066-c71c744cf97d	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-555f-3737-ab71-f783afce5d56	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-555f-3737-d7d5-7c700a38eb96	GH	GHA	288	Ghana 	Gana	\N
00040000-555f-3737-3a1e-def28451e116	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-555f-3737-d3f6-217d64614155	GR	GRC	300	Greece 	Grčija	\N
00040000-555f-3737-98b4-9dbf2011a0b7	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-555f-3737-b25c-160befaab186	GD	GRD	308	Grenada 	Grenada	\N
00040000-555f-3737-ce32-42ba54469178	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-555f-3737-5e17-23d382f27888	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-555f-3737-b325-fbc62145a6c1	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-555f-3737-f31d-b6dc0c1401c1	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-555f-3737-ff28-e3e8500fa94d	GN	GIN	324	Guinea 	Gvineja	\N
00040000-555f-3737-15ff-fe58c7efdbd7	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-555f-3737-2175-8e08fb9b9e56	GY	GUY	328	Guyana 	Gvajana	\N
00040000-555f-3737-2ed3-53918b8b975c	HT	HTI	332	Haiti 	Haiti	\N
00040000-555f-3737-debf-1c574d2b4793	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-555f-3737-149e-251a5aaa387c	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-555f-3737-4512-6d7957580972	HN	HND	340	Honduras 	Honduras	\N
00040000-555f-3737-adf7-ff9193212916	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-555f-3737-2614-e099cbe12937	HU	HUN	348	Hungary 	Madžarska	\N
00040000-555f-3737-cdb7-e741a0135501	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-555f-3737-a62c-c52b1367839a	IN	IND	356	India 	Indija	\N
00040000-555f-3737-f025-c03fda70952d	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-555f-3737-24e7-2c060c1b9e56	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-555f-3737-fd83-8b6c0a270ad3	IQ	IRQ	368	Iraq 	Irak	\N
00040000-555f-3737-48f6-4280e46d1db4	IE	IRL	372	Ireland 	Irska	\N
00040000-555f-3737-79e2-b0c531799caf	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-555f-3737-295a-7376cbcbd742	IL	ISR	376	Israel 	Izrael	\N
00040000-555f-3737-1c2f-980858c426ba	IT	ITA	380	Italy 	Italija	\N
00040000-555f-3737-14ec-0aaebac8a90b	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-555f-3737-47cc-3ef2a156a082	JP	JPN	392	Japan 	Japonska	\N
00040000-555f-3737-b5c0-258efacb1292	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-555f-3737-36e1-00a0350317f6	JO	JOR	400	Jordan 	Jordanija	\N
00040000-555f-3737-b7d2-e4483d13cdc8	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-555f-3737-fd34-4e64fd0bad5f	KE	KEN	404	Kenya 	Kenija	\N
00040000-555f-3737-342b-79b9bbbc01d4	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-555f-3737-4c54-147484ae3bd8	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-555f-3737-598a-23cbcb1a6ec8	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-555f-3737-289c-89f817a123b0	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-555f-3737-fb03-dcb2a0f1fb8e	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-555f-3737-627c-ce77872045dd	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-555f-3737-c4ae-20236ca68e9d	LV	LVA	428	Latvia 	Latvija	\N
00040000-555f-3737-16dd-0eb019113124	LB	LBN	422	Lebanon 	Libanon	\N
00040000-555f-3737-b1ad-93c377701304	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-555f-3737-ee32-087abfed7b78	LR	LBR	430	Liberia 	Liberija	\N
00040000-555f-3737-db9e-035adc63ad52	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-555f-3737-658c-8e418c8d0f52	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-555f-3737-bbde-1b16b39d735a	LT	LTU	440	Lithuania 	Litva	\N
00040000-555f-3737-1e02-52b0a89f57d1	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-555f-3737-5671-c585a1ab3fd8	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-555f-3737-5f52-6a536ed88310	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-555f-3737-2d22-4b2831e639ce	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-555f-3737-1945-84dd5885639a	MW	MWI	454	Malawi 	Malavi	\N
00040000-555f-3737-461d-bc8087b8ef61	MY	MYS	458	Malaysia 	Malezija	\N
00040000-555f-3737-87ab-dd8f9994af8d	MV	MDV	462	Maldives 	Maldivi	\N
00040000-555f-3737-9af1-06cacab8654a	ML	MLI	466	Mali 	Mali	\N
00040000-555f-3737-41e7-429d27dee9b3	MT	MLT	470	Malta 	Malta	\N
00040000-555f-3737-9450-c73450067bc7	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-555f-3737-8cc2-5fc5fa355a57	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-555f-3737-7404-42c7dce9fbe0	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-555f-3737-c0d1-08cb2be1529b	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-555f-3737-30f8-e4794c2d6669	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-555f-3737-bcf3-73dbc755c9fc	MX	MEX	484	Mexico 	Mehika	\N
00040000-555f-3737-9d25-fca48c564112	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-555f-3737-bc32-aebd3185d270	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-555f-3737-985c-041ef3a0c5a1	MC	MCO	492	Monaco 	Monako	\N
00040000-555f-3737-b575-fbc7c91a0621	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-555f-3737-171a-cf1e355f16a9	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-555f-3737-bc88-7c23b1e196da	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-555f-3737-39a3-4f76535d0c14	MA	MAR	504	Morocco 	Maroko	\N
00040000-555f-3737-3d50-7c5565bece8e	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-555f-3737-6ea9-1203d920147a	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-555f-3737-6a12-cb96a8b6eaad	NA	NAM	516	Namibia 	Namibija	\N
00040000-555f-3737-e956-ae8de5e8d143	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-555f-3737-2346-fc475b3082b0	NP	NPL	524	Nepal 	Nepal	\N
00040000-555f-3737-0c6c-3e40c23efa6d	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-555f-3737-1fd6-85f4d5d178c9	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-555f-3737-0bb4-bef9dbedbe3d	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-555f-3737-6ba6-8ff1d82ddbcd	NE	NER	562	Niger 	Niger 	\N
00040000-555f-3737-1752-2aa82285bedd	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-555f-3737-8e4e-93722859a749	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-555f-3737-30d7-13ac7b8cfef7	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-555f-3737-d7be-40cd3182f46d	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-555f-3737-6a48-8538a3e439d0	NO	NOR	578	Norway 	Norveška	\N
00040000-555f-3737-2690-a5323087355f	OM	OMN	512	Oman 	Oman	\N
00040000-555f-3737-8d2c-9edabfb75cc9	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-555f-3737-95b4-77da168b3338	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-555f-3737-fcef-567fe31f5664	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-555f-3737-c729-08c0da79bef1	PA	PAN	591	Panama 	Panama	\N
00040000-555f-3737-1665-a5000a01724f	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-555f-3737-7b05-d40060547c4d	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-555f-3737-8d74-45801cd500cc	PE	PER	604	Peru 	Peru	\N
00040000-555f-3737-9143-7f3f505d7ae8	PH	PHL	608	Philippines 	Filipini	\N
00040000-555f-3737-a2cb-b6f5263ac79b	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-555f-3737-8cfe-c2dffdb5e50a	PL	POL	616	Poland 	Poljska	\N
00040000-555f-3737-5a95-1693818ae775	PT	PRT	620	Portugal 	Portugalska	\N
00040000-555f-3737-5304-fafdbd920278	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-555f-3737-2828-18faaaf6f8af	QA	QAT	634	Qatar 	Katar	\N
00040000-555f-3737-5f18-cdf0aee220dd	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-555f-3737-0be7-99e6de24aad0	RO	ROU	642	Romania 	Romunija	\N
00040000-555f-3737-f18c-e8306237a21c	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-555f-3737-e3ca-807994f14020	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-555f-3737-8d7c-8666302cc8da	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-555f-3737-57fd-6fb2255690f9	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-555f-3737-a5ca-b5e104918c73	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-555f-3737-d668-82d664348539	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-555f-3737-6d88-b3b6704c276a	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-555f-3737-55ad-0e293d939a63	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-555f-3737-ca86-26d938e88661	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-555f-3737-afe6-9d58534bad72	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-555f-3737-33dd-6f74c33a34ec	SM	SMR	674	San Marino 	San Marino	\N
00040000-555f-3737-3d1d-431067d7715e	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-555f-3737-e053-99813c5586d4	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-555f-3737-2576-7f29382379bb	SN	SEN	686	Senegal 	Senegal	\N
00040000-555f-3737-a5f3-00763e54b6df	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-555f-3737-0e33-7973c8a9cf99	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-555f-3737-28b2-9ef16acbb8e2	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-555f-3737-a81b-4fde26577481	SG	SGP	702	Singapore 	Singapur	\N
00040000-555f-3737-9db1-a3f2b1e98b7d	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-555f-3737-5d1f-da0526a7377f	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-555f-3737-cc27-85eba626c9a5	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-555f-3737-5550-868236d4c0fd	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-555f-3737-a5c7-698f95632668	SO	SOM	706	Somalia 	Somalija	\N
00040000-555f-3737-fc55-8a4c427a349d	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-555f-3737-4404-ea15e6299240	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-555f-3737-1c9a-33bfe2072c03	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-555f-3737-e677-26a59473fa49	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-555f-3737-a044-ca1474a3be9b	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-555f-3737-4949-2062662e7d68	SD	SDN	729	Sudan 	Sudan	\N
00040000-555f-3737-f584-4fb397c77011	SR	SUR	740	Suriname 	Surinam	\N
00040000-555f-3737-9ed0-f66467c8fbae	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-555f-3737-d3ae-6d356ad16462	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-555f-3737-e8d7-16df48ddf63a	SE	SWE	752	Sweden 	Švedska	\N
00040000-555f-3737-9d28-9a51a6fc4de9	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-555f-3737-efad-6cc3a2bf0a6f	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-555f-3737-abcf-2c3818f3b0cd	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-555f-3737-5416-ec66c65e3063	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-555f-3737-6d8d-ba998cbf93ee	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-555f-3737-1b78-b6161b1580de	TH	THA	764	Thailand 	Tajska	\N
00040000-555f-3737-733d-07f8853e091b	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-555f-3737-c6de-190d10be69e9	TG	TGO	768	Togo 	Togo	\N
00040000-555f-3737-0811-17bee3b1efc1	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-555f-3737-b00e-799d002cdc9f	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-555f-3737-2538-7a39be8fbc84	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-555f-3737-bf6e-184eaf5ebb10	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-555f-3737-7518-002c23eb4a0f	TR	TUR	792	Turkey 	Turčija	\N
00040000-555f-3737-ef30-f743ae716931	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-555f-3737-5a80-6b4983f7729a	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555f-3737-8857-3edd5851d017	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-555f-3737-f008-e5c21bef575a	UG	UGA	800	Uganda 	Uganda	\N
00040000-555f-3737-e2c6-6efbb7242f94	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-555f-3737-eed8-8ea1ed6c55f3	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-555f-3737-3823-293bf586911e	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-555f-3737-92f1-81494f20dcde	US	USA	840	United States 	Združene države Amerike	\N
00040000-555f-3737-9d4a-930e9e92a12f	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-555f-3737-530c-5702d1ce11a4	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-555f-3737-90e9-864263b96006	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-555f-3737-5da1-e10fcc2ed01c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-555f-3737-5265-f181df165013	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-555f-3737-b4e8-6a600d29ba50	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-555f-3737-cbf7-847f8ebd0025	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555f-3737-d13d-600cc11cdca6	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-555f-3737-9d2c-de587bc6cdb0	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-555f-3737-98f7-592c5b462b55	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-555f-3737-0ab4-0022a942985e	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-555f-3737-edb2-2576d98cb0a1	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-555f-3737-936b-a494de3c1f21	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2667 (class 0 OID 4711285)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 4711110)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 4711154)
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
-- TOC entry 2656 (class 0 OID 4711203)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 4711228)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 4711059)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-555f-3738-6aaa-4b26c55d61a2	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-555f-3738-790b-cd25f22c44ac	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-555f-3738-ac57-78f5a426b3d8	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-555f-3738-1bee-2eeb6da7cce7	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-555f-3738-2911-7634e231a130	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-555f-3738-665f-93e914ef6777	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-555f-3738-9502-e261b2f4e203	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-555f-3738-41b0-45f1b90ae9a3	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-555f-3738-81bb-0d28c16878a6	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-555f-3738-1699-e71a3a199a10	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-555f-3738-8075-2f05187787b2	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-555f-3738-940e-5d60f72d36b8	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-555f-3738-d146-56736b7fdafe	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-555f-3738-90d5-fff373de8199	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2635 (class 0 OID 4710969)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-555f-3738-dffb-28cb822b6319	00000000-555f-3738-2911-7634e231a130	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-555f-3738-840f-75294405c49b	00000000-555f-3738-2911-7634e231a130	00010000-555f-3738-7cd4-8b4f3a90f591	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-555f-3738-b28d-e1af9719e881	00000000-555f-3738-665f-93e914ef6777	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2636 (class 0 OID 4710980)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 4711030)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 4710934)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-555f-3738-ebba-d5d2e9aa4790	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-555f-3738-a905-67b77ca7fa68	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-555f-3738-5d55-a932af2e2c93	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-555f-3738-ce0e-3b0bd8afc29a	Abonma-read	Abonma - branje	f
00030000-555f-3738-8814-4d69f631b6da	Abonma-write	Abonma - spreminjanje	f
00030000-555f-3738-9f55-7d702d3fb337	Alternacija-read	Alternacija - branje	f
00030000-555f-3738-54a3-072a57e312b7	Alternacija-write	Alternacija - spreminjanje	f
00030000-555f-3738-1f50-44253da813f1	Arhivalija-read	Arhivalija - branje	f
00030000-555f-3738-1eed-b2fe2b698f8e	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-555f-3738-8f7a-ee8980776861	Besedilo-read	Besedilo - branje	f
00030000-555f-3738-9057-17adcb104690	Besedilo-write	Besedilo - spreminjanje	f
00030000-555f-3738-5a29-d190269f7d8a	DogodekIzven-read	DogodekIzven - branje	f
00030000-555f-3738-6d24-6c9b811c2b61	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-555f-3738-2cc1-a46485a4af5e	Dogodek-read	Dogodek - branje	f
00030000-555f-3738-e19e-79a483b99425	Dogodek-write	Dogodek - spreminjanje	f
00030000-555f-3738-b381-96e6f9c148d4	Drzava-read	Drzava - branje	f
00030000-555f-3738-577f-fb4e1345a633	Drzava-write	Drzava - spreminjanje	f
00030000-555f-3738-7af0-3740595887db	Funkcija-read	Funkcija - branje	f
00030000-555f-3738-ac20-ff645349eaff	Funkcija-write	Funkcija - spreminjanje	f
00030000-555f-3738-93f3-78a580001dd6	Gostovanje-read	Gostovanje - branje	f
00030000-555f-3738-c579-3da896810bfe	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-555f-3738-27ff-98fd69e0927d	Gostujoca-read	Gostujoca - branje	f
00030000-555f-3738-b48b-72a74537c05e	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-555f-3738-01eb-fdc8f5df9883	Kupec-read	Kupec - branje	f
00030000-555f-3738-ae07-6374d8fc1102	Kupec-write	Kupec - spreminjanje	f
00030000-555f-3738-6be0-ccd8ffaa6a8b	NacinPlacina-read	NacinPlacina - branje	f
00030000-555f-3738-6945-a3a4dfbd5ac8	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-555f-3738-7e59-ad3b886cb90b	Option-read	Option - branje	f
00030000-555f-3738-43f2-b3fb97958dd9	Option-write	Option - spreminjanje	f
00030000-555f-3738-c4a1-e73a6773f321	OptionValue-read	OptionValue - branje	f
00030000-555f-3738-b302-e1e4ef7aff99	OptionValue-write	OptionValue - spreminjanje	f
00030000-555f-3738-8cad-f7bc496e9a57	Oseba-read	Oseba - branje	f
00030000-555f-3738-d403-5f70a89096b1	Oseba-write	Oseba - spreminjanje	f
00030000-555f-3738-f186-1558e600f936	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-555f-3738-8199-0b9c1d1d6fbe	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-555f-3738-c633-f236bb93b358	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-555f-3738-7a45-769af7f7aed9	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-555f-3738-118b-13b865e0649f	Pogodba-read	Pogodba - branje	f
00030000-555f-3738-e712-d97f457c6149	Pogodba-write	Pogodba - spreminjanje	f
00030000-555f-3738-03ad-13c4ffba3b11	Popa-read	Popa - branje	f
00030000-555f-3738-616a-c3742d519bbc	Popa-write	Popa - spreminjanje	f
00030000-555f-3738-5d55-000d4de569a0	Posta-read	Posta - branje	f
00030000-555f-3738-53a9-4e0f88c68bbf	Posta-write	Posta - spreminjanje	f
00030000-555f-3738-d28f-7de8d6c0c9be	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-555f-3738-4f08-a5ec831f78d4	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-555f-3738-66d5-8d729f9ff7a1	PostniNaslov-read	PostniNaslov - branje	f
00030000-555f-3738-d71a-7065911c8816	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-555f-3738-39d5-93414a18f501	Predstava-read	Predstava - branje	f
00030000-555f-3738-2570-76167507d74e	Predstava-write	Predstava - spreminjanje	f
00030000-555f-3738-4de3-c7302a80e360	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-555f-3738-d668-9e04c573ecf5	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-555f-3738-05ff-d1373e019a9f	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-555f-3738-ee82-03c61fa69900	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-555f-3738-bdd0-162cd00d9152	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-555f-3738-6f47-e03cfa50eaf6	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-555f-3738-2a0f-4cd9ad6faa3f	Prostor-read	Prostor - branje	f
00030000-555f-3738-1b10-7b44164f2454	Prostor-write	Prostor - spreminjanje	f
00030000-555f-3738-4ef8-04734d72f594	Racun-read	Racun - branje	f
00030000-555f-3738-7a71-091343eddf7c	Racun-write	Racun - spreminjanje	f
00030000-555f-3738-dcf9-eecb9f23a580	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-555f-3738-eec9-7233ba569337	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-555f-3738-6771-4f074d73a696	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-555f-3738-ed13-a411c5cd83ee	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-555f-3738-af3b-69de24d2b002	Rekvizit-read	Rekvizit - branje	f
00030000-555f-3738-24b4-aaf631d72056	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-555f-3738-d9ce-5cae37c4f627	Rezervacija-read	Rezervacija - branje	f
00030000-555f-3738-45df-f9090e32a4d4	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-555f-3738-e27b-32e656b76368	SedezniRed-read	SedezniRed - branje	f
00030000-555f-3738-8734-a669e50e9875	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-555f-3738-f819-8622bb02531d	Sedez-read	Sedez - branje	f
00030000-555f-3738-c739-a4024d1fed0e	Sedez-write	Sedez - spreminjanje	f
00030000-555f-3738-68fb-9e2f45c92312	Sezona-read	Sezona - branje	f
00030000-555f-3738-7cd7-57673dae88a0	Sezona-write	Sezona - spreminjanje	f
00030000-555f-3738-e6f3-dd97a2238e85	Telefonska-read	Telefonska - branje	f
00030000-555f-3738-0f60-f3d66f70806c	Telefonska-write	Telefonska - spreminjanje	f
00030000-555f-3738-2ffb-b39ed3edd1f2	TerminStoritve-read	TerminStoritve - branje	f
00030000-555f-3738-d7bb-3c3bf6e125fa	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-555f-3738-1d91-5edc2ce056d5	TipFunkcije-read	TipFunkcije - branje	f
00030000-555f-3738-296f-63bcea7d273b	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-555f-3738-222f-a02967125087	Trr-read	Trr - branje	f
00030000-555f-3738-ee39-39a88651903d	Trr-write	Trr - spreminjanje	f
00030000-555f-3738-dece-1845a54ca0c2	Uprizoritev-read	Uprizoritev - branje	f
00030000-555f-3738-0bfa-e082d66393ba	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-555f-3738-98fa-c5354a0dcfb6	Vaja-read	Vaja - branje	f
00030000-555f-3738-298d-2d20d09e68d6	Vaja-write	Vaja - spreminjanje	f
00030000-555f-3738-0fa4-a4742f76c596	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-555f-3738-fac5-9b6eda9562e9	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-555f-3738-edd1-c71ed2cbbaf7	Zaposlitev-read	Zaposlitev - branje	f
00030000-555f-3738-4995-e716e42f22dd	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-555f-3738-ce5c-5a585cb1af0e	Zasedenost-read	Zasedenost - branje	f
00030000-555f-3738-a524-040abce01443	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-555f-3738-bc83-06a0e9e04db6	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-555f-3738-4a75-c70bb2177b18	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-555f-3738-aef1-072c312c3e35	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-555f-3738-b6ed-a7361ef42108	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2633 (class 0 OID 4710953)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-555f-3738-ae9a-d302721b5825	00030000-555f-3738-b381-96e6f9c148d4
00020000-555f-3738-fa6f-79b693e12c82	00030000-555f-3738-577f-fb4e1345a633
00020000-555f-3738-fa6f-79b693e12c82	00030000-555f-3738-b381-96e6f9c148d4
\.


--
-- TOC entry 2661 (class 0 OID 4711235)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 4711265)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 4711378)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2638 (class 0 OID 4711010)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 4711051)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-555f-3737-8718-57e3a1e9033a	8341	Adlešiči
00050000-555f-3737-88e8-43eda2bcc2a7	5270	Ajdovščina
00050000-555f-3737-2db0-d21c77280d65	6280	Ankaran/Ancarano
00050000-555f-3737-a18f-7f0038207114	9253	Apače
00050000-555f-3737-fa3f-90d6a340636b	8253	Artiče
00050000-555f-3737-86b0-db6ed83dd5c2	4275	Begunje na Gorenjskem
00050000-555f-3737-4d4c-67187437245e	1382	Begunje pri Cerknici
00050000-555f-3737-f18c-1d27fcef4966	9231	Beltinci
00050000-555f-3737-b69d-eb46ec748e80	2234	Benedikt
00050000-555f-3737-afab-4dab4589c950	2345	Bistrica ob Dravi
00050000-555f-3737-832f-038931504b23	3256	Bistrica ob Sotli
00050000-555f-3737-a4e0-163ced34f249	8259	Bizeljsko
00050000-555f-3737-491a-8f62f2ebfa81	1223	Blagovica
00050000-555f-3737-d046-f7499bd07ef4	8283	Blanca
00050000-555f-3737-64a9-cbd94cbb6d10	4260	Bled
00050000-555f-3737-897f-c742374c2346	4273	Blejska Dobrava
00050000-555f-3737-08ff-1cb55cf919dc	9265	Bodonci
00050000-555f-3737-ba04-024d039207d6	9222	Bogojina
00050000-555f-3737-f246-63d3341b9f3c	4263	Bohinjska Bela
00050000-555f-3737-c12a-1c867e4c763d	4264	Bohinjska Bistrica
00050000-555f-3737-e0f7-9e46b7a27d40	4265	Bohinjsko jezero
00050000-555f-3737-b71a-105baaed667f	1353	Borovnica
00050000-555f-3737-bea0-b3888bd154aa	8294	Boštanj
00050000-555f-3737-64a9-e34cf900877e	5230	Bovec
00050000-555f-3737-1fae-b388071de4b2	5295	Branik
00050000-555f-3737-cad0-e242d5ca7e7a	3314	Braslovče
00050000-555f-3737-edc1-6e7d278339c1	5223	Breginj
00050000-555f-3737-7355-6e46a5e43669	8280	Brestanica
00050000-555f-3737-eed8-5d5f0433cd6d	2354	Bresternica
00050000-555f-3737-f182-7245d9a7087f	4243	Brezje
00050000-555f-3737-b74b-619fa00d47ca	1351	Brezovica pri Ljubljani
00050000-555f-3737-6d2e-cfffaa446abc	8250	Brežice
00050000-555f-3737-3006-5ecf84d6bf46	4210	Brnik - Aerodrom
00050000-555f-3737-6c13-c2af8f077ca2	8321	Brusnice
00050000-555f-3737-ab9c-244602815519	3255	Buče
00050000-555f-3737-0db7-578613df3e44	8276	Bučka 
00050000-555f-3737-896f-8f8cbaed7799	9261	Cankova
00050000-555f-3737-1e2f-be469b573150	3000	Celje 
00050000-555f-3737-c02b-bcd5f3112815	3001	Celje - poštni predali
00050000-555f-3737-528a-381bd9f9b2d0	4207	Cerklje na Gorenjskem
00050000-555f-3737-a1f3-5aabf3101190	8263	Cerklje ob Krki
00050000-555f-3737-86d5-6d878dc795cd	1380	Cerknica
00050000-555f-3737-4f7a-33429e957dbc	5282	Cerkno
00050000-555f-3737-87c3-dd74c98d35db	2236	Cerkvenjak
00050000-555f-3737-4cbd-44548e0542cc	2215	Ceršak
00050000-555f-3737-5304-9ca3965ed4b5	2326	Cirkovce
00050000-555f-3737-a4a4-2e807a6d2359	2282	Cirkulane
00050000-555f-3737-b192-8ee2c9ec90c1	5273	Col
00050000-555f-3737-ea5d-399b3087bb2f	8251	Čatež ob Savi
00050000-555f-3737-d9bb-9197286f34ad	1413	Čemšenik
00050000-555f-3737-8514-5f8b5412ce30	5253	Čepovan
00050000-555f-3737-bcc0-89f900f1416c	9232	Črenšovci
00050000-555f-3737-8b85-684fa00e502d	2393	Črna na Koroškem
00050000-555f-3737-c793-3bd85c0ec0f1	6275	Črni Kal
00050000-555f-3737-cf89-3e9b3b7719bd	5274	Črni Vrh nad Idrijo
00050000-555f-3737-2b43-a171d622b883	5262	Črniče
00050000-555f-3737-aabf-e5da648bcf40	8340	Črnomelj
00050000-555f-3737-8a9a-4e7aee64a856	6271	Dekani
00050000-555f-3737-29ae-832a1b87ea00	5210	Deskle
00050000-555f-3737-65fc-4c9b48e5e8b2	2253	Destrnik
00050000-555f-3737-0f42-0fe5d18ca99a	6215	Divača
00050000-555f-3737-76e0-4024043ea106	1233	Dob
00050000-555f-3737-4d6a-d38526bd4dbb	3224	Dobje pri Planini
00050000-555f-3737-e621-65db2b850a4e	8257	Dobova
00050000-555f-3737-ef27-2b1f632f534b	1423	Dobovec
00050000-555f-3737-c7d4-082bfda4df18	5263	Dobravlje
00050000-555f-3737-a237-2fdf037d0943	3204	Dobrna
00050000-555f-3737-5527-65fba57be010	8211	Dobrnič
00050000-555f-3737-176b-e01ad56c5f50	1356	Dobrova
00050000-555f-3737-fe6c-635c3f65f830	9223	Dobrovnik/Dobronak 
00050000-555f-3737-1e57-908d12eabdea	5212	Dobrovo v Brdih
00050000-555f-3737-725b-48b46f381e67	1431	Dol pri Hrastniku
00050000-555f-3737-44db-5a89c59f459a	1262	Dol pri Ljubljani
00050000-555f-3737-eda3-17de924a2875	1273	Dole pri Litiji
00050000-555f-3737-0c05-901275f391fe	1331	Dolenja vas
00050000-555f-3737-c258-8aeea91dd8ed	8350	Dolenjske Toplice
00050000-555f-3737-ad49-64e3841ee260	1230	Domžale
00050000-555f-3737-b5b4-6ab9550e82a2	2252	Dornava
00050000-555f-3737-5b45-ed1de8c4f6b5	5294	Dornberk
00050000-555f-3737-207f-75fe6b5fd0e4	1319	Draga
00050000-555f-3737-fa79-0f8b927ed599	8343	Dragatuš
00050000-555f-3737-657e-960b398609a4	3222	Dramlje
00050000-555f-3737-7f40-88692a3be749	2370	Dravograd
00050000-555f-3737-e8aa-a0e0ad3ef7b7	4203	Duplje
00050000-555f-3737-de14-9994a178f358	6221	Dutovlje
00050000-555f-3737-ae52-059dafcaad2d	8361	Dvor
00050000-555f-3737-5928-4e972392ad4b	2343	Fala
00050000-555f-3737-bf2c-583e7fcea609	9208	Fokovci
00050000-555f-3737-17e1-cc92ae967cc8	2313	Fram
00050000-555f-3737-4b16-c0f7774fca26	3213	Frankolovo
00050000-555f-3737-c9da-cd54e8397c02	1274	Gabrovka
00050000-555f-3737-c606-230b04de75da	8254	Globoko
00050000-555f-3737-f3c8-131aa93846bc	5275	Godovič
00050000-555f-3737-18e6-a892e5c3626b	4204	Golnik
00050000-555f-3737-a0df-61ea090f00e2	3303	Gomilsko
00050000-555f-3737-110e-103ec0cc13a0	4224	Gorenja vas
00050000-555f-3737-5c44-a850f69b7308	3263	Gorica pri Slivnici
00050000-555f-3737-e5da-a3cdd75fca1d	2272	Gorišnica
00050000-555f-3737-19d9-2aa6ccc8fc71	9250	Gornja Radgona
00050000-555f-3737-c507-9301f5629550	3342	Gornji Grad
00050000-555f-3737-5da7-ffc96678f2bd	4282	Gozd Martuljek
00050000-555f-3737-983e-ce1f2dee1182	6272	Gračišče
00050000-555f-3737-0363-fb87df1d06d1	9264	Grad
00050000-555f-3737-fd17-61575cdbea90	8332	Gradac
00050000-555f-3737-a4f2-360582f813df	1384	Grahovo
00050000-555f-3737-5cb1-efed88e1ffde	5242	Grahovo ob Bači
00050000-555f-3737-d88b-b28fe10fa2fa	5251	Grgar
00050000-555f-3737-41c2-0529da77428b	3302	Griže
00050000-555f-3737-6430-7e06c18f7e78	3231	Grobelno
00050000-555f-3737-3dce-9b2449906e43	1290	Grosuplje
00050000-555f-3737-4ccf-c9a55d0d496a	2288	Hajdina
00050000-555f-3737-c164-86d59ea305a5	8362	Hinje
00050000-555f-3737-f153-a50206a9f281	2311	Hoče
00050000-555f-3737-f408-2c740faa2101	9205	Hodoš/Hodos
00050000-555f-3737-f0d6-53d049893e93	1354	Horjul
00050000-555f-3737-f65c-78fe2367e3fc	1372	Hotedršica
00050000-555f-3737-5e60-cb423d50bdc8	1430	Hrastnik
00050000-555f-3737-cc4e-f29889ce2bdb	6225	Hruševje
00050000-555f-3737-3164-6d0acc600b63	4276	Hrušica
00050000-555f-3737-f410-72fefcfe62e5	5280	Idrija
00050000-555f-3737-94c0-b03b638d2575	1292	Ig
00050000-555f-3737-60d5-28a08006399a	6250	Ilirska Bistrica
00050000-555f-3737-ab93-21ff7e0d7865	6251	Ilirska Bistrica-Trnovo
00050000-555f-3737-755e-80ffb7dff930	1295	Ivančna Gorica
00050000-555f-3737-f8ef-9dc5edf31840	2259	Ivanjkovci
00050000-555f-3737-0146-99472cc37a20	1411	Izlake
00050000-555f-3737-4738-2e581c7e29d7	6310	Izola/Isola
00050000-555f-3737-594a-4053bb652d42	2222	Jakobski Dol
00050000-555f-3737-9e02-8585768fa10d	2221	Jarenina
00050000-555f-3737-0cb3-ec884c11b7c6	6254	Jelšane
00050000-555f-3737-d8cb-79db79a5cad2	4270	Jesenice
00050000-555f-3737-f2ed-2fc611e5f274	8261	Jesenice na Dolenjskem
00050000-555f-3737-9a57-303ffa3ae0e3	3273	Jurklošter
00050000-555f-3737-9122-80f723df8b47	2223	Jurovski Dol
00050000-555f-3737-4fc9-10be507d6b67	2256	Juršinci
00050000-555f-3737-dbc3-5db625a84a49	5214	Kal nad Kanalom
00050000-555f-3737-9316-4c488fc96efc	3233	Kalobje
00050000-555f-3737-3ca2-739242d5f830	4246	Kamna Gorica
00050000-555f-3737-c914-68e18481a18f	2351	Kamnica
00050000-555f-3737-3a5b-601186ba8571	1241	Kamnik
00050000-555f-3737-1815-4ba830c9cdf8	5213	Kanal
00050000-555f-3737-47cc-d366e94555de	8258	Kapele
00050000-555f-3737-5349-9d9855b78b17	2362	Kapla
00050000-555f-3737-edb7-a26fc550094a	2325	Kidričevo
00050000-555f-3737-4701-7b8dbd05f432	1412	Kisovec
00050000-555f-3737-07e6-85feba6677dd	6253	Knežak
00050000-555f-3737-7b6f-3a2c16a8daab	5222	Kobarid
00050000-555f-3737-f7ff-67868a0580b3	9227	Kobilje
00050000-555f-3737-a1cc-f426d769aad8	1330	Kočevje
00050000-555f-3737-464e-563c6db164bf	1338	Kočevska Reka
00050000-555f-3737-c0df-71f1288f6b19	2276	Kog
00050000-555f-3737-1bee-317b91f0431e	5211	Kojsko
00050000-555f-3737-b7f8-9a553409a2c0	6223	Komen
00050000-555f-3737-5365-cc03fb6d38d7	1218	Komenda
00050000-555f-3737-6358-dcb564f23de9	6000	Koper/Capodistria 
00050000-555f-3737-e183-930d9a7f8f74	6001	Koper/Capodistria - poštni predali
00050000-555f-3737-0271-05a924dbb320	8282	Koprivnica
00050000-555f-3737-d861-976e00c166c4	5296	Kostanjevica na Krasu
00050000-555f-3737-38d5-86bf80a3b3c5	8311	Kostanjevica na Krki
00050000-555f-3737-0d18-13964fc4e386	1336	Kostel
00050000-555f-3737-5b40-396b8ef2f08e	6256	Košana
00050000-555f-3737-6688-3a865d6ecdf3	2394	Kotlje
00050000-555f-3737-96fa-fbfb2c079678	6240	Kozina
00050000-555f-3737-63d9-9e0f0556b52f	3260	Kozje
00050000-555f-3737-4404-39187979aaaa	4000	Kranj 
00050000-555f-3737-f011-406f8653aa3d	4001	Kranj - poštni predali
00050000-555f-3737-5a19-1ba1c7d2cdad	4280	Kranjska Gora
00050000-555f-3737-eb29-5ee337a12bdc	1281	Kresnice
00050000-555f-3737-35ab-50561336f6d8	4294	Križe
00050000-555f-3737-c942-dc21d78ff52a	9206	Križevci
00050000-555f-3737-f740-c0dad5c94879	9242	Križevci pri Ljutomeru
00050000-555f-3737-3a44-c73d97a1f457	1301	Krka
00050000-555f-3737-72aa-defa6c7509c4	8296	Krmelj
00050000-555f-3737-2e4b-fed2609ba5a1	4245	Kropa
00050000-555f-3737-d6f7-3c1dc6e230e6	8262	Krška vas
00050000-555f-3737-e560-01c029ec8202	8270	Krško
00050000-555f-3737-0f44-61d71f305b28	9263	Kuzma
00050000-555f-3737-694f-e87d44a658cf	2318	Laporje
00050000-555f-3737-b18b-6e40e69867d6	3270	Laško
00050000-555f-3737-9fb9-2fc2fddaa67f	1219	Laze v Tuhinju
00050000-555f-3737-acd6-966e3821a454	2230	Lenart v Slovenskih goricah
00050000-555f-3737-4b63-3fc5c04037c1	9220	Lendava/Lendva
00050000-555f-3737-b31a-191053f76217	4248	Lesce
00050000-555f-3737-1694-41d37bb4e599	3261	Lesično
00050000-555f-3737-4259-71d3ae7aebf2	8273	Leskovec pri Krškem
00050000-555f-3737-00ab-c36b50f53fff	2372	Libeliče
00050000-555f-3737-f76c-24958e97b4d7	2341	Limbuš
00050000-555f-3737-5800-a89e698a802d	1270	Litija
00050000-555f-3737-2855-a36f572d40ca	3202	Ljubečna
00050000-555f-3737-2791-0018eca4abd0	1000	Ljubljana 
00050000-555f-3737-f041-5d42870d2a52	1001	Ljubljana - poštni predali
00050000-555f-3737-b3e4-810e3630cd64	1231	Ljubljana - Črnuče
00050000-555f-3737-ea4d-9f605b98c511	1261	Ljubljana - Dobrunje
00050000-555f-3737-fce3-09eafbe15d23	1260	Ljubljana - Polje
00050000-555f-3737-370b-09382c93d3f6	1210	Ljubljana - Šentvid
00050000-555f-3737-9c14-0be9e2ee7d97	1211	Ljubljana - Šmartno
00050000-555f-3737-81ca-ac08949a5aec	3333	Ljubno ob Savinji
00050000-555f-3737-5c8d-8301da1270bc	9240	Ljutomer
00050000-555f-3737-78a9-1bc3a8b9155d	3215	Loče
00050000-555f-3737-57e0-2102194924b0	5231	Log pod Mangartom
00050000-555f-3737-abaf-038a0ca09ec4	1358	Log pri Brezovici
00050000-555f-3737-e4f0-766b6978975b	1370	Logatec
00050000-555f-3737-806e-2fb44c66914f	1371	Logatec
00050000-555f-3737-810c-4a7fb3bd4ca5	1434	Loka pri Zidanem Mostu
00050000-555f-3737-43b7-27a38eb6782f	3223	Loka pri Žusmu
00050000-555f-3737-e47c-33836eec471d	6219	Lokev
00050000-555f-3737-48de-9285818e5e4f	1318	Loški Potok
00050000-555f-3737-400f-6af51fd7d8af	2324	Lovrenc na Dravskem polju
00050000-555f-3737-cf74-4499f2af8289	2344	Lovrenc na Pohorju
00050000-555f-3737-fe2e-ff1024394ee0	3334	Luče
00050000-555f-3737-7ca6-6c28cbb617bb	1225	Lukovica
00050000-555f-3737-5910-5bbd24562d04	9202	Mačkovci
00050000-555f-3737-bae3-beafb1d630be	2322	Majšperk
00050000-555f-3737-fa33-2271869ffa77	2321	Makole
00050000-555f-3737-c6ba-99e7310f45c1	9243	Mala Nedelja
00050000-555f-3737-fce2-573fc7bb46e0	2229	Malečnik
00050000-555f-3737-4334-352256cb3c7c	6273	Marezige
00050000-555f-3737-7fb9-c9dc5c91cca3	2000	Maribor 
00050000-555f-3737-338c-dd6d5e88a677	2001	Maribor - poštni predali
00050000-555f-3737-6b06-178e4c5414f0	2206	Marjeta na Dravskem polju
00050000-555f-3737-a886-d9c0db1e11ae	2281	Markovci
00050000-555f-3737-c0f7-d0603ae09907	9221	Martjanci
00050000-555f-3737-29d3-ce029897e18a	6242	Materija
00050000-555f-3737-d33a-df324a6acf55	4211	Mavčiče
00050000-555f-3737-03a1-27a5fdffe998	1215	Medvode
00050000-555f-3737-aed8-38b519bb0efb	1234	Mengeš
00050000-555f-3737-ded7-e29eb89dc547	8330	Metlika
00050000-555f-3737-22cc-5f1567b60950	2392	Mežica
00050000-555f-3737-5816-ec837970c0ec	2204	Miklavž na Dravskem polju
00050000-555f-3737-d91f-161bfcd10458	2275	Miklavž pri Ormožu
00050000-555f-3737-a08c-e5e7b98040cc	5291	Miren
00050000-555f-3737-4c29-6b327a11735f	8233	Mirna
00050000-555f-3737-cae0-ba9876eae8ed	8216	Mirna Peč
00050000-555f-3737-4c2c-3bfc245ff8d9	2382	Mislinja
00050000-555f-3737-4007-1a278cd134c1	4281	Mojstrana
00050000-555f-3737-216d-ee503a0970ae	8230	Mokronog
00050000-555f-3737-2478-91636e55d9c2	1251	Moravče
00050000-555f-3737-634e-ab8e81f7c687	9226	Moravske Toplice
00050000-555f-3737-a0a3-6cc789414997	5216	Most na Soči
00050000-555f-3737-f392-02ef93b40d26	1221	Motnik
00050000-555f-3737-2fe5-b57278ef5926	3330	Mozirje
00050000-555f-3737-50bf-6ca18847eebf	9000	Murska Sobota 
00050000-555f-3737-bfa3-7980816a4677	9001	Murska Sobota - poštni predali
00050000-555f-3737-446e-02d3b18d57d7	2366	Muta
00050000-555f-3737-11eb-518289094b83	4202	Naklo
00050000-555f-3737-a6f8-2af00eb3280c	3331	Nazarje
00050000-555f-3737-df9a-d1e1df3116b6	1357	Notranje Gorice
00050000-555f-3737-6ace-0014cd95e7f4	3203	Nova Cerkev
00050000-555f-3737-061f-3097fede5500	5000	Nova Gorica 
00050000-555f-3737-8926-5448278503c5	5001	Nova Gorica - poštni predali
00050000-555f-3737-9c85-155cb168d47d	1385	Nova vas
00050000-555f-3737-328d-5b92271b786b	8000	Novo mesto
00050000-555f-3737-f50f-a83e5a0c5283	8001	Novo mesto - poštni predali
00050000-555f-3737-1c44-07fd5143ea4b	6243	Obrov
00050000-555f-3737-fd43-e4dd2caac0e4	9233	Odranci
00050000-555f-3737-149e-d3d458ae731e	2317	Oplotnica
00050000-555f-3737-5c0d-0f6756f8c937	2312	Orehova vas
00050000-555f-3737-b17f-9374d9b88fee	2270	Ormož
00050000-555f-3737-c18d-8d5f51dedeaa	1316	Ortnek
00050000-555f-3737-8584-42266b7adaba	1337	Osilnica
00050000-555f-3737-d7b0-119445aa4333	8222	Otočec
00050000-555f-3737-cea5-ae9ea2673794	2361	Ožbalt
00050000-555f-3737-57a9-44a7a965629d	2231	Pernica
00050000-555f-3737-d5d2-eec580ae645d	2211	Pesnica pri Mariboru
00050000-555f-3737-cb0c-4e3f52508ce1	9203	Petrovci
00050000-555f-3737-d714-60bac4ec0b78	3301	Petrovče
00050000-555f-3737-f77f-e6cfcc5edd42	6330	Piran/Pirano
00050000-555f-3737-a8ca-5fb266b081c3	8255	Pišece
00050000-555f-3737-fbec-82d649c7bb81	6257	Pivka
00050000-555f-3737-aa4c-6c15f935b70a	6232	Planina
00050000-555f-3737-85c9-1b86ea9240eb	3225	Planina pri Sevnici
00050000-555f-3737-fd5c-9190597e5ad6	6276	Pobegi
00050000-555f-3737-2e24-469781f6e69f	8312	Podbočje
00050000-555f-3737-f230-d66b395aaf79	5243	Podbrdo
00050000-555f-3737-7ee1-591830bdb534	3254	Podčetrtek
00050000-555f-3737-0569-a6bc9da2483a	2273	Podgorci
00050000-555f-3737-eab4-8a648a7f7c8b	6216	Podgorje
00050000-555f-3737-9064-6c735fd16cbd	2381	Podgorje pri Slovenj Gradcu
00050000-555f-3737-0d89-362a20aa8e29	6244	Podgrad
00050000-555f-3737-1c42-8b69a520ae8f	1414	Podkum
00050000-555f-3737-cdb9-c31e2aa02763	2286	Podlehnik
00050000-555f-3737-e813-e6d366c1b636	5272	Podnanos
00050000-555f-3737-fd06-2f538b4f4a84	4244	Podnart
00050000-555f-3737-d0b0-4b7127ab62c2	3241	Podplat
00050000-555f-3737-a0a3-73ec82178f18	3257	Podsreda
00050000-555f-3737-dd88-6e345863b6d4	2363	Podvelka
00050000-555f-3737-bd56-d6ae0bd9abd8	2208	Pohorje
00050000-555f-3737-d5ab-831d56b2bc87	2257	Polenšak
00050000-555f-3737-3095-c872fbbf61ca	1355	Polhov Gradec
00050000-555f-3737-b465-b0570badda4d	4223	Poljane nad Škofjo Loko
00050000-555f-3737-5a88-365a51cf001c	2319	Poljčane
00050000-555f-3737-4ee5-a6386d749b97	1272	Polšnik
00050000-555f-3737-375d-56a13c7ca49e	3313	Polzela
00050000-555f-3737-1449-c1419c2b1006	3232	Ponikva
00050000-555f-3737-7655-b673272f4c3e	6320	Portorož/Portorose
00050000-555f-3737-8ca8-f0b386ffd905	6230	Postojna
00050000-555f-3737-4e17-2b32fb927a09	2331	Pragersko
00050000-555f-3737-0771-934aa459bd6d	3312	Prebold
00050000-555f-3737-7426-829c1c626691	4205	Preddvor
00050000-555f-3737-8519-a634c2688d82	6255	Prem
00050000-555f-3737-16ec-389a2923208d	1352	Preserje
00050000-555f-3737-33ee-9c05badb2686	6258	Prestranek
00050000-555f-3737-ae0f-f0425abf90d0	2391	Prevalje
00050000-555f-3737-b931-066f9e5636f0	3262	Prevorje
00050000-555f-3737-0928-7f4cadb27f4b	1276	Primskovo 
00050000-555f-3737-e4d3-ecb6a5da739a	3253	Pristava pri Mestinju
00050000-555f-3737-6365-adf911bc0063	9207	Prosenjakovci/Partosfalva
00050000-555f-3737-0a6e-ef3109b0c820	5297	Prvačina
00050000-555f-3737-1e61-dd5a54c89b50	2250	Ptuj
00050000-555f-3737-246c-9fc7d7d37716	2323	Ptujska Gora
00050000-555f-3737-5bd8-58c6968871ed	9201	Puconci
00050000-555f-3737-bf0b-db3ffcae80b2	2327	Rače
00050000-555f-3737-3f86-6a60bbb43647	1433	Radeče
00050000-555f-3737-d1c6-39aa0cf89818	9252	Radenci
00050000-555f-3737-1831-47f14a9e74f2	2360	Radlje ob Dravi
00050000-555f-3737-5536-0cf38d2d7c73	1235	Radomlje
00050000-555f-3737-c209-c23179b4fad0	4240	Radovljica
00050000-555f-3737-f719-9da0ef4e563f	8274	Raka
00050000-555f-3737-fd86-4ef27369ef7f	1381	Rakek
00050000-555f-3737-96e7-0ccf63b0b13d	4283	Rateče - Planica
00050000-555f-3737-69c7-655e32df6545	2390	Ravne na Koroškem
00050000-555f-3737-0320-eeadd6434804	9246	Razkrižje
00050000-555f-3737-a237-62afaf19442c	3332	Rečica ob Savinji
00050000-555f-3737-c44c-fd9529e968cf	5292	Renče
00050000-555f-3737-615e-e14d797f4fcf	1310	Ribnica
00050000-555f-3737-5039-63a932c8325c	2364	Ribnica na Pohorju
00050000-555f-3737-a7f5-71e492aedeae	3272	Rimske Toplice
00050000-555f-3737-7fd2-0c8065f6b374	1314	Rob
00050000-555f-3737-d8d1-6c7eadf25ee7	5215	Ročinj
00050000-555f-3737-1b4f-b3498a70f6b3	3250	Rogaška Slatina
00050000-555f-3737-9098-aa548add64e0	9262	Rogašovci
00050000-555f-3737-0e2e-e347179858c0	3252	Rogatec
00050000-555f-3737-0b36-1a77874033a1	1373	Rovte
00050000-555f-3737-b3d7-ae92a70998f1	2342	Ruše
00050000-555f-3737-aef4-71ae1f12d8a2	1282	Sava
00050000-555f-3737-4b5e-049fab778706	6333	Sečovlje/Sicciole
00050000-555f-3737-789e-3654dbe67c0a	4227	Selca
00050000-555f-3737-ad29-cb6b8d29245f	2352	Selnica ob Dravi
00050000-555f-3737-18c8-8036b77a182d	8333	Semič
00050000-555f-3737-1793-7616dca69e42	8281	Senovo
00050000-555f-3737-f0a2-3d1c10b7409e	6224	Senožeče
00050000-555f-3737-c07a-d0c5c5d6b0e6	8290	Sevnica
00050000-555f-3737-a969-78527a45c210	6210	Sežana
00050000-555f-3737-e29d-a9f684be4914	2214	Sladki Vrh
00050000-555f-3737-c493-45fde6eacb1c	5283	Slap ob Idrijci
00050000-555f-3737-8347-c7032f3bf4bd	2380	Slovenj Gradec
00050000-555f-3737-791f-58a11b8de680	2310	Slovenska Bistrica
00050000-555f-3737-25dc-f4185c3f103b	3210	Slovenske Konjice
00050000-555f-3737-93fb-74fc9402a338	1216	Smlednik
00050000-555f-3737-4aaa-cda9eb0a4034	5232	Soča
00050000-555f-3737-af48-a93302c53d59	1317	Sodražica
00050000-555f-3737-d69e-8eea2f69ad00	3335	Solčava
00050000-555f-3737-e505-ed31fe45d6d5	5250	Solkan
00050000-555f-3737-0054-ed6be9ae9ad6	4229	Sorica
00050000-555f-3737-b053-f40042758f4b	4225	Sovodenj
00050000-555f-3737-225b-33f84ec890b1	5281	Spodnja Idrija
00050000-555f-3737-1445-69ed59d2369c	2241	Spodnji Duplek
00050000-555f-3737-5680-bce48b073a29	9245	Spodnji Ivanjci
00050000-555f-3737-889f-fc9d1cbaa979	2277	Središče ob Dravi
00050000-555f-3737-c2a0-4faee6b808c1	4267	Srednja vas v Bohinju
00050000-555f-3737-0493-f89d9be656dc	8256	Sromlje 
00050000-555f-3737-849e-56eeed0d627b	5224	Srpenica
00050000-555f-3737-3442-9245c0843c3d	1242	Stahovica
00050000-555f-3737-ff98-370dc61683a3	1332	Stara Cerkev
00050000-555f-3737-20b4-871a3d17b612	8342	Stari trg ob Kolpi
00050000-555f-3737-11f7-149f0422afce	1386	Stari trg pri Ložu
00050000-555f-3737-6d31-d5aee44f1c58	2205	Starše
00050000-555f-3737-6f99-4106e3093128	2289	Stoperce
00050000-555f-3737-1a37-5b35f05963d8	8322	Stopiče
00050000-555f-3737-5302-80e4d6c3e539	3206	Stranice
00050000-555f-3737-b1b0-51d3100e2639	8351	Straža
00050000-555f-3737-a60e-24c81a50a81b	1313	Struge
00050000-555f-3737-07bf-ecbc5faf2c1a	8293	Studenec
00050000-555f-3737-f2e9-9d8511382de1	8331	Suhor
00050000-555f-3737-a1fe-c199badf8da1	2233	Sv. Ana v Slovenskih goricah
00050000-555f-3737-acc9-9192641d31b1	2235	Sv. Trojica v Slovenskih goricah
00050000-555f-3737-49b1-c7b60c03ac88	2353	Sveti Duh na Ostrem Vrhu
00050000-555f-3737-2597-4a24e68e83d0	9244	Sveti Jurij ob Ščavnici
00050000-555f-3737-3be7-38a9ea24520d	3264	Sveti Štefan
00050000-555f-3737-0a8f-2802163845fb	2258	Sveti Tomaž
00050000-555f-3737-393d-a27d74ae7d61	9204	Šalovci
00050000-555f-3737-81ac-ab0b8e080a45	5261	Šempas
00050000-555f-3737-2295-662038b609b7	5290	Šempeter pri Gorici
00050000-555f-3737-ec48-07c568de467b	3311	Šempeter v Savinjski dolini
00050000-555f-3737-44c3-3bf8b117e635	4208	Šenčur
00050000-555f-3737-8dd4-e713d9e40b83	2212	Šentilj v Slovenskih goricah
00050000-555f-3737-1186-85b399c3f067	8297	Šentjanž
00050000-555f-3737-e093-6586495cc23b	2373	Šentjanž pri Dravogradu
00050000-555f-3737-31b2-7124447b3566	8310	Šentjernej
00050000-555f-3737-9a6e-0ffa2dfc1283	3230	Šentjur
00050000-555f-3737-bc20-1e3871db2571	3271	Šentrupert
00050000-555f-3737-de85-51e9cf7c9c7b	8232	Šentrupert
00050000-555f-3737-bbdb-665d5f9507fa	1296	Šentvid pri Stični
00050000-555f-3737-061a-009ea9c87135	8275	Škocjan
00050000-555f-3737-b0ee-a716027de248	6281	Škofije
00050000-555f-3737-8a02-3bbec2bcb00f	4220	Škofja Loka
00050000-555f-3737-270e-26629e7e348b	3211	Škofja vas
00050000-555f-3737-1517-0bc01efc16e3	1291	Škofljica
00050000-555f-3737-4587-be8e4bbfebf0	6274	Šmarje
00050000-555f-3737-85a3-82e6514a924c	1293	Šmarje - Sap
00050000-555f-3737-8c44-78470a7b6eef	3240	Šmarje pri Jelšah
00050000-555f-3737-a301-fc66f298778c	8220	Šmarješke Toplice
00050000-555f-3737-e1d1-0e8850a41894	2315	Šmartno na Pohorju
00050000-555f-3737-efc2-5d750bd0d753	3341	Šmartno ob Dreti
00050000-555f-3737-d7d6-1a2579275383	3327	Šmartno ob Paki
00050000-555f-3737-fe0b-dba01d7b8433	1275	Šmartno pri Litiji
00050000-555f-3737-b0ec-cec8683607ae	2383	Šmartno pri Slovenj Gradcu
00050000-555f-3737-1b4b-9f987610ed53	3201	Šmartno v Rožni dolini
00050000-555f-3737-f906-8928acbed0c7	3325	Šoštanj
00050000-555f-3737-f374-fbc1f06e2da8	6222	Štanjel
00050000-555f-3737-12e8-328fb1d4187e	3220	Štore
00050000-555f-3737-f64b-ca6ed2e9df14	3304	Tabor
00050000-555f-3737-dbd3-6d9a08236351	3221	Teharje
00050000-555f-3737-5194-747d6525cd4e	9251	Tišina
00050000-555f-3737-421a-bad5313414ec	5220	Tolmin
00050000-555f-3737-406d-87f99c32cea2	3326	Topolšica
00050000-555f-3737-376b-e2d0fb99a7bb	2371	Trbonje
00050000-555f-3737-ec76-d022ae8f887f	1420	Trbovlje
00050000-555f-3737-4e8f-ec5522fa058e	8231	Trebelno 
00050000-555f-3737-19ad-cee5027c623f	8210	Trebnje
00050000-555f-3737-a45c-b5936741b220	5252	Trnovo pri Gorici
00050000-555f-3737-6cb3-98fb2becb068	2254	Trnovska vas
00050000-555f-3737-7d97-5f3c3b3e1451	1222	Trojane
00050000-555f-3737-b1d1-c634c1517dfc	1236	Trzin
00050000-555f-3737-c423-8ba685a34c63	4290	Tržič
00050000-555f-3737-fa89-b08f79527e0d	8295	Tržišče
00050000-555f-3737-1e97-c09b6130f852	1311	Turjak
00050000-555f-3737-5960-0e89a22c5776	9224	Turnišče
00050000-555f-3737-425c-a78e95fa4962	8323	Uršna sela
00050000-555f-3737-a65c-ac2bacc25727	1252	Vače
00050000-555f-3737-4cdd-0d117c381523	3320	Velenje 
00050000-555f-3737-226d-d3e8cb88c9ee	3322	Velenje - poštni predali
00050000-555f-3737-f094-e5db2b003363	8212	Velika Loka
00050000-555f-3737-94d9-a183a7a582c6	2274	Velika Nedelja
00050000-555f-3737-8ad2-38223febf739	9225	Velika Polana
00050000-555f-3737-111e-acf4266d4fb8	1315	Velike Lašče
00050000-555f-3737-bfe2-37cc66223aff	8213	Veliki Gaber
00050000-555f-3737-d365-00aeac26b51a	9241	Veržej
00050000-555f-3737-7fdc-ca1bb516d00a	1312	Videm - Dobrepolje
00050000-555f-3737-fd0a-2c398fecbd99	2284	Videm pri Ptuju
00050000-555f-3737-a218-0003c1416468	8344	Vinica
00050000-555f-3737-1fe0-0145fb9a1ce9	5271	Vipava
00050000-555f-3737-38ea-0cae1bf1190e	4212	Visoko
00050000-555f-3737-574a-af9f9519f43b	1294	Višnja Gora
00050000-555f-3737-cb07-14d48a45381d	3205	Vitanje
00050000-555f-3737-0f1d-361e078558f7	2255	Vitomarci
00050000-555f-3737-7f95-725e3fe149da	1217	Vodice
00050000-555f-3737-5d8e-c220c40e28d6	3212	Vojnik\t
00050000-555f-3737-f7e2-cc3cc77f504c	5293	Volčja Draga
00050000-555f-3737-f662-6bee98541830	2232	Voličina
00050000-555f-3737-135a-a9f6f3e3a48b	3305	Vransko
00050000-555f-3737-8333-fd20c79021f0	6217	Vremski Britof
00050000-555f-3737-17cb-c94d70d21a8d	1360	Vrhnika
00050000-555f-3737-5582-757523410a3d	2365	Vuhred
00050000-555f-3737-f31a-4194291d3198	2367	Vuzenica
00050000-555f-3737-1d01-2a7afb289ae2	8292	Zabukovje 
00050000-555f-3737-5c7b-a8104ec39aba	1410	Zagorje ob Savi
00050000-555f-3737-79b0-cd4802424db6	1303	Zagradec
00050000-555f-3737-66aa-d8db43b8de65	2283	Zavrč
00050000-555f-3737-e817-d6b1bf697284	8272	Zdole 
00050000-555f-3737-713f-80b446d869ac	4201	Zgornja Besnica
00050000-555f-3737-e552-febd99ed9b72	2242	Zgornja Korena
00050000-555f-3737-f61d-ccb566d9aeda	2201	Zgornja Kungota
00050000-555f-3737-d3b2-ea8d52caf542	2316	Zgornja Ložnica
00050000-555f-3737-d80e-4d89b1bbbfe2	2314	Zgornja Polskava
00050000-555f-3737-5efa-8584e8cdd143	2213	Zgornja Velka
00050000-555f-3737-6609-46e8db362d01	4247	Zgornje Gorje
00050000-555f-3737-63f7-e5ab19e53a7c	4206	Zgornje Jezersko
00050000-555f-3737-d34e-550510f14fe0	2285	Zgornji Leskovec
00050000-555f-3737-8ae7-9e75353cd0b7	1432	Zidani Most
00050000-555f-3737-fd91-ee559d3d82dd	3214	Zreče
00050000-555f-3737-1b03-d5a555043e25	4209	Žabnica
00050000-555f-3737-2b72-2fc0221a24e9	3310	Žalec
00050000-555f-3737-82d5-c4db74bb23f0	4228	Železniki
00050000-555f-3737-e1a4-6b0110c040ce	2287	Žetale
00050000-555f-3737-c4f4-7bd8c4812d88	4226	Žiri
00050000-555f-3737-77f6-d901ff6dc341	4274	Žirovnica
00050000-555f-3737-c05d-2e09bfad6c01	8360	Žužemberk
\.


--
-- TOC entry 2657 (class 0 OID 4711209)
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
-- TOC entry 2640 (class 0 OID 4711037)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 4711102)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2659 (class 0 OID 4711221)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 4711327)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 4711371)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 4711250)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 4711194)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 4711184)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 4711361)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 4711317)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2628 (class 0 OID 4710905)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-555f-3738-7cd4-8b4f3a90f591	00010000-555f-3738-4ba0-73504a47ebe7	2015-05-22 16:03:36	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROuPDOOd34QJnJfkh30lbDo5FvsJReADC";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2689 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2664 (class 0 OID 4711259)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 4710943)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-555f-3738-4987-5b040ec1f2e6	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-555f-3738-f09f-b7d7e0144236	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-555f-3738-ae9a-d302721b5825	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-555f-3738-9e71-6c0e904dc2ba	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-555f-3738-5a7d-811bbffec696	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-555f-3738-fa6f-79b693e12c82	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2630 (class 0 OID 4710927)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-555f-3738-7cd4-8b4f3a90f591	00020000-555f-3738-9e71-6c0e904dc2ba
00010000-555f-3738-4ba0-73504a47ebe7	00020000-555f-3738-9e71-6c0e904dc2ba
\.


--
-- TOC entry 2666 (class 0 OID 4711273)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 4711215)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 4711165)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 4711002)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 4711171)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 4711350)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, imezenski, podrocje) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 4711071)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 4710914)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-555f-3738-4ba0-73504a47ebe7	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRONV.H3ARlAewaWMdENThUGSD981I575a	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-555f-3738-7cd4-8b4f3a90f591	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2678 (class 0 OID 4711403)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumzacstudija, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 4711117)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 4711242)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 4711309)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 4711149)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 4711393)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 4711299)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2270 (class 2606 OID 4710968)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 4711444)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 4711437)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 4711349)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 4711139)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 4711164)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2306 (class 2606 OID 4711097)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 4711295)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2317 (class 2606 OID 4711115)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 4711158)
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
-- TOC entry 2360 (class 2606 OID 4711207)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 4711234)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 4711069)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2274 (class 2606 OID 4710977)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 4711034)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2276 (class 2606 OID 4711000)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2268 (class 2606 OID 4710957)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2261 (class 2606 OID 4710942)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 4711240)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 4711272)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 4711388)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2284 (class 2606 OID 4711027)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2296 (class 2606 OID 4711057)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 4711213)
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
-- TOC entry 2294 (class 2606 OID 4711047)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2315 (class 2606 OID 4711106)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 4711225)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 4711333)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 4711376)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 4711257)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2358 (class 2606 OID 4711198)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 4711189)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 4711370)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 4711324)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2253 (class 2606 OID 4710913)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 4711263)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 4710931)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2263 (class 2606 OID 4710951)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 4711281)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 4711220)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 4711170)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2281 (class 2606 OID 4711007)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 4711180)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 4711360)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 4711082)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 4710926)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 4711418)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 4711124)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 4711248)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 4711315)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2334 (class 2606 OID 4711153)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 4711402)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 4711308)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2324 (class 1259 OID 4711146)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2282 (class 1259 OID 4711029)
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
-- TOC entry 2373 (class 1259 OID 4711241)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2367 (class 1259 OID 4711227)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2368 (class 1259 OID 4711226)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2319 (class 1259 OID 4711125)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2394 (class 1259 OID 4711298)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2395 (class 1259 OID 4711296)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2396 (class 1259 OID 4711297)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2419 (class 1259 OID 4711390)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2420 (class 1259 OID 4711391)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2421 (class 1259 OID 4711392)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2427 (class 1259 OID 4711422)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2428 (class 1259 OID 4711419)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2429 (class 1259 OID 4711421)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2430 (class 1259 OID 4711420)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2301 (class 1259 OID 4711084)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2302 (class 1259 OID 4711083)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2286 (class 1259 OID 4711036)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2287 (class 1259 OID 4711035)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2382 (class 1259 OID 4711264)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2337 (class 1259 OID 4711159)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2265 (class 1259 OID 4710958)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2266 (class 1259 OID 4710959)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2387 (class 1259 OID 4711284)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2388 (class 1259 OID 4711283)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2389 (class 1259 OID 4711282)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2311 (class 1259 OID 4711107)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2312 (class 1259 OID 4711109)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2313 (class 1259 OID 4711108)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2347 (class 1259 OID 4711193)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2348 (class 1259 OID 4711191)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2349 (class 1259 OID 4711190)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2350 (class 1259 OID 4711192)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2256 (class 1259 OID 4710932)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2257 (class 1259 OID 4710933)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2376 (class 1259 OID 4711249)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2362 (class 1259 OID 4711214)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2402 (class 1259 OID 4711325)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2403 (class 1259 OID 4711326)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2290 (class 1259 OID 4711049)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 4711048)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2292 (class 1259 OID 4711050)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2406 (class 1259 OID 4711334)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2407 (class 1259 OID 4711335)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2439 (class 1259 OID 4711447)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2440 (class 1259 OID 4711446)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2441 (class 1259 OID 4711449)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2442 (class 1259 OID 4711445)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2443 (class 1259 OID 4711448)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2399 (class 1259 OID 4711316)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2353 (class 1259 OID 4711202)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2354 (class 1259 OID 4711201)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2355 (class 1259 OID 4711199)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2356 (class 1259 OID 4711200)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2243 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2435 (class 1259 OID 4711439)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2436 (class 1259 OID 4711438)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2318 (class 1259 OID 4711116)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2271 (class 1259 OID 4710979)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2272 (class 1259 OID 4710978)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2278 (class 1259 OID 4711008)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2279 (class 1259 OID 4711009)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2342 (class 1259 OID 4711183)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2343 (class 1259 OID 4711182)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2344 (class 1259 OID 4711181)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2325 (class 1259 OID 4711148)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2326 (class 1259 OID 4711144)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2327 (class 1259 OID 4711141)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2328 (class 1259 OID 4711142)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2329 (class 1259 OID 4711140)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2330 (class 1259 OID 4711145)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2331 (class 1259 OID 4711143)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2285 (class 1259 OID 4711028)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2307 (class 1259 OID 4711098)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2308 (class 1259 OID 4711100)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2309 (class 1259 OID 4711099)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2310 (class 1259 OID 4711101)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2361 (class 1259 OID 4711208)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2424 (class 1259 OID 4711389)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2277 (class 1259 OID 4711001)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2300 (class 1259 OID 4711070)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2381 (class 1259 OID 4711258)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2246 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2297 (class 1259 OID 4711058)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2418 (class 1259 OID 4711377)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2264 (class 1259 OID 4710952)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2332 (class 1259 OID 4711147)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2468 (class 2606 OID 4711580)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2471 (class 2606 OID 4711565)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2470 (class 2606 OID 4711570)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2466 (class 2606 OID 4711590)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2472 (class 2606 OID 4711560)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2467 (class 2606 OID 4711585)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2469 (class 2606 OID 4711575)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2453 (class 2606 OID 4711495)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2489 (class 2606 OID 4711675)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 4711670)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2488 (class 2606 OID 4711665)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2465 (class 2606 OID 4711555)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2495 (class 2606 OID 4711715)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2497 (class 2606 OID 4711705)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2496 (class 2606 OID 4711710)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2485 (class 2606 OID 4711655)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2506 (class 2606 OID 4711750)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2505 (class 2606 OID 4711755)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2504 (class 2606 OID 4711760)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2507 (class 2606 OID 4711780)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2510 (class 2606 OID 4711765)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2508 (class 2606 OID 4711775)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2509 (class 2606 OID 4711770)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2459 (class 2606 OID 4711530)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2460 (class 2606 OID 4711525)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2454 (class 2606 OID 4711505)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2455 (class 2606 OID 4711500)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2450 (class 2606 OID 4711480)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2491 (class 2606 OID 4711685)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2473 (class 2606 OID 4711595)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2447 (class 2606 OID 4711460)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2446 (class 2606 OID 4711465)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2492 (class 2606 OID 4711700)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2493 (class 2606 OID 4711695)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2494 (class 2606 OID 4711690)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2463 (class 2606 OID 4711535)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2461 (class 2606 OID 4711545)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2462 (class 2606 OID 4711540)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2477 (class 2606 OID 4711630)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2479 (class 2606 OID 4711620)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2480 (class 2606 OID 4711615)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2478 (class 2606 OID 4711625)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2445 (class 2606 OID 4711450)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2444 (class 2606 OID 4711455)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2490 (class 2606 OID 4711680)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2486 (class 2606 OID 4711660)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2500 (class 2606 OID 4711725)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2499 (class 2606 OID 4711730)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2457 (class 2606 OID 4711515)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 4711510)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2456 (class 2606 OID 4711520)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2502 (class 2606 OID 4711735)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2501 (class 2606 OID 4711740)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2515 (class 2606 OID 4711805)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2516 (class 2606 OID 4711800)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2513 (class 2606 OID 4711815)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2517 (class 2606 OID 4711795)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2514 (class 2606 OID 4711810)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2498 (class 2606 OID 4711720)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2481 (class 2606 OID 4711650)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2482 (class 2606 OID 4711645)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2484 (class 2606 OID 4711635)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2483 (class 2606 OID 4711640)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2511 (class 2606 OID 4711790)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2512 (class 2606 OID 4711785)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2464 (class 2606 OID 4711550)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2503 (class 2606 OID 4711745)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2448 (class 2606 OID 4711475)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2449 (class 2606 OID 4711470)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2452 (class 2606 OID 4711485)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2451 (class 2606 OID 4711490)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2474 (class 2606 OID 4711610)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2475 (class 2606 OID 4711605)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2476 (class 2606 OID 4711600)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-22 16:03:36 CEST

--
-- PostgreSQL database dump complete
--

