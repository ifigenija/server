--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-19 15:06:02 CEST

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
-- TOC entry 179 (class 1259 OID 3927423)
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
-- TOC entry 225 (class 1259 OID 3927906)
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
-- TOC entry 224 (class 1259 OID 3927889)
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
-- TOC entry 217 (class 1259 OID 3927800)
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
-- TOC entry 193 (class 1259 OID 3927591)
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
-- TOC entry 196 (class 1259 OID 3927625)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 3927550)
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
-- TOC entry 212 (class 1259 OID 3927750)
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
-- TOC entry 191 (class 1259 OID 3927575)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 3927619)
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
-- TOC entry 201 (class 1259 OID 3927668)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 3927693)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 3927524)
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
-- TOC entry 180 (class 1259 OID 3927432)
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
-- TOC entry 181 (class 1259 OID 3927443)
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
-- TOC entry 184 (class 1259 OID 3927494)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 3927397)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 3927416)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 3927700)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 3927730)
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
-- TOC entry 221 (class 1259 OID 3927845)
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
-- TOC entry 183 (class 1259 OID 3927474)
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
-- TOC entry 186 (class 1259 OID 3927516)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 3927674)
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
-- TOC entry 185 (class 1259 OID 3927501)
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
-- TOC entry 190 (class 1259 OID 3927567)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 3927686)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 3927791)
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
-- TOC entry 220 (class 1259 OID 3927838)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 3927715)
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
-- TOC entry 200 (class 1259 OID 3927659)
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
-- TOC entry 199 (class 1259 OID 3927649)
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
-- TOC entry 219 (class 1259 OID 3927828)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 3927781)
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
-- TOC entry 173 (class 1259 OID 3927368)
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
-- TOC entry 172 (class 1259 OID 3927366)
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
-- TOC entry 209 (class 1259 OID 3927724)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 3927406)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 3927390)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 3927738)
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
-- TOC entry 203 (class 1259 OID 3927680)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 3927630)
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
-- TOC entry 182 (class 1259 OID 3927466)
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
-- TOC entry 198 (class 1259 OID 3927636)
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
-- TOC entry 218 (class 1259 OID 3927816)
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
-- TOC entry 188 (class 1259 OID 3927536)
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
-- TOC entry 174 (class 1259 OID 3927377)
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
-- TOC entry 223 (class 1259 OID 3927870)
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
-- TOC entry 192 (class 1259 OID 3927582)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 3927707)
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
-- TOC entry 214 (class 1259 OID 3927773)
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
-- TOC entry 194 (class 1259 OID 3927614)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 3927860)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 3927763)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 3927371)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 3927423)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 3927906)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 3927889)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 3927800)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 3927591)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 3927625)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 3927550)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-555b-3539-8366-240c538d212d	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-555b-3539-5dc7-4da59aa52570	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-555b-3539-9a16-74a5c12364f5	AL	ALB	008	Albania 	Albanija	\N
00040000-555b-3539-ddad-899c6e76de48	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-555b-3539-e32b-beaa0c7346e1	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-555b-3539-add6-e028722c9955	AD	AND	020	Andorra 	Andora	\N
00040000-555b-3539-d3c0-4d8fccea9bfa	AO	AGO	024	Angola 	Angola	\N
00040000-555b-3539-331a-a74a81ae4620	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-555b-3539-e4ce-df36fc1a2078	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-555b-3539-50bd-f6ff004e2f8f	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-555b-3539-f0af-b848009a995b	AR	ARG	032	Argentina 	Argenitna	\N
00040000-555b-3539-5786-ece1459ba67b	AM	ARM	051	Armenia 	Armenija	\N
00040000-555b-3539-ac83-70f4faa29681	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-555b-3539-7cdd-229915b9663b	AU	AUS	036	Australia 	Avstralija	\N
00040000-555b-3539-8705-f1d868a2c7bb	AT	AUT	040	Austria 	Avstrija	\N
00040000-555b-3539-3dbe-9bc3014a02dc	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-555b-3539-7ad0-e28e8b6cebe6	BS	BHS	044	Bahamas 	Bahami	\N
00040000-555b-3539-ab5e-831b566c52ef	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-555b-3539-9de0-7020d6c63f93	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-555b-3539-393d-6efb68e72434	BB	BRB	052	Barbados 	Barbados	\N
00040000-555b-3539-4bb7-0130c9630d7c	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-555b-3539-132c-35c85cd7f90d	BE	BEL	056	Belgium 	Belgija	\N
00040000-555b-3539-30db-c10d63cdeccb	BZ	BLZ	084	Belize 	Belize	\N
00040000-555b-3539-687d-789d1af98dd1	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-555b-3539-f76e-e137a81a8002	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-555b-3539-2af2-d1da3b0ee2f9	BT	BTN	064	Bhutan 	Butan	\N
00040000-555b-3539-d1f0-9d8a131e8a16	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-555b-3539-d639-ad5f6253cf6b	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-555b-3539-724f-e9a5aebacc8b	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-555b-3539-b3a7-db833591b433	BW	BWA	072	Botswana 	Bocvana	\N
00040000-555b-3539-8791-24ee4cbebd56	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-555b-3539-9cb3-07c75f3d3ff0	BR	BRA	076	Brazil 	Brazilija	\N
00040000-555b-3539-761e-8873ab2acb27	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-555b-3539-2397-b60ad8ebccb0	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-555b-3539-4be2-8b78912fa731	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-555b-3539-5107-b20e5a97b04e	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-555b-3539-b11f-7f714b45fd43	BI	BDI	108	Burundi 	Burundi 	\N
00040000-555b-3539-712f-6b240f3d1b5c	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-555b-3539-9185-1751b25cf09e	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-555b-3539-32c6-2477663a642c	CA	CAN	124	Canada 	Kanada	\N
00040000-555b-3539-4802-b0008525c190	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-555b-3539-7df2-e323d66c2c9e	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-555b-3539-1a54-79b02ec144a5	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-555b-3539-4d55-cca2439cb916	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-555b-3539-089a-da41ad6ef126	CL	CHL	152	Chile 	Čile	\N
00040000-555b-3539-0d01-82f90007fc24	CN	CHN	156	China 	Kitajska	\N
00040000-555b-3539-ed22-5bf70c9b573d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-555b-3539-1ac5-430be226e110	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-555b-3539-e5fe-c598671d07ec	CO	COL	170	Colombia 	Kolumbija	\N
00040000-555b-3539-2c8e-fb2f137767a3	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-555b-3539-f458-6c48e8919be0	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-555b-3539-21e6-31a243e5235f	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-555b-3539-c375-2e692011bcf7	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-555b-3539-65b8-38dfb9a49771	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-555b-3539-c81d-14465f924640	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-555b-3539-0cb6-33999c99f7f9	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-555b-3539-31e1-67cf7a632cc8	CU	CUB	192	Cuba 	Kuba	\N
00040000-555b-3539-7b2b-842f1b158439	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-555b-3539-94cf-ba0fec9b10e6	CY	CYP	196	Cyprus 	Ciper	\N
00040000-555b-3539-7295-1b4b1c2b93d9	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-555b-3539-dd7b-f314e8d107e3	DK	DNK	208	Denmark 	Danska	\N
00040000-555b-3539-c0cd-339eeecbda06	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-555b-3539-4948-ed429f975161	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-555b-3539-b009-15248491871e	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-555b-3539-b99e-7ee02ff78ef7	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-555b-3539-46e2-34d6e93d169e	EG	EGY	818	Egypt 	Egipt	\N
00040000-555b-3539-86d5-3fb71a64fb29	SV	SLV	222	El Salvador 	Salvador	\N
00040000-555b-3539-f780-38a67d1e0d93	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-555b-3539-54c6-974ddc144ba6	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-555b-3539-7de5-87a91904c8f5	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-555b-3539-4f10-b3055323d724	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-555b-3539-0abc-5d46231fd5f2	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-555b-3539-05f7-6b6f7f42d622	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-555b-3539-39b8-3a6defdddd8c	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-555b-3539-abee-24f961a6f20c	FI	FIN	246	Finland 	Finska	\N
00040000-555b-3539-470e-b05df4a191bf	FR	FRA	250	France 	Francija	\N
00040000-555b-3539-95c6-764baaaa7fba	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-555b-3539-b8d7-ab9fa16df4a3	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-555b-3539-0771-5dc8b7905dfa	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-555b-3539-becd-e2d61d48eb79	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-555b-3539-7da6-d02fddeba8e6	GA	GAB	266	Gabon 	Gabon	\N
00040000-555b-3539-bb73-73b9b035ebd6	GM	GMB	270	Gambia 	Gambija	\N
00040000-555b-3539-76c5-b465155a81d7	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-555b-3539-97c3-152c6ce9ccd8	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-555b-3539-4e96-6194c13534cc	GH	GHA	288	Ghana 	Gana	\N
00040000-555b-3539-7681-a39ae85688bd	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-555b-3539-5c5a-cc6ec4ded08e	GR	GRC	300	Greece 	Grčija	\N
00040000-555b-3539-66d0-b8bea36462c6	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-555b-3539-90fd-e2cd0b1e652d	GD	GRD	308	Grenada 	Grenada	\N
00040000-555b-3539-cdaf-bbaa83cf6f2b	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-555b-3539-4d8b-14f3e454051e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-555b-3539-77cc-895bde36a094	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-555b-3539-1720-e36af0505760	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-555b-3539-4e31-449849d6f207	GN	GIN	324	Guinea 	Gvineja	\N
00040000-555b-3539-e201-3bfe0ccf9cf1	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-555b-3539-0b8a-2cd6b38c982b	GY	GUY	328	Guyana 	Gvajana	\N
00040000-555b-3539-bd63-b9c126c36e5f	HT	HTI	332	Haiti 	Haiti	\N
00040000-555b-3539-1c38-542056e72978	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-555b-3539-dee5-3b4b4c6bd46d	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-555b-3539-7314-d8db9f8b65d9	HN	HND	340	Honduras 	Honduras	\N
00040000-555b-3539-198a-11ef77fe3ecf	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-555b-3539-408c-b12d5f403d6e	HU	HUN	348	Hungary 	Madžarska	\N
00040000-555b-3539-6d29-13ee2e8d4383	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-555b-3539-979a-6f4d12ce34a6	IN	IND	356	India 	Indija	\N
00040000-555b-3539-181f-767192106dd1	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-555b-3539-7ee5-e32876d6c133	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-555b-3539-08fb-ec308879d842	IQ	IRQ	368	Iraq 	Irak	\N
00040000-555b-3539-ce06-7c7035daa339	IE	IRL	372	Ireland 	Irska	\N
00040000-555b-3539-540e-b7c65385aaf6	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-555b-3539-4a0c-2cac57ec57c2	IL	ISR	376	Israel 	Izrael	\N
00040000-555b-3539-8267-45ee173b57ee	IT	ITA	380	Italy 	Italija	\N
00040000-555b-3539-1bf4-463bd5594393	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-555b-3539-0bff-de9e90141126	JP	JPN	392	Japan 	Japonska	\N
00040000-555b-3539-2724-ca497f08e4a6	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-555b-3539-5acb-ab7e441b89f0	JO	JOR	400	Jordan 	Jordanija	\N
00040000-555b-3539-6226-100efb904a88	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-555b-3539-d80e-35094af5fd56	KE	KEN	404	Kenya 	Kenija	\N
00040000-555b-3539-5a10-f866f73fc81f	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-555b-3539-70ad-48ebcfb723f7	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-555b-3539-93f8-719c42c9ac3a	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-555b-3539-a5b9-78dd6d4f7f33	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-555b-3539-8502-2e3e91b4b2d8	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-555b-3539-ddfc-fffeb4382e61	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-555b-3539-4825-c532a08b6f2c	LV	LVA	428	Latvia 	Latvija	\N
00040000-555b-3539-ae6e-6e34ad6761c0	LB	LBN	422	Lebanon 	Libanon	\N
00040000-555b-3539-2904-7b16c92ec557	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-555b-3539-54d6-3d4e645f3c6f	LR	LBR	430	Liberia 	Liberija	\N
00040000-555b-3539-ad7c-8acbf8b557b6	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-555b-3539-f506-58af6ca8d5ed	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-555b-3539-37ed-5fadb011b79e	LT	LTU	440	Lithuania 	Litva	\N
00040000-555b-3539-08d0-61094082f957	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-555b-3539-bbdd-590c69fe7ca3	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-555b-3539-4cad-4653cad14a5c	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-555b-3539-38e4-5053434f4af5	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-555b-3539-767c-66b03813840c	MW	MWI	454	Malawi 	Malavi	\N
00040000-555b-3539-7803-8ca9cb4e88d3	MY	MYS	458	Malaysia 	Malezija	\N
00040000-555b-3539-cb9e-19674ddc2444	MV	MDV	462	Maldives 	Maldivi	\N
00040000-555b-3539-ca99-69104eb65162	ML	MLI	466	Mali 	Mali	\N
00040000-555b-3539-94b3-bc464fa9dd87	MT	MLT	470	Malta 	Malta	\N
00040000-555b-3539-726f-c6bccc265907	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-555b-3539-6b55-9ab7268fea5c	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-555b-3539-d615-1d6254e063cf	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-555b-3539-78b3-98c6465a211d	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-555b-3539-175d-cb2b5429fccc	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-555b-3539-e497-44266172e9bc	MX	MEX	484	Mexico 	Mehika	\N
00040000-555b-3539-bbfb-77b90ddd853e	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-555b-3539-992e-84eb5c413fc6	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-555b-3539-05e7-5c814ab7476b	MC	MCO	492	Monaco 	Monako	\N
00040000-555b-3539-4c2f-f5fc49a92c7d	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-555b-3539-6087-c4beb1edc879	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-555b-3539-c855-79ed16b7cb23	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-555b-3539-a1d2-11b4aea50729	MA	MAR	504	Morocco 	Maroko	\N
00040000-555b-3539-417d-7618c4c5aa0d	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-555b-3539-0e64-e5b479de9ed1	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-555b-3539-a5af-d536784b1ffc	NA	NAM	516	Namibia 	Namibija	\N
00040000-555b-3539-b9d7-40dba56881ee	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-555b-3539-07a6-4c98e4139625	NP	NPL	524	Nepal 	Nepal	\N
00040000-555b-3539-b417-b511ee0be7ce	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-555b-3539-662f-161f0991dec7	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-555b-3539-90ca-07ffd60a8d21	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-555b-3539-5850-79a155343393	NE	NER	562	Niger 	Niger 	\N
00040000-555b-3539-ff00-87d2eb30b26c	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-555b-3539-7323-603a9cea8716	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-555b-3539-d50e-aea07f4e1cd4	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-555b-3539-ec39-e241996e254a	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-555b-3539-8c41-ab318d98df34	NO	NOR	578	Norway 	Norveška	\N
00040000-555b-3539-e55c-c8f0838617e2	OM	OMN	512	Oman 	Oman	\N
00040000-555b-3539-e79f-76b8ec7f04e5	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-555b-3539-93b1-e8a7dacdc54c	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-555b-3539-ab7e-67cf1fc0cfbf	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-555b-3539-8144-cfe866dfbbdc	PA	PAN	591	Panama 	Panama	\N
00040000-555b-3539-229c-717a9a9926ca	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-555b-3539-1718-9f082754e433	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-555b-3539-24ef-0a458d7ec17d	PE	PER	604	Peru 	Peru	\N
00040000-555b-3539-9347-c589514e01e7	PH	PHL	608	Philippines 	Filipini	\N
00040000-555b-3539-597e-ec70f7f1f4c6	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-555b-3539-a2fb-5ea1e40c4779	PL	POL	616	Poland 	Poljska	\N
00040000-555b-3539-1b24-38f0e963a22c	PT	PRT	620	Portugal 	Portugalska	\N
00040000-555b-3539-d75f-41e4416fe41b	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-555b-3539-b53b-b6d4ba2efcf5	QA	QAT	634	Qatar 	Katar	\N
00040000-555b-3539-227b-73aae60cb821	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-555b-3539-1d17-4cf5471ad9a3	RO	ROU	642	Romania 	Romunija	\N
00040000-555b-3539-a09d-aa38fd2bd7b0	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-555b-3539-c0af-90d63537e84f	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-555b-3539-b63e-6488524b3959	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-555b-3539-0b80-60e052c5f484	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-555b-3539-ac54-47b97d391f63	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-555b-3539-43c9-8914355c030b	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-555b-3539-3f1b-cacb5cc73d65	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-555b-3539-e047-3bb729e19cf1	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-555b-3539-2566-210712f2a345	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-555b-3539-a362-ebb324666d1d	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-555b-3539-cab9-fa4c7332b13a	SM	SMR	674	San Marino 	San Marino	\N
00040000-555b-3539-8793-781a8cb6f191	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-555b-3539-c09c-f878c71d4b04	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-555b-3539-1eb1-888ce428d82b	SN	SEN	686	Senegal 	Senegal	\N
00040000-555b-3539-3bf1-a05eb5327603	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-555b-3539-dbdb-feb3023db26e	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-555b-3539-4209-30faea8ee10f	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-555b-3539-072b-dfdacbfdf1e0	SG	SGP	702	Singapore 	Singapur	\N
00040000-555b-3539-a4f9-0b971854a7f1	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-555b-3539-657e-5954acca2e37	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-555b-3539-e8ba-d1da2f0d827c	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-555b-3539-b7cd-5353a8220762	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-555b-3539-393d-98b93c0a4362	SO	SOM	706	Somalia 	Somalija	\N
00040000-555b-3539-2408-f9f2d3923c61	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-555b-3539-08ee-b3cc65ac1da5	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-555b-3539-8b92-9f6869375389	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-555b-3539-4ced-165a87d4d8b6	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-555b-3539-f987-d46fde865303	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-555b-3539-25e6-10cc39ed0c1f	SD	SDN	729	Sudan 	Sudan	\N
00040000-555b-3539-c671-5b377ec87aaa	SR	SUR	740	Suriname 	Surinam	\N
00040000-555b-3539-8a5c-e1d6743adda4	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-555b-3539-4a38-c8dbfcc7c748	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-555b-3539-05fb-62f87e552bea	SE	SWE	752	Sweden 	Švedska	\N
00040000-555b-3539-e31d-97aa22d45420	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-555b-3539-13f9-726734049a19	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-555b-3539-d55d-f20f15979326	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-555b-3539-b625-a1e260c1ed71	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-555b-3539-f9eb-208301492508	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-555b-3539-ebac-2278c6f2b458	TH	THA	764	Thailand 	Tajska	\N
00040000-555b-3539-4a2a-e62932f6d997	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-555b-3539-6337-8678feb1e8e0	TG	TGO	768	Togo 	Togo	\N
00040000-555b-3539-e644-16f49bba2483	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-555b-3539-9979-be094ae813d7	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-555b-3539-5296-964d91a26911	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-555b-3539-ac9f-a1b9e2590b69	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-555b-3539-2f4f-10ed51c0e7c7	TR	TUR	792	Turkey 	Turčija	\N
00040000-555b-3539-dbd7-663bbbfa0b9b	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-555b-3539-e583-3a863e8c2aab	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555b-3539-f644-3148c9739548	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-555b-3539-ed70-774e3ff64149	UG	UGA	800	Uganda 	Uganda	\N
00040000-555b-3539-764e-f57730e1bbc4	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-555b-3539-377f-f5f139dd3cc2	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-555b-3539-6a79-081dc3509209	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-555b-3539-7032-2a0658a57fd5	US	USA	840	United States 	Združene države Amerike	\N
00040000-555b-3539-d47d-e8058f805d4b	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-555b-3539-9d3f-d8d96eddc5c1	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-555b-3539-9ccc-b296368a9ec1	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-555b-3539-5916-b2e784e2134a	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-555b-3539-6ec4-5781baabb212	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-555b-3539-fff6-04ebecf056a8	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-555b-3539-9e70-bf35965a1a18	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-555b-3539-2ea4-1d810303d98f	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-555b-3539-3f86-da5e0c9b7456	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-555b-3539-0722-43cbf3fbf6ff	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-555b-3539-b607-171956aea3da	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-555b-3539-7bbd-fac2c42bf9c2	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-555b-3539-d549-3c90eeaa04ac	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 3927750)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 3927575)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 3927619)
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
-- TOC entry 2658 (class 0 OID 3927668)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 3927693)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 3927524)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-555b-353a-ad35-6b0031f4faed	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-555b-353a-0837-edcee1110884	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-555b-353a-a99f-49e1dc98bd7b	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-555b-353a-d7ea-7c88f20424cd	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-555b-353a-a97b-984f23d859c0	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-555b-353a-0cd4-66ea09822798	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-555b-353a-3919-6668ba47e6d7	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-555b-353a-546c-a1a4a297b7ec	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-555b-353a-9294-aa06f4048c13	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-555b-353a-1191-ac8d5665cf91	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 3927432)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-555b-353a-61e8-5b11fa94be53	00000000-555b-353a-a97b-984f23d859c0	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-555b-353a-024b-d05a23e66db2	00000000-555b-353a-a97b-984f23d859c0	00010000-555b-353a-bef0-dc56ed6ee6ba	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-555b-353a-96fe-2a6806f39eb9	00000000-555b-353a-0cd4-66ea09822798	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 3927443)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 3927494)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 3927397)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-555b-353a-9d9c-e095d31c8cd1	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-555b-353a-39dc-eb4f68fdbd7a	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-555b-353a-323a-2e4480a42391	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-555b-353a-1410-96afbd1593f8	Abonma-read	Abonma - branje	f
00030000-555b-353a-11fb-18c8b209e7e5	Abonma-write	Abonma - spreminjanje	f
00030000-555b-353a-6091-ec3051b39839	Alternacija-read	Alternacija - branje	f
00030000-555b-353a-e590-d07c3103b773	Alternacija-write	Alternacija - spreminjanje	f
00030000-555b-353a-ffae-839c94e17d0c	Arhivalija-read	Arhivalija - branje	f
00030000-555b-353a-6b86-54525fcd082e	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-555b-353a-fae8-2cb76aa66a8a	Besedilo-read	Besedilo - branje	f
00030000-555b-353a-c168-9f2b0463a5d3	Besedilo-write	Besedilo - spreminjanje	f
00030000-555b-353a-ad88-e9a99a46cf3a	DogodekIzven-read	DogodekIzven - branje	f
00030000-555b-353a-550a-f5b4a6cb3346	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-555b-353a-42d8-3c587cc2dc2a	Dogodek-read	Dogodek - branje	f
00030000-555b-353a-3f52-c79c8555494b	Dogodek-write	Dogodek - spreminjanje	f
00030000-555b-353a-5bdf-65d1daed3ce5	Drzava-read	Drzava - branje	f
00030000-555b-353a-3d91-7a7eef499a65	Drzava-write	Drzava - spreminjanje	f
00030000-555b-353a-5e4c-2109cf1df29a	Funkcija-read	Funkcija - branje	f
00030000-555b-353a-e480-31c6349164df	Funkcija-write	Funkcija - spreminjanje	f
00030000-555b-353a-b91f-4c30fbaa26f2	Gostovanje-read	Gostovanje - branje	f
00030000-555b-353a-9714-abbe9e3f990c	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-555b-353a-e53c-e0a8b427f339	Gostujoca-read	Gostujoca - branje	f
00030000-555b-353a-eaca-eda1c20c4937	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-555b-353a-583a-49b908aecaf4	Kupec-read	Kupec - branje	f
00030000-555b-353a-830a-f9ca2d363471	Kupec-write	Kupec - spreminjanje	f
00030000-555b-353a-f9a0-0b311569a9a3	NacinPlacina-read	NacinPlacina - branje	f
00030000-555b-353a-944f-4fb392d29c51	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-555b-353a-1351-858ca7eabe4f	Option-read	Option - branje	f
00030000-555b-353a-76d8-741d611a960b	Option-write	Option - spreminjanje	f
00030000-555b-353a-c209-fcae74f67cf6	OptionValue-read	OptionValue - branje	f
00030000-555b-353a-d4dd-7f353205d999	OptionValue-write	OptionValue - spreminjanje	f
00030000-555b-353a-997d-b2ca5bc4b5b4	Oseba-read	Oseba - branje	f
00030000-555b-353a-8803-efff77e5c7ac	Oseba-write	Oseba - spreminjanje	f
00030000-555b-353a-f95d-6ac6a04e18da	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-555b-353a-2d4a-3d8bc8c47bad	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-555b-353a-2d45-932acfb28aca	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-555b-353a-44fe-d5e739a4938f	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-555b-353a-387f-59c0fadfb7c0	Pogodba-read	Pogodba - branje	f
00030000-555b-353a-e43c-42d5a6572f59	Pogodba-write	Pogodba - spreminjanje	f
00030000-555b-353a-db90-f5cb3a547f06	Popa-read	Popa - branje	f
00030000-555b-353a-4097-90017b8cd567	Popa-write	Popa - spreminjanje	f
00030000-555b-353a-1b24-183a44be133c	Posta-read	Posta - branje	f
00030000-555b-353a-f819-c7b4bfa64088	Posta-write	Posta - spreminjanje	f
00030000-555b-353a-8d39-164b719abc8d	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-555b-353a-fb00-4c8995424134	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-555b-353a-98a4-447705be2fd5	PostniNaslov-read	PostniNaslov - branje	f
00030000-555b-353a-bec5-00540ddfa442	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-555b-353a-afb5-b6c0391f130e	Predstava-read	Predstava - branje	f
00030000-555b-353a-4d2a-2855dd69161f	Predstava-write	Predstava - spreminjanje	f
00030000-555b-353a-7ef5-c0a96d587af2	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-555b-353a-a44e-09892f98b64a	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-555b-353a-dbf5-2430b72087aa	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-555b-353a-5d2f-b0592bc6ff05	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-555b-353a-6e3c-8ed3162ae103	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-555b-353a-6825-ab2e55163595	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-555b-353a-4c60-a90a232f827d	Prostor-read	Prostor - branje	f
00030000-555b-353a-bd17-86edc1ed5420	Prostor-write	Prostor - spreminjanje	f
00030000-555b-353a-6a45-d7373b88b04f	Racun-read	Racun - branje	f
00030000-555b-353a-ad33-6e1f66962ea5	Racun-write	Racun - spreminjanje	f
00030000-555b-353a-7e56-079bc0b1cfc3	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-555b-353a-22d6-8e31d85d1c81	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-555b-353a-e77b-dee6c83c9d55	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-555b-353a-473f-e5b2a18ddc51	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-555b-353a-07be-0478172e70a0	Rekvizit-read	Rekvizit - branje	f
00030000-555b-353a-699a-f9eb0d228cce	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-555b-353a-e4a1-4045d847595f	Rezervacija-read	Rezervacija - branje	f
00030000-555b-353a-9bb6-7d3fee6d2382	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-555b-353a-f05f-18a11d252cf8	SedezniRed-read	SedezniRed - branje	f
00030000-555b-353a-f629-39761c92768c	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-555b-353a-8866-0e16cfc45494	Sedez-read	Sedez - branje	f
00030000-555b-353a-4ae9-ec8eb06c2976	Sedez-write	Sedez - spreminjanje	f
00030000-555b-353a-7aa0-4c9cf1813eb0	Sezona-read	Sezona - branje	f
00030000-555b-353a-47c4-17dbff1275e3	Sezona-write	Sezona - spreminjanje	f
00030000-555b-353a-6a2c-6dd213d71862	Telefonska-read	Telefonska - branje	f
00030000-555b-353a-601e-46107075039d	Telefonska-write	Telefonska - spreminjanje	f
00030000-555b-353a-6700-595af8fe47d4	TerminStoritve-read	TerminStoritve - branje	f
00030000-555b-353a-8d42-9f14f2a3e8be	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-555b-353a-24ea-482ba8c11e35	TipFunkcije-read	TipFunkcije - branje	f
00030000-555b-353a-251c-6835a0c98101	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-555b-353a-0a56-35212abae48e	Trr-read	Trr - branje	f
00030000-555b-353a-fec6-05cdc82e394e	Trr-write	Trr - spreminjanje	f
00030000-555b-353a-1e1b-af21af790a88	Uprizoritev-read	Uprizoritev - branje	f
00030000-555b-353a-4fdd-36f9cd92e0aa	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-555b-353a-37a3-12e686fae0d9	Vaja-read	Vaja - branje	f
00030000-555b-353a-edd3-5c84640fa1db	Vaja-write	Vaja - spreminjanje	f
00030000-555b-353a-4e36-2b58dc1d69ea	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-555b-353a-e639-1e522100f36b	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-555b-353a-ec64-afe0fd2acf4d	Zaposlitev-read	Zaposlitev - branje	f
00030000-555b-353a-a63c-e473d2e1e2b0	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-555b-353a-6073-c4d50da2cb25	Zasedenost-read	Zasedenost - branje	f
00030000-555b-353a-f756-15a2894293af	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-555b-353a-18f4-16d30a152fd0	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-555b-353a-1ec6-a889532e73c9	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-555b-353a-cd39-29c62bbe8415	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-555b-353a-627b-5e91b3f795c0	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2635 (class 0 OID 3927416)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-555b-353a-ea9f-63aeaa2c9087	00030000-555b-353a-5bdf-65d1daed3ce5
00020000-555b-353a-1f6f-c7056c09594d	00030000-555b-353a-3d91-7a7eef499a65
00020000-555b-353a-1f6f-c7056c09594d	00030000-555b-353a-5bdf-65d1daed3ce5
\.


--
-- TOC entry 2663 (class 0 OID 3927700)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 3927730)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 3927845)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 3927474)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 3927516)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-555b-3539-b557-cd73cad2a584	8341	Adlešiči
00050000-555b-3539-5324-e9ce130a356f	5270	Ajdovščina
00050000-555b-3539-669a-f3a715b1d99b	6280	Ankaran/Ancarano
00050000-555b-3539-b310-bf4aa834a982	9253	Apače
00050000-555b-3539-d17f-7bf3d8e12eb5	8253	Artiče
00050000-555b-3539-a402-035d120b2cb0	4275	Begunje na Gorenjskem
00050000-555b-3539-0c41-f2640c02cf63	1382	Begunje pri Cerknici
00050000-555b-3539-75dc-fd884fab5fe0	9231	Beltinci
00050000-555b-3539-36a4-aa2ccfe3ee1a	2234	Benedikt
00050000-555b-3539-1a21-faa7bdb23a93	2345	Bistrica ob Dravi
00050000-555b-3539-3e7f-54e9557950a0	3256	Bistrica ob Sotli
00050000-555b-3539-85a0-fff6a32a3e03	8259	Bizeljsko
00050000-555b-3539-7d16-56bc9d9571d2	1223	Blagovica
00050000-555b-3539-d338-c3e6509afb50	8283	Blanca
00050000-555b-3539-150b-3cb0c838a1ce	4260	Bled
00050000-555b-3539-60b3-f1dd89f0fb33	4273	Blejska Dobrava
00050000-555b-3539-54ce-c94a0357ddc8	9265	Bodonci
00050000-555b-3539-3884-d55c21396d96	9222	Bogojina
00050000-555b-3539-737c-0237be9cfc1a	4263	Bohinjska Bela
00050000-555b-3539-c35d-281815ccbe2f	4264	Bohinjska Bistrica
00050000-555b-3539-4046-c2a8153a1eea	4265	Bohinjsko jezero
00050000-555b-3539-f6dd-21810ae0f90f	1353	Borovnica
00050000-555b-3539-a008-30b942b23c0f	8294	Boštanj
00050000-555b-3539-1bec-060a34582dba	5230	Bovec
00050000-555b-3539-2232-3960511748bc	5295	Branik
00050000-555b-3539-d179-b97ca16e28ab	3314	Braslovče
00050000-555b-3539-c41a-ef0c522eecb3	5223	Breginj
00050000-555b-3539-a600-2609e1b2e498	8280	Brestanica
00050000-555b-3539-2926-a59a24e7237d	2354	Bresternica
00050000-555b-3539-0710-afb00f09d47d	4243	Brezje
00050000-555b-3539-6be0-8de240664071	1351	Brezovica pri Ljubljani
00050000-555b-3539-9d27-6ea46e1aab7c	8250	Brežice
00050000-555b-3539-b3ab-ec380e59a9fa	4210	Brnik - Aerodrom
00050000-555b-3539-a7f2-a33200a1d532	8321	Brusnice
00050000-555b-3539-b702-9eda73195738	3255	Buče
00050000-555b-3539-53e8-290a6e0cb164	8276	Bučka 
00050000-555b-3539-f49e-f16ec26e2370	9261	Cankova
00050000-555b-3539-cc52-9254e8e354b1	3000	Celje 
00050000-555b-3539-303d-273c92ca0bf3	3001	Celje - poštni predali
00050000-555b-3539-0696-b5797f55b0e6	4207	Cerklje na Gorenjskem
00050000-555b-3539-5663-c1a250557552	8263	Cerklje ob Krki
00050000-555b-3539-92b0-6ec8570a288d	1380	Cerknica
00050000-555b-3539-d62a-14d4ec4c663a	5282	Cerkno
00050000-555b-3539-603a-206747767371	2236	Cerkvenjak
00050000-555b-3539-64bd-e1bd1c52bde0	2215	Ceršak
00050000-555b-3539-e661-ea925aa7784b	2326	Cirkovce
00050000-555b-3539-3713-ff3f4feed745	2282	Cirkulane
00050000-555b-3539-38fa-4d969038394f	5273	Col
00050000-555b-3539-2725-a9ad14316e4b	8251	Čatež ob Savi
00050000-555b-3539-c865-edab5d61b8da	1413	Čemšenik
00050000-555b-3539-72cc-98d88a1ce986	5253	Čepovan
00050000-555b-3539-80ed-9e70aff38b33	9232	Črenšovci
00050000-555b-3539-b8c4-0c9e7e1fc373	2393	Črna na Koroškem
00050000-555b-3539-2a28-8fb1f6f759de	6275	Črni Kal
00050000-555b-3539-bc53-723962aa8c71	5274	Črni Vrh nad Idrijo
00050000-555b-3539-0ad7-5b5171a968ad	5262	Črniče
00050000-555b-3539-bddf-92c68eb62f73	8340	Črnomelj
00050000-555b-3539-d379-ca700f986d9d	6271	Dekani
00050000-555b-3539-2bdc-8fda14d48ca1	5210	Deskle
00050000-555b-3539-edfb-2ce073c7e581	2253	Destrnik
00050000-555b-3539-09ac-61db20fadbac	6215	Divača
00050000-555b-3539-1cec-573a45831128	1233	Dob
00050000-555b-3539-b704-334fb85373d4	3224	Dobje pri Planini
00050000-555b-3539-6982-8cd5ff4dc229	8257	Dobova
00050000-555b-3539-0347-d3f4cde5e7f0	1423	Dobovec
00050000-555b-3539-f559-0d04ab702c05	5263	Dobravlje
00050000-555b-3539-9a40-10fcc50f5b86	3204	Dobrna
00050000-555b-3539-0771-b520845cb254	8211	Dobrnič
00050000-555b-3539-cda9-5ab03a000b07	1356	Dobrova
00050000-555b-3539-b176-389922af3640	9223	Dobrovnik/Dobronak 
00050000-555b-3539-e6c3-bb30cb8ff5e7	5212	Dobrovo v Brdih
00050000-555b-3539-4aa5-f28b537f16a0	1431	Dol pri Hrastniku
00050000-555b-3539-32ca-e32bd20ef564	1262	Dol pri Ljubljani
00050000-555b-3539-0202-b58da5c63f76	1273	Dole pri Litiji
00050000-555b-3539-f5cc-a3223710f9aa	1331	Dolenja vas
00050000-555b-3539-1bdb-0154ea17d0d6	8350	Dolenjske Toplice
00050000-555b-3539-c1ec-1d0a9fabb2d2	1230	Domžale
00050000-555b-3539-a01c-761eb317da8c	2252	Dornava
00050000-555b-3539-0c8b-35b26ea0af79	5294	Dornberk
00050000-555b-3539-0784-631f8dc14765	1319	Draga
00050000-555b-3539-8719-68662e8e56b6	8343	Dragatuš
00050000-555b-3539-7018-8409464b0bdb	3222	Dramlje
00050000-555b-3539-9352-e7e9204b0c08	2370	Dravograd
00050000-555b-3539-0f81-7eb95202067b	4203	Duplje
00050000-555b-3539-aaa1-edefddfa6ac8	6221	Dutovlje
00050000-555b-3539-d2eb-8a4adb751622	8361	Dvor
00050000-555b-3539-a0b2-e60294bc4229	2343	Fala
00050000-555b-3539-7bac-f88c3f12dd69	9208	Fokovci
00050000-555b-3539-7778-e2f8011c8994	2313	Fram
00050000-555b-3539-1582-218bfe8a8628	3213	Frankolovo
00050000-555b-3539-9325-736f6f65f531	1274	Gabrovka
00050000-555b-3539-0309-e6b05b4a9ac9	8254	Globoko
00050000-555b-3539-6973-8b53cafaed28	5275	Godovič
00050000-555b-3539-2f01-d42b70724e38	4204	Golnik
00050000-555b-3539-b342-d7fcd457f977	3303	Gomilsko
00050000-555b-3539-3530-cc24f90461e8	4224	Gorenja vas
00050000-555b-3539-2f4f-01d2544afe48	3263	Gorica pri Slivnici
00050000-555b-3539-7f4a-755098a7f52c	2272	Gorišnica
00050000-555b-3539-fd61-1db38d65f5b0	9250	Gornja Radgona
00050000-555b-3539-a05c-1690146e4f8c	3342	Gornji Grad
00050000-555b-3539-f986-841d9df4f901	4282	Gozd Martuljek
00050000-555b-3539-a786-e8d6b5900d6f	6272	Gračišče
00050000-555b-3539-0904-0cdb328d0f35	9264	Grad
00050000-555b-3539-806c-0ad7c232cc41	8332	Gradac
00050000-555b-3539-e655-471ce2c80477	1384	Grahovo
00050000-555b-3539-867a-8ba8aa21c2ec	5242	Grahovo ob Bači
00050000-555b-3539-96a7-9d0219a9e952	5251	Grgar
00050000-555b-3539-e817-d0e6477c9d60	3302	Griže
00050000-555b-3539-093f-4f9ccc3e22ab	3231	Grobelno
00050000-555b-3539-2b83-2dd0222ceda2	1290	Grosuplje
00050000-555b-3539-67ac-748f411963bb	2288	Hajdina
00050000-555b-3539-50f2-e4d1703e31f1	8362	Hinje
00050000-555b-3539-e332-834270445853	2311	Hoče
00050000-555b-3539-27a8-21d5f6eb0863	9205	Hodoš/Hodos
00050000-555b-3539-6faa-61e1f4bcdc38	1354	Horjul
00050000-555b-3539-fc60-f50c466891a3	1372	Hotedršica
00050000-555b-3539-b28a-ebab1f4ebeae	1430	Hrastnik
00050000-555b-3539-c966-4a50d1d860aa	6225	Hruševje
00050000-555b-3539-0c4c-9aec2dada827	4276	Hrušica
00050000-555b-3539-b63a-25f685a20fcf	5280	Idrija
00050000-555b-3539-2b1b-b98cb1d93ef0	1292	Ig
00050000-555b-3539-53ee-b02339b0842e	6250	Ilirska Bistrica
00050000-555b-3539-a1c3-11dd2c54e354	6251	Ilirska Bistrica-Trnovo
00050000-555b-3539-5320-4830e2259beb	1295	Ivančna Gorica
00050000-555b-3539-d90b-77255fa60620	2259	Ivanjkovci
00050000-555b-3539-88a9-a7332365e4da	1411	Izlake
00050000-555b-3539-0f6f-791e578223f4	6310	Izola/Isola
00050000-555b-3539-1e4c-4358e6bc0ca8	2222	Jakobski Dol
00050000-555b-3539-3370-ad40c1c3ec4b	2221	Jarenina
00050000-555b-3539-0901-e14c8b0ff864	6254	Jelšane
00050000-555b-3539-bdd3-1388ad5c589e	4270	Jesenice
00050000-555b-3539-9578-61947938e71a	8261	Jesenice na Dolenjskem
00050000-555b-3539-45cb-c6974708edfb	3273	Jurklošter
00050000-555b-3539-be6f-9107e838878a	2223	Jurovski Dol
00050000-555b-3539-d4d5-c38647f350d9	2256	Juršinci
00050000-555b-3539-915a-3e6450ed4205	5214	Kal nad Kanalom
00050000-555b-3539-b56a-773780e1f1b8	3233	Kalobje
00050000-555b-3539-e11c-655106df0025	4246	Kamna Gorica
00050000-555b-3539-bcd4-dcdf3551ed73	2351	Kamnica
00050000-555b-3539-b355-f786a1d0ee08	1241	Kamnik
00050000-555b-3539-694a-6206ac2f0b60	5213	Kanal
00050000-555b-3539-f005-dcb0cbd94bd0	8258	Kapele
00050000-555b-3539-2ee8-fa2793bf2215	2362	Kapla
00050000-555b-3539-672a-84b72901469c	2325	Kidričevo
00050000-555b-3539-96b3-2418e86dd261	1412	Kisovec
00050000-555b-3539-e271-cfcae9c9f8d6	6253	Knežak
00050000-555b-3539-a8e5-b291699f4198	5222	Kobarid
00050000-555b-3539-8022-0f51db6137ac	9227	Kobilje
00050000-555b-3539-09c7-ce3705e0dcf3	1330	Kočevje
00050000-555b-3539-8074-3760d6935802	1338	Kočevska Reka
00050000-555b-3539-ea20-68546ce0ede2	2276	Kog
00050000-555b-3539-6743-ad4a0d6a6ad0	5211	Kojsko
00050000-555b-3539-3343-33bba883dd46	6223	Komen
00050000-555b-3539-599d-c63e09d72528	1218	Komenda
00050000-555b-3539-ada2-d611d3bcbbb1	6000	Koper/Capodistria 
00050000-555b-3539-6ea4-92cfc74feb46	6001	Koper/Capodistria - poštni predali
00050000-555b-3539-facf-221467955be8	8282	Koprivnica
00050000-555b-3539-2679-4776805f133b	5296	Kostanjevica na Krasu
00050000-555b-3539-3e52-8c54c98e9c57	8311	Kostanjevica na Krki
00050000-555b-3539-3837-f5eaf2d629f3	1336	Kostel
00050000-555b-3539-96d1-40c9a04a2869	6256	Košana
00050000-555b-3539-9a44-3f3cfc2de725	2394	Kotlje
00050000-555b-3539-a79a-c150ebc421f6	6240	Kozina
00050000-555b-3539-101f-854e1a754970	3260	Kozje
00050000-555b-3539-8204-ad3098fd4c00	4000	Kranj 
00050000-555b-3539-e120-6f154539c959	4001	Kranj - poštni predali
00050000-555b-3539-2246-96fe9ba2f33b	4280	Kranjska Gora
00050000-555b-3539-ecfc-51ebe3e7102d	1281	Kresnice
00050000-555b-3539-56ed-d9b21e841969	4294	Križe
00050000-555b-3539-6d44-2d8bba496268	9206	Križevci
00050000-555b-3539-9964-79002b0dd885	9242	Križevci pri Ljutomeru
00050000-555b-3539-b96d-0e005a850d3d	1301	Krka
00050000-555b-3539-b4b4-b9d85d547cd2	8296	Krmelj
00050000-555b-3539-512d-acdef9247696	4245	Kropa
00050000-555b-3539-922f-599a82984260	8262	Krška vas
00050000-555b-3539-715f-aaa22977cfce	8270	Krško
00050000-555b-3539-7d6b-4f8117182d87	9263	Kuzma
00050000-555b-3539-1f31-a23a578896ef	2318	Laporje
00050000-555b-3539-21b4-fada0dcdd6d8	3270	Laško
00050000-555b-3539-ea6d-5a3c4bc65e2b	1219	Laze v Tuhinju
00050000-555b-3539-dfa9-6bcce8a3909f	2230	Lenart v Slovenskih goricah
00050000-555b-3539-1e8b-61f6e0d48f14	9220	Lendava/Lendva
00050000-555b-3539-523b-561c2941d57e	4248	Lesce
00050000-555b-3539-569b-b255bdbf0695	3261	Lesično
00050000-555b-3539-db2b-9ca5749b5d0f	8273	Leskovec pri Krškem
00050000-555b-3539-4f9f-fed69f94f603	2372	Libeliče
00050000-555b-3539-ae6e-50b8ecebf53c	2341	Limbuš
00050000-555b-3539-b4f5-4021a035f79b	1270	Litija
00050000-555b-3539-6846-3c4047a2005a	3202	Ljubečna
00050000-555b-3539-d261-95876cc6c267	1000	Ljubljana 
00050000-555b-3539-4a38-795a5a8e8fc5	1001	Ljubljana - poštni predali
00050000-555b-3539-ad2c-baeccf89e199	1231	Ljubljana - Črnuče
00050000-555b-3539-7cf3-190f4a45ae5e	1261	Ljubljana - Dobrunje
00050000-555b-3539-9a00-a51cb8db0b4b	1260	Ljubljana - Polje
00050000-555b-3539-eff0-68ab9918d822	1210	Ljubljana - Šentvid
00050000-555b-3539-2732-dd8e58972ad6	1211	Ljubljana - Šmartno
00050000-555b-3539-fb5c-b60dfe53a86e	3333	Ljubno ob Savinji
00050000-555b-3539-b390-8ad841e0f6f6	9240	Ljutomer
00050000-555b-3539-4331-1305264ee7c9	3215	Loče
00050000-555b-3539-f47f-0bebc3a6624f	5231	Log pod Mangartom
00050000-555b-3539-8124-857f0f4e32da	1358	Log pri Brezovici
00050000-555b-3539-1f1b-cae313489e67	1370	Logatec
00050000-555b-3539-cc73-bc9a34d6d971	1371	Logatec
00050000-555b-3539-3381-70434e590398	1434	Loka pri Zidanem Mostu
00050000-555b-3539-1c0d-510651112bba	3223	Loka pri Žusmu
00050000-555b-3539-cc89-014672a6871d	6219	Lokev
00050000-555b-3539-4340-d3c1e27eda15	1318	Loški Potok
00050000-555b-3539-4a73-0a19bf425c17	2324	Lovrenc na Dravskem polju
00050000-555b-3539-6d76-e1c202cbf5b7	2344	Lovrenc na Pohorju
00050000-555b-3539-5b41-d803a47f77de	3334	Luče
00050000-555b-3539-e696-9bbd3175c402	1225	Lukovica
00050000-555b-3539-a446-92ecb7df4885	9202	Mačkovci
00050000-555b-3539-6c73-864ff4042035	2322	Majšperk
00050000-555b-3539-fd60-e4c9b23b6f76	2321	Makole
00050000-555b-3539-efcb-b25158b8760c	9243	Mala Nedelja
00050000-555b-3539-9214-8fcb3f1410b2	2229	Malečnik
00050000-555b-3539-1128-6c80ff9e937f	6273	Marezige
00050000-555b-3539-7738-30bc3fe09e5f	2000	Maribor 
00050000-555b-3539-3570-6e6c95635f6b	2001	Maribor - poštni predali
00050000-555b-3539-e523-703cfc94c95d	2206	Marjeta na Dravskem polju
00050000-555b-3539-ab9a-136f7ec53fff	2281	Markovci
00050000-555b-3539-2245-9efd5db5ae55	9221	Martjanci
00050000-555b-3539-c57e-4450b34a6020	6242	Materija
00050000-555b-3539-1154-bea4a7d20434	4211	Mavčiče
00050000-555b-3539-788a-195cdd233e6d	1215	Medvode
00050000-555b-3539-ad09-f80cefa9d055	1234	Mengeš
00050000-555b-3539-43d4-f918747af427	8330	Metlika
00050000-555b-3539-a343-d263fafb3954	2392	Mežica
00050000-555b-3539-b454-35ed02842ec7	2204	Miklavž na Dravskem polju
00050000-555b-3539-ac79-5d07dc719b5e	2275	Miklavž pri Ormožu
00050000-555b-3539-0b88-92d535e43578	5291	Miren
00050000-555b-3539-c5fa-0a9e6219d8e1	8233	Mirna
00050000-555b-3539-d486-82030a102a46	8216	Mirna Peč
00050000-555b-3539-9d85-d91b5ec74965	2382	Mislinja
00050000-555b-3539-3ada-9df4833dd0e3	4281	Mojstrana
00050000-555b-3539-9eb9-0ce7a8abf7df	8230	Mokronog
00050000-555b-3539-c182-8f0540b1687f	1251	Moravče
00050000-555b-3539-cbf0-9dc1907863d0	9226	Moravske Toplice
00050000-555b-3539-c325-24c6a9a11202	5216	Most na Soči
00050000-555b-3539-490d-ef6db64ba782	1221	Motnik
00050000-555b-3539-1c08-8fcd05d73908	3330	Mozirje
00050000-555b-3539-21db-7886755452a3	9000	Murska Sobota 
00050000-555b-3539-0ae6-aef172ac1087	9001	Murska Sobota - poštni predali
00050000-555b-3539-8ed9-0fa41f9c3e0d	2366	Muta
00050000-555b-3539-1bb0-37178d0b1641	4202	Naklo
00050000-555b-3539-e901-18b51c72deee	3331	Nazarje
00050000-555b-3539-df62-86cc58c206ee	1357	Notranje Gorice
00050000-555b-3539-ec9f-7da45a57a946	3203	Nova Cerkev
00050000-555b-3539-d913-f29c85bd4e6a	5000	Nova Gorica 
00050000-555b-3539-4c20-7ea350186355	5001	Nova Gorica - poštni predali
00050000-555b-3539-230d-fae1993ee898	1385	Nova vas
00050000-555b-3539-98ac-11b7e684354a	8000	Novo mesto
00050000-555b-3539-bac1-3a71d789f6b1	8001	Novo mesto - poštni predali
00050000-555b-3539-4b59-8ffa6c5a3bc3	6243	Obrov
00050000-555b-3539-2d27-cde30bb67ea5	9233	Odranci
00050000-555b-3539-4f07-8ee5d63ce370	2317	Oplotnica
00050000-555b-3539-b0d6-354538ecd212	2312	Orehova vas
00050000-555b-3539-7317-3ae0450e8cb4	2270	Ormož
00050000-555b-3539-0e74-091302740af1	1316	Ortnek
00050000-555b-3539-ac92-f9d57374a406	1337	Osilnica
00050000-555b-3539-9fa5-3d715ab9ee37	8222	Otočec
00050000-555b-3539-27f3-889093a58e86	2361	Ožbalt
00050000-555b-3539-2ff1-75755d9bac81	2231	Pernica
00050000-555b-3539-b4c9-e6732751e755	2211	Pesnica pri Mariboru
00050000-555b-3539-c1c6-18ebce661387	9203	Petrovci
00050000-555b-3539-d4f5-0660e7f17aac	3301	Petrovče
00050000-555b-3539-8b22-b49053d780d9	6330	Piran/Pirano
00050000-555b-3539-2426-92d27a517929	8255	Pišece
00050000-555b-3539-57c6-eb5702cc1b45	6257	Pivka
00050000-555b-3539-664c-8f87381f4453	6232	Planina
00050000-555b-3539-0da0-15053245f954	3225	Planina pri Sevnici
00050000-555b-3539-a3d1-db23e2553c2b	6276	Pobegi
00050000-555b-3539-7209-f1c506ecb095	8312	Podbočje
00050000-555b-3539-b7dd-0ab7213b9211	5243	Podbrdo
00050000-555b-3539-2a64-2d57a74c9349	3254	Podčetrtek
00050000-555b-3539-7453-4a791d78a7b5	2273	Podgorci
00050000-555b-3539-cc5e-709b5219b747	6216	Podgorje
00050000-555b-3539-821d-c058b8a967f0	2381	Podgorje pri Slovenj Gradcu
00050000-555b-3539-191f-694032d467eb	6244	Podgrad
00050000-555b-3539-80db-3de033b1927c	1414	Podkum
00050000-555b-3539-b7a0-107844101488	2286	Podlehnik
00050000-555b-3539-2bb0-468e80daedb3	5272	Podnanos
00050000-555b-3539-c6fd-8f14de355794	4244	Podnart
00050000-555b-3539-0388-9e4e00a791fc	3241	Podplat
00050000-555b-3539-47c0-13aeb150aa7f	3257	Podsreda
00050000-555b-3539-0745-d424be23c59b	2363	Podvelka
00050000-555b-3539-3312-24ffa2a48a4f	2208	Pohorje
00050000-555b-3539-1088-b756d980d003	2257	Polenšak
00050000-555b-3539-a7ae-6b79a09717b6	1355	Polhov Gradec
00050000-555b-3539-b189-8e43f0d6b07b	4223	Poljane nad Škofjo Loko
00050000-555b-3539-f8b2-7f0750589b0b	2319	Poljčane
00050000-555b-3539-eae7-9a1240785f6f	1272	Polšnik
00050000-555b-3539-9cb8-8d38b075f166	3313	Polzela
00050000-555b-3539-4192-c9453f70933b	3232	Ponikva
00050000-555b-3539-afd5-b2cc344c507f	6320	Portorož/Portorose
00050000-555b-3539-31c8-91a85bdaacc8	6230	Postojna
00050000-555b-3539-9a6b-1b2eaa2e8b1f	2331	Pragersko
00050000-555b-3539-0ead-9be035d5f5cc	3312	Prebold
00050000-555b-3539-a1de-9ac4ac23f695	4205	Preddvor
00050000-555b-3539-5bd6-c9ab097f1e9e	6255	Prem
00050000-555b-3539-1a52-a3b3542ba53a	1352	Preserje
00050000-555b-3539-2c50-8b2d4ecc1b5f	6258	Prestranek
00050000-555b-3539-38bb-18b3814ab64c	2391	Prevalje
00050000-555b-3539-c69d-d031b33f2e2c	3262	Prevorje
00050000-555b-3539-e5cd-8201cd52e87d	1276	Primskovo 
00050000-555b-3539-38f4-9b887490f0a4	3253	Pristava pri Mestinju
00050000-555b-3539-21a1-78f98567ba19	9207	Prosenjakovci/Partosfalva
00050000-555b-3539-3c37-46c9aad613fd	5297	Prvačina
00050000-555b-3539-a232-8633b33bd628	2250	Ptuj
00050000-555b-3539-5aba-025c15cc28bc	2323	Ptujska Gora
00050000-555b-3539-9ac2-1aa5c87da3e5	9201	Puconci
00050000-555b-3539-1323-aa4d74445fbf	2327	Rače
00050000-555b-3539-587b-66d225b98b12	1433	Radeče
00050000-555b-3539-30e7-598f5e43b005	9252	Radenci
00050000-555b-3539-8f2a-c3ff8112cb1e	2360	Radlje ob Dravi
00050000-555b-3539-961f-12e44a57bbe8	1235	Radomlje
00050000-555b-3539-5e29-b2111b80c52d	4240	Radovljica
00050000-555b-3539-e466-b6062cc9e59b	8274	Raka
00050000-555b-3539-06f5-504850ae545f	1381	Rakek
00050000-555b-3539-8387-3d2c3d85784b	4283	Rateče - Planica
00050000-555b-3539-003f-93f3db9ccb85	2390	Ravne na Koroškem
00050000-555b-3539-5a5b-92b2c9ef58fe	9246	Razkrižje
00050000-555b-3539-6c3d-559df5781588	3332	Rečica ob Savinji
00050000-555b-3539-cf30-f76798be6c9c	5292	Renče
00050000-555b-3539-7715-e132214f770b	1310	Ribnica
00050000-555b-3539-fd8a-1ed0c20e8b0c	2364	Ribnica na Pohorju
00050000-555b-3539-ed72-befd8e3e1aa1	3272	Rimske Toplice
00050000-555b-3539-9f65-64fb24b60b2e	1314	Rob
00050000-555b-3539-ecf4-ed96b426380f	5215	Ročinj
00050000-555b-3539-425c-19f23c6d2b6c	3250	Rogaška Slatina
00050000-555b-3539-8331-37ea9572eb55	9262	Rogašovci
00050000-555b-3539-26d8-067fecedae20	3252	Rogatec
00050000-555b-3539-27e7-288488845106	1373	Rovte
00050000-555b-3539-6c7c-1aa018cc4133	2342	Ruše
00050000-555b-3539-ca45-df036d5afa55	1282	Sava
00050000-555b-3539-ad02-b29e5f3f6ad7	6333	Sečovlje/Sicciole
00050000-555b-3539-2f59-1997af890ed9	4227	Selca
00050000-555b-3539-1ebc-58992b6b0f8f	2352	Selnica ob Dravi
00050000-555b-3539-0e61-f999e04c29dd	8333	Semič
00050000-555b-3539-4c99-4a99b9dd1131	8281	Senovo
00050000-555b-3539-0913-0d20576c1c61	6224	Senožeče
00050000-555b-3539-c3ed-3e30ee37340b	8290	Sevnica
00050000-555b-3539-cffb-a7992eda2164	6210	Sežana
00050000-555b-3539-99a6-707880a1a874	2214	Sladki Vrh
00050000-555b-3539-23c9-b83134ca07d9	5283	Slap ob Idrijci
00050000-555b-3539-c7de-ce42af66d766	2380	Slovenj Gradec
00050000-555b-3539-83da-5da502d53ee4	2310	Slovenska Bistrica
00050000-555b-3539-4589-cdbf88245d4f	3210	Slovenske Konjice
00050000-555b-3539-b09a-76bfa086ab8b	1216	Smlednik
00050000-555b-3539-d362-b4b4fdcff10c	5232	Soča
00050000-555b-3539-78a7-edff3ff4d24c	1317	Sodražica
00050000-555b-3539-0a5c-3cdec0e8bc1f	3335	Solčava
00050000-555b-3539-a27f-a5b83036a6ed	5250	Solkan
00050000-555b-3539-d954-549dd67e7039	4229	Sorica
00050000-555b-3539-dafc-fa1e4e37fe36	4225	Sovodenj
00050000-555b-3539-af27-849f5d19f1dc	5281	Spodnja Idrija
00050000-555b-3539-b898-53f063b253c7	2241	Spodnji Duplek
00050000-555b-3539-0688-69dd23f81919	9245	Spodnji Ivanjci
00050000-555b-3539-fd8e-e58439903166	2277	Središče ob Dravi
00050000-555b-3539-96ee-e14402022c06	4267	Srednja vas v Bohinju
00050000-555b-3539-14b1-559fc97680ca	8256	Sromlje 
00050000-555b-3539-2895-ab9268cd990f	5224	Srpenica
00050000-555b-3539-c63a-2b9b7ecb3a4a	1242	Stahovica
00050000-555b-3539-3930-3f23b61553d6	1332	Stara Cerkev
00050000-555b-3539-7111-7cb292a2a2d3	8342	Stari trg ob Kolpi
00050000-555b-3539-2f0c-2268eb144555	1386	Stari trg pri Ložu
00050000-555b-3539-b61b-88443d7e10cf	2205	Starše
00050000-555b-3539-fb29-716733801e63	2289	Stoperce
00050000-555b-3539-4c9e-f5469a4b5dc8	8322	Stopiče
00050000-555b-3539-53dd-d36ffcf752c8	3206	Stranice
00050000-555b-3539-b8e3-0d4e96e5a1c8	8351	Straža
00050000-555b-3539-e6be-4da06af30ec2	1313	Struge
00050000-555b-3539-b244-5e707bb0d340	8293	Studenec
00050000-555b-3539-d90c-3d91a0a42b8d	8331	Suhor
00050000-555b-3539-645d-09c9f34947ed	2233	Sv. Ana v Slovenskih goricah
00050000-555b-3539-cbe6-a79a2f91909d	2235	Sv. Trojica v Slovenskih goricah
00050000-555b-3539-2462-8a31847d84f7	2353	Sveti Duh na Ostrem Vrhu
00050000-555b-3539-4303-ab3cd60895b6	9244	Sveti Jurij ob Ščavnici
00050000-555b-3539-dc66-b3a7288ac331	3264	Sveti Štefan
00050000-555b-3539-50d6-f26fafe7e47c	2258	Sveti Tomaž
00050000-555b-3539-6fb6-5ba554d859b8	9204	Šalovci
00050000-555b-3539-ede5-6c194a0d0472	5261	Šempas
00050000-555b-3539-9166-642afe9718f2	5290	Šempeter pri Gorici
00050000-555b-3539-9cfc-70da8a575572	3311	Šempeter v Savinjski dolini
00050000-555b-3539-5d55-40f1bd806fb8	4208	Šenčur
00050000-555b-3539-4164-d9956a8428a7	2212	Šentilj v Slovenskih goricah
00050000-555b-3539-ed4c-9fda096890e2	8297	Šentjanž
00050000-555b-3539-ba30-347c38824cb0	2373	Šentjanž pri Dravogradu
00050000-555b-3539-10a0-72feaa94f15d	8310	Šentjernej
00050000-555b-3539-0fc3-e6946f5b2ffc	3230	Šentjur
00050000-555b-3539-8008-79ae6a0acbf5	3271	Šentrupert
00050000-555b-3539-757c-b4d789f214e8	8232	Šentrupert
00050000-555b-3539-8ab4-7466ec5ea279	1296	Šentvid pri Stični
00050000-555b-3539-c111-bee0058858f1	8275	Škocjan
00050000-555b-3539-8326-9bf598be98ed	6281	Škofije
00050000-555b-3539-fb6f-84e5c819229b	4220	Škofja Loka
00050000-555b-3539-76c9-1601a0c196f4	3211	Škofja vas
00050000-555b-3539-4b34-ac0ec2f73033	1291	Škofljica
00050000-555b-3539-7804-f6a31c662376	6274	Šmarje
00050000-555b-3539-b890-3d60956f7724	1293	Šmarje - Sap
00050000-555b-3539-41ee-2c86f008f6c3	3240	Šmarje pri Jelšah
00050000-555b-3539-7042-8404189059e0	8220	Šmarješke Toplice
00050000-555b-3539-cb73-35a2ad78448c	2315	Šmartno na Pohorju
00050000-555b-3539-0b8c-71f93c669610	3341	Šmartno ob Dreti
00050000-555b-3539-64b9-06cfd1ee01cf	3327	Šmartno ob Paki
00050000-555b-3539-ed7f-d2f6790831a7	1275	Šmartno pri Litiji
00050000-555b-3539-957b-aae7764ea510	2383	Šmartno pri Slovenj Gradcu
00050000-555b-3539-fcc0-97c1a9a40f58	3201	Šmartno v Rožni dolini
00050000-555b-3539-11cc-ab39a0f8e772	3325	Šoštanj
00050000-555b-3539-b3ac-df34e76ffd89	6222	Štanjel
00050000-555b-3539-431e-967e6405e84b	3220	Štore
00050000-555b-3539-2bac-1e7a804a9f86	3304	Tabor
00050000-555b-3539-41bf-940757b2270f	3221	Teharje
00050000-555b-3539-f730-47c14fde6a65	9251	Tišina
00050000-555b-3539-a9e8-4884a74409a6	5220	Tolmin
00050000-555b-3539-e0b9-f7a09c69fbff	3326	Topolšica
00050000-555b-3539-bcec-0b314aae38a5	2371	Trbonje
00050000-555b-3539-edd2-b2ddc382d62b	1420	Trbovlje
00050000-555b-3539-da55-4d8e46983732	8231	Trebelno 
00050000-555b-3539-8135-68d1f9f0b5ed	8210	Trebnje
00050000-555b-3539-232d-67532a090840	5252	Trnovo pri Gorici
00050000-555b-3539-6191-ed39850f0440	2254	Trnovska vas
00050000-555b-3539-fb20-5fa2b5454387	1222	Trojane
00050000-555b-3539-239f-6e035b756c66	1236	Trzin
00050000-555b-3539-745c-d129bce1acf4	4290	Tržič
00050000-555b-3539-0293-e102625950c9	8295	Tržišče
00050000-555b-3539-9c1b-9dfef61ab560	1311	Turjak
00050000-555b-3539-923a-7a92a16b6629	9224	Turnišče
00050000-555b-3539-519d-7a293d8bcd9d	8323	Uršna sela
00050000-555b-3539-29f7-47cf3a41913f	1252	Vače
00050000-555b-3539-8810-d5f6a4917a21	3320	Velenje 
00050000-555b-3539-4333-0b0a8207bf81	3322	Velenje - poštni predali
00050000-555b-3539-da23-ca78ff9f8b9f	8212	Velika Loka
00050000-555b-3539-d600-97d43db78a2b	2274	Velika Nedelja
00050000-555b-3539-a3ff-c1a849d7425b	9225	Velika Polana
00050000-555b-3539-7bfa-636d59755546	1315	Velike Lašče
00050000-555b-3539-d49e-7d9ff48897bc	8213	Veliki Gaber
00050000-555b-3539-e39b-177c977ca6ae	9241	Veržej
00050000-555b-3539-1971-b17d0395b183	1312	Videm - Dobrepolje
00050000-555b-3539-bfa4-ff84c6d51b69	2284	Videm pri Ptuju
00050000-555b-3539-0938-01a25b496f36	8344	Vinica
00050000-555b-3539-f947-8688431d070f	5271	Vipava
00050000-555b-3539-2b4f-f3b9dbc42862	4212	Visoko
00050000-555b-3539-d99b-112a8b8f2ef2	1294	Višnja Gora
00050000-555b-3539-b31e-d0106af26235	3205	Vitanje
00050000-555b-3539-dd1d-0e4461ed4aae	2255	Vitomarci
00050000-555b-3539-e757-d3eb17c899d0	1217	Vodice
00050000-555b-3539-0232-95f369901707	3212	Vojnik\t
00050000-555b-3539-2126-73953b52781e	5293	Volčja Draga
00050000-555b-3539-c4a9-493b5aae708a	2232	Voličina
00050000-555b-3539-3f56-8a05dcc798c7	3305	Vransko
00050000-555b-3539-b3e9-0bb77e7a1490	6217	Vremski Britof
00050000-555b-3539-011d-fe1d635d1581	1360	Vrhnika
00050000-555b-3539-8bfc-feafb47f8fbd	2365	Vuhred
00050000-555b-3539-b89f-d66b4f6a5c5e	2367	Vuzenica
00050000-555b-3539-03be-a0038bbe0a14	8292	Zabukovje 
00050000-555b-3539-dead-fa583308b9e3	1410	Zagorje ob Savi
00050000-555b-3539-40d5-6baf30772b80	1303	Zagradec
00050000-555b-3539-45fb-411288656778	2283	Zavrč
00050000-555b-3539-99e7-9fec8bcabe64	8272	Zdole 
00050000-555b-3539-a4b1-307022ac0270	4201	Zgornja Besnica
00050000-555b-3539-f8cb-1fc19b96c003	2242	Zgornja Korena
00050000-555b-3539-ebed-cc7b67b471e6	2201	Zgornja Kungota
00050000-555b-3539-5ecf-b49790013750	2316	Zgornja Ložnica
00050000-555b-3539-c69f-bd7c434c9086	2314	Zgornja Polskava
00050000-555b-3539-2168-9dafce7c28a5	2213	Zgornja Velka
00050000-555b-3539-5a89-e114105b0592	4247	Zgornje Gorje
00050000-555b-3539-0659-de13cf46bb0b	4206	Zgornje Jezersko
00050000-555b-3539-30f8-cfbafa39396b	2285	Zgornji Leskovec
00050000-555b-3539-4e55-caed5b0ab6da	1432	Zidani Most
00050000-555b-3539-323a-f97b96b4ea8b	3214	Zreče
00050000-555b-3539-1dfd-e2575c051f95	4209	Žabnica
00050000-555b-3539-4bcb-e770866706d4	3310	Žalec
00050000-555b-3539-19e5-c8d74043ec2b	4228	Železniki
00050000-555b-3539-5aec-b6b4f00559f0	2287	Žetale
00050000-555b-3539-651d-d4fb32b267fa	4226	Žiri
00050000-555b-3539-59ed-df86019320e9	4274	Žirovnica
00050000-555b-3539-4bc8-5291134ef7e2	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 3927674)
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
-- TOC entry 2642 (class 0 OID 3927501)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 3927567)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 3927686)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 3927791)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 3927838)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 3927715)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 3927659)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 3927649)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 3927828)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 3927781)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 3927368)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-555b-353a-bef0-dc56ed6ee6ba	00010000-555b-353a-ac6a-2c8e8fce912c	2015-05-19 15:06:02	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROsN.s.ImN1WW39c6ptnC/ltmySBJBgqW";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 3927724)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 3927406)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-555b-353a-3aa2-fbd243fd9a64	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-555b-353a-3265-276763e3b531	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-555b-353a-ea9f-63aeaa2c9087	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-555b-353a-160f-e8b601fac459	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-555b-353a-2b21-76db538bea12	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-555b-353a-1f6f-c7056c09594d	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 3927390)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-555b-353a-bef0-dc56ed6ee6ba	00020000-555b-353a-160f-e8b601fac459
00010000-555b-353a-ac6a-2c8e8fce912c	00020000-555b-353a-160f-e8b601fac459
\.


--
-- TOC entry 2668 (class 0 OID 3927738)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 3927680)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 3927630)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 3927466)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 3927636)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 3927816)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 3927536)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 3927377)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-555b-353a-ac6a-2c8e8fce912c	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROeC7e78fGK3s4aeYBLl.b4kYytmUdA72	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-555b-353a-bef0-dc56ed6ee6ba	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 3927870)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 3927582)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 3927707)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 3927773)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 3927614)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 3927860)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 3927763)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2274 (class 2606 OID 3927431)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 3927910)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 3927903)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 3927815)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 3927604)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2343 (class 2606 OID 3927629)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 3927562)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 3927759)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 3927580)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 3927623)
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
-- TOC entry 2364 (class 2606 OID 3927672)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 3927699)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2303 (class 2606 OID 3927534)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2278 (class 2606 OID 3927440)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2293 (class 2606 OID 3927498)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2280 (class 2606 OID 3927464)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2272 (class 2606 OID 3927420)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2265 (class 2606 OID 3927405)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 3927705)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 3927737)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 3927855)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2288 (class 2606 OID 3927491)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 3927522)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 3927678)
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
-- TOC entry 2298 (class 2606 OID 3927512)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 3927571)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 3927690)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 3927797)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 3927843)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 3927722)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 3927663)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 3927654)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 3927837)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 3927788)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2257 (class 2606 OID 3927376)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 3927728)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 3927394)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2267 (class 2606 OID 3927414)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2395 (class 2606 OID 3927746)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 3927685)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 3927635)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2285 (class 2606 OID 3927471)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 3927645)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 3927827)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2308 (class 2606 OID 3927547)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 3927389)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 3927885)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 3927589)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 3927713)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 3927779)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 3927618)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 3927869)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 3927772)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 1259 OID 3927611)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2286 (class 1259 OID 3927493)
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
-- TOC entry 2377 (class 1259 OID 3927706)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2371 (class 1259 OID 3927692)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2372 (class 1259 OID 3927691)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2323 (class 1259 OID 3927590)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 3927762)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2399 (class 1259 OID 3927760)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 3927761)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2423 (class 1259 OID 3927857)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2424 (class 1259 OID 3927858)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2425 (class 1259 OID 3927859)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 3927888)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 3927887)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 3927886)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2305 (class 1259 OID 3927549)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2306 (class 1259 OID 3927548)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2290 (class 1259 OID 3927500)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 3927499)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2386 (class 1259 OID 3927729)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2341 (class 1259 OID 3927624)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2269 (class 1259 OID 3927421)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2270 (class 1259 OID 3927422)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2391 (class 1259 OID 3927749)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2392 (class 1259 OID 3927748)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2393 (class 1259 OID 3927747)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2315 (class 1259 OID 3927572)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2316 (class 1259 OID 3927574)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2317 (class 1259 OID 3927573)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2351 (class 1259 OID 3927658)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2352 (class 1259 OID 3927656)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2353 (class 1259 OID 3927655)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2354 (class 1259 OID 3927657)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2260 (class 1259 OID 3927395)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2261 (class 1259 OID 3927396)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2380 (class 1259 OID 3927714)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2366 (class 1259 OID 3927679)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2406 (class 1259 OID 3927789)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2407 (class 1259 OID 3927790)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2294 (class 1259 OID 3927514)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2295 (class 1259 OID 3927513)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2296 (class 1259 OID 3927515)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2410 (class 1259 OID 3927798)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2411 (class 1259 OID 3927799)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 3927913)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 3927912)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 3927915)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 3927911)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2446 (class 1259 OID 3927914)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2403 (class 1259 OID 3927780)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2357 (class 1259 OID 3927667)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2358 (class 1259 OID 3927666)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2359 (class 1259 OID 3927664)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2360 (class 1259 OID 3927665)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2247 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 3927905)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 3927904)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2322 (class 1259 OID 3927581)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2275 (class 1259 OID 3927442)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2276 (class 1259 OID 3927441)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2282 (class 1259 OID 3927472)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2283 (class 1259 OID 3927473)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2346 (class 1259 OID 3927648)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2347 (class 1259 OID 3927647)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2348 (class 1259 OID 3927646)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2329 (class 1259 OID 3927613)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2330 (class 1259 OID 3927609)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2331 (class 1259 OID 3927606)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2332 (class 1259 OID 3927607)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2333 (class 1259 OID 3927605)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2334 (class 1259 OID 3927610)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2335 (class 1259 OID 3927608)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2289 (class 1259 OID 3927492)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2311 (class 1259 OID 3927563)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 3927565)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2313 (class 1259 OID 3927564)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2314 (class 1259 OID 3927566)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2365 (class 1259 OID 3927673)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2428 (class 1259 OID 3927856)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2281 (class 1259 OID 3927465)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2304 (class 1259 OID 3927535)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2385 (class 1259 OID 3927723)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2250 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2301 (class 1259 OID 3927523)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2422 (class 1259 OID 3927844)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2268 (class 1259 OID 3927415)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2336 (class 1259 OID 3927612)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2471 (class 2606 OID 3928046)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 3928031)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 3928036)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2469 (class 2606 OID 3928056)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2475 (class 2606 OID 3928026)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2470 (class 2606 OID 3928051)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 3928041)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 3927961)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 3928141)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2490 (class 2606 OID 3928136)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2491 (class 2606 OID 3928131)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 3928021)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2498 (class 2606 OID 3928181)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 3928171)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 3928176)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 3928121)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 3928216)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 3928221)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 3928226)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2510 (class 2606 OID 3928241)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 3928236)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 3928231)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2462 (class 2606 OID 3927996)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 3927991)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 3927971)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 3927966)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 3927946)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 3928151)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 3928061)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 3927926)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2449 (class 2606 OID 3927931)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2495 (class 2606 OID 3928166)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 3928161)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 3928156)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 3928001)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 3928011)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 3928006)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2480 (class 2606 OID 3928096)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2482 (class 2606 OID 3928086)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2483 (class 2606 OID 3928081)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2481 (class 2606 OID 3928091)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 3927916)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2447 (class 2606 OID 3927921)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 3928146)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 3928126)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2503 (class 2606 OID 3928191)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2502 (class 2606 OID 3928196)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 3927981)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 3927976)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 3927986)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2505 (class 2606 OID 3928201)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 3928206)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 3928266)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 3928261)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2515 (class 2606 OID 3928276)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 3928256)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2516 (class 2606 OID 3928271)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 3928186)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 3928116)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2485 (class 2606 OID 3928111)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 3928101)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2486 (class 2606 OID 3928106)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2513 (class 2606 OID 3928251)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2514 (class 2606 OID 3928246)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 3928016)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 3928211)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 3927941)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 3927936)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2455 (class 2606 OID 3927951)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 3927956)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2477 (class 2606 OID 3928076)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 3928071)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 3928066)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-19 15:06:02 CEST

--
-- PostgreSQL database dump complete
--

