--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-08 15:26:59 CEST

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
-- TOC entry 179 (class 1259 OID 2786069)
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
-- TOC entry 225 (class 1259 OID 2786551)
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
-- TOC entry 224 (class 1259 OID 2786534)
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
-- TOC entry 217 (class 1259 OID 2786449)
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
-- TOC entry 193 (class 1259 OID 2786234)
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
-- TOC entry 196 (class 1259 OID 2786275)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 2786196)
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
-- TOC entry 212 (class 1259 OID 2786400)
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
-- TOC entry 191 (class 1259 OID 2786221)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 2786269)
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
-- TOC entry 201 (class 1259 OID 2786318)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 2786343)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 2786170)
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
-- TOC entry 180 (class 1259 OID 2786078)
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
-- TOC entry 181 (class 1259 OID 2786089)
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
-- TOC entry 184 (class 1259 OID 2786140)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 2786043)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 2786062)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 2786350)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 2786380)
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
-- TOC entry 221 (class 1259 OID 2786491)
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
-- TOC entry 183 (class 1259 OID 2786120)
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
-- TOC entry 186 (class 1259 OID 2786162)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 2786324)
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
-- TOC entry 185 (class 1259 OID 2786147)
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
-- TOC entry 190 (class 1259 OID 2786213)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 2786336)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 2786440)
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
-- TOC entry 220 (class 1259 OID 2786484)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 2786365)
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
-- TOC entry 200 (class 1259 OID 2786309)
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
-- TOC entry 199 (class 1259 OID 2786299)
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
-- TOC entry 219 (class 1259 OID 2786474)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 2786430)
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
-- TOC entry 173 (class 1259 OID 2786013)
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
-- TOC entry 172 (class 1259 OID 2786011)
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
-- TOC entry 209 (class 1259 OID 2786374)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 2786053)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 2786036)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 2786388)
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
-- TOC entry 203 (class 1259 OID 2786330)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 2786280)
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
-- TOC entry 182 (class 1259 OID 2786112)
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
-- TOC entry 198 (class 1259 OID 2786286)
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
-- TOC entry 218 (class 1259 OID 2786465)
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
-- TOC entry 188 (class 1259 OID 2786182)
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
-- TOC entry 174 (class 1259 OID 2786022)
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
-- TOC entry 223 (class 1259 OID 2786516)
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
-- TOC entry 192 (class 1259 OID 2786228)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 2786357)
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
-- TOC entry 214 (class 1259 OID 2786422)
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
-- TOC entry 194 (class 1259 OID 2786256)
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
-- TOC entry 222 (class 1259 OID 2786506)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 2786413)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) NOT NULL,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 2786016)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 2786069)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 2786551)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 2786534)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 2786449)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 2786234)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 2786275)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 2786196)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-554c-b9a2-2703-09ff2122d59c	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-554c-b9a2-38c3-6c744fe08818	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-554c-b9a2-22fb-b9bff620e0ef	AL	ALB	008	Albania 	Albanija	\N
00040000-554c-b9a2-1290-c17ec6614013	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-554c-b9a2-4067-c189fb4f0ed0	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-554c-b9a2-f420-170b076cb668	AD	AND	020	Andorra 	Andora	\N
00040000-554c-b9a2-085b-2eed6ecf75cf	AO	AGO	024	Angola 	Angola	\N
00040000-554c-b9a2-8091-08135f263240	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-554c-b9a2-c223-69b6d56bfd79	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-554c-b9a2-e789-8eafce361a04	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-554c-b9a2-d42f-745dd789f70d	AR	ARG	032	Argentina 	Argenitna	\N
00040000-554c-b9a2-96e3-9385cfa66317	AM	ARM	051	Armenia 	Armenija	\N
00040000-554c-b9a2-f6fe-b118d10553f4	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-554c-b9a2-94c3-c6a5565726e4	AU	AUS	036	Australia 	Avstralija	\N
00040000-554c-b9a2-1573-375ab46affd3	AT	AUT	040	Austria 	Avstrija	\N
00040000-554c-b9a2-e72a-99b59fddfa2c	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-554c-b9a2-df6a-9241a3b88cd4	BS	BHS	044	Bahamas 	Bahami	\N
00040000-554c-b9a2-cd5a-41f520d381e0	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-554c-b9a2-4e4b-ae5ed6de53d6	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-554c-b9a2-d49b-ad47d1cd000e	BB	BRB	052	Barbados 	Barbados	\N
00040000-554c-b9a2-ad73-6c985a0d051f	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-554c-b9a2-8e6e-5e03ec71b89c	BE	BEL	056	Belgium 	Belgija	\N
00040000-554c-b9a2-46be-33b8a9ef41d5	BZ	BLZ	084	Belize 	Belize	\N
00040000-554c-b9a2-f637-12d27817bfbb	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-554c-b9a2-9103-902b3e781792	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-554c-b9a2-2b37-8a38638ada94	BT	BTN	064	Bhutan 	Butan	\N
00040000-554c-b9a2-b5c0-bc58d62ce415	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-554c-b9a2-acdc-378555c4516b	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-554c-b9a2-c78a-b595e0e97650	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-554c-b9a2-9e7b-4b683aeec7b6	BW	BWA	072	Botswana 	Bocvana	\N
00040000-554c-b9a2-c027-1d45846fd2ce	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-554c-b9a2-e5d0-12235143d964	BR	BRA	076	Brazil 	Brazilija	\N
00040000-554c-b9a2-d7ee-f900eb226c3a	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-554c-b9a2-8cff-c622bb66307d	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-554c-b9a2-8d28-014ccb970356	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-554c-b9a2-7297-6345913a8653	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-554c-b9a2-5807-588af9181547	BI	BDI	108	Burundi 	Burundi 	\N
00040000-554c-b9a2-914f-7d34ff6de79f	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-554c-b9a2-b5f0-ba6c62e981d1	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-554c-b9a2-9a54-f28e7bdfa3ac	CA	CAN	124	Canada 	Kanada	\N
00040000-554c-b9a2-6429-997b3439c9c3	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-554c-b9a2-1fa8-b9ea5c4172bb	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-554c-b9a2-df6a-c2140e8ab57d	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-554c-b9a2-7930-5aecebc34542	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-554c-b9a2-651d-42f51e6735e2	CL	CHL	152	Chile 	Čile	\N
00040000-554c-b9a2-3d68-88a003aeeba9	CN	CHN	156	China 	Kitajska	\N
00040000-554c-b9a2-26fd-02827b295f8a	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-554c-b9a2-d713-41890f68d4a1	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-554c-b9a2-e3b7-e9142ed7d64f	CO	COL	170	Colombia 	Kolumbija	\N
00040000-554c-b9a2-4eb7-82fb2286e659	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-554c-b9a2-51db-a228dde5dcc5	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-554c-b9a2-a47e-17d54d3c76f0	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-554c-b9a2-b764-9e28289cac64	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-554c-b9a2-74dd-565eaf14639b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-554c-b9a2-279d-045f9c1514e2	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-554c-b9a2-1205-e9c8612dc157	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-554c-b9a2-8f67-5e34893ab3a4	CU	CUB	192	Cuba 	Kuba	\N
00040000-554c-b9a2-d654-4033144c4bc6	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-554c-b9a2-882f-2bb8b5cee761	CY	CYP	196	Cyprus 	Ciper	\N
00040000-554c-b9a2-d506-2e274da4e00d	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-554c-b9a2-aefe-3b51044def4a	DK	DNK	208	Denmark 	Danska	\N
00040000-554c-b9a2-99a8-4e4afcd518f4	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-554c-b9a2-3a9d-415e8007c427	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-554c-b9a2-34f6-e2285efd01c2	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-554c-b9a2-2524-c2864262cf3c	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-554c-b9a2-397d-38739d052b5d	EG	EGY	818	Egypt 	Egipt	\N
00040000-554c-b9a2-fcb0-c30a6a656784	SV	SLV	222	El Salvador 	Salvador	\N
00040000-554c-b9a2-6d24-1ad906b7ba78	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-554c-b9a2-39a4-080c13c39c5d	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-554c-b9a2-fd3a-904306a583ea	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-554c-b9a2-78e4-c0501482739e	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-554c-b9a2-e200-89d8dc3b4ca1	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-554c-b9a2-f58c-7f7ebff24260	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-554c-b9a2-f8d1-fd87de97f39f	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-554c-b9a2-77ee-7aa43d147b6e	FI	FIN	246	Finland 	Finska	\N
00040000-554c-b9a2-af7f-ff833eccccbf	FR	FRA	250	France 	Francija	\N
00040000-554c-b9a2-d49b-0fc94a821fa3	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-554c-b9a2-a620-2ed17f164620	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-554c-b9a2-33b6-83349f8fb1b2	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-554c-b9a2-2c69-d3e1d710be34	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-554c-b9a2-4178-a406fea22ece	GA	GAB	266	Gabon 	Gabon	\N
00040000-554c-b9a2-e783-f873fbf50b16	GM	GMB	270	Gambia 	Gambija	\N
00040000-554c-b9a2-2c14-faba68873250	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-554c-b9a2-c2ae-777e83e5e088	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-554c-b9a2-1bcd-dc568fbbeab7	GH	GHA	288	Ghana 	Gana	\N
00040000-554c-b9a2-07e3-529d8c4d190b	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-554c-b9a2-ebce-2c3dd361fd6d	GR	GRC	300	Greece 	Grčija	\N
00040000-554c-b9a2-aed2-f02c066cf663	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-554c-b9a2-ea4b-6dbf25ececd6	GD	GRD	308	Grenada 	Grenada	\N
00040000-554c-b9a2-f5b8-938d76179ef2	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-554c-b9a2-c52f-54be40f82f0b	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-554c-b9a2-989b-817b7055bea7	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-554c-b9a2-debd-2fb129623a6e	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-554c-b9a2-7d04-d0b1f457656b	GN	GIN	324	Guinea 	Gvineja	\N
00040000-554c-b9a2-afa2-40ea7f9b9b5f	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-554c-b9a2-9b4c-ddfc3dcf253f	GY	GUY	328	Guyana 	Gvajana	\N
00040000-554c-b9a2-8520-0ce1629a2f46	HT	HTI	332	Haiti 	Haiti	\N
00040000-554c-b9a2-a344-7db4f7865f51	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-554c-b9a2-3c88-70e18a9dd942	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-554c-b9a2-98ac-c11fa9fac13a	HN	HND	340	Honduras 	Honduras	\N
00040000-554c-b9a2-c412-24e684aa2731	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-554c-b9a2-9766-5f5444a2deae	HU	HUN	348	Hungary 	Madžarska	\N
00040000-554c-b9a2-1e88-9a114d938a1f	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-554c-b9a2-fa9e-19be280e55d2	IN	IND	356	India 	Indija	\N
00040000-554c-b9a2-42de-6fcd87b68915	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-554c-b9a2-853f-87220b17ddb1	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-554c-b9a2-ac79-f6ad1d87daac	IQ	IRQ	368	Iraq 	Irak	\N
00040000-554c-b9a2-6ec3-98cd5d1def8b	IE	IRL	372	Ireland 	Irska	\N
00040000-554c-b9a2-5132-7daf537d3a0f	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-554c-b9a2-3740-426ad00cd4ed	IL	ISR	376	Israel 	Izrael	\N
00040000-554c-b9a2-1de5-980f83e34483	IT	ITA	380	Italy 	Italija	\N
00040000-554c-b9a2-1231-4840bbb09a77	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-554c-b9a2-ab16-c89fc7c555b1	JP	JPN	392	Japan 	Japonska	\N
00040000-554c-b9a2-a5e7-99ada6d384b5	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-554c-b9a2-10dc-e7a8d56f2244	JO	JOR	400	Jordan 	Jordanija	\N
00040000-554c-b9a2-abd2-fb1ac25f044e	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-554c-b9a2-c455-2d41ccb44948	KE	KEN	404	Kenya 	Kenija	\N
00040000-554c-b9a2-ab54-06e735f668f0	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-554c-b9a2-da02-43464660d5aa	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-554c-b9a2-149f-dd4515b5348b	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-554c-b9a2-a90e-3f37735ad608	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-554c-b9a2-90e5-d0d07e5a2207	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-554c-b9a2-ceac-01afb508bab0	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-554c-b9a2-9b43-b412ecf4cda7	LV	LVA	428	Latvia 	Latvija	\N
00040000-554c-b9a2-4714-4803a99e0010	LB	LBN	422	Lebanon 	Libanon	\N
00040000-554c-b9a2-985d-a3924ef25c29	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-554c-b9a2-4c23-9d01ab000a69	LR	LBR	430	Liberia 	Liberija	\N
00040000-554c-b9a2-9c62-4938ad1e7e44	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-554c-b9a2-19d9-bcb42a852c18	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-554c-b9a2-1f41-adf2cf02bc76	LT	LTU	440	Lithuania 	Litva	\N
00040000-554c-b9a2-452d-ad157822ea62	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-554c-b9a2-e095-f0a0bf092dd6	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-554c-b9a2-dec0-4007242b7a97	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-554c-b9a2-15e5-1f4cecadb275	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-554c-b9a2-ca06-b56772bdc093	MW	MWI	454	Malawi 	Malavi	\N
00040000-554c-b9a2-c5d8-99ecf599f6ac	MY	MYS	458	Malaysia 	Malezija	\N
00040000-554c-b9a2-7ddb-b6b5f09bf5f7	MV	MDV	462	Maldives 	Maldivi	\N
00040000-554c-b9a2-3f94-58125fc7c155	ML	MLI	466	Mali 	Mali	\N
00040000-554c-b9a2-e4b4-0ba61d55fe05	MT	MLT	470	Malta 	Malta	\N
00040000-554c-b9a2-e77f-281d50363231	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-554c-b9a2-777d-94bc95345278	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-554c-b9a2-62a0-cb9406ec6a31	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-554c-b9a2-d587-50aa34d82970	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-554c-b9a2-0549-b4e18d608452	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-554c-b9a2-bbb1-55a194ba3bbd	MX	MEX	484	Mexico 	Mehika	\N
00040000-554c-b9a2-0690-8ddf7db23abd	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-554c-b9a2-cb8b-f36ed8ab00e7	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-554c-b9a2-3b91-edc1d65076f6	MC	MCO	492	Monaco 	Monako	\N
00040000-554c-b9a2-f965-0581ccfff605	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-554c-b9a2-4ae3-578f89896020	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-554c-b9a2-1938-4dedc3308365	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-554c-b9a2-6628-92a89146288e	MA	MAR	504	Morocco 	Maroko	\N
00040000-554c-b9a2-4920-1fb1aed9c92e	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-554c-b9a2-83c2-24f9eaa2059b	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-554c-b9a2-8967-d1a570cb5f14	NA	NAM	516	Namibia 	Namibija	\N
00040000-554c-b9a2-9068-6a29353b2d0d	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-554c-b9a2-5cdd-891f56cb2cdb	NP	NPL	524	Nepal 	Nepal	\N
00040000-554c-b9a2-94c9-f7f1ab37f116	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-554c-b9a2-abcb-6e3799508f62	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-554c-b9a2-9225-6123d4dfdd4e	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-554c-b9a2-c9f9-3225e4331b6f	NE	NER	562	Niger 	Niger 	\N
00040000-554c-b9a2-3708-7ce612605e86	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-554c-b9a2-7178-e486f06ccaee	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-554c-b9a2-342a-33a85851d503	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-554c-b9a2-0c96-cb91e748032a	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-554c-b9a2-78fd-c346136fbd04	NO	NOR	578	Norway 	Norveška	\N
00040000-554c-b9a2-60cd-e490d271456c	OM	OMN	512	Oman 	Oman	\N
00040000-554c-b9a2-cd7b-a9efbaacbe34	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-554c-b9a2-401f-3ae23ab01755	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-554c-b9a2-c684-d383be8f881e	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-554c-b9a2-8cad-b34e9f09512b	PA	PAN	591	Panama 	Panama	\N
00040000-554c-b9a2-c18e-6d0da7026f0f	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-554c-b9a2-17f5-2013b414ba12	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-554c-b9a2-fdbc-ae3069d14fda	PE	PER	604	Peru 	Peru	\N
00040000-554c-b9a2-8e51-1d39e337c56e	PH	PHL	608	Philippines 	Filipini	\N
00040000-554c-b9a2-771d-d691f094dc23	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-554c-b9a2-7ec2-d9a961e53b6e	PL	POL	616	Poland 	Poljska	\N
00040000-554c-b9a2-8c35-9f590134de5c	PT	PRT	620	Portugal 	Portugalska	\N
00040000-554c-b9a2-5d85-ffd714c1f81c	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-554c-b9a2-5ff4-a74ec06746e4	QA	QAT	634	Qatar 	Katar	\N
00040000-554c-b9a2-8cd6-b43a35c0ef9e	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-554c-b9a2-f9a1-5842c6aedef7	RO	ROU	642	Romania 	Romunija	\N
00040000-554c-b9a2-ec05-b34ac781f3d0	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-554c-b9a2-deb7-cb90ad2a6741	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-554c-b9a2-98fa-f46e475874ed	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-554c-b9a2-9b48-306c87c1b91d	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-554c-b9a2-8276-2bcd3c0d4118	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-554c-b9a2-b059-5356a980f156	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-554c-b9a2-febe-5ef2d529e2b8	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-554c-b9a2-9603-0c05af4467d8	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-554c-b9a2-a767-3676743b1ce0	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-554c-b9a2-85f1-23d364169f5d	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-554c-b9a2-7b59-947c468c44d1	SM	SMR	674	San Marino 	San Marino	\N
00040000-554c-b9a2-7f42-1e01f7ea7e0c	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-554c-b9a2-ffa0-ede677e42007	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-554c-b9a2-5411-f775703b954f	SN	SEN	686	Senegal 	Senegal	\N
00040000-554c-b9a2-489c-4af50964bb81	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-554c-b9a2-8392-19ca6490d6a9	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-554c-b9a2-213d-037524d5f00a	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-554c-b9a2-ae31-0b0cabebb56f	SG	SGP	702	Singapore 	Singapur	\N
00040000-554c-b9a2-bec5-7fca988565ac	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-554c-b9a2-8658-92c6d61ab6da	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-554c-b9a2-3be9-31b03aaa64b0	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-554c-b9a2-38af-30329c10a2a4	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-554c-b9a2-7559-c980a8f00813	SO	SOM	706	Somalia 	Somalija	\N
00040000-554c-b9a2-70b7-9d02a6c542bb	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-554c-b9a2-52c3-cb325e00db1e	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-554c-b9a2-3be7-d2b487d10570	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-554c-b9a2-457b-e6f44e6e3bfb	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-554c-b9a2-936f-e914ae7be492	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-554c-b9a2-62d1-712cb53381c2	SD	SDN	729	Sudan 	Sudan	\N
00040000-554c-b9a2-aa66-06d00b77dbd0	SR	SUR	740	Suriname 	Surinam	\N
00040000-554c-b9a2-a751-216a4ea92d07	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-554c-b9a2-f5b7-da9426a498a4	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-554c-b9a2-e7d2-d02596c02642	SE	SWE	752	Sweden 	Švedska	\N
00040000-554c-b9a2-90e9-1b4c7c9e4252	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-554c-b9a2-5fb2-2442254cddb3	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-554c-b9a2-e356-87c9cee6a69e	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-554c-b9a2-be21-fa1ccfa75139	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-554c-b9a2-0d82-18790c3fb5c5	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-554c-b9a2-9672-b7bfcb2fd454	TH	THA	764	Thailand 	Tajska	\N
00040000-554c-b9a2-82a9-7062972a4bc9	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-554c-b9a2-5a62-e4f565dc2e40	TG	TGO	768	Togo 	Togo	\N
00040000-554c-b9a2-7f51-7229cdfcabd0	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-554c-b9a2-9c65-ca4b711fe89a	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-554c-b9a2-a1a2-2183a54e3fa0	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-554c-b9a2-af19-2768171e81b4	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-554c-b9a2-0ad7-69c8ab64f5de	TR	TUR	792	Turkey 	Turčija	\N
00040000-554c-b9a2-9297-ce4072c2c98c	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-554c-b9a2-8011-fd19472eccf0	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-554c-b9a2-f9d0-f36d5c1a4033	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-554c-b9a2-40d1-f391cfe3fe80	UG	UGA	800	Uganda 	Uganda	\N
00040000-554c-b9a2-ab6c-e627984a4d3b	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-554c-b9a2-2f36-6ed74a44ce25	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-554c-b9a2-8500-eeef762739c3	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-554c-b9a2-6d90-07e4c28b97c4	US	USA	840	United States 	Združene države Amerike	\N
00040000-554c-b9a2-94ac-a8509c8ef249	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-554c-b9a2-0c84-ebc38f54d8dd	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-554c-b9a2-948f-4b035be4c3e1	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-554c-b9a2-b0f0-3f9af8aef8a8	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-554c-b9a2-5aa4-9bf11f452383	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-554c-b9a2-c5f6-4949d71d345d	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-554c-b9a2-b318-6973a7a8cfd7	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-554c-b9a2-517a-20f8d11bcb59	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-554c-b9a2-2afa-094ef0889023	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-554c-b9a2-b288-a6fa81659385	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-554c-b9a2-e213-940fa7c1165e	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-554c-b9a2-8586-88bb99242e63	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-554c-b9a2-541e-b21e4159dfaa	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 2786400)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 2786221)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 2786269)
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
-- TOC entry 2658 (class 0 OID 2786318)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 2786343)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 2786170)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-554c-b9a3-a508-ce9d84d83be9	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-554c-b9a3-0828-37c369cc64a4	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-554c-b9a3-6e0a-443889fef4dc	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-554c-b9a3-daf5-79c978d4246a	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-554c-b9a3-52a2-8a02b0051f8a	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-554c-b9a3-3502-7300d0a48ac4	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-554c-b9a3-1dd9-412389a3d20c	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-554c-b9a3-5ea2-5945c190cad3	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-554c-b9a3-f3e8-2bfdd374ce27	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-554c-b9a3-67ef-35e9b19510b4	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 2786078)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-554c-b9a3-b9c9-89c0be870638	00000000-554c-b9a3-52a2-8a02b0051f8a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-554c-b9a3-5926-8f1a6508480d	00000000-554c-b9a3-52a2-8a02b0051f8a	00010000-554c-b9a3-4d52-68d0e291d7e3	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-554c-b9a3-a115-7984de3c8b14	00000000-554c-b9a3-3502-7300d0a48ac4	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 2786089)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 2786140)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 2786043)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-554c-b9a2-62ae-a26b2789e595	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-554c-b9a2-d62e-9ca7311444f3	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-554c-b9a2-2d50-4537607519fb	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-554c-b9a2-52d7-5bb7e0615e3c	Abonma-read	Abonma - branje	f
00030000-554c-b9a2-5720-ba93050a3ea8	Abonma-write	Abonma - spreminjanje	f
00030000-554c-b9a2-64ba-35cf6dc15826	Alternacija-read	Alternacija - branje	f
00030000-554c-b9a2-6c20-a3c806d05cfe	Alternacija-write	Alternacija - spreminjanje	f
00030000-554c-b9a2-4732-b7b6f407f2f9	Arhivalija-read	Arhivalija - branje	f
00030000-554c-b9a2-adcf-03203828965c	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-554c-b9a2-9e1f-1169c643cfc1	Besedilo-read	Besedilo - branje	f
00030000-554c-b9a2-d075-a0b11de56158	Besedilo-write	Besedilo - spreminjanje	f
00030000-554c-b9a2-7b72-d3005244dccb	DogodekIzven-read	DogodekIzven - branje	f
00030000-554c-b9a3-3647-6f7c2f6b4686	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-554c-b9a3-fcb0-4fde147ac18e	Dogodek-read	Dogodek - branje	f
00030000-554c-b9a3-983a-ccb09e4e7585	Dogodek-write	Dogodek - spreminjanje	f
00030000-554c-b9a3-1940-660f225415fc	Drzava-read	Drzava - branje	f
00030000-554c-b9a3-bb11-142cbdd68645	Drzava-write	Drzava - spreminjanje	f
00030000-554c-b9a3-679d-b2ab6fd3867f	Funkcija-read	Funkcija - branje	f
00030000-554c-b9a3-583a-1657ff90fe0c	Funkcija-write	Funkcija - spreminjanje	f
00030000-554c-b9a3-fda1-39de565c5159	Gostovanje-read	Gostovanje - branje	f
00030000-554c-b9a3-0efb-830ab6011f76	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-554c-b9a3-9dd4-abbf69d8d0cf	Gostujoca-read	Gostujoca - branje	f
00030000-554c-b9a3-6ad9-e85d48ad6561	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-554c-b9a3-a483-b49444d48fcf	Kupec-read	Kupec - branje	f
00030000-554c-b9a3-bfa6-7c3f007ace94	Kupec-write	Kupec - spreminjanje	f
00030000-554c-b9a3-934c-2a6943360b02	NacinPlacina-read	NacinPlacina - branje	f
00030000-554c-b9a3-ee24-175de5979e40	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-554c-b9a3-4f05-22004d22e5dd	Option-read	Option - branje	f
00030000-554c-b9a3-3a35-9525ed873c0f	Option-write	Option - spreminjanje	f
00030000-554c-b9a3-384e-f1372f6c44d4	OptionValue-read	OptionValue - branje	f
00030000-554c-b9a3-5abc-181198492063	OptionValue-write	OptionValue - spreminjanje	f
00030000-554c-b9a3-2b27-13650ca22094	Oseba-read	Oseba - branje	f
00030000-554c-b9a3-2753-dfab5a965410	Oseba-write	Oseba - spreminjanje	f
00030000-554c-b9a3-05d6-558095831a4c	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-554c-b9a3-df67-072a61f5c074	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-554c-b9a3-23c6-1cdba8ef9eaf	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-554c-b9a3-043c-3bc1f0ccd722	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-554c-b9a3-5aa0-26bb841ec64c	Pogodba-read	Pogodba - branje	f
00030000-554c-b9a3-3058-c84f454fbf01	Pogodba-write	Pogodba - spreminjanje	f
00030000-554c-b9a3-7a27-5cbf87c600f2	Popa-read	Popa - branje	f
00030000-554c-b9a3-3b42-f0ee35f40433	Popa-write	Popa - spreminjanje	f
00030000-554c-b9a3-5847-8774a8ed41ba	Posta-read	Posta - branje	f
00030000-554c-b9a3-1039-ea675e40112f	Posta-write	Posta - spreminjanje	f
00030000-554c-b9a3-30fc-e3fa6ae727a8	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-554c-b9a3-efa7-a3cb45767026	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-554c-b9a3-a539-baa469bee0ae	PostniNaslov-read	PostniNaslov - branje	f
00030000-554c-b9a3-c003-5e62ed5fefc2	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-554c-b9a3-f12d-6a410e26f4ba	Predstava-read	Predstava - branje	f
00030000-554c-b9a3-7de3-65889a1ba049	Predstava-write	Predstava - spreminjanje	f
00030000-554c-b9a3-7eee-97ea056f4b88	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-554c-b9a3-9506-6f438dc25b74	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-554c-b9a3-c0de-9a3c449e54c0	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-554c-b9a3-5b3f-6ceeb7e2b0cd	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-554c-b9a3-49d6-a699ecc37aaf	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-554c-b9a3-a6fe-39f6109ab111	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-554c-b9a3-fa83-ac16c06c0e81	Prostor-read	Prostor - branje	f
00030000-554c-b9a3-0484-9673e649e484	Prostor-write	Prostor - spreminjanje	f
00030000-554c-b9a3-59b7-8de1a17a94c5	Racun-read	Racun - branje	f
00030000-554c-b9a3-45c9-168a0085bc2b	Racun-write	Racun - spreminjanje	f
00030000-554c-b9a3-41eb-5f4ce5b77d6f	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-554c-b9a3-057d-2d7e09d56dc4	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-554c-b9a3-d689-e4e9205ab2f5	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-554c-b9a3-ed1a-c6b56ab42531	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-554c-b9a3-caf4-610e9faa2bfc	Rekvizit-read	Rekvizit - branje	f
00030000-554c-b9a3-a0de-76002e709835	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-554c-b9a3-c404-935961d1ff77	Rezervacija-read	Rezervacija - branje	f
00030000-554c-b9a3-7ecc-0799fb6aa9e3	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-554c-b9a3-ad93-10be4f10b0f5	SedezniRed-read	SedezniRed - branje	f
00030000-554c-b9a3-58b8-c67db714be59	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-554c-b9a3-b23f-0acd3948dcc6	Sedez-read	Sedez - branje	f
00030000-554c-b9a3-324a-cc1714000d00	Sedez-write	Sedez - spreminjanje	f
00030000-554c-b9a3-435f-fa0cd72dd551	Sezona-read	Sezona - branje	f
00030000-554c-b9a3-32f8-eb6ba39e7443	Sezona-write	Sezona - spreminjanje	f
00030000-554c-b9a3-d677-1da1f7a6fd19	Telefonska-read	Telefonska - branje	f
00030000-554c-b9a3-1cfa-f4a17e519a60	Telefonska-write	Telefonska - spreminjanje	f
00030000-554c-b9a3-dc07-6df2215db9ab	TerminStoritve-read	TerminStoritve - branje	f
00030000-554c-b9a3-6a57-8255f63d82d6	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-554c-b9a3-36c4-5f1acb3cdd71	TipFunkcije-read	TipFunkcije - branje	f
00030000-554c-b9a3-d046-fe36b31dbfb0	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-554c-b9a3-6ac2-a2c1918a7156	Trr-read	Trr - branje	f
00030000-554c-b9a3-1f85-747999389f82	Trr-write	Trr - spreminjanje	f
00030000-554c-b9a3-8381-f289c1b95e0e	Uprizoritev-read	Uprizoritev - branje	f
00030000-554c-b9a3-7e04-68c47421d949	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-554c-b9a3-445d-dea5e17588bd	Vaja-read	Vaja - branje	f
00030000-554c-b9a3-7150-b2152869d2c0	Vaja-write	Vaja - spreminjanje	f
00030000-554c-b9a3-45ac-34dc88c8a36c	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-554c-b9a3-b339-e306ba8e2612	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-554c-b9a3-6c53-798b09c1a569	Zaposlitev-read	Zaposlitev - branje	f
00030000-554c-b9a3-b239-2a1e1e9e4ff8	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-554c-b9a3-9333-198f933de31c	Zasedenost-read	Zasedenost - branje	f
00030000-554c-b9a3-472d-49681b7dc193	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-554c-b9a3-aef9-84af71c84e07	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-554c-b9a3-dbfc-cfeb9c25fd4c	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-554c-b9a3-63a7-815a8ebe0d74	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-554c-b9a3-cc1d-430dd22283f4	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2635 (class 0 OID 2786062)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-554c-b9a3-c275-03470f0c0d48	00030000-554c-b9a3-1940-660f225415fc
00020000-554c-b9a3-775a-fc409d4b0ee9	00030000-554c-b9a3-bb11-142cbdd68645
00020000-554c-b9a3-775a-fc409d4b0ee9	00030000-554c-b9a3-1940-660f225415fc
\.


--
-- TOC entry 2663 (class 0 OID 2786350)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 2786380)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 2786491)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 2786120)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 2786162)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-554c-b9a2-c64d-4e6df787084a	8341	Adlešiči
00050000-554c-b9a2-da35-10ae48ed180d	5270	Ajdovščina
00050000-554c-b9a2-0088-f12ff7134be5	6280	Ankaran/Ancarano
00050000-554c-b9a2-60ea-7d9fd16e3ee9	9253	Apače
00050000-554c-b9a2-7459-9d652a27450a	8253	Artiče
00050000-554c-b9a2-b0c4-fb1ec282da29	4275	Begunje na Gorenjskem
00050000-554c-b9a2-4364-54454c1d4b29	1382	Begunje pri Cerknici
00050000-554c-b9a2-62fe-570a25e041b5	9231	Beltinci
00050000-554c-b9a2-ba50-b4243732c033	2234	Benedikt
00050000-554c-b9a2-82f3-b01021dc59f7	2345	Bistrica ob Dravi
00050000-554c-b9a2-283c-95851d5c872a	3256	Bistrica ob Sotli
00050000-554c-b9a2-7f4f-a47a1bf875c3	8259	Bizeljsko
00050000-554c-b9a2-838f-37a9e3052f00	1223	Blagovica
00050000-554c-b9a2-57da-eb62ff182eb1	8283	Blanca
00050000-554c-b9a2-d3fb-b179525a2cc1	4260	Bled
00050000-554c-b9a2-06b1-92de418f5ed4	4273	Blejska Dobrava
00050000-554c-b9a2-8e02-8451244cd59a	9265	Bodonci
00050000-554c-b9a2-9962-2f48eb076f14	9222	Bogojina
00050000-554c-b9a2-a6e0-24d2680b7f3e	4263	Bohinjska Bela
00050000-554c-b9a2-169c-694527c43faa	4264	Bohinjska Bistrica
00050000-554c-b9a2-03a4-728d273e83c5	4265	Bohinjsko jezero
00050000-554c-b9a2-436a-b97ae49456b7	1353	Borovnica
00050000-554c-b9a2-eef6-5c34debcd8ad	8294	Boštanj
00050000-554c-b9a2-a0e2-dd5d878766f8	5230	Bovec
00050000-554c-b9a2-eb29-cadbf37c72c5	5295	Branik
00050000-554c-b9a2-2b54-add3ba71eccd	3314	Braslovče
00050000-554c-b9a2-391a-f945973317a6	5223	Breginj
00050000-554c-b9a2-e2e9-591fff29190c	8280	Brestanica
00050000-554c-b9a2-6dc6-90c3bc41c626	2354	Bresternica
00050000-554c-b9a2-c48e-c95598963e0c	4243	Brezje
00050000-554c-b9a2-7158-3a4ce308252d	1351	Brezovica pri Ljubljani
00050000-554c-b9a2-028d-853756efa0f5	8250	Brežice
00050000-554c-b9a2-0e7f-7bb14c463e58	4210	Brnik - Aerodrom
00050000-554c-b9a2-58ae-db4eb234905c	8321	Brusnice
00050000-554c-b9a2-fca2-32ae16482424	3255	Buče
00050000-554c-b9a2-298e-edc09e2868bb	8276	Bučka 
00050000-554c-b9a2-da66-dc43b0bfa809	9261	Cankova
00050000-554c-b9a2-3a15-59144b3290e7	3000	Celje 
00050000-554c-b9a2-3673-087688761e4b	3001	Celje - poštni predali
00050000-554c-b9a2-c982-d4532f628845	4207	Cerklje na Gorenjskem
00050000-554c-b9a2-5f3d-64c85136aae3	8263	Cerklje ob Krki
00050000-554c-b9a2-95bb-85f15e5d2470	1380	Cerknica
00050000-554c-b9a2-fe54-f888b167e7c3	5282	Cerkno
00050000-554c-b9a2-8727-66e98732c7a1	2236	Cerkvenjak
00050000-554c-b9a2-e02c-981eecdfc65e	2215	Ceršak
00050000-554c-b9a2-edd5-e4b98797d782	2326	Cirkovce
00050000-554c-b9a2-64ce-7d06a980c519	2282	Cirkulane
00050000-554c-b9a2-da65-f1020fdb46fd	5273	Col
00050000-554c-b9a2-45fa-075984541d34	8251	Čatež ob Savi
00050000-554c-b9a2-a7d8-03a7eda84db2	1413	Čemšenik
00050000-554c-b9a2-5f64-b7fa809a20f1	5253	Čepovan
00050000-554c-b9a2-2cc7-9a9741e3a9f9	9232	Črenšovci
00050000-554c-b9a2-d8b2-b617757a7015	2393	Črna na Koroškem
00050000-554c-b9a2-8774-81239bc8f8bb	6275	Črni Kal
00050000-554c-b9a2-670e-274661cd59f5	5274	Črni Vrh nad Idrijo
00050000-554c-b9a2-9bb6-58c3af3f5003	5262	Črniče
00050000-554c-b9a2-f425-c7949212a5d6	8340	Črnomelj
00050000-554c-b9a2-ca9e-6306d84ad6f8	6271	Dekani
00050000-554c-b9a2-9f09-ea11240b65c0	5210	Deskle
00050000-554c-b9a2-ffa7-315d49d9b402	2253	Destrnik
00050000-554c-b9a2-bbc7-e90dddd7acd9	6215	Divača
00050000-554c-b9a2-ae25-bd89ddd0d22f	1233	Dob
00050000-554c-b9a2-07b1-1898947fe81b	3224	Dobje pri Planini
00050000-554c-b9a2-5cc1-a3e5ff8f4129	8257	Dobova
00050000-554c-b9a2-9384-e092df7b5533	1423	Dobovec
00050000-554c-b9a2-c35d-f6c79a6d7712	5263	Dobravlje
00050000-554c-b9a2-bfcf-114d1657b356	3204	Dobrna
00050000-554c-b9a2-3df9-b341fa5f8d41	8211	Dobrnič
00050000-554c-b9a2-5b0e-9b1387808381	1356	Dobrova
00050000-554c-b9a2-9482-f897419c879c	9223	Dobrovnik/Dobronak 
00050000-554c-b9a2-5d6b-3ff9d34330a1	5212	Dobrovo v Brdih
00050000-554c-b9a2-6c19-3a19e32e3c8c	1431	Dol pri Hrastniku
00050000-554c-b9a2-7658-954142b91fab	1262	Dol pri Ljubljani
00050000-554c-b9a2-9ed7-dc2b412698cd	1273	Dole pri Litiji
00050000-554c-b9a2-b554-88dfdb34d0c3	1331	Dolenja vas
00050000-554c-b9a2-552d-9cf6b429566b	8350	Dolenjske Toplice
00050000-554c-b9a2-7b46-058f420d0809	1230	Domžale
00050000-554c-b9a2-2e56-356107c4c81a	2252	Dornava
00050000-554c-b9a2-cf18-f40dd1497df2	5294	Dornberk
00050000-554c-b9a2-8aa7-c8dafb82b280	1319	Draga
00050000-554c-b9a2-1005-21fdb5a7397f	8343	Dragatuš
00050000-554c-b9a2-6ab7-74d32025ba72	3222	Dramlje
00050000-554c-b9a2-b958-57c9a7450ccd	2370	Dravograd
00050000-554c-b9a2-65c9-a6da9997a594	4203	Duplje
00050000-554c-b9a2-082e-e94f6e82d5b2	6221	Dutovlje
00050000-554c-b9a2-93d2-0f1dbd1d309e	8361	Dvor
00050000-554c-b9a2-1bfc-d0348a089b6b	2343	Fala
00050000-554c-b9a2-3a91-8ac4c96ffc0d	9208	Fokovci
00050000-554c-b9a2-eb24-86ffa732aa7f	2313	Fram
00050000-554c-b9a2-c19e-308f7afc65e3	3213	Frankolovo
00050000-554c-b9a2-3d3c-751c742845ac	1274	Gabrovka
00050000-554c-b9a2-7843-4a2c8459daea	8254	Globoko
00050000-554c-b9a2-805c-50bc13239b4e	5275	Godovič
00050000-554c-b9a2-07c8-55f267077501	4204	Golnik
00050000-554c-b9a2-93cc-1c7e2862c4ca	3303	Gomilsko
00050000-554c-b9a2-3e96-c0b485ac43d3	4224	Gorenja vas
00050000-554c-b9a2-4a65-575429b6a0b3	3263	Gorica pri Slivnici
00050000-554c-b9a2-5487-89a7d3b5ad93	2272	Gorišnica
00050000-554c-b9a2-6e6e-7df9491c93e1	9250	Gornja Radgona
00050000-554c-b9a2-5e17-f7dfa17e5bbd	3342	Gornji Grad
00050000-554c-b9a2-df69-7f051ef01d13	4282	Gozd Martuljek
00050000-554c-b9a2-e6b8-e297dfa7f651	6272	Gračišče
00050000-554c-b9a2-a8ce-ffcc851eaf01	9264	Grad
00050000-554c-b9a2-4863-c965be4e943c	8332	Gradac
00050000-554c-b9a2-f8a3-bf2d472ce0d5	1384	Grahovo
00050000-554c-b9a2-a423-49ee436654e8	5242	Grahovo ob Bači
00050000-554c-b9a2-3c27-88ffa0886648	5251	Grgar
00050000-554c-b9a2-5120-827fa5d561e5	3302	Griže
00050000-554c-b9a2-74b7-6e6ba9e64886	3231	Grobelno
00050000-554c-b9a2-4fbc-e4afdac187f2	1290	Grosuplje
00050000-554c-b9a2-52f7-bc3d3c0dd28c	2288	Hajdina
00050000-554c-b9a2-82ec-568746410272	8362	Hinje
00050000-554c-b9a2-4f8a-8bed667867b0	2311	Hoče
00050000-554c-b9a2-d9f5-0b3119886e50	9205	Hodoš/Hodos
00050000-554c-b9a2-397c-14b3e6add102	1354	Horjul
00050000-554c-b9a2-7896-8ad8aef62215	1372	Hotedršica
00050000-554c-b9a2-d217-d48bbfe538dd	1430	Hrastnik
00050000-554c-b9a2-6866-91e4d3cdbff8	6225	Hruševje
00050000-554c-b9a2-74a9-b8f582f8d6dc	4276	Hrušica
00050000-554c-b9a2-00e1-28a157df10e2	5280	Idrija
00050000-554c-b9a2-a4ad-ccb6e9cdb3d7	1292	Ig
00050000-554c-b9a2-2acd-4a99b5537f3c	6250	Ilirska Bistrica
00050000-554c-b9a2-e011-fc65643ba53e	6251	Ilirska Bistrica-Trnovo
00050000-554c-b9a2-8841-a1c680fce748	1295	Ivančna Gorica
00050000-554c-b9a2-0204-aebe2658b458	2259	Ivanjkovci
00050000-554c-b9a2-73c4-4247c3a3eb71	1411	Izlake
00050000-554c-b9a2-ee44-3feaaf5db989	6310	Izola/Isola
00050000-554c-b9a2-8e3c-d2ac15d47ce8	2222	Jakobski Dol
00050000-554c-b9a2-4cd9-06bd12ece33c	2221	Jarenina
00050000-554c-b9a2-ada9-b72e42fa246c	6254	Jelšane
00050000-554c-b9a2-a0ec-d1672952d68b	4270	Jesenice
00050000-554c-b9a2-3e5a-a0f0ac78f830	8261	Jesenice na Dolenjskem
00050000-554c-b9a2-e133-90bc5ae72c30	3273	Jurklošter
00050000-554c-b9a2-2ec9-e89b8f9df307	2223	Jurovski Dol
00050000-554c-b9a2-b627-61e8ee7ee0e6	2256	Juršinci
00050000-554c-b9a2-77b5-ae3a0378dc7e	5214	Kal nad Kanalom
00050000-554c-b9a2-2477-9a75013b31c0	3233	Kalobje
00050000-554c-b9a2-b362-b48f1f89f956	4246	Kamna Gorica
00050000-554c-b9a2-be19-bce872954455	2351	Kamnica
00050000-554c-b9a2-b4a7-18549cafe244	1241	Kamnik
00050000-554c-b9a2-6265-94cade2b4acf	5213	Kanal
00050000-554c-b9a2-45ca-8aa0d826409f	8258	Kapele
00050000-554c-b9a2-4de9-741d91bfe005	2362	Kapla
00050000-554c-b9a2-d03e-f5ebba7ab159	2325	Kidričevo
00050000-554c-b9a2-ad0a-b78f9cf9c68d	1412	Kisovec
00050000-554c-b9a2-cf20-dcf7776214a9	6253	Knežak
00050000-554c-b9a2-2b70-c9f0943f05ea	5222	Kobarid
00050000-554c-b9a2-d391-8e34f749ef57	9227	Kobilje
00050000-554c-b9a2-45dd-f112384d4c1c	1330	Kočevje
00050000-554c-b9a2-b88b-aa7fc00b5561	1338	Kočevska Reka
00050000-554c-b9a2-f3e0-f1c64da1e4a6	2276	Kog
00050000-554c-b9a2-df76-1269231659f8	5211	Kojsko
00050000-554c-b9a2-c0b1-f9b53d399459	6223	Komen
00050000-554c-b9a2-0739-581a7809f5cb	1218	Komenda
00050000-554c-b9a2-7ef4-e63705bd9e65	6000	Koper/Capodistria 
00050000-554c-b9a2-cacb-91a1b2df210b	6001	Koper/Capodistria - poštni predali
00050000-554c-b9a2-11fb-0260eb88427f	8282	Koprivnica
00050000-554c-b9a2-55d7-50d56399eae9	5296	Kostanjevica na Krasu
00050000-554c-b9a2-b7c0-3815cdb62606	8311	Kostanjevica na Krki
00050000-554c-b9a2-c7c6-d262c5b6deef	1336	Kostel
00050000-554c-b9a2-5caf-e502b9dbdf91	6256	Košana
00050000-554c-b9a2-9273-591e382df6c5	2394	Kotlje
00050000-554c-b9a2-d253-32cce2570297	6240	Kozina
00050000-554c-b9a2-9928-692b37c49a8c	3260	Kozje
00050000-554c-b9a2-4510-0d9dd345247c	4000	Kranj 
00050000-554c-b9a2-c916-49e18d1d09ae	4001	Kranj - poštni predali
00050000-554c-b9a2-d3c0-2a257779b0b9	4280	Kranjska Gora
00050000-554c-b9a2-e53b-1be5470779d4	1281	Kresnice
00050000-554c-b9a2-ce4a-7e29e210d554	4294	Križe
00050000-554c-b9a2-960c-7a2ee07e9708	9206	Križevci
00050000-554c-b9a2-b6d8-751b1388cf81	9242	Križevci pri Ljutomeru
00050000-554c-b9a2-1c29-aba8b0edec44	1301	Krka
00050000-554c-b9a2-9780-8fa0ab5cd1c4	8296	Krmelj
00050000-554c-b9a2-0960-be72422540a4	4245	Kropa
00050000-554c-b9a2-75af-11083a1b40c7	8262	Krška vas
00050000-554c-b9a2-2a72-34e6e8cc8671	8270	Krško
00050000-554c-b9a2-61f0-67b3b803ccdc	9263	Kuzma
00050000-554c-b9a2-07b8-255ddc13c4e6	2318	Laporje
00050000-554c-b9a2-9990-49304509f2df	3270	Laško
00050000-554c-b9a2-1b3f-0abd7fa4c98c	1219	Laze v Tuhinju
00050000-554c-b9a2-dc3e-67159005e9b4	2230	Lenart v Slovenskih goricah
00050000-554c-b9a2-3631-f7c6ed1dd0ab	9220	Lendava/Lendva
00050000-554c-b9a2-9eea-847081d71b91	4248	Lesce
00050000-554c-b9a2-ff2f-411c2f733396	3261	Lesično
00050000-554c-b9a2-06ee-33f9954f0c78	8273	Leskovec pri Krškem
00050000-554c-b9a2-5a36-d71127ac3c47	2372	Libeliče
00050000-554c-b9a2-1eac-200b6ff5bffe	2341	Limbuš
00050000-554c-b9a2-a13b-0e7f4a32a137	1270	Litija
00050000-554c-b9a2-40d6-5a5aa19d4903	3202	Ljubečna
00050000-554c-b9a2-8443-f49c7e9986d7	1000	Ljubljana 
00050000-554c-b9a2-139e-4169dda7dd03	1001	Ljubljana - poštni predali
00050000-554c-b9a2-4776-39a19a241214	1231	Ljubljana - Črnuče
00050000-554c-b9a2-67fc-dd8d19af8c0d	1261	Ljubljana - Dobrunje
00050000-554c-b9a2-0147-cc4a7495a678	1260	Ljubljana - Polje
00050000-554c-b9a2-dac4-ee3182d7cb85	1210	Ljubljana - Šentvid
00050000-554c-b9a2-0baf-11c3d93ac975	1211	Ljubljana - Šmartno
00050000-554c-b9a2-926d-ee4c49d29be9	3333	Ljubno ob Savinji
00050000-554c-b9a2-4834-71affdd624e1	9240	Ljutomer
00050000-554c-b9a2-0c83-bd72ebaaacf5	3215	Loče
00050000-554c-b9a2-647d-8b9479ffee20	5231	Log pod Mangartom
00050000-554c-b9a2-463d-184326621693	1358	Log pri Brezovici
00050000-554c-b9a2-de36-17e45765a95c	1370	Logatec
00050000-554c-b9a2-96b3-1573a241f0a0	1371	Logatec
00050000-554c-b9a2-17df-93af5542057b	1434	Loka pri Zidanem Mostu
00050000-554c-b9a2-8743-0d37f7f762c6	3223	Loka pri Žusmu
00050000-554c-b9a2-5e3b-af93f57e340d	6219	Lokev
00050000-554c-b9a2-2021-0518a52bc499	1318	Loški Potok
00050000-554c-b9a2-5a3b-80b8dd7f86bf	2324	Lovrenc na Dravskem polju
00050000-554c-b9a2-eec4-fa49459148b8	2344	Lovrenc na Pohorju
00050000-554c-b9a2-3320-2cdfea2d1171	3334	Luče
00050000-554c-b9a2-7af1-7f9bc959e53d	1225	Lukovica
00050000-554c-b9a2-e8a7-d2da0e1c7bab	9202	Mačkovci
00050000-554c-b9a2-2195-ab3cf0d3ed67	2322	Majšperk
00050000-554c-b9a2-3eb4-924b48eb7e55	2321	Makole
00050000-554c-b9a2-ff09-b49ca4d2fefe	9243	Mala Nedelja
00050000-554c-b9a2-34d9-c11e8f2f6388	2229	Malečnik
00050000-554c-b9a2-204c-f4039b7bb3fb	6273	Marezige
00050000-554c-b9a2-e216-c5d28c8ca189	2000	Maribor 
00050000-554c-b9a2-d681-9657a2cc4503	2001	Maribor - poštni predali
00050000-554c-b9a2-cd6c-705b7f06421f	2206	Marjeta na Dravskem polju
00050000-554c-b9a2-ed6c-080e9575b870	2281	Markovci
00050000-554c-b9a2-037e-051873731d36	9221	Martjanci
00050000-554c-b9a2-ff1e-e0959ff9f531	6242	Materija
00050000-554c-b9a2-d048-00ac8f3db00a	4211	Mavčiče
00050000-554c-b9a2-d119-2173bce7b879	1215	Medvode
00050000-554c-b9a2-91be-729a7af580eb	1234	Mengeš
00050000-554c-b9a2-2404-bdd5c60ad9f0	8330	Metlika
00050000-554c-b9a2-7680-084a965de4c1	2392	Mežica
00050000-554c-b9a2-1d13-9e2bac4d9eac	2204	Miklavž na Dravskem polju
00050000-554c-b9a2-8ad9-f96addbff6a5	2275	Miklavž pri Ormožu
00050000-554c-b9a2-0284-93a5b66e2f7b	5291	Miren
00050000-554c-b9a2-5715-cbd714deb476	8233	Mirna
00050000-554c-b9a2-f77f-a18b882a8d22	8216	Mirna Peč
00050000-554c-b9a2-67b3-c7c7abe8d077	2382	Mislinja
00050000-554c-b9a2-a076-abd2827a706e	4281	Mojstrana
00050000-554c-b9a2-8cda-e2fd15705d16	8230	Mokronog
00050000-554c-b9a2-2ae7-e2b915a538c3	1251	Moravče
00050000-554c-b9a2-4c59-6d646823eb2c	9226	Moravske Toplice
00050000-554c-b9a2-03a3-3ceb12ce9718	5216	Most na Soči
00050000-554c-b9a2-560e-5b8cdf98c278	1221	Motnik
00050000-554c-b9a2-1e93-5f80be1c7703	3330	Mozirje
00050000-554c-b9a2-b6a8-bafd67e9b5c3	9000	Murska Sobota 
00050000-554c-b9a2-e58a-222575861dfa	9001	Murska Sobota - poštni predali
00050000-554c-b9a2-c239-6d8752632f26	2366	Muta
00050000-554c-b9a2-7553-e1a0052b41c9	4202	Naklo
00050000-554c-b9a2-ff7c-84b3a3954f99	3331	Nazarje
00050000-554c-b9a2-44a4-5b463464df32	1357	Notranje Gorice
00050000-554c-b9a2-997d-6a2b43bb65bc	3203	Nova Cerkev
00050000-554c-b9a2-ae4c-4a2d2c4df6bd	5000	Nova Gorica 
00050000-554c-b9a2-d346-68b6718dca9b	5001	Nova Gorica - poštni predali
00050000-554c-b9a2-0b2d-05019408b539	1385	Nova vas
00050000-554c-b9a2-97dd-2371a59930ce	8000	Novo mesto
00050000-554c-b9a2-1680-d44555ecb03f	8001	Novo mesto - poštni predali
00050000-554c-b9a2-9b38-ecd7e057cbc0	6243	Obrov
00050000-554c-b9a2-d11b-ec0c1c081a6e	9233	Odranci
00050000-554c-b9a2-1edd-9d4276998d41	2317	Oplotnica
00050000-554c-b9a2-2ee0-78b2335320d7	2312	Orehova vas
00050000-554c-b9a2-f306-9e1afd44f76b	2270	Ormož
00050000-554c-b9a2-7b1a-19e128778c64	1316	Ortnek
00050000-554c-b9a2-1ad3-a92b9337af48	1337	Osilnica
00050000-554c-b9a2-a1be-44f6ffa8e236	8222	Otočec
00050000-554c-b9a2-d0d1-73ad2a0d4aaa	2361	Ožbalt
00050000-554c-b9a2-064b-0b2000f6e535	2231	Pernica
00050000-554c-b9a2-e497-4ea2100f1d93	2211	Pesnica pri Mariboru
00050000-554c-b9a2-61c6-75e91792bcb4	9203	Petrovci
00050000-554c-b9a2-f32d-039d77eedc0b	3301	Petrovče
00050000-554c-b9a2-72b1-0dddd4aff696	6330	Piran/Pirano
00050000-554c-b9a2-f215-01578223e4ea	8255	Pišece
00050000-554c-b9a2-dd8d-60750f6adb54	6257	Pivka
00050000-554c-b9a2-687f-41535ef04df0	6232	Planina
00050000-554c-b9a2-4a41-33a137a6565d	3225	Planina pri Sevnici
00050000-554c-b9a2-c673-2dc882c4f8a5	6276	Pobegi
00050000-554c-b9a2-3126-1323fc309547	8312	Podbočje
00050000-554c-b9a2-56e5-0235d8dd0403	5243	Podbrdo
00050000-554c-b9a2-9653-7d0c6fbb1045	3254	Podčetrtek
00050000-554c-b9a2-7aaf-56bfbb371ef3	2273	Podgorci
00050000-554c-b9a2-41c3-7a46fd4b7d61	6216	Podgorje
00050000-554c-b9a2-8e9a-55ce60f515a3	2381	Podgorje pri Slovenj Gradcu
00050000-554c-b9a2-755d-0a9f1fce4871	6244	Podgrad
00050000-554c-b9a2-c949-812a505cf389	1414	Podkum
00050000-554c-b9a2-98a6-959f0fb12f9a	2286	Podlehnik
00050000-554c-b9a2-4657-51a6caff7e97	5272	Podnanos
00050000-554c-b9a2-7f71-ec9d0bc484e2	4244	Podnart
00050000-554c-b9a2-dead-ae3669eb69c7	3241	Podplat
00050000-554c-b9a2-11b5-d070149db8a6	3257	Podsreda
00050000-554c-b9a2-e296-d6eab44c11e6	2363	Podvelka
00050000-554c-b9a2-2db8-3ea933426d9c	2208	Pohorje
00050000-554c-b9a2-716b-1ba5da0bd372	2257	Polenšak
00050000-554c-b9a2-d7f5-dc2e7300ae80	1355	Polhov Gradec
00050000-554c-b9a2-941c-83042cde1b3d	4223	Poljane nad Škofjo Loko
00050000-554c-b9a2-d92d-1a82d5322400	2319	Poljčane
00050000-554c-b9a2-dde9-76ef9429d936	1272	Polšnik
00050000-554c-b9a2-c530-14f32b49e061	3313	Polzela
00050000-554c-b9a2-1931-bb237eb61645	3232	Ponikva
00050000-554c-b9a2-47d1-e3566ce44487	6320	Portorož/Portorose
00050000-554c-b9a2-e17d-099d499769ef	6230	Postojna
00050000-554c-b9a2-46a1-eda29de452c6	2331	Pragersko
00050000-554c-b9a2-f304-baf3c274d117	3312	Prebold
00050000-554c-b9a2-73bd-9fd6f8f39713	4205	Preddvor
00050000-554c-b9a2-998a-c2e07f6b190d	6255	Prem
00050000-554c-b9a2-b86b-63fa1759dc0b	1352	Preserje
00050000-554c-b9a2-0258-3ccb40d43b46	6258	Prestranek
00050000-554c-b9a2-c7c7-9a2d7bdb74a5	2391	Prevalje
00050000-554c-b9a2-d06c-1902e7a3f788	3262	Prevorje
00050000-554c-b9a2-192e-b49478f42bbc	1276	Primskovo 
00050000-554c-b9a2-2d8e-b876796fa0d0	3253	Pristava pri Mestinju
00050000-554c-b9a2-230a-7c58130ff7cb	9207	Prosenjakovci/Partosfalva
00050000-554c-b9a2-9fe2-cfdfc6ecd0eb	5297	Prvačina
00050000-554c-b9a2-f7f3-6e02c1f96a11	2250	Ptuj
00050000-554c-b9a2-7c1d-8dacad773f2e	2323	Ptujska Gora
00050000-554c-b9a2-7862-e370e1fc172c	9201	Puconci
00050000-554c-b9a2-e423-98787d2bfcd8	2327	Rače
00050000-554c-b9a2-2569-2003bd69ae1e	1433	Radeče
00050000-554c-b9a2-e106-3730cb4136cd	9252	Radenci
00050000-554c-b9a2-e394-1d8121bf65b1	2360	Radlje ob Dravi
00050000-554c-b9a2-1919-5aa069bad214	1235	Radomlje
00050000-554c-b9a2-1dee-3f39895793ff	4240	Radovljica
00050000-554c-b9a2-ddd0-627f56a469f3	8274	Raka
00050000-554c-b9a2-a3d9-1af25d008423	1381	Rakek
00050000-554c-b9a2-fc59-797731b29d5d	4283	Rateče - Planica
00050000-554c-b9a2-1e40-9820f66189dc	2390	Ravne na Koroškem
00050000-554c-b9a2-87fe-069f7dd5e0fe	9246	Razkrižje
00050000-554c-b9a2-7a6c-ac1274d933d1	3332	Rečica ob Savinji
00050000-554c-b9a2-83fb-bed0b70ba290	5292	Renče
00050000-554c-b9a2-33be-4044d5f802e8	1310	Ribnica
00050000-554c-b9a2-77f6-8bbe13b3a0bd	2364	Ribnica na Pohorju
00050000-554c-b9a2-0316-72c562433f71	3272	Rimske Toplice
00050000-554c-b9a2-184e-ba327a012b2b	1314	Rob
00050000-554c-b9a2-25e1-b46d2454c704	5215	Ročinj
00050000-554c-b9a2-483a-96d1c351b55b	3250	Rogaška Slatina
00050000-554c-b9a2-efa6-47c0f31eae54	9262	Rogašovci
00050000-554c-b9a2-f2cb-6bc880692d30	3252	Rogatec
00050000-554c-b9a2-8da7-152294751e93	1373	Rovte
00050000-554c-b9a2-d005-bc8b808091ff	2342	Ruše
00050000-554c-b9a2-1b09-ea3abad47fef	1282	Sava
00050000-554c-b9a2-5d08-4ba60b09b392	6333	Sečovlje/Sicciole
00050000-554c-b9a2-8ae0-18f73e2d4c2f	4227	Selca
00050000-554c-b9a2-ca0c-71721d3a4663	2352	Selnica ob Dravi
00050000-554c-b9a2-f3da-ba3eb56ffe83	8333	Semič
00050000-554c-b9a2-3252-35a6b37683cb	8281	Senovo
00050000-554c-b9a2-16d1-01aa0ad66cca	6224	Senožeče
00050000-554c-b9a2-913b-7ac7a5fdf78d	8290	Sevnica
00050000-554c-b9a2-fbd5-d605bfdb2da3	6210	Sežana
00050000-554c-b9a2-a462-b67703614271	2214	Sladki Vrh
00050000-554c-b9a2-bf74-1aa02c24497b	5283	Slap ob Idrijci
00050000-554c-b9a2-c0aa-91b6734b994c	2380	Slovenj Gradec
00050000-554c-b9a2-13b1-d00363efafa4	2310	Slovenska Bistrica
00050000-554c-b9a2-3e26-1df55aaa2dd5	3210	Slovenske Konjice
00050000-554c-b9a2-ec30-ed0da2d4da8f	1216	Smlednik
00050000-554c-b9a2-1dc0-bcdad1c084d9	5232	Soča
00050000-554c-b9a2-9387-a880852eb19f	1317	Sodražica
00050000-554c-b9a2-ae57-46daabd970af	3335	Solčava
00050000-554c-b9a2-02c2-583e2367e3d9	5250	Solkan
00050000-554c-b9a2-38ba-1f1aa9424ed5	4229	Sorica
00050000-554c-b9a2-3fc5-cd0040e56845	4225	Sovodenj
00050000-554c-b9a2-56e7-14a9a7972a12	5281	Spodnja Idrija
00050000-554c-b9a2-99c7-1b97b127074d	2241	Spodnji Duplek
00050000-554c-b9a2-0268-dc66defd17d8	9245	Spodnji Ivanjci
00050000-554c-b9a2-1dab-07a13760e38a	2277	Središče ob Dravi
00050000-554c-b9a2-7dc3-bdbf9261dc6d	4267	Srednja vas v Bohinju
00050000-554c-b9a2-904b-b4efa5ffa01a	8256	Sromlje 
00050000-554c-b9a2-c4e6-965488a70b57	5224	Srpenica
00050000-554c-b9a2-f33d-381918a2dd58	1242	Stahovica
00050000-554c-b9a2-9930-65b5fbe0f756	1332	Stara Cerkev
00050000-554c-b9a2-25b0-6b79dcc7d4d5	8342	Stari trg ob Kolpi
00050000-554c-b9a2-43f1-84d5847a91f5	1386	Stari trg pri Ložu
00050000-554c-b9a2-b093-88e7ff973af9	2205	Starše
00050000-554c-b9a2-1d7f-9795a0a84e6e	2289	Stoperce
00050000-554c-b9a2-9250-eb1f5af0f285	8322	Stopiče
00050000-554c-b9a2-e5d4-50dad8a88b82	3206	Stranice
00050000-554c-b9a2-d428-ffdddfe7d6fd	8351	Straža
00050000-554c-b9a2-5c20-d01e0ce75d95	1313	Struge
00050000-554c-b9a2-a8f9-41eefc435878	8293	Studenec
00050000-554c-b9a2-588f-5d0c305da490	8331	Suhor
00050000-554c-b9a2-9139-676f41fb5757	2233	Sv. Ana v Slovenskih goricah
00050000-554c-b9a2-ad78-3b07776824ed	2235	Sv. Trojica v Slovenskih goricah
00050000-554c-b9a2-1e00-3c22b77e9ddc	2353	Sveti Duh na Ostrem Vrhu
00050000-554c-b9a2-ce74-1130eb8157e8	9244	Sveti Jurij ob Ščavnici
00050000-554c-b9a2-a010-73376d82fe9b	3264	Sveti Štefan
00050000-554c-b9a2-5710-b05d25116a38	2258	Sveti Tomaž
00050000-554c-b9a2-d264-b80cf3dc728b	9204	Šalovci
00050000-554c-b9a2-29f7-ccf94093fe32	5261	Šempas
00050000-554c-b9a2-8f63-7dc2e0daa020	5290	Šempeter pri Gorici
00050000-554c-b9a2-e114-fcc9cad80a3d	3311	Šempeter v Savinjski dolini
00050000-554c-b9a2-47ab-bec92c63171e	4208	Šenčur
00050000-554c-b9a2-31a1-e5f69514e104	2212	Šentilj v Slovenskih goricah
00050000-554c-b9a2-be5f-73426bbd1ccf	8297	Šentjanž
00050000-554c-b9a2-d3d8-0c51e12cfb0f	2373	Šentjanž pri Dravogradu
00050000-554c-b9a2-4ff7-2934e308b143	8310	Šentjernej
00050000-554c-b9a2-8568-d0e644efc086	3230	Šentjur
00050000-554c-b9a2-30fc-693879be324c	3271	Šentrupert
00050000-554c-b9a2-6b16-5e6b9fa073f5	8232	Šentrupert
00050000-554c-b9a2-9f59-0d4d281427ba	1296	Šentvid pri Stični
00050000-554c-b9a2-5c99-bac59eb5f616	8275	Škocjan
00050000-554c-b9a2-2d4c-b64dd2203491	6281	Škofije
00050000-554c-b9a2-6265-91b43f922800	4220	Škofja Loka
00050000-554c-b9a2-d2ac-87a87d245c1a	3211	Škofja vas
00050000-554c-b9a2-a5a2-e483792f2eab	1291	Škofljica
00050000-554c-b9a2-59c3-1317d91f1afa	6274	Šmarje
00050000-554c-b9a2-8782-9c83369a879f	1293	Šmarje - Sap
00050000-554c-b9a2-7c23-df0bc766b785	3240	Šmarje pri Jelšah
00050000-554c-b9a2-a62b-b528c1231cfa	8220	Šmarješke Toplice
00050000-554c-b9a2-bcc5-7ca70b1cbd3d	2315	Šmartno na Pohorju
00050000-554c-b9a2-174a-e02ee29e52d7	3341	Šmartno ob Dreti
00050000-554c-b9a2-5117-6b33c3d9516e	3327	Šmartno ob Paki
00050000-554c-b9a2-0d87-be420f45b73c	1275	Šmartno pri Litiji
00050000-554c-b9a2-54ec-e0447b6ee61c	2383	Šmartno pri Slovenj Gradcu
00050000-554c-b9a2-b3e5-4f951d2f3473	3201	Šmartno v Rožni dolini
00050000-554c-b9a2-5dd5-22db54f818fb	3325	Šoštanj
00050000-554c-b9a2-c08d-c70005110e7f	6222	Štanjel
00050000-554c-b9a2-9881-9afbbb55ab65	3220	Štore
00050000-554c-b9a2-ff90-c7f6184ee539	3304	Tabor
00050000-554c-b9a2-9686-38a78f32bfa8	3221	Teharje
00050000-554c-b9a2-eeaf-f368bab76686	9251	Tišina
00050000-554c-b9a2-c69f-95a74319ae00	5220	Tolmin
00050000-554c-b9a2-6ed5-dea1e8072ab2	3326	Topolšica
00050000-554c-b9a2-4cba-74f5f0bacf46	2371	Trbonje
00050000-554c-b9a2-d9d5-934754cbcbaa	1420	Trbovlje
00050000-554c-b9a2-4c66-cb6e447eae32	8231	Trebelno 
00050000-554c-b9a2-aada-ffbba8a725f0	8210	Trebnje
00050000-554c-b9a2-1259-6003efa29279	5252	Trnovo pri Gorici
00050000-554c-b9a2-29d3-ac34d33f4d35	2254	Trnovska vas
00050000-554c-b9a2-e369-0e1c026b198a	1222	Trojane
00050000-554c-b9a2-cf77-7a860dea057b	1236	Trzin
00050000-554c-b9a2-893a-3a809839d047	4290	Tržič
00050000-554c-b9a2-3ae2-f21a0b08e784	8295	Tržišče
00050000-554c-b9a2-2bfa-10a920baafea	1311	Turjak
00050000-554c-b9a2-ba72-22d79a070319	9224	Turnišče
00050000-554c-b9a2-097a-002f71da1372	8323	Uršna sela
00050000-554c-b9a2-69db-79d2b0ae1570	1252	Vače
00050000-554c-b9a2-a041-93f5224cf2cd	3320	Velenje 
00050000-554c-b9a2-402b-68fc481ab9d6	3322	Velenje - poštni predali
00050000-554c-b9a2-0c77-73dd9e0cbfd2	8212	Velika Loka
00050000-554c-b9a2-7c9e-72f99b90ba56	2274	Velika Nedelja
00050000-554c-b9a2-875d-c5125a26bb5f	9225	Velika Polana
00050000-554c-b9a2-a0a1-f97198040633	1315	Velike Lašče
00050000-554c-b9a2-c0c2-09bd55c3cdf0	8213	Veliki Gaber
00050000-554c-b9a2-8b9f-7dfc5c7a3e6b	9241	Veržej
00050000-554c-b9a2-9990-467586545a1c	1312	Videm - Dobrepolje
00050000-554c-b9a2-35f0-74cc0ce4fb1d	2284	Videm pri Ptuju
00050000-554c-b9a2-3cb3-113da3e9198f	8344	Vinica
00050000-554c-b9a2-2e65-8f12298298b4	5271	Vipava
00050000-554c-b9a2-593f-fcf57c8bb3c1	4212	Visoko
00050000-554c-b9a2-7723-a74d52a91afb	1294	Višnja Gora
00050000-554c-b9a2-f137-aa4d2d8ca102	3205	Vitanje
00050000-554c-b9a2-efbb-ae4ec934627b	2255	Vitomarci
00050000-554c-b9a2-f2ed-b7574860846f	1217	Vodice
00050000-554c-b9a2-f026-c8201b3de976	3212	Vojnik\t
00050000-554c-b9a2-29f0-da703cde3b1f	5293	Volčja Draga
00050000-554c-b9a2-4a6f-6eb483c51139	2232	Voličina
00050000-554c-b9a2-95c3-fbafae98c2f9	3305	Vransko
00050000-554c-b9a2-79fd-190a2dba0bd4	6217	Vremski Britof
00050000-554c-b9a2-fbdb-a82985d322ae	1360	Vrhnika
00050000-554c-b9a2-2492-830ca5d475be	2365	Vuhred
00050000-554c-b9a2-9afd-685b84f6514c	2367	Vuzenica
00050000-554c-b9a2-2349-d493c010ad41	8292	Zabukovje 
00050000-554c-b9a2-4dbe-847c612e5be2	1410	Zagorje ob Savi
00050000-554c-b9a2-f829-eba28facef66	1303	Zagradec
00050000-554c-b9a2-caa7-51a5ec3964b6	2283	Zavrč
00050000-554c-b9a2-f638-4ef1e23e0f84	8272	Zdole 
00050000-554c-b9a2-31b8-f590eb34ae28	4201	Zgornja Besnica
00050000-554c-b9a2-3b6b-32075d4ee8db	2242	Zgornja Korena
00050000-554c-b9a2-6ae0-6600cb8943ab	2201	Zgornja Kungota
00050000-554c-b9a2-eecb-7aed522f56ef	2316	Zgornja Ložnica
00050000-554c-b9a2-1790-d2dc02cbc7db	2314	Zgornja Polskava
00050000-554c-b9a2-ba46-7458d0faa275	2213	Zgornja Velka
00050000-554c-b9a2-8ef8-635fd648f40c	4247	Zgornje Gorje
00050000-554c-b9a2-90cd-b4ddfdef537e	4206	Zgornje Jezersko
00050000-554c-b9a2-9da1-db6d840cc305	2285	Zgornji Leskovec
00050000-554c-b9a2-383b-541104ed3293	1432	Zidani Most
00050000-554c-b9a2-bd10-8dc74bf8f6d4	3214	Zreče
00050000-554c-b9a2-a850-48ceb0d6f7b2	4209	Žabnica
00050000-554c-b9a2-051f-b70a85129745	3310	Žalec
00050000-554c-b9a2-4c0d-25e79cf5e4d6	4228	Železniki
00050000-554c-b9a2-ee1a-02181d3a39f7	2287	Žetale
00050000-554c-b9a2-5931-c9b75ee19cdf	4226	Žiri
00050000-554c-b9a2-4132-3b68edf8aa2a	4274	Žirovnica
00050000-554c-b9a2-d25a-54f7b3316b23	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 2786324)
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
-- TOC entry 2642 (class 0 OID 2786147)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 2786213)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 2786336)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 2786440)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 2786484)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 2786365)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 2786309)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 2786299)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 2786474)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 2786430)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 2786013)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-554c-b9a3-4d52-68d0e291d7e3	00010000-554c-b9a3-40dd-4d27a6b8de6f	2015-05-08 15:26:59	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROAU4/AVP3tXvaX0qdPD097DENhHs0fQ2";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 2786374)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 2786053)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-554c-b9a3-d493-912277be3961	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-554c-b9a3-8d93-bbf698074f70	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-554c-b9a3-c275-03470f0c0d48	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-554c-b9a3-b196-798496a24c6a	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-554c-b9a3-4030-44d2bd17923c	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-554c-b9a3-775a-fc409d4b0ee9	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 2786036)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-554c-b9a3-4d52-68d0e291d7e3	00020000-554c-b9a3-b196-798496a24c6a
00010000-554c-b9a3-40dd-4d27a6b8de6f	00020000-554c-b9a3-b196-798496a24c6a
\.


--
-- TOC entry 2668 (class 0 OID 2786388)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 2786330)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 2786280)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 2786112)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 2786286)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 2786465)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 2786182)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 2786022)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-554c-b9a3-40dd-4d27a6b8de6f	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROwMkQMKT6ZzctTl0HQv9XvmPwWTJv8uO	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-554c-b9a3-4d52-68d0e291d7e3	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 2786516)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 2786228)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 2786357)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 2786422)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 2786256)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 2786506)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 2786413)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2274 (class 2606 OID 2786077)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 2786555)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 2786548)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 2786464)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 2786246)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2343 (class 2606 OID 2786279)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 2786208)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 2786409)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 2786226)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 2786273)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2247 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 2786322)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 2786349)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2303 (class 2606 OID 2786180)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2278 (class 2606 OID 2786086)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2293 (class 2606 OID 2786144)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2280 (class 2606 OID 2786110)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2272 (class 2606 OID 2786066)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2264 (class 2606 OID 2786051)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 2786355)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 2786387)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 2786501)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2288 (class 2606 OID 2786137)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 2786168)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 2786328)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2253 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 2786158)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 2786217)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 2786340)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 2786446)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 2786489)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 2786372)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 2786313)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 2786304)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 2786483)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 2786437)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 2786021)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 2786378)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2262 (class 2606 OID 2786040)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2267 (class 2606 OID 2786060)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2395 (class 2606 OID 2786396)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 2786335)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 2786285)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2285 (class 2606 OID 2786117)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 2786295)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 2786473)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2308 (class 2606 OID 2786193)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2258 (class 2606 OID 2786034)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 2786530)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 2786232)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 2786363)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 2786428)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 2786268)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 2786515)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 2786421)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 1259 OID 2786253)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2286 (class 1259 OID 2786139)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2249 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2250 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2251 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2377 (class 1259 OID 2786356)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2371 (class 1259 OID 2786342)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2372 (class 1259 OID 2786341)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2323 (class 1259 OID 2786233)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 2786412)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2399 (class 1259 OID 2786410)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 2786411)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2423 (class 1259 OID 2786503)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2424 (class 1259 OID 2786504)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2425 (class 1259 OID 2786505)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 2786533)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 2786532)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 2786531)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2305 (class 1259 OID 2786195)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2306 (class 1259 OID 2786194)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2290 (class 1259 OID 2786146)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 2786145)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2386 (class 1259 OID 2786379)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2341 (class 1259 OID 2786274)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2269 (class 1259 OID 2786067)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2270 (class 1259 OID 2786068)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2391 (class 1259 OID 2786399)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2392 (class 1259 OID 2786398)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2393 (class 1259 OID 2786397)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2315 (class 1259 OID 2786218)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2316 (class 1259 OID 2786220)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2317 (class 1259 OID 2786219)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2351 (class 1259 OID 2786308)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2352 (class 1259 OID 2786306)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2353 (class 1259 OID 2786305)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2354 (class 1259 OID 2786307)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2259 (class 1259 OID 2786041)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2260 (class 1259 OID 2786042)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2380 (class 1259 OID 2786364)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2366 (class 1259 OID 2786329)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2406 (class 1259 OID 2786438)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2407 (class 1259 OID 2786439)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2294 (class 1259 OID 2786160)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2295 (class 1259 OID 2786159)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2296 (class 1259 OID 2786161)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2410 (class 1259 OID 2786447)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2411 (class 1259 OID 2786448)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 2786558)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 2786557)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 2786560)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 2786556)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2446 (class 1259 OID 2786559)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2403 (class 1259 OID 2786429)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2357 (class 1259 OID 2786317)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2358 (class 1259 OID 2786316)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2359 (class 1259 OID 2786314)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2360 (class 1259 OID 2786315)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2245 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 2786550)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 2786549)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2322 (class 1259 OID 2786227)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2275 (class 1259 OID 2786088)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2276 (class 1259 OID 2786087)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2282 (class 1259 OID 2786118)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2283 (class 1259 OID 2786119)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2346 (class 1259 OID 2786298)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2347 (class 1259 OID 2786297)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2348 (class 1259 OID 2786296)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2329 (class 1259 OID 2786255)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2330 (class 1259 OID 2786251)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2331 (class 1259 OID 2786248)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2332 (class 1259 OID 2786249)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2333 (class 1259 OID 2786247)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2334 (class 1259 OID 2786252)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2335 (class 1259 OID 2786250)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2289 (class 1259 OID 2786138)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2311 (class 1259 OID 2786209)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 2786211)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2313 (class 1259 OID 2786210)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2314 (class 1259 OID 2786212)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2365 (class 1259 OID 2786323)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2428 (class 1259 OID 2786502)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2281 (class 1259 OID 2786111)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2304 (class 1259 OID 2786181)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2256 (class 1259 OID 2786035)
-- Name: uniq_7fb775b7e7927c74; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7e7927c74 ON uporabniki USING btree (email);


--
-- TOC entry 2385 (class 1259 OID 2786373)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2265 (class 1259 OID 2786052)
-- Name: uniq_af14917a5e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_af14917a5e237e06 ON permission USING btree (name);


--
-- TOC entry 2248 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2301 (class 1259 OID 2786169)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2422 (class 1259 OID 2786490)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2268 (class 1259 OID 2786061)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2336 (class 1259 OID 2786254)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2471 (class 2606 OID 2786691)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 2786676)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 2786681)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2469 (class 2606 OID 2786701)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2475 (class 2606 OID 2786671)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2470 (class 2606 OID 2786696)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 2786686)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 2786606)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 2786786)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2490 (class 2606 OID 2786781)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2491 (class 2606 OID 2786776)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 2786666)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2498 (class 2606 OID 2786826)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 2786816)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 2786821)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 2786766)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 2786861)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 2786866)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 2786871)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2510 (class 2606 OID 2786886)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 2786881)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 2786876)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2462 (class 2606 OID 2786641)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 2786636)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 2786616)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 2786611)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 2786591)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 2786796)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 2786706)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 2786571)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2449 (class 2606 OID 2786576)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2495 (class 2606 OID 2786811)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 2786806)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 2786801)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 2786646)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 2786656)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 2786651)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2480 (class 2606 OID 2786741)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2482 (class 2606 OID 2786731)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2483 (class 2606 OID 2786726)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2481 (class 2606 OID 2786736)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 2786561)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2447 (class 2606 OID 2786566)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 2786791)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 2786771)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2503 (class 2606 OID 2786836)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2502 (class 2606 OID 2786841)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 2786626)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 2786621)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 2786631)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2505 (class 2606 OID 2786846)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 2786851)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 2786911)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 2786906)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2515 (class 2606 OID 2786921)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 2786901)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2516 (class 2606 OID 2786916)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 2786831)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 2786761)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2485 (class 2606 OID 2786756)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 2786746)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2486 (class 2606 OID 2786751)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2513 (class 2606 OID 2786896)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2514 (class 2606 OID 2786891)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 2786661)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 2786856)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 2786586)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 2786581)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2455 (class 2606 OID 2786596)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 2786601)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2477 (class 2606 OID 2786721)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 2786716)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 2786711)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-08 15:27:00 CEST

--
-- PostgreSQL database dump complete
--

