--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-06 14:34:30 CEST

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
-- TOC entry 179 (class 1259 OID 2460508)
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
-- TOC entry 225 (class 1259 OID 2460991)
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
-- TOC entry 224 (class 1259 OID 2460974)
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
-- TOC entry 217 (class 1259 OID 2460889)
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
-- TOC entry 193 (class 1259 OID 2460673)
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
-- TOC entry 196 (class 1259 OID 2460714)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 2460635)
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
-- TOC entry 212 (class 1259 OID 2460839)
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
-- TOC entry 191 (class 1259 OID 2460660)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 2460708)
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
-- TOC entry 201 (class 1259 OID 2460757)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 2460782)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 2460609)
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
-- TOC entry 180 (class 1259 OID 2460517)
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
-- TOC entry 181 (class 1259 OID 2460528)
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
-- TOC entry 184 (class 1259 OID 2460579)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 2460482)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 2460501)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 2460789)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 2460819)
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
-- TOC entry 221 (class 1259 OID 2460931)
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
-- TOC entry 183 (class 1259 OID 2460559)
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
-- TOC entry 186 (class 1259 OID 2460601)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 2460763)
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
-- TOC entry 185 (class 1259 OID 2460586)
-- Name: postninaslovi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postninaslovi (
    id uuid NOT NULL,
    popa_id uuid,
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
-- TOC entry 190 (class 1259 OID 2460652)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 2460775)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 2460880)
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
-- TOC entry 220 (class 1259 OID 2460924)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 2460804)
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
-- TOC entry 200 (class 1259 OID 2460748)
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
-- TOC entry 199 (class 1259 OID 2460738)
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
-- TOC entry 219 (class 1259 OID 2460914)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 2460870)
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
-- TOC entry 173 (class 1259 OID 2460452)
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
-- TOC entry 172 (class 1259 OID 2460450)
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
-- TOC entry 209 (class 1259 OID 2460813)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 2460492)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 2460475)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 2460827)
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
-- TOC entry 203 (class 1259 OID 2460769)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 2460719)
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
-- TOC entry 182 (class 1259 OID 2460551)
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
-- TOC entry 198 (class 1259 OID 2460725)
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
-- TOC entry 218 (class 1259 OID 2460905)
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
-- TOC entry 188 (class 1259 OID 2460621)
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
-- TOC entry 174 (class 1259 OID 2460461)
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
-- TOC entry 223 (class 1259 OID 2460956)
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
-- TOC entry 192 (class 1259 OID 2460667)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 2460796)
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
-- TOC entry 214 (class 1259 OID 2460862)
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
-- TOC entry 194 (class 1259 OID 2460695)
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
-- TOC entry 222 (class 1259 OID 2460946)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 2460852)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 2460455)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2637 (class 0 OID 2460508)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2683 (class 0 OID 2460991)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 2460974)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 2460889)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 2460673)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 2460714)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 2460635)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-554a-0a55-1b1e-8ae81113c97b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-554a-0a55-4a16-a00be474fe78	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-554a-0a55-1611-14f2184104bc	AL	ALB	008	Albania 	Albanija	\N
00040000-554a-0a55-1960-2b702f8eefb2	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-554a-0a55-db26-5fb687aa0ff8	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-554a-0a55-4ff4-bb264ee702b8	AD	AND	020	Andorra 	Andora	\N
00040000-554a-0a55-df68-124f69e84a14	AO	AGO	024	Angola 	Angola	\N
00040000-554a-0a55-bf8e-33d5972dc1a0	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-554a-0a55-897a-e94600ab6f7d	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-554a-0a55-8893-5ec8f08bc566	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-554a-0a55-3c14-cdd468e6de90	AR	ARG	032	Argentina 	Argenitna	\N
00040000-554a-0a55-53e8-6fe0e8abe372	AM	ARM	051	Armenia 	Armenija	\N
00040000-554a-0a55-9d8a-5d53d7b04636	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-554a-0a55-d1bf-4abb14ad110e	AU	AUS	036	Australia 	Avstralija	\N
00040000-554a-0a55-d14d-7ecb517a4d9a	AT	AUT	040	Austria 	Avstrija	\N
00040000-554a-0a55-482e-39e08dc6bc76	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-554a-0a55-a0cf-c6e033e2356d	BS	BHS	044	Bahamas 	Bahami	\N
00040000-554a-0a55-d887-d9fbf7bc8a7a	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-554a-0a55-4688-1f14f0dcb14e	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-554a-0a55-e6e6-c2a001d218e1	BB	BRB	052	Barbados 	Barbados	\N
00040000-554a-0a55-75c2-fff7479427a2	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-554a-0a55-bbe6-01d65baf0720	BE	BEL	056	Belgium 	Belgija	\N
00040000-554a-0a55-150b-9af7cae711f9	BZ	BLZ	084	Belize 	Belize	\N
00040000-554a-0a55-f372-e77d4faaba90	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-554a-0a55-c78f-d952e918c1da	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-554a-0a55-6378-937f9af2123a	BT	BTN	064	Bhutan 	Butan	\N
00040000-554a-0a55-e06f-b696e9ea919c	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-554a-0a55-4c0a-8f4c33e977f7	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-554a-0a55-3009-9c3529148092	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-554a-0a55-b52e-4a659d00a54d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-554a-0a55-e907-89ea152f239b	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-554a-0a55-54dc-964892c70b99	BR	BRA	076	Brazil 	Brazilija	\N
00040000-554a-0a55-8f87-e43aead6d55d	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-554a-0a55-428e-8d54a833d0b3	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-554a-0a55-d53c-5bd89aae5c3d	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-554a-0a55-09b8-3c0a2b801cae	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-554a-0a55-5a09-f26504828016	BI	BDI	108	Burundi 	Burundi 	\N
00040000-554a-0a55-64c0-e7774c61a151	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-554a-0a55-8522-1a8bb73e3af6	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-554a-0a55-8c88-ce83d4d322dd	CA	CAN	124	Canada 	Kanada	\N
00040000-554a-0a55-b76f-f3a17a9100ac	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-554a-0a55-d579-b3a5d246591f	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-554a-0a55-ccaf-cedc01f46a25	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-554a-0a55-871d-0502a4082316	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-554a-0a55-5473-329c6b9a3df0	CL	CHL	152	Chile 	Čile	\N
00040000-554a-0a55-2c31-1221b91f0b79	CN	CHN	156	China 	Kitajska	\N
00040000-554a-0a55-ccb6-1a8b30d09b8d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-554a-0a55-d0dc-1f3f8dfff273	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-554a-0a55-a61d-d2a500a1c125	CO	COL	170	Colombia 	Kolumbija	\N
00040000-554a-0a55-2377-72cc999ee6bc	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-554a-0a55-989c-8465871ced61	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-554a-0a55-0142-ac9e7d2344dd	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-554a-0a55-aadd-e017ed8c5544	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-554a-0a55-7a43-d3b70318847b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-554a-0a55-1532-ce5312a0be1a	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-554a-0a55-b3b3-9682e5d629e9	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-554a-0a55-9b7c-72df60374722	CU	CUB	192	Cuba 	Kuba	\N
00040000-554a-0a55-e435-6d00da339e38	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-554a-0a55-b960-c8abf664527f	CY	CYP	196	Cyprus 	Ciper	\N
00040000-554a-0a55-ba2e-3e0be99af1d8	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-554a-0a55-c34e-3ae63baae313	DK	DNK	208	Denmark 	Danska	\N
00040000-554a-0a55-19ef-d3f09e6db2d8	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-554a-0a55-4027-993bf3ea4acf	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-554a-0a55-92ae-f9f264f67376	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-554a-0a55-a8dd-7f8e3da85fb3	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-554a-0a55-615c-271036c91a84	EG	EGY	818	Egypt 	Egipt	\N
00040000-554a-0a55-db92-97f8c856130f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-554a-0a55-aa25-e14b55eac852	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-554a-0a55-5336-771078542897	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-554a-0a55-897a-20f32550a432	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-554a-0a55-4bef-f608d50848c0	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-554a-0a55-708e-a3234e908c0f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-554a-0a55-4609-5b9f6ad8dfc7	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-554a-0a55-be7e-3c321893d3c9	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-554a-0a55-ed29-709af5872e78	FI	FIN	246	Finland 	Finska	\N
00040000-554a-0a55-db1d-e73bdc6ab2f0	FR	FRA	250	France 	Francija	\N
00040000-554a-0a55-5ecd-a42478118bf3	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-554a-0a55-5d7a-d69c6f527632	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-554a-0a55-c181-ce4baadeb4bf	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-554a-0a55-68d9-d2fa77a97703	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-554a-0a55-d7e7-c53fbf012f9f	GA	GAB	266	Gabon 	Gabon	\N
00040000-554a-0a55-3429-e6a60b7edf81	GM	GMB	270	Gambia 	Gambija	\N
00040000-554a-0a55-cce9-40e6fd1f2d2e	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-554a-0a55-0d9e-499c46d97d42	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-554a-0a55-5fa5-9cee95aa4caf	GH	GHA	288	Ghana 	Gana	\N
00040000-554a-0a55-5d31-5106daeba88a	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-554a-0a55-d417-756349369727	GR	GRC	300	Greece 	Grčija	\N
00040000-554a-0a55-0f58-ccfe8307a3f3	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-554a-0a55-ce00-b02c6081126b	GD	GRD	308	Grenada 	Grenada	\N
00040000-554a-0a55-c79f-0a48d53e9d7b	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-554a-0a55-3ab4-733c6af4676a	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-554a-0a55-4021-c6f4ad92ed8f	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-554a-0a55-2a80-b9648c0451b4	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-554a-0a55-32c5-0f81005c1360	GN	GIN	324	Guinea 	Gvineja	\N
00040000-554a-0a55-5a37-deab16a009e0	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-554a-0a55-87ba-c1300d3c98f9	GY	GUY	328	Guyana 	Gvajana	\N
00040000-554a-0a55-9ce0-a58b888e7731	HT	HTI	332	Haiti 	Haiti	\N
00040000-554a-0a55-aedf-762c21cef0d9	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-554a-0a55-44a3-1cfa5b4b1703	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-554a-0a55-8f99-aa88e42e6339	HN	HND	340	Honduras 	Honduras	\N
00040000-554a-0a55-f3a7-ad7dda6a9839	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-554a-0a55-ade6-65290b431996	HU	HUN	348	Hungary 	Madžarska	\N
00040000-554a-0a55-4ffe-12493b188739	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-554a-0a55-c32d-63544970576b	IN	IND	356	India 	Indija	\N
00040000-554a-0a55-eb07-b80bf7b57c53	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-554a-0a55-1c75-60fdaff8b7ce	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-554a-0a55-1098-5e2b4c115445	IQ	IRQ	368	Iraq 	Irak	\N
00040000-554a-0a55-b6d9-4d9ba988d68a	IE	IRL	372	Ireland 	Irska	\N
00040000-554a-0a55-e92e-236ae49881c7	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-554a-0a55-8bb9-8d5ef302686c	IL	ISR	376	Israel 	Izrael	\N
00040000-554a-0a55-c83e-bf21cf6e600f	IT	ITA	380	Italy 	Italija	\N
00040000-554a-0a55-3a18-b9a36b70c82e	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-554a-0a55-353a-0616c85e6692	JP	JPN	392	Japan 	Japonska	\N
00040000-554a-0a55-b0da-589710735981	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-554a-0a55-6aae-f3fa389836f8	JO	JOR	400	Jordan 	Jordanija	\N
00040000-554a-0a55-3603-489f2a596d68	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-554a-0a55-abee-c5c2c9b8f073	KE	KEN	404	Kenya 	Kenija	\N
00040000-554a-0a55-9837-44320c234751	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-554a-0a55-52c7-4ef32d10e7ce	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-554a-0a55-6cdb-cbd0440cbb76	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-554a-0a55-f171-50b7f275eb32	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-554a-0a55-c745-42c9ee54aea4	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-554a-0a55-003a-2ceedf16e94d	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-554a-0a55-5713-c98ef7d6ecde	LV	LVA	428	Latvia 	Latvija	\N
00040000-554a-0a55-1fce-8a29b2d67e1b	LB	LBN	422	Lebanon 	Libanon	\N
00040000-554a-0a55-de15-ba331c1c2676	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-554a-0a55-d69b-c012dd0de5db	LR	LBR	430	Liberia 	Liberija	\N
00040000-554a-0a55-a73a-08f48b4120f3	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-554a-0a55-cf2d-0ff6e129cb58	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-554a-0a55-6646-cce4035d9bfb	LT	LTU	440	Lithuania 	Litva	\N
00040000-554a-0a55-12cb-6fb29a801241	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-554a-0a55-7d9f-08c348476caf	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-554a-0a55-2071-a68b51f6b1e8	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-554a-0a55-8ebe-a5ec320d6b4f	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-554a-0a55-fd46-a448fb555ecc	MW	MWI	454	Malawi 	Malavi	\N
00040000-554a-0a55-0b12-e2d5bd33300d	MY	MYS	458	Malaysia 	Malezija	\N
00040000-554a-0a55-8505-7cb9db95108f	MV	MDV	462	Maldives 	Maldivi	\N
00040000-554a-0a55-b7aa-671284f3369c	ML	MLI	466	Mali 	Mali	\N
00040000-554a-0a55-f69e-aa5a0050e807	MT	MLT	470	Malta 	Malta	\N
00040000-554a-0a55-0ce5-58838b1b0377	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-554a-0a55-52fd-7beb9277d278	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-554a-0a55-bc9f-b601469dbf43	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-554a-0a55-2b59-1bd31c5c7991	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-554a-0a55-376c-020b080780d8	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-554a-0a55-754e-c43c8356d6be	MX	MEX	484	Mexico 	Mehika	\N
00040000-554a-0a55-44ce-5c9735a380cb	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-554a-0a55-c9e9-83b4656b1af5	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-554a-0a55-c409-39dc3376de78	MC	MCO	492	Monaco 	Monako	\N
00040000-554a-0a55-ab59-e406eb71d01e	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-554a-0a55-77e3-ee42a3478785	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-554a-0a55-0177-046e3d4cee6f	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-554a-0a55-cf8d-a9b76bf5919c	MA	MAR	504	Morocco 	Maroko	\N
00040000-554a-0a55-f6b2-81b2b040fd43	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-554a-0a55-59d8-a862832d7d7a	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-554a-0a55-4685-b02452e5e85c	NA	NAM	516	Namibia 	Namibija	\N
00040000-554a-0a55-44cd-9531ea50743e	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-554a-0a55-7b52-15fa48681c5e	NP	NPL	524	Nepal 	Nepal	\N
00040000-554a-0a55-6e7f-341da0b7de51	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-554a-0a55-efe4-86ca1f4d0e12	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-554a-0a55-d188-3a76dcb5bfb4	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-554a-0a55-22fd-d90513e1237a	NE	NER	562	Niger 	Niger 	\N
00040000-554a-0a55-9abc-7b55a9d5942f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-554a-0a55-85f3-6356885fee33	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-554a-0a55-7658-203cfb30309d	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-554a-0a55-144c-df2038943fd0	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-554a-0a55-830f-826764fbbe42	NO	NOR	578	Norway 	Norveška	\N
00040000-554a-0a55-0819-133885aedd2f	OM	OMN	512	Oman 	Oman	\N
00040000-554a-0a55-bc4f-fec077762234	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-554a-0a55-bdae-3de3f3e9868c	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-554a-0a55-ba42-314517682275	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-554a-0a55-9923-5b80821bedf8	PA	PAN	591	Panama 	Panama	\N
00040000-554a-0a55-f9a5-8c36353c5492	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-554a-0a55-c0ee-50b89519e51f	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-554a-0a55-ee10-f54805c66204	PE	PER	604	Peru 	Peru	\N
00040000-554a-0a55-07fe-a531ae4e23ae	PH	PHL	608	Philippines 	Filipini	\N
00040000-554a-0a55-ecd5-a7b5c9b2e283	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-554a-0a55-b000-3621e880c263	PL	POL	616	Poland 	Poljska	\N
00040000-554a-0a55-b9e3-a42589abf93f	PT	PRT	620	Portugal 	Portugalska	\N
00040000-554a-0a55-0990-f81ddf77b5d8	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-554a-0a55-3beb-207d5d8d0e58	QA	QAT	634	Qatar 	Katar	\N
00040000-554a-0a55-9162-26e0dbc9ee35	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-554a-0a55-daec-6744ee0dedf6	RO	ROU	642	Romania 	Romunija	\N
00040000-554a-0a55-1e8e-18cd79dd323d	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-554a-0a55-80a6-d0b827bd4914	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-554a-0a55-bbde-f7bf738b3c95	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-554a-0a55-838f-9f2eaf62db60	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-554a-0a55-5aec-a0a04f7b4564	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-554a-0a55-455e-1a3d293ca1b9	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-554a-0a55-9133-dd22fe198e52	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-554a-0a55-dcf0-de2fe0e81254	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-554a-0a55-cede-7ed9b4ad59aa	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-554a-0a55-ad55-91b15725f88e	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-554a-0a55-8c80-816308c66b70	SM	SMR	674	San Marino 	San Marino	\N
00040000-554a-0a55-6a18-4b002e1558a9	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-554a-0a55-51bd-3915a166c8e5	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-554a-0a55-046a-5c59a6946b2d	SN	SEN	686	Senegal 	Senegal	\N
00040000-554a-0a55-aae5-63c2854e0cd2	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-554a-0a55-a502-dcb8a67f3869	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-554a-0a55-1e76-36e1ddb06d36	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-554a-0a55-7c18-7adb9f7fdfaa	SG	SGP	702	Singapore 	Singapur	\N
00040000-554a-0a55-3001-a6acbcd75627	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-554a-0a55-5a0e-b56e11cb6472	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-554a-0a55-a76d-72f52f5410a1	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-554a-0a55-5018-ef20fc45f803	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-554a-0a55-fb07-27b6e95c2aaa	SO	SOM	706	Somalia 	Somalija	\N
00040000-554a-0a55-7b97-18d8e84a0b67	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-554a-0a55-b6a6-25cfe5535c46	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-554a-0a55-5ee2-0bb5f669d82e	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-554a-0a55-d1c6-bfe024bdebc5	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-554a-0a55-0ffc-e8e8a73b278d	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-554a-0a55-dd9c-3c8e2b58cb66	SD	SDN	729	Sudan 	Sudan	\N
00040000-554a-0a55-97e6-132c30bdfb0e	SR	SUR	740	Suriname 	Surinam	\N
00040000-554a-0a55-0f7a-9e8b65a7b5e7	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-554a-0a55-c2cc-131cba3bc67e	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-554a-0a55-88a7-abf3c3b897a5	SE	SWE	752	Sweden 	Švedska	\N
00040000-554a-0a55-3b89-44f2290d2f52	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-554a-0a55-4485-377810d10601	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-554a-0a55-c39d-ea5a8df3c6b3	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-554a-0a55-65a8-5d4efd00447d	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-554a-0a55-10cd-1e62b7dffd51	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-554a-0a55-b6eb-8f76e191f135	TH	THA	764	Thailand 	Tajska	\N
00040000-554a-0a55-3341-86ff8fa38f82	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-554a-0a55-85b0-9b3d3707f09f	TG	TGO	768	Togo 	Togo	\N
00040000-554a-0a55-6150-3de7d14c7adb	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-554a-0a55-c363-12c45b1073a3	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-554a-0a55-25a7-12c463518a19	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-554a-0a55-6fb0-b71c63d07f61	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-554a-0a55-c1be-5cf9915f9de7	TR	TUR	792	Turkey 	Turčija	\N
00040000-554a-0a55-2509-d6aa34af6816	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-554a-0a55-9ff7-017ab260e483	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-554a-0a55-1304-101c77f4ca2f	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-554a-0a55-8acc-676c2d73bccb	UG	UGA	800	Uganda 	Uganda	\N
00040000-554a-0a55-3957-7390557aa4be	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-554a-0a55-084b-344dcf3a81d3	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-554a-0a55-8719-f3313c5d36e3	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-554a-0a55-5a1d-44c26adcd109	US	USA	840	United States 	Združene države Amerike	\N
00040000-554a-0a55-2eca-d7d5320afdf7	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-554a-0a55-ab7c-c8678a9be9ce	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-554a-0a55-043c-a136ca5ad0c9	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-554a-0a55-2806-a625792b435b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-554a-0a55-cf53-900b23100652	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-554a-0a55-9622-0fa2b6ffc470	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-554a-0a55-8f64-bf0dd1e8823f	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-554a-0a55-f247-a2065e4a4b8c	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-554a-0a55-d6e4-ec04141e11c6	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-554a-0a55-aece-045f5e988062	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-554a-0a55-6501-6979c43f3682	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-554a-0a55-f88d-a8ee24b98ab7	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-554a-0a55-5d52-b14605bed0d0	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2670 (class 0 OID 2460839)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 2460660)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 2460708)
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
-- TOC entry 2659 (class 0 OID 2460757)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 2460782)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 2460609)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-554a-0a56-4793-4e7d773deca1	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-554a-0a56-86d2-c901f9ffe347	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-554a-0a56-4e85-b2ac1cd2c09d	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-554a-0a56-d95d-29fce944f95c	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-554a-0a56-e49d-cdbd673248f7	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-554a-0a56-374a-b98f3739e300	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-554a-0a56-ce24-d355b06c72c8	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-554a-0a56-0735-848f4f54949d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-554a-0a56-cbe4-132f1ac00a94	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-554a-0a56-da7b-45fcbbf12526	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2638 (class 0 OID 2460517)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-554a-0a56-18f0-ba6d778771f6	00000000-554a-0a56-e49d-cdbd673248f7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-554a-0a56-1b38-3e7a5b48031f	00000000-554a-0a56-e49d-cdbd673248f7	00010000-554a-0a55-d1b0-390a87c5d593	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-554a-0a56-a1f2-eaf6acbe82a8	00000000-554a-0a56-374a-b98f3739e300	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2639 (class 0 OID 2460528)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 2460579)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 2460482)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-554a-0a55-e34a-15415201e8fb	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-554a-0a55-c2ee-831a4e21af08	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-554a-0a55-5097-6a750aef25d5	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-554a-0a55-f9b0-b4d6abaf1d8d	Abonma-read	Abonma - branje	f
00030000-554a-0a55-661d-ee4c0a9440a3	Abonma-write	Abonma - spreminjanje	f
00030000-554a-0a55-5770-72a05579a22c	Alternacija-read	Alternacija - branje	f
00030000-554a-0a55-c4a3-b3b49793475d	Alternacija-write	Alternacija - spreminjanje	f
00030000-554a-0a55-51f6-20ae62f1ad27	Arhivalija-read	Arhivalija - branje	f
00030000-554a-0a55-8bad-348c6a9d7715	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-554a-0a55-8187-2686f2e62497	Besedilo-read	Besedilo - branje	f
00030000-554a-0a55-0e62-593543b5d87c	Besedilo-write	Besedilo - spreminjanje	f
00030000-554a-0a55-964b-19e7b669f3a3	DogodekIzven-read	DogodekIzven - branje	f
00030000-554a-0a55-e48a-4942a5f62d70	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-554a-0a55-ec47-e83318536497	Dogodek-read	Dogodek - branje	f
00030000-554a-0a55-098c-fcbeac2d7269	Dogodek-write	Dogodek - spreminjanje	f
00030000-554a-0a55-2069-698ff4618a66	Drzava-read	Drzava - branje	f
00030000-554a-0a55-9742-a5aed808c43a	Drzava-write	Drzava - spreminjanje	f
00030000-554a-0a55-7fd9-1c51ec32d0bf	Funkcija-read	Funkcija - branje	f
00030000-554a-0a55-58c0-b434a47bb8a8	Funkcija-write	Funkcija - spreminjanje	f
00030000-554a-0a55-8903-31f714856309	Gostovanje-read	Gostovanje - branje	f
00030000-554a-0a55-befb-d00493585a1f	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-554a-0a55-dd38-fe3b5024790d	Gostujoca-read	Gostujoca - branje	f
00030000-554a-0a55-0ce5-d2258fe49a14	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-554a-0a55-86f6-baa7a76481a3	Kupec-read	Kupec - branje	f
00030000-554a-0a55-8efa-3725bb68ff99	Kupec-write	Kupec - spreminjanje	f
00030000-554a-0a55-67db-fe3fb3893805	NacinPlacina-read	NacinPlacina - branje	f
00030000-554a-0a55-d6fd-5625c29e4961	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-554a-0a55-1b6d-8d227dff419d	Option-read	Option - branje	f
00030000-554a-0a55-8cf0-c9da6ee687d9	Option-write	Option - spreminjanje	f
00030000-554a-0a55-bb0a-812b50db5f33	OptionValue-read	OptionValue - branje	f
00030000-554a-0a55-7c1d-2ce2a9d67f48	OptionValue-write	OptionValue - spreminjanje	f
00030000-554a-0a55-ea99-5cc5ccddb9ec	Oseba-read	Oseba - branje	f
00030000-554a-0a55-4b81-33061515f685	Oseba-write	Oseba - spreminjanje	f
00030000-554a-0a55-2212-5dced289d05c	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-554a-0a55-c2ba-2fa30682a6eb	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-554a-0a55-67ad-628f35e9b0ea	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-554a-0a55-f130-88e8183278af	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-554a-0a55-0a26-acbdc8a8fcab	Pogodba-read	Pogodba - branje	f
00030000-554a-0a55-8ce8-27781afab0a1	Pogodba-write	Pogodba - spreminjanje	f
00030000-554a-0a55-6503-14efc0ff71fc	Popa-read	Popa - branje	f
00030000-554a-0a55-a973-6c88ab63cb0e	Popa-write	Popa - spreminjanje	f
00030000-554a-0a55-832b-47d591e13346	Posta-read	Posta - branje	f
00030000-554a-0a55-d7ff-9d88db069328	Posta-write	Posta - spreminjanje	f
00030000-554a-0a55-8f8d-50dbc2957f4c	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-554a-0a55-4336-e9a5a24277f8	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-554a-0a55-d868-7d180f4d5724	PostniNaslov-read	PostniNaslov - branje	f
00030000-554a-0a55-5b9b-d9506926ed84	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-554a-0a55-3948-93ea3165b5a5	Predstava-read	Predstava - branje	f
00030000-554a-0a55-6d51-2f85a1c15469	Predstava-write	Predstava - spreminjanje	f
00030000-554a-0a55-2d53-c195f835edf9	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-554a-0a55-aa07-38da50371bc3	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-554a-0a55-e6a4-1034b9075fe0	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-554a-0a55-8896-7260dda3f4dc	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-554a-0a55-230d-f668c96ad9cb	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-554a-0a55-434b-1e0728e9ed36	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-554a-0a55-8fc0-1ec6a5a204f6	Prostor-read	Prostor - branje	f
00030000-554a-0a55-0075-d7763dd6669d	Prostor-write	Prostor - spreminjanje	f
00030000-554a-0a55-a0d4-a42c614a1286	Racun-read	Racun - branje	f
00030000-554a-0a55-96b3-6f09281630da	Racun-write	Racun - spreminjanje	f
00030000-554a-0a55-9e6c-0346c3e5953d	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-554a-0a55-be1f-ab6c04ebe547	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-554a-0a55-050f-d88c7032832c	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-554a-0a55-3864-ec1a4d5ed2a7	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-554a-0a55-c641-6c15fdbae2fd	Rekvizit-read	Rekvizit - branje	f
00030000-554a-0a55-87f9-2f74b4e1b06b	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-554a-0a55-5c54-8d155f818a8e	Rezervacija-read	Rezervacija - branje	f
00030000-554a-0a55-829f-e83bc74a40b2	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-554a-0a55-2d93-0666dea68f94	SedezniRed-read	SedezniRed - branje	f
00030000-554a-0a55-e4bd-557f523b4493	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-554a-0a55-0b62-2c8483f2aee2	Sedez-read	Sedez - branje	f
00030000-554a-0a55-bf23-1f0e53aef690	Sedez-write	Sedez - spreminjanje	f
00030000-554a-0a55-74f8-a87d5a8ba5e8	Sezona-read	Sezona - branje	f
00030000-554a-0a55-3aad-6c8dff6de493	Sezona-write	Sezona - spreminjanje	f
00030000-554a-0a55-d328-30bdc9583e3a	Telefonska-read	Telefonska - branje	f
00030000-554a-0a55-8896-7bc076e9f3f9	Telefonska-write	Telefonska - spreminjanje	f
00030000-554a-0a55-b9fa-a809b3a3adf0	TerminStoritve-read	TerminStoritve - branje	f
00030000-554a-0a55-6715-c49e8af648de	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-554a-0a55-0cff-17c771affbd3	TipFunkcije-read	TipFunkcije - branje	f
00030000-554a-0a55-7620-04e69a9a4b71	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-554a-0a55-1dd3-b7fb9b869530	Trr-read	Trr - branje	f
00030000-554a-0a55-3db5-b785b06707f7	Trr-write	Trr - spreminjanje	f
00030000-554a-0a55-3f99-5d425f5c312b	Uprizoritev-read	Uprizoritev - branje	f
00030000-554a-0a55-eb75-8d80a4f455c8	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-554a-0a55-3b4e-250cc7b9d6b6	Vaja-read	Vaja - branje	f
00030000-554a-0a55-d4f4-dbff2760ecd8	Vaja-write	Vaja - spreminjanje	f
00030000-554a-0a55-8d45-f455bdc721cf	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-554a-0a55-1da2-c549bcc7e185	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-554a-0a55-4575-1be7e483a373	Zaposlitev-read	Zaposlitev - branje	f
00030000-554a-0a55-ff5c-3f9c81128a6e	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-554a-0a55-b25f-2d5aec5e868d	Zasedenost-read	Zasedenost - branje	f
00030000-554a-0a55-72c3-8c61c845d091	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-554a-0a55-5602-b9a1a5230c3c	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-554a-0a55-a84f-85edef09766c	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-554a-0a55-7264-a1d5650010b1	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-554a-0a55-c2ee-cd9bb4c3de9d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2636 (class 0 OID 2460501)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-554a-0a55-c7d6-be41cfa6584f	00030000-554a-0a55-2069-698ff4618a66
00020000-554a-0a55-b180-e331d676a1b3	00030000-554a-0a55-9742-a5aed808c43a
00020000-554a-0a55-b180-e331d676a1b3	00030000-554a-0a55-2069-698ff4618a66
\.


--
-- TOC entry 2664 (class 0 OID 2460789)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 2460819)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 2460931)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 2460559)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 2460601)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-554a-0a55-ef61-83e495b4c491	8341	Adlešiči
00050000-554a-0a55-131f-7dd1c2fb73d7	5270	Ajdovščina
00050000-554a-0a55-0fc4-63e5b6136e58	6280	Ankaran/Ancarano
00050000-554a-0a55-b858-a518a18bc0b0	9253	Apače
00050000-554a-0a55-84a8-f19988064289	8253	Artiče
00050000-554a-0a55-bad8-b837799b6620	4275	Begunje na Gorenjskem
00050000-554a-0a55-d013-6f9ba58e9e25	1382	Begunje pri Cerknici
00050000-554a-0a55-ed6a-d09fb92ad29f	9231	Beltinci
00050000-554a-0a55-6075-31c3c7cc3cb8	2234	Benedikt
00050000-554a-0a55-bbbd-c1cc408cd50f	2345	Bistrica ob Dravi
00050000-554a-0a55-bbf1-3ccf6fbbaf51	3256	Bistrica ob Sotli
00050000-554a-0a55-8f29-6187efff42a6	8259	Bizeljsko
00050000-554a-0a55-24d0-7111e6fffc5d	1223	Blagovica
00050000-554a-0a55-13b7-15277f412bee	8283	Blanca
00050000-554a-0a55-cfaf-5566c4d78acc	4260	Bled
00050000-554a-0a55-3d21-4413634d477e	4273	Blejska Dobrava
00050000-554a-0a55-7261-af3b06ca7070	9265	Bodonci
00050000-554a-0a55-27f5-adfcf9cfc69f	9222	Bogojina
00050000-554a-0a55-915e-2f9786a1f1d4	4263	Bohinjska Bela
00050000-554a-0a55-e9c2-37cea12092c9	4264	Bohinjska Bistrica
00050000-554a-0a55-e924-f283bec94af3	4265	Bohinjsko jezero
00050000-554a-0a55-0bf5-5be54af7b9dc	1353	Borovnica
00050000-554a-0a55-21a4-dd41e0d4f064	8294	Boštanj
00050000-554a-0a55-5621-50cca0aec934	5230	Bovec
00050000-554a-0a55-c8c7-eea121bbaf07	5295	Branik
00050000-554a-0a55-21df-3290a6cbd956	3314	Braslovče
00050000-554a-0a55-c6ef-064788169fdf	5223	Breginj
00050000-554a-0a55-cacd-36995bd2c971	8280	Brestanica
00050000-554a-0a55-b1ee-28a56e88d3cb	2354	Bresternica
00050000-554a-0a55-2d07-bf308ca5ba12	4243	Brezje
00050000-554a-0a55-75ad-d91f04c65700	1351	Brezovica pri Ljubljani
00050000-554a-0a55-3de7-98b184b459eb	8250	Brežice
00050000-554a-0a55-83f4-f3943dbd0983	4210	Brnik - Aerodrom
00050000-554a-0a55-efba-8d2f0299e714	8321	Brusnice
00050000-554a-0a55-27aa-ebb983258f20	3255	Buče
00050000-554a-0a55-c3b5-bcabdc64ad1b	8276	Bučka 
00050000-554a-0a55-298e-36a40226c038	9261	Cankova
00050000-554a-0a55-a0c8-a04566dbf5be	3000	Celje 
00050000-554a-0a55-a0b3-a43d90c51aea	3001	Celje - poštni predali
00050000-554a-0a55-d02b-fb8fa25f1f77	4207	Cerklje na Gorenjskem
00050000-554a-0a55-5d97-e52c0822634d	8263	Cerklje ob Krki
00050000-554a-0a55-ea42-2fd33fe49116	1380	Cerknica
00050000-554a-0a55-1f49-55163ab0f2e7	5282	Cerkno
00050000-554a-0a55-e962-1fefbbff85a5	2236	Cerkvenjak
00050000-554a-0a55-1abf-3c783b80d037	2215	Ceršak
00050000-554a-0a55-66a8-74de4c99c2bb	2326	Cirkovce
00050000-554a-0a55-e534-67ee62031a26	2282	Cirkulane
00050000-554a-0a55-0e7f-59cab982b9cb	5273	Col
00050000-554a-0a55-5197-088cb86c8596	8251	Čatež ob Savi
00050000-554a-0a55-81ec-b82b335d667e	1413	Čemšenik
00050000-554a-0a55-3ec0-6f9a915fd10f	5253	Čepovan
00050000-554a-0a55-29c5-b0321fa8f6bc	9232	Črenšovci
00050000-554a-0a55-ea7e-64c5cd60d103	2393	Črna na Koroškem
00050000-554a-0a55-739b-f4a83515f018	6275	Črni Kal
00050000-554a-0a55-9cf7-0ca8b4b62b33	5274	Črni Vrh nad Idrijo
00050000-554a-0a55-6ed5-07c448dd2557	5262	Črniče
00050000-554a-0a55-888e-d03b2aed5995	8340	Črnomelj
00050000-554a-0a55-c4ca-2baaf9e3d264	6271	Dekani
00050000-554a-0a55-8bbd-aebb70e73d21	5210	Deskle
00050000-554a-0a55-a8e0-93bfb3e5e0dd	2253	Destrnik
00050000-554a-0a55-b9b1-7c926112aa3a	6215	Divača
00050000-554a-0a55-9ef4-c6e6033e2769	1233	Dob
00050000-554a-0a55-7200-9b8f195be4be	3224	Dobje pri Planini
00050000-554a-0a55-cfbb-439db8e5ad67	8257	Dobova
00050000-554a-0a55-7ffa-24c25c374cab	1423	Dobovec
00050000-554a-0a55-5d8b-288fecfe9f9f	5263	Dobravlje
00050000-554a-0a55-0d7f-6404b93e42b9	3204	Dobrna
00050000-554a-0a55-601d-f056281a23f8	8211	Dobrnič
00050000-554a-0a55-3300-176e3d47c8e7	1356	Dobrova
00050000-554a-0a55-f507-4005bc193e5a	9223	Dobrovnik/Dobronak 
00050000-554a-0a55-94b1-428ae1322efa	5212	Dobrovo v Brdih
00050000-554a-0a55-97e2-ec442c58ec58	1431	Dol pri Hrastniku
00050000-554a-0a55-1410-70f346da903b	1262	Dol pri Ljubljani
00050000-554a-0a55-aafd-074849ec158f	1273	Dole pri Litiji
00050000-554a-0a55-cbd8-7aeab2649515	1331	Dolenja vas
00050000-554a-0a55-eee3-ca977fac60a4	8350	Dolenjske Toplice
00050000-554a-0a55-da28-cfaaade35735	1230	Domžale
00050000-554a-0a55-0cbe-d14982b2ad64	2252	Dornava
00050000-554a-0a55-51c4-a60bea8c3719	5294	Dornberk
00050000-554a-0a55-9c73-c27c0bbc88de	1319	Draga
00050000-554a-0a55-a6ba-0155681b13a8	8343	Dragatuš
00050000-554a-0a55-f5a3-2b5cc25fac32	3222	Dramlje
00050000-554a-0a55-2ac7-4c202a1e8b95	2370	Dravograd
00050000-554a-0a55-d569-f704a3be70fd	4203	Duplje
00050000-554a-0a55-949d-b2af3f27ada8	6221	Dutovlje
00050000-554a-0a55-fcf1-9ad98fe933aa	8361	Dvor
00050000-554a-0a55-d9cb-fd6b53934f2c	2343	Fala
00050000-554a-0a55-b6b0-604b0aa3a006	9208	Fokovci
00050000-554a-0a55-c657-79354c8955ef	2313	Fram
00050000-554a-0a55-f0e7-59563dc5583a	3213	Frankolovo
00050000-554a-0a55-2ec1-9e3cab1dddea	1274	Gabrovka
00050000-554a-0a55-80d7-77170ef404c8	8254	Globoko
00050000-554a-0a55-d2ea-f3041f2de7da	5275	Godovič
00050000-554a-0a55-87c0-6bc063362117	4204	Golnik
00050000-554a-0a55-c157-b7e4b50ebf91	3303	Gomilsko
00050000-554a-0a55-10ad-a78205cf5584	4224	Gorenja vas
00050000-554a-0a55-241d-6b27aa82eb7f	3263	Gorica pri Slivnici
00050000-554a-0a55-650d-98b8a035eca4	2272	Gorišnica
00050000-554a-0a55-10a4-0330b93eaba2	9250	Gornja Radgona
00050000-554a-0a55-c9db-6ee12c26e229	3342	Gornji Grad
00050000-554a-0a55-a6d4-0987b6a5cde8	4282	Gozd Martuljek
00050000-554a-0a55-1a3a-507ddb506c05	6272	Gračišče
00050000-554a-0a55-fcee-80fb45d0b288	9264	Grad
00050000-554a-0a55-fa61-674bc1c87203	8332	Gradac
00050000-554a-0a55-1472-0f64212bac92	1384	Grahovo
00050000-554a-0a55-764a-900badbb36db	5242	Grahovo ob Bači
00050000-554a-0a55-df7a-f8f33b50dd03	5251	Grgar
00050000-554a-0a55-e58d-0392befc22f5	3302	Griže
00050000-554a-0a55-c877-483e8709ab8d	3231	Grobelno
00050000-554a-0a55-983f-4013125b77bd	1290	Grosuplje
00050000-554a-0a55-221e-c4d589ea9431	2288	Hajdina
00050000-554a-0a55-c040-00b4c9490e68	8362	Hinje
00050000-554a-0a55-cd57-9539d03f6124	2311	Hoče
00050000-554a-0a55-2c14-ae8d94161cb0	9205	Hodoš/Hodos
00050000-554a-0a55-a4ef-b15ce2834b99	1354	Horjul
00050000-554a-0a55-b61b-3448a23636e8	1372	Hotedršica
00050000-554a-0a55-8228-15d11118dc24	1430	Hrastnik
00050000-554a-0a55-f616-f70fe6e0f9d5	6225	Hruševje
00050000-554a-0a55-4cac-2f3490fe7c00	4276	Hrušica
00050000-554a-0a55-c954-4cbbaf3e49f7	5280	Idrija
00050000-554a-0a55-5195-f54c47ea21e5	1292	Ig
00050000-554a-0a55-1b15-b35bfffbf809	6250	Ilirska Bistrica
00050000-554a-0a55-7f70-bc56bd8441ad	6251	Ilirska Bistrica-Trnovo
00050000-554a-0a55-fde4-0288abfd1ae1	1295	Ivančna Gorica
00050000-554a-0a55-80fe-ab4c0f7b40f2	2259	Ivanjkovci
00050000-554a-0a55-57a3-e991928bff46	1411	Izlake
00050000-554a-0a55-6474-b14d39a61e81	6310	Izola/Isola
00050000-554a-0a55-202c-c5b4c1691ee6	2222	Jakobski Dol
00050000-554a-0a55-8e1a-90feb40aec01	2221	Jarenina
00050000-554a-0a55-9855-e4a3b6aca8e1	6254	Jelšane
00050000-554a-0a55-ecd2-3bd4756e2eb7	4270	Jesenice
00050000-554a-0a55-ad4d-caf208e9481f	8261	Jesenice na Dolenjskem
00050000-554a-0a55-d5f0-ed118d42c7de	3273	Jurklošter
00050000-554a-0a55-836e-62c15849bbc4	2223	Jurovski Dol
00050000-554a-0a55-50d5-b492051c375d	2256	Juršinci
00050000-554a-0a55-833f-9a35f872934e	5214	Kal nad Kanalom
00050000-554a-0a55-2d60-7fe38b772ad9	3233	Kalobje
00050000-554a-0a55-093a-539f7bb0c74a	4246	Kamna Gorica
00050000-554a-0a55-0bd2-5698b24a681e	2351	Kamnica
00050000-554a-0a55-f90d-7008bfe17ade	1241	Kamnik
00050000-554a-0a55-d3f1-624d82c802f7	5213	Kanal
00050000-554a-0a55-8986-f3adf1ede068	8258	Kapele
00050000-554a-0a55-cc89-186104653991	2362	Kapla
00050000-554a-0a55-b603-3f74197f10e6	2325	Kidričevo
00050000-554a-0a55-8735-77b413d11fbb	1412	Kisovec
00050000-554a-0a55-6007-7d67e80d1cc2	6253	Knežak
00050000-554a-0a55-c9de-3ed84c5ddc7b	5222	Kobarid
00050000-554a-0a55-c9bb-bb84488ade2b	9227	Kobilje
00050000-554a-0a55-5940-20bcfec85dde	1330	Kočevje
00050000-554a-0a55-b3bd-d6f8bfc64205	1338	Kočevska Reka
00050000-554a-0a55-5274-1e284c70f572	2276	Kog
00050000-554a-0a55-7775-70eb25c794ac	5211	Kojsko
00050000-554a-0a55-c721-23953785fa9c	6223	Komen
00050000-554a-0a55-f758-a85db6b4c839	1218	Komenda
00050000-554a-0a55-1586-5d3bae4afbf9	6000	Koper/Capodistria 
00050000-554a-0a55-58e2-d70adb315e8a	6001	Koper/Capodistria - poštni predali
00050000-554a-0a55-f330-48bc4f61817f	8282	Koprivnica
00050000-554a-0a55-1ca0-7314b1e95feb	5296	Kostanjevica na Krasu
00050000-554a-0a55-3fb0-1c989f39be4e	8311	Kostanjevica na Krki
00050000-554a-0a55-f4fc-e78520c2b42d	1336	Kostel
00050000-554a-0a55-2365-58754a979bcc	6256	Košana
00050000-554a-0a55-45da-bb8400620ba5	2394	Kotlje
00050000-554a-0a55-de79-ac1e178cd908	6240	Kozina
00050000-554a-0a55-ed65-0b40531f978c	3260	Kozje
00050000-554a-0a55-be8a-76df8948ba13	4000	Kranj 
00050000-554a-0a55-5333-0afb2e823957	4001	Kranj - poštni predali
00050000-554a-0a55-5c61-636552f0986c	4280	Kranjska Gora
00050000-554a-0a55-cb80-7b8e4fc90f63	1281	Kresnice
00050000-554a-0a55-f2a0-ccba24f91609	4294	Križe
00050000-554a-0a55-cf69-bc89ed0c467c	9206	Križevci
00050000-554a-0a55-31d4-f9970618396a	9242	Križevci pri Ljutomeru
00050000-554a-0a55-af04-d9c4345a663f	1301	Krka
00050000-554a-0a55-28e7-0204b2d4dbd0	8296	Krmelj
00050000-554a-0a55-4b2d-46a5158fc904	4245	Kropa
00050000-554a-0a55-f1a7-05c4ef859c81	8262	Krška vas
00050000-554a-0a55-069f-b5f03b2ee020	8270	Krško
00050000-554a-0a55-acbd-a32b67b59294	9263	Kuzma
00050000-554a-0a55-dff7-4d6345a1ce79	2318	Laporje
00050000-554a-0a55-1296-936798b5088a	3270	Laško
00050000-554a-0a55-008e-8d3def3ddf5a	1219	Laze v Tuhinju
00050000-554a-0a55-657c-5cf8458f92c5	2230	Lenart v Slovenskih goricah
00050000-554a-0a55-cb05-a86fe4f4a898	9220	Lendava/Lendva
00050000-554a-0a55-5740-3e19a1a8ab71	4248	Lesce
00050000-554a-0a55-a8a8-2486a04b8820	3261	Lesično
00050000-554a-0a55-8b5f-33b50bd51c19	8273	Leskovec pri Krškem
00050000-554a-0a55-7217-aaabeeec1f01	2372	Libeliče
00050000-554a-0a55-f9e2-727cdad48209	2341	Limbuš
00050000-554a-0a55-9265-2c63a0c92581	1270	Litija
00050000-554a-0a55-a39a-4df1959b7275	3202	Ljubečna
00050000-554a-0a55-0e56-2b49a0d32129	1000	Ljubljana 
00050000-554a-0a55-043d-d42789034df7	1001	Ljubljana - poštni predali
00050000-554a-0a55-377a-d79722b2c9e9	1231	Ljubljana - Črnuče
00050000-554a-0a55-7661-a11ec4e37d73	1261	Ljubljana - Dobrunje
00050000-554a-0a55-f2d2-06e31a8920fe	1260	Ljubljana - Polje
00050000-554a-0a55-e2a0-9a480d3aaaca	1210	Ljubljana - Šentvid
00050000-554a-0a55-37f2-8442c6904c8d	1211	Ljubljana - Šmartno
00050000-554a-0a55-c127-bb488cd6df98	3333	Ljubno ob Savinji
00050000-554a-0a55-0260-746367fd9722	9240	Ljutomer
00050000-554a-0a55-688c-57ead4d47da4	3215	Loče
00050000-554a-0a55-9bf9-14e84de58811	5231	Log pod Mangartom
00050000-554a-0a55-cac7-cdb0b7643937	1358	Log pri Brezovici
00050000-554a-0a55-606e-26c6345d2c10	1370	Logatec
00050000-554a-0a55-1b30-9413c5afaf11	1371	Logatec
00050000-554a-0a55-8693-2f592a460dc9	1434	Loka pri Zidanem Mostu
00050000-554a-0a55-40fb-7aca34434f84	3223	Loka pri Žusmu
00050000-554a-0a55-af90-1633df821aa9	6219	Lokev
00050000-554a-0a55-28e5-7bdbc47c5a38	1318	Loški Potok
00050000-554a-0a55-4f9d-a77d8e89fd0d	2324	Lovrenc na Dravskem polju
00050000-554a-0a55-65a1-5fa1cabf82a0	2344	Lovrenc na Pohorju
00050000-554a-0a55-8a28-f76367010033	3334	Luče
00050000-554a-0a55-a2cc-fe8339fb26e0	1225	Lukovica
00050000-554a-0a55-29af-23d83f5402a4	9202	Mačkovci
00050000-554a-0a55-b960-38f07abd3026	2322	Majšperk
00050000-554a-0a55-f31a-ffc10b9296dd	2321	Makole
00050000-554a-0a55-255d-2a78bac5504c	9243	Mala Nedelja
00050000-554a-0a55-bab8-7af8a040ef65	2229	Malečnik
00050000-554a-0a55-4916-0116844268b9	6273	Marezige
00050000-554a-0a55-a63c-c0147cac9b27	2000	Maribor 
00050000-554a-0a55-b918-6b6b0278c6e0	2001	Maribor - poštni predali
00050000-554a-0a55-8eb1-32308fd05e02	2206	Marjeta na Dravskem polju
00050000-554a-0a55-e1ce-a4b11851c3e5	2281	Markovci
00050000-554a-0a55-031c-23fa041213ba	9221	Martjanci
00050000-554a-0a55-688d-eb301e6a68af	6242	Materija
00050000-554a-0a55-ceb0-765b5275ae32	4211	Mavčiče
00050000-554a-0a55-1018-429238303b83	1215	Medvode
00050000-554a-0a55-7af5-ba1555f70a7a	1234	Mengeš
00050000-554a-0a55-ca7b-c70cab7b4dfd	8330	Metlika
00050000-554a-0a55-70b1-699a6df22657	2392	Mežica
00050000-554a-0a55-8b08-5bad44f09848	2204	Miklavž na Dravskem polju
00050000-554a-0a55-4019-fa6db36f3270	2275	Miklavž pri Ormožu
00050000-554a-0a55-1414-d308ab8e811a	5291	Miren
00050000-554a-0a55-1006-2c8d24cfcc2d	8233	Mirna
00050000-554a-0a55-063e-a121c5d439d6	8216	Mirna Peč
00050000-554a-0a55-9f0c-134edeb553e7	2382	Mislinja
00050000-554a-0a55-65f8-5d7e2478e6a1	4281	Mojstrana
00050000-554a-0a55-a7c4-9ff05357b062	8230	Mokronog
00050000-554a-0a55-e327-d0cdb136f64c	1251	Moravče
00050000-554a-0a55-00ee-b7f2eb279ef2	9226	Moravske Toplice
00050000-554a-0a55-a5c4-5423ac73dace	5216	Most na Soči
00050000-554a-0a55-7677-40a6025d0cc1	1221	Motnik
00050000-554a-0a55-1095-ad7a250f5880	3330	Mozirje
00050000-554a-0a55-f0e5-981b9dd02e61	9000	Murska Sobota 
00050000-554a-0a55-1e33-6c3e886a180a	9001	Murska Sobota - poštni predali
00050000-554a-0a55-efa3-c80c80523ca7	2366	Muta
00050000-554a-0a55-0cd5-751e4e5c08bf	4202	Naklo
00050000-554a-0a55-8a5c-cc7a9e6761bf	3331	Nazarje
00050000-554a-0a55-36a9-4d86cb6f03f2	1357	Notranje Gorice
00050000-554a-0a55-61dc-19cbaeee3453	3203	Nova Cerkev
00050000-554a-0a55-1ef5-eec601cac9c8	5000	Nova Gorica 
00050000-554a-0a55-af47-84906e4a7d27	5001	Nova Gorica - poštni predali
00050000-554a-0a55-240f-e83b8ff8ecb3	1385	Nova vas
00050000-554a-0a55-e6d8-5649b9fbc18c	8000	Novo mesto
00050000-554a-0a55-d8fb-fd7763d23215	8001	Novo mesto - poštni predali
00050000-554a-0a55-92fb-3639e8095419	6243	Obrov
00050000-554a-0a55-4066-206c8676459b	9233	Odranci
00050000-554a-0a55-76b8-8246e93770e0	2317	Oplotnica
00050000-554a-0a55-c1bf-9e8ee2591872	2312	Orehova vas
00050000-554a-0a55-ddc9-9f5b876124d9	2270	Ormož
00050000-554a-0a55-28bf-c36930ed6490	1316	Ortnek
00050000-554a-0a55-a862-7397099c200c	1337	Osilnica
00050000-554a-0a55-e2e1-0fb1277414a6	8222	Otočec
00050000-554a-0a55-9f4e-bffa4b5de696	2361	Ožbalt
00050000-554a-0a55-f80a-1e99b79be459	2231	Pernica
00050000-554a-0a55-79e4-105f208fcd85	2211	Pesnica pri Mariboru
00050000-554a-0a55-8995-57dcb3c4fcbd	9203	Petrovci
00050000-554a-0a55-c1fd-85c4e9f8fcdf	3301	Petrovče
00050000-554a-0a55-5513-f587d24a64fd	6330	Piran/Pirano
00050000-554a-0a55-4df9-e0fb068fc6c9	8255	Pišece
00050000-554a-0a55-3953-72c0066c85c1	6257	Pivka
00050000-554a-0a55-b44d-96197215e9b9	6232	Planina
00050000-554a-0a55-c1d2-04df61e8e666	3225	Planina pri Sevnici
00050000-554a-0a55-7925-334752588558	6276	Pobegi
00050000-554a-0a55-1769-a319f909d06f	8312	Podbočje
00050000-554a-0a55-2c47-e796bf71dc83	5243	Podbrdo
00050000-554a-0a55-7327-1f7f1ff0b324	3254	Podčetrtek
00050000-554a-0a55-df96-c32f01f0e4e2	2273	Podgorci
00050000-554a-0a55-97a3-5df029b1e574	6216	Podgorje
00050000-554a-0a55-7b70-6af353ea6909	2381	Podgorje pri Slovenj Gradcu
00050000-554a-0a55-9956-89bc9240805c	6244	Podgrad
00050000-554a-0a55-eb88-f48af01b8e17	1414	Podkum
00050000-554a-0a55-421b-4dc1ee3744da	2286	Podlehnik
00050000-554a-0a55-177c-29b75d6fd799	5272	Podnanos
00050000-554a-0a55-e1ca-57f8bcfb93db	4244	Podnart
00050000-554a-0a55-9870-258b39dfdb14	3241	Podplat
00050000-554a-0a55-740c-007adc7d95db	3257	Podsreda
00050000-554a-0a55-829f-774d9bda5c3b	2363	Podvelka
00050000-554a-0a55-4cc8-849cfb4c1478	2208	Pohorje
00050000-554a-0a55-2d5d-9c0eb49c3997	2257	Polenšak
00050000-554a-0a55-1f38-0091a0af35aa	1355	Polhov Gradec
00050000-554a-0a55-b3fa-a14e66a3e280	4223	Poljane nad Škofjo Loko
00050000-554a-0a55-711d-9e30f978d8c6	2319	Poljčane
00050000-554a-0a55-0fd0-0cc14c0a5cd2	1272	Polšnik
00050000-554a-0a55-99a7-614a4b7c69e2	3313	Polzela
00050000-554a-0a55-5a27-a6bcedc44549	3232	Ponikva
00050000-554a-0a55-9e8a-e94ceeddbb45	6320	Portorož/Portorose
00050000-554a-0a55-4e8c-fa907fb2c78d	6230	Postojna
00050000-554a-0a55-7693-802943e9738b	2331	Pragersko
00050000-554a-0a55-d136-e65186324e8e	3312	Prebold
00050000-554a-0a55-3547-4cff2b1541a2	4205	Preddvor
00050000-554a-0a55-1184-fedf49e63dd3	6255	Prem
00050000-554a-0a55-02d2-a214ec3ae4cc	1352	Preserje
00050000-554a-0a55-6ae1-a9f7e2aeca73	6258	Prestranek
00050000-554a-0a55-5651-08b8eace9ca2	2391	Prevalje
00050000-554a-0a55-0eec-435fc7ad8edc	3262	Prevorje
00050000-554a-0a55-f519-2f1bb5315a95	1276	Primskovo 
00050000-554a-0a55-b819-d06ce19d4448	3253	Pristava pri Mestinju
00050000-554a-0a55-26de-946069bf7f05	9207	Prosenjakovci/Partosfalva
00050000-554a-0a55-c7c9-934bd5582a3f	5297	Prvačina
00050000-554a-0a55-566c-9ab35380bad8	2250	Ptuj
00050000-554a-0a55-38fa-00ec361969f4	2323	Ptujska Gora
00050000-554a-0a55-9090-105d5db3fe35	9201	Puconci
00050000-554a-0a55-e872-d917b301ff5a	2327	Rače
00050000-554a-0a55-2d89-e233ccfeb0d6	1433	Radeče
00050000-554a-0a55-2886-18870571203a	9252	Radenci
00050000-554a-0a55-fa47-7234b7fa77fe	2360	Radlje ob Dravi
00050000-554a-0a55-42e4-228a508f36e2	1235	Radomlje
00050000-554a-0a55-5666-e5863c3b76fb	4240	Radovljica
00050000-554a-0a55-4af5-0a58c392522f	8274	Raka
00050000-554a-0a55-55f5-d9c6296ca012	1381	Rakek
00050000-554a-0a55-78fe-7a08f00431b9	4283	Rateče - Planica
00050000-554a-0a55-5679-4bec83ff3fe7	2390	Ravne na Koroškem
00050000-554a-0a55-2516-64128fcbbd3e	9246	Razkrižje
00050000-554a-0a55-17fd-4a23e0fcd6d8	3332	Rečica ob Savinji
00050000-554a-0a55-e658-24bd933ed5e4	5292	Renče
00050000-554a-0a55-8f89-280662f9d827	1310	Ribnica
00050000-554a-0a55-6f20-8dc98f291fde	2364	Ribnica na Pohorju
00050000-554a-0a55-016e-f997032a4cc4	3272	Rimske Toplice
00050000-554a-0a55-bfad-6a4b9adb67d6	1314	Rob
00050000-554a-0a55-7a4f-8b6c35726b84	5215	Ročinj
00050000-554a-0a55-7ee6-979cfa718046	3250	Rogaška Slatina
00050000-554a-0a55-d4e6-62faf3a30817	9262	Rogašovci
00050000-554a-0a55-91cc-c33922d0aaf7	3252	Rogatec
00050000-554a-0a55-63a0-4e7aae32e234	1373	Rovte
00050000-554a-0a55-a528-de57daa9961e	2342	Ruše
00050000-554a-0a55-dde3-7c67a8aeb454	1282	Sava
00050000-554a-0a55-fbd1-c5739988e5b9	6333	Sečovlje/Sicciole
00050000-554a-0a55-0cdd-8c588536628d	4227	Selca
00050000-554a-0a55-cbd4-7ffeb2d2d3db	2352	Selnica ob Dravi
00050000-554a-0a55-0894-ccc0540f0755	8333	Semič
00050000-554a-0a55-cbac-c0075e233dc3	8281	Senovo
00050000-554a-0a55-d453-6cd1458218a7	6224	Senožeče
00050000-554a-0a55-1ebf-bf1ce46300b3	8290	Sevnica
00050000-554a-0a55-d1d2-4848052b6299	6210	Sežana
00050000-554a-0a55-e30f-149a877979ed	2214	Sladki Vrh
00050000-554a-0a55-bddb-20516b20d90b	5283	Slap ob Idrijci
00050000-554a-0a55-bdbf-1eb86d3847f9	2380	Slovenj Gradec
00050000-554a-0a55-3eaf-2f734be61f4c	2310	Slovenska Bistrica
00050000-554a-0a55-cbdf-984a699057fa	3210	Slovenske Konjice
00050000-554a-0a55-19e1-fc537cabe715	1216	Smlednik
00050000-554a-0a55-50e5-588bec8edd05	5232	Soča
00050000-554a-0a55-5315-1d7e5d5e48ba	1317	Sodražica
00050000-554a-0a55-1eb6-5e32d40e17b2	3335	Solčava
00050000-554a-0a55-ba33-f7a83e9c7889	5250	Solkan
00050000-554a-0a55-8747-4437fd67804c	4229	Sorica
00050000-554a-0a55-ae47-1b1a79ebe441	4225	Sovodenj
00050000-554a-0a55-89c0-b091f385cc4c	5281	Spodnja Idrija
00050000-554a-0a55-2fd7-363119995209	2241	Spodnji Duplek
00050000-554a-0a55-dd01-16b908ed9e3c	9245	Spodnji Ivanjci
00050000-554a-0a55-c7fc-d1edbf994d59	2277	Središče ob Dravi
00050000-554a-0a55-f323-650ef6ce3fc1	4267	Srednja vas v Bohinju
00050000-554a-0a55-4855-f23569a2f5e6	8256	Sromlje 
00050000-554a-0a55-a167-ab7f16f86560	5224	Srpenica
00050000-554a-0a55-2569-fa495a91a745	1242	Stahovica
00050000-554a-0a55-7b40-734297beeb83	1332	Stara Cerkev
00050000-554a-0a55-fbb6-e83935692138	8342	Stari trg ob Kolpi
00050000-554a-0a55-6315-d9efc18bdf12	1386	Stari trg pri Ložu
00050000-554a-0a55-c121-e244d2e7aa6a	2205	Starše
00050000-554a-0a55-37be-98b5bad90d5c	2289	Stoperce
00050000-554a-0a55-3d91-06917137e801	8322	Stopiče
00050000-554a-0a55-59e5-699669adec59	3206	Stranice
00050000-554a-0a55-bc3d-9e2cf4c8cc38	8351	Straža
00050000-554a-0a55-6fc9-866baea7701a	1313	Struge
00050000-554a-0a55-3f29-5c70b650c6f7	8293	Studenec
00050000-554a-0a55-7c9d-9e4e779ff1ef	8331	Suhor
00050000-554a-0a55-aeef-5779db64b561	2233	Sv. Ana v Slovenskih goricah
00050000-554a-0a55-dce1-a1e327ad8e09	2235	Sv. Trojica v Slovenskih goricah
00050000-554a-0a55-37b2-4927d47485a9	2353	Sveti Duh na Ostrem Vrhu
00050000-554a-0a55-1827-b5b4272dd9d7	9244	Sveti Jurij ob Ščavnici
00050000-554a-0a55-be8c-566bd3481a09	3264	Sveti Štefan
00050000-554a-0a55-980c-d57667ecaa79	2258	Sveti Tomaž
00050000-554a-0a55-7961-2ea3c8e6911d	9204	Šalovci
00050000-554a-0a55-692d-9bc5760881e4	5261	Šempas
00050000-554a-0a55-a036-ba0dc3cdb42e	5290	Šempeter pri Gorici
00050000-554a-0a55-98b6-f315c6991ff5	3311	Šempeter v Savinjski dolini
00050000-554a-0a55-0e9c-8cbc91c93e5b	4208	Šenčur
00050000-554a-0a55-97df-0678d9572c5a	2212	Šentilj v Slovenskih goricah
00050000-554a-0a55-04c3-03a3b08fd7b2	8297	Šentjanž
00050000-554a-0a55-15bc-ebb068996c1a	2373	Šentjanž pri Dravogradu
00050000-554a-0a55-bd60-6f5d756f7782	8310	Šentjernej
00050000-554a-0a55-d5b2-0be9897d3ba8	3230	Šentjur
00050000-554a-0a55-df65-adff8930bfb4	3271	Šentrupert
00050000-554a-0a55-6b5d-2771d8ca336b	8232	Šentrupert
00050000-554a-0a55-5fef-8416be7d92dd	1296	Šentvid pri Stični
00050000-554a-0a55-80f6-1da36bd836bf	8275	Škocjan
00050000-554a-0a55-6ace-7ac8cca4fbc6	6281	Škofije
00050000-554a-0a55-332b-c9144d3bc893	4220	Škofja Loka
00050000-554a-0a55-c1de-3a5672978a96	3211	Škofja vas
00050000-554a-0a55-3687-2ea970634c96	1291	Škofljica
00050000-554a-0a55-c000-6d69d508b983	6274	Šmarje
00050000-554a-0a55-5346-98e80775d3e7	1293	Šmarje - Sap
00050000-554a-0a55-5ead-a5fc249b85b4	3240	Šmarje pri Jelšah
00050000-554a-0a55-7994-240e94d17c06	8220	Šmarješke Toplice
00050000-554a-0a55-2822-b0c944bd3cea	2315	Šmartno na Pohorju
00050000-554a-0a55-3b95-7a5dfa45ea49	3341	Šmartno ob Dreti
00050000-554a-0a55-9a1e-b0cee6449c54	3327	Šmartno ob Paki
00050000-554a-0a55-302c-ba6100b2251f	1275	Šmartno pri Litiji
00050000-554a-0a55-911e-770c77f5e169	2383	Šmartno pri Slovenj Gradcu
00050000-554a-0a55-4dc9-6a5e8b917dd7	3201	Šmartno v Rožni dolini
00050000-554a-0a55-b310-5b7b106f63c4	3325	Šoštanj
00050000-554a-0a55-82f2-78696ae1c305	6222	Štanjel
00050000-554a-0a55-667f-56fcad278bd8	3220	Štore
00050000-554a-0a55-11ae-9342c018e169	3304	Tabor
00050000-554a-0a55-c259-954cc344a993	3221	Teharje
00050000-554a-0a55-9c62-85fc710c17dc	9251	Tišina
00050000-554a-0a55-32c6-be278856435f	5220	Tolmin
00050000-554a-0a55-e7c9-b59b84bd8362	3326	Topolšica
00050000-554a-0a55-5441-666def9a8bc2	2371	Trbonje
00050000-554a-0a55-1b25-ac87547739c3	1420	Trbovlje
00050000-554a-0a55-cfbf-1dfad3fc4958	8231	Trebelno 
00050000-554a-0a55-9166-4925945e4d72	8210	Trebnje
00050000-554a-0a55-040c-828dd3653ed7	5252	Trnovo pri Gorici
00050000-554a-0a55-6e27-c8ee9a04adb3	2254	Trnovska vas
00050000-554a-0a55-b3e8-35a8120f36e7	1222	Trojane
00050000-554a-0a55-e75a-8c9008e5eae5	1236	Trzin
00050000-554a-0a55-472e-76590901c659	4290	Tržič
00050000-554a-0a55-ed3f-58317d518d94	8295	Tržišče
00050000-554a-0a55-f905-1059a2ef314e	1311	Turjak
00050000-554a-0a55-0b79-0107096f1718	9224	Turnišče
00050000-554a-0a55-647c-a5de6b80c0b7	8323	Uršna sela
00050000-554a-0a55-7032-f61d5308ba20	1252	Vače
00050000-554a-0a55-45ef-ce9b8f9ad999	3320	Velenje 
00050000-554a-0a55-6c1f-04478376fddd	3322	Velenje - poštni predali
00050000-554a-0a55-6ba6-1abecc1b19bb	8212	Velika Loka
00050000-554a-0a55-9cc4-bb75a6617d53	2274	Velika Nedelja
00050000-554a-0a55-b58c-1a8aea385536	9225	Velika Polana
00050000-554a-0a55-cebc-68b5f39a1bd4	1315	Velike Lašče
00050000-554a-0a55-2119-af0e83be2b53	8213	Veliki Gaber
00050000-554a-0a55-85fd-1133410a9eb6	9241	Veržej
00050000-554a-0a55-dfd4-97535c33e719	1312	Videm - Dobrepolje
00050000-554a-0a55-00fc-46c780824fbe	2284	Videm pri Ptuju
00050000-554a-0a55-d90a-6364735e2f7d	8344	Vinica
00050000-554a-0a55-8b0e-b5c061438a73	5271	Vipava
00050000-554a-0a55-0ffd-cd90ad99f86d	4212	Visoko
00050000-554a-0a55-f744-4c7bd5ce6cdc	1294	Višnja Gora
00050000-554a-0a55-3bd2-02e137a88950	3205	Vitanje
00050000-554a-0a55-a7fa-0d4c72af8b24	2255	Vitomarci
00050000-554a-0a55-1528-85a1876047ed	1217	Vodice
00050000-554a-0a55-eefd-5ba88f977ed6	3212	Vojnik\t
00050000-554a-0a55-1b26-66e5ed59f01e	5293	Volčja Draga
00050000-554a-0a55-234d-f55cfb778465	2232	Voličina
00050000-554a-0a55-f0e0-6254be491319	3305	Vransko
00050000-554a-0a55-e3c0-99fdc2c0c624	6217	Vremski Britof
00050000-554a-0a55-4838-cb4dd67026dc	1360	Vrhnika
00050000-554a-0a55-3645-ec74669fbddf	2365	Vuhred
00050000-554a-0a55-ef7a-3973ab479272	2367	Vuzenica
00050000-554a-0a55-b46c-03914eae681e	8292	Zabukovje 
00050000-554a-0a55-ec5e-fb8f7772a68e	1410	Zagorje ob Savi
00050000-554a-0a55-fe90-08275bd074a0	1303	Zagradec
00050000-554a-0a55-a2f1-87582429465c	2283	Zavrč
00050000-554a-0a55-8221-92b844713671	8272	Zdole 
00050000-554a-0a55-5429-7f079214dd09	4201	Zgornja Besnica
00050000-554a-0a55-4968-c2936aab4bfe	2242	Zgornja Korena
00050000-554a-0a55-9ba4-c06ab3b4fb1f	2201	Zgornja Kungota
00050000-554a-0a55-9109-3bc42115e27a	2316	Zgornja Ložnica
00050000-554a-0a55-c630-b0b186b162da	2314	Zgornja Polskava
00050000-554a-0a55-488d-2fae5e32bb91	2213	Zgornja Velka
00050000-554a-0a55-cda2-29f90f3f39c8	4247	Zgornje Gorje
00050000-554a-0a55-db6f-2462102b7764	4206	Zgornje Jezersko
00050000-554a-0a55-cda9-9281421bc444	2285	Zgornji Leskovec
00050000-554a-0a55-65f0-9a66cecd4d21	1432	Zidani Most
00050000-554a-0a55-be91-5840fbd4520f	3214	Zreče
00050000-554a-0a55-178d-5d69b5005b92	4209	Žabnica
00050000-554a-0a55-ad96-fbf1436e4eef	3310	Žalec
00050000-554a-0a55-876a-f412e487c547	4228	Železniki
00050000-554a-0a55-f90b-fe91e4bbb8d5	2287	Žetale
00050000-554a-0a55-99e1-a2cd70945f72	4226	Žiri
00050000-554a-0a55-69bf-917899a376ed	4274	Žirovnica
00050000-554a-0a55-f70d-5ed0185d643f	8360	Žužemberk
\.


--
-- TOC entry 2660 (class 0 OID 2460763)
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
-- TOC entry 2643 (class 0 OID 2460586)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 2460652)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 2460775)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 2460880)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 2460924)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 2460804)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 2460748)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 2460738)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 2460914)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 2460870)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 2460452)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-554a-0a55-d1b0-390a87c5d593	00010000-554a-0a55-cb38-62a748ff12c0	2015-05-06 14:34:30	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROIqa4LisOnfiNFWsfQYRXy2Fx8pDwQxq";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2692 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2667 (class 0 OID 2460813)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 2460492)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-554a-0a55-eaf5-7e2daec93d19	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-554a-0a55-0b61-792b799cab6b	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-554a-0a55-c7d6-be41cfa6584f	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-554a-0a55-fdeb-79c842f3fb50	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-554a-0a55-9cfd-c0a64901d517	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-554a-0a55-b180-e331d676a1b3	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2633 (class 0 OID 2460475)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-554a-0a55-d1b0-390a87c5d593	00020000-554a-0a55-fdeb-79c842f3fb50
00010000-554a-0a55-cb38-62a748ff12c0	00020000-554a-0a55-fdeb-79c842f3fb50
\.


--
-- TOC entry 2669 (class 0 OID 2460827)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 2460769)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 2460719)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 2460551)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 2460725)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 2460905)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 2460621)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 2460461)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-554a-0a55-cb38-62a748ff12c0	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROACEUZWtlvGzykjnRb7QRCLUW6km6Z5W	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-554a-0a55-d1b0-390a87c5d593	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2681 (class 0 OID 2460956)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 2460667)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 2460796)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 2460862)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 2460695)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2680 (class 0 OID 2460946)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 2460852)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2275 (class 2606 OID 2460516)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 2460995)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 2460988)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 2460904)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 2460685)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 2460718)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2311 (class 2606 OID 2460647)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 2460848)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2322 (class 2606 OID 2460665)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 2460712)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2248 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2365 (class 2606 OID 2460761)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 2460788)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 2460619)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2279 (class 2606 OID 2460525)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 2460583)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2281 (class 2606 OID 2460549)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2273 (class 2606 OID 2460505)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2265 (class 2606 OID 2460490)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 2460794)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 2460826)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 2460941)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 2460576)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2301 (class 2606 OID 2460607)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 2460767)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2254 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 2460597)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2320 (class 2606 OID 2460656)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 2460779)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 2460886)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 2460929)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 2460811)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 2460752)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 2460743)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 2460923)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 2460877)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2256 (class 2606 OID 2460460)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 2460817)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 2460479)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2268 (class 2606 OID 2460499)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 2460835)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 2460774)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 2460724)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2286 (class 2606 OID 2460556)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2351 (class 2606 OID 2460734)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 2460913)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2309 (class 2606 OID 2460632)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 2460473)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2436 (class 2606 OID 2460970)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 2460671)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 2460802)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 2460868)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 2460707)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 2460955)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 2460861)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 1259 OID 2460692)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2287 (class 1259 OID 2460578)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2250 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2251 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2252 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2378 (class 1259 OID 2460795)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2372 (class 1259 OID 2460781)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2373 (class 1259 OID 2460780)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2324 (class 1259 OID 2460672)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2399 (class 1259 OID 2460851)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2400 (class 1259 OID 2460849)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2401 (class 1259 OID 2460850)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2424 (class 1259 OID 2460943)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2425 (class 1259 OID 2460944)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2426 (class 1259 OID 2460945)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2432 (class 1259 OID 2460973)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2433 (class 1259 OID 2460972)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2434 (class 1259 OID 2460971)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2306 (class 1259 OID 2460634)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2307 (class 1259 OID 2460633)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2291 (class 1259 OID 2460585)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2292 (class 1259 OID 2460584)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 2460818)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2342 (class 1259 OID 2460713)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2270 (class 1259 OID 2460506)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2271 (class 1259 OID 2460507)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2392 (class 1259 OID 2460838)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2393 (class 1259 OID 2460837)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2394 (class 1259 OID 2460836)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2316 (class 1259 OID 2460657)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2317 (class 1259 OID 2460659)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2318 (class 1259 OID 2460658)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2352 (class 1259 OID 2460747)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2353 (class 1259 OID 2460745)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2354 (class 1259 OID 2460744)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2355 (class 1259 OID 2460746)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2260 (class 1259 OID 2460480)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2261 (class 1259 OID 2460481)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2381 (class 1259 OID 2460803)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2367 (class 1259 OID 2460768)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2407 (class 1259 OID 2460878)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2408 (class 1259 OID 2460879)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2295 (class 1259 OID 2460599)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2296 (class 1259 OID 2460598)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2297 (class 1259 OID 2460600)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2411 (class 1259 OID 2460887)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2412 (class 1259 OID 2460888)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2443 (class 1259 OID 2460998)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2444 (class 1259 OID 2460997)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2445 (class 1259 OID 2461000)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2446 (class 1259 OID 2460996)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2447 (class 1259 OID 2460999)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2404 (class 1259 OID 2460869)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2358 (class 1259 OID 2460756)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2359 (class 1259 OID 2460755)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2360 (class 1259 OID 2460753)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2361 (class 1259 OID 2460754)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2246 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2439 (class 1259 OID 2460990)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2440 (class 1259 OID 2460989)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2323 (class 1259 OID 2460666)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2276 (class 1259 OID 2460527)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2277 (class 1259 OID 2460526)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2283 (class 1259 OID 2460557)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2284 (class 1259 OID 2460558)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2347 (class 1259 OID 2460737)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2348 (class 1259 OID 2460736)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2349 (class 1259 OID 2460735)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2330 (class 1259 OID 2460694)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2331 (class 1259 OID 2460690)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2332 (class 1259 OID 2460687)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2333 (class 1259 OID 2460688)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2334 (class 1259 OID 2460686)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2335 (class 1259 OID 2460691)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2336 (class 1259 OID 2460689)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2290 (class 1259 OID 2460577)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 2460648)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2313 (class 1259 OID 2460650)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2314 (class 1259 OID 2460649)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2315 (class 1259 OID 2460651)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2366 (class 1259 OID 2460762)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2429 (class 1259 OID 2460942)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2282 (class 1259 OID 2460550)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2305 (class 1259 OID 2460620)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2257 (class 1259 OID 2460474)
-- Name: uniq_7fb775b7e7927c74; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7e7927c74 ON uporabniki USING btree (email);


--
-- TOC entry 2386 (class 1259 OID 2460812)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2266 (class 1259 OID 2460491)
-- Name: uniq_af14917a5e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_af14917a5e237e06 ON permission USING btree (name);


--
-- TOC entry 2249 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 2460608)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2423 (class 1259 OID 2460930)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2269 (class 1259 OID 2460500)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2337 (class 1259 OID 2460693)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2472 (class 2606 OID 2461131)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2475 (class 2606 OID 2461116)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2474 (class 2606 OID 2461121)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2470 (class 2606 OID 2461141)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2476 (class 2606 OID 2461111)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2471 (class 2606 OID 2461136)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2473 (class 2606 OID 2461126)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2457 (class 2606 OID 2461046)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2493 (class 2606 OID 2461226)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2491 (class 2606 OID 2461221)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2492 (class 2606 OID 2461216)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2469 (class 2606 OID 2461106)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 2461266)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2501 (class 2606 OID 2461256)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2500 (class 2606 OID 2461261)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2489 (class 2606 OID 2461206)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2510 (class 2606 OID 2461301)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2509 (class 2606 OID 2461306)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2508 (class 2606 OID 2461311)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2511 (class 2606 OID 2461326)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2512 (class 2606 OID 2461321)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2513 (class 2606 OID 2461316)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2463 (class 2606 OID 2461081)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2464 (class 2606 OID 2461076)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2458 (class 2606 OID 2461056)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2459 (class 2606 OID 2461051)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2454 (class 2606 OID 2461031)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2495 (class 2606 OID 2461236)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2477 (class 2606 OID 2461146)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2451 (class 2606 OID 2461011)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2450 (class 2606 OID 2461016)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2496 (class 2606 OID 2461251)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2497 (class 2606 OID 2461246)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2498 (class 2606 OID 2461241)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2467 (class 2606 OID 2461086)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2465 (class 2606 OID 2461096)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2466 (class 2606 OID 2461091)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2481 (class 2606 OID 2461181)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2483 (class 2606 OID 2461171)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2484 (class 2606 OID 2461166)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2482 (class 2606 OID 2461176)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2449 (class 2606 OID 2461001)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2448 (class 2606 OID 2461006)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2494 (class 2606 OID 2461231)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2490 (class 2606 OID 2461211)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2504 (class 2606 OID 2461276)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2503 (class 2606 OID 2461281)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2461 (class 2606 OID 2461066)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2462 (class 2606 OID 2461061)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2460 (class 2606 OID 2461071)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 2461286)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2505 (class 2606 OID 2461291)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2518 (class 2606 OID 2461351)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2519 (class 2606 OID 2461346)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2516 (class 2606 OID 2461361)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2520 (class 2606 OID 2461341)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2517 (class 2606 OID 2461356)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2502 (class 2606 OID 2461271)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2485 (class 2606 OID 2461201)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2486 (class 2606 OID 2461196)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2488 (class 2606 OID 2461186)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2487 (class 2606 OID 2461191)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2514 (class 2606 OID 2461336)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2515 (class 2606 OID 2461331)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2468 (class 2606 OID 2461101)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2507 (class 2606 OID 2461296)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2452 (class 2606 OID 2461026)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2453 (class 2606 OID 2461021)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2456 (class 2606 OID 2461036)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2455 (class 2606 OID 2461041)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2478 (class 2606 OID 2461161)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2479 (class 2606 OID 2461156)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2480 (class 2606 OID 2461151)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-06 14:34:30 CEST

--
-- PostgreSQL database dump complete
--

