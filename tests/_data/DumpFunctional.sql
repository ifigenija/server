--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-08 14:01:16 CEST

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
-- TOC entry 179 (class 1259 OID 2753717)
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
-- TOC entry 225 (class 1259 OID 2754199)
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
-- TOC entry 224 (class 1259 OID 2754182)
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
-- TOC entry 217 (class 1259 OID 2754097)
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
-- TOC entry 193 (class 1259 OID 2753882)
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
-- TOC entry 196 (class 1259 OID 2753923)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 2753844)
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
-- TOC entry 212 (class 1259 OID 2754048)
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
-- TOC entry 191 (class 1259 OID 2753869)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 2753917)
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
-- TOC entry 201 (class 1259 OID 2753966)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 2753991)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 2753818)
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
-- TOC entry 180 (class 1259 OID 2753726)
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
-- TOC entry 181 (class 1259 OID 2753737)
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
-- TOC entry 184 (class 1259 OID 2753788)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 2753691)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 2753710)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 2753998)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 2754028)
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
-- TOC entry 221 (class 1259 OID 2754139)
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
-- TOC entry 183 (class 1259 OID 2753768)
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
-- TOC entry 186 (class 1259 OID 2753810)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 2753972)
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
-- TOC entry 185 (class 1259 OID 2753795)
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
-- TOC entry 190 (class 1259 OID 2753861)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 2753984)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 2754088)
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
-- TOC entry 220 (class 1259 OID 2754132)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 2754013)
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
-- TOC entry 200 (class 1259 OID 2753957)
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
-- TOC entry 199 (class 1259 OID 2753947)
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
-- TOC entry 219 (class 1259 OID 2754122)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 2754078)
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
-- TOC entry 173 (class 1259 OID 2753661)
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
-- TOC entry 172 (class 1259 OID 2753659)
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
-- TOC entry 209 (class 1259 OID 2754022)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 2753701)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 2753684)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 2754036)
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
-- TOC entry 203 (class 1259 OID 2753978)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 2753928)
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
-- TOC entry 182 (class 1259 OID 2753760)
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
-- TOC entry 198 (class 1259 OID 2753934)
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
-- TOC entry 218 (class 1259 OID 2754113)
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
-- TOC entry 188 (class 1259 OID 2753830)
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
-- TOC entry 174 (class 1259 OID 2753670)
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
-- TOC entry 223 (class 1259 OID 2754164)
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
-- TOC entry 192 (class 1259 OID 2753876)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 2754005)
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
-- TOC entry 214 (class 1259 OID 2754070)
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
-- TOC entry 194 (class 1259 OID 2753904)
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
-- TOC entry 222 (class 1259 OID 2754154)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 2754061)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) NOT NULL,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 2753664)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 2753717)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 2754199)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 2754182)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 2754097)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 2753882)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 2753923)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 2753844)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-554c-a58b-a27c-5b948945cdfb	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-554c-a58b-99af-bdadcaaca705	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-554c-a58b-f6c7-d7c1263420df	AL	ALB	008	Albania 	Albanija	\N
00040000-554c-a58b-8e25-5a843c63d72e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-554c-a58b-8136-02d42662c71a	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-554c-a58b-d4f2-d74ae72d7fd6	AD	AND	020	Andorra 	Andora	\N
00040000-554c-a58b-54a9-5d3afa3d5282	AO	AGO	024	Angola 	Angola	\N
00040000-554c-a58b-c188-e4dbc63b2a17	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-554c-a58b-3f02-6a2729b0a878	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-554c-a58b-bccd-ae77bd46c816	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-554c-a58b-5ac3-6e6d4a2568bf	AR	ARG	032	Argentina 	Argenitna	\N
00040000-554c-a58b-884e-ea9823be1fbf	AM	ARM	051	Armenia 	Armenija	\N
00040000-554c-a58b-cfb6-89d063bd8aa8	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-554c-a58b-1231-42e378f1578c	AU	AUS	036	Australia 	Avstralija	\N
00040000-554c-a58b-6ddf-b3f76b8ee686	AT	AUT	040	Austria 	Avstrija	\N
00040000-554c-a58b-1288-3abaf9b1e37a	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-554c-a58b-cd57-dbcd5ac2df7b	BS	BHS	044	Bahamas 	Bahami	\N
00040000-554c-a58b-e75f-a547864e2bea	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-554c-a58b-f36c-fd9bb090017d	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-554c-a58b-65d5-49713a1ad1ae	BB	BRB	052	Barbados 	Barbados	\N
00040000-554c-a58b-0194-648ac417ba4f	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-554c-a58b-260d-28acf180b05a	BE	BEL	056	Belgium 	Belgija	\N
00040000-554c-a58b-a3c9-e38f9322b598	BZ	BLZ	084	Belize 	Belize	\N
00040000-554c-a58b-80ab-49cf535c3ec8	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-554c-a58b-5fff-691ca11b3ba7	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-554c-a58b-ce0c-db2c2d7545aa	BT	BTN	064	Bhutan 	Butan	\N
00040000-554c-a58b-75a7-72535a4f6b9b	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-554c-a58b-8e43-201485d601f3	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-554c-a58b-f8bb-3611709e4c73	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-554c-a58b-3fef-db9d2ff85a33	BW	BWA	072	Botswana 	Bocvana	\N
00040000-554c-a58b-d2bd-699758a3a796	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-554c-a58b-8a19-b5de5f9e8638	BR	BRA	076	Brazil 	Brazilija	\N
00040000-554c-a58b-e776-90f35503f9c5	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-554c-a58b-149c-3bd7cd84fa76	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-554c-a58b-9637-e775f1c5cb6f	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-554c-a58b-ee39-a74192f0b2b9	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-554c-a58b-b67f-3d8fab65bae2	BI	BDI	108	Burundi 	Burundi 	\N
00040000-554c-a58b-e2a3-55fa5fcdef1e	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-554c-a58b-795f-37cdab9a733f	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-554c-a58b-23ea-b10efcdf5cd5	CA	CAN	124	Canada 	Kanada	\N
00040000-554c-a58b-7c47-b41f918f7f12	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-554c-a58b-ce46-8526ca2661e0	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-554c-a58b-bc0d-0efd884de9cb	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-554c-a58b-235c-2550820437c0	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-554c-a58b-c5c3-6b5626d2bfd6	CL	CHL	152	Chile 	Čile	\N
00040000-554c-a58b-2379-0c9042e4bd2b	CN	CHN	156	China 	Kitajska	\N
00040000-554c-a58b-198c-09c9d2bc9bf4	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-554c-a58b-f20a-d1526c4f1abd	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-554c-a58b-f2db-ac83d0bebb6d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-554c-a58b-49a5-335f455aba3b	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-554c-a58b-624e-ad1cbc93420c	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-554c-a58b-2f7b-7919cde081a3	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-554c-a58b-7168-32fe57e65765	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-554c-a58b-1f9c-3721d134b4df	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-554c-a58b-49d3-5d450ae782b7	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-554c-a58b-f0f0-cd85785b5688	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-554c-a58b-4c0d-3a36243e55e6	CU	CUB	192	Cuba 	Kuba	\N
00040000-554c-a58b-a363-797b999f5b4d	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-554c-a58b-9021-dfd9cac2e339	CY	CYP	196	Cyprus 	Ciper	\N
00040000-554c-a58b-c1c4-1cf7b0bed23f	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-554c-a58b-74b8-14eefc39e661	DK	DNK	208	Denmark 	Danska	\N
00040000-554c-a58b-58bb-1b77e0860d4d	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-554c-a58b-2467-bacca44b7ed7	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-554c-a58b-b4c7-1ae9a954e4ab	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-554c-a58b-caa0-289083ecc86b	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-554c-a58b-be56-3d1edb99f0d2	EG	EGY	818	Egypt 	Egipt	\N
00040000-554c-a58b-bd44-f86a746943b0	SV	SLV	222	El Salvador 	Salvador	\N
00040000-554c-a58b-7e6d-841686b247c2	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-554c-a58b-471b-b23dc5c7ecab	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-554c-a58b-66f6-16ca0fa4e9c8	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-554c-a58b-6d1e-d1d1455a8e9a	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-554c-a58b-a1c3-f25d546a0cc4	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-554c-a58b-d0bc-17d4ba3d786b	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-554c-a58b-9b3e-62d68de085f4	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-554c-a58b-1b7c-57dad23dca23	FI	FIN	246	Finland 	Finska	\N
00040000-554c-a58b-2807-778d43587dbb	FR	FRA	250	France 	Francija	\N
00040000-554c-a58b-4a43-d77ecb09405c	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-554c-a58c-e77e-b72782dcb5bf	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-554c-a58b-01eb-b53d8de3ce20	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-554c-a58b-5f22-523782e459da	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-554c-a58b-6e18-88fba5e5468a	GA	GAB	266	Gabon 	Gabon	\N
00040000-554c-a58b-2e4b-c592ddbd67af	GM	GMB	270	Gambia 	Gambija	\N
00040000-554c-a58b-fafb-893a78d5c2c5	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-554c-a58b-6a37-532e22b0154d	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-554c-a58b-705e-ede234fd320b	GH	GHA	288	Ghana 	Gana	\N
00040000-554c-a58b-54aa-eec00dc56828	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-554c-a58b-1b7a-55bf373c7177	GR	GRC	300	Greece 	Grčija	\N
00040000-554c-a58b-0ca1-b04e36a76615	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-554c-a58b-6b3e-68d017577822	GD	GRD	308	Grenada 	Grenada	\N
00040000-554c-a58b-73ed-346ca4248c04	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-554c-a58b-af64-20e0d60c06eb	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-554c-a58b-197f-9544a76fe661	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-554c-a58b-fcc1-396627157aa4	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-554c-a58b-3df2-0e56880a3281	GN	GIN	324	Guinea 	Gvineja	\N
00040000-554c-a58b-c66b-6f7ec5188d2d	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-554c-a58b-55ad-7ea2a36646a2	GY	GUY	328	Guyana 	Gvajana	\N
00040000-554c-a58b-f5da-58168f2148d6	HT	HTI	332	Haiti 	Haiti	\N
00040000-554c-a58b-c4b8-a1619840f378	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-554c-a58b-b234-41febac4aa8d	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-554c-a58b-fbab-31d1e3498793	HN	HND	340	Honduras 	Honduras	\N
00040000-554c-a58b-c498-5c08528ed92d	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-554c-a58b-cbaa-44eb8a008e1f	HU	HUN	348	Hungary 	Madžarska	\N
00040000-554c-a58b-2646-78717c6d2746	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-554c-a58b-f5e1-8ab5894f93d4	IN	IND	356	India 	Indija	\N
00040000-554c-a58b-b375-a5e1d5e2a937	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-554c-a58b-abbe-7e8f0d46fa7c	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-554c-a58b-65f2-368e7b87c5c6	IQ	IRQ	368	Iraq 	Irak	\N
00040000-554c-a58b-12ea-635765de2245	IE	IRL	372	Ireland 	Irska	\N
00040000-554c-a58b-5627-0e6cfa5d2397	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-554c-a58b-fc84-708ba5eaf6b7	IL	ISR	376	Israel 	Izrael	\N
00040000-554c-a58b-d5e2-f83dd328e13e	IT	ITA	380	Italy 	Italija	\N
00040000-554c-a58b-95a9-c0a289dc5427	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-554c-a58b-4cc1-bacebe39f1fd	JP	JPN	392	Japan 	Japonska	\N
00040000-554c-a58b-510e-f2a0f7a1af2f	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-554c-a58b-f900-95bf421afcf7	JO	JOR	400	Jordan 	Jordanija	\N
00040000-554c-a58b-ad2e-03cf4d227b13	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-554c-a58b-dc38-f6ffc9cdd6e9	KE	KEN	404	Kenya 	Kenija	\N
00040000-554c-a58b-f546-c4c5c72ee60f	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-554c-a58b-aaa3-1474c76a1bfc	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-554c-a58b-eda5-395ffb7ecb9f	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-554c-a58b-9211-96b2f5c03ee1	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-554c-a58b-0cdf-5d334174146e	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-554c-a58c-b417-2e84f36229ec	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-554c-a58c-cd3b-f475a439fdff	LV	LVA	428	Latvia 	Latvija	\N
00040000-554c-a58c-c6dd-8da43d9e89f1	LB	LBN	422	Lebanon 	Libanon	\N
00040000-554c-a58c-fd8a-5e62e7d6cd49	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-554c-a58c-da05-be17057534e0	LR	LBR	430	Liberia 	Liberija	\N
00040000-554c-a58c-ccb5-aed7715da1a1	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-554c-a58c-bb4a-a771ab4c6b42	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-554c-a58c-1bf9-bd0b2af41908	LT	LTU	440	Lithuania 	Litva	\N
00040000-554c-a58c-9448-64ec23cb00e3	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-554c-a58c-4345-a22ad4085d20	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-554c-a58c-ac23-aa0949c23c33	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-554c-a58c-b4de-81a480bdb512	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-554c-a58c-7f73-36196a72b560	MW	MWI	454	Malawi 	Malavi	\N
00040000-554c-a58c-a485-41e05a55b61a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-554c-a58c-3c12-c62faa5d610e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-554c-a58c-5288-cb6d703951ee	ML	MLI	466	Mali 	Mali	\N
00040000-554c-a58c-5485-92ceb4f9474b	MT	MLT	470	Malta 	Malta	\N
00040000-554c-a58c-e126-c3048906f46a	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-554c-a58c-92dd-7344d142011b	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-554c-a58c-bbd0-3880884b5622	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-554c-a58c-7d22-ee46b4bbeb3e	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-554c-a58c-e8ee-ce0e4c62aab6	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-554c-a58c-386d-fcd4b9d6c964	MX	MEX	484	Mexico 	Mehika	\N
00040000-554c-a58c-648a-bc297221cb88	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-554c-a58c-a423-1443909af202	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-554c-a58c-01c7-3712766ff28e	MC	MCO	492	Monaco 	Monako	\N
00040000-554c-a58c-8751-980cd33e7f65	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-554c-a58c-8208-be4f36c28ca9	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-554c-a58c-60de-d5657ef2e38f	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-554c-a58c-0d0e-767f12fe1a3b	MA	MAR	504	Morocco 	Maroko	\N
00040000-554c-a58c-6be1-60d63b4108c8	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-554c-a58c-43e6-ea54f2d49c1d	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-554c-a58c-cf48-21e9f44278b9	NA	NAM	516	Namibia 	Namibija	\N
00040000-554c-a58c-2fb1-f8f899fef5bb	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-554c-a58c-3dbb-573a8cb78f5e	NP	NPL	524	Nepal 	Nepal	\N
00040000-554c-a58c-05ba-d830891a3cee	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-554c-a58c-085a-d79912a84241	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-554c-a58c-845d-c7d16b141dad	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-554c-a58c-00e7-793150ae4c1e	NE	NER	562	Niger 	Niger 	\N
00040000-554c-a58c-2919-169734140128	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-554c-a58c-5639-edcc9aaff255	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-554c-a58c-5be2-e63fb8be5a54	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-554c-a58c-66cd-9cdfaa677146	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-554c-a58c-3780-313f72c673a1	NO	NOR	578	Norway 	Norveška	\N
00040000-554c-a58c-9a4a-59b4f1dc36c1	OM	OMN	512	Oman 	Oman	\N
00040000-554c-a58c-259b-9d7bb79dfe35	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-554c-a58c-e87f-b59171202506	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-554c-a58c-cbca-f68733c45cea	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-554c-a58c-f128-aaaf229316a3	PA	PAN	591	Panama 	Panama	\N
00040000-554c-a58c-2a29-586ea7782464	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-554c-a58c-d5ce-3bdc47984c8b	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-554c-a58c-d2cd-95a5233b2d56	PE	PER	604	Peru 	Peru	\N
00040000-554c-a58c-f960-c0c4e919848c	PH	PHL	608	Philippines 	Filipini	\N
00040000-554c-a58c-5766-df08fce01658	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-554c-a58c-7e35-91ad8675b5af	PL	POL	616	Poland 	Poljska	\N
00040000-554c-a58c-d3b6-e6af6a810a33	PT	PRT	620	Portugal 	Portugalska	\N
00040000-554c-a58c-9f09-895b2a60a69b	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-554c-a58c-6883-103e86388055	QA	QAT	634	Qatar 	Katar	\N
00040000-554c-a58c-8ce7-20a9989394c4	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-554c-a58c-6f48-db739e06d99b	RO	ROU	642	Romania 	Romunija	\N
00040000-554c-a58c-63b6-f2509d6114b4	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-554c-a58c-48c6-d511dc1efd7a	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-554c-a58c-5ff7-8fc8dfe1d963	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-554c-a58c-71c8-6ea72c13138e	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-554c-a58c-3a05-d4cec33ff615	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-554c-a58c-6af6-85d7e17dac9e	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-554c-a58c-0cb0-f093d8d9836d	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-554c-a58c-1623-7bcb67e43a2c	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-554c-a58c-5ad6-c683c68f1281	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-554c-a58c-3c74-274aa5e71e21	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-554c-a58c-2c0c-721ab4829ff8	SM	SMR	674	San Marino 	San Marino	\N
00040000-554c-a58c-c9fe-9fbdf55e1c84	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-554c-a58c-18c6-ae029a21e0da	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-554c-a58c-0c24-ed9e5511826d	SN	SEN	686	Senegal 	Senegal	\N
00040000-554c-a58c-15b2-bbadb66ceaa1	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-554c-a58c-d36d-0f05f9cbec16	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-554c-a58c-cbc5-b10377d22ff9	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-554c-a58c-4003-d05285ffef84	SG	SGP	702	Singapore 	Singapur	\N
00040000-554c-a58c-92e7-711aeb389ea8	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-554c-a58c-8de4-297ed9980832	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-554c-a58c-0d56-d544ff5fdc83	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-554c-a58c-f8ab-2c217f1cb103	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-554c-a58c-cda1-6b3fd111647f	SO	SOM	706	Somalia 	Somalija	\N
00040000-554c-a58c-9deb-93fc83e45f0f	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-554c-a58c-76cf-cc187d3dae58	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-554c-a58c-7b55-16b5c2c33be6	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-554c-a58c-78f0-d07a23398670	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-554c-a58c-3fa4-19785cccccae	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-554c-a58c-4040-df1ca9f91386	SD	SDN	729	Sudan 	Sudan	\N
00040000-554c-a58c-c08e-9031ee1437d5	SR	SUR	740	Suriname 	Surinam	\N
00040000-554c-a58c-774b-23ba4cec1b16	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-554c-a58c-435a-c8ce9c26d8eb	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-554c-a58c-0675-8dc679681a11	SE	SWE	752	Sweden 	Švedska	\N
00040000-554c-a58c-55cd-c821436bb010	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-554c-a58c-9ce6-95338b324bc2	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-554c-a58c-a50c-b839a0f41dd2	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-554c-a58c-69cf-8276898311a2	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-554c-a58c-201c-509ffe2f2215	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-554c-a58c-75fe-7586a477d936	TH	THA	764	Thailand 	Tajska	\N
00040000-554c-a58c-8e98-3de56ed8b978	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-554c-a58c-edc1-4abaf9046c5b	TG	TGO	768	Togo 	Togo	\N
00040000-554c-a58c-39c7-11ea1fa5b17e	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-554c-a58c-3979-0877883f876a	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-554c-a58c-a610-82e4f676bc4f	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-554c-a58c-e0aa-d31e18fd5208	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-554c-a58c-2a36-7a2e3b9af9c5	TR	TUR	792	Turkey 	Turčija	\N
00040000-554c-a58c-9866-77003f8f0781	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-554c-a58c-e66a-535ea217a3d2	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-554c-a58c-653b-9ac42b800ddb	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-554c-a58c-da64-060774ebf434	UG	UGA	800	Uganda 	Uganda	\N
00040000-554c-a58c-a61d-9aaaff647adc	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-554c-a58c-1eaf-6790cf0387e8	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-554c-a58c-ffaa-3529d5a80f1d	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-554c-a58c-2b2a-1d130d57e0cc	US	USA	840	United States 	Združene države Amerike	\N
00040000-554c-a58c-eed7-019ae4a807a9	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-554c-a58c-1f16-bfc99721b62b	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-554c-a58c-1ff4-56f08879ad35	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-554c-a58c-fac7-dfca90ab0f56	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-554c-a58c-e780-d65e3e1f02ae	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-554c-a58c-8b34-4dfce5d63aae	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-554c-a58c-3d71-25a8d9648833	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-554c-a58c-a625-46ce5e662f8e	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-554c-a58c-d391-a3d086c1925d	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-554c-a58c-8703-1b27e5fd9c2b	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-554c-a58c-31b7-918c4ed15a36	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-554c-a58c-609c-8be2d7d95705	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-554c-a58c-7308-0a425d2bc5b9	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 2754048)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 2753869)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 2753917)
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
-- TOC entry 2658 (class 0 OID 2753966)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 2753991)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 2753818)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-554c-a58c-aa59-392d392435f9	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-554c-a58c-191b-0be1e4330231	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-554c-a58c-c5a7-60d7f3bc4fe5	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-554c-a58c-4b48-c32b14cd3533	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-554c-a58c-39d0-66f17f6c5200	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-554c-a58c-2264-a7b96e3da757	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-554c-a58c-6e05-93fe2841be37	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-554c-a58c-be1c-5c0bea247f9e	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-554c-a58c-362d-c5e0c5910eec	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-554c-a58c-dc45-53049f84772b	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 2753726)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-554c-a58c-4f20-19f28090e3df	00000000-554c-a58c-39d0-66f17f6c5200	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-554c-a58c-3e57-496fdfaae31a	00000000-554c-a58c-39d0-66f17f6c5200	00010000-554c-a58c-e512-f8ed1befe202	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-554c-a58c-21a8-bc64631f2bba	00000000-554c-a58c-2264-a7b96e3da757	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 2753737)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 2753788)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 2753691)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-554c-a58c-9764-084d53297722	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-554c-a58c-bfb7-e858afe636ac	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-554c-a58c-6c65-6ec1ee98be8f	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-554c-a58c-abf5-6fcf90a35394	Abonma-read	Abonma - branje	f
00030000-554c-a58c-5c05-2d142dde89ec	Abonma-write	Abonma - spreminjanje	f
00030000-554c-a58c-449b-bd2657e5e08a	Alternacija-read	Alternacija - branje	f
00030000-554c-a58c-c6f5-3bd821478776	Alternacija-write	Alternacija - spreminjanje	f
00030000-554c-a58c-fa3c-e55f66fbee49	Arhivalija-read	Arhivalija - branje	f
00030000-554c-a58c-a7e2-365baecda190	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-554c-a58c-8b47-64989baa3fe1	Besedilo-read	Besedilo - branje	f
00030000-554c-a58c-41ae-35ac18a9b10b	Besedilo-write	Besedilo - spreminjanje	f
00030000-554c-a58c-b35c-388232d4f2d6	DogodekIzven-read	DogodekIzven - branje	f
00030000-554c-a58c-13ef-b6ca376e38d6	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-554c-a58c-a03e-255aca391a1f	Dogodek-read	Dogodek - branje	f
00030000-554c-a58c-d957-b58128216c64	Dogodek-write	Dogodek - spreminjanje	f
00030000-554c-a58c-0f33-af9b420262f4	Drzava-read	Drzava - branje	f
00030000-554c-a58c-a46e-1089cf23fd4c	Drzava-write	Drzava - spreminjanje	f
00030000-554c-a58c-596a-1089a166fb96	Funkcija-read	Funkcija - branje	f
00030000-554c-a58c-b583-2abf371fe609	Funkcija-write	Funkcija - spreminjanje	f
00030000-554c-a58c-6f01-a663ceef94d0	Gostovanje-read	Gostovanje - branje	f
00030000-554c-a58c-aa06-51787588dd84	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-554c-a58c-0b04-6cd2d8b94f50	Gostujoca-read	Gostujoca - branje	f
00030000-554c-a58c-72c3-caff65964b12	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-554c-a58c-d77e-238bad620a0d	Kupec-read	Kupec - branje	f
00030000-554c-a58c-b9ea-f147e9b6b99e	Kupec-write	Kupec - spreminjanje	f
00030000-554c-a58c-482c-92224ed9a254	NacinPlacina-read	NacinPlacina - branje	f
00030000-554c-a58c-efeb-e4403ab390cc	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-554c-a58c-3ed9-ae2f2225ab51	Option-read	Option - branje	f
00030000-554c-a58c-67b0-f682ff8025c6	Option-write	Option - spreminjanje	f
00030000-554c-a58c-1b08-62dfa1aa472b	OptionValue-read	OptionValue - branje	f
00030000-554c-a58c-3dfb-0f602120d3f2	OptionValue-write	OptionValue - spreminjanje	f
00030000-554c-a58c-2437-62011709c20c	Oseba-read	Oseba - branje	f
00030000-554c-a58c-a7c1-8aac462e1972	Oseba-write	Oseba - spreminjanje	f
00030000-554c-a58c-645e-759cbba581df	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-554c-a58c-b061-b2f72662d03f	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-554c-a58c-7062-0a9ed8bf8553	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-554c-a58c-b5e0-70698778c383	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-554c-a58c-2a44-36aa4e829806	Pogodba-read	Pogodba - branje	f
00030000-554c-a58c-0b35-6d8a2e9aa4b6	Pogodba-write	Pogodba - spreminjanje	f
00030000-554c-a58c-f722-cd369c298da7	Popa-read	Popa - branje	f
00030000-554c-a58c-90a1-84000bc1619f	Popa-write	Popa - spreminjanje	f
00030000-554c-a58c-e48b-7985e75999fe	Posta-read	Posta - branje	f
00030000-554c-a58c-a2e0-aaf20636986d	Posta-write	Posta - spreminjanje	f
00030000-554c-a58c-2222-0e1b8fbf10e2	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-554c-a58c-9350-7b31983b6a47	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-554c-a58c-75a6-cc02cf9bca62	PostniNaslov-read	PostniNaslov - branje	f
00030000-554c-a58c-87ac-ee76d4a48a73	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-554c-a58c-1cd7-c2b92f482b4c	Predstava-read	Predstava - branje	f
00030000-554c-a58c-2600-766784afb33d	Predstava-write	Predstava - spreminjanje	f
00030000-554c-a58c-50b2-458ac2b718ee	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-554c-a58c-9d05-154511a8c53d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-554c-a58c-7925-3d9b58e733ba	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-554c-a58c-2e81-7cd0f619ce21	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-554c-a58c-702b-f105b9936435	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-554c-a58c-229a-9ccd5ff77e44	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-554c-a58c-6ba5-366bd7f162f5	Prostor-read	Prostor - branje	f
00030000-554c-a58c-10ef-0d834989e7b2	Prostor-write	Prostor - spreminjanje	f
00030000-554c-a58c-3466-add19c6d366a	Racun-read	Racun - branje	f
00030000-554c-a58c-064b-53133b609c24	Racun-write	Racun - spreminjanje	f
00030000-554c-a58c-2fcf-474bb35190eb	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-554c-a58c-51be-efa04a62caf9	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-554c-a58c-dff2-345b96b25b29	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-554c-a58c-e1d0-c45b0dd616eb	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-554c-a58c-b7dc-19d25e35f85f	Rekvizit-read	Rekvizit - branje	f
00030000-554c-a58c-deec-0b31b94dd61f	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-554c-a58c-d71a-ba127cea25e7	Rezervacija-read	Rezervacija - branje	f
00030000-554c-a58c-c9ab-6eff4f35f0cf	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-554c-a58c-86b0-fc836d8d2554	SedezniRed-read	SedezniRed - branje	f
00030000-554c-a58c-eb8c-3c46e13adab8	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-554c-a58c-5cd2-4e2bf3d03229	Sedez-read	Sedez - branje	f
00030000-554c-a58c-cd3c-1bf8315c9a61	Sedez-write	Sedez - spreminjanje	f
00030000-554c-a58c-51f7-a7d4cbc893c4	Sezona-read	Sezona - branje	f
00030000-554c-a58c-e0dc-6118d22ec78f	Sezona-write	Sezona - spreminjanje	f
00030000-554c-a58c-1033-914330124213	Telefonska-read	Telefonska - branje	f
00030000-554c-a58c-9a74-725cc6a74722	Telefonska-write	Telefonska - spreminjanje	f
00030000-554c-a58c-fc80-c9fe0a9ff6bb	TerminStoritve-read	TerminStoritve - branje	f
00030000-554c-a58c-f9a2-5756a59a381e	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-554c-a58c-5ad4-859d0d02ca5d	TipFunkcije-read	TipFunkcije - branje	f
00030000-554c-a58c-4b5d-a5c92e07acc2	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-554c-a58c-9191-6c147ced5fde	Trr-read	Trr - branje	f
00030000-554c-a58c-87ae-9efc26cf00e4	Trr-write	Trr - spreminjanje	f
00030000-554c-a58c-8800-55d4d69eea9d	Uprizoritev-read	Uprizoritev - branje	f
00030000-554c-a58c-06cb-f362757dc91b	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-554c-a58c-dbe4-ad28308ec063	Vaja-read	Vaja - branje	f
00030000-554c-a58c-4e10-50e3658c179c	Vaja-write	Vaja - spreminjanje	f
00030000-554c-a58c-42d3-dec3e1a41314	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-554c-a58c-12c3-78a24b268d05	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-554c-a58c-c329-8490e8426420	Zaposlitev-read	Zaposlitev - branje	f
00030000-554c-a58c-2fb7-bee04f8612bf	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-554c-a58c-3c5b-22f7296a5a09	Zasedenost-read	Zasedenost - branje	f
00030000-554c-a58c-e820-6773a59d3994	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-554c-a58c-2c42-516562797797	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-554c-a58c-cf24-59a44251733b	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-554c-a58c-56da-cd6c2bf6fc3d	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-554c-a58c-459f-30b58f11ee21	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2635 (class 0 OID 2753710)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-554c-a58c-c5e7-7264a50d25c5	00030000-554c-a58c-0f33-af9b420262f4
00020000-554c-a58c-ac1c-86191d4ceb59	00030000-554c-a58c-a46e-1089cf23fd4c
00020000-554c-a58c-ac1c-86191d4ceb59	00030000-554c-a58c-0f33-af9b420262f4
\.


--
-- TOC entry 2663 (class 0 OID 2753998)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 2754028)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 2754139)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 2753768)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 2753810)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-554c-a58b-ef51-da49e0ed5e6f	8341	Adlešiči
00050000-554c-a58b-a8b8-03268ef9d8b6	5270	Ajdovščina
00050000-554c-a58b-2b02-2557bb0aded1	6280	Ankaran/Ancarano
00050000-554c-a58b-b196-3e0ca49d3305	9253	Apače
00050000-554c-a58b-0ee5-051395e5a12f	8253	Artiče
00050000-554c-a58b-a5fb-013e18bfb766	4275	Begunje na Gorenjskem
00050000-554c-a58b-bbd6-54b4b673dfe0	1382	Begunje pri Cerknici
00050000-554c-a58b-93da-a68af903fd09	9231	Beltinci
00050000-554c-a58b-2b12-fbc2efa451d7	2234	Benedikt
00050000-554c-a58b-27c0-c848f19e25ec	2345	Bistrica ob Dravi
00050000-554c-a58b-b000-82a7c5484a13	3256	Bistrica ob Sotli
00050000-554c-a58b-2977-f78d787524c4	8259	Bizeljsko
00050000-554c-a58b-eeb2-d54ddaea6d94	1223	Blagovica
00050000-554c-a58b-483e-d500ece523db	8283	Blanca
00050000-554c-a58b-a8f4-2d04b434f699	4260	Bled
00050000-554c-a58b-d27c-d864acb6729f	4273	Blejska Dobrava
00050000-554c-a58b-fdc9-472e1fdfff31	9265	Bodonci
00050000-554c-a58b-123c-384963485acb	9222	Bogojina
00050000-554c-a58b-f93a-ab83c6f086f1	4263	Bohinjska Bela
00050000-554c-a58b-dccd-eeaaf879347c	4264	Bohinjska Bistrica
00050000-554c-a58b-9829-3405d45b3867	4265	Bohinjsko jezero
00050000-554c-a58b-21d7-ea5c6253c8ac	1353	Borovnica
00050000-554c-a58b-72b6-739984adfdbe	8294	Boštanj
00050000-554c-a58b-b3ec-8e9a162c667c	5230	Bovec
00050000-554c-a58b-f9b1-297f02ed73af	5295	Branik
00050000-554c-a58b-7aac-dc869fb953c3	3314	Braslovče
00050000-554c-a58b-acb3-a6c460ce0ff3	5223	Breginj
00050000-554c-a58b-b988-fe614c49a653	8280	Brestanica
00050000-554c-a58b-a1d8-e240ce79c0ec	2354	Bresternica
00050000-554c-a58b-a1b6-8b24eea89d54	4243	Brezje
00050000-554c-a58b-ba8f-1cd3130393f2	1351	Brezovica pri Ljubljani
00050000-554c-a58b-bdf8-1cdee57bbfed	8250	Brežice
00050000-554c-a58b-e5a2-44e15a7415ce	4210	Brnik - Aerodrom
00050000-554c-a58b-3251-711867fbf599	8321	Brusnice
00050000-554c-a58b-20fb-58b2a72b8623	3255	Buče
00050000-554c-a58b-0530-ac95a873d7f0	8276	Bučka 
00050000-554c-a58b-2f8c-de9fe495be63	9261	Cankova
00050000-554c-a58b-f97a-6ab467fc6b2b	3000	Celje 
00050000-554c-a58b-9fc7-c2c7bd19ce67	3001	Celje - poštni predali
00050000-554c-a58b-d3a3-761866a7350b	4207	Cerklje na Gorenjskem
00050000-554c-a58b-e31f-5d8c2a3fa630	8263	Cerklje ob Krki
00050000-554c-a58b-7ff3-e0239a5208b9	1380	Cerknica
00050000-554c-a58b-0860-2cb0bec4f0f1	5282	Cerkno
00050000-554c-a58b-984a-05a0e3e78703	2236	Cerkvenjak
00050000-554c-a58b-57b1-052b4edf53a8	2215	Ceršak
00050000-554c-a58b-7033-8aa9088b9906	2326	Cirkovce
00050000-554c-a58b-f754-19f87cf8bcfb	2282	Cirkulane
00050000-554c-a58b-ebe7-3db81aae3eb0	5273	Col
00050000-554c-a58b-c16b-d6943126d69b	8251	Čatež ob Savi
00050000-554c-a58b-d8bc-f67b1dfee5b9	1413	Čemšenik
00050000-554c-a58b-02c4-4aed3d969837	5253	Čepovan
00050000-554c-a58b-8587-c45a89f7fc05	9232	Črenšovci
00050000-554c-a58b-8206-77480afc8b3c	2393	Črna na Koroškem
00050000-554c-a58b-226e-7d80a18c88c3	6275	Črni Kal
00050000-554c-a58b-3e63-59de9f4654da	5274	Črni Vrh nad Idrijo
00050000-554c-a58b-fc77-ba298cde7463	5262	Črniče
00050000-554c-a58b-5e33-7fe80c44fa07	8340	Črnomelj
00050000-554c-a58b-b883-1b6f463f98c9	6271	Dekani
00050000-554c-a58b-c611-a4fbb9af8a81	5210	Deskle
00050000-554c-a58b-8042-af2010b6c2d3	2253	Destrnik
00050000-554c-a58b-58c4-ba43fb795973	6215	Divača
00050000-554c-a58b-e3d8-0a8d29a4d6d1	1233	Dob
00050000-554c-a58b-7c48-bdd6e6d466d4	3224	Dobje pri Planini
00050000-554c-a58b-9959-b10534bc9e28	8257	Dobova
00050000-554c-a58b-4625-c4847e97ce50	1423	Dobovec
00050000-554c-a58b-9033-b44db83ebd48	5263	Dobravlje
00050000-554c-a58b-2d45-857a0a6f12ee	3204	Dobrna
00050000-554c-a58b-adca-a21b54bb6d9a	8211	Dobrnič
00050000-554c-a58b-1d24-f7c0079be5c8	1356	Dobrova
00050000-554c-a58b-2665-8a085d29b70a	9223	Dobrovnik/Dobronak 
00050000-554c-a58b-15f1-438d9fee9010	5212	Dobrovo v Brdih
00050000-554c-a58b-f528-f8b936866522	1431	Dol pri Hrastniku
00050000-554c-a58b-5247-a9390862eab7	1262	Dol pri Ljubljani
00050000-554c-a58b-0c26-0c0a28ee77b8	1273	Dole pri Litiji
00050000-554c-a58b-a7fe-6c431ccc4be1	1331	Dolenja vas
00050000-554c-a58b-396f-f00263f3b223	8350	Dolenjske Toplice
00050000-554c-a58b-e573-44629077380b	1230	Domžale
00050000-554c-a58b-bdbd-eb842d8a994b	2252	Dornava
00050000-554c-a58b-8b69-89d8ecae2bcb	5294	Dornberk
00050000-554c-a58b-4c1f-222c828c6125	1319	Draga
00050000-554c-a58b-07f4-2ceed03f2455	8343	Dragatuš
00050000-554c-a58b-6189-1e311cd3118c	3222	Dramlje
00050000-554c-a58b-3c71-169f4a2860ca	2370	Dravograd
00050000-554c-a58b-8494-f960b597ff51	4203	Duplje
00050000-554c-a58b-f1de-44a827b20245	6221	Dutovlje
00050000-554c-a58b-b462-9e724fd4ec5d	8361	Dvor
00050000-554c-a58b-f85c-92f646be7b21	2343	Fala
00050000-554c-a58b-15fc-ebe461a3e77e	9208	Fokovci
00050000-554c-a58b-4e31-1e96bb738f4a	2313	Fram
00050000-554c-a58b-8055-96fa05d17dbc	3213	Frankolovo
00050000-554c-a58b-2558-5e517d2c6ef1	1274	Gabrovka
00050000-554c-a58b-11b8-7f563085012d	8254	Globoko
00050000-554c-a58b-c778-efae15819743	5275	Godovič
00050000-554c-a58b-22ce-0272497c27b2	4204	Golnik
00050000-554c-a58b-81d0-a55953fafb48	3303	Gomilsko
00050000-554c-a58b-97e2-d964b8d00186	4224	Gorenja vas
00050000-554c-a58b-cf06-39588c663b7b	3263	Gorica pri Slivnici
00050000-554c-a58b-6e1d-4c0e7792f9cb	2272	Gorišnica
00050000-554c-a58b-1be0-7d621443ae47	9250	Gornja Radgona
00050000-554c-a58b-5479-51c20a8220f7	3342	Gornji Grad
00050000-554c-a58b-e844-0b84a1e48d21	4282	Gozd Martuljek
00050000-554c-a58b-da91-7969fcf22ee3	6272	Gračišče
00050000-554c-a58b-28f7-d1fef3bc7b23	9264	Grad
00050000-554c-a58b-f2de-909c6eb09b71	8332	Gradac
00050000-554c-a58b-2807-01e571663418	1384	Grahovo
00050000-554c-a58b-bdb3-db5e3e425e72	5242	Grahovo ob Bači
00050000-554c-a58b-ca81-2a0b88bf7338	5251	Grgar
00050000-554c-a58b-f54c-7db5ec3a88cf	3302	Griže
00050000-554c-a58b-a481-fe14bc247ff5	3231	Grobelno
00050000-554c-a58b-c9f4-934771d8b5c2	1290	Grosuplje
00050000-554c-a58b-036e-3d7769be07b1	2288	Hajdina
00050000-554c-a58b-7e23-ec39eb33f787	8362	Hinje
00050000-554c-a58b-47ee-5b169f35357a	2311	Hoče
00050000-554c-a58b-8dea-e51da479dcb3	9205	Hodoš/Hodos
00050000-554c-a58b-3dd5-2f9e9d9b50d3	1354	Horjul
00050000-554c-a58b-7dfc-756609ef09b9	1372	Hotedršica
00050000-554c-a58b-d2f6-5cee15a86d6e	1430	Hrastnik
00050000-554c-a58b-0c15-c4cafe8b3c5e	6225	Hruševje
00050000-554c-a58b-c518-b0fe56dcd4ee	4276	Hrušica
00050000-554c-a58b-2325-ea445478671c	5280	Idrija
00050000-554c-a58b-b081-b547fa3aa7e9	1292	Ig
00050000-554c-a58b-7c2b-5e40cf042712	6250	Ilirska Bistrica
00050000-554c-a58b-726c-5b58e7e8bb58	6251	Ilirska Bistrica-Trnovo
00050000-554c-a58b-2298-842b5df3265f	1295	Ivančna Gorica
00050000-554c-a58b-5a22-fb83ef3a1d77	2259	Ivanjkovci
00050000-554c-a58b-cbe5-b6feb9d90606	1411	Izlake
00050000-554c-a58b-662b-88488d130517	6310	Izola/Isola
00050000-554c-a58b-aa43-d119e8e63558	2222	Jakobski Dol
00050000-554c-a58b-3a74-202bd942b509	2221	Jarenina
00050000-554c-a58b-4994-2011ca04d3a9	6254	Jelšane
00050000-554c-a58b-e3bc-2000e6649583	4270	Jesenice
00050000-554c-a58b-8883-540b520cdd23	8261	Jesenice na Dolenjskem
00050000-554c-a58b-7f52-06fea430b850	3273	Jurklošter
00050000-554c-a58b-02fa-8928996a61d9	2223	Jurovski Dol
00050000-554c-a58b-b8ab-ca31be0fda26	2256	Juršinci
00050000-554c-a58b-9e25-e631f341de1d	5214	Kal nad Kanalom
00050000-554c-a58b-34f4-d5cbad4149f2	3233	Kalobje
00050000-554c-a58b-96ae-730a6f36622e	4246	Kamna Gorica
00050000-554c-a58b-0cbe-0e4a9b3d641a	2351	Kamnica
00050000-554c-a58b-334b-7ed775f69e63	1241	Kamnik
00050000-554c-a58b-b85c-6aa7c9093430	5213	Kanal
00050000-554c-a58b-ac6a-e69c26fa329e	8258	Kapele
00050000-554c-a58b-90ae-b8d2b20dc6b2	2362	Kapla
00050000-554c-a58b-81b4-d771e5f2277b	2325	Kidričevo
00050000-554c-a58b-f44f-8be87c1b124c	1412	Kisovec
00050000-554c-a58b-9e95-2cd81955a0e1	6253	Knežak
00050000-554c-a58b-08a0-e794c4143be5	5222	Kobarid
00050000-554c-a58b-f3a4-d068be6ad739	9227	Kobilje
00050000-554c-a58b-2b6d-efbdd5698ce3	1330	Kočevje
00050000-554c-a58b-66c4-a3e742e355d4	1338	Kočevska Reka
00050000-554c-a58b-e81c-da06764a5f38	2276	Kog
00050000-554c-a58b-9e4a-d75b07ca5299	5211	Kojsko
00050000-554c-a58b-6e92-94fb12784150	6223	Komen
00050000-554c-a58b-3219-81bd9ce576ba	1218	Komenda
00050000-554c-a58b-8c55-f814948524a6	6000	Koper/Capodistria 
00050000-554c-a58b-45fb-283274722002	6001	Koper/Capodistria - poštni predali
00050000-554c-a58b-f35e-f16a2a60f2db	8282	Koprivnica
00050000-554c-a58b-b38a-8eee856e26c5	5296	Kostanjevica na Krasu
00050000-554c-a58b-fed9-2d6eca2142ce	8311	Kostanjevica na Krki
00050000-554c-a58b-dd15-2071dacb721d	1336	Kostel
00050000-554c-a58b-0ca3-33a7b6233e6c	6256	Košana
00050000-554c-a58b-daa1-b9f1fec21b20	2394	Kotlje
00050000-554c-a58b-0ebb-6e3300d4f76c	6240	Kozina
00050000-554c-a58b-c6fe-e12a5a88e48f	3260	Kozje
00050000-554c-a58b-d12f-f948cfac736c	4000	Kranj 
00050000-554c-a58b-8537-4f05df48d08e	4001	Kranj - poštni predali
00050000-554c-a58b-927e-9acf2cb29269	4280	Kranjska Gora
00050000-554c-a58b-a2c8-137148c6f16e	1281	Kresnice
00050000-554c-a58b-6ab6-06f91f4db573	4294	Križe
00050000-554c-a58b-2147-b7fd6627c4cf	9206	Križevci
00050000-554c-a58b-0498-70a01ea1cc70	9242	Križevci pri Ljutomeru
00050000-554c-a58b-e952-f6bb145e70d6	1301	Krka
00050000-554c-a58b-1411-7311ad418961	8296	Krmelj
00050000-554c-a58b-9270-7741d94f5648	4245	Kropa
00050000-554c-a58b-e964-bea3e4e92ca2	8262	Krška vas
00050000-554c-a58b-e040-905dc1445ecb	8270	Krško
00050000-554c-a58b-3837-b461c077289f	9263	Kuzma
00050000-554c-a58b-714d-5b6dae3c7cd7	2318	Laporje
00050000-554c-a58b-28ba-4b3c544389b1	3270	Laško
00050000-554c-a58b-9bca-0d1d88ac2ac2	1219	Laze v Tuhinju
00050000-554c-a58b-72e8-efe48576e144	2230	Lenart v Slovenskih goricah
00050000-554c-a58b-bf01-822d0242b61f	9220	Lendava/Lendva
00050000-554c-a58b-3c0b-4a33a731ecad	4248	Lesce
00050000-554c-a58b-89c7-31fd3975f4e2	3261	Lesično
00050000-554c-a58b-ba96-f074f38a9e50	8273	Leskovec pri Krškem
00050000-554c-a58b-e0ce-a539e0a4aa28	2372	Libeliče
00050000-554c-a58b-23f4-5b3dad3a335d	2341	Limbuš
00050000-554c-a58b-dfe6-26c2c7da6c22	1270	Litija
00050000-554c-a58b-e690-058f23000b8a	3202	Ljubečna
00050000-554c-a58b-9900-03d18b472f62	1000	Ljubljana 
00050000-554c-a58b-e03c-16236c5ff8b3	1001	Ljubljana - poštni predali
00050000-554c-a58b-c931-b882c592d626	1231	Ljubljana - Črnuče
00050000-554c-a58b-84b0-7fe0fd037080	1261	Ljubljana - Dobrunje
00050000-554c-a58b-e811-bb4373be7567	1260	Ljubljana - Polje
00050000-554c-a58b-a99e-8af588ba9950	1210	Ljubljana - Šentvid
00050000-554c-a58b-3aca-03c32c905414	1211	Ljubljana - Šmartno
00050000-554c-a58b-052a-0c16bb529fe0	3333	Ljubno ob Savinji
00050000-554c-a58b-dd5a-c4d8c37f3ded	9240	Ljutomer
00050000-554c-a58b-c85b-e8d82436c163	3215	Loče
00050000-554c-a58b-1040-79aed75ab7aa	5231	Log pod Mangartom
00050000-554c-a58b-d078-574e0eb8995a	1358	Log pri Brezovici
00050000-554c-a58b-fd92-d6b5737e2ae3	1370	Logatec
00050000-554c-a58b-e89c-a6ac647f9825	1371	Logatec
00050000-554c-a58b-e90a-0df3287157f6	1434	Loka pri Zidanem Mostu
00050000-554c-a58b-79b4-405da0f07776	3223	Loka pri Žusmu
00050000-554c-a58b-60d8-582389dd6164	6219	Lokev
00050000-554c-a58b-159b-5a9b13d53562	1318	Loški Potok
00050000-554c-a58b-8606-f3630ceceb72	2324	Lovrenc na Dravskem polju
00050000-554c-a58b-a899-4f26e82aaa65	2344	Lovrenc na Pohorju
00050000-554c-a58b-5da2-0b6d1abbf39f	3334	Luče
00050000-554c-a58b-7f5d-bedf1e45b971	1225	Lukovica
00050000-554c-a58b-b243-f3662eb220f6	9202	Mačkovci
00050000-554c-a58b-f31f-2f4662a2e5b5	2322	Majšperk
00050000-554c-a58b-bdf4-4c0d9b2a33e6	2321	Makole
00050000-554c-a58b-852d-e35e2fc6356c	9243	Mala Nedelja
00050000-554c-a58b-2fee-c4888cf48420	2229	Malečnik
00050000-554c-a58b-4aa1-fdb777dff5ef	6273	Marezige
00050000-554c-a58b-ab0e-2063e5ca462f	2000	Maribor 
00050000-554c-a58b-40a3-eb3c596c5078	2001	Maribor - poštni predali
00050000-554c-a58b-0e54-261ed9fbdc3a	2206	Marjeta na Dravskem polju
00050000-554c-a58b-1d0d-c72a897db16f	2281	Markovci
00050000-554c-a58b-8c57-77eae3cbbf2e	9221	Martjanci
00050000-554c-a58b-5ba4-c182188bfd3d	6242	Materija
00050000-554c-a58b-a10f-91483fde01d0	4211	Mavčiče
00050000-554c-a58b-36b9-9cfc9560f20d	1215	Medvode
00050000-554c-a58b-52c8-15041ef871cc	1234	Mengeš
00050000-554c-a58b-e6ce-378828daf4f7	8330	Metlika
00050000-554c-a58b-15e7-4f346bb83533	2392	Mežica
00050000-554c-a58b-b7a8-588b1e12ca94	2204	Miklavž na Dravskem polju
00050000-554c-a58b-c361-ae8b3060f1c1	2275	Miklavž pri Ormožu
00050000-554c-a58b-ee60-b9f7a4509aff	5291	Miren
00050000-554c-a58b-a593-09a0738cb3ba	8233	Mirna
00050000-554c-a58b-938b-bf26583f010f	8216	Mirna Peč
00050000-554c-a58b-f0ac-38c7cde8f0aa	2382	Mislinja
00050000-554c-a58b-2f94-27227c309d58	4281	Mojstrana
00050000-554c-a58b-8a50-e4a211cd56ef	8230	Mokronog
00050000-554c-a58b-a345-1b0531fad0c3	1251	Moravče
00050000-554c-a58b-c67b-859cb23bee27	9226	Moravske Toplice
00050000-554c-a58b-f597-2a421cdc5fd6	5216	Most na Soči
00050000-554c-a58b-c00c-b3061ac8832b	1221	Motnik
00050000-554c-a58b-6a73-fe7ad88bf093	3330	Mozirje
00050000-554c-a58b-1377-9073e5b47076	9000	Murska Sobota 
00050000-554c-a58b-3491-83ff21bd32f9	9001	Murska Sobota - poštni predali
00050000-554c-a58b-4f58-0be74bf6adae	2366	Muta
00050000-554c-a58b-f09a-044fd5312570	4202	Naklo
00050000-554c-a58b-4321-321b82f24ac0	3331	Nazarje
00050000-554c-a58b-c245-db8958cedb66	1357	Notranje Gorice
00050000-554c-a58b-8e51-13210b3309a6	3203	Nova Cerkev
00050000-554c-a58b-c617-d7b3a8e062ea	5000	Nova Gorica 
00050000-554c-a58b-4cf7-366316b0cdac	5001	Nova Gorica - poštni predali
00050000-554c-a58b-b807-08dfcaedcb8d	1385	Nova vas
00050000-554c-a58b-1a07-af86e11d4026	8000	Novo mesto
00050000-554c-a58b-9f56-144f5f305f30	8001	Novo mesto - poštni predali
00050000-554c-a58b-a4d9-5bb1016dffa6	6243	Obrov
00050000-554c-a58b-8167-a6232d0a56aa	9233	Odranci
00050000-554c-a58b-5932-bc8628a84c56	2317	Oplotnica
00050000-554c-a58b-15b2-036fb795b8c9	2312	Orehova vas
00050000-554c-a58b-869a-95dc9442261f	2270	Ormož
00050000-554c-a58b-6c95-94077b2005f5	1316	Ortnek
00050000-554c-a58b-f019-fc5af1257857	1337	Osilnica
00050000-554c-a58b-6041-9d4d92fd70a5	8222	Otočec
00050000-554c-a58b-194d-241b2c612f95	2361	Ožbalt
00050000-554c-a58b-fa5d-1ba158692fb8	2231	Pernica
00050000-554c-a58b-c02b-2d6724ee93ee	2211	Pesnica pri Mariboru
00050000-554c-a58b-3442-dee60de71f4d	9203	Petrovci
00050000-554c-a58b-0fe2-d737cd13aee7	3301	Petrovče
00050000-554c-a58b-a065-30c994165703	6330	Piran/Pirano
00050000-554c-a58b-abf3-5936b0174efa	8255	Pišece
00050000-554c-a58b-ccb4-95766bce2bd1	6257	Pivka
00050000-554c-a58b-4cb7-f2d40e09a03a	6232	Planina
00050000-554c-a58b-522c-1fb8671d5b8a	3225	Planina pri Sevnici
00050000-554c-a58b-8fbd-d531602a0bc2	6276	Pobegi
00050000-554c-a58b-8ce1-ee229ea42436	8312	Podbočje
00050000-554c-a58b-b8d6-b4d2caa4d18a	5243	Podbrdo
00050000-554c-a58b-d82c-042e10ee7e99	3254	Podčetrtek
00050000-554c-a58b-fcd1-c2aa04415386	2273	Podgorci
00050000-554c-a58b-1ccc-e17bd196289c	6216	Podgorje
00050000-554c-a58b-2575-5966f5af1b32	2381	Podgorje pri Slovenj Gradcu
00050000-554c-a58b-51ab-847cfb79454d	6244	Podgrad
00050000-554c-a58b-675b-9aca1725046e	1414	Podkum
00050000-554c-a58b-9b42-cd7adff3c793	2286	Podlehnik
00050000-554c-a58b-108a-ae016627e87d	5272	Podnanos
00050000-554c-a58b-ec69-cc3ff49db1a3	4244	Podnart
00050000-554c-a58b-386c-bf2f5e90afc8	3241	Podplat
00050000-554c-a58b-6086-ba0c6facf4df	3257	Podsreda
00050000-554c-a58b-3829-5af13282f2c6	2363	Podvelka
00050000-554c-a58b-46f1-7e20d9ac55cf	2208	Pohorje
00050000-554c-a58b-6853-f29842ea636e	2257	Polenšak
00050000-554c-a58b-74cc-c6f81d89b6f9	1355	Polhov Gradec
00050000-554c-a58b-0a0f-01c54e75784b	4223	Poljane nad Škofjo Loko
00050000-554c-a58b-7480-a9909a9a6ebf	2319	Poljčane
00050000-554c-a58b-56a1-23685e9f1874	1272	Polšnik
00050000-554c-a58b-f494-cbb6672bffc7	3313	Polzela
00050000-554c-a58b-de56-1fe0b5446d6e	3232	Ponikva
00050000-554c-a58b-b47f-dbe8feee32e1	6320	Portorož/Portorose
00050000-554c-a58b-c825-ede587b830a6	6230	Postojna
00050000-554c-a58b-dd95-a58a75584d8b	2331	Pragersko
00050000-554c-a58b-b240-e970bf539259	3312	Prebold
00050000-554c-a58b-298f-14cec28824f7	4205	Preddvor
00050000-554c-a58b-962c-a90f0e466934	6255	Prem
00050000-554c-a58b-27cf-d7f37fdc62a8	1352	Preserje
00050000-554c-a58b-56e4-029ac069b8c9	6258	Prestranek
00050000-554c-a58b-12ce-578b49f952af	2391	Prevalje
00050000-554c-a58b-3cc8-63582baf24be	3262	Prevorje
00050000-554c-a58b-2528-523b62b2a466	1276	Primskovo 
00050000-554c-a58b-c533-e67f76c50c7e	3253	Pristava pri Mestinju
00050000-554c-a58b-c9a4-81dee0bd3ec5	9207	Prosenjakovci/Partosfalva
00050000-554c-a58b-4fc6-3ca4cd0f9ae1	5297	Prvačina
00050000-554c-a58b-7a89-7903da73e845	2250	Ptuj
00050000-554c-a58b-cc09-840a64a60684	2323	Ptujska Gora
00050000-554c-a58b-2bfb-21f32eff5d04	9201	Puconci
00050000-554c-a58b-8b7b-ca7d1772aaf2	2327	Rače
00050000-554c-a58b-4db4-e2a65cab0c4f	1433	Radeče
00050000-554c-a58b-7776-8cf055822639	9252	Radenci
00050000-554c-a58b-4c61-0a53c79c8467	2360	Radlje ob Dravi
00050000-554c-a58b-dcb6-fa3b1742b006	1235	Radomlje
00050000-554c-a58b-3865-fd701b9249bb	4240	Radovljica
00050000-554c-a58b-be3a-b4ad87b9ea8b	8274	Raka
00050000-554c-a58b-2f96-2da71e4d23eb	1381	Rakek
00050000-554c-a58b-fe6d-cd0c2f1ddae4	4283	Rateče - Planica
00050000-554c-a58b-7086-f1ce0c218834	2390	Ravne na Koroškem
00050000-554c-a58b-b5cc-f0fb761b7d68	9246	Razkrižje
00050000-554c-a58b-7536-086f54873cda	3332	Rečica ob Savinji
00050000-554c-a58b-4f44-81652f84ddd0	5292	Renče
00050000-554c-a58b-0579-7614fe1d3663	1310	Ribnica
00050000-554c-a58b-3332-9a7ce0651762	2364	Ribnica na Pohorju
00050000-554c-a58b-637a-9b1cb1ae5da9	3272	Rimske Toplice
00050000-554c-a58b-52aa-ef083b4bfe4c	1314	Rob
00050000-554c-a58b-d4b5-2698c1b58233	5215	Ročinj
00050000-554c-a58b-19ef-df70de97eec2	3250	Rogaška Slatina
00050000-554c-a58b-88c8-1b31d5109577	9262	Rogašovci
00050000-554c-a58b-7a02-0c29ec30a847	3252	Rogatec
00050000-554c-a58b-459c-b4a92f0fcd38	1373	Rovte
00050000-554c-a58b-6c0d-defe089f227a	2342	Ruše
00050000-554c-a58b-b567-3f453a4edf59	1282	Sava
00050000-554c-a58b-f424-3e38b745d015	6333	Sečovlje/Sicciole
00050000-554c-a58b-e2ff-e630fda2604d	4227	Selca
00050000-554c-a58b-eef1-c2fdf505021f	2352	Selnica ob Dravi
00050000-554c-a58b-745f-8227aaa96f4b	8333	Semič
00050000-554c-a58b-2bd4-e8c537733c4c	8281	Senovo
00050000-554c-a58b-c048-9174ac209c39	6224	Senožeče
00050000-554c-a58b-8d47-dda0911e5ec9	8290	Sevnica
00050000-554c-a58b-72a2-1c1a4f47879a	6210	Sežana
00050000-554c-a58b-6138-25563dd44eb1	2214	Sladki Vrh
00050000-554c-a58b-1433-9263e914ebdb	5283	Slap ob Idrijci
00050000-554c-a58b-2515-ee353ea94c0d	2380	Slovenj Gradec
00050000-554c-a58b-8e08-c3a2fff33fdd	2310	Slovenska Bistrica
00050000-554c-a58b-b892-ea764536ddf8	3210	Slovenske Konjice
00050000-554c-a58b-8353-7759ee20021c	1216	Smlednik
00050000-554c-a58b-1d8a-f21b12634e2e	5232	Soča
00050000-554c-a58b-176e-246935952d11	1317	Sodražica
00050000-554c-a58b-3c1b-cad0912e1b60	3335	Solčava
00050000-554c-a58b-3150-3038f0d1e076	5250	Solkan
00050000-554c-a58b-a49f-99d7b93b9828	4229	Sorica
00050000-554c-a58b-71a1-72a8b1ba15bd	4225	Sovodenj
00050000-554c-a58b-218f-098d7a41e5d9	5281	Spodnja Idrija
00050000-554c-a58b-b4b8-9552fe23a2d3	2241	Spodnji Duplek
00050000-554c-a58b-9bd3-f55c30cbbab9	9245	Spodnji Ivanjci
00050000-554c-a58b-79d5-0261a8096ffb	2277	Središče ob Dravi
00050000-554c-a58b-1a09-5a7951260bad	4267	Srednja vas v Bohinju
00050000-554c-a58b-8bfb-5f25a10e267f	8256	Sromlje 
00050000-554c-a58b-bdd3-36cc743bc737	5224	Srpenica
00050000-554c-a58b-e701-0e91ca3b62c3	1242	Stahovica
00050000-554c-a58b-3235-d728b2393210	1332	Stara Cerkev
00050000-554c-a58b-2456-763edede6004	8342	Stari trg ob Kolpi
00050000-554c-a58b-2f32-24eaa9689528	1386	Stari trg pri Ložu
00050000-554c-a58b-1cdd-7245c2e0d552	2205	Starše
00050000-554c-a58b-0fbf-e7af1d9025b2	2289	Stoperce
00050000-554c-a58b-5f83-123e13f4367e	8322	Stopiče
00050000-554c-a58b-615b-77ae63bd7922	3206	Stranice
00050000-554c-a58b-d26c-529d735d9e91	8351	Straža
00050000-554c-a58b-ce3c-4a2ecb5c8a00	1313	Struge
00050000-554c-a58b-195c-b736b6e04b12	8293	Studenec
00050000-554c-a58b-9f42-966aa7fa9685	8331	Suhor
00050000-554c-a58b-ce7d-12bc027ce18e	2233	Sv. Ana v Slovenskih goricah
00050000-554c-a58b-8873-b0658a5d49c8	2235	Sv. Trojica v Slovenskih goricah
00050000-554c-a58b-4d5f-a6aba22aac38	2353	Sveti Duh na Ostrem Vrhu
00050000-554c-a58b-f6d4-eee767538272	9244	Sveti Jurij ob Ščavnici
00050000-554c-a58b-34d3-5f25c76cc8b5	3264	Sveti Štefan
00050000-554c-a58b-9d9f-fbd1638583b4	2258	Sveti Tomaž
00050000-554c-a58b-16d5-2c630615acfc	9204	Šalovci
00050000-554c-a58b-fe0e-dec7bdb1bec0	5261	Šempas
00050000-554c-a58b-867a-b8b98d2c1c16	5290	Šempeter pri Gorici
00050000-554c-a58b-6afb-adf694e39e88	3311	Šempeter v Savinjski dolini
00050000-554c-a58b-fc49-6a959362a591	4208	Šenčur
00050000-554c-a58b-419a-cd79c0e3a76f	2212	Šentilj v Slovenskih goricah
00050000-554c-a58b-e4bf-5670d157d878	8297	Šentjanž
00050000-554c-a58b-e020-a6320b785c1b	2373	Šentjanž pri Dravogradu
00050000-554c-a58b-7cf2-4630aaac65b3	8310	Šentjernej
00050000-554c-a58b-7095-4d9b2867307f	3230	Šentjur
00050000-554c-a58b-628c-ec875d4ec5ea	3271	Šentrupert
00050000-554c-a58b-30ef-6a63a18b7e7d	8232	Šentrupert
00050000-554c-a58b-f0ae-faec8ad8401e	1296	Šentvid pri Stični
00050000-554c-a58b-342c-6c5ca1e2fb5a	8275	Škocjan
00050000-554c-a58b-2a79-2e71464edf31	6281	Škofije
00050000-554c-a58b-363e-2849aa36293b	4220	Škofja Loka
00050000-554c-a58b-72ad-37617c3160dd	3211	Škofja vas
00050000-554c-a58b-95af-ecff2daf9e2f	1291	Škofljica
00050000-554c-a58b-21d1-21cea114f9e1	6274	Šmarje
00050000-554c-a58b-cd02-2ac3f5571983	1293	Šmarje - Sap
00050000-554c-a58b-268c-5ff5d6e5153d	3240	Šmarje pri Jelšah
00050000-554c-a58b-fb7b-7d2f6092b0fc	8220	Šmarješke Toplice
00050000-554c-a58b-8cfc-be70bbce22bd	2315	Šmartno na Pohorju
00050000-554c-a58b-31d1-75940f3fb43b	3341	Šmartno ob Dreti
00050000-554c-a58b-e914-32636dac428c	3327	Šmartno ob Paki
00050000-554c-a58b-e5ee-81b24192e846	1275	Šmartno pri Litiji
00050000-554c-a58b-4c9d-4085e14cf79b	2383	Šmartno pri Slovenj Gradcu
00050000-554c-a58b-34d7-eae964bcf7e0	3201	Šmartno v Rožni dolini
00050000-554c-a58b-f297-961b58b47ca0	3325	Šoštanj
00050000-554c-a58b-3289-9e8dd44153b4	6222	Štanjel
00050000-554c-a58b-f751-77602a9a891c	3220	Štore
00050000-554c-a58b-a7e9-4420be3ba38e	3304	Tabor
00050000-554c-a58b-dfa9-e4d3166067ce	3221	Teharje
00050000-554c-a58b-4c5d-e430fc8b7c89	9251	Tišina
00050000-554c-a58b-6ae0-dcad4519ca66	5220	Tolmin
00050000-554c-a58b-ec2a-62934fa5bbfe	3326	Topolšica
00050000-554c-a58b-1aa3-627b23c0982f	2371	Trbonje
00050000-554c-a58b-aeff-d4d70ed6f4ad	1420	Trbovlje
00050000-554c-a58b-12b1-68602329b70f	8231	Trebelno 
00050000-554c-a58b-38ce-3efbb6a1bc36	8210	Trebnje
00050000-554c-a58b-89b6-4edc90be7757	5252	Trnovo pri Gorici
00050000-554c-a58b-efb1-e2acd4b4c0ce	2254	Trnovska vas
00050000-554c-a58b-211a-0beda424bb0e	1222	Trojane
00050000-554c-a58b-c23f-7075d3c1033b	1236	Trzin
00050000-554c-a58b-e22b-014a34840257	4290	Tržič
00050000-554c-a58b-724b-e4e8b3705010	8295	Tržišče
00050000-554c-a58b-647c-7434a2eaed6f	1311	Turjak
00050000-554c-a58b-d321-5e6db351e687	9224	Turnišče
00050000-554c-a58b-58cb-7989e06fd2e5	8323	Uršna sela
00050000-554c-a58b-7e28-186ecf295d2e	1252	Vače
00050000-554c-a58b-1ebe-1b7ca6f01f46	3320	Velenje 
00050000-554c-a58b-7499-9e36639a22ed	3322	Velenje - poštni predali
00050000-554c-a58b-7f5c-36318086455e	8212	Velika Loka
00050000-554c-a58b-f8bb-01ae4c6410c8	2274	Velika Nedelja
00050000-554c-a58b-3501-0a2332b2e0bb	9225	Velika Polana
00050000-554c-a58b-bf27-5768b9643407	1315	Velike Lašče
00050000-554c-a58b-69cf-73e951197ac3	8213	Veliki Gaber
00050000-554c-a58b-60ad-c2c9d68f7672	9241	Veržej
00050000-554c-a58b-ec3b-2ddc7cd11620	1312	Videm - Dobrepolje
00050000-554c-a58b-97ba-48c3300a7090	2284	Videm pri Ptuju
00050000-554c-a58b-964e-4815652b1181	8344	Vinica
00050000-554c-a58b-4734-929c0c164cbb	5271	Vipava
00050000-554c-a58b-6898-72156a889464	4212	Visoko
00050000-554c-a58b-2936-b253a26f1a31	1294	Višnja Gora
00050000-554c-a58b-bfb7-c1815d0b3b8d	3205	Vitanje
00050000-554c-a58b-c9f7-31ae0ddb6d74	2255	Vitomarci
00050000-554c-a58b-778e-e1ad81fccf06	1217	Vodice
00050000-554c-a58b-2ac7-55b0b9c47c20	3212	Vojnik\t
00050000-554c-a58b-936c-702ea483b19f	5293	Volčja Draga
00050000-554c-a58b-929c-b049cda4d84e	2232	Voličina
00050000-554c-a58b-d239-8a2b3014ccba	3305	Vransko
00050000-554c-a58b-f6b2-5a2273655273	6217	Vremski Britof
00050000-554c-a58b-6b4c-5cbb817de642	1360	Vrhnika
00050000-554c-a58b-6939-616d7464366a	2365	Vuhred
00050000-554c-a58b-e3a3-b28002ba5aa6	2367	Vuzenica
00050000-554c-a58b-ec52-414fed0c7b5e	8292	Zabukovje 
00050000-554c-a58b-b08b-b0967ca9e5a3	1410	Zagorje ob Savi
00050000-554c-a58b-0dfb-44dff43adacb	1303	Zagradec
00050000-554c-a58b-4064-6fc32b533ffe	2283	Zavrč
00050000-554c-a58b-2185-3e26c487bfae	8272	Zdole 
00050000-554c-a58b-b321-e97d19efbcaf	4201	Zgornja Besnica
00050000-554c-a58b-b656-f1ec7cbd9a84	2242	Zgornja Korena
00050000-554c-a58b-3992-6418a1944e08	2201	Zgornja Kungota
00050000-554c-a58b-14e1-4d8cc3f55f33	2316	Zgornja Ložnica
00050000-554c-a58b-5314-80a59f41f009	2314	Zgornja Polskava
00050000-554c-a58b-f62f-0c5c2797ce3b	2213	Zgornja Velka
00050000-554c-a58b-a6f5-37039a2df3fc	4247	Zgornje Gorje
00050000-554c-a58b-a37f-4cb118e59be9	4206	Zgornje Jezersko
00050000-554c-a58b-be31-c3c89bad9bcf	2285	Zgornji Leskovec
00050000-554c-a58b-dfe0-4e3cbafd5c57	1432	Zidani Most
00050000-554c-a58b-c070-7fa7be319f35	3214	Zreče
00050000-554c-a58b-2fb6-76f481810fe0	4209	Žabnica
00050000-554c-a58b-12e4-9a8d1a8b95d8	3310	Žalec
00050000-554c-a58b-361e-92d9285cd16a	4228	Železniki
00050000-554c-a58b-822e-5ebd86cd7c87	2287	Žetale
00050000-554c-a58b-4ae7-ccd6d509313c	4226	Žiri
00050000-554c-a58b-d8f4-eae594fb4449	4274	Žirovnica
00050000-554c-a58b-ede2-c638d3f5215c	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 2753972)
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
-- TOC entry 2642 (class 0 OID 2753795)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 2753861)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 2753984)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 2754088)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 2754132)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 2754013)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 2753957)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 2753947)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 2754122)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 2754078)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 2753661)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-554c-a58c-e512-f8ed1befe202	00010000-554c-a58c-41b4-9dff9ce6e160	2015-05-08 14:01:16	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO8vDn0l9wIJfx3ncPPhvWp0El2S.eb9u";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 2754022)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 2753701)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-554c-a58c-da27-2b0bc2b7ed8f	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-554c-a58c-8e97-29934c66468a	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-554c-a58c-c5e7-7264a50d25c5	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-554c-a58c-72d8-792387e9f516	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-554c-a58c-6887-c8a9d504a782	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-554c-a58c-ac1c-86191d4ceb59	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 2753684)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-554c-a58c-e512-f8ed1befe202	00020000-554c-a58c-72d8-792387e9f516
00010000-554c-a58c-41b4-9dff9ce6e160	00020000-554c-a58c-72d8-792387e9f516
\.


--
-- TOC entry 2668 (class 0 OID 2754036)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 2753978)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 2753928)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 2753760)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 2753934)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 2754113)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 2753830)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 2753670)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-554c-a58c-41b4-9dff9ce6e160	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO7HddDcUran4DbrmmBxZSx/uMZS8dkaq	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-554c-a58c-e512-f8ed1befe202	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 2754164)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 2753876)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 2754005)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 2754070)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 2753904)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 2754154)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 2754061)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2274 (class 2606 OID 2753725)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 2754203)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 2754196)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 2754112)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 2753894)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2343 (class 2606 OID 2753927)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 2753856)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 2754057)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 2753874)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 2753921)
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
-- TOC entry 2364 (class 2606 OID 2753970)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 2753997)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2303 (class 2606 OID 2753828)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2278 (class 2606 OID 2753734)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2293 (class 2606 OID 2753792)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2280 (class 2606 OID 2753758)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2272 (class 2606 OID 2753714)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2264 (class 2606 OID 2753699)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 2754003)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 2754035)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 2754149)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2288 (class 2606 OID 2753785)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 2753816)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 2753976)
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
-- TOC entry 2298 (class 2606 OID 2753806)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 2753865)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 2753988)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 2754094)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 2754137)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 2754020)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 2753961)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 2753952)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 2754131)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 2754085)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 2753669)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 2754026)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2262 (class 2606 OID 2753688)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2267 (class 2606 OID 2753708)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2395 (class 2606 OID 2754044)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 2753983)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 2753933)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2285 (class 2606 OID 2753765)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 2753943)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 2754121)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2308 (class 2606 OID 2753841)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2258 (class 2606 OID 2753682)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 2754178)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 2753880)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 2754011)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 2754076)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 2753916)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 2754163)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 2754069)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 1259 OID 2753901)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2286 (class 1259 OID 2753787)
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
-- TOC entry 2377 (class 1259 OID 2754004)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2371 (class 1259 OID 2753990)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2372 (class 1259 OID 2753989)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2323 (class 1259 OID 2753881)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 2754060)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2399 (class 1259 OID 2754058)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 2754059)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2423 (class 1259 OID 2754151)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2424 (class 1259 OID 2754152)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2425 (class 1259 OID 2754153)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 2754181)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 2754180)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 2754179)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2305 (class 1259 OID 2753843)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2306 (class 1259 OID 2753842)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2290 (class 1259 OID 2753794)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 2753793)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2386 (class 1259 OID 2754027)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2341 (class 1259 OID 2753922)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2269 (class 1259 OID 2753715)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2270 (class 1259 OID 2753716)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2391 (class 1259 OID 2754047)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2392 (class 1259 OID 2754046)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2393 (class 1259 OID 2754045)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2315 (class 1259 OID 2753866)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2316 (class 1259 OID 2753868)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2317 (class 1259 OID 2753867)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2351 (class 1259 OID 2753956)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2352 (class 1259 OID 2753954)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2353 (class 1259 OID 2753953)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2354 (class 1259 OID 2753955)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2259 (class 1259 OID 2753689)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2260 (class 1259 OID 2753690)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2380 (class 1259 OID 2754012)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2366 (class 1259 OID 2753977)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2406 (class 1259 OID 2754086)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2407 (class 1259 OID 2754087)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2294 (class 1259 OID 2753808)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2295 (class 1259 OID 2753807)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2296 (class 1259 OID 2753809)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2410 (class 1259 OID 2754095)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2411 (class 1259 OID 2754096)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 2754206)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 2754205)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 2754208)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 2754204)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2446 (class 1259 OID 2754207)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2403 (class 1259 OID 2754077)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2357 (class 1259 OID 2753965)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2358 (class 1259 OID 2753964)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2359 (class 1259 OID 2753962)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2360 (class 1259 OID 2753963)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2245 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 2754198)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 2754197)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2322 (class 1259 OID 2753875)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2275 (class 1259 OID 2753736)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2276 (class 1259 OID 2753735)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2282 (class 1259 OID 2753766)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2283 (class 1259 OID 2753767)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2346 (class 1259 OID 2753946)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2347 (class 1259 OID 2753945)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2348 (class 1259 OID 2753944)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2329 (class 1259 OID 2753903)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2330 (class 1259 OID 2753899)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2331 (class 1259 OID 2753896)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2332 (class 1259 OID 2753897)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2333 (class 1259 OID 2753895)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2334 (class 1259 OID 2753900)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2335 (class 1259 OID 2753898)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2289 (class 1259 OID 2753786)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2311 (class 1259 OID 2753857)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 2753859)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2313 (class 1259 OID 2753858)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2314 (class 1259 OID 2753860)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2365 (class 1259 OID 2753971)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2428 (class 1259 OID 2754150)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2281 (class 1259 OID 2753759)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2304 (class 1259 OID 2753829)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2256 (class 1259 OID 2753683)
-- Name: uniq_7fb775b7e7927c74; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7e7927c74 ON uporabniki USING btree (email);


--
-- TOC entry 2385 (class 1259 OID 2754021)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2265 (class 1259 OID 2753700)
-- Name: uniq_af14917a5e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_af14917a5e237e06 ON permission USING btree (name);


--
-- TOC entry 2248 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2301 (class 1259 OID 2753817)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2422 (class 1259 OID 2754138)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2268 (class 1259 OID 2753709)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2336 (class 1259 OID 2753902)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2471 (class 2606 OID 2754339)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 2754324)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 2754329)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2469 (class 2606 OID 2754349)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2475 (class 2606 OID 2754319)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2470 (class 2606 OID 2754344)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 2754334)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 2754254)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 2754434)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2490 (class 2606 OID 2754429)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2491 (class 2606 OID 2754424)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 2754314)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2498 (class 2606 OID 2754474)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 2754464)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 2754469)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 2754414)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 2754509)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 2754514)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 2754519)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2510 (class 2606 OID 2754534)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 2754529)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 2754524)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2462 (class 2606 OID 2754289)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 2754284)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 2754264)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 2754259)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 2754239)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 2754444)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 2754354)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 2754219)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2449 (class 2606 OID 2754224)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2495 (class 2606 OID 2754459)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 2754454)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 2754449)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 2754294)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 2754304)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 2754299)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2480 (class 2606 OID 2754389)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2482 (class 2606 OID 2754379)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2483 (class 2606 OID 2754374)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2481 (class 2606 OID 2754384)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 2754209)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2447 (class 2606 OID 2754214)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 2754439)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 2754419)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2503 (class 2606 OID 2754484)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2502 (class 2606 OID 2754489)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 2754274)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 2754269)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 2754279)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2505 (class 2606 OID 2754494)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 2754499)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 2754559)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 2754554)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2515 (class 2606 OID 2754569)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 2754549)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2516 (class 2606 OID 2754564)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 2754479)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 2754409)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2485 (class 2606 OID 2754404)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 2754394)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2486 (class 2606 OID 2754399)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2513 (class 2606 OID 2754544)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2514 (class 2606 OID 2754539)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 2754309)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 2754504)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 2754234)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 2754229)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2455 (class 2606 OID 2754244)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 2754249)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2477 (class 2606 OID 2754369)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 2754364)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 2754359)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-08 14:01:17 CEST

--
-- PostgreSQL database dump complete
--

