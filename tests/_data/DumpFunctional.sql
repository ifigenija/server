--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-04-27 21:52:16 CEST

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
-- TOC entry 179 (class 1259 OID 1476113)
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
-- TOC entry 225 (class 1259 OID 1476596)
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
-- TOC entry 224 (class 1259 OID 1476579)
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
-- TOC entry 217 (class 1259 OID 1476495)
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
-- TOC entry 193 (class 1259 OID 1476279)
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
-- TOC entry 196 (class 1259 OID 1476320)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 1476241)
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
-- TOC entry 212 (class 1259 OID 1476445)
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
-- TOC entry 191 (class 1259 OID 1476266)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 1476314)
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
-- TOC entry 201 (class 1259 OID 1476363)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 1476388)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 1476215)
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
-- TOC entry 180 (class 1259 OID 1476122)
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
-- TOC entry 181 (class 1259 OID 1476133)
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
-- TOC entry 184 (class 1259 OID 1476185)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 1476087)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 1476106)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 1476395)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 1476425)
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
-- TOC entry 221 (class 1259 OID 1476537)
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
-- TOC entry 183 (class 1259 OID 1476165)
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
-- TOC entry 186 (class 1259 OID 1476207)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 1476369)
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
-- TOC entry 185 (class 1259 OID 1476192)
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
-- TOC entry 190 (class 1259 OID 1476258)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 1476381)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 1476486)
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
-- TOC entry 220 (class 1259 OID 1476530)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 1476410)
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
-- TOC entry 200 (class 1259 OID 1476354)
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
-- TOC entry 199 (class 1259 OID 1476344)
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
-- TOC entry 219 (class 1259 OID 1476520)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 1476476)
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
-- TOC entry 173 (class 1259 OID 1476057)
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
-- TOC entry 172 (class 1259 OID 1476055)
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
-- TOC entry 209 (class 1259 OID 1476419)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 1476097)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 1476080)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 1476433)
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
-- TOC entry 203 (class 1259 OID 1476375)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 1476325)
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
-- TOC entry 182 (class 1259 OID 1476157)
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
-- TOC entry 198 (class 1259 OID 1476331)
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
-- TOC entry 218 (class 1259 OID 1476511)
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
-- TOC entry 188 (class 1259 OID 1476227)
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
-- TOC entry 174 (class 1259 OID 1476066)
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
-- TOC entry 223 (class 1259 OID 1476561)
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
-- TOC entry 192 (class 1259 OID 1476273)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 1476402)
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
-- TOC entry 214 (class 1259 OID 1476468)
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
-- TOC entry 194 (class 1259 OID 1476301)
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
-- TOC entry 222 (class 1259 OID 1476551)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 1476458)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 1476060)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2637 (class 0 OID 1476113)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2683 (class 0 OID 1476596)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 1476579)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 1476495)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 1476279)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 1476320)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 1476241)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-553e-936f-25ee-0a6c9045665f	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-553e-936f-3144-3f0c18c6db03	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-553e-936f-ae80-e9eac3dc8e80	AL	ALB	008	Albania 	Albanija	\N
00040000-553e-9370-5499-7e004a856ec1	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-553e-9370-192c-15437503684c	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-553e-9370-33a2-1c2589e68c31	AD	AND	020	Andorra 	Andora	\N
00040000-553e-9370-43ca-32124ecf322e	AO	AGO	024	Angola 	Angola	\N
00040000-553e-9370-f695-eb72c5ee694d	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-553e-9370-28fb-874af8303292	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-553e-9370-f5cb-edf525530c18	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-553e-9370-96c6-35d004f71b6b	AR	ARG	032	Argentina 	Argenitna	\N
00040000-553e-9370-7f4a-4cded9916df8	AM	ARM	051	Armenia 	Armenija	\N
00040000-553e-9370-f6ec-c8b678902b9e	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-553e-9370-e743-f2f02eed6942	AU	AUS	036	Australia 	Avstralija	\N
00040000-553e-9370-c3d7-e3d9f1568e11	AT	AUT	040	Austria 	Avstrija	\N
00040000-553e-9370-4f5f-b96427bf6591	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-553e-9370-0f5b-78d36fda4959	BS	BHS	044	Bahamas 	Bahami	\N
00040000-553e-9370-0027-77d9d3dc43a3	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-553e-9370-ca9a-769f368d86bc	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-553e-9370-bbbd-7dffb821abe2	BB	BRB	052	Barbados 	Barbados	\N
00040000-553e-9370-209a-4250f28da077	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-553e-9370-70cd-9cdf46f1382a	BE	BEL	056	Belgium 	Belgija	\N
00040000-553e-9370-69e0-5387fc82ec5e	BZ	BLZ	084	Belize 	Belize	\N
00040000-553e-9370-28e2-a644370add1e	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-553e-9370-e8f4-de04a25c1412	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-553e-9370-a701-342e0d2a3d0e	BT	BTN	064	Bhutan 	Butan	\N
00040000-553e-9370-1449-d148b0392a9f	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-553e-9370-2f63-1e021afad09c	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-553e-9370-996f-64a587d7a7a8	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-553e-9370-45f2-c7bab59412c9	BW	BWA	072	Botswana 	Bocvana	\N
00040000-553e-9370-9513-24cb1bbbe0ef	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-553e-9370-8e1c-cad0b27e6bff	BR	BRA	076	Brazil 	Brazilija	\N
00040000-553e-9370-5906-4b94c65228b1	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-553e-9370-ede9-978354289bd2	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-553e-9370-68b1-89d809095814	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-553e-9370-e845-e8a0f5bc5e13	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-553e-9370-db00-6cadb165a471	BI	BDI	108	Burundi 	Burundi 	\N
00040000-553e-9370-9022-fde9a64e6dfd	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-553e-9370-937b-16ad36fc2145	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-553e-9370-d7d4-d9d5b4fc2d33	CA	CAN	124	Canada 	Kanada	\N
00040000-553e-9370-dc81-97433b89d039	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-553e-9370-bbf6-35edc37e626d	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-553e-9370-e2b9-1d02aa47a7d9	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-553e-9370-e6dc-05049b440960	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-553e-9370-7ae6-b9eaa27c5434	CL	CHL	152	Chile 	Čile	\N
00040000-553e-9370-0571-11eed645836c	CN	CHN	156	China 	Kitajska	\N
00040000-553e-9370-b0c6-a31b54fb9df4	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-553e-9370-1746-5e247ddf6501	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-553e-9370-8ded-659101f61085	CO	COL	170	Colombia 	Kolumbija	\N
00040000-553e-9370-1a8a-af203c7e7bbc	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-553e-9370-5990-c89701945630	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-553e-9370-9055-2e084670b98a	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-553e-9370-5ef5-e8159acfe3ca	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-553e-9370-2937-c31349829fee	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-553e-9370-179a-9e3e7c55f363	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-553e-9370-71e5-62de61ad294d	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-553e-9370-cf05-2862a0d24b4c	CU	CUB	192	Cuba 	Kuba	\N
00040000-553e-9370-a40f-2419a0e4a093	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-553e-9370-f5e0-c92ccd4340c2	CY	CYP	196	Cyprus 	Ciper	\N
00040000-553e-9370-97f2-3e1286a2df96	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-553e-9370-7b8d-d83d25c02e1b	DK	DNK	208	Denmark 	Danska	\N
00040000-553e-9370-6ee8-abba4cd29109	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-553e-9370-37a0-c257b702773c	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-553e-9370-beb7-34e995fb4bfc	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-553e-9370-042f-d46577e3f517	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-553e-9370-cecd-b6c075766f94	EG	EGY	818	Egypt 	Egipt	\N
00040000-553e-9370-a262-da1ec71e256f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-553e-9370-db33-69539f2e2339	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-553e-9370-4088-5a6b92bb2952	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-553e-9370-8bc8-4c9a87997ea8	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-553e-9370-aae3-78b1671d8601	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-553e-9370-a596-bfee3159476e	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-553e-9370-422d-b3eb28b109d4	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-553e-9370-e097-eaa085b88601	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-553e-9370-8283-2bc89fa29437	FI	FIN	246	Finland 	Finska	\N
00040000-553e-9370-1da2-18afe9b6cc12	FR	FRA	250	France 	Francija	\N
00040000-553e-9370-a605-b5a039f525b4	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-553e-9370-0add-c5cab3aa21d6	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-553e-9370-ccda-2b820a5378e7	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-553e-9370-e148-8070184fb8dc	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-553e-9370-db90-d865667d6116	GA	GAB	266	Gabon 	Gabon	\N
00040000-553e-9370-4a6c-7b8d8ff34e18	GM	GMB	270	Gambia 	Gambija	\N
00040000-553e-9370-b385-e59864c87955	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-553e-9370-95af-69f5b3b2852f	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-553e-9370-befd-2ea47b9e1f2c	GH	GHA	288	Ghana 	Gana	\N
00040000-553e-9370-ca94-40812685d567	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-553e-9370-a3e5-dd37446d5ef7	GR	GRC	300	Greece 	Grčija	\N
00040000-553e-9370-a24a-60fe342696fa	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-553e-9370-2636-b8b851fa426c	GD	GRD	308	Grenada 	Grenada	\N
00040000-553e-9370-7167-39612e7e5f16	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-553e-9370-b7c4-92f4beac4d37	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-553e-9370-767e-8e1f7d267f3f	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-553e-9370-c0e1-ecaf587d2c9f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-553e-9370-a55d-a2ea37d23eb5	GN	GIN	324	Guinea 	Gvineja	\N
00040000-553e-9370-727a-43356edf84b8	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-553e-9370-bb2e-a0c5dd7879d6	GY	GUY	328	Guyana 	Gvajana	\N
00040000-553e-9370-3ad6-f1139c4d57da	HT	HTI	332	Haiti 	Haiti	\N
00040000-553e-9370-e2d4-c902e8ed34fe	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-553e-9370-d902-a478299f118b	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-553e-9370-52c7-f0b121e1966a	HN	HND	340	Honduras 	Honduras	\N
00040000-553e-9370-8a9a-28a417f68c20	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-553e-9370-7a50-2dfac1bb45d3	HU	HUN	348	Hungary 	Madžarska	\N
00040000-553e-9370-512d-1bccc6d6c1b0	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-553e-9370-c356-d0100d6ed34f	IN	IND	356	India 	Indija	\N
00040000-553e-9370-7009-97f21f9831b7	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-553e-9370-6ae3-af39d74b4d03	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-553e-9370-f979-ec3aebb3f1cb	IQ	IRQ	368	Iraq 	Irak	\N
00040000-553e-9370-e28f-cfc445196212	IE	IRL	372	Ireland 	Irska	\N
00040000-553e-9370-f9c4-0f87dd45e4b7	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-553e-9370-8b09-d27ee607c0b7	IL	ISR	376	Israel 	Izrael	\N
00040000-553e-9370-fb62-04c24888dcaa	IT	ITA	380	Italy 	Italija	\N
00040000-553e-9370-056f-7a8dc6d52327	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-553e-9370-0cca-04bb60f8b658	JP	JPN	392	Japan 	Japonska	\N
00040000-553e-9370-1790-1eddd0811da2	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-553e-9370-3ab6-29b114864605	JO	JOR	400	Jordan 	Jordanija	\N
00040000-553e-9370-fdc3-f99eee58c600	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-553e-9370-74d3-34824b8494c0	KE	KEN	404	Kenya 	Kenija	\N
00040000-553e-9370-5a56-8bb74d7a9c17	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-553e-9370-1e11-b4ccec975245	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-553e-9370-10b4-e82acf603b63	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-553e-9370-63fa-28cb23fcecd5	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-553e-9370-433f-789e35415630	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-553e-9370-8ac0-f13a323ecb3b	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-553e-9370-e763-81801b3c5221	LV	LVA	428	Latvia 	Latvija	\N
00040000-553e-9370-e9a7-d3ce8eec51c6	LB	LBN	422	Lebanon 	Libanon	\N
00040000-553e-9370-c342-6c1cf51582be	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-553e-9370-11b3-47849fbf9f38	LR	LBR	430	Liberia 	Liberija	\N
00040000-553e-9370-8404-c64c0c09485a	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-553e-9370-0df5-7a79ae9c7b34	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-553e-9370-4892-2ac77ca1557b	LT	LTU	440	Lithuania 	Litva	\N
00040000-553e-9370-2ee3-faa4b2d47bb4	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-553e-9370-ffe8-20efed851eb1	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-553e-9370-a3ed-2b35d421b70a	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-553e-9370-b760-8189760b8944	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-553e-9370-612b-313dc8c6963a	MW	MWI	454	Malawi 	Malavi	\N
00040000-553e-9370-246e-c3930e7dd3bb	MY	MYS	458	Malaysia 	Malezija	\N
00040000-553e-9370-f53e-4ecca7a7ccd2	MV	MDV	462	Maldives 	Maldivi	\N
00040000-553e-9370-d609-0b8b0a13798b	ML	MLI	466	Mali 	Mali	\N
00040000-553e-9370-23ce-7819203aedb2	MT	MLT	470	Malta 	Malta	\N
00040000-553e-9370-5ccd-86453d23bfd3	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-553e-9370-1dd5-cdabf408cd96	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-553e-9370-764c-295af78d9fe0	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-553e-9370-a645-a9e4cff3ae05	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-553e-9370-0be1-63d303cebfe9	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-553e-9370-985d-29252f9c016f	MX	MEX	484	Mexico 	Mehika	\N
00040000-553e-9370-a9f0-5f28b45f39cb	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-553e-9370-0748-db6598118c04	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-553e-9370-8f8f-f94858a7a6e5	MC	MCO	492	Monaco 	Monako	\N
00040000-553e-9370-e2c2-a53238c4e1e6	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-553e-9370-3b2a-5a768d2098ca	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-553e-9370-aed7-e467b79c1ed2	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-553e-9370-30b9-609ed4496f96	MA	MAR	504	Morocco 	Maroko	\N
00040000-553e-9370-4557-aab987f408ab	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-553e-9370-8e01-b0fd20368d04	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-553e-9370-54e6-0e8a51d219e4	NA	NAM	516	Namibia 	Namibija	\N
00040000-553e-9370-a1f9-b632a007f265	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-553e-9370-58a3-515b6f621288	NP	NPL	524	Nepal 	Nepal	\N
00040000-553e-9370-60c0-fc96a771259e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-553e-9370-63eb-ac4b5b400a37	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-553e-9370-3710-e8334d896951	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-553e-9370-9804-4b30f0f81bcb	NE	NER	562	Niger 	Niger 	\N
00040000-553e-9370-0442-0d46335450eb	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-553e-9370-da20-ada43432c056	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-553e-9370-bd9c-d00c6f32d39c	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-553e-9370-19ba-461753675cff	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-553e-9370-334a-9e0ba404015a	NO	NOR	578	Norway 	Norveška	\N
00040000-553e-9370-f4fa-f77df76aad6c	OM	OMN	512	Oman 	Oman	\N
00040000-553e-9370-5325-7f420bee1719	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-553e-9370-a2b9-4a1890687fd8	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-553e-9370-2f6a-36d5689d6fd8	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-553e-9370-e74d-eb4a19ddd8e6	PA	PAN	591	Panama 	Panama	\N
00040000-553e-9370-4fbf-834925d3baaf	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-553e-9370-3a0f-c9c56b7f2590	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-553e-9370-c7f7-5c59213c868e	PE	PER	604	Peru 	Peru	\N
00040000-553e-9370-2a77-76ab2fb4c383	PH	PHL	608	Philippines 	Filipini	\N
00040000-553e-9370-5ab7-59f203019a0c	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-553e-9370-a5a3-07334f03c776	PL	POL	616	Poland 	Poljska	\N
00040000-553e-9370-12f6-be1fa92cc2c2	PT	PRT	620	Portugal 	Portugalska	\N
00040000-553e-9370-7178-50ad46240f16	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-553e-9370-b972-a4bfc914346f	QA	QAT	634	Qatar 	Katar	\N
00040000-553e-9370-b19f-e51411327368	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-553e-9370-1d65-c9772a2497a0	RO	ROU	642	Romania 	Romunija	\N
00040000-553e-9370-8958-fe86da3b7845	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-553e-9370-3826-ef9445c83858	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-553e-9370-b386-82d2cac5cbe5	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-553e-9370-ad2e-d81893b83593	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-553e-9370-8507-5e0f54115d43	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-553e-9370-2351-6b36e0c02628	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-553e-9370-42b6-85d8a48060eb	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-553e-9370-57f5-321242f2037a	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-553e-9370-10d5-7e795110ac8b	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-553e-9370-3077-afa6f6f4b69f	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-553e-9370-b516-ef0db1d64338	SM	SMR	674	San Marino 	San Marino	\N
00040000-553e-9370-7be2-f4b0bd9ffdc7	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-553e-9370-253a-861bf2a2cf80	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-553e-9370-c79b-edaab7303968	SN	SEN	686	Senegal 	Senegal	\N
00040000-553e-9370-4238-c7b0ba739356	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-553e-9370-4468-df72ec56fbc7	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-553e-9370-2fc1-74e8c539b485	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-553e-9370-d124-322c1520bd63	SG	SGP	702	Singapore 	Singapur	\N
00040000-553e-9370-4979-f2293ff1b46a	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-553e-9370-6908-01ecb755d833	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-553e-9370-b050-833bf4710a3f	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-553e-9370-a04b-4aa5141216d9	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-553e-9370-7878-9793c86f4f7d	SO	SOM	706	Somalia 	Somalija	\N
00040000-553e-9370-3ccb-fb305b17ec5f	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-553e-9370-89aa-2f804c2ff2b9	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-553e-9370-b408-accf9b52115b	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-553e-9370-f6de-4f1af5c21f2b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-553e-9370-08b9-cd112b2f962e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-553e-9370-5d03-6bd4878d52e9	SD	SDN	729	Sudan 	Sudan	\N
00040000-553e-9370-bcea-17fcf628090a	SR	SUR	740	Suriname 	Surinam	\N
00040000-553e-9370-9f82-1654d5caab5c	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-553e-9370-f350-4407d981afe4	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-553e-9370-acc4-741385748818	SE	SWE	752	Sweden 	Švedska	\N
00040000-553e-9370-7379-9768218d794c	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-553e-9370-6bf5-1932374c6a6d	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-553e-9370-fe20-785315a11b6e	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-553e-9370-b760-17a4d07035d4	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-553e-9370-e155-e289dd84e1ef	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-553e-9370-711b-bdf616fa5265	TH	THA	764	Thailand 	Tajska	\N
00040000-553e-9370-c3a0-e17023f4222d	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-553e-9370-6c63-f2998363b6aa	TG	TGO	768	Togo 	Togo	\N
00040000-553e-9370-195b-c4258d203cc1	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-553e-9370-1f52-2bd6440531c0	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-553e-9370-1a3b-9882860b56cf	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-553e-9370-6ecd-05f31b3eeadc	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-553e-9370-f7a6-e0db400288ac	TR	TUR	792	Turkey 	Turčija	\N
00040000-553e-9370-28e7-b3962182c006	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-553e-9370-24f0-63aaef91bf2a	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-553e-9370-167b-4fe669f5ce7f	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-553e-9370-7f1c-90337b0956a4	UG	UGA	800	Uganda 	Uganda	\N
00040000-553e-9370-7081-6183a3b0dd91	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-553e-9370-11c2-862ffe295931	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-553e-9370-3788-7c0663ffe2e2	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-553e-9370-c5fc-e1067fbbc7dc	US	USA	840	United States 	Združene države Amerike	\N
00040000-553e-9370-da40-d5678024fa79	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-553e-9370-970a-d3cb045a45b3	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-553e-9370-4ab8-dc5f9bb27e81	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-553e-9370-7208-513613a3c966	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-553e-9370-2d78-30ab0a772b64	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-553e-9370-d9d8-c2e3162af06b	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-553e-9370-7153-a67bfe0ec1cf	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-553e-9370-91a1-1d5a853b7d02	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-553e-9370-b2f2-304646d0bf46	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-553e-9370-5b0c-db7833de7f21	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-553e-9370-d63e-c0622170033d	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-553e-9370-c298-173a4bbfcbf2	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-553e-9370-2b1d-a9cd9dcdf734	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2670 (class 0 OID 1476445)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 1476266)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 1476314)
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
-- TOC entry 2659 (class 0 OID 1476363)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 1476388)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 1476215)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-553e-9370-f058-c356f28482dc	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-553e-9370-8e6f-79c69ac72689	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-553e-9370-332a-710600958b08	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-553e-9370-5ce0-4bcd2ac7478c	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-553e-9370-df86-0de7bb5b4c0c	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-553e-9370-0c67-4a37196884fa	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-553e-9370-f1d9-820a0b0a6b6a	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-553e-9370-2815-1da911fef157	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-553e-9370-b82e-ea5346e2e8a4	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-553e-9370-4257-e1264b2d2836	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2638 (class 0 OID 1476122)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-553e-9370-82b8-8bc3f76f1418	00000000-553e-9370-df86-0de7bb5b4c0c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-553e-9370-a9fa-dbe39cfd0c84	00000000-553e-9370-df86-0de7bb5b4c0c	00010000-553e-9370-eed9-3a553cfd0ab8	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-553e-9370-9269-4ef246255ab6	00000000-553e-9370-0c67-4a37196884fa	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2639 (class 0 OID 1476133)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, pesvdonim, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 1476185)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 1476087)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-553e-9370-77c2-f1096b7cb9be	Abonma-read	Abonma - branje	f
00030000-553e-9370-b24d-0fd34c65af87	Abonma-write	Abonma - spreminjanje	f
00030000-553e-9370-6786-ab8b7d5c5af8	Alternacija-read	Alternacija - branje	f
00030000-553e-9370-02c6-3cf1f16d1c86	Alternacija-write	Alternacija - spreminjanje	f
00030000-553e-9370-7547-cef6179de388	Arhivalija-read	Arhivalija - branje	f
00030000-553e-9370-a670-230d2f3ab938	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-553e-9370-18aa-6221a9122058	Besedilo-read	Besedilo - branje	f
00030000-553e-9370-756a-ffd74e814f4a	Besedilo-write	Besedilo - spreminjanje	f
00030000-553e-9370-e340-fbcf2d7c5f79	DogodekIzven-read	DogodekIzven - branje	f
00030000-553e-9370-9a3b-3cc294efd347	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-553e-9370-2bd7-09a1891d67a9	Dogodek-read	Dogodek - branje	f
00030000-553e-9370-d693-8215dffc994f	Dogodek-write	Dogodek - spreminjanje	f
00030000-553e-9370-6760-7daebe414fb2	Drzava-read	Drzava - branje	f
00030000-553e-9370-aa06-b0aeac636fa4	Drzava-write	Drzava - spreminjanje	f
00030000-553e-9370-a722-ba309688eeb7	Funkcija-read	Funkcija - branje	f
00030000-553e-9370-7a0f-125705fc5162	Funkcija-write	Funkcija - spreminjanje	f
00030000-553e-9370-43cc-ad3e1f4accc0	Gostovanje-read	Gostovanje - branje	f
00030000-553e-9370-5069-369795de19a9	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-553e-9370-f4f8-4bc49eb21181	Gostujoca-read	Gostujoca - branje	f
00030000-553e-9370-1f24-22f3d810a1f0	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-553e-9370-d35e-cf77ea1a3a12	Kupec-read	Kupec - branje	f
00030000-553e-9370-ef10-e14a095a4671	Kupec-write	Kupec - spreminjanje	f
00030000-553e-9370-43ad-3e9b7c7bb4b2	NacinPlacina-read	NacinPlacina - branje	f
00030000-553e-9370-a41f-beadb1fcb25d	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-553e-9370-5bd5-8f9057a19dab	Option-read	Option - branje	f
00030000-553e-9370-07ca-e7724826394f	Option-write	Option - spreminjanje	f
00030000-553e-9370-dd73-4b92494ce6b1	OptionValue-read	OptionValue - branje	f
00030000-553e-9370-8520-9471aebf6af1	OptionValue-write	OptionValue - spreminjanje	f
00030000-553e-9370-5aec-b44e217cd317	Oseba-read	Oseba - branje	f
00030000-553e-9370-b3c6-1039b8ea763f	Oseba-write	Oseba - spreminjanje	f
00030000-553e-9370-601a-45026ae97526	Permission-read	Permission - branje	f
00030000-553e-9370-44cc-e7ab95e44b89	Permission-write	Permission - spreminjanje	f
00030000-553e-9370-59ed-61abb183148b	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-553e-9370-512b-cfdcdd91c9d6	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-553e-9370-2070-5dc046fda079	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-553e-9370-14f7-133cfa129245	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-553e-9370-c6c6-576cb8f0f8d2	Pogodba-read	Pogodba - branje	f
00030000-553e-9370-a119-f9f80c437ecb	Pogodba-write	Pogodba - spreminjanje	f
00030000-553e-9370-b9a9-728dc02757a9	Popa-read	Popa - branje	f
00030000-553e-9370-71f1-c335cbb88cb4	Popa-write	Popa - spreminjanje	f
00030000-553e-9370-6b92-6d4bb371d9e0	Posta-read	Posta - branje	f
00030000-553e-9370-d03c-2503ded64407	Posta-write	Posta - spreminjanje	f
00030000-553e-9370-c183-23ce8b1346ce	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-553e-9370-83cd-f419fa1a038e	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-553e-9370-f929-3ec02472fb7d	PostniNaslov-read	PostniNaslov - branje	f
00030000-553e-9370-ef5a-6fca7b506675	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-553e-9370-cec1-e9e66c719792	Predstava-read	Predstava - branje	f
00030000-553e-9370-a5b4-430312147d04	Predstava-write	Predstava - spreminjanje	f
00030000-553e-9370-1cb0-b6a1051db165	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-553e-9370-2837-873952f0f727	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-553e-9370-0530-4c3cb74d667b	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-553e-9370-9734-ac98c0be9e46	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-553e-9370-823e-edf40e2a9f06	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-553e-9370-68d5-6e4b42441359	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-553e-9370-5f48-462e309a74c2	Prostor-read	Prostor - branje	f
00030000-553e-9370-07b6-13c90724d0a4	Prostor-write	Prostor - spreminjanje	f
00030000-553e-9370-6fe8-e4e884fd8207	Racun-read	Racun - branje	f
00030000-553e-9370-aa67-bb61b129b034	Racun-write	Racun - spreminjanje	f
00030000-553e-9370-aca6-2de40d29e517	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-553e-9370-d7cc-fa07c99a8873	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-553e-9370-4c55-044e678cdee3	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-553e-9370-ab8e-96a4a9ae25fc	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-553e-9370-99d4-8eddeb33cd14	Rekvizit-read	Rekvizit - branje	f
00030000-553e-9370-ae8c-96b55863bc6b	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-553e-9370-546f-739da434549d	Revizija-read	Revizija - branje	f
00030000-553e-9370-0341-bb5eb5705cef	Revizija-write	Revizija - spreminjanje	f
00030000-553e-9370-e881-f6939d0701d0	Rezervacija-read	Rezervacija - branje	f
00030000-553e-9370-a12e-80565e00f77b	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-553e-9370-c73c-de058f9a7d3d	Role-read	Role - branje	f
00030000-553e-9370-f793-4ea9191845f0	Role-write	Role - spreminjanje	f
00030000-553e-9370-2a98-a11c120af80e	SedezniRed-read	SedezniRed - branje	f
00030000-553e-9370-0287-82acefefbe9e	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-553e-9370-451c-bb2b33d6e6d2	Sedez-read	Sedez - branje	f
00030000-553e-9370-e323-fe6774b1a721	Sedez-write	Sedez - spreminjanje	f
00030000-553e-9370-28a9-a497295ea363	Sezona-read	Sezona - branje	f
00030000-553e-9370-9135-13b23d994085	Sezona-write	Sezona - spreminjanje	f
00030000-553e-9370-fb8a-048cc275e2a0	Telefonska-read	Telefonska - branje	f
00030000-553e-9370-de08-b872947d3e2c	Telefonska-write	Telefonska - spreminjanje	f
00030000-553e-9370-d327-58f567322d71	TerminStoritve-read	TerminStoritve - branje	f
00030000-553e-9370-a7e6-683ffe62bd0a	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-553e-9370-5007-2bcf0720efc3	TipFunkcije-read	TipFunkcije - branje	f
00030000-553e-9370-7cca-d635b8b06156	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-553e-9370-9191-a728ad65fb93	Trr-read	Trr - branje	f
00030000-553e-9370-0cb0-eed7b8357ebc	Trr-write	Trr - spreminjanje	f
00030000-553e-9370-37b4-35d25d599388	Uprizoritev-read	Uprizoritev - branje	f
00030000-553e-9370-591e-b713b672e249	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-553e-9370-714e-691760ef7dc0	User-read	User - branje	f
00030000-553e-9370-fa43-9a33e21e78c7	User-write	User - spreminjanje	f
00030000-553e-9370-1151-50a187ae8fb0	Vaja-read	Vaja - branje	f
00030000-553e-9370-0fcc-06169d28e9a1	Vaja-write	Vaja - spreminjanje	f
00030000-553e-9370-26c9-b74c82de1d91	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-553e-9370-41c1-3256732c48c5	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-553e-9370-ff0c-d57e7b0a0970	Zaposlitev-read	Zaposlitev - branje	f
00030000-553e-9370-0abd-44d1d4144c36	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-553e-9370-8ec1-20a2c1df915d	Zasedenost-read	Zasedenost - branje	f
00030000-553e-9370-1e17-a0f683beeae1	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-553e-9370-8777-e7c7e0d74c56	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-553e-9370-dd26-0b356293971a	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-553e-9370-0a99-195643a1de1e	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-553e-9370-d99c-e079e7b37711	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2636 (class 0 OID 1476106)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-553e-9370-8cb6-2a97f4e3c972	00030000-553e-9370-6760-7daebe414fb2
00020000-553e-9370-1ea3-c089a274a243	00030000-553e-9370-aa06-b0aeac636fa4
00020000-553e-9370-1ea3-c089a274a243	00030000-553e-9370-6760-7daebe414fb2
\.


--
-- TOC entry 2664 (class 0 OID 1476395)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 1476425)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 1476537)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 1476165)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 1476207)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-553e-936f-b35f-34ee94edf43b	8341	Adlešiči
00050000-553e-936f-190c-1d912e0767f5	5270	Ajdovščina
00050000-553e-936f-6ba4-c70983a5a2f5	6280	Ankaran/Ancarano
00050000-553e-936f-00ce-cf960131c03f	9253	Apače
00050000-553e-936f-51dd-e7d8aefe7e34	8253	Artiče
00050000-553e-936f-e1f8-67c23c7356d8	4275	Begunje na Gorenjskem
00050000-553e-936f-9dab-51a59ed601d7	1382	Begunje pri Cerknici
00050000-553e-936f-698a-c391a7986f14	9231	Beltinci
00050000-553e-936f-24a8-c94589687290	2234	Benedikt
00050000-553e-936f-f041-7f26c2388cdb	2345	Bistrica ob Dravi
00050000-553e-936f-c7d7-7701d2e1f535	3256	Bistrica ob Sotli
00050000-553e-936f-a80f-f8a20aca6b12	8259	Bizeljsko
00050000-553e-936f-e9f9-c917be52bfb2	1223	Blagovica
00050000-553e-936f-1815-91e5e10bb511	8283	Blanca
00050000-553e-936f-ae0a-38e3cd7e68e4	4260	Bled
00050000-553e-936f-25bc-dc8087d3aaa0	4273	Blejska Dobrava
00050000-553e-936f-70df-3759475cb4a5	9265	Bodonci
00050000-553e-936f-8bdb-73a8fb944197	9222	Bogojina
00050000-553e-936f-3847-06d4999fe380	4263	Bohinjska Bela
00050000-553e-936f-388c-50fcbd6daf34	4264	Bohinjska Bistrica
00050000-553e-936f-5ba3-8b2917d22330	4265	Bohinjsko jezero
00050000-553e-936f-9e7c-6bad5402c8b6	1353	Borovnica
00050000-553e-936f-fa81-c888919f13eb	8294	Boštanj
00050000-553e-936f-5701-9c2d8660d76c	5230	Bovec
00050000-553e-936f-9502-05b0bb5b75c2	5295	Branik
00050000-553e-936f-5492-15c9c7d620c9	3314	Braslovče
00050000-553e-936f-2676-6892fd771c52	5223	Breginj
00050000-553e-936f-1005-3d72e948597d	8280	Brestanica
00050000-553e-936f-9633-7205e3cbe48d	2354	Bresternica
00050000-553e-936f-fad4-2586825b7a5b	4243	Brezje
00050000-553e-936f-ac6e-d245f5bee6d3	1351	Brezovica pri Ljubljani
00050000-553e-936f-0e71-b54d9e084b14	8250	Brežice
00050000-553e-936f-db97-a2b1f1187c5f	4210	Brnik - Aerodrom
00050000-553e-936f-c301-d67db9e43380	8321	Brusnice
00050000-553e-936f-7347-dd50e0fe2db4	3255	Buče
00050000-553e-936f-947e-f26cf4921299	8276	Bučka 
00050000-553e-936f-ceca-d3c0a175f5f8	9261	Cankova
00050000-553e-936f-75ae-5c3efa4b4d56	3000	Celje 
00050000-553e-936f-ab86-45ad86c48311	3001	Celje - poštni predali
00050000-553e-936f-2fdb-7ca68057178f	4207	Cerklje na Gorenjskem
00050000-553e-936f-4a8c-f5d899c9967e	8263	Cerklje ob Krki
00050000-553e-936f-3561-9021b94f2fb9	1380	Cerknica
00050000-553e-936f-d475-f566893fb468	5282	Cerkno
00050000-553e-936f-43a2-976a6a653712	2236	Cerkvenjak
00050000-553e-936f-35fa-01f0e6e1d97b	2215	Ceršak
00050000-553e-936f-c1e2-1019baecb4e6	2326	Cirkovce
00050000-553e-936f-36e6-12abce090776	2282	Cirkulane
00050000-553e-936f-3213-221869282161	5273	Col
00050000-553e-936f-3ca5-21bf2cd44df4	8251	Čatež ob Savi
00050000-553e-936f-1073-8b74da614d6f	1413	Čemšenik
00050000-553e-936f-d867-7a2cdba5b6f3	5253	Čepovan
00050000-553e-936f-995e-8607d9659377	9232	Črenšovci
00050000-553e-936f-5ff9-e16e014ab48e	2393	Črna na Koroškem
00050000-553e-936f-03f0-8611d4b1dd98	6275	Črni Kal
00050000-553e-936f-7176-a27598a9d9b5	5274	Črni Vrh nad Idrijo
00050000-553e-936f-a22e-16df19babe95	5262	Črniče
00050000-553e-936f-9aa6-c678dfac4e66	8340	Črnomelj
00050000-553e-936f-9984-6df065718376	6271	Dekani
00050000-553e-936f-56bb-631609746c39	5210	Deskle
00050000-553e-936f-2843-aa4724f71f4c	2253	Destrnik
00050000-553e-936f-e7c8-09301615faa7	6215	Divača
00050000-553e-936f-c673-a3e62572afa3	1233	Dob
00050000-553e-936f-9832-ae2223f28fa1	3224	Dobje pri Planini
00050000-553e-936f-8efe-e2a72cb3b69a	8257	Dobova
00050000-553e-936f-d1ff-a8c984e79f76	1423	Dobovec
00050000-553e-936f-b041-09af0dbdc823	5263	Dobravlje
00050000-553e-936f-443d-7deb1ca1d62a	3204	Dobrna
00050000-553e-936f-f63d-062b2f31c42e	8211	Dobrnič
00050000-553e-936f-fe03-41d8df0684ae	1356	Dobrova
00050000-553e-936f-f632-00a7ead9439d	9223	Dobrovnik/Dobronak 
00050000-553e-936f-49ef-5988a7f7e543	5212	Dobrovo v Brdih
00050000-553e-936f-2d29-f9556a4ad64f	1431	Dol pri Hrastniku
00050000-553e-936f-a3b4-d89d2e1db011	1262	Dol pri Ljubljani
00050000-553e-936f-c516-485aad368545	1273	Dole pri Litiji
00050000-553e-936f-0575-5475e63752b8	1331	Dolenja vas
00050000-553e-936f-f513-e70913e0ba5f	8350	Dolenjske Toplice
00050000-553e-936f-239f-63ac4d826188	1230	Domžale
00050000-553e-936f-5516-42a013ab30a1	2252	Dornava
00050000-553e-936f-37ec-de02541f8675	5294	Dornberk
00050000-553e-936f-7959-f91ec6620092	1319	Draga
00050000-553e-936f-5a85-cb0432c38b18	8343	Dragatuš
00050000-553e-936f-dee8-2d4d718ae21b	3222	Dramlje
00050000-553e-936f-3900-2c569baf8f14	2370	Dravograd
00050000-553e-936f-88d9-e337ddf24b96	4203	Duplje
00050000-553e-936f-6b81-616fc1ac6d5b	6221	Dutovlje
00050000-553e-936f-0707-1a57977d0342	8361	Dvor
00050000-553e-936f-3556-e604543fc1e1	2343	Fala
00050000-553e-936f-44d3-fcce376f5efe	9208	Fokovci
00050000-553e-936f-e983-5c14f4c34794	2313	Fram
00050000-553e-936f-7b19-477e7d40a47e	3213	Frankolovo
00050000-553e-936f-5987-5b7089bd6e46	1274	Gabrovka
00050000-553e-936f-bc25-78eb173e0a14	8254	Globoko
00050000-553e-936f-bdee-8d17aec06524	5275	Godovič
00050000-553e-936f-e7fa-3a38b0d8a6b7	4204	Golnik
00050000-553e-936f-f301-61c2fc4ba2b8	3303	Gomilsko
00050000-553e-936f-4935-5e66d5da1794	4224	Gorenja vas
00050000-553e-936f-50e6-e259e46a41b5	3263	Gorica pri Slivnici
00050000-553e-936f-9cf5-b3a6e1f1d7b3	2272	Gorišnica
00050000-553e-936f-78e1-c9428f98ba40	9250	Gornja Radgona
00050000-553e-936f-2d44-91144f9c244d	3342	Gornji Grad
00050000-553e-936f-0ca8-20d9180f69c8	4282	Gozd Martuljek
00050000-553e-936f-0e19-53291550f192	6272	Gračišče
00050000-553e-936f-8f56-99c5b69fe3b0	9264	Grad
00050000-553e-936f-5aec-93af9ea0e594	8332	Gradac
00050000-553e-936f-7dca-360783988c0b	1384	Grahovo
00050000-553e-936f-66a1-76db625f2f47	5242	Grahovo ob Bači
00050000-553e-936f-0b2a-f7265d141454	5251	Grgar
00050000-553e-936f-6542-a238a48d0806	3302	Griže
00050000-553e-936f-3771-ba732b29aade	3231	Grobelno
00050000-553e-936f-6d8c-eb55205f53eb	1290	Grosuplje
00050000-553e-936f-7952-2415664ef7cf	2288	Hajdina
00050000-553e-936f-c25d-498e88e83633	8362	Hinje
00050000-553e-936f-0c47-7c030faea381	2311	Hoče
00050000-553e-936f-2cae-1741bc5f0232	9205	Hodoš/Hodos
00050000-553e-936f-094f-fb468d1cf174	1354	Horjul
00050000-553e-936f-7ae0-b73710b585cc	1372	Hotedršica
00050000-553e-936f-5619-a75bf9b10455	1430	Hrastnik
00050000-553e-936f-5c79-827a9b2ac88d	6225	Hruševje
00050000-553e-936f-582e-53e80e582564	4276	Hrušica
00050000-553e-936f-d5ea-23ac231a5c55	5280	Idrija
00050000-553e-936f-f186-41dcb64482eb	1292	Ig
00050000-553e-936f-13b2-0f1d6c9c216b	6250	Ilirska Bistrica
00050000-553e-936f-aa8a-5e83450bd539	6251	Ilirska Bistrica-Trnovo
00050000-553e-936f-95a1-a59edf59c2e9	1295	Ivančna Gorica
00050000-553e-936f-2c35-aeb166b51981	2259	Ivanjkovci
00050000-553e-936f-0193-250722063f7d	1411	Izlake
00050000-553e-936f-5462-fad1ecd1b2a0	6310	Izola/Isola
00050000-553e-936f-916e-b67925547e77	2222	Jakobski Dol
00050000-553e-936f-20e9-fd5915a35035	2221	Jarenina
00050000-553e-936f-f387-805664c65117	6254	Jelšane
00050000-553e-936f-f012-f34bd422d4cc	4270	Jesenice
00050000-553e-936f-010d-cbd53c128afa	8261	Jesenice na Dolenjskem
00050000-553e-936f-abb9-dba10e5da705	3273	Jurklošter
00050000-553e-936f-a9b8-c12088c1e217	2223	Jurovski Dol
00050000-553e-936f-2f7d-7e0b436572fa	2256	Juršinci
00050000-553e-936f-3953-a47f83e9c6c9	5214	Kal nad Kanalom
00050000-553e-936f-6153-11a7ec0000ba	3233	Kalobje
00050000-553e-936f-c731-f6843fc046bb	4246	Kamna Gorica
00050000-553e-936f-704c-7472a21b03c9	2351	Kamnica
00050000-553e-936f-fafa-920df0e3ec37	1241	Kamnik
00050000-553e-936f-2054-3aa17886195e	5213	Kanal
00050000-553e-936f-81fe-371cfb0cac15	8258	Kapele
00050000-553e-936f-9a0b-3f03994b762c	2362	Kapla
00050000-553e-936f-a853-2bbdd7dd3ca9	2325	Kidričevo
00050000-553e-936f-22c2-19e83c2fe1a2	1412	Kisovec
00050000-553e-936f-bd1b-727f301872ea	6253	Knežak
00050000-553e-936f-34e4-93d557614f84	5222	Kobarid
00050000-553e-936f-ff0d-0af4428375e1	9227	Kobilje
00050000-553e-936f-53b9-179bfcbb4744	1330	Kočevje
00050000-553e-936f-67ee-b6a4ea2f2575	1338	Kočevska Reka
00050000-553e-936f-f077-fb7992a86c51	2276	Kog
00050000-553e-936f-d195-49a1b8a5fe9a	5211	Kojsko
00050000-553e-936f-3135-0a6773fc7001	6223	Komen
00050000-553e-936f-f207-1560c68d9268	1218	Komenda
00050000-553e-936f-4267-dba02364e21f	6000	Koper/Capodistria 
00050000-553e-936f-b707-91da4fc17aa7	6001	Koper/Capodistria - poštni predali
00050000-553e-936f-368f-d8b5c28d31f3	8282	Koprivnica
00050000-553e-936f-24b5-95d8f738fa29	5296	Kostanjevica na Krasu
00050000-553e-936f-6595-3464ef893b55	8311	Kostanjevica na Krki
00050000-553e-936f-90e6-1e4063cce4c1	1336	Kostel
00050000-553e-936f-490c-ad4c5fc12eb2	6256	Košana
00050000-553e-936f-2f73-0646c817a9bb	2394	Kotlje
00050000-553e-936f-3bcc-9a8766d01d6b	6240	Kozina
00050000-553e-936f-b50b-889eb7374263	3260	Kozje
00050000-553e-936f-d489-3a61f87143dc	4000	Kranj 
00050000-553e-936f-55d3-5961ef883070	4001	Kranj - poštni predali
00050000-553e-936f-2b5e-010aa0009738	4280	Kranjska Gora
00050000-553e-936f-089d-f5b39773d625	1281	Kresnice
00050000-553e-936f-523c-59b576dd469f	4294	Križe
00050000-553e-936f-f22b-7ba72cbbe410	9206	Križevci
00050000-553e-936f-9f61-b80ffd5f45ee	9242	Križevci pri Ljutomeru
00050000-553e-936f-9ad5-1cfcad54b1c9	1301	Krka
00050000-553e-936f-375e-5c543d279179	8296	Krmelj
00050000-553e-936f-a461-092d5aa378cf	4245	Kropa
00050000-553e-936f-b1ed-03d1dea4003a	8262	Krška vas
00050000-553e-936f-4930-f31b91de3903	8270	Krško
00050000-553e-936f-4345-8a51f5086c18	9263	Kuzma
00050000-553e-936f-235c-8a7dab880bfd	2318	Laporje
00050000-553e-936f-acb5-71366db23e26	3270	Laško
00050000-553e-936f-28e9-baba9d3b7c47	1219	Laze v Tuhinju
00050000-553e-936f-2892-4f2e819bb849	2230	Lenart v Slovenskih goricah
00050000-553e-936f-79e0-780eadd88e7f	9220	Lendava/Lendva
00050000-553e-936f-bc32-064b14b97b98	4248	Lesce
00050000-553e-936f-2fdb-42efbbe299fd	3261	Lesično
00050000-553e-936f-2315-aebcce8677b3	8273	Leskovec pri Krškem
00050000-553e-936f-7cdb-89e975358574	2372	Libeliče
00050000-553e-936f-e489-406a8ccb2fa7	2341	Limbuš
00050000-553e-936f-7c48-1fa63d5713e7	1270	Litija
00050000-553e-936f-e6d1-2df3714a65be	3202	Ljubečna
00050000-553e-936f-647a-ff0d73ec41fc	1000	Ljubljana 
00050000-553e-936f-de1c-9440017dce14	1001	Ljubljana - poštni predali
00050000-553e-936f-d68f-35034e6fe2a3	1231	Ljubljana - Črnuče
00050000-553e-936f-8f49-af372889ab1d	1261	Ljubljana - Dobrunje
00050000-553e-936f-897d-5f0bd6081c20	1260	Ljubljana - Polje
00050000-553e-936f-f1e6-436459642533	1210	Ljubljana - Šentvid
00050000-553e-936f-0da1-d657c0cfc304	1211	Ljubljana - Šmartno
00050000-553e-936f-ccad-ec3b2010026f	3333	Ljubno ob Savinji
00050000-553e-936f-eb57-21da72d0ff72	9240	Ljutomer
00050000-553e-936f-f807-25508251de60	3215	Loče
00050000-553e-936f-f30e-b2ae03a06b36	5231	Log pod Mangartom
00050000-553e-936f-5541-4bf27ea2b9d6	1358	Log pri Brezovici
00050000-553e-936f-a9be-2de717f1fdd9	1370	Logatec
00050000-553e-936f-836e-27bcb07f8a40	1371	Logatec
00050000-553e-936f-bdc1-9d3c7fa4731e	1434	Loka pri Zidanem Mostu
00050000-553e-936f-053c-a14f9ce67ca3	3223	Loka pri Žusmu
00050000-553e-936f-5078-9304296a88ab	6219	Lokev
00050000-553e-936f-d148-d3c418b19d78	1318	Loški Potok
00050000-553e-936f-c532-52997187d43a	2324	Lovrenc na Dravskem polju
00050000-553e-936f-968f-88f2da05c175	2344	Lovrenc na Pohorju
00050000-553e-936f-febe-ca2c5f6c0387	3334	Luče
00050000-553e-936f-02e3-1639c232b2da	1225	Lukovica
00050000-553e-936f-a232-9c7c1be36674	9202	Mačkovci
00050000-553e-936f-9977-6452f2b0cf16	2322	Majšperk
00050000-553e-936f-fa46-97cc4204a875	2321	Makole
00050000-553e-936f-4490-b9fa09e77412	9243	Mala Nedelja
00050000-553e-936f-6b7e-d7e393896f56	2229	Malečnik
00050000-553e-936f-6549-28bfd5e548f7	6273	Marezige
00050000-553e-936f-3911-e8c6730df8d9	2000	Maribor 
00050000-553e-936f-0aa1-6fb66392bd7e	2001	Maribor - poštni predali
00050000-553e-936f-accd-79c48179b3b2	2206	Marjeta na Dravskem polju
00050000-553e-936f-ad75-23aaf9bfb583	2281	Markovci
00050000-553e-936f-848b-d82120f0c0d9	9221	Martjanci
00050000-553e-936f-6dc9-64ec00c97d6b	6242	Materija
00050000-553e-936f-1be3-7727d271d2b6	4211	Mavčiče
00050000-553e-936f-5e05-c61d2da1d9a8	1215	Medvode
00050000-553e-936f-879c-864bf5c5bff2	1234	Mengeš
00050000-553e-936f-f812-1957045a257e	8330	Metlika
00050000-553e-936f-ea57-56068acd6bed	2392	Mežica
00050000-553e-936f-9362-61019d6370e1	2204	Miklavž na Dravskem polju
00050000-553e-936f-203d-25dfe82ac88c	2275	Miklavž pri Ormožu
00050000-553e-936f-558c-7ec2718687bb	5291	Miren
00050000-553e-936f-592c-f597ee070ec9	8233	Mirna
00050000-553e-936f-29fe-d903173a0af6	8216	Mirna Peč
00050000-553e-936f-69e6-923f8791aa4b	2382	Mislinja
00050000-553e-936f-14ac-236ec335efac	4281	Mojstrana
00050000-553e-936f-f031-77981a403713	8230	Mokronog
00050000-553e-936f-afb0-6b8aba3b4622	1251	Moravče
00050000-553e-936f-e9cc-e1536ca74109	9226	Moravske Toplice
00050000-553e-936f-7284-d960fd329d08	5216	Most na Soči
00050000-553e-936f-493a-04c2e4441f2e	1221	Motnik
00050000-553e-936f-abfa-ed7c463fc636	3330	Mozirje
00050000-553e-936f-3385-d730aa053480	9000	Murska Sobota 
00050000-553e-936f-0b58-4da330383391	9001	Murska Sobota - poštni predali
00050000-553e-936f-64d7-8d788b149608	2366	Muta
00050000-553e-936f-427a-da30a4d96a8b	4202	Naklo
00050000-553e-936f-2727-953f2e33c86f	3331	Nazarje
00050000-553e-936f-4454-6828f8a0d479	1357	Notranje Gorice
00050000-553e-936f-2252-fd658370b9b0	3203	Nova Cerkev
00050000-553e-936f-eb0d-b69085a01ae0	5000	Nova Gorica 
00050000-553e-936f-8ec9-9d08f46a3cf8	5001	Nova Gorica - poštni predali
00050000-553e-936f-e1db-d9e7f1798525	1385	Nova vas
00050000-553e-936f-95bc-84ba546e22e7	8000	Novo mesto
00050000-553e-936f-94d2-d95ec96975bd	8001	Novo mesto - poštni predali
00050000-553e-936f-b01a-905211e716d5	6243	Obrov
00050000-553e-936f-e20d-ead2e17710a1	9233	Odranci
00050000-553e-936f-fc9c-180e1f0ac55d	2317	Oplotnica
00050000-553e-936f-da4e-5f2f7896b75e	2312	Orehova vas
00050000-553e-936f-5303-6a1b6aaa000f	2270	Ormož
00050000-553e-936f-1cbe-767a2d859c9c	1316	Ortnek
00050000-553e-936f-844c-33f860ba6472	1337	Osilnica
00050000-553e-936f-fab7-8a1d9f170ff1	8222	Otočec
00050000-553e-936f-b0fd-519d45f7c06c	2361	Ožbalt
00050000-553e-936f-f38f-38a1c5b4f8ac	2231	Pernica
00050000-553e-936f-5a7c-553f11550f87	2211	Pesnica pri Mariboru
00050000-553e-936f-942b-94995812c909	9203	Petrovci
00050000-553e-936f-17e8-944faf24bea1	3301	Petrovče
00050000-553e-936f-4545-555544ec4f21	6330	Piran/Pirano
00050000-553e-936f-696b-b7f5193ec4e0	8255	Pišece
00050000-553e-936f-f730-419e6aada500	6257	Pivka
00050000-553e-936f-b571-82da1383a19b	6232	Planina
00050000-553e-936f-c18d-fd9ad90ea406	3225	Planina pri Sevnici
00050000-553e-936f-9da1-2421650d4318	6276	Pobegi
00050000-553e-936f-d5db-f3007099d2e1	8312	Podbočje
00050000-553e-936f-c39f-c42cd06db26f	5243	Podbrdo
00050000-553e-936f-c079-53547cd77530	3254	Podčetrtek
00050000-553e-936f-c120-5d49d7d3665c	2273	Podgorci
00050000-553e-936f-b80e-dec39377b408	6216	Podgorje
00050000-553e-936f-3b98-0a7d7a484a3e	2381	Podgorje pri Slovenj Gradcu
00050000-553e-936f-2150-04bbffd61ba5	6244	Podgrad
00050000-553e-936f-5d01-c85797a8f2dd	1414	Podkum
00050000-553e-936f-8005-b6e7b9ababc8	2286	Podlehnik
00050000-553e-936f-15c5-347fdf2ab353	5272	Podnanos
00050000-553e-936f-d833-f0caab9dbadd	4244	Podnart
00050000-553e-936f-6de9-e603e915e41e	3241	Podplat
00050000-553e-936f-6522-18d4a4674f14	3257	Podsreda
00050000-553e-936f-e316-1fbb93f97fc7	2363	Podvelka
00050000-553e-936f-2b93-7dd3d2a4119d	2208	Pohorje
00050000-553e-936f-f1ff-a2d6b02f1143	2257	Polenšak
00050000-553e-936f-755c-532e41ad7345	1355	Polhov Gradec
00050000-553e-936f-5cfa-032cd27918b4	4223	Poljane nad Škofjo Loko
00050000-553e-936f-ee0e-f6a8360fbe06	2319	Poljčane
00050000-553e-936f-85c7-796c21835585	1272	Polšnik
00050000-553e-936f-06c7-5535d2e59358	3313	Polzela
00050000-553e-936f-ba63-33d9756ba634	3232	Ponikva
00050000-553e-936f-aec0-782fa7c13f2e	6320	Portorož/Portorose
00050000-553e-936f-6e4b-db89c86041b3	6230	Postojna
00050000-553e-936f-64e2-1dcb77ee834a	2331	Pragersko
00050000-553e-936f-a870-af6efb549be0	3312	Prebold
00050000-553e-936f-5a12-33bd9ada66ad	4205	Preddvor
00050000-553e-936f-c619-ebf8aada145f	6255	Prem
00050000-553e-936f-8491-cdd18993c9df	1352	Preserje
00050000-553e-936f-5449-2bd782a38ba7	6258	Prestranek
00050000-553e-936f-2faf-403b2862b5c9	2391	Prevalje
00050000-553e-936f-aa1e-6a914e0d5d3e	3262	Prevorje
00050000-553e-936f-a308-a175016cbfb8	1276	Primskovo 
00050000-553e-936f-377f-cf1c28a488fb	3253	Pristava pri Mestinju
00050000-553e-936f-1e10-83ae302bda65	9207	Prosenjakovci/Partosfalva
00050000-553e-936f-799e-99e75bd140ad	5297	Prvačina
00050000-553e-936f-bfa9-7e10c1d4e4a8	2250	Ptuj
00050000-553e-936f-7170-80ba3aabfe4e	2323	Ptujska Gora
00050000-553e-936f-3001-8e9f8c49798a	9201	Puconci
00050000-553e-936f-73ef-e3b1b720ad15	2327	Rače
00050000-553e-936f-380b-f8584abd7ef1	1433	Radeče
00050000-553e-936f-535d-06d85b29368f	9252	Radenci
00050000-553e-936f-a5dc-87159afcd67a	2360	Radlje ob Dravi
00050000-553e-936f-4079-99577bf20931	1235	Radomlje
00050000-553e-936f-4f70-2c9a260b8b65	4240	Radovljica
00050000-553e-936f-cb9b-3e8eede2dc77	8274	Raka
00050000-553e-936f-c5fd-f9248df1a6a1	1381	Rakek
00050000-553e-936f-8997-af39b31a6f71	4283	Rateče - Planica
00050000-553e-936f-4c7c-a01e0043d3cf	2390	Ravne na Koroškem
00050000-553e-936f-9e90-c92c1ef7ad68	9246	Razkrižje
00050000-553e-936f-47d1-aa5c3bae7a9f	3332	Rečica ob Savinji
00050000-553e-936f-b98e-e45439057673	5292	Renče
00050000-553e-936f-5afd-88bf288ec83b	1310	Ribnica
00050000-553e-936f-444c-cd14e6f85a5b	2364	Ribnica na Pohorju
00050000-553e-936f-b6d6-767e4efb1e39	3272	Rimske Toplice
00050000-553e-936f-f348-46540766afc4	1314	Rob
00050000-553e-936f-87dc-e36ed02776b8	5215	Ročinj
00050000-553e-936f-42f0-9e328ec142ee	3250	Rogaška Slatina
00050000-553e-936f-406c-b67efb2d894a	9262	Rogašovci
00050000-553e-936f-bb88-f7bdecad8a30	3252	Rogatec
00050000-553e-936f-9880-b0501f4d3287	1373	Rovte
00050000-553e-936f-0ea9-cd45ec0b5e9f	2342	Ruše
00050000-553e-936f-4870-b08732431c2a	1282	Sava
00050000-553e-936f-d119-6ea8a1b3020a	6333	Sečovlje/Sicciole
00050000-553e-936f-2474-e83aade4cfbf	4227	Selca
00050000-553e-936f-1b6a-814dd899bbdd	2352	Selnica ob Dravi
00050000-553e-936f-3183-979a4d09319b	8333	Semič
00050000-553e-936f-3195-f6a6e7e1da44	8281	Senovo
00050000-553e-936f-c72e-cbb20a491de3	6224	Senožeče
00050000-553e-936f-bbe6-44c39d8200e5	8290	Sevnica
00050000-553e-936f-5200-925f40d44360	6210	Sežana
00050000-553e-936f-27b7-2617456e4ff5	2214	Sladki Vrh
00050000-553e-936f-2a27-8b1a34ba2965	5283	Slap ob Idrijci
00050000-553e-936f-7644-86e46e0c79e7	2380	Slovenj Gradec
00050000-553e-936f-0c7e-dd2dc71020a8	2310	Slovenska Bistrica
00050000-553e-936f-afbf-00375220a609	3210	Slovenske Konjice
00050000-553e-936f-20e1-2f56f7662da5	1216	Smlednik
00050000-553e-936f-2fb0-2c6d539d3d65	5232	Soča
00050000-553e-936f-7a35-038be249e8bb	1317	Sodražica
00050000-553e-936f-4ba6-52c292268f3c	3335	Solčava
00050000-553e-936f-b4e5-a05548af2765	5250	Solkan
00050000-553e-936f-92bd-124215c71ace	4229	Sorica
00050000-553e-936f-98c6-b999899b0a2f	4225	Sovodenj
00050000-553e-936f-71ee-3cece27e7ee9	5281	Spodnja Idrija
00050000-553e-936f-e0c7-309cf118e16f	2241	Spodnji Duplek
00050000-553e-936f-623a-d55abbd913c9	9245	Spodnji Ivanjci
00050000-553e-936f-a5d3-449b12bb6d9f	2277	Središče ob Dravi
00050000-553e-936f-369b-883e85058561	4267	Srednja vas v Bohinju
00050000-553e-936f-bc3c-1accfc407577	8256	Sromlje 
00050000-553e-936f-4c0f-46406e603280	5224	Srpenica
00050000-553e-936f-6d37-6ed95ee8e4d8	1242	Stahovica
00050000-553e-936f-526f-091a58ed3f1f	1332	Stara Cerkev
00050000-553e-936f-df4e-2a60e17307f0	8342	Stari trg ob Kolpi
00050000-553e-936f-616b-074bc2064739	1386	Stari trg pri Ložu
00050000-553e-936f-5def-cbcf846b2a60	2205	Starše
00050000-553e-936f-b02c-1e76cc788f33	2289	Stoperce
00050000-553e-936f-21d0-624b3896bf31	8322	Stopiče
00050000-553e-936f-3a13-34f9b479334c	3206	Stranice
00050000-553e-936f-c44c-2662e47e2eab	8351	Straža
00050000-553e-936f-e38e-b5e7384e0ec4	1313	Struge
00050000-553e-936f-baed-5196c9993046	8293	Studenec
00050000-553e-936f-1a93-1a7916a48a45	8331	Suhor
00050000-553e-936f-b71b-38f1705c5503	2233	Sv. Ana v Slovenskih goricah
00050000-553e-936f-8977-d455be3fb7cd	2235	Sv. Trojica v Slovenskih goricah
00050000-553e-936f-d5f6-7845d8e6ac43	2353	Sveti Duh na Ostrem Vrhu
00050000-553e-936f-a3b5-22b6ee3c22c6	9244	Sveti Jurij ob Ščavnici
00050000-553e-936f-5814-91562e267832	3264	Sveti Štefan
00050000-553e-936f-999a-f4d4101a65bd	2258	Sveti Tomaž
00050000-553e-936f-ee9e-f2bc47c7dbaa	9204	Šalovci
00050000-553e-936f-a335-693848846311	5261	Šempas
00050000-553e-936f-bed5-5ceee6e8c285	5290	Šempeter pri Gorici
00050000-553e-936f-decb-9dc6e9cb6327	3311	Šempeter v Savinjski dolini
00050000-553e-936f-2ef2-e414dd0ab56c	4208	Šenčur
00050000-553e-936f-6ecd-e212294a144f	2212	Šentilj v Slovenskih goricah
00050000-553e-936f-6bfb-7d315d7fbd2d	8297	Šentjanž
00050000-553e-936f-4af5-2a25a161c343	2373	Šentjanž pri Dravogradu
00050000-553e-936f-86c4-781ba089d82e	8310	Šentjernej
00050000-553e-936f-e3f1-c021ad3df9ae	3230	Šentjur
00050000-553e-936f-b8e5-9f32a6128254	3271	Šentrupert
00050000-553e-936f-ffe0-eb342de88c41	8232	Šentrupert
00050000-553e-936f-213e-03f765b69a8b	1296	Šentvid pri Stični
00050000-553e-936f-0ec9-4ad314b22373	8275	Škocjan
00050000-553e-936f-3ec7-ede6226fb466	6281	Škofije
00050000-553e-936f-e033-cc07db2a9477	4220	Škofja Loka
00050000-553e-936f-c1c0-641a70f73ef6	3211	Škofja vas
00050000-553e-936f-8263-d94b903bf1b0	1291	Škofljica
00050000-553e-936f-0956-66cca0be6652	6274	Šmarje
00050000-553e-936f-47c6-ada37f42d565	1293	Šmarje - Sap
00050000-553e-936f-c2fc-53f4cab455b6	3240	Šmarje pri Jelšah
00050000-553e-936f-d0b3-6011d4db5126	8220	Šmarješke Toplice
00050000-553e-936f-916a-a3553c0d80b7	2315	Šmartno na Pohorju
00050000-553e-936f-fe8d-1524b107d64c	3341	Šmartno ob Dreti
00050000-553e-936f-3e4e-b7023b40a149	3327	Šmartno ob Paki
00050000-553e-936f-f8cc-a943877b2bd1	1275	Šmartno pri Litiji
00050000-553e-936f-55b8-ba13eacf4a67	2383	Šmartno pri Slovenj Gradcu
00050000-553e-936f-522d-a8ab5fe280e2	3201	Šmartno v Rožni dolini
00050000-553e-936f-55b5-f01113fc8bb0	3325	Šoštanj
00050000-553e-936f-4ebd-78c1fc6516f5	6222	Štanjel
00050000-553e-936f-8b10-ea820296ce2c	3220	Štore
00050000-553e-936f-a6c4-3d58a4ce808c	3304	Tabor
00050000-553e-936f-a426-2bed33dca2e5	3221	Teharje
00050000-553e-936f-e1cc-450f4d26c36d	9251	Tišina
00050000-553e-936f-03fd-e693dddd08b3	5220	Tolmin
00050000-553e-936f-c645-96c80f3ac167	3326	Topolšica
00050000-553e-936f-1d65-a9191e6afa2c	2371	Trbonje
00050000-553e-936f-a548-3fe42145ae78	1420	Trbovlje
00050000-553e-936f-62c4-1f7c2fb9c61a	8231	Trebelno 
00050000-553e-936f-d9ba-8fb65ea6c196	8210	Trebnje
00050000-553e-936f-60f5-074d3ac325a0	5252	Trnovo pri Gorici
00050000-553e-936f-186a-fdbef209bde1	2254	Trnovska vas
00050000-553e-936f-6f37-0a03c6717bc5	1222	Trojane
00050000-553e-936f-74f3-4a5d4102243b	1236	Trzin
00050000-553e-936f-0f68-bd9be6b75a8e	4290	Tržič
00050000-553e-936f-9138-70c7082a88e0	8295	Tržišče
00050000-553e-936f-bd5f-b8e9526e67c8	1311	Turjak
00050000-553e-936f-8a82-4932fa67fff3	9224	Turnišče
00050000-553e-936f-cee4-041e88c9eef4	8323	Uršna sela
00050000-553e-936f-e873-300febd5183f	1252	Vače
00050000-553e-936f-b4eb-f529632b764d	3320	Velenje 
00050000-553e-936f-58d3-96893761aa6d	3322	Velenje - poštni predali
00050000-553e-936f-18e0-06c4b0ac8bdb	8212	Velika Loka
00050000-553e-936f-b1a1-90d05a07dfcd	2274	Velika Nedelja
00050000-553e-936f-34ed-28f724623c35	9225	Velika Polana
00050000-553e-936f-7b38-063513c255f7	1315	Velike Lašče
00050000-553e-936f-c3a3-d52148a5ff3f	8213	Veliki Gaber
00050000-553e-936f-128a-e28e2a377e0b	9241	Veržej
00050000-553e-936f-126a-c75590c36c01	1312	Videm - Dobrepolje
00050000-553e-936f-1342-f39975074b9a	2284	Videm pri Ptuju
00050000-553e-936f-2568-2c33bea1d310	8344	Vinica
00050000-553e-936f-7e6a-1d27e76811be	5271	Vipava
00050000-553e-936f-19dc-0c2fe9421389	4212	Visoko
00050000-553e-936f-0dde-40efe677a0df	1294	Višnja Gora
00050000-553e-936f-bbeb-19bb0a3ef987	3205	Vitanje
00050000-553e-936f-fb29-03762cdb6cb9	2255	Vitomarci
00050000-553e-936f-496b-f8838cf57f11	1217	Vodice
00050000-553e-936f-dfa6-19f157907721	3212	Vojnik\t
00050000-553e-936f-3635-cca090f1976b	5293	Volčja Draga
00050000-553e-936f-b44a-70c3ab59a1d8	2232	Voličina
00050000-553e-936f-7c56-56c8e8f10688	3305	Vransko
00050000-553e-936f-8053-4cc0755969bb	6217	Vremski Britof
00050000-553e-936f-e4eb-ea6976d4f3fe	1360	Vrhnika
00050000-553e-936f-c86c-f1ccd3edd25b	2365	Vuhred
00050000-553e-936f-d73a-d97234a4af0a	2367	Vuzenica
00050000-553e-936f-cde1-daaec2110f61	8292	Zabukovje 
00050000-553e-936f-f52f-937a120ff3c6	1410	Zagorje ob Savi
00050000-553e-936f-69e2-5ac9eb345561	1303	Zagradec
00050000-553e-936f-31d2-9b4bcdea274f	2283	Zavrč
00050000-553e-936f-1e6a-3d962c3a20b3	8272	Zdole 
00050000-553e-936f-0649-36602c267ed7	4201	Zgornja Besnica
00050000-553e-936f-6ea4-eec310f57691	2242	Zgornja Korena
00050000-553e-936f-07e5-887e3e7c6e64	2201	Zgornja Kungota
00050000-553e-936f-52af-706cc21e81cc	2316	Zgornja Ložnica
00050000-553e-936f-b4bf-ba433581c0a6	2314	Zgornja Polskava
00050000-553e-936f-c8de-09bd85efaae5	2213	Zgornja Velka
00050000-553e-936f-c6ef-d57e081f726c	4247	Zgornje Gorje
00050000-553e-936f-d9b5-b68722830246	4206	Zgornje Jezersko
00050000-553e-936f-560a-08f5c31da884	2285	Zgornji Leskovec
00050000-553e-936f-31aa-54085214ecd4	1432	Zidani Most
00050000-553e-936f-5602-99c8cb04e43c	3214	Zreče
00050000-553e-936f-6cab-f55bdb63f872	4209	Žabnica
00050000-553e-936f-99c9-6cef195f8ab3	3310	Žalec
00050000-553e-936f-f1e0-4ccbabedd65b	4228	Železniki
00050000-553e-936f-012d-c6d11560c240	2287	Žetale
00050000-553e-936f-6064-e3866a73b8a5	4226	Žiri
00050000-553e-936f-e002-109dfc9b658e	4274	Žirovnica
00050000-553e-936f-a7a6-ae8a4cb7fa2a	8360	Žužemberk
\.


--
-- TOC entry 2660 (class 0 OID 1476369)
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
-- TOC entry 2643 (class 0 OID 1476192)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 1476258)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 1476381)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 1476486)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 1476530)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 1476410)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 1476354)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 1476344)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 1476520)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 1476476)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 1476057)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-553e-9370-eed9-3a553cfd0ab8	00010000-553e-9370-ca54-7ddd34416e93	2015-04-27 21:52:16	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO.ofvnqeRx8cgUBa8ylUErsNvA8.hebG";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2692 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2667 (class 0 OID 1476419)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 1476097)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-553e-9370-f356-b0209fe4efbe	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-553e-9370-3cee-8018cf106425	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-553e-9370-8cb6-2a97f4e3c972	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-553e-9370-e458-147bfccb83cb	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-553e-9370-bd33-0d517a4dc424	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-553e-9370-1ea3-c089a274a243	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2633 (class 0 OID 1476080)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-553e-9370-eed9-3a553cfd0ab8	00020000-553e-9370-e458-147bfccb83cb
00010000-553e-9370-ca54-7ddd34416e93	00020000-553e-9370-e458-147bfccb83cb
\.


--
-- TOC entry 2669 (class 0 OID 1476433)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 1476375)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 1476325)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 1476157)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 1476331)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 1476511)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 1476227)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 1476066)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-553e-9370-ca54-7ddd34416e93	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROMCSsZdJf4ZjRPeYLPYnYpvjuky7S2K2	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-553e-9370-eed9-3a553cfd0ab8	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2681 (class 0 OID 1476561)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 1476273)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 1476402)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 1476468)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 1476301)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2680 (class 0 OID 1476551)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 1476458)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2276 (class 2606 OID 1476121)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 1476600)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 1476593)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 1476510)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 2606 OID 1476291)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 1476324)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 1476253)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 1476454)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 1476271)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 1476318)
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
-- TOC entry 2366 (class 2606 OID 1476367)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 1476394)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2305 (class 2606 OID 1476225)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2280 (class 2606 OID 1476130)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2295 (class 2606 OID 1476189)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2282 (class 2606 OID 1476155)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2274 (class 2606 OID 1476110)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2266 (class 2606 OID 1476095)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 1476400)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 1476432)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 1476547)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2290 (class 2606 OID 1476182)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2302 (class 2606 OID 1476213)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 1476373)
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
-- TOC entry 2300 (class 2606 OID 1476203)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 1476262)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 1476385)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 1476492)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 1476535)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 1476417)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 1476358)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2358 (class 2606 OID 1476349)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 1476529)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 1476483)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2257 (class 2606 OID 1476065)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 1476423)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2264 (class 2606 OID 1476084)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2269 (class 2606 OID 1476104)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 1476441)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 1476380)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 1476330)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2287 (class 2606 OID 1476162)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 1476340)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 1476519)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 1476238)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 1476078)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2436 (class 2606 OID 1476575)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 1476277)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 1476408)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2407 (class 2606 OID 1476474)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 1476313)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 1476560)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 1476467)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2330 (class 1259 OID 1476298)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2288 (class 1259 OID 1476184)
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
-- TOC entry 2379 (class 1259 OID 1476401)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2373 (class 1259 OID 1476387)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2374 (class 1259 OID 1476386)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2325 (class 1259 OID 1476278)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 1476457)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2401 (class 1259 OID 1476455)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 1476456)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2425 (class 1259 OID 1476548)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2426 (class 1259 OID 1476549)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2427 (class 1259 OID 1476550)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2432 (class 1259 OID 1476578)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2433 (class 1259 OID 1476577)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2434 (class 1259 OID 1476576)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2307 (class 1259 OID 1476240)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2308 (class 1259 OID 1476239)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2292 (class 1259 OID 1476191)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2293 (class 1259 OID 1476190)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2388 (class 1259 OID 1476424)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2343 (class 1259 OID 1476319)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2271 (class 1259 OID 1476111)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2272 (class 1259 OID 1476112)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2393 (class 1259 OID 1476444)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2394 (class 1259 OID 1476443)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2395 (class 1259 OID 1476442)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2317 (class 1259 OID 1476263)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2318 (class 1259 OID 1476265)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2319 (class 1259 OID 1476264)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2353 (class 1259 OID 1476353)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2354 (class 1259 OID 1476351)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2355 (class 1259 OID 1476350)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2356 (class 1259 OID 1476352)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2261 (class 1259 OID 1476085)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2262 (class 1259 OID 1476086)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2382 (class 1259 OID 1476409)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2368 (class 1259 OID 1476374)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2408 (class 1259 OID 1476484)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2409 (class 1259 OID 1476485)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2296 (class 1259 OID 1476205)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2297 (class 1259 OID 1476204)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2298 (class 1259 OID 1476206)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2412 (class 1259 OID 1476493)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2413 (class 1259 OID 1476494)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2443 (class 1259 OID 1476603)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2444 (class 1259 OID 1476602)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2445 (class 1259 OID 1476605)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2446 (class 1259 OID 1476601)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2447 (class 1259 OID 1476604)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2405 (class 1259 OID 1476475)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2359 (class 1259 OID 1476362)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2360 (class 1259 OID 1476361)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2361 (class 1259 OID 1476359)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2362 (class 1259 OID 1476360)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2247 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2439 (class 1259 OID 1476595)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2440 (class 1259 OID 1476594)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2324 (class 1259 OID 1476272)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2277 (class 1259 OID 1476132)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2278 (class 1259 OID 1476131)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2284 (class 1259 OID 1476163)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2285 (class 1259 OID 1476164)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2348 (class 1259 OID 1476343)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2349 (class 1259 OID 1476342)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2350 (class 1259 OID 1476341)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2331 (class 1259 OID 1476300)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2332 (class 1259 OID 1476296)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2333 (class 1259 OID 1476293)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2334 (class 1259 OID 1476294)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2335 (class 1259 OID 1476292)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2336 (class 1259 OID 1476297)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2337 (class 1259 OID 1476295)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2291 (class 1259 OID 1476183)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2313 (class 1259 OID 1476254)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2314 (class 1259 OID 1476256)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2315 (class 1259 OID 1476255)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2316 (class 1259 OID 1476257)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2367 (class 1259 OID 1476368)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2283 (class 1259 OID 1476156)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2306 (class 1259 OID 1476226)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2258 (class 1259 OID 1476079)
-- Name: uniq_7fb775b7e7927c74; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7e7927c74 ON uporabniki USING btree (email);


--
-- TOC entry 2387 (class 1259 OID 1476418)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2267 (class 1259 OID 1476096)
-- Name: uniq_af14917a5e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_af14917a5e237e06 ON permission USING btree (name);


--
-- TOC entry 2250 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2303 (class 1259 OID 1476214)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2424 (class 1259 OID 1476536)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2270 (class 1259 OID 1476105)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2338 (class 1259 OID 1476299)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2472 (class 2606 OID 1476736)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2475 (class 2606 OID 1476721)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2474 (class 2606 OID 1476726)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2470 (class 2606 OID 1476746)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2476 (class 2606 OID 1476716)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2471 (class 2606 OID 1476741)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2473 (class 2606 OID 1476731)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2457 (class 2606 OID 1476651)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2493 (class 2606 OID 1476831)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2491 (class 2606 OID 1476826)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2492 (class 2606 OID 1476821)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2469 (class 2606 OID 1476711)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 1476871)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2501 (class 2606 OID 1476861)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2500 (class 2606 OID 1476866)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2489 (class 2606 OID 1476811)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2510 (class 2606 OID 1476906)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2509 (class 2606 OID 1476911)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2508 (class 2606 OID 1476916)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2511 (class 2606 OID 1476931)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2512 (class 2606 OID 1476926)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2513 (class 2606 OID 1476921)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2463 (class 2606 OID 1476686)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2464 (class 2606 OID 1476681)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2458 (class 2606 OID 1476661)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2459 (class 2606 OID 1476656)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2454 (class 2606 OID 1476636)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2495 (class 2606 OID 1476841)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2477 (class 2606 OID 1476751)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2451 (class 2606 OID 1476616)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2450 (class 2606 OID 1476621)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2496 (class 2606 OID 1476856)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2497 (class 2606 OID 1476851)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2498 (class 2606 OID 1476846)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2467 (class 2606 OID 1476691)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2465 (class 2606 OID 1476701)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2466 (class 2606 OID 1476696)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2481 (class 2606 OID 1476786)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2483 (class 2606 OID 1476776)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2484 (class 2606 OID 1476771)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2482 (class 2606 OID 1476781)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2449 (class 2606 OID 1476606)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2448 (class 2606 OID 1476611)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2494 (class 2606 OID 1476836)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2490 (class 2606 OID 1476816)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2504 (class 2606 OID 1476881)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2503 (class 2606 OID 1476886)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2461 (class 2606 OID 1476671)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2462 (class 2606 OID 1476666)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2460 (class 2606 OID 1476676)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 1476891)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2505 (class 2606 OID 1476896)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2518 (class 2606 OID 1476956)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2519 (class 2606 OID 1476951)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2516 (class 2606 OID 1476966)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2520 (class 2606 OID 1476946)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2517 (class 2606 OID 1476961)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2502 (class 2606 OID 1476876)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2485 (class 2606 OID 1476806)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2486 (class 2606 OID 1476801)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2488 (class 2606 OID 1476791)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2487 (class 2606 OID 1476796)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2514 (class 2606 OID 1476941)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2515 (class 2606 OID 1476936)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2468 (class 2606 OID 1476706)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2507 (class 2606 OID 1476901)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2452 (class 2606 OID 1476631)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2453 (class 2606 OID 1476626)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2456 (class 2606 OID 1476641)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2455 (class 2606 OID 1476646)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2478 (class 2606 OID 1476766)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2479 (class 2606 OID 1476761)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2480 (class 2606 OID 1476756)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-27 21:52:17 CEST

--
-- PostgreSQL database dump complete
--

