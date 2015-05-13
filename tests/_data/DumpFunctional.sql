--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-12 16:29:05 CEST

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
-- TOC entry 179 (class 1259 OID 3250747)
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
-- TOC entry 225 (class 1259 OID 3251234)
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
-- TOC entry 224 (class 1259 OID 3251217)
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
-- TOC entry 217 (class 1259 OID 3251128)
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
-- TOC entry 193 (class 1259 OID 3250912)
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
-- TOC entry 196 (class 1259 OID 3250953)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 3250874)
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
-- TOC entry 212 (class 1259 OID 3251078)
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
-- TOC entry 191 (class 1259 OID 3250899)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 3250947)
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
-- TOC entry 201 (class 1259 OID 3250996)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 3251021)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 3250848)
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
-- TOC entry 180 (class 1259 OID 3250756)
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
-- TOC entry 181 (class 1259 OID 3250767)
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
-- TOC entry 184 (class 1259 OID 3250818)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 3250721)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 3250740)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 3251028)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 3251058)
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
-- TOC entry 221 (class 1259 OID 3251173)
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
-- TOC entry 183 (class 1259 OID 3250798)
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
-- TOC entry 186 (class 1259 OID 3250840)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 3251002)
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
-- TOC entry 185 (class 1259 OID 3250825)
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
-- TOC entry 190 (class 1259 OID 3250891)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 3251014)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 3251119)
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
-- TOC entry 220 (class 1259 OID 3251166)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 3251043)
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
-- TOC entry 200 (class 1259 OID 3250987)
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
-- TOC entry 199 (class 1259 OID 3250977)
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
-- TOC entry 219 (class 1259 OID 3251156)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 3251109)
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
-- TOC entry 173 (class 1259 OID 3250692)
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
-- TOC entry 172 (class 1259 OID 3250690)
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
-- TOC entry 209 (class 1259 OID 3251052)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 3250730)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 3250714)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 3251066)
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
-- TOC entry 203 (class 1259 OID 3251008)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 3250958)
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
-- TOC entry 182 (class 1259 OID 3250790)
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
-- TOC entry 198 (class 1259 OID 3250964)
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
-- TOC entry 218 (class 1259 OID 3251144)
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
-- TOC entry 188 (class 1259 OID 3250860)
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
-- TOC entry 174 (class 1259 OID 3250701)
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
-- TOC entry 223 (class 1259 OID 3251198)
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
-- TOC entry 192 (class 1259 OID 3250906)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 3251035)
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
-- TOC entry 214 (class 1259 OID 3251101)
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
-- TOC entry 194 (class 1259 OID 3250934)
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
-- TOC entry 222 (class 1259 OID 3251188)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 3251091)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 3250695)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2640 (class 0 OID 3250747)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2686 (class 0 OID 3251234)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2685 (class 0 OID 3251217)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 3251128)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 3250912)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 3250953)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 3250874)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5552-0e30-213e-8b215d3866d6	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5552-0e30-0ae7-628b4ae2dbeb	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5552-0e30-0f85-e65b561602a4	AL	ALB	008	Albania 	Albanija	\N
00040000-5552-0e30-4e45-bf8bcdfe6028	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5552-0e30-9cc9-02c6319364ea	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5552-0e30-92f8-884c8fa7ba2d	AD	AND	020	Andorra 	Andora	\N
00040000-5552-0e30-ea67-ca17fa0e27ce	AO	AGO	024	Angola 	Angola	\N
00040000-5552-0e30-c79f-2190ccb036e1	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5552-0e30-d55f-287a5b6af56e	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5552-0e30-cd65-f7a0c2a6de5b	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5552-0e30-b3bc-de90b0b57c08	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5552-0e30-2f58-e2575304162e	AM	ARM	051	Armenia 	Armenija	\N
00040000-5552-0e30-623c-918f22565d12	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5552-0e30-e0db-1877138e8bc9	AU	AUS	036	Australia 	Avstralija	\N
00040000-5552-0e30-8346-c2131319e892	AT	AUT	040	Austria 	Avstrija	\N
00040000-5552-0e30-fdaa-918a1f7e83e3	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5552-0e30-7d99-d99e35284c2e	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5552-0e30-bd30-684710e92993	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5552-0e30-cc89-971ffc63731d	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5552-0e30-114e-953caadbf864	BB	BRB	052	Barbados 	Barbados	\N
00040000-5552-0e30-2076-f97aea3963f2	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5552-0e30-8602-e92861b70382	BE	BEL	056	Belgium 	Belgija	\N
00040000-5552-0e30-f22c-6b7f78dfe381	BZ	BLZ	084	Belize 	Belize	\N
00040000-5552-0e30-ea62-2bcd6e5397f8	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5552-0e30-71ec-fd5050f4456e	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5552-0e30-b5f2-68ba7cfd178c	BT	BTN	064	Bhutan 	Butan	\N
00040000-5552-0e30-0be4-39476e40eda5	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5552-0e30-8a01-ec57fa43827d	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5552-0e30-06b1-0583af36a1ce	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5552-0e30-99c9-e2a66fe927d4	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5552-0e30-c610-07e2374c4c2a	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5552-0e30-257a-81d73e8907b3	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5552-0e30-6d46-702f84e5eb30	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5552-0e30-766c-44d59cb7ae9e	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5552-0e30-9e65-afc31730bfdf	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5552-0e30-2295-967d0e18efb4	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5552-0e30-268c-731f3df7dfc3	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5552-0e30-217c-7eb821bc4f3a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5552-0e30-53c7-18c6361d0450	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5552-0e30-ac30-67ac97cef402	CA	CAN	124	Canada 	Kanada	\N
00040000-5552-0e30-9389-9feee60bc2ea	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5552-0e30-c1a8-96aa14c9cef1	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5552-0e30-0f51-3872c265fa2c	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5552-0e30-381a-66870475bebe	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5552-0e30-f419-3acfb98df4a4	CL	CHL	152	Chile 	Čile	\N
00040000-5552-0e30-547b-e10aefb38fff	CN	CHN	156	China 	Kitajska	\N
00040000-5552-0e30-1e4f-aa4d8cff3f0b	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5552-0e30-5605-f60de2865fe0	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5552-0e30-db8d-d66f578d1284	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5552-0e30-7cce-488afe728ab8	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5552-0e30-2d6f-7a68eb60722e	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5552-0e30-5e9f-22ea8deb4ab2	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5552-0e30-0221-a9d6818a0578	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5552-0e30-2e44-a26fc0898507	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5552-0e30-de2a-12d8e57b6cdb	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5552-0e30-992f-842c4b286745	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5552-0e30-58bc-e08c462ca6f7	CU	CUB	192	Cuba 	Kuba	\N
00040000-5552-0e30-81ce-ce874049e564	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5552-0e30-b450-533468655bb1	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5552-0e30-d51a-b2b4042ee5da	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5552-0e30-803c-3014f164d237	DK	DNK	208	Denmark 	Danska	\N
00040000-5552-0e30-5d90-ea92619f1226	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5552-0e30-c48a-a0452dd6a661	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5552-0e30-1ea7-43420c435040	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5552-0e30-19f2-fe3d211c73ca	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5552-0e30-69d7-d15710ad553d	EG	EGY	818	Egypt 	Egipt	\N
00040000-5552-0e30-6463-981008bf3891	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5552-0e30-34ec-097e4a25fc7e	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5552-0e30-05cd-152f833bf109	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5552-0e30-f759-5c5f7ee1520d	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5552-0e30-6cf7-c4c9faa30b00	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5552-0e30-b941-df31ad327758	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5552-0e30-1d14-a135a7a38d81	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5552-0e30-8a7c-e020b7b7a80d	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5552-0e30-6c8c-0b6509ecd382	FI	FIN	246	Finland 	Finska	\N
00040000-5552-0e30-90e4-b3684eea2880	FR	FRA	250	France 	Francija	\N
00040000-5552-0e30-7f3a-e7b488920453	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5552-0e30-7975-6f97cde391e1	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5552-0e30-a9ab-b3e5fd2d2754	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5552-0e30-4b23-f663f45dfb91	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5552-0e30-8a31-ae907b9ba2ec	GA	GAB	266	Gabon 	Gabon	\N
00040000-5552-0e30-f9e0-506ae92eadaa	GM	GMB	270	Gambia 	Gambija	\N
00040000-5552-0e30-d254-fbb0340f705b	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5552-0e30-4054-c0d7c0132f0d	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5552-0e30-ae81-1f6df9db8c3c	GH	GHA	288	Ghana 	Gana	\N
00040000-5552-0e30-6768-81483532cd9c	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5552-0e30-d7a2-32b7d2f757ed	GR	GRC	300	Greece 	Grčija	\N
00040000-5552-0e30-789f-072f3bc8679f	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5552-0e30-27ea-9a3b4571ffc1	GD	GRD	308	Grenada 	Grenada	\N
00040000-5552-0e30-3967-e32de8fbfe41	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5552-0e30-31f2-07b19402cd23	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5552-0e30-b60e-ad010bc05546	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5552-0e30-e6b5-2d3b83bffbfb	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5552-0e30-a745-1f2e0ada842b	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5552-0e30-2040-b04dbe7e4724	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5552-0e30-47f3-b23e2b27ae7a	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5552-0e30-8672-449f844bf053	HT	HTI	332	Haiti 	Haiti	\N
00040000-5552-0e30-0290-3b89de4e70a1	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5552-0e30-9cdc-38c79faeea5e	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5552-0e30-a07f-43a468c62dfa	HN	HND	340	Honduras 	Honduras	\N
00040000-5552-0e30-c960-f654afc4ed02	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5552-0e30-111a-4d4b13646699	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5552-0e30-8e81-9a81b3d3b75a	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5552-0e30-4bcf-9bc97872c653	IN	IND	356	India 	Indija	\N
00040000-5552-0e30-3b4c-2e220c72d7c5	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5552-0e30-c39a-625e7a204553	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5552-0e30-8a1c-ebdbc8ab63ac	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5552-0e30-ba27-65ad2b2a3e2b	IE	IRL	372	Ireland 	Irska	\N
00040000-5552-0e30-e55b-74da2c2035cc	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5552-0e30-5304-1ce558af8eee	IL	ISR	376	Israel 	Izrael	\N
00040000-5552-0e30-129d-965514a28f93	IT	ITA	380	Italy 	Italija	\N
00040000-5552-0e30-5007-ffd1decb0bed	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5552-0e30-2ec1-4d40c2849804	JP	JPN	392	Japan 	Japonska	\N
00040000-5552-0e30-795f-b6180ba938c4	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5552-0e30-be76-aa834337e94b	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5552-0e30-b80b-bc40971c84c7	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5552-0e30-e75b-c8844bed4960	KE	KEN	404	Kenya 	Kenija	\N
00040000-5552-0e30-f511-c118d26cecf9	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5552-0e30-45ba-f4e6f71afc69	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5552-0e30-7ecb-1bf50ce6beb5	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5552-0e30-6af1-6a6403c30098	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5552-0e30-7681-fe5d4f0bf529	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5552-0e30-7389-50c1a1de3ea1	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5552-0e30-f8f9-66b0de9968f5	LV	LVA	428	Latvia 	Latvija	\N
00040000-5552-0e30-0a8c-067e18702e7f	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5552-0e30-ac08-4d64b7e4a757	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5552-0e30-cbcf-6aa8250837eb	LR	LBR	430	Liberia 	Liberija	\N
00040000-5552-0e30-d070-aa11e891930c	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5552-0e30-a5d1-d85d6fd39867	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5552-0e30-d142-62f69bee0913	LT	LTU	440	Lithuania 	Litva	\N
00040000-5552-0e30-eff0-574c003baf5c	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5552-0e30-e978-fb3585a16a80	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5552-0e30-a351-e19ff17bfc6f	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5552-0e30-18cb-ba20ebc0e43d	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5552-0e30-e7b7-4ddf8ade9f8f	MW	MWI	454	Malawi 	Malavi	\N
00040000-5552-0e30-0a71-b1e278bd2191	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5552-0e30-464b-8c3ac1c2256c	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5552-0e30-655e-f46dc1eacb05	ML	MLI	466	Mali 	Mali	\N
00040000-5552-0e30-e3d4-583ce70e292b	MT	MLT	470	Malta 	Malta	\N
00040000-5552-0e30-73c2-6199e78e5891	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5552-0e30-08f3-84579ff5e050	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5552-0e30-32e9-22f8a835adc5	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5552-0e30-6635-bbcb45ec7d3d	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5552-0e30-9b6f-b6fa55fef620	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5552-0e30-f935-b773834d4715	MX	MEX	484	Mexico 	Mehika	\N
00040000-5552-0e30-0665-2ce8eb489fe3	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5552-0e30-cced-a3608ecb5482	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5552-0e30-d635-37859c04c08f	MC	MCO	492	Monaco 	Monako	\N
00040000-5552-0e30-5d00-f2c418b9edfc	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5552-0e30-8b3b-f95c72e80bcb	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5552-0e30-9a76-1b8468c88099	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5552-0e30-3f04-3530ec2b6d2a	MA	MAR	504	Morocco 	Maroko	\N
00040000-5552-0e30-3476-c4744447016e	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5552-0e30-7351-a73b96804856	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5552-0e30-41e5-24f3fd52aa01	NA	NAM	516	Namibia 	Namibija	\N
00040000-5552-0e30-e09c-6a1b5c58e3c6	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5552-0e30-a858-5fbee136dba9	NP	NPL	524	Nepal 	Nepal	\N
00040000-5552-0e30-c09c-937ac2f9e932	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5552-0e30-2f7c-a4e3f27dfd36	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5552-0e30-bbfb-e4d838580db5	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5552-0e30-04a6-fb1061959f1e	NE	NER	562	Niger 	Niger 	\N
00040000-5552-0e30-2e1f-dbf7c0106754	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5552-0e30-9033-9bbf8c93b44a	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5552-0e30-bda3-682e3c48d0c6	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5552-0e30-ff80-10f6d07f9427	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5552-0e30-0a8b-22ed2c0d5f6b	NO	NOR	578	Norway 	Norveška	\N
00040000-5552-0e30-14b6-d304e1a89f65	OM	OMN	512	Oman 	Oman	\N
00040000-5552-0e30-af4a-e607d6f63162	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5552-0e30-31ae-1ae31579561c	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5552-0e30-0c43-ec0cb62f6585	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5552-0e30-45f9-4196b4185734	PA	PAN	591	Panama 	Panama	\N
00040000-5552-0e30-67ab-c7cd0dd868a4	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5552-0e30-1c6a-727fe921f6eb	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5552-0e30-5f40-e00ce7d628ae	PE	PER	604	Peru 	Peru	\N
00040000-5552-0e30-a7ac-b95e5dbfccb9	PH	PHL	608	Philippines 	Filipini	\N
00040000-5552-0e30-e887-4ce1c0857dcb	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5552-0e30-2bcc-7ed5a5800952	PL	POL	616	Poland 	Poljska	\N
00040000-5552-0e30-8fd7-a25b530b86da	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5552-0e30-807f-846d2fb88bbe	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5552-0e30-12f5-ea743fabccad	QA	QAT	634	Qatar 	Katar	\N
00040000-5552-0e30-18e5-0810e69d3cbf	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5552-0e30-65c3-897ed471c746	RO	ROU	642	Romania 	Romunija	\N
00040000-5552-0e30-94fa-56c9f61d2c10	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5552-0e30-83f5-13f4ddbf26d3	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5552-0e30-42b3-9cd33d398533	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5552-0e30-ae1b-c2194b998aad	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5552-0e30-8f1d-fa9a2b23e6a7	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5552-0e30-b70c-761aa27f7b66	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5552-0e30-702d-a9bd2ea24b66	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5552-0e30-7e2f-6e4c91234523	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5552-0e30-8e3d-efd6b222b26a	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5552-0e30-90ff-db268708d640	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5552-0e30-b20f-1eabaa858b0d	SM	SMR	674	San Marino 	San Marino	\N
00040000-5552-0e30-b47a-c0dd493dd58a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5552-0e30-793f-41e12c7df8db	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5552-0e30-93aa-0606394afbf5	SN	SEN	686	Senegal 	Senegal	\N
00040000-5552-0e30-ce81-bc566fb3271c	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5552-0e30-e6f6-4e070d98867f	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5552-0e30-7f6a-d490643f32a5	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5552-0e30-39fe-9f1ce8b71732	SG	SGP	702	Singapore 	Singapur	\N
00040000-5552-0e30-c548-b64af98d0d94	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5552-0e30-4e92-cec1c9f04d7a	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5552-0e30-d7c0-5f214c21534f	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5552-0e30-8f0e-4b3dfcb9f5c7	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5552-0e30-28ae-fcad2fba85ea	SO	SOM	706	Somalia 	Somalija	\N
00040000-5552-0e30-e492-5e317e0e4885	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5552-0e30-4f9d-126953ca0d03	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5552-0e30-367a-a55d81b3623e	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5552-0e30-c644-44bc59038a0a	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5552-0e30-9dd4-4f488e257315	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5552-0e30-b750-55f02c673e85	SD	SDN	729	Sudan 	Sudan	\N
00040000-5552-0e30-36d0-775c60b8d2a5	SR	SUR	740	Suriname 	Surinam	\N
00040000-5552-0e30-d8c2-ac9262638e45	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5552-0e30-14c1-8b078b07c11c	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5552-0e30-6943-39b2423a0302	SE	SWE	752	Sweden 	Švedska	\N
00040000-5552-0e30-94e8-86e856e20d73	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5552-0e30-4d4e-5066de561f12	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5552-0e30-63ad-0be3cf6e5875	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5552-0e30-a7ab-73679ac2a51a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5552-0e30-0d90-fc4c630dde99	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5552-0e30-3172-44656b1b0e54	TH	THA	764	Thailand 	Tajska	\N
00040000-5552-0e30-3ea6-410ccf54fe53	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5552-0e30-eccb-caece1552741	TG	TGO	768	Togo 	Togo	\N
00040000-5552-0e30-c208-5d389242f5c6	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5552-0e30-1306-f18e4f33b5a7	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5552-0e30-2bf1-8663267a4272	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5552-0e30-6867-1083366e1f19	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5552-0e30-f324-345d629b197c	TR	TUR	792	Turkey 	Turčija	\N
00040000-5552-0e30-09bd-5812c1a24c0a	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5552-0e30-a0b3-618a3bb7b4b2	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5552-0e30-fc9c-f53b66a520ac	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5552-0e30-07e6-25300e0aa6d9	UG	UGA	800	Uganda 	Uganda	\N
00040000-5552-0e30-d471-555f62c0790f	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5552-0e30-50c5-d6f26e95cd44	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5552-0e30-9752-465828295d32	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5552-0e30-de06-e62dd197549a	US	USA	840	United States 	Združene države Amerike	\N
00040000-5552-0e30-103e-7d900f5e5666	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5552-0e30-34bd-dcaaeefebab9	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5552-0e30-cc2a-341102bfa191	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5552-0e30-d227-0ad3633c1fcb	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5552-0e30-2f8e-0ebec583ba11	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5552-0e30-a069-788d8759b6c4	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5552-0e30-4928-383ad8a5683e	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5552-0e30-c946-ea83bd175124	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5552-0e30-b8a0-6eafd7326fe8	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5552-0e30-be9d-3b933e0f01ba	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5552-0e30-3b70-178179bbae52	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5552-0e30-3bc0-d1618503a01f	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5552-0e30-a60a-85c9902297e2	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2673 (class 0 OID 3251078)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 3250899)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 3250947)
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
-- TOC entry 2662 (class 0 OID 3250996)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 3251021)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 3250848)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5552-0e30-aad3-78cfec3dedfa	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5552-0e30-8f84-8117e8cfd479	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5552-0e30-cc1b-f3bafbcff428	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5552-0e30-78e8-55b2f04f094f	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5552-0e30-668d-151b67976341	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5552-0e30-fc53-e35ca1ed8f19	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5552-0e30-becb-f0d6563c6c2b	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5552-0e30-18ae-141a92211a48	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5552-0e30-cfa0-3e365cd66361	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5552-0e30-dcf7-491f79d52e67	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2641 (class 0 OID 3250756)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5552-0e30-dc8c-3b36c7d6e9bf	00000000-5552-0e30-668d-151b67976341	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5552-0e30-6da6-854e3104ade6	00000000-5552-0e30-668d-151b67976341	00010000-5552-0e30-ea05-72eea3e33406	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5552-0e30-10e1-5bfd3b17e764	00000000-5552-0e30-fc53-e35ca1ed8f19	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2642 (class 0 OID 3250767)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 3250818)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 3250721)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5552-0e30-656a-31e88ce304c8	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5552-0e30-58fd-731373c5b48f	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5552-0e30-9c28-842fcec64155	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5552-0e30-de44-a85f6e55612a	Abonma-read	Abonma - branje	f
00030000-5552-0e30-51b7-231b2e134799	Abonma-write	Abonma - spreminjanje	f
00030000-5552-0e30-e7c5-6701f35d0ce2	Alternacija-read	Alternacija - branje	f
00030000-5552-0e30-8338-3b6db87ff717	Alternacija-write	Alternacija - spreminjanje	f
00030000-5552-0e30-8325-79f3ca28f71d	Arhivalija-read	Arhivalija - branje	f
00030000-5552-0e30-8d68-b6c80d786425	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5552-0e30-735b-f1a6075d5474	Besedilo-read	Besedilo - branje	f
00030000-5552-0e30-8316-e96e4745479f	Besedilo-write	Besedilo - spreminjanje	f
00030000-5552-0e30-86f9-bb85d3380e28	DogodekIzven-read	DogodekIzven - branje	f
00030000-5552-0e30-35cc-38ea2394bb72	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5552-0e30-3f75-106bff0b525f	Dogodek-read	Dogodek - branje	f
00030000-5552-0e30-dea2-b98f6414bacc	Dogodek-write	Dogodek - spreminjanje	f
00030000-5552-0e30-ccf3-cac638f779fb	Drzava-read	Drzava - branje	f
00030000-5552-0e30-fde2-7306b1925a15	Drzava-write	Drzava - spreminjanje	f
00030000-5552-0e30-bb49-c5cedf35b136	Funkcija-read	Funkcija - branje	f
00030000-5552-0e30-d2bc-81c40a74ea9c	Funkcija-write	Funkcija - spreminjanje	f
00030000-5552-0e30-fbc2-08b7e6f550cf	Gostovanje-read	Gostovanje - branje	f
00030000-5552-0e30-ae12-76b90dfbf18b	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5552-0e30-adef-8f23dfd0df11	Gostujoca-read	Gostujoca - branje	f
00030000-5552-0e30-2b7e-96747d3cf690	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5552-0e30-b300-ede2d8321995	Kupec-read	Kupec - branje	f
00030000-5552-0e30-8797-c0c2e5bfb87f	Kupec-write	Kupec - spreminjanje	f
00030000-5552-0e30-3e37-a29d310000a4	NacinPlacina-read	NacinPlacina - branje	f
00030000-5552-0e30-0322-330c983b921b	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5552-0e30-fd48-1e4cf1fcdccb	Option-read	Option - branje	f
00030000-5552-0e30-e6c6-3eee777be30f	Option-write	Option - spreminjanje	f
00030000-5552-0e30-a96a-745b97ac1282	OptionValue-read	OptionValue - branje	f
00030000-5552-0e30-6054-6b7c54d1e704	OptionValue-write	OptionValue - spreminjanje	f
00030000-5552-0e30-8277-f90a7fbc7cb2	Oseba-read	Oseba - branje	f
00030000-5552-0e30-c326-fce87587355b	Oseba-write	Oseba - spreminjanje	f
00030000-5552-0e30-003f-30714d9a6bd4	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5552-0e30-79a7-815b7e9d114f	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5552-0e30-f673-68e186a98317	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5552-0e30-13d1-984a5c0791aa	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5552-0e30-d1b3-ee688e7fc429	Pogodba-read	Pogodba - branje	f
00030000-5552-0e30-4784-3411fa86f6b6	Pogodba-write	Pogodba - spreminjanje	f
00030000-5552-0e30-5d64-88a1382c6776	Popa-read	Popa - branje	f
00030000-5552-0e30-5b8c-f02e26475cae	Popa-write	Popa - spreminjanje	f
00030000-5552-0e30-7ee5-b3c4a42fdb1d	Posta-read	Posta - branje	f
00030000-5552-0e30-9db1-c44695fb3407	Posta-write	Posta - spreminjanje	f
00030000-5552-0e30-3c60-15018290c456	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5552-0e30-0456-65a7c5f678cc	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5552-0e30-a265-30aac1183ab7	PostniNaslov-read	PostniNaslov - branje	f
00030000-5552-0e30-db36-09d3c366ce22	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5552-0e30-fdbe-8001432f6789	Predstava-read	Predstava - branje	f
00030000-5552-0e30-e501-ee73b1ea4ce5	Predstava-write	Predstava - spreminjanje	f
00030000-5552-0e30-076d-4cd1edfb7262	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5552-0e30-442c-7890d464106b	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5552-0e30-184c-045b34dd36d5	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5552-0e30-c45b-0f4dbb6091d8	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5552-0e30-647f-bbbc279bda9f	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5552-0e30-6952-c6a71296992d	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5552-0e30-1299-58cdf369c4c1	Prostor-read	Prostor - branje	f
00030000-5552-0e30-746f-96fe3db4beb1	Prostor-write	Prostor - spreminjanje	f
00030000-5552-0e30-4b3d-f23734921dfb	Racun-read	Racun - branje	f
00030000-5552-0e30-bd4c-72c5890d2867	Racun-write	Racun - spreminjanje	f
00030000-5552-0e30-160e-f5d98c2531e1	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5552-0e30-57b6-b04dd38195b3	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5552-0e30-6ad6-9e99f58dd93f	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5552-0e30-18be-5106c46d4a27	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5552-0e30-ae0b-cb4dc72799ef	Rekvizit-read	Rekvizit - branje	f
00030000-5552-0e30-a9bc-4077f4eb1b2f	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5552-0e30-24bb-52635b71cab9	Rezervacija-read	Rezervacija - branje	f
00030000-5552-0e30-793b-e8ac4b363a2a	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5552-0e30-0cd5-a9e5b3bdaef6	SedezniRed-read	SedezniRed - branje	f
00030000-5552-0e30-cc11-46b764845e80	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5552-0e30-0d0d-fa6523b7af43	Sedez-read	Sedez - branje	f
00030000-5552-0e30-680c-b958f2a8777f	Sedez-write	Sedez - spreminjanje	f
00030000-5552-0e30-2d1a-1105cfe9230a	Sezona-read	Sezona - branje	f
00030000-5552-0e30-1796-66d332bfad6c	Sezona-write	Sezona - spreminjanje	f
00030000-5552-0e30-be11-20c231913f12	Telefonska-read	Telefonska - branje	f
00030000-5552-0e30-d9e7-bf4e5ab40d09	Telefonska-write	Telefonska - spreminjanje	f
00030000-5552-0e30-f93c-2e2a7182d79b	TerminStoritve-read	TerminStoritve - branje	f
00030000-5552-0e30-baa0-13a904d1e2ad	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5552-0e30-e95c-008297f004b2	TipFunkcije-read	TipFunkcije - branje	f
00030000-5552-0e30-3b01-f0185ef5f3e4	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5552-0e30-60ca-5d5d55b96278	Trr-read	Trr - branje	f
00030000-5552-0e30-e147-9ee3f6dd5206	Trr-write	Trr - spreminjanje	f
00030000-5552-0e30-3ecc-bbe9664f5b0c	Uprizoritev-read	Uprizoritev - branje	f
00030000-5552-0e30-c7a6-d4f04f26e414	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5552-0e30-8465-756144e44701	Vaja-read	Vaja - branje	f
00030000-5552-0e30-6dc0-8cddd42e323e	Vaja-write	Vaja - spreminjanje	f
00030000-5552-0e30-7256-5ae5736699a7	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5552-0e30-39a8-1fb94dd8db50	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5552-0e30-85da-83aa3e2ce5dc	Zaposlitev-read	Zaposlitev - branje	f
00030000-5552-0e30-684c-148b3933775c	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5552-0e30-7a65-1d47b5e40ac4	Zasedenost-read	Zasedenost - branje	f
00030000-5552-0e30-9f1e-1f07f9e4b856	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5552-0e30-6b8e-69cbdab67f9f	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5552-0e30-5326-2299e36f77ae	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5552-0e30-b593-4d661bb3e386	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5552-0e30-f1d2-dca79ca52eb5	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2639 (class 0 OID 3250740)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5552-0e30-e7a0-f4a038afc7bb	00030000-5552-0e30-ccf3-cac638f779fb
00020000-5552-0e30-f528-5a686f6a4953	00030000-5552-0e30-fde2-7306b1925a15
00020000-5552-0e30-f528-5a686f6a4953	00030000-5552-0e30-ccf3-cac638f779fb
\.


--
-- TOC entry 2667 (class 0 OID 3251028)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 3251058)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 3251173)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 3250798)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 3250840)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5552-0e2f-ee52-b1aa43e699e6	8341	Adlešiči
00050000-5552-0e2f-10d9-f8aaab5bb9a2	5270	Ajdovščina
00050000-5552-0e2f-f5ff-0b01384844b9	6280	Ankaran/Ancarano
00050000-5552-0e2f-578a-51378a06ba63	9253	Apače
00050000-5552-0e2f-0535-b9c99eb7c198	8253	Artiče
00050000-5552-0e2f-de9e-545b6d8b07ff	4275	Begunje na Gorenjskem
00050000-5552-0e2f-9848-799deb288dce	1382	Begunje pri Cerknici
00050000-5552-0e2f-eb06-8613fa977368	9231	Beltinci
00050000-5552-0e2f-91bc-3d742e3bc273	2234	Benedikt
00050000-5552-0e2f-8f9d-1cae6b0043c8	2345	Bistrica ob Dravi
00050000-5552-0e2f-c659-c02a3988e721	3256	Bistrica ob Sotli
00050000-5552-0e2f-f7c0-12d2449b3b63	8259	Bizeljsko
00050000-5552-0e2f-736b-2dcde069bf18	1223	Blagovica
00050000-5552-0e2f-8152-6c5e6d4c0293	8283	Blanca
00050000-5552-0e2f-1ccf-cd9bd6776495	4260	Bled
00050000-5552-0e2f-1844-046f67c2a5f3	4273	Blejska Dobrava
00050000-5552-0e2f-9131-0e6b4211ad86	9265	Bodonci
00050000-5552-0e2f-3bca-09caf249faec	9222	Bogojina
00050000-5552-0e2f-e8e7-1a339607207c	4263	Bohinjska Bela
00050000-5552-0e2f-cb02-b05a150b4944	4264	Bohinjska Bistrica
00050000-5552-0e2f-6c74-6d968203d111	4265	Bohinjsko jezero
00050000-5552-0e2f-d7bc-2f37b9487e4a	1353	Borovnica
00050000-5552-0e2f-d7cc-2e7f6ec2a0f9	8294	Boštanj
00050000-5552-0e2f-a57f-250688a69a61	5230	Bovec
00050000-5552-0e2f-8307-dc92e1e571e5	5295	Branik
00050000-5552-0e2f-77e4-d162af97c538	3314	Braslovče
00050000-5552-0e2f-868e-7afc4162ae4e	5223	Breginj
00050000-5552-0e2f-13e0-01e6d0fb156a	8280	Brestanica
00050000-5552-0e2f-61cd-002f21b1c025	2354	Bresternica
00050000-5552-0e2f-1d2b-2adab11ad9f8	4243	Brezje
00050000-5552-0e2f-80dd-2faeef48dd18	1351	Brezovica pri Ljubljani
00050000-5552-0e2f-bc33-6d0769b3ca8e	8250	Brežice
00050000-5552-0e2f-786a-29d2d609e378	4210	Brnik - Aerodrom
00050000-5552-0e2f-3750-9df9ed590d84	8321	Brusnice
00050000-5552-0e2f-99d8-b43288071880	3255	Buče
00050000-5552-0e2f-fc8a-d721024082e3	8276	Bučka 
00050000-5552-0e2f-3c91-8828b2c8cf84	9261	Cankova
00050000-5552-0e2f-7b86-7295f2bde8f5	3000	Celje 
00050000-5552-0e2f-58bd-c0c7c4202ad3	3001	Celje - poštni predali
00050000-5552-0e2f-2197-5b89a4ff1605	4207	Cerklje na Gorenjskem
00050000-5552-0e2f-ae5c-9926c206cd93	8263	Cerklje ob Krki
00050000-5552-0e2f-e4b6-12a1e360644b	1380	Cerknica
00050000-5552-0e2f-2770-36f7640739f7	5282	Cerkno
00050000-5552-0e2f-1eed-b50281c899bb	2236	Cerkvenjak
00050000-5552-0e2f-ed5f-e71f5a39e8ff	2215	Ceršak
00050000-5552-0e2f-7364-292752e1525a	2326	Cirkovce
00050000-5552-0e2f-a407-547ea623cccc	2282	Cirkulane
00050000-5552-0e2f-8c7f-97b3b14c8525	5273	Col
00050000-5552-0e2f-0ff6-bb28b6e20258	8251	Čatež ob Savi
00050000-5552-0e2f-ec38-8a91d6b8294c	1413	Čemšenik
00050000-5552-0e2f-c116-bf060dab44b2	5253	Čepovan
00050000-5552-0e2f-2e94-961c246b25d7	9232	Črenšovci
00050000-5552-0e2f-6e8b-5bfbaa09a80d	2393	Črna na Koroškem
00050000-5552-0e2f-b94e-33a78daefd61	6275	Črni Kal
00050000-5552-0e2f-bcac-45cc89ea7ee8	5274	Črni Vrh nad Idrijo
00050000-5552-0e2f-0834-70627671c566	5262	Črniče
00050000-5552-0e2f-4615-27f719900237	8340	Črnomelj
00050000-5552-0e2f-7b3e-398bd968aec0	6271	Dekani
00050000-5552-0e2f-60b0-0772816b5652	5210	Deskle
00050000-5552-0e2f-7ed2-5376dca3dc95	2253	Destrnik
00050000-5552-0e2f-172d-63ef1e841050	6215	Divača
00050000-5552-0e2f-bbd0-4a0c87f134d1	1233	Dob
00050000-5552-0e2f-17a5-2c1bb92b443b	3224	Dobje pri Planini
00050000-5552-0e2f-132f-3fa3550c1330	8257	Dobova
00050000-5552-0e2f-596b-033d87f34678	1423	Dobovec
00050000-5552-0e2f-fb2c-5581f10d2dc4	5263	Dobravlje
00050000-5552-0e2f-c7bd-6f6ebac8fb3f	3204	Dobrna
00050000-5552-0e2f-17ce-8db65fe75664	8211	Dobrnič
00050000-5552-0e2f-0f19-97dcd23f15b0	1356	Dobrova
00050000-5552-0e2f-19da-065882d06872	9223	Dobrovnik/Dobronak 
00050000-5552-0e2f-0f13-37f3438787a6	5212	Dobrovo v Brdih
00050000-5552-0e2f-aeb2-820ec1070fa3	1431	Dol pri Hrastniku
00050000-5552-0e2f-78d1-b1770161daab	1262	Dol pri Ljubljani
00050000-5552-0e2f-d5e8-955b70e63508	1273	Dole pri Litiji
00050000-5552-0e2f-0f7b-211fa7ce794a	1331	Dolenja vas
00050000-5552-0e2f-a0db-69bb09ede12a	8350	Dolenjske Toplice
00050000-5552-0e2f-a80c-d902bb365889	1230	Domžale
00050000-5552-0e2f-9fa3-288f01798383	2252	Dornava
00050000-5552-0e2f-d8ff-a596dd876822	5294	Dornberk
00050000-5552-0e2f-6d3b-bf14f20ed855	1319	Draga
00050000-5552-0e2f-a054-9da6d91fb86c	8343	Dragatuš
00050000-5552-0e2f-768f-f2a28b11f6fd	3222	Dramlje
00050000-5552-0e2f-fc72-240bc067406f	2370	Dravograd
00050000-5552-0e2f-a8f4-03f390bab11e	4203	Duplje
00050000-5552-0e2f-a3ef-2011215a246c	6221	Dutovlje
00050000-5552-0e2f-c49b-9977ab613b8d	8361	Dvor
00050000-5552-0e2f-7aea-7db4c928a7ea	2343	Fala
00050000-5552-0e2f-7d75-b9a9c3bf506b	9208	Fokovci
00050000-5552-0e2f-472c-f5a6097fad14	2313	Fram
00050000-5552-0e2f-a7a7-d0e9f25c15b5	3213	Frankolovo
00050000-5552-0e2f-97a4-fe79708ace64	1274	Gabrovka
00050000-5552-0e2f-3ca2-e01e71ff9a29	8254	Globoko
00050000-5552-0e2f-d3a0-0e4b0fda2545	5275	Godovič
00050000-5552-0e2f-0d81-982976a88c5c	4204	Golnik
00050000-5552-0e2f-959b-e3583104fef4	3303	Gomilsko
00050000-5552-0e2f-3072-61d2f56f71da	4224	Gorenja vas
00050000-5552-0e2f-0096-3adb83339045	3263	Gorica pri Slivnici
00050000-5552-0e2f-9d46-1d16ba424d0b	2272	Gorišnica
00050000-5552-0e2f-f943-7d519e490bcc	9250	Gornja Radgona
00050000-5552-0e2f-5a09-595d095cada8	3342	Gornji Grad
00050000-5552-0e2f-8bf8-a45c16a128be	4282	Gozd Martuljek
00050000-5552-0e2f-5962-130c959871c6	6272	Gračišče
00050000-5552-0e2f-dd18-dbaab2df84db	9264	Grad
00050000-5552-0e2f-af57-2fd6001be90d	8332	Gradac
00050000-5552-0e2f-45b9-34c2fd040bd3	1384	Grahovo
00050000-5552-0e2f-36ca-323feba3cc4c	5242	Grahovo ob Bači
00050000-5552-0e2f-b581-0306dc34c490	5251	Grgar
00050000-5552-0e2f-c5ea-6c048632e912	3302	Griže
00050000-5552-0e2f-321f-69bfd26baf11	3231	Grobelno
00050000-5552-0e2f-aa60-9036f75b0453	1290	Grosuplje
00050000-5552-0e2f-1b1a-0b1c73469cd4	2288	Hajdina
00050000-5552-0e2f-08a3-515ea56583d4	8362	Hinje
00050000-5552-0e2f-7fb1-57a2667ee18a	2311	Hoče
00050000-5552-0e2f-61a1-6daa05df5f86	9205	Hodoš/Hodos
00050000-5552-0e2f-cbac-1fb0f88c3bc7	1354	Horjul
00050000-5552-0e2f-39fc-548011fa3e7c	1372	Hotedršica
00050000-5552-0e2f-fb11-472b13a821e2	1430	Hrastnik
00050000-5552-0e2f-94d5-07c8dce60bfe	6225	Hruševje
00050000-5552-0e2f-96e3-f5a2add93fb7	4276	Hrušica
00050000-5552-0e2f-8b82-1e5760d0e2e8	5280	Idrija
00050000-5552-0e2f-88bc-6721352b342d	1292	Ig
00050000-5552-0e2f-66a5-79b2c197f630	6250	Ilirska Bistrica
00050000-5552-0e2f-d8a0-f089f8ca9c07	6251	Ilirska Bistrica-Trnovo
00050000-5552-0e2f-7cd1-131d611ef644	1295	Ivančna Gorica
00050000-5552-0e2f-dde1-8efb67b130f3	2259	Ivanjkovci
00050000-5552-0e2f-877d-66df63731cb8	1411	Izlake
00050000-5552-0e2f-d7fd-bbad5cf9bb1c	6310	Izola/Isola
00050000-5552-0e2f-defa-ab68e36f172e	2222	Jakobski Dol
00050000-5552-0e2f-c774-6502daead11d	2221	Jarenina
00050000-5552-0e2f-3111-6d8505046496	6254	Jelšane
00050000-5552-0e2f-02a9-0dc8effae0eb	4270	Jesenice
00050000-5552-0e2f-dc34-876a5c04ac6e	8261	Jesenice na Dolenjskem
00050000-5552-0e2f-87b9-eedeff8a09c7	3273	Jurklošter
00050000-5552-0e2f-6553-55b4e71a5d84	2223	Jurovski Dol
00050000-5552-0e2f-2aba-f758a4b6b51d	2256	Juršinci
00050000-5552-0e2f-3717-0b52f746a80d	5214	Kal nad Kanalom
00050000-5552-0e2f-906e-50b3e48e1acd	3233	Kalobje
00050000-5552-0e2f-d818-211881e4afbb	4246	Kamna Gorica
00050000-5552-0e2f-667f-88adc67e17f9	2351	Kamnica
00050000-5552-0e2f-6e30-fff207e5e36b	1241	Kamnik
00050000-5552-0e2f-a5fb-3611b954e8a4	5213	Kanal
00050000-5552-0e2f-d82a-7f5373217e06	8258	Kapele
00050000-5552-0e2f-b8d2-110c7a28ab96	2362	Kapla
00050000-5552-0e2f-d80b-bdfb3793fff6	2325	Kidričevo
00050000-5552-0e2f-f351-e16602a20d86	1412	Kisovec
00050000-5552-0e2f-a2ad-ec17271b140b	6253	Knežak
00050000-5552-0e2f-868b-b42ec5eb09d9	5222	Kobarid
00050000-5552-0e2f-dcd7-de64d2b67a3b	9227	Kobilje
00050000-5552-0e2f-1f37-36a0e14661f6	1330	Kočevje
00050000-5552-0e2f-e001-440fbd839a4f	1338	Kočevska Reka
00050000-5552-0e2f-e2e5-2877171683d9	2276	Kog
00050000-5552-0e2f-2ef4-d08a56566791	5211	Kojsko
00050000-5552-0e2f-0fb0-e0e73ba40cf5	6223	Komen
00050000-5552-0e2f-a98d-df07d9b00217	1218	Komenda
00050000-5552-0e2f-6d9f-e97c8ed699cb	6000	Koper/Capodistria 
00050000-5552-0e2f-817b-571090902444	6001	Koper/Capodistria - poštni predali
00050000-5552-0e2f-7f8d-a954d5f84bc9	8282	Koprivnica
00050000-5552-0e2f-929a-5e9d7f17a238	5296	Kostanjevica na Krasu
00050000-5552-0e2f-074c-5ea944962a0d	8311	Kostanjevica na Krki
00050000-5552-0e2f-71bb-ea0c02db9359	1336	Kostel
00050000-5552-0e2f-90de-1b50346b9b53	6256	Košana
00050000-5552-0e2f-c12e-19842e4be70e	2394	Kotlje
00050000-5552-0e2f-98bc-84ff8416d31b	6240	Kozina
00050000-5552-0e2f-44aa-016929f845cb	3260	Kozje
00050000-5552-0e2f-b5ac-d1dc54ebcf0a	4000	Kranj 
00050000-5552-0e2f-2f32-9402f029cb84	4001	Kranj - poštni predali
00050000-5552-0e2f-212b-7e168fa3822c	4280	Kranjska Gora
00050000-5552-0e2f-6949-130ab44badcb	1281	Kresnice
00050000-5552-0e2f-49ee-0398a0407063	4294	Križe
00050000-5552-0e2f-942f-e14f6b223727	9206	Križevci
00050000-5552-0e2f-a632-a86135064df7	9242	Križevci pri Ljutomeru
00050000-5552-0e2f-39ea-e528553b4aa1	1301	Krka
00050000-5552-0e2f-79d0-e3b17e368236	8296	Krmelj
00050000-5552-0e2f-6fda-bfb4e0c7cfa5	4245	Kropa
00050000-5552-0e2f-bf09-f4f9213f7228	8262	Krška vas
00050000-5552-0e2f-73eb-f05e490f6979	8270	Krško
00050000-5552-0e2f-d031-5b0191c810a9	9263	Kuzma
00050000-5552-0e2f-eabe-b0864a0d6e52	2318	Laporje
00050000-5552-0e2f-69fc-7d9d370b1e79	3270	Laško
00050000-5552-0e2f-ef17-2d795b2afd0a	1219	Laze v Tuhinju
00050000-5552-0e2f-1634-2801671ba6d9	2230	Lenart v Slovenskih goricah
00050000-5552-0e2f-f315-3f748c9ad2ab	9220	Lendava/Lendva
00050000-5552-0e2f-a8ac-a48fad8a7071	4248	Lesce
00050000-5552-0e2f-e5d5-6b985971ecc2	3261	Lesično
00050000-5552-0e2f-5866-8685ade978b1	8273	Leskovec pri Krškem
00050000-5552-0e2f-06a4-e548648f5c55	2372	Libeliče
00050000-5552-0e2f-0392-edc6d69c7776	2341	Limbuš
00050000-5552-0e2f-0aea-6cc9789a873f	1270	Litija
00050000-5552-0e2f-63b3-131e64755da3	3202	Ljubečna
00050000-5552-0e2f-60ef-f443e8cfdcb3	1000	Ljubljana 
00050000-5552-0e2f-82ef-3bb82aa95fad	1001	Ljubljana - poštni predali
00050000-5552-0e2f-1692-9c0eb9d6d6a4	1231	Ljubljana - Črnuče
00050000-5552-0e2f-3566-2c71a5e4b60e	1261	Ljubljana - Dobrunje
00050000-5552-0e2f-36e2-7986341a6e22	1260	Ljubljana - Polje
00050000-5552-0e2f-7b0b-a5c8bca294d2	1210	Ljubljana - Šentvid
00050000-5552-0e2f-a95e-3175b5222d68	1211	Ljubljana - Šmartno
00050000-5552-0e2f-96df-c27982d27476	3333	Ljubno ob Savinji
00050000-5552-0e2f-417d-5b2fe9c2e7e8	9240	Ljutomer
00050000-5552-0e2f-c4fc-79e81bc0099b	3215	Loče
00050000-5552-0e2f-216d-d8f3b602e7d9	5231	Log pod Mangartom
00050000-5552-0e2f-f0ba-2a62509c88cc	1358	Log pri Brezovici
00050000-5552-0e2f-2c48-687971337433	1370	Logatec
00050000-5552-0e2f-c15d-dd747a634c15	1371	Logatec
00050000-5552-0e2f-f64b-5290d1cc9e9f	1434	Loka pri Zidanem Mostu
00050000-5552-0e2f-8bc4-649a860c428f	3223	Loka pri Žusmu
00050000-5552-0e2f-aa59-1a2387257067	6219	Lokev
00050000-5552-0e2f-2f5a-7d0569589e77	1318	Loški Potok
00050000-5552-0e2f-ca8a-e53b861ca0f9	2324	Lovrenc na Dravskem polju
00050000-5552-0e2f-2ced-a153a652372d	2344	Lovrenc na Pohorju
00050000-5552-0e2f-64b4-8d357c95cf54	3334	Luče
00050000-5552-0e2f-8f73-0c921b3fe7fc	1225	Lukovica
00050000-5552-0e2f-4408-7f5c7455b54f	9202	Mačkovci
00050000-5552-0e2f-e8ad-aa7c5404853d	2322	Majšperk
00050000-5552-0e2f-9b8c-e233b9869374	2321	Makole
00050000-5552-0e2f-d188-1287d4944275	9243	Mala Nedelja
00050000-5552-0e2f-2f08-83255c0d2dde	2229	Malečnik
00050000-5552-0e2f-61ce-815572346ccf	6273	Marezige
00050000-5552-0e2f-699c-49412078dba3	2000	Maribor 
00050000-5552-0e2f-4a62-65954ee78e2f	2001	Maribor - poštni predali
00050000-5552-0e2f-79b5-c9fc2b6ca44d	2206	Marjeta na Dravskem polju
00050000-5552-0e2f-f3da-dddfea7e43e6	2281	Markovci
00050000-5552-0e2f-8fce-5b78c3a7d1e2	9221	Martjanci
00050000-5552-0e2f-8feb-43e8b57f36bd	6242	Materija
00050000-5552-0e2f-3c71-c7a284886e9e	4211	Mavčiče
00050000-5552-0e2f-0d89-c6f87cc138cd	1215	Medvode
00050000-5552-0e2f-01c8-7abf3b3182d7	1234	Mengeš
00050000-5552-0e2f-c566-9ec84d062c0b	8330	Metlika
00050000-5552-0e2f-50a7-3d12f55507ae	2392	Mežica
00050000-5552-0e2f-1cdc-4ac65687d442	2204	Miklavž na Dravskem polju
00050000-5552-0e2f-0145-41fc9effa8fd	2275	Miklavž pri Ormožu
00050000-5552-0e2f-dbcc-2517f2314e42	5291	Miren
00050000-5552-0e2f-85f3-ef7962d08bd5	8233	Mirna
00050000-5552-0e2f-b858-72937c378f2b	8216	Mirna Peč
00050000-5552-0e2f-5b16-2dc9e204a650	2382	Mislinja
00050000-5552-0e2f-fe02-0c9f07d5437a	4281	Mojstrana
00050000-5552-0e2f-6a25-3212836e67f8	8230	Mokronog
00050000-5552-0e2f-2d48-25e16fca38a7	1251	Moravče
00050000-5552-0e2f-a46d-ae076c6a3915	9226	Moravske Toplice
00050000-5552-0e2f-67c2-ce06d42b6b6a	5216	Most na Soči
00050000-5552-0e2f-57d9-8feebac3ad21	1221	Motnik
00050000-5552-0e2f-f392-616836d0daed	3330	Mozirje
00050000-5552-0e2f-2b1c-12cad542b072	9000	Murska Sobota 
00050000-5552-0e2f-9337-8533e19bd17e	9001	Murska Sobota - poštni predali
00050000-5552-0e2f-4117-da3d06b447b1	2366	Muta
00050000-5552-0e2f-1680-02b9f104f2e5	4202	Naklo
00050000-5552-0e2f-1c0d-0f4434c5b760	3331	Nazarje
00050000-5552-0e2f-7832-d9b43beb2712	1357	Notranje Gorice
00050000-5552-0e2f-43a5-fde0b957536c	3203	Nova Cerkev
00050000-5552-0e2f-e6a7-7ee11ec21f33	5000	Nova Gorica 
00050000-5552-0e2f-277c-b4611d209390	5001	Nova Gorica - poštni predali
00050000-5552-0e2f-eabd-378adf86a518	1385	Nova vas
00050000-5552-0e2f-4fb7-2b3b38ae358a	8000	Novo mesto
00050000-5552-0e2f-8591-15ff461f6a5c	8001	Novo mesto - poštni predali
00050000-5552-0e2f-1d37-d90e4db27a26	6243	Obrov
00050000-5552-0e2f-446d-14f6ed8e9bc1	9233	Odranci
00050000-5552-0e2f-143f-698ac5c0c00a	2317	Oplotnica
00050000-5552-0e2f-a487-2cad978a0000	2312	Orehova vas
00050000-5552-0e2f-1298-a9f02a9ff1d9	2270	Ormož
00050000-5552-0e2f-0d57-82a09754c33f	1316	Ortnek
00050000-5552-0e2f-6c87-cae8e665febe	1337	Osilnica
00050000-5552-0e2f-c35e-c2a36011b930	8222	Otočec
00050000-5552-0e2f-7820-ab08ae1e3cd0	2361	Ožbalt
00050000-5552-0e2f-0cd7-f4640571837c	2231	Pernica
00050000-5552-0e2f-9f4d-4f1bb33935e5	2211	Pesnica pri Mariboru
00050000-5552-0e2f-e6ba-c8d33b4e1b2f	9203	Petrovci
00050000-5552-0e2f-0396-350a56a85f03	3301	Petrovče
00050000-5552-0e2f-2293-89df467723b0	6330	Piran/Pirano
00050000-5552-0e2f-39ae-5094c7dab559	8255	Pišece
00050000-5552-0e2f-ff75-073d79586eb6	6257	Pivka
00050000-5552-0e2f-cf07-728cd5bd99f7	6232	Planina
00050000-5552-0e2f-c720-e464a02a08b0	3225	Planina pri Sevnici
00050000-5552-0e2f-d846-863bf79745db	6276	Pobegi
00050000-5552-0e2f-bd8a-4bbdadc0167a	8312	Podbočje
00050000-5552-0e2f-83af-dfc00e6968d3	5243	Podbrdo
00050000-5552-0e2f-ff2d-6bce2e2eb3c1	3254	Podčetrtek
00050000-5552-0e2f-4471-b23f37bbdd37	2273	Podgorci
00050000-5552-0e2f-7db5-63f6c8cc7581	6216	Podgorje
00050000-5552-0e2f-1719-f9e6617360a6	2381	Podgorje pri Slovenj Gradcu
00050000-5552-0e2f-0b07-a79539b1b4dd	6244	Podgrad
00050000-5552-0e2f-24d5-bec42778d0a3	1414	Podkum
00050000-5552-0e2f-953b-19713776dfc0	2286	Podlehnik
00050000-5552-0e2f-4205-0ee841c74f50	5272	Podnanos
00050000-5552-0e2f-19ef-c82fd0e263bb	4244	Podnart
00050000-5552-0e2f-aba6-3c74a54ec79c	3241	Podplat
00050000-5552-0e2f-d6ef-be091f02574b	3257	Podsreda
00050000-5552-0e2f-556c-aa74f6405921	2363	Podvelka
00050000-5552-0e2f-7cbd-e92529959c0e	2208	Pohorje
00050000-5552-0e2f-db7f-ff025a1087de	2257	Polenšak
00050000-5552-0e2f-92df-ec8b6e7072de	1355	Polhov Gradec
00050000-5552-0e2f-33b5-432164ff2de0	4223	Poljane nad Škofjo Loko
00050000-5552-0e2f-e224-1cc3573e8bf3	2319	Poljčane
00050000-5552-0e2f-dbab-da8763d7e1b6	1272	Polšnik
00050000-5552-0e2f-6b76-4dba408706c4	3313	Polzela
00050000-5552-0e2f-73a9-d265fa3ab856	3232	Ponikva
00050000-5552-0e2f-d4d5-04d227562cd8	6320	Portorož/Portorose
00050000-5552-0e2f-4e86-183b9f70d4f2	6230	Postojna
00050000-5552-0e2f-fece-195e4bc56074	2331	Pragersko
00050000-5552-0e2f-14b1-082bf16a6479	3312	Prebold
00050000-5552-0e2f-8f66-40175287c6ce	4205	Preddvor
00050000-5552-0e2f-62d3-4bd3e8c9a253	6255	Prem
00050000-5552-0e2f-6f45-a54a4ebb660e	1352	Preserje
00050000-5552-0e2f-5da7-92b9fd945b43	6258	Prestranek
00050000-5552-0e2f-d92e-dfcabe1cd012	2391	Prevalje
00050000-5552-0e2f-e112-d4dc30c92cc7	3262	Prevorje
00050000-5552-0e2f-459d-b650f4107508	1276	Primskovo 
00050000-5552-0e2f-61e6-5ab11d88e6dd	3253	Pristava pri Mestinju
00050000-5552-0e2f-f36b-c8026d828aae	9207	Prosenjakovci/Partosfalva
00050000-5552-0e2f-e6e1-b1b1087b4868	5297	Prvačina
00050000-5552-0e2f-ec59-4523b673674e	2250	Ptuj
00050000-5552-0e2f-9913-1db8e9dd16fc	2323	Ptujska Gora
00050000-5552-0e2f-a9e9-afc25fe58c53	9201	Puconci
00050000-5552-0e2f-1248-8cc9ce3f24af	2327	Rače
00050000-5552-0e2f-9926-93c3e22dd659	1433	Radeče
00050000-5552-0e2f-f0f4-63e4e4684295	9252	Radenci
00050000-5552-0e2f-2dd4-68c4e9ecdcd4	2360	Radlje ob Dravi
00050000-5552-0e2f-7175-8c9ad90de419	1235	Radomlje
00050000-5552-0e2f-fb26-dcdef445c927	4240	Radovljica
00050000-5552-0e2f-8908-36ef45586d10	8274	Raka
00050000-5552-0e2f-d254-72e69c8b8e08	1381	Rakek
00050000-5552-0e2f-1057-4f21def838d2	4283	Rateče - Planica
00050000-5552-0e2f-8ae7-c48fe1ba10dc	2390	Ravne na Koroškem
00050000-5552-0e2f-0eb9-13b54752c714	9246	Razkrižje
00050000-5552-0e2f-f669-eaed44e7e0e8	3332	Rečica ob Savinji
00050000-5552-0e2f-2f9a-9a435a83fc47	5292	Renče
00050000-5552-0e2f-01d7-f893f24ad2b5	1310	Ribnica
00050000-5552-0e2f-06e1-09d39daef40f	2364	Ribnica na Pohorju
00050000-5552-0e2f-68b1-a62c0552faaa	3272	Rimske Toplice
00050000-5552-0e2f-7d5d-03869089f400	1314	Rob
00050000-5552-0e2f-98e8-6587e91c5834	5215	Ročinj
00050000-5552-0e2f-b834-2595e374f793	3250	Rogaška Slatina
00050000-5552-0e2f-0ee2-3d3b8997ac99	9262	Rogašovci
00050000-5552-0e2f-2942-85f9512ccbda	3252	Rogatec
00050000-5552-0e2f-78a2-7a4ea420ab48	1373	Rovte
00050000-5552-0e2f-adf1-e4de6a414075	2342	Ruše
00050000-5552-0e2f-5357-36306df37da3	1282	Sava
00050000-5552-0e2f-8745-ba1cc7de2cb5	6333	Sečovlje/Sicciole
00050000-5552-0e2f-985b-038daf0716e2	4227	Selca
00050000-5552-0e2f-3492-1e1e58a7cdb0	2352	Selnica ob Dravi
00050000-5552-0e2f-3bac-daf2400ea446	8333	Semič
00050000-5552-0e2f-dcff-3be7aaa63c49	8281	Senovo
00050000-5552-0e2f-cdf0-4de491a0bb8b	6224	Senožeče
00050000-5552-0e2f-14a4-dadf1e7de7c8	8290	Sevnica
00050000-5552-0e2f-cc40-6c93a51642ad	6210	Sežana
00050000-5552-0e2f-b457-47a9fcba391e	2214	Sladki Vrh
00050000-5552-0e2f-0e29-736d98bcdf78	5283	Slap ob Idrijci
00050000-5552-0e2f-d24d-bc13f585addf	2380	Slovenj Gradec
00050000-5552-0e2f-e81c-78e8e2f7c4bb	2310	Slovenska Bistrica
00050000-5552-0e2f-7624-48066df3d6a9	3210	Slovenske Konjice
00050000-5552-0e2f-a934-9cec0ad1c441	1216	Smlednik
00050000-5552-0e2f-80d2-d8b482593f95	5232	Soča
00050000-5552-0e2f-8fc8-f464d5d17b8c	1317	Sodražica
00050000-5552-0e2f-6c95-e64e8b4ad338	3335	Solčava
00050000-5552-0e2f-c99b-8aec138d78c3	5250	Solkan
00050000-5552-0e2f-7e59-c02fb4e21f04	4229	Sorica
00050000-5552-0e2f-4384-c381f76d817f	4225	Sovodenj
00050000-5552-0e2f-ee53-f6399ddc493a	5281	Spodnja Idrija
00050000-5552-0e2f-c6d1-3878d895f944	2241	Spodnji Duplek
00050000-5552-0e2f-30f9-dde8c0b3da20	9245	Spodnji Ivanjci
00050000-5552-0e2f-f1d4-da5a7b2237de	2277	Središče ob Dravi
00050000-5552-0e2f-fdc3-bb57b543b8eb	4267	Srednja vas v Bohinju
00050000-5552-0e2f-abf7-19eb6b0f75bc	8256	Sromlje 
00050000-5552-0e2f-f020-14da93c47ed2	5224	Srpenica
00050000-5552-0e2f-479a-2d571875230d	1242	Stahovica
00050000-5552-0e2f-7ef2-010a3f42230b	1332	Stara Cerkev
00050000-5552-0e2f-1950-38ff1f0db3be	8342	Stari trg ob Kolpi
00050000-5552-0e2f-3434-b47a3bd0dca4	1386	Stari trg pri Ložu
00050000-5552-0e2f-857a-e0d6edfde486	2205	Starše
00050000-5552-0e2f-ba85-c0f3a246c64b	2289	Stoperce
00050000-5552-0e2f-b8c0-81d9516dc872	8322	Stopiče
00050000-5552-0e2f-0854-b6dbe51cf4ba	3206	Stranice
00050000-5552-0e2f-48d5-208a89dc2765	8351	Straža
00050000-5552-0e2f-b1ee-125a54690d44	1313	Struge
00050000-5552-0e2f-37fe-1a414a14d275	8293	Studenec
00050000-5552-0e2f-c785-65d371d0a515	8331	Suhor
00050000-5552-0e2f-c26f-4544ad8abefd	2233	Sv. Ana v Slovenskih goricah
00050000-5552-0e2f-5cfe-15ef44e54ff7	2235	Sv. Trojica v Slovenskih goricah
00050000-5552-0e2f-cfca-9636920c2ef2	2353	Sveti Duh na Ostrem Vrhu
00050000-5552-0e2f-e0a5-43d3dce3e0f9	9244	Sveti Jurij ob Ščavnici
00050000-5552-0e2f-1895-5c1ac2ffd72d	3264	Sveti Štefan
00050000-5552-0e2f-2583-5b2b27bf5b7a	2258	Sveti Tomaž
00050000-5552-0e2f-859c-de496e203012	9204	Šalovci
00050000-5552-0e2f-4aaf-abfc789e6289	5261	Šempas
00050000-5552-0e2f-7d1d-252068fcbe35	5290	Šempeter pri Gorici
00050000-5552-0e2f-367e-be198a2ab92f	3311	Šempeter v Savinjski dolini
00050000-5552-0e2f-d30a-e08b2435f7fd	4208	Šenčur
00050000-5552-0e2f-6523-add9f0b2be6a	2212	Šentilj v Slovenskih goricah
00050000-5552-0e2f-a127-dcb6de442e95	8297	Šentjanž
00050000-5552-0e2f-aca6-67358d954c2a	2373	Šentjanž pri Dravogradu
00050000-5552-0e2f-83c1-3f7f91bad8fe	8310	Šentjernej
00050000-5552-0e2f-5639-a68edb961704	3230	Šentjur
00050000-5552-0e2f-d5b6-1057e46762a9	3271	Šentrupert
00050000-5552-0e2f-3896-bb78dcd220b7	8232	Šentrupert
00050000-5552-0e2f-ba95-4fde9408a7c8	1296	Šentvid pri Stični
00050000-5552-0e2f-1412-b4d4b68d1a4c	8275	Škocjan
00050000-5552-0e30-967c-a45def2f1719	6281	Škofije
00050000-5552-0e30-ffdc-049b9b3c3a97	4220	Škofja Loka
00050000-5552-0e30-2fc2-8db45d46a66b	3211	Škofja vas
00050000-5552-0e30-61da-58b060541023	1291	Škofljica
00050000-5552-0e30-c5d3-30979138bfcf	6274	Šmarje
00050000-5552-0e30-1978-4e874a111e92	1293	Šmarje - Sap
00050000-5552-0e30-928c-61abd9aa74fa	3240	Šmarje pri Jelšah
00050000-5552-0e30-a9c2-5b2786ff7247	8220	Šmarješke Toplice
00050000-5552-0e30-6197-dbc9b7ed9170	2315	Šmartno na Pohorju
00050000-5552-0e30-a5cf-e0fd65e72011	3341	Šmartno ob Dreti
00050000-5552-0e30-ec89-f987371102f3	3327	Šmartno ob Paki
00050000-5552-0e30-0a1c-461cc1015c0a	1275	Šmartno pri Litiji
00050000-5552-0e30-8c48-ecec717e8f48	2383	Šmartno pri Slovenj Gradcu
00050000-5552-0e30-6431-04b9dfe598f7	3201	Šmartno v Rožni dolini
00050000-5552-0e30-a2d9-6b141535c066	3325	Šoštanj
00050000-5552-0e30-a8e6-8d839a76b80a	6222	Štanjel
00050000-5552-0e30-0c4b-88057ce81e8d	3220	Štore
00050000-5552-0e30-d08d-904d2b6371aa	3304	Tabor
00050000-5552-0e30-1a5f-8198b416362e	3221	Teharje
00050000-5552-0e30-6f0b-16ed2fe63322	9251	Tišina
00050000-5552-0e30-c75a-b97ac2cd393d	5220	Tolmin
00050000-5552-0e30-08db-1ab3de085bf9	3326	Topolšica
00050000-5552-0e30-8aaf-5f6b428815e2	2371	Trbonje
00050000-5552-0e30-a715-94133e12b712	1420	Trbovlje
00050000-5552-0e30-a752-11acec1c5da1	8231	Trebelno 
00050000-5552-0e30-18e3-27842928c1a0	8210	Trebnje
00050000-5552-0e30-d555-4e9a165dfc40	5252	Trnovo pri Gorici
00050000-5552-0e30-02bb-1aaf66e97fda	2254	Trnovska vas
00050000-5552-0e30-6cb0-44aaa1681b79	1222	Trojane
00050000-5552-0e30-6e63-0928a87e2ac5	1236	Trzin
00050000-5552-0e30-c168-ea4c42f32afa	4290	Tržič
00050000-5552-0e30-5c5a-bd760aa0e447	8295	Tržišče
00050000-5552-0e30-a535-a5274d18e2a9	1311	Turjak
00050000-5552-0e30-d2cf-a2a64fecbd68	9224	Turnišče
00050000-5552-0e30-6e8d-1bab9156f467	8323	Uršna sela
00050000-5552-0e30-a921-1e4401f24639	1252	Vače
00050000-5552-0e30-4514-4f1fed8290e2	3320	Velenje 
00050000-5552-0e30-7b79-f732e1521943	3322	Velenje - poštni predali
00050000-5552-0e30-c068-78dc2db2defa	8212	Velika Loka
00050000-5552-0e30-0406-96963ec3347b	2274	Velika Nedelja
00050000-5552-0e30-348c-1317ac239ba5	9225	Velika Polana
00050000-5552-0e30-36ef-c3ef35ab1ea0	1315	Velike Lašče
00050000-5552-0e30-0b49-8ce69b356fbb	8213	Veliki Gaber
00050000-5552-0e30-34a8-bacf2baaa5fb	9241	Veržej
00050000-5552-0e30-cddc-fc302380b3be	1312	Videm - Dobrepolje
00050000-5552-0e30-9649-f306710fc033	2284	Videm pri Ptuju
00050000-5552-0e30-e7d1-0ce22a6a2ce3	8344	Vinica
00050000-5552-0e30-17a8-913660fd3305	5271	Vipava
00050000-5552-0e30-ebea-e713e914f9e0	4212	Visoko
00050000-5552-0e30-1013-51083de6a692	1294	Višnja Gora
00050000-5552-0e30-d716-6f3dcf9bf3bf	3205	Vitanje
00050000-5552-0e30-f0f3-13a8dc39a5ee	2255	Vitomarci
00050000-5552-0e30-147b-ca9d2a6a5393	1217	Vodice
00050000-5552-0e30-7b33-58b7f610e31b	3212	Vojnik\t
00050000-5552-0e30-d678-494287c7dd43	5293	Volčja Draga
00050000-5552-0e30-f2db-79ad741e742e	2232	Voličina
00050000-5552-0e30-ab83-b6e99f3551d3	3305	Vransko
00050000-5552-0e30-01f1-eec275a5d170	6217	Vremski Britof
00050000-5552-0e30-05bd-f1fed44b6e54	1360	Vrhnika
00050000-5552-0e30-3a11-420df291c7ba	2365	Vuhred
00050000-5552-0e30-39cf-281e3f7d7233	2367	Vuzenica
00050000-5552-0e30-5510-17f3bfbbfac5	8292	Zabukovje 
00050000-5552-0e30-f69f-e9daee7883b1	1410	Zagorje ob Savi
00050000-5552-0e30-4737-a5e28da73fe8	1303	Zagradec
00050000-5552-0e30-c72e-912b33420c12	2283	Zavrč
00050000-5552-0e30-cef2-388d8fd320a7	8272	Zdole 
00050000-5552-0e30-0bd0-21c7fde183d9	4201	Zgornja Besnica
00050000-5552-0e30-fa6d-1d5aaf4e1e59	2242	Zgornja Korena
00050000-5552-0e30-a308-3524350109f4	2201	Zgornja Kungota
00050000-5552-0e30-3491-72191fe8ec4e	2316	Zgornja Ložnica
00050000-5552-0e30-38d6-b25000b86008	2314	Zgornja Polskava
00050000-5552-0e30-965d-6f49db2cbe7c	2213	Zgornja Velka
00050000-5552-0e30-8e9d-d3ff88bd2c5d	4247	Zgornje Gorje
00050000-5552-0e30-73a7-d181575c0862	4206	Zgornje Jezersko
00050000-5552-0e30-35e4-e57610c83a4e	2285	Zgornji Leskovec
00050000-5552-0e30-4ba8-a09097d7df5f	1432	Zidani Most
00050000-5552-0e30-e1c7-ff39214631a0	3214	Zreče
00050000-5552-0e30-6c2e-3f415def2db9	4209	Žabnica
00050000-5552-0e30-516d-2def70f103e7	3310	Žalec
00050000-5552-0e30-c865-28bc364a0a41	4228	Železniki
00050000-5552-0e30-a415-a61d5f7fbfc0	2287	Žetale
00050000-5552-0e30-2034-872c88181782	4226	Žiri
00050000-5552-0e30-6ffb-a22d4e0fe608	4274	Žirovnica
00050000-5552-0e30-fc34-72808632b192	8360	Žužemberk
\.


--
-- TOC entry 2663 (class 0 OID 3251002)
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
-- TOC entry 2646 (class 0 OID 3250825)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 3250891)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 3251014)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 3251119)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 3251166)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 3251043)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 3250987)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 3250977)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2680 (class 0 OID 3251156)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 3251109)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 3250692)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5552-0e30-ea05-72eea3e33406	00010000-5552-0e30-a621-a7f6fc498d62	2015-05-12 16:29:05	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROrtdf72Ff9HxzaZAj.U9d7019UKQqXDG";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2695 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2670 (class 0 OID 3251052)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2638 (class 0 OID 3250730)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5552-0e30-38bd-771c4e0f8fce	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5552-0e30-5806-a7ca6ce21602	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5552-0e30-e7a0-f4a038afc7bb	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5552-0e30-6c73-bef6efb156ec	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5552-0e30-e5a4-4814c9b11d6d	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5552-0e30-f528-5a686f6a4953	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2636 (class 0 OID 3250714)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5552-0e30-ea05-72eea3e33406	00020000-5552-0e30-6c73-bef6efb156ec
00010000-5552-0e30-a621-a7f6fc498d62	00020000-5552-0e30-6c73-bef6efb156ec
\.


--
-- TOC entry 2672 (class 0 OID 3251066)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 3251008)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 3250958)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 3250790)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2659 (class 0 OID 3250964)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 3251144)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 3250860)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 3250701)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5552-0e30-a621-a7f6fc498d62	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRObdO6PzoBJ0keobvYC3SyHV4Lt1j2vKG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5552-0e30-ea05-72eea3e33406	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2684 (class 0 OID 3251198)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 3250906)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 3251035)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 3251101)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 3250934)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2683 (class 0 OID 3251188)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 3251091)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2278 (class 2606 OID 3250755)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 3251238)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 3251231)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 3251143)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2331 (class 2606 OID 3250924)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 3250957)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2314 (class 2606 OID 3250886)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 3251087)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 3250904)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 3250951)
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
-- TOC entry 2368 (class 2606 OID 3251000)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 3251027)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2307 (class 2606 OID 3250858)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2282 (class 2606 OID 3250764)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2297 (class 2606 OID 3250822)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2284 (class 2606 OID 3250788)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2276 (class 2606 OID 3250744)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2269 (class 2606 OID 3250729)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 3251033)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2394 (class 2606 OID 3251065)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 3251183)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2292 (class 2606 OID 3250815)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 3250846)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 3251006)
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
-- TOC entry 2302 (class 2606 OID 3250836)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 3250895)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 3251018)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 3251125)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 3251171)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 3251050)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 3250991)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2360 (class 2606 OID 3250982)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 3251165)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 3251116)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2261 (class 2606 OID 3250700)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 3251056)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2267 (class 2606 OID 3250718)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2271 (class 2606 OID 3250738)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 3251074)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 3251013)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 3250963)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 3250795)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2354 (class 2606 OID 3250973)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 3251155)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 3250871)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 3250713)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 3251213)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 2606 OID 3250910)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 3251041)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 3251107)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 3250946)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 3251197)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 3251100)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2332 (class 1259 OID 3250931)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2290 (class 1259 OID 3250817)
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
-- TOC entry 2381 (class 1259 OID 3251034)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2375 (class 1259 OID 3251020)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2376 (class 1259 OID 3251019)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2327 (class 1259 OID 3250911)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 3251090)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2403 (class 1259 OID 3251088)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2404 (class 1259 OID 3251089)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2427 (class 1259 OID 3251185)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2428 (class 1259 OID 3251186)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2429 (class 1259 OID 3251187)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2435 (class 1259 OID 3251216)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2436 (class 1259 OID 3251215)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2437 (class 1259 OID 3251214)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2309 (class 1259 OID 3250873)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2310 (class 1259 OID 3250872)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2294 (class 1259 OID 3250824)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2295 (class 1259 OID 3250823)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2390 (class 1259 OID 3251057)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2345 (class 1259 OID 3250952)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2273 (class 1259 OID 3250745)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2274 (class 1259 OID 3250746)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2395 (class 1259 OID 3251077)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2396 (class 1259 OID 3251076)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2397 (class 1259 OID 3251075)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2319 (class 1259 OID 3250896)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2320 (class 1259 OID 3250898)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2321 (class 1259 OID 3250897)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2355 (class 1259 OID 3250986)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2356 (class 1259 OID 3250984)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2357 (class 1259 OID 3250983)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2358 (class 1259 OID 3250985)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2264 (class 1259 OID 3250719)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2265 (class 1259 OID 3250720)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2384 (class 1259 OID 3251042)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2370 (class 1259 OID 3251007)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2410 (class 1259 OID 3251117)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2411 (class 1259 OID 3251118)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2298 (class 1259 OID 3250838)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2299 (class 1259 OID 3250837)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2300 (class 1259 OID 3250839)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2414 (class 1259 OID 3251126)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2415 (class 1259 OID 3251127)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2446 (class 1259 OID 3251241)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 3251240)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2448 (class 1259 OID 3251243)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2449 (class 1259 OID 3251239)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2450 (class 1259 OID 3251242)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2407 (class 1259 OID 3251108)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2361 (class 1259 OID 3250995)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2362 (class 1259 OID 3250994)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2363 (class 1259 OID 3250992)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2364 (class 1259 OID 3250993)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2251 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2442 (class 1259 OID 3251233)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2443 (class 1259 OID 3251232)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2326 (class 1259 OID 3250905)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2279 (class 1259 OID 3250766)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2280 (class 1259 OID 3250765)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2286 (class 1259 OID 3250796)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2287 (class 1259 OID 3250797)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2350 (class 1259 OID 3250976)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2351 (class 1259 OID 3250975)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2352 (class 1259 OID 3250974)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2333 (class 1259 OID 3250933)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2334 (class 1259 OID 3250929)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2335 (class 1259 OID 3250926)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2336 (class 1259 OID 3250927)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2337 (class 1259 OID 3250925)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2338 (class 1259 OID 3250930)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2339 (class 1259 OID 3250928)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2293 (class 1259 OID 3250816)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2315 (class 1259 OID 3250887)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2316 (class 1259 OID 3250889)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2317 (class 1259 OID 3250888)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2318 (class 1259 OID 3250890)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2369 (class 1259 OID 3251001)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2432 (class 1259 OID 3251184)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2285 (class 1259 OID 3250789)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2308 (class 1259 OID 3250859)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2389 (class 1259 OID 3251051)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2254 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2305 (class 1259 OID 3250847)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2426 (class 1259 OID 3251172)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2272 (class 1259 OID 3250739)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2340 (class 1259 OID 3250932)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2475 (class 2606 OID 3251374)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2478 (class 2606 OID 3251359)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2477 (class 2606 OID 3251364)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2473 (class 2606 OID 3251384)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2479 (class 2606 OID 3251354)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2474 (class 2606 OID 3251379)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2476 (class 2606 OID 3251369)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2460 (class 2606 OID 3251289)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2496 (class 2606 OID 3251469)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2494 (class 2606 OID 3251464)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2495 (class 2606 OID 3251459)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2472 (class 2606 OID 3251349)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2502 (class 2606 OID 3251509)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2504 (class 2606 OID 3251499)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2503 (class 2606 OID 3251504)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2492 (class 2606 OID 3251449)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2513 (class 2606 OID 3251544)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2512 (class 2606 OID 3251549)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2511 (class 2606 OID 3251554)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2514 (class 2606 OID 3251569)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2515 (class 2606 OID 3251564)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2516 (class 2606 OID 3251559)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2466 (class 2606 OID 3251324)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2467 (class 2606 OID 3251319)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2461 (class 2606 OID 3251299)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2462 (class 2606 OID 3251294)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 3251274)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2498 (class 2606 OID 3251479)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2480 (class 2606 OID 3251389)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2454 (class 2606 OID 3251254)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2453 (class 2606 OID 3251259)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2499 (class 2606 OID 3251494)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2500 (class 2606 OID 3251489)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2501 (class 2606 OID 3251484)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2470 (class 2606 OID 3251329)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2468 (class 2606 OID 3251339)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2469 (class 2606 OID 3251334)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2484 (class 2606 OID 3251424)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2486 (class 2606 OID 3251414)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2487 (class 2606 OID 3251409)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2485 (class 2606 OID 3251419)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2452 (class 2606 OID 3251244)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2451 (class 2606 OID 3251249)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2497 (class 2606 OID 3251474)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2493 (class 2606 OID 3251454)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2507 (class 2606 OID 3251519)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2506 (class 2606 OID 3251524)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 3251309)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2465 (class 2606 OID 3251304)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2463 (class 2606 OID 3251314)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2509 (class 2606 OID 3251529)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2508 (class 2606 OID 3251534)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2521 (class 2606 OID 3251594)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2522 (class 2606 OID 3251589)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2519 (class 2606 OID 3251604)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2523 (class 2606 OID 3251584)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2520 (class 2606 OID 3251599)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2505 (class 2606 OID 3251514)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2488 (class 2606 OID 3251444)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2489 (class 2606 OID 3251439)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2491 (class 2606 OID 3251429)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2490 (class 2606 OID 3251434)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2517 (class 2606 OID 3251579)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2518 (class 2606 OID 3251574)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2471 (class 2606 OID 3251344)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2510 (class 2606 OID 3251539)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2455 (class 2606 OID 3251269)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2456 (class 2606 OID 3251264)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2459 (class 2606 OID 3251279)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 3251284)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2481 (class 2606 OID 3251404)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2482 (class 2606 OID 3251399)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2483 (class 2606 OID 3251394)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-12 16:29:05 CEST

--
-- PostgreSQL database dump complete
--

