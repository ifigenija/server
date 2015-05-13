--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-13 13:10:39 CEST

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
-- TOC entry 179 (class 1259 OID 3300793)
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
-- TOC entry 225 (class 1259 OID 3301280)
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
-- TOC entry 224 (class 1259 OID 3301263)
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
-- TOC entry 217 (class 1259 OID 3301174)
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
-- TOC entry 193 (class 1259 OID 3300958)
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
-- TOC entry 196 (class 1259 OID 3300999)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 3300920)
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
-- TOC entry 212 (class 1259 OID 3301124)
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
-- TOC entry 191 (class 1259 OID 3300945)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 3300993)
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
-- TOC entry 201 (class 1259 OID 3301042)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 3301067)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 3300894)
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
-- TOC entry 180 (class 1259 OID 3300802)
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
-- TOC entry 181 (class 1259 OID 3300813)
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
-- TOC entry 184 (class 1259 OID 3300864)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 3300767)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 3300786)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 3301074)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 3301104)
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
-- TOC entry 221 (class 1259 OID 3301219)
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
-- TOC entry 183 (class 1259 OID 3300844)
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
-- TOC entry 186 (class 1259 OID 3300886)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 3301048)
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
-- TOC entry 185 (class 1259 OID 3300871)
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
-- TOC entry 190 (class 1259 OID 3300937)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 3301060)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 3301165)
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
-- TOC entry 220 (class 1259 OID 3301212)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 3301089)
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
-- TOC entry 200 (class 1259 OID 3301033)
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
-- TOC entry 199 (class 1259 OID 3301023)
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
-- TOC entry 219 (class 1259 OID 3301202)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 3301155)
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
-- TOC entry 173 (class 1259 OID 3300738)
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
-- TOC entry 172 (class 1259 OID 3300736)
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
-- TOC entry 209 (class 1259 OID 3301098)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 3300776)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 3300760)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 3301112)
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
-- TOC entry 203 (class 1259 OID 3301054)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 3301004)
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
-- TOC entry 182 (class 1259 OID 3300836)
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
-- TOC entry 198 (class 1259 OID 3301010)
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
-- TOC entry 218 (class 1259 OID 3301190)
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
-- TOC entry 188 (class 1259 OID 3300906)
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
-- TOC entry 174 (class 1259 OID 3300747)
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
-- TOC entry 223 (class 1259 OID 3301244)
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
-- TOC entry 192 (class 1259 OID 3300952)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 3301081)
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
-- TOC entry 214 (class 1259 OID 3301147)
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
-- TOC entry 194 (class 1259 OID 3300980)
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
-- TOC entry 222 (class 1259 OID 3301234)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 3301137)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 3300741)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2640 (class 0 OID 3300793)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2686 (class 0 OID 3301280)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2685 (class 0 OID 3301263)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 3301174)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 3300958)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 3300999)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 3300920)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5553-312e-6439-2522688ec19f	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5553-312e-5d4f-77d177341786	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5553-312e-ad20-c078d10a048a	AL	ALB	008	Albania 	Albanija	\N
00040000-5553-312e-4645-8871dfdbff92	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5553-312e-c0c7-c77a2095a080	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5553-312e-3dfd-7a3760071865	AD	AND	020	Andorra 	Andora	\N
00040000-5553-312e-996c-b0ecb919c497	AO	AGO	024	Angola 	Angola	\N
00040000-5553-312e-20fc-d65529ba0c80	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5553-312e-9d48-a6e323442955	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5553-312e-7105-d9eaf59c8fdb	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5553-312e-06d3-4634b9959b5c	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5553-312e-50a3-a0fe658d2d55	AM	ARM	051	Armenia 	Armenija	\N
00040000-5553-312e-6c4e-e426b131d0f6	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5553-312e-ed03-f1478b5062c3	AU	AUS	036	Australia 	Avstralija	\N
00040000-5553-312e-36b7-a4c3997e1552	AT	AUT	040	Austria 	Avstrija	\N
00040000-5553-312e-5909-659c35281c1f	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5553-312e-c8b3-384860d7565c	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5553-312e-95fe-b8240f84dfb8	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5553-312e-ca18-d5b087a8272e	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5553-312e-023b-bc76e32f1389	BB	BRB	052	Barbados 	Barbados	\N
00040000-5553-312e-244b-e46b2a971bb2	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5553-312e-2dbb-f27a6349b587	BE	BEL	056	Belgium 	Belgija	\N
00040000-5553-312e-edce-3296aca55dce	BZ	BLZ	084	Belize 	Belize	\N
00040000-5553-312e-66ad-1fd6a4c79595	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5553-312e-11c5-2e0f9f7d83ef	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5553-312e-ebb6-71ed13d5abda	BT	BTN	064	Bhutan 	Butan	\N
00040000-5553-312e-7cca-3899d2543c20	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5553-312e-da74-117bd897f8da	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5553-312e-5564-27b587d20d37	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5553-312e-c1d0-0bec22cf9d1d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5553-312e-e12a-88c8fb4f0663	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5553-312e-e4dc-d9982d8d9402	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5553-312e-0da5-bc022aaccdbe	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5553-312e-0312-c9ac0ffc53f9	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5553-312e-0c20-264272c02960	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5553-312e-848f-2ce6ecba773c	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5553-312e-2fff-6d19318dfb4a	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5553-312e-02e8-314ca5f83409	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5553-312e-05f1-c4369b676fee	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5553-312e-f9ea-81a17f58b58c	CA	CAN	124	Canada 	Kanada	\N
00040000-5553-312e-571b-ac938b4effed	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5553-312e-8ee0-9c5e1222e90c	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5553-312e-16ae-c3bf2d2ac9c6	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5553-312e-ff54-08d6a737140e	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5553-312e-0333-b85a3bb8dbe2	CL	CHL	152	Chile 	Čile	\N
00040000-5553-312e-e0d1-a85f0ca939e5	CN	CHN	156	China 	Kitajska	\N
00040000-5553-312e-2955-d9a258d1650b	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5553-312e-5453-0d45468a4d5a	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5553-312e-1e9c-04c5f6b0a6c9	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5553-312e-1285-7950be3cf24e	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5553-312e-1232-cf70c81788b9	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5553-312e-74ee-51e86295ec44	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5553-312e-0f7e-fba2d1b9f2b0	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5553-312e-79d7-fe06828b59cb	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5553-312e-77bc-7ac17beeb92d	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5553-312e-2c73-4a04ffa2112d	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5553-312e-81e8-227c4797ecf2	CU	CUB	192	Cuba 	Kuba	\N
00040000-5553-312e-029d-e85c079a0edd	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5553-312e-8e75-ab33e01fedb0	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5553-312e-6d4a-c222433bacab	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5553-312e-e257-6fe08c5d6e6f	DK	DNK	208	Denmark 	Danska	\N
00040000-5553-312e-121e-a31d2c9740d2	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5553-312e-891c-afe2ec5b716c	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5553-312e-0d32-d227e0277815	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5553-312e-f3e7-fdcff1e82f07	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5553-312e-ba1e-94f88fc30732	EG	EGY	818	Egypt 	Egipt	\N
00040000-5553-312e-9d26-a76bd8e9d777	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5553-312e-bfc3-3260d0a2b04b	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5553-312e-4be7-bf2c9af873c5	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5553-312e-b5e2-9365f21d4f34	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5553-312e-dcda-fc478ac32f50	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5553-312e-7098-0aaec3a45acc	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5553-312e-ed32-8117a510a827	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5553-312e-7e96-6ac471400ed9	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5553-312e-c86e-3b4c052dcd67	FI	FIN	246	Finland 	Finska	\N
00040000-5553-312e-b72f-7e4acfaf6aed	FR	FRA	250	France 	Francija	\N
00040000-5553-312e-0df5-83a9253bd971	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5553-312e-4529-5abb5a47ee0f	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5553-312e-be5d-5bd9eace86e2	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5553-312e-8af8-02cde97b2106	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5553-312e-893c-4c1e06374d2f	GA	GAB	266	Gabon 	Gabon	\N
00040000-5553-312e-dcc9-12123c503660	GM	GMB	270	Gambia 	Gambija	\N
00040000-5553-312e-7a4d-0b02706e56da	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5553-312e-3f4f-233799d12ad3	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5553-312e-211e-314a1131aff8	GH	GHA	288	Ghana 	Gana	\N
00040000-5553-312e-39b3-627a575b7f39	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5553-312e-55a8-60447a5fd6f5	GR	GRC	300	Greece 	Grčija	\N
00040000-5553-312e-7308-43d83283b804	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5553-312e-e73c-9473a347ace5	GD	GRD	308	Grenada 	Grenada	\N
00040000-5553-312e-2bd7-f536d6f3d296	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5553-312e-ee48-3eef7647658b	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5553-312e-ef97-071325c42e6b	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5553-312e-ef98-b6bdd77fa871	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5553-312e-2442-67fdd6ae2a28	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5553-312e-3c94-f1a49605ba1e	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5553-312e-e4bc-0a55bb41bb19	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5553-312e-0422-35c78b27a950	HT	HTI	332	Haiti 	Haiti	\N
00040000-5553-312e-c5d2-96002e073303	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5553-312e-bafe-95732f7c8c63	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5553-312e-acb2-c6d648f63ea5	HN	HND	340	Honduras 	Honduras	\N
00040000-5553-312e-7d1c-6cf1d8a09b71	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5553-312e-61ee-5d86a908a58d	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5553-312e-1086-22fc386ccccf	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5553-312e-05a5-04e5c7430986	IN	IND	356	India 	Indija	\N
00040000-5553-312e-9397-532b7fe1acce	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5553-312e-a500-50990325da5f	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5553-312e-36f9-1f1eedb6084a	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5553-312e-dd45-be8fce7f79f1	IE	IRL	372	Ireland 	Irska	\N
00040000-5553-312e-46fe-713c66663c5d	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5553-312e-682f-1fa83a8a74bf	IL	ISR	376	Israel 	Izrael	\N
00040000-5553-312e-3565-18fdbe0255d1	IT	ITA	380	Italy 	Italija	\N
00040000-5553-312e-1c4d-940b63c338de	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5553-312e-5b69-6f2fbb29be81	JP	JPN	392	Japan 	Japonska	\N
00040000-5553-312e-450c-a0777b29d3b8	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5553-312e-5604-9fbd2c228740	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5553-312e-7dad-e95a81b98013	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5553-312e-a77e-eb036949c53b	KE	KEN	404	Kenya 	Kenija	\N
00040000-5553-312e-8ce4-1f9af99d558e	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5553-312e-8f19-f8b4840fd789	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5553-312e-9c06-466624dedcc3	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5553-312e-da4f-a4f0ca88de76	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5553-312e-5737-2a0fb17d9739	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5553-312e-aea2-88237942d1b4	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5553-312e-95e3-b520000973dd	LV	LVA	428	Latvia 	Latvija	\N
00040000-5553-312e-f204-5615f1e92d5e	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5553-312e-43eb-836d43c41927	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5553-312e-7423-121e3db885d9	LR	LBR	430	Liberia 	Liberija	\N
00040000-5553-312e-aa2e-7d9b29de62bd	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5553-312e-a6d6-29f56c54c82f	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5553-312e-61fd-da0d4065a5da	LT	LTU	440	Lithuania 	Litva	\N
00040000-5553-312e-381c-7b814e898beb	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5553-312e-0f3e-264fa6cb47ef	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5553-312e-0e7e-750d9f6cdc52	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5553-312e-e4eb-dd91d1484e69	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5553-312e-daee-278fa4515f26	MW	MWI	454	Malawi 	Malavi	\N
00040000-5553-312e-3e8b-083fa923de07	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5553-312e-36d7-d1e663255f5a	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5553-312e-9246-ca77a054fb88	ML	MLI	466	Mali 	Mali	\N
00040000-5553-312e-7db7-384cded79d0c	MT	MLT	470	Malta 	Malta	\N
00040000-5553-312e-56a8-7caa9ff177d1	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5553-312e-da80-fdcfe29596ed	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5553-312e-fee3-1ce6665898af	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5553-312e-8f4d-0132a95bcbe9	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5553-312e-27bb-d67a64254368	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5553-312e-8b10-f9fc0091689f	MX	MEX	484	Mexico 	Mehika	\N
00040000-5553-312e-5ed0-a7565291cbb1	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5553-312e-4cfa-181683e6999e	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5553-312e-4cb8-457f75824e5f	MC	MCO	492	Monaco 	Monako	\N
00040000-5553-312e-33c0-276eb06bc888	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5553-312e-60ad-91025fe2b666	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5553-312e-b720-4af36352c211	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5553-312e-73c8-4527654c67fd	MA	MAR	504	Morocco 	Maroko	\N
00040000-5553-312e-7d0f-fa28763b24f5	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5553-312e-7cc1-39b814cc029e	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5553-312e-7a1a-a5b0428822b8	NA	NAM	516	Namibia 	Namibija	\N
00040000-5553-312e-4425-7667a8e1db4f	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5553-312e-b0bd-5e77ea862d31	NP	NPL	524	Nepal 	Nepal	\N
00040000-5553-312e-2dc2-319f6d88dc75	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5553-312e-c7e0-4ed660358196	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5553-312e-884e-ba8ab5cb76aa	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5553-312e-9e97-8725e8ab4bc0	NE	NER	562	Niger 	Niger 	\N
00040000-5553-312e-fda3-a121911a7b03	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5553-312e-ac95-808e98d828ef	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5553-312e-2df8-5b4ddc5d959d	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5553-312e-e988-006612c7e192	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5553-312e-db26-f1982d85a396	NO	NOR	578	Norway 	Norveška	\N
00040000-5553-312e-8685-2cef1f8aa991	OM	OMN	512	Oman 	Oman	\N
00040000-5553-312e-dea9-6aa75ee1e3fb	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5553-312e-4a22-29cb8a17c28f	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5553-312e-283e-3a7822d687cf	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5553-312e-1c02-243b55d1269e	PA	PAN	591	Panama 	Panama	\N
00040000-5553-312e-d08c-bd4984d6e854	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5553-312e-c4fa-bf4827746714	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5553-312e-cb50-8531d27eb090	PE	PER	604	Peru 	Peru	\N
00040000-5553-312e-7f5d-79c506039e9b	PH	PHL	608	Philippines 	Filipini	\N
00040000-5553-312e-78f3-004534577350	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5553-312e-f0e0-46459e484e99	PL	POL	616	Poland 	Poljska	\N
00040000-5553-312e-f429-8907e3a4e84e	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5553-312e-7020-88264d124ef5	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5553-312e-7364-8dddd9bc4ec5	QA	QAT	634	Qatar 	Katar	\N
00040000-5553-312e-6c64-dc9476b862c0	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5553-312e-2261-7973c8e4447b	RO	ROU	642	Romania 	Romunija	\N
00040000-5553-312e-8a65-18d8dbcba7d8	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5553-312e-adbe-6a87f86ecc05	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5553-312e-64e8-b2b39dd5d2ae	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5553-312e-5240-72e1c62b6bb8	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5553-312e-4a91-da6be98f51ba	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5553-312e-fbbb-9aa7b8957f83	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5553-312e-8816-9020b3c66a23	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5553-312e-c296-ba465ae9d6bc	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5553-312e-d156-5f17a8b6bc62	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5553-312e-69f7-48267eac676f	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5553-312e-2387-bcd855f40b99	SM	SMR	674	San Marino 	San Marino	\N
00040000-5553-312e-9498-f9cc7576eb4a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5553-312e-c452-81fd8e8edf2d	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5553-312e-48cd-0585493dab3c	SN	SEN	686	Senegal 	Senegal	\N
00040000-5553-312e-cda7-06ebd2e8bcd1	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5553-312e-7da7-f701481ea9f2	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5553-312e-9fae-21b3155249bf	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5553-312e-f313-fc84fdf51ece	SG	SGP	702	Singapore 	Singapur	\N
00040000-5553-312e-8c1c-30954ca790fa	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5553-312e-9598-b675f234d1a3	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5553-312e-6c0a-c36ceb7f7684	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5553-312e-1873-574d64ffaf4d	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5553-312e-d6e5-4178cd8cadac	SO	SOM	706	Somalia 	Somalija	\N
00040000-5553-312e-b932-29275945cb00	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5553-312e-81a7-baf2f414efaa	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5553-312e-2deb-2a4f2b51de61	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5553-312e-8dfc-19c0569cbce5	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5553-312e-dc1d-2968da0bb08e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5553-312e-dac5-0955f98a0192	SD	SDN	729	Sudan 	Sudan	\N
00040000-5553-312e-428d-9af16bf8597d	SR	SUR	740	Suriname 	Surinam	\N
00040000-5553-312e-ea8a-86a64cb2f82b	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5553-312e-a363-34229a0fc2c8	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5553-312e-79d2-6177fc088545	SE	SWE	752	Sweden 	Švedska	\N
00040000-5553-312e-abfd-8eb42812a4f5	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5553-312e-5d96-58d8b47f2380	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5553-312e-5a22-8374c4803f57	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5553-312e-f08d-cd8d1999baaf	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5553-312e-fbb3-83b1bb56506d	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5553-312e-175c-fcc60bd76503	TH	THA	764	Thailand 	Tajska	\N
00040000-5553-312e-813f-d2f4c17f20a9	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5553-312e-1a82-cbad3d0ba2c6	TG	TGO	768	Togo 	Togo	\N
00040000-5553-312e-764b-7b4e16ee8e13	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5553-312e-d54c-537ae4354e2a	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5553-312e-d38e-130636fee3e7	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5553-312e-01f5-663d6c8b2358	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5553-312e-109e-59cb6b993d39	TR	TUR	792	Turkey 	Turčija	\N
00040000-5553-312e-1bbf-1b29615923e6	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5553-312e-60ae-1448ac11a72f	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5553-312e-0ac2-b1b8340bebc6	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5553-312e-9c35-1be6f5b61971	UG	UGA	800	Uganda 	Uganda	\N
00040000-5553-312e-4d60-6b747745f903	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5553-312e-02fe-ae24f91ea6f7	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5553-312e-facc-903937357c7c	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5553-312e-c35c-189b64dc335c	US	USA	840	United States 	Združene države Amerike	\N
00040000-5553-312e-70b0-ba1c1f9237e1	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5553-312e-85d6-33ab11c9273c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5553-312e-ac23-130ccae0b738	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5553-312e-331a-e2aac079d2da	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5553-312e-f0ea-01ed6c052540	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5553-312e-3477-f4cecd9e2308	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5553-312e-8f94-4c83c23310f9	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5553-312e-973b-749ddfeb279a	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5553-312e-9a68-29b70e31f0ac	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5553-312e-c561-faf33a9ff272	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5553-312e-fb64-97ee4ef96d65	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5553-312e-8019-a0ff9acd5a86	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5553-312e-7f21-a2a10d767f95	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2673 (class 0 OID 3301124)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 3300945)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 3300993)
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
-- TOC entry 2662 (class 0 OID 3301042)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 3301067)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 3300894)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5553-312e-ce8a-1e91163c064c	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5553-312e-0a2f-176567a48787	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5553-312e-7cd1-8fdb442f0a95	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5553-312e-fea8-e8f7a0ed012a	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5553-312e-5e7f-fe8c818dec1f	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5553-312e-bf76-fe23fa0e1e94	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5553-312e-37a9-bd5a77960cd7	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5553-312e-8768-7d7840ca927a	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5553-312e-e680-1f00926ffdde	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5553-312e-fee0-6a48cd855702	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2641 (class 0 OID 3300802)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5553-312e-dcc4-a83bc6cc3044	00000000-5553-312e-5e7f-fe8c818dec1f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5553-312e-7403-361275cbd28a	00000000-5553-312e-5e7f-fe8c818dec1f	00010000-5553-312e-cdf0-c33fedd50a1e	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5553-312e-f98b-8e7070d9a4aa	00000000-5553-312e-bf76-fe23fa0e1e94	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2642 (class 0 OID 3300813)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 3300864)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 3300767)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5553-312e-1ac6-2c8d38e63123	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5553-312e-b188-24b62f602833	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5553-312e-f8f5-19c034a23355	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5553-312e-396b-3da7b5de8284	Abonma-read	Abonma - branje	f
00030000-5553-312e-3706-4092d3261912	Abonma-write	Abonma - spreminjanje	f
00030000-5553-312e-270f-1cdc0f27ef73	Alternacija-read	Alternacija - branje	f
00030000-5553-312e-bfb5-66ed4a0f66c9	Alternacija-write	Alternacija - spreminjanje	f
00030000-5553-312e-bf83-3fda3710453e	Arhivalija-read	Arhivalija - branje	f
00030000-5553-312e-bbcb-997063e54bed	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5553-312e-bdc9-e34cd322f8a9	Besedilo-read	Besedilo - branje	f
00030000-5553-312e-8e23-ea96a7eb9ea1	Besedilo-write	Besedilo - spreminjanje	f
00030000-5553-312e-e292-9bf7cf5ea356	DogodekIzven-read	DogodekIzven - branje	f
00030000-5553-312e-a4cd-6dda5b802ce0	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5553-312e-3623-67bc9ca620d5	Dogodek-read	Dogodek - branje	f
00030000-5553-312e-0236-1d8b09950601	Dogodek-write	Dogodek - spreminjanje	f
00030000-5553-312e-fbf9-9258f59e0d37	Drzava-read	Drzava - branje	f
00030000-5553-312e-d74b-6581ba66963e	Drzava-write	Drzava - spreminjanje	f
00030000-5553-312e-da7a-b0be086c4d1b	Funkcija-read	Funkcija - branje	f
00030000-5553-312e-e38c-d7851825b1ec	Funkcija-write	Funkcija - spreminjanje	f
00030000-5553-312e-6fda-a59b12a5bbd2	Gostovanje-read	Gostovanje - branje	f
00030000-5553-312e-e040-4ccfe023feb3	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5553-312e-973a-0b6e66eae82a	Gostujoca-read	Gostujoca - branje	f
00030000-5553-312e-075e-90b90cd83775	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5553-312e-635b-d882d5c4c247	Kupec-read	Kupec - branje	f
00030000-5553-312e-865a-d82f9041396f	Kupec-write	Kupec - spreminjanje	f
00030000-5553-312e-478c-de4a3985461a	NacinPlacina-read	NacinPlacina - branje	f
00030000-5553-312e-866f-072874a7eeb3	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5553-312e-32fd-10cc35da599a	Option-read	Option - branje	f
00030000-5553-312e-eb27-53be0dedb3cc	Option-write	Option - spreminjanje	f
00030000-5553-312e-9eca-71c0a9fb25da	OptionValue-read	OptionValue - branje	f
00030000-5553-312e-f7dc-7ae4d0a838d5	OptionValue-write	OptionValue - spreminjanje	f
00030000-5553-312e-ae3c-79e25197ee44	Oseba-read	Oseba - branje	f
00030000-5553-312e-67b6-b309281811ca	Oseba-write	Oseba - spreminjanje	f
00030000-5553-312e-7a3b-2de7cc381e18	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5553-312e-2cfb-78d9841c7d3a	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5553-312e-8926-bc39705167fd	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5553-312e-e87b-986d0eba7981	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5553-312e-2a9f-d102209d6663	Pogodba-read	Pogodba - branje	f
00030000-5553-312e-2ae0-c6b452558dcb	Pogodba-write	Pogodba - spreminjanje	f
00030000-5553-312e-f7e5-05cb8dcb8ef0	Popa-read	Popa - branje	f
00030000-5553-312e-3c88-aed26f2a6a48	Popa-write	Popa - spreminjanje	f
00030000-5553-312e-37a9-818e05824b8d	Posta-read	Posta - branje	f
00030000-5553-312e-617a-40e92f0c580d	Posta-write	Posta - spreminjanje	f
00030000-5553-312e-6ec0-31377146a387	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5553-312e-b40b-f187dbd2e3c4	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5553-312e-f4a0-efb3e46e7fed	PostniNaslov-read	PostniNaslov - branje	f
00030000-5553-312e-d89a-3dd8f2e69f73	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5553-312e-4b71-63605aa723ce	Predstava-read	Predstava - branje	f
00030000-5553-312e-d7a1-c3bbc5b3cbe2	Predstava-write	Predstava - spreminjanje	f
00030000-5553-312e-8c3a-490296ef0c80	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5553-312e-f0b7-3806e5d544c1	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5553-312e-547c-9a9fcd30eb69	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5553-312e-4753-a71196cf13d4	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5553-312e-a173-dd7fa763f12a	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5553-312e-3891-c02eec1f474c	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5553-312e-c89e-15f6da96792a	Prostor-read	Prostor - branje	f
00030000-5553-312e-7dd8-9f351683ecda	Prostor-write	Prostor - spreminjanje	f
00030000-5553-312e-724e-c8439b81c7af	Racun-read	Racun - branje	f
00030000-5553-312e-0cd5-ee2a710149f8	Racun-write	Racun - spreminjanje	f
00030000-5553-312e-f169-9905d2ae8a94	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5553-312e-5bac-43c444fc3854	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5553-312e-4328-e0fe11e2e8db	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5553-312e-fe61-d4ad1e734ade	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5553-312e-fc1e-abd69193a6ce	Rekvizit-read	Rekvizit - branje	f
00030000-5553-312e-09c5-2c6a5796a618	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5553-312e-03f7-3ae386dc6a88	Rezervacija-read	Rezervacija - branje	f
00030000-5553-312e-7eab-c5986b4d6608	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5553-312e-4ec5-196ba80b7374	SedezniRed-read	SedezniRed - branje	f
00030000-5553-312e-91c0-90be3b3f46a5	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5553-312e-8c54-3c858e2addec	Sedez-read	Sedez - branje	f
00030000-5553-312e-0ebf-e986593c2c62	Sedez-write	Sedez - spreminjanje	f
00030000-5553-312e-7872-0b74f06a9096	Sezona-read	Sezona - branje	f
00030000-5553-312e-fd0d-60b8b0aa507a	Sezona-write	Sezona - spreminjanje	f
00030000-5553-312e-bf9a-abe0a18c02c6	Telefonska-read	Telefonska - branje	f
00030000-5553-312e-397e-a803185f3b0c	Telefonska-write	Telefonska - spreminjanje	f
00030000-5553-312e-836c-9a2e7b0aec6e	TerminStoritve-read	TerminStoritve - branje	f
00030000-5553-312e-1b7d-f2f7edd8eee7	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5553-312e-cf3d-173aa46dc759	TipFunkcije-read	TipFunkcije - branje	f
00030000-5553-312e-ecf2-dd3d176fe68d	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5553-312e-30e4-b28c8931d431	Trr-read	Trr - branje	f
00030000-5553-312e-00ce-66be185199da	Trr-write	Trr - spreminjanje	f
00030000-5553-312e-9431-6558a6d6430c	Uprizoritev-read	Uprizoritev - branje	f
00030000-5553-312e-a92c-df3eb9cbef19	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5553-312e-a4d4-1b421c6a5503	Vaja-read	Vaja - branje	f
00030000-5553-312e-803d-b6d18a92a48d	Vaja-write	Vaja - spreminjanje	f
00030000-5553-312e-37f3-4ed0868cc295	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5553-312e-65ec-b91f9eaab1ed	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5553-312e-888c-7285acec7f92	Zaposlitev-read	Zaposlitev - branje	f
00030000-5553-312e-7bd6-39a1cde47eb6	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5553-312e-9c22-bf3556a7dfb5	Zasedenost-read	Zasedenost - branje	f
00030000-5553-312e-309b-bcaa0aead621	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5553-312e-6237-fe2a82b07bef	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5553-312e-a3b6-9b3b33518233	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5553-312e-8c1e-f3e6c924ec95	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5553-312e-e5f5-7203a071e2ca	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2639 (class 0 OID 3300786)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5553-312e-fa67-256fdeaa432c	00030000-5553-312e-fbf9-9258f59e0d37
00020000-5553-312e-a4a0-e06a6aa43893	00030000-5553-312e-d74b-6581ba66963e
00020000-5553-312e-a4a0-e06a6aa43893	00030000-5553-312e-fbf9-9258f59e0d37
\.


--
-- TOC entry 2667 (class 0 OID 3301074)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 3301104)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 3301219)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 3300844)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 3300886)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5553-312d-9ff9-fbbf924e5801	8341	Adlešiči
00050000-5553-312d-4e6c-fb9ed4bf1841	5270	Ajdovščina
00050000-5553-312d-235e-6bc74ce0fdcd	6280	Ankaran/Ancarano
00050000-5553-312d-9073-4aa9747fca94	9253	Apače
00050000-5553-312d-a430-72434a22d52e	8253	Artiče
00050000-5553-312d-697a-25d5abe08eb5	4275	Begunje na Gorenjskem
00050000-5553-312d-5c5f-7ad08747d76c	1382	Begunje pri Cerknici
00050000-5553-312d-cdad-c0d4d7ea834e	9231	Beltinci
00050000-5553-312d-48d3-df6dd51c55ff	2234	Benedikt
00050000-5553-312d-1ac3-15b8f666f89c	2345	Bistrica ob Dravi
00050000-5553-312d-f418-b23ca874b870	3256	Bistrica ob Sotli
00050000-5553-312d-365d-53da23d5499e	8259	Bizeljsko
00050000-5553-312d-147c-f5e069695046	1223	Blagovica
00050000-5553-312d-7dc2-faa97818128e	8283	Blanca
00050000-5553-312d-5fe9-051bad35c90d	4260	Bled
00050000-5553-312d-fba3-2102feb540ae	4273	Blejska Dobrava
00050000-5553-312d-9308-b827227f5ef7	9265	Bodonci
00050000-5553-312d-c762-d9aeef625549	9222	Bogojina
00050000-5553-312d-8404-15087f61a87c	4263	Bohinjska Bela
00050000-5553-312d-f254-8809addad862	4264	Bohinjska Bistrica
00050000-5553-312d-62b5-b7b77360ac33	4265	Bohinjsko jezero
00050000-5553-312d-4a55-bc3d2c9d04c8	1353	Borovnica
00050000-5553-312d-ad4a-0d4e27c79404	8294	Boštanj
00050000-5553-312d-d532-814f514c1376	5230	Bovec
00050000-5553-312d-4664-2d9d38ec844f	5295	Branik
00050000-5553-312d-6ac9-bab56e40265c	3314	Braslovče
00050000-5553-312d-a46d-bc871fc2d650	5223	Breginj
00050000-5553-312d-823c-662105a0a775	8280	Brestanica
00050000-5553-312d-a534-44e1d9e58747	2354	Bresternica
00050000-5553-312d-27e5-480d6836b537	4243	Brezje
00050000-5553-312d-dadb-4ab014c9f999	1351	Brezovica pri Ljubljani
00050000-5553-312d-d9ae-1d029cc2eccb	8250	Brežice
00050000-5553-312d-4a26-c4155e10cba4	4210	Brnik - Aerodrom
00050000-5553-312d-1a26-3160c4d36027	8321	Brusnice
00050000-5553-312d-8597-6766ed13a73c	3255	Buče
00050000-5553-312d-5be3-95dc9edadab8	8276	Bučka 
00050000-5553-312d-354a-2880f63a6cc8	9261	Cankova
00050000-5553-312d-20e3-e5293f5ca12f	3000	Celje 
00050000-5553-312d-4df4-7f9fb601a73a	3001	Celje - poštni predali
00050000-5553-312d-a146-d56b53c3224f	4207	Cerklje na Gorenjskem
00050000-5553-312d-88aa-3e50a0f45d32	8263	Cerklje ob Krki
00050000-5553-312d-2482-55c9dc9c1bc5	1380	Cerknica
00050000-5553-312d-e443-59840f072613	5282	Cerkno
00050000-5553-312d-2114-84c34a24881a	2236	Cerkvenjak
00050000-5553-312d-d47d-60d4c119715b	2215	Ceršak
00050000-5553-312d-42a7-edec7ad374b2	2326	Cirkovce
00050000-5553-312d-c0cc-9e82380bed48	2282	Cirkulane
00050000-5553-312d-9821-fb03597edac8	5273	Col
00050000-5553-312d-3714-00961bb71244	8251	Čatež ob Savi
00050000-5553-312d-7e53-1fbea2fec17e	1413	Čemšenik
00050000-5553-312d-797d-a8d536cb7769	5253	Čepovan
00050000-5553-312d-b7f4-da8e6cb89851	9232	Črenšovci
00050000-5553-312d-57c8-febc7a12369d	2393	Črna na Koroškem
00050000-5553-312d-8f6d-574b3484ae48	6275	Črni Kal
00050000-5553-312d-286a-be43bc895e93	5274	Črni Vrh nad Idrijo
00050000-5553-312d-782b-a77fbec62b02	5262	Črniče
00050000-5553-312d-4ced-2fd156dc383f	8340	Črnomelj
00050000-5553-312d-0d66-4f2caba204f3	6271	Dekani
00050000-5553-312d-8972-6c27f99b2346	5210	Deskle
00050000-5553-312d-c4ed-abf3a900f78f	2253	Destrnik
00050000-5553-312d-f03c-a649c27662db	6215	Divača
00050000-5553-312d-ddad-1dcbaaf8e72c	1233	Dob
00050000-5553-312d-a47b-ce3649cda051	3224	Dobje pri Planini
00050000-5553-312d-44c4-5b27387514ee	8257	Dobova
00050000-5553-312d-0d88-3a773270ad4b	1423	Dobovec
00050000-5553-312d-0649-367ca16abe14	5263	Dobravlje
00050000-5553-312d-27ff-c56c55d2d0b2	3204	Dobrna
00050000-5553-312d-f371-7c7ff3992d21	8211	Dobrnič
00050000-5553-312d-4f47-6c714ba262f7	1356	Dobrova
00050000-5553-312d-b8eb-6ee2753296b3	9223	Dobrovnik/Dobronak 
00050000-5553-312d-ca6b-5d9eb1850fd5	5212	Dobrovo v Brdih
00050000-5553-312d-fbb8-292146866212	1431	Dol pri Hrastniku
00050000-5553-312d-28c2-9488c10e777e	1262	Dol pri Ljubljani
00050000-5553-312d-2a98-24e43a6ffec5	1273	Dole pri Litiji
00050000-5553-312d-4a2b-8392753a16eb	1331	Dolenja vas
00050000-5553-312d-eb26-a20efc417a19	8350	Dolenjske Toplice
00050000-5553-312d-117a-9435cda618ed	1230	Domžale
00050000-5553-312d-cbe3-caf81515130e	2252	Dornava
00050000-5553-312d-c7e8-5645366dd050	5294	Dornberk
00050000-5553-312d-1828-d36beaf5776b	1319	Draga
00050000-5553-312d-1067-0a71dbdf6621	8343	Dragatuš
00050000-5553-312d-f09f-be5f0367860a	3222	Dramlje
00050000-5553-312d-8a2c-bed01156e406	2370	Dravograd
00050000-5553-312d-3407-3c168421a794	4203	Duplje
00050000-5553-312d-3065-d2b6b81dd6ef	6221	Dutovlje
00050000-5553-312d-7e18-87cab0c63db8	8361	Dvor
00050000-5553-312d-f046-e5d2857293e7	2343	Fala
00050000-5553-312d-acc1-2a00eb21ccec	9208	Fokovci
00050000-5553-312d-5982-80418fdb825a	2313	Fram
00050000-5553-312d-87ce-d634952a3efa	3213	Frankolovo
00050000-5553-312d-99b8-dcf7d6af82f8	1274	Gabrovka
00050000-5553-312d-b573-e3e2d8502fa7	8254	Globoko
00050000-5553-312d-76d1-dd6ec55816ec	5275	Godovič
00050000-5553-312d-452b-0c7122ad2ece	4204	Golnik
00050000-5553-312d-9671-7a0b7ccfe2ea	3303	Gomilsko
00050000-5553-312d-7eeb-e29367d05abb	4224	Gorenja vas
00050000-5553-312d-c595-d7c9918da059	3263	Gorica pri Slivnici
00050000-5553-312d-f949-ad1fab0f4713	2272	Gorišnica
00050000-5553-312d-e7c6-84051f7d6c1e	9250	Gornja Radgona
00050000-5553-312d-ed88-40678d0120af	3342	Gornji Grad
00050000-5553-312d-8351-a68171b86df1	4282	Gozd Martuljek
00050000-5553-312d-70ad-e2199f6363c8	6272	Gračišče
00050000-5553-312d-2212-fe6938b3c949	9264	Grad
00050000-5553-312d-e446-380990285195	8332	Gradac
00050000-5553-312d-247e-b65e02bd2517	1384	Grahovo
00050000-5553-312d-8a7d-6304cf00de76	5242	Grahovo ob Bači
00050000-5553-312d-4250-a1e530e93653	5251	Grgar
00050000-5553-312d-d44f-f5179320f62e	3302	Griže
00050000-5553-312d-0031-96c639409147	3231	Grobelno
00050000-5553-312d-415d-d8ab3d897dd2	1290	Grosuplje
00050000-5553-312e-e299-fd9bfe95121f	2288	Hajdina
00050000-5553-312e-b29e-b5f6cd2ab934	8362	Hinje
00050000-5553-312e-f1e7-6e02f77bedfa	2311	Hoče
00050000-5553-312e-ebef-2ad1019322cd	9205	Hodoš/Hodos
00050000-5553-312e-ef9d-0fb9a616f8a0	1354	Horjul
00050000-5553-312e-e11f-0585341f7451	1372	Hotedršica
00050000-5553-312e-516f-13d62f1517e5	1430	Hrastnik
00050000-5553-312e-7be3-aa2510384bad	6225	Hruševje
00050000-5553-312e-2999-4af1e0e8d09f	4276	Hrušica
00050000-5553-312e-9734-477947f122a1	5280	Idrija
00050000-5553-312e-0783-da635271110c	1292	Ig
00050000-5553-312e-6e08-7d5ab0fccb22	6250	Ilirska Bistrica
00050000-5553-312e-71b1-7672914010f0	6251	Ilirska Bistrica-Trnovo
00050000-5553-312e-f4a2-37cf6546e7c1	1295	Ivančna Gorica
00050000-5553-312e-871e-c3aa915342bd	2259	Ivanjkovci
00050000-5553-312e-c390-db6440ae92c5	1411	Izlake
00050000-5553-312e-785f-d467ba98dbb3	6310	Izola/Isola
00050000-5553-312e-6d12-ecb227d589b2	2222	Jakobski Dol
00050000-5553-312e-3e35-a665ce32bf35	2221	Jarenina
00050000-5553-312e-dbd8-dc9cd258b9d6	6254	Jelšane
00050000-5553-312e-fd22-f2d847270c1a	4270	Jesenice
00050000-5553-312e-4d05-0d7dbf933ef8	8261	Jesenice na Dolenjskem
00050000-5553-312e-4b52-790f89dc8c7e	3273	Jurklošter
00050000-5553-312e-5bc3-f398b699c776	2223	Jurovski Dol
00050000-5553-312e-6e01-08610d48d051	2256	Juršinci
00050000-5553-312e-df63-7e7cad989af7	5214	Kal nad Kanalom
00050000-5553-312e-3754-05de036ac466	3233	Kalobje
00050000-5553-312e-031f-9b24d15d48b9	4246	Kamna Gorica
00050000-5553-312e-3145-c57950d58b80	2351	Kamnica
00050000-5553-312e-d6f9-2e0107e5ead7	1241	Kamnik
00050000-5553-312e-fa4e-8c8298b6de2e	5213	Kanal
00050000-5553-312e-6f84-8eb3e018ab30	8258	Kapele
00050000-5553-312e-10e0-d2a877d6ea5d	2362	Kapla
00050000-5553-312e-5c09-3bac8772ec3b	2325	Kidričevo
00050000-5553-312e-00c7-728f2e31e857	1412	Kisovec
00050000-5553-312e-1d5b-68e281413a4e	6253	Knežak
00050000-5553-312e-157f-0e5f225dc097	5222	Kobarid
00050000-5553-312e-4e4b-3729ab833dd1	9227	Kobilje
00050000-5553-312e-1dd7-3536070eebf1	1330	Kočevje
00050000-5553-312e-6d55-d6910b2646af	1338	Kočevska Reka
00050000-5553-312e-fe53-f21c9cb0730f	2276	Kog
00050000-5553-312e-ec61-cb0bf14c8ed0	5211	Kojsko
00050000-5553-312e-38df-6d8289f935a6	6223	Komen
00050000-5553-312e-55b6-679d88da9f7e	1218	Komenda
00050000-5553-312e-d558-245d93bfd640	6000	Koper/Capodistria 
00050000-5553-312e-a9e9-f804e19e2ef3	6001	Koper/Capodistria - poštni predali
00050000-5553-312e-1308-497dda476c0d	8282	Koprivnica
00050000-5553-312e-d33c-6ac261fe7a7c	5296	Kostanjevica na Krasu
00050000-5553-312e-2544-7f5d5528b78e	8311	Kostanjevica na Krki
00050000-5553-312e-f1e4-9a733da6833c	1336	Kostel
00050000-5553-312e-0f7f-a21923c617c0	6256	Košana
00050000-5553-312e-4a4f-65f4cf227e8f	2394	Kotlje
00050000-5553-312e-a586-4b960c9e4936	6240	Kozina
00050000-5553-312e-8a6d-e2d358e91ed2	3260	Kozje
00050000-5553-312e-3f5b-35ace98cf4c7	4000	Kranj 
00050000-5553-312e-c1f5-bdb3b4f51de0	4001	Kranj - poštni predali
00050000-5553-312e-e2ec-8b4c199629ee	4280	Kranjska Gora
00050000-5553-312e-d95b-5f9fb0c32c75	1281	Kresnice
00050000-5553-312e-326f-3dd3eab7e665	4294	Križe
00050000-5553-312e-4aa1-119e1d23153f	9206	Križevci
00050000-5553-312e-2eac-8105db08ba78	9242	Križevci pri Ljutomeru
00050000-5553-312e-f418-779f3438077a	1301	Krka
00050000-5553-312e-bd69-993b0065500f	8296	Krmelj
00050000-5553-312e-35e2-8209f5978270	4245	Kropa
00050000-5553-312e-9a33-a7e350f4b0bd	8262	Krška vas
00050000-5553-312e-ad8e-b0c964ab3f22	8270	Krško
00050000-5553-312e-3b7f-54f9ea3c198e	9263	Kuzma
00050000-5553-312e-1cee-1124a49d1ea2	2318	Laporje
00050000-5553-312e-b2a5-2a7992ece7ef	3270	Laško
00050000-5553-312e-c4d4-7210d19943fb	1219	Laze v Tuhinju
00050000-5553-312e-4682-9ee397e515ef	2230	Lenart v Slovenskih goricah
00050000-5553-312e-947a-c0db10fd4876	9220	Lendava/Lendva
00050000-5553-312e-9a12-ddb51fa9e1a4	4248	Lesce
00050000-5553-312e-185a-afff4ceb6719	3261	Lesično
00050000-5553-312e-a010-b422a7a833fd	8273	Leskovec pri Krškem
00050000-5553-312e-500a-0d6d65bafe85	2372	Libeliče
00050000-5553-312e-fca2-4ac0bfe9635e	2341	Limbuš
00050000-5553-312e-e3be-64873e83a471	1270	Litija
00050000-5553-312e-6ad9-15e569061e9e	3202	Ljubečna
00050000-5553-312e-0c7f-678f4c1426f4	1000	Ljubljana 
00050000-5553-312e-7930-ca48ab45d676	1001	Ljubljana - poštni predali
00050000-5553-312e-2190-b4b1275794f8	1231	Ljubljana - Črnuče
00050000-5553-312e-2c07-4ec969c3e59e	1261	Ljubljana - Dobrunje
00050000-5553-312e-19ce-c54927006d61	1260	Ljubljana - Polje
00050000-5553-312e-f329-302c1e088cc4	1210	Ljubljana - Šentvid
00050000-5553-312e-29ba-106eb28c48f9	1211	Ljubljana - Šmartno
00050000-5553-312e-1c10-664f814a9f4e	3333	Ljubno ob Savinji
00050000-5553-312e-12e9-162733c766c1	9240	Ljutomer
00050000-5553-312e-c679-0bcb0600af7c	3215	Loče
00050000-5553-312e-4c79-d50fa80d37e9	5231	Log pod Mangartom
00050000-5553-312e-4fd5-ceddb4da6dac	1358	Log pri Brezovici
00050000-5553-312e-8802-3631cbf50c7a	1370	Logatec
00050000-5553-312e-c071-3d1feae13b4c	1371	Logatec
00050000-5553-312e-2fb1-b16c4bd12303	1434	Loka pri Zidanem Mostu
00050000-5553-312e-fa31-7a7c037d680b	3223	Loka pri Žusmu
00050000-5553-312e-719a-37d78d232c5e	6219	Lokev
00050000-5553-312e-422a-2a11caca9e03	1318	Loški Potok
00050000-5553-312e-66fc-6430781349df	2324	Lovrenc na Dravskem polju
00050000-5553-312e-19e1-ce0d0b11b6cc	2344	Lovrenc na Pohorju
00050000-5553-312e-a0c8-47b59798141c	3334	Luče
00050000-5553-312e-9528-ce1b3a6a4296	1225	Lukovica
00050000-5553-312e-71f0-ef4678aa55fc	9202	Mačkovci
00050000-5553-312e-d37f-fda1c4688136	2322	Majšperk
00050000-5553-312e-42be-5be2be744a84	2321	Makole
00050000-5553-312e-68b9-3a71c1eb7efc	9243	Mala Nedelja
00050000-5553-312e-cbc4-8cf682067ecd	2229	Malečnik
00050000-5553-312e-fe5d-90430f9a3d89	6273	Marezige
00050000-5553-312e-9d02-15e83586c1f4	2000	Maribor 
00050000-5553-312e-80f2-78e411f1b706	2001	Maribor - poštni predali
00050000-5553-312e-6fc4-b694af770b86	2206	Marjeta na Dravskem polju
00050000-5553-312e-d88d-dd01cf675da1	2281	Markovci
00050000-5553-312e-4b13-050afd50c4a8	9221	Martjanci
00050000-5553-312e-bb0d-753880dbbf9c	6242	Materija
00050000-5553-312e-4706-c31e79af4ed0	4211	Mavčiče
00050000-5553-312e-d263-489ed3027795	1215	Medvode
00050000-5553-312e-1f78-f1f77289fb65	1234	Mengeš
00050000-5553-312e-1a61-195d937bfe19	8330	Metlika
00050000-5553-312e-b717-5771d2f723e6	2392	Mežica
00050000-5553-312e-e2f0-3f6880b3eb1d	2204	Miklavž na Dravskem polju
00050000-5553-312e-d924-4c2fa470800a	2275	Miklavž pri Ormožu
00050000-5553-312e-5fb0-2fb3da3b01c9	5291	Miren
00050000-5553-312e-0a49-16d4df7d14c8	8233	Mirna
00050000-5553-312e-655e-993e9ddc17a1	8216	Mirna Peč
00050000-5553-312e-2237-3b3ad6657284	2382	Mislinja
00050000-5553-312e-3d45-b190f311881b	4281	Mojstrana
00050000-5553-312e-300f-0a24c357d4b4	8230	Mokronog
00050000-5553-312e-19e4-3d8eca96627b	1251	Moravče
00050000-5553-312e-084c-7984d35c57e9	9226	Moravske Toplice
00050000-5553-312e-a0de-1df24deecde0	5216	Most na Soči
00050000-5553-312e-6007-d3f461a61ed3	1221	Motnik
00050000-5553-312e-f5d2-db0e07e5f055	3330	Mozirje
00050000-5553-312e-879a-92e8186eecb5	9000	Murska Sobota 
00050000-5553-312e-30b8-8bf7e5f8fcba	9001	Murska Sobota - poštni predali
00050000-5553-312e-e5ff-850201c1ff7a	2366	Muta
00050000-5553-312e-5269-cb38fc7aa12c	4202	Naklo
00050000-5553-312e-f4f8-bba4a10efe6b	3331	Nazarje
00050000-5553-312e-7d68-208318aa2a75	1357	Notranje Gorice
00050000-5553-312e-26a4-c1a894018cc7	3203	Nova Cerkev
00050000-5553-312e-e6b6-3ec11c90209b	5000	Nova Gorica 
00050000-5553-312e-a11c-eeaf095669d6	5001	Nova Gorica - poštni predali
00050000-5553-312e-3bd4-1dfa9f25608b	1385	Nova vas
00050000-5553-312e-061b-d88eb4615e37	8000	Novo mesto
00050000-5553-312e-bfce-645810b07f6a	8001	Novo mesto - poštni predali
00050000-5553-312e-a0d3-ff66990c8c0e	6243	Obrov
00050000-5553-312e-cfb4-6b8bf8cae11f	9233	Odranci
00050000-5553-312e-c068-0d1305fcb8ed	2317	Oplotnica
00050000-5553-312e-a113-15985d177189	2312	Orehova vas
00050000-5553-312e-f3f9-727eb305bad7	2270	Ormož
00050000-5553-312e-f92b-891b7c1f3796	1316	Ortnek
00050000-5553-312e-96b3-9ccf81ac5644	1337	Osilnica
00050000-5553-312e-0584-cf52a810d49e	8222	Otočec
00050000-5553-312e-b8bd-53196ca3c00c	2361	Ožbalt
00050000-5553-312e-8e62-ec315892cbdb	2231	Pernica
00050000-5553-312e-e945-0e30af94a071	2211	Pesnica pri Mariboru
00050000-5553-312e-ab70-10e7724c2567	9203	Petrovci
00050000-5553-312e-17e4-e7b35c29e1cb	3301	Petrovče
00050000-5553-312e-2e2f-44e1322a7a8f	6330	Piran/Pirano
00050000-5553-312e-9da6-e35dd70db8de	8255	Pišece
00050000-5553-312e-0a28-c70f731fac62	6257	Pivka
00050000-5553-312e-e265-7eaba0818d4a	6232	Planina
00050000-5553-312e-2e2e-40bcec88cc2a	3225	Planina pri Sevnici
00050000-5553-312e-d742-c72724a44a32	6276	Pobegi
00050000-5553-312e-ab29-f1aa3839899b	8312	Podbočje
00050000-5553-312e-fbef-47c4de97f4f4	5243	Podbrdo
00050000-5553-312e-9343-de6f7c67ac65	3254	Podčetrtek
00050000-5553-312e-a078-d0f85fe352d9	2273	Podgorci
00050000-5553-312e-5ca8-bb7c9dc907a3	6216	Podgorje
00050000-5553-312e-438f-07dbf4ac4208	2381	Podgorje pri Slovenj Gradcu
00050000-5553-312e-c4b5-702cf888d38a	6244	Podgrad
00050000-5553-312e-c51f-53062b7378b3	1414	Podkum
00050000-5553-312e-13e2-5cd6808b6229	2286	Podlehnik
00050000-5553-312e-1c28-12a9045fe097	5272	Podnanos
00050000-5553-312e-40d9-921bf8340f96	4244	Podnart
00050000-5553-312e-4061-8fde81a80ace	3241	Podplat
00050000-5553-312e-cd28-ac4d98d4005e	3257	Podsreda
00050000-5553-312e-b1de-2fbbb88eda9c	2363	Podvelka
00050000-5553-312e-46a9-025773894c7e	2208	Pohorje
00050000-5553-312e-91db-d4d37e651dc0	2257	Polenšak
00050000-5553-312e-4b7e-ab658910069c	1355	Polhov Gradec
00050000-5553-312e-4360-d5bbf81def2b	4223	Poljane nad Škofjo Loko
00050000-5553-312e-e14b-21d08d3d055e	2319	Poljčane
00050000-5553-312e-963f-53e8184b213b	1272	Polšnik
00050000-5553-312e-bfbb-741b8599f161	3313	Polzela
00050000-5553-312e-3f68-7fec7eac97d5	3232	Ponikva
00050000-5553-312e-f87d-33c9e0500986	6320	Portorož/Portorose
00050000-5553-312e-390b-c6b354ccfa74	6230	Postojna
00050000-5553-312e-e2f4-883de98a3ec5	2331	Pragersko
00050000-5553-312e-ea83-7aaf37e0dde0	3312	Prebold
00050000-5553-312e-a00d-a14f42631022	4205	Preddvor
00050000-5553-312e-353d-a58cbd64182b	6255	Prem
00050000-5553-312e-77fa-76626c301004	1352	Preserje
00050000-5553-312e-23c6-8ed4bdfdc4c8	6258	Prestranek
00050000-5553-312e-3910-e496ad01207f	2391	Prevalje
00050000-5553-312e-3a90-fac951a8c200	3262	Prevorje
00050000-5553-312e-4752-c998179e72a1	1276	Primskovo 
00050000-5553-312e-06bf-38164f09b76a	3253	Pristava pri Mestinju
00050000-5553-312e-0ac5-1944d51f83fb	9207	Prosenjakovci/Partosfalva
00050000-5553-312e-29d5-00a7a684a053	5297	Prvačina
00050000-5553-312e-4fcb-9ec618d5600c	2250	Ptuj
00050000-5553-312e-637c-762055dd1b70	2323	Ptujska Gora
00050000-5553-312e-f86e-e3ed718b6a16	9201	Puconci
00050000-5553-312e-dd92-00f12e605d7e	2327	Rače
00050000-5553-312e-3a10-795323e939ae	1433	Radeče
00050000-5553-312e-a0be-2815d2507177	9252	Radenci
00050000-5553-312e-a270-f3ec4d282a49	2360	Radlje ob Dravi
00050000-5553-312e-f756-b7091344bc28	1235	Radomlje
00050000-5553-312e-2234-f55b49683653	4240	Radovljica
00050000-5553-312e-d152-f5e15a93eaea	8274	Raka
00050000-5553-312e-4b83-007a5ee627fa	1381	Rakek
00050000-5553-312e-3375-7f3f4b5463ce	4283	Rateče - Planica
00050000-5553-312e-6715-f2fc73d2f09f	2390	Ravne na Koroškem
00050000-5553-312e-dde0-ba68328e2a7d	9246	Razkrižje
00050000-5553-312e-e67e-77f8a13b68c1	3332	Rečica ob Savinji
00050000-5553-312e-3362-bee44d7e2d0d	5292	Renče
00050000-5553-312e-17c1-c072dab0a205	1310	Ribnica
00050000-5553-312e-c0e1-323251324804	2364	Ribnica na Pohorju
00050000-5553-312e-8a05-ef8781079ddf	3272	Rimske Toplice
00050000-5553-312e-0f83-1f80fe184965	1314	Rob
00050000-5553-312e-a5f1-befebe265c1b	5215	Ročinj
00050000-5553-312e-00dc-f63c81a071ac	3250	Rogaška Slatina
00050000-5553-312e-ea2d-aad5a6a2d7ab	9262	Rogašovci
00050000-5553-312e-d9a0-b07e09f08898	3252	Rogatec
00050000-5553-312e-6b99-07702e83116e	1373	Rovte
00050000-5553-312e-ec29-6750a262de09	2342	Ruše
00050000-5553-312e-c36b-d73c4f744b5a	1282	Sava
00050000-5553-312e-460d-6a383456ce1d	6333	Sečovlje/Sicciole
00050000-5553-312e-360d-a81002ff6d1a	4227	Selca
00050000-5553-312e-0604-38cd39cc2e80	2352	Selnica ob Dravi
00050000-5553-312e-babb-1ba4d8353327	8333	Semič
00050000-5553-312e-4020-7e137b77ccfe	8281	Senovo
00050000-5553-312e-105c-cbd8d04e9197	6224	Senožeče
00050000-5553-312e-e91a-255314beeac9	8290	Sevnica
00050000-5553-312e-e637-0d2141f5da68	6210	Sežana
00050000-5553-312e-7176-0cc9502d791f	2214	Sladki Vrh
00050000-5553-312e-4425-1e970dc19628	5283	Slap ob Idrijci
00050000-5553-312e-d4a4-beca6b65eac1	2380	Slovenj Gradec
00050000-5553-312e-7670-29078da6f1a9	2310	Slovenska Bistrica
00050000-5553-312e-c024-883d5951876e	3210	Slovenske Konjice
00050000-5553-312e-9dd8-0d25f216926f	1216	Smlednik
00050000-5553-312e-77cb-a0e7390d3485	5232	Soča
00050000-5553-312e-bf44-56e024e4bfa0	1317	Sodražica
00050000-5553-312e-fbe0-65f3dbede618	3335	Solčava
00050000-5553-312e-0161-b3f37b0a5b4d	5250	Solkan
00050000-5553-312e-f9ff-4ef89100b5d6	4229	Sorica
00050000-5553-312e-f8f0-93cedc75bd3b	4225	Sovodenj
00050000-5553-312e-1ca3-81aa461cd71c	5281	Spodnja Idrija
00050000-5553-312e-6d6e-2fafc5ba54b1	2241	Spodnji Duplek
00050000-5553-312e-5776-e6dcabb86a78	9245	Spodnji Ivanjci
00050000-5553-312e-6aef-c41148a198d1	2277	Središče ob Dravi
00050000-5553-312e-acb9-d07dd28f9cbc	4267	Srednja vas v Bohinju
00050000-5553-312e-91bf-5b5f388d3245	8256	Sromlje 
00050000-5553-312e-0354-9718e3a6fc9f	5224	Srpenica
00050000-5553-312e-b5ff-6f1efe5acb21	1242	Stahovica
00050000-5553-312e-b179-52ee8ab69d62	1332	Stara Cerkev
00050000-5553-312e-17ee-6e4090bfb8c0	8342	Stari trg ob Kolpi
00050000-5553-312e-f6d2-d59224c39609	1386	Stari trg pri Ložu
00050000-5553-312e-42e1-517656c414c9	2205	Starše
00050000-5553-312e-8643-d06fb6611abe	2289	Stoperce
00050000-5553-312e-6311-7a52d6a0b5ac	8322	Stopiče
00050000-5553-312e-fe55-f13b9f448249	3206	Stranice
00050000-5553-312e-ed29-823141da14cd	8351	Straža
00050000-5553-312e-bacf-8210244fbc88	1313	Struge
00050000-5553-312e-f950-0123196ffaee	8293	Studenec
00050000-5553-312e-e3b0-b90f3fe56f59	8331	Suhor
00050000-5553-312e-ea5f-3d1eb9b87f6f	2233	Sv. Ana v Slovenskih goricah
00050000-5553-312e-32aa-34452c497dab	2235	Sv. Trojica v Slovenskih goricah
00050000-5553-312e-0a07-9ae685d90dc4	2353	Sveti Duh na Ostrem Vrhu
00050000-5553-312e-6771-042a08e67b98	9244	Sveti Jurij ob Ščavnici
00050000-5553-312e-08da-3723bfa23b34	3264	Sveti Štefan
00050000-5553-312e-45c5-a6f4bd26cae0	2258	Sveti Tomaž
00050000-5553-312e-310b-31c0b424e223	9204	Šalovci
00050000-5553-312e-e0f0-bed5e613ae1f	5261	Šempas
00050000-5553-312e-5045-f03a52746870	5290	Šempeter pri Gorici
00050000-5553-312e-89df-cc10c38adf48	3311	Šempeter v Savinjski dolini
00050000-5553-312e-0fe8-f4008779fd4e	4208	Šenčur
00050000-5553-312e-3b08-ae6ece06418c	2212	Šentilj v Slovenskih goricah
00050000-5553-312e-e759-69512d9c686b	8297	Šentjanž
00050000-5553-312e-a314-27c0f9366e86	2373	Šentjanž pri Dravogradu
00050000-5553-312e-cac1-72d253b8005e	8310	Šentjernej
00050000-5553-312e-eb0e-57d638484484	3230	Šentjur
00050000-5553-312e-7027-49f70d382d8b	3271	Šentrupert
00050000-5553-312e-c490-1e6efe03fb3c	8232	Šentrupert
00050000-5553-312e-7805-f1d3824fcc60	1296	Šentvid pri Stični
00050000-5553-312e-29ff-eaf55cbdaa0a	8275	Škocjan
00050000-5553-312e-210d-890d391d5d0d	6281	Škofije
00050000-5553-312e-dc21-adf2a22967de	4220	Škofja Loka
00050000-5553-312e-aa4d-80026f81b30f	3211	Škofja vas
00050000-5553-312e-1ba3-26cbc66b3468	1291	Škofljica
00050000-5553-312e-5063-07574c5f225e	6274	Šmarje
00050000-5553-312e-b4a6-11654767315b	1293	Šmarje - Sap
00050000-5553-312e-73a6-c3a68072c211	3240	Šmarje pri Jelšah
00050000-5553-312e-daa8-714001a66d02	8220	Šmarješke Toplice
00050000-5553-312e-b248-bc07b1d9e0c7	2315	Šmartno na Pohorju
00050000-5553-312e-c952-a32dab0d04ff	3341	Šmartno ob Dreti
00050000-5553-312e-8a5e-7be6a7742dbb	3327	Šmartno ob Paki
00050000-5553-312e-b64e-4dbff6233268	1275	Šmartno pri Litiji
00050000-5553-312e-830d-2bcc0fdff2ad	2383	Šmartno pri Slovenj Gradcu
00050000-5553-312e-1c71-439c606fe58e	3201	Šmartno v Rožni dolini
00050000-5553-312e-ec06-3871dcfa9fde	3325	Šoštanj
00050000-5553-312e-7c00-83260264c3c4	6222	Štanjel
00050000-5553-312e-667b-fcbbe76c56fc	3220	Štore
00050000-5553-312e-d8d4-0cd6af58957c	3304	Tabor
00050000-5553-312e-5659-6a6925276daf	3221	Teharje
00050000-5553-312e-fd8f-73a39089c47e	9251	Tišina
00050000-5553-312e-1b29-a4a28b8fb056	5220	Tolmin
00050000-5553-312e-3fd8-081d72ff72a5	3326	Topolšica
00050000-5553-312e-305a-1742764e9461	2371	Trbonje
00050000-5553-312e-ad5d-b72358478eaa	1420	Trbovlje
00050000-5553-312e-82a7-8e21ee68d054	8231	Trebelno 
00050000-5553-312e-9d43-28a365be64f9	8210	Trebnje
00050000-5553-312e-e4e0-3d6e7f3dbdd9	5252	Trnovo pri Gorici
00050000-5553-312e-8076-f06248b7f813	2254	Trnovska vas
00050000-5553-312e-d7ba-768a27a1ca0b	1222	Trojane
00050000-5553-312e-b869-29ead103ddee	1236	Trzin
00050000-5553-312e-14b9-003011931566	4290	Tržič
00050000-5553-312e-c258-af846be8822e	8295	Tržišče
00050000-5553-312e-84dc-0a906b1b8d3f	1311	Turjak
00050000-5553-312e-9d7c-e6631a282260	9224	Turnišče
00050000-5553-312e-b9f0-32107009b219	8323	Uršna sela
00050000-5553-312e-2f57-36735a59c336	1252	Vače
00050000-5553-312e-c48e-151a83fd942d	3320	Velenje 
00050000-5553-312e-c7af-ff9e2dae6dc3	3322	Velenje - poštni predali
00050000-5553-312e-4437-29ea96ce46da	8212	Velika Loka
00050000-5553-312e-b175-2ed9cbbe360d	2274	Velika Nedelja
00050000-5553-312e-b095-9a8f778d43cf	9225	Velika Polana
00050000-5553-312e-b4bd-4451adcba3bc	1315	Velike Lašče
00050000-5553-312e-d921-873ec7051392	8213	Veliki Gaber
00050000-5553-312e-2833-5fadc13936df	9241	Veržej
00050000-5553-312e-033c-f024d65452a0	1312	Videm - Dobrepolje
00050000-5553-312e-39be-349a27c2b875	2284	Videm pri Ptuju
00050000-5553-312e-c209-388239ef8a01	8344	Vinica
00050000-5553-312e-8d92-fbd42c92aee7	5271	Vipava
00050000-5553-312e-dc04-d6e97c0eb8e2	4212	Visoko
00050000-5553-312e-e0f8-62be7e86c199	1294	Višnja Gora
00050000-5553-312e-156c-c9bfebe762a4	3205	Vitanje
00050000-5553-312e-3e2b-dcd25f800f8d	2255	Vitomarci
00050000-5553-312e-4d22-6788251d608a	1217	Vodice
00050000-5553-312e-d8ef-1c824b236436	3212	Vojnik\t
00050000-5553-312e-6101-abb49e92b9ff	5293	Volčja Draga
00050000-5553-312e-c5b5-8c7b7c210408	2232	Voličina
00050000-5553-312e-8b29-2507848ee78f	3305	Vransko
00050000-5553-312e-67da-5729315132b9	6217	Vremski Britof
00050000-5553-312e-6460-0f79acaafaf1	1360	Vrhnika
00050000-5553-312e-26f1-77f310f293a2	2365	Vuhred
00050000-5553-312e-a963-5bb649320817	2367	Vuzenica
00050000-5553-312e-e076-1d554792f6a5	8292	Zabukovje 
00050000-5553-312e-38bc-78f122dd0f75	1410	Zagorje ob Savi
00050000-5553-312e-cdfb-54dda0e8abb2	1303	Zagradec
00050000-5553-312e-e8f3-d812b97878f9	2283	Zavrč
00050000-5553-312e-d5ca-c4e388802041	8272	Zdole 
00050000-5553-312e-7bae-9b89ba288425	4201	Zgornja Besnica
00050000-5553-312e-802e-fb7ab158a42f	2242	Zgornja Korena
00050000-5553-312e-a53f-81d8bbaee246	2201	Zgornja Kungota
00050000-5553-312e-76e9-7874fcf012fa	2316	Zgornja Ložnica
00050000-5553-312e-aad9-dcde4237220e	2314	Zgornja Polskava
00050000-5553-312e-82f7-b3b43b7cb952	2213	Zgornja Velka
00050000-5553-312e-2430-3905029aee2d	4247	Zgornje Gorje
00050000-5553-312e-9433-558f34adcc7f	4206	Zgornje Jezersko
00050000-5553-312e-010b-f43d769ab29f	2285	Zgornji Leskovec
00050000-5553-312e-ebfe-3ed739b66cfe	1432	Zidani Most
00050000-5553-312e-ab0f-5b33d5a39909	3214	Zreče
00050000-5553-312e-4dc9-9b12b2730548	4209	Žabnica
00050000-5553-312e-9fba-0abbe4403db7	3310	Žalec
00050000-5553-312e-13af-f157ad17c38b	4228	Železniki
00050000-5553-312e-fa44-683dba421e30	2287	Žetale
00050000-5553-312e-fd74-5464f14b5e88	4226	Žiri
00050000-5553-312e-db05-da5894d1b2f5	4274	Žirovnica
00050000-5553-312e-a0bc-dacba880d0dc	8360	Žužemberk
\.


--
-- TOC entry 2663 (class 0 OID 3301048)
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
-- TOC entry 2646 (class 0 OID 3300871)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 3300937)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 3301060)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 3301165)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 3301212)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 3301089)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 3301033)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 3301023)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2680 (class 0 OID 3301202)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 3301155)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 3300738)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5553-312e-cdf0-c33fedd50a1e	00010000-5553-312e-be22-a0e761536237	2015-05-13 13:10:39	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROehABZGqWbCAZzEtpJywpJ1gHUxCylE6";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2695 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2670 (class 0 OID 3301098)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2638 (class 0 OID 3300776)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5553-312e-6ead-9ca934ec39e4	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5553-312e-c270-52000c691615	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5553-312e-fa67-256fdeaa432c	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5553-312e-c273-b0641c946a93	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5553-312e-593d-301dbdaabc01	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5553-312e-a4a0-e06a6aa43893	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2636 (class 0 OID 3300760)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5553-312e-cdf0-c33fedd50a1e	00020000-5553-312e-c273-b0641c946a93
00010000-5553-312e-be22-a0e761536237	00020000-5553-312e-c273-b0641c946a93
\.


--
-- TOC entry 2672 (class 0 OID 3301112)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 3301054)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 3301004)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 3300836)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2659 (class 0 OID 3301010)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 3301190)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 3300906)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 3300747)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5553-312e-be22-a0e761536237	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROoeua9xHnjMj1PFNSdZRM.3sK84fJu8q	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5553-312e-cdf0-c33fedd50a1e	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2684 (class 0 OID 3301244)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 3300952)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 3301081)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 3301147)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 3300980)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2683 (class 0 OID 3301234)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 3301137)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2278 (class 2606 OID 3300801)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 3301284)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 3301277)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 3301189)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2331 (class 2606 OID 3300970)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 3301003)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2314 (class 2606 OID 3300932)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 3301133)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 3300950)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 3300997)
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
-- TOC entry 2368 (class 2606 OID 3301046)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 3301073)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2307 (class 2606 OID 3300904)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2282 (class 2606 OID 3300810)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2297 (class 2606 OID 3300868)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2284 (class 2606 OID 3300834)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2276 (class 2606 OID 3300790)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2269 (class 2606 OID 3300775)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 3301079)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2394 (class 2606 OID 3301111)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 3301229)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2292 (class 2606 OID 3300861)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 3300892)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 3301052)
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
-- TOC entry 2302 (class 2606 OID 3300882)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 3300941)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 3301064)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 3301171)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 3301217)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 3301096)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 3301037)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2360 (class 2606 OID 3301028)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 3301211)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 3301162)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2261 (class 2606 OID 3300746)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 3301102)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2267 (class 2606 OID 3300764)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2271 (class 2606 OID 3300784)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 3301120)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 3301059)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 3301009)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 3300841)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2354 (class 2606 OID 3301019)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 3301201)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 3300917)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 3300759)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 3301259)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 2606 OID 3300956)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 3301087)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 3301153)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 3300992)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 3301243)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 3301146)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2332 (class 1259 OID 3300977)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2290 (class 1259 OID 3300863)
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
-- TOC entry 2381 (class 1259 OID 3301080)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2375 (class 1259 OID 3301066)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2376 (class 1259 OID 3301065)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2327 (class 1259 OID 3300957)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 3301136)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2403 (class 1259 OID 3301134)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2404 (class 1259 OID 3301135)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2427 (class 1259 OID 3301231)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2428 (class 1259 OID 3301232)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2429 (class 1259 OID 3301233)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2435 (class 1259 OID 3301262)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2436 (class 1259 OID 3301261)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2437 (class 1259 OID 3301260)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2309 (class 1259 OID 3300919)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2310 (class 1259 OID 3300918)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2294 (class 1259 OID 3300870)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2295 (class 1259 OID 3300869)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2390 (class 1259 OID 3301103)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2345 (class 1259 OID 3300998)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2273 (class 1259 OID 3300791)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2274 (class 1259 OID 3300792)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2395 (class 1259 OID 3301123)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2396 (class 1259 OID 3301122)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2397 (class 1259 OID 3301121)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2319 (class 1259 OID 3300942)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2320 (class 1259 OID 3300944)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2321 (class 1259 OID 3300943)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2355 (class 1259 OID 3301032)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2356 (class 1259 OID 3301030)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2357 (class 1259 OID 3301029)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2358 (class 1259 OID 3301031)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2264 (class 1259 OID 3300765)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2265 (class 1259 OID 3300766)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2384 (class 1259 OID 3301088)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2370 (class 1259 OID 3301053)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2410 (class 1259 OID 3301163)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2411 (class 1259 OID 3301164)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2298 (class 1259 OID 3300884)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2299 (class 1259 OID 3300883)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2300 (class 1259 OID 3300885)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2414 (class 1259 OID 3301172)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2415 (class 1259 OID 3301173)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2446 (class 1259 OID 3301287)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 3301286)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2448 (class 1259 OID 3301289)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2449 (class 1259 OID 3301285)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2450 (class 1259 OID 3301288)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2407 (class 1259 OID 3301154)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2361 (class 1259 OID 3301041)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2362 (class 1259 OID 3301040)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2363 (class 1259 OID 3301038)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2364 (class 1259 OID 3301039)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2251 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2442 (class 1259 OID 3301279)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2443 (class 1259 OID 3301278)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2326 (class 1259 OID 3300951)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2279 (class 1259 OID 3300812)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2280 (class 1259 OID 3300811)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2286 (class 1259 OID 3300842)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2287 (class 1259 OID 3300843)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2350 (class 1259 OID 3301022)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2351 (class 1259 OID 3301021)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2352 (class 1259 OID 3301020)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2333 (class 1259 OID 3300979)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2334 (class 1259 OID 3300975)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2335 (class 1259 OID 3300972)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2336 (class 1259 OID 3300973)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2337 (class 1259 OID 3300971)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2338 (class 1259 OID 3300976)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2339 (class 1259 OID 3300974)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2293 (class 1259 OID 3300862)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2315 (class 1259 OID 3300933)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2316 (class 1259 OID 3300935)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2317 (class 1259 OID 3300934)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2318 (class 1259 OID 3300936)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2369 (class 1259 OID 3301047)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2432 (class 1259 OID 3301230)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2285 (class 1259 OID 3300835)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2308 (class 1259 OID 3300905)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2389 (class 1259 OID 3301097)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2254 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2305 (class 1259 OID 3300893)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2426 (class 1259 OID 3301218)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2272 (class 1259 OID 3300785)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2340 (class 1259 OID 3300978)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2477 (class 2606 OID 3301420)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 3301405)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2475 (class 2606 OID 3301410)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2479 (class 2606 OID 3301430)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2473 (class 2606 OID 3301400)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2478 (class 2606 OID 3301425)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2476 (class 2606 OID 3301415)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2460 (class 2606 OID 3301335)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2496 (class 2606 OID 3301515)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2495 (class 2606 OID 3301510)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2494 (class 2606 OID 3301505)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2472 (class 2606 OID 3301395)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 3301555)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2502 (class 2606 OID 3301545)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2503 (class 2606 OID 3301550)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2492 (class 2606 OID 3301495)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2511 (class 2606 OID 3301590)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2512 (class 2606 OID 3301595)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2513 (class 2606 OID 3301600)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2516 (class 2606 OID 3301615)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2515 (class 2606 OID 3301610)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2514 (class 2606 OID 3301605)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2467 (class 2606 OID 3301370)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2466 (class 2606 OID 3301365)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2462 (class 2606 OID 3301345)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 3301340)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 3301320)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2498 (class 2606 OID 3301525)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2480 (class 2606 OID 3301435)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2453 (class 2606 OID 3301300)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2454 (class 2606 OID 3301305)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2501 (class 2606 OID 3301540)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2500 (class 2606 OID 3301535)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2499 (class 2606 OID 3301530)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2468 (class 2606 OID 3301375)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2470 (class 2606 OID 3301385)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2469 (class 2606 OID 3301380)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2487 (class 2606 OID 3301470)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2485 (class 2606 OID 3301460)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2484 (class 2606 OID 3301455)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2486 (class 2606 OID 3301465)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2451 (class 2606 OID 3301290)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 3301295)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2497 (class 2606 OID 3301520)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2493 (class 2606 OID 3301500)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2506 (class 2606 OID 3301565)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2507 (class 2606 OID 3301570)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 3301355)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 3301350)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2465 (class 2606 OID 3301360)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2508 (class 2606 OID 3301575)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2509 (class 2606 OID 3301580)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2521 (class 2606 OID 3301640)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2520 (class 2606 OID 3301635)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2523 (class 2606 OID 3301650)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 3301630)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2522 (class 2606 OID 3301645)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2505 (class 2606 OID 3301560)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2491 (class 2606 OID 3301490)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2490 (class 2606 OID 3301485)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2488 (class 2606 OID 3301475)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2489 (class 2606 OID 3301480)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2518 (class 2606 OID 3301625)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2517 (class 2606 OID 3301620)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2471 (class 2606 OID 3301390)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2510 (class 2606 OID 3301585)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2456 (class 2606 OID 3301315)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2455 (class 2606 OID 3301310)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2458 (class 2606 OID 3301325)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2459 (class 2606 OID 3301330)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2483 (class 2606 OID 3301450)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2482 (class 2606 OID 3301445)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2481 (class 2606 OID 3301440)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-13 13:10:39 CEST

--
-- PostgreSQL database dump complete
--

