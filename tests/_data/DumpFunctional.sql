--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-04-21 17:27:24 CEST

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
-- TOC entry 2680 (class 0 OID 0)
-- Dependencies: 226
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 662339)
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
-- TOC entry 225 (class 1259 OID 662812)
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
-- TOC entry 224 (class 1259 OID 662795)
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
-- TOC entry 217 (class 1259 OID 662711)
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
-- TOC entry 193 (class 1259 OID 662495)
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
-- TOC entry 196 (class 1259 OID 662536)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 662457)
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
-- TOC entry 212 (class 1259 OID 662661)
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
-- TOC entry 191 (class 1259 OID 662482)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 662530)
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
-- TOC entry 201 (class 1259 OID 662579)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 662604)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 662433)
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
-- TOC entry 180 (class 1259 OID 662348)
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
-- TOC entry 181 (class 1259 OID 662359)
-- Name: oseba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba (
    id uuid NOT NULL,
    user_id uuid,
    naziv character varying(40) DEFAULT NULL::character varying,
    ime character varying(255) NOT NULL,
    priimek character varying(255) NOT NULL,
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
-- TOC entry 184 (class 1259 OID 662404)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 662313)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 662332)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 662611)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 662641)
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
-- TOC entry 221 (class 1259 OID 662753)
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
-- TOC entry 183 (class 1259 OID 662386)
-- Name: popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE popa (
    id uuid NOT NULL,
    drzava_id uuid,
    sifra character varying(4) NOT NULL,
    tipkli character varying(20) NOT NULL,
    stakli character varying(2) DEFAULT NULL::character varying,
    naziv character varying(60) NOT NULL,
    naziv1 character varying(60) DEFAULT NULL::character varying,
    email character varying(50) DEFAULT NULL::character varying,
    url character varying(100) DEFAULT NULL::character varying,
    opomba text,
    idddv character varying(18) DEFAULT NULL::character varying,
    maticna character varying(20) DEFAULT NULL::character varying,
    zavezanec character varying(1) DEFAULT NULL::character varying,
    jeeu character varying(1) DEFAULT NULL::character varying,
    datzav date,
    datnzav date,
    zamejstvo boolean NOT NULL
);


--
-- TOC entry 186 (class 1259 OID 662425)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 662585)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 185 (class 1259 OID 662411)
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
-- TOC entry 171 (class 1259 OID 529329)
-- Name: postninaslovi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postninaslovi (
    id uuid NOT NULL,
    klient_id uuid,
    drzava_id uuid,
    naziv character varying(50) DEFAULT NULL::character varying,
    nazivdva character varying(50) DEFAULT NULL::character varying,
    ulica character varying(50) DEFAULT NULL::character varying,
    ulicadva character varying(50) DEFAULT NULL::character varying,
    posta character varying(50) DEFAULT NULL::character varying,
    postanaziv character varying(50) DEFAULT NULL::character varying,
    pokrajina character varying(50) DEFAULT NULL::character varying,
    jeeu character varying(1) DEFAULT NULL::character varying,
    privzeti boolean
);


--
-- TOC entry 190 (class 1259 OID 662474)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 662597)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 662702)
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
-- TOC entry 220 (class 1259 OID 662746)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 662626)
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
-- TOC entry 200 (class 1259 OID 662570)
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
-- TOC entry 199 (class 1259 OID 662560)
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
-- TOC entry 219 (class 1259 OID 662736)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 662692)
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
-- TOC entry 173 (class 1259 OID 662285)
-- Name: revizije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE revizije (
    id integer NOT NULL,
    razred character varying(100) NOT NULL,
    objectid uuid NOT NULL,
    upor uuid,
    datum timestamp(0) without time zone NOT NULL,
    tip character varying(3) NOT NULL,
    data text NOT NULL
);


--
-- TOC entry 172 (class 1259 OID 662283)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2681 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 662635)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 662322)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 662306)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 662649)
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
-- TOC entry 203 (class 1259 OID 662591)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 662541)
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
-- TOC entry 182 (class 1259 OID 662379)
-- Name: telefonska; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE telefonska (
    id uuid NOT NULL,
    oseba_id uuid,
    popa_id uuid,
    vrsta character varying(20) NOT NULL,
    stevilka character varying(30) NOT NULL,
    privzeta boolean NOT NULL
);


--
-- TOC entry 198 (class 1259 OID 662547)
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
-- TOC entry 218 (class 1259 OID 662727)
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
-- TOC entry 188 (class 1259 OID 662445)
-- Name: trr; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE trr (
    id uuid NOT NULL,
    popa_id uuid,
    oseba_id uuid,
    stevilka character varying(255) NOT NULL,
    swift character varying(255) DEFAULT NULL::character varying,
    bic character varying(255) DEFAULT NULL::character varying,
    banka character varying(255) NOT NULL
);


--
-- TOC entry 174 (class 1259 OID 662294)
-- Name: uporabniki; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE uporabniki (
    id uuid NOT NULL,
    name character varying(255) DEFAULT NULL::character varying,
    username character varying(10) NOT NULL,
    password character varying(90) DEFAULT NULL::character varying,
    enabled boolean,
    expires date,
    defaultroute text,
    defaultrouteparams text,
    email character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 223 (class 1259 OID 662777)
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
-- TOC entry 192 (class 1259 OID 662489)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 662618)
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
-- TOC entry 214 (class 1259 OID 662684)
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
-- TOC entry 194 (class 1259 OID 662517)
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
-- TOC entry 222 (class 1259 OID 662767)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 662674)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2123 (class 2604 OID 662288)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2627 (class 0 OID 662339)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 662812)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 662795)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 662711)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 662495)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 662536)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 662457)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5536-6c5a-72bb-dc48032c3a70	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5536-6c5a-05b3-548a650f9499	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5536-6c5a-699f-2835dcef25a2	AL	ALB	008	Albania 	Albanija	\N
00040000-5536-6c5a-c537-e22d00c311dc	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5536-6c5a-0eea-01a7d042df7d	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5536-6c5a-2c49-d10526b16168	AD	AND	020	Andorra 	Andora	\N
00040000-5536-6c5a-c23c-e90483f9d4a5	AO	AGO	024	Angola 	Angola	\N
00040000-5536-6c5a-09da-2f56dc0e89e2	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5536-6c5a-d8e1-8cb42b56557f	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5536-6c5a-e444-035f351179ce	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5536-6c5a-08a0-546d8c27a230	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5536-6c5a-5956-250dc7a9ca2d	AM	ARM	051	Armenia 	Armenija	\N
00040000-5536-6c5a-46df-37a1b5acb819	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5536-6c5a-b019-5b2a2247da2c	AU	AUS	036	Australia 	Avstralija	\N
00040000-5536-6c5a-284d-f950c36aaaf9	AT	AUT	040	Austria 	Avstrija	\N
00040000-5536-6c5a-ef27-1703198dacf9	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5536-6c5a-43d1-15222d80c5f9	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5536-6c5a-2ec2-3822c325359f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5536-6c5a-34fb-c5865513d43f	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5536-6c5a-0870-b126b3967cd7	BB	BRB	052	Barbados 	Barbados	\N
00040000-5536-6c5a-6b89-c6bb4431a36d	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5536-6c5a-1305-e376685ddd45	BE	BEL	056	Belgium 	Belgija	\N
00040000-5536-6c5a-1be0-f634db0c9427	BZ	BLZ	084	Belize 	Belize	\N
00040000-5536-6c5a-857f-727e2553d20e	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5536-6c5a-42f4-a23c70586ad9	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5536-6c5a-f1b4-4f30cb74a9f2	BT	BTN	064	Bhutan 	Butan	\N
00040000-5536-6c5a-a2ef-dac07c9c4580	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5536-6c5a-82d4-1abafbf7e26c	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5536-6c5a-5e3b-c4eed237f203	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5536-6c5a-23e3-13dd3cef8421	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5536-6c5a-71ff-33ce72849ee7	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5536-6c5a-2a5e-a66f53ac93a3	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5536-6c5a-cc32-6415fe15b3de	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5536-6c5a-9591-484eb793ba91	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5536-6c5a-7c4d-af9531f10233	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5536-6c5a-3611-64eaec3981a3	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5536-6c5a-9809-2fb70ccf0fe5	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5536-6c5a-c3e5-292e2949ba5f	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5536-6c5a-caf6-fc5bb7023cd4	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5536-6c5a-32a6-22d57a9b6a5f	CA	CAN	124	Canada 	Kanada	\N
00040000-5536-6c5a-2e47-04ca8386f458	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5536-6c5a-eb81-06b17177873d	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5536-6c5a-762d-072235c513d7	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5536-6c5a-e8a9-38799cbff496	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5536-6c5a-a991-4093dca40389	CL	CHL	152	Chile 	Čile	\N
00040000-5536-6c5a-cfc8-4a36e2009320	CN	CHN	156	China 	Kitajska	\N
00040000-5536-6c5a-4776-a4fa412f0968	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5536-6c5a-882d-9c0aebf81c61	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5536-6c5a-efc1-097cd050a22b	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5536-6c5a-d123-cce5450ca699	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5536-6c5a-da34-ef62f9473c7d	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5536-6c5a-7b3c-51ea1fbe2de5	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5536-6c5a-a8b5-d93b2c3f9721	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5536-6c5a-2766-0869c0f702b3	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5536-6c5a-6210-b7a59c929f91	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5536-6c5a-3442-8340d997d2f9	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5536-6c5a-4fcc-7dc38880e70e	CU	CUB	192	Cuba 	Kuba	\N
00040000-5536-6c5a-3ea2-39d8b3760f19	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5536-6c5a-480b-3ac67d5be090	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5536-6c5a-a634-5aa8b9711a97	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5536-6c5a-10a9-7d3227dbc8d6	DK	DNK	208	Denmark 	Danska	\N
00040000-5536-6c5a-0fa9-9751c9e7764d	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5536-6c5a-b180-3b3a27a5d5a5	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5536-6c5a-d6ab-05be66a75685	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5536-6c5a-56bf-9a53a6f64e78	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5536-6c5a-df94-8afd3fe7cd8e	EG	EGY	818	Egypt 	Egipt	\N
00040000-5536-6c5a-3765-0434d144b525	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5536-6c5a-345d-5f98b68360ae	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5536-6c5a-0e18-96961454c854	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5536-6c5a-13e6-d3070a333277	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5536-6c5a-212d-11b5cf710f6c	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5536-6c5a-075b-25275435fc4f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5536-6c5a-3941-61ec84f80cd2	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5536-6c5a-687c-80788ce4d259	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5536-6c5a-4589-a6ee08be6993	FI	FIN	246	Finland 	Finska	\N
00040000-5536-6c5a-dd6e-bf23834e6dc0	FR	FRA	250	France 	Francija	\N
00040000-5536-6c5a-bba9-bce636e12031	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5536-6c5a-58fb-0b3b488c268e	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5536-6c5a-c480-22dec3229985	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5536-6c5a-f317-23b5b59dcd0e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5536-6c5a-7c10-2dc5b51d2e66	GA	GAB	266	Gabon 	Gabon	\N
00040000-5536-6c5a-d1cc-0e7c50abeba2	GM	GMB	270	Gambia 	Gambija	\N
00040000-5536-6c5a-999c-0df86278f61a	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5536-6c5a-92fd-924a44da070e	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5536-6c5a-ef5e-c9fbfb73eeae	GH	GHA	288	Ghana 	Gana	\N
00040000-5536-6c5a-6269-04b20a90ff47	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5536-6c5a-32ad-ea3d1eebf7ce	GR	GRC	300	Greece 	Grčija	\N
00040000-5536-6c5a-4a7f-747901f8e9cc	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5536-6c5a-4ffc-2107604b94f6	GD	GRD	308	Grenada 	Grenada	\N
00040000-5536-6c5a-2997-73f2f7d2a07a	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5536-6c5a-40f8-1a76cc6a16f3	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5536-6c5a-dab2-ddd97d5ba494	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5536-6c5a-665c-213c7f124de5	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5536-6c5a-87cc-4f81749f9da6	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5536-6c5a-4259-777a7df0175c	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5536-6c5a-7270-2129a2e14fff	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5536-6c5a-c0c6-077a38210f62	HT	HTI	332	Haiti 	Haiti	\N
00040000-5536-6c5a-b134-c7f6ec5f0dda	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5536-6c5a-cb77-76d351476154	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5536-6c5a-b48d-03e127bbe296	HN	HND	340	Honduras 	Honduras	\N
00040000-5536-6c5a-8def-37c915ec814d	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5536-6c5a-2950-e0ce7a78f013	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5536-6c5a-235a-bd4820c50fd5	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5536-6c5a-5614-85e6944b1c01	IN	IND	356	India 	Indija	\N
00040000-5536-6c5a-15e9-07b9cebe0806	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5536-6c5a-4dfa-d8c350271869	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5536-6c5a-573b-38199bd0578e	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5536-6c5a-ccb4-88fe4276fd88	IE	IRL	372	Ireland 	Irska	\N
00040000-5536-6c5a-abe2-8a91e0ef1ee3	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5536-6c5a-29d0-bb2235be2c39	IL	ISR	376	Israel 	Izrael	\N
00040000-5536-6c5a-25ec-5afe91c3f859	IT	ITA	380	Italy 	Italija	\N
00040000-5536-6c5a-cbe3-7bc10dc6c016	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5536-6c5a-eecc-b30bd6069df7	JP	JPN	392	Japan 	Japonska	\N
00040000-5536-6c5a-7640-9e9e10ed759f	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5536-6c5a-10ac-a728588f5cfc	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5536-6c5a-457f-d6d7dd658161	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5536-6c5a-59f2-277e1a54d80e	KE	KEN	404	Kenya 	Kenija	\N
00040000-5536-6c5a-c29e-69158fcb1cdc	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5536-6c5a-769f-0f867d2b0596	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5536-6c5a-8fad-8d4d64f850da	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5536-6c5a-a0e8-9f4f0c85c04c	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5536-6c5a-01a1-a3c790796fb5	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5536-6c5a-2ed6-036ac7e60950	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5536-6c5a-6151-c9cb212f2a84	LV	LVA	428	Latvia 	Latvija	\N
00040000-5536-6c5a-ad15-17ea41310608	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5536-6c5a-5232-cd35a0ecfcc5	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5536-6c5a-51f5-226335d322d3	LR	LBR	430	Liberia 	Liberija	\N
00040000-5536-6c5a-eaeb-4ed1caf28797	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5536-6c5a-d8d0-61581f8afee6	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5536-6c5a-1b31-9aa479e2d5e3	LT	LTU	440	Lithuania 	Litva	\N
00040000-5536-6c5a-0bda-dd8b2c4889dc	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5536-6c5a-80e4-329f03f2d753	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5536-6c5a-fc58-9c46e28ff73e	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5536-6c5a-f696-8c8a798206d0	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5536-6c5a-dc2f-f8f1bf1669a8	MW	MWI	454	Malawi 	Malavi	\N
00040000-5536-6c5a-33ca-5dd948a1b45d	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5536-6c5a-1fff-78a78b017a4f	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5536-6c5a-3ea0-536b515574c8	ML	MLI	466	Mali 	Mali	\N
00040000-5536-6c5a-6dd0-e49e1d241963	MT	MLT	470	Malta 	Malta	\N
00040000-5536-6c5a-76ac-50309bfe57ad	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5536-6c5a-a292-5ac32517191f	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5536-6c5a-fb19-68b8454314d7	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5536-6c5a-637e-6b9a1904bf50	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5536-6c5a-c396-4ecacf324439	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5536-6c5a-1b84-3e87e7f67789	MX	MEX	484	Mexico 	Mehika	\N
00040000-5536-6c5a-cfd0-b5aea0f589aa	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5536-6c5a-9579-8ad3c104e882	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5536-6c5a-f4e2-5297dfeee9fe	MC	MCO	492	Monaco 	Monako	\N
00040000-5536-6c5a-9f2d-b483325f3e71	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5536-6c5a-842f-d9aebcbbbfa1	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5536-6c5a-d131-150426aca945	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5536-6c5a-7e32-c614dafbf6fe	MA	MAR	504	Morocco 	Maroko	\N
00040000-5536-6c5a-0b02-31246086a1e8	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5536-6c5a-c21b-232d674847af	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5536-6c5a-236e-40e9c8107add	NA	NAM	516	Namibia 	Namibija	\N
00040000-5536-6c5a-6060-6e688c2f4e2e	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5536-6c5a-6387-6c723b4932bb	NP	NPL	524	Nepal 	Nepal	\N
00040000-5536-6c5a-f7a4-52163e9cc5af	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5536-6c5a-8585-4a061ef2f209	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5536-6c5a-49cd-7f6606c7e4de	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5536-6c5a-9cd3-d230425c30eb	NE	NER	562	Niger 	Niger 	\N
00040000-5536-6c5a-b770-45368825fe1f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5536-6c5a-f742-72a996a1128f	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5536-6c5a-0e3b-2bb77d0fbd95	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5536-6c5a-9240-e3f2951434f5	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5536-6c5a-63a4-6ddf5b8740ed	NO	NOR	578	Norway 	Norveška	\N
00040000-5536-6c5a-599f-5b38bc6c5c5b	OM	OMN	512	Oman 	Oman	\N
00040000-5536-6c5a-196e-cb0f98d65b05	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5536-6c5a-f272-70a4eb79ff75	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5536-6c5a-8596-42ca9353e2a2	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5536-6c5a-195d-68c6dfa417ee	PA	PAN	591	Panama 	Panama	\N
00040000-5536-6c5a-103b-cd8bbee4ced1	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5536-6c5a-f78a-ab04d67033d1	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5536-6c5a-f9b3-90be31fc4af7	PE	PER	604	Peru 	Peru	\N
00040000-5536-6c5a-8d59-15d587acf0f1	PH	PHL	608	Philippines 	Filipini	\N
00040000-5536-6c5a-5b75-30af89ad04be	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5536-6c5a-3f3a-251b3a0765e2	PL	POL	616	Poland 	Poljska	\N
00040000-5536-6c5a-7ec3-00607821729a	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5536-6c5a-33a3-1bf5292617c4	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5536-6c5a-d711-15359fdfff00	QA	QAT	634	Qatar 	Katar	\N
00040000-5536-6c5a-95ab-6b204a02357b	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5536-6c5a-0f9b-19a223f0ca90	RO	ROU	642	Romania 	Romunija	\N
00040000-5536-6c5a-d099-8606535637ad	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5536-6c5a-34cd-9dfc8c03e409	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5536-6c5a-ca29-3daa57851f4b	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5536-6c5a-1032-71822667e6bf	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5536-6c5a-ffb7-761fb6accf55	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5536-6c5a-af03-c964f2945cd5	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5536-6c5a-eef9-246d06b43fe5	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5536-6c5a-12eb-289766c79742	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5536-6c5a-2b50-d89b69fd661c	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5536-6c5a-1f28-5f2919f47c2e	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5536-6c5a-c836-1223eb1e08b8	SM	SMR	674	San Marino 	San Marino	\N
00040000-5536-6c5a-8975-4c8d35ac34df	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5536-6c5a-5d2f-08bb13ec8b3c	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5536-6c5a-f1d0-05218a65256d	SN	SEN	686	Senegal 	Senegal	\N
00040000-5536-6c5a-f5ab-e5a006d3f29b	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5536-6c5a-1207-8732d62c74f1	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5536-6c5a-6637-7c36b10b9abd	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5536-6c5a-4daf-e116c898f934	SG	SGP	702	Singapore 	Singapur	\N
00040000-5536-6c5a-9c88-be2f52f5c29b	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5536-6c5a-2fde-e4aead104b55	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5536-6c5a-813d-690d850a47f9	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5536-6c5a-0da2-44b1a82ccf07	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5536-6c5a-e92f-15f5c8e8a5ab	SO	SOM	706	Somalia 	Somalija	\N
00040000-5536-6c5a-2006-ab6c6e34d130	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5536-6c5a-01db-ac162bb938b0	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5536-6c5a-6cb8-5ea950d78f15	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5536-6c5a-4d74-a38fa8c8fe4e	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5536-6c5a-eeaa-31fb51f42095	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5536-6c5a-7e3d-43183f81939a	SD	SDN	729	Sudan 	Sudan	\N
00040000-5536-6c5a-cd89-f0f36cf585d5	SR	SUR	740	Suriname 	Surinam	\N
00040000-5536-6c5a-8ed5-fb6d3bc9321e	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5536-6c5a-7cb2-e8b497a8b8df	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5536-6c5a-551f-9baad2f16ac5	SE	SWE	752	Sweden 	Švedska	\N
00040000-5536-6c5a-e08d-98ecf5f12d9b	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5536-6c5a-f8c6-75e8c86f4e19	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5536-6c5a-5beb-14eee587dcad	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5536-6c5a-e18e-24d6a6395289	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5536-6c5a-fdb6-634f1fda59ad	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5536-6c5a-6ee2-43b5a0943d62	TH	THA	764	Thailand 	Tajska	\N
00040000-5536-6c5a-35b8-3af60f48cfe6	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5536-6c5a-7df8-93b8a02e6d7d	TG	TGO	768	Togo 	Togo	\N
00040000-5536-6c5a-8c84-ecd0a810338a	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5536-6c5a-44cd-c894fa8b7728	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5536-6c5a-17fe-350139c3bd24	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5536-6c5a-6fc9-f7936ff8d982	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5536-6c5a-3905-d63f77dde4e8	TR	TUR	792	Turkey 	Turčija	\N
00040000-5536-6c5a-813d-2bb255cef6a1	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5536-6c5a-df9e-ade1b3fc7292	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5536-6c5a-71cd-a5c57df17e79	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5536-6c5a-1f60-fa0a5096c930	UG	UGA	800	Uganda 	Uganda	\N
00040000-5536-6c5a-0273-15df32cb6f91	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5536-6c5a-0d7e-ce6db3777979	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5536-6c5a-63d6-6dda4892ffaa	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5536-6c5a-5856-0c07ced750f5	US	USA	840	United States 	Združene države Amerike	\N
00040000-5536-6c5a-0bbd-ba5d6c3015bd	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5536-6c5a-ba8e-4e2f22b869ed	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5536-6c5a-0ea0-ff8d1d4af398	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5536-6c5a-1940-21e5409a4264	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5536-6c5a-6412-8b87fc652999	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5536-6c5a-4100-123794b4954f	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5536-6c5a-11af-76dcd9c3e2e7	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5536-6c5a-95a4-9997071d7828	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5536-6c5a-dc62-2761b10badf0	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5536-6c5a-a735-96125b027aff	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5536-6c5a-eb4f-7dcf87403beb	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5536-6c5a-0e2a-fcfbfc5bb27d	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5536-6c5a-1180-6c4f3e15332c	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2660 (class 0 OID 662661)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 662482)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 662530)
-- Dependencies: 195
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2618 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 662579)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 662604)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 662433)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5536-6c5b-f0cc-814db38d7508	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5536-6c5b-057f-40929bf2a337	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5536-6c5b-7869-93ba355c1802	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5536-6c5c-47dc-067ab8b7fcd9	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5536-6c5c-6995-ee952d0a5d43	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5536-6c5c-781c-eb8ad753a623	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5536-6c5c-d314-d4f1d7d71c3c	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	test3 le privzeta vrednost
00000000-5536-6c5c-b646-f756a1dbceda	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2628 (class 0 OID 662348)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5536-6c5c-0772-d21a39276e2a	00000000-5536-6c5c-6995-ee952d0a5d43	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5536-6c5c-05ce-61cccf1dd503	00000000-5536-6c5c-6995-ee952d0a5d43	00010000-5536-6c5b-729d-b07449e200f7	a:1:{i:0;a:2:{s:3:"key";s:1:"z";s:5:"value";s:6:"zelena";}}	f
00000000-5536-6c5c-bcfd-9c76aa5b8000	00000000-5536-6c5c-6995-ee952d0a5d43	00010000-5536-6c5b-adc2-28765478d6e4	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5536-6c5c-9ab9-8834b85fa377	00000000-5536-6c5c-781c-eb8ad753a623	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2629 (class 0 OID 662359)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 662404)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2624 (class 0 OID 662313)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00020000-5536-6c5a-da82-842c0b6b724f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5a-43c1-a12208f3f643	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5a-91a6-118de93d3099	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5a-56f2-bada6400280d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5a-5e16-77db67e8fcd2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5a-229e-a232211c74d4	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5a-1693-36d67ada6a5e	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5a-e4ab-b69b173f6a58	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5a-4f2b-2aac1ffe767b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5a-5298-534416b11ca2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5a-7d47-8956a6e1df53	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5a-61aa-9f78ef1f0918	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5a-4435-506f7750ce77	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5a-4c6b-41a6af384cb1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5a-241c-eeefa1983641	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5a-44fe-ac675a231f76	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5a-c59b-33c02a13a1ce	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5a-0cee-dc8ef4ea02fc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5a-e02e-9bfb3535e5ac	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5a-bdd5-3bd3f1548c35	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5a-4dc4-739e86cdcb37	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5a-913b-ddfdd428cc56	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5a-84cd-5b84664ec433	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5a-045c-c108e9749ab7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5a-d173-d8f2f4cb2944	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5a-bf99-0173357f14fa	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5a-d5a1-5737bbddc782	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5a-434e-a0c67e2eb159	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5a-3fc2-c07d4a956cdd	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5a-3115-194a37401688	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5a-82fc-a836ba5f8561	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5a-b852-aae6d19e691f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5a-285f-9d1abd517270	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5a-b359-c505431f7825	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5a-04c9-af0000613419	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5a-f97f-cb1f8a242a75	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5a-de1e-fef561b072fd	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5a-58fc-3e20f3f5c5c3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5a-9ded-230d01edd5b9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5a-13a1-5bc963127535	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5a-45cd-85eca80e7a7b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5a-0b58-cd583a916333	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5a-db0e-ae6f6820f1de	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5a-7a7f-f37c9824fb31	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5a-78fb-4c5453583b09	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5a-fef1-d3b404362da5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5a-bb69-92d32082601c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5a-efe9-56e693d07ada	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5a-8df9-4dc998066fe5	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5a-6bd3-9ae7d3b8729e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5a-7d1d-5839eeb34ce0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5a-66d7-1a199d5cde96	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5a-629c-60694f7da868	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5a-b582-f79989df16a3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5a-d6fa-794264f086b1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5a-3690-54dc2190100c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5a-5f85-3bb74f179c97	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5a-2be2-fe9bafa94f49	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5a-3335-6d672f722c73	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5a-9977-3b5ce1513277	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5a-7275-080a3f87c56d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5a-e731-1174866e5ba2	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5a-1e04-caf1e0a8dcbc	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5a-d184-24f3c9688d0a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5a-8176-7876560455ed	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5a-aea6-d02361e0a573	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5a-9261-5b38b8e5f3d9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5a-a0ae-f73113693c82	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5a-1165-31eded289144	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5a-95da-bdd8072709ff	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5a-fcfb-b2995cae7569	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5a-be23-7bbc12d436da	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5a-a56b-fd6bd3a535c5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5a-5b24-7f94a8cb8067	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5a-a1d9-939d58f71e97	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5a-5b51-418ea9f3319a	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5a-b907-7bc78ecc60e9	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5a-c84f-ed139faaca5f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5a-d564-c5337f2467f9	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5a-efb8-c3b73c45fb78	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5a-f6f9-cf6072edb3e6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5a-4017-ce1b70db34b4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5a-60b5-80cb8752a790	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5a-a298-db0bbbb910bb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5a-4e8a-9def719e4cf3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5a-b338-377632bded41	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5a-6a1d-16b3ac381a74	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5a-e37c-0a4f88b98021	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5a-295d-be2d0412f4a9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5a-7f73-4b939cce010f	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5a-8226-7b1ca139937b	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5a-4749-836c9743267f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5a-6dd2-3c789fb897f1	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5a-529e-d5086654dedc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5a-bb23-e13c3f1ce734	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5a-d2fe-b924f6f97961	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5a-089b-38c5c1a2bedc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5a-dd60-c26e4b4520ae	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5a-13ef-1b5e029f927f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5a-3e98-beaeac143852	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5a-f922-1ad7aafcaea2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5a-eaa0-054088991a19	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5a-be53-646d70c4671d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5a-14f2-76a321aba18e	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5a-4688-764e7fdc1310	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5a-150f-1f168a6d904b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5a-731e-1a0195d99d0f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5a-fe05-408969389f32	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5a-ed77-44d514988848	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5a-e427-9a1d8aedf5d2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5a-a992-29dda8b1111a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5a-f3c5-442f17d25dfe	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5a-1bf5-072909f14876	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5a-c8ca-5e0d2f713853	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5a-4798-21723882cad9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5a-b29c-b7a4cf0267e5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5a-8d5c-f65358990c28	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5a-9f33-e8c671b8937d	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5a-902a-cf10f076d62c	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5a-1ca3-1625164919d2	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5a-54b7-058e397666e7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5a-80c7-755f70875d46	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5a-1c8e-32f1f230982b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5a-f70a-d0d2779ab0e7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5a-281a-26ddb03d8210	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5a-ac2f-7b709ae40346	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5a-09d9-4002db43ac57	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5a-e8a9-52c8996d1b68	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5a-12e1-a9f953abd822	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5a-8392-1ee4858b089f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5a-2214-60379f45d131	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5a-11ef-07fc52c9f10a	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5a-311b-3e0f2809376c	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5a-e2b4-226e427e2c3b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5a-318b-75d8e930d135	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5a-c703-6eb1673b9eae	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5a-0b1d-acedf4f897dc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5a-3a92-cbeccbaa2eca	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5a-5a31-3bfb4b0c15e0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5a-c667-67a004667d7b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5a-199f-ee17f519e7b0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5a-f2ae-231d4eb0b368	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5a-9017-539e33591152	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5a-f241-8052821d17c6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5a-7826-5715aef903f1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5a-0056-214252503161	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5a-61ff-2786ccb8cd95	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5a-5ea8-9e7e8966f6a4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5a-5e77-0f9bbb3902fa	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5a-e988-bc87585e3c6c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5a-58de-4f4954f3dbfb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5a-3562-83f2a8a52b96	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5a-d64b-d9c11a9951b3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5a-d3c7-8814e9a802fe	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5a-5efb-da514440ee75	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5a-8651-5a08503802c6	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5a-8544-f3d2b6f23105	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5a-ab33-48f1414d9141	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5a-8d36-543046feb232	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5a-09dc-ec06e0b350cf	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5a-eaf4-8e3cd6807d95	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5a-a42f-eb8901e78a77	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5a-55bb-1b64a5ff0cb5	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5a-8a73-e6ea48e06d44	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5a-bc4c-047386bfac5e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5a-004d-62af8d0cfeb3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5a-366b-cac45b14f9c1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5a-d469-03204fc25cf6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5a-0fca-94b223f4e615	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5a-2d01-c8eeb5e1f5a1	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5a-e33b-31835d5b9114	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5a-5b75-166a1bd8a555	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5a-7fb9-bea05c1adcc9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5a-c4b9-f1920e986040	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5a-6c82-fddcf76a1843	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5a-e26d-19b10da066d4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5a-60ce-92c84a34643e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5a-2375-7619b378a77a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5a-1fd0-9609fe84aee0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5a-e145-761b5aaa0a31	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5a-83e6-e297ab1fa431	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5a-9ac9-3d2c6b6bb06c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5a-d71f-7b5690b17776	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5a-cf3b-1a60159fd630	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5a-e317-4c52edb38e15	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5a-85a1-e7c958a7ac89	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5a-236f-3b5ab0dcb8dd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5a-2c70-b0f8c1172dd3	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5a-1b47-fa4eb551ae3c	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5a-085e-7e2fd6160c9d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5a-fca6-57bb9b214d12	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5a-e7c0-7c99b4aabc62	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5a-4959-e0dc997e3d52	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5a-fba0-e976776b7843	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5a-a2d6-bc2b3ddd244c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5a-33c8-9f21a51a7c6f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5a-35e1-599f9089e82e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5a-f2ec-020f811bb46e	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5a-741a-67f594a3d611	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5a-e888-050260f09933	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5a-9a53-195314acaf49	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5a-4c7d-5c3f529e2393	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5a-2121-09d68d019795	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5a-4a0d-610fbd4c5154	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5a-02d8-eb5ddefc2e51	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5a-a879-5da28dda1fa4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5a-7e60-800cae41bdcd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5a-c1c9-9282eac838e8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5a-9b7c-ec5e02223929	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5a-7ac4-c20575c2d025	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5a-0a2c-93bc198e4763	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5a-642c-8ca128360e3f	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5a-9ab4-5265407fe4b7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5a-5d90-d5db6f623b40	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5a-6355-2d9df84c1ca9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5a-a23e-66ee68e0f48c	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5a-a04c-6a3eb081229e	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5a-a83c-228399cf8842	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5a-c946-891801ec0cd7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5a-abac-215ed6a82750	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5a-a78a-38451052ee39	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5a-834f-7e657a7c3e7f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5a-23d9-312cca3c7607	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5a-03d3-b443fa45756e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5a-120e-cd342cecfe41	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5a-6ac2-0067a0c46a81	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5a-21f0-e4fd5d067545	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5a-17ab-c0b7e87d6489	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5a-c4d3-2f34d65033ed	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5a-304c-ee3b40ced86b	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5a-bddb-3aa6b17416c8	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5a-3e9e-f3e326801994	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5a-02d0-20fc8ea484de	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5a-2835-64e816155936	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5a-3a00-ad74dba014a8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5a-5b50-96ae07ca5d2a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5a-2efc-b63cbc958ec4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5a-b550-7b8b899d146f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5a-7847-9ca97c12fae5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5a-3bfa-047fbdaeb3af	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5a-8db9-b69af6808767	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5a-1f59-d614ba3c33e9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5a-1107-6df823d9a600	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5a-b910-6e6db2bb4c8e	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5a-43c4-28c561cd7013	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5a-0c13-b0ff80af10b4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5a-b7d2-dee383389078	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5a-784c-de772705aa74	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5a-43b7-b870e1bf684b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5a-8b3d-93b1307c7ec1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5a-b835-61969ec6312d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5a-1e6b-b3ac8706cd6a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5a-4b70-2bd1884b138c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5a-9539-2a6526e3e709	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5a-b414-16a89242aee8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5a-7652-b4cbeba7bc22	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5a-b976-9002eade086c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5a-a373-1cb34242498d	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5a-7c34-cf5f5524f84b	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5a-a39b-9b0db8092fd6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5a-2f34-13b25b762ec0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5a-3c91-3d9ad6202903	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5a-6872-4d7f49851b9b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5a-12cd-657f6bca2269	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5a-c168-b0ae99b79937	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5a-3aed-4c9f1fb69239	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5a-7ba6-84d5f8095813	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5a-f9c2-92e9fbc975d6	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5a-1b83-fdd02fc446e4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5a-fffe-4fc405941713	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5a-9a83-228213e8d371	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5a-93f0-379c2510474e	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5a-7ca4-d99db4bd8fa1	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5a-4b3e-18507b3cbb8b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5a-4030-476047afaed4	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5a-ed4b-aaa7bfb37240	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5a-9c04-42175648e1ee	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5a-9431-6b5057498e06	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5a-5388-6ec4745deccb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5a-657a-98ffbfd122b8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5a-b7de-d63286758013	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5a-d9ff-93c2e78b099f	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5a-de40-1eece58dbc03	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5a-e25b-955cdfb6cac5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5a-0871-1aa21bcba16d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5a-2497-3625b2424f3e	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5a-a907-31a31a293518	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5a-0778-05b6f61701de	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5a-8a2f-75c3465e929f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5a-73c8-6fe03f879248	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5a-c4f4-3bdc745ce4ed	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5a-2c6d-144fa02d19c3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5a-976e-3062a9c54df3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5a-45a7-09818f5cabb4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5a-8702-e0f68397ace2	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5a-4851-282c2f0772c1	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5a-47c0-6480e94bd6c1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5a-bbca-8cb96f22c78a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5a-c8fc-06a4758ebe41	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5a-9521-fe867ce28fb5	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5a-b4e8-539b96683e70	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5a-6d6b-14773590c9be	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5a-7eef-0f5997379f49	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5a-5063-e49af92f39c6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5a-6012-887910ac421e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5a-4122-cd1c1e16d988	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5a-26e5-e133163d719c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5a-5135-87651d19d0d1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5a-1d94-7f410c08cbf7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5a-894c-ceb1ec7ada66	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5a-d398-ec3d4c363fce	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-5f72-a8ec453597d5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-dad4-5189192c60f6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-9714-ebcc66cd9709	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-35bc-930fe32f3f60	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-09be-8f3ebd5fd4fa	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-e42d-5126ae55a9ca	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-0745-6b9d33d63fa7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-e9aa-205e12b7df34	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-8bda-1546ba67e654	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-d0d0-2c94f89a7060	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-7aa6-2252bfa20db6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-11fa-db4e7f54fffb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-43f0-b56b69454373	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-b26b-26c71a9f80df	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-2baa-a26d8ccfa7fd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-8b91-d93176888702	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-1155-c6da677600b5	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-cad3-962ca9cd504a	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-4e1d-7d39ff8da26b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-82fa-d9ba1537a33f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-2449-84fa096802b6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-81a2-b70734b9d75d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-d956-bda498fd9fee	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-2dd3-a383da788801	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-e846-54afbb67a0a6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-b945-725be3459990	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-14ee-6db3493e0d14	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-6f1b-ccc7a0dfbc8d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-c824-314c5ef4a41a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-e47e-3594b2546fc7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-d59f-2764fb81cb4d	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-5580-14e5469199c3	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-fa70-bcb339ce1a2d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-4b7d-82b274bdf6ca	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-92c8-753a9433ed3a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-05df-c6c7a39b01a3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-e8cc-f073aec92272	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-0e30-9f0319353ae5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-80b2-19a980ecc9fe	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-7fb5-69ec2c62ec27	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-6823-0795d4162498	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-3d4c-114e1cddaa4e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-f60f-ab823c54eb7c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-2bc6-78417bcfc2c0	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-14ca-79061c094890	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-d739-517f35708631	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-269c-cc1703d14615	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-de65-5b13fc4c4f0e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-1128-7dd550985905	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-b758-eb3e8585b6ca	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-9e39-ef6022ce4224	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-8c19-b098c86ab808	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-76f2-853db5bb4780	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-8e45-6d02db32543d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-b9d8-8a8f6bf78da7	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-9e73-4a934009e39e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-50d3-604ca2f6d7fc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-4cd8-0d2fa44bcc43	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-1f95-d92de9453075	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-f92b-e6296cc092de	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-f6b8-3f3efe881e59	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-81bb-473f0ade3fed	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-98ef-552713c45e68	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-1d20-54172bda882f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-df9b-149068d89b40	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-fdcf-cedd14bd9ced	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-59bd-df0641e334c3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-8510-153564475298	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-fd36-6894e03d6085	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-416a-be75ad4fdea4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-5ac8-3652df32ad63	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-305e-2dc5c9423eb6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-94ba-a5c821c4f210	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-383e-8bd16094b956	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-88f4-f6abd9ffdc1a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-8faf-1dadabd0f10f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-d1b6-3c101839975d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-06ae-0bc82cedaa9e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-c8f3-3d3de316a796	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-5034-3339a8f8c5e0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-60df-8b5b705b5aec	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-e8d5-470a61f56720	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-4772-902236ee9ded	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-039b-62e950756d9e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-9b4a-1a9541777c64	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-b1b5-ad0923a0224c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-0dc9-0b7d97dd241b	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-8423-9df352ae0708	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-8305-600f6740d8a8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-090e-7225e103c4b1	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-8ba7-405d7eae6fe4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-c2e5-68241a334949	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-3fe5-27179c3a147e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-f8a3-0e7361df8cd6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-b84e-ba4e2b4591d9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-34cc-2feac06af97d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-e3ba-19ca76a81ab2	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-019f-376efcdffc89	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-1074-d43875cec93b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-b219-a64801e56158	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-c600-903c62151d1f	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-c69d-98952079a964	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-12b9-18724bcd8f75	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-182b-15dda4d69423	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-edd2-496c9017a3b5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-3449-3d8fc6aa684b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-233d-c887a36e96ec	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-0fb6-882a1e45d063	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-30f3-039e659aae0b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-7591-07fd566f228b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-51cc-4e78721a84ef	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-07e2-f18750eefd93	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-5646-5e8d715bb2c3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-ad77-df873af00a83	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-8686-ef950edaa5d5	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-9389-bf65cd1987c4	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-4bb3-129b47dd8a04	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-73e6-d13abfb40b05	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-0a6f-a115146294a3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-cdab-2ea002e364c1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-3901-ae6057151809	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-39b9-d820b8563caf	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-44e2-67180e269b65	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-ec29-55444859df44	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-4fb9-68a3cc9ae893	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-b717-570e1c9d7b49	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-7e4f-a9a55c56bf38	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-be73-7ef8564d72e7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-81b9-7acd740e79e9	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-8206-a383521c69af	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-6e48-e0f4ba624335	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-59c5-2289291ffcfc	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-721d-d471793184bf	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-6244-af73a11352e2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-f3fd-92661d8cac60	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-b02c-83b287cd5ed1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-f7f4-7a2a36e3d39a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-28cc-279e29158d1e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-7f08-e093e2d84f7f	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-b6cf-02e61e32027b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-3722-e5568895a893	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-af9d-ac5fb7289036	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-9106-68362015c455	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-378a-42d68e3eb783	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-81f1-c6b9005576e4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-e22f-9a0c9f5629e7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-0d44-0e1c09c15fdf	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-c1b1-01649ab5cfac	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-9a49-794cfa46b7e2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-c1c7-e6a47ddeb5c2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-c982-791eacf57e67	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-45c0-e6b53124e1be	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-c03b-08a76f340d28	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-d618-08c93193baea	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-e147-741158256220	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-e870-44ad23a9263c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-6ed7-52a263f5f165	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-4953-93986c2b1431	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-cbca-2e19eec761b7	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-ceab-4892a67a35f8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-116a-26bdfe97e7ab	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-6aad-ae3994900b60	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-f2b6-b434aaaacd72	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-7a65-4cf5632ac621	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-f813-b0ff3ce90ecb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-ade0-a0c41de07284	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-1612-555aa48b52da	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-09d0-07adb89ecf00	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-b4ad-431ac2e86b96	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-f374-3af108b00fdb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-d1e2-54c619ce12a8	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-fd5c-b8e9258e52d2	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-26b7-a2ee8e192ee8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-5944-fa80353b8b67	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-8337-f3511dded564	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-4195-8270be120d9d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-9160-88d57f586a46	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-5065-2e5fa5301a58	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-fe26-c16e2deb8629	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-d703-524e4fa9d187	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-2cdd-effbd8e15329	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-c536-7c7ae50e5bcc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-f246-bac7e56f6cee	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-8c6b-797a07f05c44	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-fd3d-9ba78241e650	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-6a15-7ff0e4db786d	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-8e10-b382557dcde9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-14cc-db899a44c1dd	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-2700-56567290f24e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-a355-fbe2cb41a8ee	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-eab0-c25433b9f841	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-d4b3-9780dce8c594	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-f87a-f5879a286360	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-a893-0fa034683f02	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-5bbb-5f3be6b95e8c	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-a189-bca3d3e94896	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-e6bf-cc54a8321d9f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-1513-9d02c36bc4ed	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-2a44-7d1436033993	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-96e4-d6a05d5c5d3a	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-9dd0-16da2a5474e3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-4768-c29681eb1ffa	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-558a-d201b2cf86cf	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-7000-15541ac523c4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-8edd-b157ba527d72	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-a8fd-f20ddc5dec47	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-91ee-b5baac1c4ab6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-95cc-de89586876b8	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-2cd7-7b353e549f5c	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-dc9e-18c9056b5713	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-fe21-f28246578608	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-c14b-369ff769ce87	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-357b-899c092ea5ee	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-4cfb-75ced0070358	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-952e-fb0b9c3a2909	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-9648-c117518adb83	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-3581-ed64eef25b39	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-fe73-cc868c4069b0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-fde3-da856167fda9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-7db6-da8b772a1e35	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-02ab-98085dc3f8f0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-1a6a-f29ce65d12e3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-9786-0a5d0b931008	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-b42e-93714f9ecf6d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-2c91-2318ed9e5484	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-c4dc-6ba24734a350	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-5006-6bab2f418d7b	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-5724-a0a0912bdb7b	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-ddc2-66c70145eb10	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-e548-0ae401de1c1d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-4bcb-00d10a62bc36	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-7f48-1f6ec9345afb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-7034-ff7268a6ea19	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-4f5c-6a1c4896414f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-01ba-109df51c4340	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-a7a8-5f252c7206bd	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-121c-6f2858b1c170	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-f6bc-903621bcef3f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-b4ac-8587ebd8c7ad	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-825f-b1a512610e44	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-ac0d-325176049210	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-26bc-af96c151d092	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-db65-3e96bd5d1aa3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-39f6-3a779a16b0ea	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-70c1-e356fda2ed69	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-bc24-3d49aaa4bab9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-ee96-a393c496b7ac	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-dbaf-c505d14cc745	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-1360-54a96afcdbb7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-969b-401e3988d312	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-a594-16aaacb93ab8	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-3f10-e5ff3ba20afa	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-eda0-64cabadc68a7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-172f-5c408c9521ed	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-f8ce-5ec047bbec34	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-a0a1-166639280843	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-aa12-7a37ea06cead	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-8e2b-e0ee26e2caa0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-9c40-281d6572d357	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-f5a8-aa199783a788	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-d8d7-c4f8b998ba99	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-f122-d34edd9321ea	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-9deb-a416aa201dd8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-4813-12440a807903	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-f4b5-3b56d4e47eb9	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-2cde-84923a9fafaa	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-a0c9-cbe3d3a3149d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-f002-8ca98bade845	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-024e-6aa6548819af	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-a822-8019b65e1126	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-2f07-9a513f7da420	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-e555-3943fc4d984b	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-b976-d98dc48001ee	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-2856-59cd099438a7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-651a-859c4b0a48d5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-dfcd-20012a9b5705	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-6ffd-4bcb5571c60c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-1324-aa426fbce54d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-63d6-8b89de240033	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-a8b4-fa895bf99bc3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-88cc-8ff614f418d9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-b955-2b8267acb96c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-7e0e-dcda98eb8482	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-fa60-31db6aa9dbb1	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-29eb-3a15ed1d3fe3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-cf1d-381c216895b6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-7a01-a59fbbf69bf7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-2b25-60c5c7953091	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-f4b5-eb94ccefe608	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-4684-b9b4653c4070	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-78e0-7def1b9ad961	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-5e3b-8e8aad5b5810	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-d6c7-1c16a2abc9a2	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-d6a9-6e9c7f583d16	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-4339-615a5fa68314	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-1dfc-fb326ed68583	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-30f6-bcbe71df0a4e	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-d682-48e47cabe4d2	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-feaf-565d6e9d7b32	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-f8d0-962893c9c293	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-5bbe-afef001ae275	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-8fea-55c48133c592	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-6c98-138f016f709f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-929b-1675a0e3552d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-058a-e9d155c1ca93	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-d2f8-409b30c78522	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-c77b-00c51dc624ce	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-56cf-a12addf74abf	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-a79f-5679c2ca4970	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-8999-3c18f69ee931	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-df0f-9e92c5f607a3	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-1225-1e25c0f0c96a	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-6280-e10dbd954007	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-b16e-ce820d1e1a5e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-5a6d-a0c74434f7b8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-29ed-75d5ba196b97	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-8a67-f3606acbc9ca	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-ca5c-594739dbce7f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-459c-18e540d83b28	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-e0a4-4019af5cce03	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-9a87-f9208161208a	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-96eb-0c7dbb04baee	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-48e8-74a356e5873e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-a961-3708e4fc6eed	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-9b17-dc3244d7ef79	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-34ec-4be399bad37c	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-5018-b27fa5272f5f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-7275-5acb5f1a4f86	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-3ca4-92dd3e158ac1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-7736-915ab5eb8ef2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-c1dd-2ac63d1ce374	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-6fa0-0eae2049780c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-7fb8-ef4bce1e4009	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-e115-920148b6fed9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-b472-8d9dad7824a6	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-2de7-81c6c49b0c15	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-4b4b-21fb225ef185	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-9d6c-584b2adc7044	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-c044-4c558e57f33e	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-ab17-f97bad538728	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-f8c9-a056c77edd45	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-be28-4e82b356e17e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-3611-3a726e7ebfca	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-e699-a68025612389	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-bf72-ec9aec475ced	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-1d42-2be7bf01a3d3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-8865-9499dc9cbcf2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-8c46-712214854a3a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-ffb9-a11955215c0d	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-ac76-f08e9facef82	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-8c37-67d9be7ebf7a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-c8fe-c73aa45096ad	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-53e2-2f66cd7b4181	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-09b4-ddfeea3b4a7d	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-0c83-a899b9b4fd29	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-6f5b-c45a11f27376	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-78fd-7d68a5066f70	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-9192-bc35b7121f4b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-9aa3-86f1a9ee2ea5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-55c3-a24426ad122e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-1d23-c8d1058a0a23	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-1244-e61dabff07f8	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-d453-0a963da59d18	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-f39f-2f7fecba8edc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-503a-3bfc69749edd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-6a2d-72affa1737e5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-3ce1-0e8c55ed6aca	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-9fb9-dce62f0c0c57	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-54ed-44c2246812c9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-134a-7b6d938e94e1	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-a243-c4496180c49d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-2556-0a6b4ad6f037	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-6266-4f67262639d3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-9add-99a83e1dadac	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-bcb6-295c59b9eed6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-a492-40623b2332b6	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-9303-f509b6b05d9b	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-d757-72bca7343689	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-dbd9-205085847254	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-77b2-43b9aa679648	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-f5bd-8f954d129080	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-e9f6-b17c3ed40047	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-fb13-92649b7a8f58	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-f798-d45e48ca0a4f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-8fc7-275b83877e82	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-830c-b7a30b187f51	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-99d4-72835465c551	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-8378-cf70e651b9bc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-8034-444143180bbf	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-f393-a495bd5218dd	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-d063-f653eebe108d	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-6b27-c8f8736c1278	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-ffd7-223b65708134	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-8055-b9590152926e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-c0af-97a240ef4e96	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-093d-3cd53612058a	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-d653-e392774d5d56	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-47ad-c0d4525f560c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-320d-4d59a46cc2c3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-3443-7e2d6bc1cc35	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-56b9-f780c033486a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-bb13-05b15de3b919	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-38d3-c96213204bcc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-843b-7c47c8375689	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-97c9-abc5c9e87494	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-43b5-bfb76fa79a24	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-22f3-7032647da807	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-f766-c17222888a6b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-9bda-139e34215da9	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-00d6-7ba8835f9dbb	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-9346-d61d75b52127	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-598e-19fd44dc85f8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-0670-c2e39b34a4ea	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-9ee9-3a1742a8acea	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-e8cd-57389313f9f6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-f916-2bafdbc3d229	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-048b-1bd90916d973	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-77cb-c6558530e449	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-d6fb-8b7af2170776	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-4545-bcbbec9b4811	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-5c30-f15976b545a9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-0ed9-1fcf1b693a6a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-8b6e-756aeb566863	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-361c-ad83f98714cc	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-dffa-f4fe6272f86a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-f180-957bf4e1c6bb	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-0025-4a2c9b900872	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-01a4-7ab12c49ffb7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-e79a-b775aad7c6b8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-3493-58bc0c48aa26	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-7650-3ee123847afd	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-2cd2-3f46e99916cb	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-07fb-3d8feeab3131	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-b53c-658b9ae379dc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-3540-7f33e5372971	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-f0b6-f55aa174a75c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-2065-5956aa3608ba	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-177f-ab9d333e896c	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-0e61-c5d6fe443bb8	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-b3a1-e1e906148f98	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-b823-a31f009ca2a2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-54c6-266bc5a57b3b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-b471-2ce3605779f1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-1174-f80142026f21	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-13f9-02fac81cd462	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-7634-29c3c3d860df	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-ee1f-98cf5cd40764	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-95ce-07088f9eb2b1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-9946-5a5be952a75d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-7990-32ea17aca81a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-be55-af30bf536e20	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-a5c8-2709b885e77e	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-0123-674177b379a1	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-e3bd-41c2f51b1229	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-6e52-8ba10d3cd514	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-a2b7-eab7e9afb0a5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-5cb6-eefc1e9e7227	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-599e-0961b9115ede	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-d67b-6f23bf614b07	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-7554-04d6394860a2	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-23d9-ee09e2f9cc67	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-e925-77fbb52b19b6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-81de-560053a7bc6a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-4fb5-a1ad14cdb355	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-a77c-393574674053	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-9307-d35cf09b6123	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-7422-e3dff86bce16	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-367b-9fc405cd1d34	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-4698-9858226da7fd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-76c0-941edef4d72f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-5ded-bc033d85fe37	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-e8d9-3811b235214a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-683d-6a9f51b88f68	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-cef5-7c7d9ed4edc3	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-192c-57709e29b7ba	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-06fc-5943cadf9556	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-4d9a-b93133af9ea3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-e78c-159a2f226916	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-2ee2-d2234336ee52	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-fd40-0260bd3074f7	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-b729-68b518a8e2e6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-d377-d95051865f12	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-2740-6b90cdaeffde	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-1acc-34494b21a821	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-e180-e99f18c2f899	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-6e27-7b22552c77ac	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-1cfc-e8f8952e669f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-641c-0cce2a9a3f19	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-4bc4-4a2037b3e778	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-f668-8dab4756a2e0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-f48c-52674697663e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-9bc7-baf835315813	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-c306-e47fc6bef701	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-1d53-e6e17540223c	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-0dae-f863b7407b7d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-a381-5f950fe5dc34	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-e688-cf21aa300adb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-0504-3a95363ede78	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-2ddf-42d401e9d1cc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-3a93-c58399873cf3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-bf07-75e077af9092	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-e639-e8cbb1449e90	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-832f-9caacaa7951f	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-bb7b-da12351aa9df	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-8bb4-9ea3d12a73a2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-14bb-fe3a54485293	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-4f16-63b8d9f4e3fe	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-77b8-9bdc90d976a9	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-986a-66c597262bb6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-733b-c8d443007329	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-22f3-4a8c5f944671	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-a3db-5645acf3ec9f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-869d-6a06c30bc3dc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-25f6-150f582d7ada	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-c525-4d4c9a697177	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-ef8d-81fbd30a020d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-f517-a1e8636a8e3b	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-0d9f-8c2780ab21ae	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-7184-0969f197832c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-da6f-abb04f306244	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-5994-26b4e7449b4a	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-8505-484b15f3e7cf	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-8b97-6614a47ed9f3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-810b-8f7009aa85fc	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-c279-0968a9c1ac41	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-70da-00f901d92b4c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-70e1-9c2206fdca1c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-a8b5-bbaad18a0c11	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-7dbf-96e5173d03db	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-20b6-bf02d5d06387	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-5610-26169c254212	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-51c2-65aa11f22ef2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-5aa4-1108b3c6be40	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-79ed-8917d5e70b69	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-037f-ba1df962cd60	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-3030-40d59683f5fe	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-8be7-4e8415507266	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-de85-0dcb41adc3a2	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-5289-5d84dc79281b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-f560-2614efdf981c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-fd1e-884e8ecae440	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-24b6-addadd234a63	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-8ad7-ee785d778950	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-3f88-5c40bd72418a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-0336-a657ed50fa7e	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-6977-bd7df2b47a05	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-81ab-f49152286262	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-2748-7bd16dbc0ba4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-1d24-f876e76728e4	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-d74a-32ea3ec74d15	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-98c8-183d765f8f45	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-313b-e7f645243348	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-1f30-1cd12a6d8e63	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-c84f-099e6b436d57	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-2b9a-7cb31013b619	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-8bfe-9059c56e26ea	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-9f5e-0f8496cdec33	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-cd0f-69b62c9c4d34	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-0ffd-0e62631c401d	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-125c-727b69179a81	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-6be1-a70fc4848781	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-a158-7a65800c532f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-1472-bf3a5e6d294d	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-9ae9-4fb102de0736	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-fdc7-9d326561ea1e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-1178-23ac89610c5d	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-dae3-f42d708ac5a1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-bcb9-2df44432832b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-0bc7-9797e949ff44	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-e6c1-fe10618a015a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-2fcf-8ef53826312e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-b40c-0d0e9654fa49	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-73ad-c40a9bbb1190	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-9fef-9b0226725cbf	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-9181-fd6830f30137	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-da17-95155fdab1bd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-82e9-42ae0fc23dfc	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-77b1-acbe27a04bbc	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-b742-8a808138a3f4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-2a6f-ac6f0cf5d2cb	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-56f0-dc34af1030d1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-d7ba-4146b12b68d2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-6494-20a7f37683a6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-d82d-27accb71379a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-a270-cdd70d655445	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-ec64-d337d4392446	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-d7dc-2dc13041bd41	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-dcac-9dc6ffbbb25c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-ec69-d2d9e8814e1b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-2c49-230d6f20b97c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-8fd3-4b0beb874b36	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-a964-d7c0e6d01af2	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-3270-9c7152c3588c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-4e02-a40f6b2ddbd2	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-9119-f72f03049d6f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-8cc7-606016b34052	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-ee9c-28466de45a20	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-4547-a4bf36759d48	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-5646-734c8d3fca78	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-4df5-2b60d7b28ce9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-a567-1c9bd614c5c5	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-0c0e-aa7212cc58dd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-c1bd-f1793dba0e63	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-4600-c00c5cbaa4e7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-b2ee-945df9ee9aa1	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-23ca-9fc1fdb6aa94	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-0bc4-6627bcd76e2e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-6d64-439809f2dbf7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-f471-140bf2ad42ce	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-7c39-c4d4dbad0e02	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-0988-d63d4de7ed3f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-dd22-f9ff3b9822e3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-41a2-0199495173ed	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-3965-95475af1f228	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-b2e8-952afa00ea44	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-62d8-556fa9bfc1c5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-8ce5-ab842fff5fbf	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-376e-09dd8d313456	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-71af-b15e825de887	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-d729-ed85df061296	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-e3a5-3c22c6379d08	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-7db3-0ac917d5c97e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-1c5d-bcd64d080cd8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-b56a-78f4b8fc1c95	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-3fca-2f86cb736dbf	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-9e39-f42d161fccba	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-ca55-40cf5620ee8a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-07ac-aee9e896212a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-80e8-d6fdeae2b0b1	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-0e2f-eb516b42e5ac	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-487c-ebc2fbed58a4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-f556-f0e3934093e9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-85f2-1b2f6821e6cd	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-741b-371497eef4e1	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-9666-ce239acdbc91	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-3443-19a12db237b4	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-f5df-10b5d498bf7c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-9a6a-273465fe4839	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-0c74-076274265fc0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-4558-42d7ae2bdd6f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-5c59-03615f8dfe6c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-f697-9e36f50e225a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-85c0-2d1040a6586b	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-d0c3-e7f0689bb0e4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-c27e-7ba3d5f1bcd9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-07d7-6dacd42df00e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-fa80-e708b3aca856	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-981d-4cc8f55baeec	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-1a37-15296d6f4e8c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-067f-31e2e5396de3	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-e1b1-9825e7417561	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-6eac-a4037057d74e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-6fdb-cd7bb1dba9e8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-69e4-0675b7b6374b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-5e33-a29c376dfce3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-036b-7a977c63e5f7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-365a-74686a02787b	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-1be9-5aea0c2b796a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-efde-537792cba638	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-9639-aa875f2e687a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-f021-1a99ef6c1050	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-01c2-ff9ba6fb613b	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-10de-0b10f60bda13	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-0838-8ff6245e2d82	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-7613-871076baa5bf	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-e7dc-e0a933ade136	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-e366-976ffa7fe58a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-55f0-ae4afaac627c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-5f1c-664dd30a8164	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-26fb-4c3776625987	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-9e46-486a09c69ea5	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-2eab-a3e7c2ebfaa2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-49e4-5c281e6d9956	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-f372-49e66ea46af9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-59e4-ed3d62a23d51	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-8774-0b336faf88a5	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-a0e9-b902d2c3043e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-dbf6-34633c7f454f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-f4c5-a0db6b4d6703	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-e740-8667553c2a71	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-fb42-5dd9df148c82	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-e864-299ca2639ce7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-ea14-d96293de7626	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-6edf-f42e0bd6ca3d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-9f92-161b283b263d	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-a85b-cebee2b306b2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-e66f-572563482d27	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-6879-a6b982cb1c7d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-3c19-696e056a3992	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-7638-caba76ec15fd	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-dd6f-e2d5ae5f9f38	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-6355-0bde1a239c05	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-15f8-d82b176af587	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-019f-ae99a97b2a74	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-6ed5-f0d48724b36e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-a20c-7d3583dc551a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-68e7-86d43f6e8ca5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-8c17-387371b6b69c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-01dc-3bf5003bb05d	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-9623-f0fd2a67745d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-9668-12dd4ef92fbf	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-81fd-eac4692ceb54	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-45e1-7b3ec38f0f78	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-bdfe-6e7bc4fb2b12	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-31a9-18d4e77e09c9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-d33b-f87d2acd4ff7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-ec9c-cd46b9239d88	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-f5aa-bbd66a4a6eac	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-4ecd-a8671ecfff77	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-9491-58c111d24150	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-8e36-2c49f7fd1ab1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-2085-7a444c3571da	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-1977-84eb0c0f41de	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-388a-e6af209d9d5f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-637f-d9bef4b5c8ea	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-d977-64ca375c4dda	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-e7a1-478ba9385539	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-6aae-8fd82fef2246	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-17cb-fb925a43b3db	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-6752-e38ea19bc1a8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-d1bd-a4dbf677c12a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-2a36-34c56b885bde	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-9c21-8c6b41c5a4fb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-f712-2e28003dc09a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-069f-941cc94a1695	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-42e4-057e553c355b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-a5a4-aeae25edbaaf	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-81c7-3342fdf8e74b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-22db-898f7b52db96	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-7857-9f2c065a77d5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-cf04-fbb68c5f4e42	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-f9af-f35052285c71	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-b6ed-7357df1edc84	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-6c6c-b93bb8bb7a30	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-3a15-9065d1d727cc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-f1e1-9eda18907a45	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-4224-bac6cb8b2c9a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-5aa8-6eb6196971db	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-ea32-6fbd332f51dc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-54c8-62939d416ba5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-9f60-a90c1c8fa511	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-548f-45b713dacad8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-f2ea-a6012ff788a9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-1cf8-0d5e7f11dddc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-7998-b484cad0b864	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-fd9d-e8aa88fc7df4	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-60e3-6d8a44c58db9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-0110-6211f86ea5bf	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-e64e-e04fe4e447e7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-b11d-9e2f153ad1f1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-4183-ef8dcdb7348b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-6a85-d87cd0fb2299	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-4fdc-e1c7e57c38b3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-d4b9-d97804d4e9c0	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-006e-f10979079357	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-d0c4-c58bfe7f55c6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-d16e-e2ddbf2f49de	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-195f-77786e58a610	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-8925-724ee5b02712	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-97cf-14b3bb097b51	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-3730-bc0d198202e1	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-7c84-e97b0cab494e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-4286-bd9b43a31fe6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-04c6-b8d4a0f21029	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-a96f-e45b824362e1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-b4ed-3f7fd3b3c838	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-9e2a-6ea2e428d2a9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-a56e-239fd2c13adf	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-5005-ea1e185dc485	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-2a93-a3d183b47cab	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-9adb-1d1e746a8fef	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-f38c-c7c8a84c0240	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-7bae-f41a9f5b80a0	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-ed16-5c15c4cbf52f	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-8b28-78dd8dd5e4b5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-20d0-73a545cfa4d6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-023b-34c7cb37c26c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-9fd9-bb3df023f608	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-40cf-2bcfe93c7a92	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-bcf1-a71334499ff9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-fae0-d55f34cdc7da	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-da26-8a4225811295	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-4da4-7471ba124255	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-6f0b-d2cc5e577c5a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-2c49-b6b96094e2bb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-4369-47e894d07cca	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-3e49-ad812c885a26	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-cf80-a2e674b6e889	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-02be-ebd3aa128c3a	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-8549-6c7fedc737b6	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-8cde-15c59258c89d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-d3fa-b57506709877	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-7aee-d15e4622a91b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-2860-5a5374c1e19c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-a7a3-6f5796fe68ca	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-b8d3-d72ba65c55ec	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-1770-feee0a46f47b	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-e7ea-6e0e7a32a857	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-b088-a42ec33f84a4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-f74d-cc53d00f4f15	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-a01b-3c3cbac0cdee	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-d069-ef4565db10b2	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-3648-4ba3bd8b741f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-00f0-e61577135d96	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-58b7-1d0b0981577f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-43a3-1ef42f6c072e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-ba8f-36b195ebbfb3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-e742-6ff7c0973943	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-c13c-0e96585f213c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-0128-12923d9fb1f2	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-9e6e-2e050d6c8a72	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-f750-b369048426bf	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-787e-60145b2e0d5c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-0938-407ab02f53f1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-0891-56ccabf1c8cc	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-6ab5-5156612fbfdb	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-b0aa-6377f24ebb05	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-f718-fb116a122ec3	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-680f-c741483d90eb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-47b5-ffca5e14ac15	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-0270-4a9fb170c83f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-79a3-8d1aa30b11df	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-3197-438bc5e36e87	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-4fb0-8521f7859c19	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-9f6c-d78e74f9449e	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-e628-6b193c99d24f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-f96a-402fdd17b38e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-80b0-cf1424a57a81	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-24ac-7ac9956168ff	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-a0b0-60db64339cb2	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-e670-1fe522b0f985	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-779c-46f8220c2bab	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-8890-cb452a432fba	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-7960-6239aa4a0445	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-1bdc-d1a85cf2a899	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-5334-a2a2bde80230	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-0a61-9b1314a8592e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-1297-d2484db73759	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-ea8e-22371a08b225	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-6dca-01d8751abfcc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-1067-492b769931b2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-1383-79236ca98107	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-fd94-48b5387625a3	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-933c-2b3dc174ca76	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-cb0f-6b1592ea3cce	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-bbb1-4745d8bc000f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-4b84-7678c765922a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-41e8-f25679f41db1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-e4f7-3a45c2c2e60e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-330c-8d41a4263bc6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-9903-5478abf89c88	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-fd5f-e9cb8057260d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-1cf0-a89c42f20d71	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-af29-11b3b9235d3d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-851e-113e9d867c65	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-ca74-b029cd12798f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-a336-24ef145c1e08	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-1a64-9219aabedc49	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-f919-9a3d8bec03ce	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-75f7-92e9a6cb4d5a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-2e61-679d407ded34	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-49f2-c61381e2306a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-1b06-e60b6605be93	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-b19c-c6615246fda3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-ec05-53612616c918	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-d000-336b190f6820	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-2884-d1968949fa16	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-32fc-d85b4c5a7852	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-ed21-7af0572447dd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-7b04-a520c8b3caa0	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-9308-9b9aa16632e1	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-4a66-c317fb1b91bb	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-95f7-04dafc27e1c1	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-f5bb-ef76e595b876	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-adcb-e7b438e51e36	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-be47-8824cfeb840f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-4d2e-a587f368d495	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-1f41-67466570b468	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-a8ef-4dfce531f5ff	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-c554-7c39e0727a03	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-8f46-2a6f72129ad5	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-f808-9d9b1057db7d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-775d-4d6d76f062dc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-c19c-da516da0bcb8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-762b-ef8d8fd2e6ee	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-1500-c7e446368c75	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-9157-d3635e9bb974	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-2a1f-3c0ad96d78f1	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-1ab7-4c9072ca7414	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-7e88-e4fbf4cf6f78	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-1249-5e8e7826179c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-22c6-89d15082aca2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-1ecf-50b6de3433bc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-6f82-713784a6dadf	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-afa4-6d8e43175e34	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-1abb-2999112b16b3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-0dda-dfc43e5dbd9a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-6762-6c21caec28da	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-8c39-e831a8dc6144	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-5d15-84caddb7ae6b	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-ff5a-e9e088f63dc4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-a9fb-50e1bce060e8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-8174-1cd2e80230cf	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-7340-86b9625ce853	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-5356-356323954c7f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-5e76-63c87a84912a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-f7e5-b1804ee9f235	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-2ddb-b4d0eee5a3ba	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-8fd4-b35f8485b076	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-44cd-8bffbf2e546d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-d176-7d0c764e6a32	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-15e1-6ad3c0343c55	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-5889-c9d8a44002de	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-634d-25eaec0b1110	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-96a9-bd4401ad249b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-f2dc-a1c5f82835d4	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-8b72-063d6d3ab3f0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-2d94-55b2cd12f66d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-5b16-0c5d1ce30bbb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-1cc3-6f7a3762fc4a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-e884-5342f27c5460	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-af47-2f642618cc5e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-b38a-4b504f976424	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-b86f-8f75282fa7b5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-df40-44f58bba48ba	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-ad9b-bd9ff394457a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-b56b-1e84cc8b188a	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-7490-da21285f17b8	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-a826-88e40c86cfe3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-f326-a657d904302a	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-43e3-17c118e6b479	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-bc5d-a75e776e733d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-bc35-8f73cc9e38e4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-5d57-199417d64f0c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-3acf-34a2fd16173c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-5f8c-4454599ef676	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-35a3-230dc8d9673a	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-a7a3-e9bd51b6622a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-8033-f4c852ac2cc6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-ac67-edad75ba564b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-f15b-425ba411b2df	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-0671-13c5724ee161	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-de6b-1f301bd77542	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-ba8b-acdd7c0f29ac	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-c643-87cbceffe81c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-b688-5ef0099cf738	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-c2f4-f41f26e3efa5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-2785-42977a09868c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-47e4-113b5d4382f0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-f5a1-f96732d87f9d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-2c25-8514a678e16f	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-82b1-b33a03153cac	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-f118-8eedee93f15d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-810f-28938bbe578e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-d9ad-b96840875167	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-1426-00be15e59f2d	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-d2ca-701a9dcbf017	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-7e0d-4e0fb06ba963	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-42d1-57847f9cb16e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-eac9-0c0cf4b69133	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-8cce-fb1a0b332784	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-3391-a23208f30ac3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-2579-5fc1753dfdb3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-5492-569d8c72f63c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-8779-70c1df259f05	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-ce16-9d60e18b52b2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-02ef-ab6b8f42c1c5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-8d35-909a83e690ec	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-c9fb-fbf4832f1adf	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-6c5d-848804692e58	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-d475-f0c3b88718d0	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-e7e3-b2a9e6be05cb	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-fa95-98934a4495da	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-cc26-c864521d5cc7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-8461-1161ddb0884d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-df81-b59318f9606a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-3579-2c2051ecbfc5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-ffc1-0bd398516b1d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-3581-9f819cb12158	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-0afb-debc83142bfb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-2d61-395eb02b8243	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-c258-030e8195a91e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-1102-c7fda2605c65	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-4a33-7200308cd81f	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-4a1a-60ed5e5b3359	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-7e2d-087f5a06a764	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-1d34-0b6f490117c8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-8e39-ce3d620b1003	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-72d5-5d7e94792853	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-62e5-3f72418a3eef	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-305c-516535083c12	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-988e-8842fafd95a6	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-3c68-1490d0c5db45	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-393d-72dd1e1ead26	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-b86d-36b2ea5ff9e0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-9800-ad9871788117	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-5e5a-3abba266bcfd	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-9857-030003bf657a	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-1fee-761e40162a03	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-c2f8-304c7ef69274	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-bc1c-99ee46957311	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-f40f-89bc81e882d3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-efa2-5a2ca748a4de	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-b1c4-74a70a737b0c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-7f8a-312a699f07fb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-2dad-f56ed87d8a39	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-5998-abf3e4634c7a	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-78ba-0347f006aaeb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-ffd4-76a2a95da0f8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-4aa5-500dcf5cff3f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-64cb-ecc56b118128	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-f9f7-0153262a3c5c	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-88d6-e5d4ec396ee5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-baaf-5c3b92290583	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-30a5-ae0670b9df42	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-e6f0-4735aeb61df6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-4bf8-4951d2eaaff8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-3543-2ef053ae108e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-6627-8e793b244ced	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-e9b2-5ac53b1eefa7	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-f1fd-1abd695e2b67	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-dfa9-8fac7667ecd3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-7e8f-56154676e59b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-9379-a5b8c90d9f86	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-c3c0-838d2eaae27e	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-cc1d-3ff079dd089b	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-0c0f-e2bf7f372d6c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-5ff8-c4304ee84fe9	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-b518-f5d1f306d0ac	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-f6e6-5f506cb596eb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-e0a5-1937669559d6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-d091-6fb7bc75af69	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-0508-67007998bdef	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-2f2b-26f583fee895	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-83fa-0d4910242a3f	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-6118-720461e8a080	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-e8f7-5bd992351686	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-627d-258a5bd237c7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-2cca-b65320c93592	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-02c4-5a34aa4b523a	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-5069-60ba2a94b212	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-4f1e-3a3a84b24b9e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-b29d-ec8ff752f284	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-0239-5d194a275840	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-7f25-5535d1d50fde	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-fceb-d4441416f1e8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-c3cb-0c7ef3b17c9d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-c92c-8dfd07d087fe	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-f9dd-1e1f49695123	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-e910-c5860f00facf	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-c357-8b4cfb1c7827	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-dca0-a3f233922b05	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-ad14-1df223334822	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-1c4f-d4e67223a341	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-b54b-c338c256d30b	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-c0b2-5406fa57afce	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-f464-e9c6689444d0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-15f5-73e410365350	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-90ce-8527d221feef	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-c1b6-36450eb29b3c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-b634-4577de46d6da	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-8c6a-106414a58a7e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-b3be-750d4c28903f	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-e17e-45f6f5303205	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-acb0-3559313a123b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-737d-df1ff3399ef5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-f794-135f722fe930	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-ba4f-f2a424b3d4ef	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-3e65-d56f0769e6ca	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-7671-00c02fb777a0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-e815-5ad05cc587fa	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-95fa-5c1dcfd8ab69	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-dad2-83c8991b1d1a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-bfed-7570333f3e8d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-620a-14820befba31	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-5510-2f233d9ae8b9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-fc88-ae47d1e4fb52	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-c89d-43b756700515	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-685a-1dc986516c5e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-1cb0-d163e0a1d60c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-b3bb-c6cadfce2c1a	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-a975-72b711417b7e	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-d2d2-9c5e711f2cf9	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-3a06-0fde9a34b49c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-b59e-fbb2ad00be19	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-8e87-90f8bf9664d2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-40be-b44e4c99fcd2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-60be-d9de21c76a89	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-95e0-dbae7968ca59	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-2dc3-6a8dc908c12e	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-249d-9ad0802668aa	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-9711-332395346b40	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-b5f8-37bc23682124	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-d305-2b3abaac305b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-0dc2-689240453cb1	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-5154-9ea154fd2dd9	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-0e81-6f1438fd856d	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-bcfd-6e0d384d5869	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-7968-9d63080fecef	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-60ab-14197a5ea1ef	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-5482-32652ab18097	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-3dc1-694bb27aef58	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-e375-cfbcc283b470	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-6efa-69ad0bf481cc	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-a661-7d869b5a33b4	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-9537-6de5466c19d2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-6efb-fb36837c2fe1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-b7fa-833f86dd90e1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-f549-b95c7f312371	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-44c7-3814f0d0a19b	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-7a1e-9cbb811027eb	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-ca02-86d2f24a5c99	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-abd7-54f3e63bf6d8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-fe40-0d015a891d0a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-7970-3e16d40c14da	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-3b0f-5fc5e9ee7594	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-1c18-463a5f9bfb90	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-cbe2-765249d794f5	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-ec3c-ef50fbdb1ea3	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-31cf-cb202bb7c223	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-1ef7-a84999b29305	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-f59c-53c8e004b90c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-80c1-c338710a3511	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-fdd2-d61e24371e5e	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-0a5d-495489346905	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-d9a1-7bf723806e24	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-286c-7a02f44bdd1f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-9459-749612783e57	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-fbff-c18044857d34	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-e7bb-9b08049c32cc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-c5a1-ef17ea7ed92d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-4cb3-01bf76c8c914	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-e562-b0d86d8ad8e5	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-a713-f0bbf72dac1c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-c0cc-ff1b6a64c293	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-c9c3-104a9fc429e7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-ce1e-0c09fb17f9bb	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-0a9d-83dff9e52bfd	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-351b-cb3c6f105747	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-7ea3-2591b747afd5	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-144a-a6862c876df1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-09b6-d5914024c86b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-65f1-3eace86cadd7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-0bec-c138c121b9b4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-9604-880619fb4311	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-b45c-8f6a8cde5af9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-c2c3-ef5e92930ffd	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-4028-ea744949f29b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-191f-41a46820fb33	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-e5a4-41d4882f37f2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-fa00-296c9c5bdad2	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-4807-fe2218423861	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-fca6-140d3381d7f5	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-8605-4eef2949645e	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-6c0e-ecb2d87257de	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-303a-38b79eaadc92	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-1e8a-984420cb95e5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-8778-ba424b06f5a0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-c01d-ec55c79f04bf	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-bd5d-0d9b24b573be	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-a3f6-70d449b03db0	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-9938-52439f178ddc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-b2cb-820bf4be3155	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-dacf-de355ecd697e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-d068-571f5e5eb5ba	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-7ede-55b35768fc3d	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-8aa5-9ad9892b4c03	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-fc5e-35dee131c327	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-c43c-60aba75b3660	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-97f7-6ae9b2945c4c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-deb2-633e40440344	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-b2c6-e7b41a8aaac3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-deda-574ae8cd7d11	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-06a6-e6997b8d46a6	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-5d59-2c339ebbcd9d	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-eeb4-e847a1472761	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-def5-a94d4e65b2ab	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-4092-7c00ad60aa67	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-39e6-5999b360c6ae	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-0fa1-6846b408e9d2	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-5106-7c7f01c18319	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-657f-f6c1d417774c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-8c0d-eb8eb4b8a6ea	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-9590-d6611568a425	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-9689-4c730d711410	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-413a-689eab4c90fb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-b714-e6213d9773fc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-5639-cc0d285d092d	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-2269-3503757cfa17	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-a881-dc4b520258c3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-1632-c1d77ef817ce	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-7932-bb10e97cce17	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-6fbf-03e87c692ffd	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-ae50-8f90160a7523	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-5df7-0253148e1e63	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-69a9-c079b288aa46	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-6f67-dc001b659afa	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-13e9-99cc1b86c9d7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-2949-37d0bd9e93ee	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-2a54-1b35327f4df1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-a63d-9ee876c0f092	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-f8a4-2508ef9931d9	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-0442-37adcb3dcc0f	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-86f7-5233ae0c6326	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-eb3b-ca1b402739cb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-1056-6f2c840bcf5d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-9fb3-3489881e3456	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-261c-1d4cf2d8c6c5	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-8e44-d9ed4c3d9c9c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-1fcf-afe0451b2bee	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-7018-263090e7df09	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-9137-c34356a1bf3e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-263e-712440d65a6a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-4716-9f038fbc7b5b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-215d-ef9406e369cd	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-2486-d27bd7b8ce09	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-0d4c-f4568b79a850	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-fb0e-bf1895fa1f77	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-35c4-e5eff421478c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-8638-5292924effa2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-ab27-27a94ea87dad	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-7c3c-dc3d2f39c3d9	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-3fc7-5bd4bb57bca7	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-3338-0cd53d9300cd	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-3df9-bfbbdcfba762	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-9ea3-76cddc16ea14	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-1dac-034d8eb9ee71	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-5890-8063ef7e2565	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-67dc-9970aafb9b2b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-d635-e8524d778291	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-b10b-1c91f5754ef6	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-8558-cbb7b0f2d8d4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-6aa4-537f21fce6e3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-89cb-5b7d46994903	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-4364-9c035afe07e5	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-fc6d-fe5bc0ed50dc	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-cfb6-1297bdae2663	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-932f-814b80d77a52	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-7763-3117cb160720	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-cc4b-64fd6fde2512	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-0741-3c9866686283	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-0fa0-c5fa3e9c8747	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-0269-1d0f5cda172c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-2488-277780b55919	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-cc9c-45c44fb1d51d	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-806c-d400fd838f7a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-cf72-78cd09e24900	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-8b1e-7b41219c257e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-04d5-c87a7cd4e82e	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-1a6a-72ec29bde027	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-42a9-f6be87f1a0cf	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-7916-3c19cd332569	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-9d63-e333dc095801	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-263a-94d90f1f3540	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-5699-b6deb4bf3c9b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-8e44-f1082f4266bb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-7a6d-149ce3e57b8d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-5b7e-967e444f8efe	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-70ff-8c1cebf36aea	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-9ecd-50aec78c0f13	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-82fc-20c53b8e0ca7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-f349-7fb6b01bb18b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-e500-64981e142724	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-06b7-87e4593d83bc	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-d8e2-ae047c295971	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-7ae7-24979a631f63	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-cd10-594c970941d3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-590f-06d1075589ee	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-7f17-c81761ade3ab	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-6663-16b8cd6a2a8e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-34bb-4532ffda3c66	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-030a-8f1f8019e84a	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-a964-14040e893c43	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-898c-6c611440e792	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-c215-4d2ab3c614e9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-3400-4359354a4073	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-2f25-f1da221bfebc	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-3589-6e98e52e1168	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-17e6-60b960614962	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-fdf6-f6c7892adee0	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-23b1-1bc8225c8869	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-de21-69aebe66ddab	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-aa19-04817eb57d30	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-6af1-8016b5fe8b01	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-38f4-da17b6449d6c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-3fce-9ce4d1a2e1c1	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-d982-e6e862280b10	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-8c04-87da5a26bb67	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-6160-ce82223dc71c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-7002-2966094cc65c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-bd85-979a1b66ae08	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-ffe6-ad938ff0d906	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-dcef-d8780a0da8c3	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-4e1d-79ceb959f91c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-e49e-f710bca32f83	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-5a39-fdd417fa5f34	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-9290-a7dd2e57ea7a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-fdb6-c41d42c903ef	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-cdb2-977ca1f49e30	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-0e90-363da93094ce	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-3f55-6d7110c84bfb	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-c9b7-b4676fc9b0ee	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-1c95-bc495194ccc2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-c799-81d93e97b7df	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-fedd-b382ae039823	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-6859-0d2835762258	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-5360-cf07e8df0015	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-ae02-a12d4c38beb1	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-ae08-44e8329ae4d4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-97e8-a50805d99c7b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-6e0e-269dcd5f0425	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-02a9-602f793b747f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-0484-043fbb0a33a1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-2fcf-41a097a16e63	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-a354-21cbd4e39ac3	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-85a1-fd73c113da27	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-ceea-8dc326e98d7b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-17dd-706d34244751	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-2ce8-f05d3ad25d2a	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-a4f3-9de8ffeed8c4	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-3fe4-8c3ab0fcf052	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-3a05-06fe68518eb8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-4417-836f14465ce1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-da3f-0b7b0777aa7f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-3e2d-18187df03048	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-a701-b5e7499770f3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-2e9e-da83e12f7acf	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-70b3-94a4ef02e007	User-delete	Aaa - Uporabnik - Briši	f
00020000-5536-6c5b-72c0-8562a119c245	User-read	Aaa - Uporabnik - Beri	f
00020000-5536-6c5b-2acc-0a6cab5c5806	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5536-6c5b-4216-d97fcd35c8b5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5536-6c5b-17a6-cda6c332ffb1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5536-6c5b-b9ce-d2fe29668a82	Role-delete	Aaa - Vloga - Briši	f
00020000-5536-6c5b-59e7-4d709d5ba10c	Role-read	Aaa - Vloga - Beri	f
00020000-5536-6c5b-fee5-d6c94405988c	Role-update	Aaa - Vloga - Posodobi	f
00020000-5536-6c5b-df7a-b6f06514648c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5536-6c5b-2fe6-0ed1e8285d4b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5536-6c5b-8118-6f7adc365a26	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5536-6c5b-f434-52b9d1fdd1c5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5536-6c5b-aab3-99be5ed781d4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5536-6c5b-7881-fe5e3cec8994	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5536-6c5b-a6b0-77ea51c88c3c	Drzava-read	Seznam držav	f
00020000-5536-6c5b-c4bf-51b74fe0969f	Drzava-write	Urejanje držav	f
00020000-5536-6c5b-bcaf-185a0ad398c5	Popa-delete	Poslovni partner - Briši	f
00020000-5536-6c5b-8876-921fa06788e8	Popa-list	Poslovni partner - Beri	f
00020000-5536-6c5b-e37b-f92f0177bbe0	Popa-update	Poslovni partner - Posodobi	f
00020000-5536-6c5b-6bc0-f843483edf06	Popa-create	Poslovni partner - Ustvari	f
00020000-5536-6c5b-c241-86ce26d35095	Posta-delete	Pošta - Briši	f
00020000-5536-6c5b-0b50-4950070410d0	Posta-list	Pošta - Beri	f
00020000-5536-6c5b-2d5d-bff2ca2c05a3	Posta-update	Pošta - Posodobi	f
00020000-5536-6c5b-5584-47f9a3ad0282	Posta-create	Pošta - Ustvari	f
00020000-5536-6c5b-a708-2e95332aa502	PostniNaslov-delete	Poštni naslov - Briši	f
00020000-5536-6c5b-ba44-a90136b8220b	PostniNaslov-list	Poštni naslov - Beri	f
00020000-5536-6c5b-860f-ef2a1297d419	PostniNaslov-update	Poštni naslov - Posodobi	f
00020000-5536-6c5b-5ca9-537abd67973b	PostniNaslov-create	Poštni naslov - Ustvari	f
\.


--
-- TOC entry 2626 (class 0 OID 662332)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00000000-5536-6c5b-59cc-2ee690291d54	00020000-5536-6c5b-a6b0-77ea51c88c3c
00000000-5536-6c5b-59cc-2ee690291d54	00020000-5536-6c5a-4c6b-41a6af384cb1
00000000-5536-6c5b-8037-e2f44a42ee03	00020000-5536-6c5b-c4bf-51b74fe0969f
00000000-5536-6c5b-8037-e2f44a42ee03	00020000-5536-6c5b-a6b0-77ea51c88c3c
\.


--
-- TOC entry 2654 (class 0 OID 662611)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 662641)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 662753)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 662386)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 662425)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5536-6c5a-7ac4-0c8556cc1305	8341	Adlešiči
00050000-5536-6c5a-8984-72bbb221c8d6	5270	Ajdovščina
00050000-5536-6c5a-6260-d9c0104226ef	6280	Ankaran/Ancarano
00050000-5536-6c5a-1109-ea4da216443f	9253	Apače
00050000-5536-6c5a-b06a-2c78dae0f985	8253	Artiče
00050000-5536-6c5a-0c8b-f0f1f467ff60	4275	Begunje na Gorenjskem
00050000-5536-6c5a-1f96-b4dd3d14b8ca	1382	Begunje pri Cerknici
00050000-5536-6c5a-5278-1919cc3b6605	9231	Beltinci
00050000-5536-6c5a-7e22-15c54cf6598e	2234	Benedikt
00050000-5536-6c5a-e6b5-0a171d26c1ca	2345	Bistrica ob Dravi
00050000-5536-6c5a-1153-71f898e3193f	3256	Bistrica ob Sotli
00050000-5536-6c5a-aa3b-4f3b4dc33ee2	8259	Bizeljsko
00050000-5536-6c5a-5a15-319ad5571208	1223	Blagovica
00050000-5536-6c5a-fc7b-3ba950448435	8283	Blanca
00050000-5536-6c5a-26f5-bc85c9cf096d	4260	Bled
00050000-5536-6c5a-e5ee-1f7f23b4e2d0	4273	Blejska Dobrava
00050000-5536-6c5a-8e13-981fc8e3c368	9265	Bodonci
00050000-5536-6c5a-ec81-6bca2cb805e0	9222	Bogojina
00050000-5536-6c5a-647c-7c04032ef029	4263	Bohinjska Bela
00050000-5536-6c5a-40b1-4d52763bdcc4	4264	Bohinjska Bistrica
00050000-5536-6c5a-395e-0a794d2277c3	4265	Bohinjsko jezero
00050000-5536-6c5a-c346-434376627970	1353	Borovnica
00050000-5536-6c5a-04a9-39f6f1c9fd42	8294	Boštanj
00050000-5536-6c5a-da72-b4de95a72b97	5230	Bovec
00050000-5536-6c5a-4693-c1b77fedaa10	5295	Branik
00050000-5536-6c5a-6c52-d40aeb3e011b	3314	Braslovče
00050000-5536-6c5a-9028-f357060007b2	5223	Breginj
00050000-5536-6c5a-aee6-6d85c76829ed	8280	Brestanica
00050000-5536-6c5a-ac43-339df5af5679	2354	Bresternica
00050000-5536-6c5a-288a-baf35abf6259	4243	Brezje
00050000-5536-6c5a-17fd-88159601e5c2	1351	Brezovica pri Ljubljani
00050000-5536-6c5a-af11-240067cad880	8250	Brežice
00050000-5536-6c5a-43a1-d4766b5fec6e	4210	Brnik - Aerodrom
00050000-5536-6c5a-7d3e-7ac3bcaf1429	8321	Brusnice
00050000-5536-6c5a-9f45-e128ecb9e053	3255	Buče
00050000-5536-6c5a-9ed3-a44584ad58ba	8276	Bučka 
00050000-5536-6c5a-622c-b605409a46cf	9261	Cankova
00050000-5536-6c5a-acb6-60f55ae950c7	3000	Celje 
00050000-5536-6c5a-3224-d8f9a3fe5157	3001	Celje - poštni predali
00050000-5536-6c5a-e93e-2addb7de48fc	4207	Cerklje na Gorenjskem
00050000-5536-6c5a-d641-0543d603fd56	8263	Cerklje ob Krki
00050000-5536-6c5a-566e-1ac25c0ce8b2	1380	Cerknica
00050000-5536-6c5a-1f0b-fd06b56bc5c4	5282	Cerkno
00050000-5536-6c5a-946b-4e66d2d29743	2236	Cerkvenjak
00050000-5536-6c5a-80fe-a34504932c6b	2215	Ceršak
00050000-5536-6c5a-1ad7-a464f2ceffe5	2326	Cirkovce
00050000-5536-6c5a-fb90-9d6398b641dc	2282	Cirkulane
00050000-5536-6c5a-66e8-cf3e458a8634	5273	Col
00050000-5536-6c5a-667f-8e3856363b66	8251	Čatež ob Savi
00050000-5536-6c5a-4f7c-0b878e6063b3	1413	Čemšenik
00050000-5536-6c5a-7052-aa96c121614e	5253	Čepovan
00050000-5536-6c5a-a5fc-f5551b7ae5bd	9232	Črenšovci
00050000-5536-6c5a-93b1-454702745492	2393	Črna na Koroškem
00050000-5536-6c5a-c98a-29b2e3a755f4	6275	Črni Kal
00050000-5536-6c5a-37eb-fe975a10a460	5274	Črni Vrh nad Idrijo
00050000-5536-6c5a-7f36-a74dca7d8a30	5262	Črniče
00050000-5536-6c5a-cf21-814fff8d398a	8340	Črnomelj
00050000-5536-6c5a-4f62-d15edd481cd2	6271	Dekani
00050000-5536-6c5a-531b-11ca555cf888	5210	Deskle
00050000-5536-6c5a-302b-a416690e62c4	2253	Destrnik
00050000-5536-6c5a-7bf8-cc20b39f736e	6215	Divača
00050000-5536-6c5a-0ae0-138133a2af76	1233	Dob
00050000-5536-6c5a-8364-8655951e9b23	3224	Dobje pri Planini
00050000-5536-6c5a-73a4-ba4eb54e4d51	8257	Dobova
00050000-5536-6c5a-b50a-10ed1a23bfd3	1423	Dobovec
00050000-5536-6c5a-6d42-04b537f5992b	5263	Dobravlje
00050000-5536-6c5a-4b3b-55d880ee7bfb	3204	Dobrna
00050000-5536-6c5a-9136-96366386766b	8211	Dobrnič
00050000-5536-6c5a-ce69-8cdfcc4c6e27	1356	Dobrova
00050000-5536-6c5a-35ac-c210de60939a	9223	Dobrovnik/Dobronak 
00050000-5536-6c5a-48c9-ecc3e47678c0	5212	Dobrovo v Brdih
00050000-5536-6c5a-c75a-c3663a916f2d	1431	Dol pri Hrastniku
00050000-5536-6c5a-11b9-d11433e25434	1262	Dol pri Ljubljani
00050000-5536-6c5a-c958-6aa6cf497f5c	1273	Dole pri Litiji
00050000-5536-6c5a-1d9f-8f04556c2b9f	1331	Dolenja vas
00050000-5536-6c5a-00e4-a2a4bbcd0685	8350	Dolenjske Toplice
00050000-5536-6c5a-525f-0ec4be6dad14	1230	Domžale
00050000-5536-6c5a-5c61-6a5649425552	2252	Dornava
00050000-5536-6c5a-1bbc-f87064b0b9dc	5294	Dornberk
00050000-5536-6c5a-b7ca-26f005beeec3	1319	Draga
00050000-5536-6c5a-6049-79bdbfdb6aa9	8343	Dragatuš
00050000-5536-6c5a-21f6-dc0fb92b1ee5	3222	Dramlje
00050000-5536-6c5a-4beb-54f680fa2f96	2370	Dravograd
00050000-5536-6c5a-2e15-e727fb27ae7c	4203	Duplje
00050000-5536-6c5a-2ab1-4d3ca1cb3cd2	6221	Dutovlje
00050000-5536-6c5a-07ad-de0d57f054a5	8361	Dvor
00050000-5536-6c5a-9ae7-2cf2803f9296	2343	Fala
00050000-5536-6c5a-c1ec-24dc99572ec8	9208	Fokovci
00050000-5536-6c5a-0c9e-a0ced9c6f013	2313	Fram
00050000-5536-6c5a-7224-fbe77d39affd	3213	Frankolovo
00050000-5536-6c5a-6a0f-72e8117522f8	1274	Gabrovka
00050000-5536-6c5a-e31b-794c5b63190d	8254	Globoko
00050000-5536-6c5a-e932-b6a4ac4cae4c	5275	Godovič
00050000-5536-6c5a-2659-ef50030eb34a	4204	Golnik
00050000-5536-6c5a-16c6-873b7846a652	3303	Gomilsko
00050000-5536-6c5a-402c-98aaa3313f6a	4224	Gorenja vas
00050000-5536-6c5a-9a40-460c6d440d2c	3263	Gorica pri Slivnici
00050000-5536-6c5a-5a03-5203c51b56a3	2272	Gorišnica
00050000-5536-6c5a-74b8-7e14232be5dc	9250	Gornja Radgona
00050000-5536-6c5a-579d-edf1a1723ec2	3342	Gornji Grad
00050000-5536-6c5a-8ae6-978c64e99d96	4282	Gozd Martuljek
00050000-5536-6c5a-c2b6-5d31200441e1	6272	Gračišče
00050000-5536-6c5a-780f-2dd703a3c10d	9264	Grad
00050000-5536-6c5a-569a-3d5c514cdd63	8332	Gradac
00050000-5536-6c5a-0b94-c26b6cd3b4c5	1384	Grahovo
00050000-5536-6c5a-c9f6-b207e4cb2441	5242	Grahovo ob Bači
00050000-5536-6c5a-6800-fc1ba9e1171a	5251	Grgar
00050000-5536-6c5a-aee0-802c84730b33	3302	Griže
00050000-5536-6c5a-a20f-357796f9d9ab	3231	Grobelno
00050000-5536-6c5a-ded0-393f67d9cf65	1290	Grosuplje
00050000-5536-6c5a-cd79-456a110360a8	2288	Hajdina
00050000-5536-6c5a-0ace-84f65743052c	8362	Hinje
00050000-5536-6c5a-f176-0e8fa9dad50e	2311	Hoče
00050000-5536-6c5a-c04d-fa3c6b6830ad	9205	Hodoš/Hodos
00050000-5536-6c5a-a04e-7e1d98cf086d	1354	Horjul
00050000-5536-6c5a-4504-e7caf9bd1601	1372	Hotedršica
00050000-5536-6c5a-82d1-d8cf9105ea8c	1430	Hrastnik
00050000-5536-6c5a-9be5-42bbc6adffd8	6225	Hruševje
00050000-5536-6c5a-1384-5057035a34d5	4276	Hrušica
00050000-5536-6c5a-bbe6-91333e605b87	5280	Idrija
00050000-5536-6c5a-80a8-c45a012c9672	1292	Ig
00050000-5536-6c5a-215c-21a38db5afc7	6250	Ilirska Bistrica
00050000-5536-6c5a-f5e4-aab88ee97988	6251	Ilirska Bistrica-Trnovo
00050000-5536-6c5a-3820-74513cbdbe9e	1295	Ivančna Gorica
00050000-5536-6c5a-5b77-f1b4f727c291	2259	Ivanjkovci
00050000-5536-6c5a-46d4-6c6f76e1cac7	1411	Izlake
00050000-5536-6c5a-a2a8-84b55b4ad017	6310	Izola/Isola
00050000-5536-6c5a-e96d-369b6972ff68	2222	Jakobski Dol
00050000-5536-6c5a-b513-7581b531663a	2221	Jarenina
00050000-5536-6c5a-9095-10950f6da46e	6254	Jelšane
00050000-5536-6c5a-f3b0-4601c6e187f7	4270	Jesenice
00050000-5536-6c5a-3322-c5f7fc5c1eae	8261	Jesenice na Dolenjskem
00050000-5536-6c5a-b691-e1800970c29b	3273	Jurklošter
00050000-5536-6c5a-0ca6-f6b4f24bc6f3	2223	Jurovski Dol
00050000-5536-6c5a-a510-0715a358e519	2256	Juršinci
00050000-5536-6c5a-5f63-d38eb8d9cf53	5214	Kal nad Kanalom
00050000-5536-6c5a-239b-7643502e7b7d	3233	Kalobje
00050000-5536-6c5a-3b09-c49f294a2475	4246	Kamna Gorica
00050000-5536-6c5a-f677-c5f0263827d5	2351	Kamnica
00050000-5536-6c5a-b30c-cc0b6b0da685	1241	Kamnik
00050000-5536-6c5a-4829-b7c6939989af	5213	Kanal
00050000-5536-6c5a-641e-771d27c9e0fd	8258	Kapele
00050000-5536-6c5a-8de9-e35a20b93984	2362	Kapla
00050000-5536-6c5a-7060-47a252971f7e	2325	Kidričevo
00050000-5536-6c5a-be31-af37486e2c5c	1412	Kisovec
00050000-5536-6c5a-57e7-95945dc15733	6253	Knežak
00050000-5536-6c5a-014e-52e89eb2766f	5222	Kobarid
00050000-5536-6c5a-6e86-4386d2c8d59f	9227	Kobilje
00050000-5536-6c5a-fa37-edaafd4c687f	1330	Kočevje
00050000-5536-6c5a-afa7-eba41fda9344	1338	Kočevska Reka
00050000-5536-6c5a-99b8-c2e8bfceee34	2276	Kog
00050000-5536-6c5a-2dc9-a0a47fc30d95	5211	Kojsko
00050000-5536-6c5a-b89e-5cce8412a33b	6223	Komen
00050000-5536-6c5a-06e2-1b3c23e09707	1218	Komenda
00050000-5536-6c5a-9b73-ba5c870f3391	6000	Koper/Capodistria 
00050000-5536-6c5a-6b6d-7890cbe9f369	6001	Koper/Capodistria - poštni predali
00050000-5536-6c5a-bccc-0e60337fc1a9	8282	Koprivnica
00050000-5536-6c5a-47ba-f6a3881bb4cc	5296	Kostanjevica na Krasu
00050000-5536-6c5a-4a8c-1b21e3355a24	8311	Kostanjevica na Krki
00050000-5536-6c5a-150a-2f179cfc4c4d	1336	Kostel
00050000-5536-6c5a-7ee4-4aaa73f3204e	6256	Košana
00050000-5536-6c5a-3d9a-5adf9d618461	2394	Kotlje
00050000-5536-6c5a-dc52-49e0c8b3466f	6240	Kozina
00050000-5536-6c5a-e8e3-7bf0ba0858a6	3260	Kozje
00050000-5536-6c5a-38f4-f64c9788d05a	4000	Kranj 
00050000-5536-6c5a-1a52-a62bffbe3357	4001	Kranj - poštni predali
00050000-5536-6c5a-ab1b-3f37f442c06e	4280	Kranjska Gora
00050000-5536-6c5a-35c5-adf3e123e982	1281	Kresnice
00050000-5536-6c5a-bc37-6e5af3166342	4294	Križe
00050000-5536-6c5a-b2e9-6f57cefa61aa	9206	Križevci
00050000-5536-6c5a-bcc3-2a1730bb4f42	9242	Križevci pri Ljutomeru
00050000-5536-6c5a-4247-70e1fa16ac5a	1301	Krka
00050000-5536-6c5a-6b51-f9109837b233	8296	Krmelj
00050000-5536-6c5a-14c1-9b9778c9a828	4245	Kropa
00050000-5536-6c5a-a942-856e8e0014d7	8262	Krška vas
00050000-5536-6c5a-3d30-e92af7663de7	8270	Krško
00050000-5536-6c5a-511e-bf8f895f5bfc	9263	Kuzma
00050000-5536-6c5a-e216-f9bdb76bd86c	2318	Laporje
00050000-5536-6c5a-abc6-ef911a18fedb	3270	Laško
00050000-5536-6c5a-dae2-e18a43628c11	1219	Laze v Tuhinju
00050000-5536-6c5a-4db1-c40d2fcd98bf	2230	Lenart v Slovenskih goricah
00050000-5536-6c5a-9c3a-c7d075ac6f2d	9220	Lendava/Lendva
00050000-5536-6c5a-4929-11fee59bda4b	4248	Lesce
00050000-5536-6c5a-d696-ae604b61755f	3261	Lesično
00050000-5536-6c5a-71d8-6c4739610640	8273	Leskovec pri Krškem
00050000-5536-6c5a-1784-b35c4472963a	2372	Libeliče
00050000-5536-6c5a-6d93-d54f0b8a1c1f	2341	Limbuš
00050000-5536-6c5a-8c17-d7e001152187	1270	Litija
00050000-5536-6c5a-62ac-44f14608e3e3	3202	Ljubečna
00050000-5536-6c5a-4de8-ea71fafef3e7	1000	Ljubljana 
00050000-5536-6c5a-37c7-0745d9af4a8a	1001	Ljubljana - poštni predali
00050000-5536-6c5a-24c1-82112c5b0f4a	1231	Ljubljana - Črnuče
00050000-5536-6c5a-76bb-7a9783108271	1261	Ljubljana - Dobrunje
00050000-5536-6c5a-218f-7eb1614b11a2	1260	Ljubljana - Polje
00050000-5536-6c5a-b20a-780bac4bd897	1210	Ljubljana - Šentvid
00050000-5536-6c5a-b4dd-691ca54c38cb	1211	Ljubljana - Šmartno
00050000-5536-6c5a-834a-56536080dd6f	3333	Ljubno ob Savinji
00050000-5536-6c5a-4b9d-808787d5c2ee	9240	Ljutomer
00050000-5536-6c5a-2d34-d871f3461f77	3215	Loče
00050000-5536-6c5a-c402-91b3cc5fcafb	5231	Log pod Mangartom
00050000-5536-6c5a-72b1-f6019d8ae1ac	1358	Log pri Brezovici
00050000-5536-6c5a-2f20-aa3a7f991c10	1370	Logatec
00050000-5536-6c5a-c238-545fc645a5c8	1371	Logatec
00050000-5536-6c5a-3427-4de5492521ef	1434	Loka pri Zidanem Mostu
00050000-5536-6c5a-503a-0e2ad922e8cf	3223	Loka pri Žusmu
00050000-5536-6c5a-50cc-d5c3201a7ff3	6219	Lokev
00050000-5536-6c5a-eeb5-965e912409ad	1318	Loški Potok
00050000-5536-6c5a-512d-5b364056fb56	2324	Lovrenc na Dravskem polju
00050000-5536-6c5a-a5cc-31807e0ccd59	2344	Lovrenc na Pohorju
00050000-5536-6c5a-5363-baad8c7fa018	3334	Luče
00050000-5536-6c5a-077a-fc8e38d7edaa	1225	Lukovica
00050000-5536-6c5a-7e34-d31a56b21ca4	9202	Mačkovci
00050000-5536-6c5a-184e-f38b03d7aa5f	2322	Majšperk
00050000-5536-6c5a-dea8-c52573348b5b	2321	Makole
00050000-5536-6c5a-6f4b-c0c440d4a0bb	9243	Mala Nedelja
00050000-5536-6c5a-1c86-428f0c5d42d3	2229	Malečnik
00050000-5536-6c5a-7c1b-23796b57011d	6273	Marezige
00050000-5536-6c5a-8f2f-8220cfe17024	2000	Maribor 
00050000-5536-6c5a-eb35-ef5e94e157a1	2001	Maribor - poštni predali
00050000-5536-6c5a-fba2-c1ed6f444a15	2206	Marjeta na Dravskem polju
00050000-5536-6c5a-d4e7-bd1905e35c65	2281	Markovci
00050000-5536-6c5a-fab6-7b2d80ae87c5	9221	Martjanci
00050000-5536-6c5a-7ed8-b32485484c0f	6242	Materija
00050000-5536-6c5a-abe3-a2b063e5950c	4211	Mavčiče
00050000-5536-6c5a-145b-07bc3ba4534f	1215	Medvode
00050000-5536-6c5a-66b8-68fab7e2c0b2	1234	Mengeš
00050000-5536-6c5a-5d11-6554e7d8411a	8330	Metlika
00050000-5536-6c5a-296f-b55848b10cce	2392	Mežica
00050000-5536-6c5a-a2b2-1f47b6d5afdb	2204	Miklavž na Dravskem polju
00050000-5536-6c5a-b7dc-442ceddb1420	2275	Miklavž pri Ormožu
00050000-5536-6c5a-3744-48d4416b0d89	5291	Miren
00050000-5536-6c5a-aa75-b3890edcf678	8233	Mirna
00050000-5536-6c5a-a627-ca0d7de1d041	8216	Mirna Peč
00050000-5536-6c5a-9263-11fafddad3af	2382	Mislinja
00050000-5536-6c5a-0a14-50dec4bd736c	4281	Mojstrana
00050000-5536-6c5a-0a35-c0c828fa4b3a	8230	Mokronog
00050000-5536-6c5a-eb1f-856850321f91	1251	Moravče
00050000-5536-6c5a-7b43-7ee61f443192	9226	Moravske Toplice
00050000-5536-6c5a-a838-4c5bb2be26bc	5216	Most na Soči
00050000-5536-6c5a-fa9d-5dbca10f507f	1221	Motnik
00050000-5536-6c5a-c2bd-25b44d24df45	3330	Mozirje
00050000-5536-6c5a-71b5-8b373c04db70	9000	Murska Sobota 
00050000-5536-6c5a-e956-496663dc04b3	9001	Murska Sobota - poštni predali
00050000-5536-6c5a-62df-cbd75521c7ac	2366	Muta
00050000-5536-6c5a-9310-8dc2270b8a76	4202	Naklo
00050000-5536-6c5a-33c2-a2cf6a070c21	3331	Nazarje
00050000-5536-6c5a-806e-a924cd4b6d6d	1357	Notranje Gorice
00050000-5536-6c5a-4de0-366464652492	3203	Nova Cerkev
00050000-5536-6c5a-e068-dc3aa4436b3f	5000	Nova Gorica 
00050000-5536-6c5a-95e5-f3554118b18b	5001	Nova Gorica - poštni predali
00050000-5536-6c5a-4d13-0a80f4e747ae	1385	Nova vas
00050000-5536-6c5a-6ad1-1dddc1801235	8000	Novo mesto
00050000-5536-6c5a-46d9-11044c68bf61	8001	Novo mesto - poštni predali
00050000-5536-6c5a-ed50-0b997f1c6d0a	6243	Obrov
00050000-5536-6c5a-539a-5daa7349d01c	9233	Odranci
00050000-5536-6c5a-35a0-11a360c4d273	2317	Oplotnica
00050000-5536-6c5a-47a6-da48edd49df2	2312	Orehova vas
00050000-5536-6c5a-6cd9-db8022263ccf	2270	Ormož
00050000-5536-6c5a-0bb5-ac21e570e95b	1316	Ortnek
00050000-5536-6c5a-6907-6f12483877d8	1337	Osilnica
00050000-5536-6c5a-6e82-27ce69e7b6ab	8222	Otočec
00050000-5536-6c5a-c422-1e08a47aab54	2361	Ožbalt
00050000-5536-6c5a-1dbb-cf179e810eec	2231	Pernica
00050000-5536-6c5a-b1e8-82feaa2d2aa0	2211	Pesnica pri Mariboru
00050000-5536-6c5a-cfc7-7821bb113408	9203	Petrovci
00050000-5536-6c5a-6568-b4c51b0d8fa9	3301	Petrovče
00050000-5536-6c5a-9bbb-ef05463d7f46	6330	Piran/Pirano
00050000-5536-6c5a-76d3-e6494be412a3	8255	Pišece
00050000-5536-6c5a-8196-a7b4c3817f65	6257	Pivka
00050000-5536-6c5a-2d75-964a66488a6c	6232	Planina
00050000-5536-6c5a-db7a-b5c8ab67d22e	3225	Planina pri Sevnici
00050000-5536-6c5a-4258-166b89e55f87	6276	Pobegi
00050000-5536-6c5a-d626-ecf5bbaf4746	8312	Podbočje
00050000-5536-6c5a-f191-cc4d0b1fc299	5243	Podbrdo
00050000-5536-6c5a-83c4-d0a35610dd21	3254	Podčetrtek
00050000-5536-6c5a-9a2e-fd5dfb1c9cf2	2273	Podgorci
00050000-5536-6c5a-31aa-0bce4b55c52b	6216	Podgorje
00050000-5536-6c5a-a39f-83cfc6fb9441	2381	Podgorje pri Slovenj Gradcu
00050000-5536-6c5a-6fad-9b623a75942d	6244	Podgrad
00050000-5536-6c5a-ba5b-6a12271828ad	1414	Podkum
00050000-5536-6c5a-0c4b-a244605db33d	2286	Podlehnik
00050000-5536-6c5a-8a6e-5ba3cea58e5b	5272	Podnanos
00050000-5536-6c5a-4d8d-636c0cdeca02	4244	Podnart
00050000-5536-6c5a-54bf-d7b639bd077a	3241	Podplat
00050000-5536-6c5a-1c4a-3e5e660dbfc6	3257	Podsreda
00050000-5536-6c5a-03ff-bcdbf5806d01	2363	Podvelka
00050000-5536-6c5a-1af3-7e657cb84099	2208	Pohorje
00050000-5536-6c5a-6604-db3c20f03c56	2257	Polenšak
00050000-5536-6c5a-769f-4bee31d5d035	1355	Polhov Gradec
00050000-5536-6c5a-d49a-98162e9a7fb0	4223	Poljane nad Škofjo Loko
00050000-5536-6c5a-44aa-cec590c232b8	2319	Poljčane
00050000-5536-6c5a-d048-601af707f4e1	1272	Polšnik
00050000-5536-6c5a-8be8-ab162be5cf04	3313	Polzela
00050000-5536-6c5a-3234-d5aa4b80df45	3232	Ponikva
00050000-5536-6c5a-de6a-7ec21416f16b	6320	Portorož/Portorose
00050000-5536-6c5a-9795-89146f363e5e	6230	Postojna
00050000-5536-6c5a-91cd-5b0467f11744	2331	Pragersko
00050000-5536-6c5a-ca66-08c8c45c404d	3312	Prebold
00050000-5536-6c5a-b54a-2fc95dd8cba5	4205	Preddvor
00050000-5536-6c5a-e797-790a44a615a3	6255	Prem
00050000-5536-6c5a-af47-14e9a2ba832b	1352	Preserje
00050000-5536-6c5a-ba64-4e315e690180	6258	Prestranek
00050000-5536-6c5a-48fb-0ce443210b0e	2391	Prevalje
00050000-5536-6c5a-1a96-7572f5c1f0dd	3262	Prevorje
00050000-5536-6c5a-84ae-842235a2afd6	1276	Primskovo 
00050000-5536-6c5a-2644-9d16f6be32f4	3253	Pristava pri Mestinju
00050000-5536-6c5a-6d67-2d4843b909d5	9207	Prosenjakovci/Partosfalva
00050000-5536-6c5a-f949-3cbf64df845c	5297	Prvačina
00050000-5536-6c5a-746e-4cb08b08619e	2250	Ptuj
00050000-5536-6c5a-4560-0c89c65eb502	2323	Ptujska Gora
00050000-5536-6c5a-d0be-1b8ed5b7680c	9201	Puconci
00050000-5536-6c5a-f271-7e24609342aa	2327	Rače
00050000-5536-6c5a-d366-52c3d9b71180	1433	Radeče
00050000-5536-6c5a-04fc-272ada3e1182	9252	Radenci
00050000-5536-6c5a-8eeb-d61e38248056	2360	Radlje ob Dravi
00050000-5536-6c5a-aca4-eadf68750640	1235	Radomlje
00050000-5536-6c5a-2d56-f792f4811b3b	4240	Radovljica
00050000-5536-6c5a-8500-15be901d1d52	8274	Raka
00050000-5536-6c5a-da97-9743aa138620	1381	Rakek
00050000-5536-6c5a-8ac4-e05e02ba4f24	4283	Rateče - Planica
00050000-5536-6c5a-2b5a-5ca785fb92e5	2390	Ravne na Koroškem
00050000-5536-6c5a-d926-9dfb66ccf3d3	9246	Razkrižje
00050000-5536-6c5a-e31f-b142559d6d88	3332	Rečica ob Savinji
00050000-5536-6c5a-cb30-1f7a484bc10c	5292	Renče
00050000-5536-6c5a-0b78-369aef2db9fe	1310	Ribnica
00050000-5536-6c5a-3d4a-8097ae3df156	2364	Ribnica na Pohorju
00050000-5536-6c5a-b9ee-4225c9de1369	3272	Rimske Toplice
00050000-5536-6c5a-9a7f-35b4775c5938	1314	Rob
00050000-5536-6c5a-9fac-0455299e1842	5215	Ročinj
00050000-5536-6c5a-80f4-7ee6cfcfa4a5	3250	Rogaška Slatina
00050000-5536-6c5a-bcd3-74adfbcfa0a4	9262	Rogašovci
00050000-5536-6c5a-b74e-a5eb80b8fdb4	3252	Rogatec
00050000-5536-6c5a-ac58-02d91e484c9e	1373	Rovte
00050000-5536-6c5a-6c98-641a98544823	2342	Ruše
00050000-5536-6c5a-7733-ea7fa1424721	1282	Sava
00050000-5536-6c5a-4f1c-8f2323052f77	6333	Sečovlje/Sicciole
00050000-5536-6c5a-8198-7ad87cd5b3b3	4227	Selca
00050000-5536-6c5a-877d-8b978334f8d0	2352	Selnica ob Dravi
00050000-5536-6c5a-cbc0-75835bf049c8	8333	Semič
00050000-5536-6c5a-1932-5877503db4c8	8281	Senovo
00050000-5536-6c5a-ea7b-45d0acbaeab9	6224	Senožeče
00050000-5536-6c5a-3a50-d3e1e13fccc1	8290	Sevnica
00050000-5536-6c5a-3f60-3b2f1fd4f0b8	6210	Sežana
00050000-5536-6c5a-efca-22a774e0cd1b	2214	Sladki Vrh
00050000-5536-6c5a-9fc4-acb8709dc31a	5283	Slap ob Idrijci
00050000-5536-6c5a-eaab-11bdddb65f39	2380	Slovenj Gradec
00050000-5536-6c5a-08f6-53d7d34ffbfd	2310	Slovenska Bistrica
00050000-5536-6c5a-9fbe-b0249371e68b	3210	Slovenske Konjice
00050000-5536-6c5a-24bd-738215b509e5	1216	Smlednik
00050000-5536-6c5a-be38-0681096a293f	5232	Soča
00050000-5536-6c5a-7382-6ed2e208c60a	1317	Sodražica
00050000-5536-6c5a-34a0-2a4e0065b761	3335	Solčava
00050000-5536-6c5a-680a-7403f3a27364	5250	Solkan
00050000-5536-6c5a-da32-6cf0ca621a9c	4229	Sorica
00050000-5536-6c5a-2f7b-1ccb8e8e5229	4225	Sovodenj
00050000-5536-6c5a-08aa-426b08173d73	5281	Spodnja Idrija
00050000-5536-6c5a-ffe5-650c97193b0d	2241	Spodnji Duplek
00050000-5536-6c5a-d117-9f8ba4810b2e	9245	Spodnji Ivanjci
00050000-5536-6c5a-b4a9-dab5b4f3a34b	2277	Središče ob Dravi
00050000-5536-6c5a-c31a-7d8a6aa34ca1	4267	Srednja vas v Bohinju
00050000-5536-6c5a-dc6b-7cf6fb02a504	8256	Sromlje 
00050000-5536-6c5a-5818-c93481deaa40	5224	Srpenica
00050000-5536-6c5a-dd96-d659bc4dc1c8	1242	Stahovica
00050000-5536-6c5a-b2f7-e35a84031f43	1332	Stara Cerkev
00050000-5536-6c5a-4cbf-1c5f3cf1a47b	8342	Stari trg ob Kolpi
00050000-5536-6c5a-4c02-58c1122d61be	1386	Stari trg pri Ložu
00050000-5536-6c5a-8556-b2cd58441964	2205	Starše
00050000-5536-6c5a-6349-ad6646b5a3f8	2289	Stoperce
00050000-5536-6c5a-c714-3ad59e10844d	8322	Stopiče
00050000-5536-6c5a-be1d-28a804a697b0	3206	Stranice
00050000-5536-6c5a-30ed-36d62c029b5e	8351	Straža
00050000-5536-6c5a-dbe5-ac9490bcc80b	1313	Struge
00050000-5536-6c5a-9fd3-529e494b3819	8293	Studenec
00050000-5536-6c5a-72b2-6ffd9bc6d64e	8331	Suhor
00050000-5536-6c5a-08c8-18d348244b39	2233	Sv. Ana v Slovenskih goricah
00050000-5536-6c5a-b7a2-00e19ac115e3	2235	Sv. Trojica v Slovenskih goricah
00050000-5536-6c5a-8ee9-4cf11c6833fe	2353	Sveti Duh na Ostrem Vrhu
00050000-5536-6c5a-281e-ce4a63d65eab	9244	Sveti Jurij ob Ščavnici
00050000-5536-6c5a-c83e-f8876a93d04d	3264	Sveti Štefan
00050000-5536-6c5a-d95c-f14ec1c11faa	2258	Sveti Tomaž
00050000-5536-6c5a-85f8-53453e139cf5	9204	Šalovci
00050000-5536-6c5a-1155-9b5c1a4c2525	5261	Šempas
00050000-5536-6c5a-1594-97603165febc	5290	Šempeter pri Gorici
00050000-5536-6c5a-7c8e-76efac70a5ec	3311	Šempeter v Savinjski dolini
00050000-5536-6c5a-4564-9cd707b4d7f3	4208	Šenčur
00050000-5536-6c5a-4777-9b7f86255f5a	2212	Šentilj v Slovenskih goricah
00050000-5536-6c5a-8037-ea6e9948581b	8297	Šentjanž
00050000-5536-6c5a-40bb-69cb2c57bcd8	2373	Šentjanž pri Dravogradu
00050000-5536-6c5a-7edd-9b713869f0dd	8310	Šentjernej
00050000-5536-6c5a-0429-5a3ea2a58997	3230	Šentjur
00050000-5536-6c5a-3f22-2694e5eaafcb	3271	Šentrupert
00050000-5536-6c5a-de0d-49aef4a68340	8232	Šentrupert
00050000-5536-6c5a-e037-7bc06ea297a5	1296	Šentvid pri Stični
00050000-5536-6c5a-8029-e3f40d096df1	8275	Škocjan
00050000-5536-6c5a-c883-3c99d830d287	6281	Škofije
00050000-5536-6c5a-478f-6964d744d66a	4220	Škofja Loka
00050000-5536-6c5a-127a-63cd2f0d55b5	3211	Škofja vas
00050000-5536-6c5a-b1ce-fb6e83530fe3	1291	Škofljica
00050000-5536-6c5a-10a9-b2594090c257	6274	Šmarje
00050000-5536-6c5a-162b-e223e2826f51	1293	Šmarje - Sap
00050000-5536-6c5a-7dba-d100101b87b9	3240	Šmarje pri Jelšah
00050000-5536-6c5a-1bd9-6b0bc3ccbf15	8220	Šmarješke Toplice
00050000-5536-6c5a-2bae-da3b45c7a238	2315	Šmartno na Pohorju
00050000-5536-6c5a-9226-fd3a8c023788	3341	Šmartno ob Dreti
00050000-5536-6c5a-dea0-32cf296c0543	3327	Šmartno ob Paki
00050000-5536-6c5a-1db9-6be013da7d57	1275	Šmartno pri Litiji
00050000-5536-6c5a-d72d-01e766b4d89b	2383	Šmartno pri Slovenj Gradcu
00050000-5536-6c5a-68dc-2c5ff4589d8c	3201	Šmartno v Rožni dolini
00050000-5536-6c5a-e74d-6bdde575b16b	3325	Šoštanj
00050000-5536-6c5a-270c-e78668ab097f	6222	Štanjel
00050000-5536-6c5a-a34e-12f4d0b567cc	3220	Štore
00050000-5536-6c5a-9f77-7b05a5a78ae5	3304	Tabor
00050000-5536-6c5a-9aaf-27b015f8805a	3221	Teharje
00050000-5536-6c5a-f430-634fe91068cb	9251	Tišina
00050000-5536-6c5a-94fe-a850fa8e405c	5220	Tolmin
00050000-5536-6c5a-00f2-f26649d5a21c	3326	Topolšica
00050000-5536-6c5a-986a-4c9fb42a57cf	2371	Trbonje
00050000-5536-6c5a-4b6a-be35f234b2ba	1420	Trbovlje
00050000-5536-6c5a-5097-172b2f884bbb	8231	Trebelno 
00050000-5536-6c5a-eb08-48a875a924e0	8210	Trebnje
00050000-5536-6c5a-484e-c36da75d49ca	5252	Trnovo pri Gorici
00050000-5536-6c5a-1871-b214ce3fa36c	2254	Trnovska vas
00050000-5536-6c5a-2f4b-7b7347608ae8	1222	Trojane
00050000-5536-6c5a-9292-68f399b83214	1236	Trzin
00050000-5536-6c5a-0765-b9ad1712b409	4290	Tržič
00050000-5536-6c5a-5227-2272a5f52312	8295	Tržišče
00050000-5536-6c5a-1932-710ff47e94f1	1311	Turjak
00050000-5536-6c5a-769c-db17443d57f9	9224	Turnišče
00050000-5536-6c5a-7ae3-fc757f0b29fc	8323	Uršna sela
00050000-5536-6c5a-aafa-0e802abd9e80	1252	Vače
00050000-5536-6c5a-b144-a51baa4b49e4	3320	Velenje 
00050000-5536-6c5a-0ab2-58d9fd938a17	3322	Velenje - poštni predali
00050000-5536-6c5a-a564-572cfc196995	8212	Velika Loka
00050000-5536-6c5a-d6fb-676bd5794d9f	2274	Velika Nedelja
00050000-5536-6c5a-667e-e90ca24923b0	9225	Velika Polana
00050000-5536-6c5a-eae1-168686594bec	1315	Velike Lašče
00050000-5536-6c5a-9c16-4f441f971175	8213	Veliki Gaber
00050000-5536-6c5a-5e13-fb3cc6b038e9	9241	Veržej
00050000-5536-6c5a-c1d9-c6e778df86ed	1312	Videm - Dobrepolje
00050000-5536-6c5a-6576-a6c9fffe7f63	2284	Videm pri Ptuju
00050000-5536-6c5a-99cd-8b27e369bba1	8344	Vinica
00050000-5536-6c5a-04b8-9b6ae22c6c85	5271	Vipava
00050000-5536-6c5a-1b3c-4b248d5315b7	4212	Visoko
00050000-5536-6c5a-a0a0-38f9c98de5fd	1294	Višnja Gora
00050000-5536-6c5a-839b-3e5ec640c9a8	3205	Vitanje
00050000-5536-6c5a-08d4-02690de853bd	2255	Vitomarci
00050000-5536-6c5a-0873-8195f87db8c2	1217	Vodice
00050000-5536-6c5a-10bd-65bc8fd63fe6	3212	Vojnik\t
00050000-5536-6c5a-ab72-a398bc8c9a2c	5293	Volčja Draga
00050000-5536-6c5a-5cc9-bc0175a5a4ae	2232	Voličina
00050000-5536-6c5a-d7fe-03cea4ef920d	3305	Vransko
00050000-5536-6c5a-4ad1-33543a8244bc	6217	Vremski Britof
00050000-5536-6c5a-2856-07be7d4a9c84	1360	Vrhnika
00050000-5536-6c5a-a76c-31b0d894c954	2365	Vuhred
00050000-5536-6c5a-18e7-46548018ced1	2367	Vuzenica
00050000-5536-6c5a-e803-a9ca2ff8f0e6	8292	Zabukovje 
00050000-5536-6c5a-e465-758bf4f694e6	1410	Zagorje ob Savi
00050000-5536-6c5a-73a2-b10f54b55e14	1303	Zagradec
00050000-5536-6c5a-b944-7f936bb5e9c6	2283	Zavrč
00050000-5536-6c5a-164c-e85ad39473a1	8272	Zdole 
00050000-5536-6c5a-2653-c8ee277c9d45	4201	Zgornja Besnica
00050000-5536-6c5a-7078-060bc9272a11	2242	Zgornja Korena
00050000-5536-6c5a-bbf6-fefb05fa1ccc	2201	Zgornja Kungota
00050000-5536-6c5a-2896-0e1c7bccfe32	2316	Zgornja Ložnica
00050000-5536-6c5a-9b1d-1e29066a9499	2314	Zgornja Polskava
00050000-5536-6c5a-9050-a9f08a6472d2	2213	Zgornja Velka
00050000-5536-6c5a-d360-5059605c8c86	4247	Zgornje Gorje
00050000-5536-6c5a-e4d7-e0be5fed0c00	4206	Zgornje Jezersko
00050000-5536-6c5a-900d-a445b373ce46	2285	Zgornji Leskovec
00050000-5536-6c5a-00a5-4e44649961a2	1432	Zidani Most
00050000-5536-6c5a-2ffa-a5fded0fdd32	3214	Zreče
00050000-5536-6c5a-8df1-3ea22052e0af	4209	Žabnica
00050000-5536-6c5a-c2a0-4012ef941d01	3310	Žalec
00050000-5536-6c5a-f33b-46b73dc58df1	4228	Železniki
00050000-5536-6c5a-a3dc-52c0c27b1538	2287	Žetale
00050000-5536-6c5a-4f38-6dc1c6162fd6	4226	Žiri
00050000-5536-6c5a-e094-440d4eea5209	4274	Žirovnica
00050000-5536-6c5a-9274-9abebb863ba9	8360	Žužemberk
\.


--
-- TOC entry 2650 (class 0 OID 662585)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 662411)
-- Dependencies: 185
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2619 (class 0 OID 529329)
-- Dependencies: 171
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2638 (class 0 OID 662474)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 662597)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 662702)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 662746)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 662626)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 662570)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 662560)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 662736)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 662692)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2621 (class 0 OID 662285)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, false);


--
-- TOC entry 2657 (class 0 OID 662635)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2625 (class 0 OID 662322)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00000000-5536-6c5b-a6e4-c1ed3c6907bb	beri-vse	Polni dostop do vsega v aplikaciji.	t
00000000-5536-6c5b-0cf2-d04f2b00f477	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00000000-5536-6c5b-59cc-2ee690291d54	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00000000-5536-6c5b-59a6-98b7c20a38bf	ifi-all	Polni dostop do vsega v aplikaciji.	t
00000000-5536-6c5b-5ae0-336669ab49a2	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00000000-5536-6c5b-8037-e2f44a42ee03	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2623 (class 0 OID 662306)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5536-6c5b-adc2-28765478d6e4	00000000-5536-6c5b-59a6-98b7c20a38bf
00010000-5536-6c5b-729d-b07449e200f7	00000000-5536-6c5b-59cc-2ee690291d54
\.


--
-- TOC entry 2659 (class 0 OID 662649)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 662591)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 662541)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 662379)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 662547)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 662727)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2636 (class 0 OID 662445)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2622 (class 0 OID 662294)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, username, password, enabled, expires, defaultroute, defaultrouteparams, email) FROM stdin;
00010000-5536-6c5b-6a8e-3d166e612295	Konzolni	console	$2y$05$NS4xMjkyMTcwMzExMjAxROk.n9TYc55okn066JsCmIpGk8HZPSClm	t	\N	\N	\N	rootmail@max.si
00010000-5536-6c5b-729d-b07449e200f7	Anonimni	anonymous	$2y$05$NS4xMjkyMTcwMzExMjAxRO9vTuqOnixIu6jfAYRJ.lc8YXsOK.Fxa	t	\N	\N	\N	noreply@max.si
00010000-5536-6c5b-adc2-28765478d6e4	Administrator	admin	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@max.si
\.


--
-- TOC entry 2671 (class 0 OID 662777)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 662489)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 662618)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 662684)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 662517)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 662767)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 662674)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2265 (class 2606 OID 662347)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 662816)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 662809)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 662726)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2318 (class 2606 OID 662507)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2334 (class 2606 OID 662540)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2301 (class 2606 OID 662469)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 662670)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 662487)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2331 (class 2606 OID 662534)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2240 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2355 (class 2606 OID 662583)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2367 (class 2606 OID 662610)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 662443)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2269 (class 2606 OID 662356)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2284 (class 2606 OID 662408)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2271 (class 2606 OID 662377)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 662336)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2256 (class 2606 OID 662321)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 662616)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 662648)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 662763)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2279 (class 2606 OID 662401)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2291 (class 2606 OID 662431)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2359 (class 2606 OID 662589)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 662421)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2245 (class 2606 OID 529341)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 662478)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2365 (class 2606 OID 662601)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 662708)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2412 (class 2606 OID 662751)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 662633)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2353 (class 2606 OID 662574)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 662565)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 662745)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2400 (class 2606 OID 662699)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2247 (class 2606 OID 662293)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 662639)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2254 (class 2606 OID 662310)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2258 (class 2606 OID 662330)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 662657)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2361 (class 2606 OID 662596)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 662546)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2276 (class 2606 OID 662383)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 662556)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2408 (class 2606 OID 662735)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 662454)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2250 (class 2606 OID 662304)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 662791)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2316 (class 2606 OID 662493)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2373 (class 2606 OID 662624)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 662690)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 2606 OID 662529)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 662776)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 662683)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 1259 OID 662514)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2277 (class 1259 OID 662403)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2285 (class 1259 OID 662423)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2286 (class 1259 OID 662422)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2287 (class 1259 OID 662424)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2368 (class 1259 OID 662617)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2362 (class 1259 OID 662603)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2363 (class 1259 OID 662602)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2314 (class 1259 OID 662494)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2389 (class 1259 OID 662673)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2390 (class 1259 OID 662671)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2391 (class 1259 OID 662672)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2414 (class 1259 OID 662764)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2415 (class 1259 OID 662765)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2416 (class 1259 OID 662766)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2421 (class 1259 OID 662794)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2422 (class 1259 OID 662793)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2423 (class 1259 OID 662792)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2296 (class 1259 OID 662456)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2297 (class 1259 OID 662455)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2281 (class 1259 OID 662410)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2282 (class 1259 OID 662409)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2377 (class 1259 OID 662640)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2332 (class 1259 OID 662535)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2260 (class 1259 OID 662337)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2261 (class 1259 OID 662338)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2382 (class 1259 OID 662660)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2383 (class 1259 OID 662659)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2384 (class 1259 OID 662658)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2306 (class 1259 OID 662479)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2307 (class 1259 OID 662481)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2308 (class 1259 OID 662480)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2342 (class 1259 OID 662569)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2343 (class 1259 OID 662567)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2344 (class 1259 OID 662566)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2345 (class 1259 OID 662568)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2251 (class 1259 OID 662311)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2252 (class 1259 OID 662312)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2371 (class 1259 OID 662625)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2357 (class 1259 OID 662590)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2397 (class 1259 OID 662700)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2398 (class 1259 OID 662701)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2242 (class 1259 OID 529342)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2243 (class 1259 OID 529343)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2401 (class 1259 OID 662709)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 662710)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2432 (class 1259 OID 662819)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2433 (class 1259 OID 662818)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2434 (class 1259 OID 662821)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2435 (class 1259 OID 662817)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2436 (class 1259 OID 662820)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2394 (class 1259 OID 662691)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2348 (class 1259 OID 662578)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2349 (class 1259 OID 662577)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2350 (class 1259 OID 662575)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2351 (class 1259 OID 662576)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2238 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2428 (class 1259 OID 662811)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2429 (class 1259 OID 662810)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2313 (class 1259 OID 662488)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2266 (class 1259 OID 662358)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2267 (class 1259 OID 662357)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2273 (class 1259 OID 662384)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2274 (class 1259 OID 662385)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2337 (class 1259 OID 662559)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2338 (class 1259 OID 662558)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2339 (class 1259 OID 662557)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2320 (class 1259 OID 662516)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2321 (class 1259 OID 662512)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2322 (class 1259 OID 662509)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2323 (class 1259 OID 662510)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2324 (class 1259 OID 662508)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2325 (class 1259 OID 662513)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2326 (class 1259 OID 662511)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2280 (class 1259 OID 662402)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2302 (class 1259 OID 662470)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2303 (class 1259 OID 662472)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2304 (class 1259 OID 662471)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2305 (class 1259 OID 662473)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2356 (class 1259 OID 662584)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2272 (class 1259 OID 662378)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2295 (class 1259 OID 662444)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2248 (class 1259 OID 662305)
-- Name: uniq_7fb775b7f85e0677; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7f85e0677 ON uporabniki USING btree (username);


--
-- TOC entry 2376 (class 1259 OID 662634)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2241 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2292 (class 1259 OID 662432)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2413 (class 1259 OID 662752)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2259 (class 1259 OID 662331)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2327 (class 1259 OID 662515)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2462 (class 2606 OID 662952)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2465 (class 2606 OID 662937)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2464 (class 2606 OID 662942)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2460 (class 2606 OID 662962)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2466 (class 2606 OID 662932)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2461 (class 2606 OID 662957)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2463 (class 2606 OID 662947)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2447 (class 2606 OID 662867)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2451 (class 2606 OID 662887)
-- Name: fk_1db842d610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT fk_1db842d610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2452 (class 2606 OID 662882)
-- Name: fk_1db842d6a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT fk_1db842d6a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2450 (class 2606 OID 662892)
-- Name: fk_1db842d6ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT fk_1db842d6ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2483 (class 2606 OID 663047)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2481 (class 2606 OID 663042)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2482 (class 2606 OID 663037)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2459 (class 2606 OID 662927)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2489 (class 2606 OID 663087)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2491 (class 2606 OID 663077)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2490 (class 2606 OID 663082)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 663027)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2500 (class 2606 OID 663122)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2499 (class 2606 OID 663127)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2498 (class 2606 OID 663132)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2501 (class 2606 OID 663147)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2502 (class 2606 OID 663142)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2503 (class 2606 OID 663137)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2453 (class 2606 OID 662902)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 662897)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2448 (class 2606 OID 662877)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2449 (class 2606 OID 662872)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2444 (class 2606 OID 662852)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2485 (class 2606 OID 663057)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2467 (class 2606 OID 662967)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2441 (class 2606 OID 662832)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2440 (class 2606 OID 662837)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2486 (class 2606 OID 663072)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2487 (class 2606 OID 663067)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2488 (class 2606 OID 663062)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2457 (class 2606 OID 662907)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2455 (class 2606 OID 662917)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2456 (class 2606 OID 662912)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2471 (class 2606 OID 663002)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2473 (class 2606 OID 662992)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2474 (class 2606 OID 662987)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2472 (class 2606 OID 662997)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2439 (class 2606 OID 662822)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2438 (class 2606 OID 662827)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2484 (class 2606 OID 663052)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2480 (class 2606 OID 663032)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2494 (class 2606 OID 663097)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2493 (class 2606 OID 663102)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2496 (class 2606 OID 663107)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2495 (class 2606 OID 663112)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2508 (class 2606 OID 663172)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2509 (class 2606 OID 663167)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2506 (class 2606 OID 663182)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2510 (class 2606 OID 663162)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2507 (class 2606 OID 663177)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2492 (class 2606 OID 663092)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2475 (class 2606 OID 663022)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2476 (class 2606 OID 663017)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2478 (class 2606 OID 663007)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2477 (class 2606 OID 663012)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2437 (class 2606 OID 529773)
-- Name: fk_b7229ce169e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT fk_b7229ce169e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2504 (class 2606 OID 663157)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2505 (class 2606 OID 663152)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2458 (class 2606 OID 662922)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2497 (class 2606 OID 663117)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2442 (class 2606 OID 662847)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2443 (class 2606 OID 662842)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2446 (class 2606 OID 662857)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2445 (class 2606 OID 662862)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2468 (class 2606 OID 662982)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2469 (class 2606 OID 662977)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2470 (class 2606 OID 662972)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-21 17:27:24 CEST

--
-- PostgreSQL database dump complete
--

