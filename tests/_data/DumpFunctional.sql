--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-22 12:10:21 CEST

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
-- TOC entry 179 (class 1259 OID 4656947)
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
-- TOC entry 225 (class 1259 OID 4657426)
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
-- TOC entry 224 (class 1259 OID 4657409)
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
-- TOC entry 217 (class 1259 OID 4657323)
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
-- TOC entry 193 (class 1259 OID 4657113)
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
-- TOC entry 196 (class 1259 OID 4657147)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 4657072)
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
-- TOC entry 212 (class 1259 OID 4657272)
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
-- TOC entry 191 (class 1259 OID 4657097)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 4657141)
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
-- TOC entry 201 (class 1259 OID 4657190)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 4657215)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 4657046)
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
-- TOC entry 180 (class 1259 OID 4656956)
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
-- TOC entry 181 (class 1259 OID 4656967)
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
-- TOC entry 184 (class 1259 OID 4657017)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 4656921)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 4656940)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 4657222)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 4657252)
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
-- TOC entry 221 (class 1259 OID 4657365)
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
-- TOC entry 183 (class 1259 OID 4656997)
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
-- TOC entry 186 (class 1259 OID 4657038)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 4657196)
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
-- TOC entry 185 (class 1259 OID 4657024)
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
-- TOC entry 190 (class 1259 OID 4657089)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 4657208)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 4657314)
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
-- TOC entry 220 (class 1259 OID 4657358)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 4657237)
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
-- TOC entry 200 (class 1259 OID 4657181)
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
-- TOC entry 199 (class 1259 OID 4657171)
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
-- TOC entry 219 (class 1259 OID 4657348)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 4657304)
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
-- TOC entry 173 (class 1259 OID 4656892)
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
-- TOC entry 172 (class 1259 OID 4656890)
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
-- TOC entry 209 (class 1259 OID 4657246)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 4656930)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 4656914)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 4657260)
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
-- TOC entry 203 (class 1259 OID 4657202)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 4657152)
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
-- TOC entry 182 (class 1259 OID 4656989)
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
-- TOC entry 198 (class 1259 OID 4657158)
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
-- TOC entry 218 (class 1259 OID 4657337)
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
-- TOC entry 188 (class 1259 OID 4657058)
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
-- TOC entry 174 (class 1259 OID 4656901)
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
-- TOC entry 223 (class 1259 OID 4657390)
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
    kratkinaslov character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 4657104)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 4657229)
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
-- TOC entry 214 (class 1259 OID 4657296)
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
-- TOC entry 194 (class 1259 OID 4657136)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 4657380)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 4657286)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 4656895)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2632 (class 0 OID 4656947)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 4657426)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 4657409)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 4657323)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 4657113)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 4657147)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 4657072)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-555f-008c-502d-0a48761a424b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-555f-008c-ed39-cf5986f39ecd	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-555f-008c-b7ad-6f7c6d832e38	AL	ALB	008	Albania 	Albanija	\N
00040000-555f-008c-7a6a-02dace4462e8	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-555f-008c-0717-3abbe4169d5e	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-555f-008c-edb7-bd9206dcbff1	AD	AND	020	Andorra 	Andora	\N
00040000-555f-008c-4238-bc1bf1d2f588	AO	AGO	024	Angola 	Angola	\N
00040000-555f-008c-4a7c-f51d8bdeb39d	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-555f-008c-c86d-cd169e538ba0	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-555f-008c-91e1-e85b477004bd	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-555f-008c-4f67-f0cf8419585c	AR	ARG	032	Argentina 	Argenitna	\N
00040000-555f-008c-bba0-e1a56bfc100c	AM	ARM	051	Armenia 	Armenija	\N
00040000-555f-008c-50d0-266948538115	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-555f-008c-3d54-b5acc2c34925	AU	AUS	036	Australia 	Avstralija	\N
00040000-555f-008c-7861-5e4c872103c5	AT	AUT	040	Austria 	Avstrija	\N
00040000-555f-008c-3130-ec476c0f5845	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-555f-008c-23a7-f0f747ea8d95	BS	BHS	044	Bahamas 	Bahami	\N
00040000-555f-008c-481e-d2df59d15475	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-555f-008c-c6f7-fe82d5214a21	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-555f-008c-318c-a3726a5d380f	BB	BRB	052	Barbados 	Barbados	\N
00040000-555f-008c-ac70-fef12df5cd6f	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-555f-008c-9e4e-fb777b1e6fab	BE	BEL	056	Belgium 	Belgija	\N
00040000-555f-008c-c453-3798e79abbc0	BZ	BLZ	084	Belize 	Belize	\N
00040000-555f-008c-510a-a643b2a9e7cc	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-555f-008c-b581-fd645cd5adda	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-555f-008c-f1a4-60043de9f576	BT	BTN	064	Bhutan 	Butan	\N
00040000-555f-008c-22fc-052cbdb915ee	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-555f-008c-0b4d-8dcd52ebd67c	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-555f-008c-a812-3a30dfc7c05e	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-555f-008c-044d-d64657bf7b9b	BW	BWA	072	Botswana 	Bocvana	\N
00040000-555f-008c-19c7-68613265c8c3	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-555f-008c-62d3-d88ea004d783	BR	BRA	076	Brazil 	Brazilija	\N
00040000-555f-008c-2817-32ab44f58ddb	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-555f-008c-883e-322f7ecc066f	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-555f-008c-c242-f2fb940b0ee7	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-555f-008c-51e1-7ac3019dfc3d	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-555f-008c-44c1-7273eca9e632	BI	BDI	108	Burundi 	Burundi 	\N
00040000-555f-008c-7d1a-c4fb044ad6e3	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-555f-008c-6424-d8fdd5371a24	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-555f-008c-5b00-eea458c03e80	CA	CAN	124	Canada 	Kanada	\N
00040000-555f-008c-3927-12ea0f340dbe	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-555f-008c-f54b-358e51a3a24d	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-555f-008c-7b48-5e58ff597d88	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-555f-008c-340f-1e2c7feebff5	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-555f-008c-c8f1-1914566d44ea	CL	CHL	152	Chile 	Čile	\N
00040000-555f-008c-9011-97073f6eb3d3	CN	CHN	156	China 	Kitajska	\N
00040000-555f-008c-e4e3-b250585de430	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-555f-008c-a39f-c6a2e59ec880	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-555f-008c-b789-406b7f09a859	CO	COL	170	Colombia 	Kolumbija	\N
00040000-555f-008c-51da-d41aff22e758	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-555f-008c-be67-8ad159e7de8d	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-555f-008c-6fb0-b0c768791175	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-555f-008c-f713-6ec860428608	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-555f-008c-912a-ec8024256fb9	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-555f-008c-9170-d7a2a1dd25b0	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-555f-008c-b91f-f4518ccce6f9	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-555f-008c-2cfc-b4de937312e2	CU	CUB	192	Cuba 	Kuba	\N
00040000-555f-008c-8334-2b07ea908b97	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-555f-008c-a3f8-79d9760c5989	CY	CYP	196	Cyprus 	Ciper	\N
00040000-555f-008c-a8c6-fbce5675cc05	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-555f-008c-c722-ac136ad5c6d4	DK	DNK	208	Denmark 	Danska	\N
00040000-555f-008c-f306-b71d6b30880e	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-555f-008c-8f3e-09fd36fce2b7	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-555f-008c-1bca-745e4ae6502d	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-555f-008c-7b4e-edeaeac38408	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-555f-008c-114d-0d63eb8cc95b	EG	EGY	818	Egypt 	Egipt	\N
00040000-555f-008c-0143-0b4a92264dbd	SV	SLV	222	El Salvador 	Salvador	\N
00040000-555f-008c-265d-22aff9076393	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-555f-008c-30ff-163bb29d8bac	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-555f-008c-e533-e1bcb72366e9	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-555f-008c-46ac-d753e5259d9b	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-555f-008c-a838-8211273a7ea5	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-555f-008c-aa13-ebf2666f9c52	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-555f-008c-cf7c-e920f87b8a9e	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-555f-008c-acee-95571e6ab2e4	FI	FIN	246	Finland 	Finska	\N
00040000-555f-008c-243f-7883e8de71a0	FR	FRA	250	France 	Francija	\N
00040000-555f-008c-3e67-de3c3171050c	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-555f-008c-d906-85f41ca1fcb6	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-555f-008c-e51b-86f1945cd311	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-555f-008c-8c02-26b569d0720a	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-555f-008c-6b7c-1a3b4eadab54	GA	GAB	266	Gabon 	Gabon	\N
00040000-555f-008c-eb76-55477ecb897a	GM	GMB	270	Gambia 	Gambija	\N
00040000-555f-008c-cdbd-ff26df74b707	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-555f-008c-e666-0c95979f3748	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-555f-008c-3d04-017917ff2188	GH	GHA	288	Ghana 	Gana	\N
00040000-555f-008c-0e49-653c5bc0008d	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-555f-008c-bea7-375cb4df494a	GR	GRC	300	Greece 	Grčija	\N
00040000-555f-008c-6a38-eaa1d6f7fb19	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-555f-008c-b792-8b39fa464c3c	GD	GRD	308	Grenada 	Grenada	\N
00040000-555f-008c-1119-f661d7c0231f	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-555f-008c-2477-646c1c35270f	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-555f-008c-3854-7c0e43c83308	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-555f-008c-553e-495f43989c5e	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-555f-008c-84eb-b048b7142a8c	GN	GIN	324	Guinea 	Gvineja	\N
00040000-555f-008c-4ae4-32477b097b06	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-555f-008c-dc21-11db8057dfcc	GY	GUY	328	Guyana 	Gvajana	\N
00040000-555f-008c-9d52-5bbc422e4c43	HT	HTI	332	Haiti 	Haiti	\N
00040000-555f-008c-bdde-6debedb373a7	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-555f-008c-4364-d6b77d178191	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-555f-008c-e4f2-1026f782cf59	HN	HND	340	Honduras 	Honduras	\N
00040000-555f-008c-7981-4ba7603bca1a	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-555f-008c-1e19-b468893c6b3a	HU	HUN	348	Hungary 	Madžarska	\N
00040000-555f-008c-4cb0-8d7c49b39a4c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-555f-008c-90ca-886eaf99e918	IN	IND	356	India 	Indija	\N
00040000-555f-008c-183f-fcc5d281a297	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-555f-008c-cf3b-be4125b78622	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-555f-008c-f892-e2116cf5496b	IQ	IRQ	368	Iraq 	Irak	\N
00040000-555f-008c-eb35-0fcbbe4743c5	IE	IRL	372	Ireland 	Irska	\N
00040000-555f-008c-7e6d-20bafaa7ca94	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-555f-008c-8942-c81e9448762c	IL	ISR	376	Israel 	Izrael	\N
00040000-555f-008c-d5cb-8bce6beef591	IT	ITA	380	Italy 	Italija	\N
00040000-555f-008c-425d-23f6ef4b7cb0	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-555f-008c-8f28-792034a2ade8	JP	JPN	392	Japan 	Japonska	\N
00040000-555f-008c-6a8a-3fc284853d2b	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-555f-008c-c3c7-ab6421f2512a	JO	JOR	400	Jordan 	Jordanija	\N
00040000-555f-008c-63a5-5ea5dc107093	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-555f-008c-216f-6b18c924aed3	KE	KEN	404	Kenya 	Kenija	\N
00040000-555f-008c-3ea1-b34c4a47741f	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-555f-008c-1c20-7f0866d20220	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-555f-008c-0d86-8666737530d5	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-555f-008c-7c41-c1c6a73cc3cb	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-555f-008c-504e-c25c2cb84e7b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-555f-008c-3d47-61dc16de6a57	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-555f-008c-c7d8-0bb9812d6ddb	LV	LVA	428	Latvia 	Latvija	\N
00040000-555f-008c-9d1e-8553b2e3c36f	LB	LBN	422	Lebanon 	Libanon	\N
00040000-555f-008c-c966-adb3fb30e83c	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-555f-008c-9eb6-1179d8b1e41b	LR	LBR	430	Liberia 	Liberija	\N
00040000-555f-008c-f9f4-e599a115cc25	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-555f-008c-6cee-c7ded944aeeb	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-555f-008c-c8ed-14fdd9d6f95b	LT	LTU	440	Lithuania 	Litva	\N
00040000-555f-008c-513d-1cdea2023b54	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-555f-008c-eefa-b628c989f19e	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-555f-008c-e1d0-f45ff9763b20	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-555f-008c-a1cb-b78492bcad80	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-555f-008c-9f0f-3d04e0f977e6	MW	MWI	454	Malawi 	Malavi	\N
00040000-555f-008c-2a7a-112acfda96aa	MY	MYS	458	Malaysia 	Malezija	\N
00040000-555f-008c-0478-6ec68f1c9f0a	MV	MDV	462	Maldives 	Maldivi	\N
00040000-555f-008c-2084-8659a8d21698	ML	MLI	466	Mali 	Mali	\N
00040000-555f-008c-205f-d82b85fb0b20	MT	MLT	470	Malta 	Malta	\N
00040000-555f-008c-deb5-a260937781e8	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-555f-008c-25b7-91e9b2d26444	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-555f-008c-dc6e-a6119d550d13	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-555f-008c-4a9b-9e7fe17346b6	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-555f-008c-dab1-8c22bf92c7b9	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-555f-008c-0691-a689fa38b998	MX	MEX	484	Mexico 	Mehika	\N
00040000-555f-008c-9f67-dc0730c3bf0b	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-555f-008c-8ccf-ab1e9289ff39	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-555f-008c-6bf2-dc70a7910af8	MC	MCO	492	Monaco 	Monako	\N
00040000-555f-008c-87e1-17a63f05c196	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-555f-008c-6c11-aeded128e776	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-555f-008c-eaf8-9f12ea8ec5b8	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-555f-008c-4b5d-0bacdb0e4a2e	MA	MAR	504	Morocco 	Maroko	\N
00040000-555f-008c-871b-7a76b523ba9f	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-555f-008c-1a28-6205c4c6a54d	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-555f-008c-5c28-5785d9e6f67f	NA	NAM	516	Namibia 	Namibija	\N
00040000-555f-008c-8b5c-786169c20175	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-555f-008c-6ba2-9216a76a23c6	NP	NPL	524	Nepal 	Nepal	\N
00040000-555f-008c-c443-abe53592a290	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-555f-008c-ffb5-19c824b810b5	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-555f-008c-384e-f67c4c9564da	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-555f-008c-77b1-8f96541ea692	NE	NER	562	Niger 	Niger 	\N
00040000-555f-008c-b595-e2fed93eeb92	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-555f-008c-e145-2b79d8910c79	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-555f-008c-9af6-84bac70a1a50	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-555f-008c-f4b5-907516a3b8e6	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-555f-008c-a710-d7cd219d7e32	NO	NOR	578	Norway 	Norveška	\N
00040000-555f-008c-7627-12c6f3e866ce	OM	OMN	512	Oman 	Oman	\N
00040000-555f-008c-c53e-22e67e348690	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-555f-008c-2634-8fe7668ff376	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-555f-008c-e2b6-e5f8153a5519	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-555f-008c-76d3-2eb4c83a4a79	PA	PAN	591	Panama 	Panama	\N
00040000-555f-008c-17ad-44f814f50ade	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-555f-008c-3c66-def9f41372d1	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-555f-008c-da4c-722fec506085	PE	PER	604	Peru 	Peru	\N
00040000-555f-008c-1135-1450ee4cd5d2	PH	PHL	608	Philippines 	Filipini	\N
00040000-555f-008c-5e69-375c52c8dc79	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-555f-008c-ebd0-3bbd38bde3e4	PL	POL	616	Poland 	Poljska	\N
00040000-555f-008c-6cd1-99bd0d79a3c6	PT	PRT	620	Portugal 	Portugalska	\N
00040000-555f-008c-4fc4-a2afa08e9095	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-555f-008c-e732-7b6c2d10a14e	QA	QAT	634	Qatar 	Katar	\N
00040000-555f-008c-b0bb-da5a39ff2d60	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-555f-008c-d6cd-6c9593c96340	RO	ROU	642	Romania 	Romunija	\N
00040000-555f-008c-c97a-4c94da085de1	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-555f-008c-5b4b-cffed30278db	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-555f-008c-ea05-6c6e468a35e6	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-555f-008c-5e31-bff59ca92f6e	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-555f-008c-6c07-7987dc27270d	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-555f-008c-2224-4b6c65680e34	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-555f-008c-d6bb-d747c1951b35	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-555f-008c-a24b-2fa622e59c7e	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-555f-008c-5207-4a1451893b34	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-555f-008c-b81a-1a5e9b70e29c	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-555f-008c-e479-cd55e381476c	SM	SMR	674	San Marino 	San Marino	\N
00040000-555f-008c-1dcc-7f678669f54d	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-555f-008c-4332-1762ce2f2e06	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-555f-008c-d6d6-79a89077417b	SN	SEN	686	Senegal 	Senegal	\N
00040000-555f-008c-f31d-79f519ed30d2	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-555f-008c-5489-a2a1df3935f2	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-555f-008c-32d2-4f471e72c728	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-555f-008c-140b-97610df330f4	SG	SGP	702	Singapore 	Singapur	\N
00040000-555f-008c-092c-dd6773f9e5b3	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-555f-008c-0a5b-af01731430d2	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-555f-008c-eb44-0c08e571e997	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-555f-008c-3646-c75e073e4e68	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-555f-008c-e158-2f35c6d5287d	SO	SOM	706	Somalia 	Somalija	\N
00040000-555f-008c-9e1e-afe52d196536	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-555f-008c-2fa0-cbee428ded3d	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-555f-008c-c0d8-05ff634921f2	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-555f-008c-7130-3b79edd779f7	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-555f-008c-96c0-e331dfc15ea6	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-555f-008c-9f25-165ce0bf59b0	SD	SDN	729	Sudan 	Sudan	\N
00040000-555f-008c-6170-1150f91d4a55	SR	SUR	740	Suriname 	Surinam	\N
00040000-555f-008c-77ba-5247feeb562c	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-555f-008c-b60c-572cfaa5eaa4	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-555f-008c-43f2-0d99f99ab343	SE	SWE	752	Sweden 	Švedska	\N
00040000-555f-008c-3c71-672ffa24f22e	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-555f-008c-65c1-4fb8c12924f7	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-555f-008c-c683-f1600217edb0	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-555f-008c-a02f-3437e6bccd3f	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-555f-008c-1a82-b230053dacbd	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-555f-008c-afa3-54f20d3d4cd1	TH	THA	764	Thailand 	Tajska	\N
00040000-555f-008c-e7d6-5d6a5b141cdd	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-555f-008c-6803-f3a698fe5c80	TG	TGO	768	Togo 	Togo	\N
00040000-555f-008c-f2dd-8e1097bbff16	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-555f-008c-c98f-9c4ec9eb8180	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-555f-008c-148e-a1fffaaf662d	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-555f-008c-8fff-c190b07bd639	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-555f-008c-6f2f-73aa53d9a961	TR	TUR	792	Turkey 	Turčija	\N
00040000-555f-008c-797b-e76ca5397adc	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-555f-008c-8ca5-d38e43211de0	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555f-008c-e7a5-0c18f8c2ddbe	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-555f-008c-54e3-64301516b4aa	UG	UGA	800	Uganda 	Uganda	\N
00040000-555f-008c-d0e4-f0de808b3ef8	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-555f-008c-5bb5-470ff79b1d22	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-555f-008c-ce3b-f8f2ac0af170	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-555f-008c-505f-2df1bee1d91c	US	USA	840	United States 	Združene države Amerike	\N
00040000-555f-008c-26f3-a7580eec413c	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-555f-008c-93d4-111f9dd0e8bc	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-555f-008c-be35-5390720218e6	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-555f-008c-6fb0-9f5598982693	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-555f-008c-d24d-46404a87ab8b	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-555f-008c-e62f-b1baac729bf8	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-555f-008c-2205-61e1a3b1f1c6	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555f-008c-15c6-17b18dc373bb	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-555f-008c-7b24-ce839796042f	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-555f-008c-02a1-f4a7b0501d7c	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-555f-008c-4830-ff6d6b33d108	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-555f-008c-9259-1de25c3810f0	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-555f-008c-bb01-98c38a310fa9	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2665 (class 0 OID 4657272)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 4657097)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 4657141)
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
-- TOC entry 2654 (class 0 OID 4657190)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 4657215)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 4657046)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-555f-008c-0e1b-5ee72ecb431c	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-555f-008c-a7cd-21ab6b4deb1e	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-555f-008c-33ef-2e522ac8b962	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-555f-008c-1c4f-d23cd1c4c2c1	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-555f-008c-a84a-a58f4edd57dc	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-555f-008c-4d78-20e332392550	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-555f-008c-ae20-bb5c2fb68077	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-555f-008c-3e73-8eced97a3178	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-555f-008c-97df-654e5cc81031	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-555f-008c-f49d-b652e36eaa54	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-555f-008c-1743-ede409a1edd4	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-555f-008c-173a-cd2af1c92993	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-555f-008c-5797-8c2235f45e12	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2633 (class 0 OID 4656956)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-555f-008c-af9a-2eb57df8981a	00000000-555f-008c-a84a-a58f4edd57dc	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-555f-008c-b846-d71fd0b6128c	00000000-555f-008c-a84a-a58f4edd57dc	00010000-555f-008c-45f1-20ff2fc23bb1	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-555f-008c-9fe2-e073a80d7177	00000000-555f-008c-4d78-20e332392550	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2634 (class 0 OID 4656967)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 4657017)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 4656921)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-555f-008c-f416-96615c1bacdd	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-555f-008c-9973-95ae2ebd0c49	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-555f-008c-e5c3-143b75946622	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-555f-008c-70f8-589ac061a8d5	Abonma-read	Abonma - branje	f
00030000-555f-008c-2339-44dbe514ce31	Abonma-write	Abonma - spreminjanje	f
00030000-555f-008c-e0ae-398da07fb4ee	Alternacija-read	Alternacija - branje	f
00030000-555f-008c-448d-0f14e0303dff	Alternacija-write	Alternacija - spreminjanje	f
00030000-555f-008c-8b64-9bee4f5bef58	Arhivalija-read	Arhivalija - branje	f
00030000-555f-008c-a38b-0aecc338358b	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-555f-008c-2a90-f959a6d2fcda	Besedilo-read	Besedilo - branje	f
00030000-555f-008c-aff5-31bb6cc4389d	Besedilo-write	Besedilo - spreminjanje	f
00030000-555f-008c-8e49-334c40677020	DogodekIzven-read	DogodekIzven - branje	f
00030000-555f-008c-2454-13177353fd41	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-555f-008c-284f-5a0a15197205	Dogodek-read	Dogodek - branje	f
00030000-555f-008c-2029-b2f79ef26cee	Dogodek-write	Dogodek - spreminjanje	f
00030000-555f-008c-eb25-2601dab52aa1	Drzava-read	Drzava - branje	f
00030000-555f-008c-6935-6c391a55ddfe	Drzava-write	Drzava - spreminjanje	f
00030000-555f-008c-db57-beb2e5cb07de	Funkcija-read	Funkcija - branje	f
00030000-555f-008c-ace1-52ce27a79b39	Funkcija-write	Funkcija - spreminjanje	f
00030000-555f-008c-5903-3d87051c4352	Gostovanje-read	Gostovanje - branje	f
00030000-555f-008c-d1da-2abb2cfcb200	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-555f-008c-fbc7-6952a51cbb2a	Gostujoca-read	Gostujoca - branje	f
00030000-555f-008c-e7d1-a7d0748f1f48	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-555f-008c-6c80-e5478843f8b6	Kupec-read	Kupec - branje	f
00030000-555f-008c-c05e-a50bdee68a23	Kupec-write	Kupec - spreminjanje	f
00030000-555f-008c-fe54-ae2217d0b1f6	NacinPlacina-read	NacinPlacina - branje	f
00030000-555f-008c-99e8-ca3d91c5265a	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-555f-008c-fdf6-9e43a8ad953a	Option-read	Option - branje	f
00030000-555f-008c-3330-8475f0c4708a	Option-write	Option - spreminjanje	f
00030000-555f-008c-4882-0f82419ac76f	OptionValue-read	OptionValue - branje	f
00030000-555f-008c-7011-2ba7b3ccf9bc	OptionValue-write	OptionValue - spreminjanje	f
00030000-555f-008c-19d1-4a715f094bb1	Oseba-read	Oseba - branje	f
00030000-555f-008c-a048-375d5f51153f	Oseba-write	Oseba - spreminjanje	f
00030000-555f-008c-dd21-31090e451b9f	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-555f-008c-347b-1e3b7a6d1306	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-555f-008c-1eea-587337299b6a	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-555f-008c-d97c-4cadc2f4de10	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-555f-008c-928b-4f45b10a6f3a	Pogodba-read	Pogodba - branje	f
00030000-555f-008c-10a8-8d5950778616	Pogodba-write	Pogodba - spreminjanje	f
00030000-555f-008c-f64f-4b4cfe9c9784	Popa-read	Popa - branje	f
00030000-555f-008c-6d4b-0423b8c5d3a2	Popa-write	Popa - spreminjanje	f
00030000-555f-008c-7ef0-4745d0d677fc	Posta-read	Posta - branje	f
00030000-555f-008c-b268-285ed5a5093d	Posta-write	Posta - spreminjanje	f
00030000-555f-008c-46b3-1eab2fe5ed1f	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-555f-008c-7848-8057556c2e4e	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-555f-008c-4eae-fe2bf1e50664	PostniNaslov-read	PostniNaslov - branje	f
00030000-555f-008c-726f-7fcebda87e81	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-555f-008c-4239-923a4d7520ca	Predstava-read	Predstava - branje	f
00030000-555f-008c-a649-6e3be4588f12	Predstava-write	Predstava - spreminjanje	f
00030000-555f-008c-28e9-fcaf0118a9ed	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-555f-008c-986b-6181d87a255e	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-555f-008c-eb28-f5a641d42724	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-555f-008c-d224-6647e35b55df	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-555f-008c-f291-3ddcc5293fcc	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-555f-008c-48ba-d31519775b4f	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-555f-008c-ffbf-ca11881c594e	Prostor-read	Prostor - branje	f
00030000-555f-008c-5974-0f3f91703957	Prostor-write	Prostor - spreminjanje	f
00030000-555f-008c-ffb3-57cfd12d0daf	Racun-read	Racun - branje	f
00030000-555f-008c-2a13-9839b299aa7a	Racun-write	Racun - spreminjanje	f
00030000-555f-008c-cc23-2cb9afeada19	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-555f-008c-db82-e335f3acf500	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-555f-008c-74e0-d70db2d4b888	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-555f-008c-37c5-1ba7ca0c9415	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-555f-008c-7fab-4c7c79a7b950	Rekvizit-read	Rekvizit - branje	f
00030000-555f-008c-f401-1ae4414c23e5	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-555f-008c-7ed8-0608c238169e	Rezervacija-read	Rezervacija - branje	f
00030000-555f-008c-977c-3027a3dde89b	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-555f-008c-199c-8b3dfd47cd31	SedezniRed-read	SedezniRed - branje	f
00030000-555f-008c-89c6-9832447d3695	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-555f-008c-350b-3ea154033af0	Sedez-read	Sedez - branje	f
00030000-555f-008c-6f90-c3abedc8e9cb	Sedez-write	Sedez - spreminjanje	f
00030000-555f-008c-2d9f-02856fae8ddd	Sezona-read	Sezona - branje	f
00030000-555f-008c-59f9-533e7a855827	Sezona-write	Sezona - spreminjanje	f
00030000-555f-008c-29d7-b48126de2df8	Telefonska-read	Telefonska - branje	f
00030000-555f-008c-2f5d-52b171b9256f	Telefonska-write	Telefonska - spreminjanje	f
00030000-555f-008c-dfce-181d672cce39	TerminStoritve-read	TerminStoritve - branje	f
00030000-555f-008c-a247-f464a8394938	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-555f-008c-d41d-aaf1e9edb63d	TipFunkcije-read	TipFunkcije - branje	f
00030000-555f-008c-bcbb-93932f59ceaf	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-555f-008c-440b-0488c3c714a6	Trr-read	Trr - branje	f
00030000-555f-008c-a67d-b26bab9e9dc8	Trr-write	Trr - spreminjanje	f
00030000-555f-008c-764e-23da56f262f1	Uprizoritev-read	Uprizoritev - branje	f
00030000-555f-008c-01c1-5d64179e04aa	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-555f-008c-d935-10c500b2399d	Vaja-read	Vaja - branje	f
00030000-555f-008c-81a5-f4528e602835	Vaja-write	Vaja - spreminjanje	f
00030000-555f-008c-f591-0ee29b6118b9	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-555f-008c-8a6b-82d98bf766f2	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-555f-008c-61ad-da5ee9bfa198	Zaposlitev-read	Zaposlitev - branje	f
00030000-555f-008c-3ab1-7b0d9b9ed65e	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-555f-008c-2a7b-9914ac19db03	Zasedenost-read	Zasedenost - branje	f
00030000-555f-008c-9374-b1455aaaaf76	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-555f-008c-fb21-67fba5f7578b	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-555f-008c-5bc7-842021424f86	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-555f-008c-da59-d8969bd9af18	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-555f-008c-ca6a-139daa2a3033	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2631 (class 0 OID 4656940)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-555f-008c-c744-26874042d311	00030000-555f-008c-eb25-2601dab52aa1
00020000-555f-008c-d734-e2e0514bf6b7	00030000-555f-008c-6935-6c391a55ddfe
00020000-555f-008c-d734-e2e0514bf6b7	00030000-555f-008c-eb25-2601dab52aa1
\.


--
-- TOC entry 2659 (class 0 OID 4657222)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 4657252)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 4657365)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2636 (class 0 OID 4656997)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 4657038)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-555f-008c-6351-1c9ddee5e20f	8341	Adlešiči
00050000-555f-008c-057f-5513cffa2e34	5270	Ajdovščina
00050000-555f-008c-e700-e9616d09757b	6280	Ankaran/Ancarano
00050000-555f-008c-0431-dff0a33d128f	9253	Apače
00050000-555f-008c-054c-b41215872d5e	8253	Artiče
00050000-555f-008c-74db-dbe51af25e44	4275	Begunje na Gorenjskem
00050000-555f-008c-6923-6922af4881f2	1382	Begunje pri Cerknici
00050000-555f-008c-a2a1-0ee41d59f2bd	9231	Beltinci
00050000-555f-008c-ba67-fe282d030631	2234	Benedikt
00050000-555f-008c-a7e0-7f99f362d935	2345	Bistrica ob Dravi
00050000-555f-008c-fbc7-8f1541ea378a	3256	Bistrica ob Sotli
00050000-555f-008c-9fd5-319b0e1a99b6	8259	Bizeljsko
00050000-555f-008c-01ed-2cf5f5048167	1223	Blagovica
00050000-555f-008c-e08f-29e4abfdc227	8283	Blanca
00050000-555f-008c-4951-d4c77aa50e88	4260	Bled
00050000-555f-008c-492b-f9dd126bbafa	4273	Blejska Dobrava
00050000-555f-008c-352e-138c3835e348	9265	Bodonci
00050000-555f-008c-1b52-c67ad32ce4f0	9222	Bogojina
00050000-555f-008c-3103-c5bdcfc02fc8	4263	Bohinjska Bela
00050000-555f-008c-2ce7-ec5acf95447f	4264	Bohinjska Bistrica
00050000-555f-008c-9c5c-e1a648355902	4265	Bohinjsko jezero
00050000-555f-008c-c239-b43b96871b45	1353	Borovnica
00050000-555f-008c-ddd9-6a931ac8a4b4	8294	Boštanj
00050000-555f-008c-e8fb-6c7d49aed763	5230	Bovec
00050000-555f-008c-58d9-d2982990fa2f	5295	Branik
00050000-555f-008c-5c4d-da91f95de714	3314	Braslovče
00050000-555f-008c-236e-9b413f1bd36a	5223	Breginj
00050000-555f-008c-d0cd-99778110bdce	8280	Brestanica
00050000-555f-008c-c2aa-a1dc7a5922d5	2354	Bresternica
00050000-555f-008c-95af-80c87f849d4c	4243	Brezje
00050000-555f-008c-2ff8-efc1f2b7eee8	1351	Brezovica pri Ljubljani
00050000-555f-008c-5173-cdc7c01b5d5d	8250	Brežice
00050000-555f-008c-b11b-934e90c7fd70	4210	Brnik - Aerodrom
00050000-555f-008c-a67c-69220933eef7	8321	Brusnice
00050000-555f-008c-ecc6-4ecc62335fdd	3255	Buče
00050000-555f-008c-6e16-7f6d2d1ec511	8276	Bučka 
00050000-555f-008c-ef70-5ca510e45257	9261	Cankova
00050000-555f-008c-b6a7-120d110bc272	3000	Celje 
00050000-555f-008c-fe30-59a8ba44410a	3001	Celje - poštni predali
00050000-555f-008c-9ad4-c1fdfa73812b	4207	Cerklje na Gorenjskem
00050000-555f-008c-3e21-db7d24a3e4ba	8263	Cerklje ob Krki
00050000-555f-008c-84f8-f9b68f0fce9d	1380	Cerknica
00050000-555f-008c-810e-d721802d7a10	5282	Cerkno
00050000-555f-008c-545d-617250ac25d1	2236	Cerkvenjak
00050000-555f-008c-5339-de76d727dc24	2215	Ceršak
00050000-555f-008c-6cf9-0e8ef839898b	2326	Cirkovce
00050000-555f-008c-e7d5-d4a91ceb6ec3	2282	Cirkulane
00050000-555f-008c-70da-08e86cd8d8b2	5273	Col
00050000-555f-008c-1445-a44d2d583121	8251	Čatež ob Savi
00050000-555f-008c-e6e3-a21200bc3733	1413	Čemšenik
00050000-555f-008c-5cd9-9ec7a57fc744	5253	Čepovan
00050000-555f-008c-ae48-c334bc618570	9232	Črenšovci
00050000-555f-008c-4520-d9209cb83968	2393	Črna na Koroškem
00050000-555f-008c-6db9-213c992b6552	6275	Črni Kal
00050000-555f-008c-769f-64cc66179707	5274	Črni Vrh nad Idrijo
00050000-555f-008c-feb3-2bb87ba6cf81	5262	Črniče
00050000-555f-008c-3cf7-9d9bdfc4cc5b	8340	Črnomelj
00050000-555f-008c-3833-5294fb19f5c2	6271	Dekani
00050000-555f-008c-0216-79aba75458eb	5210	Deskle
00050000-555f-008c-d9a9-0c04f8a6d4a5	2253	Destrnik
00050000-555f-008c-84d5-6fcfa0e3cb5d	6215	Divača
00050000-555f-008c-eddb-90732f92f9c3	1233	Dob
00050000-555f-008c-dfcc-f989c3b47ab3	3224	Dobje pri Planini
00050000-555f-008c-f423-055eb451cbf8	8257	Dobova
00050000-555f-008c-4398-6313abecffca	1423	Dobovec
00050000-555f-008c-d22a-98a15d9d0a1f	5263	Dobravlje
00050000-555f-008c-8321-651f91d44316	3204	Dobrna
00050000-555f-008c-093c-51bc21dc99a9	8211	Dobrnič
00050000-555f-008c-f88b-90f0355f7635	1356	Dobrova
00050000-555f-008c-d767-8aba7bbc1e87	9223	Dobrovnik/Dobronak 
00050000-555f-008c-368e-3a6d5b2a42a1	5212	Dobrovo v Brdih
00050000-555f-008c-d7df-25728a9c54a9	1431	Dol pri Hrastniku
00050000-555f-008c-ff23-b1b0c697b66b	1262	Dol pri Ljubljani
00050000-555f-008c-7118-1bac572b7100	1273	Dole pri Litiji
00050000-555f-008c-859b-acbbba095e92	1331	Dolenja vas
00050000-555f-008c-4f1a-cbc7200eb55c	8350	Dolenjske Toplice
00050000-555f-008c-4964-1b88a05910d2	1230	Domžale
00050000-555f-008c-4647-e83233eb90a5	2252	Dornava
00050000-555f-008c-242d-5bcf02584b8e	5294	Dornberk
00050000-555f-008c-f703-9c3b0e6e63da	1319	Draga
00050000-555f-008c-f251-436d019b8de4	8343	Dragatuš
00050000-555f-008c-3cf3-bb9df5578b7f	3222	Dramlje
00050000-555f-008c-0751-64a2b1346908	2370	Dravograd
00050000-555f-008c-12af-48a4eaad8745	4203	Duplje
00050000-555f-008c-04e5-f19b6ef62d4f	6221	Dutovlje
00050000-555f-008c-090a-908a0af92b65	8361	Dvor
00050000-555f-008c-15b7-828f428fa0f6	2343	Fala
00050000-555f-008c-dd89-6653a9be8ecf	9208	Fokovci
00050000-555f-008c-f4c4-4edc13518dc1	2313	Fram
00050000-555f-008c-22d3-33802a8b2643	3213	Frankolovo
00050000-555f-008c-edaa-769f16209faa	1274	Gabrovka
00050000-555f-008c-bb8e-b2127d608489	8254	Globoko
00050000-555f-008c-0892-bad25d9e08e1	5275	Godovič
00050000-555f-008c-f823-0810e90474c1	4204	Golnik
00050000-555f-008c-be9f-1f87282ac922	3303	Gomilsko
00050000-555f-008c-aeeb-9acd3590bc2b	4224	Gorenja vas
00050000-555f-008c-503c-63fd86d51b06	3263	Gorica pri Slivnici
00050000-555f-008c-99bd-0d49195a2b13	2272	Gorišnica
00050000-555f-008c-665d-1183a817df9d	9250	Gornja Radgona
00050000-555f-008c-4997-afc3d435c1a3	3342	Gornji Grad
00050000-555f-008c-ba5f-23cd72445d95	4282	Gozd Martuljek
00050000-555f-008c-eb06-3cfdf308b834	6272	Gračišče
00050000-555f-008c-8fa7-f59c2966c87f	9264	Grad
00050000-555f-008c-6353-f31227a6ad91	8332	Gradac
00050000-555f-008c-a2fe-adf7e2e3f68f	1384	Grahovo
00050000-555f-008c-c25f-354dc540a29f	5242	Grahovo ob Bači
00050000-555f-008c-80e5-d020098b5e8d	5251	Grgar
00050000-555f-008c-ab71-09745d7dd72c	3302	Griže
00050000-555f-008c-bd0a-4a22fefc77d3	3231	Grobelno
00050000-555f-008c-639d-6146631c4f44	1290	Grosuplje
00050000-555f-008c-8d59-534a6a31a054	2288	Hajdina
00050000-555f-008c-ccac-dbb56d8fe8c1	8362	Hinje
00050000-555f-008c-da0b-a1bfe302fac4	2311	Hoče
00050000-555f-008c-776b-e8d70b16d44a	9205	Hodoš/Hodos
00050000-555f-008c-aef1-573b9536a132	1354	Horjul
00050000-555f-008c-1ebd-a3e8a5513fea	1372	Hotedršica
00050000-555f-008c-5075-9ca3697735ac	1430	Hrastnik
00050000-555f-008c-7578-619ceac9bdb7	6225	Hruševje
00050000-555f-008c-bf23-909bb62b3e54	4276	Hrušica
00050000-555f-008c-9c51-6592601dd559	5280	Idrija
00050000-555f-008c-6b84-384569f3622b	1292	Ig
00050000-555f-008c-bd24-bd20e2449145	6250	Ilirska Bistrica
00050000-555f-008c-de77-21cfb77eed6f	6251	Ilirska Bistrica-Trnovo
00050000-555f-008c-ae68-41a6d6e61c10	1295	Ivančna Gorica
00050000-555f-008c-88db-3a406ca866c8	2259	Ivanjkovci
00050000-555f-008c-effe-7b1f9b3b7040	1411	Izlake
00050000-555f-008c-9e5f-d679714a8a62	6310	Izola/Isola
00050000-555f-008c-db07-f50f349932f8	2222	Jakobski Dol
00050000-555f-008c-f963-c5be21e5b6b8	2221	Jarenina
00050000-555f-008c-f5c7-1f80cd728053	6254	Jelšane
00050000-555f-008c-dc4a-616ab95d6d76	4270	Jesenice
00050000-555f-008c-d8bd-3daf161a2073	8261	Jesenice na Dolenjskem
00050000-555f-008c-f76f-41e70c4dcd97	3273	Jurklošter
00050000-555f-008c-3053-c2bbf23ab70e	2223	Jurovski Dol
00050000-555f-008c-38a6-4b6210c8178c	2256	Juršinci
00050000-555f-008c-13c6-2414d1d6c211	5214	Kal nad Kanalom
00050000-555f-008c-d560-3271fe5374ed	3233	Kalobje
00050000-555f-008c-d783-1187c8d77913	4246	Kamna Gorica
00050000-555f-008c-adea-302645c3ba5e	2351	Kamnica
00050000-555f-008c-5e77-ab752c1089e5	1241	Kamnik
00050000-555f-008c-553a-ffcf359e9460	5213	Kanal
00050000-555f-008c-2731-eee41993b021	8258	Kapele
00050000-555f-008c-7b65-50dc77906010	2362	Kapla
00050000-555f-008c-67d6-6b0969dcec3d	2325	Kidričevo
00050000-555f-008c-fb8d-3dcd3cf6c162	1412	Kisovec
00050000-555f-008c-5886-47f4b7cba1d4	6253	Knežak
00050000-555f-008c-c31b-26435dac4d28	5222	Kobarid
00050000-555f-008c-adb3-7eed8720bcbf	9227	Kobilje
00050000-555f-008c-eeec-452fdf764bb7	1330	Kočevje
00050000-555f-008c-edf2-86cef7163cdb	1338	Kočevska Reka
00050000-555f-008c-13bb-9490f8903660	2276	Kog
00050000-555f-008c-14f0-b4a3643509dd	5211	Kojsko
00050000-555f-008c-2991-02db0ae27522	6223	Komen
00050000-555f-008c-9be9-c1e23d29f979	1218	Komenda
00050000-555f-008c-853f-149453f17610	6000	Koper/Capodistria 
00050000-555f-008c-43fb-5c42f60811e3	6001	Koper/Capodistria - poštni predali
00050000-555f-008c-af66-8de3f9ebdbe0	8282	Koprivnica
00050000-555f-008c-e2c6-0a118846ea19	5296	Kostanjevica na Krasu
00050000-555f-008c-6152-6714c05fbd29	8311	Kostanjevica na Krki
00050000-555f-008c-affe-0aedab3cac63	1336	Kostel
00050000-555f-008c-caf4-2837871955cb	6256	Košana
00050000-555f-008c-7ae0-a28e7a894ee4	2394	Kotlje
00050000-555f-008c-7340-95d67d195c70	6240	Kozina
00050000-555f-008c-725e-9f0c7dd3d653	3260	Kozje
00050000-555f-008c-7942-e2adde9ad9e4	4000	Kranj 
00050000-555f-008c-44c5-962a5497cf3d	4001	Kranj - poštni predali
00050000-555f-008c-4ef1-e639892d1caa	4280	Kranjska Gora
00050000-555f-008c-5b3e-c45fabd872fb	1281	Kresnice
00050000-555f-008c-f36f-ddd0f5e9939b	4294	Križe
00050000-555f-008c-2adc-f307f1ac083e	9206	Križevci
00050000-555f-008c-52cc-e698855b3fcc	9242	Križevci pri Ljutomeru
00050000-555f-008c-9b3b-eb478ee2ca47	1301	Krka
00050000-555f-008c-cfa1-3626c4f259ad	8296	Krmelj
00050000-555f-008c-971a-c5a922db6e8c	4245	Kropa
00050000-555f-008c-4eb4-79bebeea90d7	8262	Krška vas
00050000-555f-008c-6b94-5e5a2c19894b	8270	Krško
00050000-555f-008c-3a72-a7e253d9f218	9263	Kuzma
00050000-555f-008c-d5b3-c0ff1f107e06	2318	Laporje
00050000-555f-008c-b579-510842ae07b5	3270	Laško
00050000-555f-008c-b4f6-8e095a36ff03	1219	Laze v Tuhinju
00050000-555f-008c-a7e2-df5937c0e2a9	2230	Lenart v Slovenskih goricah
00050000-555f-008c-58dd-cbb1f1778b1b	9220	Lendava/Lendva
00050000-555f-008c-f176-20190b0da14c	4248	Lesce
00050000-555f-008c-13ef-f360e63c2e20	3261	Lesično
00050000-555f-008c-349d-b349b42de971	8273	Leskovec pri Krškem
00050000-555f-008c-8782-81b604b0dd40	2372	Libeliče
00050000-555f-008c-ed89-2b3d961386af	2341	Limbuš
00050000-555f-008c-188a-a32d22e3e252	1270	Litija
00050000-555f-008c-b392-2de0933fc16f	3202	Ljubečna
00050000-555f-008c-5ba0-5496342e99b6	1000	Ljubljana 
00050000-555f-008c-40f2-99f262d93f78	1001	Ljubljana - poštni predali
00050000-555f-008c-b531-8ae734ec9526	1231	Ljubljana - Črnuče
00050000-555f-008c-a5c0-c0e67d65f56e	1261	Ljubljana - Dobrunje
00050000-555f-008c-7dc0-e573ece09448	1260	Ljubljana - Polje
00050000-555f-008c-e8e0-e761830eb221	1210	Ljubljana - Šentvid
00050000-555f-008c-ed2d-35c7ac60a563	1211	Ljubljana - Šmartno
00050000-555f-008c-1c3c-0dd11f2851c2	3333	Ljubno ob Savinji
00050000-555f-008c-f886-cc8afdf42595	9240	Ljutomer
00050000-555f-008c-7d79-409e81343b89	3215	Loče
00050000-555f-008c-2328-9887e8ee9335	5231	Log pod Mangartom
00050000-555f-008c-d2c7-b28353df6f2d	1358	Log pri Brezovici
00050000-555f-008c-428b-494fdad21e26	1370	Logatec
00050000-555f-008c-3bed-1af1944ad6dc	1371	Logatec
00050000-555f-008c-6bfc-9c63777684aa	1434	Loka pri Zidanem Mostu
00050000-555f-008c-a378-2f125de2c9a7	3223	Loka pri Žusmu
00050000-555f-008c-59af-e73ae2ff3ba9	6219	Lokev
00050000-555f-008c-b34e-4bda15db06ca	1318	Loški Potok
00050000-555f-008c-c26f-aa5931773aa2	2324	Lovrenc na Dravskem polju
00050000-555f-008c-9c21-0c279ccccce6	2344	Lovrenc na Pohorju
00050000-555f-008c-9b45-9ceadb145f95	3334	Luče
00050000-555f-008c-17c7-c1cf0fea0a92	1225	Lukovica
00050000-555f-008c-abe6-1e078d7e3211	9202	Mačkovci
00050000-555f-008c-3fd4-8efc4b9ea60c	2322	Majšperk
00050000-555f-008c-1016-efdea7c10cb6	2321	Makole
00050000-555f-008c-2d97-81e0a66d95bf	9243	Mala Nedelja
00050000-555f-008c-a021-67d410b2d013	2229	Malečnik
00050000-555f-008c-8a08-96ab76dacbed	6273	Marezige
00050000-555f-008c-d577-5558df724f19	2000	Maribor 
00050000-555f-008c-a827-519a303686d5	2001	Maribor - poštni predali
00050000-555f-008c-b596-903c2319fa42	2206	Marjeta na Dravskem polju
00050000-555f-008c-f78d-05f5ab55d9b1	2281	Markovci
00050000-555f-008c-427c-722f75315460	9221	Martjanci
00050000-555f-008c-caa5-d038439784aa	6242	Materija
00050000-555f-008c-3933-6e11bdc71f28	4211	Mavčiče
00050000-555f-008c-55ef-e8819f9b4480	1215	Medvode
00050000-555f-008c-e65e-6792332e2777	1234	Mengeš
00050000-555f-008c-b5e0-325b4b8598f9	8330	Metlika
00050000-555f-008c-a538-06999d182460	2392	Mežica
00050000-555f-008c-0bc0-22be6f3cacad	2204	Miklavž na Dravskem polju
00050000-555f-008c-3c71-a37de9e124a4	2275	Miklavž pri Ormožu
00050000-555f-008c-0082-d58375736bb7	5291	Miren
00050000-555f-008c-3b48-4209ae17bacd	8233	Mirna
00050000-555f-008c-a8fc-9c4d24284af6	8216	Mirna Peč
00050000-555f-008c-79bd-23968c76c17e	2382	Mislinja
00050000-555f-008c-1558-6c2ff20c4a8c	4281	Mojstrana
00050000-555f-008c-f4ea-4146e729075c	8230	Mokronog
00050000-555f-008c-08aa-829e23218407	1251	Moravče
00050000-555f-008c-1ee3-65daf956d833	9226	Moravske Toplice
00050000-555f-008c-2d9d-ca1a2be7b8dd	5216	Most na Soči
00050000-555f-008c-1cec-d4ac5dc6794c	1221	Motnik
00050000-555f-008c-64c9-d0fd98a36430	3330	Mozirje
00050000-555f-008c-df56-3a8ce3006ab6	9000	Murska Sobota 
00050000-555f-008c-49c6-dcae58263289	9001	Murska Sobota - poštni predali
00050000-555f-008c-08bd-d2fed960520f	2366	Muta
00050000-555f-008c-9358-36a1570bcc3c	4202	Naklo
00050000-555f-008c-864e-fe100ad95817	3331	Nazarje
00050000-555f-008c-bca8-027f76c998f2	1357	Notranje Gorice
00050000-555f-008c-6db2-64ae0c805577	3203	Nova Cerkev
00050000-555f-008c-f663-c4a8e3179761	5000	Nova Gorica 
00050000-555f-008c-e5e6-59a1e33374de	5001	Nova Gorica - poštni predali
00050000-555f-008c-0516-55290bbbb701	1385	Nova vas
00050000-555f-008c-c969-822ccc41ed22	8000	Novo mesto
00050000-555f-008c-79f4-0990127881d5	8001	Novo mesto - poštni predali
00050000-555f-008c-a2c9-6a4c4b68b6d8	6243	Obrov
00050000-555f-008c-7c82-e1b315d324d7	9233	Odranci
00050000-555f-008c-5add-8fced36f614f	2317	Oplotnica
00050000-555f-008c-5e31-de00dffe0e86	2312	Orehova vas
00050000-555f-008c-3da6-234cabd47d7b	2270	Ormož
00050000-555f-008c-5551-2b6d3eee1ede	1316	Ortnek
00050000-555f-008c-ff4d-53a74e33976b	1337	Osilnica
00050000-555f-008c-bfa5-c4164123d75d	8222	Otočec
00050000-555f-008c-ce5a-f7de920691c5	2361	Ožbalt
00050000-555f-008c-2be0-776c96c04039	2231	Pernica
00050000-555f-008c-b5fa-1a518d8b49a5	2211	Pesnica pri Mariboru
00050000-555f-008c-12a9-ca76b2379d4b	9203	Petrovci
00050000-555f-008c-bede-2896f8a1e28c	3301	Petrovče
00050000-555f-008c-0751-4baa74f81ba6	6330	Piran/Pirano
00050000-555f-008c-4fd1-61e3d3fdfa8d	8255	Pišece
00050000-555f-008c-3c5c-3275b0d9dbfd	6257	Pivka
00050000-555f-008c-f565-241a00e9be2b	6232	Planina
00050000-555f-008c-7e01-60ef6f430112	3225	Planina pri Sevnici
00050000-555f-008c-d75a-5db518dfca6e	6276	Pobegi
00050000-555f-008c-3af7-a1413c373ed4	8312	Podbočje
00050000-555f-008c-4573-217d73eb30e2	5243	Podbrdo
00050000-555f-008c-5391-09d8f191edfd	3254	Podčetrtek
00050000-555f-008c-df8a-c0b34c7e124e	2273	Podgorci
00050000-555f-008c-bf97-83c82e3b3099	6216	Podgorje
00050000-555f-008c-4c22-04dfd9a45ef4	2381	Podgorje pri Slovenj Gradcu
00050000-555f-008c-a923-07f13e8f083b	6244	Podgrad
00050000-555f-008c-3fab-eb764174f721	1414	Podkum
00050000-555f-008c-37bd-e783a91f719f	2286	Podlehnik
00050000-555f-008c-d3f6-a0522725ef07	5272	Podnanos
00050000-555f-008c-e998-543c8bfa9730	4244	Podnart
00050000-555f-008c-1305-17b85dda27f1	3241	Podplat
00050000-555f-008c-c866-9efd8a0dc1e9	3257	Podsreda
00050000-555f-008c-a5a8-ff6ccd6c1311	2363	Podvelka
00050000-555f-008c-0805-9de2f02df3e2	2208	Pohorje
00050000-555f-008c-988f-ae5d60318e3e	2257	Polenšak
00050000-555f-008c-548b-98d53d806880	1355	Polhov Gradec
00050000-555f-008c-5aed-cf8cead2ca16	4223	Poljane nad Škofjo Loko
00050000-555f-008c-f464-409314a20c4c	2319	Poljčane
00050000-555f-008c-a426-0b5d592bbcbd	1272	Polšnik
00050000-555f-008c-799f-eac747521a51	3313	Polzela
00050000-555f-008c-e87e-b205bd065c70	3232	Ponikva
00050000-555f-008c-c408-c381bc20a8d1	6320	Portorož/Portorose
00050000-555f-008c-fa1b-60e4da68b154	6230	Postojna
00050000-555f-008c-1e59-78eb5075d27f	2331	Pragersko
00050000-555f-008c-2ad4-c6fa62029a76	3312	Prebold
00050000-555f-008c-3050-0618865a35b2	4205	Preddvor
00050000-555f-008c-22ea-c559ff454746	6255	Prem
00050000-555f-008c-af8e-cc140d333ae7	1352	Preserje
00050000-555f-008c-f014-5fe376614c1c	6258	Prestranek
00050000-555f-008c-b8a3-08e86e35522e	2391	Prevalje
00050000-555f-008c-4788-320a79cfb98c	3262	Prevorje
00050000-555f-008c-6b4c-c4a14ced4fbf	1276	Primskovo 
00050000-555f-008c-2255-c6eb4f843819	3253	Pristava pri Mestinju
00050000-555f-008c-90a3-17b561a7aef3	9207	Prosenjakovci/Partosfalva
00050000-555f-008c-e1d4-f3a1d3b27960	5297	Prvačina
00050000-555f-008c-b937-e219fccf4180	2250	Ptuj
00050000-555f-008c-173e-6328cade1a04	2323	Ptujska Gora
00050000-555f-008c-2cdd-37f7e4b80d2b	9201	Puconci
00050000-555f-008c-6d0a-cf4532311756	2327	Rače
00050000-555f-008c-4713-ceb56eb9590b	1433	Radeče
00050000-555f-008c-31d5-14e9eee8d711	9252	Radenci
00050000-555f-008c-6c9c-9b1cd812a09b	2360	Radlje ob Dravi
00050000-555f-008c-ddc4-4f45a1b2d4da	1235	Radomlje
00050000-555f-008c-75ce-02a1baa345d7	4240	Radovljica
00050000-555f-008c-a095-c601af72daa3	8274	Raka
00050000-555f-008c-8cb6-cac948fbf738	1381	Rakek
00050000-555f-008c-65d8-6b304bc4face	4283	Rateče - Planica
00050000-555f-008c-060f-60e91aac7fec	2390	Ravne na Koroškem
00050000-555f-008c-7a3c-7f402cfe303b	9246	Razkrižje
00050000-555f-008c-7845-1cd73cc48eba	3332	Rečica ob Savinji
00050000-555f-008c-72a4-e4e0a364b86c	5292	Renče
00050000-555f-008c-7df6-a0e01643a6ae	1310	Ribnica
00050000-555f-008c-9d6e-a8015cf9d9b6	2364	Ribnica na Pohorju
00050000-555f-008c-8c8f-ce753808feab	3272	Rimske Toplice
00050000-555f-008c-d400-a7b35bcf10e8	1314	Rob
00050000-555f-008c-071e-42ef326f97b7	5215	Ročinj
00050000-555f-008c-7eec-a64ee1690afc	3250	Rogaška Slatina
00050000-555f-008c-e0d3-9ed78fd2468f	9262	Rogašovci
00050000-555f-008c-04eb-604836bf33c3	3252	Rogatec
00050000-555f-008c-4be3-70bec317c72b	1373	Rovte
00050000-555f-008c-0fae-2acc79764f1e	2342	Ruše
00050000-555f-008c-75cf-a2d959da8ee4	1282	Sava
00050000-555f-008c-9b08-81cccd47d61b	6333	Sečovlje/Sicciole
00050000-555f-008c-6835-c197038359d4	4227	Selca
00050000-555f-008c-ac7d-ff970dc7343c	2352	Selnica ob Dravi
00050000-555f-008c-4bc7-5289fd8eb079	8333	Semič
00050000-555f-008c-8b72-922a518db3a1	8281	Senovo
00050000-555f-008c-4a12-5130b37d4438	6224	Senožeče
00050000-555f-008c-62ba-c609e0c49b3d	8290	Sevnica
00050000-555f-008c-c8ee-902f676ef8a3	6210	Sežana
00050000-555f-008c-b2fe-7fba7e015d9c	2214	Sladki Vrh
00050000-555f-008c-6554-25f8597d4b24	5283	Slap ob Idrijci
00050000-555f-008c-42ae-d998949c349b	2380	Slovenj Gradec
00050000-555f-008c-9e86-23c46d8d17a9	2310	Slovenska Bistrica
00050000-555f-008c-f779-301db2aeea85	3210	Slovenske Konjice
00050000-555f-008c-b2ad-f92f72db262a	1216	Smlednik
00050000-555f-008c-c855-96b729df9caa	5232	Soča
00050000-555f-008c-580e-f28efa807aee	1317	Sodražica
00050000-555f-008c-52f1-72422b0133a5	3335	Solčava
00050000-555f-008c-a200-b9067450743b	5250	Solkan
00050000-555f-008c-3493-32580086e86d	4229	Sorica
00050000-555f-008c-e45e-676782c6c54e	4225	Sovodenj
00050000-555f-008c-1df0-64744cecae23	5281	Spodnja Idrija
00050000-555f-008c-e2b9-df162e0d19e7	2241	Spodnji Duplek
00050000-555f-008c-3a13-bdd5beb2287c	9245	Spodnji Ivanjci
00050000-555f-008c-37a2-9a26e41b56ef	2277	Središče ob Dravi
00050000-555f-008c-c514-91a057f0638d	4267	Srednja vas v Bohinju
00050000-555f-008c-0e22-896692705034	8256	Sromlje 
00050000-555f-008c-b298-902af814670e	5224	Srpenica
00050000-555f-008c-744c-6eba81bf8a0a	1242	Stahovica
00050000-555f-008c-185e-9849ba445d7e	1332	Stara Cerkev
00050000-555f-008c-2b35-d09ddc7bb6fa	8342	Stari trg ob Kolpi
00050000-555f-008c-35bc-a165b84520d8	1386	Stari trg pri Ložu
00050000-555f-008c-00cb-02d24caafb17	2205	Starše
00050000-555f-008c-52ae-b616b9b5b654	2289	Stoperce
00050000-555f-008c-dfac-2711f07a5a84	8322	Stopiče
00050000-555f-008c-05f2-82f21684fad1	3206	Stranice
00050000-555f-008c-39a0-1caff1315589	8351	Straža
00050000-555f-008c-073c-56a6b13eeed4	1313	Struge
00050000-555f-008c-978f-6bd987eed12f	8293	Studenec
00050000-555f-008c-6b0a-93db8d0f8f34	8331	Suhor
00050000-555f-008c-ab18-dd5992b5e1bc	2233	Sv. Ana v Slovenskih goricah
00050000-555f-008c-1e46-12edd5b8c154	2235	Sv. Trojica v Slovenskih goricah
00050000-555f-008c-6414-8f577033aebb	2353	Sveti Duh na Ostrem Vrhu
00050000-555f-008c-3881-3de4a5075372	9244	Sveti Jurij ob Ščavnici
00050000-555f-008c-eb0c-c53c75cecbd0	3264	Sveti Štefan
00050000-555f-008c-166f-a6ab2b7b811a	2258	Sveti Tomaž
00050000-555f-008c-7e55-6e9f3ffc01e5	9204	Šalovci
00050000-555f-008c-c8f4-92710eadbe18	5261	Šempas
00050000-555f-008c-7079-ef9a524c17c2	5290	Šempeter pri Gorici
00050000-555f-008c-45c6-533a5935f1f4	3311	Šempeter v Savinjski dolini
00050000-555f-008c-fd45-fbd27f137f17	4208	Šenčur
00050000-555f-008c-e36d-fdb4e18b1907	2212	Šentilj v Slovenskih goricah
00050000-555f-008c-a53e-3c13cbe27418	8297	Šentjanž
00050000-555f-008c-fa03-b2960139fb13	2373	Šentjanž pri Dravogradu
00050000-555f-008c-2916-4d3e2ba11958	8310	Šentjernej
00050000-555f-008c-58cb-c56346fc7762	3230	Šentjur
00050000-555f-008c-0c51-e5dfce14e4d8	3271	Šentrupert
00050000-555f-008c-91bb-2213118b54f1	8232	Šentrupert
00050000-555f-008c-91da-7bd841cd98a1	1296	Šentvid pri Stični
00050000-555f-008c-f6a0-d58d03d1113d	8275	Škocjan
00050000-555f-008c-703e-1bd716bee33f	6281	Škofije
00050000-555f-008c-a4d6-02d80c710915	4220	Škofja Loka
00050000-555f-008c-229b-3b32f78f7de2	3211	Škofja vas
00050000-555f-008c-cc9c-77443a85f16e	1291	Škofljica
00050000-555f-008c-9432-82d96744c647	6274	Šmarje
00050000-555f-008c-3545-984de440949d	1293	Šmarje - Sap
00050000-555f-008c-244a-9edf9932d598	3240	Šmarje pri Jelšah
00050000-555f-008c-4cd3-4e0251144f4b	8220	Šmarješke Toplice
00050000-555f-008c-10f1-039c3f1b61a8	2315	Šmartno na Pohorju
00050000-555f-008c-7c63-d429a1e9eb1d	3341	Šmartno ob Dreti
00050000-555f-008c-b1c0-04b5565c616b	3327	Šmartno ob Paki
00050000-555f-008c-98f8-d8c9921f60f8	1275	Šmartno pri Litiji
00050000-555f-008c-1cbf-c46b3c2d77a5	2383	Šmartno pri Slovenj Gradcu
00050000-555f-008c-8660-dce6e2e8982d	3201	Šmartno v Rožni dolini
00050000-555f-008c-a11c-e46c1b9204a7	3325	Šoštanj
00050000-555f-008c-dc02-c7259353a21c	6222	Štanjel
00050000-555f-008c-7307-3ba1812f4563	3220	Štore
00050000-555f-008c-1f1c-ffb300aeb044	3304	Tabor
00050000-555f-008c-3bd8-de8fae4c0c90	3221	Teharje
00050000-555f-008c-e047-ab0f12f8bbcf	9251	Tišina
00050000-555f-008c-cc84-77d7fcb3e026	5220	Tolmin
00050000-555f-008c-3457-5886acfdac90	3326	Topolšica
00050000-555f-008c-4435-72d009f83847	2371	Trbonje
00050000-555f-008c-eb05-d4c1a947928b	1420	Trbovlje
00050000-555f-008c-efe5-5971db5a8a98	8231	Trebelno 
00050000-555f-008c-b7d1-1223d2fb3333	8210	Trebnje
00050000-555f-008c-53d8-fcc5dc3ef3ba	5252	Trnovo pri Gorici
00050000-555f-008c-a46e-9d6d6f3ff9a9	2254	Trnovska vas
00050000-555f-008c-314b-767f6d640045	1222	Trojane
00050000-555f-008c-be45-c971891f2445	1236	Trzin
00050000-555f-008c-4229-7dbe87aef911	4290	Tržič
00050000-555f-008c-4941-5499836a25aa	8295	Tržišče
00050000-555f-008c-b8fc-402218a78799	1311	Turjak
00050000-555f-008c-0bba-41eb07660ed1	9224	Turnišče
00050000-555f-008c-a6b5-b74f64059205	8323	Uršna sela
00050000-555f-008c-3d52-c6ab65d6cb78	1252	Vače
00050000-555f-008c-9e1e-c8f70b2c2159	3320	Velenje 
00050000-555f-008c-bb84-b6b85cc7908b	3322	Velenje - poštni predali
00050000-555f-008c-74fe-04ef030807b0	8212	Velika Loka
00050000-555f-008c-3d50-31709d9be43e	2274	Velika Nedelja
00050000-555f-008c-0cd4-f85d99a88de5	9225	Velika Polana
00050000-555f-008c-c30a-803d7b4909c9	1315	Velike Lašče
00050000-555f-008c-2143-b1d80c4c08c2	8213	Veliki Gaber
00050000-555f-008c-3878-df35491dda71	9241	Veržej
00050000-555f-008c-d197-17440718716a	1312	Videm - Dobrepolje
00050000-555f-008c-d138-aece6e90bb73	2284	Videm pri Ptuju
00050000-555f-008c-cf18-7f7567b7c355	8344	Vinica
00050000-555f-008c-c43e-1cbab59e49ab	5271	Vipava
00050000-555f-008c-c7fe-f403137bbd81	4212	Visoko
00050000-555f-008c-fa7c-9f48e9b9f8bb	1294	Višnja Gora
00050000-555f-008c-f54b-722271599f7b	3205	Vitanje
00050000-555f-008c-9831-1ea0cf3f6ac1	2255	Vitomarci
00050000-555f-008c-09ed-0ed5c0dd1f1d	1217	Vodice
00050000-555f-008c-d954-56ce9bff0c9d	3212	Vojnik\t
00050000-555f-008c-3dc0-974aa82bfdb7	5293	Volčja Draga
00050000-555f-008c-c67c-76a2829c39b6	2232	Voličina
00050000-555f-008c-d306-4c283a79d393	3305	Vransko
00050000-555f-008c-5e19-db06a39e2b22	6217	Vremski Britof
00050000-555f-008c-1892-9315bdaf5157	1360	Vrhnika
00050000-555f-008c-a18f-971f1a48d1b8	2365	Vuhred
00050000-555f-008c-c892-41a6b8d512f8	2367	Vuzenica
00050000-555f-008c-a25b-3c2cfbd4d84e	8292	Zabukovje 
00050000-555f-008c-7d4f-d3d3031cdb34	1410	Zagorje ob Savi
00050000-555f-008c-6247-e693069f1e9e	1303	Zagradec
00050000-555f-008c-b764-5b66a25bdaef	2283	Zavrč
00050000-555f-008c-890b-6165af92791f	8272	Zdole 
00050000-555f-008c-7cae-2bd075085fc3	4201	Zgornja Besnica
00050000-555f-008c-56fa-1d588227aa00	2242	Zgornja Korena
00050000-555f-008c-b5e9-e17b1289d046	2201	Zgornja Kungota
00050000-555f-008c-3271-8f8ddebc9f76	2316	Zgornja Ložnica
00050000-555f-008c-9092-b4cfb4957d12	2314	Zgornja Polskava
00050000-555f-008c-bf54-f0301d13a67f	2213	Zgornja Velka
00050000-555f-008c-ebc5-899dd31e1d26	4247	Zgornje Gorje
00050000-555f-008c-bd22-39ae1dde07e3	4206	Zgornje Jezersko
00050000-555f-008c-8b21-3a1899e759af	2285	Zgornji Leskovec
00050000-555f-008c-c3b6-da9a012aacea	1432	Zidani Most
00050000-555f-008c-192d-bdfa1cc35830	3214	Zreče
00050000-555f-008c-1796-6c67c442a665	4209	Žabnica
00050000-555f-008c-c073-9cba1fb3c075	3310	Žalec
00050000-555f-008c-2645-0972d20702b7	4228	Železniki
00050000-555f-008c-43e6-dc0fdf3a236b	2287	Žetale
00050000-555f-008c-9755-75c20d281090	4226	Žiri
00050000-555f-008c-671f-149ca085fe64	4274	Žirovnica
00050000-555f-008c-72b9-e0ccdb5d8cdc	8360	Žužemberk
\.


--
-- TOC entry 2655 (class 0 OID 4657196)
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
-- TOC entry 2638 (class 0 OID 4657024)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 4657089)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 4657208)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 4657314)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 4657358)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 4657237)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 4657181)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 4657171)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 4657348)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 4657304)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2626 (class 0 OID 4656892)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-555f-008c-45f1-20ff2fc23bb1	00010000-555f-008c-362b-1844f174f900	2015-05-22 12:10:21	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvFABk/iHUcemnWUx5UpvLNBXBs74RbW";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2687 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2662 (class 0 OID 4657246)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 4656930)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-555f-008c-b79e-1c9bac55304c	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-555f-008c-8720-17c0540b891a	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-555f-008c-c744-26874042d311	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-555f-008c-9d46-e3ab74a5ff21	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-555f-008c-08f1-96af160cc087	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-555f-008c-d734-e2e0514bf6b7	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2628 (class 0 OID 4656914)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-555f-008c-45f1-20ff2fc23bb1	00020000-555f-008c-9d46-e3ab74a5ff21
00010000-555f-008c-362b-1844f174f900	00020000-555f-008c-9d46-e3ab74a5ff21
\.


--
-- TOC entry 2664 (class 0 OID 4657260)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 4657202)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 4657152)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 4656989)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 4657158)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 4657337)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, imezenski, podrocje) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 4657058)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2627 (class 0 OID 4656901)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-555f-008c-362b-1844f174f900	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROToCgeuXxU/hn5mMsgmzBSY1xcCDi9f2	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-555f-008c-45f1-20ff2fc23bb1	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2676 (class 0 OID 4657390)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumzacstudija, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 4657104)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 4657229)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 4657296)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 4657136)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 4657380)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 4657286)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2270 (class 2606 OID 4656955)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 4657430)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 4657423)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 4657336)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 4657126)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 4657151)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2306 (class 2606 OID 4657084)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 4657282)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2317 (class 2606 OID 4657102)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 4657145)
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
-- TOC entry 2360 (class 2606 OID 4657194)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 4657221)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 4657056)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2274 (class 2606 OID 4656964)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 4657021)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2276 (class 2606 OID 4656987)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2268 (class 2606 OID 4656944)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2261 (class 2606 OID 4656929)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 4657227)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 4657259)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 4657375)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2284 (class 2606 OID 4657014)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2296 (class 2606 OID 4657044)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 4657200)
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
-- TOC entry 2294 (class 2606 OID 4657034)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2315 (class 2606 OID 4657093)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 4657212)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 4657320)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 4657363)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 4657244)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2358 (class 2606 OID 4657185)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 4657176)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 4657357)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 4657311)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2253 (class 2606 OID 4656900)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 4657250)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 4656918)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2263 (class 2606 OID 4656938)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 4657268)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 4657207)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 4657157)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2281 (class 2606 OID 4656994)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 4657167)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 4657347)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 4657069)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 4656913)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 4657405)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 4657111)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 4657235)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 4657302)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2334 (class 2606 OID 4657140)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 4657389)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 4657295)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2324 (class 1259 OID 4657133)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2282 (class 1259 OID 4657016)
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
-- TOC entry 2373 (class 1259 OID 4657228)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2367 (class 1259 OID 4657214)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2368 (class 1259 OID 4657213)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2319 (class 1259 OID 4657112)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2394 (class 1259 OID 4657285)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2395 (class 1259 OID 4657283)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2396 (class 1259 OID 4657284)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2419 (class 1259 OID 4657377)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2420 (class 1259 OID 4657378)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2421 (class 1259 OID 4657379)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2427 (class 1259 OID 4657408)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2428 (class 1259 OID 4657407)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2429 (class 1259 OID 4657406)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2301 (class 1259 OID 4657071)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2302 (class 1259 OID 4657070)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2286 (class 1259 OID 4657023)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2287 (class 1259 OID 4657022)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2382 (class 1259 OID 4657251)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2337 (class 1259 OID 4657146)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2265 (class 1259 OID 4656945)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2266 (class 1259 OID 4656946)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2387 (class 1259 OID 4657271)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2388 (class 1259 OID 4657270)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2389 (class 1259 OID 4657269)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2311 (class 1259 OID 4657094)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2312 (class 1259 OID 4657096)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2313 (class 1259 OID 4657095)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2347 (class 1259 OID 4657180)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2348 (class 1259 OID 4657178)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2349 (class 1259 OID 4657177)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2350 (class 1259 OID 4657179)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2256 (class 1259 OID 4656919)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2257 (class 1259 OID 4656920)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2376 (class 1259 OID 4657236)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2362 (class 1259 OID 4657201)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2402 (class 1259 OID 4657312)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2403 (class 1259 OID 4657313)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2290 (class 1259 OID 4657036)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 4657035)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2292 (class 1259 OID 4657037)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2406 (class 1259 OID 4657321)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2407 (class 1259 OID 4657322)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2438 (class 1259 OID 4657433)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2439 (class 1259 OID 4657432)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2440 (class 1259 OID 4657435)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2441 (class 1259 OID 4657431)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2442 (class 1259 OID 4657434)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2399 (class 1259 OID 4657303)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2353 (class 1259 OID 4657189)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2354 (class 1259 OID 4657188)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2355 (class 1259 OID 4657186)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2356 (class 1259 OID 4657187)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2243 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2434 (class 1259 OID 4657425)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2435 (class 1259 OID 4657424)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2318 (class 1259 OID 4657103)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2271 (class 1259 OID 4656966)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2272 (class 1259 OID 4656965)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2278 (class 1259 OID 4656995)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2279 (class 1259 OID 4656996)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2342 (class 1259 OID 4657170)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2343 (class 1259 OID 4657169)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2344 (class 1259 OID 4657168)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2325 (class 1259 OID 4657135)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2326 (class 1259 OID 4657131)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2327 (class 1259 OID 4657128)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2328 (class 1259 OID 4657129)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2329 (class 1259 OID 4657127)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2330 (class 1259 OID 4657132)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2331 (class 1259 OID 4657130)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2285 (class 1259 OID 4657015)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2307 (class 1259 OID 4657085)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2308 (class 1259 OID 4657087)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2309 (class 1259 OID 4657086)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2310 (class 1259 OID 4657088)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2361 (class 1259 OID 4657195)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2424 (class 1259 OID 4657376)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2277 (class 1259 OID 4656988)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2300 (class 1259 OID 4657057)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2381 (class 1259 OID 4657245)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2246 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2297 (class 1259 OID 4657045)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2418 (class 1259 OID 4657364)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2264 (class 1259 OID 4656939)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2332 (class 1259 OID 4657134)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2467 (class 2606 OID 4657566)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2470 (class 2606 OID 4657551)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2469 (class 2606 OID 4657556)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2465 (class 2606 OID 4657576)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2471 (class 2606 OID 4657546)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2466 (class 2606 OID 4657571)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2468 (class 2606 OID 4657561)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2452 (class 2606 OID 4657481)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2488 (class 2606 OID 4657661)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2486 (class 2606 OID 4657656)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2487 (class 2606 OID 4657651)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2464 (class 2606 OID 4657541)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2494 (class 2606 OID 4657701)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2496 (class 2606 OID 4657691)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2495 (class 2606 OID 4657696)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2484 (class 2606 OID 4657641)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2505 (class 2606 OID 4657736)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2504 (class 2606 OID 4657741)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2503 (class 2606 OID 4657746)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2506 (class 2606 OID 4657761)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2507 (class 2606 OID 4657756)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2508 (class 2606 OID 4657751)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2458 (class 2606 OID 4657516)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2459 (class 2606 OID 4657511)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 4657491)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 4657486)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2449 (class 2606 OID 4657466)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2490 (class 2606 OID 4657671)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2472 (class 2606 OID 4657581)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2446 (class 2606 OID 4657446)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2445 (class 2606 OID 4657451)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2491 (class 2606 OID 4657686)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2492 (class 2606 OID 4657681)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2493 (class 2606 OID 4657676)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2462 (class 2606 OID 4657521)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 4657531)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2461 (class 2606 OID 4657526)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2476 (class 2606 OID 4657616)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2478 (class 2606 OID 4657606)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2479 (class 2606 OID 4657601)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2477 (class 2606 OID 4657611)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2444 (class 2606 OID 4657436)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2443 (class 2606 OID 4657441)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2489 (class 2606 OID 4657666)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2485 (class 2606 OID 4657646)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2499 (class 2606 OID 4657711)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2498 (class 2606 OID 4657716)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2456 (class 2606 OID 4657501)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2457 (class 2606 OID 4657496)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2455 (class 2606 OID 4657506)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2501 (class 2606 OID 4657721)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2500 (class 2606 OID 4657726)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2513 (class 2606 OID 4657786)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2514 (class 2606 OID 4657781)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2511 (class 2606 OID 4657796)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2515 (class 2606 OID 4657776)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2512 (class 2606 OID 4657791)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2497 (class 2606 OID 4657706)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2480 (class 2606 OID 4657636)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2481 (class 2606 OID 4657631)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2483 (class 2606 OID 4657621)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2482 (class 2606 OID 4657626)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2509 (class 2606 OID 4657771)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2510 (class 2606 OID 4657766)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2463 (class 2606 OID 4657536)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2502 (class 2606 OID 4657731)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2447 (class 2606 OID 4657461)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2448 (class 2606 OID 4657456)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2451 (class 2606 OID 4657471)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2450 (class 2606 OID 4657476)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2473 (class 2606 OID 4657596)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2474 (class 2606 OID 4657591)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2475 (class 2606 OID 4657586)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-22 12:10:21 CEST

--
-- PostgreSQL database dump complete
--

