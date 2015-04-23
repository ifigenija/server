--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-04-23 16:13:41 CEST

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
-- TOC entry 179 (class 1259 OID 1128979)
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
-- TOC entry 225 (class 1259 OID 1129462)
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
-- TOC entry 224 (class 1259 OID 1129445)
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
-- TOC entry 217 (class 1259 OID 1129361)
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
-- TOC entry 193 (class 1259 OID 1129145)
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
-- TOC entry 196 (class 1259 OID 1129186)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 1129107)
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
-- TOC entry 212 (class 1259 OID 1129311)
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
-- TOC entry 191 (class 1259 OID 1129132)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 1129180)
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
-- TOC entry 201 (class 1259 OID 1129229)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 1129254)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 1129081)
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
-- TOC entry 180 (class 1259 OID 1128988)
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
-- TOC entry 181 (class 1259 OID 1128999)
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
-- TOC entry 184 (class 1259 OID 1129051)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 1128953)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 1128972)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 1129261)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 1129291)
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
-- TOC entry 221 (class 1259 OID 1129403)
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
-- TOC entry 183 (class 1259 OID 1129031)
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
-- TOC entry 186 (class 1259 OID 1129073)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 1129235)
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
-- TOC entry 185 (class 1259 OID 1129058)
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
-- TOC entry 190 (class 1259 OID 1129124)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 1129247)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 1129352)
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
-- TOC entry 220 (class 1259 OID 1129396)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 1129276)
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
-- TOC entry 200 (class 1259 OID 1129220)
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
-- TOC entry 199 (class 1259 OID 1129210)
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
-- TOC entry 219 (class 1259 OID 1129386)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 1129342)
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
-- TOC entry 173 (class 1259 OID 1128924)
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
-- TOC entry 172 (class 1259 OID 1128922)
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
-- TOC entry 209 (class 1259 OID 1129285)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 1128962)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 1128946)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 1129299)
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
-- TOC entry 203 (class 1259 OID 1129241)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 1129191)
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
-- TOC entry 182 (class 1259 OID 1129023)
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
-- TOC entry 198 (class 1259 OID 1129197)
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
-- TOC entry 218 (class 1259 OID 1129377)
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
-- TOC entry 188 (class 1259 OID 1129093)
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
-- TOC entry 174 (class 1259 OID 1128933)
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
-- TOC entry 223 (class 1259 OID 1129427)
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
-- TOC entry 192 (class 1259 OID 1129139)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 1129268)
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
-- TOC entry 214 (class 1259 OID 1129334)
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
-- TOC entry 194 (class 1259 OID 1129167)
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
-- TOC entry 222 (class 1259 OID 1129417)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 1129324)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 1128927)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 1128979)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 1129462)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 1129445)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 1129361)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 1129145)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 1129186)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 1129107)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5538-fe12-3d2d-284c496f8220	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5538-fe12-4c12-fde4cabd9d14	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5538-fe12-af12-be0307d763e5	AL	ALB	008	Albania 	Albanija	\N
00040000-5538-fe12-d933-6d8f9761e8d9	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5538-fe12-293d-d2cb922b689e	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5538-fe12-46c1-4a264057a4d5	AD	AND	020	Andorra 	Andora	\N
00040000-5538-fe12-4937-e15fb70442c7	AO	AGO	024	Angola 	Angola	\N
00040000-5538-fe12-04f9-90fc26f7389d	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5538-fe12-fb29-76d2f538ba67	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5538-fe12-16d5-6806fb7a64b1	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5538-fe12-769a-b47dc857d0cd	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5538-fe12-5dfb-1072786fed40	AM	ARM	051	Armenia 	Armenija	\N
00040000-5538-fe12-3ec3-827446b8a7fe	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5538-fe12-2646-e56c5639735a	AU	AUS	036	Australia 	Avstralija	\N
00040000-5538-fe12-e9ce-df1ff37c67df	AT	AUT	040	Austria 	Avstrija	\N
00040000-5538-fe12-e8fd-d0726f2102f8	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5538-fe12-e0f4-f12e6330973f	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5538-fe12-fac8-4fb1a256b447	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5538-fe12-d44e-001176dfcb64	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5538-fe12-c34a-6ed6bffa60e0	BB	BRB	052	Barbados 	Barbados	\N
00040000-5538-fe12-0f0b-1d0d14e6959a	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5538-fe12-d8f7-1fa33a26a470	BE	BEL	056	Belgium 	Belgija	\N
00040000-5538-fe12-20b8-d60fb4d85671	BZ	BLZ	084	Belize 	Belize	\N
00040000-5538-fe12-fb5d-ba156c341c18	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5538-fe12-4713-dd2a0135f6ec	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5538-fe12-841d-206b411d927e	BT	BTN	064	Bhutan 	Butan	\N
00040000-5538-fe12-bdcf-5a808b2bd3f4	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5538-fe12-72a7-1addb107d03c	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5538-fe12-93c4-a6ef7e3833dc	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5538-fe12-30d6-a60e9e29d069	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5538-fe12-c14b-baa6bc38b96a	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5538-fe12-a536-c8a1935db3cd	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5538-fe12-b115-60fc0609bb11	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5538-fe12-e312-12bd928ff060	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5538-fe12-a965-74b6e01e0cac	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5538-fe12-d199-c0bd38190aa4	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5538-fe12-a4ea-f65c02cf5c72	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5538-fe12-10a6-fcf52cf42d30	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5538-fe12-f92c-db968b3c3a66	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5538-fe12-b76f-13c707ef2024	CA	CAN	124	Canada 	Kanada	\N
00040000-5538-fe12-b2a2-76c8fe2a6cff	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5538-fe12-77ca-4006aa8fa750	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5538-fe12-e470-71165c144bbb	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5538-fe12-d6f3-76dba3dc9eb4	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5538-fe12-c7a1-5bb646fb00e6	CL	CHL	152	Chile 	Čile	\N
00040000-5538-fe12-f287-c0ae5205b7ce	CN	CHN	156	China 	Kitajska	\N
00040000-5538-fe12-1e90-b7fef98265d9	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5538-fe12-2e7a-71cb6f848d9e	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5538-fe12-f3e5-75464d36f098	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5538-fe12-dda8-f09000288d4f	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5538-fe12-6603-b79321b97c78	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5538-fe12-1458-ad758b5455ff	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5538-fe12-146d-781febb14f7a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5538-fe12-eddb-bc6a7e0d0994	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5538-fe12-bc40-072fdf21c7a0	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5538-fe12-faae-72de93932120	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5538-fe12-4091-7edf9fcb8c17	CU	CUB	192	Cuba 	Kuba	\N
00040000-5538-fe12-6c8d-cced2aac5b2f	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5538-fe12-b7bf-26f07a797e2e	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5538-fe12-7099-375fcd6fe603	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5538-fe12-d68d-2f1410b5f1fc	DK	DNK	208	Denmark 	Danska	\N
00040000-5538-fe12-0ec2-1fd6377a0286	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5538-fe12-cbaf-52c7852274b9	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5538-fe12-eaf7-6fb18f92d4f6	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5538-fe12-e462-9f7b8bf88ccd	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5538-fe12-c3b1-2849e4af0040	EG	EGY	818	Egypt 	Egipt	\N
00040000-5538-fe12-606c-ab8846b1f6b9	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5538-fe12-4b8b-bcc3f59c4cd3	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5538-fe12-2fb5-30e4f23e6bcb	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5538-fe12-c6b3-0b9262d5aeee	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5538-fe12-2dd0-5e6d4c0323a8	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5538-fe12-964a-d3a4a3f2aaf1	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5538-fe12-81e1-ce056602e2db	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5538-fe12-2150-455058a7d99b	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5538-fe12-23a4-206e6074604e	FI	FIN	246	Finland 	Finska	\N
00040000-5538-fe12-a5b9-1fb7831072bb	FR	FRA	250	France 	Francija	\N
00040000-5538-fe12-fb69-09c8b0dc2e65	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5538-fe12-8c1b-7ecc0d73b332	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5538-fe12-4694-df875966f45c	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5538-fe12-7931-d66989e6ab66	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5538-fe12-5274-c52a8dd2ee79	GA	GAB	266	Gabon 	Gabon	\N
00040000-5538-fe12-6958-a04bd604c7df	GM	GMB	270	Gambia 	Gambija	\N
00040000-5538-fe12-c4dd-119b84bd35e2	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5538-fe12-8532-4c644d5518af	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5538-fe12-7e0b-dab8a9138303	GH	GHA	288	Ghana 	Gana	\N
00040000-5538-fe12-9a2b-9fec0bd27fda	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5538-fe12-50fd-20217bd755c7	GR	GRC	300	Greece 	Grčija	\N
00040000-5538-fe12-e212-709798ae124d	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5538-fe12-19c9-fd8dfa35e105	GD	GRD	308	Grenada 	Grenada	\N
00040000-5538-fe12-bcf7-66a9ecc2eb3f	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5538-fe12-7124-c3c234f687b9	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5538-fe12-6b06-04b8483f0283	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5538-fe12-411c-565bc34ae70f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5538-fe12-741f-25c3bf10ed58	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5538-fe12-95d9-5f99a5d91547	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5538-fe12-94ed-918c0bcbd73e	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5538-fe12-1fb8-7bdd7a6195fd	HT	HTI	332	Haiti 	Haiti	\N
00040000-5538-fe12-4d2b-3a47b0b1173f	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5538-fe12-2bce-7f2857c64e72	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5538-fe12-14d1-d14bd55b3104	HN	HND	340	Honduras 	Honduras	\N
00040000-5538-fe12-18d2-bdc637b17eb6	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5538-fe12-eee0-a2fba09c89a4	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5538-fe12-0e71-2ac4ac6b375f	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5538-fe12-59a6-e7a9d86f8e84	IN	IND	356	India 	Indija	\N
00040000-5538-fe12-c88b-3c60f40f18cd	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5538-fe12-5e9d-179ff1c39abf	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5538-fe12-2668-f123c8d29f53	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5538-fe12-6ff9-d5547c48caae	IE	IRL	372	Ireland 	Irska	\N
00040000-5538-fe12-5589-3f1f040e5f20	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5538-fe12-c211-5a8fd6dd20fa	IL	ISR	376	Israel 	Izrael	\N
00040000-5538-fe12-f01e-f2897ddfdbac	IT	ITA	380	Italy 	Italija	\N
00040000-5538-fe12-6316-e871ccd73684	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5538-fe12-a973-efbe53a2ae47	JP	JPN	392	Japan 	Japonska	\N
00040000-5538-fe12-0cc7-eb040428a9bb	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5538-fe12-096a-be14e574daeb	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5538-fe12-9c1e-8f5c1d2b3ab4	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5538-fe12-1945-aa75cd140b4b	KE	KEN	404	Kenya 	Kenija	\N
00040000-5538-fe12-cf49-b82e533f417e	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5538-fe12-cec7-84a9b8481787	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5538-fe12-2ad6-f69ebf52f002	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5538-fe12-51ab-f46cd4676a4b	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5538-fe12-aa7b-508cc42c625b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5538-fe12-5db0-f81e3bceea4d	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5538-fe12-7a19-f5cc7d5b9fd5	LV	LVA	428	Latvia 	Latvija	\N
00040000-5538-fe12-9859-8440db6e5b00	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5538-fe12-0c44-6bac2d3da623	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5538-fe12-9278-188666d68617	LR	LBR	430	Liberia 	Liberija	\N
00040000-5538-fe12-9a24-81b03cfaf78a	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5538-fe12-bc73-cd371b9d0e80	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5538-fe12-e4a9-6f100a0f6ff0	LT	LTU	440	Lithuania 	Litva	\N
00040000-5538-fe12-d7a1-842dd313fbfa	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5538-fe12-14a8-ab52c8045244	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5538-fe12-9792-70444efbe535	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5538-fe12-97c5-0c61bc549fa7	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5538-fe12-27a2-e68221d25add	MW	MWI	454	Malawi 	Malavi	\N
00040000-5538-fe12-c596-51ce90b53347	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5538-fe12-7b9b-cd81871da861	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5538-fe12-d87d-20050b71825d	ML	MLI	466	Mali 	Mali	\N
00040000-5538-fe12-85a7-9bbccab36ad4	MT	MLT	470	Malta 	Malta	\N
00040000-5538-fe12-a9a6-82da438a5ce4	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5538-fe12-a47b-9cc0586c0fa0	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5538-fe12-d7cb-9ee5f30f6509	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5538-fe12-0ac3-632553bfde6d	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5538-fe12-d5d7-0b475c339a6d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5538-fe12-88ac-8d2ca415f514	MX	MEX	484	Mexico 	Mehika	\N
00040000-5538-fe12-eb04-20fea018488d	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5538-fe12-305c-b891addef613	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5538-fe12-3c44-dd029beb179d	MC	MCO	492	Monaco 	Monako	\N
00040000-5538-fe12-1d9f-23be7e39febf	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5538-fe12-3e46-02166646eba4	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5538-fe12-ea9c-c25b66dd6c59	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5538-fe12-184d-2288d81d4177	MA	MAR	504	Morocco 	Maroko	\N
00040000-5538-fe12-0af8-b640efd43081	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5538-fe12-6d9f-16111b5c287e	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5538-fe12-29d5-b948db34e967	NA	NAM	516	Namibia 	Namibija	\N
00040000-5538-fe12-de36-4fd48750246b	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5538-fe12-05db-c8fe9e530140	NP	NPL	524	Nepal 	Nepal	\N
00040000-5538-fe12-4c5f-109ec1df71e2	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5538-fe12-210f-bb5a98d3dc6c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5538-fe12-c322-2666a98bd19e	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5538-fe12-d354-e6299424caab	NE	NER	562	Niger 	Niger 	\N
00040000-5538-fe12-1345-2d4d04480de5	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5538-fe12-6b09-f655e7fb531c	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5538-fe12-45bf-b8fc6b1a868e	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5538-fe12-22ac-12f74d9d7bdc	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5538-fe12-dc9a-1e346c901e03	NO	NOR	578	Norway 	Norveška	\N
00040000-5538-fe12-fad9-b2e08bf82444	OM	OMN	512	Oman 	Oman	\N
00040000-5538-fe12-b4f5-20eb1c927f2e	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5538-fe12-b511-cddff9ca6d81	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5538-fe12-67b9-5f10f5f1dd40	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5538-fe12-b89a-f31d66f1cb23	PA	PAN	591	Panama 	Panama	\N
00040000-5538-fe12-1152-9a9b9802fa5d	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5538-fe12-c610-749975ee9b0e	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5538-fe12-bb33-de219b0dc397	PE	PER	604	Peru 	Peru	\N
00040000-5538-fe12-1ae0-f28abd366c8b	PH	PHL	608	Philippines 	Filipini	\N
00040000-5538-fe12-ea50-d5fed4e21a6e	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5538-fe12-44fc-538dd3bf491b	PL	POL	616	Poland 	Poljska	\N
00040000-5538-fe12-06ce-1ef65c3c0e15	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5538-fe12-9e90-2f2721a0c886	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5538-fe12-d789-aa3c66b7e02e	QA	QAT	634	Qatar 	Katar	\N
00040000-5538-fe12-7516-5c5b8948d951	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5538-fe12-125e-698f7e91e9c2	RO	ROU	642	Romania 	Romunija	\N
00040000-5538-fe12-3062-ead9cdf4cdf5	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5538-fe12-19f1-0d4a12fca8c5	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5538-fe12-469b-7ddf12dffd89	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5538-fe12-6d09-b22c1ca50b30	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5538-fe12-bd01-ea0facc10b36	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5538-fe12-b2bc-a0e7ebc6a8f3	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5538-fe12-3a7d-8426dd008984	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5538-fe12-bab1-b3933f88ab53	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5538-fe12-e565-542367c8530a	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5538-fe12-b341-c5b93002cf68	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5538-fe12-19c2-7530a86edd57	SM	SMR	674	San Marino 	San Marino	\N
00040000-5538-fe12-f01a-5146c9af1066	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5538-fe12-02b4-f740428c28ba	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5538-fe12-5410-63a1e0718ac3	SN	SEN	686	Senegal 	Senegal	\N
00040000-5538-fe12-a4c0-e6eab8b185ea	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5538-fe12-8915-0ccdec86c9b1	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5538-fe12-37ba-dc086d98c758	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5538-fe12-5fdd-62d95a39e0ac	SG	SGP	702	Singapore 	Singapur	\N
00040000-5538-fe12-91de-1ab92a5a8cc4	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5538-fe12-5412-6651cf01887b	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5538-fe12-52d2-67bdd27753a2	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5538-fe12-8d6d-5c17de19b1f7	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5538-fe12-13d2-a2c6cf154e30	SO	SOM	706	Somalia 	Somalija	\N
00040000-5538-fe12-5d4c-9ea45afb63a1	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5538-fe12-f745-328fbb512b9f	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5538-fe12-1b16-2ae1ad7f76b6	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5538-fe12-1359-5f68a24aa84f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5538-fe12-1209-e2ee05dd32ed	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5538-fe12-eb23-1342fbbdf789	SD	SDN	729	Sudan 	Sudan	\N
00040000-5538-fe12-c795-8f0884318281	SR	SUR	740	Suriname 	Surinam	\N
00040000-5538-fe12-3102-7d812c6dff2a	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5538-fe12-1998-fa90a93be660	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5538-fe12-6009-7cfd9b853a5a	SE	SWE	752	Sweden 	Švedska	\N
00040000-5538-fe12-ce48-c3dc0e6534c4	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5538-fe12-6a3b-1fbb94b7c23f	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5538-fe12-fd9e-c6572ea52602	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5538-fe12-8a7d-2d0627e30f91	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5538-fe12-ca1e-c93bceaa6af5	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5538-fe12-0dfb-29f5fbedc32c	TH	THA	764	Thailand 	Tajska	\N
00040000-5538-fe12-f48d-d4aaa4266efc	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5538-fe12-7643-78cf22b56e75	TG	TGO	768	Togo 	Togo	\N
00040000-5538-fe12-2e57-4204431a9ae8	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5538-fe12-3455-f027407edb9b	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5538-fe12-f608-a14ebbce2ed4	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5538-fe12-f157-aa75a172d87e	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5538-fe12-db62-38cc23bd5dde	TR	TUR	792	Turkey 	Turčija	\N
00040000-5538-fe12-951b-6c499bc4f7ec	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5538-fe12-8d21-feb465b0b41a	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5538-fe12-1261-4ceda65de101	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5538-fe12-117e-b5946f10d314	UG	UGA	800	Uganda 	Uganda	\N
00040000-5538-fe12-acb4-2670332c2740	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5538-fe12-8226-c6be8529e23e	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5538-fe12-f648-a18b6b473275	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5538-fe12-cbe5-0c8bf41b4bc4	US	USA	840	United States 	Združene države Amerike	\N
00040000-5538-fe12-fd99-f3a9b1e3aa1f	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5538-fe12-229e-a65772497f3b	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5538-fe12-ce84-791e48f1d1c9	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5538-fe12-9165-8839c6305bdf	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5538-fe12-c15a-cf0184a9aff3	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5538-fe12-a951-9509243a3589	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5538-fe12-34c3-c41f672dabd4	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5538-fe12-d7cf-0f5895f2b76e	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5538-fe12-b8b6-1703c92b270f	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5538-fe12-eca8-95571108d925	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5538-fe12-671a-d5b850931910	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5538-fe12-6a5a-450eefb768e0	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5538-fe12-0e81-fbe2e181b678	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 1129311)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 1129132)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 1129180)
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
-- TOC entry 2658 (class 0 OID 1129229)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 1129254)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 1129081)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5538-fe14-da3c-6c7e1f61e06a	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5538-fe14-c119-9c95922f288a	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5538-fe14-40b6-cd5af1a0ef91	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5538-fe14-881b-389ea6f0c794	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5538-fe14-6897-3f47b7d116a1	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5538-fe14-a1f0-774f3d7f8675	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5538-fe14-658f-616aa7491be5	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5538-fe14-4545-fefe9baaeec8	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5538-fe14-4771-dc43bfe16cbf	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5538-fe14-d1e9-30e4de99fe14	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 1128988)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5538-fe14-ac0b-de511394ccd4	00000000-5538-fe14-6897-3f47b7d116a1	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5538-fe14-46ab-7cf4fd2b401b	00000000-5538-fe14-6897-3f47b7d116a1	00010000-5538-fe14-3ba0-204238e29ed6	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5538-fe14-fd15-75ada612ede0	00000000-5538-fe14-a1f0-774f3d7f8675	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 1128999)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, pesvdonim, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 1129051)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 1128953)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00020000-5538-fe13-ca26-d71f7564230d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-8f67-0c1deffcc44d	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-946c-5a8fba819959	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-86d5-c3ab84773f6a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-10ee-85dcb813112b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-7acd-7f9e3ecfffaa	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-f470-5d199161e7e3	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-cd2e-25c23b0b512e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-bd05-4060356557df	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-e893-4aa58a3b9e2d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-4b4a-4f2041254df5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-bb22-a2e6635d6a16	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-8209-f34f5962e1a4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-e517-a2ac0e30e4f6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-cb07-00639c95143e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-f91b-0cb815d5d1b5	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-df85-92132044b160	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-8f26-a4090c4eac24	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-6e63-81fc4f778d0d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-04e3-e9d065bd54d4	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-be6a-aab055c2f8ec	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-89fd-01d2675072b1	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-dfc0-10b931eaea0a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-05c0-e3c04d55f4a2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-6408-e061df2066d1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-d418-5b3e6536ab47	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-b611-aacc0d0307c1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-6e84-396231c5891a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-3ba9-0aab11856496	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-8881-129f715b72c4	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-d1d7-1d9ff5bdc85e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-8607-c33f29d230fd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-8d53-d4ae6d06e34d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-419b-d83fd70dd8b4	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-b645-adb3a7438650	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-2f31-c61d265bee03	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-3757-48014901a372	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-59c9-df01d7b748ab	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-02a9-e8dc667271c8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-31dd-591acb7af049	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-4db6-c11b38b6f1ac	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-13e0-31b904c13763	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-6476-839263c36b7c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-4439-8afc16148db2	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-b1a9-fa65a7d220b7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-7037-4c8d93baec79	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-dba9-511f11f3f414	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-871f-f34b5bab8a2c	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-7fe2-900c279ae935	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-1a21-6a7b8dad0e56	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-1d13-c6e26a72caf8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-0d1a-783dc34c861c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-c0a9-12398d53f33d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-293c-efa87c322a73	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-8c8c-4ecbca7a2b59	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-20db-8780a660eae4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-253a-c0d214feec10	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-e352-dc4e7c0977e5	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-45a0-bf7c16eabfb0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-691d-602f0c2d315b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-86bb-c4f237cd860e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-f961-7d66408e5529	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-b3a3-8330ff52487f	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-999e-643426e60226	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-bd37-bd3b84e7eb46	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-9349-1d1a605ac0ce	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-3492-fea7126e7da5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-12d1-5aea29ce042d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-6589-cf362a60e11c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-13b0-7a3526330941	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-4e6b-5715d1527b46	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-c17d-4ce071e1a99a	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-7acc-b914aebecfdd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-5f1c-a6f0d8f341e2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-5973-02b39ff8b480	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-fcfc-7aa3cd3d0e3a	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-503e-f3f7bac292d2	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-274b-6b7233f48bb8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-a86c-866968295272	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-440d-37c5c89579e2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-c978-43be44065b52	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-2e16-2434432efed0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-3ffd-7233fb53635c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-3ade-52c02a9826ee	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-3eb2-8419ad824048	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-e30d-d9fd12b1aded	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-605f-344872638d03	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-9f8c-2e6451a0eb0d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-c8ca-6fe69e315588	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-62db-c3024865aa98	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-4589-1242c8a6596e	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-476c-c84da5ce2084	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-bd6e-1521829de14f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-4663-6a64edfef307	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-a0ba-1d7e12703d3c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-cf29-fc092341643d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-25cd-604bb41f16aa	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-267a-be18f2c3eee6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-4d84-cf47741535fb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-69a2-e415e552887d	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-5e70-2c1acca74769	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-ae58-8033cf78be81	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-7afe-12568a976d2d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-31ff-6f862578de19	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-3385-d35a5a772cb0	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-3cd1-0b74612733ba	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-83ed-7b31430aee4c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-3428-f06d45d2a764	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-71b5-4418f6ea1b0d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-9bb9-cacf5f1b8760	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-655f-1a40334e7f71	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-52bb-ce2c95ad7d86	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-2489-ffefde56770f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-30df-985a2e85934c	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-ae94-3d57607ac5f9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-aaad-6a76e4927a1b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-ba39-d7c743c32b12	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-d82e-eeaf6e82900f	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-4a5e-5b4588e2188f	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-4a2d-6b60142ae680	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-fe2a-06679687c718	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-acb8-12f29ffada26	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-7668-0a9fcb19d2ab	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-1e9e-65a51ea25b09	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-9d27-baf2a1368665	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-49a9-5d8a7493aec1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-143a-9bb78e9ce939	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-0c18-68022b4897f5	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-bb6c-32b72d899cab	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-41b5-e22f29e980c9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-2f83-bd74970279ac	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-fc9c-7d75d1fe4cef	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-a05f-86ed045920a2	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-c73c-d91881d6f308	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-fae1-654440add4d0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-b009-e56dd02169ed	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-c957-6c4601736056	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-5d64-57386032448c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-4f6a-a5abdaf1b062	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-26ad-d045ee234770	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-2ba6-7fe462e8d25b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-2ad5-ef6ad4f57678	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-3c9a-b1e890ace8f7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-ed6d-4bf4c33a312b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-f6d8-e597222bb076	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-edd3-4f8545beb282	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-6cba-f2e65dae1a59	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-bc33-01dbfb5b6a8d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-28af-177ee5184f78	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-99e7-8256d9451c51	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-19fa-88bbc0c2876a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-e342-9fd1305a1934	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-0a16-640ca20efb79	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-e0ca-ea745d304f63	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-06eb-2e053539feff	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-a111-a5f4a8847054	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-0fec-4ef22960854c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-83da-cbf3099c2835	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-8913-90b956b4a99b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-970f-e99a4245c4cc	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-e3de-4f49a59de229	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-27fd-d5cd03db4b42	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-1622-147d3a111011	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-42ef-6ff680290d69	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-7274-0ee4128c3cc8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-e9d1-2d29c4ce8e55	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-0c09-55f2d506c410	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-31b3-f3e07bb45f7e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-06c3-b0a6e603dc91	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-61b6-4f8b411b2a92	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-e0d2-75c631dce77c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-e9c9-9e20dd0d6318	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-e077-d838a510c887	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-3235-be18750bb858	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-8d71-ac89d671a344	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-eef3-d7594f58d4ea	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-b3f1-19f7883c6989	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-4e76-14118f55aa66	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-5e90-acadab30671d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-d2ff-99d9bfef4458	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-2250-0f2863a68bb1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-6662-f197724fa25f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-563a-5400ffd80647	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-7aa3-a04d4f6dadb5	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-9b1e-f28774a072e0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-55dc-91866caeb62c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-95e0-afbccafb33eb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-9757-24f7e0e4e13f	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-2674-2442a720bdab	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-f773-d29d5d79b82a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-53d3-1e8597740bc6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-d2f7-0193e336c348	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-fd29-4644224e7a67	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-86c2-12be16844813	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-a87f-eacd5af9b9c9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-c29e-1e98a150408c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-00d5-15fc69b2a28d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-4222-61f3379a2439	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-c695-cf6418fba944	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-0f26-a658b77e2d32	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-61c6-1e514b3963d5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-39de-a2f9a1096fa0	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-6401-d8f908c6e50a	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-7bd6-594cb2826470	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-401d-d339bf9dc6bb	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-aa14-5a91eb21a060	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-88d3-bf246bc13dd7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-db82-fe1ca70de574	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-289e-9718f1e19904	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-b83b-531667c1f6b3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-de95-369321254f77	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-5096-28b515e17050	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-60c4-1c5e71bbf2c7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-1ae0-97a2356f5a42	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-8df8-a6ba6b84e33a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-5934-8a1db395d701	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-33a6-86a4d8caa3b5	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-fbeb-857d2c758598	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-7e3d-00e40385663d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-ab37-c02271ee1fda	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-c068-3ed01d82a9eb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-c2b4-c623a63780e4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-a887-ac81602edc93	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-15cc-38b46454f3eb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-0fb0-2b3d0287f4c6	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-582a-a3b4c5c05db1	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-1c69-e6893b152743	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-6139-a37066c2256e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-db9a-faa02d13371a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-1e6e-8f69543802f7	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-47ab-04dbdf9690ff	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-2ef1-f774c86f6717	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-6188-da4249b276e3	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-1b22-0442813c50c4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-5c73-7c954f9369dd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-c8e9-9c84fc2efb30	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-60a2-6dffa60f63f4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-7a57-244e6fb22855	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-1de2-d0619ce95c6a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-b537-61ffde0fd203	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-5185-52a495c59245	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-b5ae-769dfea38106	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-dc79-985b5bd672e2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-4ce5-299c6e21dd49	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-673f-5edfaecfe7b1	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-8710-4ba80c6dd9b3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-1639-02363d695885	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-73f9-dac67ff7082e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-b503-653d177c0ee7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-ac4f-a2348fc17425	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-ef75-9a130dbb894e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-dd00-4eb69160e494	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-32fb-9b083a65c5a1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-e16d-335226e778e3	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-37f7-d132d3eeeeb8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-bef2-982f3eab3e16	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-4e7a-1d3bd9e89d49	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-b846-b96874795105	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-4dab-215ad5d22fb2	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-18d0-176d9f5d6bfa	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-0873-3c736253b80b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-c436-02fc90b577ec	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-5bad-37f901778fe8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-bf18-5b788b7fd730	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-960f-856d3e5763b8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-b7d0-6a5ecfdc9243	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-583c-d67765ca8a48	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-cf7d-a373295109c5	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-1bc2-c632f505999c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-edfd-42c14615ec48	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-3a94-1d83eceab3c2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-733a-a3170bba9837	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-727a-6a2289aaa4c6	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-bb20-2d87619dc733	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-d07e-80e7308159ec	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-3bfe-66eaa2608b71	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-0d8b-7ff04a01279c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-a723-e544b9022d87	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-0cdc-522370b7c39d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-bfb3-742ee4c709a9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-a519-cff05d24e969	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-cc46-736077027a97	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-fdb9-317e39c71a11	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-1ada-20e10cfff2e4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-5747-c3abb12d9978	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-af51-3329ea108858	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-7b01-dd2684eaa3ff	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-7f59-0c1c69a2664d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-db1d-96bd0311850e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-9d2e-e6cf77d76a83	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-df6f-469b6121a4ae	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-7627-3af2bd577386	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-2492-a56ff7f7a364	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-7cd7-a22979a3e974	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-2538-3f36f616f582	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-8238-6cd75599772b	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-fcbd-227046ed6436	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-b937-d8464e38176a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-da4c-3ada6321f13f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-f18e-9f4249a8f718	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-ba0a-5432cfe61cdd	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-2fdf-15d68e410b53	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-20e0-69e158813b26	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-262d-ba90bb560257	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-47cb-70866e52421d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-97a9-811fdf4389b3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-58d1-33ceb4d67478	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-510c-f3fa8da09c4d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-0e7b-e1dd89f6ac9e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-cfa7-62442b938173	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-3d40-95df495a720c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-01ac-db738f2afb46	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-17bd-45c5fdc6605f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-e6ab-d2e8aa1115e4	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-1f61-4bc8a7024f41	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-c7c5-2144254d7811	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-948d-a5cc7fe8e8f6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-e09a-9e5c55c29a63	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-c7cd-5b9c49f04058	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-097d-62e539c6e5d1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-e3a9-bd9be26e8a5a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-fcf8-93198cf00f6e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-6368-777e619c75cb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-2393-03c274e7a60f	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-d1a7-16fc15678f4d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-dd3e-4cf6995c3042	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-e679-9a7cf5a77605	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-c682-39262dd92e4f	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-f1aa-99bb69537617	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-677d-46da890c0260	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-a557-c2d3b6dd4404	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-20db-b94f0b6bc888	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-230f-2c1a32244c91	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-5f0f-40b7342ac3cb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-370e-07ee3499e4f8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-c77b-9c4e37a9c3c0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-a74c-32555e71edd0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-09f4-3d2253320e05	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-5f9f-f14988f042ce	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-8de2-2b507ed17422	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-f08f-65b302b56698	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-02fd-0e88d38b290b	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-dca5-882663542cca	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-7f3d-fd76c40ae298	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-e3db-10c15e96c1d2	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-abad-6de8ff0397cb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-8219-b247432decb8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-7607-a2f823f7db95	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-ca13-43dad5b4a86e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-e410-c621a0ee3d88	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-0671-5d7479ed7cdd	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-1e9f-8d44ae4d7f34	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-ef39-6d90451e0f9a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-f5dd-bb8c6d26eb36	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-dbe9-0fc27c331a0f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-949f-7e3548e8f2fc	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-5673-e849ef3107e6	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-335a-2289288542a2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-1dce-5db19de368f3	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-4112-e24729ba50b5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-dbb6-9eda467d397c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-83c5-abcfd78e17fb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-7322-675057f61978	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-8312-4955d7cb2ade	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-9cfe-ef73444eb7b7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-ba65-da32e88b17dc	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-ff2b-b3f423f40c40	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-7cef-13c15d785fa2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-f3ef-e0592cee1698	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-ec16-5513652efda7	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-b8e9-10ed7d754b3e	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-3212-fd6c6a256f4b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-59d9-a620965570be	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-30e6-3c306bc3ba99	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-60e4-f8c37a2519f5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-23ea-0c1b5d91a6a5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-1017-45489f32c32a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-559b-13f6c0dd89c8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-042c-2abe2fcb1cda	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-a494-a1c66c4d9b20	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-8792-29f51877b0c4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-f5b0-e375daa3157e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-4f57-d826d26e140a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-3363-16af62dbe1ca	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-9122-4f7690100321	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-f3e1-b5a6ae8b02d1	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-cbe7-465188b1b526	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-9ea8-6b464058a07e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-e6b8-3f45b5134557	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-c194-0364020051c0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-c1ab-98486ad26532	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-d88c-a78060c1a50b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-9b01-30957da20251	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-5d3c-dad522020e07	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-08db-fbbafd745e1c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-4576-d6bd3caa0bec	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-50ee-df191d483143	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-b3ac-386ba0df92fd	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-42db-8a3e3f9ff25a	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-972e-a59365965460	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-252f-c5b901b9fedd	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-f79b-9e4441c6792b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-22dc-ba3b08477af5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-6bb1-344ce7e1d15a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-b6e6-fa6de60f582d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-d71e-2860fcd3dd51	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-86b0-813050eb7356	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-c00f-ef07a342e458	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-fe9c-7dd3adb3be2e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-39b6-32322506daa2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-59c8-c702e09410e7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-8843-3308794df8ee	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-ed70-01dc986cfa06	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-373f-4b1251680886	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-a9a9-b8af565ec44e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-ec58-fab6bda4255a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-8cce-90490a8f350c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-b7f3-462f42033bcc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-272e-6543ebe43913	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-b864-825194ba838b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-de7d-b1d4e3c80ce7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-1236-dd0c5e8c315c	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-4f00-051b7dc6abdc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-28d5-e78f3f9072c3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-902e-bf8abe0c460e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-d289-eea39ab9cb0d	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-1549-6a0759046650	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-b750-34d16e1d035f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-2cb4-ffdf7af42c45	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-ffaa-67a9a303114a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-5fef-fd91a5fed01f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-a227-ba38ec4314e9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-13e7-9ce1da663a12	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-ee8b-cfa413f1f95c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-989d-c10d6a7234ee	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-b545-2f856d5e7811	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-9cf1-3388da0675e3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-7033-6a0972c363f3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-90e1-952b893240b4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-bd01-7c3d90e72b07	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-c71d-8a553c709e7d	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-8a02-1dc5c77ffa47	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-cf9e-040c48d49930	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-1252-15a2a1e8c82f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-faef-e316d718a5bd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-18e4-c46d2dca20b6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-3e56-94e88dd1c6e4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-2e50-a6b430aa6fee	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-ae28-d18f8791c432	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-780c-5608aff3fd99	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-bdda-f513cdc79fe7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-170f-9923a673c616	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-6e86-704b3f1047d2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-c1a3-d355419b722c	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-63dd-e9d0e99fedaf	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-59f7-6c5ce9d77a5a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-4e92-0b18d27dc83e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-183c-e608b300b2f5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-3560-b0fa5bf3b0d3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-5003-4a03602849d9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-a989-99f8b5647758	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-3fe3-61a82ed7113f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-bc45-ea6fe9bac0a7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-7112-32db6fa4f80b	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-6990-65b04057a0a4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-937e-84c1c283e0ba	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-c7c2-cdcb6d7fdff5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-3e57-ffa9180f22da	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-99ce-62d2380b3469	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-d795-f4e8b8a435bc	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-90cc-2f4c6d2ddca1	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-753d-29f87c71cdfa	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-53c3-03fdd0ae44e2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-958c-0e249561083d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-581c-d0e91db8afb3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-700b-643ad5549695	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-557f-567756273451	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-987e-b9d50b79ebb3	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-b30a-77780951c155	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-4cf1-c4dfe4939c71	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-5300-6774f36ae42d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-8a5c-650cc6394d3a	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-f144-f7290b22684c	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-5afd-8601172d7209	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-18ef-94a69567083a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-3463-fe7f800b8aa8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-7c61-d9ded7db09dd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-aaad-f741eb8b4943	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-17b3-fb654edd22c4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-a978-433c8d2527d8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-e8ca-c47dd11c90bd	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-9068-2c416ecd90e7	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-858e-f40875efd823	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-1a7a-ea7d6be53d3a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-f678-200cb870d1eb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-d922-9814a0a66309	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-605e-1ae016c7e14d	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-8122-cf853240fc25	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-288e-ebc3de57f4d0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-8db8-46e4aeb35e38	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-af09-6d067ebbce49	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-2474-8c96b3156deb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-6ac5-3c85fac26e92	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-18a7-a6e8c94b139d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-eead-bd1b7e200b7a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-a8de-41005b7de78c	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-efed-9d5983ecc481	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-f07c-f0dad762dcd7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-8948-9a6b76ba510b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-5cb3-c7c4591877a6	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-a051-3d66f6a8470e	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-c992-7ad31680014b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-00a0-52e91d6500a2	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-c705-6d8109c09616	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-4599-d6bca9958757	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-96d6-7b12fde38ad9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-272e-32c8d25fce95	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-0c69-8d166e7f02ce	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-d887-dc35819f83ed	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-9e4a-b65c0fb3e456	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-5869-01d33c8a1773	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-fbae-74a1b9f0e513	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-e691-1a8a8d996a97	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-b20d-6d3186c994a7	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-450c-184573bb0484	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-32c9-da0394807d1f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-0580-738dba8a5088	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-aea6-02fe2efa2ce9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-a617-bb2857d9c4cc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-8687-ec65fe9c72c1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-be26-1038f10ba935	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-6313-bb67fabcb0db	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-992b-7037ec076373	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-b5ab-c66088c1e18a	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-a9c0-663e82771bb1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-3526-63a666979c73	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-e758-dae56502decb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-7269-8ab40e10fb7b	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-14e2-4cc03536dd96	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-4714-b6ce8a30793e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-4302-d9fdbb2ee88e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-697e-d05eebf87405	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-ca78-019816e1a807	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-7ad5-598a0bfb0ef7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-ac02-e3c64edfe89c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-a92c-30a6ab33e6c5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-1536-db8628ad1612	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-af9a-b3ffae29f82c	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-a554-849f9cacd5ea	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-3518-c6b82bd179fb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-d2b6-c7230d968a1e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-5f14-705a0b990a9b	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-e8d9-9e2794eba557	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-827e-4a819984e7a4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-cf7e-677a0e48683f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-3f3c-cb0ec82af87a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-380d-a82a641ddad5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-774b-255b5557c216	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-9dfe-049038327f7d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-aed1-a9efbecb6da4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-9100-234985f19f37	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-d244-1bb5d91c55e2	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-b2fb-c71f8a0e474f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-1db6-17dd2f2dfee1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-0c7b-2f43cf035efe	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-f449-a91430ae8182	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-51e8-c7cfcb053631	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-6141-8715779fd061	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-7f57-83f7dc016499	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-3da2-a50fa7c9d0d3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-af28-f4501e17da9e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-0c12-cc72d7ea35aa	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-4b04-ddf34d1025db	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-9023-46773a8993fb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-766f-7cca4d7ca14b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-d461-0ccabea13410	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-7d66-0ee6de3c4085	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-afef-b6d186e466bb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-38b9-118c62f1627b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-cca5-dcc6a2221fa7	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-3a0c-b523c6d8efaf	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-0652-262f5588cd04	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-fed3-de62a2245377	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-0ec2-637b5c8a5dfc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-e651-0e59f6c19aaa	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-c03f-8b7709560411	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-d438-2afc9c086325	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-22bf-cff63e391aa2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-cdbf-c1345291252b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-3006-7b9d78a44e20	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-f215-27174713e333	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-9fca-0d56c0383357	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-2bf0-118e67ac4b38	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-0ad1-498721328d96	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-c337-67836b3ea471	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-8ec0-e86edf98fa50	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-8d75-d905a6d8f6f0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-b6d0-700227ab93ea	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-ccbf-f631e1f2f83e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-2495-e9b978ea4992	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-ea03-74a0b3b7ed06	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-75cd-d895575a07f5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-6c0c-8c284faee1ad	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-69df-758ec141108b	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-e1c9-4ed1e90cd7a2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-a08b-be21cea06aa7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-2e0e-4f78f4e8aa2b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-a472-ea0e1c5656f5	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-b289-7d6a264e36a6	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-dddf-6363d1748859	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-4fca-163e3dc5fe83	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-c7c4-d506362b2a80	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-10a3-271f279db852	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-197e-2d165a3cc6cc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-1526-a2a0cb164e02	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-8242-f01b3c033fd7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-7505-b02b437a3088	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-b1d5-4b6a8c40f13e	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-2a93-97363c716472	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-d834-e3a42aebdd64	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-f580-fd4ef59e770f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-0f0e-13cecb925885	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-b034-5dc4b6077260	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-8a90-a3559a64e331	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-20b8-d942e3fecf90	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-c513-e0abff1d64ab	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-9104-db90ac55434f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-1c91-e7e2bb2cdb32	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-17b5-9c75b0c3cedd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-b2ff-a18900e1ff5a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-b69d-920012d6ef29	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-fd0d-e6d287034d64	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-b367-9369c5e5579f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-995c-8d889a7ed89d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-c0e8-466518bd1e57	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-5ea1-befdbbc46fcb	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-2b79-86aa9814af9d	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-5588-67f935de5a85	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-c8fa-e6dc20a984e6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-a51c-38472011c761	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-de39-7907b7c2857e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-e97e-a150dbd3319e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-6a3a-0b36a79fc819	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-2022-387ff2ece85f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-f415-8915bd253f29	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-42b6-84d5712dd96b	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-2100-4bd2bff4bdb6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-6ad2-750441aa38f9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-be6d-b7f201cebe4f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-be81-dc514d6917e4	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-fcf1-15166106b037	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-7e2a-8c67275ac766	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-1c6a-5b2520373729	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-76a7-a9a109dedd16	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-6873-900abc0f24ac	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-4956-15fddb06657f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-6e7e-9f64803047c2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-c9a2-e2ab3e4e4fc1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-06c2-db0be3a86e4b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-e98d-a3e32255ac87	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-8da5-981b888dfe01	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-7747-d18f76f5041c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-7df5-5639c17f3a25	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-7698-535700ed1aa0	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-814f-f5cf0e0e1588	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-3dc6-b4fa204cfcef	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-5c81-65f1a61f09bd	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-b31b-3dcec5659bd8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-f629-9eb8986ff1c8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-050b-a56af86ad1b7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-7ae3-44f00a560469	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-e042-84b35fb7c7d8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-b8b5-2f2e072278f5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-ea24-8aaa7c8c83d9	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-c215-b0e078b33288	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-6af6-e7def75dfc7c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-1bc3-705dd9e7a0f8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-1722-6112ddc9ad1d	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-3bb0-65818b8792e9	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-8541-63449a2141b4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-21a2-b0dbc477c618	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-cfd7-237e98e06a46	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-0d99-527cf831df68	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-b735-d26ac55ec28e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-19fb-47d69d608d65	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-b57e-33963afb81f1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-dbc4-1ca309a780f1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-fa09-77a1cc5fe2df	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-0ed9-4206cdba5982	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-a84d-49c7b65b0282	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-9395-e102dc3ccf3f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-8796-2cc9dddc6238	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-91fd-fe3693ae61cc	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-c126-7c8fda2e922e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-8fa7-280ba8153f59	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-cd87-7162fc7a1dc3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-2c33-76525c55dc3e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-38d6-cd505b27022d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-9289-13acdb80abe2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-8cb3-500d068fd5dd	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-ecb5-9766bd8143e0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-82c6-25305f96c03d	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-64c1-fb8659b6ff85	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-f2e0-9f7da94d5e59	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-b668-6351c036ddfe	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-ebdc-d45bea13d036	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-61fd-b8b9f4030988	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-038d-b8f7dae4aab0	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-df9d-e2a059f61ede	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-379e-75246ffa88cc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-d409-4e35d4558c0e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-faa3-e4e2a4f93aa2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-6c6f-e7fcc1c13167	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-cc28-6156b707239e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-7aeb-c7683d2d0f06	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-13e3-80dd31474f9f	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-8302-93aff388ac6a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-ad86-904af1cc4e7d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-2232-a5ff5937d0a7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-6abd-752361c16673	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-2b49-a5a73d1c0cbc	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-e80e-1f823b9a5790	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-498d-2246a16f4beb	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-195a-39a212e5de4c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-2d0b-fcb269c38500	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-07e2-ee4d0c632ed6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-f39c-2ab69413b88d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-c6b4-a9cbd6aa90ab	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-4422-a008bacd74fa	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-7e80-831c1550b986	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-caf6-7a6d84e2cec4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-57ba-775144a94bd7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-f27f-79400f35ccf1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-5aa5-0b71c5a4dda3	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-116b-9cea0f9fdce0	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-bfa5-976b8d0948f7	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-56b1-53884dd96f32	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-e6f1-f37f313505e4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-ab8f-72775d1512dc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-abce-c1c1801d3612	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-04b1-2473f7bbc2f7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-9043-e8f94c45207e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-1826-3dbbf286157b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-f41a-eed394b7a7a2	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-5c44-bd185d942b43	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-c955-c7c07a150740	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-24f7-5950a27b49f9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-e2db-62dc41ac8c06	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-2262-d8c43890a273	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-ce91-43c3160f1288	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-46a3-7e5e509dcbf1	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-cbc5-4bfd4f198800	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-bc6c-ff58473066f3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-73d1-34b2edd283db	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-970e-2c6beedca5d3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-b88a-5d496ee2e73e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-c315-d07815009e34	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-929f-a1d71160b9ba	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-d69a-e8c80b542b90	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-b051-fb7f5be811a7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-f600-e08bb0595a9c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-a196-68853b512f9a	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-bad5-73da25101041	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-1462-4643533f2247	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-6e20-da01211fbea5	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-4a0b-143046c895ae	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-c54d-811d8f3fd02a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-f4b5-fd20566ea20b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-fae5-54c30d9e2c7f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-fd90-472f0cce37aa	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-c7b4-6fc918294028	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-05a5-3d246c8e407c	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-0073-370df2625ba5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-9913-e6bc7c37be26	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-a7c8-2658a96056d4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-d704-483e1ba21004	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-5fa4-51c1b2f58b25	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-7188-66ab0fb649b3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-3a75-d500fed18146	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-4345-62a359683a17	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-604d-fce191944244	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-7177-beaaf95be80a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-aa5c-9b5f22b8f2f9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-9c94-d752449a8eee	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-bc9e-3324ae7a361b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-32a9-c6d51bf532b3	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-65a3-ac6bd620474e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-c6dd-c27f819ea89f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-2f9e-545acf90310a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-8130-04d2302e70c6	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-ddcf-831fefb7f6fe	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-13e6-ebfccefbb516	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-6048-02bd520bd3da	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-9a4c-f31fc8020b71	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-d799-98d8bd17877a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-9acb-c4eba857e372	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-ba30-694c75e26b0b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-9a22-c3e1209699e8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-2711-b516a0a03b53	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-9ae9-73718c806812	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-1823-3f35787c8a58	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-6226-8935a0316d57	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-9bf4-f5b54b8cb1ae	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-4701-987f7b804bc4	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-5c60-9bdeb1593220	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-0652-ccb70c949094	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-f805-d485abf1c2d8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-42e8-f9a6758e3712	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-4856-d3da80f5c626	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-3ca8-8bfae0b39c77	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-1db5-12da2855fd30	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-bfd9-bc3ab0ffed8c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-6817-777687516784	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-6172-d5afc7b2eda2	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-4fd1-7f8a4782f664	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-8b3d-67fb5a6f5587	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-ee88-05df15d01228	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-2677-1f6ee37862b4	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-151b-e87eaeab1569	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-fc99-5639ce0b19f5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-a072-8a8a124d5cbc	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-a801-4deb3514035b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-c490-6f17ee0884f1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-8482-c2191d39f8fc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-9fcf-5dc48b8482bb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-fdc0-db273cc656b6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-e218-7c1694d0772f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-cf20-0b47442b7d47	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-d961-49cb8fd69841	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-e35e-9128968e9ff8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-e8fd-c279a5d32472	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-834e-3e82d11230dc	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-b410-599ec7fa6d2f	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-e4bd-0a158080a327	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-7722-3e044444af94	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-914f-a6fb4ae621ad	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-cd6a-b3f272ff86fd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-d145-4006c59beb6c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-fa1e-fc998751f80c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-d9bf-2886156c4313	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-42dc-88094fa59423	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-49e9-cfadb098326e	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-ab1d-81e0d1e72386	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-b7ab-33a09d94508c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-3e28-d3873c1cd152	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-24aa-f3338d1064ab	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-d8b6-68f0bab90f64	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-37be-ba456f6c60f3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-c47e-a1396d708c5f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-ace7-6dc22e84abbd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-55d0-c0c845fd972a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-9d60-0f22e8848216	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-0801-b44ae1ebe4a7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-a9f6-a5c1d5fbc7f4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-f5f7-33e7a679ea77	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-47b1-eceb14c2917f	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-1688-43ec9c3eaeac	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-e18a-2de7cfc56261	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-e4dc-f79b66f2e233	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-cec8-94b51f59d2c0	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-a0ba-c04e3a7583d4	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-42bb-52e9330e6c2b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-4d5a-e09e3b12f039	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-f38b-b5ecb5914ff9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-3611-f49025d22939	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-f121-158386729b00	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-3bee-a1244af323b8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-1935-2525ab03d74a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-92fc-dc4b4a95b02b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-5095-cee8d259c75a	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-b438-77551a182405	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-580a-09e98e61c5c1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-242f-8d3faf87fedf	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-3f48-0bb867b215a1	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-1dc1-340104d99171	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-d698-4d2b54a4d10d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-50f5-3dfd1ea7a84d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-9505-e40642df1198	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-ed4a-dd1244c26d2c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-2579-d52de3f89886	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-2d55-8475b72c2fd0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-629a-56c5254d00f5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-af34-88fb6101170e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-7bec-7d8c033af075	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-0030-4d0c96cbf736	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-989c-e0566063e29d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-7e56-1a920adf7233	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-2336-ebd916d03b25	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-aa8a-9213fd4c7f0e	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-db02-890488748a5f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-1c91-6e1d2c960e3d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-56b7-466e8eef1315	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-6c1e-b2717c50d61f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-9190-0c9b3f269111	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-a2e9-32e51392d9db	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-93e4-3d826e81093c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-5cf5-ac245206a476	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-5822-a3d25cb29aab	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-70e7-8db7e2fdbfeb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-0ce6-73986d95afe8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-4ff3-3f4366ec4ddb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-958f-94414ee7c38c	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-9cb0-ef2600decd46	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-99be-6e6ce7aa2c2f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-61f7-3f899ad1b6e6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-8b6c-fc061f1b0063	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-1dc1-42a074f70b93	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-2275-71f75131b78c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-573f-7cb6edf72e05	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-077e-bba7d163c14a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-209e-dcd44b904fab	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-23c4-d7ba9e74908f	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-81b9-ffeb2af11f81	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-cb6f-df5b8fb20919	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-618b-f3f69d0a06b2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-ea8c-2936dd69bbec	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-276e-564063310010	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-7866-1684c3e2908c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-2704-0aa274e151f1	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-cb32-2274852cd730	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-703d-542308bc678d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-16ef-6d2118b001b4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-60ce-77d1f53aceb3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-fd70-f65c19bd456f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-e430-3c8a200e007e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-ac45-f177f3e05977	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-0c2a-274f5716e57e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-80c1-6edc215fdb32	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-9efa-e433de26bb06	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-ee67-a3bba4895821	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-0bf7-427b11713bdd	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-0cb5-541088373beb	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-1a52-4a287d71aa8c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-e19b-a959638eb8a1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-f55b-fee30a669d75	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-1800-534b964fa837	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-faf8-2921cab702e4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-373f-c03b7f204753	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-11ae-f0fd67949c5d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-c749-fb27a355e4e1	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-e366-276f22c52249	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-9a90-c2c05521e2be	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-770c-15a2bb1a321b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-a029-120f596b5847	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-e479-35565bdc1e4e	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-87d7-869e25f6dd12	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-f23d-d3b4ee68b112	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-8c87-a19ed01e3cce	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-c74d-7acd454d078a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-d127-8db02e443854	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-1c98-6da8f8e47316	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-72af-62d95f1080b4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-8adf-2057fe6e442a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-8b36-4282c5236e45	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-e58f-fe35368c06af	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-6e5a-d1b0380bb9b6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-1439-f67d8cb5332e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-3a0b-8144704e504d	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-2de4-c12df6f4f60e	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-6d76-21d1457b382b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-db57-78334c310ac0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-e4df-d0767e951f49	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-531c-aa8b1a1571d3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-9a35-6b30ba2a2ad2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-3301-94967e7bbf72	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-6965-01f9193ee83e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-b773-5b20ec3c3b9c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-561d-bc33124b0b13	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-d5fd-9c5fef0f89fe	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-8f0d-a3198cda8d13	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-81d5-089ca3524448	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-ec1d-601ac2b39bee	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-a034-20e4e3af4255	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-190d-3bf1c5cac1ea	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-3066-bbbfd50e1664	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-bc72-da80a56a8201	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-c8d4-c0fa11d2ebe9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-ab3b-879f47310169	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-5a90-214221577c2e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-e634-44be2bb9866b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-4743-8d1a6a74f90a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-d469-21639f786a28	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-7ab4-9022b0458596	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-30b6-ff4fd8995462	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-eeb2-1c2bbebf0886	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-bedf-4c571af1cbce	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-3608-bca32ddd18ca	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-7df6-349d09a9982e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-4134-f1cc89abc061	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-c2e2-0ca8c3c9fc4e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-3cc6-da8f3cbe81b2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-f6fd-8b475d158c6a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-29f9-6b0a22b22bc8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-81d8-b3e8d5c0c255	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-d338-8dd543695d75	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-4c3a-58036f3a56a4	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-0404-3eb7fcdb9811	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-934a-6478b1322c20	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-9f56-488ddacb9f3d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-f4c0-a3a97084b9d1	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-3edf-4a21b7aa3580	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-7e98-2ba56a21e9f4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-3674-529f4e25236f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-cc3f-73f550a4559a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-01cd-a86321b09a68	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-e7be-0b28093e4a3c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-44f5-7df104b4c07f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-44e0-29eef01cebc1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-8d47-df3014919074	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-a01c-c2a55a7bc4f6	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-3e1a-fc768824d5ba	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-646c-b822c4df1c14	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-feb6-de8f57be5383	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-f205-992c771dd5e2	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-f42d-fb63f0f2b9d0	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-87ce-94e33c63e81b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-8bc1-f77f2fe36f29	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-1310-cd80f2e0a349	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-6b6a-ae3e41bbdbb3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-eadf-323ea3f1e7f3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-c331-07a2bff0806b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-06e8-21acdb8fb481	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-87a1-ab8e22a397e6	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-3d6f-3fa460ef35be	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-fed0-71a714ee772f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-2bcf-d491b428947e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-617b-ace4580bb4e1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-1318-540ef8d951b2	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-3246-ae14b2a5bf57	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-bab9-bd4c22dbadc9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-3135-27d8f740927d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-af29-b8c139c082eb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-2598-075b7b40bc4d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-7234-c237efa02452	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-eae7-3836de13bad3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-33cd-0de757b8d76d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-b6c3-0df5fb7cafff	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-ce57-3d67d0067ad9	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-4cd6-f08394f0ce35	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-8247-af918ceea710	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-c7c5-085030b704cd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-4ea2-3f6534215209	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-809a-21588f285303	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-92ae-a274ca84da95	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-de47-fe7f7f9313fc	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-a8fb-8277ab9d439b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-52c6-8158812bc34c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-b973-38e1c079bee4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-f7f0-69ca2af00637	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-1110-0930263ae2ca	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-a444-fc78ef3365b1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-ba68-2f9930e6adb9	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-57c1-dbb083c38adf	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-bb24-513ae978771a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-eba0-ee7da3b9d6f7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-9543-858828fabb82	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-5d35-044c1a99334f	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-0281-0cc7b4c6994d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-23d5-c0dc4c7b94aa	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-d5fa-91231af70331	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-5705-7384e19b1881	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-13be-2ee73dd1120f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-49d2-f976150adf34	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-b2b2-fc1dfd262e15	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-5985-c8d2137e944d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-075c-48c20122e5a2	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-09b7-0cebd3b2440d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-7255-10ca004fcbb3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-9dbf-bc197583fb3d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-819d-0b64d6da3efe	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-ba92-e1b21306f15c	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-c684-48367ff5a86e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-bd15-affffd281d5e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-b56a-09d82a803696	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-3ace-64f68b8e1255	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-8a5a-900f48de7ec1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-7d4d-2d9498b189d8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-a86f-44c39a3fd612	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-14eb-6af53d317911	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-bcfd-b86893453fc6	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-1603-f61ced56d74b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-b85e-c33a7038403d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-f906-b1c649c43f7f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-1bec-70adbb6fd632	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-4fd0-676e80aa0835	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-102f-bff9b0a9373b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-e791-59479fc23d72	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-e161-7e74734db305	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-588f-dd3453daa722	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-f93b-d8b04fc2cc40	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-71cd-56bb7c14a93d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-3a05-e13a501a1d0d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-3379-9059008a5838	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-ab86-1d4f0aa6bc34	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-edcd-dedc39b83e16	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-1262-78ea29cf3672	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-413f-47abe9d9a37d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-440d-739455f50203	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-61eb-05b9532797a8	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-ff17-4cf374171616	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-572e-276cae92d8a9	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-4a15-56af35d7c8d9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-8046-6b87caf303c8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-81e1-43c269901dc7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-910e-56fd2ec9afbe	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-2107-12714a37c07d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-3a53-e6f83b84af53	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-bf0b-40e7fd3d5f43	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-753f-7c8897e35058	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-ea85-66abe41f6a28	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-0514-d71b2875ed51	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-b174-ee14c74d4109	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-0df6-f1442d8d9745	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-d491-157b6abf4a39	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-80ec-6ace426d601d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-550c-bc7f10b2df87	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-7f11-7841064e8fc1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-82ce-95f5980a9172	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-114c-e6785a075835	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-0036-8b04f519f323	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-2fe4-aa8a17ba54d3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-6d1a-2012ba200d19	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-c067-2c3e8ad2cae5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-5b87-5625196d36df	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-8907-844217d0637a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-698f-7d866ad2efd0	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-8fe6-165afd9e7f15	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-30bc-78d8d61bf530	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-68e6-828e1a068b77	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-0f1e-fa06480b646e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-cc99-b35ae91457b8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-820b-656affb56121	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-719e-972615753278	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-f4e5-15bf853d3a0b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-e5ff-238cbd51636d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-d0df-5b2fc185033b	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-250a-860a7a359514	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-3886-b538fcaf18c2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-bffa-a75d5ba26ca5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-144b-8e502968f097	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-ae4a-f325d167dc50	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-762e-2233db8ea951	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-a3fc-577fce3feb9c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-290b-d7c7f2e68596	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-b16f-681d2746d6f2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-6f8f-9b6f07a4bd14	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-4a8f-0a787b2db1a1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-4171-83847e86486b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-5cc6-2583b182533c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-ca28-3b05ad49f31b	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-dbfa-d6d8e97d92af	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-5bbc-81ef44840d5b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-8b8e-950de6c64e10	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-1285-8a538e8ebd39	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-67dc-99c4cc1e9328	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-299f-5049948e4900	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-a1a6-7e165cce212b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-fbaf-a9c19823e849	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-9ce6-9772b41a7814	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-feac-0205e7ab744a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-253c-c4e5fd260bfe	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-748f-2abf08e01f80	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-17ca-2a4dd901dc59	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-7ebc-964e89fa6559	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-625f-e749dc5c4095	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-2665-36a9b8219fc4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-4696-72b581325b5f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-0dd0-1ee37235b891	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-f699-dcfe729656de	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-db58-e34fc9467c45	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-6050-98ae7b111989	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-efd9-3c02f93905d3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-d3ff-78dfef662465	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-b1f5-c10644ea892a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-d503-cb16d181ff90	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-6ce9-62efdd4af218	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-4c4f-365052c420c1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-237a-493405eb8885	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-6379-08e57650244f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-055a-970972e8a233	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-5235-9a6d2251426b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-4660-14ec796d555e	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-352a-ca8ad19ebf20	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-c452-997f955a0259	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-45b4-b3806c89ae93	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-02f2-e88cd9f4b3da	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-0394-c107cb9f9a17	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-e475-2cea5095c685	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-d679-530f43488c8b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-0a38-a5f01d73ac57	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-f0c1-b92b9af81bd4	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-8552-511583fa1622	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-76de-9b8d9843aa0f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-8de2-c4779b6ac472	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-0175-d72f377ba42b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-5c6c-c42fda085b1c	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-ff04-e9614da13acb	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-b366-04e6d5dcec9c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-4d5c-8fac88843d68	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-3b54-d0cdaa5d515b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-4200-7ee37188a3ef	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-c448-350ca158e0b5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-ec3d-7af87a37c128	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-8808-08ebcb29e97b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-74df-b9171942498f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-7dfc-91f364c435c2	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-4243-f6e25799cfdf	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-ddb8-9505c210635b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-33a6-684cee175448	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-b828-f59f852a5cfc	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-b13c-f5e07bfa3343	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-fa52-1513ae10abfd	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-af05-77658146ef5f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-0c41-765f056da69c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-0647-a6bb86c66d4b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-f20c-4a462739ab73	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-84c2-46926f30790f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-28b0-451866adfe63	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-0f59-6ef47fe81446	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-ee98-98fa6ff4d70f	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-e347-6f0e9fca1539	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-01a1-5b262189b31a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-5d37-ffa4f58482ad	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-1a02-a866e33b8894	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-d5d1-29f8a0faecdb	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-1830-48b5f2dc9a27	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-1214-b7e39b554857	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-e34a-4e845c0dc456	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-f738-d0df02f6328d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-029e-d0f4837f15d9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-deea-f459c7c2c04b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-6f46-cfcbbd4b2734	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-6671-a2f7e6f08b3e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-3d46-4c5c04ebc899	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-3f7e-517dd8467e72	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-f3be-e9965312e9e6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-3197-c5fd76427ca5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-58bb-efc471b9f155	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-0f2c-0d1c1c81ed32	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-5013-3ab705569adc	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-6975-e9c14f50a1fc	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-578c-10bd30b3a4c9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-b5d9-ac42bbd8dbe4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-773c-7d090f1e3b48	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-657a-fedf05fc2435	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-d4dd-46576065943e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-8d8f-2418e0682030	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-55f8-fcdaa246e45e	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-1f3c-f08588d8d0dc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-4615-14916890fb20	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-fb6b-e5f16a64ad95	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-2a73-2b55d07c6002	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-e26c-6b50d047599e	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-16f7-7585d4e64fdc	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-fa09-f4faf59eb452	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-161b-2c7871ef8c14	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-3958-f2ed1d44b54d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-caa6-0695a6d2ba13	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-f1f1-4c338f0ea446	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-a8de-4c87917b7c29	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-2275-6c96c4b9ad39	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-d363-9c7399259538	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-0190-a444d8d04ef8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-471a-c822840053e5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-5ec3-722e89b8e681	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-7ff4-a27b14e64f05	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-f880-8749aaecd4cd	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-1467-c3d6196a3e5b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-d814-bbaf9ead7541	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-15bd-2a036ec06108	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-7d5c-4b09e4c87708	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-71de-7764adedafdd	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-be28-9dff799e840d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-65b7-4c7a41d81b83	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-85d5-b7156b717e6a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-28f5-8edae5f1d1bc	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-a60e-9c62c37b2b3c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-2915-3d120efd8874	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-fdc3-e952bafeba01	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-2459-6da30aef2f46	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-10a2-7c7420465204	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-f5d5-38bb9f213957	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-b4ce-82771a0a63f0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-1650-58cc47ee9e38	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-e615-413dfc1a42a4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-787c-c94a90e49fcc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-0597-13e375c37e7c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-7b08-1b24e168a8fb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-c767-21568853046d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-d311-1cafd5583bb5	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-8cc0-74168bf8d102	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-e119-9f051d8ff8ae	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-a72c-11f8bc0bb7f2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-e9bd-82276d9610da	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-63a2-62c81692c35b	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-05d3-273c205f23f9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-dd10-80deda5db4ed	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-63bb-3156908a7dcf	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-05e0-fe941af4bd39	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-bbfd-97ded80c2c05	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-2448-62cb292b923b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-2a2b-c1132c9a79f5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-e9ec-81973d070b83	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-d48e-fa1ac03ee3e2	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-903c-8bc6cb4736a4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-9fc7-2a5572707b89	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-5a08-411e1b61c07c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-82ed-2f49b4b86796	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-9d76-391eb2f5fb00	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-b6e1-5c6a657d18c2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-1ac5-6968741cb691	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-18d3-edce68a0184c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-50a9-840ca8a6e8c7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-1e80-8b1086bedb02	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe13-bd7b-50f838ff0f29	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe13-b25e-3498991c2fe5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe13-29ab-28dbea5c5b0d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe13-657e-6165f88576b7	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe13-36d8-9194fedf2f9b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe13-4bc0-f55e07202938	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe13-719d-0c94e69c66e4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe13-bb25-1aafbb4d968c	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe13-1484-d0aaf4c0bf55	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe13-3eba-b2eac5e6be93	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe13-eb74-58dfa2d83378	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe13-825e-e265e4ad27d6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe13-673d-fd00577c6886	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe13-87b8-8893a9da3046	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe14-a0f1-2360eddfea0e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe14-6124-80d7b4b6a301	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe14-a74c-d334e4bff4c0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe14-0257-94491cb343c0	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe14-68d6-d284d1e3f390	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe14-9785-dc0765eee6ab	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe14-6eb1-50b137fb75ed	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe14-24fc-640437173fd0	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe14-13ab-5f6bb64f6d41	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe14-0025-81cab877ad48	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe14-63d3-c2f8cc562207	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe14-b916-c31281e0bb41	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe14-df2c-1f6f159a0740	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe14-cd35-3ad6cc74000a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe14-be11-63c937ec6120	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe14-140e-fd022100065d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe14-3794-321b108ea251	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe14-9768-e85456437958	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe14-f8cd-8fc3e8f406ad	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe14-0d1e-bfbdcb2b18c2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe14-1fbb-aea6d9ec0276	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe14-6d0e-214939a1c62b	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe14-25c2-93d744410661	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe14-1ccb-f9f7571da226	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe14-0c5f-040961dbdd0d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe14-a0a0-28d2aadff560	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe14-9186-dec6a3affa54	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe14-fca2-e6a7eee3a100	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe14-c7ff-afab122e44d6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe14-1843-fc074be6a5a5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe14-0baa-8391c5eb9441	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe14-e24f-a9b930eaf5a4	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe14-0883-615425f703cc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe14-bc24-5b73061c8d82	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe14-0752-f9995edbced7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe14-6212-4ab60fe86b4c	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe14-a61c-e12a5d25334b	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe14-f745-60fd66f520b7	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe14-e638-726f7e408cd8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe14-241a-cf8781532553	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe14-ea6a-be385a4d3e95	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe14-9e20-4852fdc680c7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe14-6960-c8912d0cc7d0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe14-757f-a1a055fb8da0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe14-f48b-3e55eb738afd	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe14-c580-3be76f2a11d2	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe14-31d1-a067b4d15920	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe14-2e13-d366979974a4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe14-2ab6-522176f0f88f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe14-2c5f-671a23dacd17	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe14-ea33-d42e63b68c28	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe14-1066-c0d7ed4f65ff	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe14-4648-3bce73acb803	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe14-439e-7ec9e57db18e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe14-3518-dc0cebc5179c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe14-f8dd-6b8163de6341	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe14-f397-7c1a0726d8f4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe14-0d75-54d00ab3d77a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe14-e489-b8b4943ad7e0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe14-2453-56ec2a5ccd70	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe14-aa9f-7985a198cef2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe14-bcc6-1ca970e894ed	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe14-f381-ffac555ab8ee	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe14-f50c-807307530455	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe14-64f0-28815bfcc35d	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe14-8c1f-ec60073df496	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe14-a26f-91b0f436b5d8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe14-0cb7-33cbd8139eb8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe14-8551-e19e375da5aa	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe14-e559-20512d91daa4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe14-3cda-4de1aaa2fc9b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe14-9017-7b7db37d9487	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe14-5624-bfe41df161b9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe14-0df1-60efc90bfc03	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe14-c39b-54d403eac9b9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe14-f840-af7d860d477c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe14-ad39-2cb5554131f3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe14-0da9-7af40f63eecf	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe14-af12-234211881c8b	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe14-035e-38b325421e51	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe14-f1c1-22ef617a6c56	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe14-2614-92b756568b6a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe14-a1a2-6a114142cd29	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe14-582f-c59bad38e1b9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe14-5550-a952720b1c03	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe14-1026-f0f4dcbb1f64	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe14-53fd-dda6e6b2465b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe14-767f-ecf0b0dc7098	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe14-ecfd-f3c45b613d19	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe14-18e7-def013a6a78e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe14-2fb1-93f65161bc57	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe14-48fa-571b938b0c9d	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe14-3515-f53c09811bf1	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe14-e52c-352297ce9a14	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe14-908c-6e759c40a839	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe14-2c07-15fd5570f6cb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe14-fb17-2b42b4682904	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe14-4873-569af168d35b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe14-64b1-e6c5c396f863	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe14-f0bf-2f637676a5cb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe14-095e-37bf66bb4a20	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe14-c622-eec75a0697b9	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe14-20c0-0197759535e8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe14-d87c-a915028ecf9f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe14-ed92-fdb4736e4d1a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe14-9791-ae529450a37f	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe14-6cee-abda32fcfe62	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe14-7f6b-3a81c749820b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe14-0af5-48856a87bce4	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe14-d731-dfeffffdae39	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe14-f4e0-65e11649ad8e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe14-fe71-86e83386baca	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe14-0f6e-85d7dcc8e4d9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe14-bb5d-2a88b65d82f7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe14-0238-78e0ef3e487a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe14-bc5d-c33d01d6ede5	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe14-d698-faa68e5fe9b0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe14-8322-6bed90f496fd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe14-df62-1a1f2b1d60f5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe14-25cc-b2ab867c5c20	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe14-2365-01e1250c54f0	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe14-42c7-eb3f1b88c899	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe14-ee5a-499ab9def787	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe14-4847-942b736897c6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe14-e48a-cdfff1b055ac	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe14-c70f-1a15ba3d627a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe14-4846-af6e1a4ccc78	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe14-8dc4-2d717d21509b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe14-5b4b-caf0be8225f9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe14-3db7-24482c019b6c	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe14-fbea-8c7e22ac4b1a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe14-71d3-83ede9e3c328	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe14-0828-43ad100c55f2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe14-92a0-1ab44b5ece69	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe14-fb1a-298dfd29e5ae	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe14-1be5-d50bcf779b4e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe14-f7f9-228d83d48913	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe14-007f-b6b429ccced7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe14-5253-f4f3737289be	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe14-aef8-3f9cd43c5912	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe14-e9d8-c7992c10498a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe14-5b43-60fd394c3dc6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe14-0a00-576a66631bcb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe14-4ebf-af2c81aa5716	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe14-c635-cef1ac4ac439	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe14-d9f5-f5cd3944c68e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe14-37fb-302f10c556c7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe14-1250-c7495e778e20	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe14-eff8-3e99f04ad07b	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe14-8600-5daefb2856f8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe14-60f6-57ecb97b8f83	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe14-8bfb-68f2d52c82cd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe14-d703-e60fa8cd14ad	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe14-859d-0d5afcb41004	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe14-7400-5a71da5ed197	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe14-4ef8-3d99c802aee9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe14-91a7-2e74cab27fba	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe14-a79a-be05f2c5470b	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe14-ce11-861cb4d0befa	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe14-5374-da948639a0dd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe14-4533-c667ac4ea0c2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe14-8a40-f22770f0fefc	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe14-5a5e-474dbf99f678	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe14-3a54-68a106679f3d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe14-c003-db6e47a6d881	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe14-2931-e5fce1d47051	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe14-36a7-b3a4e0f21f46	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe14-0139-e40e66b6ce71	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe14-39b6-62840f10ca1e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe14-0807-f437884bb2a6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe14-6fb4-f4e075157f35	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe14-c8d6-2fc271e0d343	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe14-3115-1208e473e035	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe14-1ade-3b42dc42564d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe14-dc66-14ceaece065d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe14-f6e9-132259ef5969	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe14-f90b-77e7964bf84a	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe14-e298-b53bb3b3bbaf	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe14-c5f9-8fb710c2f091	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe14-bde7-9ee1d6704b9a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe14-bee5-14c17b2169d7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe14-7fbb-54bf03725fc5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe14-5ae8-4964ee345e60	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe14-92d3-cde64327ee93	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe14-0a9d-3d241190a315	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe14-fb3a-f9e4d5b326a2	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe14-9196-7bef418ebf58	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe14-2151-29bcc99dbe58	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe14-4583-9b9b360a1507	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe14-1094-94ac3c732cc6	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe14-77ed-b1b5c0376224	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe14-001a-f687d900d338	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe14-c619-f45ab5289c80	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe14-191e-578f2f02b989	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe14-7ebb-f884836a075b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe14-2723-3c9fdce7eac9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe14-6d15-03a3b8ac728b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe14-487a-9f5f7f235f62	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe14-e2e7-a1680f63b92b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe14-e513-25051be460f3	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe14-4b33-de1527682af2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe14-0cbb-ea7e11a2ad4d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe14-6b35-ff1b6c5ea424	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe14-288b-75ea44d4c784	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe14-c7cf-fc39aa35d19f	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe14-1155-705e767e5b53	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe14-44a1-0c5614aec4bd	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe14-f173-cc31b4afcd26	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe14-4ddc-ad43c7d72795	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe14-50a2-472299bcc541	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe14-f46d-8752b7fc7055	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe14-5a17-fa646eb27443	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe14-3132-bf56607cac01	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe14-386e-eef94065cc15	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe14-b1fb-1f46faebe5db	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe14-bc92-81e4241f9628	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe14-53ab-3897949fbd95	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe14-5817-1620abc9295c	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe14-d9d9-225d0f9d5fe2	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe14-941c-2e1fdad3b22b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe14-86c8-fc7cc7d762c3	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe14-037d-bfe7eed5ad20	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe14-98e1-4087a1f65229	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe14-3bd2-4a36a3181352	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe14-2004-9d7c5d1bd6c1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe14-9f6c-e6ab89f3a7c2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe14-26e3-b431cf23776e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe14-625b-666a5e98adf9	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe14-6add-5ac25db64419	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe14-3729-8d4a58a531c6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe14-703b-71947cd49913	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe14-e022-764867ba15b7	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe14-3990-9d2e1462364d	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe14-b2cb-410e00f6ccc7	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe14-17fa-bb7e161efb02	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe14-8c05-8a40e96f9c66	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe14-45e7-85c303393032	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe14-ed5b-97cf2fa1b77d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe14-58f8-b613c8f07658	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe14-20f8-4aef8952232d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe14-5752-14587252c380	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe14-8eb8-1dff787ded56	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe14-7a44-272e6ecdd0cc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe14-198f-3680781c8277	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe14-e18d-aa062f29a2ae	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe14-2ee9-5b78f657a88d	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe14-a287-dd24dbbbae7b	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe14-4047-8f880744a244	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe14-87f0-3dea23433534	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe14-bd33-cbe20108940c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe14-b667-94cccf8974fb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe14-85f5-c8eac4b7d504	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe14-8b84-223fc5a88d46	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe14-bc75-5dada1fea2b3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe14-b2d6-d3a8604e82a4	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe14-86cd-40ac5b9d1289	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe14-0e09-111963b51eef	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe14-a1e4-1d820bafd8cc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe14-e7ea-97e38f22191f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe14-63a3-c0c170cec890	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe14-8c7d-7f892387941c	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe14-cc76-f152629675fc	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe14-3d6a-ee30f2f98f33	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe14-9171-b7e3f71a48cb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe14-fbcd-9f21eb287299	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe14-4831-b5308ccfdaf2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe14-a843-3900d5982724	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe14-eb9d-bcbb9ac138d9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe14-aa0b-e574dc4cc7aa	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe14-f11e-84f04c745e36	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe14-db2a-8032ae9c2a8f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe14-e86c-e11b0e5223c3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe14-2470-29144ee48ff7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe14-6118-97884aef4f85	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe14-60d1-b004fc9a314f	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe14-b0df-894a2132578c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe14-a7b2-81e6fd8eb537	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe14-07dc-8d5149cbb6e5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe14-1957-a1d2a2e7c6ee	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe14-c916-a702ad94a85e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe14-007b-b164258614b2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe14-173e-e1598c96567b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe14-fefa-eceb35ee7193	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe14-4339-871fc828bc68	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe14-3d12-7973a8876d44	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe14-efa4-e7beb588bf18	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe14-1ed4-75342e90f307	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe14-1434-26b81d4e2ddf	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe14-141b-b16ee3c8d0fa	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe14-f483-7f72caac5708	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe14-0f1b-c6740a8aa6a0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe14-3fdf-83e1e23cd863	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe14-7f8d-b9babc5d0a62	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe14-d93d-872868056aa5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe14-e2e7-7c6fca9e76a4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe14-2646-879b40969d86	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe14-76f9-348153f2d5dc	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe14-1896-9d972a433980	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe14-d2c0-7c0acb21a18a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe14-6de6-8fa930a89789	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe14-8dcd-a48d8a1af31c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe14-d801-282aebee8f18	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe14-5845-f92717f17bc2	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe14-87a4-4db530132ee5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe14-cc9e-f84d21cc6eb7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe14-952b-bde16802c258	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe14-c239-e481d6f8590c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe14-2aed-fff5c4fb5c26	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe14-f92c-99955c1ded65	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe14-6267-b7a90410786f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe14-5e25-dd43b72dc0a1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5538-fe14-4bbd-61841961e690	User-read	Aaa - Uporabnik - Beri	f
00020000-5538-fe14-b385-42ec3441a8d3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5538-fe14-2fd5-31e2dd234b57	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5538-fe14-91d3-0f0fec9e8810	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5538-fe14-dad1-cb649751d2ae	Role-delete	Aaa - Vloga - Briši	f
00020000-5538-fe14-faf4-329e915c2f53	Role-read	Aaa - Vloga - Beri	f
00020000-5538-fe14-bc5f-011d1f0585a6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5538-fe14-b73a-1af686e8eaf7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5538-fe14-9ad4-2351ded3d02d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5538-fe14-9d44-fe3286de9262	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5538-fe14-bccd-bffc698532fb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5538-fe14-e823-f1e9f1d047e9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5538-fe14-d6a8-13bec8b8ae81	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5538-fe14-ff0c-07b4854ac44f	Drzava-read	Seznam držav	f
00020000-5538-fe14-60ea-c36c1ed6c7bb	Drzava-write	Urejanje držav	f
00020000-5538-fe14-d549-c6cd41985ea4	Popa-delete	Poslovni partner - Briši	f
00020000-5538-fe14-c135-5606efb2d858	Popa-list	Poslovni partner - Beri	f
00020000-5538-fe14-96d4-3c797b3015f0	Popa-update	Poslovni partner - Posodobi	f
00020000-5538-fe14-3a6f-63714759b121	Popa-create	Poslovni partner - Ustvari	f
00020000-5538-fe14-2288-0bf9ad10b3df	Posta-delete	Pošta - Briši	f
00020000-5538-fe14-d570-e5cfba788b7e	Posta-list	Pošta - Beri	f
00020000-5538-fe14-70a0-013c9725ef89	Posta-update	Pošta - Posodobi	f
00020000-5538-fe14-23d1-d0cd8594950d	Posta-create	Pošta - Ustvari	f
00020000-5538-fe14-f319-e5afcdad246c	PostniNaslov-delete	Poštni naslov - Briši	f
00020000-5538-fe14-19f0-e2c3a3937912	PostniNaslov-list	Poštni naslov - Beri	f
00020000-5538-fe14-ecfb-af149ca84b21	PostniNaslov-update	Poštni naslov - Posodobi	f
00020000-5538-fe14-8365-c7a2fe72d9b4	PostniNaslov-create	Poštni naslov - Ustvari	f
\.


--
-- TOC entry 2635 (class 0 OID 1128972)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00000000-5538-fe14-01f0-12a71dc647d6	00020000-5538-fe14-ff0c-07b4854ac44f
00000000-5538-fe14-01f0-12a71dc647d6	00020000-5538-fe13-e517-a2ac0e30e4f6
00000000-5538-fe14-8d17-d7d1867cbcf4	00020000-5538-fe14-60ea-c36c1ed6c7bb
00000000-5538-fe14-8d17-d7d1867cbcf4	00020000-5538-fe14-ff0c-07b4854ac44f
\.


--
-- TOC entry 2663 (class 0 OID 1129261)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 1129291)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 1129403)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 1129031)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 1129073)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5538-fe12-411d-71494b4836d4	8341	Adlešiči
00050000-5538-fe12-4da8-39d9f2ed6414	5270	Ajdovščina
00050000-5538-fe12-d6ec-f635e8454554	6280	Ankaran/Ancarano
00050000-5538-fe12-b860-8d03d3e6b31e	9253	Apače
00050000-5538-fe12-3ecd-0a5ba4208db7	8253	Artiče
00050000-5538-fe12-bf52-b0a6d99285b4	4275	Begunje na Gorenjskem
00050000-5538-fe12-5e38-56e31279e132	1382	Begunje pri Cerknici
00050000-5538-fe12-661b-8b9dceb16d69	9231	Beltinci
00050000-5538-fe12-9c19-2b69976c56f3	2234	Benedikt
00050000-5538-fe12-63bd-e11d2767698a	2345	Bistrica ob Dravi
00050000-5538-fe12-e227-243a6d1e3d17	3256	Bistrica ob Sotli
00050000-5538-fe12-012d-9c66f643d313	8259	Bizeljsko
00050000-5538-fe12-eac2-913129b8fd5a	1223	Blagovica
00050000-5538-fe12-c9a6-172075e959a0	8283	Blanca
00050000-5538-fe12-776f-e39144f2ee01	4260	Bled
00050000-5538-fe12-f944-ce84bd879e32	4273	Blejska Dobrava
00050000-5538-fe12-0176-0374af8f534f	9265	Bodonci
00050000-5538-fe12-71f4-96ff6f5d9ae2	9222	Bogojina
00050000-5538-fe12-b861-da533b08d52f	4263	Bohinjska Bela
00050000-5538-fe12-23e9-265cf3f9a7d3	4264	Bohinjska Bistrica
00050000-5538-fe12-2020-97849653ba50	4265	Bohinjsko jezero
00050000-5538-fe12-cea6-cc4a94455757	1353	Borovnica
00050000-5538-fe12-1e31-b425b860cfda	8294	Boštanj
00050000-5538-fe12-6724-dc780419faa7	5230	Bovec
00050000-5538-fe12-ba94-83614be65a3e	5295	Branik
00050000-5538-fe12-149e-8910a5b116e9	3314	Braslovče
00050000-5538-fe12-56de-36d888765927	5223	Breginj
00050000-5538-fe12-9e71-9b64e6157336	8280	Brestanica
00050000-5538-fe12-38b8-7909451ef0dd	2354	Bresternica
00050000-5538-fe12-f08c-50860718aa24	4243	Brezje
00050000-5538-fe12-54b9-a016bdc1c66c	1351	Brezovica pri Ljubljani
00050000-5538-fe12-b951-3f97ebcd170a	8250	Brežice
00050000-5538-fe12-ccf3-8c2c7a1bd062	4210	Brnik - Aerodrom
00050000-5538-fe12-cc3a-f700af4bb44e	8321	Brusnice
00050000-5538-fe12-b809-5b47125fa27e	3255	Buče
00050000-5538-fe12-e200-e77282f88f63	8276	Bučka 
00050000-5538-fe12-4086-da69eb1d22f3	9261	Cankova
00050000-5538-fe12-778e-9d6ba42186e4	3000	Celje 
00050000-5538-fe12-6ce0-8dd389139d9c	3001	Celje - poštni predali
00050000-5538-fe12-32ea-5d8be597f88b	4207	Cerklje na Gorenjskem
00050000-5538-fe12-f398-0566019f0995	8263	Cerklje ob Krki
00050000-5538-fe12-bd60-9a7a6ba50104	1380	Cerknica
00050000-5538-fe12-ad56-c9f53a4a0ae7	5282	Cerkno
00050000-5538-fe12-40a1-d892e696c73d	2236	Cerkvenjak
00050000-5538-fe12-c269-47d6ef6014b8	2215	Ceršak
00050000-5538-fe12-8301-733264b8fd8f	2326	Cirkovce
00050000-5538-fe12-2205-7d1732c47129	2282	Cirkulane
00050000-5538-fe12-626d-c49dc8358900	5273	Col
00050000-5538-fe12-5e05-f022da2956c0	8251	Čatež ob Savi
00050000-5538-fe12-f155-155ba4ea8e00	1413	Čemšenik
00050000-5538-fe12-9c08-ecb5a8cd1d46	5253	Čepovan
00050000-5538-fe12-f8df-ef7dbe418bf3	9232	Črenšovci
00050000-5538-fe12-a5ef-686b61ef2d58	2393	Črna na Koroškem
00050000-5538-fe12-838b-1a9f702c5a38	6275	Črni Kal
00050000-5538-fe12-8f46-c320f08f4fe7	5274	Črni Vrh nad Idrijo
00050000-5538-fe12-df62-447e40594c80	5262	Črniče
00050000-5538-fe12-0ea4-e0ae9b55d0f8	8340	Črnomelj
00050000-5538-fe12-52ee-f7ca4af2ba67	6271	Dekani
00050000-5538-fe12-35fd-9e59dee1a087	5210	Deskle
00050000-5538-fe12-1476-fbd8c5e59bad	2253	Destrnik
00050000-5538-fe12-5bc6-b8d3b724e62d	6215	Divača
00050000-5538-fe12-a86c-546e94b7fa6c	1233	Dob
00050000-5538-fe12-538a-19453e29747d	3224	Dobje pri Planini
00050000-5538-fe12-6533-0482da1fb9ce	8257	Dobova
00050000-5538-fe12-c03a-470e489314cc	1423	Dobovec
00050000-5538-fe12-1e0f-f435ab8b3b79	5263	Dobravlje
00050000-5538-fe12-8857-402ba531cdf2	3204	Dobrna
00050000-5538-fe12-da71-d0fb93222fc3	8211	Dobrnič
00050000-5538-fe12-423b-9b9ce2a7a7d1	1356	Dobrova
00050000-5538-fe12-e2ca-2c6be49ac1e7	9223	Dobrovnik/Dobronak 
00050000-5538-fe12-55fd-4929b51a358b	5212	Dobrovo v Brdih
00050000-5538-fe12-1b15-71d52a76dbd5	1431	Dol pri Hrastniku
00050000-5538-fe12-6937-4f3f65f6b581	1262	Dol pri Ljubljani
00050000-5538-fe12-ef52-29e7a77f3d00	1273	Dole pri Litiji
00050000-5538-fe12-3242-49d5fec52131	1331	Dolenja vas
00050000-5538-fe12-9c2e-29b80f5e95fe	8350	Dolenjske Toplice
00050000-5538-fe12-3616-afd2235c7b1b	1230	Domžale
00050000-5538-fe12-54dd-2739eab78479	2252	Dornava
00050000-5538-fe12-40fd-7e2112c1710b	5294	Dornberk
00050000-5538-fe12-e054-ab6446f24e29	1319	Draga
00050000-5538-fe12-cec6-b5e12271dc45	8343	Dragatuš
00050000-5538-fe12-0a06-6ebb4ceeb66d	3222	Dramlje
00050000-5538-fe12-296a-1fe45be421c9	2370	Dravograd
00050000-5538-fe12-ddde-581c3681cd79	4203	Duplje
00050000-5538-fe12-92f7-63ddb2fc1d53	6221	Dutovlje
00050000-5538-fe12-3efe-4bef2cdfc089	8361	Dvor
00050000-5538-fe12-f17a-ce5de1caa33f	2343	Fala
00050000-5538-fe12-f499-e17b09f343be	9208	Fokovci
00050000-5538-fe12-d386-062f3cbc0a5f	2313	Fram
00050000-5538-fe12-d3d0-b5198466ceb8	3213	Frankolovo
00050000-5538-fe12-bc21-2cd49f20ed1c	1274	Gabrovka
00050000-5538-fe12-f0db-7ae7550a63aa	8254	Globoko
00050000-5538-fe12-390f-b9456b363684	5275	Godovič
00050000-5538-fe12-1d44-0f8f3e025460	4204	Golnik
00050000-5538-fe12-6511-435e90a656ea	3303	Gomilsko
00050000-5538-fe12-751a-6c2b624c82dd	4224	Gorenja vas
00050000-5538-fe12-c4ac-d38f8c5a51a0	3263	Gorica pri Slivnici
00050000-5538-fe12-8769-cc5f04d5aa04	2272	Gorišnica
00050000-5538-fe12-f0d8-508c374ea1a8	9250	Gornja Radgona
00050000-5538-fe12-29b9-6198ffdafd75	3342	Gornji Grad
00050000-5538-fe12-760d-89e0066e93ec	4282	Gozd Martuljek
00050000-5538-fe12-dc5d-cf32e7aafb6b	6272	Gračišče
00050000-5538-fe12-136e-a0665ceac808	9264	Grad
00050000-5538-fe12-d218-75f1ff93668e	8332	Gradac
00050000-5538-fe12-db73-69ace939ae15	1384	Grahovo
00050000-5538-fe12-6760-31de649b095d	5242	Grahovo ob Bači
00050000-5538-fe12-1895-8bdb77f9be9d	5251	Grgar
00050000-5538-fe12-8077-19da70c4e103	3302	Griže
00050000-5538-fe12-d364-f0ad61e883c5	3231	Grobelno
00050000-5538-fe12-e3f1-f44b84f2235b	1290	Grosuplje
00050000-5538-fe12-5acf-b3e8c0e109ba	2288	Hajdina
00050000-5538-fe12-ce30-d002230dfc14	8362	Hinje
00050000-5538-fe12-3ddc-8727f298b486	2311	Hoče
00050000-5538-fe12-4534-f4c882713378	9205	Hodoš/Hodos
00050000-5538-fe12-7b25-6f7117a7afa7	1354	Horjul
00050000-5538-fe12-d90d-79ea016b1668	1372	Hotedršica
00050000-5538-fe12-1d16-08e7d16e7a85	1430	Hrastnik
00050000-5538-fe12-6bbb-46b28b499bf4	6225	Hruševje
00050000-5538-fe12-1224-076b852f188c	4276	Hrušica
00050000-5538-fe12-c636-499a98e0087c	5280	Idrija
00050000-5538-fe12-a8b8-7ed950bf051e	1292	Ig
00050000-5538-fe12-0a77-762b7320a097	6250	Ilirska Bistrica
00050000-5538-fe12-6dba-e345f066d9ac	6251	Ilirska Bistrica-Trnovo
00050000-5538-fe12-af51-5f89e9998b40	1295	Ivančna Gorica
00050000-5538-fe12-f57a-b9e901ce7ba2	2259	Ivanjkovci
00050000-5538-fe12-833c-fe8f298ff344	1411	Izlake
00050000-5538-fe12-221c-9151a1675604	6310	Izola/Isola
00050000-5538-fe12-0c37-fdc38e5c2d7b	2222	Jakobski Dol
00050000-5538-fe12-f425-90d37c1cb8ed	2221	Jarenina
00050000-5538-fe12-7119-0346f04c99ff	6254	Jelšane
00050000-5538-fe12-f361-fed98337717b	4270	Jesenice
00050000-5538-fe12-a56e-3c053ffd284c	8261	Jesenice na Dolenjskem
00050000-5538-fe12-d374-7c1b2eab1dbd	3273	Jurklošter
00050000-5538-fe12-5e5c-7ea456394d02	2223	Jurovski Dol
00050000-5538-fe12-78b2-78ab55835b85	2256	Juršinci
00050000-5538-fe12-b92d-351c1685c26f	5214	Kal nad Kanalom
00050000-5538-fe12-8dcc-04d22b3fd667	3233	Kalobje
00050000-5538-fe12-c9fc-ccfefd802432	4246	Kamna Gorica
00050000-5538-fe12-ff0d-78f17adacb31	2351	Kamnica
00050000-5538-fe12-a11a-4aa718df6521	1241	Kamnik
00050000-5538-fe12-b899-92ba36003fbc	5213	Kanal
00050000-5538-fe12-c452-00db83f37557	8258	Kapele
00050000-5538-fe12-ac5e-8c655e03f111	2362	Kapla
00050000-5538-fe12-ed99-f8d26a4260a0	2325	Kidričevo
00050000-5538-fe12-404e-c607f732388d	1412	Kisovec
00050000-5538-fe12-66d3-b339cbdc07ef	6253	Knežak
00050000-5538-fe12-d675-60c5e692a135	5222	Kobarid
00050000-5538-fe12-9de6-9edf7c113b36	9227	Kobilje
00050000-5538-fe12-a634-54d4b3b13827	1330	Kočevje
00050000-5538-fe12-c885-5d7cffa1da3d	1338	Kočevska Reka
00050000-5538-fe12-6cac-5537d8b9fd08	2276	Kog
00050000-5538-fe12-df74-3b9d30127375	5211	Kojsko
00050000-5538-fe12-c861-e2394a501d73	6223	Komen
00050000-5538-fe12-b2dd-8b467cf05e6a	1218	Komenda
00050000-5538-fe12-580c-4d9ddbd514f1	6000	Koper/Capodistria 
00050000-5538-fe12-2545-558156832e8b	6001	Koper/Capodistria - poštni predali
00050000-5538-fe12-c885-971de2951c6d	8282	Koprivnica
00050000-5538-fe12-33eb-9d6efc4c8a8f	5296	Kostanjevica na Krasu
00050000-5538-fe12-04c6-413779295f40	8311	Kostanjevica na Krki
00050000-5538-fe12-e6b4-f3f4a3d29f91	1336	Kostel
00050000-5538-fe12-2c69-f1a44f3aee16	6256	Košana
00050000-5538-fe12-9601-0d6c8c574251	2394	Kotlje
00050000-5538-fe12-9ef1-14d704cdac67	6240	Kozina
00050000-5538-fe12-bafa-4d1236a61087	3260	Kozje
00050000-5538-fe12-a0a9-f8449916da99	4000	Kranj 
00050000-5538-fe12-5878-c088e4442c8c	4001	Kranj - poštni predali
00050000-5538-fe12-0736-1666424e4d5a	4280	Kranjska Gora
00050000-5538-fe12-a181-0bd0cadfd1ea	1281	Kresnice
00050000-5538-fe12-17af-85f5e7c7f64c	4294	Križe
00050000-5538-fe12-b6be-62651c7fe216	9206	Križevci
00050000-5538-fe12-c452-a3fc26dc3b16	9242	Križevci pri Ljutomeru
00050000-5538-fe12-be1a-949fc5e5870a	1301	Krka
00050000-5538-fe12-08de-531f5493e106	8296	Krmelj
00050000-5538-fe12-8b98-eb8a853ae90e	4245	Kropa
00050000-5538-fe12-36ec-630d0579134a	8262	Krška vas
00050000-5538-fe12-64cb-f5bc8ab0102d	8270	Krško
00050000-5538-fe12-4dea-3d73b915a309	9263	Kuzma
00050000-5538-fe12-0cab-a4df563f93ea	2318	Laporje
00050000-5538-fe12-f8e9-ad3fff0dbe29	3270	Laško
00050000-5538-fe12-3d1c-d830b3c32d3d	1219	Laze v Tuhinju
00050000-5538-fe12-9a39-64f8ca9377f3	2230	Lenart v Slovenskih goricah
00050000-5538-fe12-1402-f3dc398eb7f4	9220	Lendava/Lendva
00050000-5538-fe12-c0da-b92f5cb0f867	4248	Lesce
00050000-5538-fe12-284d-74874285d265	3261	Lesično
00050000-5538-fe12-0027-3d157fd724cc	8273	Leskovec pri Krškem
00050000-5538-fe12-ecc7-5dbf07c72148	2372	Libeliče
00050000-5538-fe12-294e-d55a742c7cbd	2341	Limbuš
00050000-5538-fe12-6b27-801c88a7bf0b	1270	Litija
00050000-5538-fe12-0b7b-58ebae4b8bab	3202	Ljubečna
00050000-5538-fe12-6508-2cf5cced9303	1000	Ljubljana 
00050000-5538-fe12-b50c-e948ba4ef991	1001	Ljubljana - poštni predali
00050000-5538-fe12-1b2f-ad5d3aacd015	1231	Ljubljana - Črnuče
00050000-5538-fe12-ce3a-26df2dfef781	1261	Ljubljana - Dobrunje
00050000-5538-fe12-060b-d2b4bba6b0aa	1260	Ljubljana - Polje
00050000-5538-fe12-6236-166417e63baf	1210	Ljubljana - Šentvid
00050000-5538-fe12-2085-72f28c402bac	1211	Ljubljana - Šmartno
00050000-5538-fe12-67bd-84a3613c17d0	3333	Ljubno ob Savinji
00050000-5538-fe12-be2c-77267cb2bb0a	9240	Ljutomer
00050000-5538-fe12-3f88-4b616e21eb38	3215	Loče
00050000-5538-fe12-2aa2-5be65dc917eb	5231	Log pod Mangartom
00050000-5538-fe12-1304-2ef810dd932f	1358	Log pri Brezovici
00050000-5538-fe12-2901-65e968c1cda2	1370	Logatec
00050000-5538-fe12-838c-48414ec7aaa9	1371	Logatec
00050000-5538-fe12-40d3-d1e217a94498	1434	Loka pri Zidanem Mostu
00050000-5538-fe12-dfb2-5819ef9a5adf	3223	Loka pri Žusmu
00050000-5538-fe12-37da-92e05504c140	6219	Lokev
00050000-5538-fe12-2fd4-8dbaf9d0a6f6	1318	Loški Potok
00050000-5538-fe12-d427-fcea455bc6b1	2324	Lovrenc na Dravskem polju
00050000-5538-fe12-d287-acd6230dd70d	2344	Lovrenc na Pohorju
00050000-5538-fe12-0a71-3944f4fa83d9	3334	Luče
00050000-5538-fe12-a2d1-411dffada470	1225	Lukovica
00050000-5538-fe12-1d58-9c2fcedfb286	9202	Mačkovci
00050000-5538-fe12-785d-bff0c0a1615e	2322	Majšperk
00050000-5538-fe12-0caf-a734ec4c8c51	2321	Makole
00050000-5538-fe12-9417-47004e0a0ea7	9243	Mala Nedelja
00050000-5538-fe12-e44a-685bedd0bfa5	2229	Malečnik
00050000-5538-fe12-42c4-407ab87e3ee0	6273	Marezige
00050000-5538-fe12-c722-f8f0b67f76c7	2000	Maribor 
00050000-5538-fe12-7ecc-8a9468648dd1	2001	Maribor - poštni predali
00050000-5538-fe12-96a2-2b0494ee5406	2206	Marjeta na Dravskem polju
00050000-5538-fe12-29d1-17f88f50b7fd	2281	Markovci
00050000-5538-fe12-4a34-5406413a30e7	9221	Martjanci
00050000-5538-fe12-d547-322f74e23167	6242	Materija
00050000-5538-fe12-ce35-5b872856e9ca	4211	Mavčiče
00050000-5538-fe12-1d88-ebd6319eb365	1215	Medvode
00050000-5538-fe12-0f8a-2d16530763ff	1234	Mengeš
00050000-5538-fe12-f1b1-d43a48355543	8330	Metlika
00050000-5538-fe12-18d0-08a0b0d917ea	2392	Mežica
00050000-5538-fe12-5621-220ff9d5c4ff	2204	Miklavž na Dravskem polju
00050000-5538-fe12-4086-5a6408320e92	2275	Miklavž pri Ormožu
00050000-5538-fe12-55cb-18e181eb5396	5291	Miren
00050000-5538-fe12-611b-5edb7a70439e	8233	Mirna
00050000-5538-fe12-cc3d-74a7107d16fc	8216	Mirna Peč
00050000-5538-fe12-2546-6848dd286aa0	2382	Mislinja
00050000-5538-fe12-68de-19dd47954ac7	4281	Mojstrana
00050000-5538-fe12-4f1b-39659dcacb41	8230	Mokronog
00050000-5538-fe12-f631-bab02d2afd3f	1251	Moravče
00050000-5538-fe12-fe46-229e565692ab	9226	Moravske Toplice
00050000-5538-fe12-37c4-c4f45b29bf4e	5216	Most na Soči
00050000-5538-fe12-aafa-723a8502a601	1221	Motnik
00050000-5538-fe12-875a-ed21b2fbb00e	3330	Mozirje
00050000-5538-fe12-9e77-949388c2d360	9000	Murska Sobota 
00050000-5538-fe12-c36d-3880c49bfc38	9001	Murska Sobota - poštni predali
00050000-5538-fe12-6d1e-f9961dd97c1e	2366	Muta
00050000-5538-fe12-5261-470d54c78b80	4202	Naklo
00050000-5538-fe12-e728-e16a47675892	3331	Nazarje
00050000-5538-fe12-906d-3267830656a4	1357	Notranje Gorice
00050000-5538-fe12-8b95-7b06f6e5a2bb	3203	Nova Cerkev
00050000-5538-fe12-e4a5-f37745f2da40	5000	Nova Gorica 
00050000-5538-fe12-4e9e-b1aacfabf0f0	5001	Nova Gorica - poštni predali
00050000-5538-fe12-04ca-1d8215fa91bd	1385	Nova vas
00050000-5538-fe12-c155-71dc8aed3b97	8000	Novo mesto
00050000-5538-fe12-b282-2699b2799667	8001	Novo mesto - poštni predali
00050000-5538-fe12-c091-083ba76fe9a7	6243	Obrov
00050000-5538-fe12-84a3-a15a6c38cc8d	9233	Odranci
00050000-5538-fe12-ae00-30a5707e7593	2317	Oplotnica
00050000-5538-fe12-c054-65d96ba7e32e	2312	Orehova vas
00050000-5538-fe12-e4af-15bbcffeddc2	2270	Ormož
00050000-5538-fe12-d1b4-a6bef5f8b1e4	1316	Ortnek
00050000-5538-fe12-dffd-b7dfd3a1547c	1337	Osilnica
00050000-5538-fe12-6a27-82d237954437	8222	Otočec
00050000-5538-fe12-6238-43e20d96832f	2361	Ožbalt
00050000-5538-fe12-32ef-c8e09224cafb	2231	Pernica
00050000-5538-fe12-8977-21b10fc4f8f5	2211	Pesnica pri Mariboru
00050000-5538-fe12-3e27-1491adf50364	9203	Petrovci
00050000-5538-fe12-0354-a57ab8029e62	3301	Petrovče
00050000-5538-fe12-bd2c-b9fc1cb18f0b	6330	Piran/Pirano
00050000-5538-fe12-3e58-9f3f798b06ad	8255	Pišece
00050000-5538-fe12-9051-80a4687b51a7	6257	Pivka
00050000-5538-fe12-661a-79e63c0261d4	6232	Planina
00050000-5538-fe12-235b-071ba2e1bf22	3225	Planina pri Sevnici
00050000-5538-fe12-61d6-23345526cc1c	6276	Pobegi
00050000-5538-fe12-f2ff-bcdb47ebe542	8312	Podbočje
00050000-5538-fe12-e681-9e2bd565374c	5243	Podbrdo
00050000-5538-fe12-b539-1d0befb0e66d	3254	Podčetrtek
00050000-5538-fe12-3dd8-0d862c5d159e	2273	Podgorci
00050000-5538-fe12-71a0-fc04265d3f04	6216	Podgorje
00050000-5538-fe12-70dc-d5bfbfe38172	2381	Podgorje pri Slovenj Gradcu
00050000-5538-fe12-f6b4-14ea368811de	6244	Podgrad
00050000-5538-fe12-8429-2f7df7f41dca	1414	Podkum
00050000-5538-fe12-150f-54f53e9d9d88	2286	Podlehnik
00050000-5538-fe12-b550-ffae2c994b37	5272	Podnanos
00050000-5538-fe12-99bb-551404ba3df5	4244	Podnart
00050000-5538-fe12-ad0d-d874654796c6	3241	Podplat
00050000-5538-fe12-2060-8e899638642a	3257	Podsreda
00050000-5538-fe12-4833-f7cfac92edbf	2363	Podvelka
00050000-5538-fe12-1420-dc090aeb945c	2208	Pohorje
00050000-5538-fe12-b4c0-598f342f0700	2257	Polenšak
00050000-5538-fe12-551a-93366748eccd	1355	Polhov Gradec
00050000-5538-fe12-fb6b-2e8d4a65a089	4223	Poljane nad Škofjo Loko
00050000-5538-fe12-c735-047071c07dc0	2319	Poljčane
00050000-5538-fe12-d476-355e8e93094c	1272	Polšnik
00050000-5538-fe12-5a4b-4340190c8b5d	3313	Polzela
00050000-5538-fe12-415f-9896e828f80d	3232	Ponikva
00050000-5538-fe12-f83e-f86d2d7ef1e9	6320	Portorož/Portorose
00050000-5538-fe12-f1fe-6acc76b33511	6230	Postojna
00050000-5538-fe12-8393-c51d3465ed30	2331	Pragersko
00050000-5538-fe12-d457-c7b8d5420d6f	3312	Prebold
00050000-5538-fe12-52a0-1021b8ebdc1d	4205	Preddvor
00050000-5538-fe12-1ef2-f5e3cff35190	6255	Prem
00050000-5538-fe12-44a0-e05a632e7fc5	1352	Preserje
00050000-5538-fe12-3511-aac7736c5408	6258	Prestranek
00050000-5538-fe12-1b9e-e0c028bf26a3	2391	Prevalje
00050000-5538-fe12-985d-6115c9ae909f	3262	Prevorje
00050000-5538-fe12-712f-f091911be9eb	1276	Primskovo 
00050000-5538-fe12-2276-eea3876b9c60	3253	Pristava pri Mestinju
00050000-5538-fe12-488c-94dab04fd1b8	9207	Prosenjakovci/Partosfalva
00050000-5538-fe12-0737-d5453ea8e0bb	5297	Prvačina
00050000-5538-fe12-ec79-625378c90ebe	2250	Ptuj
00050000-5538-fe12-2e5b-2d5fd6d13430	2323	Ptujska Gora
00050000-5538-fe12-b2e7-5c196e89dea5	9201	Puconci
00050000-5538-fe12-1f5c-1d22c4d2c3cd	2327	Rače
00050000-5538-fe12-be2b-d49daa4420ca	1433	Radeče
00050000-5538-fe12-806f-886bd780e479	9252	Radenci
00050000-5538-fe12-6125-60c24e95948f	2360	Radlje ob Dravi
00050000-5538-fe12-f334-c6c557d44b6e	1235	Radomlje
00050000-5538-fe12-ae1b-f0d42efa8829	4240	Radovljica
00050000-5538-fe12-081e-f751436046c3	8274	Raka
00050000-5538-fe12-e70c-1aa01ff6d741	1381	Rakek
00050000-5538-fe12-1647-0d40cbffaaab	4283	Rateče - Planica
00050000-5538-fe12-1d97-323f7a83c44d	2390	Ravne na Koroškem
00050000-5538-fe12-f085-df9481d3b732	9246	Razkrižje
00050000-5538-fe12-b8e7-77960c597a09	3332	Rečica ob Savinji
00050000-5538-fe12-a7a4-4ac4a4c77031	5292	Renče
00050000-5538-fe12-e2e7-1ed3fb9a959d	1310	Ribnica
00050000-5538-fe12-9be5-e4aa92b69131	2364	Ribnica na Pohorju
00050000-5538-fe12-ba5e-cbd9dc9562f9	3272	Rimske Toplice
00050000-5538-fe12-9d1e-31edb39570ed	1314	Rob
00050000-5538-fe12-9d53-eb21e4bcdf1e	5215	Ročinj
00050000-5538-fe12-04bd-48eff73ca5d2	3250	Rogaška Slatina
00050000-5538-fe12-4a06-ed623f63225d	9262	Rogašovci
00050000-5538-fe12-e36d-dc82cc917971	3252	Rogatec
00050000-5538-fe12-c33e-f921d56e5f02	1373	Rovte
00050000-5538-fe12-9367-f9111bb9d24d	2342	Ruše
00050000-5538-fe12-e215-2ba81983cefd	1282	Sava
00050000-5538-fe12-cea8-c73d42fbc444	6333	Sečovlje/Sicciole
00050000-5538-fe12-8a7e-f40f20413fa6	4227	Selca
00050000-5538-fe12-13bf-52585d2ca093	2352	Selnica ob Dravi
00050000-5538-fe12-4315-a48b64f8c87c	8333	Semič
00050000-5538-fe12-a09c-9b58ee907adb	8281	Senovo
00050000-5538-fe12-26a4-b1f3c31e7989	6224	Senožeče
00050000-5538-fe12-7474-a1d4a04ff2bf	8290	Sevnica
00050000-5538-fe12-23bb-ba2fad6d20a0	6210	Sežana
00050000-5538-fe12-ed8a-4b7945aaa157	2214	Sladki Vrh
00050000-5538-fe12-4f4b-c275027e9bec	5283	Slap ob Idrijci
00050000-5538-fe12-ad8d-df18c6545264	2380	Slovenj Gradec
00050000-5538-fe12-a7b6-a6cc813ea002	2310	Slovenska Bistrica
00050000-5538-fe12-553f-afa5546e63eb	3210	Slovenske Konjice
00050000-5538-fe12-4e71-3ab2a23a775c	1216	Smlednik
00050000-5538-fe12-6e1b-5a86fa95c952	5232	Soča
00050000-5538-fe12-e0f4-04e6897801fc	1317	Sodražica
00050000-5538-fe12-e520-71591f88931c	3335	Solčava
00050000-5538-fe12-fd6d-fa4b7fc91a8f	5250	Solkan
00050000-5538-fe12-1a6f-6b5f5eb3853b	4229	Sorica
00050000-5538-fe12-6562-9b1525c74d61	4225	Sovodenj
00050000-5538-fe12-1c97-7d1fe2c612f1	5281	Spodnja Idrija
00050000-5538-fe12-876c-ab76adb926d0	2241	Spodnji Duplek
00050000-5538-fe12-f314-bf603ea7c5bd	9245	Spodnji Ivanjci
00050000-5538-fe12-d92c-e640498b9af0	2277	Središče ob Dravi
00050000-5538-fe12-c7c8-4ff4e4e8479b	4267	Srednja vas v Bohinju
00050000-5538-fe12-2eb0-5eb267ba2ec0	8256	Sromlje 
00050000-5538-fe12-b63b-fb4613675cf1	5224	Srpenica
00050000-5538-fe12-520c-88e4c5b233fa	1242	Stahovica
00050000-5538-fe12-f460-4ece51503425	1332	Stara Cerkev
00050000-5538-fe12-c18b-bf71219f3a6f	8342	Stari trg ob Kolpi
00050000-5538-fe12-766a-fe5adc7cb512	1386	Stari trg pri Ložu
00050000-5538-fe12-302b-7878584109d6	2205	Starše
00050000-5538-fe12-a469-cda87bda2b78	2289	Stoperce
00050000-5538-fe12-2429-033b95ff7277	8322	Stopiče
00050000-5538-fe12-b639-d54cdcb26fac	3206	Stranice
00050000-5538-fe12-753b-867e6165df91	8351	Straža
00050000-5538-fe12-268c-60323b24ec9d	1313	Struge
00050000-5538-fe12-628f-961a40be84d8	8293	Studenec
00050000-5538-fe12-2a1f-8b117ec3601d	8331	Suhor
00050000-5538-fe12-4d7d-add08366cd10	2233	Sv. Ana v Slovenskih goricah
00050000-5538-fe12-9c78-e03a366e76f5	2235	Sv. Trojica v Slovenskih goricah
00050000-5538-fe12-432c-f787dede7285	2353	Sveti Duh na Ostrem Vrhu
00050000-5538-fe12-6e97-3dcf357470d8	9244	Sveti Jurij ob Ščavnici
00050000-5538-fe12-00df-99316b2ffe87	3264	Sveti Štefan
00050000-5538-fe12-b097-960fb073c482	2258	Sveti Tomaž
00050000-5538-fe12-b864-e161f7f12a41	9204	Šalovci
00050000-5538-fe12-63c3-fab4947c00e4	5261	Šempas
00050000-5538-fe12-1b69-4f84703c3628	5290	Šempeter pri Gorici
00050000-5538-fe12-4120-54fa1bb7984c	3311	Šempeter v Savinjski dolini
00050000-5538-fe12-ed85-e9195e76edba	4208	Šenčur
00050000-5538-fe12-8011-92f2cc7194c4	2212	Šentilj v Slovenskih goricah
00050000-5538-fe12-7090-a8c52e382c5b	8297	Šentjanž
00050000-5538-fe12-a938-450b47c8e603	2373	Šentjanž pri Dravogradu
00050000-5538-fe12-f90e-71b32ef9c6ac	8310	Šentjernej
00050000-5538-fe12-05bc-d15dccfdf1cc	3230	Šentjur
00050000-5538-fe12-0e4a-a38ca5cdced5	3271	Šentrupert
00050000-5538-fe12-3670-17131a4ba9cf	8232	Šentrupert
00050000-5538-fe12-4a6f-359b658d184f	1296	Šentvid pri Stični
00050000-5538-fe12-188b-8009dc8fcd00	8275	Škocjan
00050000-5538-fe12-be7b-4b37de27a9c7	6281	Škofije
00050000-5538-fe12-d531-1812242aa109	4220	Škofja Loka
00050000-5538-fe12-d0a6-9bbdfbdc9722	3211	Škofja vas
00050000-5538-fe12-d8e7-88d918e97e05	1291	Škofljica
00050000-5538-fe12-0603-51b00318f5b3	6274	Šmarje
00050000-5538-fe12-80ce-1b5b50a61d65	1293	Šmarje - Sap
00050000-5538-fe12-cadb-e0d6ce51278e	3240	Šmarje pri Jelšah
00050000-5538-fe12-edf7-fa12060c4e3d	8220	Šmarješke Toplice
00050000-5538-fe12-b0ad-eb7dde738745	2315	Šmartno na Pohorju
00050000-5538-fe12-9011-d6d0d1e54289	3341	Šmartno ob Dreti
00050000-5538-fe12-eb6e-e5ab692e9775	3327	Šmartno ob Paki
00050000-5538-fe12-6a06-325deb78af34	1275	Šmartno pri Litiji
00050000-5538-fe12-9c07-b97d77432e42	2383	Šmartno pri Slovenj Gradcu
00050000-5538-fe12-c724-85be5027a39b	3201	Šmartno v Rožni dolini
00050000-5538-fe12-7d1e-9c703f232cc8	3325	Šoštanj
00050000-5538-fe12-50dc-8876a8dd55f3	6222	Štanjel
00050000-5538-fe12-78aa-8c462e760a97	3220	Štore
00050000-5538-fe12-5e89-c93f34fb48dd	3304	Tabor
00050000-5538-fe12-da46-904924cb53cd	3221	Teharje
00050000-5538-fe12-bc2e-12887914cd3b	9251	Tišina
00050000-5538-fe12-b268-eaca5095383a	5220	Tolmin
00050000-5538-fe12-5eae-8e2c5c995677	3326	Topolšica
00050000-5538-fe12-1f20-827bf0f5a207	2371	Trbonje
00050000-5538-fe12-47ad-992150462aaf	1420	Trbovlje
00050000-5538-fe12-9ef1-e46b713aee8a	8231	Trebelno 
00050000-5538-fe12-0f23-8815f8450226	8210	Trebnje
00050000-5538-fe12-490a-7c4bb103c960	5252	Trnovo pri Gorici
00050000-5538-fe12-d455-feb1491ee5a4	2254	Trnovska vas
00050000-5538-fe12-6b6b-b345b344ac95	1222	Trojane
00050000-5538-fe12-4d9f-27c5ddc968f2	1236	Trzin
00050000-5538-fe12-e7cd-cc52a4039934	4290	Tržič
00050000-5538-fe12-3511-3f83bc1e9e98	8295	Tržišče
00050000-5538-fe12-b274-7531c856f688	1311	Turjak
00050000-5538-fe12-7146-b0b489dfc3cc	9224	Turnišče
00050000-5538-fe12-13ac-7989ef7b7124	8323	Uršna sela
00050000-5538-fe12-d751-d6f84931c2fc	1252	Vače
00050000-5538-fe12-f72f-b0db4765f7b6	3320	Velenje 
00050000-5538-fe12-a7ef-2663afab2784	3322	Velenje - poštni predali
00050000-5538-fe12-d066-7b72732c566e	8212	Velika Loka
00050000-5538-fe12-34db-1d3e2255dc5b	2274	Velika Nedelja
00050000-5538-fe12-90a9-32c27daa8ed7	9225	Velika Polana
00050000-5538-fe12-c76b-af22b148d647	1315	Velike Lašče
00050000-5538-fe12-0f5b-1f9c0cfc116d	8213	Veliki Gaber
00050000-5538-fe12-3795-17448ca7634c	9241	Veržej
00050000-5538-fe12-1334-bfce93deb822	1312	Videm - Dobrepolje
00050000-5538-fe12-4ae5-8c7f7055f5ed	2284	Videm pri Ptuju
00050000-5538-fe12-5c85-b366ec26b201	8344	Vinica
00050000-5538-fe12-7cb0-84c523799608	5271	Vipava
00050000-5538-fe12-d496-3c02c1a7dbb5	4212	Visoko
00050000-5538-fe12-f262-40af6c84bf38	1294	Višnja Gora
00050000-5538-fe12-8448-5faf6b7f2e17	3205	Vitanje
00050000-5538-fe12-fc36-8cdd7a7b6d7c	2255	Vitomarci
00050000-5538-fe12-e606-97768f843d8d	1217	Vodice
00050000-5538-fe12-acde-a2499b2f69a4	3212	Vojnik\t
00050000-5538-fe12-dc71-002e48cbee48	5293	Volčja Draga
00050000-5538-fe12-7c18-061a28e2282c	2232	Voličina
00050000-5538-fe12-11bb-c883332e5845	3305	Vransko
00050000-5538-fe12-55d5-228b1a53374f	6217	Vremski Britof
00050000-5538-fe12-52a8-5510f7151ff3	1360	Vrhnika
00050000-5538-fe12-b223-c03ce4b33a07	2365	Vuhred
00050000-5538-fe12-90dd-41292a13ed7b	2367	Vuzenica
00050000-5538-fe12-dac2-a85e4b23d49b	8292	Zabukovje 
00050000-5538-fe12-3e7a-95bcb58b6137	1410	Zagorje ob Savi
00050000-5538-fe12-d647-06b230fb6f76	1303	Zagradec
00050000-5538-fe12-5a91-3e72e758f933	2283	Zavrč
00050000-5538-fe12-3d3f-c63aea3df998	8272	Zdole 
00050000-5538-fe12-c0e7-b4125e0ea198	4201	Zgornja Besnica
00050000-5538-fe12-cfef-3428377b8246	2242	Zgornja Korena
00050000-5538-fe12-7fc1-766dadf7081e	2201	Zgornja Kungota
00050000-5538-fe12-a155-c47e0bc03637	2316	Zgornja Ložnica
00050000-5538-fe12-5cf4-9b0edb01e79d	2314	Zgornja Polskava
00050000-5538-fe12-910a-98a768ab9f03	2213	Zgornja Velka
00050000-5538-fe12-7e8a-a619e0094105	4247	Zgornje Gorje
00050000-5538-fe12-693b-6c76283de4e8	4206	Zgornje Jezersko
00050000-5538-fe12-0984-a0927c639669	2285	Zgornji Leskovec
00050000-5538-fe12-d7d9-fc480bdaea18	1432	Zidani Most
00050000-5538-fe12-11d8-8ce93ad1852c	3214	Zreče
00050000-5538-fe12-87a2-065a214cc116	4209	Žabnica
00050000-5538-fe12-5694-227111ca70ac	3310	Žalec
00050000-5538-fe12-c4ca-5a4e774e4a9f	4228	Železniki
00050000-5538-fe12-7eaf-1f3916231be7	2287	Žetale
00050000-5538-fe12-cfc2-a56dd4394768	4226	Žiri
00050000-5538-fe12-d715-d75571ea76fa	4274	Žirovnica
00050000-5538-fe12-de97-2d477dfbe3af	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 1129235)
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
-- TOC entry 2642 (class 0 OID 1129058)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 1129124)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 1129247)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 1129352)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 1129396)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 1129276)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 1129220)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 1129210)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 1129386)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 1129342)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 1128924)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5538-fe14-3ba0-204238e29ed6	00010000-5538-fe14-ddac-44ba5f79022d	2015-04-23 16:13:41	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROYYRSuPAd53E9jg3T9JozIMgZq2ETPdW";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 1129285)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 1128962)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00000000-5538-fe14-a8a5-39e7e766c27d	beri-vse	Polni dostop do vsega v aplikaciji.	t
00000000-5538-fe14-a2db-20577b741bd8	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00000000-5538-fe14-01f0-12a71dc647d6	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00000000-5538-fe14-45c2-94163ef859a2	ifi-all	Polni dostop do vsega v aplikaciji.	t
00000000-5538-fe14-164d-ff27943307e1	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00000000-5538-fe14-8d17-d7d1867cbcf4	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 1128946)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5538-fe14-3ba0-204238e29ed6	00000000-5538-fe14-45c2-94163ef859a2
00010000-5538-fe14-ddac-44ba5f79022d	00000000-5538-fe14-45c2-94163ef859a2
\.


--
-- TOC entry 2668 (class 0 OID 1129299)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 1129241)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 1129191)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 1129023)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 1129197)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 1129377)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 1129093)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 1128933)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5538-fe14-ddac-44ba5f79022d	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO5wchWjlgYjjHwcd4lJHodiIiLKdZtKG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5538-fe14-3ba0-204238e29ed6	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 1129427)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 1129139)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 1129268)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 1129334)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 1129167)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 1129417)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 1129324)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2275 (class 2606 OID 1128987)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 1129466)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 1129459)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 1129376)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 1129157)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 1129190)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2311 (class 2606 OID 1129119)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 1129320)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2322 (class 2606 OID 1129137)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 1129184)
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
-- TOC entry 2365 (class 2606 OID 1129233)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 1129260)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 1129091)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2279 (class 2606 OID 1128996)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 1129055)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2281 (class 2606 OID 1129021)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2273 (class 2606 OID 1128976)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2266 (class 2606 OID 1128961)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 1129266)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 1129298)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 1129413)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 1129048)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2301 (class 2606 OID 1129079)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 1129239)
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
-- TOC entry 2299 (class 2606 OID 1129069)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2320 (class 2606 OID 1129128)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 1129251)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 1129358)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 1129401)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 1129283)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 1129224)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 1129215)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 1129395)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 1129349)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2258 (class 2606 OID 1128932)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 1129289)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2264 (class 2606 OID 1128950)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2268 (class 2606 OID 1128970)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 1129307)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 1129246)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 1129196)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2286 (class 2606 OID 1129028)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2351 (class 2606 OID 1129206)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 1129385)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2309 (class 2606 OID 1129104)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 1128945)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 1129441)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 1129143)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 1129274)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 1129340)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 1129179)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 1129426)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 1129333)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 1259 OID 1129164)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2287 (class 1259 OID 1129050)
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
-- TOC entry 2378 (class 1259 OID 1129267)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2372 (class 1259 OID 1129253)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2373 (class 1259 OID 1129252)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2324 (class 1259 OID 1129144)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2399 (class 1259 OID 1129323)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2400 (class 1259 OID 1129321)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2401 (class 1259 OID 1129322)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2424 (class 1259 OID 1129414)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2425 (class 1259 OID 1129415)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2426 (class 1259 OID 1129416)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 1129444)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 1129443)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 1129442)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2306 (class 1259 OID 1129106)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2307 (class 1259 OID 1129105)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2291 (class 1259 OID 1129057)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2292 (class 1259 OID 1129056)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 1129290)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2342 (class 1259 OID 1129185)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2270 (class 1259 OID 1128977)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2271 (class 1259 OID 1128978)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2392 (class 1259 OID 1129310)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2393 (class 1259 OID 1129309)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2394 (class 1259 OID 1129308)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2316 (class 1259 OID 1129129)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2317 (class 1259 OID 1129131)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2318 (class 1259 OID 1129130)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2352 (class 1259 OID 1129219)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2353 (class 1259 OID 1129217)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2354 (class 1259 OID 1129216)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2355 (class 1259 OID 1129218)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2261 (class 1259 OID 1128951)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2262 (class 1259 OID 1128952)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2381 (class 1259 OID 1129275)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2367 (class 1259 OID 1129240)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2407 (class 1259 OID 1129350)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2408 (class 1259 OID 1129351)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2295 (class 1259 OID 1129071)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2296 (class 1259 OID 1129070)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2297 (class 1259 OID 1129072)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2411 (class 1259 OID 1129359)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2412 (class 1259 OID 1129360)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 1129469)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 1129468)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 1129471)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 1129467)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2446 (class 1259 OID 1129470)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2404 (class 1259 OID 1129341)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2358 (class 1259 OID 1129228)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2359 (class 1259 OID 1129227)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2360 (class 1259 OID 1129225)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2361 (class 1259 OID 1129226)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2248 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 1129461)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 1129460)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2323 (class 1259 OID 1129138)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2276 (class 1259 OID 1128998)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2277 (class 1259 OID 1128997)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2283 (class 1259 OID 1129029)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2284 (class 1259 OID 1129030)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2347 (class 1259 OID 1129209)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2348 (class 1259 OID 1129208)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2349 (class 1259 OID 1129207)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2330 (class 1259 OID 1129166)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2331 (class 1259 OID 1129162)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2332 (class 1259 OID 1129159)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2333 (class 1259 OID 1129160)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2334 (class 1259 OID 1129158)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2335 (class 1259 OID 1129163)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2336 (class 1259 OID 1129161)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2290 (class 1259 OID 1129049)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 1129120)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2313 (class 1259 OID 1129122)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2314 (class 1259 OID 1129121)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2315 (class 1259 OID 1129123)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2366 (class 1259 OID 1129234)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2282 (class 1259 OID 1129022)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2305 (class 1259 OID 1129092)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2386 (class 1259 OID 1129284)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2251 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 1129080)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2423 (class 1259 OID 1129402)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2269 (class 1259 OID 1128971)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2337 (class 1259 OID 1129165)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2471 (class 2606 OID 1129602)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 1129587)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 1129592)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2469 (class 2606 OID 1129612)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2475 (class 2606 OID 1129582)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2470 (class 2606 OID 1129607)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 1129597)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 1129517)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 1129697)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2490 (class 2606 OID 1129692)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2491 (class 2606 OID 1129687)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 1129577)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2498 (class 2606 OID 1129737)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 1129727)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 1129732)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 1129677)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 1129772)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 1129777)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 1129782)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2510 (class 2606 OID 1129797)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 1129792)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 1129787)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2462 (class 2606 OID 1129552)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 1129547)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 1129527)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 1129522)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 1129502)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 1129707)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 1129617)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 1129482)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2449 (class 2606 OID 1129487)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2495 (class 2606 OID 1129722)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 1129717)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 1129712)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 1129557)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 1129567)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 1129562)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2480 (class 2606 OID 1129652)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2482 (class 2606 OID 1129642)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2483 (class 2606 OID 1129637)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2481 (class 2606 OID 1129647)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 1129472)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2447 (class 2606 OID 1129477)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 1129702)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 1129682)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2503 (class 2606 OID 1129747)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2502 (class 2606 OID 1129752)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 1129537)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 1129532)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 1129542)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2505 (class 2606 OID 1129757)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 1129762)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 1129822)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 1129817)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2515 (class 2606 OID 1129832)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 1129812)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2516 (class 2606 OID 1129827)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 1129742)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 1129672)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2485 (class 2606 OID 1129667)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 1129657)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2486 (class 2606 OID 1129662)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2513 (class 2606 OID 1129807)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2514 (class 2606 OID 1129802)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 1129572)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 1129767)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 1129497)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 1129492)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2455 (class 2606 OID 1129507)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 1129512)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2477 (class 2606 OID 1129632)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 1129627)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 1129622)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-23 16:13:41 CEST

--
-- PostgreSQL database dump complete
--

