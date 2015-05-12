--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-12 13:31:36 CEST

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
-- TOC entry 179 (class 1259 OID 3147225)
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
-- TOC entry 225 (class 1259 OID 3147712)
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
-- TOC entry 224 (class 1259 OID 3147695)
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
-- TOC entry 217 (class 1259 OID 3147606)
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
-- TOC entry 193 (class 1259 OID 3147390)
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
-- TOC entry 196 (class 1259 OID 3147431)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 3147352)
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
-- TOC entry 212 (class 1259 OID 3147556)
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
-- TOC entry 191 (class 1259 OID 3147377)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 3147425)
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
-- TOC entry 201 (class 1259 OID 3147474)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 3147499)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 3147326)
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
-- TOC entry 180 (class 1259 OID 3147234)
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
-- TOC entry 181 (class 1259 OID 3147245)
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
-- TOC entry 184 (class 1259 OID 3147296)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 3147199)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 3147218)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 3147506)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 3147536)
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
-- TOC entry 221 (class 1259 OID 3147651)
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
-- TOC entry 183 (class 1259 OID 3147276)
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
-- TOC entry 186 (class 1259 OID 3147318)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 3147480)
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
-- TOC entry 185 (class 1259 OID 3147303)
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
-- TOC entry 190 (class 1259 OID 3147369)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 3147492)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 3147597)
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
-- TOC entry 220 (class 1259 OID 3147644)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 3147521)
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
-- TOC entry 200 (class 1259 OID 3147465)
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
-- TOC entry 199 (class 1259 OID 3147455)
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
-- TOC entry 219 (class 1259 OID 3147634)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 3147587)
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
-- TOC entry 173 (class 1259 OID 3147170)
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
-- TOC entry 172 (class 1259 OID 3147168)
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
-- TOC entry 209 (class 1259 OID 3147530)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 3147208)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 3147192)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 3147544)
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
-- TOC entry 203 (class 1259 OID 3147486)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 3147436)
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
-- TOC entry 182 (class 1259 OID 3147268)
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
-- TOC entry 198 (class 1259 OID 3147442)
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
-- TOC entry 218 (class 1259 OID 3147622)
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
-- TOC entry 188 (class 1259 OID 3147338)
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
-- TOC entry 174 (class 1259 OID 3147179)
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
-- TOC entry 223 (class 1259 OID 3147676)
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
-- TOC entry 192 (class 1259 OID 3147384)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 3147513)
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
-- TOC entry 214 (class 1259 OID 3147579)
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
-- TOC entry 194 (class 1259 OID 3147412)
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
-- TOC entry 222 (class 1259 OID 3147666)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 3147569)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 3147173)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2640 (class 0 OID 3147225)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2686 (class 0 OID 3147712)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2685 (class 0 OID 3147695)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 3147606)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 3147390)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 3147431)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 3147352)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5551-e497-4ed2-60e3abf96157	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5551-e497-3c15-035fe10b6302	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5551-e497-386a-08a3025f43c3	AL	ALB	008	Albania 	Albanija	\N
00040000-5551-e497-fba9-61ebd001d770	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5551-e497-98eb-ad47798b7953	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5551-e497-3fa1-13199afbff5a	AD	AND	020	Andorra 	Andora	\N
00040000-5551-e497-03bd-66d572f0eba4	AO	AGO	024	Angola 	Angola	\N
00040000-5551-e497-f18b-073934e3f8ad	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5551-e497-db0e-9b9f1ef0f87a	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5551-e497-866e-f61d646785d4	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5551-e497-9d7d-fca98fa012df	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5551-e497-a64f-b0f8f7aaa907	AM	ARM	051	Armenia 	Armenija	\N
00040000-5551-e497-6678-6eb5da8d7341	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5551-e497-d11b-6d74e11b2470	AU	AUS	036	Australia 	Avstralija	\N
00040000-5551-e497-9369-b311b01df118	AT	AUT	040	Austria 	Avstrija	\N
00040000-5551-e497-59f5-7e6ee06a1663	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5551-e497-bd48-c478cf384bbf	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5551-e497-9b18-8378cfce890e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5551-e497-29e5-b6d99226d33e	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5551-e497-4515-d2f05471c1e8	BB	BRB	052	Barbados 	Barbados	\N
00040000-5551-e497-a6dd-60455c8d9a93	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5551-e497-626d-aee081f2c2cb	BE	BEL	056	Belgium 	Belgija	\N
00040000-5551-e497-df07-f985d4c5f216	BZ	BLZ	084	Belize 	Belize	\N
00040000-5551-e497-0471-07ffdea764d8	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5551-e497-33e5-3ff9d96dcc31	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5551-e497-d8d8-e2091eaff699	BT	BTN	064	Bhutan 	Butan	\N
00040000-5551-e497-c63a-3e95fab8c43c	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5551-e497-4a95-f4e52bb8bf69	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5551-e497-e65f-fb1db03577f4	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5551-e497-295e-a7e4db08d973	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5551-e497-c5c9-cdd047269836	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5551-e497-57a3-5ddffe46e0fc	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5551-e497-aa67-562a854fb650	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5551-e497-cd66-5678275bbca4	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5551-e497-fa05-1306abec8e0e	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5551-e497-19a9-cbb02dd5cedd	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5551-e497-5705-7017ddd2da33	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5551-e497-99c5-6278294950b4	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5551-e497-fe2e-aa91027e7801	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5551-e497-5174-2bb7f44ef51f	CA	CAN	124	Canada 	Kanada	\N
00040000-5551-e497-e106-2b9f7591ae86	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5551-e497-24a2-c9367cea83e6	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5551-e497-bf93-7fb82598036c	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5551-e497-e6d3-fcef03908ea6	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5551-e497-629f-dc431a6d9a93	CL	CHL	152	Chile 	Čile	\N
00040000-5551-e497-e2b5-c018db9e24aa	CN	CHN	156	China 	Kitajska	\N
00040000-5551-e497-d1d4-e671207ddd60	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5551-e497-6ab4-c2055ddf34b7	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5551-e497-3881-8bcc4c4f8478	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5551-e497-e4b3-cc410bbb2e03	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5551-e497-1ef3-54d054707e4f	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5551-e497-1d92-2933437811a1	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5551-e497-95ca-89e3bc28666e	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5551-e497-5519-380543dedab3	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5551-e497-05af-9491e394fdd4	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5551-e497-c13f-baae3266969b	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5551-e497-7ebd-cc9ba42a00f9	CU	CUB	192	Cuba 	Kuba	\N
00040000-5551-e497-767c-a548eef27a8a	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5551-e497-a46f-b5b8e054cd50	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5551-e497-0171-97df38aa870a	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5551-e497-8197-37a2f52a0ea4	DK	DNK	208	Denmark 	Danska	\N
00040000-5551-e497-9806-f454375a1556	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5551-e497-13e0-d5ad9ae2716e	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5551-e497-8cdd-8c377da02de0	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5551-e497-88f4-746a2cb5e134	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5551-e497-fe49-13b4184b769b	EG	EGY	818	Egypt 	Egipt	\N
00040000-5551-e497-3da8-5dbb6270b5b3	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5551-e497-4173-4069bed5c51a	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5551-e497-dbcb-48176275d4a8	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5551-e497-75d3-974f4eec1beb	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5551-e497-5fd1-2ed3b35c5afd	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5551-e497-2d91-8d10a58db5fb	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5551-e497-d042-40f5197b0202	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5551-e497-904b-f0dc19177ec6	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5551-e497-aff6-ed6c8bd5fd97	FI	FIN	246	Finland 	Finska	\N
00040000-5551-e497-1f63-ee6a334b03df	FR	FRA	250	France 	Francija	\N
00040000-5551-e497-d757-4d1176c7c4b4	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5551-e497-4f25-ea5d8ed58de4	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5551-e497-5454-7e42257c2db8	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5551-e497-5b45-d1a47636d862	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5551-e497-4450-ae4dea68d04e	GA	GAB	266	Gabon 	Gabon	\N
00040000-5551-e497-d729-afeba75220a8	GM	GMB	270	Gambia 	Gambija	\N
00040000-5551-e497-601c-705d09eff9a9	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5551-e497-a66c-711bb9a55b07	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5551-e497-2622-e6d419e77829	GH	GHA	288	Ghana 	Gana	\N
00040000-5551-e497-7ad3-5c31d611d92b	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5551-e497-2e9c-12c0ae86b3a2	GR	GRC	300	Greece 	Grčija	\N
00040000-5551-e497-b28c-83cc56766848	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5551-e497-dfa1-f8b619fa1f9a	GD	GRD	308	Grenada 	Grenada	\N
00040000-5551-e497-09ac-3b1ee24cc007	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5551-e497-f25c-cd68cf5766da	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5551-e497-1d1a-5273666ceb90	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5551-e497-83d3-fe6c0df74a22	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5551-e497-b7b6-c5e7fdd2d89f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5551-e497-2177-aab9db0dc881	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5551-e497-e52d-b2b949eb3fff	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5551-e497-b708-04aeac47fefd	HT	HTI	332	Haiti 	Haiti	\N
00040000-5551-e497-28d6-3807836ff312	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5551-e497-e64e-f01a76167202	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5551-e497-b943-6ff3ec21cb48	HN	HND	340	Honduras 	Honduras	\N
00040000-5551-e497-be29-2d0781b50e85	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5551-e497-ceae-7dcd09f71f2f	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5551-e497-1c28-7d111274d468	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5551-e497-b0ce-b9e96079f826	IN	IND	356	India 	Indija	\N
00040000-5551-e497-c131-5f3788d23eb2	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5551-e497-a7fc-84ce4b8d2336	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5551-e497-ee16-68f2f9eacea0	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5551-e497-7c26-232e8c32f781	IE	IRL	372	Ireland 	Irska	\N
00040000-5551-e497-705c-ae21e33a90fd	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5551-e497-80d1-5607061a80a6	IL	ISR	376	Israel 	Izrael	\N
00040000-5551-e497-3e27-915308de128a	IT	ITA	380	Italy 	Italija	\N
00040000-5551-e497-298a-f69fe9229c24	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5551-e497-d081-4803e80db5ee	JP	JPN	392	Japan 	Japonska	\N
00040000-5551-e497-7805-840675dae0b6	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5551-e497-00b3-d378e946a81d	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5551-e497-8207-a1f21c7fce9a	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5551-e497-3443-847b37c3a42b	KE	KEN	404	Kenya 	Kenija	\N
00040000-5551-e497-6b75-f0be2356348c	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5551-e497-5b70-c851eaa92f85	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5551-e497-7e4f-40161f9f2b3a	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5551-e497-50d4-d2bdfcaca04c	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5551-e497-477b-fed223418f8b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5551-e497-1dca-379122b9d076	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5551-e497-a237-4aaed07bbca4	LV	LVA	428	Latvia 	Latvija	\N
00040000-5551-e497-ef02-274d3fa0fc06	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5551-e497-32a1-0ea5ad653dd3	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5551-e497-3196-4c33f57c7059	LR	LBR	430	Liberia 	Liberija	\N
00040000-5551-e497-0ed5-e5ded614f815	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5551-e497-3d2f-aa6fafde6c2c	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5551-e497-87ca-953e643c89c9	LT	LTU	440	Lithuania 	Litva	\N
00040000-5551-e497-3c22-3661193754f6	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5551-e497-bcf0-39f119a1b449	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5551-e497-f10b-9e4ed26781c3	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5551-e497-3176-41a030685c83	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5551-e497-9710-ca9d47e0e32c	MW	MWI	454	Malawi 	Malavi	\N
00040000-5551-e497-8f86-b8e39fb32c25	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5551-e497-3c7f-ae3bda564f31	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5551-e497-3ca9-d0d05fafc501	ML	MLI	466	Mali 	Mali	\N
00040000-5551-e497-9555-0cb2bf24bee8	MT	MLT	470	Malta 	Malta	\N
00040000-5551-e497-75a6-b057c8f554e7	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5551-e497-539d-d6c0f93135a7	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5551-e497-4846-f9967feafdac	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5551-e497-18e8-c2d19d4b4817	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5551-e497-e823-a976a134342f	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5551-e497-5ee5-4720b5ef0357	MX	MEX	484	Mexico 	Mehika	\N
00040000-5551-e497-b63d-cda7f4a904dc	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5551-e497-f6f1-566413d2710a	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5551-e497-3dd0-74d196114b36	MC	MCO	492	Monaco 	Monako	\N
00040000-5551-e497-ebb4-f929ac07def9	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5551-e497-d3e5-5cff8d288e2c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5551-e497-e507-a9c044791977	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5551-e497-93cd-2daec7bdbcd5	MA	MAR	504	Morocco 	Maroko	\N
00040000-5551-e497-6be8-b2aca6f4ea57	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5551-e497-c2f0-984161ac6cc2	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5551-e497-a7e3-5d577b7888dc	NA	NAM	516	Namibia 	Namibija	\N
00040000-5551-e497-4e0d-dceb0834783e	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5551-e497-303b-aaaeecfdf3a6	NP	NPL	524	Nepal 	Nepal	\N
00040000-5551-e497-2bc3-0be8fb28d78a	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5551-e497-64e3-785a76a90e00	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5551-e497-287b-ab0d982b0f61	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5551-e497-b2f7-26ef7d2bf0f9	NE	NER	562	Niger 	Niger 	\N
00040000-5551-e497-f4a3-b044dd257a8a	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5551-e497-222f-b1c03086bd4f	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5551-e497-6971-d2ff1ecd0678	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5551-e497-6f13-c9958f645d2e	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5551-e497-473a-5eeeecdcb5c1	NO	NOR	578	Norway 	Norveška	\N
00040000-5551-e497-cec8-db4d5608b42f	OM	OMN	512	Oman 	Oman	\N
00040000-5551-e497-653f-18ae4b77a6d0	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5551-e497-4578-4585dbc49916	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5551-e497-a43a-1c90079527ed	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5551-e497-86dd-f08634091a07	PA	PAN	591	Panama 	Panama	\N
00040000-5551-e497-199b-271ee0814907	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5551-e497-f924-e95820d4ab41	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5551-e497-5568-e441aad297ce	PE	PER	604	Peru 	Peru	\N
00040000-5551-e497-8bf0-6ead1830cf89	PH	PHL	608	Philippines 	Filipini	\N
00040000-5551-e497-f9d5-045aa7ba0718	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5551-e497-e4fb-8b4b4e5f4c8d	PL	POL	616	Poland 	Poljska	\N
00040000-5551-e497-1563-439839334c51	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5551-e497-cb80-8058b3e56f6f	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5551-e497-4ab3-a76219e458bb	QA	QAT	634	Qatar 	Katar	\N
00040000-5551-e497-e91a-09fd954e58c1	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5551-e497-e6a6-2f90cdec1680	RO	ROU	642	Romania 	Romunija	\N
00040000-5551-e497-4e56-c84b9b6da248	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5551-e497-23b3-9a40e23fd56f	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5551-e497-1aa2-23b2ab6e4082	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5551-e497-9905-1c5fd4137672	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5551-e497-83bf-71f80c09046a	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5551-e497-b61c-16e1b3fa8941	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5551-e497-eb31-53a097c46fbf	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5551-e497-9d0c-40afd6b4e027	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5551-e497-cdba-d34ad50fc61d	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5551-e497-4cb2-ffe6837a0c37	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5551-e497-0341-12ffb596b168	SM	SMR	674	San Marino 	San Marino	\N
00040000-5551-e497-6eac-3d485caf1e1e	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5551-e497-d80c-fe791e1f39b3	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5551-e497-22ac-51d195f0cf1e	SN	SEN	686	Senegal 	Senegal	\N
00040000-5551-e497-38f1-cf255968b00f	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5551-e497-6986-c6f9dbfad17a	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5551-e497-5c36-36a570d2b925	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5551-e497-40b5-741b7f7e17f0	SG	SGP	702	Singapore 	Singapur	\N
00040000-5551-e497-373a-0170d7b2981b	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5551-e497-626d-7c9c6b451678	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5551-e497-10b6-0c0e496ad2cc	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5551-e497-848a-af315d1cb0fd	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5551-e497-f988-4028b03acb96	SO	SOM	706	Somalia 	Somalija	\N
00040000-5551-e497-c87b-87f60944bda0	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5551-e497-8146-34bad8efa04c	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5551-e497-2d22-abd135bce76f	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5551-e497-1593-745af4700665	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5551-e497-d980-66a2f0b2b39d	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5551-e497-c27e-9d3b6fca24d1	SD	SDN	729	Sudan 	Sudan	\N
00040000-5551-e497-fb26-48e0cb2c35d6	SR	SUR	740	Suriname 	Surinam	\N
00040000-5551-e497-4e38-7e5981c74831	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5551-e497-92f1-b376d05aab52	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5551-e497-f328-0512b38c7cd7	SE	SWE	752	Sweden 	Švedska	\N
00040000-5551-e497-f404-23a887af7498	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5551-e497-93c1-647382a3cb39	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5551-e497-db79-e6f7ebd962e2	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5551-e497-ed01-ac3bafa2f9a7	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5551-e497-1cb3-b5997e8b8d3e	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5551-e497-7496-5ed8bc7b2463	TH	THA	764	Thailand 	Tajska	\N
00040000-5551-e497-0eea-9c8a64292af9	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5551-e497-41fc-52bf0d04b640	TG	TGO	768	Togo 	Togo	\N
00040000-5551-e497-078c-e2d7e3151190	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5551-e497-a7ad-023a581c8ccd	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5551-e497-0a79-6c10f324606c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5551-e497-eb5a-d2ac049fda29	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5551-e497-0b2d-71a653f527f6	TR	TUR	792	Turkey 	Turčija	\N
00040000-5551-e497-d9d9-c4159c0b010e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5551-e497-2ccb-bcbaac9dc7a0	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5551-e497-886e-dda7a94f1086	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5551-e497-1a3c-66f8e3719eee	UG	UGA	800	Uganda 	Uganda	\N
00040000-5551-e497-3bc6-5b43392865f9	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5551-e497-2ac1-79f5aaa1618c	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5551-e497-8013-995a54fa6041	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5551-e497-57a1-edd77cab7f2b	US	USA	840	United States 	Združene države Amerike	\N
00040000-5551-e497-1a41-02d6b5447503	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5551-e497-3384-2775a1877b3e	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5551-e497-3d43-e70e0b302d26	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5551-e497-3a68-53b49bdb4721	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5551-e497-3073-5c78eedef032	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5551-e497-4fab-c0a9e652c510	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5551-e497-7a37-e28a6e8b2f58	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5551-e497-2a24-b044c21000cb	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5551-e497-0f9b-3f721ba3ab41	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5551-e497-fe06-6dc6dd5169a6	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5551-e497-02f2-f744c10c2f73	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5551-e497-b9c8-e36e8893de50	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5551-e497-57d0-11e9f7776fed	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2673 (class 0 OID 3147556)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 3147377)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 3147425)
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
-- TOC entry 2662 (class 0 OID 3147474)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 3147499)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 3147326)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5551-e497-1575-fd7a47237153	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5551-e497-a732-7875bd340f6e	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5551-e497-ab0c-4298830f3479	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5551-e497-9577-0072365d0121	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5551-e497-0ecc-16058dbbb746	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5551-e497-9705-28bc1c390875	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5551-e497-aad2-cb6e3194274a	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5551-e497-68a0-3d73e79144c3	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5551-e497-a1ed-fdf193ae73b1	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5551-e497-bab2-a90209ecaf5d	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2641 (class 0 OID 3147234)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5551-e497-c219-f4122f38bcee	00000000-5551-e497-0ecc-16058dbbb746	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5551-e497-e101-069517a4bd27	00000000-5551-e497-0ecc-16058dbbb746	00010000-5551-e497-fd12-76fa04a51ff7	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5551-e497-8afb-95823a3febf6	00000000-5551-e497-9705-28bc1c390875	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2642 (class 0 OID 3147245)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 3147296)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 3147199)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5551-e497-8a05-6731a93e7565	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5551-e497-d482-7c824bac4661	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5551-e497-0ae6-333ef7a31d22	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5551-e497-4a5b-2cb65d847e30	Abonma-read	Abonma - branje	f
00030000-5551-e497-81b8-d76b90433c70	Abonma-write	Abonma - spreminjanje	f
00030000-5551-e497-2240-797eccf929d8	Alternacija-read	Alternacija - branje	f
00030000-5551-e497-c383-5cc627668bda	Alternacija-write	Alternacija - spreminjanje	f
00030000-5551-e497-5e65-8019e1ef9cc2	Arhivalija-read	Arhivalija - branje	f
00030000-5551-e497-c0a8-c2a69c568ab3	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5551-e497-5d26-013385297d9e	Besedilo-read	Besedilo - branje	f
00030000-5551-e497-e57b-0ee41cb4084c	Besedilo-write	Besedilo - spreminjanje	f
00030000-5551-e497-e0b5-0227dca15959	DogodekIzven-read	DogodekIzven - branje	f
00030000-5551-e497-06ae-aa41af87f16a	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5551-e497-7601-08fb2273948c	Dogodek-read	Dogodek - branje	f
00030000-5551-e497-089a-4adf380484a0	Dogodek-write	Dogodek - spreminjanje	f
00030000-5551-e497-3c5a-97281f1005b9	Drzava-read	Drzava - branje	f
00030000-5551-e497-8927-9749e376d91f	Drzava-write	Drzava - spreminjanje	f
00030000-5551-e497-138a-c6aa2c7d9d0a	Funkcija-read	Funkcija - branje	f
00030000-5551-e497-5353-d9cd80049970	Funkcija-write	Funkcija - spreminjanje	f
00030000-5551-e497-3b36-187e9564e258	Gostovanje-read	Gostovanje - branje	f
00030000-5551-e497-bc1c-e1493963a307	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5551-e497-ae0f-571ee2cf8de2	Gostujoca-read	Gostujoca - branje	f
00030000-5551-e497-f1e8-eeb7c59ff8df	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5551-e497-e1ec-be183278fc10	Kupec-read	Kupec - branje	f
00030000-5551-e497-e39d-a176efaec074	Kupec-write	Kupec - spreminjanje	f
00030000-5551-e497-2fa0-489b9632c2e0	NacinPlacina-read	NacinPlacina - branje	f
00030000-5551-e497-cc35-e582fd739c3b	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5551-e497-dc23-c7b59bb3f799	Option-read	Option - branje	f
00030000-5551-e497-584d-996c43cf4e8c	Option-write	Option - spreminjanje	f
00030000-5551-e497-1e6f-1f3fe7ecba92	OptionValue-read	OptionValue - branje	f
00030000-5551-e497-600d-9cd99b12dbd1	OptionValue-write	OptionValue - spreminjanje	f
00030000-5551-e497-28a1-e20072ff6176	Oseba-read	Oseba - branje	f
00030000-5551-e497-64d2-0fd9b708337b	Oseba-write	Oseba - spreminjanje	f
00030000-5551-e497-d477-04f05eb7aff0	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5551-e497-912a-5523fc7b53dc	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5551-e497-5701-2f68369ac640	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5551-e497-25bb-4afdfcac1e1d	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5551-e497-17e6-74d5587f8ee4	Pogodba-read	Pogodba - branje	f
00030000-5551-e497-b89a-0533512256fa	Pogodba-write	Pogodba - spreminjanje	f
00030000-5551-e497-b656-af1023aecac3	Popa-read	Popa - branje	f
00030000-5551-e497-0fcc-91ef87678885	Popa-write	Popa - spreminjanje	f
00030000-5551-e497-913b-7c3463262d86	Posta-read	Posta - branje	f
00030000-5551-e497-4141-47ca63bc3a95	Posta-write	Posta - spreminjanje	f
00030000-5551-e497-2957-676127a0ffc3	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5551-e497-1600-5b3efd2c7046	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5551-e497-9b99-4ee5b358fa6c	PostniNaslov-read	PostniNaslov - branje	f
00030000-5551-e497-f025-bbc249fc02f7	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5551-e497-59ae-0b9a54dc0f20	Predstava-read	Predstava - branje	f
00030000-5551-e497-a826-b8b73a0cd149	Predstava-write	Predstava - spreminjanje	f
00030000-5551-e497-2175-2524df576b0c	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5551-e497-4b1d-3a2836aab063	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5551-e497-a772-48c4945fe4e5	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5551-e497-cedf-7f0cfd1cf6d0	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5551-e497-c8e1-b17dc86f767e	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5551-e497-35a6-de2605cc673d	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5551-e497-d160-6ad4319fd4fc	Prostor-read	Prostor - branje	f
00030000-5551-e497-44b2-f016233f2bc7	Prostor-write	Prostor - spreminjanje	f
00030000-5551-e497-e082-b7a652041a04	Racun-read	Racun - branje	f
00030000-5551-e497-9c37-c8d5cd56dd94	Racun-write	Racun - spreminjanje	f
00030000-5551-e497-54d8-06af02975c85	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5551-e497-8576-e6280a8a7c3b	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5551-e497-50b7-3c80cd092768	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5551-e497-189f-b64b3460dca9	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5551-e497-efb3-edf65584ac6b	Rekvizit-read	Rekvizit - branje	f
00030000-5551-e497-0be8-30e2f6a2c5fa	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5551-e497-27b3-568690be1377	Rezervacija-read	Rezervacija - branje	f
00030000-5551-e497-6459-74764ba163c0	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5551-e497-31e3-965ab61fc7aa	SedezniRed-read	SedezniRed - branje	f
00030000-5551-e497-9e7d-2efbd3d1eccf	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5551-e497-383c-beefc1d2505a	Sedez-read	Sedez - branje	f
00030000-5551-e497-3504-ab3d0301b1fa	Sedez-write	Sedez - spreminjanje	f
00030000-5551-e497-b827-15bf78688e84	Sezona-read	Sezona - branje	f
00030000-5551-e497-eb31-d8bca6711e32	Sezona-write	Sezona - spreminjanje	f
00030000-5551-e497-39c7-09f41876f908	Telefonska-read	Telefonska - branje	f
00030000-5551-e497-73c6-a1a204230ec6	Telefonska-write	Telefonska - spreminjanje	f
00030000-5551-e497-9ec8-fc3b8e8c54ab	TerminStoritve-read	TerminStoritve - branje	f
00030000-5551-e497-1045-3838a8f0f9e5	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5551-e497-f8e0-d4db5294ebb7	TipFunkcije-read	TipFunkcije - branje	f
00030000-5551-e497-6998-0e96e2552a41	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5551-e497-31a2-52e8cedb2b5f	Trr-read	Trr - branje	f
00030000-5551-e497-ae3c-d25efe8ee021	Trr-write	Trr - spreminjanje	f
00030000-5551-e497-53a3-1b3da912ce09	Uprizoritev-read	Uprizoritev - branje	f
00030000-5551-e497-838a-75252003f195	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5551-e497-0e61-494dd0b41a58	Vaja-read	Vaja - branje	f
00030000-5551-e497-9219-5c35f906e0d1	Vaja-write	Vaja - spreminjanje	f
00030000-5551-e497-a122-60ba4fc2d795	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5551-e497-0bf4-445221468727	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5551-e497-0b27-81600abe3f32	Zaposlitev-read	Zaposlitev - branje	f
00030000-5551-e497-384c-5243a0a4d4e4	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5551-e497-9c60-f1d73dbe26f7	Zasedenost-read	Zasedenost - branje	f
00030000-5551-e497-b9cf-129c2174d295	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5551-e497-1fb3-556446e2880c	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5551-e497-1aee-b131a1a0186a	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5551-e497-0212-4a5d3d01f781	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5551-e497-11b7-7ce266ee68e0	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2639 (class 0 OID 3147218)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5551-e497-0ad1-9319635791cd	00030000-5551-e497-3c5a-97281f1005b9
00020000-5551-e497-ccbe-68230424db5a	00030000-5551-e497-8927-9749e376d91f
00020000-5551-e497-ccbe-68230424db5a	00030000-5551-e497-3c5a-97281f1005b9
\.


--
-- TOC entry 2667 (class 0 OID 3147506)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 3147536)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 3147651)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 3147276)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 3147318)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5551-e497-f478-6860be3476da	8341	Adlešiči
00050000-5551-e497-9717-4ec49385cb9e	5270	Ajdovščina
00050000-5551-e497-ce40-21c2c3b3e5d7	6280	Ankaran/Ancarano
00050000-5551-e497-ce19-536aa96e6c02	9253	Apače
00050000-5551-e497-1893-f0fa948d4a0b	8253	Artiče
00050000-5551-e497-e901-3975e27ff765	4275	Begunje na Gorenjskem
00050000-5551-e497-992e-0421381cc358	1382	Begunje pri Cerknici
00050000-5551-e497-603e-e15537d99228	9231	Beltinci
00050000-5551-e497-26c8-6f0127b44cbd	2234	Benedikt
00050000-5551-e497-8370-667f80981368	2345	Bistrica ob Dravi
00050000-5551-e497-7a06-9162ed1defd3	3256	Bistrica ob Sotli
00050000-5551-e497-ab4c-9f5e825deb42	8259	Bizeljsko
00050000-5551-e497-8ce0-ace9fa57b6e6	1223	Blagovica
00050000-5551-e497-fd1a-16a5a53b5897	8283	Blanca
00050000-5551-e497-f1a6-b7b87c0acb22	4260	Bled
00050000-5551-e497-664c-81ec736ecd11	4273	Blejska Dobrava
00050000-5551-e497-b26d-a33f6b0dd465	9265	Bodonci
00050000-5551-e497-e73c-35051b806927	9222	Bogojina
00050000-5551-e497-f73b-92e7c050f29f	4263	Bohinjska Bela
00050000-5551-e497-4dac-5575b4ca1b96	4264	Bohinjska Bistrica
00050000-5551-e497-aaf9-728dff9a4dfa	4265	Bohinjsko jezero
00050000-5551-e497-bbd9-4f6b60bedb6b	1353	Borovnica
00050000-5551-e497-95ee-d61378df65f4	8294	Boštanj
00050000-5551-e497-82f2-2affe313b7ea	5230	Bovec
00050000-5551-e497-9a7c-aa82caec46b0	5295	Branik
00050000-5551-e497-9b75-2b5074b38535	3314	Braslovče
00050000-5551-e497-22e0-732062c9032f	5223	Breginj
00050000-5551-e497-6203-03b859c69f7b	8280	Brestanica
00050000-5551-e497-009e-0214f33b45c3	2354	Bresternica
00050000-5551-e497-9ea9-6c9ae838c7eb	4243	Brezje
00050000-5551-e497-6d96-992cd54e65a3	1351	Brezovica pri Ljubljani
00050000-5551-e497-be90-00dff4584e5a	8250	Brežice
00050000-5551-e497-953d-d115d12933f9	4210	Brnik - Aerodrom
00050000-5551-e497-9506-2fda953c0e35	8321	Brusnice
00050000-5551-e497-45c8-6b93436103ba	3255	Buče
00050000-5551-e497-8a69-278abb96216a	8276	Bučka 
00050000-5551-e497-be25-466cd6c062d2	9261	Cankova
00050000-5551-e497-271f-f4a1a2828492	3000	Celje 
00050000-5551-e497-17df-3353fc3176b8	3001	Celje - poštni predali
00050000-5551-e497-0b99-bbd1ef296368	4207	Cerklje na Gorenjskem
00050000-5551-e497-d930-cf063d4bf5e8	8263	Cerklje ob Krki
00050000-5551-e497-10af-eaf5a8f06442	1380	Cerknica
00050000-5551-e497-24bc-5a681ac25a14	5282	Cerkno
00050000-5551-e497-e43a-570df9126838	2236	Cerkvenjak
00050000-5551-e497-5dc2-a39900b8aca6	2215	Ceršak
00050000-5551-e497-08d7-ef7ac14f7cfe	2326	Cirkovce
00050000-5551-e497-75e2-abeb6302bfa0	2282	Cirkulane
00050000-5551-e497-d301-32acd78f7be0	5273	Col
00050000-5551-e497-4256-fdb4f015d51f	8251	Čatež ob Savi
00050000-5551-e497-1bdb-998484477521	1413	Čemšenik
00050000-5551-e497-4d7a-0ccb86bfafdc	5253	Čepovan
00050000-5551-e497-c29f-e14d560aff2b	9232	Črenšovci
00050000-5551-e497-25bd-d0c2085b33ae	2393	Črna na Koroškem
00050000-5551-e497-9003-6c4cfef91bf0	6275	Črni Kal
00050000-5551-e497-bce7-020eb15b6f42	5274	Črni Vrh nad Idrijo
00050000-5551-e497-e168-288a1a625f28	5262	Črniče
00050000-5551-e497-ead6-f46eefc754f3	8340	Črnomelj
00050000-5551-e497-6763-a24c30280abe	6271	Dekani
00050000-5551-e497-a151-7ee450e5fc67	5210	Deskle
00050000-5551-e497-0170-4f2b873f6cdd	2253	Destrnik
00050000-5551-e497-7e3c-de91761060e3	6215	Divača
00050000-5551-e497-1667-59d155fc556c	1233	Dob
00050000-5551-e497-67d7-17b3779b09fe	3224	Dobje pri Planini
00050000-5551-e497-acee-544bdea13835	8257	Dobova
00050000-5551-e497-fe82-b52f471a2bc6	1423	Dobovec
00050000-5551-e497-ed03-f2f6fe7dbeb6	5263	Dobravlje
00050000-5551-e497-53c5-9a804af54bcd	3204	Dobrna
00050000-5551-e497-78ce-9225daea69dc	8211	Dobrnič
00050000-5551-e497-6bab-592a5c1c2971	1356	Dobrova
00050000-5551-e497-eec0-c46fa24f8c62	9223	Dobrovnik/Dobronak 
00050000-5551-e497-d0f4-642f81a73e93	5212	Dobrovo v Brdih
00050000-5551-e497-f078-69c9061892cb	1431	Dol pri Hrastniku
00050000-5551-e497-ad19-4bf319969dd1	1262	Dol pri Ljubljani
00050000-5551-e497-4c3a-983f93ef3caf	1273	Dole pri Litiji
00050000-5551-e497-ccd2-d338f8080363	1331	Dolenja vas
00050000-5551-e497-e693-3663038023fd	8350	Dolenjske Toplice
00050000-5551-e497-de1b-b41a55908769	1230	Domžale
00050000-5551-e497-bd38-82e03458711c	2252	Dornava
00050000-5551-e497-a471-be3f6edfd534	5294	Dornberk
00050000-5551-e497-cd58-828c7b20c225	1319	Draga
00050000-5551-e497-f117-d724a8225400	8343	Dragatuš
00050000-5551-e497-5492-813bc82868ca	3222	Dramlje
00050000-5551-e497-9af5-d3deac2d75b3	2370	Dravograd
00050000-5551-e497-fcba-4f112e1bb5d2	4203	Duplje
00050000-5551-e497-d1af-fd704de3b801	6221	Dutovlje
00050000-5551-e497-479e-cb1f2184f439	8361	Dvor
00050000-5551-e497-13f6-1e62bed2006a	2343	Fala
00050000-5551-e497-0fec-6fc833bdec20	9208	Fokovci
00050000-5551-e497-6c9c-77e97a2151f4	2313	Fram
00050000-5551-e497-9eb3-dc87487d0ef3	3213	Frankolovo
00050000-5551-e497-a906-7385772f2fe7	1274	Gabrovka
00050000-5551-e497-64a5-e21a4f57879e	8254	Globoko
00050000-5551-e497-42a4-0a9c893c81a2	5275	Godovič
00050000-5551-e497-28aa-e85f4e76aed8	4204	Golnik
00050000-5551-e497-7b5e-c3a3661dd53b	3303	Gomilsko
00050000-5551-e497-d447-c09385c8f8b3	4224	Gorenja vas
00050000-5551-e497-15d3-d694c14bf4c2	3263	Gorica pri Slivnici
00050000-5551-e497-ca63-9f5395c2ab2f	2272	Gorišnica
00050000-5551-e497-5ca8-4b03641a6c7b	9250	Gornja Radgona
00050000-5551-e497-bb53-acfab0b09c7b	3342	Gornji Grad
00050000-5551-e497-df6b-9e2a91d9b534	4282	Gozd Martuljek
00050000-5551-e497-50ca-e4d749843e39	6272	Gračišče
00050000-5551-e497-001b-384979db61bf	9264	Grad
00050000-5551-e497-a848-3e8d29810800	8332	Gradac
00050000-5551-e497-5618-787db1f0235d	1384	Grahovo
00050000-5551-e497-9d6c-fcb38d8ec642	5242	Grahovo ob Bači
00050000-5551-e497-cc21-50d7fbed8a4d	5251	Grgar
00050000-5551-e497-221b-676ca24cc108	3302	Griže
00050000-5551-e497-958f-731fd8f56275	3231	Grobelno
00050000-5551-e497-5989-716b4a37bd15	1290	Grosuplje
00050000-5551-e497-4b53-c43d01be15f1	2288	Hajdina
00050000-5551-e497-8c20-38b364315527	8362	Hinje
00050000-5551-e497-eb36-d997bfbbcd7e	2311	Hoče
00050000-5551-e497-524d-22d0ad5ca5de	9205	Hodoš/Hodos
00050000-5551-e497-be9b-a52a83ba6158	1354	Horjul
00050000-5551-e497-240f-c2a57b10ddf0	1372	Hotedršica
00050000-5551-e497-3039-f0f71ac66988	1430	Hrastnik
00050000-5551-e497-ae88-89d0dbb7813a	6225	Hruševje
00050000-5551-e497-27fd-109200bdad3e	4276	Hrušica
00050000-5551-e497-90be-4cf41d234e03	5280	Idrija
00050000-5551-e497-f605-61e413c75f11	1292	Ig
00050000-5551-e497-ded1-d19b63dd631c	6250	Ilirska Bistrica
00050000-5551-e497-6ba4-e67459bed7be	6251	Ilirska Bistrica-Trnovo
00050000-5551-e497-fc38-95d7c3daef67	1295	Ivančna Gorica
00050000-5551-e497-209f-534cff22139e	2259	Ivanjkovci
00050000-5551-e497-95bd-910c13e183d2	1411	Izlake
00050000-5551-e497-3699-4119a330b53f	6310	Izola/Isola
00050000-5551-e497-449c-d6e9132ab9e7	2222	Jakobski Dol
00050000-5551-e497-6e0e-5c8e44a56726	2221	Jarenina
00050000-5551-e497-2901-8629a608c5df	6254	Jelšane
00050000-5551-e497-68a4-6213f0162179	4270	Jesenice
00050000-5551-e497-3aaf-d1001fe00eef	8261	Jesenice na Dolenjskem
00050000-5551-e497-fae7-dad7fe64be37	3273	Jurklošter
00050000-5551-e497-fdd8-4bf816830ffa	2223	Jurovski Dol
00050000-5551-e497-48ca-e37c2a6b68a1	2256	Juršinci
00050000-5551-e497-b28a-ed0f93730139	5214	Kal nad Kanalom
00050000-5551-e497-ac48-f7b1b5f3e6bb	3233	Kalobje
00050000-5551-e497-4026-d3054a10e439	4246	Kamna Gorica
00050000-5551-e497-9ab4-9a931f4aa246	2351	Kamnica
00050000-5551-e497-0107-c6f8ca084428	1241	Kamnik
00050000-5551-e497-1c85-e5ac7877207b	5213	Kanal
00050000-5551-e497-a765-7fcdcc2f2bc4	8258	Kapele
00050000-5551-e497-0b7b-d053a400c0b7	2362	Kapla
00050000-5551-e497-f0c5-e1bfecb306d2	2325	Kidričevo
00050000-5551-e497-7329-755859803202	1412	Kisovec
00050000-5551-e497-e958-76ee546895c7	6253	Knežak
00050000-5551-e497-b2a0-4097f467cdf8	5222	Kobarid
00050000-5551-e497-2a26-0f43c5fc21a6	9227	Kobilje
00050000-5551-e497-b2f5-d9dc4c91d107	1330	Kočevje
00050000-5551-e497-0ac0-5afb6f0f9421	1338	Kočevska Reka
00050000-5551-e497-fa1d-a1e1cb3844d7	2276	Kog
00050000-5551-e497-a4a7-f09c3f480210	5211	Kojsko
00050000-5551-e497-eed8-e064f7b1b4c2	6223	Komen
00050000-5551-e497-6989-2cdb4375cd52	1218	Komenda
00050000-5551-e497-20d1-e300a179039d	6000	Koper/Capodistria 
00050000-5551-e497-4f36-2e5630eb364f	6001	Koper/Capodistria - poštni predali
00050000-5551-e497-2f66-81c280664ff7	8282	Koprivnica
00050000-5551-e497-43c7-481e262810df	5296	Kostanjevica na Krasu
00050000-5551-e497-aa55-5d7ce15f7e9c	8311	Kostanjevica na Krki
00050000-5551-e497-1d6a-3620430c7f77	1336	Kostel
00050000-5551-e497-71a1-ca1e4cbc3773	6256	Košana
00050000-5551-e497-d67f-a2ba9fe7ac39	2394	Kotlje
00050000-5551-e497-ce5d-af4214be2541	6240	Kozina
00050000-5551-e497-0361-e78f2abb9534	3260	Kozje
00050000-5551-e497-260d-d3ecebc74027	4000	Kranj 
00050000-5551-e497-7bb0-ad199795d7df	4001	Kranj - poštni predali
00050000-5551-e497-fcb3-9afba6311480	4280	Kranjska Gora
00050000-5551-e497-f4cf-1a0b9c91c645	1281	Kresnice
00050000-5551-e497-dc8b-74c50dd1b4c2	4294	Križe
00050000-5551-e497-f5b1-a47c5a01d263	9206	Križevci
00050000-5551-e497-684d-d99b14a68483	9242	Križevci pri Ljutomeru
00050000-5551-e497-7b6e-c2ed497c0689	1301	Krka
00050000-5551-e497-2189-5548b2f302ae	8296	Krmelj
00050000-5551-e497-ad32-a0fd59eaa891	4245	Kropa
00050000-5551-e497-c05d-d245412ce80e	8262	Krška vas
00050000-5551-e497-2205-2342caddb732	8270	Krško
00050000-5551-e497-f9cf-e13a64520b9c	9263	Kuzma
00050000-5551-e497-77fa-eebb2304b1d2	2318	Laporje
00050000-5551-e497-1651-f67f428be7d9	3270	Laško
00050000-5551-e497-1a47-34fce1be82f1	1219	Laze v Tuhinju
00050000-5551-e497-dd75-dd6643d26df0	2230	Lenart v Slovenskih goricah
00050000-5551-e497-d841-81a5a1c22608	9220	Lendava/Lendva
00050000-5551-e497-756b-2c9140e98df4	4248	Lesce
00050000-5551-e497-4b5a-276d859841fd	3261	Lesično
00050000-5551-e497-6dd2-b93eb439c1b2	8273	Leskovec pri Krškem
00050000-5551-e497-7ef3-9c09bcc1e47c	2372	Libeliče
00050000-5551-e497-4a91-2f087c868675	2341	Limbuš
00050000-5551-e497-73a9-953baff34891	1270	Litija
00050000-5551-e497-9535-07939a12bf5c	3202	Ljubečna
00050000-5551-e497-30a5-5c7ff04e3854	1000	Ljubljana 
00050000-5551-e497-1f6f-3aae6c400b1c	1001	Ljubljana - poštni predali
00050000-5551-e497-f117-24f94a57642e	1231	Ljubljana - Črnuče
00050000-5551-e497-0d62-881ac0b56540	1261	Ljubljana - Dobrunje
00050000-5551-e497-fa09-03b225979d25	1260	Ljubljana - Polje
00050000-5551-e497-fe00-b08696fbc941	1210	Ljubljana - Šentvid
00050000-5551-e497-0cd9-bcbdd78b6e05	1211	Ljubljana - Šmartno
00050000-5551-e497-bc0d-f7b093be6c29	3333	Ljubno ob Savinji
00050000-5551-e497-1aef-ad18491f6ed4	9240	Ljutomer
00050000-5551-e497-ae31-aec6e6ae2501	3215	Loče
00050000-5551-e497-83d1-419c5bb13a18	5231	Log pod Mangartom
00050000-5551-e497-8e5e-a5518de75a40	1358	Log pri Brezovici
00050000-5551-e497-5197-4aa2f15cfeab	1370	Logatec
00050000-5551-e497-cccc-8c2511cde944	1371	Logatec
00050000-5551-e497-6e0b-e97b6dcc323d	1434	Loka pri Zidanem Mostu
00050000-5551-e497-d549-f8f7efdd688b	3223	Loka pri Žusmu
00050000-5551-e497-f9b1-a35e5cc6b7e5	6219	Lokev
00050000-5551-e497-c507-49766f94f6e4	1318	Loški Potok
00050000-5551-e497-5cae-439caf7a4b66	2324	Lovrenc na Dravskem polju
00050000-5551-e497-b2ac-e242c79563f8	2344	Lovrenc na Pohorju
00050000-5551-e497-d535-ca53b817d9c7	3334	Luče
00050000-5551-e497-c2c7-4edac86d2f51	1225	Lukovica
00050000-5551-e497-c163-949a2686f069	9202	Mačkovci
00050000-5551-e497-910f-7442eafd81f3	2322	Majšperk
00050000-5551-e497-bf61-1a94b47cd169	2321	Makole
00050000-5551-e497-357d-fa5517dd264e	9243	Mala Nedelja
00050000-5551-e497-b77e-53cb62a2967d	2229	Malečnik
00050000-5551-e497-25f7-4194a8d54929	6273	Marezige
00050000-5551-e497-5d4c-e7e806cf94f1	2000	Maribor 
00050000-5551-e497-3295-90f54cc19226	2001	Maribor - poštni predali
00050000-5551-e497-86c2-2fd745c7e0f4	2206	Marjeta na Dravskem polju
00050000-5551-e497-e850-fdf14d2f2fc2	2281	Markovci
00050000-5551-e497-9f9b-83efc45c64ac	9221	Martjanci
00050000-5551-e497-cb66-17ec04032c5e	6242	Materija
00050000-5551-e497-7f44-e4ae1b0175c8	4211	Mavčiče
00050000-5551-e497-9008-2af6fc885bf7	1215	Medvode
00050000-5551-e497-6471-346c480f39c2	1234	Mengeš
00050000-5551-e497-04c7-cf9cffb2cfe1	8330	Metlika
00050000-5551-e497-0ca3-4700bf7baab5	2392	Mežica
00050000-5551-e497-0cd8-f1a322210d8e	2204	Miklavž na Dravskem polju
00050000-5551-e497-5bdf-06af5fcd2b6e	2275	Miklavž pri Ormožu
00050000-5551-e497-c064-a8407f0389c5	5291	Miren
00050000-5551-e497-ed54-f3d785371251	8233	Mirna
00050000-5551-e497-f307-2971f5ee09ea	8216	Mirna Peč
00050000-5551-e497-f6c4-acd470459de3	2382	Mislinja
00050000-5551-e497-f04b-2204ad4fd6bd	4281	Mojstrana
00050000-5551-e497-3ff7-d5ed2a16ee31	8230	Mokronog
00050000-5551-e497-5f92-63356aa3305b	1251	Moravče
00050000-5551-e497-92f6-3313ad3d120c	9226	Moravske Toplice
00050000-5551-e497-74eb-e819cce17108	5216	Most na Soči
00050000-5551-e497-c468-ebab764910f3	1221	Motnik
00050000-5551-e497-0ad2-a2cfee4c34ed	3330	Mozirje
00050000-5551-e497-72a9-ce33be5e574a	9000	Murska Sobota 
00050000-5551-e497-4559-4bc79773d561	9001	Murska Sobota - poštni predali
00050000-5551-e497-bdc8-c5f0045689cb	2366	Muta
00050000-5551-e497-dcce-ca42d3f35209	4202	Naklo
00050000-5551-e497-60ed-dee4986f698f	3331	Nazarje
00050000-5551-e497-25a0-b5cb8cf3580c	1357	Notranje Gorice
00050000-5551-e497-2206-d3ed32bd5b5c	3203	Nova Cerkev
00050000-5551-e497-abe8-8c4e0fdefd9b	5000	Nova Gorica 
00050000-5551-e497-a452-2d0a20098994	5001	Nova Gorica - poštni predali
00050000-5551-e497-9f0e-3f30c4d8fe28	1385	Nova vas
00050000-5551-e497-198a-6dc95060d07d	8000	Novo mesto
00050000-5551-e497-1b08-d3d6471e50aa	8001	Novo mesto - poštni predali
00050000-5551-e497-8972-18e5ab187864	6243	Obrov
00050000-5551-e497-ae70-3337fc3e9dee	9233	Odranci
00050000-5551-e497-1e97-f8fb49acc046	2317	Oplotnica
00050000-5551-e497-8542-5e12d657545c	2312	Orehova vas
00050000-5551-e497-1bb2-18454b7ecfa3	2270	Ormož
00050000-5551-e497-f5f0-ca7e941bccd9	1316	Ortnek
00050000-5551-e497-107b-e2fc70ff4455	1337	Osilnica
00050000-5551-e497-4492-64695e348c78	8222	Otočec
00050000-5551-e497-2f12-5010ab1abd2f	2361	Ožbalt
00050000-5551-e497-e8df-f05370a97ea3	2231	Pernica
00050000-5551-e497-09fa-3388c5ef58d6	2211	Pesnica pri Mariboru
00050000-5551-e497-4cd1-3d5471b12bad	9203	Petrovci
00050000-5551-e497-1251-e956184d5a3e	3301	Petrovče
00050000-5551-e497-f899-cddbbb256d1b	6330	Piran/Pirano
00050000-5551-e497-cc3a-a17ad4f55756	8255	Pišece
00050000-5551-e497-1745-066b391b5a0d	6257	Pivka
00050000-5551-e497-2b87-960f2809c49c	6232	Planina
00050000-5551-e497-b570-9d70127eacca	3225	Planina pri Sevnici
00050000-5551-e497-e744-2ab19d79bdc8	6276	Pobegi
00050000-5551-e497-66d9-1d098cd2eb79	8312	Podbočje
00050000-5551-e497-ced0-3e2796519c7d	5243	Podbrdo
00050000-5551-e497-3ad9-91b31eede3c3	3254	Podčetrtek
00050000-5551-e497-a287-134cd53ba3c8	2273	Podgorci
00050000-5551-e497-d39f-f740db1bbf09	6216	Podgorje
00050000-5551-e497-aa89-d9c6fb701275	2381	Podgorje pri Slovenj Gradcu
00050000-5551-e497-fada-566648118f7a	6244	Podgrad
00050000-5551-e497-3e6a-e9f061d5a59c	1414	Podkum
00050000-5551-e497-ef97-0b2403d40f54	2286	Podlehnik
00050000-5551-e497-8bcc-23ddd3fa300e	5272	Podnanos
00050000-5551-e497-63e2-3cf0a972b296	4244	Podnart
00050000-5551-e497-d743-93910aec68f1	3241	Podplat
00050000-5551-e497-1a01-0d32d8ddfe72	3257	Podsreda
00050000-5551-e497-b73d-2a64f222f7c9	2363	Podvelka
00050000-5551-e497-8cab-b46dc41aacf3	2208	Pohorje
00050000-5551-e497-5df0-d64a25b30ba6	2257	Polenšak
00050000-5551-e497-c45d-7755a8752aa7	1355	Polhov Gradec
00050000-5551-e497-33df-92a7644526c8	4223	Poljane nad Škofjo Loko
00050000-5551-e497-261c-58cff4c1d550	2319	Poljčane
00050000-5551-e497-67a3-72603770630d	1272	Polšnik
00050000-5551-e497-84e6-6707673ff63b	3313	Polzela
00050000-5551-e497-d937-82101d628868	3232	Ponikva
00050000-5551-e497-8c98-505174bd4bd1	6320	Portorož/Portorose
00050000-5551-e497-e906-1d7e76df1828	6230	Postojna
00050000-5551-e497-e40a-5abb56bf41a9	2331	Pragersko
00050000-5551-e497-2903-2e7cf9061759	3312	Prebold
00050000-5551-e497-351a-b608bfc4fc6e	4205	Preddvor
00050000-5551-e497-b920-907b07400dfb	6255	Prem
00050000-5551-e497-b6cd-8d5648f2e3e8	1352	Preserje
00050000-5551-e497-ddd9-87e328b4093e	6258	Prestranek
00050000-5551-e497-33c9-2f24abac56ff	2391	Prevalje
00050000-5551-e497-1e9e-65a1d135f533	3262	Prevorje
00050000-5551-e497-2be8-f1a3b988267d	1276	Primskovo 
00050000-5551-e497-81f4-5cc786a533a4	3253	Pristava pri Mestinju
00050000-5551-e497-ad00-037c6d52eb58	9207	Prosenjakovci/Partosfalva
00050000-5551-e497-e6c5-e5e777901bc0	5297	Prvačina
00050000-5551-e497-d4fd-caaa4d9c76c5	2250	Ptuj
00050000-5551-e497-2864-095d9ae4c4f8	2323	Ptujska Gora
00050000-5551-e497-087f-b365e7a8f0eb	9201	Puconci
00050000-5551-e497-4205-25f5c319f3eb	2327	Rače
00050000-5551-e497-490b-10d4973c5357	1433	Radeče
00050000-5551-e497-d2a9-36ce2eba4b35	9252	Radenci
00050000-5551-e497-8514-942976f0b531	2360	Radlje ob Dravi
00050000-5551-e497-0646-f563859aeab7	1235	Radomlje
00050000-5551-e497-fe36-3f4d142be33b	4240	Radovljica
00050000-5551-e497-0edb-3d5d4563aefd	8274	Raka
00050000-5551-e497-4175-1ae0463d9e92	1381	Rakek
00050000-5551-e497-3c97-e3451ecc22f5	4283	Rateče - Planica
00050000-5551-e497-56d5-032d127e9c57	2390	Ravne na Koroškem
00050000-5551-e497-d76d-54150d0a3282	9246	Razkrižje
00050000-5551-e497-c85c-570c8627c6a5	3332	Rečica ob Savinji
00050000-5551-e497-7c7f-832f84afd4f0	5292	Renče
00050000-5551-e497-4978-f96932141eae	1310	Ribnica
00050000-5551-e497-273d-591358cf337f	2364	Ribnica na Pohorju
00050000-5551-e497-d7bc-41bc5df326eb	3272	Rimske Toplice
00050000-5551-e497-7edf-bb9d5dfb6a04	1314	Rob
00050000-5551-e497-c628-172be8f765ff	5215	Ročinj
00050000-5551-e497-7eb3-c089097dcacb	3250	Rogaška Slatina
00050000-5551-e497-6876-9f95fb4db144	9262	Rogašovci
00050000-5551-e497-390d-aa6114a5eb3a	3252	Rogatec
00050000-5551-e497-1cf2-308d91f57289	1373	Rovte
00050000-5551-e497-6f6b-76d1d6ce3872	2342	Ruše
00050000-5551-e497-581a-836ad4e78e0f	1282	Sava
00050000-5551-e497-c0a7-2e666c8fbfc6	6333	Sečovlje/Sicciole
00050000-5551-e497-aa19-d0abfe65e535	4227	Selca
00050000-5551-e497-add5-2d125f4c49e5	2352	Selnica ob Dravi
00050000-5551-e497-8502-16c9c301d549	8333	Semič
00050000-5551-e497-5f03-92db6dbc9361	8281	Senovo
00050000-5551-e497-e1dd-5397cf06ce69	6224	Senožeče
00050000-5551-e497-ef4a-878066d0defb	8290	Sevnica
00050000-5551-e497-a2c6-fc151e8f79b2	6210	Sežana
00050000-5551-e497-940a-37dfb12a8b4d	2214	Sladki Vrh
00050000-5551-e497-4292-07c028564d9d	5283	Slap ob Idrijci
00050000-5551-e497-ff8a-45b7b8533e46	2380	Slovenj Gradec
00050000-5551-e497-c4ca-0c2abcf37eea	2310	Slovenska Bistrica
00050000-5551-e497-a634-2783827fe1c0	3210	Slovenske Konjice
00050000-5551-e497-9618-493d2d01aec0	1216	Smlednik
00050000-5551-e497-1258-de1e130f5e36	5232	Soča
00050000-5551-e497-fe1e-8878d4ff7d52	1317	Sodražica
00050000-5551-e497-a219-5290f4a53896	3335	Solčava
00050000-5551-e497-ae3f-8c496c5423e5	5250	Solkan
00050000-5551-e497-bb20-28756ea326e9	4229	Sorica
00050000-5551-e497-3e80-c64ed43050ec	4225	Sovodenj
00050000-5551-e497-7519-79eae1dbaefe	5281	Spodnja Idrija
00050000-5551-e497-dacc-111243b7f062	2241	Spodnji Duplek
00050000-5551-e497-339e-80c3a349adb5	9245	Spodnji Ivanjci
00050000-5551-e497-86c6-8370ebb45efa	2277	Središče ob Dravi
00050000-5551-e497-9312-b87051cba69d	4267	Srednja vas v Bohinju
00050000-5551-e497-ec09-369c9ad14a7b	8256	Sromlje 
00050000-5551-e497-6077-6c40ace08fcf	5224	Srpenica
00050000-5551-e497-69b6-fc077f23c52a	1242	Stahovica
00050000-5551-e497-ed36-b0ba4b3c8f33	1332	Stara Cerkev
00050000-5551-e497-0de4-6e993fa5f302	8342	Stari trg ob Kolpi
00050000-5551-e497-786f-e55c81a733f8	1386	Stari trg pri Ložu
00050000-5551-e497-93a5-b413da0ecf32	2205	Starše
00050000-5551-e497-cbfb-027f4d8cc164	2289	Stoperce
00050000-5551-e497-1d87-7a48f2bba396	8322	Stopiče
00050000-5551-e497-802b-e5041ea4257c	3206	Stranice
00050000-5551-e497-973f-89d36fb456b0	8351	Straža
00050000-5551-e497-d026-a609c20b160b	1313	Struge
00050000-5551-e497-0db0-e27d1d60669e	8293	Studenec
00050000-5551-e497-4598-0596d662fefe	8331	Suhor
00050000-5551-e497-e054-73a291f538ab	2233	Sv. Ana v Slovenskih goricah
00050000-5551-e497-be55-d221de2753ec	2235	Sv. Trojica v Slovenskih goricah
00050000-5551-e497-b6c1-9c16f7fc3458	2353	Sveti Duh na Ostrem Vrhu
00050000-5551-e497-ef4f-47bf952af40c	9244	Sveti Jurij ob Ščavnici
00050000-5551-e497-15dc-394be001fe9c	3264	Sveti Štefan
00050000-5551-e497-aa8a-e53e1ea10a75	2258	Sveti Tomaž
00050000-5551-e497-46f1-3015deaad6f7	9204	Šalovci
00050000-5551-e497-feb6-99286d99ce81	5261	Šempas
00050000-5551-e497-1e14-9160f38ec9e3	5290	Šempeter pri Gorici
00050000-5551-e497-a987-53b183c47c5f	3311	Šempeter v Savinjski dolini
00050000-5551-e497-217c-03331a9bae53	4208	Šenčur
00050000-5551-e497-bd10-25013ac0cc8f	2212	Šentilj v Slovenskih goricah
00050000-5551-e497-0bc2-9b1e77f9d3ee	8297	Šentjanž
00050000-5551-e497-fc4d-355301644c7f	2373	Šentjanž pri Dravogradu
00050000-5551-e497-3693-1839c7b820e8	8310	Šentjernej
00050000-5551-e497-d027-bc430cd735fa	3230	Šentjur
00050000-5551-e497-092f-992f6178c073	3271	Šentrupert
00050000-5551-e497-1017-8734eba1462f	8232	Šentrupert
00050000-5551-e497-7ec7-d87ba4583e16	1296	Šentvid pri Stični
00050000-5551-e497-0417-4547585fcbc3	8275	Škocjan
00050000-5551-e497-65aa-84554d987861	6281	Škofije
00050000-5551-e497-7ffb-be82724488e3	4220	Škofja Loka
00050000-5551-e497-d76f-f044c85da511	3211	Škofja vas
00050000-5551-e497-28b4-0b45bc848026	1291	Škofljica
00050000-5551-e497-04d0-4600b75a6eb6	6274	Šmarje
00050000-5551-e497-c05f-0aae4a9c1b44	1293	Šmarje - Sap
00050000-5551-e497-82e7-c2a5f3e6f6c5	3240	Šmarje pri Jelšah
00050000-5551-e497-5922-e840e487ba55	8220	Šmarješke Toplice
00050000-5551-e497-49ea-c286c02d9192	2315	Šmartno na Pohorju
00050000-5551-e497-7667-c6c43eeb953d	3341	Šmartno ob Dreti
00050000-5551-e497-c34d-73151e605f45	3327	Šmartno ob Paki
00050000-5551-e497-75b1-a7ffd0710e73	1275	Šmartno pri Litiji
00050000-5551-e497-48f7-69ad1c3cd598	2383	Šmartno pri Slovenj Gradcu
00050000-5551-e497-a7b9-d60ba444eea8	3201	Šmartno v Rožni dolini
00050000-5551-e497-b232-d030b4746629	3325	Šoštanj
00050000-5551-e497-dbe2-0505f464b465	6222	Štanjel
00050000-5551-e497-ae3d-992df810923b	3220	Štore
00050000-5551-e497-38f7-9094a494e99f	3304	Tabor
00050000-5551-e497-be42-32c17cab37a3	3221	Teharje
00050000-5551-e497-6782-4a422cface4d	9251	Tišina
00050000-5551-e497-b732-ae243116e2f3	5220	Tolmin
00050000-5551-e497-a491-2f76f854eadc	3326	Topolšica
00050000-5551-e497-7e9e-7f78628b33d3	2371	Trbonje
00050000-5551-e497-c032-965cc7f09ddb	1420	Trbovlje
00050000-5551-e497-cb95-da48d1e18f3f	8231	Trebelno 
00050000-5551-e497-5433-902137dd4dfe	8210	Trebnje
00050000-5551-e497-6cfc-c2313bfa26d4	5252	Trnovo pri Gorici
00050000-5551-e497-3f6f-7741a8efe803	2254	Trnovska vas
00050000-5551-e497-e5cf-dbb696dc3fc8	1222	Trojane
00050000-5551-e497-789b-f410cfcbb0c4	1236	Trzin
00050000-5551-e497-729a-bc98b9904e12	4290	Tržič
00050000-5551-e497-ed74-033a0a70ebbf	8295	Tržišče
00050000-5551-e497-0f6f-91658945de32	1311	Turjak
00050000-5551-e497-6dec-730135246e2d	9224	Turnišče
00050000-5551-e497-e4ba-dbb37375f60e	8323	Uršna sela
00050000-5551-e497-2bef-e3e3bcad4b26	1252	Vače
00050000-5551-e497-f6ac-2cf47260d0ed	3320	Velenje 
00050000-5551-e497-695c-62a3185b400a	3322	Velenje - poštni predali
00050000-5551-e497-1510-e429d16360a2	8212	Velika Loka
00050000-5551-e497-0b7a-2104230ab774	2274	Velika Nedelja
00050000-5551-e497-33b0-fb799a4f80f4	9225	Velika Polana
00050000-5551-e497-eca0-d3120b4692ab	1315	Velike Lašče
00050000-5551-e497-8014-9a752120ce57	8213	Veliki Gaber
00050000-5551-e497-67af-055af82c81b9	9241	Veržej
00050000-5551-e497-232e-ca565bc6e26a	1312	Videm - Dobrepolje
00050000-5551-e497-fd6e-2e7503addf66	2284	Videm pri Ptuju
00050000-5551-e497-44a7-71358a8e2a35	8344	Vinica
00050000-5551-e497-2a23-1353f71f72be	5271	Vipava
00050000-5551-e497-c0fb-99b6e8465c5c	4212	Visoko
00050000-5551-e497-5ef6-d3fa16f11b93	1294	Višnja Gora
00050000-5551-e497-1643-6bcf49d636be	3205	Vitanje
00050000-5551-e497-3fd3-762998785bee	2255	Vitomarci
00050000-5551-e497-f4ef-b2172e3e034c	1217	Vodice
00050000-5551-e497-9b7b-caffb41a345d	3212	Vojnik\t
00050000-5551-e497-7370-fbb306e53290	5293	Volčja Draga
00050000-5551-e497-bec4-9125f120d0c5	2232	Voličina
00050000-5551-e497-fd83-2d528d92c64c	3305	Vransko
00050000-5551-e497-6baa-f881a89f6250	6217	Vremski Britof
00050000-5551-e497-0d2e-89e130a513a4	1360	Vrhnika
00050000-5551-e497-9120-a15d92977d69	2365	Vuhred
00050000-5551-e497-450b-8f66748cab8c	2367	Vuzenica
00050000-5551-e497-d5e7-13000372e399	8292	Zabukovje 
00050000-5551-e497-26d4-8fe87050378b	1410	Zagorje ob Savi
00050000-5551-e497-d383-4f68ded39c18	1303	Zagradec
00050000-5551-e497-dba5-3b9b166e6f2f	2283	Zavrč
00050000-5551-e497-50aa-36e33714dc0b	8272	Zdole 
00050000-5551-e497-2a59-db8dc75e9c34	4201	Zgornja Besnica
00050000-5551-e497-b268-274a260fa5f8	2242	Zgornja Korena
00050000-5551-e497-8196-96dd5060c4d6	2201	Zgornja Kungota
00050000-5551-e497-52b7-c22c9a8705f5	2316	Zgornja Ložnica
00050000-5551-e497-9181-a8a5548c4ab1	2314	Zgornja Polskava
00050000-5551-e497-64a8-3af97ea8dcb4	2213	Zgornja Velka
00050000-5551-e497-fcee-693b0c0fb7d9	4247	Zgornje Gorje
00050000-5551-e497-cbf6-819f306e5a9e	4206	Zgornje Jezersko
00050000-5551-e497-94b0-6b1f243e7699	2285	Zgornji Leskovec
00050000-5551-e497-5326-6440bf3c7f27	1432	Zidani Most
00050000-5551-e497-972f-3804d98179c4	3214	Zreče
00050000-5551-e497-700f-4634490f7c42	4209	Žabnica
00050000-5551-e497-67a8-5e8eb37d83ff	3310	Žalec
00050000-5551-e497-3a73-56e673d99002	4228	Železniki
00050000-5551-e497-764d-05b827f6193a	2287	Žetale
00050000-5551-e497-6466-83f7d4fe08ae	4226	Žiri
00050000-5551-e497-2dd9-6fbf4cebf0af	4274	Žirovnica
00050000-5551-e497-c741-362042a17bb4	8360	Žužemberk
\.


--
-- TOC entry 2663 (class 0 OID 3147480)
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
-- TOC entry 2646 (class 0 OID 3147303)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 3147369)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 3147492)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 3147597)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 3147644)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 3147521)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 3147465)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 3147455)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2680 (class 0 OID 3147634)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 3147587)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 3147170)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5551-e497-fd12-76fa04a51ff7	00010000-5551-e497-d43d-16b6876100b2	2015-05-12 13:31:36	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROaaiqedvDhgnH.b859on7Y12Zd8DuQwC";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2695 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2670 (class 0 OID 3147530)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2638 (class 0 OID 3147208)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5551-e497-e2f6-d8cc938299ca	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5551-e497-2a7c-ac1ab2230e45	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5551-e497-0ad1-9319635791cd	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5551-e497-740d-f8d4a1716376	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5551-e497-9b62-59b22524015b	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5551-e497-ccbe-68230424db5a	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2636 (class 0 OID 3147192)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5551-e497-fd12-76fa04a51ff7	00020000-5551-e497-740d-f8d4a1716376
00010000-5551-e497-d43d-16b6876100b2	00020000-5551-e497-740d-f8d4a1716376
\.


--
-- TOC entry 2672 (class 0 OID 3147544)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 3147486)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 3147436)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 3147268)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2659 (class 0 OID 3147442)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 3147622)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 3147338)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 3147179)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5551-e497-d43d-16b6876100b2	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROZmuENHE1B8akfT/j3WC5jm4EATK4n5O	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5551-e497-fd12-76fa04a51ff7	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2684 (class 0 OID 3147676)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 3147384)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 3147513)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 3147579)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 3147412)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2683 (class 0 OID 3147666)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 3147569)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2278 (class 2606 OID 3147233)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 3147716)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 3147709)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 3147621)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2331 (class 2606 OID 3147402)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 3147435)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2314 (class 2606 OID 3147364)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 3147565)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 3147382)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 3147429)
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
-- TOC entry 2368 (class 2606 OID 3147478)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 3147505)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2307 (class 2606 OID 3147336)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2282 (class 2606 OID 3147242)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2297 (class 2606 OID 3147300)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2284 (class 2606 OID 3147266)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2276 (class 2606 OID 3147222)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2269 (class 2606 OID 3147207)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 3147511)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2394 (class 2606 OID 3147543)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 3147661)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2292 (class 2606 OID 3147293)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 3147324)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 3147484)
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
-- TOC entry 2302 (class 2606 OID 3147314)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 3147373)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 3147496)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 3147603)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 3147649)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 3147528)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 3147469)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2360 (class 2606 OID 3147460)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 3147643)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 3147594)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2261 (class 2606 OID 3147178)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 3147534)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2267 (class 2606 OID 3147196)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2271 (class 2606 OID 3147216)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 3147552)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 3147491)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 3147441)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 3147273)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2354 (class 2606 OID 3147451)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 3147633)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 3147349)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 3147191)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 3147691)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 2606 OID 3147388)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 3147519)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 3147585)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 3147424)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 3147675)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 3147578)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2332 (class 1259 OID 3147409)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2290 (class 1259 OID 3147295)
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
-- TOC entry 2381 (class 1259 OID 3147512)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2375 (class 1259 OID 3147498)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2376 (class 1259 OID 3147497)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2327 (class 1259 OID 3147389)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 3147568)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2403 (class 1259 OID 3147566)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2404 (class 1259 OID 3147567)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2427 (class 1259 OID 3147663)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2428 (class 1259 OID 3147664)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2429 (class 1259 OID 3147665)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2435 (class 1259 OID 3147694)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2436 (class 1259 OID 3147693)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2437 (class 1259 OID 3147692)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2309 (class 1259 OID 3147351)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2310 (class 1259 OID 3147350)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2294 (class 1259 OID 3147302)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2295 (class 1259 OID 3147301)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2390 (class 1259 OID 3147535)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2345 (class 1259 OID 3147430)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2273 (class 1259 OID 3147223)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2274 (class 1259 OID 3147224)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2395 (class 1259 OID 3147555)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2396 (class 1259 OID 3147554)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2397 (class 1259 OID 3147553)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2319 (class 1259 OID 3147374)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2320 (class 1259 OID 3147376)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2321 (class 1259 OID 3147375)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2355 (class 1259 OID 3147464)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2356 (class 1259 OID 3147462)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2357 (class 1259 OID 3147461)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2358 (class 1259 OID 3147463)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2264 (class 1259 OID 3147197)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2265 (class 1259 OID 3147198)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2384 (class 1259 OID 3147520)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2370 (class 1259 OID 3147485)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2410 (class 1259 OID 3147595)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2411 (class 1259 OID 3147596)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2298 (class 1259 OID 3147316)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2299 (class 1259 OID 3147315)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2300 (class 1259 OID 3147317)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2414 (class 1259 OID 3147604)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2415 (class 1259 OID 3147605)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2446 (class 1259 OID 3147719)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 3147718)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2448 (class 1259 OID 3147721)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2449 (class 1259 OID 3147717)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2450 (class 1259 OID 3147720)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2407 (class 1259 OID 3147586)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2361 (class 1259 OID 3147473)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2362 (class 1259 OID 3147472)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2363 (class 1259 OID 3147470)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2364 (class 1259 OID 3147471)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2251 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2442 (class 1259 OID 3147711)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2443 (class 1259 OID 3147710)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2326 (class 1259 OID 3147383)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2279 (class 1259 OID 3147244)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2280 (class 1259 OID 3147243)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2286 (class 1259 OID 3147274)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2287 (class 1259 OID 3147275)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2350 (class 1259 OID 3147454)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2351 (class 1259 OID 3147453)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2352 (class 1259 OID 3147452)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2333 (class 1259 OID 3147411)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2334 (class 1259 OID 3147407)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2335 (class 1259 OID 3147404)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2336 (class 1259 OID 3147405)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2337 (class 1259 OID 3147403)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2338 (class 1259 OID 3147408)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2339 (class 1259 OID 3147406)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2293 (class 1259 OID 3147294)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2315 (class 1259 OID 3147365)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2316 (class 1259 OID 3147367)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2317 (class 1259 OID 3147366)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2318 (class 1259 OID 3147368)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2369 (class 1259 OID 3147479)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2432 (class 1259 OID 3147662)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2285 (class 1259 OID 3147267)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2308 (class 1259 OID 3147337)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2389 (class 1259 OID 3147529)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2254 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2305 (class 1259 OID 3147325)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2426 (class 1259 OID 3147650)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2272 (class 1259 OID 3147217)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2340 (class 1259 OID 3147410)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2475 (class 2606 OID 3147852)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2478 (class 2606 OID 3147837)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2477 (class 2606 OID 3147842)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2473 (class 2606 OID 3147862)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2479 (class 2606 OID 3147832)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2474 (class 2606 OID 3147857)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2476 (class 2606 OID 3147847)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2460 (class 2606 OID 3147767)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2496 (class 2606 OID 3147947)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2494 (class 2606 OID 3147942)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2495 (class 2606 OID 3147937)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2472 (class 2606 OID 3147827)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2502 (class 2606 OID 3147987)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2504 (class 2606 OID 3147977)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2503 (class 2606 OID 3147982)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2492 (class 2606 OID 3147927)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2513 (class 2606 OID 3148022)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2512 (class 2606 OID 3148027)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2511 (class 2606 OID 3148032)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2514 (class 2606 OID 3148047)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2515 (class 2606 OID 3148042)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2516 (class 2606 OID 3148037)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2466 (class 2606 OID 3147802)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2467 (class 2606 OID 3147797)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2461 (class 2606 OID 3147777)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2462 (class 2606 OID 3147772)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 3147752)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2498 (class 2606 OID 3147957)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2480 (class 2606 OID 3147867)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2454 (class 2606 OID 3147732)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2453 (class 2606 OID 3147737)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2499 (class 2606 OID 3147972)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2500 (class 2606 OID 3147967)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2501 (class 2606 OID 3147962)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2470 (class 2606 OID 3147807)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2468 (class 2606 OID 3147817)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2469 (class 2606 OID 3147812)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2484 (class 2606 OID 3147902)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2486 (class 2606 OID 3147892)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2487 (class 2606 OID 3147887)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2485 (class 2606 OID 3147897)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2452 (class 2606 OID 3147722)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2451 (class 2606 OID 3147727)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2497 (class 2606 OID 3147952)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2493 (class 2606 OID 3147932)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2507 (class 2606 OID 3147997)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2506 (class 2606 OID 3148002)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 3147787)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2465 (class 2606 OID 3147782)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2463 (class 2606 OID 3147792)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2509 (class 2606 OID 3148007)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2508 (class 2606 OID 3148012)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2521 (class 2606 OID 3148072)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2522 (class 2606 OID 3148067)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2519 (class 2606 OID 3148082)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2523 (class 2606 OID 3148062)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2520 (class 2606 OID 3148077)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2505 (class 2606 OID 3147992)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2488 (class 2606 OID 3147922)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2489 (class 2606 OID 3147917)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2491 (class 2606 OID 3147907)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2490 (class 2606 OID 3147912)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2517 (class 2606 OID 3148057)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2518 (class 2606 OID 3148052)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2471 (class 2606 OID 3147822)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2510 (class 2606 OID 3148017)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2455 (class 2606 OID 3147747)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2456 (class 2606 OID 3147742)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2459 (class 2606 OID 3147757)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 3147762)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2481 (class 2606 OID 3147882)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2482 (class 2606 OID 3147877)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2483 (class 2606 OID 3147872)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-12 13:31:36 CEST

--
-- PostgreSQL database dump complete
--

