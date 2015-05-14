--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-14 13:33:05 CEST

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
-- TOC entry 179 (class 1259 OID 3387768)
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
-- TOC entry 225 (class 1259 OID 3388251)
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
-- TOC entry 224 (class 1259 OID 3388234)
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
-- TOC entry 217 (class 1259 OID 3388145)
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
-- TOC entry 193 (class 1259 OID 3387936)
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
-- TOC entry 196 (class 1259 OID 3387970)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 3387895)
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
-- TOC entry 212 (class 1259 OID 3388095)
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
-- TOC entry 191 (class 1259 OID 3387920)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 3387964)
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
-- TOC entry 201 (class 1259 OID 3388013)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 3388038)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 3387869)
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
-- TOC entry 180 (class 1259 OID 3387777)
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
-- TOC entry 181 (class 1259 OID 3387788)
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
-- TOC entry 184 (class 1259 OID 3387839)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 3387742)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 3387761)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 3388045)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 3388075)
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
-- TOC entry 221 (class 1259 OID 3388190)
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
-- TOC entry 183 (class 1259 OID 3387819)
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
-- TOC entry 186 (class 1259 OID 3387861)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 3388019)
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
-- TOC entry 185 (class 1259 OID 3387846)
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
-- TOC entry 190 (class 1259 OID 3387912)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 3388031)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 3388136)
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
-- TOC entry 220 (class 1259 OID 3388183)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 3388060)
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
-- TOC entry 200 (class 1259 OID 3388004)
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
-- TOC entry 199 (class 1259 OID 3387994)
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
-- TOC entry 219 (class 1259 OID 3388173)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 3388126)
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
-- TOC entry 173 (class 1259 OID 3387713)
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
-- TOC entry 172 (class 1259 OID 3387711)
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
-- TOC entry 209 (class 1259 OID 3388069)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 3387751)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 3387735)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 3388083)
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
-- TOC entry 203 (class 1259 OID 3388025)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 3387975)
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
-- TOC entry 182 (class 1259 OID 3387811)
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
-- TOC entry 198 (class 1259 OID 3387981)
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
-- TOC entry 218 (class 1259 OID 3388161)
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
-- TOC entry 188 (class 1259 OID 3387881)
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
-- TOC entry 174 (class 1259 OID 3387722)
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
-- TOC entry 223 (class 1259 OID 3388215)
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
-- TOC entry 192 (class 1259 OID 3387927)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 3388052)
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
-- TOC entry 214 (class 1259 OID 3388118)
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
-- TOC entry 194 (class 1259 OID 3387959)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 3388205)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 3388108)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 3387716)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 3387768)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 3388251)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 3388234)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 3388145)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 3387936)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 3387970)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 3387895)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5554-87f0-f673-087d862e8821	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5554-87f0-341f-1b66b3c714ff	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5554-87f0-6059-8ee4e9087f98	AL	ALB	008	Albania 	Albanija	\N
00040000-5554-87f0-fe29-223db481c565	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5554-87f0-71ca-d34422a8f695	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5554-87f0-8dc4-bf656af70215	AD	AND	020	Andorra 	Andora	\N
00040000-5554-87f0-2f41-2caea687d7d0	AO	AGO	024	Angola 	Angola	\N
00040000-5554-87f0-38ea-9979a650d938	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5554-87f0-5f9b-95a0f8abfcd8	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5554-87f0-3bde-45da74ada12f	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5554-87f0-d1e3-4977b676642b	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5554-87f0-cec5-3fc4d25ca3fa	AM	ARM	051	Armenia 	Armenija	\N
00040000-5554-87f0-2888-1e9e98ca8da1	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5554-87f0-a319-6fedf889e73b	AU	AUS	036	Australia 	Avstralija	\N
00040000-5554-87f0-d66c-779ea2dc96c5	AT	AUT	040	Austria 	Avstrija	\N
00040000-5554-87f0-4c5f-22cd74a219f0	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5554-87f0-9186-0379f73d8406	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5554-87f0-21e6-568773ef2adb	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5554-87f0-60c0-fee943e09ea2	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5554-87f0-f257-c2a28c4239f2	BB	BRB	052	Barbados 	Barbados	\N
00040000-5554-87f0-3597-6ffdb6fc3b1b	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5554-87f0-b8a3-cfeae63b6fed	BE	BEL	056	Belgium 	Belgija	\N
00040000-5554-87f0-effd-1b6deffe037d	BZ	BLZ	084	Belize 	Belize	\N
00040000-5554-87f0-ce38-cb7dc90c3987	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5554-87f0-be2f-9ef5ad7bd3db	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5554-87f0-2945-46a9d7ba912c	BT	BTN	064	Bhutan 	Butan	\N
00040000-5554-87f0-b21f-60c08346677d	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5554-87f0-220e-9a1048e9a4c0	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5554-87f0-ec9f-22050d46c633	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5554-87f0-f84c-0bb6ef18f467	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5554-87f0-19c1-5602578b1fce	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5554-87f0-d53d-9df94f407529	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5554-87f0-0032-bb6228c62250	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5554-87f0-668d-b178631529a7	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5554-87f0-495c-667722c5fe06	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5554-87f0-a036-f0696305cb77	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5554-87f0-de32-1cf367c1306e	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5554-87f0-2839-8b12136c6070	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5554-87f0-283c-6cd8b6d6427b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5554-87f0-f2e3-48bac0253f2a	CA	CAN	124	Canada 	Kanada	\N
00040000-5554-87f0-828b-df6c92875721	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5554-87f0-e8b7-eedf08da5045	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5554-87f0-47c4-6d6d3ca1804b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5554-87f0-32c4-9415c676fdce	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5554-87f0-c89c-18f56a438c33	CL	CHL	152	Chile 	Čile	\N
00040000-5554-87f0-2fac-40dbbaeebab1	CN	CHN	156	China 	Kitajska	\N
00040000-5554-87f0-8b0b-fb5bec618093	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5554-87f0-168a-7bc39186767a	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5554-87f0-1750-707220668307	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5554-87f0-eac2-254cd19dd6ad	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5554-87f0-e729-2f9f96bcaf84	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5554-87f0-d7f8-18681cc37404	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5554-87f0-5e81-68c8d95b8c76	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5554-87f0-6bf8-e76eaabe9ad8	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5554-87f0-10f8-509fbad18ec9	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5554-87f0-fa4a-dad995e68021	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5554-87f0-0201-c32468e23970	CU	CUB	192	Cuba 	Kuba	\N
00040000-5554-87f0-5b79-a42e869b40c6	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5554-87f0-b157-b3125af425a5	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5554-87f0-2217-3400da776cf8	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5554-87f0-8f2d-41daecfd8509	DK	DNK	208	Denmark 	Danska	\N
00040000-5554-87f0-529f-5d551e0c0f56	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5554-87f0-5687-00209d389c2c	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5554-87f0-0581-954d10adea6f	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5554-87f0-b80b-0ca9a8ba90af	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5554-87f1-6c63-5170db204633	EG	EGY	818	Egypt 	Egipt	\N
00040000-5554-87f1-accb-1ed0de72543b	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5554-87f1-c993-297f947b0fe8	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5554-87f1-a64b-1335e16cbff0	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5554-87f1-874a-2e19b58b9e96	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5554-87f1-e0f8-fb54d850317c	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5554-87f1-782b-17c4debc4329	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5554-87f1-eb0a-85ad82db0c32	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5554-87f1-7eff-5d94ea63d67d	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5554-87f1-d9e3-0b2683bc68be	FI	FIN	246	Finland 	Finska	\N
00040000-5554-87f1-8b33-23e76d68ec6b	FR	FRA	250	France 	Francija	\N
00040000-5554-87f1-e145-51b124425136	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5554-87f1-7df3-dd53d5dc3d46	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5554-87f1-8a6b-d47469c9ee98	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5554-87f1-8402-a42e5e213c18	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5554-87f1-15b2-4f95df724b7f	GA	GAB	266	Gabon 	Gabon	\N
00040000-5554-87f1-29ad-4341c39e338e	GM	GMB	270	Gambia 	Gambija	\N
00040000-5554-87f1-2c15-939c113f0a18	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5554-87f1-f77c-0168bcb982d6	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5554-87f1-a32f-e6a600246270	GH	GHA	288	Ghana 	Gana	\N
00040000-5554-87f1-e89a-22ba5d541799	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5554-87f1-b9c7-c698037472e7	GR	GRC	300	Greece 	Grčija	\N
00040000-5554-87f1-076c-5876b9b1be60	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5554-87f1-499d-5873337fc36a	GD	GRD	308	Grenada 	Grenada	\N
00040000-5554-87f1-bd6c-29c16c8225a0	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5554-87f1-93a9-5121d0e0b2a3	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5554-87f1-a9f0-8f59a1333fae	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5554-87f1-3c8f-e72452b98b62	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5554-87f1-0bcb-c47260226708	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5554-87f1-3bf8-0909982bfdbe	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5554-87f1-2501-cb4a8182be02	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5554-87f1-1b49-600c9874b28f	HT	HTI	332	Haiti 	Haiti	\N
00040000-5554-87f1-cfe3-a4395b94f2f0	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5554-87f1-2300-3ec3e67a98b0	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5554-87f1-09d6-c97340873cab	HN	HND	340	Honduras 	Honduras	\N
00040000-5554-87f1-819d-8039ee534071	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5554-87f1-2da2-7a38b05c6ee4	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5554-87f1-6ec1-0b125b41c8b7	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5554-87f1-5366-fb1f77245851	IN	IND	356	India 	Indija	\N
00040000-5554-87f1-2e8e-c4be770dba83	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5554-87f1-b07f-0278636366da	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5554-87f1-316f-4078d8f3fcb4	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5554-87f1-0384-7afab0aabe64	IE	IRL	372	Ireland 	Irska	\N
00040000-5554-87f1-6465-f9a402160f32	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5554-87f1-252b-f831f1468a55	IL	ISR	376	Israel 	Izrael	\N
00040000-5554-87f1-5f47-6ef56e5f8e1c	IT	ITA	380	Italy 	Italija	\N
00040000-5554-87f1-7659-75586d0e686b	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5554-87f1-46cf-3422345c4a0a	JP	JPN	392	Japan 	Japonska	\N
00040000-5554-87f1-d804-bc63ee1cb532	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5554-87f1-5f91-b8f4099d430e	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5554-87f1-8525-a95bde3291f8	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5554-87f1-9b6b-8862f70e9591	KE	KEN	404	Kenya 	Kenija	\N
00040000-5554-87f1-d6a1-55eed47d4f80	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5554-87f1-b15c-b436bf093078	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5554-87f1-b377-1acd0a2fcdd4	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5554-87f1-35a3-4501a1173a14	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5554-87f1-a4dc-7b3d49a283f4	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5554-87f1-dd16-74247fee42db	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5554-87f1-24e0-be18e4fad81d	LV	LVA	428	Latvia 	Latvija	\N
00040000-5554-87f1-879c-15157dbb0557	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5554-87f1-d283-283d2cdfe336	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5554-87f1-a058-42079a15ecb0	LR	LBR	430	Liberia 	Liberija	\N
00040000-5554-87f1-8df0-357c9f056d09	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5554-87f1-b91d-93ecfef6cd21	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5554-87f1-279b-badf502d0499	LT	LTU	440	Lithuania 	Litva	\N
00040000-5554-87f1-16eb-46d1a3c289d9	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5554-87f1-4e73-f375e45ade6b	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5554-87f1-f6ff-3c25353f1632	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5554-87f1-c803-9cc717a0cb6d	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5554-87f1-868f-47a855018cb4	MW	MWI	454	Malawi 	Malavi	\N
00040000-5554-87f1-8f52-55031b965497	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5554-87f1-46f4-fc47ca71968c	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5554-87f1-610e-3ef6709f4b16	ML	MLI	466	Mali 	Mali	\N
00040000-5554-87f1-65cb-04ae98457069	MT	MLT	470	Malta 	Malta	\N
00040000-5554-87f1-5dc6-9a889665c883	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5554-87f1-936e-b3c30775a0d2	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5554-87f1-4ec2-38f01dbe6b36	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5554-87f1-6490-b7dd7757465a	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5554-87f1-e27c-dbc2b80c632f	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5554-87f1-bed8-37de9cd039eb	MX	MEX	484	Mexico 	Mehika	\N
00040000-5554-87f1-5f31-423f57793d73	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5554-87f1-3f36-c51fe0c78c00	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5554-87f1-2ce3-0fc6ad191667	MC	MCO	492	Monaco 	Monako	\N
00040000-5554-87f1-2e20-5bd22da05ae1	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5554-87f1-8241-658486386b9b	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5554-87f1-787a-7a3d3263e287	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5554-87f1-a937-5ab5996337bf	MA	MAR	504	Morocco 	Maroko	\N
00040000-5554-87f1-5e9d-65ccf7ed2e3d	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5554-87f1-dccf-bbe344f5a6cf	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5554-87f1-4daa-e196fd528683	NA	NAM	516	Namibia 	Namibija	\N
00040000-5554-87f1-a67a-25426d1a7558	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5554-87f1-89ce-9147cbcdb73b	NP	NPL	524	Nepal 	Nepal	\N
00040000-5554-87f1-5ec9-38eab7cb19a0	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5554-87f1-9feb-d786584b0886	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5554-87f1-73bb-a8ee1fa8bc24	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5554-87f1-77f4-f2798c93d7b9	NE	NER	562	Niger 	Niger 	\N
00040000-5554-87f1-3563-5ebe15369515	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5554-87f1-0011-3ca2334a1a71	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5554-87f1-8097-37e333c3d41a	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5554-87f1-dfce-fe7e67bd8cec	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5554-87f1-f168-d0730d21dfa4	NO	NOR	578	Norway 	Norveška	\N
00040000-5554-87f1-a723-e8e7115aeab5	OM	OMN	512	Oman 	Oman	\N
00040000-5554-87f1-26c7-c2e12ebccfde	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5554-87f1-3463-4885d7fe2940	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5554-87f1-ee66-293e3550d7e1	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5554-87f1-d268-8c11b0ca97c3	PA	PAN	591	Panama 	Panama	\N
00040000-5554-87f1-fe23-ddac6f6dffbb	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5554-87f1-5708-0773978ded70	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5554-87f1-5a43-6e0b964ff29b	PE	PER	604	Peru 	Peru	\N
00040000-5554-87f1-e9e0-d6552a1830d9	PH	PHL	608	Philippines 	Filipini	\N
00040000-5554-87f1-b9fd-7334997a8df2	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5554-87f1-4682-b7974e0f279b	PL	POL	616	Poland 	Poljska	\N
00040000-5554-87f1-9631-309b501a0c89	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5554-87f1-45a1-a2fb2a1512c1	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5554-87f1-5057-b4a7e089faa5	QA	QAT	634	Qatar 	Katar	\N
00040000-5554-87f1-ad71-18bf99dd8cd3	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5554-87f1-93dc-7a49ca53385d	RO	ROU	642	Romania 	Romunija	\N
00040000-5554-87f1-cbf4-479405d9fdc5	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5554-87f1-01c3-54a0bc58c836	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5554-87f1-1301-533c34014b2f	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5554-87f1-881f-e12b54586b4a	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5554-87f1-0333-a907293902b9	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5554-87f1-22c6-372080e733f9	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5554-87f1-087c-99352264f74a	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5554-87f1-df7a-5efe72ba67fb	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5554-87f1-2918-c1ee8a55bf7f	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5554-87f1-f987-5192d8a136f3	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5554-87f1-b392-c9dfe6f098e3	SM	SMR	674	San Marino 	San Marino	\N
00040000-5554-87f1-c8a1-c3328a706c52	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5554-87f1-c18b-d63135a97487	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5554-87f1-8959-a90ba4068783	SN	SEN	686	Senegal 	Senegal	\N
00040000-5554-87f1-99a4-58eeb9e0454d	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5554-87f1-7b60-fec85b1c22fe	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5554-87f1-e0d3-a9341893e4d3	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5554-87f1-987e-18150053daa8	SG	SGP	702	Singapore 	Singapur	\N
00040000-5554-87f1-58eb-956a035cf58a	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5554-87f1-0373-b3bfdfbf6f59	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5554-87f1-cffd-617933d03651	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5554-87f1-a254-bb10997dc2e0	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5554-87f1-5eea-6e5d399cc7f8	SO	SOM	706	Somalia 	Somalija	\N
00040000-5554-87f1-69db-47715b295f9b	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5554-87f1-7294-c6b806c8ea8d	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5554-87f1-55cc-e1fedbc6ba35	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5554-87f1-fc8b-ba6b5ba06c99	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5554-87f1-4f60-d11aaffc08c8	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5554-87f1-9f3c-dd2144e2ed3a	SD	SDN	729	Sudan 	Sudan	\N
00040000-5554-87f1-44d1-64960a778dcf	SR	SUR	740	Suriname 	Surinam	\N
00040000-5554-87f1-ed53-ccf3bdef23e6	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5554-87f1-0c6d-d2f618b0bf57	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5554-87f1-10c4-496b4b44979c	SE	SWE	752	Sweden 	Švedska	\N
00040000-5554-87f1-9030-f80767580d8c	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5554-87f1-32dd-4e116629a8d1	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5554-87f1-7f6c-56af26d74c3e	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5554-87f1-92b8-8bb742225b5b	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5554-87f1-81a3-1368136f7f05	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5554-87f1-1389-a1b415579483	TH	THA	764	Thailand 	Tajska	\N
00040000-5554-87f1-9e2c-326d1071e207	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5554-87f1-5e08-4432c9f1aeb3	TG	TGO	768	Togo 	Togo	\N
00040000-5554-87f1-2845-6c5fa54e783a	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5554-87f1-91c2-42b09bc48655	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5554-87f1-aab2-1de1df29e6e7	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5554-87f1-a84e-830e312bac7f	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5554-87f1-c078-2e1fd17ad303	TR	TUR	792	Turkey 	Turčija	\N
00040000-5554-87f1-3c5a-c1a0d14c927a	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5554-87f1-590c-a838613b0880	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5554-87f1-bf29-580420d33fec	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5554-87f1-1a23-b513cfa26811	UG	UGA	800	Uganda 	Uganda	\N
00040000-5554-87f1-1066-164eda0615fe	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5554-87f1-ad13-44f0e67284d3	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5554-87f1-0ee4-a6cb104b38f5	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5554-87f1-633f-31cd3e57d98a	US	USA	840	United States 	Združene države Amerike	\N
00040000-5554-87f1-4f44-6bd207fddc29	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5554-87f1-7e8a-c219852509f1	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5554-87f1-07e1-49e92f0555a0	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5554-87f1-a0be-e9c957029be2	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5554-87f1-ea49-99b0ee859ee6	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5554-87f1-9dd0-f5403e90efc1	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5554-87f1-f27d-e3cf41eb7fff	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5554-87f1-5d54-3d2cae564a23	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5554-87f1-0473-6b5cb29dd445	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5554-87f1-c835-5d6f551562bc	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5554-87f1-2222-a7d021dcb33d	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5554-87f1-cad6-01b1fb1e0c65	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5554-87f1-9df2-577c693e7be9	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 3388095)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 3387920)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 3387964)
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
-- TOC entry 2658 (class 0 OID 3388013)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 3388038)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 3387869)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5554-87f1-a35f-326c19d993ea	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5554-87f1-2993-e35a62992073	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5554-87f1-e545-1907443697e8	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5554-87f1-df55-eebfe35968b7	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5554-87f1-017c-61a087d9611b	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5554-87f1-5d2b-22062bdaeffb	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5554-87f1-ba35-48e753d571ed	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5554-87f1-bd7f-bbf03cac41db	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5554-87f1-5a42-852971365ce8	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5554-87f1-4d71-9bd9d4ac70dd	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 3387777)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5554-87f1-9a40-358e2eca5a8e	00000000-5554-87f1-017c-61a087d9611b	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5554-87f1-8208-4c791203db3a	00000000-5554-87f1-017c-61a087d9611b	00010000-5554-87f1-fb5a-27bd2247b15d	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5554-87f1-da98-8c2884129ab1	00000000-5554-87f1-5d2b-22062bdaeffb	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 3387788)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 3387839)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 3387742)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5554-87f1-daec-74938434b2fc	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5554-87f1-ce20-80269bb20f3e	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5554-87f1-32d7-444f86b94272	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5554-87f1-d892-eff5d791ac9f	Abonma-read	Abonma - branje	f
00030000-5554-87f1-2f09-bd750ac87cf9	Abonma-write	Abonma - spreminjanje	f
00030000-5554-87f1-567c-ad603b3a8b54	Alternacija-read	Alternacija - branje	f
00030000-5554-87f1-44ca-0dfddf90237a	Alternacija-write	Alternacija - spreminjanje	f
00030000-5554-87f1-4b2d-448d5a88634e	Arhivalija-read	Arhivalija - branje	f
00030000-5554-87f1-4e07-433a1c8d72dc	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5554-87f1-b49f-20d5dcaee7ae	Besedilo-read	Besedilo - branje	f
00030000-5554-87f1-e1cb-1dc0acb7c564	Besedilo-write	Besedilo - spreminjanje	f
00030000-5554-87f1-c342-77f74df9ba94	DogodekIzven-read	DogodekIzven - branje	f
00030000-5554-87f1-5387-ea4eb6f28b89	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5554-87f1-fb23-6e1476a6398a	Dogodek-read	Dogodek - branje	f
00030000-5554-87f1-a71a-c9f1eb7a0c73	Dogodek-write	Dogodek - spreminjanje	f
00030000-5554-87f1-8051-9628f874eedd	Drzava-read	Drzava - branje	f
00030000-5554-87f1-5071-98550ce30e2a	Drzava-write	Drzava - spreminjanje	f
00030000-5554-87f1-06d8-6a866646babb	Funkcija-read	Funkcija - branje	f
00030000-5554-87f1-7d5a-6108f39caf0a	Funkcija-write	Funkcija - spreminjanje	f
00030000-5554-87f1-e8ee-4a46b6c7cca1	Gostovanje-read	Gostovanje - branje	f
00030000-5554-87f1-138a-c25ba10dd720	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5554-87f1-358e-6b7c763dc3aa	Gostujoca-read	Gostujoca - branje	f
00030000-5554-87f1-18ad-dd3b9192a4ec	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5554-87f1-a6b2-5c888483df00	Kupec-read	Kupec - branje	f
00030000-5554-87f1-9aa7-112da135d2c7	Kupec-write	Kupec - spreminjanje	f
00030000-5554-87f1-3dee-955d607ef412	NacinPlacina-read	NacinPlacina - branje	f
00030000-5554-87f1-d1f9-0a672866e987	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5554-87f1-1467-52f5b1ecde47	Option-read	Option - branje	f
00030000-5554-87f1-fc5b-033c36c0dd60	Option-write	Option - spreminjanje	f
00030000-5554-87f1-e249-f247253bee3c	OptionValue-read	OptionValue - branje	f
00030000-5554-87f1-0bd6-12d23fbde9ed	OptionValue-write	OptionValue - spreminjanje	f
00030000-5554-87f1-278a-1ca059922027	Oseba-read	Oseba - branje	f
00030000-5554-87f1-3dcc-39b6526e7ebd	Oseba-write	Oseba - spreminjanje	f
00030000-5554-87f1-922f-9c5e16d0393b	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5554-87f1-c4d2-04b5b78137a9	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5554-87f1-14ce-96f8887dc5ae	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5554-87f1-8b3e-d5d7071f9c4b	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5554-87f1-1286-54d19c16a302	Pogodba-read	Pogodba - branje	f
00030000-5554-87f1-2196-c18ee997df9a	Pogodba-write	Pogodba - spreminjanje	f
00030000-5554-87f1-2b87-fe790a7786ca	Popa-read	Popa - branje	f
00030000-5554-87f1-c032-7bdd9223081a	Popa-write	Popa - spreminjanje	f
00030000-5554-87f1-22a9-dc958f193d5d	Posta-read	Posta - branje	f
00030000-5554-87f1-f565-1f69339081f8	Posta-write	Posta - spreminjanje	f
00030000-5554-87f1-90a3-019851e1e7df	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5554-87f1-6d52-d4fe9edde343	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5554-87f1-0f20-cc4328967ddc	PostniNaslov-read	PostniNaslov - branje	f
00030000-5554-87f1-33e9-f06c0e82a053	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5554-87f1-70c2-b65d514970ef	Predstava-read	Predstava - branje	f
00030000-5554-87f1-370e-1c4ab5b91da4	Predstava-write	Predstava - spreminjanje	f
00030000-5554-87f1-d0dd-5de7dd083c1b	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5554-87f1-ff5b-fda0019c33d3	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5554-87f1-6e28-9ca994b0b31d	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5554-87f1-f8b9-63247e13fc7e	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5554-87f1-4a7e-c741432cdd83	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5554-87f1-6675-c9e7bce2f886	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5554-87f1-46aa-3b7c773c645f	Prostor-read	Prostor - branje	f
00030000-5554-87f1-bdc6-63f047627a96	Prostor-write	Prostor - spreminjanje	f
00030000-5554-87f1-8180-fea315d8e1c0	Racun-read	Racun - branje	f
00030000-5554-87f1-8c71-e4568e356331	Racun-write	Racun - spreminjanje	f
00030000-5554-87f1-647f-cfb7035b991a	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5554-87f1-a1e3-b7d8adc0ea7d	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5554-87f1-1645-1727cecc3f64	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5554-87f1-9c02-ff81ae764ebb	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5554-87f1-e022-05b099c394aa	Rekvizit-read	Rekvizit - branje	f
00030000-5554-87f1-458b-b379f700c604	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5554-87f1-8df4-825a11eec58f	Rezervacija-read	Rezervacija - branje	f
00030000-5554-87f1-e820-3c5b563e9926	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5554-87f1-4360-9d540411aa8a	SedezniRed-read	SedezniRed - branje	f
00030000-5554-87f1-523e-7567252096b9	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5554-87f1-24f6-c7335da5b77a	Sedez-read	Sedez - branje	f
00030000-5554-87f1-f4e1-d521271739e2	Sedez-write	Sedez - spreminjanje	f
00030000-5554-87f1-f5dd-91e175d12de2	Sezona-read	Sezona - branje	f
00030000-5554-87f1-789a-3ececaa5cf2f	Sezona-write	Sezona - spreminjanje	f
00030000-5554-87f1-7e36-d59167d9f722	Telefonska-read	Telefonska - branje	f
00030000-5554-87f1-9b38-5cfd42523d43	Telefonska-write	Telefonska - spreminjanje	f
00030000-5554-87f1-dbbe-eff1b4831125	TerminStoritve-read	TerminStoritve - branje	f
00030000-5554-87f1-4558-0f10bfff9110	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5554-87f1-b5c5-2ddc2772b9f3	TipFunkcije-read	TipFunkcije - branje	f
00030000-5554-87f1-04b9-e2497e16ae0c	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5554-87f1-4876-b902ea31ba68	Trr-read	Trr - branje	f
00030000-5554-87f1-4787-134b478f8132	Trr-write	Trr - spreminjanje	f
00030000-5554-87f1-abdc-e3e1c2e50c93	Uprizoritev-read	Uprizoritev - branje	f
00030000-5554-87f1-db2e-31dbe305090c	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5554-87f1-b299-dac6147a9609	Vaja-read	Vaja - branje	f
00030000-5554-87f1-f590-6af28820a9af	Vaja-write	Vaja - spreminjanje	f
00030000-5554-87f1-ccd9-d8d9b8e656c3	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5554-87f1-64db-63fd40cb9411	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5554-87f1-743a-cbd494a9689a	Zaposlitev-read	Zaposlitev - branje	f
00030000-5554-87f1-981d-4c9a4d2d846f	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5554-87f1-1359-9cf2b2dab419	Zasedenost-read	Zasedenost - branje	f
00030000-5554-87f1-d1db-bd8bc40cd0f5	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5554-87f1-ea51-254be0e618da	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5554-87f1-c2a2-42511068ae15	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5554-87f1-4efb-92b37d4996a0	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5554-87f1-a0d9-e5c010313cb2	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2635 (class 0 OID 3387761)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5554-87f1-87c2-b283d27e10c5	00030000-5554-87f1-8051-9628f874eedd
00020000-5554-87f1-7afd-a024700fde0d	00030000-5554-87f1-5071-98550ce30e2a
00020000-5554-87f1-7afd-a024700fde0d	00030000-5554-87f1-8051-9628f874eedd
\.


--
-- TOC entry 2663 (class 0 OID 3388045)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 3388075)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 3388190)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 3387819)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 3387861)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5554-87f0-4906-276cde79d9d9	8341	Adlešiči
00050000-5554-87f0-fbb8-673d0e44e5a1	5270	Ajdovščina
00050000-5554-87f0-fa93-dbca496e9d49	6280	Ankaran/Ancarano
00050000-5554-87f0-7a6f-83e885121a9c	9253	Apače
00050000-5554-87f0-849d-7b5dfcd05080	8253	Artiče
00050000-5554-87f0-54e3-1fabd8889282	4275	Begunje na Gorenjskem
00050000-5554-87f0-5bc8-c944a200c052	1382	Begunje pri Cerknici
00050000-5554-87f0-e127-0ff4e79d71e1	9231	Beltinci
00050000-5554-87f0-7ae9-393d03f09d0a	2234	Benedikt
00050000-5554-87f0-15c2-4fc86e46f265	2345	Bistrica ob Dravi
00050000-5554-87f0-0247-de30b02adb03	3256	Bistrica ob Sotli
00050000-5554-87f0-ead8-ee4b6e54cfb2	8259	Bizeljsko
00050000-5554-87f0-6304-af834b12f09e	1223	Blagovica
00050000-5554-87f0-4813-43410cb32e21	8283	Blanca
00050000-5554-87f0-18a8-193067930e59	4260	Bled
00050000-5554-87f0-89ec-53a11cf02602	4273	Blejska Dobrava
00050000-5554-87f0-6ec4-c8faf771b025	9265	Bodonci
00050000-5554-87f0-3ef5-da7e56466d32	9222	Bogojina
00050000-5554-87f0-aaf2-00a1729462bd	4263	Bohinjska Bela
00050000-5554-87f0-e10d-4b601b81fb88	4264	Bohinjska Bistrica
00050000-5554-87f0-1688-0fc0051dbda2	4265	Bohinjsko jezero
00050000-5554-87f0-8abc-3e4f3cc5e338	1353	Borovnica
00050000-5554-87f0-3efb-fae14aef4759	8294	Boštanj
00050000-5554-87f0-1671-532757d7ae46	5230	Bovec
00050000-5554-87f0-1cb6-e768b64f8a15	5295	Branik
00050000-5554-87f0-c920-4a5798d6f9e5	3314	Braslovče
00050000-5554-87f0-c904-fe815e822726	5223	Breginj
00050000-5554-87f0-f1f0-56973b510a8b	8280	Brestanica
00050000-5554-87f0-e4d9-e0561bb2dbdd	2354	Bresternica
00050000-5554-87f0-2015-d3cfb98f7ae9	4243	Brezje
00050000-5554-87f0-d217-8cf0c4c2608d	1351	Brezovica pri Ljubljani
00050000-5554-87f0-14dc-d6ddf9b7f966	8250	Brežice
00050000-5554-87f0-e3a1-58b5fe43711f	4210	Brnik - Aerodrom
00050000-5554-87f0-6537-3fd0981574ec	8321	Brusnice
00050000-5554-87f0-c0cf-9d6ca904200e	3255	Buče
00050000-5554-87f0-e683-b241d0dc298d	8276	Bučka 
00050000-5554-87f0-b4f6-c79b92e749d4	9261	Cankova
00050000-5554-87f0-14d3-9b838224eb86	3000	Celje 
00050000-5554-87f0-49d3-35c5aae0b8f6	3001	Celje - poštni predali
00050000-5554-87f0-dc33-26238367c584	4207	Cerklje na Gorenjskem
00050000-5554-87f0-1e49-4707407a928f	8263	Cerklje ob Krki
00050000-5554-87f0-7677-6c06a09c6fd2	1380	Cerknica
00050000-5554-87f0-6cec-ddbc56e2a33e	5282	Cerkno
00050000-5554-87f0-96c1-7b3153ac78b1	2236	Cerkvenjak
00050000-5554-87f0-148e-4edaf57d6680	2215	Ceršak
00050000-5554-87f0-e8b6-aa21a8f14826	2326	Cirkovce
00050000-5554-87f0-6b00-ddd9ba277ebb	2282	Cirkulane
00050000-5554-87f0-5ef5-b458d265762d	5273	Col
00050000-5554-87f0-722d-6796094d8781	8251	Čatež ob Savi
00050000-5554-87f0-e4bd-78824468bccd	1413	Čemšenik
00050000-5554-87f0-6845-a86dc31cb555	5253	Čepovan
00050000-5554-87f0-0732-e73597211aa1	9232	Črenšovci
00050000-5554-87f0-63e9-06c67b24c7ff	2393	Črna na Koroškem
00050000-5554-87f0-afc3-9b1bd63b584d	6275	Črni Kal
00050000-5554-87f0-bb93-e7a69410ddb5	5274	Črni Vrh nad Idrijo
00050000-5554-87f0-d4be-4735ac753528	5262	Črniče
00050000-5554-87f0-c768-79c4a2acaf56	8340	Črnomelj
00050000-5554-87f0-c5d0-e91f8914588b	6271	Dekani
00050000-5554-87f0-0f33-c4f134771c79	5210	Deskle
00050000-5554-87f0-38b5-1e2fa3fa0bed	2253	Destrnik
00050000-5554-87f0-2b63-831fafe64a6d	6215	Divača
00050000-5554-87f0-5c89-b61686c9340f	1233	Dob
00050000-5554-87f0-5090-36f42b19dc6d	3224	Dobje pri Planini
00050000-5554-87f0-7338-80aff8b9d11c	8257	Dobova
00050000-5554-87f0-92f3-4d225989ee59	1423	Dobovec
00050000-5554-87f0-509a-4ecc58008cd2	5263	Dobravlje
00050000-5554-87f0-d4a5-1dd4f373a561	3204	Dobrna
00050000-5554-87f0-ad3a-d568b15de94d	8211	Dobrnič
00050000-5554-87f0-d372-f619ff91c225	1356	Dobrova
00050000-5554-87f0-d063-299936d87dfb	9223	Dobrovnik/Dobronak 
00050000-5554-87f0-6c74-bdd2b5745616	5212	Dobrovo v Brdih
00050000-5554-87f0-4381-eddb4263ead2	1431	Dol pri Hrastniku
00050000-5554-87f0-b42f-536a135adbf3	1262	Dol pri Ljubljani
00050000-5554-87f0-8363-a5e93a13dc3a	1273	Dole pri Litiji
00050000-5554-87f0-2def-e8820e55c583	1331	Dolenja vas
00050000-5554-87f0-d732-188155019a01	8350	Dolenjske Toplice
00050000-5554-87f0-6d66-8b84d1a3a36d	1230	Domžale
00050000-5554-87f0-02d4-99acba9f264a	2252	Dornava
00050000-5554-87f0-1335-f599da6bb149	5294	Dornberk
00050000-5554-87f0-b15a-54785f410c26	1319	Draga
00050000-5554-87f0-f1dd-a503050e618d	8343	Dragatuš
00050000-5554-87f0-9362-493c66775b6b	3222	Dramlje
00050000-5554-87f0-64d4-7eb23fff31ca	2370	Dravograd
00050000-5554-87f0-35c9-ea1a00ffa8e0	4203	Duplje
00050000-5554-87f0-a4ab-18beecb5a461	6221	Dutovlje
00050000-5554-87f0-7513-5cb77975dd48	8361	Dvor
00050000-5554-87f0-8b5f-373b10a60cc7	2343	Fala
00050000-5554-87f0-7e7f-0495a69ac4f9	9208	Fokovci
00050000-5554-87f0-060a-ccc0b7f8f026	2313	Fram
00050000-5554-87f0-f2c9-5ada8d3d6b35	3213	Frankolovo
00050000-5554-87f0-7e3c-7b8ef493dd03	1274	Gabrovka
00050000-5554-87f0-7639-45792d011841	8254	Globoko
00050000-5554-87f0-4efb-7b1105992fe6	5275	Godovič
00050000-5554-87f0-781b-b19ba1f3e8af	4204	Golnik
00050000-5554-87f0-95bd-b0ff02d1f429	3303	Gomilsko
00050000-5554-87f0-39b7-f94945539d8b	4224	Gorenja vas
00050000-5554-87f0-4052-6753f7152d41	3263	Gorica pri Slivnici
00050000-5554-87f0-b71c-d1ff286e421f	2272	Gorišnica
00050000-5554-87f0-ab3b-8fc27a3ece2f	9250	Gornja Radgona
00050000-5554-87f0-927b-76baee209334	3342	Gornji Grad
00050000-5554-87f0-a9f7-398982456475	4282	Gozd Martuljek
00050000-5554-87f0-f7fd-8e2760f5cee7	6272	Gračišče
00050000-5554-87f0-b5be-f868a0d619e3	9264	Grad
00050000-5554-87f0-0c5d-9a0283794e2c	8332	Gradac
00050000-5554-87f0-5fb6-11fd13ab0d76	1384	Grahovo
00050000-5554-87f0-abe9-3067129302f6	5242	Grahovo ob Bači
00050000-5554-87f0-c98c-7930dca9f1d5	5251	Grgar
00050000-5554-87f0-e56b-14ef7443e377	3302	Griže
00050000-5554-87f0-3b40-f03b5f086240	3231	Grobelno
00050000-5554-87f0-e502-43fd8f731087	1290	Grosuplje
00050000-5554-87f0-0fd9-2426070d5582	2288	Hajdina
00050000-5554-87f0-7644-d89572f45f3c	8362	Hinje
00050000-5554-87f0-0e25-2a3387e17b61	2311	Hoče
00050000-5554-87f0-20d3-44da13dcfa70	9205	Hodoš/Hodos
00050000-5554-87f0-6e92-bdadc0fd0900	1354	Horjul
00050000-5554-87f0-1cc3-dd3f4906841d	1372	Hotedršica
00050000-5554-87f0-1b98-a07084c34f4d	1430	Hrastnik
00050000-5554-87f0-2668-b393c3a9a169	6225	Hruševje
00050000-5554-87f0-089a-090b71162791	4276	Hrušica
00050000-5554-87f0-f956-313a11c10371	5280	Idrija
00050000-5554-87f0-6a39-caf7b4fbb4db	1292	Ig
00050000-5554-87f0-ee46-4922951b0c5a	6250	Ilirska Bistrica
00050000-5554-87f0-7b5e-0845e280cb1c	6251	Ilirska Bistrica-Trnovo
00050000-5554-87f0-2143-fefc34c4fe78	1295	Ivančna Gorica
00050000-5554-87f0-f1d3-930e2bdec7e7	2259	Ivanjkovci
00050000-5554-87f0-48ea-79c9846521dd	1411	Izlake
00050000-5554-87f0-1f23-170ad4fa76c7	6310	Izola/Isola
00050000-5554-87f0-7fb0-e2a6e82b7505	2222	Jakobski Dol
00050000-5554-87f0-dea4-c6f5c0565d2a	2221	Jarenina
00050000-5554-87f0-5a87-87b3ff2fdf7f	6254	Jelšane
00050000-5554-87f0-5812-58aacea8a9f1	4270	Jesenice
00050000-5554-87f0-72fe-f35e1233536f	8261	Jesenice na Dolenjskem
00050000-5554-87f0-a13d-4b1033c3b0ad	3273	Jurklošter
00050000-5554-87f0-d0ff-97739f1ef85b	2223	Jurovski Dol
00050000-5554-87f0-0053-1f33830cbeab	2256	Juršinci
00050000-5554-87f0-31de-7f0de604ed26	5214	Kal nad Kanalom
00050000-5554-87f0-4ca2-60dadcac2f3b	3233	Kalobje
00050000-5554-87f0-3b85-ec106ab62771	4246	Kamna Gorica
00050000-5554-87f0-d609-fbb4791ccf6c	2351	Kamnica
00050000-5554-87f0-1c7c-5b399d023c15	1241	Kamnik
00050000-5554-87f0-d48d-5844f7bb612d	5213	Kanal
00050000-5554-87f0-fa15-abf6805752b1	8258	Kapele
00050000-5554-87f0-c122-1705996d835a	2362	Kapla
00050000-5554-87f0-d503-3c414f738107	2325	Kidričevo
00050000-5554-87f0-4a20-e26e12e31118	1412	Kisovec
00050000-5554-87f0-d616-8d0124023134	6253	Knežak
00050000-5554-87f0-c7fc-f8889f52cc47	5222	Kobarid
00050000-5554-87f0-aa2d-3c38fe4a029a	9227	Kobilje
00050000-5554-87f0-55e1-9386b25ace26	1330	Kočevje
00050000-5554-87f0-0d78-8be972d8f4aa	1338	Kočevska Reka
00050000-5554-87f0-57b2-a0cd5873021e	2276	Kog
00050000-5554-87f0-9b5c-d37d8ea935e8	5211	Kojsko
00050000-5554-87f0-59ef-910d542ccad4	6223	Komen
00050000-5554-87f0-8882-dab1d6c93fc2	1218	Komenda
00050000-5554-87f0-fea1-e6819d7c5c3d	6000	Koper/Capodistria 
00050000-5554-87f0-ffd3-ac95a6824443	6001	Koper/Capodistria - poštni predali
00050000-5554-87f0-d595-74cdf6ed3047	8282	Koprivnica
00050000-5554-87f0-07b0-1cfb532d6b13	5296	Kostanjevica na Krasu
00050000-5554-87f0-eec6-e8e0af90dd80	8311	Kostanjevica na Krki
00050000-5554-87f0-fc9b-6b03c890d668	1336	Kostel
00050000-5554-87f0-20d5-e9ac270b3c6b	6256	Košana
00050000-5554-87f0-422d-e6c7bca9b389	2394	Kotlje
00050000-5554-87f0-3c79-1956ab46334b	6240	Kozina
00050000-5554-87f0-955f-94a12d2742d0	3260	Kozje
00050000-5554-87f0-0ca7-f559392c4a3a	4000	Kranj 
00050000-5554-87f0-7fe3-f4b2ac73211a	4001	Kranj - poštni predali
00050000-5554-87f0-c4ab-564201ee1c27	4280	Kranjska Gora
00050000-5554-87f0-1a20-59a1c77eda41	1281	Kresnice
00050000-5554-87f0-61c8-d06352b91225	4294	Križe
00050000-5554-87f0-294d-0ea310fe6bce	9206	Križevci
00050000-5554-87f0-428d-533163204546	9242	Križevci pri Ljutomeru
00050000-5554-87f0-7dd6-af21aef35726	1301	Krka
00050000-5554-87f0-e679-7c96d81e2e59	8296	Krmelj
00050000-5554-87f0-cdfb-a02ce56908ea	4245	Kropa
00050000-5554-87f0-30dd-55288d6259bc	8262	Krška vas
00050000-5554-87f0-b1a6-a83b9ca2a396	8270	Krško
00050000-5554-87f0-e6ff-5bec225698aa	9263	Kuzma
00050000-5554-87f0-ab55-c3780cacac52	2318	Laporje
00050000-5554-87f0-487f-a6b37311c834	3270	Laško
00050000-5554-87f0-cb34-fe01ddacd252	1219	Laze v Tuhinju
00050000-5554-87f0-e892-ad26dff4a118	2230	Lenart v Slovenskih goricah
00050000-5554-87f0-2095-afe63550bce6	9220	Lendava/Lendva
00050000-5554-87f0-5425-0e81be6b059c	4248	Lesce
00050000-5554-87f0-7138-018219b7aa17	3261	Lesično
00050000-5554-87f0-99a1-f861ecdd73c6	8273	Leskovec pri Krškem
00050000-5554-87f0-5906-b39bcdd458eb	2372	Libeliče
00050000-5554-87f0-51aa-285d64442e7e	2341	Limbuš
00050000-5554-87f0-7130-33eef8f4d667	1270	Litija
00050000-5554-87f0-0d6a-967ca2ec7c51	3202	Ljubečna
00050000-5554-87f0-3dfe-6658c6422b9c	1000	Ljubljana 
00050000-5554-87f0-04d2-6237818884fc	1001	Ljubljana - poštni predali
00050000-5554-87f0-f7f2-71c83c5de1c4	1231	Ljubljana - Črnuče
00050000-5554-87f0-2ac8-d4b6e3ce35f1	1261	Ljubljana - Dobrunje
00050000-5554-87f0-bbe4-e28b75212b62	1260	Ljubljana - Polje
00050000-5554-87f0-dbd5-f3e5c57fadcc	1210	Ljubljana - Šentvid
00050000-5554-87f0-dec6-e34bffa89abc	1211	Ljubljana - Šmartno
00050000-5554-87f0-d201-ebcd448ed051	3333	Ljubno ob Savinji
00050000-5554-87f0-c485-0bef857ebf20	9240	Ljutomer
00050000-5554-87f0-72a9-6f690b5a6a36	3215	Loče
00050000-5554-87f0-3864-fd35a98f2fcc	5231	Log pod Mangartom
00050000-5554-87f0-0bcb-f01eeb74484a	1358	Log pri Brezovici
00050000-5554-87f0-d9c5-54d6aae6e0ba	1370	Logatec
00050000-5554-87f0-3553-e68e2a99ffad	1371	Logatec
00050000-5554-87f0-345e-5a619e775324	1434	Loka pri Zidanem Mostu
00050000-5554-87f0-070b-b4500ddcd1f7	3223	Loka pri Žusmu
00050000-5554-87f0-9984-728fde8bb5bd	6219	Lokev
00050000-5554-87f0-e62c-785a8c7b8581	1318	Loški Potok
00050000-5554-87f0-71c6-c8c5ecbfa2b2	2324	Lovrenc na Dravskem polju
00050000-5554-87f0-aa75-bd3d3cc7ad53	2344	Lovrenc na Pohorju
00050000-5554-87f0-f54d-9cf8ed5eb830	3334	Luče
00050000-5554-87f0-c779-9f22a0ca6825	1225	Lukovica
00050000-5554-87f0-7c2e-98bc0dbf19b5	9202	Mačkovci
00050000-5554-87f0-cb9b-06016d740cfe	2322	Majšperk
00050000-5554-87f0-7ac4-0e765441d18b	2321	Makole
00050000-5554-87f0-e564-d405d4a39ed8	9243	Mala Nedelja
00050000-5554-87f0-dcd2-fa5e98e9342a	2229	Malečnik
00050000-5554-87f0-dfa9-0272e512e638	6273	Marezige
00050000-5554-87f0-2af1-e23c9a1b4256	2000	Maribor 
00050000-5554-87f0-e01e-38a8d5e6897b	2001	Maribor - poštni predali
00050000-5554-87f0-4530-7355f414a770	2206	Marjeta na Dravskem polju
00050000-5554-87f0-e1a9-13387b23b1f2	2281	Markovci
00050000-5554-87f0-5aef-4435711275c0	9221	Martjanci
00050000-5554-87f0-71be-3bb9359d5d76	6242	Materija
00050000-5554-87f0-eefb-e15c91be4a7f	4211	Mavčiče
00050000-5554-87f0-c8c4-f7083d2eee05	1215	Medvode
00050000-5554-87f0-d5ea-a46a42eb4594	1234	Mengeš
00050000-5554-87f0-cf29-c7efc67576c9	8330	Metlika
00050000-5554-87f0-0a99-a7291fd52bf1	2392	Mežica
00050000-5554-87f0-e6a6-6fcf2a7bc4e1	2204	Miklavž na Dravskem polju
00050000-5554-87f0-c4cf-c3634094038b	2275	Miklavž pri Ormožu
00050000-5554-87f0-4b13-9d49ab3e2f94	5291	Miren
00050000-5554-87f0-21c0-5a4c95edc5ca	8233	Mirna
00050000-5554-87f0-f135-aff8c15f2580	8216	Mirna Peč
00050000-5554-87f0-4b7f-d4c9c08ab369	2382	Mislinja
00050000-5554-87f0-4314-8ef2b6d6f0d4	4281	Mojstrana
00050000-5554-87f0-e35f-7a3e78fa1e4f	8230	Mokronog
00050000-5554-87f0-bdbb-6c2669dae602	1251	Moravče
00050000-5554-87f0-e759-df6f968d4e20	9226	Moravske Toplice
00050000-5554-87f0-c69a-b4cac43f3a81	5216	Most na Soči
00050000-5554-87f0-fafe-f418de5b8445	1221	Motnik
00050000-5554-87f0-cd9e-54bb4313b0f0	3330	Mozirje
00050000-5554-87f0-0da2-7e5c7abd803f	9000	Murska Sobota 
00050000-5554-87f0-8fb9-e51c55900447	9001	Murska Sobota - poštni predali
00050000-5554-87f0-ce38-36e0154288a6	2366	Muta
00050000-5554-87f0-482b-a0bf4b078f7f	4202	Naklo
00050000-5554-87f0-21ab-24ca4d16d949	3331	Nazarje
00050000-5554-87f0-9805-130efa47938c	1357	Notranje Gorice
00050000-5554-87f0-d399-88cacfe4c337	3203	Nova Cerkev
00050000-5554-87f0-9005-29c5048030e4	5000	Nova Gorica 
00050000-5554-87f0-02f3-5f6a644dc3e3	5001	Nova Gorica - poštni predali
00050000-5554-87f0-adbe-e97a5c03626e	1385	Nova vas
00050000-5554-87f0-0ffb-6c3766825bef	8000	Novo mesto
00050000-5554-87f0-8d72-f581f2daa80c	8001	Novo mesto - poštni predali
00050000-5554-87f0-6ae1-23d32f0790d3	6243	Obrov
00050000-5554-87f0-a792-221a7a422bab	9233	Odranci
00050000-5554-87f0-bd8d-e9e964180308	2317	Oplotnica
00050000-5554-87f0-e818-12f5eff74ffa	2312	Orehova vas
00050000-5554-87f0-a8f5-84c43a634d5b	2270	Ormož
00050000-5554-87f0-7d4e-664f2bad9024	1316	Ortnek
00050000-5554-87f0-c229-14d1f428ba3b	1337	Osilnica
00050000-5554-87f0-1d7f-4b89e365e781	8222	Otočec
00050000-5554-87f0-1816-f04e2a64fcb7	2361	Ožbalt
00050000-5554-87f0-cf0c-b83b2e23cc4e	2231	Pernica
00050000-5554-87f0-6b11-985c3612a3cb	2211	Pesnica pri Mariboru
00050000-5554-87f0-831a-51520598823d	9203	Petrovci
00050000-5554-87f0-17f2-ce3f1b630226	3301	Petrovče
00050000-5554-87f0-317a-71c56d232188	6330	Piran/Pirano
00050000-5554-87f0-5a2b-868ae490d86f	8255	Pišece
00050000-5554-87f0-82d1-ceb9da855570	6257	Pivka
00050000-5554-87f0-c754-61d3c7c88a26	6232	Planina
00050000-5554-87f0-dbf7-a342e0b56433	3225	Planina pri Sevnici
00050000-5554-87f0-4c3a-e025637fa4ba	6276	Pobegi
00050000-5554-87f0-15f8-f7c8c77e019c	8312	Podbočje
00050000-5554-87f0-0e0b-5784b4d5697a	5243	Podbrdo
00050000-5554-87f0-49c7-8aa60ea3321e	3254	Podčetrtek
00050000-5554-87f0-e336-d78b787bd9a7	2273	Podgorci
00050000-5554-87f0-3abb-a0859bf3ee05	6216	Podgorje
00050000-5554-87f0-31d0-e69d92fc09df	2381	Podgorje pri Slovenj Gradcu
00050000-5554-87f0-35a4-746cd9efc48b	6244	Podgrad
00050000-5554-87f0-c0ed-cbad0b50c560	1414	Podkum
00050000-5554-87f0-f3d7-4facdf0ee1a0	2286	Podlehnik
00050000-5554-87f0-7b95-9a68654c8b1f	5272	Podnanos
00050000-5554-87f0-a245-9197b7945727	4244	Podnart
00050000-5554-87f0-c97e-40c16ca5272e	3241	Podplat
00050000-5554-87f0-e49c-3736eb415d9e	3257	Podsreda
00050000-5554-87f0-4b12-66701cc7f6f3	2363	Podvelka
00050000-5554-87f0-15ed-619a758273ed	2208	Pohorje
00050000-5554-87f0-c6e9-b670a969dba2	2257	Polenšak
00050000-5554-87f0-e135-2d0db37bc958	1355	Polhov Gradec
00050000-5554-87f0-7a6c-75c9776a266d	4223	Poljane nad Škofjo Loko
00050000-5554-87f0-8c9e-7eb7bb465848	2319	Poljčane
00050000-5554-87f0-f013-86488bb061f8	1272	Polšnik
00050000-5554-87f0-7f44-00eff77ad8db	3313	Polzela
00050000-5554-87f0-ce34-d8e4edd937ec	3232	Ponikva
00050000-5554-87f0-8651-91579e71de33	6320	Portorož/Portorose
00050000-5554-87f0-5a78-ebcf59817f7c	6230	Postojna
00050000-5554-87f0-5cd4-b49b7b726c7f	2331	Pragersko
00050000-5554-87f0-748d-2c676434ad68	3312	Prebold
00050000-5554-87f0-f498-c3836aee9487	4205	Preddvor
00050000-5554-87f0-7c1b-69c3633bd7d3	6255	Prem
00050000-5554-87f0-bf55-5289b184ca31	1352	Preserje
00050000-5554-87f0-a5f1-95f29e515242	6258	Prestranek
00050000-5554-87f0-d0d6-e7fe0fb8669d	2391	Prevalje
00050000-5554-87f0-6d59-19b03f92fbad	3262	Prevorje
00050000-5554-87f0-8ba2-c50569c6894f	1276	Primskovo 
00050000-5554-87f0-21f3-2d7eb0b08d96	3253	Pristava pri Mestinju
00050000-5554-87f0-48e3-638fb29ee957	9207	Prosenjakovci/Partosfalva
00050000-5554-87f0-c956-4b995c936272	5297	Prvačina
00050000-5554-87f0-fcba-7da24cc78ac0	2250	Ptuj
00050000-5554-87f0-8b8a-54c68157bf23	2323	Ptujska Gora
00050000-5554-87f0-bd04-e2bc095b147f	9201	Puconci
00050000-5554-87f0-0edf-187f20c7ae54	2327	Rače
00050000-5554-87f0-2a1e-952c572f459a	1433	Radeče
00050000-5554-87f0-5713-b48b18f569a9	9252	Radenci
00050000-5554-87f0-afd3-07581b7537f4	2360	Radlje ob Dravi
00050000-5554-87f0-86f1-41d290905caa	1235	Radomlje
00050000-5554-87f0-886b-52d00e005ca8	4240	Radovljica
00050000-5554-87f0-aa59-3664cedc67b9	8274	Raka
00050000-5554-87f0-1417-d1fdcc3f8c9e	1381	Rakek
00050000-5554-87f0-2cf5-45493577dbac	4283	Rateče - Planica
00050000-5554-87f0-8c9d-3b19ba120096	2390	Ravne na Koroškem
00050000-5554-87f0-5baf-e269ba55591d	9246	Razkrižje
00050000-5554-87f0-b388-9bdbf15e5354	3332	Rečica ob Savinji
00050000-5554-87f0-7be5-54648cf6cb1f	5292	Renče
00050000-5554-87f0-d95c-6ef8503b9f70	1310	Ribnica
00050000-5554-87f0-48b9-8be0c568ef9e	2364	Ribnica na Pohorju
00050000-5554-87f0-8dc9-f044c41f42ca	3272	Rimske Toplice
00050000-5554-87f0-84c1-027003b1e2a0	1314	Rob
00050000-5554-87f0-49c6-0ca32139b189	5215	Ročinj
00050000-5554-87f0-e03a-c6f189b10f6d	3250	Rogaška Slatina
00050000-5554-87f0-d1c7-f1e99ea1e539	9262	Rogašovci
00050000-5554-87f0-8f19-13eefaa1e887	3252	Rogatec
00050000-5554-87f0-92c3-cdeb4e6da54f	1373	Rovte
00050000-5554-87f0-b360-5b7394b9524f	2342	Ruše
00050000-5554-87f0-2a2e-ad40c37810bf	1282	Sava
00050000-5554-87f0-cca7-aac9a4720cca	6333	Sečovlje/Sicciole
00050000-5554-87f0-3724-58f7744b113e	4227	Selca
00050000-5554-87f0-df0c-51f9cf85e714	2352	Selnica ob Dravi
00050000-5554-87f0-1da0-24cf9cef616d	8333	Semič
00050000-5554-87f0-2a02-c4bc2ed0b236	8281	Senovo
00050000-5554-87f0-aa80-9dbea098ee1e	6224	Senožeče
00050000-5554-87f0-63f8-75557f3fe6bf	8290	Sevnica
00050000-5554-87f0-876f-45be095c93e7	6210	Sežana
00050000-5554-87f0-ef56-f436bb0e1453	2214	Sladki Vrh
00050000-5554-87f0-4de8-1cacdb077e99	5283	Slap ob Idrijci
00050000-5554-87f0-bb1e-6c2b486fa56d	2380	Slovenj Gradec
00050000-5554-87f0-bbfb-fe6e9f8ce21e	2310	Slovenska Bistrica
00050000-5554-87f0-92a1-9f248e3c53ce	3210	Slovenske Konjice
00050000-5554-87f0-c271-ec8652ba7bf3	1216	Smlednik
00050000-5554-87f0-bd11-fa1fcc1e9e18	5232	Soča
00050000-5554-87f0-7531-051a953b5a70	1317	Sodražica
00050000-5554-87f0-e9bd-a8c58a2d9b93	3335	Solčava
00050000-5554-87f0-92f1-a1f79676236e	5250	Solkan
00050000-5554-87f0-8ec8-3771a2517732	4229	Sorica
00050000-5554-87f0-a736-c562af8986f3	4225	Sovodenj
00050000-5554-87f0-97c9-47efe8f6bbaf	5281	Spodnja Idrija
00050000-5554-87f0-ae38-99ae8c24ea20	2241	Spodnji Duplek
00050000-5554-87f0-3c00-37bd01eba86c	9245	Spodnji Ivanjci
00050000-5554-87f0-3830-7a8744e08759	2277	Središče ob Dravi
00050000-5554-87f0-9bd5-23c73f7ee82a	4267	Srednja vas v Bohinju
00050000-5554-87f0-e9a4-8d56a83f7cda	8256	Sromlje 
00050000-5554-87f0-c293-7c78bb683b15	5224	Srpenica
00050000-5554-87f0-39fc-d7f233fd0461	1242	Stahovica
00050000-5554-87f0-acbe-858d71fe5cf9	1332	Stara Cerkev
00050000-5554-87f0-9bd1-1950e31ae7e9	8342	Stari trg ob Kolpi
00050000-5554-87f0-fd99-c0dd3b09c6d5	1386	Stari trg pri Ložu
00050000-5554-87f0-3717-69ecff66ed4a	2205	Starše
00050000-5554-87f0-2ebd-4484d0ddf974	2289	Stoperce
00050000-5554-87f0-7b92-7d12341cba70	8322	Stopiče
00050000-5554-87f0-2ca8-6f1ebf3edcab	3206	Stranice
00050000-5554-87f0-0453-836e87d2aa5a	8351	Straža
00050000-5554-87f0-e812-66ca29fd0993	1313	Struge
00050000-5554-87f0-8ede-3581354c708f	8293	Studenec
00050000-5554-87f0-5166-063aa3a7b8f1	8331	Suhor
00050000-5554-87f0-24de-7c71335f98db	2233	Sv. Ana v Slovenskih goricah
00050000-5554-87f0-1780-4c16f0faa97f	2235	Sv. Trojica v Slovenskih goricah
00050000-5554-87f0-ba27-c831ddf94761	2353	Sveti Duh na Ostrem Vrhu
00050000-5554-87f0-4658-ba5fdc6d2f23	9244	Sveti Jurij ob Ščavnici
00050000-5554-87f0-5bdb-700cd268b4ae	3264	Sveti Štefan
00050000-5554-87f0-5220-33343050c884	2258	Sveti Tomaž
00050000-5554-87f0-fdf1-c2696577db0b	9204	Šalovci
00050000-5554-87f0-8244-2d9c1782bfc7	5261	Šempas
00050000-5554-87f0-a382-763a3497052d	5290	Šempeter pri Gorici
00050000-5554-87f0-6f9c-ec7e2a0ae9f4	3311	Šempeter v Savinjski dolini
00050000-5554-87f0-967d-673870606016	4208	Šenčur
00050000-5554-87f0-9003-f77d9fb04639	2212	Šentilj v Slovenskih goricah
00050000-5554-87f0-8671-b15891bf4db5	8297	Šentjanž
00050000-5554-87f0-ec8d-f7079d1ad750	2373	Šentjanž pri Dravogradu
00050000-5554-87f0-3077-4b157ac3e6a0	8310	Šentjernej
00050000-5554-87f0-349c-1726274c1d69	3230	Šentjur
00050000-5554-87f0-7161-266f6a75dbac	3271	Šentrupert
00050000-5554-87f0-ace3-39fe6a808514	8232	Šentrupert
00050000-5554-87f0-9985-ad443624ad89	1296	Šentvid pri Stični
00050000-5554-87f0-9883-03cf79be418c	8275	Škocjan
00050000-5554-87f0-e9de-9a2e9ae9e6ac	6281	Škofije
00050000-5554-87f0-6a9f-9869f13071b6	4220	Škofja Loka
00050000-5554-87f0-adb4-ad2fc84e858e	3211	Škofja vas
00050000-5554-87f0-04ab-c10c0ba799fd	1291	Škofljica
00050000-5554-87f0-535d-b2cceac48c00	6274	Šmarje
00050000-5554-87f0-ed71-3be97e5c6ded	1293	Šmarje - Sap
00050000-5554-87f0-c334-235dc2963095	3240	Šmarje pri Jelšah
00050000-5554-87f0-ca03-940458f7bb32	8220	Šmarješke Toplice
00050000-5554-87f0-434a-fe56d7eb9425	2315	Šmartno na Pohorju
00050000-5554-87f0-5418-44c2ab564194	3341	Šmartno ob Dreti
00050000-5554-87f0-8985-90014404dec1	3327	Šmartno ob Paki
00050000-5554-87f0-c25e-0f5d2ceb60ba	1275	Šmartno pri Litiji
00050000-5554-87f0-c5b7-caa1d88be89a	2383	Šmartno pri Slovenj Gradcu
00050000-5554-87f0-f8b5-a0a940b160e9	3201	Šmartno v Rožni dolini
00050000-5554-87f0-7575-627bf554ad2e	3325	Šoštanj
00050000-5554-87f0-8b7f-a143d2b2fe88	6222	Štanjel
00050000-5554-87f0-5bed-4cffc52f6762	3220	Štore
00050000-5554-87f0-456f-6eaead7f0517	3304	Tabor
00050000-5554-87f0-4863-0dca8235c634	3221	Teharje
00050000-5554-87f0-f5a1-aa00d4b2251d	9251	Tišina
00050000-5554-87f0-03f8-b93a44b65213	5220	Tolmin
00050000-5554-87f0-210b-8720e8c32737	3326	Topolšica
00050000-5554-87f0-e7e9-f7bb04374aae	2371	Trbonje
00050000-5554-87f0-1b3d-df64c886c510	1420	Trbovlje
00050000-5554-87f0-57db-52204b982bb1	8231	Trebelno 
00050000-5554-87f0-66ec-c136097ae9c8	8210	Trebnje
00050000-5554-87f0-c908-03d236933106	5252	Trnovo pri Gorici
00050000-5554-87f0-b74c-3e4d7c97a481	2254	Trnovska vas
00050000-5554-87f0-2864-05544eda82ac	1222	Trojane
00050000-5554-87f0-f5ef-f21c2cccc951	1236	Trzin
00050000-5554-87f0-2b99-183b1c01e7a9	4290	Tržič
00050000-5554-87f0-ba7e-f1fdd53a4ba7	8295	Tržišče
00050000-5554-87f0-6af3-307dd15d7b9e	1311	Turjak
00050000-5554-87f0-7db7-18602818587e	9224	Turnišče
00050000-5554-87f0-f81a-b69a83a45144	8323	Uršna sela
00050000-5554-87f0-cac8-a480239bdf45	1252	Vače
00050000-5554-87f0-c7aa-52a340bcb03e	3320	Velenje 
00050000-5554-87f0-c7c3-c7fff24414dd	3322	Velenje - poštni predali
00050000-5554-87f0-d4f2-1ceb9655ef12	8212	Velika Loka
00050000-5554-87f0-6a0d-2690517345cd	2274	Velika Nedelja
00050000-5554-87f0-0989-3691a8b5cbc5	9225	Velika Polana
00050000-5554-87f0-bf41-3a27698ed0c6	1315	Velike Lašče
00050000-5554-87f0-d622-4c6d3fca7258	8213	Veliki Gaber
00050000-5554-87f0-00ef-621e7f7cfb71	9241	Veržej
00050000-5554-87f0-9d20-98eb9c6bcd34	1312	Videm - Dobrepolje
00050000-5554-87f0-7b66-855cd1397eb5	2284	Videm pri Ptuju
00050000-5554-87f0-c6d7-3a36fa5ed2d1	8344	Vinica
00050000-5554-87f0-2d36-776b9a464631	5271	Vipava
00050000-5554-87f0-4490-55b61a9f6d16	4212	Visoko
00050000-5554-87f0-e284-af6f92109ff5	1294	Višnja Gora
00050000-5554-87f0-6ad9-704e295ce50d	3205	Vitanje
00050000-5554-87f0-235b-f38e6e508bcf	2255	Vitomarci
00050000-5554-87f0-58c8-441e719fefc1	1217	Vodice
00050000-5554-87f0-46ac-188ef4f60e54	3212	Vojnik\t
00050000-5554-87f0-441a-7935a0c1f741	5293	Volčja Draga
00050000-5554-87f0-154f-dd7908f16735	2232	Voličina
00050000-5554-87f0-8534-01971dc8ee89	3305	Vransko
00050000-5554-87f0-22f2-2289e31163c2	6217	Vremski Britof
00050000-5554-87f0-62ab-87dc8efb7ffa	1360	Vrhnika
00050000-5554-87f0-2142-f516acc62744	2365	Vuhred
00050000-5554-87f0-32d4-7124f132bb32	2367	Vuzenica
00050000-5554-87f0-1680-ff686506c14e	8292	Zabukovje 
00050000-5554-87f0-5d12-20837e7dfccf	1410	Zagorje ob Savi
00050000-5554-87f0-79d5-3b1b25dbc81f	1303	Zagradec
00050000-5554-87f0-34f0-55c5941469db	2283	Zavrč
00050000-5554-87f0-e1ac-b3ed5bbc8290	8272	Zdole 
00050000-5554-87f0-44cf-0557f87cede0	4201	Zgornja Besnica
00050000-5554-87f0-ba82-3ecdc4f543c3	2242	Zgornja Korena
00050000-5554-87f0-6c2a-5381ee9f0af0	2201	Zgornja Kungota
00050000-5554-87f0-c898-071c582ea532	2316	Zgornja Ložnica
00050000-5554-87f0-6715-9c716b9e8e89	2314	Zgornja Polskava
00050000-5554-87f0-71bf-9212e74d4f9c	2213	Zgornja Velka
00050000-5554-87f0-5ce2-5167be550f1e	4247	Zgornje Gorje
00050000-5554-87f0-2a19-b3beca0cbc02	4206	Zgornje Jezersko
00050000-5554-87f0-9488-4f168a1842e0	2285	Zgornji Leskovec
00050000-5554-87f0-0abe-36a1463892cd	1432	Zidani Most
00050000-5554-87f0-6123-24f9d0ac56ce	3214	Zreče
00050000-5554-87f0-5286-cfc14c6c57c4	4209	Žabnica
00050000-5554-87f0-2633-9d9eb38410da	3310	Žalec
00050000-5554-87f0-41b5-6a188e73397e	4228	Železniki
00050000-5554-87f0-de88-0d86ee6c18ff	2287	Žetale
00050000-5554-87f0-2aba-71e14f96e363	4226	Žiri
00050000-5554-87f0-8a76-a181a65397d9	4274	Žirovnica
00050000-5554-87f0-c2a0-d79dfa3d9b91	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 3388019)
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
-- TOC entry 2642 (class 0 OID 3387846)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 3387912)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 3388031)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 3388136)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 3388183)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 3388060)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 3388004)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 3387994)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 3388173)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 3388126)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 3387713)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5554-87f1-fb5a-27bd2247b15d	00010000-5554-87f1-e28d-045c793f2275	2015-05-14 13:33:05	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROhNCSGU/t.mAL07Eq0AcbfTuC3BSG0gi";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 3388069)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 3387751)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5554-87f1-2246-26c230640d1b	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5554-87f1-50e7-89a69e39fd6b	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5554-87f1-87c2-b283d27e10c5	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5554-87f1-7dbb-2f81ce2e2e1e	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5554-87f1-982b-a4d8016cc2e5	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5554-87f1-7afd-a024700fde0d	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 3387735)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5554-87f1-fb5a-27bd2247b15d	00020000-5554-87f1-7dbb-2f81ce2e2e1e
00010000-5554-87f1-e28d-045c793f2275	00020000-5554-87f1-7dbb-2f81ce2e2e1e
\.


--
-- TOC entry 2668 (class 0 OID 3388083)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 3388025)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 3387975)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 3387811)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 3387981)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 3388161)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 3387881)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 3387722)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5554-87f1-e28d-045c793f2275	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROguyd/TLQRKyLTn/x6SFVJpjiG6MGM22	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5554-87f1-fb5a-27bd2247b15d	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 3388215)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 3387927)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 3388052)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 3388118)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 3387959)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 3388205)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 3388108)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2274 (class 2606 OID 3387776)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 3388255)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 3388248)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 3388160)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 3387949)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2343 (class 2606 OID 3387974)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 3387907)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 3388104)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 3387925)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 3387968)
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
-- TOC entry 2364 (class 2606 OID 3388017)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 3388044)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2303 (class 2606 OID 3387879)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2278 (class 2606 OID 3387785)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2293 (class 2606 OID 3387843)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2280 (class 2606 OID 3387809)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2272 (class 2606 OID 3387765)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2265 (class 2606 OID 3387750)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 3388050)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 3388082)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 3388200)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2288 (class 2606 OID 3387836)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 3387867)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 3388023)
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
-- TOC entry 2298 (class 2606 OID 3387857)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 3387916)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 3388035)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 3388142)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 3388188)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 3388067)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 3388008)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 3387999)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 3388182)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 3388133)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2257 (class 2606 OID 3387721)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 3388073)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 3387739)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2267 (class 2606 OID 3387759)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2395 (class 2606 OID 3388091)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 3388030)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 3387980)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2285 (class 2606 OID 3387816)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 3387990)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 3388172)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2308 (class 2606 OID 3387892)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 3387734)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 3388230)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 3387934)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 3388058)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 3388124)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 3387963)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 3388214)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 3388117)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 1259 OID 3387956)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2286 (class 1259 OID 3387838)
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
-- TOC entry 2377 (class 1259 OID 3388051)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2371 (class 1259 OID 3388037)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2372 (class 1259 OID 3388036)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2323 (class 1259 OID 3387935)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 3388107)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2399 (class 1259 OID 3388105)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 3388106)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2423 (class 1259 OID 3388202)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2424 (class 1259 OID 3388203)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2425 (class 1259 OID 3388204)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 3388233)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 3388232)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 3388231)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2305 (class 1259 OID 3387894)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2306 (class 1259 OID 3387893)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2290 (class 1259 OID 3387845)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 3387844)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2386 (class 1259 OID 3388074)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2341 (class 1259 OID 3387969)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2269 (class 1259 OID 3387766)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2270 (class 1259 OID 3387767)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2391 (class 1259 OID 3388094)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2392 (class 1259 OID 3388093)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2393 (class 1259 OID 3388092)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2315 (class 1259 OID 3387917)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2316 (class 1259 OID 3387919)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2317 (class 1259 OID 3387918)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2351 (class 1259 OID 3388003)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2352 (class 1259 OID 3388001)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2353 (class 1259 OID 3388000)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2354 (class 1259 OID 3388002)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2260 (class 1259 OID 3387740)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2261 (class 1259 OID 3387741)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2380 (class 1259 OID 3388059)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2366 (class 1259 OID 3388024)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2406 (class 1259 OID 3388134)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2407 (class 1259 OID 3388135)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2294 (class 1259 OID 3387859)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2295 (class 1259 OID 3387858)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2296 (class 1259 OID 3387860)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2410 (class 1259 OID 3388143)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2411 (class 1259 OID 3388144)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 3388258)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 3388257)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 3388260)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 3388256)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2446 (class 1259 OID 3388259)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2403 (class 1259 OID 3388125)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2357 (class 1259 OID 3388012)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2358 (class 1259 OID 3388011)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2359 (class 1259 OID 3388009)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2360 (class 1259 OID 3388010)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2247 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 3388250)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 3388249)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2322 (class 1259 OID 3387926)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2275 (class 1259 OID 3387787)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2276 (class 1259 OID 3387786)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2282 (class 1259 OID 3387817)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2283 (class 1259 OID 3387818)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2346 (class 1259 OID 3387993)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2347 (class 1259 OID 3387992)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2348 (class 1259 OID 3387991)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2329 (class 1259 OID 3387958)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2330 (class 1259 OID 3387954)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2331 (class 1259 OID 3387951)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2332 (class 1259 OID 3387952)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2333 (class 1259 OID 3387950)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2334 (class 1259 OID 3387955)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2335 (class 1259 OID 3387953)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2289 (class 1259 OID 3387837)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2311 (class 1259 OID 3387908)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 3387910)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2313 (class 1259 OID 3387909)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2314 (class 1259 OID 3387911)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2365 (class 1259 OID 3388018)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2428 (class 1259 OID 3388201)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2281 (class 1259 OID 3387810)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2304 (class 1259 OID 3387880)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2385 (class 1259 OID 3388068)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2250 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2301 (class 1259 OID 3387868)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2422 (class 1259 OID 3388189)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2268 (class 1259 OID 3387760)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2336 (class 1259 OID 3387957)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2471 (class 2606 OID 3388391)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 3388376)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 3388381)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2469 (class 2606 OID 3388401)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2475 (class 2606 OID 3388371)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2470 (class 2606 OID 3388396)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 3388386)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 3388306)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 3388486)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2490 (class 2606 OID 3388481)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2491 (class 2606 OID 3388476)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 3388366)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2498 (class 2606 OID 3388526)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 3388516)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 3388521)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 3388466)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 3388561)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 3388566)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 3388571)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2510 (class 2606 OID 3388586)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 3388581)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 3388576)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2462 (class 2606 OID 3388341)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 3388336)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 3388316)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 3388311)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 3388291)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 3388496)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 3388406)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 3388271)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2449 (class 2606 OID 3388276)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2495 (class 2606 OID 3388511)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 3388506)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 3388501)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 3388346)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 3388356)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 3388351)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2480 (class 2606 OID 3388441)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2482 (class 2606 OID 3388431)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2483 (class 2606 OID 3388426)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2481 (class 2606 OID 3388436)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 3388261)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2447 (class 2606 OID 3388266)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 3388491)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 3388471)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2503 (class 2606 OID 3388536)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2502 (class 2606 OID 3388541)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 3388326)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 3388321)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 3388331)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2505 (class 2606 OID 3388546)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 3388551)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 3388611)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 3388606)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2515 (class 2606 OID 3388621)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 3388601)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2516 (class 2606 OID 3388616)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 3388531)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 3388461)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2485 (class 2606 OID 3388456)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 3388446)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2486 (class 2606 OID 3388451)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2513 (class 2606 OID 3388596)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2514 (class 2606 OID 3388591)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 3388361)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 3388556)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 3388286)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 3388281)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2455 (class 2606 OID 3388296)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 3388301)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2477 (class 2606 OID 3388421)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 3388416)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 3388411)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-14 13:33:06 CEST

--
-- PostgreSQL database dump complete
--

