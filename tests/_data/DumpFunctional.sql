--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-04-24 16:12:06 CEST

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
-- TOC entry 179 (class 1259 OID 1352926)
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
-- TOC entry 225 (class 1259 OID 1353409)
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
-- TOC entry 224 (class 1259 OID 1353392)
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
-- TOC entry 217 (class 1259 OID 1353308)
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
-- TOC entry 193 (class 1259 OID 1353092)
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
-- TOC entry 196 (class 1259 OID 1353133)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 1353054)
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
-- TOC entry 212 (class 1259 OID 1353258)
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
-- TOC entry 191 (class 1259 OID 1353079)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 1353127)
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
-- TOC entry 201 (class 1259 OID 1353176)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 1353201)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 1353028)
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
-- TOC entry 180 (class 1259 OID 1352935)
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
-- TOC entry 181 (class 1259 OID 1352946)
-- Name: oseba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba (
    id uuid NOT NULL,
    user_id uuid,
    naziv character varying(40) DEFAULT NULL::character varying,
    ime character varying(255) DEFAULT NULL::character varying,
    priimek character varying(255) DEFAULT NULL::character varying,
    pesvdonim character varying(255) DEFAULT NULL::character varying,
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
-- TOC entry 184 (class 1259 OID 1352998)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 1352900)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 1352919)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 1353208)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 1353238)
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
-- TOC entry 221 (class 1259 OID 1353350)
-- Name: pogodba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pogodba (
    id uuid NOT NULL,
    oseba_id uuid NOT NULL,
    popa_id uuid,
    trr_id uuid,
    vrednostvaje numeric(12,2) DEFAULT NULL::numeric,
    vrednostpredstave numeric(12,2) DEFAULT NULL::numeric,
    vrednosture numeric(12,2) DEFAULT NULL::numeric,
    aktivna boolean,
    opis text
);


--
-- TOC entry 183 (class 1259 OID 1352978)
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
-- TOC entry 186 (class 1259 OID 1353020)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 1353182)
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
-- TOC entry 185 (class 1259 OID 1353005)
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
-- TOC entry 190 (class 1259 OID 1353071)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 1353194)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 1353299)
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
-- TOC entry 220 (class 1259 OID 1353343)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 1353223)
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
-- TOC entry 200 (class 1259 OID 1353167)
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
-- TOC entry 199 (class 1259 OID 1353157)
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
-- TOC entry 219 (class 1259 OID 1353333)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 1353289)
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
-- TOC entry 173 (class 1259 OID 1352871)
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
-- TOC entry 172 (class 1259 OID 1352869)
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
-- TOC entry 209 (class 1259 OID 1353232)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 1352909)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 1352893)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 1353246)
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
-- TOC entry 203 (class 1259 OID 1353188)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 1353138)
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
-- TOC entry 182 (class 1259 OID 1352970)
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
-- TOC entry 198 (class 1259 OID 1353144)
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
-- TOC entry 218 (class 1259 OID 1353324)
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
-- TOC entry 188 (class 1259 OID 1353040)
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
-- TOC entry 174 (class 1259 OID 1352880)
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
-- TOC entry 223 (class 1259 OID 1353374)
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
-- TOC entry 192 (class 1259 OID 1353086)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 1353215)
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
-- TOC entry 214 (class 1259 OID 1353281)
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
-- TOC entry 194 (class 1259 OID 1353114)
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
-- TOC entry 222 (class 1259 OID 1353364)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 1353271)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 1352874)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 1352926)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 1353409)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 1353392)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 1353308)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 1353092)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 1353133)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 1353054)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-553a-4f34-8bb5-cee76f2add30	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-553a-4f34-7140-c20dc47f2d37	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-553a-4f34-21e3-b62df14e9c23	AL	ALB	008	Albania 	Albanija	\N
00040000-553a-4f34-2d2e-87f66f1a45da	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-553a-4f34-09a3-0fba51fcda13	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-553a-4f34-73f2-a6ebd0aae582	AD	AND	020	Andorra 	Andora	\N
00040000-553a-4f34-db80-9de728ed73ff	AO	AGO	024	Angola 	Angola	\N
00040000-553a-4f34-77fc-c7a4178be705	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-553a-4f34-f58b-c3723adcb239	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-553a-4f34-a4dc-eb84cae74353	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-553a-4f34-a359-201253469f3a	AR	ARG	032	Argentina 	Argenitna	\N
00040000-553a-4f34-fd80-c635bdda53bb	AM	ARM	051	Armenia 	Armenija	\N
00040000-553a-4f34-6a27-d915ef9e3a76	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-553a-4f34-19c2-8a7888d11937	AU	AUS	036	Australia 	Avstralija	\N
00040000-553a-4f34-5f88-67e33f5c9e69	AT	AUT	040	Austria 	Avstrija	\N
00040000-553a-4f34-5c49-dcc77dd78e7d	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-553a-4f34-2277-071ba9a34cd9	BS	BHS	044	Bahamas 	Bahami	\N
00040000-553a-4f34-edf5-0d5576e64554	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-553a-4f34-d7f0-d21241d4074d	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-553a-4f34-f411-53ca0261fed3	BB	BRB	052	Barbados 	Barbados	\N
00040000-553a-4f34-a01e-01960913e4c1	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-553a-4f34-bef8-222badd8bb8b	BE	BEL	056	Belgium 	Belgija	\N
00040000-553a-4f34-1483-919b90820a43	BZ	BLZ	084	Belize 	Belize	\N
00040000-553a-4f34-7854-a84ee2ad2bdc	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-553a-4f34-4ed5-214abc4e1bb5	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-553a-4f34-9890-ded6a1f0c5cd	BT	BTN	064	Bhutan 	Butan	\N
00040000-553a-4f34-2c9b-b055721b24b6	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-553a-4f34-66b4-cdd6b5732f1d	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-553a-4f34-3ef4-4ca156aa5a87	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-553a-4f34-117d-d82bdaf751d5	BW	BWA	072	Botswana 	Bocvana	\N
00040000-553a-4f34-df04-e2eb82414e62	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-553a-4f34-32c8-fe7422c11f93	BR	BRA	076	Brazil 	Brazilija	\N
00040000-553a-4f34-4494-bd7af224c64e	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-553a-4f34-4119-13375b6d3d48	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-553a-4f34-67ae-d5ff0b3dad6d	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-553a-4f34-d6b6-7346e434b413	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-553a-4f34-34af-62ca124795d2	BI	BDI	108	Burundi 	Burundi 	\N
00040000-553a-4f34-ddb8-1cbd8863877a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-553a-4f34-240c-d8a5fbb64662	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-553a-4f34-d4ca-b73e15fe03eb	CA	CAN	124	Canada 	Kanada	\N
00040000-553a-4f34-f40a-86106a60e008	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-553a-4f34-1d31-e47b4201b98c	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-553a-4f34-55b5-4e03fb5d5602	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-553a-4f34-18c8-c5db6fd86ec9	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-553a-4f34-f821-1d44e79bb0d9	CL	CHL	152	Chile 	Čile	\N
00040000-553a-4f34-85f5-b6b70e2c7f5f	CN	CHN	156	China 	Kitajska	\N
00040000-553a-4f34-f5fa-45e8663aaa85	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-553a-4f34-4943-13e12c249979	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-553a-4f34-5bb4-f762b706e3c8	CO	COL	170	Colombia 	Kolumbija	\N
00040000-553a-4f34-bf1d-129d5c82fe74	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-553a-4f34-2a98-035a27ccb938	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-553a-4f34-5b6e-c23d62d91e3a	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-553a-4f34-144b-1f6dde8702fc	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-553a-4f34-f22e-cfe4bd3469d1	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-553a-4f34-9d87-b120842ae03d	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-553a-4f34-77ed-9ff64429b567	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-553a-4f34-d7ab-9deb5e56adeb	CU	CUB	192	Cuba 	Kuba	\N
00040000-553a-4f34-688e-0d61ed9fe5c5	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-553a-4f34-8bc6-7ee3bbb8457c	CY	CYP	196	Cyprus 	Ciper	\N
00040000-553a-4f34-9f6f-5f3fcafb7ba8	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-553a-4f34-6df2-a11b273da538	DK	DNK	208	Denmark 	Danska	\N
00040000-553a-4f34-61cb-42974e32baad	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-553a-4f34-49ad-8fc7d75a4fb7	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-553a-4f34-4141-899df3180d96	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-553a-4f34-3083-0b322bf4cfc7	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-553a-4f34-6bc8-3ba91098c007	EG	EGY	818	Egypt 	Egipt	\N
00040000-553a-4f34-af85-87c4c1b5083a	SV	SLV	222	El Salvador 	Salvador	\N
00040000-553a-4f34-27ac-631fde240a21	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-553a-4f34-d110-4048682af847	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-553a-4f34-f5c2-3715bc153d0d	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-553a-4f34-681a-4930d8c02c44	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-553a-4f34-8856-a51a6359ad18	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-553a-4f34-7492-e86247ba7cb2	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-553a-4f34-d18b-37120ed6c54f	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-553a-4f34-048a-9d33a5b828f0	FI	FIN	246	Finland 	Finska	\N
00040000-553a-4f34-a180-b2ead88230ec	FR	FRA	250	France 	Francija	\N
00040000-553a-4f34-0cc0-f3009eded63b	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-553a-4f34-15a6-7e2844b5aa6d	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-553a-4f34-96f8-3a038e1b7316	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-553a-4f34-f347-558f13643d36	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-553a-4f34-32e9-e3b00c0ae75e	GA	GAB	266	Gabon 	Gabon	\N
00040000-553a-4f34-2f1f-046006536a9a	GM	GMB	270	Gambia 	Gambija	\N
00040000-553a-4f34-f72c-741fc000e444	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-553a-4f34-2ed8-0bb14fd4bd51	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-553a-4f34-3f1a-3544efb64456	GH	GHA	288	Ghana 	Gana	\N
00040000-553a-4f34-8eb9-e1b5ec81e857	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-553a-4f34-a575-77d9e65f9e8a	GR	GRC	300	Greece 	Grčija	\N
00040000-553a-4f34-4240-1f1e47bdf61f	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-553a-4f34-4abf-05ec69eb333c	GD	GRD	308	Grenada 	Grenada	\N
00040000-553a-4f34-77a7-6d8b9439b49a	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-553a-4f34-4fbd-42cea427cbed	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-553a-4f34-5554-301ce9363c9b	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-553a-4f34-5ae4-89aeda178bd3	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-553a-4f34-890c-2d562b162b82	GN	GIN	324	Guinea 	Gvineja	\N
00040000-553a-4f34-7ad4-a5643e9c9839	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-553a-4f34-327b-f42c935703f5	GY	GUY	328	Guyana 	Gvajana	\N
00040000-553a-4f34-e64a-0a31deffa870	HT	HTI	332	Haiti 	Haiti	\N
00040000-553a-4f34-d755-9bda0e7107d3	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-553a-4f34-92a0-6015d514beec	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-553a-4f34-27c5-f75b8edc7529	HN	HND	340	Honduras 	Honduras	\N
00040000-553a-4f34-574c-56b4d6dfb5ad	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-553a-4f34-e6cd-c00e09deeac9	HU	HUN	348	Hungary 	Madžarska	\N
00040000-553a-4f34-1877-24553bab4252	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-553a-4f34-e8e0-8e414e40bf71	IN	IND	356	India 	Indija	\N
00040000-553a-4f34-59a1-90ffa4e4b7ba	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-553a-4f34-30cd-bebca7ffe454	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-553a-4f34-c01c-c95e312a00cf	IQ	IRQ	368	Iraq 	Irak	\N
00040000-553a-4f34-9bb9-7a3f2a005980	IE	IRL	372	Ireland 	Irska	\N
00040000-553a-4f34-0086-7743b9f85a5c	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-553a-4f34-f9da-ddbb1a99fd80	IL	ISR	376	Israel 	Izrael	\N
00040000-553a-4f34-7309-49fe8684b13b	IT	ITA	380	Italy 	Italija	\N
00040000-553a-4f34-7cb0-3694cbbd4dd6	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-553a-4f34-a957-fbc8be766049	JP	JPN	392	Japan 	Japonska	\N
00040000-553a-4f34-23d3-cf714f06226b	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-553a-4f34-09cb-5b063d8a4f97	JO	JOR	400	Jordan 	Jordanija	\N
00040000-553a-4f34-2ef4-77f40bdb93bc	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-553a-4f34-a598-ea47e4cda087	KE	KEN	404	Kenya 	Kenija	\N
00040000-553a-4f34-5b8d-2f25dd88c346	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-553a-4f34-48ed-cdb0562bc3dc	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-553a-4f34-aaf7-ed0dbb6d7c06	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-553a-4f34-c9e0-39a2d37ab9c7	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-553a-4f34-e9ff-a9a59612ab90	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-553a-4f34-0b62-fb7276de9382	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-553a-4f34-7806-b1b53ea62e77	LV	LVA	428	Latvia 	Latvija	\N
00040000-553a-4f34-f901-9aedf0d226ae	LB	LBN	422	Lebanon 	Libanon	\N
00040000-553a-4f34-3d22-9cd85629f5ed	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-553a-4f34-ff96-16c8bde4537e	LR	LBR	430	Liberia 	Liberija	\N
00040000-553a-4f34-ca69-9b645efd9fee	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-553a-4f34-bead-adabc8bb36f7	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-553a-4f34-7a17-55d4db91ffd0	LT	LTU	440	Lithuania 	Litva	\N
00040000-553a-4f34-f4fb-e98a3285c2fe	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-553a-4f34-3464-fe326b9b652e	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-553a-4f34-1d2f-e64d060004a3	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-553a-4f34-bf25-3a26793062ec	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-553a-4f34-956b-fc560a4c8b2a	MW	MWI	454	Malawi 	Malavi	\N
00040000-553a-4f34-255d-2ab65a641a9d	MY	MYS	458	Malaysia 	Malezija	\N
00040000-553a-4f34-9709-148df77b21a4	MV	MDV	462	Maldives 	Maldivi	\N
00040000-553a-4f34-efc6-ce4222e62b7a	ML	MLI	466	Mali 	Mali	\N
00040000-553a-4f34-ccfd-4d16f17cb2d3	MT	MLT	470	Malta 	Malta	\N
00040000-553a-4f34-41b0-46e8249bbe3b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-553a-4f34-653b-ee8cd99a0dab	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-553a-4f34-e855-69c04e856a64	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-553a-4f34-c7cf-52d36bdda822	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-553a-4f34-f8d0-84e38e3eb41b	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-553a-4f34-e172-634ce1d7f496	MX	MEX	484	Mexico 	Mehika	\N
00040000-553a-4f34-5a03-a9c5c15e04c9	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-553a-4f34-268f-b73c4ea241f0	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-553a-4f34-4162-662b76d571a6	MC	MCO	492	Monaco 	Monako	\N
00040000-553a-4f34-6f93-8e2ee887441e	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-553a-4f34-f6cb-191510e75427	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-553a-4f34-2aac-a62175c54395	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-553a-4f34-04b2-0c3967684c72	MA	MAR	504	Morocco 	Maroko	\N
00040000-553a-4f34-3dab-dec44a0e6910	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-553a-4f34-fa60-e46eb3d6331c	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-553a-4f34-9709-c97fbe9f6ed4	NA	NAM	516	Namibia 	Namibija	\N
00040000-553a-4f34-996c-a5423239a1e1	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-553a-4f34-daca-89620bf9e3ac	NP	NPL	524	Nepal 	Nepal	\N
00040000-553a-4f34-c778-d232d138e71c	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-553a-4f34-118c-2aed879dbd2e	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-553a-4f34-8afe-72d5a222f495	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-553a-4f34-72c7-4550d5cababd	NE	NER	562	Niger 	Niger 	\N
00040000-553a-4f34-2fc4-0042f1ea1f33	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-553a-4f34-d022-6a55b10cd540	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-553a-4f34-53a1-cda273d90851	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-553a-4f34-78ad-0f1447da0477	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-553a-4f34-e080-3e4aee52793a	NO	NOR	578	Norway 	Norveška	\N
00040000-553a-4f34-c2eb-0927b345a38d	OM	OMN	512	Oman 	Oman	\N
00040000-553a-4f34-3b01-ec0eef66a6ec	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-553a-4f34-d4c4-6cb6eea9247d	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-553a-4f34-fd49-66ac7cff6055	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-553a-4f34-f68f-95420546b70c	PA	PAN	591	Panama 	Panama	\N
00040000-553a-4f34-c5aa-8d1140cb5250	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-553a-4f34-8a50-9d44b225b30d	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-553a-4f34-76ca-79b1fffc8553	PE	PER	604	Peru 	Peru	\N
00040000-553a-4f34-9745-ebeb31d9fa43	PH	PHL	608	Philippines 	Filipini	\N
00040000-553a-4f34-0262-2433d096f925	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-553a-4f34-b85b-c278b657e210	PL	POL	616	Poland 	Poljska	\N
00040000-553a-4f34-f5e7-d6d25c5a4ab3	PT	PRT	620	Portugal 	Portugalska	\N
00040000-553a-4f34-5996-303a72fcc6f0	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-553a-4f34-60fc-c7828c83d9fd	QA	QAT	634	Qatar 	Katar	\N
00040000-553a-4f34-8154-e8caa391de5c	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-553a-4f34-7214-db6039f3af94	RO	ROU	642	Romania 	Romunija	\N
00040000-553a-4f34-12b8-9513281dbc4e	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-553a-4f34-270c-514c45cf9f09	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-553a-4f34-76ac-27810ea30552	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-553a-4f34-30e0-127ca3ea4292	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-553a-4f34-c927-b1bc5cfd4bc6	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-553a-4f34-83a0-4f201c9cc870	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-553a-4f34-f730-851161f6caad	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-553a-4f34-2c89-fdabd0577612	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-553a-4f34-3594-83c2f72918df	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-553a-4f34-9644-56fbad390d67	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-553a-4f34-5418-274e217371c7	SM	SMR	674	San Marino 	San Marino	\N
00040000-553a-4f34-1dd9-ee1bb769121a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-553a-4f34-abff-27b7909055ec	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-553a-4f34-44a7-df5238e7879c	SN	SEN	686	Senegal 	Senegal	\N
00040000-553a-4f34-9984-fabfad31253f	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-553a-4f34-993e-7da4113a0939	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-553a-4f34-073b-beee95f5b627	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-553a-4f34-3227-bbc08b4a43cd	SG	SGP	702	Singapore 	Singapur	\N
00040000-553a-4f34-f757-5904e85904a0	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-553a-4f34-d103-f8b484a1c913	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-553a-4f34-e24f-1e32763cc6af	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-553a-4f34-4caf-ea66e79f36ed	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-553a-4f34-ef8d-c2536d6a1d29	SO	SOM	706	Somalia 	Somalija	\N
00040000-553a-4f34-f716-dd4e49db1172	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-553a-4f34-db8b-ccfb61682d40	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-553a-4f34-2ebd-4e5246679f33	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-553a-4f34-6c26-58d803e3061e	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-553a-4f34-39ce-37341da71d59	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-553a-4f34-29f9-2dd2d337a89d	SD	SDN	729	Sudan 	Sudan	\N
00040000-553a-4f34-d56c-e31b2897036b	SR	SUR	740	Suriname 	Surinam	\N
00040000-553a-4f34-812e-aad0bcb2d483	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-553a-4f34-21d3-b5f5ea40e2ad	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-553a-4f34-46c9-db707e776431	SE	SWE	752	Sweden 	Švedska	\N
00040000-553a-4f34-08e7-28e22ae6c358	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-553a-4f34-7846-31bd9bfe7284	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-553a-4f34-f878-1515df473342	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-553a-4f34-8466-612a88ed301b	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-553a-4f34-a915-ed6d36c49d4c	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-553a-4f34-0034-55540fa8bbde	TH	THA	764	Thailand 	Tajska	\N
00040000-553a-4f34-6e20-54504c438614	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-553a-4f34-9e32-1f24adcac602	TG	TGO	768	Togo 	Togo	\N
00040000-553a-4f34-8868-064a0d875f55	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-553a-4f34-3b20-cc8e7a2a66a5	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-553a-4f34-f60b-dd05bf8ea05a	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-553a-4f34-2a52-e9b92c5717a3	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-553a-4f34-98e9-decf20006019	TR	TUR	792	Turkey 	Turčija	\N
00040000-553a-4f34-4b49-d94b53c511c7	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-553a-4f34-ca4b-e1e3b56042ea	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-553a-4f34-1701-c1583c25ad2a	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-553a-4f34-8fc2-b58b92174d4f	UG	UGA	800	Uganda 	Uganda	\N
00040000-553a-4f34-f2c5-7281a55b137c	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-553a-4f34-03be-ad07635105ad	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-553a-4f34-0f7e-0cb0e48fb48f	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-553a-4f34-c374-2f9c789024da	US	USA	840	United States 	Združene države Amerike	\N
00040000-553a-4f34-9e10-d66b248726e3	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-553a-4f34-de40-69063be76151	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-553a-4f34-fce6-ce75f9321604	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-553a-4f34-8dbd-5c6a8e1ed2bd	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-553a-4f34-d52e-f6354b89534f	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-553a-4f34-79c2-8fcc959f8202	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-553a-4f34-4512-65511306c42a	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-553a-4f34-83e1-5e4dfb413fa7	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-553a-4f34-df54-2b060eada57e	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-553a-4f34-edd1-79cd18c1ffac	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-553a-4f34-b327-e640f451437c	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-553a-4f34-79eb-2285865866ba	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-553a-4f34-c3f6-c60fab10bb16	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 1353258)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 1353079)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 1353127)
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
-- TOC entry 2658 (class 0 OID 1353176)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 1353201)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 1353028)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-553a-4f36-98a2-3cd6390e3ba3	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-553a-4f36-82e0-b3d3ac1b98bd	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-553a-4f36-cbcc-a09d838455a0	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-553a-4f36-0e8d-49d49e48e6cd	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-553a-4f36-3671-b6c0984fcf5f	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-553a-4f36-3bf4-21e0fcd94a50	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-553a-4f36-f717-3cdc5607e777	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-553a-4f36-8377-3e6d4dd9fd14	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-553a-4f36-ff1e-0e652ee29ff7	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-553a-4f36-8421-fddc3b715e4e	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 1352935)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-553a-4f36-e924-89aa99e07424	00000000-553a-4f36-3671-b6c0984fcf5f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-553a-4f36-ed74-b54165312694	00000000-553a-4f36-3671-b6c0984fcf5f	00010000-553a-4f36-03d1-657603f6f076	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-553a-4f36-0317-e567d356cee1	00000000-553a-4f36-3bf4-21e0fcd94a50	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 1352946)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, pesvdonim, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 1352998)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 1352900)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00020000-553a-4f35-04f5-18bc940f22a2	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-8d0e-87ad57cd88cb	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-31f0-7a92d191f484	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-7736-4399861ef982	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-b69d-4ce936f8cc70	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-13bf-436e1c0ed74d	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-165d-4073deb4cd6f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-6c63-f35330d93853	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-0523-bfd357ffeb9c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-abae-2bdd0158ffd5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-bf8c-d1e93adb5b31	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-9f2a-54c2f6e98539	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-7c31-b593b2fa7fc1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-0619-cf5a4da1b286	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-d826-68f66b40ee03	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-76ab-76529664d372	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-13e5-034b11baeb21	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-e936-4322af6d0a7e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-a061-cdfa0d637b2d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-06f5-88c5d67bcfa2	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-24a2-f3705e80450a	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-fdf5-827d19abbbbd	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-d06c-af1406174459	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-11e8-7278e9db58c8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-8c29-4809a9f11950	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-c33c-673867d4ae2d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-22da-4ce6a2367aa2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-4781-bd16668e56a6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-7af3-ad45d964283b	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-45ec-76b0b9bc505c	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-a874-87c36b7cf1a3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-6322-e6de1d789b5a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-bf55-e41646ad7c2f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-dc2a-5b6507b7a64b	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-6a14-92465060767d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-a2ec-6b4387832b18	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-5b18-dbe11a8ada60	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-165d-5a35730d8e33	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-0c05-efe18d04bed0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-6afe-2f52bb006b98	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-159a-611381091d15	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-ecb6-ba1669912705	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-5e80-3abe8d446b43	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-67b9-1ce1febed4db	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-d12c-b074b15834ac	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-ecc7-646f5fbf4d8e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-1fcd-87e56b8fbba5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-9768-aa881da9d0c4	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-8e31-2c0ff9b1981a	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-9491-c66d88daba84	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-76cb-20a788ff0db3	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-1686-515773b68197	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-7c05-61cdd110d579	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-f0a2-cc5ef72d44f6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-c21e-e8221fc0c4e4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-c94f-8d871b7af8de	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-83cc-0ffc3ee259ab	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-8dd4-c0e3c85578f4	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-bb2e-23f1aa2435c9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-f049-388248d76c4a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-4f23-43c19cbf2ab4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-ba8e-6e16c09c5b40	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-1e8e-218dedc525d7	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-50e4-ad72b4dcc945	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-00d7-60d26f74cf5c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-e6b7-20488cca2895	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-29ab-7f180f318e7b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-a252-0c1e1afc887a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-cf68-aeafba05e613	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-ddb6-04a71f946534	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-f1ae-7eddb0a7338c	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-8d66-d361dbe0baec	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-e4a2-77e3bd1b1d81	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-a7cc-f7dffb5e39e3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-eb38-189c492c3020	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-bb7f-688afa1a1e28	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-2cb7-308b5a50f75f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-9e4a-e06881da05ff	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-3bb9-53c964534e70	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-4258-4a0f3f369a42	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-991b-6611809b384d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-991f-75071677ffa8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-bcea-78c28095d50d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-0a03-25af6ee708dd	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-082d-022b4f68cb27	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-5696-6a5ce93c291b	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-4e54-dcd422206839	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-3146-b58007f41a7f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-df3b-e02dad3ccc35	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-ca58-2ded50fa92f4	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-f022-90625ac5014b	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-946a-d8bf3e6b307f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-fb73-b07b3ac6a789	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-41a4-38b8fdd794f4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-671f-7916254e24c3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-b648-6ce906bc4e31	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-8986-656cc8eeb668	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-3fac-1b70788ccf50	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-2321-09a392f3b0f9	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-01eb-74a739e6754b	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-f3e4-c2558d42d42c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-3011-65a041dc5a93	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-6d6f-05130bb9bf56	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-686f-2395d0cbb7c8	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-946f-366cb3ca1b20	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-400f-9d96c9a29a02	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-54e5-0a41646e6ece	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-571f-76f7187570e2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-757e-3d7f1e2f4597	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-a60d-02cd5a5f80be	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-899d-0018a4e585d4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-7aba-d5022db7c566	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-7d8f-4a11bbfdad76	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-00d8-e9a7afa83819	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-d313-4bfa0795c7e7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-fd7c-a9822ff79954	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-ec5f-8c02bee5a0e6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-f7d2-e6e670884436	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-6470-e80b01972c3c	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-2b4a-ca8f8a1aeb46	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-a8e0-895ca5793a33	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-4320-06614c37b5a1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-0fa4-6acdc9734ae1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-6cff-7f6a86204f78	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-9e38-f018e9caee91	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-e08b-03dbb28fc84d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-bdd2-2f092b532480	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-8621-23a04329e490	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-286a-698d1cc66b00	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-2bb7-1e663d4d755b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-3967-41ba4e73af1d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-fe71-9dee9fc2715c	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-eb74-e50439123fa2	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-a3f9-06a36f95616a	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-ab9d-60de3c0dc6c5	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-19ef-877aeed9c39b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-cca4-2949576cbb29	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-d418-f9d183297959	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-8dfb-c940e35e9c58	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-3614-d1bf0d8a7bd2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-ae87-0a9ddb604a73	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-50c8-245dab0bc8b9	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-417d-4276269867be	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-2816-9ffae3f37be0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-9a9b-b67a384d43b4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-e38b-c139f09424cc	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-2216-a5bdbe4e0184	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-f4ab-b4d05b8c2275	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-473b-c512ccfd861b	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-652a-461d6162d6f4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-a36e-58d542c27557	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-6915-f3dc35f9c84b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-1a7c-b62554426d4d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-9a92-8359113bee05	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-8c9d-5c978a5aa802	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-40f3-be0577a24b87	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-2e94-36d7e0ea67a3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-a36d-bd4c48a94f00	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-e353-91f8277176a5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-2120-084a24dfa575	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-9acf-54cc5b234ab2	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-9498-a5dead5c97fd	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-5008-b2371c15f18d	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-edde-d28163619e4d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-27b0-604b9175327f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-4926-c4290a600977	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-a9d8-e8bdc4b025d8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-9c81-b047129e91f8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-eadd-9f1c675575cc	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-0534-90c56e1c0be2	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-5a97-9a0b311144e0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-4428-8ae277c141f5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-5d85-bdac5498bdbc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-84ec-1ea944a6b65e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-2e65-0a8494a588ff	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-89c8-faf9f8c17366	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-2122-f6f9ef2924b3	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-38e5-5b0a2d9aa34d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-998c-1c68fecd2b03	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-5b00-8a909da9d97c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-6269-026f6ef74494	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-5eeb-9c475b44d049	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-01b4-eb96a19c1d46	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-3890-b3e1a1e30159	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-0bca-934e0f9924b0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-7ebe-936089e69441	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-9def-b60594fe45d3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-6931-a2490ac3ecd9	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-ab59-21e691605510	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-044f-39a95073b190	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-b580-ae9c59fea7cf	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-7b66-aa14dde2d053	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-0fd5-d6287b9a0480	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-3137-bddb09ff6d54	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-880e-58ee2ccbe2d4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-c564-f74b9fc6ef11	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-679c-65819624c943	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-959f-fa7fc0bf24a4	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-ad75-c1ad2c31302e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-1fef-694cec3a5cfd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-3b0f-3e6bfcbfb7c8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-23ee-97f20f47deaa	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-a587-a08092726128	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-2270-795286c625ed	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-4c18-96f130de9afc	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-767f-fcd832bec105	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-e854-6354ef32dca7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-b582-44b2795dc598	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-dafb-99b5da1df9be	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-0c52-20b3f68c7c5d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-f207-6546006c4f3f	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-4b40-1c7880bff0c8	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-f6a9-559e6146de97	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-848d-8997619eab28	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-01dd-873134ebf3df	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-2bdc-f3b0a886e0d2	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-c864-013733769729	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-38e4-6698f2aa4e33	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-4879-d4ccafd060f3	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-e531-3d53793161d7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-2bd7-1b70e3b45ef4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-eb55-4f8bda862847	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-2a11-d50fe1d2f9d8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-af7e-306bc2743294	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-feaa-7f8f5a11786b	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-bf03-616dbe8b1060	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-6d22-c38f6d51c2de	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-dd8f-39d170442f6c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-bd54-b6fded561213	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-0ae9-01dce3760285	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-67e7-0655c013ec09	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-78c4-df550b76e8b4	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-b99f-44bb02a2157b	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-9f7f-3b19941e630c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-30da-078ba62f9c93	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-1c02-51b6c7ac5854	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-8927-b553f8bd810e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-2ce4-803f158a7b35	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-8c4f-7a64c65f59a5	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-9d63-a7285fa80ee9	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-e89e-15a8e95620d7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-0614-4849bc1015f3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-21fb-e9c4da39881c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-8a1a-e21d42a79e26	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-23de-c55e5764e9ad	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-7cd2-74addea5bd16	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-5a3d-b2feb0069ee3	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-3bd1-993fdb666d4c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-35c6-6b5a0555914d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-44ca-bca8e8874491	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-a103-42f2a854d4e1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-8a02-2f5c52180e11	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-3841-4651514da419	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-999a-fe3b58217f79	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-5930-20216e94a76e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-1380-498643367104	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-4c9c-7eed15de75f5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-2b41-7d85768acb84	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-9347-141403840eb4	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-abf8-a90ad1fc458e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-e4f0-fdd2ac9ef04d	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-e13b-3d50e95705e2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-61e8-bd6371be2659	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-82d7-8c4d3c977e2a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-9b9b-d31eb43d7650	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-8c97-dfe9f16b8451	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-2bc6-df31b8e2a55a	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-afd6-68036d2552c1	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-89f8-5e0d9da61136	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-4b00-642a55f0fb6f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-b0a2-a22f6037790f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-5f6d-3098134d7ff3	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-bbed-a18aab0cddd8	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-d2f0-a9730297ea0f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-aed7-820c07f89424	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-8acb-2f20e27a7560	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-ec03-919c0a5daad3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-0b8a-0108b8ae9bcc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-4ebf-32b45f34f23a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-b57a-f5b638c1f64c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-6c4b-7d3547f5eaaa	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-4235-3953e86b1e25	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-399c-2cd252355004	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-cfb6-d97d3880d3d5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-5f64-2349b3a724bc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-aacf-b375f5dd71b1	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-cee9-2ed3d7f4eb42	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-d71b-1b53c02e1e4e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-f552-6d4e9407a39b	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-27ac-72acca918d09	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-2c1b-9f93909f15d0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-978a-e5e75c4344c3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-564c-c3168ec84f18	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-a42d-30122629331c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-4d98-1b4b8a73f1e9	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-812f-e85394ba086f	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-a76c-6650e3cada1c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-caa8-32e56aebf944	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-3925-7ed1ef9d9954	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-3cd5-6bce5dc8b41a	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-f104-272c117044c3	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-afd3-7b38f2294b9b	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-cc17-3694d10d0adf	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-7e6d-9d0a223ea56c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-edd8-b76a06327192	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-9bcd-7ca78f1e1d31	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-4f60-f2557ec00f42	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-af77-3717170872e4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-42ba-86c34de43352	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-b18a-d4025c3c02d9	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-de58-e34c0b89d6ec	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-cbd5-1231136da447	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-8e56-04da5869af24	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-25e4-76a1bf12b6a4	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-ad59-7ae6c49b2c6a	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-390b-76af7b89e408	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-d18d-acf7a0765383	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-3748-2a122e359777	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-fc23-e7eff5c173f3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-0445-447c0fb81b52	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-a26e-9083b0bf7f11	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-0b92-edb40a29ad37	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-bfa2-8ef5a76151f1	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-5236-2a39d1b5fde5	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-e53c-9cabd1bbcddc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-a773-10f7b08f8128	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-29c9-e51410fda2b3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-8dc0-d272bb673133	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-e345-640305771654	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-1d57-3de28dd0df23	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-7926-c4b0949d3677	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-858f-6421945efb4e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-f026-f159ac9ef405	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-3000-52ce0918e7f0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-ad42-effec54a0142	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-e3ac-3d4b12cc6e52	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-4edc-6cf501058475	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-6a55-d95b29372d46	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-1e43-4a9f61d7a0f9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-f604-593f6b1666d7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-2c73-ad9b355d941a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-9ea8-81ff86f12b60	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-10b1-e104b12ee9b4	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-0d0e-e2ec641d7485	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-af89-a9b1abc1dd74	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-7a73-12ff45f8765b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-ba53-f8d2faca775d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-bd07-0f0f5822f836	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-d16a-72ce2b25782b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-719c-4cd9c537df5d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-e02b-30397e10e460	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-6e8a-c5fcb96b34c2	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-594d-ff6d91ca1b2b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-3837-9813fab9d692	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-afba-aeb72403d79b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-1f07-e0d5f8636c3a	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-4b63-d1757558b38e	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-7939-ee2effe68dad	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-9792-4e56a70838c1	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-7be6-2b9e9894566f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-373d-cdaa3f145e5c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-9f27-fa1400184b2d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-3351-652b4506ef8d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-46cc-b4d2eb60cafa	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-b18a-a720bcb6de99	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-c22f-dddc56962fda	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-5343-9579f85b4027	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-0de2-619ae227bbd5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-e09c-ac7d020b1905	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-fecf-a45ae012b4c4	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-cdd2-af5f2f542a9a	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-3875-0565b283037b	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-f727-b4d85b4fb40c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-0807-a3c27e0d1de7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-9b4d-4cec47559792	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-98c7-36a683ad5e5f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-64a8-c450a04c9ed1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-2323-924b9c2e4b5a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-3418-ef07c80043b4	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-6620-d8e6b259b2f3	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-5e32-a40da30bfce4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-46de-f0f52baee9dd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-f344-3622ac0a61e4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-013e-e9776c06727e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-434f-96bdde19a58b	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-a3bd-93bf2edf8704	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-2635-4631768b50d3	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-4729-5e4542714616	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-85f6-c1544e2281a7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-db85-ae5b2306ac4e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-e538-63e1377d3e9c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-0d9e-58294a5c2662	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-348c-3dfa89653c13	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-cbc0-7d03f9df5730	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-efcf-a5f8f45d3472	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-78dd-8ea25c5db62e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-3234-47a1fbd4cec2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-097f-9c37d3bcd6ac	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-c312-e7219858497d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-1ccb-490e1d4e0c0c	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-6665-65396da27c85	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-7adf-eda16182427a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-1dd2-cbe3f54b724c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-0671-de557653b0b8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-0e9c-b897dbdc4058	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-0d3e-408ab7b8036f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-0745-3c09537015a0	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-7fdf-b5b9a8b47db4	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-c6a5-f4d424105668	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-7cd5-579f082c057f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-6467-d512f9a1101f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-79ff-01ad458ae464	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-bf93-a9372a621288	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-2a80-8aa03be6f91f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-8c67-988954b9e374	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-37a3-82d0e91a5c18	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-df40-2e553c83d056	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-d96e-bb16bd102341	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-f3cb-f1e6ba4b0ffd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-b4c2-311c1d901467	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-a41c-a9c8b3bdf21b	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-9b9c-5a1b9f2b9408	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-7b9d-777b5d41256f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-3e09-b71508eab3c1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-04c9-24100183a341	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-ae09-deaf7eb6147e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-c17e-e71ca53ad1d1	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-7299-be502619323a	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-448e-a955614bb07c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-595c-28b458e7363a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-a118-73d1a5554cf0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-a5ab-b3c2c24794a8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-1c40-956a89bc05de	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-cf9c-e438816d3e23	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-1453-095feb6d42b7	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-dca1-870bcba4ef42	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-aa45-3423db17b7c7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-760d-586abbfc240f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-9998-95bc877d2e58	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-7cff-8903b246db1e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-7219-76893109cf63	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-774d-de5b1982f81f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-333e-806015152c06	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-dcb3-4325db7672a2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-9e70-61e9ebcdc854	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-cc94-aa386a6fd8d0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-1776-bfdf5361ee56	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-df2a-b8882e054e02	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-edb1-2f29a858a02f	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-e4ee-70f386081d5b	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-7e27-2bc9e86684cb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-8a77-4c5634c42686	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-5f0b-b21303afd111	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-bc21-4076c91ada1a	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-9b35-097c534c4d41	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-2b7f-f4a44314e3d5	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-be66-4874a58428d2	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-6f39-fd217ff1b5d4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-75a3-edf9d456238f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-7192-07885bd0d249	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-c55f-7c4c0ef6eced	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-1c76-2974007778d3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-fbaa-f998df38e671	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-51a8-b201b2002ebd	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-fffe-dd66ec6a8865	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-25d1-e2b1890c443d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-1d35-4d138b9c1a86	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-2808-501bcfeb0ba8	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-ce0f-2f116c5ea241	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-5634-c40c7e714192	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-7b32-51799c872ac1	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-c998-2f3faa8f03a1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-0d38-2c69f734017f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-f1dc-beb41da04544	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-a4ae-ebc587ab3183	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-62e7-db69776484d8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-e4c0-41ea7c11e1d5	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-0732-56eeac4fa86f	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-5409-eec68e5498ac	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-3fea-dd567c27f47e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-2231-c47377b10ca7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-7456-1bdfca218301	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-6bc8-6eaee2bf8d83	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-2002-dab7458c28ee	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-a875-3bc6f8bf9207	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-ca13-63ee2ac31fa1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-2793-4f3193736ea9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-64c7-d912d2e133c8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-954c-bb16e1ccf6e0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-4985-85d219fe8ae6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-c47f-85370c9dbafb	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-df83-cd1d3186e618	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-d6a1-22da9f3d1b4a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-8735-18a29ab72a60	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-43de-eb804b33c93a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-5562-281c58dc3a56	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-d419-407606ac0f54	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-7658-d8a94ed66620	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-16e8-db3ce898ddf3	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-7872-c4fed8f0a46b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-c7aa-bec06ebea244	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-9477-ce16cf5ede35	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-9117-f98688f39b69	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-8241-1cc471d882af	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-1343-5e90c09bfcdc	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-19d9-94547b36ec38	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-25eb-7f8ff21badb4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-dff6-e068146de72d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-d438-d1795f73fa78	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-678e-c27599503912	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-c965-f0094e9f627a	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-7700-67ef11a65072	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-97b5-a39df12d25b8	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-d199-2d62dc0a132f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-00d1-8382c9634f5f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-0447-c8748fdf479d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-7bc8-95e401cd55b0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-224c-60d59ea9dbe9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-37d1-70347ba643ec	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-4cf8-4184dd120f80	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-f651-2c6a408ba42e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-3ca7-4806f828bbfa	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-64d9-d2807b7b3a2a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-1bcb-0486f2f374b4	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-dbf9-de8ce9b62608	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-40bd-ee2b544fba32	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-0721-93f237ae502b	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-10c3-2b4d50feb675	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-7e3b-be6df7f40a79	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-1d8c-aeb58fafb72e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-8b15-4aff344892d7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-0e89-ec8deb080208	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-7206-d1463fe4cd4a	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-72ab-0da69eb72a85	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-9647-78bca0fcc0d4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-1ee7-e297d4feff7f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-8b63-5be939fabf16	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-ebd1-cf7348a3011f	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-db08-00642d27b0cd	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-682d-b36fb38c10c2	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-1468-bbceb01b3ebc	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-a063-784183bcff30	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-6b90-4c5934330d38	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-0a2a-df9a160dae05	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-dbeb-8f33dd30ef8d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-8107-c98fd2e9d003	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-7f6e-c98cd189ee42	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-4976-198fe1b89375	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-71e9-06947cfbcf5a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-d0f9-3db9c5976735	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-5cdc-55eb2b9e8a15	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-3c5d-df3da2927b2f	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-fc73-6297ef9321b9	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-e779-13c5eada471c	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-acb4-684b77cdb43e	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-7d86-03ac6eddf247	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-49e6-54a1343f1610	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-bedc-ca450f113f06	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-5306-c95665186128	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-55ff-dd29eddf9ae2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-b3e8-9186b5bf4a1c	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-914a-896237b9be28	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-7fee-4045cc1d0f30	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-e5ef-4d75c78bcc09	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-0077-a27c8ad86cca	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-9509-639b83dfbd94	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-105d-fd350b243036	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-bcd0-04b2374c4cc7	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-a628-b8bf915750b2	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-7bb4-0b06d79fc583	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-fc97-787457f4f916	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-5a97-2b45d9049512	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-868d-3fa8b83693de	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-8987-b003af35da7a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-2211-03e38f57d782	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-45c8-739334b3edf7	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-cb8e-dc3f5efe395e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-523f-4d93aac69c4a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-0d3c-b8579b1ffc17	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-734c-a7d25e31e36d	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-c930-cbef4faaf936	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-d73a-9200a8da8b8c	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-9358-8a8a82359234	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-968c-b2a36da40ed6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-ac5e-e823e3cad860	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-1ce1-b2d387dbf9e7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-a4d2-ee437312f09b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-0765-f378f27d251f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-cb5d-e35ad4a71929	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-0fce-da26c06fa7dd	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-6329-2582fe149c8e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-d487-e2cbfe0bbdf5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-99bc-de184c03353c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-654e-8fceef336e36	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-0512-c237da03a142	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-18f4-e7e4cca0f852	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-95ae-a2e63e02eae0	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-cf6b-d0684644483a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-3606-22b384860d9b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-1455-aae6ae122e88	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-c075-cf1f90b10e08	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-b66c-bd19d4b813ac	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-6c1f-6e732ce9c449	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-ab37-2513e9ca63fa	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-2347-be1f95e77012	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-1a06-b3257a3d4aab	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-b683-db18a965bf52	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-cc7c-78c079d53ef8	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-a3d8-4e78e38434b3	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-9bce-72325d34dfdd	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-fc4e-3b91491fa0eb	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-9b37-eae23d2123d9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-aed8-3c7cfa61e30f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-5d20-9a12aafe87ec	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-49bc-724a2f168c36	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-0ca1-3d4defd331c6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-de3f-8a103bf47d15	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-65b8-448fa9d58aa5	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-310d-e4ccef849544	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-f78d-7e08946d6353	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-0d68-8ee1ae8de896	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-768f-e72006b91086	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-a972-883bef957079	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-fa9f-df20298174a3	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-8d70-732f6ce00ea7	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-0157-e3af397a0b3a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-96ed-d994eb5adf16	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-b644-e75d0b8b7213	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-c5a8-d812c9c79a2d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-ada5-27754adc7511	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-ff66-bdfb9df7c0bb	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-4475-67d1a4e2e73e	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-e42b-7d85aed67ae7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-68dd-87ec995861ff	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-9415-8345367493e5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-5b89-c80809fbdb95	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-fc5a-b0f603ab6588	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-bef8-c7d784152201	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-7831-54734418a397	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-055b-d795eaa3bfbb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-2188-9cf4ff7d450c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-ea4d-2a6ee9088438	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-d4f4-85bacf83c6b4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-d45c-b80147feca86	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-f09a-84ef483d5054	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-ad4e-c15a2d4d24f9	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-c195-9a2af15b5444	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-cfb8-0dd7922ba59a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-f5b0-bc81df97b477	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-a540-8c800f86f9c4	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-d419-633a9ce4a3a2	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-bebe-2f1ac4e38437	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-69f5-8045c960f066	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-12a8-8b42ad32df7a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-e647-a738c346eb77	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-c9fe-ed28e378d756	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-edd0-25478999432d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-ec36-3404391300d6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-f6fe-7b9c13bdf2d8	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-a389-a3bb7551e4e2	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-1690-850c0be28311	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-694d-5fe067faefba	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-10bc-aacfe83ebc95	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-0f73-89145bb864ba	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-ab16-a4807e8ee2c4	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-552c-e47132d6c95b	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-3c4a-869397f494d3	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-c2b5-9ef2df1ab2f5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-2b44-6bdba9d1e052	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-7413-94250da633a0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-c899-fb7ad5be608f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-6bb9-9b2c5c861320	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-554c-d2064f4dd785	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-2a39-1c8cfe457c8b	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-8431-11bd9662d873	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-364d-9dc42e901b8c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-31b8-042ebef66b55	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-61ad-a785f4f0bc01	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-3cc4-2b67718b70cc	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-995b-14b810c70d05	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-75da-4fe9c19d530b	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-603b-385fa6cefd0b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-2ef6-5cb421f4827d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-1d3e-dd9fe2bda3db	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-6c24-7c6c94659ed8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-014c-ce4797e5fd46	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-70ac-ab8335730e07	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-4f56-9c34116d5b3b	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-7c62-c726d191b0df	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-5153-962288fc2da2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-f813-b7cbd4c2ebf6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-1d1e-d2caf3c827b4	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-49cf-32959a940b53	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-e776-171479a9a1af	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-5668-94d571bd4a8b	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-df65-3fd16a206bcd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-ee8c-31a04b0ce428	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-bc3b-8143059746b8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-f75f-6273a2dfcd81	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-5d87-27f81b2f3aee	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-36bf-0e6763ed2728	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-b447-4f78803e8486	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-fe49-b4455ece057e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-454f-3817e011aa46	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-8446-9d76ec10ad6f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-e24c-23c0cd6cbb60	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-591d-51a0cead853a	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-eab5-241980ea2e89	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-c2ad-2f98a93ca527	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-e331-8d754262eec8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-8679-20f61658393c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-472a-730f4a4b187d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-a790-c92ea165e60a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-c038-d6daf1fcfdf7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-6262-b85948b71afd	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-7bba-fba4be76d94e	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-1a82-2bd28cbbee87	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-e5e7-0f44bc54bc0b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-4567-ec01640d13f7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-79ad-3e165c71b375	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-7601-0c1e677082bb	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-887b-b5eea4ce4383	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-f61a-da2c704cc5b9	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-66a7-c3f6c6ecfc26	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-7bea-5e94bec20c8b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-43ae-d36f9d776833	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-31f3-cf21191f31ea	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-5cab-670c870fdb26	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-c77e-8e7df8ee3b5b	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-9537-d0d51c69d9c8	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-7ccd-7e55a06fece5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-bf71-12f554f1a9a8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-b786-85dead354276	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-940c-a5d1eff2b4af	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-f01e-75910d254379	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-e1d5-4822ae5e98a2	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-926c-e52a93d06291	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-cb3e-94ac3858b53c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-cff1-3d2edd38fbad	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-b01b-c946cbb8d9aa	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-1de4-49466958224a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-fa6c-0c15609ae7bc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-3b1c-1a23ca5eef1c	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-3243-3596a55e450b	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-7812-a9813fcfe763	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-1720-2dd502013b8d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-56f2-509251231b73	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-6ed6-b5e06a1b5e09	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-113d-7719c0eb92d6	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-81b5-ac69f8735ecf	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-3e5d-0a8f58e6733d	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-8cde-46041ae06eb4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-4ff7-227487a532f2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-1823-969f0032593e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-5bfc-55b6bf84c33e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-c43e-f00b5fc52d99	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-44e2-ed286512def2	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-7a11-5b6d8b06c414	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-24cc-e5c7ca42e81e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-c2c3-e351374afef0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-2109-25f6596475f8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-65ad-8495ca385fde	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-16f2-76f50ed52a64	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-6934-f4408b095063	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-679f-293e5b0635ce	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-1bd8-f2fd0e3f4d7e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-3841-fbff609ab3ef	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-7203-4843788742bd	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-8a66-d6d69b48e024	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-0f70-cf1f701b2f6d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-6adb-9e64fee1e936	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-be94-db8f3653b63a	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-73f1-a7406bd12646	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-23d1-0eaa6c9f31b5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-b257-8b155e2811e0	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-1c12-48e5adf4b0f9	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-bc83-8105f6da096b	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-bc51-065631ae5991	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-3e60-c625fd87ef66	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-99ad-e9f4801fad7e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-4707-c78d9c6f6e78	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-ba2a-9a8a20031a59	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-6a10-fa380b2b52df	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-eed3-30082764c2b4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-ed5e-283d24f525c6	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-7929-24cd00dacb22	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-9299-7e0f4aaec055	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-2409-d21a2c94fc6f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-6e69-dc4631eb73f8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-10b6-b38ad51024b7	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-0106-a1c369069d5a	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-56a0-d386081b74f2	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-fd81-ca723659961b	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-7f9e-0797b8747999	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-62c8-d5cb9b548e32	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-f89e-8fd767bfb292	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-62ef-5ca25b9c73df	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-5129-7ea321ad54d8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-5cd1-85d115dd67dd	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-df9b-11c560a303c0	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-789d-71aa6b73f648	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-a342-b83b89811a95	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-c0dd-144023d7bad3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-b4f6-dc5978d168a8	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-2837-ec1194871ed3	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-bd9e-b91a1613530c	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-7e9d-740b0a233e79	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-06d3-6d4bfe387c25	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-40db-f96329fed951	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-e393-2efcc2fb83ad	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-b7a5-64c5b2500eb3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-e4b3-10ef07572ad4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-0d95-17e8ee2bd4b2	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-2a21-af8e8078ad7d	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-a24b-d28f99bd42c1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-cb70-0fb4117563af	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-a056-15482f3db99d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-cf39-e46971b4fd6c	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-3399-61636e954638	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-ad22-7508c6867164	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-2a23-a58791f44110	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-5169-910ce724e80d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-b2cf-ea4b05ad14bf	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-37c8-3698b907c831	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-cd11-d1d6a8d41191	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-17dd-0d7b49af4d80	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-0c36-26c7157a6eaa	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-b907-43841de04952	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-6c1a-83c2f6bb7df8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-b0ce-c6b5430a1ee4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-d2da-dc890a5b81d1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-3104-60586493940b	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-39fc-1620b7c05d9c	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-cd47-410f41b46581	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-b701-885a5e363ed7	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-8b09-89201358861f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-cea9-489bdbdabef8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-d722-dedd1bac4830	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-650e-782db529ec8a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-e709-d5ff80a5d34e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-99a0-ad716a4b7d89	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-ff51-83e54fc3bd10	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-470e-8ddbd94a6503	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-f5c2-75d901e25e7b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-52bb-41f795d766bd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-a4d2-c34f53e5572f	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-5475-f59f9df3cb33	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-7ed3-d984b317bfa9	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-53ed-b2efdfd14770	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-732d-d796dc5bc06e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-9620-a20fac8d8259	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-e9ce-8ace2cdf36a2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-44dd-90ec92299ab3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-a97a-0a9a60c51d85	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-9e20-c1696632891a	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-face-7e588249a450	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-897e-1d0f722d9458	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-0da8-c58a36d51aab	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-9ca0-1f2cf506b74e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-765e-421af020b371	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-8654-b58fe833ea63	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-b089-f7a10fa65030	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-7697-d6141b512be0	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-61b5-1fb66e864f54	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-df71-76869c8a2160	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-aeb8-95e874760fb7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-a4d8-04e8cdbd9b47	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-4efa-409f1f7f5a04	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-8a92-ba44328891e4	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-2ae0-5826cc5f84d2	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-fb74-9550e4873a21	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-7d9f-a13e2ac4b146	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-5e5c-7d57f4e031f8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-6499-3d0cfcc07431	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-03bf-f9e8671785d9	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-0e55-b66e2fe07007	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-c465-6c7994a7c153	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-8e44-c592e57084bf	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-a1f7-7aa62e82ee6d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-b476-99140cb1f8cc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-d171-5ebd5b2549e5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-9dc4-88a52f5583c2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-35d9-9da333292b06	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-105a-f21a25a6ae11	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-5a37-5f75bd3a71ea	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-9d30-3a808932f9f2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-6ab2-c8977aaf4b7f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-90da-204ea0dcf3a0	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-519a-accfca302b84	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-d293-3b2390dd53f9	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-5ded-4b5ab4dfb9b2	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-3859-72d1f6d9644b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-da20-88d21f893830	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-99f3-a2650b9d5700	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-4457-ec9d90db7f77	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-03fd-9028019534f5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-8604-603c2857061e	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-87ac-487a725aff4e	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-5f98-24dbce4eb735	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-5682-0f3c669b0cd2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-9823-188a083ae1b6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-f0a5-9786340117a2	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-4940-2daa8d2245f4	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-972b-6eb7bfbbb8be	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-94df-28e59c8e9fd5	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-0ea4-29774e2f6897	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-03f5-12a28243348a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-a780-d570f64a66d8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-dd4a-b69415c2568f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-6ac4-cf0352148df2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-92eb-7ca76cf8c76e	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-d5b4-4ffdef7d5336	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-f633-22dffaec8802	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-9684-0183f472251a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-db0e-fdd6ec66d07d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-97ad-be619dde8fec	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-37d1-9e4e894d38c0	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-28a9-a078079efd54	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-1614-fe6467c8c0bc	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-758a-fd62f05e6122	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-5fdb-f416975639d4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-810e-d4f4eb160c9e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-3542-f25522d2a1bb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-9d56-90b542d2c822	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-138b-2a2990d9056d	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-1046-ec778127fc23	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-9fd6-e2350233dcba	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-3188-e63be6c993ce	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-20d4-b8ea1a8911c4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-256a-6f3bc724fba4	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-b61b-d6a78c05f82d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-9b28-a54066d439b4	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-5b8c-f1ea85273f09	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-d727-c6219cf4bb37	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-f461-19bdf1d8f42f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-8b66-783629d5c1c4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-ae6e-b9422723fa58	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-baf0-d14902c1367d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-8cca-dac6a7699b09	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-8b8b-6203b72c6a7c	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-85b6-d37620e40bca	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-e2be-cc642637269a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-de47-0d514bfdf24e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-95dc-42408d51b2c7	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-46bc-772959acb634	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-5019-a670722b03ad	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-ae0e-a100c796c2c4	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-6aac-4f7d78ece888	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-2cd8-da671c757dc7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-b1b6-95ea89d902ae	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-6584-a614c3871933	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-7043-ccefc2bb5f62	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-2feb-d3f468e2f9b0	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-a79e-ca955b852891	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-0bc6-aee44fb1b7de	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-51d2-58d956fcc995	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-dbcc-c18eff0264f9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-188c-c8c2ed02e65a	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-785a-998c1e6b75a2	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-4ad8-e7f054239d52	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-368d-23189c052375	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-ca0b-7e32ef3f1e0e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-20e7-46080a0b3edd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-5203-0e94aaa0156b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-e019-58f4fbefb5d7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-ad68-a42eb64eae83	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-bfb1-cbc5a7e02797	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-e7d2-2eae795333b8	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-b0bc-3edb67e51516	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-873e-6eee707497e1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-bf3e-5789d70589af	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-2e1d-57c1563e5638	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-d546-48fec40a1ca7	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-bb8a-362af92d35b7	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-9be2-5b1847e076ae	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-0d8b-ac1d7ed67d73	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-ce63-3c32cc2587db	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-9ab7-540c021bbb93	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-bc4f-b6aa8d343d1a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-2c8b-6b2ec2226194	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-090d-391854b74777	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-3a50-960c41265975	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-15c5-cbac2fd05311	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-8836-8ba014a27c82	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-b221-ad81ace05c89	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-bef9-f453820cb089	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-cad1-b2582b1f1211	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-5b5e-b730948a411a	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-b383-37c9ae459d23	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-8910-72fc555cd779	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-dae0-fd1df07ec4b2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-2c80-327c3d3c37b0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-d8ee-de0ba607fde4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-7a87-6b3e4a72ec9e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-6647-4ce46f8a2c0e	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-a57b-c809e3035b35	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-75ce-945310d6488f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-b6c4-f29af5f8c3d1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-e80e-28599afa2e40	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-9d34-41e735371326	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-58a3-7655c11caafe	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-6250-9f25dfdef9fe	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-3049-3a7cbf83c037	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-6520-0df104f7859f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-6b4a-a1acc7551279	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-c0c8-f905eaad581b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-002e-9c1e92c418c0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-2f2f-0b8c31c15ce7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-6d47-47b4b46d54e0	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-4bce-9aed73d1a44a	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-1a62-f759860dadec	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-68c9-d74d0de0f734	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-b005-18180ac4b3e2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-237a-9a377ad43545	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-af77-1b8a920afe09	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-e57e-3579b5113735	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-ff96-874f8597eec2	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-88f7-e9ac50b61bed	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-ade2-264899dfc4d6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-e6de-c9c6c117427a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-0410-0a82d733a849	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-8d51-3f354651ef3c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-370b-cbc45881e7a8	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-a4f7-7fd98866129d	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-98e4-c4d742d4d95a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-37d9-6b117ef0336a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-4ccf-83949dc62378	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-b306-ef0a1a0b63b8	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-7652-da142d4cd35c	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-3e09-4c1e00b3b46a	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-5853-425b97e6f851	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-a25d-c117f6c64d01	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-515d-bbc4f81087e5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-89f1-4bf8327a9fca	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-14ed-d0e314b5b7ff	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-f9df-d23935136d27	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-bf5d-58a8138533f3	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-5d4b-138fb294eb45	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-f23a-b2f5ead2557e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-e360-7bcdde3d3a4a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-daf6-2f6812621090	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-2abc-52a9f1e41e9e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-ea72-421ed9c081e2	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-7bfb-ffbbea735a7e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-0af1-384c7734a845	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-e5cd-6be5bd32bc8b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-4d58-8d40a31e00ec	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-0d0f-848e7bd073d7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-1929-059d92704602	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-49a5-fa62c398db93	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-b3a7-f5f9ed831387	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-9364-084874b0b8e4	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-c0f2-d2ee59bc3cdd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-5ec0-aaeb79323695	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-fd7b-0404de76a95e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-5b70-aa4acc586b28	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-653b-a757d171873e	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-4bb9-2490e5110e71	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-2a89-959889dba228	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-de88-a30072be6598	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-7c22-6704427e49af	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-0fd1-8bef40f1edab	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-dcb4-495e3fad9b1e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-cc9f-75daab7f218f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-e603-3537d873aac3	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-4238-5bc3d69e2cea	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-1183-632008a0decd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-4710-87b720f2f85b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-fbe9-77dbcc52f950	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-459f-489c91c82de7	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-d57d-44a3977ef854	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-4e95-e3668d03bc15	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-b33b-6054c11b2770	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-89de-7cf57af88f50	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-cd2e-8741900fecad	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-3a32-6b092dc2249f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-9c69-fe27dc97579c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-a981-2208b50cb7bb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-5834-316783aa4f37	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-84fe-eee565a66d44	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-4189-787377d2be4f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-2395-7d13d54fdbd5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-7ee7-9fbe3db45b25	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-6cde-777df9208ec7	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-f6f3-4f546a487a3c	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-d643-f95202b159d5	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-5fdf-85fe4ea7e6a2	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-e99c-23441e90c34d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-5174-d7e87b994cbf	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-48a6-d85a19198fde	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-f22e-f34ad3e99a62	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-eaaa-af4fcd203464	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-4df4-b6f0e9fffd66	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-559e-6fa9eddedb6e	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-f13d-92390b456989	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-8aea-65674696adb1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-8a66-f32c2ea73141	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-9c3d-a9a6491a326e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-21bb-5773abca3dad	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-0ec3-7f08d1b0d35f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-9112-96e48c597567	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-3546-5349a6c6a4df	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-a342-34bd8a5b0d0a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-2c43-7973c1ce4bf0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-8ff4-71bf5f3a4492	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-f9e6-6e35c6ab0eaf	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-36ab-c7b87a13f163	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-e792-9d897c29ab8d	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-f80f-4c349984ff31	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-2c6e-5ff0c107e801	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-f597-970c4d907ca9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-ae99-41d294697793	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-bf4c-02c5135f9d46	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-89e8-7cb508cbb2f9	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-0422-963287496597	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-39ca-cbaafaa9e3f2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-e255-4b47ed649399	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-daee-805eb56ff533	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-00b9-81ee8363770e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-cf5b-9f8f156f6ea3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-c09c-475f1027b0ae	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-5b51-a1da21cdf4ac	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-5033-43c7fbdfd4bc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-4faf-d9096880c7d8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-590b-90951f137f49	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-ace7-d6eb80fc9443	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-fbeb-2cb66f456b1f	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-7f58-127da235343d	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-c6f9-4cd11690e4cf	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-e4a4-ea1551d395be	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-33ae-7f45b1935cb1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-9866-45a50f93157a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-4c31-7fcee90c927b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-446e-54004afc3bf4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-d6fc-8e4667b0d09d	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-b1ad-f7ce2462d900	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-fe1c-8a3759276d70	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-d259-a906df215f7a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-b059-771ef46847af	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-9744-f189366eeb6d	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-936f-f60cf5d81e6c	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-c55e-18098f894402	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-7dc1-97530efc8171	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-aa7f-cb33a33b1118	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-fdca-f8dcdccc08ee	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-2e72-11008db7e01f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-fb5d-ea20e0eb1c50	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-c4b0-75b9a1e8ef78	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-de41-f52db0aa2d43	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-eda4-6b2422bdbc10	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-c6bc-c22bc4282e90	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-9ca0-2417f1d2b8db	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-8ca5-71258ae737b9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-3e5b-c528016bc51d	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-fa17-19f67a0a298e	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-9d16-84c0add56a26	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-65ba-ffaf7ae314a0	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-3e5c-f601208348f7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-dd29-f73f4a0eb9a8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-d80a-1c90504fdf33	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-dae1-f4ef78309489	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-2f7e-8ee5775913a2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-4522-572885c32d07	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-5343-4497ee371079	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-af64-206f50d09de8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-7d7e-f3f170f05e7e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-b924-7a3977ed7105	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-dd12-fc3d4994c34b	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-1674-33830228b1b0	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-caa6-c3f1d2f95e64	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-dc30-7f514fcefb09	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-a78d-aa4f7c6ae442	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-fec2-8969e4cf5f08	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-ad25-e3de8a1868b5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-4353-cb19e1d8c73d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-fa39-9e6cff3df3d4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-053a-5f49aca8a865	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-9cc5-d361213f6cce	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-26ab-7a8706729ccd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-9c2e-a0be1cdac71c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-ceb2-1b0dd2828b00	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-177f-f64a8c32c4f2	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-d358-403860693a21	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-be05-24255092371e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-9c7b-f69e882dce45	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-f186-f498da675363	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-af77-55513c930b85	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-5459-035580b9e3f6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-0d15-1c23b4256437	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-8767-14f76ff0887a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-eba6-3e37cc9f7b9e	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-df5e-2a7cb16e4d98	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-47e6-193834b14e8e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-6843-f559d2131281	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-504b-03ebd2dadf02	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-9175-47776fcd956a	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-71d4-1246e9fae608	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-2d0a-29f9270f7b3f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-25ec-910b5fb60698	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-bc90-f7b6c285a99a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-15bc-1578e425882f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-8914-d04d6f63bdb8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-b092-553b2203f6df	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-171f-cfe2b7cb3e98	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-e1c6-36ca83f91cfb	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-fd2c-e42c934e828f	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-f284-8df894f5c233	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-4d32-a36241721dd8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-8288-f55b76d12206	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-38d4-0a2eae6ca776	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-57b2-31fca1aac790	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-e982-59f8bc2bebec	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-6846-062f7f3de550	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-a12a-b9ed9b0b5d26	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-a81e-2f5ca16309c5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-a8cf-f70ea5441042	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-2402-709e888c36f6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-f741-73d2f1cd657f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-f9ff-070060034d13	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-ebaa-e7419645bf74	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-d46f-42cf8a9291d5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-c9a1-737958a06883	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-e740-69708ae86d7d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-3941-4b6de60cb139	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-b67b-890c86635a41	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-a9cf-856babe99d0f	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-4992-bea01f6276d7	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-190c-98a041be5cae	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-6f72-a2095dd4e8f9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-d674-1086e41c5e56	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-3eff-da001d721fb4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-d17a-2e79121ffb89	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-5e10-7caf9d1e9cea	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-7d6b-0b455ff679b1	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-7da7-acc81f3f4552	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-7878-d99ca7b9b8c0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-432c-0da6cf41e831	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-3315-799b7bc7e50f	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-ba91-c84a5f1744d6	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-4eb3-f93c993f3b47	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-5b86-57ee38019d75	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-92df-e12e83eaffbe	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-f077-4c23810068a7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-20e6-632fe2c86ad1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-8dcc-3c675baac602	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-cc9e-e2830e66fba7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-304b-e42ff7ec6457	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-3697-98d5ee35b747	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-a816-57223d4a0d19	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-754b-226dd3ee260f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-6abf-b0a383d5e669	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-0426-145675ffbb88	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-dca9-77083132bf50	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-88e6-37ccea7fb5cb	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-2bcc-92edf2737179	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-a452-c886fc641f76	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-7044-852bf2ce3c21	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-81c4-809ba54a03d3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-c058-1a4355f3c93f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-6572-770e5c2b0823	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-3288-4e43bc17413b	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-374e-a89aeb1508e0	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-f0c3-531c622901dd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-c929-7241320d2b18	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-1718-58ef583ef01d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-543b-e4f31aab7d06	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-aa2f-feb6000b7163	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-72ee-dc010f395724	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-983a-96488dd589b5	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-a317-0f5db2adf6f0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-4e29-1be42e5a0f6c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-a5c2-41e8db90772d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-59c4-844e1f6c4f09	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-5016-b3839cdc374c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-70c2-32366f543c03	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-8f57-a10935974e11	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-229a-3ef1f4531fbd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-205a-a2689d922289	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-c7ec-3360cdefdebd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-5af3-82fff601f5b3	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-dde0-5c7b5f5c5d2b	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-7fe3-17ad4d3cf409	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-f243-38e4fcb8aae5	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-de05-f411ed71e720	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-317a-dfe6196a2cdf	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-5200-4fe7e2349acd	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-a2ca-4d7230b0dab7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-659d-64dc1e69682a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-d94b-9d2a5838d0b3	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-674b-199790c89e5e	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-b5d4-b8ff8c10161e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-743f-57602a519f97	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-273c-5b62644a5c03	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-5722-8a6c6208a050	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-eb8a-a8aa33d7b4ab	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-82ca-fb98df3f4544	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-92dc-23f30168a53f	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-837e-2569b404d7cd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-5950-a23813e395ab	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-b157-3cd31498a898	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-fc01-beaa3414b878	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-32b5-753d9765091b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-5170-2454a37ced5f	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-4116-e33e263c9914	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-44d5-43df849fe411	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-7581-575efbc0e7c3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-ff14-318263e31c81	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-8a79-e60dd07310e8	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-5e0a-d110f7a9fd3a	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-266b-712d82687d2b	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-cf5c-e41fb79290cf	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-1c42-95e52c33be8b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-03aa-fe1c2aa15672	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-daf0-53d5cef78af8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-bba6-8259b4f880e3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-5e28-10ac61c7dc70	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-edb0-4fcfd157a5e4	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-3f21-cd70e5ed2bb2	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-9f80-db5014461d12	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-64bb-66a0333f5d5a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-9d5f-c05d2b134442	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-8e70-779242259622	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-f7d1-adeb17759d65	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-b8eb-1f7e9bbed1f6	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-5fb5-b10659531f9b	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-1b30-73c1362872a0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-9603-2e364b23eaf6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-d3ca-bd13df4e4f96	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-e810-2f18253f5e6e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-63c2-43ca6f8e995e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-dee9-51303256a4f4	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-2853-82933d935ef8	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-52ca-bae1543fb4be	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-1045-0d4db96e7044	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-862a-debb432be14a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-827a-921e91a94a1d	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-a79c-b0044fd13723	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-5571-60079fab8b20	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-a000-432217055554	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-0ac1-33a9f3347f0f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-1f73-2f04f22639ee	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-6d0e-348ae0867b9f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-a426-3f875b36f9f2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-4cb9-4d116d1032e2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-09c4-9787a49f0348	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-4163-898aab1271b0	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-f6e5-7c59602e765a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-a797-001444ad9d6f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-0b5e-6ff7dc14f760	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-8028-b874341d5e5e	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-3143-56cf0706ce01	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-caa7-bc286b178ddb	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-55a4-25be6ae71381	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-87b5-798b8143f522	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-0ac7-108f9b5d2533	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-b158-499ba5bc106b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-8a84-25ed79611774	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-5944-83bbb5bd2f00	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-45ee-54a7def8b95e	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-6c5e-a32f9d9fcbb0	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-5b79-4f8352fe46bd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-426f-6e5474385dc9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-f3cf-c83d8e5d3f39	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-8654-ca8266acac50	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-f6d9-386effd6a786	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-f341-895383ad200a	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-3de5-c3f5a5f6777f	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-40e4-51f8a9311ea0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-ea87-af67c738a2e3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-78bf-1a17ab6e2409	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-b043-b60352ca5c55	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-a2f7-7489e367010f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-6039-7992175f7bde	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-8e0d-3d73bd532193	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-84ba-0a070321f671	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-fc40-dd9beaa2bc7b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-3a1d-29990673e78f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-a0e1-1da21a84d8de	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-2401-2fa7059265b0	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-d220-624719bb1d4b	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-c3aa-e5930f570e80	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-520b-682028342526	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-3ff6-62135bc30a4a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-624f-8e31c52fe401	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-d9dc-cf9122e3c796	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-8eed-8d5bffc13b7a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-acc2-f04f2f54c011	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-59e3-6942d0e31ab7	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-2269-6475d711563d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-c022-4aaf3d880f2e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-5862-160cf41c5c84	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-8755-a2d60b30935f	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-a5ae-b9cf96db9f9d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-4427-882256ec824e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-9a2b-d2b97af2f924	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-c807-58b30174437f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-7a0e-668b0c85128a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-d58e-4086351f76da	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-99c9-739813db6440	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-d291-d8e7d0885ff8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-def6-6bb8005cb637	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-0a8f-143f5c56dbf9	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-b289-7b8dd2165572	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-81a8-c98be674adcd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-42d9-df52dba20771	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-631c-2ef405673d41	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-7c92-caf7ca37aefc	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-f286-c46c527604c0	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-f58c-5e6df7ef637c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-7142-731f3ddd4b65	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-0e29-caf96fa6d7fa	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-fad6-25a7c8b94b09	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-3448-1fe99f722e1d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-2c1f-25f9c18fdf7f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-b981-68519ef5d782	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-2167-98701b0a8182	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-c134-8100162fa3ad	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-44fe-94a78bf82450	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-a40f-85e418ae5bcf	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-7cfd-cba884bb9283	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-a852-c648e905dff6	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-00bd-cb894ff7afa9	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-1a73-7c64e61ba366	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-7226-c205a0b1e41a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-d69e-156c31d8907a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-7185-044c1c3c1227	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-a595-b220f9a7139c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-8fa4-31fb29b10230	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-43aa-342b515f9d13	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-e65d-cf88a7ecbca7	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-77ff-1d4df86542eb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-1b15-db2ee4f4554f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-afd5-596c00f54234	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-0850-1c8097e18fc6	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-0c4b-2ff18b7cbe2e	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-c372-1df36e8f32b0	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-13f8-1cd6434fb6ab	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-0582-690e89c4a211	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-394d-23b6fcaa4181	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-9c6a-871b1f95c1a7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-180a-0dc6af02bd6e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-85fc-0cbb75347d60	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-c642-047081e77b5b	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-917e-f44be9c95740	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-f8f0-61b564abe0b0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-5e54-5c8b412e8f07	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-7501-2f6215f2f0cb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-99bd-14cdc1f43abc	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-0182-ea2bd03cebde	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-332e-18bf0ffc20b6	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-d0bb-cdd82ca9217d	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-5a54-8e39a2a85d28	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-3aee-16bddcc0c480	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-1deb-d2d16c0dd5db	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-7e3d-6478570d6ff5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-979f-c9324bec2f94	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-0323-510b06948f50	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-3db9-84ba5fdfd1d8	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-7108-500417e01993	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-1071-c78bf18c180e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-bd2f-799e3100d004	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-2c01-b28d754e10a5	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-1914-4bc7883b27f4	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-92e9-6172f7c44d0b	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-0cf3-528c346a7c06	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-0d34-e1aab2df89e3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-5b5a-6e2cd2944fed	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-b7bd-f71f38d27f6f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-8577-77f2d8f514da	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-9dd4-976a4bcb0e49	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-fca1-fef14eacb8ca	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-61fd-1ce5a7eadd0b	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-7356-58d59315b405	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-982f-fcf77d99b3d6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-cac0-e85e5ad63a9e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-e7e4-ea429aceb82b	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-b6e0-7d968cb6a93d	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-0f85-e040d4ca27eb	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-7f0b-ddaa020c269c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-10ac-3c3488c638b5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-1901-6e57a0a14315	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-f322-e07db07215ab	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-c5b2-b9cb539b94b3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-cf19-e9a64e6fc9d6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-46d8-b0263b11567e	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-83eb-7e49fc6668f3	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-1b15-0f16ea9cca3e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-e479-5dd43927a03b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-729b-c9db42509a77	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-70ef-f29fd514cb05	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-7b21-a1a147451eba	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-64fe-29b8e082d8a2	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-a0dc-4dcdaa33267c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-84cb-ce4beeb851da	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-7bc1-cf99d2dc9c7c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-52e6-3ba9e7e02c3e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-af26-4ecfa98dfc08	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-c50c-da9f29c31ebf	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-b537-4711daeb11e8	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-66be-eece08ea33c9	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-5b66-04c0e2d9961d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-39a5-df585ce343e3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-f35f-8ddd75478f39	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-b5c0-0d2d1b0b96c1	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-d489-72d8c6c70609	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-ecb8-4ee2393a737a	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-32b9-0dd9b62a188c	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-635b-7911ca369b83	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-9942-87ee5b9c3ecd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-fb7d-c99947435046	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-5fa4-8a33aac795d9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-8928-58dda613aaae	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-7dbb-552e5da090dd	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-b43e-3ccc6b84cf90	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-6c76-e443a94cc573	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-9cc1-e7ff31d180c0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-4432-557fed420129	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-5bce-da022ef4e5cf	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-bd4a-92d64da1451c	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-9ff6-3ec3d5c9e9a0	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-c078-93dbf199df1a	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-4e51-ae60ce9d5d11	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-c1d4-afe093f63aa7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-7dc7-0915889b2063	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-2e73-1e725de84e29	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-24ea-9dcefd2e5c1a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-3e2f-824797705eb8	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-7094-0ad00b521caa	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-9206-b1fb933c94be	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-ef57-6c8266405c5a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-a21c-660e0dd89bcd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-bf13-b3235e921f12	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-211d-a9495c3c59d1	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-9847-afaab4b31673	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-fe0c-65b01009c4bb	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-ffe1-dfd688edfe24	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-2a47-9d3c44bb510f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-eb98-d3122b60fb87	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-4653-21ae5e9cdcbf	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-d1e2-aa590a1b586f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-afaa-d34191b97ea5	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-7824-00f5cba5602a	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-e654-12445fa995e9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-c953-a62b5d60c7cb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-5927-a28fd49ad1b5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-a73b-6aacb8e0360b	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-3ca9-5946de6c1e4a	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-0ecc-ad540a61cc31	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-8705-1d3813e9dae8	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-a8b8-41095c3192c1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-3a11-1188b129032b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-2f21-e068b21832b1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-9545-d24301396853	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-1c54-65b1950a4aac	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-e658-fe7b785974db	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-e264-47ef7a755892	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-36a9-23c6a3981e69	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-7079-482a8bc5734a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-e13c-b006d2b3186b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-5dc9-f3e8c9828756	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-406d-71e3643bbfa6	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-7a01-337434534528	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-e6db-4d061df43d5b	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-1f0a-4206d75f32b9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-dc57-a10d244641dd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-45b7-ec586708e905	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-bad2-52dea9bae4ba	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-af98-563b66778472	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-31f4-a2936f8b8cb0	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-2d38-7b99b4c9c789	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-6866-a7e07bcd76ee	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-39db-0c4409810d7f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-9f0e-6f9b650bdb65	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-9311-e96850ecf620	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-8736-5e18f37046b1	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-2734-f1db6283125e	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-2837-4d312700d6a4	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-b938-0486afca8986	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-6326-4e9fe8eb86c8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-2ecb-8d8f3971bdaf	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-82b7-b71b4a3407f6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-d6db-ff147b47b1b4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-79e2-990bddc045cc	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-75ff-1938c1960a95	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-e3fe-ea847576a9fa	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-6486-5346d56b894d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-9fd7-4e2a83998314	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-ff07-5b82489d9ceb	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-ba64-a365de06a524	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-8b63-3a15b54a9b81	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-01aa-4387d8e438b6	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-d71e-b75144716252	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-dbbb-e5dc63320a99	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-08c3-afafef36e1b6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-90b9-f203af5c170d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-5fbb-83127e5c78c9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-4a05-e6688781f397	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-12e3-5260d6062b1c	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-b35c-7339dd4e7a39	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-5989-a9ed2601d140	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-7c1a-c5217c7151ea	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-0015-76f54837777b	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-a156-bbf92295dda0	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-e7c3-12db118b48f8	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-7194-43652d8b6ef6	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-a4bd-a6e2197bd6ad	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-39e1-7b90564f6246	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-6c95-0d231da1fa21	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-3757-d354d28721ea	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-2be8-55afa090abba	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-b09d-89260a4260fb	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-f929-a8a6554fd8bd	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-01ad-0feee5a3b648	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-be8a-f89e48440eaf	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-3f92-44842be23f00	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-19b7-820f3fea3102	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-69dd-b7fd91fc85be	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-aeb9-6ccf7f8e7e1a	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-6432-6d3226011df2	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-3857-ec4cfd69b4ea	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-26d5-c2c4edfada08	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-34e2-b30e3d49b61e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-3ea2-4193236dbbf4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-6231-bc6030966639	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-84a5-61f6631373e7	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-1da2-42bb70fbee9a	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-383a-021734d7cae3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-c979-ce9ee41de99c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-9ccd-fdd71dd95fcd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-3b16-cf28dfe38a42	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-296f-bdd861aa35ac	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-a8ae-e160b0b983f8	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-46a2-0179abb42ad3	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-c819-33bae0a6f52c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-e7bd-45894e2ef099	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-08b9-dbfb2ee27cb4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-1231-963907500cc7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-7fcb-d052bef538e3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-d456-3fbd889a96ce	User-delete	Aaa - Uporabnik - Briši	f
00020000-553a-4f35-1b09-35099c1698e5	User-read	Aaa - Uporabnik - Beri	f
00020000-553a-4f35-d6c5-6c7b43ca9db8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-553a-4f35-e03e-a69cfb3d2ecf	User-create	Aaa - Uporabnik - Ustvari	f
00020000-553a-4f35-018d-67461396cf23	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-553a-4f35-ebee-b1ebfa23cdef	Role-delete	Aaa - Vloga - Briši	f
00020000-553a-4f35-82aa-b4adad9863ab	Role-read	Aaa - Vloga - Beri	f
00020000-553a-4f35-517c-6532e8c0819d	Role-update	Aaa - Vloga - Posodobi	f
00020000-553a-4f35-f147-2074ed8345fd	Role-create	Aaa - Vloga - Ustvari	f
00020000-553a-4f35-74d1-aa65da73ea56	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-553a-4f35-2548-1f9e53959e83	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-553a-4f35-df2b-90b8424f2e11	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-553a-4f35-6887-7b115fffb46c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-553a-4f35-8957-f1aeb09be39c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-553a-4f35-c03e-1b6fada76c68	Drzava-read	Seznam držav	f
00020000-553a-4f35-fbee-c6cc8efa7339	Drzava-write	Urejanje držav	f
00020000-553a-4f35-4e2d-828ff6970a8a	Popa-delete	Poslovni partner - Briši	f
00020000-553a-4f35-9621-e4fcb1d61c73	Popa-list	Poslovni partner - Beri	f
00020000-553a-4f35-b95b-00457afbb7c0	Popa-update	Poslovni partner - Posodobi	f
00020000-553a-4f35-2143-bbe907c335b0	Popa-create	Poslovni partner - Ustvari	f
00020000-553a-4f35-4d7a-7bb19ad52ea8	Posta-delete	Pošta - Briši	f
00020000-553a-4f35-7b80-70cf70773bbe	Posta-list	Pošta - Beri	f
00020000-553a-4f35-e2fd-9d573f8acb00	Posta-update	Pošta - Posodobi	f
00020000-553a-4f35-0b5f-0508f4f228bc	Posta-create	Pošta - Ustvari	f
00020000-553a-4f35-f977-b67bbf58f3fc	PostniNaslov-delete	Poštni naslov - Briši	f
00020000-553a-4f35-527b-6c7b6a1ec3b1	PostniNaslov-list	Poštni naslov - Beri	f
00020000-553a-4f35-d0b7-c660c4bf4533	PostniNaslov-update	Poštni naslov - Posodobi	f
00020000-553a-4f35-ec26-150eae997c10	PostniNaslov-create	Poštni naslov - Ustvari	f
\.


--
-- TOC entry 2635 (class 0 OID 1352919)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00000000-553a-4f36-7297-b8200d1f2953	00020000-553a-4f35-c03e-1b6fada76c68
00000000-553a-4f36-7297-b8200d1f2953	00020000-553a-4f35-0619-cf5a4da1b286
00000000-553a-4f36-967b-812516ba9934	00020000-553a-4f35-fbee-c6cc8efa7339
00000000-553a-4f36-967b-812516ba9934	00020000-553a-4f35-c03e-1b6fada76c68
\.


--
-- TOC entry 2663 (class 0 OID 1353208)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 1353238)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 1353350)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 1352978)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 1353020)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-553a-4f34-b031-c7bbc15a156c	8341	Adlešiči
00050000-553a-4f34-7507-aa0fdcce51ee	5270	Ajdovščina
00050000-553a-4f34-2b92-1f1419bbdf78	6280	Ankaran/Ancarano
00050000-553a-4f34-8e28-431bc008baa9	9253	Apače
00050000-553a-4f34-7130-915d5af23d44	8253	Artiče
00050000-553a-4f34-0b2e-53dc011c5c77	4275	Begunje na Gorenjskem
00050000-553a-4f34-a471-dbde4a82e96a	1382	Begunje pri Cerknici
00050000-553a-4f34-1d8e-2e4f57c9dcc7	9231	Beltinci
00050000-553a-4f34-3ff3-5e7087e21bd1	2234	Benedikt
00050000-553a-4f34-157f-100e604dbe6c	2345	Bistrica ob Dravi
00050000-553a-4f34-113a-291141e75815	3256	Bistrica ob Sotli
00050000-553a-4f34-7a79-cbb3dbec4133	8259	Bizeljsko
00050000-553a-4f34-72e0-8c04dbb0a83a	1223	Blagovica
00050000-553a-4f34-1832-6f4dbdd4fd97	8283	Blanca
00050000-553a-4f34-5f3b-4395c4ce84b7	4260	Bled
00050000-553a-4f34-672f-9fc1470c50a9	4273	Blejska Dobrava
00050000-553a-4f34-26c9-77055490027c	9265	Bodonci
00050000-553a-4f34-144d-a30b93200187	9222	Bogojina
00050000-553a-4f34-8a0e-3572aee2fe41	4263	Bohinjska Bela
00050000-553a-4f34-862d-5531ed6081f3	4264	Bohinjska Bistrica
00050000-553a-4f34-b437-b1b398526922	4265	Bohinjsko jezero
00050000-553a-4f34-3282-3cfcf6a65d3c	1353	Borovnica
00050000-553a-4f34-188b-9c97f734f22f	8294	Boštanj
00050000-553a-4f34-6371-09bc6697fc12	5230	Bovec
00050000-553a-4f34-208d-b503f4176e10	5295	Branik
00050000-553a-4f34-afe1-6ef10992046f	3314	Braslovče
00050000-553a-4f34-dd33-d52b805e18ac	5223	Breginj
00050000-553a-4f34-1229-cf881419cbf5	8280	Brestanica
00050000-553a-4f34-68f0-b2aa9e5354d7	2354	Bresternica
00050000-553a-4f34-1793-1f745b75c5c3	4243	Brezje
00050000-553a-4f34-1b38-57df3b7f5d4b	1351	Brezovica pri Ljubljani
00050000-553a-4f34-ec55-f5f9b9466948	8250	Brežice
00050000-553a-4f34-8b1a-6285c9fe1564	4210	Brnik - Aerodrom
00050000-553a-4f34-3b35-7934a1bc2081	8321	Brusnice
00050000-553a-4f34-68bc-e1dc7513abf6	3255	Buče
00050000-553a-4f34-2016-851ae95a48bf	8276	Bučka 
00050000-553a-4f34-189a-191cac851e35	9261	Cankova
00050000-553a-4f34-0f02-70755c7707b7	3000	Celje 
00050000-553a-4f34-3b4f-3cd27762d754	3001	Celje - poštni predali
00050000-553a-4f34-ddd3-be9ea25e9feb	4207	Cerklje na Gorenjskem
00050000-553a-4f34-370b-7f298499c92a	8263	Cerklje ob Krki
00050000-553a-4f34-5b08-e7549e0e2678	1380	Cerknica
00050000-553a-4f34-972e-df87e6fd64f3	5282	Cerkno
00050000-553a-4f34-4ad5-003ec6636201	2236	Cerkvenjak
00050000-553a-4f34-46f3-767ec2ea2e42	2215	Ceršak
00050000-553a-4f34-ee83-d5ba1de031ef	2326	Cirkovce
00050000-553a-4f34-a975-829a5221e8e4	2282	Cirkulane
00050000-553a-4f34-3f9d-6773e8130cde	5273	Col
00050000-553a-4f34-3aa3-1021f6769369	8251	Čatež ob Savi
00050000-553a-4f34-1df2-be3160c1aa0a	1413	Čemšenik
00050000-553a-4f34-ecd7-c7a3655c2801	5253	Čepovan
00050000-553a-4f34-c92f-7ae1ee87c1c9	9232	Črenšovci
00050000-553a-4f34-d8dc-82d35cd82541	2393	Črna na Koroškem
00050000-553a-4f34-06de-622dce70839f	6275	Črni Kal
00050000-553a-4f34-fb6e-52228942d6e4	5274	Črni Vrh nad Idrijo
00050000-553a-4f34-d0db-cacaefafcb28	5262	Črniče
00050000-553a-4f34-d012-399adcb4f981	8340	Črnomelj
00050000-553a-4f34-991c-160fc388ae95	6271	Dekani
00050000-553a-4f34-f447-c18cdf63279e	5210	Deskle
00050000-553a-4f34-01b6-964bdbd13d99	2253	Destrnik
00050000-553a-4f34-acb9-b79eadbfc15c	6215	Divača
00050000-553a-4f34-19d6-17cfa0213ffc	1233	Dob
00050000-553a-4f34-fc3f-d73cf05bec53	3224	Dobje pri Planini
00050000-553a-4f34-2e53-1964869067a4	8257	Dobova
00050000-553a-4f34-592e-a6c89ccde1d8	1423	Dobovec
00050000-553a-4f34-2983-16c7255d734a	5263	Dobravlje
00050000-553a-4f34-dd35-23aa90712374	3204	Dobrna
00050000-553a-4f34-993a-1732f6e26708	8211	Dobrnič
00050000-553a-4f34-b1cb-bcce1e4ee2a6	1356	Dobrova
00050000-553a-4f34-f951-ea04162bffda	9223	Dobrovnik/Dobronak 
00050000-553a-4f34-7dd7-a8338b7b7d89	5212	Dobrovo v Brdih
00050000-553a-4f34-ccd3-f791c90ce61e	1431	Dol pri Hrastniku
00050000-553a-4f34-758a-73de477bb146	1262	Dol pri Ljubljani
00050000-553a-4f34-e6ca-31aebbb6edfb	1273	Dole pri Litiji
00050000-553a-4f34-498f-5e2a54ec25aa	1331	Dolenja vas
00050000-553a-4f34-5192-cf9e15abd84a	8350	Dolenjske Toplice
00050000-553a-4f34-8a06-d1d4ed66a314	1230	Domžale
00050000-553a-4f34-1e79-1b40cf127f15	2252	Dornava
00050000-553a-4f34-bde7-a7b0636db1d7	5294	Dornberk
00050000-553a-4f34-3109-bcc3c423c967	1319	Draga
00050000-553a-4f34-ec8d-6fd4bb2ec84c	8343	Dragatuš
00050000-553a-4f34-0000-d48258e437b3	3222	Dramlje
00050000-553a-4f34-cd1e-51a9f786dd29	2370	Dravograd
00050000-553a-4f34-84e7-5e7727456511	4203	Duplje
00050000-553a-4f34-f518-8ca753fa6e09	6221	Dutovlje
00050000-553a-4f34-2226-4a69e7bcdc2b	8361	Dvor
00050000-553a-4f34-e171-eb5a0409b35f	2343	Fala
00050000-553a-4f34-24b9-4641c756626b	9208	Fokovci
00050000-553a-4f34-1fd1-613e65dde80a	2313	Fram
00050000-553a-4f34-4c99-a6ab090b064b	3213	Frankolovo
00050000-553a-4f34-a627-b8763838d1c2	1274	Gabrovka
00050000-553a-4f34-c3e7-da20d1ca5d64	8254	Globoko
00050000-553a-4f34-2d43-34e809dce7d6	5275	Godovič
00050000-553a-4f34-cf08-da80a3546d8d	4204	Golnik
00050000-553a-4f34-f5a2-5564820d2f15	3303	Gomilsko
00050000-553a-4f34-34bf-e22ef41091d7	4224	Gorenja vas
00050000-553a-4f34-7b0f-cbb13d55a2b1	3263	Gorica pri Slivnici
00050000-553a-4f34-31da-43a2c7d4ec4f	2272	Gorišnica
00050000-553a-4f34-9dc7-fe9d25620318	9250	Gornja Radgona
00050000-553a-4f34-6e7f-b121475705b6	3342	Gornji Grad
00050000-553a-4f34-82ab-7053535e1d1f	4282	Gozd Martuljek
00050000-553a-4f34-036c-987174ae6116	6272	Gračišče
00050000-553a-4f34-7a4a-1266b58195d8	9264	Grad
00050000-553a-4f34-c0fe-322333021bcf	8332	Gradac
00050000-553a-4f34-fa64-2887ad3ca8ee	1384	Grahovo
00050000-553a-4f34-6630-a7d4e0b9e269	5242	Grahovo ob Bači
00050000-553a-4f34-9f04-eee11f112599	5251	Grgar
00050000-553a-4f34-90b9-fbb0ae0772df	3302	Griže
00050000-553a-4f34-32f6-2e810255dc8f	3231	Grobelno
00050000-553a-4f34-e2ed-5d8be42cdf92	1290	Grosuplje
00050000-553a-4f34-57eb-0cb9e05d0e06	2288	Hajdina
00050000-553a-4f34-1011-f2dc2aae6ee0	8362	Hinje
00050000-553a-4f34-59fc-63634dd87bfd	2311	Hoče
00050000-553a-4f34-2c36-1fe9c10a89e8	9205	Hodoš/Hodos
00050000-553a-4f34-a5c4-2113387bc4d0	1354	Horjul
00050000-553a-4f34-7e79-80ce13e5f75a	1372	Hotedršica
00050000-553a-4f34-1673-b907e4c85135	1430	Hrastnik
00050000-553a-4f34-4392-7c8b38819486	6225	Hruševje
00050000-553a-4f34-46a6-d2b32cde7c80	4276	Hrušica
00050000-553a-4f34-8b84-7cc33972f15e	5280	Idrija
00050000-553a-4f34-9f7a-f0711c957d5b	1292	Ig
00050000-553a-4f34-3f19-5f496ad798ed	6250	Ilirska Bistrica
00050000-553a-4f34-7df4-afca81fa701c	6251	Ilirska Bistrica-Trnovo
00050000-553a-4f34-1918-5b0c565f23da	1295	Ivančna Gorica
00050000-553a-4f34-2fae-bf19813bbf36	2259	Ivanjkovci
00050000-553a-4f34-80a8-e2c27d36205b	1411	Izlake
00050000-553a-4f34-2666-cb63183fd7d0	6310	Izola/Isola
00050000-553a-4f34-3a21-59f37918bb31	2222	Jakobski Dol
00050000-553a-4f34-3c6a-a196e0d395be	2221	Jarenina
00050000-553a-4f34-81c9-8106eae26049	6254	Jelšane
00050000-553a-4f34-a312-1e841412f719	4270	Jesenice
00050000-553a-4f34-33ca-50607ac4b061	8261	Jesenice na Dolenjskem
00050000-553a-4f34-17b2-dc63cff235ea	3273	Jurklošter
00050000-553a-4f34-37f1-a8f493726cf4	2223	Jurovski Dol
00050000-553a-4f34-3d81-0d88f589e5b6	2256	Juršinci
00050000-553a-4f34-e0e5-0da01b5a3bc8	5214	Kal nad Kanalom
00050000-553a-4f34-1153-8736c6df124a	3233	Kalobje
00050000-553a-4f34-681d-cd3f408f4bfd	4246	Kamna Gorica
00050000-553a-4f34-848d-2c0e783f3803	2351	Kamnica
00050000-553a-4f34-2f2d-511f2fcf221e	1241	Kamnik
00050000-553a-4f34-88f0-7facbf4b4d5a	5213	Kanal
00050000-553a-4f34-0d57-42a0bc283b02	8258	Kapele
00050000-553a-4f34-083f-211a627fd50b	2362	Kapla
00050000-553a-4f34-2141-4b23275edf93	2325	Kidričevo
00050000-553a-4f34-98d7-ef78bf612c93	1412	Kisovec
00050000-553a-4f34-918a-a4d9de8e5442	6253	Knežak
00050000-553a-4f34-59ba-6f37d0ecf9bd	5222	Kobarid
00050000-553a-4f34-88be-bf0ab33021e9	9227	Kobilje
00050000-553a-4f34-2bac-af2336e78b6f	1330	Kočevje
00050000-553a-4f34-b157-3d5e6ede6d78	1338	Kočevska Reka
00050000-553a-4f34-4402-67649a162d73	2276	Kog
00050000-553a-4f34-a4ad-67427910842c	5211	Kojsko
00050000-553a-4f34-8579-62ea68ef27fe	6223	Komen
00050000-553a-4f34-1ed1-d530b9a92ecc	1218	Komenda
00050000-553a-4f34-7ba9-60e2b45f6edc	6000	Koper/Capodistria 
00050000-553a-4f34-9709-1215544577fe	6001	Koper/Capodistria - poštni predali
00050000-553a-4f34-f307-bb46146adf5d	8282	Koprivnica
00050000-553a-4f34-f015-8c8e486e49dc	5296	Kostanjevica na Krasu
00050000-553a-4f34-1c7b-08c8c3d915bb	8311	Kostanjevica na Krki
00050000-553a-4f34-6c5f-740f5ad344f7	1336	Kostel
00050000-553a-4f34-9564-764e922751f7	6256	Košana
00050000-553a-4f34-f622-32998e48fabc	2394	Kotlje
00050000-553a-4f34-ef0b-a55dde86ec4e	6240	Kozina
00050000-553a-4f34-3235-1e3c4ab2aa0a	3260	Kozje
00050000-553a-4f34-44d7-0de2f7ec43c1	4000	Kranj 
00050000-553a-4f34-db1b-692a3515324d	4001	Kranj - poštni predali
00050000-553a-4f34-d2a4-d845beb2823f	4280	Kranjska Gora
00050000-553a-4f34-804b-b834d2e2075d	1281	Kresnice
00050000-553a-4f34-0921-7718bafc6be9	4294	Križe
00050000-553a-4f34-b602-3216bee9c792	9206	Križevci
00050000-553a-4f34-8186-cdca97730b0a	9242	Križevci pri Ljutomeru
00050000-553a-4f34-cf39-ba8fad579857	1301	Krka
00050000-553a-4f34-adba-6a84e921c55f	8296	Krmelj
00050000-553a-4f34-8c26-23820f188020	4245	Kropa
00050000-553a-4f34-6e11-b76854d7fe1b	8262	Krška vas
00050000-553a-4f34-7fe6-80aa52e66d54	8270	Krško
00050000-553a-4f34-0830-e39d08c2f203	9263	Kuzma
00050000-553a-4f34-1bc7-cb153e4e67ef	2318	Laporje
00050000-553a-4f34-eed8-d17e9d20449a	3270	Laško
00050000-553a-4f34-0442-92832aec0f0b	1219	Laze v Tuhinju
00050000-553a-4f34-01cc-576f3d34085c	2230	Lenart v Slovenskih goricah
00050000-553a-4f34-7e57-84d9e21f08f5	9220	Lendava/Lendva
00050000-553a-4f34-7fc3-0e8848f23d51	4248	Lesce
00050000-553a-4f34-723d-56f460610eb9	3261	Lesično
00050000-553a-4f34-d192-76a3807bd8fe	8273	Leskovec pri Krškem
00050000-553a-4f34-bfcc-a8964181435b	2372	Libeliče
00050000-553a-4f34-843b-6d4cc50ea723	2341	Limbuš
00050000-553a-4f34-ce00-3207a23ddada	1270	Litija
00050000-553a-4f34-b72d-01c1eba24ca6	3202	Ljubečna
00050000-553a-4f34-ff03-b62da30847b8	1000	Ljubljana 
00050000-553a-4f34-025b-52063823ee48	1001	Ljubljana - poštni predali
00050000-553a-4f34-67cc-40c304c66e25	1231	Ljubljana - Črnuče
00050000-553a-4f34-5ee7-15d53ee64086	1261	Ljubljana - Dobrunje
00050000-553a-4f34-913a-5e0edc90f703	1260	Ljubljana - Polje
00050000-553a-4f34-0ac9-0d857d802e08	1210	Ljubljana - Šentvid
00050000-553a-4f34-47e4-39489e5211f9	1211	Ljubljana - Šmartno
00050000-553a-4f34-2e8f-37e6ed0c10b4	3333	Ljubno ob Savinji
00050000-553a-4f34-2d8c-a83b079af03f	9240	Ljutomer
00050000-553a-4f34-f64e-ec4b97d77962	3215	Loče
00050000-553a-4f34-1e37-e060c46b98c7	5231	Log pod Mangartom
00050000-553a-4f34-808a-f18e5badbb8f	1358	Log pri Brezovici
00050000-553a-4f34-fba0-64f67edccb80	1370	Logatec
00050000-553a-4f34-ac7e-9d95fdf9c1e4	1371	Logatec
00050000-553a-4f34-e4b2-a975b4bc5439	1434	Loka pri Zidanem Mostu
00050000-553a-4f34-9080-da1220a6b0da	3223	Loka pri Žusmu
00050000-553a-4f34-8490-24aa56a1df57	6219	Lokev
00050000-553a-4f34-b5cc-1edd57902511	1318	Loški Potok
00050000-553a-4f34-a274-21869d8cbdcf	2324	Lovrenc na Dravskem polju
00050000-553a-4f34-aab1-d6acdae1ea1c	2344	Lovrenc na Pohorju
00050000-553a-4f34-6cca-bce635d0a9d2	3334	Luče
00050000-553a-4f34-94ba-01c88a63e58a	1225	Lukovica
00050000-553a-4f34-bca1-db7b498e3cde	9202	Mačkovci
00050000-553a-4f34-71c3-e95e5567a833	2322	Majšperk
00050000-553a-4f34-8d91-662ccf18cbf5	2321	Makole
00050000-553a-4f34-3746-083f84af18b0	9243	Mala Nedelja
00050000-553a-4f34-f859-bef534df569e	2229	Malečnik
00050000-553a-4f34-6d0b-347b37c57286	6273	Marezige
00050000-553a-4f34-2726-2a3d70a12792	2000	Maribor 
00050000-553a-4f34-d3f1-9965b27e4be5	2001	Maribor - poštni predali
00050000-553a-4f34-65f4-ea402107bef5	2206	Marjeta na Dravskem polju
00050000-553a-4f34-e173-c7adeaf478a1	2281	Markovci
00050000-553a-4f34-564c-556d65d22ba5	9221	Martjanci
00050000-553a-4f34-6bd5-77b3007bc81c	6242	Materija
00050000-553a-4f34-083d-1f11bf47bbf1	4211	Mavčiče
00050000-553a-4f34-1f35-376c4e9d87bf	1215	Medvode
00050000-553a-4f34-f652-c1905f96e2ac	1234	Mengeš
00050000-553a-4f34-6c90-b02d9b055651	8330	Metlika
00050000-553a-4f34-9b5c-1a535cdb2716	2392	Mežica
00050000-553a-4f34-19a3-467bd337c6ee	2204	Miklavž na Dravskem polju
00050000-553a-4f34-5122-37337fa0cf53	2275	Miklavž pri Ormožu
00050000-553a-4f34-e0ec-b572419df4fd	5291	Miren
00050000-553a-4f34-1275-bc743e0ed4ca	8233	Mirna
00050000-553a-4f34-b7b8-e33b07ea407e	8216	Mirna Peč
00050000-553a-4f34-6063-7df2df68959e	2382	Mislinja
00050000-553a-4f34-42f7-a04b8f29c02b	4281	Mojstrana
00050000-553a-4f34-fb78-eaac9901b5eb	8230	Mokronog
00050000-553a-4f34-e0ca-959147a15185	1251	Moravče
00050000-553a-4f34-ff19-e84841464453	9226	Moravske Toplice
00050000-553a-4f34-3f2b-58a59d00c2b3	5216	Most na Soči
00050000-553a-4f34-0c35-678248fa5d1e	1221	Motnik
00050000-553a-4f34-6a1f-bb1efcd12f2a	3330	Mozirje
00050000-553a-4f34-ca2c-7d07f4b0a149	9000	Murska Sobota 
00050000-553a-4f34-36be-c944ab3c5af4	9001	Murska Sobota - poštni predali
00050000-553a-4f34-5778-fcb0d9d56d03	2366	Muta
00050000-553a-4f34-4ee1-f45989f9fb25	4202	Naklo
00050000-553a-4f34-cadd-b358386b5e74	3331	Nazarje
00050000-553a-4f34-206f-41bdd6aa0cd2	1357	Notranje Gorice
00050000-553a-4f34-f986-e8281152e2b0	3203	Nova Cerkev
00050000-553a-4f34-22ba-2576d96bc6cf	5000	Nova Gorica 
00050000-553a-4f34-3d2f-604eb85acd3c	5001	Nova Gorica - poštni predali
00050000-553a-4f34-6a90-28786503f526	1385	Nova vas
00050000-553a-4f34-539e-558b7759e65c	8000	Novo mesto
00050000-553a-4f34-fd2f-e58b9ccc9965	8001	Novo mesto - poštni predali
00050000-553a-4f34-02b0-c6580407d34c	6243	Obrov
00050000-553a-4f34-f3cb-18d4da9d2cd4	9233	Odranci
00050000-553a-4f34-b802-a389a37351ed	2317	Oplotnica
00050000-553a-4f34-3338-610a81988084	2312	Orehova vas
00050000-553a-4f34-95c8-a9c4b961133a	2270	Ormož
00050000-553a-4f34-8a9f-2909ed75d5f7	1316	Ortnek
00050000-553a-4f34-4e92-e3ea62609600	1337	Osilnica
00050000-553a-4f34-ce7e-45a874ed5252	8222	Otočec
00050000-553a-4f34-1007-cb1b1fbae372	2361	Ožbalt
00050000-553a-4f34-9323-0d874238c08e	2231	Pernica
00050000-553a-4f34-c100-cbda827a80bc	2211	Pesnica pri Mariboru
00050000-553a-4f34-ac74-96b100041e21	9203	Petrovci
00050000-553a-4f34-0222-86e17afb4764	3301	Petrovče
00050000-553a-4f34-4a65-a46efcc8afc8	6330	Piran/Pirano
00050000-553a-4f34-7973-c13940eb725c	8255	Pišece
00050000-553a-4f34-0af5-f5b2f8fa51b3	6257	Pivka
00050000-553a-4f34-6987-eef2f3a24409	6232	Planina
00050000-553a-4f34-bc70-5dc25c78a9d8	3225	Planina pri Sevnici
00050000-553a-4f34-10eb-a96b2c29e8d0	6276	Pobegi
00050000-553a-4f34-0caf-1c32e3bdf56a	8312	Podbočje
00050000-553a-4f34-b67f-97f4cacde4aa	5243	Podbrdo
00050000-553a-4f34-fbc9-c772a51f64b7	3254	Podčetrtek
00050000-553a-4f34-ea4d-b7b51b3be6b0	2273	Podgorci
00050000-553a-4f34-edec-4269a36f2de3	6216	Podgorje
00050000-553a-4f34-05a6-4ade5b63da23	2381	Podgorje pri Slovenj Gradcu
00050000-553a-4f34-5087-31821cd26503	6244	Podgrad
00050000-553a-4f34-086f-fa16eb380e4b	1414	Podkum
00050000-553a-4f34-282a-fc4c63c1bbfb	2286	Podlehnik
00050000-553a-4f34-406c-787847e2b9a0	5272	Podnanos
00050000-553a-4f34-d9c8-13143d0e0063	4244	Podnart
00050000-553a-4f34-0b19-f0d9b63b311f	3241	Podplat
00050000-553a-4f34-2263-6fbe2f61bf4d	3257	Podsreda
00050000-553a-4f34-ce25-3f313f817b66	2363	Podvelka
00050000-553a-4f34-48d8-57d9b531c52c	2208	Pohorje
00050000-553a-4f34-0e03-8a81e1194ef0	2257	Polenšak
00050000-553a-4f34-2248-2357789f186a	1355	Polhov Gradec
00050000-553a-4f34-d1b8-e93b089217da	4223	Poljane nad Škofjo Loko
00050000-553a-4f34-196d-bff43af21aa3	2319	Poljčane
00050000-553a-4f34-e2cf-e701d0b2b76f	1272	Polšnik
00050000-553a-4f34-98cb-e2e07e0fb369	3313	Polzela
00050000-553a-4f34-6e3a-f86a722165bc	3232	Ponikva
00050000-553a-4f34-e13e-a99402dacd92	6320	Portorož/Portorose
00050000-553a-4f34-3a7f-f545fa777022	6230	Postojna
00050000-553a-4f34-ade5-1119ec4c5ac0	2331	Pragersko
00050000-553a-4f34-c9d4-183436f66a51	3312	Prebold
00050000-553a-4f34-bae6-b0b80efaf089	4205	Preddvor
00050000-553a-4f34-79b1-c169c563daf7	6255	Prem
00050000-553a-4f34-5282-963ff9c1d777	1352	Preserje
00050000-553a-4f34-ed86-8a600364345f	6258	Prestranek
00050000-553a-4f34-e596-be40fb9ed7f4	2391	Prevalje
00050000-553a-4f34-c1ae-a660011851db	3262	Prevorje
00050000-553a-4f34-eea1-63101497df24	1276	Primskovo 
00050000-553a-4f34-6582-03c2541af72c	3253	Pristava pri Mestinju
00050000-553a-4f34-c1c0-c852a059c4b7	9207	Prosenjakovci/Partosfalva
00050000-553a-4f34-115e-ab2eafe8e571	5297	Prvačina
00050000-553a-4f34-5ad9-90ec4ccabd2d	2250	Ptuj
00050000-553a-4f34-79cc-cf9eb701be15	2323	Ptujska Gora
00050000-553a-4f34-9754-38fe27da467e	9201	Puconci
00050000-553a-4f34-a5d0-592048aa2bae	2327	Rače
00050000-553a-4f34-5cc7-7ca9d0f61acc	1433	Radeče
00050000-553a-4f34-96e2-794eb8ecc2c7	9252	Radenci
00050000-553a-4f34-69ca-9091915dfbcd	2360	Radlje ob Dravi
00050000-553a-4f34-b46b-50c208c07d18	1235	Radomlje
00050000-553a-4f34-0468-64bcbf89336e	4240	Radovljica
00050000-553a-4f34-98a8-4885d438468a	8274	Raka
00050000-553a-4f34-21a9-b0c47ecd0f89	1381	Rakek
00050000-553a-4f34-e581-1a9c207c581e	4283	Rateče - Planica
00050000-553a-4f34-1319-6f8b0173ca34	2390	Ravne na Koroškem
00050000-553a-4f34-2f7c-e9776df4c792	9246	Razkrižje
00050000-553a-4f34-6ee5-302a48532a85	3332	Rečica ob Savinji
00050000-553a-4f34-86d0-56872fbf5328	5292	Renče
00050000-553a-4f34-0da0-d9877f451373	1310	Ribnica
00050000-553a-4f34-4340-5eae22a9a067	2364	Ribnica na Pohorju
00050000-553a-4f34-256d-a168a4799dd0	3272	Rimske Toplice
00050000-553a-4f34-f8f2-5d3a107810d8	1314	Rob
00050000-553a-4f34-d1c7-cb7b55e895f2	5215	Ročinj
00050000-553a-4f34-c217-f3907e0de931	3250	Rogaška Slatina
00050000-553a-4f34-a431-6356acfbd60c	9262	Rogašovci
00050000-553a-4f34-4861-16f7f4e973cc	3252	Rogatec
00050000-553a-4f34-07b0-babeb7ae9b54	1373	Rovte
00050000-553a-4f34-4497-b1ca3febba5e	2342	Ruše
00050000-553a-4f34-817c-946d93b228be	1282	Sava
00050000-553a-4f34-2227-ee9932131045	6333	Sečovlje/Sicciole
00050000-553a-4f34-8d76-84b495de3b2f	4227	Selca
00050000-553a-4f34-b333-fd9041a053e3	2352	Selnica ob Dravi
00050000-553a-4f34-68be-067100b74ee7	8333	Semič
00050000-553a-4f34-33ec-0cb9923eb159	8281	Senovo
00050000-553a-4f34-50fa-45552bb19504	6224	Senožeče
00050000-553a-4f34-3348-dd2fdeeb5b4a	8290	Sevnica
00050000-553a-4f34-85cf-d5c576f32c59	6210	Sežana
00050000-553a-4f34-6605-bf242d14a223	2214	Sladki Vrh
00050000-553a-4f34-5ba5-91f44d1940b6	5283	Slap ob Idrijci
00050000-553a-4f34-8c1f-16da9edcc70a	2380	Slovenj Gradec
00050000-553a-4f34-0539-09d6d6bcee96	2310	Slovenska Bistrica
00050000-553a-4f34-a4ae-ea85d15ac859	3210	Slovenske Konjice
00050000-553a-4f34-7f73-ca9e15efc729	1216	Smlednik
00050000-553a-4f34-86d8-50a0d033bdb0	5232	Soča
00050000-553a-4f34-d6db-2385ef146ad3	1317	Sodražica
00050000-553a-4f34-2b07-c276326bf8d6	3335	Solčava
00050000-553a-4f34-6756-1f4f8641767d	5250	Solkan
00050000-553a-4f34-48f4-5d89d46e674b	4229	Sorica
00050000-553a-4f34-0ca1-1bf7496fb3fd	4225	Sovodenj
00050000-553a-4f34-26f3-fdc110b437a8	5281	Spodnja Idrija
00050000-553a-4f34-dcb4-2ee5a8f1e060	2241	Spodnji Duplek
00050000-553a-4f34-2973-770e148d1037	9245	Spodnji Ivanjci
00050000-553a-4f34-1324-314d3b03574a	2277	Središče ob Dravi
00050000-553a-4f34-a482-a2827d293f24	4267	Srednja vas v Bohinju
00050000-553a-4f34-91bd-6664bde3ad75	8256	Sromlje 
00050000-553a-4f34-eebb-6cb403ab5880	5224	Srpenica
00050000-553a-4f34-6bf4-fa47f49d5ae2	1242	Stahovica
00050000-553a-4f34-4d49-3dbc4b95ca38	1332	Stara Cerkev
00050000-553a-4f34-a220-2399084bee0b	8342	Stari trg ob Kolpi
00050000-553a-4f34-8e26-f88fa6219f34	1386	Stari trg pri Ložu
00050000-553a-4f34-3c6b-dd8f8d4b4194	2205	Starše
00050000-553a-4f34-5fc3-8a90fc907e01	2289	Stoperce
00050000-553a-4f34-47ee-2455e253ae50	8322	Stopiče
00050000-553a-4f34-f116-0f25640a9a7a	3206	Stranice
00050000-553a-4f34-5a83-a825f361631c	8351	Straža
00050000-553a-4f34-18a4-1857b2fef2e7	1313	Struge
00050000-553a-4f34-7908-e03ef44b65a7	8293	Studenec
00050000-553a-4f34-deec-6dc812f95363	8331	Suhor
00050000-553a-4f34-7e23-595f5e073913	2233	Sv. Ana v Slovenskih goricah
00050000-553a-4f34-8d3c-76e126c124cf	2235	Sv. Trojica v Slovenskih goricah
00050000-553a-4f34-4fe8-4a4a0073314d	2353	Sveti Duh na Ostrem Vrhu
00050000-553a-4f34-bef9-23acf20d4a1b	9244	Sveti Jurij ob Ščavnici
00050000-553a-4f34-0124-fdd79df29725	3264	Sveti Štefan
00050000-553a-4f34-9b85-39201b1bbea2	2258	Sveti Tomaž
00050000-553a-4f34-6d61-d1c7d0b1358a	9204	Šalovci
00050000-553a-4f34-cd76-91604c85da97	5261	Šempas
00050000-553a-4f34-d484-148ec3713694	5290	Šempeter pri Gorici
00050000-553a-4f34-7046-307241d25b34	3311	Šempeter v Savinjski dolini
00050000-553a-4f34-fb90-cf88b55ae12d	4208	Šenčur
00050000-553a-4f34-9249-67da9210270f	2212	Šentilj v Slovenskih goricah
00050000-553a-4f34-498e-ea43c1300e4e	8297	Šentjanž
00050000-553a-4f34-aa66-d2c73076779f	2373	Šentjanž pri Dravogradu
00050000-553a-4f34-e91e-71cb0961c674	8310	Šentjernej
00050000-553a-4f34-fc7a-4100eefc3394	3230	Šentjur
00050000-553a-4f34-6771-348976bb2ae8	3271	Šentrupert
00050000-553a-4f34-b7d6-f6b81cce6a29	8232	Šentrupert
00050000-553a-4f34-cce3-e6a2f6b41836	1296	Šentvid pri Stični
00050000-553a-4f34-ee3e-6f92c7fd2f80	8275	Škocjan
00050000-553a-4f34-4a21-0c7c65c28aba	6281	Škofije
00050000-553a-4f34-6633-b28f654f00f2	4220	Škofja Loka
00050000-553a-4f34-b983-aa467da1b631	3211	Škofja vas
00050000-553a-4f34-9f5b-343ff3f6284e	1291	Škofljica
00050000-553a-4f34-6616-d347636ffb18	6274	Šmarje
00050000-553a-4f34-5751-8fd1c76ecf9b	1293	Šmarje - Sap
00050000-553a-4f34-ea5c-34d1e6391f18	3240	Šmarje pri Jelšah
00050000-553a-4f34-7867-193cc613dbd4	8220	Šmarješke Toplice
00050000-553a-4f34-e4fc-8ea4f7150bb8	2315	Šmartno na Pohorju
00050000-553a-4f34-e78d-f6115b923d2b	3341	Šmartno ob Dreti
00050000-553a-4f34-9727-ea50fcb999bd	3327	Šmartno ob Paki
00050000-553a-4f34-d46a-c2be7e9690a9	1275	Šmartno pri Litiji
00050000-553a-4f34-ef0f-4a01555bc303	2383	Šmartno pri Slovenj Gradcu
00050000-553a-4f34-c9ef-f1ba38580424	3201	Šmartno v Rožni dolini
00050000-553a-4f34-79d0-225ef7ba72a2	3325	Šoštanj
00050000-553a-4f34-6c92-f6f88290d1a4	6222	Štanjel
00050000-553a-4f34-bc1d-65334559be8e	3220	Štore
00050000-553a-4f34-869a-e7ea0be8b22e	3304	Tabor
00050000-553a-4f34-d3e5-d32d0ffa4a7e	3221	Teharje
00050000-553a-4f34-f799-6b8b911f6651	9251	Tišina
00050000-553a-4f34-87cb-2077c8ec4b1b	5220	Tolmin
00050000-553a-4f34-93fb-dc2b5d9746a9	3326	Topolšica
00050000-553a-4f34-b27c-e767a0958848	2371	Trbonje
00050000-553a-4f34-d14d-246d55d5b8dd	1420	Trbovlje
00050000-553a-4f34-d4fa-1ebd40246258	8231	Trebelno 
00050000-553a-4f34-cbb8-c47333d789c6	8210	Trebnje
00050000-553a-4f34-2fa7-a2f48c5274d5	5252	Trnovo pri Gorici
00050000-553a-4f34-2549-31f7238cc28a	2254	Trnovska vas
00050000-553a-4f34-5c55-f23265545ee9	1222	Trojane
00050000-553a-4f34-dc26-9de3eb4a3da7	1236	Trzin
00050000-553a-4f34-5aa1-3a1a44e391b4	4290	Tržič
00050000-553a-4f34-303c-bc099bb3b54c	8295	Tržišče
00050000-553a-4f34-9bdb-dc0c57728962	1311	Turjak
00050000-553a-4f34-9d00-4a462c2ad4c4	9224	Turnišče
00050000-553a-4f34-26ad-ab6a3662dbe7	8323	Uršna sela
00050000-553a-4f34-0abc-d24c2e7fff04	1252	Vače
00050000-553a-4f34-914b-613bd7f73f19	3320	Velenje 
00050000-553a-4f34-e83c-dae422ea1f4a	3322	Velenje - poštni predali
00050000-553a-4f34-4863-6d5cb5feb28b	8212	Velika Loka
00050000-553a-4f34-3267-8f384d1d15e0	2274	Velika Nedelja
00050000-553a-4f34-d613-66f4d52d2526	9225	Velika Polana
00050000-553a-4f34-4007-1d589b9bf43b	1315	Velike Lašče
00050000-553a-4f34-b5e7-ed5de8ce48af	8213	Veliki Gaber
00050000-553a-4f34-4d2d-6d41f0a4a55d	9241	Veržej
00050000-553a-4f34-e2f9-1037fb0b8b69	1312	Videm - Dobrepolje
00050000-553a-4f34-067a-5a2cb3984330	2284	Videm pri Ptuju
00050000-553a-4f34-9528-60e13683f8fe	8344	Vinica
00050000-553a-4f34-93c4-e6226ea4342e	5271	Vipava
00050000-553a-4f34-7e93-2d99d95dd757	4212	Visoko
00050000-553a-4f34-d99b-3a0ea2133d47	1294	Višnja Gora
00050000-553a-4f34-997d-4191630dce38	3205	Vitanje
00050000-553a-4f34-cadb-c94c040987ab	2255	Vitomarci
00050000-553a-4f34-407f-b9ad59bb6521	1217	Vodice
00050000-553a-4f34-f809-3fe8fecca857	3212	Vojnik\t
00050000-553a-4f34-87f1-62ab11f242ad	5293	Volčja Draga
00050000-553a-4f34-8b48-008fd837a93d	2232	Voličina
00050000-553a-4f34-8efd-37ce07a920e0	3305	Vransko
00050000-553a-4f34-569f-51d6d7e55dfd	6217	Vremski Britof
00050000-553a-4f34-e81f-86b8eb7bc40b	1360	Vrhnika
00050000-553a-4f34-8d5d-5280fcaf0c5c	2365	Vuhred
00050000-553a-4f34-f0b1-7fbfbae7ee0b	2367	Vuzenica
00050000-553a-4f34-79d6-61fc9482139a	8292	Zabukovje 
00050000-553a-4f34-0d93-6f4c7e756ef9	1410	Zagorje ob Savi
00050000-553a-4f34-5d5b-39f3b25697a7	1303	Zagradec
00050000-553a-4f34-b248-5dfb8fd3c449	2283	Zavrč
00050000-553a-4f34-7ea6-6253a1a6e865	8272	Zdole 
00050000-553a-4f34-930c-ec1151791bda	4201	Zgornja Besnica
00050000-553a-4f34-2780-dbe2f001cc4f	2242	Zgornja Korena
00050000-553a-4f34-09db-0d295b3040f2	2201	Zgornja Kungota
00050000-553a-4f34-a500-8eb2c94b501d	2316	Zgornja Ložnica
00050000-553a-4f34-8b44-490b429c765a	2314	Zgornja Polskava
00050000-553a-4f34-5d2d-1bcb43ccf044	2213	Zgornja Velka
00050000-553a-4f34-a80f-2958497a8c8e	4247	Zgornje Gorje
00050000-553a-4f34-b0aa-80bc7ff1821e	4206	Zgornje Jezersko
00050000-553a-4f34-4d62-996dfd5baf4c	2285	Zgornji Leskovec
00050000-553a-4f34-3a28-0edd8b5302da	1432	Zidani Most
00050000-553a-4f34-c1a6-456f21552310	3214	Zreče
00050000-553a-4f34-c742-a4de84c2f3de	4209	Žabnica
00050000-553a-4f34-1e2c-e745f5118399	3310	Žalec
00050000-553a-4f34-5b0e-50282c3e08a8	4228	Železniki
00050000-553a-4f34-6551-2e0aba84a103	2287	Žetale
00050000-553a-4f34-d831-f72151c6bf67	4226	Žiri
00050000-553a-4f34-f42b-0bc23ea9eb20	4274	Žirovnica
00050000-553a-4f34-f49b-007452a18a26	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 1353182)
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
-- TOC entry 2642 (class 0 OID 1353005)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 1353071)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 1353194)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 1353299)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 1353343)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 1353223)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 1353167)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 1353157)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 1353333)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 1353289)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 1352871)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-553a-4f36-03d1-657603f6f076	00010000-553a-4f36-1108-9512b29f8326	2015-04-24 16:12:06	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROXHh7TWaa9YWc/I1YxW0k6sJ0a50S6A6";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 1353232)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 1352909)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00000000-553a-4f36-6de7-6c0132b37860	beri-vse	Polni dostop do vsega v aplikaciji.	t
00000000-553a-4f36-7570-9802288c74d6	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00000000-553a-4f36-7297-b8200d1f2953	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00000000-553a-4f36-c018-26f9c6813fdc	ifi-all	Polni dostop do vsega v aplikaciji.	t
00000000-553a-4f36-cca6-3083ccb2500e	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00000000-553a-4f36-967b-812516ba9934	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 1352893)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-553a-4f36-03d1-657603f6f076	00000000-553a-4f36-c018-26f9c6813fdc
00010000-553a-4f36-1108-9512b29f8326	00000000-553a-4f36-c018-26f9c6813fdc
\.


--
-- TOC entry 2668 (class 0 OID 1353246)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 1353188)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 1353138)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 1352970)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 1353144)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 1353324)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 1353040)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 1352880)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-553a-4f36-1108-9512b29f8326	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO7Hlu2g.Z7Ov.Rts.34i76Bk8/Bamf72	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-553a-4f36-03d1-657603f6f076	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 1353374)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 1353086)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 1353215)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 1353281)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 1353114)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 1353364)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 1353271)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2275 (class 2606 OID 1352934)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 1353413)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 1353406)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 1353323)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 1353104)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 1353137)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2311 (class 2606 OID 1353066)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 1353267)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2322 (class 2606 OID 1353084)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 1353131)
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
-- TOC entry 2365 (class 2606 OID 1353180)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 1353207)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 1353038)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2279 (class 2606 OID 1352943)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 1353002)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2281 (class 2606 OID 1352968)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2273 (class 2606 OID 1352923)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2266 (class 2606 OID 1352908)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 1353213)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 1353245)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 1353360)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 1352995)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2301 (class 2606 OID 1353026)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 1353186)
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
-- TOC entry 2299 (class 2606 OID 1353016)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2320 (class 2606 OID 1353075)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 1353198)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 1353305)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 1353348)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 1353230)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 1353171)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 1353162)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 1353342)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 1353296)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2258 (class 2606 OID 1352879)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 1353236)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2264 (class 2606 OID 1352897)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2268 (class 2606 OID 1352917)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 1353254)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 1353193)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 1353143)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2286 (class 2606 OID 1352975)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2351 (class 2606 OID 1353153)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 1353332)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2309 (class 2606 OID 1353051)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 1352892)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 1353388)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 1353090)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 1353221)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 1353287)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 1353126)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 1353373)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 1353280)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 1259 OID 1353111)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2287 (class 1259 OID 1352997)
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
-- TOC entry 2378 (class 1259 OID 1353214)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2372 (class 1259 OID 1353200)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2373 (class 1259 OID 1353199)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2324 (class 1259 OID 1353091)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2399 (class 1259 OID 1353270)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2400 (class 1259 OID 1353268)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2401 (class 1259 OID 1353269)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2424 (class 1259 OID 1353361)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2425 (class 1259 OID 1353362)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2426 (class 1259 OID 1353363)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 1353391)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 1353390)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 1353389)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2306 (class 1259 OID 1353053)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2307 (class 1259 OID 1353052)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2291 (class 1259 OID 1353004)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2292 (class 1259 OID 1353003)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 1353237)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2342 (class 1259 OID 1353132)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2270 (class 1259 OID 1352924)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2271 (class 1259 OID 1352925)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2392 (class 1259 OID 1353257)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2393 (class 1259 OID 1353256)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2394 (class 1259 OID 1353255)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2316 (class 1259 OID 1353076)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2317 (class 1259 OID 1353078)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2318 (class 1259 OID 1353077)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2352 (class 1259 OID 1353166)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2353 (class 1259 OID 1353164)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2354 (class 1259 OID 1353163)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2355 (class 1259 OID 1353165)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2261 (class 1259 OID 1352898)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2262 (class 1259 OID 1352899)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2381 (class 1259 OID 1353222)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2367 (class 1259 OID 1353187)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2407 (class 1259 OID 1353297)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2408 (class 1259 OID 1353298)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2295 (class 1259 OID 1353018)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2296 (class 1259 OID 1353017)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2297 (class 1259 OID 1353019)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2411 (class 1259 OID 1353306)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2412 (class 1259 OID 1353307)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 1353416)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 1353415)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 1353418)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 1353414)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2446 (class 1259 OID 1353417)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2404 (class 1259 OID 1353288)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2358 (class 1259 OID 1353175)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2359 (class 1259 OID 1353174)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2360 (class 1259 OID 1353172)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2361 (class 1259 OID 1353173)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2248 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 1353408)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 1353407)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2323 (class 1259 OID 1353085)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2276 (class 1259 OID 1352945)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2277 (class 1259 OID 1352944)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2283 (class 1259 OID 1352976)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2284 (class 1259 OID 1352977)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2347 (class 1259 OID 1353156)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2348 (class 1259 OID 1353155)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2349 (class 1259 OID 1353154)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2330 (class 1259 OID 1353113)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2331 (class 1259 OID 1353109)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2332 (class 1259 OID 1353106)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2333 (class 1259 OID 1353107)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2334 (class 1259 OID 1353105)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2335 (class 1259 OID 1353110)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2336 (class 1259 OID 1353108)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2290 (class 1259 OID 1352996)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 1353067)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2313 (class 1259 OID 1353069)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2314 (class 1259 OID 1353068)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2315 (class 1259 OID 1353070)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2366 (class 1259 OID 1353181)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2282 (class 1259 OID 1352969)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2305 (class 1259 OID 1353039)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2386 (class 1259 OID 1353231)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2251 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 1353027)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2423 (class 1259 OID 1353349)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2269 (class 1259 OID 1352918)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2337 (class 1259 OID 1353112)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2471 (class 2606 OID 1353549)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 1353534)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 1353539)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2469 (class 2606 OID 1353559)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2475 (class 2606 OID 1353529)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2470 (class 2606 OID 1353554)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 1353544)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 1353464)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 1353644)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2490 (class 2606 OID 1353639)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2491 (class 2606 OID 1353634)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 1353524)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2498 (class 2606 OID 1353684)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 1353674)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 1353679)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 1353624)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 1353719)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 1353724)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 1353729)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2510 (class 2606 OID 1353744)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 1353739)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 1353734)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2462 (class 2606 OID 1353499)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 1353494)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 1353474)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 1353469)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 1353449)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 1353654)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 1353564)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 1353429)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2449 (class 2606 OID 1353434)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2495 (class 2606 OID 1353669)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 1353664)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 1353659)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 1353504)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 1353514)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 1353509)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2480 (class 2606 OID 1353599)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2482 (class 2606 OID 1353589)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2483 (class 2606 OID 1353584)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2481 (class 2606 OID 1353594)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 1353419)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2447 (class 2606 OID 1353424)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 1353649)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 1353629)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2503 (class 2606 OID 1353694)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2502 (class 2606 OID 1353699)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 1353484)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 1353479)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 1353489)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2505 (class 2606 OID 1353704)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 1353709)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 1353769)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 1353764)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2515 (class 2606 OID 1353779)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 1353759)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2516 (class 2606 OID 1353774)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 1353689)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 1353619)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2485 (class 2606 OID 1353614)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 1353604)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2486 (class 2606 OID 1353609)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2513 (class 2606 OID 1353754)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2514 (class 2606 OID 1353749)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 1353519)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 1353714)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 1353444)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 1353439)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2455 (class 2606 OID 1353454)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 1353459)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2477 (class 2606 OID 1353579)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 1353574)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 1353569)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-24 16:12:07 CEST

--
-- PostgreSQL database dump complete
--

