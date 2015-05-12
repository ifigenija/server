--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-12 09:16:13 CEST

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
-- TOC entry 179 (class 1259 OID 3098678)
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
-- TOC entry 225 (class 1259 OID 3099162)
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
-- TOC entry 224 (class 1259 OID 3099145)
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
-- TOC entry 217 (class 1259 OID 3099059)
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
-- TOC entry 193 (class 1259 OID 3098843)
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
-- TOC entry 196 (class 1259 OID 3098884)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 3098805)
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
-- TOC entry 212 (class 1259 OID 3099009)
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
-- TOC entry 191 (class 1259 OID 3098830)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 3098878)
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
-- TOC entry 201 (class 1259 OID 3098927)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 3098952)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 3098779)
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
-- TOC entry 180 (class 1259 OID 3098687)
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
-- TOC entry 181 (class 1259 OID 3098698)
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
-- TOC entry 184 (class 1259 OID 3098749)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 3098652)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 3098671)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 3098959)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 3098989)
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
-- TOC entry 221 (class 1259 OID 3099101)
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
-- TOC entry 183 (class 1259 OID 3098729)
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
-- TOC entry 186 (class 1259 OID 3098771)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 3098933)
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
-- TOC entry 185 (class 1259 OID 3098756)
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
-- TOC entry 190 (class 1259 OID 3098822)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 3098945)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 3099050)
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
-- TOC entry 220 (class 1259 OID 3099094)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 3098974)
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
-- TOC entry 200 (class 1259 OID 3098918)
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
-- TOC entry 199 (class 1259 OID 3098908)
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
-- TOC entry 219 (class 1259 OID 3099084)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 3099040)
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
-- TOC entry 173 (class 1259 OID 3098623)
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
-- TOC entry 172 (class 1259 OID 3098621)
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
-- TOC entry 209 (class 1259 OID 3098983)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 3098661)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 3098645)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 3098997)
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
-- TOC entry 203 (class 1259 OID 3098939)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 3098889)
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
-- TOC entry 182 (class 1259 OID 3098721)
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
-- TOC entry 198 (class 1259 OID 3098895)
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
-- TOC entry 218 (class 1259 OID 3099075)
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
-- TOC entry 188 (class 1259 OID 3098791)
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
-- TOC entry 174 (class 1259 OID 3098632)
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
-- TOC entry 223 (class 1259 OID 3099126)
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
-- TOC entry 192 (class 1259 OID 3098837)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 3098966)
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
-- TOC entry 214 (class 1259 OID 3099032)
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
-- TOC entry 194 (class 1259 OID 3098865)
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
-- TOC entry 222 (class 1259 OID 3099116)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 3099022)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 3098626)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2637 (class 0 OID 3098678)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2683 (class 0 OID 3099162)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 3099145)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 3099059)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 3098843)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 3098884)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 3098805)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5551-a8bc-67cd-ed6c5acf2bf4	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5551-a8bc-a036-1ed2f2f86a5a	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5551-a8bc-e5ce-663c4eda1c22	AL	ALB	008	Albania 	Albanija	\N
00040000-5551-a8bc-cba1-23173392715b	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5551-a8bc-9883-674bf048530e	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5551-a8bd-18c4-bac041fc6e6b	AD	AND	020	Andorra 	Andora	\N
00040000-5551-a8bd-dfb1-c5447a3bb4a5	AO	AGO	024	Angola 	Angola	\N
00040000-5551-a8bd-dfe8-5db7bd51af86	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5551-a8bd-b9bb-70872bec39c0	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5551-a8bd-e8db-ecbed5dbc127	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5551-a8bd-7d3c-f6846f527072	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5551-a8bd-16d9-48dd9ec51459	AM	ARM	051	Armenia 	Armenija	\N
00040000-5551-a8bd-3561-76e476ff2a77	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5551-a8bd-583f-b822b83b6a9a	AU	AUS	036	Australia 	Avstralija	\N
00040000-5551-a8bd-1b81-bbc1b0d46e21	AT	AUT	040	Austria 	Avstrija	\N
00040000-5551-a8bd-6f7f-ad7d8ecbdfd0	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5551-a8bd-0226-7904a596c80e	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5551-a8bd-ae33-bca96305f4f0	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5551-a8bd-ce3a-ddae5709929f	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5551-a8bd-4eec-ef0bc43ba833	BB	BRB	052	Barbados 	Barbados	\N
00040000-5551-a8bd-3dd9-db55bfecd2fe	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5551-a8bd-6af8-5c098ccae11d	BE	BEL	056	Belgium 	Belgija	\N
00040000-5551-a8bd-20a5-389879959a84	BZ	BLZ	084	Belize 	Belize	\N
00040000-5551-a8bd-f732-b34308de69ca	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5551-a8bd-602a-aae31693dcb7	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5551-a8bd-0670-5527dd67e677	BT	BTN	064	Bhutan 	Butan	\N
00040000-5551-a8bd-9fec-e8ef169e7022	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5551-a8bd-4ffb-763a338581fa	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5551-a8bd-e0e6-3e5b82cc949b	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5551-a8bd-1555-289de65c5279	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5551-a8bd-739e-7127c47f0c11	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5551-a8bd-157f-4fbd707d014f	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5551-a8bd-de66-16df59cd45c9	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5551-a8bd-8752-930da36ea5a2	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5551-a8bd-8e4d-506d7b10e659	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5551-a8bd-bd01-8c1c5efd596b	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5551-a8bd-46fb-6460e133d8a1	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5551-a8bd-797e-b6d9aa8bf86f	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5551-a8bd-4bcf-3c3547cf734f	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5551-a8bd-3292-2268e394cd39	CA	CAN	124	Canada 	Kanada	\N
00040000-5551-a8bd-103e-990c9537ab38	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5551-a8bd-4929-a5a7c05fea5e	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5551-a8bd-ae69-37d082a6a7cf	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5551-a8bd-f27e-1f26ffc73914	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5551-a8bd-f979-8cbb9d9eb335	CL	CHL	152	Chile 	Čile	\N
00040000-5551-a8bd-56f5-4d1cb0d10140	CN	CHN	156	China 	Kitajska	\N
00040000-5551-a8bd-e3aa-6fde87e693b3	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5551-a8bd-381d-4d30ce21baa8	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5551-a8bd-6ba8-862173e4c2a5	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5551-a8bd-c9c0-749774c527b9	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5551-a8bd-c450-764c639a8e97	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5551-a8bd-5561-290729839c79	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5551-a8bd-84fc-7f89638150fc	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5551-a8bd-e2b0-1337838521f5	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5551-a8bd-aad6-eab65a47a61b	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5551-a8bd-de1c-f5c1b427a0b3	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5551-a8bd-fec4-526bd367cfcc	CU	CUB	192	Cuba 	Kuba	\N
00040000-5551-a8bd-141b-3a8e7052eb40	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5551-a8bd-88be-c2dd4906da84	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5551-a8bd-ce6c-d0b442591848	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5551-a8bd-2a01-a096dc51eaf5	DK	DNK	208	Denmark 	Danska	\N
00040000-5551-a8bd-1182-5a10c7c2b742	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5551-a8bd-d4a1-b52bc25c1ac8	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5551-a8bd-c798-f2dbb5160679	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5551-a8bd-c652-914455ce7ab2	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5551-a8bd-535c-46f9e2058688	EG	EGY	818	Egypt 	Egipt	\N
00040000-5551-a8bd-a59f-a3cc45643977	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5551-a8bd-00d2-a7e9e916c967	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5551-a8bd-b495-ace6a68aae75	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5551-a8bd-843e-32b3ff8c63c5	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5551-a8bd-ee8b-124eb0b3c323	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5551-a8bd-6cac-30c3bbd5dbe1	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5551-a8bd-e5f9-8e63b9993af7	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5551-a8bd-4d4b-259202f4b59f	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5551-a8bd-bd05-b8d9882da0f8	FI	FIN	246	Finland 	Finska	\N
00040000-5551-a8bd-49a2-228b7deb350f	FR	FRA	250	France 	Francija	\N
00040000-5551-a8bd-6137-38e82b200fb0	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5551-a8bd-bbb4-26e0f75ded33	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5551-a8bd-51aa-122bd88c7dde	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5551-a8bd-2b62-c24e04dd98bb	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5551-a8bd-ab38-2c29ae8ef308	GA	GAB	266	Gabon 	Gabon	\N
00040000-5551-a8bd-dfba-995b3ef51b4a	GM	GMB	270	Gambia 	Gambija	\N
00040000-5551-a8bd-eba6-d0ffc6e7e235	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5551-a8bd-beff-208aaed42132	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5551-a8bd-dc7a-ce368ba4d5f4	GH	GHA	288	Ghana 	Gana	\N
00040000-5551-a8bd-9934-42be5ab38112	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5551-a8bd-b815-23e60da3f7ff	GR	GRC	300	Greece 	Grčija	\N
00040000-5551-a8bd-0522-df992b6c03fd	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5551-a8bd-48cd-18387a590c80	GD	GRD	308	Grenada 	Grenada	\N
00040000-5551-a8bd-8783-2f75730047b0	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5551-a8bd-895c-420fbe4ad873	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5551-a8bd-0ccb-4e4b5ab0b04f	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5551-a8bd-1ff1-2ea845f8fcfa	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5551-a8bd-bb3b-d41e3e87297e	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5551-a8bd-169f-443d5f7e4493	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5551-a8bd-a494-0f010a26c6d4	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5551-a8bd-7e9f-7f236b455819	HT	HTI	332	Haiti 	Haiti	\N
00040000-5551-a8bd-eba4-a0328633a34f	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5551-a8bd-8a76-685d9144c0c4	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5551-a8bd-4c10-20124b4dc800	HN	HND	340	Honduras 	Honduras	\N
00040000-5551-a8bd-ec33-dee9aca3fa6d	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5551-a8bd-7c9f-768722a42d5d	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5551-a8bd-0322-37786a255dce	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5551-a8bd-e9f2-23271c8b8fc2	IN	IND	356	India 	Indija	\N
00040000-5551-a8bd-d382-697641318b21	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5551-a8bd-646a-ac99efc3f572	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5551-a8bd-851c-72759aea8cc0	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5551-a8bd-78fb-a66a7fd89b65	IE	IRL	372	Ireland 	Irska	\N
00040000-5551-a8bd-cb0f-7b9d41c36cbd	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5551-a8bd-4525-bd89eb50a0a0	IL	ISR	376	Israel 	Izrael	\N
00040000-5551-a8bd-a912-332aba98c45f	IT	ITA	380	Italy 	Italija	\N
00040000-5551-a8bd-3b0d-c353d8704f28	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5551-a8bd-11be-f356c2dbb151	JP	JPN	392	Japan 	Japonska	\N
00040000-5551-a8bd-803c-f9508fbb2a7c	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5551-a8bd-23f5-7cd03d2a4876	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5551-a8bd-bc14-036acd467d38	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5551-a8bd-037e-89eff0d7a143	KE	KEN	404	Kenya 	Kenija	\N
00040000-5551-a8bd-e47b-5ab16815532a	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5551-a8bd-3fc2-ede0984f6934	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5551-a8bd-0ea1-19975d2a3ea2	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5551-a8bd-50d4-2b08b5cbce5e	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5551-a8bd-8620-5607ff9ee63a	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5551-a8bd-e66e-eab64c49480c	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5551-a8bd-08a0-7a6473fc9102	LV	LVA	428	Latvia 	Latvija	\N
00040000-5551-a8bd-d100-3a4b3d102691	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5551-a8bd-a84b-0fb1a5930d25	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5551-a8bd-79ae-8af3df97ddd4	LR	LBR	430	Liberia 	Liberija	\N
00040000-5551-a8bd-0f93-f455eddecf3e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5551-a8bd-13e9-ccbfd73c7075	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5551-a8bd-d871-f5bb18b8cd13	LT	LTU	440	Lithuania 	Litva	\N
00040000-5551-a8bd-244c-0c1905cd7c47	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5551-a8bd-23c3-c454d2c2e853	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5551-a8bd-faf9-5ff6505a1389	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5551-a8bd-b76c-07bb8e6c2168	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5551-a8bd-9eaf-f38a9c2b05b5	MW	MWI	454	Malawi 	Malavi	\N
00040000-5551-a8bd-75a9-a39d8d78a752	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5551-a8bd-4157-fe654503278e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5551-a8bd-ffb8-b876ec0b20f5	ML	MLI	466	Mali 	Mali	\N
00040000-5551-a8bd-3033-71537d285cc0	MT	MLT	470	Malta 	Malta	\N
00040000-5551-a8bd-38ad-bb749d801ce4	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5551-a8bd-1681-fc8376116385	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5551-a8bd-da59-d712b5abb604	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5551-a8bd-3052-67f12ab1dea3	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5551-a8bd-9dd6-439a3e9be423	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5551-a8bd-601e-625332b0b7e3	MX	MEX	484	Mexico 	Mehika	\N
00040000-5551-a8bd-239c-2371608aa0bb	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5551-a8bd-fb65-5c1b35bb2c3e	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5551-a8bd-31b9-cdefa8c68f00	MC	MCO	492	Monaco 	Monako	\N
00040000-5551-a8bd-130c-0ffa7281fcaf	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5551-a8bd-7c0f-1f675fb794d2	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5551-a8bd-bca9-058fe0e2e73e	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5551-a8bd-6562-bcd49e141642	MA	MAR	504	Morocco 	Maroko	\N
00040000-5551-a8bd-f795-3da11c1ab667	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5551-a8bd-94fd-2c0f296f974d	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5551-a8bd-0399-9a1b0dd06051	NA	NAM	516	Namibia 	Namibija	\N
00040000-5551-a8bd-4e71-9b4bea597f81	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5551-a8bd-c691-a1c12823ccda	NP	NPL	524	Nepal 	Nepal	\N
00040000-5551-a8bd-224f-d5c51d896dbd	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5551-a8bd-7e80-b494422e9629	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5551-a8bd-0660-774e2ecb9fe1	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5551-a8bd-6bda-3486c5b32623	NE	NER	562	Niger 	Niger 	\N
00040000-5551-a8bd-9e2f-68497cef2f81	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5551-a8bd-325c-2cfe15fb78b5	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5551-a8bd-e030-3d4dc11f78ed	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5551-a8bd-e480-7fcf80edbc67	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5551-a8bd-ebc1-c54c48f06093	NO	NOR	578	Norway 	Norveška	\N
00040000-5551-a8bd-7be4-3b24dd7a96be	OM	OMN	512	Oman 	Oman	\N
00040000-5551-a8bd-188b-2af495c52bf0	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5551-a8bd-f349-eed6bb8be555	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5551-a8bd-032e-ff9923d992e1	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5551-a8bd-4de9-7d2ac1aed8b3	PA	PAN	591	Panama 	Panama	\N
00040000-5551-a8bd-b880-77e80521ebc8	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5551-a8bd-0bb5-32e736fdee78	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5551-a8bd-0d89-c2d3bb63fe79	PE	PER	604	Peru 	Peru	\N
00040000-5551-a8bd-4bf5-95643218d9cf	PH	PHL	608	Philippines 	Filipini	\N
00040000-5551-a8bd-03d3-91600927762c	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5551-a8bd-ccb2-865334c69657	PL	POL	616	Poland 	Poljska	\N
00040000-5551-a8bd-041a-74437982379b	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5551-a8bd-0f32-f7de5c362e9d	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5551-a8bd-5f1b-755d1b37e374	QA	QAT	634	Qatar 	Katar	\N
00040000-5551-a8bd-4222-c4bc0b79342d	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5551-a8bd-ec83-4d5198fb4def	RO	ROU	642	Romania 	Romunija	\N
00040000-5551-a8bd-7e49-820c5c3874a8	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5551-a8bd-1c91-e5803929d7d6	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5551-a8bd-95fd-744bb6f40c9e	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5551-a8bd-e58d-720b5225d0b8	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5551-a8bd-5ea2-6e9d149d4507	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5551-a8bd-55fc-fbf8e75bab42	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5551-a8bd-e805-f401126a4796	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5551-a8bd-b090-b96785cd49e3	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5551-a8bd-9d8b-842e1697aef6	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5551-a8bd-9a01-07cb3908fd7a	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5551-a8bd-17f8-eefff78ccb30	SM	SMR	674	San Marino 	San Marino	\N
00040000-5551-a8bd-1c1b-53d219c1d650	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5551-a8bd-c906-20bdf55e482a	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5551-a8bd-4bf1-5d9cb509d8bf	SN	SEN	686	Senegal 	Senegal	\N
00040000-5551-a8bd-9426-2469053483db	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5551-a8bd-6612-edcc62ad7c0e	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5551-a8bd-4533-7f5f3233bac3	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5551-a8bd-6b8d-ed9ab0242a6b	SG	SGP	702	Singapore 	Singapur	\N
00040000-5551-a8bd-0dd3-f60b0771c00a	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5551-a8bd-ad06-c456ba33b175	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5551-a8bd-e5ee-35823caa5931	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5551-a8bd-5428-a9f51355e9fb	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5551-a8bd-cbcd-b9bdf664bbbe	SO	SOM	706	Somalia 	Somalija	\N
00040000-5551-a8bd-da59-85b160b391a5	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5551-a8bd-fed5-370844da4904	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5551-a8bd-96c9-87526c8a366d	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5551-a8bd-2015-14686601760f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5551-a8bd-89b0-24d6decb1db8	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5551-a8bd-2adf-e3e33b5a6973	SD	SDN	729	Sudan 	Sudan	\N
00040000-5551-a8bd-5e55-0aa32132c8a0	SR	SUR	740	Suriname 	Surinam	\N
00040000-5551-a8bd-1d29-141453435d35	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5551-a8bd-07ec-5a18820af67d	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5551-a8bd-6b62-75668bf3fe3a	SE	SWE	752	Sweden 	Švedska	\N
00040000-5551-a8bd-f675-aca194e4336e	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5551-a8bd-aec2-7791b86bdab1	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5551-a8bd-ad38-3c307b1e892d	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5551-a8bd-d59e-c3d221d7c327	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5551-a8bd-ac27-0a8820b55d6d	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5551-a8bd-3d54-68bb81ec23a4	TH	THA	764	Thailand 	Tajska	\N
00040000-5551-a8bd-e08d-b2c2ac98fbf7	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5551-a8bd-82da-1f3e6de8a8b9	TG	TGO	768	Togo 	Togo	\N
00040000-5551-a8bd-9381-8125fe0513c3	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5551-a8bd-72fd-b3ab3f68510e	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5551-a8bd-77e7-d47416d29bda	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5551-a8bd-5082-afbe5a94d76b	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5551-a8bd-540d-8a93e31b8eed	TR	TUR	792	Turkey 	Turčija	\N
00040000-5551-a8bd-3c93-ae24997df1b5	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5551-a8bd-2bbc-e983f25e51d6	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5551-a8bd-28b5-85efcbab66aa	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5551-a8bd-1106-1fd450c16f47	UG	UGA	800	Uganda 	Uganda	\N
00040000-5551-a8bd-5366-3573e725a2f3	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5551-a8bd-239a-b70b2b68ac19	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5551-a8bd-227f-d3c6698c59dc	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5551-a8bd-7237-fc8e4009d0a9	US	USA	840	United States 	Združene države Amerike	\N
00040000-5551-a8bd-1762-69e8e14ccec0	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5551-a8bd-54b7-03d7503cdf61	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5551-a8bd-0b7b-75d8d97de803	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5551-a8bd-576f-16b0ff9cc836	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5551-a8bd-89f8-7f590c91669a	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5551-a8bd-f71c-71d016480363	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5551-a8bd-dc39-5d4f2e8a3a42	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5551-a8bd-b4c3-32934872b92e	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5551-a8bd-7d5f-285d2202c09c	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5551-a8bd-78e6-cafb35f4f788	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5551-a8bd-367f-b88b2fe7c0dc	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5551-a8bd-b738-91eb7af3a5a9	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5551-a8bd-4596-7f7f8fada425	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2670 (class 0 OID 3099009)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 3098830)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 3098878)
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
-- TOC entry 2659 (class 0 OID 3098927)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 3098952)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 3098779)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5551-a8bd-ca15-e7abc836d9dc	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5551-a8bd-a149-8fc8d840161b	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5551-a8bd-91a9-def8dddb6377	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5551-a8bd-8f6b-207592b99dee	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5551-a8bd-00ba-0204404951bd	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5551-a8bd-faae-2de5f0c4b6f3	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5551-a8bd-f8c8-ef87f19e5b6f	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5551-a8bd-ce79-ae1a2a98bbe3	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5551-a8bd-45a9-a7f8566cdbc9	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5551-a8bd-7005-98401a8ee4f7	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2638 (class 0 OID 3098687)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5551-a8bd-4dc8-83f33a83c1fa	00000000-5551-a8bd-00ba-0204404951bd	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5551-a8bd-e5a2-2153f368a85f	00000000-5551-a8bd-00ba-0204404951bd	00010000-5551-a8bd-04eb-583a21edcbbb	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5551-a8bd-8e3c-3aad573493d9	00000000-5551-a8bd-faae-2de5f0c4b6f3	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2639 (class 0 OID 3098698)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 3098749)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 3098652)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5551-a8bd-c4e0-c66e207bbfe1	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5551-a8bd-9cda-94279272fac4	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5551-a8bd-4ab7-4be60410d7dd	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5551-a8bd-d9c4-72bb6b8e74bd	Abonma-read	Abonma - branje	f
00030000-5551-a8bd-fa74-67ba95489876	Abonma-write	Abonma - spreminjanje	f
00030000-5551-a8bd-9c97-4c68d742125a	Alternacija-read	Alternacija - branje	f
00030000-5551-a8bd-7fff-e71ecd0b2be0	Alternacija-write	Alternacija - spreminjanje	f
00030000-5551-a8bd-bb4c-3dcd96536973	Arhivalija-read	Arhivalija - branje	f
00030000-5551-a8bd-c7a3-1b876fa7d41f	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5551-a8bd-00c3-421877eaedd1	Besedilo-read	Besedilo - branje	f
00030000-5551-a8bd-266c-d5fc2bc8a621	Besedilo-write	Besedilo - spreminjanje	f
00030000-5551-a8bd-2e04-543cb21face3	DogodekIzven-read	DogodekIzven - branje	f
00030000-5551-a8bd-5c60-aa7deb876cca	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5551-a8bd-b9dc-8f8234a24be9	Dogodek-read	Dogodek - branje	f
00030000-5551-a8bd-04df-b928db3a585d	Dogodek-write	Dogodek - spreminjanje	f
00030000-5551-a8bd-bc50-61db35acac4e	Drzava-read	Drzava - branje	f
00030000-5551-a8bd-89db-9d8cc1b1f3a2	Drzava-write	Drzava - spreminjanje	f
00030000-5551-a8bd-947a-04abaf0f5582	Funkcija-read	Funkcija - branje	f
00030000-5551-a8bd-c93b-b19f763c7814	Funkcija-write	Funkcija - spreminjanje	f
00030000-5551-a8bd-c835-e7cd92af76bd	Gostovanje-read	Gostovanje - branje	f
00030000-5551-a8bd-21a0-96044e7dcf0e	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5551-a8bd-6b13-90c231b4a324	Gostujoca-read	Gostujoca - branje	f
00030000-5551-a8bd-9860-db6005da0655	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5551-a8bd-bd92-264928d64693	Kupec-read	Kupec - branje	f
00030000-5551-a8bd-2440-36e42e097b3e	Kupec-write	Kupec - spreminjanje	f
00030000-5551-a8bd-5f53-4b275ab3d410	NacinPlacina-read	NacinPlacina - branje	f
00030000-5551-a8bd-8288-d9830fed2acf	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5551-a8bd-2501-d696dccc54bb	Option-read	Option - branje	f
00030000-5551-a8bd-bd1e-50b6c147efce	Option-write	Option - spreminjanje	f
00030000-5551-a8bd-0ca9-39a1e33b8295	OptionValue-read	OptionValue - branje	f
00030000-5551-a8bd-b8b4-bc32e7495699	OptionValue-write	OptionValue - spreminjanje	f
00030000-5551-a8bd-3796-28cb5069af02	Oseba-read	Oseba - branje	f
00030000-5551-a8bd-f272-d8faa65caa63	Oseba-write	Oseba - spreminjanje	f
00030000-5551-a8bd-361f-998f98cfe2cb	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5551-a8bd-96d1-bc5d0f6f6c64	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5551-a8bd-51c2-6ec4ef3b3a0d	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5551-a8bd-8e9e-2081929d5d30	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5551-a8bd-2926-d1874c0ac388	Pogodba-read	Pogodba - branje	f
00030000-5551-a8bd-adc1-b3add1f6f37c	Pogodba-write	Pogodba - spreminjanje	f
00030000-5551-a8bd-d320-703e89121b29	Popa-read	Popa - branje	f
00030000-5551-a8bd-431c-c1dd2550b191	Popa-write	Popa - spreminjanje	f
00030000-5551-a8bd-3122-fffaae6c28be	Posta-read	Posta - branje	f
00030000-5551-a8bd-89c0-f8de1f08f5a8	Posta-write	Posta - spreminjanje	f
00030000-5551-a8bd-e885-719552de795d	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5551-a8bd-deb0-f4f88c8637d9	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5551-a8bd-02b3-1c49af2e0e6c	PostniNaslov-read	PostniNaslov - branje	f
00030000-5551-a8bd-d7ba-c0eaa308edca	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5551-a8bd-a7e0-ab2c354a07f5	Predstava-read	Predstava - branje	f
00030000-5551-a8bd-311b-80f83d45db5a	Predstava-write	Predstava - spreminjanje	f
00030000-5551-a8bd-50b3-db1d5d51fc19	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5551-a8bd-cac2-f88f90863e93	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5551-a8bd-1feb-6ed3e29df6bd	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5551-a8bd-068b-45145e8ebb8c	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5551-a8bd-3948-daa20b34cb17	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5551-a8bd-0fe4-5a8bf4c86787	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5551-a8bd-8cc2-86025dc3c650	Prostor-read	Prostor - branje	f
00030000-5551-a8bd-3d01-470e51008743	Prostor-write	Prostor - spreminjanje	f
00030000-5551-a8bd-d268-f0d1abac5362	Racun-read	Racun - branje	f
00030000-5551-a8bd-521f-7ece49faf02a	Racun-write	Racun - spreminjanje	f
00030000-5551-a8bd-138e-b726b92b666b	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5551-a8bd-e300-74b0d357593d	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5551-a8bd-2f50-0259082a7b75	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5551-a8bd-38ec-1ff3d93828c5	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5551-a8bd-535a-98b5900ca62a	Rekvizit-read	Rekvizit - branje	f
00030000-5551-a8bd-efce-8e7ee8667a2b	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5551-a8bd-65bb-0914319b3f56	Rezervacija-read	Rezervacija - branje	f
00030000-5551-a8bd-3b27-b2c80f3f825d	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5551-a8bd-1cf2-52485a52a273	SedezniRed-read	SedezniRed - branje	f
00030000-5551-a8bd-3e85-8631cd478209	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5551-a8bd-a656-0ee903045455	Sedez-read	Sedez - branje	f
00030000-5551-a8bd-1483-64d72928c075	Sedez-write	Sedez - spreminjanje	f
00030000-5551-a8bd-7c1b-f1ca6bc589d0	Sezona-read	Sezona - branje	f
00030000-5551-a8bd-abc6-4486122900fe	Sezona-write	Sezona - spreminjanje	f
00030000-5551-a8bd-b2fe-8378b3cf6178	Telefonska-read	Telefonska - branje	f
00030000-5551-a8bd-4a64-bad5c61e19a3	Telefonska-write	Telefonska - spreminjanje	f
00030000-5551-a8bd-8697-1dc08fb91787	TerminStoritve-read	TerminStoritve - branje	f
00030000-5551-a8bd-40a7-1efbaac826ad	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5551-a8bd-77f8-7eae60dd9659	TipFunkcije-read	TipFunkcije - branje	f
00030000-5551-a8bd-31af-075fe844d791	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5551-a8bd-2218-f00dd50a6620	Trr-read	Trr - branje	f
00030000-5551-a8bd-3517-ba87c2bc10b9	Trr-write	Trr - spreminjanje	f
00030000-5551-a8bd-1aef-902a762cf1f2	Uprizoritev-read	Uprizoritev - branje	f
00030000-5551-a8bd-8f16-f6692b7947b4	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5551-a8bd-718c-068b1e7d375f	Vaja-read	Vaja - branje	f
00030000-5551-a8bd-5350-5ebed88c9033	Vaja-write	Vaja - spreminjanje	f
00030000-5551-a8bd-10f7-810132900151	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5551-a8bd-b76d-eb62c44257d9	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5551-a8bd-a352-67a5050e46cf	Zaposlitev-read	Zaposlitev - branje	f
00030000-5551-a8bd-c1fe-ddc198e7aaac	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5551-a8bd-ed0e-9634656c536b	Zasedenost-read	Zasedenost - branje	f
00030000-5551-a8bd-fd91-9d5857dcef81	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5551-a8bd-eede-852f86ab5c84	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5551-a8bd-c74c-fcefec6022a7	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5551-a8bd-dbd9-caad926a6be6	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5551-a8bd-fd73-54358548d38f	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2636 (class 0 OID 3098671)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5551-a8bd-7882-40eb8729eeb1	00030000-5551-a8bd-bc50-61db35acac4e
00020000-5551-a8bd-2beb-2886426a31a6	00030000-5551-a8bd-89db-9d8cc1b1f3a2
00020000-5551-a8bd-2beb-2886426a31a6	00030000-5551-a8bd-bc50-61db35acac4e
\.


--
-- TOC entry 2664 (class 0 OID 3098959)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 3098989)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 3099101)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 3098729)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 3098771)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5551-a8bc-390e-e4db54d4b13f	8341	Adlešiči
00050000-5551-a8bc-a9bb-cd17e6dde420	5270	Ajdovščina
00050000-5551-a8bc-185c-b1e22c9e05a0	6280	Ankaran/Ancarano
00050000-5551-a8bc-1aa0-57425d261e1c	9253	Apače
00050000-5551-a8bc-7870-6c3c7565723b	8253	Artiče
00050000-5551-a8bc-fe0e-a525e349a5a5	4275	Begunje na Gorenjskem
00050000-5551-a8bc-5ad7-6c3452e95f07	1382	Begunje pri Cerknici
00050000-5551-a8bc-3dc7-d0f9d41f191b	9231	Beltinci
00050000-5551-a8bc-7d91-07269b5e5c17	2234	Benedikt
00050000-5551-a8bc-805c-288e131e4f0a	2345	Bistrica ob Dravi
00050000-5551-a8bc-6ea7-c9f4d72904c8	3256	Bistrica ob Sotli
00050000-5551-a8bc-403f-910629bb6a3f	8259	Bizeljsko
00050000-5551-a8bc-6355-124d404c6cdd	1223	Blagovica
00050000-5551-a8bc-a618-0f0b6778f678	8283	Blanca
00050000-5551-a8bc-3a69-496976bbbcac	4260	Bled
00050000-5551-a8bc-e12e-21597e600a67	4273	Blejska Dobrava
00050000-5551-a8bc-bdaf-70ff322750cd	9265	Bodonci
00050000-5551-a8bc-a24d-e22bd8cd5f7d	9222	Bogojina
00050000-5551-a8bc-6464-40e7fb194984	4263	Bohinjska Bela
00050000-5551-a8bc-9dff-341be9174c11	4264	Bohinjska Bistrica
00050000-5551-a8bc-b43c-9c6d14b06813	4265	Bohinjsko jezero
00050000-5551-a8bc-7cbf-8ec27ab86615	1353	Borovnica
00050000-5551-a8bc-5bf1-c7869477593c	8294	Boštanj
00050000-5551-a8bc-0ed3-555f355a23f5	5230	Bovec
00050000-5551-a8bc-bd62-6d0ad5c8132b	5295	Branik
00050000-5551-a8bc-f96c-72b58ce7caa1	3314	Braslovče
00050000-5551-a8bc-daff-6d9465be4fc7	5223	Breginj
00050000-5551-a8bc-148d-7924995a1672	8280	Brestanica
00050000-5551-a8bc-0f9f-41e81285f370	2354	Bresternica
00050000-5551-a8bc-549e-9412ac5dacf9	4243	Brezje
00050000-5551-a8bc-a0d2-8982f7fd579f	1351	Brezovica pri Ljubljani
00050000-5551-a8bc-9742-616738796048	8250	Brežice
00050000-5551-a8bc-676e-ef1f0cc49206	4210	Brnik - Aerodrom
00050000-5551-a8bc-463f-8f8b944358ce	8321	Brusnice
00050000-5551-a8bc-a8d4-1658d2a2bc42	3255	Buče
00050000-5551-a8bc-3d70-e076fa4a57b2	8276	Bučka 
00050000-5551-a8bc-d1bd-21c85db4e4a7	9261	Cankova
00050000-5551-a8bc-0736-a654877d8e63	3000	Celje 
00050000-5551-a8bc-dc75-f8066c60eb4d	3001	Celje - poštni predali
00050000-5551-a8bc-5044-d966305423e8	4207	Cerklje na Gorenjskem
00050000-5551-a8bc-6b77-ce243c8d8a08	8263	Cerklje ob Krki
00050000-5551-a8bc-71fe-e284eeb23604	1380	Cerknica
00050000-5551-a8bc-7de5-e947c54405a1	5282	Cerkno
00050000-5551-a8bc-1f3d-4c3389cb63b3	2236	Cerkvenjak
00050000-5551-a8bc-014c-b7265aef4d57	2215	Ceršak
00050000-5551-a8bc-0b72-89dad922f9b4	2326	Cirkovce
00050000-5551-a8bc-f869-b94697bd5f52	2282	Cirkulane
00050000-5551-a8bc-0879-cd428f092979	5273	Col
00050000-5551-a8bc-7353-c9d468a289db	8251	Čatež ob Savi
00050000-5551-a8bc-e568-791e36431629	1413	Čemšenik
00050000-5551-a8bc-225f-0ff1a4defd13	5253	Čepovan
00050000-5551-a8bc-f44b-1d05215001fd	9232	Črenšovci
00050000-5551-a8bc-38a3-335a02c636b1	2393	Črna na Koroškem
00050000-5551-a8bc-f8ab-072ea45a20d5	6275	Črni Kal
00050000-5551-a8bc-bf24-e6d911b853ea	5274	Črni Vrh nad Idrijo
00050000-5551-a8bc-10fd-fa9d55b3cf91	5262	Črniče
00050000-5551-a8bc-312f-cd70d78ecd1f	8340	Črnomelj
00050000-5551-a8bc-f6d1-d6fe8c212c52	6271	Dekani
00050000-5551-a8bc-c183-fa31b7189998	5210	Deskle
00050000-5551-a8bc-3cea-5b7f1d811fe6	2253	Destrnik
00050000-5551-a8bc-ffb2-0bda4b3f7ee8	6215	Divača
00050000-5551-a8bc-f3e6-0e681e9f230e	1233	Dob
00050000-5551-a8bc-080d-dbbf607bcc18	3224	Dobje pri Planini
00050000-5551-a8bc-17ce-5a9b85e8076a	8257	Dobova
00050000-5551-a8bc-a11a-f06ece21aa4d	1423	Dobovec
00050000-5551-a8bc-3908-aa678ad098a6	5263	Dobravlje
00050000-5551-a8bc-7157-e26a42c7c97b	3204	Dobrna
00050000-5551-a8bc-9a5e-13a1b22c3506	8211	Dobrnič
00050000-5551-a8bc-6337-9fc1c4e1dd8e	1356	Dobrova
00050000-5551-a8bc-23c2-cb46c1e5387f	9223	Dobrovnik/Dobronak 
00050000-5551-a8bc-a6ab-af6305e58b5f	5212	Dobrovo v Brdih
00050000-5551-a8bc-fa32-b02fd36d928a	1431	Dol pri Hrastniku
00050000-5551-a8bc-f256-dde78a1a2096	1262	Dol pri Ljubljani
00050000-5551-a8bc-f7f7-c2720cb78bfb	1273	Dole pri Litiji
00050000-5551-a8bc-ba71-9732cfff582d	1331	Dolenja vas
00050000-5551-a8bc-a356-b76c2791ddcf	8350	Dolenjske Toplice
00050000-5551-a8bc-fa29-9bb5b1e7c625	1230	Domžale
00050000-5551-a8bc-a009-116028caceb5	2252	Dornava
00050000-5551-a8bc-2acb-a5eaeb514fed	5294	Dornberk
00050000-5551-a8bc-aafd-ef4a528ddb30	1319	Draga
00050000-5551-a8bc-ced4-d391eb8224e1	8343	Dragatuš
00050000-5551-a8bc-a06b-0812638fb803	3222	Dramlje
00050000-5551-a8bc-7d84-be9613ccc00b	2370	Dravograd
00050000-5551-a8bc-62a6-4ba8a797d88c	4203	Duplje
00050000-5551-a8bc-0f2f-2ad9d8cee721	6221	Dutovlje
00050000-5551-a8bc-f8d2-ef0dfd46ee04	8361	Dvor
00050000-5551-a8bc-a85b-83ba0899090a	2343	Fala
00050000-5551-a8bc-4372-e50476053e93	9208	Fokovci
00050000-5551-a8bc-3b40-ff641ca8117c	2313	Fram
00050000-5551-a8bc-af30-89b5df655d61	3213	Frankolovo
00050000-5551-a8bc-1848-3cbae73f6172	1274	Gabrovka
00050000-5551-a8bc-847e-adb396d3230c	8254	Globoko
00050000-5551-a8bc-49fd-c6ecb6385110	5275	Godovič
00050000-5551-a8bc-3c92-61131dc79a3e	4204	Golnik
00050000-5551-a8bc-d2c3-a8ff04bf9aed	3303	Gomilsko
00050000-5551-a8bc-8764-e77367a340ef	4224	Gorenja vas
00050000-5551-a8bc-cf7d-66265bd2f64e	3263	Gorica pri Slivnici
00050000-5551-a8bc-eaa8-b2d31b1c12ef	2272	Gorišnica
00050000-5551-a8bc-0f4b-9153a4b8f086	9250	Gornja Radgona
00050000-5551-a8bc-d66f-d71f1ce5a23c	3342	Gornji Grad
00050000-5551-a8bc-d436-68cd2c85d5d0	4282	Gozd Martuljek
00050000-5551-a8bc-4cea-59075ca12c58	6272	Gračišče
00050000-5551-a8bc-f2bb-d9fee7a3113c	9264	Grad
00050000-5551-a8bc-2df6-d1554898bba6	8332	Gradac
00050000-5551-a8bc-3959-ae963b220041	1384	Grahovo
00050000-5551-a8bc-59df-a6c3950ecdbc	5242	Grahovo ob Bači
00050000-5551-a8bc-8580-2667a5bc7ad5	5251	Grgar
00050000-5551-a8bc-89b5-ac12bf4fd14c	3302	Griže
00050000-5551-a8bc-6b88-9a491f51fb45	3231	Grobelno
00050000-5551-a8bc-b284-ddb91ec1693e	1290	Grosuplje
00050000-5551-a8bc-b3dc-cbb3f9c56c37	2288	Hajdina
00050000-5551-a8bc-f275-258ecac4ed66	8362	Hinje
00050000-5551-a8bc-1b02-50555950cdbf	2311	Hoče
00050000-5551-a8bc-6dcd-2a06c1e04674	9205	Hodoš/Hodos
00050000-5551-a8bc-3f6e-090990011254	1354	Horjul
00050000-5551-a8bc-d06d-b6de4a962a97	1372	Hotedršica
00050000-5551-a8bc-6911-48ddd05f986d	1430	Hrastnik
00050000-5551-a8bc-95f6-b6c528eec72d	6225	Hruševje
00050000-5551-a8bc-312a-2aa99de2a04a	4276	Hrušica
00050000-5551-a8bc-eae7-c7a9081ee081	5280	Idrija
00050000-5551-a8bc-0350-41cff9668ffb	1292	Ig
00050000-5551-a8bc-951a-5f9364a776ba	6250	Ilirska Bistrica
00050000-5551-a8bc-2b77-579edc267c18	6251	Ilirska Bistrica-Trnovo
00050000-5551-a8bc-3a9e-83f844d61da6	1295	Ivančna Gorica
00050000-5551-a8bc-8e02-a1114eb7baf2	2259	Ivanjkovci
00050000-5551-a8bc-f9cf-acefbaea655c	1411	Izlake
00050000-5551-a8bc-6836-0fb6091017ff	6310	Izola/Isola
00050000-5551-a8bc-0379-1bbc84e833c9	2222	Jakobski Dol
00050000-5551-a8bc-4d4e-30d6805cb3b0	2221	Jarenina
00050000-5551-a8bc-f426-9fd0f17f129d	6254	Jelšane
00050000-5551-a8bc-6cfc-cf69818cd364	4270	Jesenice
00050000-5551-a8bc-5104-318688481daa	8261	Jesenice na Dolenjskem
00050000-5551-a8bc-72cb-127603d2566d	3273	Jurklošter
00050000-5551-a8bc-87a9-0eadf0b32c3d	2223	Jurovski Dol
00050000-5551-a8bc-3cef-cd0d9da38de2	2256	Juršinci
00050000-5551-a8bc-94a6-2d9d31a3e084	5214	Kal nad Kanalom
00050000-5551-a8bc-bbe9-4a575fdb61d0	3233	Kalobje
00050000-5551-a8bc-fde0-4b51c30a2a4b	4246	Kamna Gorica
00050000-5551-a8bc-fcf7-8ae4b7c8e3f8	2351	Kamnica
00050000-5551-a8bc-2059-ad8b83aaabb3	1241	Kamnik
00050000-5551-a8bc-2f1d-2482dc51dd58	5213	Kanal
00050000-5551-a8bc-3e6b-2f502e086d65	8258	Kapele
00050000-5551-a8bc-c380-45df010f5bfe	2362	Kapla
00050000-5551-a8bc-2df9-06325b4b1e80	2325	Kidričevo
00050000-5551-a8bc-baef-3df7a67ef28e	1412	Kisovec
00050000-5551-a8bc-6fd0-2e22976ac7cb	6253	Knežak
00050000-5551-a8bc-6005-9d27eebe8c3a	5222	Kobarid
00050000-5551-a8bc-201c-899fa66b1698	9227	Kobilje
00050000-5551-a8bc-9613-8c770eb22e0d	1330	Kočevje
00050000-5551-a8bc-cc61-9adbfae69e79	1338	Kočevska Reka
00050000-5551-a8bc-19f0-111072a20916	2276	Kog
00050000-5551-a8bc-5932-fa1bbed980f3	5211	Kojsko
00050000-5551-a8bc-54b3-ccfa1e06f1b8	6223	Komen
00050000-5551-a8bc-febc-88e7b2a4f93e	1218	Komenda
00050000-5551-a8bc-d69b-7b43878cedd9	6000	Koper/Capodistria 
00050000-5551-a8bc-5c7f-ec2f88d7308e	6001	Koper/Capodistria - poštni predali
00050000-5551-a8bc-d999-37f0ba75780e	8282	Koprivnica
00050000-5551-a8bc-b14f-d24aa8bc41f3	5296	Kostanjevica na Krasu
00050000-5551-a8bc-c949-5ab13dffea97	8311	Kostanjevica na Krki
00050000-5551-a8bc-0781-d046d675d994	1336	Kostel
00050000-5551-a8bc-173b-680ce34483e9	6256	Košana
00050000-5551-a8bc-78df-410f8545f3bb	2394	Kotlje
00050000-5551-a8bc-a79e-a0bb573affe6	6240	Kozina
00050000-5551-a8bc-d17d-2f6aa598c0cf	3260	Kozje
00050000-5551-a8bc-f6d6-b7f4923cd576	4000	Kranj 
00050000-5551-a8bc-1cc9-c98f5f519e6b	4001	Kranj - poštni predali
00050000-5551-a8bc-30df-4cd4f1779072	4280	Kranjska Gora
00050000-5551-a8bc-af36-71c56b0c4392	1281	Kresnice
00050000-5551-a8bc-2749-a54a74acf648	4294	Križe
00050000-5551-a8bc-30bb-2f6a3433b908	9206	Križevci
00050000-5551-a8bc-aac1-3edad09a57e2	9242	Križevci pri Ljutomeru
00050000-5551-a8bc-ba1b-95e5a4fce5bb	1301	Krka
00050000-5551-a8bc-dfed-08977add11c5	8296	Krmelj
00050000-5551-a8bc-77d3-dc30899795b5	4245	Kropa
00050000-5551-a8bc-d289-1627f69a8643	8262	Krška vas
00050000-5551-a8bc-e237-f0f1348c68cc	8270	Krško
00050000-5551-a8bc-386f-8f03ad416f8e	9263	Kuzma
00050000-5551-a8bc-daf4-84d70d2beb01	2318	Laporje
00050000-5551-a8bc-6e3e-b29f42ef5242	3270	Laško
00050000-5551-a8bc-7c82-55054667effd	1219	Laze v Tuhinju
00050000-5551-a8bc-6135-f8a2dbe9d60f	2230	Lenart v Slovenskih goricah
00050000-5551-a8bc-8c44-b887265341d3	9220	Lendava/Lendva
00050000-5551-a8bc-a457-be7460271880	4248	Lesce
00050000-5551-a8bc-10aa-bedfb49b8f46	3261	Lesično
00050000-5551-a8bc-6c43-ee6cd11d7fda	8273	Leskovec pri Krškem
00050000-5551-a8bc-6617-fb8378a98790	2372	Libeliče
00050000-5551-a8bc-4d52-e63dc4ef23cf	2341	Limbuš
00050000-5551-a8bc-3af6-fada92c60fcf	1270	Litija
00050000-5551-a8bc-d377-7ec845eed579	3202	Ljubečna
00050000-5551-a8bc-ae3a-298cc92046a4	1000	Ljubljana 
00050000-5551-a8bc-dd58-38cec60109f9	1001	Ljubljana - poštni predali
00050000-5551-a8bc-a997-3ed4185fe247	1231	Ljubljana - Črnuče
00050000-5551-a8bc-b187-04e81bbe256f	1261	Ljubljana - Dobrunje
00050000-5551-a8bc-48dc-d8e2d4f4ad77	1260	Ljubljana - Polje
00050000-5551-a8bc-c6b6-ed86ba2f7471	1210	Ljubljana - Šentvid
00050000-5551-a8bc-6bfc-053ecef8febd	1211	Ljubljana - Šmartno
00050000-5551-a8bc-be3e-5d89886f647a	3333	Ljubno ob Savinji
00050000-5551-a8bc-13e9-b3dd14179acb	9240	Ljutomer
00050000-5551-a8bc-2669-9781ada4a88b	3215	Loče
00050000-5551-a8bc-09a6-7affaba9ff00	5231	Log pod Mangartom
00050000-5551-a8bc-34f9-0b79e8cb90b8	1358	Log pri Brezovici
00050000-5551-a8bc-c03a-622b84836643	1370	Logatec
00050000-5551-a8bc-5159-5f1b407e44a8	1371	Logatec
00050000-5551-a8bc-d6b5-a5490b7e7f77	1434	Loka pri Zidanem Mostu
00050000-5551-a8bc-29a6-718e258eb000	3223	Loka pri Žusmu
00050000-5551-a8bc-f0b1-8b010a26529b	6219	Lokev
00050000-5551-a8bc-b496-0db602d13aa8	1318	Loški Potok
00050000-5551-a8bc-375c-13eb88de7d22	2324	Lovrenc na Dravskem polju
00050000-5551-a8bc-d3d6-89a4ed0b0b35	2344	Lovrenc na Pohorju
00050000-5551-a8bc-4377-14de2fcf2765	3334	Luče
00050000-5551-a8bc-b1c0-44119f38f189	1225	Lukovica
00050000-5551-a8bc-6cfa-8bc18a85851e	9202	Mačkovci
00050000-5551-a8bc-a45e-6e016b9b7ec6	2322	Majšperk
00050000-5551-a8bc-713e-dd957086d081	2321	Makole
00050000-5551-a8bc-d916-33f2d569775c	9243	Mala Nedelja
00050000-5551-a8bc-a187-0f8a7d1290c1	2229	Malečnik
00050000-5551-a8bc-29f3-9883a013ac4b	6273	Marezige
00050000-5551-a8bc-c429-9ce963dbde79	2000	Maribor 
00050000-5551-a8bc-1a66-119f9ba99a42	2001	Maribor - poštni predali
00050000-5551-a8bc-ee04-c7d36bb72a46	2206	Marjeta na Dravskem polju
00050000-5551-a8bc-0194-7a628214bc24	2281	Markovci
00050000-5551-a8bc-42c1-b7f8cad15017	9221	Martjanci
00050000-5551-a8bc-5dfa-58743b8f333c	6242	Materija
00050000-5551-a8bc-f168-0bcc5468e155	4211	Mavčiče
00050000-5551-a8bc-7231-5d5852543e53	1215	Medvode
00050000-5551-a8bc-c034-32d119ce09f3	1234	Mengeš
00050000-5551-a8bc-3448-ed0c2efcffcb	8330	Metlika
00050000-5551-a8bc-622c-ec8b1bba08de	2392	Mežica
00050000-5551-a8bc-ca3e-9ed8debf6657	2204	Miklavž na Dravskem polju
00050000-5551-a8bc-88e6-3c5ad4684cfc	2275	Miklavž pri Ormožu
00050000-5551-a8bc-5504-faca6fe8f000	5291	Miren
00050000-5551-a8bc-abd5-a9771e373072	8233	Mirna
00050000-5551-a8bc-58aa-9aa1301af16d	8216	Mirna Peč
00050000-5551-a8bc-f4b8-9606a62c035d	2382	Mislinja
00050000-5551-a8bc-6621-8a4b15ec0599	4281	Mojstrana
00050000-5551-a8bc-66b8-2649b11e1a72	8230	Mokronog
00050000-5551-a8bc-149d-899e8a0a2d13	1251	Moravče
00050000-5551-a8bc-ab31-7a3f1c832a59	9226	Moravske Toplice
00050000-5551-a8bc-e2cb-aafe9ff33f10	5216	Most na Soči
00050000-5551-a8bc-9249-505241114198	1221	Motnik
00050000-5551-a8bc-06d8-9a187961ddeb	3330	Mozirje
00050000-5551-a8bc-a39e-af45cd4b36f3	9000	Murska Sobota 
00050000-5551-a8bc-7278-434779a1fb7a	9001	Murska Sobota - poštni predali
00050000-5551-a8bc-f67c-cc1145492cc9	2366	Muta
00050000-5551-a8bc-8e78-0f03f25221d6	4202	Naklo
00050000-5551-a8bc-d344-37312e3b18fe	3331	Nazarje
00050000-5551-a8bc-acd2-98ba0329543d	1357	Notranje Gorice
00050000-5551-a8bc-ba9b-2da1f82c614a	3203	Nova Cerkev
00050000-5551-a8bc-0950-43c4741577f2	5000	Nova Gorica 
00050000-5551-a8bc-01d5-f7a28e4078ab	5001	Nova Gorica - poštni predali
00050000-5551-a8bc-692d-3b575280ae14	1385	Nova vas
00050000-5551-a8bc-e38c-353c04bf7a16	8000	Novo mesto
00050000-5551-a8bc-60de-019a64474da3	8001	Novo mesto - poštni predali
00050000-5551-a8bc-5f02-761b80f6a30b	6243	Obrov
00050000-5551-a8bc-a178-a32218182522	9233	Odranci
00050000-5551-a8bc-7009-f1469a6f8d40	2317	Oplotnica
00050000-5551-a8bc-272b-333a332bce89	2312	Orehova vas
00050000-5551-a8bc-e7ee-c7649943f0ab	2270	Ormož
00050000-5551-a8bc-af90-91c7538d28fc	1316	Ortnek
00050000-5551-a8bc-97a8-87a36d17bae4	1337	Osilnica
00050000-5551-a8bc-e258-ac08db408cd2	8222	Otočec
00050000-5551-a8bc-8b03-8b8b7a108a86	2361	Ožbalt
00050000-5551-a8bc-a5ef-d939c1858948	2231	Pernica
00050000-5551-a8bc-c3dc-58a7d5e8099a	2211	Pesnica pri Mariboru
00050000-5551-a8bc-46ba-a4d2fdaf8154	9203	Petrovci
00050000-5551-a8bc-3274-d7b25507cfa1	3301	Petrovče
00050000-5551-a8bc-7add-c546a042e697	6330	Piran/Pirano
00050000-5551-a8bc-9e5c-3b66a88e5b62	8255	Pišece
00050000-5551-a8bc-df50-97659daafbd3	6257	Pivka
00050000-5551-a8bc-37be-294ef2365bfc	6232	Planina
00050000-5551-a8bc-7350-afa98fa21a96	3225	Planina pri Sevnici
00050000-5551-a8bc-bfe1-c3df800925cd	6276	Pobegi
00050000-5551-a8bc-645e-8c0893dd9b94	8312	Podbočje
00050000-5551-a8bc-2777-ef8440434e9a	5243	Podbrdo
00050000-5551-a8bc-ac39-febbf8865a1c	3254	Podčetrtek
00050000-5551-a8bc-aa0d-fd2d56be97f2	2273	Podgorci
00050000-5551-a8bc-3ef8-8a7db8870598	6216	Podgorje
00050000-5551-a8bc-1365-aa6c971ac404	2381	Podgorje pri Slovenj Gradcu
00050000-5551-a8bc-2f9a-a720e31fe57c	6244	Podgrad
00050000-5551-a8bc-5b9f-bc0c110560ea	1414	Podkum
00050000-5551-a8bc-2d94-77027adc4fa2	2286	Podlehnik
00050000-5551-a8bc-50c7-1d054502afca	5272	Podnanos
00050000-5551-a8bc-a9e8-b15c2b5b6b0d	4244	Podnart
00050000-5551-a8bc-7acb-723014a20cbd	3241	Podplat
00050000-5551-a8bc-9716-809f6823c0e0	3257	Podsreda
00050000-5551-a8bc-18f5-917dc8c3103c	2363	Podvelka
00050000-5551-a8bc-4b7c-5a58ce97c751	2208	Pohorje
00050000-5551-a8bc-ecbd-e083d1f1e0ef	2257	Polenšak
00050000-5551-a8bc-7561-77f846114f8e	1355	Polhov Gradec
00050000-5551-a8bc-f6e5-5c51fe633f84	4223	Poljane nad Škofjo Loko
00050000-5551-a8bc-8e23-6260ec80e784	2319	Poljčane
00050000-5551-a8bc-14a1-a92fcffda24d	1272	Polšnik
00050000-5551-a8bc-9ec0-450e7178e1a7	3313	Polzela
00050000-5551-a8bc-8af8-b78654711e37	3232	Ponikva
00050000-5551-a8bc-424f-1fc066638234	6320	Portorož/Portorose
00050000-5551-a8bc-5373-48fd32d9490c	6230	Postojna
00050000-5551-a8bc-5964-402824fc0f71	2331	Pragersko
00050000-5551-a8bc-dce9-657f423df66f	3312	Prebold
00050000-5551-a8bc-6270-a6bc4cd54523	4205	Preddvor
00050000-5551-a8bc-9be8-e4db9d4ecd62	6255	Prem
00050000-5551-a8bc-f96e-37b53af499ce	1352	Preserje
00050000-5551-a8bc-42ba-4ae00aac5f69	6258	Prestranek
00050000-5551-a8bc-d06c-59df93ed3c5e	2391	Prevalje
00050000-5551-a8bc-c358-e02e6d4084d0	3262	Prevorje
00050000-5551-a8bc-f4ca-44facce49d65	1276	Primskovo 
00050000-5551-a8bc-16cd-f44632e80ff7	3253	Pristava pri Mestinju
00050000-5551-a8bc-47bd-6918b9bcfd5f	9207	Prosenjakovci/Partosfalva
00050000-5551-a8bc-59a5-7c27f6b386e3	5297	Prvačina
00050000-5551-a8bc-1024-f8735473ce51	2250	Ptuj
00050000-5551-a8bc-2c06-98ab90fb4b26	2323	Ptujska Gora
00050000-5551-a8bc-4ae8-cf278349e408	9201	Puconci
00050000-5551-a8bc-2639-f6f2c55a0eae	2327	Rače
00050000-5551-a8bc-d351-39304e5d293a	1433	Radeče
00050000-5551-a8bc-9465-ab9717bb1691	9252	Radenci
00050000-5551-a8bc-60ea-2c8be717d40d	2360	Radlje ob Dravi
00050000-5551-a8bc-2c98-fe9f3f563820	1235	Radomlje
00050000-5551-a8bc-be97-ff21e4a4f864	4240	Radovljica
00050000-5551-a8bc-d1d7-aba554bc1bea	8274	Raka
00050000-5551-a8bc-6147-9c5fb24d6e89	1381	Rakek
00050000-5551-a8bc-4b25-ccaf4b739b71	4283	Rateče - Planica
00050000-5551-a8bc-235d-df20e5f7f4d1	2390	Ravne na Koroškem
00050000-5551-a8bc-789f-68ea910d565b	9246	Razkrižje
00050000-5551-a8bc-d80b-bf5f455c55fb	3332	Rečica ob Savinji
00050000-5551-a8bc-ca9f-6a2a3eec08e7	5292	Renče
00050000-5551-a8bc-39b1-99a3f4575e84	1310	Ribnica
00050000-5551-a8bc-f441-ca99262ac885	2364	Ribnica na Pohorju
00050000-5551-a8bc-2311-bd73816f7458	3272	Rimske Toplice
00050000-5551-a8bc-ba21-0e92427c1cb6	1314	Rob
00050000-5551-a8bc-490b-6073b597852e	5215	Ročinj
00050000-5551-a8bc-43ee-fe18ba8a5319	3250	Rogaška Slatina
00050000-5551-a8bc-1d38-fb6a6a172b5f	9262	Rogašovci
00050000-5551-a8bc-87ea-d2ee1cb61297	3252	Rogatec
00050000-5551-a8bc-f7df-d044e78e4a25	1373	Rovte
00050000-5551-a8bc-e652-cd5ea906a45e	2342	Ruše
00050000-5551-a8bc-d921-1821e22aa696	1282	Sava
00050000-5551-a8bc-ee45-612e42fdab65	6333	Sečovlje/Sicciole
00050000-5551-a8bc-5ee0-5118f1d61c18	4227	Selca
00050000-5551-a8bc-6b51-a9a6dca26a81	2352	Selnica ob Dravi
00050000-5551-a8bc-599b-dbfa3b04abb4	8333	Semič
00050000-5551-a8bc-5f63-674657401927	8281	Senovo
00050000-5551-a8bc-c54d-fa1b838fd158	6224	Senožeče
00050000-5551-a8bc-b07d-6e8cf13942ac	8290	Sevnica
00050000-5551-a8bc-7659-84befde25572	6210	Sežana
00050000-5551-a8bc-eee8-ddc81733fef6	2214	Sladki Vrh
00050000-5551-a8bc-de62-e38fc9f12a14	5283	Slap ob Idrijci
00050000-5551-a8bc-a2a2-682fc147bfe3	2380	Slovenj Gradec
00050000-5551-a8bc-255a-6dc300ce2e01	2310	Slovenska Bistrica
00050000-5551-a8bc-f86f-4b492bb4bfbe	3210	Slovenske Konjice
00050000-5551-a8bc-a4ce-4c99b478c312	1216	Smlednik
00050000-5551-a8bc-37bb-f0e162dd4864	5232	Soča
00050000-5551-a8bc-4680-b9c8840b14ee	1317	Sodražica
00050000-5551-a8bc-0724-cf884d0a300b	3335	Solčava
00050000-5551-a8bc-a92f-99b7a05e8834	5250	Solkan
00050000-5551-a8bc-49bd-6f5947053e0a	4229	Sorica
00050000-5551-a8bc-ca61-7672df837491	4225	Sovodenj
00050000-5551-a8bc-f032-7ff19f6e32ff	5281	Spodnja Idrija
00050000-5551-a8bc-3615-904145540085	2241	Spodnji Duplek
00050000-5551-a8bc-24ea-0f75113cc7ab	9245	Spodnji Ivanjci
00050000-5551-a8bc-c6db-017fc705c059	2277	Središče ob Dravi
00050000-5551-a8bc-df90-2410745ba608	4267	Srednja vas v Bohinju
00050000-5551-a8bc-b4fa-e84ab0915d78	8256	Sromlje 
00050000-5551-a8bc-4142-5f168ee7b3ec	5224	Srpenica
00050000-5551-a8bc-c81a-1eb9d56df76c	1242	Stahovica
00050000-5551-a8bc-e26b-ab6a9583cf69	1332	Stara Cerkev
00050000-5551-a8bc-0dd8-c1b7fb2ca232	8342	Stari trg ob Kolpi
00050000-5551-a8bc-ac34-ef434dd3fed8	1386	Stari trg pri Ložu
00050000-5551-a8bc-8e59-2fcbf829b7ec	2205	Starše
00050000-5551-a8bc-12d4-97ce20c9008e	2289	Stoperce
00050000-5551-a8bc-9767-b8bb9e49fedf	8322	Stopiče
00050000-5551-a8bc-7370-dc5e6cfc5ab8	3206	Stranice
00050000-5551-a8bc-086e-bb613ca71b12	8351	Straža
00050000-5551-a8bc-db66-b08dacc7e952	1313	Struge
00050000-5551-a8bc-374f-b39fef4a44c8	8293	Studenec
00050000-5551-a8bc-c260-8f119658cf29	8331	Suhor
00050000-5551-a8bc-0e5f-a044d8472b64	2233	Sv. Ana v Slovenskih goricah
00050000-5551-a8bc-58b9-ee8deacc6da7	2235	Sv. Trojica v Slovenskih goricah
00050000-5551-a8bc-181b-32a63812036a	2353	Sveti Duh na Ostrem Vrhu
00050000-5551-a8bc-0061-487ac16fea31	9244	Sveti Jurij ob Ščavnici
00050000-5551-a8bc-b6d3-97371b2e425e	3264	Sveti Štefan
00050000-5551-a8bc-90f9-a66ffec13d15	2258	Sveti Tomaž
00050000-5551-a8bc-985e-65d17a248432	9204	Šalovci
00050000-5551-a8bc-41b5-276199681696	5261	Šempas
00050000-5551-a8bc-cda4-9b3c0918976d	5290	Šempeter pri Gorici
00050000-5551-a8bc-2f0e-1ed0ae983216	3311	Šempeter v Savinjski dolini
00050000-5551-a8bc-c798-a39b16219b28	4208	Šenčur
00050000-5551-a8bc-94cd-b3c30f9fc055	2212	Šentilj v Slovenskih goricah
00050000-5551-a8bc-ea45-f5ea17c63ff2	8297	Šentjanž
00050000-5551-a8bc-f050-cdf8c2761603	2373	Šentjanž pri Dravogradu
00050000-5551-a8bc-5db4-b00163201d02	8310	Šentjernej
00050000-5551-a8bc-acfc-c2d59530bba0	3230	Šentjur
00050000-5551-a8bc-96cf-741eff0e7340	3271	Šentrupert
00050000-5551-a8bc-c909-7b5430210b5b	8232	Šentrupert
00050000-5551-a8bc-c70f-8f998f2ec6d0	1296	Šentvid pri Stični
00050000-5551-a8bc-efc7-0bc4eba1c1b9	8275	Škocjan
00050000-5551-a8bc-62e1-a8266590a735	6281	Škofije
00050000-5551-a8bc-3daa-480abd0d272a	4220	Škofja Loka
00050000-5551-a8bc-48bd-f12644e5cc76	3211	Škofja vas
00050000-5551-a8bc-d171-257eeb3ecfa2	1291	Škofljica
00050000-5551-a8bc-6e8e-e3ce3eba8ad9	6274	Šmarje
00050000-5551-a8bc-62ce-408120fe898b	1293	Šmarje - Sap
00050000-5551-a8bc-effe-1377b980bbfd	3240	Šmarje pri Jelšah
00050000-5551-a8bc-3f4c-478749d91eda	8220	Šmarješke Toplice
00050000-5551-a8bc-62c1-6c3ef523a6d6	2315	Šmartno na Pohorju
00050000-5551-a8bc-51d7-1db7bc88895a	3341	Šmartno ob Dreti
00050000-5551-a8bc-9442-ad7bea4f92a2	3327	Šmartno ob Paki
00050000-5551-a8bc-e99f-b4a1dd8fed6b	1275	Šmartno pri Litiji
00050000-5551-a8bc-5d86-e14f4f1b1c4f	2383	Šmartno pri Slovenj Gradcu
00050000-5551-a8bc-d7ce-f838ca1550c9	3201	Šmartno v Rožni dolini
00050000-5551-a8bc-4225-fc169188f636	3325	Šoštanj
00050000-5551-a8bc-7c28-2d2dd3b68180	6222	Štanjel
00050000-5551-a8bc-1f39-cba356339f82	3220	Štore
00050000-5551-a8bc-09aa-305d90d2900c	3304	Tabor
00050000-5551-a8bc-a599-283bd9cda5f5	3221	Teharje
00050000-5551-a8bc-419d-a7abca3b66b9	9251	Tišina
00050000-5551-a8bc-0491-37b770a7baef	5220	Tolmin
00050000-5551-a8bc-88ed-e87c41755032	3326	Topolšica
00050000-5551-a8bc-7c8b-658aef8d345b	2371	Trbonje
00050000-5551-a8bc-1864-1889aad4887f	1420	Trbovlje
00050000-5551-a8bc-454f-3ad8cd331b40	8231	Trebelno 
00050000-5551-a8bc-af82-1225b146706f	8210	Trebnje
00050000-5551-a8bc-476d-a8c549176271	5252	Trnovo pri Gorici
00050000-5551-a8bc-6f44-059292d11cf8	2254	Trnovska vas
00050000-5551-a8bc-e0e6-c49a3f54f99b	1222	Trojane
00050000-5551-a8bc-935a-3919369c657a	1236	Trzin
00050000-5551-a8bc-9127-4973470711a2	4290	Tržič
00050000-5551-a8bc-6ac7-0984e726ab3e	8295	Tržišče
00050000-5551-a8bc-1b3a-e36c476c8179	1311	Turjak
00050000-5551-a8bc-34b3-31e5b827e411	9224	Turnišče
00050000-5551-a8bc-5aa8-16aa5e1088ad	8323	Uršna sela
00050000-5551-a8bc-e7b2-bc4eed834686	1252	Vače
00050000-5551-a8bc-1f57-8892576b6fe5	3320	Velenje 
00050000-5551-a8bc-609e-4048d8bc2fdd	3322	Velenje - poštni predali
00050000-5551-a8bc-0011-301ed6f88ca9	8212	Velika Loka
00050000-5551-a8bc-c27c-d454dcfc5b68	2274	Velika Nedelja
00050000-5551-a8bc-60bf-6850d01ab3d4	9225	Velika Polana
00050000-5551-a8bc-fe58-e3d4bd8acb8f	1315	Velike Lašče
00050000-5551-a8bc-5ece-2b9e7718cd79	8213	Veliki Gaber
00050000-5551-a8bc-7103-066f1635269c	9241	Veržej
00050000-5551-a8bc-58a3-9a6f9c71983c	1312	Videm - Dobrepolje
00050000-5551-a8bc-c186-3fbd7f8faaa8	2284	Videm pri Ptuju
00050000-5551-a8bc-b52f-1741681e3c35	8344	Vinica
00050000-5551-a8bc-7fbd-100f630bc981	5271	Vipava
00050000-5551-a8bc-9e6b-7f1b2852efa6	4212	Visoko
00050000-5551-a8bc-0f4e-15933a808cea	1294	Višnja Gora
00050000-5551-a8bc-9b99-552df0a4574e	3205	Vitanje
00050000-5551-a8bc-c27b-b9358ed0b1c8	2255	Vitomarci
00050000-5551-a8bc-ef5f-423abc22d98e	1217	Vodice
00050000-5551-a8bc-b72c-6d50332c5454	3212	Vojnik\t
00050000-5551-a8bc-e269-fa735fb05af6	5293	Volčja Draga
00050000-5551-a8bc-3a20-0eff1af60319	2232	Voličina
00050000-5551-a8bc-01e7-015f0b0ff48f	3305	Vransko
00050000-5551-a8bc-7653-260c86b527d4	6217	Vremski Britof
00050000-5551-a8bc-b6db-1e760706d8c4	1360	Vrhnika
00050000-5551-a8bc-8254-ab7e5f5a99b8	2365	Vuhred
00050000-5551-a8bc-2d1e-a1bbf441c05b	2367	Vuzenica
00050000-5551-a8bc-e27d-f0a9c8727a1e	8292	Zabukovje 
00050000-5551-a8bc-6edf-4fb7c423a206	1410	Zagorje ob Savi
00050000-5551-a8bc-5d4a-16aa59b1ad16	1303	Zagradec
00050000-5551-a8bc-32de-664c64bb7fe2	2283	Zavrč
00050000-5551-a8bc-f016-b43dc69acca1	8272	Zdole 
00050000-5551-a8bc-f85d-1506a8aa701f	4201	Zgornja Besnica
00050000-5551-a8bc-9d60-e38c72a6adb3	2242	Zgornja Korena
00050000-5551-a8bc-6cdb-fe0b59c4f946	2201	Zgornja Kungota
00050000-5551-a8bc-8b39-77b05e5913fd	2316	Zgornja Ložnica
00050000-5551-a8bc-94a3-dec5d843ceae	2314	Zgornja Polskava
00050000-5551-a8bc-d812-037d221d5988	2213	Zgornja Velka
00050000-5551-a8bc-f671-5674893f8b8c	4247	Zgornje Gorje
00050000-5551-a8bc-93ab-e99ce2ff0cfe	4206	Zgornje Jezersko
00050000-5551-a8bc-dad5-aa73bf9bd931	2285	Zgornji Leskovec
00050000-5551-a8bc-b9d8-aa0dbaa24142	1432	Zidani Most
00050000-5551-a8bc-b9b2-17b882cd4e31	3214	Zreče
00050000-5551-a8bc-5a0e-3d7bc0168d71	4209	Žabnica
00050000-5551-a8bc-b074-c7989bab66bf	3310	Žalec
00050000-5551-a8bc-6841-b4f1944b0268	4228	Železniki
00050000-5551-a8bc-7f08-a6d63b103053	2287	Žetale
00050000-5551-a8bc-ea16-448042557f62	4226	Žiri
00050000-5551-a8bc-fa77-cd7ef208455e	4274	Žirovnica
00050000-5551-a8bc-9b93-fd0b2735707b	8360	Žužemberk
\.


--
-- TOC entry 2660 (class 0 OID 3098933)
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
-- TOC entry 2643 (class 0 OID 3098756)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 3098822)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 3098945)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 3099050)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 3099094)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 3098974)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 3098918)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 3098908)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 3099084)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 3099040)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 3098623)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5551-a8bd-04eb-583a21edcbbb	00010000-5551-a8bd-bb70-7ec66f77cbe0	2015-05-12 09:16:13	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO9Rxu15qipzO2U7PpEC5nfSwc35FMbfW";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2692 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2667 (class 0 OID 3098983)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 3098661)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5551-a8bd-043e-0002dc73f44c	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5551-a8bd-55f7-bb58d64dc419	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5551-a8bd-7882-40eb8729eeb1	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5551-a8bd-651b-b14c27b6db04	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5551-a8bd-966e-71eb81e947e5	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5551-a8bd-2beb-2886426a31a6	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2633 (class 0 OID 3098645)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5551-a8bd-04eb-583a21edcbbb	00020000-5551-a8bd-651b-b14c27b6db04
00010000-5551-a8bd-bb70-7ec66f77cbe0	00020000-5551-a8bd-651b-b14c27b6db04
\.


--
-- TOC entry 2669 (class 0 OID 3098997)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 3098939)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 3098889)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 3098721)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 3098895)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 3099075)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 3098791)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 3098632)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5551-a8bd-bb70-7ec66f77cbe0	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROA3NtQ0O6hxcldukj9rm2Dy.uqmHcw8G	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5551-a8bd-04eb-583a21edcbbb	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2681 (class 0 OID 3099126)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 3098837)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 3098966)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 3099032)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 3098865)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2680 (class 0 OID 3099116)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 3099022)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2275 (class 2606 OID 3098686)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 3099166)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 3099159)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 3099074)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 3098855)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 3098888)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2311 (class 2606 OID 3098817)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 3099018)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2322 (class 2606 OID 3098835)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 3098882)
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
-- TOC entry 2365 (class 2606 OID 3098931)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 3098958)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 3098789)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2279 (class 2606 OID 3098695)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 3098753)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2281 (class 2606 OID 3098719)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2273 (class 2606 OID 3098675)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2266 (class 2606 OID 3098660)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 3098964)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 3098996)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 3099111)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 3098746)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2301 (class 2606 OID 3098777)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 3098937)
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
-- TOC entry 2299 (class 2606 OID 3098767)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2320 (class 2606 OID 3098826)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 3098949)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 3099056)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 3099099)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 3098981)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 3098922)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 3098913)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 3099093)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 3099047)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2258 (class 2606 OID 3098631)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 3098987)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2264 (class 2606 OID 3098649)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2268 (class 2606 OID 3098669)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 3099005)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 3098944)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 3098894)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2286 (class 2606 OID 3098726)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2351 (class 2606 OID 3098904)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 3099083)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2309 (class 2606 OID 3098802)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 3098644)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2436 (class 2606 OID 3099141)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 3098841)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 3098972)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 3099038)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 3098877)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 3099125)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 3099031)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 1259 OID 3098862)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2287 (class 1259 OID 3098748)
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
-- TOC entry 2378 (class 1259 OID 3098965)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2372 (class 1259 OID 3098951)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2373 (class 1259 OID 3098950)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2324 (class 1259 OID 3098842)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2399 (class 1259 OID 3099021)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2400 (class 1259 OID 3099019)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2401 (class 1259 OID 3099020)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2424 (class 1259 OID 3099113)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2425 (class 1259 OID 3099114)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2426 (class 1259 OID 3099115)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2432 (class 1259 OID 3099144)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2433 (class 1259 OID 3099143)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2434 (class 1259 OID 3099142)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2306 (class 1259 OID 3098804)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2307 (class 1259 OID 3098803)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2291 (class 1259 OID 3098755)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2292 (class 1259 OID 3098754)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 3098988)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2342 (class 1259 OID 3098883)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2270 (class 1259 OID 3098676)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2271 (class 1259 OID 3098677)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2392 (class 1259 OID 3099008)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2393 (class 1259 OID 3099007)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2394 (class 1259 OID 3099006)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2316 (class 1259 OID 3098827)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2317 (class 1259 OID 3098829)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2318 (class 1259 OID 3098828)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2352 (class 1259 OID 3098917)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2353 (class 1259 OID 3098915)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2354 (class 1259 OID 3098914)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2355 (class 1259 OID 3098916)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2261 (class 1259 OID 3098650)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2262 (class 1259 OID 3098651)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2381 (class 1259 OID 3098973)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2367 (class 1259 OID 3098938)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2407 (class 1259 OID 3099048)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2408 (class 1259 OID 3099049)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2295 (class 1259 OID 3098769)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2296 (class 1259 OID 3098768)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2297 (class 1259 OID 3098770)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2411 (class 1259 OID 3099057)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2412 (class 1259 OID 3099058)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2443 (class 1259 OID 3099169)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2444 (class 1259 OID 3099168)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2445 (class 1259 OID 3099171)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2446 (class 1259 OID 3099167)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2447 (class 1259 OID 3099170)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2404 (class 1259 OID 3099039)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2358 (class 1259 OID 3098926)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2359 (class 1259 OID 3098925)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2360 (class 1259 OID 3098923)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2361 (class 1259 OID 3098924)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2248 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2439 (class 1259 OID 3099161)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2440 (class 1259 OID 3099160)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2323 (class 1259 OID 3098836)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2276 (class 1259 OID 3098697)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2277 (class 1259 OID 3098696)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2283 (class 1259 OID 3098727)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2284 (class 1259 OID 3098728)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2347 (class 1259 OID 3098907)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2348 (class 1259 OID 3098906)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2349 (class 1259 OID 3098905)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2330 (class 1259 OID 3098864)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2331 (class 1259 OID 3098860)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2332 (class 1259 OID 3098857)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2333 (class 1259 OID 3098858)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2334 (class 1259 OID 3098856)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2335 (class 1259 OID 3098861)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2336 (class 1259 OID 3098859)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2290 (class 1259 OID 3098747)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 3098818)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2313 (class 1259 OID 3098820)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2314 (class 1259 OID 3098819)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2315 (class 1259 OID 3098821)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2366 (class 1259 OID 3098932)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2429 (class 1259 OID 3099112)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2282 (class 1259 OID 3098720)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2305 (class 1259 OID 3098790)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2386 (class 1259 OID 3098982)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2251 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 3098778)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2423 (class 1259 OID 3099100)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2269 (class 1259 OID 3098670)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2337 (class 1259 OID 3098863)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2472 (class 2606 OID 3099302)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2475 (class 2606 OID 3099287)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2474 (class 2606 OID 3099292)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2470 (class 2606 OID 3099312)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2476 (class 2606 OID 3099282)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2471 (class 2606 OID 3099307)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2473 (class 2606 OID 3099297)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2457 (class 2606 OID 3099217)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2493 (class 2606 OID 3099397)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2491 (class 2606 OID 3099392)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2492 (class 2606 OID 3099387)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2469 (class 2606 OID 3099277)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 3099437)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2501 (class 2606 OID 3099427)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2500 (class 2606 OID 3099432)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2489 (class 2606 OID 3099377)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2510 (class 2606 OID 3099472)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2509 (class 2606 OID 3099477)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2508 (class 2606 OID 3099482)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2511 (class 2606 OID 3099497)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2512 (class 2606 OID 3099492)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2513 (class 2606 OID 3099487)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2463 (class 2606 OID 3099252)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2464 (class 2606 OID 3099247)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2458 (class 2606 OID 3099227)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2459 (class 2606 OID 3099222)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2454 (class 2606 OID 3099202)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2495 (class 2606 OID 3099407)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2477 (class 2606 OID 3099317)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2451 (class 2606 OID 3099182)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2450 (class 2606 OID 3099187)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2496 (class 2606 OID 3099422)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2497 (class 2606 OID 3099417)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2498 (class 2606 OID 3099412)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2467 (class 2606 OID 3099257)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2465 (class 2606 OID 3099267)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2466 (class 2606 OID 3099262)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2481 (class 2606 OID 3099352)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2483 (class 2606 OID 3099342)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2484 (class 2606 OID 3099337)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2482 (class 2606 OID 3099347)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2449 (class 2606 OID 3099172)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2448 (class 2606 OID 3099177)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2494 (class 2606 OID 3099402)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2490 (class 2606 OID 3099382)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2504 (class 2606 OID 3099447)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2503 (class 2606 OID 3099452)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2461 (class 2606 OID 3099237)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2462 (class 2606 OID 3099232)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2460 (class 2606 OID 3099242)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 3099457)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2505 (class 2606 OID 3099462)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2518 (class 2606 OID 3099522)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2519 (class 2606 OID 3099517)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2516 (class 2606 OID 3099532)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2520 (class 2606 OID 3099512)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2517 (class 2606 OID 3099527)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2502 (class 2606 OID 3099442)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2485 (class 2606 OID 3099372)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2486 (class 2606 OID 3099367)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2488 (class 2606 OID 3099357)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2487 (class 2606 OID 3099362)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2514 (class 2606 OID 3099507)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2515 (class 2606 OID 3099502)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2468 (class 2606 OID 3099272)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2507 (class 2606 OID 3099467)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2452 (class 2606 OID 3099197)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2453 (class 2606 OID 3099192)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2456 (class 2606 OID 3099207)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2455 (class 2606 OID 3099212)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2478 (class 2606 OID 3099332)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2479 (class 2606 OID 3099327)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2480 (class 2606 OID 3099322)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-12 09:16:14 CEST

--
-- PostgreSQL database dump complete
--

