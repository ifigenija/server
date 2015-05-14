--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-14 15:10:41 CEST

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
-- TOC entry 179 (class 1259 OID 3410600)
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
-- TOC entry 225 (class 1259 OID 3411083)
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
-- TOC entry 224 (class 1259 OID 3411066)
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
-- TOC entry 217 (class 1259 OID 3410977)
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
-- TOC entry 193 (class 1259 OID 3410768)
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
-- TOC entry 196 (class 1259 OID 3410802)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 3410727)
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
-- TOC entry 212 (class 1259 OID 3410927)
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
-- TOC entry 191 (class 1259 OID 3410752)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 3410796)
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
-- TOC entry 201 (class 1259 OID 3410845)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 3410870)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 3410701)
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
-- TOC entry 180 (class 1259 OID 3410609)
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
-- TOC entry 181 (class 1259 OID 3410620)
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
-- TOC entry 184 (class 1259 OID 3410671)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 3410574)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 3410593)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 3410877)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 3410907)
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
-- TOC entry 221 (class 1259 OID 3411022)
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
-- TOC entry 183 (class 1259 OID 3410651)
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
-- TOC entry 186 (class 1259 OID 3410693)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 3410851)
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
-- TOC entry 185 (class 1259 OID 3410678)
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
-- TOC entry 190 (class 1259 OID 3410744)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 3410863)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 3410968)
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
-- TOC entry 220 (class 1259 OID 3411015)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 3410892)
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
-- TOC entry 200 (class 1259 OID 3410836)
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
-- TOC entry 199 (class 1259 OID 3410826)
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
-- TOC entry 219 (class 1259 OID 3411005)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 3410958)
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
-- TOC entry 173 (class 1259 OID 3410545)
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
-- TOC entry 172 (class 1259 OID 3410543)
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
-- TOC entry 209 (class 1259 OID 3410901)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 3410583)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 3410567)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 3410915)
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
-- TOC entry 203 (class 1259 OID 3410857)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 3410807)
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
-- TOC entry 182 (class 1259 OID 3410643)
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
-- TOC entry 198 (class 1259 OID 3410813)
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
-- TOC entry 218 (class 1259 OID 3410993)
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
-- TOC entry 188 (class 1259 OID 3410713)
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
-- TOC entry 174 (class 1259 OID 3410554)
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
-- TOC entry 223 (class 1259 OID 3411047)
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
-- TOC entry 192 (class 1259 OID 3410759)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 3410884)
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
-- TOC entry 214 (class 1259 OID 3410950)
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
-- TOC entry 194 (class 1259 OID 3410791)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 3411037)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 3410940)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 3410548)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 3410600)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 3411083)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 3411066)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 3410977)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 3410768)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 3410802)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 3410727)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5554-9ed0-1573-85dbeb0a894d	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5554-9ed0-147b-1f52b41d92b9	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5554-9ed0-4275-031ac3b70c94	AL	ALB	008	Albania 	Albanija	\N
00040000-5554-9ed0-4d2c-db62917f1562	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5554-9ed0-99b5-65a466a2572a	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5554-9ed0-9243-0cbb12f78344	AD	AND	020	Andorra 	Andora	\N
00040000-5554-9ed0-9279-1488667eb4de	AO	AGO	024	Angola 	Angola	\N
00040000-5554-9ed0-58d4-8beb32c8195d	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5554-9ed0-d73d-a61ecf268154	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5554-9ed0-0767-333e21f27166	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5554-9ed0-8f16-f264b4fd8b09	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5554-9ed0-1ab5-98fd16c09c39	AM	ARM	051	Armenia 	Armenija	\N
00040000-5554-9ed0-54e1-cd6a4cf9fbef	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5554-9ed0-3fe7-140d29886d09	AU	AUS	036	Australia 	Avstralija	\N
00040000-5554-9ed0-002e-b7462863af1b	AT	AUT	040	Austria 	Avstrija	\N
00040000-5554-9ed0-7dad-259bc8e04507	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5554-9ed1-d39e-0379858f6a1f	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5554-9ed1-81da-0074a527e709	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5554-9ed1-40b7-14823cc22756	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5554-9ed1-fcc3-58f365f25064	BB	BRB	052	Barbados 	Barbados	\N
00040000-5554-9ed1-90dd-df16dde83bc5	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5554-9ed1-a938-1ab79dd1fb99	BE	BEL	056	Belgium 	Belgija	\N
00040000-5554-9ed1-f6c4-fe8bc043da71	BZ	BLZ	084	Belize 	Belize	\N
00040000-5554-9ed1-97aa-574e1bc17580	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5554-9ed1-649f-f8616df94deb	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5554-9ed1-01ef-099c5a4ac829	BT	BTN	064	Bhutan 	Butan	\N
00040000-5554-9ed1-187a-d1d1126057c6	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5554-9ed1-6efd-f1749b3caa5e	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5554-9ed1-912f-556059d9a8eb	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5554-9ed1-3007-cbd8b7f72e97	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5554-9ed1-dfd0-71e0820548c5	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5554-9ed1-a154-ed5623e3fb31	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5554-9ed1-73ce-42b3342a5d0a	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5554-9ed1-3822-69052a6e4c74	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5554-9ed1-0b19-15ef7b90f2b5	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5554-9ed1-47ad-9a3bd6f29031	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5554-9ed1-83a2-c94dfc4f73b8	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5554-9ed1-3935-358e9639ccee	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5554-9ed1-72b6-ccb657edef79	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5554-9ed1-96a0-f1afb9429c38	CA	CAN	124	Canada 	Kanada	\N
00040000-5554-9ed1-5c6a-5e84041f6b66	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5554-9ed1-87e6-74270ee1af8c	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5554-9ed1-a2bb-ed69b1fdb0d8	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5554-9ed1-c6ae-9db556892789	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5554-9ed1-8091-241e4e2e7f50	CL	CHL	152	Chile 	Čile	\N
00040000-5554-9ed1-a3d7-863887efceec	CN	CHN	156	China 	Kitajska	\N
00040000-5554-9ed1-bc78-e9b6fc4ba791	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5554-9ed1-bff8-2ea0d93d2606	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5554-9ed1-7bd3-07c236bf62f1	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5554-9ed1-8f7c-7e5f887e3db8	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5554-9ed1-e16d-c7640f8dd57d	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5554-9ed1-6d4f-f2559ad6e5e4	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5554-9ed1-c0ae-5eb7f88caa5a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5554-9ed1-1f97-5631c806b4f3	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5554-9ed1-9131-20cd6b9d07bf	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5554-9ed1-5048-0a5b56a852db	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5554-9ed1-3cfe-490a42aeb4cb	CU	CUB	192	Cuba 	Kuba	\N
00040000-5554-9ed1-011d-888df1fe6937	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5554-9ed1-e937-1e6b5c717411	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5554-9ed1-e5e1-4f47e18cd336	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5554-9ed1-b2d7-67a3f4c5886f	DK	DNK	208	Denmark 	Danska	\N
00040000-5554-9ed1-90a6-a7d2d7a98d69	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5554-9ed1-2e69-7afb79b06b91	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5554-9ed1-55e3-8b8be7da3b2f	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5554-9ed1-db7f-0cc703d7a92e	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5554-9ed1-5e23-f1be6677a776	EG	EGY	818	Egypt 	Egipt	\N
00040000-5554-9ed1-3413-46ce8d7134eb	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5554-9ed1-3c0d-4d120702438c	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5554-9ed1-8d41-11d5da8f6775	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5554-9ed1-7ba8-12cc42142a49	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5554-9ed1-5400-334c87467f9c	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5554-9ed1-2e18-3447ff618035	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5554-9ed1-53b9-0f8609bc00a3	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5554-9ed1-6777-545b9c3d60f5	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5554-9ed1-642c-3985a908ce5a	FI	FIN	246	Finland 	Finska	\N
00040000-5554-9ed1-0ef3-20915d5bef67	FR	FRA	250	France 	Francija	\N
00040000-5554-9ed1-e2f4-06de1aa148f4	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5554-9ed1-32cb-6f03ca3bbc0f	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5554-9ed1-7274-6d9fed78f1e9	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5554-9ed1-cff8-6d7119d6f41b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5554-9ed1-073c-9700a5e4da47	GA	GAB	266	Gabon 	Gabon	\N
00040000-5554-9ed1-fcef-c80d02069f13	GM	GMB	270	Gambia 	Gambija	\N
00040000-5554-9ed1-2a95-aa88871a4472	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5554-9ed1-e9ed-05da849e0cc5	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5554-9ed1-695a-375dfae1ecbe	GH	GHA	288	Ghana 	Gana	\N
00040000-5554-9ed1-8282-f90c7dbe4c43	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5554-9ed1-4af4-5ddd7a602d47	GR	GRC	300	Greece 	Grčija	\N
00040000-5554-9ed1-2cba-0b1f9d7abf0e	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5554-9ed1-f821-6f6ae4b6da0c	GD	GRD	308	Grenada 	Grenada	\N
00040000-5554-9ed1-ed66-196d5e157ea9	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5554-9ed1-ecf2-ddaecb30725e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5554-9ed1-c98b-dac7b43d0014	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5554-9ed1-4d52-ba8064fc8f94	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5554-9ed1-8fe3-63c32481f16d	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5554-9ed1-f296-01f7c43797ba	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5554-9ed1-60fc-fcc022bd61ac	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5554-9ed1-99c0-5137f0e55b5d	HT	HTI	332	Haiti 	Haiti	\N
00040000-5554-9ed1-2496-9e468d50422a	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5554-9ed1-bae1-e9c5206d944e	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5554-9ed1-614d-8c33cf0a6667	HN	HND	340	Honduras 	Honduras	\N
00040000-5554-9ed1-fb94-249674ef6aeb	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5554-9ed1-5951-a8a92f7ff069	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5554-9ed1-bf7f-09933a0a50de	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5554-9ed1-9109-3bf3b992a306	IN	IND	356	India 	Indija	\N
00040000-5554-9ed1-daa4-f156b6ede330	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5554-9ed1-2e02-0da619c0aaf8	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5554-9ed1-97a4-b1425c0bdf56	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5554-9ed1-85a1-44ed052d76b3	IE	IRL	372	Ireland 	Irska	\N
00040000-5554-9ed1-f5df-240a58d3a0ef	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5554-9ed1-71ea-682e2346ad8e	IL	ISR	376	Israel 	Izrael	\N
00040000-5554-9ed1-48a2-3c65ee333242	IT	ITA	380	Italy 	Italija	\N
00040000-5554-9ed1-b77e-3e087f975878	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5554-9ed1-f778-c1c0466a27c4	JP	JPN	392	Japan 	Japonska	\N
00040000-5554-9ed1-7d66-cc0a74a042be	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5554-9ed1-707e-5005fc022dfc	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5554-9ed1-3ed6-db0db647c4be	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5554-9ed1-dc87-ad65687d2a94	KE	KEN	404	Kenya 	Kenija	\N
00040000-5554-9ed1-9341-5725ee5ebf30	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5554-9ed1-cb53-350b2fa23250	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5554-9ed1-efa2-9349cfec7bf3	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5554-9ed1-d4fe-70ae5373b754	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5554-9ed1-8f84-62bc91adcab5	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5554-9ed1-9270-2b085d430e3b	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5554-9ed1-d0f1-d4e1fa4c594e	LV	LVA	428	Latvia 	Latvija	\N
00040000-5554-9ed1-854c-e0fb7a607770	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5554-9ed1-395b-bb3f068598e9	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5554-9ed1-1fc8-5742549e1684	LR	LBR	430	Liberia 	Liberija	\N
00040000-5554-9ed1-8a46-30f8f0fc7cbc	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5554-9ed1-5b77-2857ca31b45d	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5554-9ed1-605c-207da4cc051d	LT	LTU	440	Lithuania 	Litva	\N
00040000-5554-9ed1-46f8-358b24dd5681	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5554-9ed1-f34f-0605f7448e39	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5554-9ed1-08b1-fb7c50b42668	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5554-9ed1-b9e0-0b72f7ae03e4	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5554-9ed1-7970-58c29514d22f	MW	MWI	454	Malawi 	Malavi	\N
00040000-5554-9ed1-2d71-24f5f59e17fd	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5554-9ed1-1e56-74a648ed00ed	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5554-9ed1-9cec-01aadc4c76ef	ML	MLI	466	Mali 	Mali	\N
00040000-5554-9ed1-3205-1a60ee447752	MT	MLT	470	Malta 	Malta	\N
00040000-5554-9ed1-352d-eb3a6d7b305b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5554-9ed1-7213-ddba18dfb526	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5554-9ed1-fab8-0b2f17d3a758	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5554-9ed1-9753-dc3c3b6626b5	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5554-9ed1-1a26-a0af5bcf2d78	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5554-9ed1-7194-10564e8036ae	MX	MEX	484	Mexico 	Mehika	\N
00040000-5554-9ed1-a11c-32e9ac3fe12d	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5554-9ed1-180f-8f154567f431	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5554-9ed1-6216-5d2644651153	MC	MCO	492	Monaco 	Monako	\N
00040000-5554-9ed1-8804-3f04963b782d	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5554-9ed1-527d-4fc622b19336	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5554-9ed1-11b0-9d813cdeb35e	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5554-9ed1-364f-1a33f39d9d86	MA	MAR	504	Morocco 	Maroko	\N
00040000-5554-9ed1-22ef-aeff2b6c3746	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5554-9ed1-ddf7-81fc4c604f8f	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5554-9ed1-99ad-aba0e945c09d	NA	NAM	516	Namibia 	Namibija	\N
00040000-5554-9ed1-2d5e-669297bf4f3f	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5554-9ed1-db03-8e82cb3069a2	NP	NPL	524	Nepal 	Nepal	\N
00040000-5554-9ed1-8439-dfd4e57738e5	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5554-9ed1-f9c5-990ba03b9b1c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5554-9ed1-a67d-281418edf974	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5554-9ed1-654a-1671faa5ebd8	NE	NER	562	Niger 	Niger 	\N
00040000-5554-9ed1-73ee-33b59493a271	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5554-9ed1-1c02-73b8c2f077bf	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5554-9ed1-366c-551ef17bd8a0	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5554-9ed1-8a16-5237dcdf00f1	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5554-9ed1-bd23-3373657dc797	NO	NOR	578	Norway 	Norveška	\N
00040000-5554-9ed1-f818-cfe705532bac	OM	OMN	512	Oman 	Oman	\N
00040000-5554-9ed1-29f1-b586ea128257	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5554-9ed1-ddc7-8521844fdbdd	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5554-9ed1-b2aa-e8623b9f0ecd	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5554-9ed1-308a-b7372afd167c	PA	PAN	591	Panama 	Panama	\N
00040000-5554-9ed1-cf70-c2c07dac205d	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5554-9ed1-9a43-6d160f61a0a6	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5554-9ed1-15ad-3e6275ce20f3	PE	PER	604	Peru 	Peru	\N
00040000-5554-9ed1-69d4-a40ccbc3efbb	PH	PHL	608	Philippines 	Filipini	\N
00040000-5554-9ed1-27c0-fe4be3f26e43	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5554-9ed1-a571-eb8be467bab1	PL	POL	616	Poland 	Poljska	\N
00040000-5554-9ed1-261d-fba80e703bb4	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5554-9ed1-6741-e401aee77d90	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5554-9ed1-c960-2583e7e1aa24	QA	QAT	634	Qatar 	Katar	\N
00040000-5554-9ed1-37a1-b1d5e478ce9f	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5554-9ed1-e77a-e31344bed255	RO	ROU	642	Romania 	Romunija	\N
00040000-5554-9ed1-9e31-8da91fafc4df	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5554-9ed1-e1ad-b7bda6873bf3	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5554-9ed1-a029-868c913df465	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5554-9ed1-777f-76d70a6dfd97	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5554-9ed1-4511-d65fbfba5ed0	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5554-9ed1-5ea1-366321cffe9f	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5554-9ed1-97e8-31910ef49ea2	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5554-9ed1-dabc-90dd12cddc63	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5554-9ed1-3bce-bd61276eac01	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5554-9ed1-ab17-62ff79e55e64	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5554-9ed1-1ef7-3b045feb8042	SM	SMR	674	San Marino 	San Marino	\N
00040000-5554-9ed1-90e8-04d9b140c0ff	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5554-9ed1-352e-d8dce5d56eb7	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5554-9ed1-0636-d5c8568a73aa	SN	SEN	686	Senegal 	Senegal	\N
00040000-5554-9ed1-c6ab-cdbaccc0988e	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5554-9ed1-2580-4646ce05da1a	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5554-9ed1-109c-5408038146af	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5554-9ed1-356f-06314df72a07	SG	SGP	702	Singapore 	Singapur	\N
00040000-5554-9ed1-02f9-8d0edc5dfe52	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5554-9ed1-7f51-e823076810eb	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5554-9ed1-d056-73a35c356c0f	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5554-9ed1-7eda-aedc920b06a9	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5554-9ed1-efca-dcd4c13ca39f	SO	SOM	706	Somalia 	Somalija	\N
00040000-5554-9ed1-1153-76b278692cb3	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5554-9ed1-7d18-d8c0010b6ebe	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5554-9ed1-9f37-4450fa710165	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5554-9ed1-172e-01aefc8fd5a2	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5554-9ed1-e165-eb63de85c36e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5554-9ed1-90a1-861ae2ffb243	SD	SDN	729	Sudan 	Sudan	\N
00040000-5554-9ed1-7389-b39978366b0c	SR	SUR	740	Suriname 	Surinam	\N
00040000-5554-9ed1-1aa0-fc4ec8b17084	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5554-9ed1-9d9f-3b1782aea9a5	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5554-9ed1-4136-2e90ced2ed8a	SE	SWE	752	Sweden 	Švedska	\N
00040000-5554-9ed1-48fa-cd51602566ab	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5554-9ed1-abf1-70db4540b819	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5554-9ed1-b018-3a52a45c66fe	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5554-9ed1-dc2e-de7d8570a1ce	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5554-9ed1-00d7-4bbce02ba1ab	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5554-9ed1-f315-cbbbac57ca09	TH	THA	764	Thailand 	Tajska	\N
00040000-5554-9ed1-0c07-0dcb662f4508	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5554-9ed1-2574-424d99002463	TG	TGO	768	Togo 	Togo	\N
00040000-5554-9ed1-4659-a389c2a5e71a	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5554-9ed1-4bad-a346e4ee2ffc	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5554-9ed1-98c4-5ffd77eb4121	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5554-9ed1-c461-4e74da9a92ab	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5554-9ed1-b28b-a2a2e1395011	TR	TUR	792	Turkey 	Turčija	\N
00040000-5554-9ed1-242f-b68ca8148b54	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5554-9ed1-ab5c-16661bc3d845	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5554-9ed1-6035-142500d68de2	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5554-9ed1-4700-3d5f6b040191	UG	UGA	800	Uganda 	Uganda	\N
00040000-5554-9ed1-12a1-cd8582a579cb	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5554-9ed1-c5bb-dc1527bf9c89	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5554-9ed1-bb8c-342eb3170fa6	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5554-9ed1-2213-0f590008b48e	US	USA	840	United States 	Združene države Amerike	\N
00040000-5554-9ed1-9fe7-b275e0c81277	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5554-9ed1-200d-5a6727f90507	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5554-9ed1-333c-470f83e9fad0	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5554-9ed1-6855-985b3676a76a	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5554-9ed1-50fd-1fe0bb56d24e	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5554-9ed1-cd91-a2b71682c23a	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5554-9ed1-79c2-ad68d5ea7950	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5554-9ed1-68c4-0e6e7130f00f	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5554-9ed1-26a0-054b99fe699a	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5554-9ed1-bed2-93c1312274a0	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5554-9ed1-8fc1-e9caf27eaf7d	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5554-9ed1-9545-f84eb8c890ee	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5554-9ed1-0043-c0a73d3386d7	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 3410927)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 3410752)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 3410796)
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
-- TOC entry 2658 (class 0 OID 3410845)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 3410870)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 3410701)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5554-9ed1-3e98-e7128484e8a3	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5554-9ed1-2e2e-00f1e32c1b31	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5554-9ed1-913c-10d701cab37c	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5554-9ed1-a3a1-d7814517c837	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5554-9ed1-9445-b4d1ad114a66	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5554-9ed1-6a93-8ba2e87cd7b7	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5554-9ed1-7515-29eacfe0c9b0	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5554-9ed1-4852-4371a7de0363	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5554-9ed1-00fd-c477584d0610	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5554-9ed1-da78-3f0fe4c453d2	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 3410609)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5554-9ed1-dae0-13660fabdbcf	00000000-5554-9ed1-9445-b4d1ad114a66	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5554-9ed1-dc4d-4be8c865fd40	00000000-5554-9ed1-9445-b4d1ad114a66	00010000-5554-9ed1-9c99-fbfe193412a2	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5554-9ed1-0328-f9a52d3fef98	00000000-5554-9ed1-6a93-8ba2e87cd7b7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 3410620)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 3410671)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 3410574)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5554-9ed1-a9d5-ae6cf92f385e	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5554-9ed1-e176-0159e5db32c5	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5554-9ed1-2cd3-6a2f15e9539d	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5554-9ed1-7913-f94f06de8b04	Abonma-read	Abonma - branje	f
00030000-5554-9ed1-ea3f-f91f054dd0a2	Abonma-write	Abonma - spreminjanje	f
00030000-5554-9ed1-019b-d9d79eb3e1c3	Alternacija-read	Alternacija - branje	f
00030000-5554-9ed1-b762-c62f1c8557d1	Alternacija-write	Alternacija - spreminjanje	f
00030000-5554-9ed1-7733-454dd006dcb6	Arhivalija-read	Arhivalija - branje	f
00030000-5554-9ed1-1a31-4bf10548b05c	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5554-9ed1-cd5b-58c8becf082b	Besedilo-read	Besedilo - branje	f
00030000-5554-9ed1-f60f-d5d55ed3ad0f	Besedilo-write	Besedilo - spreminjanje	f
00030000-5554-9ed1-f8e8-74a35a7516c7	DogodekIzven-read	DogodekIzven - branje	f
00030000-5554-9ed1-8367-d2e73fb70feb	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5554-9ed1-9885-44ccb52f65be	Dogodek-read	Dogodek - branje	f
00030000-5554-9ed1-2a6c-cc5edbaffbe7	Dogodek-write	Dogodek - spreminjanje	f
00030000-5554-9ed1-5a3f-24024701d714	Drzava-read	Drzava - branje	f
00030000-5554-9ed1-d4bd-3c1c54865e0b	Drzava-write	Drzava - spreminjanje	f
00030000-5554-9ed1-1263-713187c93c26	Funkcija-read	Funkcija - branje	f
00030000-5554-9ed1-ed5e-8c9a8fe0c3d5	Funkcija-write	Funkcija - spreminjanje	f
00030000-5554-9ed1-156e-fc6fc585725a	Gostovanje-read	Gostovanje - branje	f
00030000-5554-9ed1-f219-1a5c2b0d2f53	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5554-9ed1-69c7-d425c62000f4	Gostujoca-read	Gostujoca - branje	f
00030000-5554-9ed1-1709-acb232241758	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5554-9ed1-24ae-0b3cc8d5de8e	Kupec-read	Kupec - branje	f
00030000-5554-9ed1-c0df-98618d887649	Kupec-write	Kupec - spreminjanje	f
00030000-5554-9ed1-7dcf-e6d24adfac31	NacinPlacina-read	NacinPlacina - branje	f
00030000-5554-9ed1-04ad-8803ad6fd036	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5554-9ed1-a1de-a88aeb677764	Option-read	Option - branje	f
00030000-5554-9ed1-6444-4e9d5f11e0f9	Option-write	Option - spreminjanje	f
00030000-5554-9ed1-28ae-1e44376da9a5	OptionValue-read	OptionValue - branje	f
00030000-5554-9ed1-cf53-934f17942a6c	OptionValue-write	OptionValue - spreminjanje	f
00030000-5554-9ed1-904c-b7b13973e8bd	Oseba-read	Oseba - branje	f
00030000-5554-9ed1-b8bb-1e9326a0efff	Oseba-write	Oseba - spreminjanje	f
00030000-5554-9ed1-97dd-0913b978ea6b	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5554-9ed1-5116-05fd8b8f3d26	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5554-9ed1-3693-d5008783b4ca	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5554-9ed1-2fba-37a9b8c682dd	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5554-9ed1-844c-2bbf5a6db0fa	Pogodba-read	Pogodba - branje	f
00030000-5554-9ed1-57ef-00f35ed8870a	Pogodba-write	Pogodba - spreminjanje	f
00030000-5554-9ed1-1f96-3dbd8ede2997	Popa-read	Popa - branje	f
00030000-5554-9ed1-7148-f8495e70655a	Popa-write	Popa - spreminjanje	f
00030000-5554-9ed1-7f3e-786ae897e337	Posta-read	Posta - branje	f
00030000-5554-9ed1-e897-c9e94d199ed5	Posta-write	Posta - spreminjanje	f
00030000-5554-9ed1-d92a-8f93241a1521	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5554-9ed1-af5f-c36ad26a9b79	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5554-9ed1-d39d-0b3e11a3fbfd	PostniNaslov-read	PostniNaslov - branje	f
00030000-5554-9ed1-1315-f908668139de	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5554-9ed1-7f9d-2493de979b1f	Predstava-read	Predstava - branje	f
00030000-5554-9ed1-af0e-41ba827d92d3	Predstava-write	Predstava - spreminjanje	f
00030000-5554-9ed1-9a88-349976a9d617	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5554-9ed1-c089-65f92d3f2e38	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5554-9ed1-3da6-699d01a08074	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5554-9ed1-0fba-e5d6dce6e209	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5554-9ed1-1e84-0b90986e94b9	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5554-9ed1-ce25-3a9b54c1e792	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5554-9ed1-4838-f61d1bf08a8d	Prostor-read	Prostor - branje	f
00030000-5554-9ed1-2db3-c52ca167bbf9	Prostor-write	Prostor - spreminjanje	f
00030000-5554-9ed1-cda9-6ccb5f06702d	Racun-read	Racun - branje	f
00030000-5554-9ed1-a8ef-fa8d651d936a	Racun-write	Racun - spreminjanje	f
00030000-5554-9ed1-212d-d3070fe7052c	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5554-9ed1-1bf6-36c2d916f7fb	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5554-9ed1-b804-f20cab2b8362	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5554-9ed1-838e-829864f3599f	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5554-9ed1-b576-11e31261c35f	Rekvizit-read	Rekvizit - branje	f
00030000-5554-9ed1-ef2c-e4134a65c7f7	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5554-9ed1-7854-60825060bb46	Rezervacija-read	Rezervacija - branje	f
00030000-5554-9ed1-cd18-634c14b1857f	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5554-9ed1-ee81-1da460614466	SedezniRed-read	SedezniRed - branje	f
00030000-5554-9ed1-9169-32032f8c62cc	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5554-9ed1-51e7-14ac14f18598	Sedez-read	Sedez - branje	f
00030000-5554-9ed1-e990-35400e33f16b	Sedez-write	Sedez - spreminjanje	f
00030000-5554-9ed1-436f-5a5054a2aedc	Sezona-read	Sezona - branje	f
00030000-5554-9ed1-cbce-ab4f83a22254	Sezona-write	Sezona - spreminjanje	f
00030000-5554-9ed1-21a6-d22d3df10032	Telefonska-read	Telefonska - branje	f
00030000-5554-9ed1-cfec-5bf240ea65b0	Telefonska-write	Telefonska - spreminjanje	f
00030000-5554-9ed1-4c01-d15ca6baa113	TerminStoritve-read	TerminStoritve - branje	f
00030000-5554-9ed1-dd4d-f729e5d5b0e8	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5554-9ed1-81d4-403c2755aa86	TipFunkcije-read	TipFunkcije - branje	f
00030000-5554-9ed1-33c0-be4d88459e50	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5554-9ed1-104e-016a92e89b52	Trr-read	Trr - branje	f
00030000-5554-9ed1-fec4-e37ec7e9c2ba	Trr-write	Trr - spreminjanje	f
00030000-5554-9ed1-91f6-09a99b731a16	Uprizoritev-read	Uprizoritev - branje	f
00030000-5554-9ed1-4e76-fe8e44da88d1	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5554-9ed1-6f06-5fcd5af053e9	Vaja-read	Vaja - branje	f
00030000-5554-9ed1-940e-198629350752	Vaja-write	Vaja - spreminjanje	f
00030000-5554-9ed1-0efc-55ba988583fb	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5554-9ed1-c931-433fe97752dd	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5554-9ed1-2e3e-b28a0c203fb0	Zaposlitev-read	Zaposlitev - branje	f
00030000-5554-9ed1-0cb9-df4151f70ff5	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5554-9ed1-c9ba-b469ecb83ece	Zasedenost-read	Zasedenost - branje	f
00030000-5554-9ed1-1cfb-e8ebdab31683	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5554-9ed1-e2a6-81171ee663ed	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5554-9ed1-dabc-51805a954278	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5554-9ed1-ac96-191df07d2215	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5554-9ed1-cc50-afb8ba552b38	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2635 (class 0 OID 3410593)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5554-9ed1-d791-cf1f2fc7efb0	00030000-5554-9ed1-5a3f-24024701d714
00020000-5554-9ed1-f366-b7cbb958225d	00030000-5554-9ed1-d4bd-3c1c54865e0b
00020000-5554-9ed1-f366-b7cbb958225d	00030000-5554-9ed1-5a3f-24024701d714
\.


--
-- TOC entry 2663 (class 0 OID 3410877)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 3410907)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 3411022)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 3410651)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 3410693)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5554-9ed0-02e8-9973fdebd74d	8341	Adlešiči
00050000-5554-9ed0-408d-3b61c5d06d17	5270	Ajdovščina
00050000-5554-9ed0-f8a9-b82421094f6f	6280	Ankaran/Ancarano
00050000-5554-9ed0-15e4-0f1713961936	9253	Apače
00050000-5554-9ed0-c477-130a0a34c715	8253	Artiče
00050000-5554-9ed0-485a-a5b8328d16ea	4275	Begunje na Gorenjskem
00050000-5554-9ed0-887f-7d28584ac1f7	1382	Begunje pri Cerknici
00050000-5554-9ed0-9ccb-118969bc38f4	9231	Beltinci
00050000-5554-9ed0-9e16-6f2f2310dacb	2234	Benedikt
00050000-5554-9ed0-5fb1-c60f2fd64e07	2345	Bistrica ob Dravi
00050000-5554-9ed0-5c1b-1c7c1e64e7b5	3256	Bistrica ob Sotli
00050000-5554-9ed0-7d31-83a36e475ec6	8259	Bizeljsko
00050000-5554-9ed0-8c7a-60dbc01e41b3	1223	Blagovica
00050000-5554-9ed0-def4-d3d2bc2ddea3	8283	Blanca
00050000-5554-9ed0-2bbd-f74e40138d6e	4260	Bled
00050000-5554-9ed0-8d36-49d3abd897b0	4273	Blejska Dobrava
00050000-5554-9ed0-9d60-5ebed587c4fe	9265	Bodonci
00050000-5554-9ed0-e989-354325dc3c01	9222	Bogojina
00050000-5554-9ed0-6b3c-12dce12e4fe9	4263	Bohinjska Bela
00050000-5554-9ed0-62cf-2f7ad41a96ab	4264	Bohinjska Bistrica
00050000-5554-9ed0-109d-74ff7942d907	4265	Bohinjsko jezero
00050000-5554-9ed0-2e42-e8a99a383a8a	1353	Borovnica
00050000-5554-9ed0-f1c8-f885d2b5ef3d	8294	Boštanj
00050000-5554-9ed0-52cf-f6811b4d00bc	5230	Bovec
00050000-5554-9ed0-7dbf-62a3aabd84e8	5295	Branik
00050000-5554-9ed0-e9a0-88a41e6837c6	3314	Braslovče
00050000-5554-9ed0-78db-7ebb520a157b	5223	Breginj
00050000-5554-9ed0-1313-afccc73df999	8280	Brestanica
00050000-5554-9ed0-22ea-764d46a5ec43	2354	Bresternica
00050000-5554-9ed0-d823-001b8f84e675	4243	Brezje
00050000-5554-9ed0-0c7b-ad0ad06a11f0	1351	Brezovica pri Ljubljani
00050000-5554-9ed0-fea1-540f9efa6f8e	8250	Brežice
00050000-5554-9ed0-71d1-3a666ff48a05	4210	Brnik - Aerodrom
00050000-5554-9ed0-a3f4-d82bf286ba8c	8321	Brusnice
00050000-5554-9ed0-6538-bbdd60abaf7a	3255	Buče
00050000-5554-9ed0-be20-20e367533652	8276	Bučka 
00050000-5554-9ed0-cbc1-02d40dc59263	9261	Cankova
00050000-5554-9ed0-534d-cd7213f28c7f	3000	Celje 
00050000-5554-9ed0-cfe8-fa943dce100a	3001	Celje - poštni predali
00050000-5554-9ed0-96b6-c292350f1863	4207	Cerklje na Gorenjskem
00050000-5554-9ed0-cdf9-adf794eadaad	8263	Cerklje ob Krki
00050000-5554-9ed0-27a6-14022ed2e4a2	1380	Cerknica
00050000-5554-9ed0-870f-3b2e7b7d340b	5282	Cerkno
00050000-5554-9ed0-43c7-528e3a61cacf	2236	Cerkvenjak
00050000-5554-9ed0-aa14-f8c4cfb31876	2215	Ceršak
00050000-5554-9ed0-8345-6c27c62f9618	2326	Cirkovce
00050000-5554-9ed0-0399-9bc1e0287daa	2282	Cirkulane
00050000-5554-9ed0-00d6-386fd2fe7406	5273	Col
00050000-5554-9ed0-3591-a4a456304acf	8251	Čatež ob Savi
00050000-5554-9ed0-dfd7-78c7557640bf	1413	Čemšenik
00050000-5554-9ed0-439e-862bf49e05e1	5253	Čepovan
00050000-5554-9ed0-7a37-27f3aff4fbf1	9232	Črenšovci
00050000-5554-9ed0-6acf-9f9c8ab2dfc8	2393	Črna na Koroškem
00050000-5554-9ed0-7d10-6095fb6495e7	6275	Črni Kal
00050000-5554-9ed0-cdc2-2dcc989ecaf7	5274	Črni Vrh nad Idrijo
00050000-5554-9ed0-a4e4-295697163ccf	5262	Črniče
00050000-5554-9ed0-d4e9-3129ed681667	8340	Črnomelj
00050000-5554-9ed0-f48e-36f4b8c0d459	6271	Dekani
00050000-5554-9ed0-7866-d6db673da4a8	5210	Deskle
00050000-5554-9ed0-6d50-50597f0c0e71	2253	Destrnik
00050000-5554-9ed0-208f-dfe458eda813	6215	Divača
00050000-5554-9ed0-bce3-bbed2dcae03c	1233	Dob
00050000-5554-9ed0-c527-c3df9ffb4fcd	3224	Dobje pri Planini
00050000-5554-9ed0-b112-64e3d66be512	8257	Dobova
00050000-5554-9ed0-6b82-0c8c8cb3053b	1423	Dobovec
00050000-5554-9ed0-0c73-7c780e0e99b4	5263	Dobravlje
00050000-5554-9ed0-5325-1480266e04f8	3204	Dobrna
00050000-5554-9ed0-fe67-feebb785ff97	8211	Dobrnič
00050000-5554-9ed0-1398-19f9581c1365	1356	Dobrova
00050000-5554-9ed0-5d0f-43edb29db4e2	9223	Dobrovnik/Dobronak 
00050000-5554-9ed0-af74-f5a8ac7181b3	5212	Dobrovo v Brdih
00050000-5554-9ed0-fb6d-fcc7922583f0	1431	Dol pri Hrastniku
00050000-5554-9ed0-6fad-25ee812ddcac	1262	Dol pri Ljubljani
00050000-5554-9ed0-5894-1821bbfbcbb2	1273	Dole pri Litiji
00050000-5554-9ed0-6174-83ab55570250	1331	Dolenja vas
00050000-5554-9ed0-f2e6-5ae162303072	8350	Dolenjske Toplice
00050000-5554-9ed0-d5c1-5fb05694595b	1230	Domžale
00050000-5554-9ed0-d07a-f22f0ce4cfac	2252	Dornava
00050000-5554-9ed0-a6d4-c1dee3b9cee1	5294	Dornberk
00050000-5554-9ed0-4343-52de56ab9b86	1319	Draga
00050000-5554-9ed0-5cd7-4c3775993893	8343	Dragatuš
00050000-5554-9ed0-5fba-893ab83f5b61	3222	Dramlje
00050000-5554-9ed0-9876-b9688e255b48	2370	Dravograd
00050000-5554-9ed0-0409-9a2196b73882	4203	Duplje
00050000-5554-9ed0-1790-bd81e20739fd	6221	Dutovlje
00050000-5554-9ed0-b8e7-3093b38cf5e6	8361	Dvor
00050000-5554-9ed0-bfc1-3d1de3ca9c7e	2343	Fala
00050000-5554-9ed0-f22d-4c28d27a06bb	9208	Fokovci
00050000-5554-9ed0-f83f-65fea39460bf	2313	Fram
00050000-5554-9ed0-e2fd-8460566bebc7	3213	Frankolovo
00050000-5554-9ed0-e252-6ff3995a8ac7	1274	Gabrovka
00050000-5554-9ed0-d1c8-05c5946a55fb	8254	Globoko
00050000-5554-9ed0-37e6-861a2fd8ff59	5275	Godovič
00050000-5554-9ed0-51dc-26e260c33994	4204	Golnik
00050000-5554-9ed0-1d5a-ecfbef92f70c	3303	Gomilsko
00050000-5554-9ed0-f94d-66d56b4c68f3	4224	Gorenja vas
00050000-5554-9ed0-4be4-d44f6d03fc7d	3263	Gorica pri Slivnici
00050000-5554-9ed0-6e56-4fcbfdef8bb8	2272	Gorišnica
00050000-5554-9ed0-3b76-a25232847f37	9250	Gornja Radgona
00050000-5554-9ed0-0842-1e70ac781370	3342	Gornji Grad
00050000-5554-9ed0-0da1-f6fd0802f6f0	4282	Gozd Martuljek
00050000-5554-9ed0-3894-5960d48ca9e0	6272	Gračišče
00050000-5554-9ed0-5c7b-86623abef9bc	9264	Grad
00050000-5554-9ed0-a0e9-28cf1b0c19d1	8332	Gradac
00050000-5554-9ed0-cda9-5b50310a7c01	1384	Grahovo
00050000-5554-9ed0-b363-e69ec76fadae	5242	Grahovo ob Bači
00050000-5554-9ed0-bdbc-8fd652490ca4	5251	Grgar
00050000-5554-9ed0-0ff0-d85918312ecf	3302	Griže
00050000-5554-9ed0-f0db-7528c71b744a	3231	Grobelno
00050000-5554-9ed0-7b6b-a0698f08f5d4	1290	Grosuplje
00050000-5554-9ed0-806a-ec41a2294d94	2288	Hajdina
00050000-5554-9ed0-4db4-c06e625fc2cc	8362	Hinje
00050000-5554-9ed0-e875-e745c716359f	2311	Hoče
00050000-5554-9ed0-1179-c6ea780191e6	9205	Hodoš/Hodos
00050000-5554-9ed0-8a78-99a628805c89	1354	Horjul
00050000-5554-9ed0-e18d-fda549c02e10	1372	Hotedršica
00050000-5554-9ed0-41e7-b9f2ca62796f	1430	Hrastnik
00050000-5554-9ed0-ea3d-3701b28498ed	6225	Hruševje
00050000-5554-9ed0-aa36-0fcf64fe39d4	4276	Hrušica
00050000-5554-9ed0-3070-72ca45e109b3	5280	Idrija
00050000-5554-9ed0-b5e8-a991b5e426a4	1292	Ig
00050000-5554-9ed0-3267-01d5aba68546	6250	Ilirska Bistrica
00050000-5554-9ed0-8906-0630bca1c1cf	6251	Ilirska Bistrica-Trnovo
00050000-5554-9ed0-f627-5380da2d4e8d	1295	Ivančna Gorica
00050000-5554-9ed0-b8b0-2a390fae7b00	2259	Ivanjkovci
00050000-5554-9ed0-8bc7-782fcda87ee6	1411	Izlake
00050000-5554-9ed0-54c2-65293e1374d7	6310	Izola/Isola
00050000-5554-9ed0-dadc-a60ad606a580	2222	Jakobski Dol
00050000-5554-9ed0-23db-fd25a7f0fe16	2221	Jarenina
00050000-5554-9ed0-001f-363a1182b455	6254	Jelšane
00050000-5554-9ed0-4ca2-baef80ef1ec2	4270	Jesenice
00050000-5554-9ed0-9a5b-1af8ea0ffae8	8261	Jesenice na Dolenjskem
00050000-5554-9ed0-1aba-302e19d729b1	3273	Jurklošter
00050000-5554-9ed0-b55e-01aeade6d206	2223	Jurovski Dol
00050000-5554-9ed0-6390-2ce615288301	2256	Juršinci
00050000-5554-9ed0-2d07-57cce1698cdd	5214	Kal nad Kanalom
00050000-5554-9ed0-324a-aae64a044d57	3233	Kalobje
00050000-5554-9ed0-e679-ed13b61c156c	4246	Kamna Gorica
00050000-5554-9ed0-45b7-2df31b5ede7d	2351	Kamnica
00050000-5554-9ed0-add4-6bed008b8327	1241	Kamnik
00050000-5554-9ed0-74bc-fd13d214ef47	5213	Kanal
00050000-5554-9ed0-b537-57fc9d7484af	8258	Kapele
00050000-5554-9ed0-d0ca-79a67055ec20	2362	Kapla
00050000-5554-9ed0-fb49-586dcd369b65	2325	Kidričevo
00050000-5554-9ed0-7d79-2675c5b635c9	1412	Kisovec
00050000-5554-9ed0-de21-6cd39120353b	6253	Knežak
00050000-5554-9ed0-afe9-04170c753e3c	5222	Kobarid
00050000-5554-9ed0-847a-dc2e28489c30	9227	Kobilje
00050000-5554-9ed0-1952-f7ad46c329b4	1330	Kočevje
00050000-5554-9ed0-b54a-3b6377f59c00	1338	Kočevska Reka
00050000-5554-9ed0-b320-a6d0d8fd1ddd	2276	Kog
00050000-5554-9ed0-609f-d5a6028dde25	5211	Kojsko
00050000-5554-9ed0-bf9a-67413b3de77a	6223	Komen
00050000-5554-9ed0-a610-f2edc176ee73	1218	Komenda
00050000-5554-9ed0-f9f6-a96a7003c7e1	6000	Koper/Capodistria 
00050000-5554-9ed0-709b-6592866baa8f	6001	Koper/Capodistria - poštni predali
00050000-5554-9ed0-9cf9-5d6a0a5524b2	8282	Koprivnica
00050000-5554-9ed0-81fb-30e0eadfcc34	5296	Kostanjevica na Krasu
00050000-5554-9ed0-5b30-89901f524668	8311	Kostanjevica na Krki
00050000-5554-9ed0-329c-73cd1cba09f0	1336	Kostel
00050000-5554-9ed0-0730-f096a106e2d0	6256	Košana
00050000-5554-9ed0-a75f-c0da297ea8c8	2394	Kotlje
00050000-5554-9ed0-e86c-14cdeb72d6a5	6240	Kozina
00050000-5554-9ed0-9159-965016e143bb	3260	Kozje
00050000-5554-9ed0-7668-c1d304613615	4000	Kranj 
00050000-5554-9ed0-752c-693123ad25cc	4001	Kranj - poštni predali
00050000-5554-9ed0-9f32-4a0b85cca4c7	4280	Kranjska Gora
00050000-5554-9ed0-1733-61f493e8b295	1281	Kresnice
00050000-5554-9ed0-1654-3925c7efb3c5	4294	Križe
00050000-5554-9ed0-6bce-5aa2be4035ce	9206	Križevci
00050000-5554-9ed0-911d-d53f79896140	9242	Križevci pri Ljutomeru
00050000-5554-9ed0-4bac-53a6a23506c2	1301	Krka
00050000-5554-9ed0-fda2-2b4328965be1	8296	Krmelj
00050000-5554-9ed0-189c-18c83d28dda2	4245	Kropa
00050000-5554-9ed0-a3ab-065e9505da46	8262	Krška vas
00050000-5554-9ed0-2445-a0b479624978	8270	Krško
00050000-5554-9ed0-0abe-9ebeda14fb8c	9263	Kuzma
00050000-5554-9ed0-ebed-2c03d6fd003e	2318	Laporje
00050000-5554-9ed0-6336-6ac58d53b707	3270	Laško
00050000-5554-9ed0-9b83-04cbe50c6b74	1219	Laze v Tuhinju
00050000-5554-9ed0-dfd2-5957f1ae9181	2230	Lenart v Slovenskih goricah
00050000-5554-9ed0-a0a6-f02f6f713c89	9220	Lendava/Lendva
00050000-5554-9ed0-c2ca-ce57f5c9b543	4248	Lesce
00050000-5554-9ed0-7fe1-7001bcb77721	3261	Lesično
00050000-5554-9ed0-a194-3deb59c35ab6	8273	Leskovec pri Krškem
00050000-5554-9ed0-b815-3b87dcbeba72	2372	Libeliče
00050000-5554-9ed0-0a59-1b3a8a91ffb9	2341	Limbuš
00050000-5554-9ed0-0aa9-911494fe9281	1270	Litija
00050000-5554-9ed0-6715-c74fc1e21314	3202	Ljubečna
00050000-5554-9ed0-1fb1-e913bb875665	1000	Ljubljana 
00050000-5554-9ed0-6f63-64bb62e50e72	1001	Ljubljana - poštni predali
00050000-5554-9ed0-5304-743a0c99c879	1231	Ljubljana - Črnuče
00050000-5554-9ed0-a3eb-9bf9a7b2f26b	1261	Ljubljana - Dobrunje
00050000-5554-9ed0-a1e7-809797d8e600	1260	Ljubljana - Polje
00050000-5554-9ed0-c1a3-d349218a0534	1210	Ljubljana - Šentvid
00050000-5554-9ed0-c4e3-e8d246dfc96e	1211	Ljubljana - Šmartno
00050000-5554-9ed0-596d-1a1667d49733	3333	Ljubno ob Savinji
00050000-5554-9ed0-1b09-27de7f6ede54	9240	Ljutomer
00050000-5554-9ed0-2ac0-6d010e0fc89b	3215	Loče
00050000-5554-9ed0-5e91-9af676fd59a9	5231	Log pod Mangartom
00050000-5554-9ed0-6261-f97bf7eee34c	1358	Log pri Brezovici
00050000-5554-9ed0-b16a-b652a494bc86	1370	Logatec
00050000-5554-9ed0-a7c4-d6d3bca913b4	1371	Logatec
00050000-5554-9ed0-53bf-d3ddfa2972dc	1434	Loka pri Zidanem Mostu
00050000-5554-9ed0-e020-8168b80a3e7c	3223	Loka pri Žusmu
00050000-5554-9ed0-cab0-c4fb4abedb3e	6219	Lokev
00050000-5554-9ed0-4090-e44e24394711	1318	Loški Potok
00050000-5554-9ed0-1c13-37dd06b2cc5f	2324	Lovrenc na Dravskem polju
00050000-5554-9ed0-5e77-e3e4e7cd200d	2344	Lovrenc na Pohorju
00050000-5554-9ed0-c1cd-762188fe2e7f	3334	Luče
00050000-5554-9ed0-ec74-e39f252d9b64	1225	Lukovica
00050000-5554-9ed0-30c2-5b432c96f8b0	9202	Mačkovci
00050000-5554-9ed0-490b-06ed4909ccbf	2322	Majšperk
00050000-5554-9ed0-294b-7fcc012e77fa	2321	Makole
00050000-5554-9ed0-60e8-2c009814292e	9243	Mala Nedelja
00050000-5554-9ed0-b446-fef17ff56d64	2229	Malečnik
00050000-5554-9ed0-e1a8-fa43997ca669	6273	Marezige
00050000-5554-9ed0-fb2a-8d1e9eb27a39	2000	Maribor 
00050000-5554-9ed0-88e4-2a2616397c87	2001	Maribor - poštni predali
00050000-5554-9ed0-6ef7-600e3aefdf75	2206	Marjeta na Dravskem polju
00050000-5554-9ed0-ecbf-6d8d90223dca	2281	Markovci
00050000-5554-9ed0-6761-f6621030db0e	9221	Martjanci
00050000-5554-9ed0-b62c-e6bd09b14653	6242	Materija
00050000-5554-9ed0-feda-ecf1206f7a44	4211	Mavčiče
00050000-5554-9ed0-bd56-b5e12714930e	1215	Medvode
00050000-5554-9ed0-24c3-2152d5aab195	1234	Mengeš
00050000-5554-9ed0-3ea2-9bfaf5b27314	8330	Metlika
00050000-5554-9ed0-d9c7-82d88b0c75a9	2392	Mežica
00050000-5554-9ed0-76b0-c0f171adf6ba	2204	Miklavž na Dravskem polju
00050000-5554-9ed0-73de-9d1e26a11215	2275	Miklavž pri Ormožu
00050000-5554-9ed0-3861-e2f88aceec17	5291	Miren
00050000-5554-9ed0-d94f-91017c7a45f3	8233	Mirna
00050000-5554-9ed0-b6cf-d6c44299c22b	8216	Mirna Peč
00050000-5554-9ed0-9a77-a5386464616f	2382	Mislinja
00050000-5554-9ed0-6f89-585928734c83	4281	Mojstrana
00050000-5554-9ed0-35b6-daa260ba327b	8230	Mokronog
00050000-5554-9ed0-4ae9-0ec6b6bc1aa3	1251	Moravče
00050000-5554-9ed0-d0ec-1675f61ac567	9226	Moravske Toplice
00050000-5554-9ed0-9fe5-43e194000849	5216	Most na Soči
00050000-5554-9ed0-1331-28eaf50bba5b	1221	Motnik
00050000-5554-9ed0-e959-beabb7dbdeb8	3330	Mozirje
00050000-5554-9ed0-b8b0-5ab34cb58001	9000	Murska Sobota 
00050000-5554-9ed0-8127-aa9b49722471	9001	Murska Sobota - poštni predali
00050000-5554-9ed0-2bcb-839e7e9c95fd	2366	Muta
00050000-5554-9ed0-f0df-6ea0bef60ca5	4202	Naklo
00050000-5554-9ed0-46ca-fadc80a0acec	3331	Nazarje
00050000-5554-9ed0-0e76-7166584628ef	1357	Notranje Gorice
00050000-5554-9ed0-8891-db88b8f22c35	3203	Nova Cerkev
00050000-5554-9ed0-c854-4d6f7b5b0227	5000	Nova Gorica 
00050000-5554-9ed0-edc7-fad6214217f0	5001	Nova Gorica - poštni predali
00050000-5554-9ed0-ad2d-7563d70262b2	1385	Nova vas
00050000-5554-9ed0-db50-e718f8318542	8000	Novo mesto
00050000-5554-9ed0-5210-e4817e687c77	8001	Novo mesto - poštni predali
00050000-5554-9ed0-f8b9-1d8571e30a20	6243	Obrov
00050000-5554-9ed0-6063-c6f80c51e9ff	9233	Odranci
00050000-5554-9ed0-536e-cc70a8684bb2	2317	Oplotnica
00050000-5554-9ed0-57ce-3bb83638d95e	2312	Orehova vas
00050000-5554-9ed0-8c25-a2efe5c3f6dc	2270	Ormož
00050000-5554-9ed0-6e51-ade5b1d4694e	1316	Ortnek
00050000-5554-9ed0-1548-73a1ca212dc4	1337	Osilnica
00050000-5554-9ed0-7274-c1751e2f3d9a	8222	Otočec
00050000-5554-9ed0-67b9-f95662c92b4b	2361	Ožbalt
00050000-5554-9ed0-ae22-23ea737b35ba	2231	Pernica
00050000-5554-9ed0-4e7d-c8a612a8e92c	2211	Pesnica pri Mariboru
00050000-5554-9ed0-a206-aa870cf4ed85	9203	Petrovci
00050000-5554-9ed0-4a9f-0576ba013db3	3301	Petrovče
00050000-5554-9ed0-3007-f9bb7e4e0f34	6330	Piran/Pirano
00050000-5554-9ed0-eb79-1f9f66c65382	8255	Pišece
00050000-5554-9ed0-c4df-d2d483ea0f4a	6257	Pivka
00050000-5554-9ed0-0af0-a925bd7ad04f	6232	Planina
00050000-5554-9ed0-0484-193e59afdc54	3225	Planina pri Sevnici
00050000-5554-9ed0-7335-7fa3d8323719	6276	Pobegi
00050000-5554-9ed0-d693-90403ec91870	8312	Podbočje
00050000-5554-9ed0-6211-52f7c65bac7c	5243	Podbrdo
00050000-5554-9ed0-3bcb-dabea629e050	3254	Podčetrtek
00050000-5554-9ed0-5c16-a7c4238b0169	2273	Podgorci
00050000-5554-9ed0-2731-85ca7ec2ac4b	6216	Podgorje
00050000-5554-9ed0-1257-f9f474b15f16	2381	Podgorje pri Slovenj Gradcu
00050000-5554-9ed0-9e9d-522f38ca1b8b	6244	Podgrad
00050000-5554-9ed0-7576-c99178227085	1414	Podkum
00050000-5554-9ed0-c819-66b3325f89d5	2286	Podlehnik
00050000-5554-9ed0-2154-fc901442888a	5272	Podnanos
00050000-5554-9ed0-e7a3-a4126001481e	4244	Podnart
00050000-5554-9ed0-ea2a-b5ae329d99f1	3241	Podplat
00050000-5554-9ed0-737d-695c3ae9d07d	3257	Podsreda
00050000-5554-9ed0-7ad0-5ca6488d181e	2363	Podvelka
00050000-5554-9ed0-940f-fa7f58469fda	2208	Pohorje
00050000-5554-9ed0-81c0-25be292fac54	2257	Polenšak
00050000-5554-9ed0-db18-e2c89b3f7e02	1355	Polhov Gradec
00050000-5554-9ed0-f08d-01f07749f2a8	4223	Poljane nad Škofjo Loko
00050000-5554-9ed0-a902-74cae85967a0	2319	Poljčane
00050000-5554-9ed0-de9e-ec92e62a598f	1272	Polšnik
00050000-5554-9ed0-f3ab-eea672a60865	3313	Polzela
00050000-5554-9ed0-4f60-8091a5672d24	3232	Ponikva
00050000-5554-9ed0-c4ed-a863ddbef28c	6320	Portorož/Portorose
00050000-5554-9ed0-6312-11168a604363	6230	Postojna
00050000-5554-9ed0-d7b0-e7f88c8c5a9b	2331	Pragersko
00050000-5554-9ed0-38bc-b785035318b0	3312	Prebold
00050000-5554-9ed0-d283-c8c2c6b4724c	4205	Preddvor
00050000-5554-9ed0-afa0-dc603b76fced	6255	Prem
00050000-5554-9ed0-dc64-c3b7fc13c9d0	1352	Preserje
00050000-5554-9ed0-bf28-a898d5871b80	6258	Prestranek
00050000-5554-9ed0-e8ec-a5c62ce6d896	2391	Prevalje
00050000-5554-9ed0-bd6c-1ff6bcb92b19	3262	Prevorje
00050000-5554-9ed0-c422-0e01d0c47db6	1276	Primskovo 
00050000-5554-9ed0-9451-e1bbc43f2d80	3253	Pristava pri Mestinju
00050000-5554-9ed0-c19a-e9cd44552010	9207	Prosenjakovci/Partosfalva
00050000-5554-9ed0-ba69-058561d84abf	5297	Prvačina
00050000-5554-9ed0-bb17-e578ab81bccf	2250	Ptuj
00050000-5554-9ed0-b236-90f3cf9ab93b	2323	Ptujska Gora
00050000-5554-9ed0-a3b1-59c32117634a	9201	Puconci
00050000-5554-9ed0-b85a-d433e011c536	2327	Rače
00050000-5554-9ed0-02cf-d78fa54f11bd	1433	Radeče
00050000-5554-9ed0-6794-993f17ffaf69	9252	Radenci
00050000-5554-9ed0-771e-ef3b34cbde8c	2360	Radlje ob Dravi
00050000-5554-9ed0-baac-777cc02a186f	1235	Radomlje
00050000-5554-9ed0-449a-190f78ee685e	4240	Radovljica
00050000-5554-9ed0-7917-e3bfb7c0e513	8274	Raka
00050000-5554-9ed0-8f2d-9d13444c32f2	1381	Rakek
00050000-5554-9ed0-3ba7-b8cf57d1ea6f	4283	Rateče - Planica
00050000-5554-9ed0-8269-0f0130eed84c	2390	Ravne na Koroškem
00050000-5554-9ed0-a5e8-5898d120138d	9246	Razkrižje
00050000-5554-9ed0-b897-c5d0b378464b	3332	Rečica ob Savinji
00050000-5554-9ed0-80b9-e2e8be13deb3	5292	Renče
00050000-5554-9ed0-de13-5bc2c3c8a35c	1310	Ribnica
00050000-5554-9ed0-9da3-76c06f31ebcc	2364	Ribnica na Pohorju
00050000-5554-9ed0-7ca6-118ab4b691b9	3272	Rimske Toplice
00050000-5554-9ed0-3179-7f281ed46f45	1314	Rob
00050000-5554-9ed0-eb1a-e2ba9aa1d439	5215	Ročinj
00050000-5554-9ed0-6905-2386db25ede7	3250	Rogaška Slatina
00050000-5554-9ed0-68a9-a208b4a99be8	9262	Rogašovci
00050000-5554-9ed0-328a-dd3d335567ae	3252	Rogatec
00050000-5554-9ed0-e785-a791667cae28	1373	Rovte
00050000-5554-9ed0-e6b2-dc2df194e342	2342	Ruše
00050000-5554-9ed0-b642-60c0b0acb19e	1282	Sava
00050000-5554-9ed0-43f8-48cf961b0c96	6333	Sečovlje/Sicciole
00050000-5554-9ed0-58a7-0a0ad2f5eb12	4227	Selca
00050000-5554-9ed0-228a-8dfc3d404a27	2352	Selnica ob Dravi
00050000-5554-9ed0-7376-4423a4c5b9b8	8333	Semič
00050000-5554-9ed0-bdf5-b66f1e72c07c	8281	Senovo
00050000-5554-9ed0-7573-fcfbce23f960	6224	Senožeče
00050000-5554-9ed0-b9a6-741ec3f508dc	8290	Sevnica
00050000-5554-9ed0-8604-e9e03c92b8b9	6210	Sežana
00050000-5554-9ed0-c044-a14086858914	2214	Sladki Vrh
00050000-5554-9ed0-d1a6-22096e37a5e9	5283	Slap ob Idrijci
00050000-5554-9ed0-cd4f-6b54d4d77aef	2380	Slovenj Gradec
00050000-5554-9ed0-b661-b80a9fc7bf98	2310	Slovenska Bistrica
00050000-5554-9ed0-0591-147c68c86f90	3210	Slovenske Konjice
00050000-5554-9ed0-1307-5f4ba8ae1d80	1216	Smlednik
00050000-5554-9ed0-4493-6d08fa609c7d	5232	Soča
00050000-5554-9ed0-9933-9a03d994c253	1317	Sodražica
00050000-5554-9ed0-3bd2-13c7973b801f	3335	Solčava
00050000-5554-9ed0-c3e7-b516f5a77153	5250	Solkan
00050000-5554-9ed0-fe82-3d83e9553447	4229	Sorica
00050000-5554-9ed0-d7e3-be80f081a6c0	4225	Sovodenj
00050000-5554-9ed0-ce67-0a7a01119f22	5281	Spodnja Idrija
00050000-5554-9ed0-297d-921e947e21ce	2241	Spodnji Duplek
00050000-5554-9ed0-232c-f23bdcef6b20	9245	Spodnji Ivanjci
00050000-5554-9ed0-b790-38704d9347f8	2277	Središče ob Dravi
00050000-5554-9ed0-c5a9-d08f161dc5fc	4267	Srednja vas v Bohinju
00050000-5554-9ed0-a55b-cdecdcd9dedf	8256	Sromlje 
00050000-5554-9ed0-2915-61a8c0a873b0	5224	Srpenica
00050000-5554-9ed0-b51e-bd9fedb77962	1242	Stahovica
00050000-5554-9ed0-6887-54447e304340	1332	Stara Cerkev
00050000-5554-9ed0-6958-b458ab617c1f	8342	Stari trg ob Kolpi
00050000-5554-9ed0-9bc4-d1a6709a02b5	1386	Stari trg pri Ložu
00050000-5554-9ed0-8f2e-bfdb213893ca	2205	Starše
00050000-5554-9ed0-220f-6540a20203e4	2289	Stoperce
00050000-5554-9ed0-7928-3b7062fdf733	8322	Stopiče
00050000-5554-9ed0-52a8-568b419dbb11	3206	Stranice
00050000-5554-9ed0-25ad-abe3c2672644	8351	Straža
00050000-5554-9ed0-6bc9-d094c559fbed	1313	Struge
00050000-5554-9ed0-d010-98720c25ffe0	8293	Studenec
00050000-5554-9ed0-7873-be5cbcac4794	8331	Suhor
00050000-5554-9ed0-32f7-a91c6fbb4a44	2233	Sv. Ana v Slovenskih goricah
00050000-5554-9ed0-834c-2a16056126ac	2235	Sv. Trojica v Slovenskih goricah
00050000-5554-9ed0-4948-79899b5c6c3f	2353	Sveti Duh na Ostrem Vrhu
00050000-5554-9ed0-8854-b6b80877fced	9244	Sveti Jurij ob Ščavnici
00050000-5554-9ed0-cae8-20548554f1a2	3264	Sveti Štefan
00050000-5554-9ed0-ceb6-ba4e8e1e62ec	2258	Sveti Tomaž
00050000-5554-9ed0-971c-150ff12ec164	9204	Šalovci
00050000-5554-9ed0-4a23-21d03fdcf420	5261	Šempas
00050000-5554-9ed0-007f-d41a59cebc98	5290	Šempeter pri Gorici
00050000-5554-9ed0-2f37-bd92a3902aee	3311	Šempeter v Savinjski dolini
00050000-5554-9ed0-9376-8b3ddba290da	4208	Šenčur
00050000-5554-9ed0-e350-8d6a5a3ac97c	2212	Šentilj v Slovenskih goricah
00050000-5554-9ed0-0f86-4ffa29187a8a	8297	Šentjanž
00050000-5554-9ed0-f562-af4731132f36	2373	Šentjanž pri Dravogradu
00050000-5554-9ed0-c404-bf49bcf1769d	8310	Šentjernej
00050000-5554-9ed0-1102-a3a12c914684	3230	Šentjur
00050000-5554-9ed0-34a5-0883bd63cebf	3271	Šentrupert
00050000-5554-9ed0-aac2-88b1ef16d3a6	8232	Šentrupert
00050000-5554-9ed0-ac10-7d9d537bf20e	1296	Šentvid pri Stični
00050000-5554-9ed0-f975-d8387e7741c8	8275	Škocjan
00050000-5554-9ed0-efc6-9ad8d5b5abb4	6281	Škofije
00050000-5554-9ed0-630d-3c34c64ac953	4220	Škofja Loka
00050000-5554-9ed0-390b-635d23035d61	3211	Škofja vas
00050000-5554-9ed0-31e1-3865af9c6397	1291	Škofljica
00050000-5554-9ed0-985d-ecc1e964686a	6274	Šmarje
00050000-5554-9ed0-e6f8-33c95099fc4d	1293	Šmarje - Sap
00050000-5554-9ed0-9f9c-890f7257cbeb	3240	Šmarje pri Jelšah
00050000-5554-9ed0-441e-913c165004df	8220	Šmarješke Toplice
00050000-5554-9ed0-e22c-4cc85ad1c290	2315	Šmartno na Pohorju
00050000-5554-9ed0-debf-80eda89681eb	3341	Šmartno ob Dreti
00050000-5554-9ed0-3d23-1946a463e41a	3327	Šmartno ob Paki
00050000-5554-9ed0-a796-1fb63c9052ad	1275	Šmartno pri Litiji
00050000-5554-9ed0-5981-e42e86496169	2383	Šmartno pri Slovenj Gradcu
00050000-5554-9ed0-0e84-48f884ee4254	3201	Šmartno v Rožni dolini
00050000-5554-9ed0-a5d9-d3b5ac965019	3325	Šoštanj
00050000-5554-9ed0-faf7-1cbbc9bbbc3a	6222	Štanjel
00050000-5554-9ed0-358d-4e8e5ffa9364	3220	Štore
00050000-5554-9ed0-9c1c-460da18d5cf7	3304	Tabor
00050000-5554-9ed0-b570-d5bd36eba5bb	3221	Teharje
00050000-5554-9ed0-afbd-2343757db67d	9251	Tišina
00050000-5554-9ed0-3f65-62136abbed44	5220	Tolmin
00050000-5554-9ed0-98d3-f49eece663c9	3326	Topolšica
00050000-5554-9ed0-1005-1f614919298f	2371	Trbonje
00050000-5554-9ed0-fff0-f432f8250192	1420	Trbovlje
00050000-5554-9ed0-806c-27e8090e4455	8231	Trebelno 
00050000-5554-9ed0-5b65-234a554d876d	8210	Trebnje
00050000-5554-9ed0-45f5-7cf21916b4d0	5252	Trnovo pri Gorici
00050000-5554-9ed0-3f69-1e6d6bb2fd77	2254	Trnovska vas
00050000-5554-9ed0-d349-af4b5bc61ec0	1222	Trojane
00050000-5554-9ed0-a2ba-fe9d7f12cd13	1236	Trzin
00050000-5554-9ed0-2ac6-37bccb717171	4290	Tržič
00050000-5554-9ed0-d1ae-f23994ec4950	8295	Tržišče
00050000-5554-9ed0-7de8-ceede3c43904	1311	Turjak
00050000-5554-9ed0-38c4-2fdb60b273f3	9224	Turnišče
00050000-5554-9ed0-7701-0c12158af005	8323	Uršna sela
00050000-5554-9ed0-6c41-155ca70270b4	1252	Vače
00050000-5554-9ed0-697e-62b4a6323681	3320	Velenje 
00050000-5554-9ed0-5dd4-ae4f0664dc01	3322	Velenje - poštni predali
00050000-5554-9ed0-54dc-9ab124019aac	8212	Velika Loka
00050000-5554-9ed0-360b-81f379dd237c	2274	Velika Nedelja
00050000-5554-9ed0-b23a-8e0df71d289e	9225	Velika Polana
00050000-5554-9ed0-bcbe-834fa3fe224f	1315	Velike Lašče
00050000-5554-9ed0-6808-60f7f496be2f	8213	Veliki Gaber
00050000-5554-9ed0-b5ce-743a31ef7fd6	9241	Veržej
00050000-5554-9ed0-f65a-19fffb028e6e	1312	Videm - Dobrepolje
00050000-5554-9ed0-3d90-b0e08cf039a2	2284	Videm pri Ptuju
00050000-5554-9ed0-abfa-f0000733a140	8344	Vinica
00050000-5554-9ed0-d85e-fb16ecb353e4	5271	Vipava
00050000-5554-9ed0-d231-17dd0ecc1208	4212	Visoko
00050000-5554-9ed0-6486-3e77e377e1dc	1294	Višnja Gora
00050000-5554-9ed0-9ef1-1839331e86ac	3205	Vitanje
00050000-5554-9ed0-3a7b-8d38b6bfa42e	2255	Vitomarci
00050000-5554-9ed0-6d2d-9359a70b4f2f	1217	Vodice
00050000-5554-9ed0-d60f-032749ad3886	3212	Vojnik\t
00050000-5554-9ed0-3100-071e24e89c91	5293	Volčja Draga
00050000-5554-9ed0-dbf5-856fadeec74f	2232	Voličina
00050000-5554-9ed0-ffee-074cf59370fa	3305	Vransko
00050000-5554-9ed0-dfc3-0497336f3bc5	6217	Vremski Britof
00050000-5554-9ed0-1cb0-e983eea589ff	1360	Vrhnika
00050000-5554-9ed0-eab1-02bcc45212bb	2365	Vuhred
00050000-5554-9ed0-cf74-518e3e995f4f	2367	Vuzenica
00050000-5554-9ed0-9809-63e7735002c1	8292	Zabukovje 
00050000-5554-9ed0-7526-435d8e3a3ce7	1410	Zagorje ob Savi
00050000-5554-9ed0-234e-95f41d6e6520	1303	Zagradec
00050000-5554-9ed0-0a30-8d6601d01f78	2283	Zavrč
00050000-5554-9ed0-1b59-dcee4c10ec7a	8272	Zdole 
00050000-5554-9ed0-9095-bd0785e7918f	4201	Zgornja Besnica
00050000-5554-9ed0-2526-e890ce8b15c3	2242	Zgornja Korena
00050000-5554-9ed0-0ec0-b80de4e41849	2201	Zgornja Kungota
00050000-5554-9ed0-4431-6b7d7c04f81e	2316	Zgornja Ložnica
00050000-5554-9ed0-3aa6-3240d7bde9a6	2314	Zgornja Polskava
00050000-5554-9ed0-eb2f-4e7c6bafa5e3	2213	Zgornja Velka
00050000-5554-9ed0-2f05-f556a3ef4a7e	4247	Zgornje Gorje
00050000-5554-9ed0-35e3-665fdffb27ba	4206	Zgornje Jezersko
00050000-5554-9ed0-f9de-a494f37abf46	2285	Zgornji Leskovec
00050000-5554-9ed0-23c1-9a43b62df430	1432	Zidani Most
00050000-5554-9ed0-77bd-42a859689d17	3214	Zreče
00050000-5554-9ed0-425c-4ee86b04321e	4209	Žabnica
00050000-5554-9ed0-4a4b-edf881dbeb3e	3310	Žalec
00050000-5554-9ed0-397e-fcd5aef0d904	4228	Železniki
00050000-5554-9ed0-ec82-c28f68f2c56c	2287	Žetale
00050000-5554-9ed0-0eb6-9aa00d9584af	4226	Žiri
00050000-5554-9ed0-5045-fcde1c56bbc5	4274	Žirovnica
00050000-5554-9ed0-3a60-da4a3681b13f	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 3410851)
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
-- TOC entry 2642 (class 0 OID 3410678)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 3410744)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 3410863)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 3410968)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 3411015)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 3410892)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 3410836)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 3410826)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 3411005)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 3410958)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 3410545)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5554-9ed1-9c99-fbfe193412a2	00010000-5554-9ed1-1bdb-c7e51dcf34cf	2015-05-14 15:10:41	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO8hUGbWnzFsRh3oPdWrtZtHRzG25hviG";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 3410901)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 3410583)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5554-9ed1-27ab-2c2a8922b091	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5554-9ed1-f6ec-f2f56fb4d2f3	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5554-9ed1-d791-cf1f2fc7efb0	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5554-9ed1-d072-4a8f9b65d309	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5554-9ed1-a5ee-e76e1974d1b9	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5554-9ed1-f366-b7cbb958225d	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 3410567)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5554-9ed1-9c99-fbfe193412a2	00020000-5554-9ed1-d072-4a8f9b65d309
00010000-5554-9ed1-1bdb-c7e51dcf34cf	00020000-5554-9ed1-d072-4a8f9b65d309
\.


--
-- TOC entry 2668 (class 0 OID 3410915)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 3410857)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 3410807)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 3410643)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 3410813)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 3410993)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 3410713)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 3410554)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5554-9ed1-1bdb-c7e51dcf34cf	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRODSxatjwos7X/QPT3tZdW9GA47.X65ZK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5554-9ed1-9c99-fbfe193412a2	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 3411047)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 3410759)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 3410884)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 3410950)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 3410791)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 3411037)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 3410940)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2274 (class 2606 OID 3410608)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 3411087)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 3411080)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 3410992)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 3410781)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2343 (class 2606 OID 3410806)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 3410739)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 3410936)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 3410757)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 3410800)
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
-- TOC entry 2364 (class 2606 OID 3410849)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 3410876)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2303 (class 2606 OID 3410711)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2278 (class 2606 OID 3410617)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2293 (class 2606 OID 3410675)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2280 (class 2606 OID 3410641)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2272 (class 2606 OID 3410597)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2265 (class 2606 OID 3410582)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 3410882)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 3410914)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 3411032)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2288 (class 2606 OID 3410668)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 3410699)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 3410855)
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
-- TOC entry 2298 (class 2606 OID 3410689)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 3410748)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 3410867)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 3410974)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 3411020)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 3410899)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 3410840)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 3410831)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 3411014)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 3410965)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2257 (class 2606 OID 3410553)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 3410905)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 3410571)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2267 (class 2606 OID 3410591)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2395 (class 2606 OID 3410923)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 3410862)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 3410812)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2285 (class 2606 OID 3410648)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 3410822)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 3411004)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2308 (class 2606 OID 3410724)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 3410566)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 3411062)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 3410766)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 3410890)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 3410956)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 3410795)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 3411046)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 3410949)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 1259 OID 3410788)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2286 (class 1259 OID 3410670)
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
-- TOC entry 2377 (class 1259 OID 3410883)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2371 (class 1259 OID 3410869)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2372 (class 1259 OID 3410868)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2323 (class 1259 OID 3410767)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 3410939)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2399 (class 1259 OID 3410937)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 3410938)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2423 (class 1259 OID 3411034)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2424 (class 1259 OID 3411035)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2425 (class 1259 OID 3411036)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 3411065)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 3411064)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 3411063)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2305 (class 1259 OID 3410726)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2306 (class 1259 OID 3410725)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2290 (class 1259 OID 3410677)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 3410676)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2386 (class 1259 OID 3410906)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2341 (class 1259 OID 3410801)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2269 (class 1259 OID 3410598)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2270 (class 1259 OID 3410599)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2391 (class 1259 OID 3410926)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2392 (class 1259 OID 3410925)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2393 (class 1259 OID 3410924)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2315 (class 1259 OID 3410749)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2316 (class 1259 OID 3410751)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2317 (class 1259 OID 3410750)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2351 (class 1259 OID 3410835)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2352 (class 1259 OID 3410833)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2353 (class 1259 OID 3410832)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2354 (class 1259 OID 3410834)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2260 (class 1259 OID 3410572)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2261 (class 1259 OID 3410573)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2380 (class 1259 OID 3410891)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2366 (class 1259 OID 3410856)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2406 (class 1259 OID 3410966)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2407 (class 1259 OID 3410967)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2294 (class 1259 OID 3410691)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2295 (class 1259 OID 3410690)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2296 (class 1259 OID 3410692)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2410 (class 1259 OID 3410975)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2411 (class 1259 OID 3410976)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 3411090)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 3411089)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 3411092)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 3411088)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2446 (class 1259 OID 3411091)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2403 (class 1259 OID 3410957)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2357 (class 1259 OID 3410844)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2358 (class 1259 OID 3410843)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2359 (class 1259 OID 3410841)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2360 (class 1259 OID 3410842)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2247 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 3411082)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 3411081)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2322 (class 1259 OID 3410758)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2275 (class 1259 OID 3410619)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2276 (class 1259 OID 3410618)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2282 (class 1259 OID 3410649)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2283 (class 1259 OID 3410650)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2346 (class 1259 OID 3410825)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2347 (class 1259 OID 3410824)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2348 (class 1259 OID 3410823)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2329 (class 1259 OID 3410790)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2330 (class 1259 OID 3410786)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2331 (class 1259 OID 3410783)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2332 (class 1259 OID 3410784)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2333 (class 1259 OID 3410782)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2334 (class 1259 OID 3410787)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2335 (class 1259 OID 3410785)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2289 (class 1259 OID 3410669)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2311 (class 1259 OID 3410740)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 3410742)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2313 (class 1259 OID 3410741)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2314 (class 1259 OID 3410743)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2365 (class 1259 OID 3410850)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2428 (class 1259 OID 3411033)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2281 (class 1259 OID 3410642)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2304 (class 1259 OID 3410712)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2385 (class 1259 OID 3410900)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2250 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2301 (class 1259 OID 3410700)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2422 (class 1259 OID 3411021)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2268 (class 1259 OID 3410592)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2336 (class 1259 OID 3410789)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2471 (class 2606 OID 3411223)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 3411208)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 3411213)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2469 (class 2606 OID 3411233)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2475 (class 2606 OID 3411203)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2470 (class 2606 OID 3411228)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 3411218)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 3411138)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 3411318)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2490 (class 2606 OID 3411313)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2491 (class 2606 OID 3411308)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 3411198)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2498 (class 2606 OID 3411358)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 3411348)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 3411353)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 3411298)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 3411393)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 3411398)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 3411403)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2510 (class 2606 OID 3411418)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 3411413)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 3411408)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2462 (class 2606 OID 3411173)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 3411168)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 3411148)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 3411143)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 3411123)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 3411328)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 3411238)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 3411103)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2449 (class 2606 OID 3411108)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2495 (class 2606 OID 3411343)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 3411338)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 3411333)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 3411178)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 3411188)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 3411183)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2480 (class 2606 OID 3411273)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2482 (class 2606 OID 3411263)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2483 (class 2606 OID 3411258)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2481 (class 2606 OID 3411268)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 3411093)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2447 (class 2606 OID 3411098)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 3411323)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 3411303)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2503 (class 2606 OID 3411368)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2502 (class 2606 OID 3411373)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 3411158)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 3411153)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 3411163)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2505 (class 2606 OID 3411378)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 3411383)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 3411443)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 3411438)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2515 (class 2606 OID 3411453)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 3411433)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2516 (class 2606 OID 3411448)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 3411363)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 3411293)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2485 (class 2606 OID 3411288)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 3411278)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2486 (class 2606 OID 3411283)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2513 (class 2606 OID 3411428)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2514 (class 2606 OID 3411423)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 3411193)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 3411388)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 3411118)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 3411113)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2455 (class 2606 OID 3411128)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 3411133)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2477 (class 2606 OID 3411253)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 3411248)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 3411243)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-14 15:10:42 CEST

--
-- PostgreSQL database dump complete
--

