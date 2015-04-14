--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-04-14 21:00:59 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 224 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2648 (class 0 OID 0)
-- Dependencies: 224
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 177 (class 1259 OID 352651)
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
-- TOC entry 223 (class 1259 OID 353133)
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
-- TOC entry 222 (class 1259 OID 353116)
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
-- TOC entry 215 (class 1259 OID 353032)
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
-- TOC entry 191 (class 1259 OID 352816)
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
-- TOC entry 194 (class 1259 OID 352857)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 187 (class 1259 OID 352778)
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
-- TOC entry 210 (class 1259 OID 352982)
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
-- TOC entry 189 (class 1259 OID 352803)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 193 (class 1259 OID 352851)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 179 (class 1259 OID 352671)
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
-- TOC entry 199 (class 1259 OID 352900)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 203 (class 1259 OID 352925)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 185 (class 1259 OID 352752)
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
-- TOC entry 178 (class 1259 OID 352660)
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
-- TOC entry 182 (class 1259 OID 352722)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 174 (class 1259 OID 352625)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 352644)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 352932)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 352962)
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
-- TOC entry 219 (class 1259 OID 353074)
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
-- TOC entry 181 (class 1259 OID 352701)
-- Name: popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE popa (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    sifra character varying(4) NOT NULL,
    tipkli character varying(1) DEFAULT NULL::character varying,
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
    zamejstvo character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 184 (class 1259 OID 352744)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 352906)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 183 (class 1259 OID 352729)
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
-- TOC entry 188 (class 1259 OID 352795)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 352918)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 353023)
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
-- TOC entry 218 (class 1259 OID 353067)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 352947)
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
-- TOC entry 198 (class 1259 OID 352891)
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
-- TOC entry 197 (class 1259 OID 352881)
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
-- TOC entry 217 (class 1259 OID 353057)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 353013)
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
-- TOC entry 171 (class 1259 OID 352597)
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
-- TOC entry 170 (class 1259 OID 352595)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2649 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 207 (class 1259 OID 352956)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 352634)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 352618)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 352970)
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
-- TOC entry 201 (class 1259 OID 352912)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 352862)
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
-- TOC entry 180 (class 1259 OID 352694)
-- Name: telefonska; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE telefonska (
    id uuid NOT NULL,
    oseba_id uuid,
    popa_id uuid,
    vrsta character varying(20) NOT NULL,
    stevilka character varying(30) NOT NULL,
    privzeta character varying(255) NOT NULL
);


--
-- TOC entry 196 (class 1259 OID 352868)
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
-- TOC entry 216 (class 1259 OID 353048)
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
-- TOC entry 186 (class 1259 OID 352764)
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
-- TOC entry 172 (class 1259 OID 352606)
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
-- TOC entry 221 (class 1259 OID 353098)
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
-- TOC entry 190 (class 1259 OID 352810)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 205 (class 1259 OID 352939)
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
-- TOC entry 212 (class 1259 OID 353005)
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
-- TOC entry 192 (class 1259 OID 352838)
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
-- TOC entry 220 (class 1259 OID 353088)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 352995)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2093 (class 2604 OID 352600)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2595 (class 0 OID 352651)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 353133)
-- Dependencies: 223
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 353116)
-- Dependencies: 222
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 353032)
-- Dependencies: 215
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2609 (class 0 OID 352816)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2612 (class 0 OID 352857)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2605 (class 0 OID 352778)
-- Dependencies: 187
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-552d-63ea-1ac0-61b20bd12121	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-552d-63ea-e5ee-aad819faeb62	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-552d-63ea-12e7-eada7bcca7c2	AL	ALB	008	Albania 	Albanija	\N
00040000-552d-63ea-d287-872623d0e8e3	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-552d-63ea-5ade-328e31aea13c	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-552d-63ea-e6a2-a58f2abb92e9	AD	AND	020	Andorra 	Andora	\N
00040000-552d-63ea-d327-431f61d3e789	AO	AGO	024	Angola 	Angola	\N
00040000-552d-63ea-62d5-04858f39c091	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-552d-63ea-efef-54e25a4bb00c	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-552d-63ea-a1a2-8ee60d6f33dd	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-552d-63ea-8ee7-c65868b4356b	AR	ARG	032	Argentina 	Argenitna	\N
00040000-552d-63ea-8a5d-d2548768d227	AM	ARM	051	Armenia 	Armenija	\N
00040000-552d-63ea-24ec-d562260676d6	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-552d-63ea-9d39-f4bcfb0a096a	AU	AUS	036	Australia 	Avstralija	\N
00040000-552d-63ea-805e-034d7c07ee3e	AT	AUT	040	Austria 	Avstrija	\N
00040000-552d-63ea-bc55-c4c8057db4ef	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-552d-63ea-03b9-d6afce0ed4a6	BS	BHS	044	Bahamas 	Bahami	\N
00040000-552d-63ea-1dc0-65b685612477	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-552d-63ea-896b-9b7bd634692d	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-552d-63ea-e2d6-aa0930594ea3	BB	BRB	052	Barbados 	Barbados	\N
00040000-552d-63ea-16cd-7651389e78f5	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-552d-63ea-5994-8d28e9ac9607	BE	BEL	056	Belgium 	Belgija	\N
00040000-552d-63ea-4ac6-f8e81a731e34	BZ	BLZ	084	Belize 	Belize	\N
00040000-552d-63ea-da5a-a11b98e85b8c	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-552d-63ea-8e91-4f2756f1317c	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-552d-63ea-5091-65aee9a56735	BT	BTN	064	Bhutan 	Butan	\N
00040000-552d-63ea-29f4-0a93bd77929b	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-552d-63ea-8c89-9fdecf9d9bd9	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-552d-63ea-9f4b-117c7393b3d1	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-552d-63ea-d029-ca46031c6fc0	BW	BWA	072	Botswana 	Bocvana	\N
00040000-552d-63ea-1f70-7164a782be8a	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-552d-63ea-ea47-e12b29c6a235	BR	BRA	076	Brazil 	Brazilija	\N
00040000-552d-63ea-9c96-22b03dfdc84c	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-552d-63ea-930e-60e3b9a252ef	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-552d-63ea-c960-8b478cb0b452	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-552d-63ea-50c2-615266fd0ecc	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-552d-63ea-b5e4-405fb26fc4fa	BI	BDI	108	Burundi 	Burundi 	\N
00040000-552d-63ea-a96f-d809ab52d209	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-552d-63ea-7a6f-3b60ae09e791	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-552d-63ea-977d-81642333c84d	CA	CAN	124	Canada 	Kanada	\N
00040000-552d-63ea-37c2-e4cf63ae09a8	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-552d-63ea-6b99-30898ff28235	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-552d-63ea-8773-e884b4fc66b9	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-552d-63ea-faa1-d19254023e24	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-552d-63ea-2b5d-158a4a703caa	CL	CHL	152	Chile 	Čile	\N
00040000-552d-63ea-04cc-410225a62bbd	CN	CHN	156	China 	Kitajska	\N
00040000-552d-63ea-96b2-717572aa5e22	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-552d-63ea-d7e9-f2bc16b4505d	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-552d-63ea-0702-977a3c31a2ad	CO	COL	170	Colombia 	Kolumbija	\N
00040000-552d-63ea-38f1-6b42d9e6a683	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-552d-63ea-e330-7d1d3c3045b6	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-552d-63ea-6ae7-115c56a4991c	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-552d-63ea-13f8-5ac197cd78ea	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-552d-63ea-806f-4a9f240e8dc4	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-552d-63ea-4195-d8c6b58695ef	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-552d-63ea-d76a-f1e648c15b9b	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-552d-63ea-8a47-64ab46246f52	CU	CUB	192	Cuba 	Kuba	\N
00040000-552d-63ea-8672-7c2d8da2eb48	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-552d-63ea-98ba-7a0a6f1472a1	CY	CYP	196	Cyprus 	Ciper	\N
00040000-552d-63ea-e7fb-5139d8b81e1b	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-552d-63ea-8444-cab916914a2e	DK	DNK	208	Denmark 	Danska	\N
00040000-552d-63ea-28b9-72104b570967	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-552d-63ea-b5b1-0a90d813f14c	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-552d-63ea-1a01-c378d64699f2	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-552d-63ea-0b32-336eecedc18f	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-552d-63ea-13a7-0b55408f7a59	EG	EGY	818	Egypt 	Egipt	\N
00040000-552d-63ea-070c-f80f404a6368	SV	SLV	222	El Salvador 	Salvador	\N
00040000-552d-63ea-2f0b-95120dc0e9fc	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-552d-63ea-e94a-98657f609ee3	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-552d-63ea-c128-25c4ed52023b	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-552d-63ea-af8a-e8b1d5f3856f	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-552d-63ea-6d70-19ccab929916	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-552d-63ea-fcb4-b36bb663afaa	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-552d-63ea-18d6-9022530cc936	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-552d-63ea-fd4a-a641c6989822	FI	FIN	246	Finland 	Finska	\N
00040000-552d-63ea-7f97-d4b24500367a	FR	FRA	250	France 	Francija	\N
00040000-552d-63ea-9da7-de9df087c7b2	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-552d-63ea-6415-773f4f54bff8	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-552d-63ea-5948-7b5df962e353	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-552d-63ea-2109-f837ed5ae56a	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-552d-63ea-2435-03da34ed07c0	GA	GAB	266	Gabon 	Gabon	\N
00040000-552d-63ea-9c7f-9d216be9cbc3	GM	GMB	270	Gambia 	Gambija	\N
00040000-552d-63ea-4850-f14fd8d491bc	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-552d-63ea-dc40-ec3900181ddb	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-552d-63ea-7a90-6f88063a8a60	GH	GHA	288	Ghana 	Gana	\N
00040000-552d-63ea-db56-71ed6ecccd19	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-552d-63ea-4b6b-8b140028c148	GR	GRC	300	Greece 	Grčija	\N
00040000-552d-63ea-4e95-e6c5bb43e98c	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-552d-63ea-3df6-dd95331344fc	GD	GRD	308	Grenada 	Grenada	\N
00040000-552d-63ea-006d-c30555f435c0	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-552d-63ea-b3ab-2c4ba283b765	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-552d-63ea-2ce4-bf24dba2f566	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-552d-63ea-4eb6-a7596db74775	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-552d-63ea-730f-cff0a57a231e	GN	GIN	324	Guinea 	Gvineja	\N
00040000-552d-63ea-cf77-18bf9fa955e4	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-552d-63ea-324e-acffe4ff0064	GY	GUY	328	Guyana 	Gvajana	\N
00040000-552d-63ea-ed6c-00844446aea8	HT	HTI	332	Haiti 	Haiti	\N
00040000-552d-63ea-c24d-1f83eade9119	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-552d-63ea-c5e9-70508027ea19	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-552d-63ea-e571-07a57729b61a	HN	HND	340	Honduras 	Honduras	\N
00040000-552d-63ea-7a7c-258cb6e5f0ee	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-552d-63ea-a23a-5bde3920f9c2	HU	HUN	348	Hungary 	Madžarska	\N
00040000-552d-63ea-99fb-86b2bbda81eb	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-552d-63ea-db1d-3c6a6b0c2e2b	IN	IND	356	India 	Indija	\N
00040000-552d-63ea-6977-766c0cee951e	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-552d-63ea-5c98-b6f69d9d0f53	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-552d-63ea-f99d-a4c8744c133d	IQ	IRQ	368	Iraq 	Irak	\N
00040000-552d-63ea-ded9-4d9f73a025d4	IE	IRL	372	Ireland 	Irska	\N
00040000-552d-63ea-544f-168482e5ae37	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-552d-63ea-1faf-d77038fdd689	IL	ISR	376	Israel 	Izrael	\N
00040000-552d-63ea-9f06-3c85c5b2dfd7	IT	ITA	380	Italy 	Italija	\N
00040000-552d-63ea-4fee-3f1d3e1a7a65	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-552d-63ea-303a-cc4149b8baf9	JP	JPN	392	Japan 	Japonska	\N
00040000-552d-63ea-8cbf-16d9ca8ad912	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-552d-63ea-5ca1-b5bd3282479a	JO	JOR	400	Jordan 	Jordanija	\N
00040000-552d-63ea-5b66-e0bdd9f31a17	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-552d-63ea-a162-21860137611e	KE	KEN	404	Kenya 	Kenija	\N
00040000-552d-63ea-65eb-e3ca4bfb3db7	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-552d-63ea-3b13-d7fb40161380	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-552d-63ea-690e-a0605228efb9	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-552d-63ea-9092-93cd6a366c2b	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-552d-63ea-ad6c-087eb1702b24	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-552d-63ea-7ac3-a1f2de7f0ea7	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-552d-63ea-4e30-24d78d1ed4ad	LV	LVA	428	Latvia 	Latvija	\N
00040000-552d-63ea-0c3e-570d531c084b	LB	LBN	422	Lebanon 	Libanon	\N
00040000-552d-63ea-af40-200f76d596a8	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-552d-63ea-b6a6-9e31348871f7	LR	LBR	430	Liberia 	Liberija	\N
00040000-552d-63ea-61b4-8d7e6ce7af92	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-552d-63ea-871d-b824995cf068	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-552d-63ea-f2fd-f31fc478023e	LT	LTU	440	Lithuania 	Litva	\N
00040000-552d-63ea-7b25-0de33f3d8bb6	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-552d-63ea-7eb1-34bfd6f36af7	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-552d-63ea-7cc1-36aa7ca010fe	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-552d-63ea-c515-f8f983c4df6f	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-552d-63ea-2816-37f636c7577c	MW	MWI	454	Malawi 	Malavi	\N
00040000-552d-63ea-21a7-daf4714a2913	MY	MYS	458	Malaysia 	Malezija	\N
00040000-552d-63ea-2338-4b3ae068971a	MV	MDV	462	Maldives 	Maldivi	\N
00040000-552d-63ea-55db-88c080b9a925	ML	MLI	466	Mali 	Mali	\N
00040000-552d-63ea-3f78-75a126fb9ec4	MT	MLT	470	Malta 	Malta	\N
00040000-552d-63ea-b8fe-03098aab64b0	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-552d-63ea-41f2-eee3f050c28a	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-552d-63ea-b95a-5e2944e6b7e9	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-552d-63ea-aacf-9db3196b7d4a	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-552d-63ea-1371-873116342a21	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-552d-63ea-4c17-88ff64d68fde	MX	MEX	484	Mexico 	Mehika	\N
00040000-552d-63ea-8729-6477b75cfd8b	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-552d-63ea-2c26-73de5a3b4fdc	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-552d-63ea-ddaf-931c759a8202	MC	MCO	492	Monaco 	Monako	\N
00040000-552d-63ea-567d-3d62d7d23528	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-552d-63ea-e22b-98105fa7c131	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-552d-63ea-c849-7cac05191877	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-552d-63ea-58d6-c4100efc8cc9	MA	MAR	504	Morocco 	Maroko	\N
00040000-552d-63ea-065a-d83b085866c8	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-552d-63ea-69f2-c22de2431a9e	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-552d-63ea-f817-81277cf3edc0	NA	NAM	516	Namibia 	Namibija	\N
00040000-552d-63ea-38e5-63831fe33c02	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-552d-63ea-35c4-b23fdb777989	NP	NPL	524	Nepal 	Nepal	\N
00040000-552d-63ea-4aee-a4a50a7954ab	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-552d-63ea-962a-8a5a74a92138	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-552d-63ea-7cad-38d643280627	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-552d-63ea-c44c-6f13efff52c8	NE	NER	562	Niger 	Niger 	\N
00040000-552d-63ea-7d18-5c6cabf1ea49	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-552d-63ea-7879-d1586692a1df	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-552d-63ea-033e-9af53a4290d6	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-552d-63ea-01d5-0bcebf9f461e	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-552d-63ea-72c1-d36e72db0ffd	NO	NOR	578	Norway 	Norveška	\N
00040000-552d-63ea-c2a3-62192c6bd89b	OM	OMN	512	Oman 	Oman	\N
00040000-552d-63ea-ed96-ee8ec9c619dd	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-552d-63ea-cb4d-61fa9c5001c5	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-552d-63ea-253c-f2bdd7db469d	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-552d-63ea-a511-f6b5dec25aff	PA	PAN	591	Panama 	Panama	\N
00040000-552d-63ea-a10f-fe7f083a65c2	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-552d-63ea-9a5c-cab1b312a8f7	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-552d-63ea-ba4d-ad1db045e3cc	PE	PER	604	Peru 	Peru	\N
00040000-552d-63ea-8ebd-8fe11e775a30	PH	PHL	608	Philippines 	Filipini	\N
00040000-552d-63ea-c34e-221b0f9bc9c0	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-552d-63ea-013b-58624acb1969	PL	POL	616	Poland 	Poljska	\N
00040000-552d-63ea-30c6-2d47d7b52dc5	PT	PRT	620	Portugal 	Portugalska	\N
00040000-552d-63ea-1b2d-57a38c9f3873	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-552d-63ea-6e34-9c6aa417a501	QA	QAT	634	Qatar 	Katar	\N
00040000-552d-63ea-2617-a8f91a3188dd	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-552d-63ea-2e6b-241cccb4c8c8	RO	ROU	642	Romania 	Romunija	\N
00040000-552d-63ea-6724-4f5538f33302	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-552d-63ea-7edb-e8383c535877	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-552d-63ea-267d-3c2facb8e486	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-552d-63ea-5ba3-66f0c4ea9a55	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-552d-63ea-5966-2b45fc0f12f2	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-552d-63ea-d6c4-67ef7f594163	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-552d-63ea-9ebc-fcf09d59b943	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-552d-63ea-fc63-df976bbdc171	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-552d-63ea-2443-a3eeca9986a0	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-552d-63ea-1761-fda087dc8b93	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-552d-63ea-39dc-2aa3e089c56f	SM	SMR	674	San Marino 	San Marino	\N
00040000-552d-63ea-a641-e10e9dd09eef	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-552d-63ea-6ebf-f8b3a9273dbf	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-552d-63ea-c307-4f2f45bf718b	SN	SEN	686	Senegal 	Senegal	\N
00040000-552d-63ea-bcbf-9010419dd392	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-552d-63ea-0209-a1984b15f4e9	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-552d-63ea-ce71-b210f482d661	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-552d-63ea-df29-88b9db778443	SG	SGP	702	Singapore 	Singapur	\N
00040000-552d-63ea-8039-9c99d8e1426f	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-552d-63ea-49b8-233b827f67cd	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-552d-63ea-be5a-6786e5f8d7cb	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-552d-63ea-b268-b94569d8109f	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-552d-63ea-bf53-87b0b763970d	SO	SOM	706	Somalia 	Somalija	\N
00040000-552d-63ea-14ba-bdaed21b9979	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-552d-63ea-62c4-07e16b28cdeb	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-552d-63ea-02c3-cb6a89a2619a	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-552d-63ea-7677-867478c362b6	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-552d-63ea-36a2-a0c4a983c682	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-552d-63ea-befa-fb80bab6fc45	SD	SDN	729	Sudan 	Sudan	\N
00040000-552d-63ea-93a2-04014bdce602	SR	SUR	740	Suriname 	Surinam	\N
00040000-552d-63ea-ee9d-db841ce050a5	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-552d-63ea-9da6-0056025a9cc0	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-552d-63ea-42c2-35d0985dec9d	SE	SWE	752	Sweden 	Švedska	\N
00040000-552d-63ea-1d15-9adc1ec99282	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-552d-63ea-81ac-80508250fa4d	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-552d-63ea-048b-9a388ea498f1	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-552d-63ea-b501-24650932196e	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-552d-63ea-77ff-25f37eb6b0fb	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-552d-63ea-920c-2344c7a534d5	TH	THA	764	Thailand 	Tajska	\N
00040000-552d-63ea-5f08-f088b522ad8d	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-552d-63ea-03b2-0af5a3371cc2	TG	TGO	768	Togo 	Togo	\N
00040000-552d-63ea-0cae-12b768c12a1b	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-552d-63ea-4715-3e0a4aa6adea	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-552d-63ea-7af1-b624fa301f88	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-552d-63ea-af87-e44a27ed4e7f	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-552d-63ea-23ef-a0c4783e2c26	TR	TUR	792	Turkey 	Turčija	\N
00040000-552d-63ea-7ece-8c347ab48e8a	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-552d-63ea-dc78-9dd97266cd98	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-552d-63ea-cb32-507a86424414	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-552d-63ea-f95d-e6cff24001f5	UG	UGA	800	Uganda 	Uganda	\N
00040000-552d-63ea-5613-3e0ef5b33bda	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-552d-63ea-0839-89a038909fa9	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-552d-63ea-c8f0-aae7d59431ee	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-552d-63ea-9748-3c790c97ce5c	US	USA	840	United States 	Združene države Amerike	\N
00040000-552d-63ea-a9d3-57a471df4232	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-552d-63ea-07c2-bae093d3e85c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-552d-63ea-4b3b-3bca87f377c6	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-552d-63ea-cae0-73f976963eea	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-552d-63ea-f894-aa2c8708629a	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-552d-63ea-7299-079a38a2256b	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-552d-63ea-4d8e-3b8b50a2a1e5	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-552d-63ea-b488-d233203a3e74	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-552d-63ea-69da-9667f6fffe50	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-552d-63ea-ba50-5c2558c08d16	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-552d-63ea-fe13-8e411a01e176	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-552d-63ea-c7da-e2b6b729e64f	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-552d-63ea-56bb-4d5cfac41c52	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2628 (class 0 OID 352982)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2607 (class 0 OID 352803)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2611 (class 0 OID 352851)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2597 (class 0 OID 352671)
-- Dependencies: 179
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2617 (class 0 OID 352900)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2621 (class 0 OID 352925)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2603 (class 0 OID 352752)
-- Dependencies: 185
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-552d-63ea-6360-3453b395f94b	kravaXXX	color	N;	t	f	f	\N	\N
00000000-552d-63ea-5602-b9bb22d34dd9	privzetInspicient	entity	N;	f	f	f	\N	\N
00000000-552d-63ea-257d-d002107479d9	dogodek-status	map	O:18:"Zend\\Config\\Config":4:{s:21:"	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2596 (class 0 OID 352660)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
\.


--
-- TOC entry 2600 (class 0 OID 352722)
-- Dependencies: 182
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2592 (class 0 OID 352625)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00020000-552d-63ea-b17d-90ddf24672af	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-9fa5-31a4914e62e9	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-70f0-408068f97a77	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-3360-126e5bea14bd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-f938-9e6f1b36c33a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-3a00-cac04af7f436	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-e01f-77c93d66da9a	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-8e75-bb371693cd11	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-741a-14e32860e001	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-f615-4b0ff4f1ede4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-3ee4-58c696b12e84	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-c493-58bf50b87931	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-1521-8230c2f5c919	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-288e-b3f2829a9014	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-cdce-3c0a6686eacd	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-922c-4ae20dd2cec9	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-362f-46abb5a06c75	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-921c-a328f5e71699	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-2d8b-5d44f7d36c86	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-b472-21be0bad1928	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-8c35-19c67ec991bc	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-2b65-db395ffa6592	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-05ca-4fcaf2a60be6	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-0ec7-89bdbe3d0d11	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-aae5-bf5a2688d2d3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-c8eb-f681263f1a9e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-fe3a-8909e2700b1a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-a167-d11130dccbcb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-80c2-68e9cc9a4af9	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-6e25-e6aa450db985	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-eeef-777c6a911d45	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-e40d-9abd89738eb8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-5380-503e7bdfe6e1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-a23e-860bbf03fd0e	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-d2b5-42396252ee8b	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-7db9-40efe138f0e1	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-6e39-619bd1602166	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-6101-5d88f3b3f4f6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-b7c5-5f9f7b3c4dab	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-ee54-26c2c9b5b80c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-55b6-d5e3fb2c034c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-d293-e1e0ba80d7b4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-3e4b-b55d98b6b4c6	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-5e2c-2d5ad33eedeb	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-170f-3fc6d2d304a6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-f879-4c3dc2f245dc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-7687-c7f0461dbcea	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-a0a9-d805a75a2d82	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-362b-a6403f76b1c3	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-2d2f-a8c9be224276	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-5508-273c59959878	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-9297-2912719af9fc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-d857-f4bfa6c3033f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-aac5-3bcef0d15f2b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-5947-05e8038707b5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-5403-fe5c210e5546	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-46b4-e2110139342c	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-8d06-75f9aff1155f	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-a357-630893b0ff31	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-bf85-c9a9bd96c207	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-c249-84bdcb77a396	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-27cf-64d7a23b3f07	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-2d96-f339d66d33b9	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-0286-198577e1329c	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-556e-44f95de7e409	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-c01c-53b0940704b8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-3e2d-ac883fb8f4ff	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-f79c-c6472e610225	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-6861-e2e0a67760bc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-77be-c4e1f5b421f1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-ce3e-c1e13a5c14a5	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-6cc0-1af8ad272375	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-3714-b9bb2bdc97f1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-5d45-4f9eb086abe9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-0cb0-ce815adf2ecb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-d19f-c589e3042dcc	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-d9fa-74847bff90da	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-188e-cb2a53057c24	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-dc2d-badbcd2bf032	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-1ff7-79f89b9c12f5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-afaa-716d7ec63d02	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-182f-a1b4950ffb24	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-e486-a1dc22da6733	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-7383-9e6c57d4c70c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-077d-4b159f6047e3	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-f468-d2d00ed28fe3	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-6222-15f0cffb493e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-778f-6a0a39e7edd2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-85f5-0ea908b6c142	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-89da-b26395b66793	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-ebc3-d44ed41fcae8	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-fda7-66b5f8bec7e3	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-921d-e27809b0bce0	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-ea6f-e6fb639c81b5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-5054-bb8ea7c88a18	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-5a22-56f233f10c45	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-def8-53873d21e181	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-cb29-42208ba72e68	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-bff6-c7a5b3ee4f25	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-aeb5-98b650bfc87c	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-b405-4f7f3fbbdaf9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-5ec8-b1f26cf666a9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-dbca-f021cabaeb4d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-9a41-a35571eefa64	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-07e0-7e899f30cda4	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-b48c-c01d0ab2c33d	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-b203-8adb0db34402	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-3a2a-94af3bdbdec7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-a7ab-38bd7af7ec56	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-4b98-1dc91c5e6796	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-33c1-40e4209d2fc9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-139a-1ec4cf53e02f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-6904-2099f1dbb64c	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-0723-c9da2e67d33a	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-61f4-b16587dbad80	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-3f78-e831c949aaad	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-b107-ad6a885bc013	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-888f-07edf5833cb1	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-ec29-5e924b17a255	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-fe95-6a619cef62c5	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-6071-def15d8411b0	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-553d-9e758fb53bb4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-7370-c794e5598d80	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-8d00-cd437b4fd5c6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-b305-153082fcbfdd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-14de-571c38f45428	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-88e3-ce4f1428a7d4	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-c4d2-cb7a09f340dd	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-fec5-b980702d03c6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-7d8e-0c07396b2a8e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-20ab-90a654c7e044	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-62bb-ac29fadb3068	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-3365-1bf61dc2e1f4	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-e23e-6d03bfa90d1b	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-0d2e-1a81ee516f9e	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-9c3b-a12b70cc8bc1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-e5f4-82de55d5ec29	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-3c0a-9137f46c8e2f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-7c4c-0edd07266129	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-891f-76c1ce31cc0d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-256a-4a7dc6a8c6a5	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-263a-6f2e0e3eb994	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-8c3a-2af852a1d130	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-0993-6a043c451d93	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-1940-3ac21c1e89f5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-9048-aadd9e98eab1	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-a949-eee4c7a196a6	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-d6c7-91b05d23b9a4	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-fea7-3e56e9c5fc44	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-40ad-d5f790f27f75	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-b00a-e49329da7855	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-91a6-235c7d22d421	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-257d-7387a8b80b97	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-81e9-35f08a36eec4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-75eb-6668f5cfb8dc	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-325a-d1e3a0768823	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-21b7-ae79b8c24437	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-bde8-536678698a0d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-7b53-3aa0e67b125c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-92c2-9a1e229e8e41	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-b8dd-1761c9b665db	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-b0ea-52584243535b	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-93bd-0da98546f20d	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-15d6-e4b1bdf933c0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-832c-28f263ed5e4f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-6603-39b55951be4d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-47dc-9cda78412075	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-7f29-9cdf2732964c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-f291-f07a7667b77e	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-268b-23865d48d0c9	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-8df3-6982a54cc5d4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-e384-a93eaf05b0a5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-65f1-e5cc68a0136e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-eb83-22e6916318f6	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-9e14-99467eadc0a7	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-0c2b-6cd8863bf0a8	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-00c8-a4846c64ce09	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-f386-27948aeff4e3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-91d3-fb0273d6fa47	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-e5fe-52c0134a6611	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-647d-a265506553da	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-3941-5db0a6ddcbef	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-62d5-b554d92f2a12	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-df62-db68c0b3d19a	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-abe0-e0edc6e50894	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-8021-2a7b4cd2152c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-fd6a-a26ff7909c46	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-2972-df5abc6fec73	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-3646-1f829e17ba79	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-cc08-23d6637b098b	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-cd39-a64fd34c1dfb	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-d3df-1ea036f6fce5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-8796-bb2ce49a5fcc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-94f9-8cc3ec9c9e9d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-5852-f007032efa83	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-979b-eb043dd04e88	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-3ecc-7dffca226246	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-9681-3c967fd8e2ac	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-25db-32df6bde4e51	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-3212-384dc5963e4a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-70ee-bb8f0437b889	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-7758-7f80da6a882a	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-1d11-7658197c9df6	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-fdff-cca07923ddee	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-e044-f20402e86fd8	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-7c34-51ae235818ed	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-98cf-9c2910923ab7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-ba23-b8fb126d17f5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-272a-6958cca26c16	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-e19f-fa064c9ee38b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-c868-b023a2f05f9d	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-4376-f101e1d5db3b	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-d017-78abee610c96	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-a249-5e2e6a82cbc1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-9bd9-cf883df61dbe	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-4281-6f8d6b3ed53d	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-640c-d5ae66595068	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-7839-2c254c3026b6	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-e636-9c902d2ff955	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-49b0-6ce158df97f6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-67d9-5086dc128b5c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-eb2d-26e5a157f7e5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-c5bd-509b76805f60	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-6158-24f62813d620	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-8a77-a4fc54c49c06	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-7bea-178bfeee90a3	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-e7ab-25c0aa2829ce	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-5b00-767d26511d82	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-9aa1-86b3c01f561a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-0690-1ac8611fb6e3	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-5262-3ca71bf35332	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-aabb-177e56b7e504	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-81b1-f7ab0c65b68f	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-00a3-4fce94b91ebf	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-0ec4-a5f000f4ce8a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-3c7a-b5613884205b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-bee2-d9005c734541	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-1335-8b0f410f5989	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-7aa9-f05343afdda4	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-f070-c65129b41e5d	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-2e70-ec8af227f535	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-26e4-2719b8184254	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-a171-0a25154e8769	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-9081-c8a57bc03495	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-c670-6a4ab849b42d	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-0748-bfb9f0cdc53e	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-d626-f335b0f6d44a	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-64a5-781157302308	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-3ab9-2b8457732dde	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-8759-67989765f4a0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-cda8-48051613c3a8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-11a9-2ec85fdc6479	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-141b-0cb29f4fb5b1	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-7878-105d61b1e7d6	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-97be-525b7dc9cde7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-7858-7884faa07722	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-0994-bf6b53211048	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-28ea-13160848a99d	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-cf65-db7e6c910582	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-4a78-1c941f2a3daf	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-e5c1-7305ec7fb7ce	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-88e7-f3ae6898b51d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-53e3-3de1d33eca93	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-af39-128d0179a7ba	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-4de0-0c701bf1185d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-fa01-8b141d35ab19	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-16b8-364006c5e09c	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-0688-8e96715a3dfc	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-d039-77b175c29771	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-a460-d378448363f2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-e5e1-de32b84edcdb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-9dcf-699ef17a2941	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-b6d7-21fd1d3e5a18	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-dd07-f821cf5d419b	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-6664-d742374c007e	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-63eb-1ccb1e287e05	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-0979-b73c62d70eab	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-7edc-f66228665f6a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-0d78-2b6875923cc4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-60b0-ef5108ec523c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-6dc4-69bd88c5a47d	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-560d-7e8c05d2c67c	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-947c-d232ca13b748	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-9a55-927b2bddcef8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-581e-5f39398bf7fe	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-ff5a-ea7c4043e014	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-5e55-fe5f7d7098ed	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-fb6a-796a7fe9cfe8	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-689e-51aa273acc18	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-8304-b48c73ee6eb3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-6a6d-247dc436d916	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-c87d-732b0f457a9f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-0cb5-15226a073b73	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-3b80-73d572f82ce9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-99b7-fa120ec4317f	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-4195-c57681241fa2	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-a404-2725e695c028	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-6756-73ed35b27d84	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-a916-29c65c982f44	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-eea8-bde4f2c79d45	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-d092-0c7d3257effd	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-742f-52905af84e53	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-d4ae-ca888b507d89	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-1932-32450e22d566	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-67fa-096e752b025a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-192a-37903e919c40	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-a177-ac50d6def87e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-db6c-a6bc42a63b99	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-ee28-f862c6a2e72a	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-23d9-72298216e652	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-03cd-79f418e9a1cf	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-a8b6-7d2dfb1d37b9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-34da-345f4b6f2ddb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-c334-1ddb0138c947	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-7891-1004420058e8	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-8ea1-8e6cc074727b	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-e0c2-98366b043673	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-1319-438b40b43863	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-af62-220ac204a410	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-b47b-05d602ecb3f7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-6a5d-e801989438b2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-2fcf-69df3dedca13	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-6827-627b233622dd	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-8db1-e194741739d9	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-12b9-a859c64a0fe6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-6134-760398c0f2e4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-983e-c882ddf7c2f6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-ec04-363ab6394332	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-0f6f-2b6119f27005	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-8337-c924961a9a19	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-c6c8-44f23a8b2d9d	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-1081-8c4f88c11c14	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-97e0-226b117d2257	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-b8be-f1e7941c1fdb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-c5f7-cb32e7f97b12	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-d305-489a49d4d9fd	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-9c21-47977d03c1a1	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-13be-978dba8649e6	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-5e69-e299e562ce90	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-9d55-deb59d98bcc6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-c312-d0fd98797404	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-6903-8cdfc426a3ab	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-7f36-a6fba7ef10fe	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-0e2a-2e10a0a218cf	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-367b-d16c0c2684d5	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-e8f6-06b126760c1a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-0f51-9becdb02ebe6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-c52a-7491236ee97c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-5017-5022429a446f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-5ff4-5605b0c03ca2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-29cb-53e2ebd519b7	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-c349-76c01a2e4475	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-0376-5fa5bbcfe996	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-f4b0-9a75bb4cb7aa	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-226f-58904e920bda	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-4a5a-5b34e77f55c9	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-9df7-d955c1797a20	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-bce6-639463c6f639	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-3e6f-87f83136bdf6	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-865d-07aafac7178a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-80c2-65bd9f8a0904	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-28da-32282c5187c0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-bd4c-f9b4b802ebdf	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-7e6b-9f48a7f0f121	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-578d-c81c3be1ef38	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-3aec-847a507e2879	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-de6c-c17890c54d57	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-7d74-fa697c40e5ce	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-996e-f54f1bfbdaff	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-26c5-dab4839bffda	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-a5ab-9fe7b04c2e88	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-7422-1b3735b9a1ca	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-8af8-d150fdc9219b	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-e2e9-983fdf2a49ed	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-5cbf-c1bc78e8d32c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-6c8e-128f410065df	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-a535-38200682e583	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-10df-bba898583ced	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-3f8b-c733f54658b1	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-315c-e6a8c851125e	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-6ce5-7387013831a1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-693e-41b6d821c290	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-98ea-4c871a0afee6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-e336-8468b1966614	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-2685-f720feeeaafd	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-c56d-58f491f313ff	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-c5a2-a9c9e1f9ada4	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-8f4d-15694e556826	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-3695-1a264fbf1e4e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-7ccd-8fbb5109f40e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-f5f6-bbf591cf892b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-d25a-39a016dbee9d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-020e-77286e289191	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-e491-df90f8f22a2b	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-766e-2b366c0cc906	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-1793-d197ef472ecb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-6125-afd9f9a746b7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-a74b-e08637fba449	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-b43b-c09d33db78eb	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-dd6b-06e3bad522c6	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-528c-4c01c05b71c7	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-bf24-f30307f2e939	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-30b9-dafc743b51b3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-eb08-2994f0b5d9bf	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-f05a-6195835bc47d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-be99-d89fc2e13c81	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-fc97-2ff39731a37c	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-4994-b82d218e199f	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-299e-52c15d89ec03	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-06a3-aa7c2c0606e8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-6380-983a41e6f890	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-ae8c-96522e2eabea	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-69a8-e0970f8d2e53	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-cd88-6784f29c890c	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-4ec2-e45002cf2cdc	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-79ab-0d6115cc5046	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-b78c-9ca96b853dbe	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-6733-dc36a9901530	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-3ab9-9b272324a5b7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-588d-a25455e843b2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-6127-46d639c0daa3	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-c938-be282d7c41db	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-fe8e-0451fd859366	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-9c6a-c02b439c9cc6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-4c18-e5bf64c204bc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-6cca-9198ded72fd3	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-4909-03d663698809	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-8679-af7376d820d4	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-bbf2-b239021dc8ec	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-8f93-86a6a47f7ffd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-875e-fad50483d776	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-731f-fdb1b20b5389	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-33ae-9c0b249a5057	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-bb90-43a0e1d976bd	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-0986-8a1f807510e6	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-84eb-b6cfa9f81d2d	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-b390-6d57bb34051e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-ba9e-52e0cd88630d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-21e2-dc9fa6f6740b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-0074-99121f89008e	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-eec5-5c64fdb08b6a	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-9f30-eed3c74da09a	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-5ad5-4c6b19d4744f	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-3b55-3573cacd1825	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-4aa1-f4d5f1f62c7b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-aaf6-9224218c0289	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-9fd0-d0cc3e1cc7f8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-9066-d6402fff9721	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-173d-cc0a7f459442	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-30d4-bdbed5220b8b	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-d1b3-a53f5fc03115	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-5555-1bed12094eea	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-fbbd-7d114f65b944	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-bb19-4166a11daa9d	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-8140-edf50805439f	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-413a-5fd5c66c591b	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-e085-9c24eecaba4f	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-9665-b9994bd0c31c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-22bd-7475d8be2ba9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-c370-90fe380342ac	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-3266-740afa70ccc3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-6f3d-b175174e205d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-c48e-b75a8c3b0719	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-b657-e4b15505f519	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-23d3-cf9ab878f9c0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-f71f-948f3101b99f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-fc72-8dc1f14565e5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-3adf-a93426760923	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-47f7-ab36335e56a5	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-6cf4-dcf29ac1a491	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-e0ec-78cb739f27d0	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-9981-d41e6d14f9a1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-60f5-81d431e96f38	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-01f2-4a7bbebf4ae3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-c8c8-acfe8d5d451a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-7c05-98e75989d5b8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-a9df-c66575c7266b	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-d094-afaa197732c3	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-be5d-ee471f516e00	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-8fd2-40af8e351785	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-8d86-b2327828974f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-deed-3428f92b4c87	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-5be8-ae51f96d2a42	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-4b7c-2b694908b954	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-1011-7b24405f9537	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-6bc6-bd73eaf461f0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-b83f-c909b68f32fc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-617b-2fbfc4e1f0c1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-2322-ed98b36fadeb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-f68f-37ac7a0057a3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-c968-c5f12a37305e	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-09b8-e1c8a6e7112e	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-438a-f004ce59099a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-0acd-1b630c1d9b2a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-d613-a49269dd9902	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-9b85-d5f30e79b97a	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-3392-8695c9256771	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-e53c-f476d0baec86	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-5b10-c5ac4f65036c	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-5dd8-c58b8bcd6679	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-b1b8-899b7f001ead	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-e3fb-3acc83d927ee	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-acfc-1ae8fbe04f7e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-2bc2-3191c8e7851e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-c804-5c868ccdf73c	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-a269-5c5fe6200ea7	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-7dcf-6cb5745d5316	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-fa2e-f654b25ad352	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-c8e0-2c52ee8813ed	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-31a3-0e71b8e59252	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-64c7-f697c2ff6a00	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-83b4-2e83634aeb30	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-de41-b468093d4944	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-1b3e-591ba665a958	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-f71c-6142ed78114c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-d123-a268e2095736	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-586c-fe7935025564	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-912d-20cecfc8d2b8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-34b1-20c9dcaefbc7	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-4857-a846473db4f4	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-f0b5-f4cc54fad509	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-6f19-b15950a7e794	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-683c-6b05cedede24	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-f8d7-1466210ca3ff	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-50f0-f1037c54d27c	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-36e9-9da839451c62	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-072c-0a54a5ffcc42	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-f2a8-6fa2e28fbf8c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-a7d2-eb75546e5bbc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-520e-97992f2ee69b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-27ed-97b99459b617	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-3c7c-6c6d0d4b1150	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-edb7-69026c5cbefe	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-3a27-00eed34f7a6e	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-416c-c43233f0a6c3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-3ec6-3b40296b302d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-5c01-ee9f6917e3ae	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-ae97-371e2756a220	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-321f-366dc016b621	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-3e2b-640e7f06279e	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-8cbd-3900f7fdd568	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-1e1e-24ee27cb30a7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-4a22-c4b8673021a3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-b5fc-38ab2e61da0d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-fcf5-ff3eea0610e2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-e99e-9eb8a60369bf	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-44db-e9ccee8208c9	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-dbb3-0d7c3e1c9569	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-5ace-f8532e17389d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-0ed8-48a24fd69da9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-4c5e-34fedde5f9d2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-4e17-f8ddd1d31236	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-4e9c-6399de14ea4e	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-e36c-dd7694a549e7	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-a3ac-319b06eae6c6	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-de27-c5e18e5c50e1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-8096-73ffd28d6b98	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-7202-771c8acf46af	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-79f5-22af91d0571d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-4f5d-211d0b84b0f2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-1f13-62603684cced	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-5fd7-b927109d12b1	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-a6bb-2d7496dd0a0f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-71e2-fdf10c84a113	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-f86e-8545c70d435f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-a6b3-23aabdfc1ff1	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-f835-4310d3fab25c	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-3301-725e330e1c2a	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-e4d7-1d0eb9366e56	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-4c17-8d432568ac6c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-fafe-c29097871855	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-387f-59f6530cd70a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-fb88-a226865b26af	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-a60e-477570a8959f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-9abd-2755af86dc85	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-df36-7d5f07256fa6	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-4bd5-1a602fdce170	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-9225-e97bf6104bae	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-5e34-ff507da66f3f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-1d6f-5ba88ddd86c5	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-afcc-93027bc9af94	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-5793-c762310e6145	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-e91b-6e5b768634ba	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-1cf6-5c7374f07064	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-9dc4-1f8fb94eaad1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-22aa-3359d2c48ae7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-58cb-cd342c553a14	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-82e6-848508c254de	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-bb20-9c4e62ac1d5f	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-0d12-0b4fdfb11887	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-31dc-67fb4f77d8fd	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-7a9d-df90abed13a7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-9eff-440fa1267a61	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-a9d1-6b5501d98d2a	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-91b1-b6b9d6b5bbdd	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-926f-1f62a4f811eb	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-908e-4d97f27708ff	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-b459-ffc8a07aadff	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-4f3f-eeedefdc4710	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-ea84-035d0736d65c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-9a6c-80d56a27c92b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-9377-43527b8aede5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-5180-151d6221e293	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-9aaf-3d23caa4b9c8	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-9c68-ee302451eca5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-88ec-d57ae16e1ce6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-f0a6-ec093ce35e60	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-2a35-af856957a54e	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-49e7-6f897e399609	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-5576-38802ad2e5c9	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-7e2a-f5070a9924c2	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-d12e-18896d152028	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-43a5-c8853fa9628c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-9ae4-b8060b08a105	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-f63e-b329e334e1ee	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-6f29-3624019cf9ae	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-6e77-bb93ccef987b	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-cc56-4e4f776faf5f	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-982c-b8373023fbe0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-8282-05020c1e2b86	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-c071-089656653a71	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-6157-f6eea80fbb06	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-3e6b-45d45653e7d6	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-a100-c7088396a970	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-f927-add00433161d	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-8140-734a56883cfb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-50ce-9eaf028f23e4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-6a91-984f7b9d4a74	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-ef0c-c59db9d109df	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-c525-51c0f5087867	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-8022-51b519e3c91c	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-4414-6bdad465fa8b	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-fd40-ea942f8f91a0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-9b73-13fd86ce2694	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-346b-a018f958ef5a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-ef81-ac1fa0ec216a	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-d543-d8ee43f17d4b	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-3126-d81d0a06e58b	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-7600-15ffaf2fe1a4	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-c9fd-bc4d82230c0f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-1298-fcbfedbe7c83	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-132d-a800f333ca9e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-e25b-f9652e323a27	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-7e0a-f4580d1efe56	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-89e1-5b158a8457a9	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-5e46-127640aa9bef	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-c49d-3c852c48262a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-f87d-55f6950d043f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-dfb1-5721fd011f24	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-b428-40afad2d7173	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-1050-383957cd64b5	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-9051-71b95d435ff1	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-e234-99c471e3a8b0	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-e1b6-2a55ece8e9f5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-4d72-01ace8d4333e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-d0b9-ef9859995908	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-cd28-0b5e98f1daaf	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-63ef-ba242b915efe	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-0f43-34d9b2e20e26	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-63ea-041b-5199e4d4bceb	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-63ea-f57d-c558540ef206	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-63ea-709c-86f4dd74dadd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-63ea-fb03-576402c34ff5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-63ea-3bf9-7be04952d653	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-63ea-564e-07b59baa6465	Role-read	Aaa - Vloga - Beri	f
00020000-552d-63ea-2f1e-7002255eff65	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-63ea-ab18-bd08deff7970	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-63ea-db41-967af8d34ec9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-63ea-8085-1967adfc9131	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-63ea-92f7-9676c74b78ca	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-63ea-82f1-8fc86240aa4a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-63ea-1d58-08dbe6cfe459	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-63ea-b335-2ae9a8c8a979	Drzava-read	Seznam držav	f
00020000-552d-63ea-9b31-735804b81d2e	Drzava-write	Urejanje držav	f
00020000-552d-63ea-b374-7bfa8fa1e41d	Popa-delete	Poslovni partner - Briši	f
00020000-552d-63ea-1e9b-c3e4221653c7	Popa-list	Poslovni partner - Beri	f
00020000-552d-63ea-c061-4601ea683580	Popa-update	Poslovni partner - Posodobi	f
00020000-552d-63ea-ef68-4fd17417bad5	Popa-create	Poslovni partner - Ustvari	f
00020000-552d-63ea-6a1f-b2fa4cf9fd8e	Posta-delete	Pošta - Briši	f
00020000-552d-63ea-282c-9d61c97352e2	Posta-list	Pošta - Beri	f
00020000-552d-63ea-95fb-2882065a119c	Posta-update	Pošta - Posodobi	f
00020000-552d-63ea-2f73-54c3ffb785dc	Posta-create	Pošta - Ustvari	f
00020000-552d-63ea-257f-5beba61ef9e8	PostniNaslov-delete	Poštni naslov - Briši	f
00020000-552d-63ea-6673-b041beb597d4	PostniNaslov-list	Poštni naslov - Beri	f
00020000-552d-63ea-3735-3a6dcb2ac4cd	PostniNaslov-update	Poštni naslov - Posodobi	f
00020000-552d-63ea-c951-1364c358bad0	PostniNaslov-create	Poštni naslov - Ustvari	f
\.


--
-- TOC entry 2594 (class 0 OID 352644)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00000000-552d-63eb-d251-f4430e7b6418	00020000-552d-63ea-b335-2ae9a8c8a979
00000000-552d-63eb-d251-f4430e7b6418	00020000-552d-63ea-288e-b3f2829a9014
00000000-552d-63eb-fa6c-34f9cc649ea8	00020000-552d-63ea-9b31-735804b81d2e
00000000-552d-63eb-fa6c-34f9cc649ea8	00020000-552d-63ea-b335-2ae9a8c8a979
\.


--
-- TOC entry 2622 (class 0 OID 352932)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2626 (class 0 OID 352962)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 353074)
-- Dependencies: 219
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2599 (class 0 OID 352701)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2602 (class 0 OID 352744)
-- Dependencies: 184
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-552d-63e9-58ca-54b5e8f521b1	8341	Adlešiči
00050000-552d-63e9-aed3-887742e9c56e	5270	Ajdovščina
00050000-552d-63e9-1545-fd160c680d11	6280	Ankaran/Ancarano
00050000-552d-63e9-5cb7-9bf671b71db5	9253	Apače
00050000-552d-63e9-7bb2-d5b7afea1d06	8253	Artiče
00050000-552d-63e9-f0a9-612fc54d5f89	4275	Begunje na Gorenjskem
00050000-552d-63e9-db75-07c9d852df34	1382	Begunje pri Cerknici
00050000-552d-63e9-94ca-74af5fd41d42	9231	Beltinci
00050000-552d-63e9-e377-df483f8616e5	2234	Benedikt
00050000-552d-63e9-d667-0f8de89435c6	2345	Bistrica ob Dravi
00050000-552d-63e9-95a7-913bd7da9795	3256	Bistrica ob Sotli
00050000-552d-63e9-ce1a-996c22eedf2d	8259	Bizeljsko
00050000-552d-63e9-0404-b75a6c8c2dcf	1223	Blagovica
00050000-552d-63e9-efff-c14b3e165ddc	8283	Blanca
00050000-552d-63e9-67b6-f94e90401fbc	4260	Bled
00050000-552d-63e9-fe99-1292c73f3ff1	4273	Blejska Dobrava
00050000-552d-63e9-82d1-ba275df8bbcb	9265	Bodonci
00050000-552d-63e9-76be-15824141c806	9222	Bogojina
00050000-552d-63e9-7626-e990cb09fe13	4263	Bohinjska Bela
00050000-552d-63e9-3620-4768b2caab3f	4264	Bohinjska Bistrica
00050000-552d-63e9-8799-9361e1fea10a	4265	Bohinjsko jezero
00050000-552d-63e9-602d-2e05f02b9d41	1353	Borovnica
00050000-552d-63e9-ab44-6bea9b4c07fb	8294	Boštanj
00050000-552d-63e9-48ef-eddc21774bee	5230	Bovec
00050000-552d-63e9-38b4-6137411cdb61	5295	Branik
00050000-552d-63e9-52af-ceff4a168bb5	3314	Braslovče
00050000-552d-63e9-7c8a-bfa8be480419	5223	Breginj
00050000-552d-63e9-e5fb-f401a4b63265	8280	Brestanica
00050000-552d-63e9-acf8-fb431630a4a3	2354	Bresternica
00050000-552d-63e9-c496-edf2bcf7e052	4243	Brezje
00050000-552d-63e9-4c0d-f8875b9a3b77	1351	Brezovica pri Ljubljani
00050000-552d-63e9-f0dd-e2fd3a8e0f6b	8250	Brežice
00050000-552d-63e9-4d31-8013c9175951	4210	Brnik - Aerodrom
00050000-552d-63e9-b01d-e323626fe1ae	8321	Brusnice
00050000-552d-63e9-a0d4-fe480cfbd819	3255	Buče
00050000-552d-63e9-1e81-330ef9dc5bdd	8276	Bučka 
00050000-552d-63e9-01c1-b5591d56a7c8	9261	Cankova
00050000-552d-63e9-6279-2760543eae91	3000	Celje 
00050000-552d-63e9-53e9-1196abd75e9c	3001	Celje - poštni predali
00050000-552d-63e9-81d6-8ca2a68a4195	4207	Cerklje na Gorenjskem
00050000-552d-63e9-a20e-67b631fe01d6	8263	Cerklje ob Krki
00050000-552d-63e9-c183-554883525640	1380	Cerknica
00050000-552d-63e9-513d-b8246e74c300	5282	Cerkno
00050000-552d-63e9-a425-e4c669579a18	2236	Cerkvenjak
00050000-552d-63e9-5611-a22a8cb069d3	2215	Ceršak
00050000-552d-63e9-2931-10c2aa4c995a	2326	Cirkovce
00050000-552d-63e9-3b36-bd77019f0c8d	2282	Cirkulane
00050000-552d-63e9-3591-ad42f25f25e7	5273	Col
00050000-552d-63e9-f8e1-00323018e248	8251	Čatež ob Savi
00050000-552d-63e9-2554-824891cdc0cb	1413	Čemšenik
00050000-552d-63e9-687d-da0d31742de4	5253	Čepovan
00050000-552d-63e9-f4c0-6d54fb9d9718	9232	Črenšovci
00050000-552d-63e9-e2f7-086210ba8d66	2393	Črna na Koroškem
00050000-552d-63e9-5f53-f7b1b798dd4d	6275	Črni Kal
00050000-552d-63e9-cdf9-08f6d0aa3bb7	5274	Črni Vrh nad Idrijo
00050000-552d-63e9-0492-97b82dcdbc31	5262	Črniče
00050000-552d-63e9-ecf9-453c8377410e	8340	Črnomelj
00050000-552d-63e9-6600-2593ad37e33e	6271	Dekani
00050000-552d-63e9-368e-fa36e304bb43	5210	Deskle
00050000-552d-63e9-9194-e9cacb2f4e47	2253	Destrnik
00050000-552d-63e9-bcd8-0bd0b674254f	6215	Divača
00050000-552d-63e9-7a9f-7a8dc5bbd5be	1233	Dob
00050000-552d-63e9-57ac-5b0e5118bc52	3224	Dobje pri Planini
00050000-552d-63e9-af12-aead7ba48309	8257	Dobova
00050000-552d-63e9-431c-0d67f909eea7	1423	Dobovec
00050000-552d-63e9-1bda-3d38ca0a68c9	5263	Dobravlje
00050000-552d-63e9-278e-b0f760ef8ff0	3204	Dobrna
00050000-552d-63e9-9c48-96cea49dbd76	8211	Dobrnič
00050000-552d-63e9-e88d-400136f3840a	1356	Dobrova
00050000-552d-63e9-b20f-222788396e06	9223	Dobrovnik/Dobronak 
00050000-552d-63e9-cb38-9f6901a8a4a1	5212	Dobrovo v Brdih
00050000-552d-63e9-8363-bf0f8f58b223	1431	Dol pri Hrastniku
00050000-552d-63e9-8cd5-06d424d8ebed	1262	Dol pri Ljubljani
00050000-552d-63e9-66d8-787c69ba7f1c	1273	Dole pri Litiji
00050000-552d-63e9-de7a-1a5b3d355af8	1331	Dolenja vas
00050000-552d-63e9-a3d0-d5b834134cd4	8350	Dolenjske Toplice
00050000-552d-63e9-a678-63a7751e4379	1230	Domžale
00050000-552d-63e9-5a55-8940f78ca123	2252	Dornava
00050000-552d-63e9-3cf4-d71a9a8aa8fc	5294	Dornberk
00050000-552d-63e9-80fb-cc122d684476	1319	Draga
00050000-552d-63e9-b031-1d6106b38a7b	8343	Dragatuš
00050000-552d-63e9-4442-dbf93c896d44	3222	Dramlje
00050000-552d-63e9-18a3-7d17801e1775	2370	Dravograd
00050000-552d-63e9-2fcc-87c6d0a02761	4203	Duplje
00050000-552d-63e9-0f76-a82d8b4eff6b	6221	Dutovlje
00050000-552d-63e9-1bc0-b5686355f82f	8361	Dvor
00050000-552d-63e9-aa33-b57cf0ac2be4	2343	Fala
00050000-552d-63e9-c1be-11f714caa1d1	9208	Fokovci
00050000-552d-63e9-53a8-0697380dcc6f	2313	Fram
00050000-552d-63e9-8773-cf08d27bbb3f	3213	Frankolovo
00050000-552d-63e9-28ae-366d1318e213	1274	Gabrovka
00050000-552d-63e9-62ff-f8db1d84f05d	8254	Globoko
00050000-552d-63e9-c12c-bcaac9a20545	5275	Godovič
00050000-552d-63e9-c54d-53f318a0f505	4204	Golnik
00050000-552d-63e9-a933-42b1173e7ac7	3303	Gomilsko
00050000-552d-63e9-cc1a-d9fcd5f1feff	4224	Gorenja vas
00050000-552d-63e9-bf6f-4e1a9ef69306	3263	Gorica pri Slivnici
00050000-552d-63e9-a79e-562e014f6ddf	2272	Gorišnica
00050000-552d-63e9-aa39-0ac8daf20e1b	9250	Gornja Radgona
00050000-552d-63e9-c15a-aec990c4a054	3342	Gornji Grad
00050000-552d-63e9-ae0b-8dba537464b3	4282	Gozd Martuljek
00050000-552d-63e9-b21d-acd71f36347f	6272	Gračišče
00050000-552d-63e9-3b4f-c212821c953d	9264	Grad
00050000-552d-63e9-4179-94a069aab48f	8332	Gradac
00050000-552d-63e9-c176-0df877dfbf4e	1384	Grahovo
00050000-552d-63e9-b0f1-8f53ca484fd3	5242	Grahovo ob Bači
00050000-552d-63e9-14e8-ad8377a8771b	5251	Grgar
00050000-552d-63e9-3a7b-22ee95fb36ff	3302	Griže
00050000-552d-63e9-b1a8-d78dabf26e45	3231	Grobelno
00050000-552d-63e9-9ecc-8047b168a82b	1290	Grosuplje
00050000-552d-63e9-936c-8b862bf3a44c	2288	Hajdina
00050000-552d-63e9-26bc-8397dd5d2bd2	8362	Hinje
00050000-552d-63e9-8692-42b26e0c1c28	2311	Hoče
00050000-552d-63e9-f3d8-32ec85a545f4	9205	Hodoš/Hodos
00050000-552d-63e9-0b95-a19c9a32ee04	1354	Horjul
00050000-552d-63e9-710b-a32916cc043f	1372	Hotedršica
00050000-552d-63e9-970a-4a8631b37b30	1430	Hrastnik
00050000-552d-63e9-6b53-c6e8d0c9ee2a	6225	Hruševje
00050000-552d-63e9-e624-54e2aad1761c	4276	Hrušica
00050000-552d-63e9-3048-83dd95b750f2	5280	Idrija
00050000-552d-63e9-d02c-da0d169d656d	1292	Ig
00050000-552d-63e9-e9c2-16727c52fe18	6250	Ilirska Bistrica
00050000-552d-63e9-8c8b-a39858fe5a93	6251	Ilirska Bistrica-Trnovo
00050000-552d-63e9-f701-d6f74161a7c0	1295	Ivančna Gorica
00050000-552d-63e9-2af8-e46bc77ff85d	2259	Ivanjkovci
00050000-552d-63e9-145d-7380871556be	1411	Izlake
00050000-552d-63e9-1dba-8f6ca3cfc088	6310	Izola/Isola
00050000-552d-63e9-760c-70f260564c23	2222	Jakobski Dol
00050000-552d-63e9-54c8-1c80b5ec0e7a	2221	Jarenina
00050000-552d-63e9-96a4-edd2048a212a	6254	Jelšane
00050000-552d-63e9-54e9-7de761257e14	4270	Jesenice
00050000-552d-63e9-c150-9f84c5eb47f0	8261	Jesenice na Dolenjskem
00050000-552d-63e9-8588-eb9374cee9cc	3273	Jurklošter
00050000-552d-63e9-40fe-fd3be738487c	2223	Jurovski Dol
00050000-552d-63e9-5a73-426ed41219a3	2256	Juršinci
00050000-552d-63e9-6ac2-492edd531e87	5214	Kal nad Kanalom
00050000-552d-63e9-783f-508f6c175682	3233	Kalobje
00050000-552d-63e9-7041-58d832edbcb3	4246	Kamna Gorica
00050000-552d-63e9-3d62-099b2ba90180	2351	Kamnica
00050000-552d-63e9-82fa-f11a1719a288	1241	Kamnik
00050000-552d-63e9-e157-341c186cfabe	5213	Kanal
00050000-552d-63e9-a188-18c92d6f15f5	8258	Kapele
00050000-552d-63e9-0787-827a14903cc7	2362	Kapla
00050000-552d-63e9-606c-f35892125f83	2325	Kidričevo
00050000-552d-63e9-00c7-9a69e373b818	1412	Kisovec
00050000-552d-63e9-d1ce-f4ad5b4f41b4	6253	Knežak
00050000-552d-63e9-c5c1-d071c973e64a	5222	Kobarid
00050000-552d-63e9-b14d-1642125ff707	9227	Kobilje
00050000-552d-63e9-711c-e03b5e930d3a	1330	Kočevje
00050000-552d-63e9-036f-c3c76e136c8c	1338	Kočevska Reka
00050000-552d-63e9-0604-ad0cb8f34db4	2276	Kog
00050000-552d-63e9-6836-549178fe8616	5211	Kojsko
00050000-552d-63e9-54d6-b8afdb7d01eb	6223	Komen
00050000-552d-63e9-6f35-e88688208ba8	1218	Komenda
00050000-552d-63e9-ab8a-f1d7557229d6	6000	Koper/Capodistria 
00050000-552d-63e9-625e-ac122e55e05a	6001	Koper/Capodistria - poštni predali
00050000-552d-63e9-8c5b-3f58a1fe9a6b	8282	Koprivnica
00050000-552d-63e9-07b2-eabc2dff7b08	5296	Kostanjevica na Krasu
00050000-552d-63e9-37d2-c768448def3d	8311	Kostanjevica na Krki
00050000-552d-63e9-b316-5c162f2b56a5	1336	Kostel
00050000-552d-63e9-7ec0-63c5e07c79dc	6256	Košana
00050000-552d-63e9-3189-034a9469d74e	2394	Kotlje
00050000-552d-63e9-7fba-dea8ffd7ecc9	6240	Kozina
00050000-552d-63e9-5fca-c555489f26d5	3260	Kozje
00050000-552d-63e9-5074-be382ee32863	4000	Kranj 
00050000-552d-63e9-e268-1b4cb20b2803	4001	Kranj - poštni predali
00050000-552d-63e9-922e-220229b86f19	4280	Kranjska Gora
00050000-552d-63e9-bb84-65a6db49211a	1281	Kresnice
00050000-552d-63e9-8d4f-bf123a7f333d	4294	Križe
00050000-552d-63e9-7bd0-772b543c3803	9206	Križevci
00050000-552d-63e9-48fd-b8a114d55469	9242	Križevci pri Ljutomeru
00050000-552d-63e9-c4d5-3e561de6dfff	1301	Krka
00050000-552d-63e9-24ad-3024a11147f2	8296	Krmelj
00050000-552d-63e9-50ed-1530d90972bf	4245	Kropa
00050000-552d-63e9-79c3-6397e0e4fa95	8262	Krška vas
00050000-552d-63e9-d1f4-cf817efc02fe	8270	Krško
00050000-552d-63e9-ce16-33e217459352	9263	Kuzma
00050000-552d-63e9-4aee-5b8bbddd3bed	2318	Laporje
00050000-552d-63e9-97df-5c62146fda78	3270	Laško
00050000-552d-63e9-1c75-38a70b21327f	1219	Laze v Tuhinju
00050000-552d-63e9-1df6-359d2df068d0	2230	Lenart v Slovenskih goricah
00050000-552d-63e9-2b51-f4aad6cd8753	9220	Lendava/Lendva
00050000-552d-63e9-d034-14abd37aa728	4248	Lesce
00050000-552d-63e9-fe68-c6712b2d825e	3261	Lesično
00050000-552d-63e9-2907-a7d055a6005c	8273	Leskovec pri Krškem
00050000-552d-63e9-1e63-964d3cc764ef	2372	Libeliče
00050000-552d-63e9-ad14-61a9df67bafd	2341	Limbuš
00050000-552d-63e9-0c58-af5efe896e3f	1270	Litija
00050000-552d-63e9-b1a9-d1772ff2ba68	3202	Ljubečna
00050000-552d-63e9-c701-1799e62fc186	1000	Ljubljana 
00050000-552d-63e9-f964-611217cde20b	1001	Ljubljana - poštni predali
00050000-552d-63e9-fb21-fc60a7d9796f	1231	Ljubljana - Črnuče
00050000-552d-63e9-ba2c-ab80be86cbd0	1261	Ljubljana - Dobrunje
00050000-552d-63e9-373b-f33c08c1c733	1260	Ljubljana - Polje
00050000-552d-63e9-0b65-d83d68e336ce	1210	Ljubljana - Šentvid
00050000-552d-63e9-6969-f2a9de79f260	1211	Ljubljana - Šmartno
00050000-552d-63e9-41b6-4ea0108cfe24	3333	Ljubno ob Savinji
00050000-552d-63e9-7d74-0d0bb7cd6201	9240	Ljutomer
00050000-552d-63e9-d4eb-5b898cbd30b9	3215	Loče
00050000-552d-63e9-7fe8-fd7caec38830	5231	Log pod Mangartom
00050000-552d-63e9-4ac6-70622b464315	1358	Log pri Brezovici
00050000-552d-63e9-8a3c-9527fc915b46	1370	Logatec
00050000-552d-63e9-ae47-276c3a83b015	1371	Logatec
00050000-552d-63e9-8f58-b9e9c6aeaa83	1434	Loka pri Zidanem Mostu
00050000-552d-63e9-4700-ab786341575c	3223	Loka pri Žusmu
00050000-552d-63e9-dad2-2e5f1969ec99	6219	Lokev
00050000-552d-63e9-a27c-2b26c985ae45	1318	Loški Potok
00050000-552d-63e9-b463-79294637e2e5	2324	Lovrenc na Dravskem polju
00050000-552d-63e9-e0b3-b3f16afaf2c7	2344	Lovrenc na Pohorju
00050000-552d-63e9-47a7-4166184b90c0	3334	Luče
00050000-552d-63e9-1cf2-a28501ffc417	1225	Lukovica
00050000-552d-63e9-1330-132bbd67c80a	9202	Mačkovci
00050000-552d-63e9-b7df-1539ea98b72c	2322	Majšperk
00050000-552d-63e9-2a81-c6cddea12a5a	2321	Makole
00050000-552d-63e9-2eb9-633fc9bf18be	9243	Mala Nedelja
00050000-552d-63e9-5083-7ec4b8df7ec8	2229	Malečnik
00050000-552d-63e9-fee3-2dd79e3e07e4	6273	Marezige
00050000-552d-63e9-93be-ad30983f4756	2000	Maribor 
00050000-552d-63e9-1f23-5bfecc01ac8c	2001	Maribor - poštni predali
00050000-552d-63e9-dcac-7e8918494925	2206	Marjeta na Dravskem polju
00050000-552d-63e9-0aa5-12ae7d50d0c9	2281	Markovci
00050000-552d-63e9-7f83-511298586481	9221	Martjanci
00050000-552d-63e9-0322-c1fc03d31cc5	6242	Materija
00050000-552d-63e9-cdbd-c397a5ec992b	4211	Mavčiče
00050000-552d-63e9-3426-1b34dc510e7e	1215	Medvode
00050000-552d-63e9-900f-1b0417dc0cb2	1234	Mengeš
00050000-552d-63e9-73df-6d698bbd2bc2	8330	Metlika
00050000-552d-63e9-60d2-4da2290ddb7a	2392	Mežica
00050000-552d-63ea-c1df-4156e3993b58	2204	Miklavž na Dravskem polju
00050000-552d-63ea-fb14-e6069d4f4b00	2275	Miklavž pri Ormožu
00050000-552d-63ea-6a86-35b515562fa2	5291	Miren
00050000-552d-63ea-f772-664cbf307881	8233	Mirna
00050000-552d-63ea-5b03-fb68ee2c8de0	8216	Mirna Peč
00050000-552d-63ea-563e-45d126cd9884	2382	Mislinja
00050000-552d-63ea-23fe-84d8ff0e27fa	4281	Mojstrana
00050000-552d-63ea-8a0d-3831036292b8	8230	Mokronog
00050000-552d-63ea-5060-9432d5ba2663	1251	Moravče
00050000-552d-63ea-de8b-51daf18f059b	9226	Moravske Toplice
00050000-552d-63ea-d5e7-64971132e205	5216	Most na Soči
00050000-552d-63ea-9a86-d8011a651eec	1221	Motnik
00050000-552d-63ea-70a3-8e639a62022f	3330	Mozirje
00050000-552d-63ea-5e19-6b9cc968ac60	9000	Murska Sobota 
00050000-552d-63ea-b2fc-38c5cfca4457	9001	Murska Sobota - poštni predali
00050000-552d-63ea-cb79-c584effb9c98	2366	Muta
00050000-552d-63ea-3c75-72a54717340d	4202	Naklo
00050000-552d-63ea-d92a-e670af1066b4	3331	Nazarje
00050000-552d-63ea-e57e-38d128004eb8	1357	Notranje Gorice
00050000-552d-63ea-f0ff-e85f0beb0fcf	3203	Nova Cerkev
00050000-552d-63ea-d077-23165e26e8d5	5000	Nova Gorica 
00050000-552d-63ea-af2d-f56478013c05	5001	Nova Gorica - poštni predali
00050000-552d-63ea-6191-a7519d008950	1385	Nova vas
00050000-552d-63ea-6746-229438fa30b6	8000	Novo mesto
00050000-552d-63ea-2ab0-75700e118191	8001	Novo mesto - poštni predali
00050000-552d-63ea-43b3-6077cdce6bf7	6243	Obrov
00050000-552d-63ea-08c7-8da8b479a7a7	9233	Odranci
00050000-552d-63ea-9aeb-5be6449a20d8	2317	Oplotnica
00050000-552d-63ea-7de8-a9cede96a002	2312	Orehova vas
00050000-552d-63ea-da85-8bd17909456e	2270	Ormož
00050000-552d-63ea-46e7-673a85030257	1316	Ortnek
00050000-552d-63ea-8d40-808b7d8abb9b	1337	Osilnica
00050000-552d-63ea-a8e5-090296f05da4	8222	Otočec
00050000-552d-63ea-2eba-b7c2ababcf51	2361	Ožbalt
00050000-552d-63ea-e2b3-630b24f046da	2231	Pernica
00050000-552d-63ea-85ed-5b0dbab40112	2211	Pesnica pri Mariboru
00050000-552d-63ea-6e43-28cc499917ad	9203	Petrovci
00050000-552d-63ea-e247-d13507def8f0	3301	Petrovče
00050000-552d-63ea-79e3-6fbabb3c428a	6330	Piran/Pirano
00050000-552d-63ea-4c91-710ca1c98094	8255	Pišece
00050000-552d-63ea-fd39-cb2b4754bf61	6257	Pivka
00050000-552d-63ea-c0d6-873817b43ad8	6232	Planina
00050000-552d-63ea-774f-0cde4fa3f638	3225	Planina pri Sevnici
00050000-552d-63ea-1098-75125d6fd5c0	6276	Pobegi
00050000-552d-63ea-2610-8c7c02d04522	8312	Podbočje
00050000-552d-63ea-011a-cf305ce6760f	5243	Podbrdo
00050000-552d-63ea-728b-6b107e89740c	3254	Podčetrtek
00050000-552d-63ea-540e-47c9d4fc9f62	2273	Podgorci
00050000-552d-63ea-09a0-fbe7db33b177	6216	Podgorje
00050000-552d-63ea-0b28-3c58be11f933	2381	Podgorje pri Slovenj Gradcu
00050000-552d-63ea-fe93-41a4e9f05ddd	6244	Podgrad
00050000-552d-63ea-c3e7-1810543d5a09	1414	Podkum
00050000-552d-63ea-bef9-51922338efcc	2286	Podlehnik
00050000-552d-63ea-14de-543018cffd1d	5272	Podnanos
00050000-552d-63ea-b361-a60c329980c9	4244	Podnart
00050000-552d-63ea-193a-8eccb4e31b01	3241	Podplat
00050000-552d-63ea-f50a-409f6e3267eb	3257	Podsreda
00050000-552d-63ea-13c9-48a4a3ec1ad9	2363	Podvelka
00050000-552d-63ea-cc64-96935ea7daf3	2208	Pohorje
00050000-552d-63ea-4753-750c666f9ca5	2257	Polenšak
00050000-552d-63ea-6b76-3377208ce321	1355	Polhov Gradec
00050000-552d-63ea-06dd-2931e4d3eca1	4223	Poljane nad Škofjo Loko
00050000-552d-63ea-0b62-59b7ee3652ab	2319	Poljčane
00050000-552d-63ea-7ff5-2b259a2e557b	1272	Polšnik
00050000-552d-63ea-0b21-a8257b89ba4a	3313	Polzela
00050000-552d-63ea-68f9-b4af02149e98	3232	Ponikva
00050000-552d-63ea-a1a1-5e648142fa12	6320	Portorož/Portorose
00050000-552d-63ea-2353-b5c00b31f4a9	6230	Postojna
00050000-552d-63ea-fc1f-0df7f4103165	2331	Pragersko
00050000-552d-63ea-dd31-e719bc81ae35	3312	Prebold
00050000-552d-63ea-5927-e9db9d9a2458	4205	Preddvor
00050000-552d-63ea-6ba0-cbfc2ad10445	6255	Prem
00050000-552d-63ea-9eb1-08bc10e4c252	1352	Preserje
00050000-552d-63ea-c1d6-afdf8aaed2ba	6258	Prestranek
00050000-552d-63ea-f8ec-95b6bd2ab198	2391	Prevalje
00050000-552d-63ea-fc74-cbd328b2632a	3262	Prevorje
00050000-552d-63ea-a3af-5ee831f3b897	1276	Primskovo 
00050000-552d-63ea-5fe4-7f1ed17f55bc	3253	Pristava pri Mestinju
00050000-552d-63ea-2a8c-1943d428177f	9207	Prosenjakovci/Partosfalva
00050000-552d-63ea-ec4f-148ceb4a1e83	5297	Prvačina
00050000-552d-63ea-9ef7-177d531911cd	2250	Ptuj
00050000-552d-63ea-2e03-d6b06d17af23	2323	Ptujska Gora
00050000-552d-63ea-6906-5a8a818ac3d5	9201	Puconci
00050000-552d-63ea-9f83-3e50df5f8c0c	2327	Rače
00050000-552d-63ea-d53b-7af8eade4fdc	1433	Radeče
00050000-552d-63ea-a5d1-17409a6460db	9252	Radenci
00050000-552d-63ea-90d8-3c4045042a70	2360	Radlje ob Dravi
00050000-552d-63ea-627b-57bbdb90502c	1235	Radomlje
00050000-552d-63ea-33ad-f792decd88d9	4240	Radovljica
00050000-552d-63ea-f10f-cd82a0a1df5f	8274	Raka
00050000-552d-63ea-b1e2-eb027e99ae0a	1381	Rakek
00050000-552d-63ea-ebc3-4e79f1ac65ff	4283	Rateče - Planica
00050000-552d-63ea-1684-6252ed3d6c0c	2390	Ravne na Koroškem
00050000-552d-63ea-ef92-e49c529d5a44	9246	Razkrižje
00050000-552d-63ea-f0aa-85c148724004	3332	Rečica ob Savinji
00050000-552d-63ea-76aa-75e2266da65e	5292	Renče
00050000-552d-63ea-5084-9b910227f642	1310	Ribnica
00050000-552d-63ea-8fb7-3551e24d9223	2364	Ribnica na Pohorju
00050000-552d-63ea-39ba-fb9311ab3683	3272	Rimske Toplice
00050000-552d-63ea-99c2-eda1b58f9489	1314	Rob
00050000-552d-63ea-d9d7-445dc298e5f3	5215	Ročinj
00050000-552d-63ea-aefc-149b40c6d9e1	3250	Rogaška Slatina
00050000-552d-63ea-06c2-a9eea06382c0	9262	Rogašovci
00050000-552d-63ea-a731-8a320e4983c6	3252	Rogatec
00050000-552d-63ea-5cb8-ba1984ab916f	1373	Rovte
00050000-552d-63ea-7c5d-1a4b07a0103b	2342	Ruše
00050000-552d-63ea-8a3c-bdffe2fe7620	1282	Sava
00050000-552d-63ea-4254-cbdc88843363	6333	Sečovlje/Sicciole
00050000-552d-63ea-8597-269bb89fb3b2	4227	Selca
00050000-552d-63ea-d6a1-e3d7bb26e4f4	2352	Selnica ob Dravi
00050000-552d-63ea-cb40-23438c4d47ab	8333	Semič
00050000-552d-63ea-0dd7-37fafdda587b	8281	Senovo
00050000-552d-63ea-9f3f-d18676d4d6ac	6224	Senožeče
00050000-552d-63ea-90ec-6eab8f2f1c71	8290	Sevnica
00050000-552d-63ea-703a-7e47ed06b05b	6210	Sežana
00050000-552d-63ea-dc32-c0365ea622fa	2214	Sladki Vrh
00050000-552d-63ea-a29c-ef4f90e8d03f	5283	Slap ob Idrijci
00050000-552d-63ea-1357-0700cb397608	2380	Slovenj Gradec
00050000-552d-63ea-62b1-303ea511df76	2310	Slovenska Bistrica
00050000-552d-63ea-6daf-a3dd9a61aa98	3210	Slovenske Konjice
00050000-552d-63ea-b820-1ff0b06ab252	1216	Smlednik
00050000-552d-63ea-d91a-d5e613acbb8c	5232	Soča
00050000-552d-63ea-35c0-0cff0beea258	1317	Sodražica
00050000-552d-63ea-9faf-61b336d5346e	3335	Solčava
00050000-552d-63ea-9282-1d5ba0320674	5250	Solkan
00050000-552d-63ea-ebea-f79ecdbf8cff	4229	Sorica
00050000-552d-63ea-22ea-52c6b618faab	4225	Sovodenj
00050000-552d-63ea-8a1f-d07fbccb666a	5281	Spodnja Idrija
00050000-552d-63ea-62d6-bd561f0a20e1	2241	Spodnji Duplek
00050000-552d-63ea-35d4-558dfc2359c3	9245	Spodnji Ivanjci
00050000-552d-63ea-323c-99ffcfd9a5e1	2277	Središče ob Dravi
00050000-552d-63ea-a8a5-6edb92484ad5	4267	Srednja vas v Bohinju
00050000-552d-63ea-c0ee-5a0939196521	8256	Sromlje 
00050000-552d-63ea-3110-94bd885156f8	5224	Srpenica
00050000-552d-63ea-cdb2-11d4ba53b946	1242	Stahovica
00050000-552d-63ea-a169-c211276acf6f	1332	Stara Cerkev
00050000-552d-63ea-c1f5-df376a7fa549	8342	Stari trg ob Kolpi
00050000-552d-63ea-2a42-de6d6729507d	1386	Stari trg pri Ložu
00050000-552d-63ea-5cf0-400e47f5abee	2205	Starše
00050000-552d-63ea-f95c-84133b505211	2289	Stoperce
00050000-552d-63ea-f130-8a54f0249060	8322	Stopiče
00050000-552d-63ea-6d9b-fdb31972aa31	3206	Stranice
00050000-552d-63ea-2eed-1d037fcca8cb	8351	Straža
00050000-552d-63ea-88a9-ee7e73d514b6	1313	Struge
00050000-552d-63ea-b31b-82ecbb5a79c5	8293	Studenec
00050000-552d-63ea-30f6-fdb1b150fe23	8331	Suhor
00050000-552d-63ea-6cc7-e767d6f6f258	2233	Sv. Ana v Slovenskih goricah
00050000-552d-63ea-da75-7c9b4a83e0e7	2235	Sv. Trojica v Slovenskih goricah
00050000-552d-63ea-f568-e42a49d91d99	2353	Sveti Duh na Ostrem Vrhu
00050000-552d-63ea-07e1-5ed2166315ca	9244	Sveti Jurij ob Ščavnici
00050000-552d-63ea-6dca-48f218969eee	3264	Sveti Štefan
00050000-552d-63ea-fc3a-08e9ef38a326	2258	Sveti Tomaž
00050000-552d-63ea-5bed-3c7323f91a48	9204	Šalovci
00050000-552d-63ea-c60b-f3c74c721848	5261	Šempas
00050000-552d-63ea-755b-29d661d00708	5290	Šempeter pri Gorici
00050000-552d-63ea-f6b3-21da3d90fd94	3311	Šempeter v Savinjski dolini
00050000-552d-63ea-6b1f-e26f9341ce32	4208	Šenčur
00050000-552d-63ea-8164-f272ebe852e9	2212	Šentilj v Slovenskih goricah
00050000-552d-63ea-c819-fe5e1b30ec32	8297	Šentjanž
00050000-552d-63ea-c7c2-bad9bfeedfec	2373	Šentjanž pri Dravogradu
00050000-552d-63ea-fbf0-456ab38a1424	8310	Šentjernej
00050000-552d-63ea-8b3e-566ac000fe63	3230	Šentjur
00050000-552d-63ea-4f71-1082efca9cb5	3271	Šentrupert
00050000-552d-63ea-9771-0e11dde48db5	8232	Šentrupert
00050000-552d-63ea-96a9-cd1f1722cad8	1296	Šentvid pri Stični
00050000-552d-63ea-2e97-3c3fd85f6bb6	8275	Škocjan
00050000-552d-63ea-fa08-927fe0458a8e	6281	Škofije
00050000-552d-63ea-0617-ef056b132f0c	4220	Škofja Loka
00050000-552d-63ea-8276-c515456aae7f	3211	Škofja vas
00050000-552d-63ea-5496-8b1265d856a9	1291	Škofljica
00050000-552d-63ea-efaa-6ae7ea7bbc4c	6274	Šmarje
00050000-552d-63ea-d997-571a5ba241d6	1293	Šmarje - Sap
00050000-552d-63ea-bc9f-aada7f23c226	3240	Šmarje pri Jelšah
00050000-552d-63ea-1d7b-63cad33876ab	8220	Šmarješke Toplice
00050000-552d-63ea-10c4-2692d2c00357	2315	Šmartno na Pohorju
00050000-552d-63ea-2515-a992ad258678	3341	Šmartno ob Dreti
00050000-552d-63ea-1724-15a0f7e97c09	3327	Šmartno ob Paki
00050000-552d-63ea-7418-ccd2f0c95f4b	1275	Šmartno pri Litiji
00050000-552d-63ea-5bef-7e37f180358d	2383	Šmartno pri Slovenj Gradcu
00050000-552d-63ea-b0b5-813fa292b099	3201	Šmartno v Rožni dolini
00050000-552d-63ea-9087-3cb8ccf041ab	3325	Šoštanj
00050000-552d-63ea-a6ac-20f51f6aa9d9	6222	Štanjel
00050000-552d-63ea-6962-33ca716d0f9c	3220	Štore
00050000-552d-63ea-d4f2-c0d1b50588b8	3304	Tabor
00050000-552d-63ea-0a39-0c7fd9b6cb00	3221	Teharje
00050000-552d-63ea-b0e8-89c3e9cf8e1e	9251	Tišina
00050000-552d-63ea-9520-17f022b7c3cb	5220	Tolmin
00050000-552d-63ea-9dd4-c97a867596d7	3326	Topolšica
00050000-552d-63ea-c2c3-832339ec3abc	2371	Trbonje
00050000-552d-63ea-a34a-1d33dd5a6620	1420	Trbovlje
00050000-552d-63ea-bf90-441f89fa92d5	8231	Trebelno 
00050000-552d-63ea-2da5-e3eb4300553e	8210	Trebnje
00050000-552d-63ea-5cae-2340735f1dbd	5252	Trnovo pri Gorici
00050000-552d-63ea-e9f6-514be043a075	2254	Trnovska vas
00050000-552d-63ea-c3ae-0ee2a2a10f40	1222	Trojane
00050000-552d-63ea-5326-ae72d53936b3	1236	Trzin
00050000-552d-63ea-9804-58c889567e2d	4290	Tržič
00050000-552d-63ea-8ab8-37724ba8d736	8295	Tržišče
00050000-552d-63ea-5187-369400c8d9c1	1311	Turjak
00050000-552d-63ea-01b1-24bbc8caab41	9224	Turnišče
00050000-552d-63ea-713a-3ca7d6c4dac9	8323	Uršna sela
00050000-552d-63ea-512a-ca054ced9050	1252	Vače
00050000-552d-63ea-e52c-390d9be790d7	3320	Velenje 
00050000-552d-63ea-0769-47ed3b5770f8	3322	Velenje - poštni predali
00050000-552d-63ea-232b-6fdb31ad306b	8212	Velika Loka
00050000-552d-63ea-4c0a-b1e3920f11c0	2274	Velika Nedelja
00050000-552d-63ea-edb0-e27eeb0b79e7	9225	Velika Polana
00050000-552d-63ea-0809-29b47415f8e3	1315	Velike Lašče
00050000-552d-63ea-7502-df653209ff2f	8213	Veliki Gaber
00050000-552d-63ea-9fdc-a41f2e58f4af	9241	Veržej
00050000-552d-63ea-7fca-63acc824152b	1312	Videm - Dobrepolje
00050000-552d-63ea-1236-b5e7f345420b	2284	Videm pri Ptuju
00050000-552d-63ea-41f8-b22c17503930	8344	Vinica
00050000-552d-63ea-8c57-d8ccaa92791e	5271	Vipava
00050000-552d-63ea-09d0-2d94c366fa42	4212	Visoko
00050000-552d-63ea-be9b-2b6fc7c3ff1d	1294	Višnja Gora
00050000-552d-63ea-1733-2cc95c841390	3205	Vitanje
00050000-552d-63ea-b5e8-9a9331436ff2	2255	Vitomarci
00050000-552d-63ea-2fbb-091bffa0a4dc	1217	Vodice
00050000-552d-63ea-ce32-36998636d461	3212	Vojnik\t
00050000-552d-63ea-ac11-57cff06d60aa	5293	Volčja Draga
00050000-552d-63ea-fef3-47983205b5b8	2232	Voličina
00050000-552d-63ea-7ba5-2115fef8fd31	3305	Vransko
00050000-552d-63ea-5de9-06e7a0e200f5	6217	Vremski Britof
00050000-552d-63ea-fdc4-611fcf2520fd	1360	Vrhnika
00050000-552d-63ea-8fc1-ac100b5848fa	2365	Vuhred
00050000-552d-63ea-ad03-31975a442287	2367	Vuzenica
00050000-552d-63ea-48a7-a83adb27cca1	8292	Zabukovje 
00050000-552d-63ea-1228-56cc2894246f	1410	Zagorje ob Savi
00050000-552d-63ea-1f41-4acf71fe26d7	1303	Zagradec
00050000-552d-63ea-a388-a50733a74f53	2283	Zavrč
00050000-552d-63ea-b87b-a96e88128bb1	8272	Zdole 
00050000-552d-63ea-86f5-3e16e4f37b01	4201	Zgornja Besnica
00050000-552d-63ea-3d5d-3a25e7dfbbaa	2242	Zgornja Korena
00050000-552d-63ea-72d1-aa6188883d54	2201	Zgornja Kungota
00050000-552d-63ea-3735-9c2849b81981	2316	Zgornja Ložnica
00050000-552d-63ea-87dc-5a66c58d67e9	2314	Zgornja Polskava
00050000-552d-63ea-d217-4ebb95d2e961	2213	Zgornja Velka
00050000-552d-63ea-1ecb-1df5e8d9fa53	4247	Zgornje Gorje
00050000-552d-63ea-48c6-07fbb58927d3	4206	Zgornje Jezersko
00050000-552d-63ea-b5c2-b692404e0cb6	2285	Zgornji Leskovec
00050000-552d-63ea-3181-4633f288336c	1432	Zidani Most
00050000-552d-63ea-7176-d6b8c0ef7873	3214	Zreče
00050000-552d-63ea-c8d0-c1b4d8b6b0b8	4209	Žabnica
00050000-552d-63ea-20ff-0595f8d8daf2	3310	Žalec
00050000-552d-63ea-9a75-65c08945629b	4228	Železniki
00050000-552d-63ea-86bc-07bf1b0e77f7	2287	Žetale
00050000-552d-63ea-ab90-b64b05a9f50f	4226	Žiri
00050000-552d-63ea-8e47-040c119e7052	4274	Žirovnica
00050000-552d-63ea-ed20-21c3fc053cc8	8360	Žužemberk
\.


--
-- TOC entry 2618 (class 0 OID 352906)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2601 (class 0 OID 352729)
-- Dependencies: 183
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2606 (class 0 OID 352795)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2620 (class 0 OID 352918)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 353023)
-- Dependencies: 214
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2636 (class 0 OID 353067)
-- Dependencies: 218
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2624 (class 0 OID 352947)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2616 (class 0 OID 352891)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2615 (class 0 OID 352881)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 353057)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 353013)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2589 (class 0 OID 352597)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-552d-63eb-3e46-81529421d632	00010000-552d-63eb-e6ce-be33c9840760	2015-04-14 21:00:59	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO.ZSUr1Mra.GuJ7wj8WRb7ih8OBKl8k6";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2650 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2625 (class 0 OID 352956)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2593 (class 0 OID 352634)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00000000-552d-63eb-52e5-51c351fa56f0	beri-vse	Polni dostop do vsega v aplikaciji.	t
00000000-552d-63eb-c06c-b3a1b2b0d9f0	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00000000-552d-63eb-d251-f4430e7b6418	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00000000-552d-63eb-02cc-8e9a83b26090	ifi-all	Polni dostop do vsega v aplikaciji.	t
00000000-552d-63eb-8773-9d095a665ba6	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00000000-552d-63eb-fa6c-34f9cc649ea8	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2591 (class 0 OID 352618)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-552d-63eb-3e46-81529421d632	00000000-552d-63eb-02cc-8e9a83b26090
00010000-552d-63eb-09c6-4a40bd1e5163	00000000-552d-63eb-d251-f4430e7b6418
\.


--
-- TOC entry 2627 (class 0 OID 352970)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2619 (class 0 OID 352912)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2613 (class 0 OID 352862)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2598 (class 0 OID 352694)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2614 (class 0 OID 352868)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 353048)
-- Dependencies: 216
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2604 (class 0 OID 352764)
-- Dependencies: 186
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2590 (class 0 OID 352606)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, username, password, enabled, expires, defaultroute, defaultrouteparams, email) FROM stdin;
00010000-552d-63eb-e6ce-be33c9840760	Konzolni	console	$2y$05$NS4xMjkyMTcwMzExMjAxROhzwm/34ZIpJve7avbaWIoaB8YBqazs.	t	\N	\N	\N	rootmail@max.si
00010000-552d-63eb-09c6-4a40bd1e5163	Anonimni	anonymous	$2y$05$NS4xMjkyMTcwMzExMjAxROPmiRANEiQNMt2UEajTFu3gI2X5WVo7i	t	\N	\N	\N	noreply@max.si
00010000-552d-63eb-3e46-81529421d632	Administrator	admin	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@max.si
\.


--
-- TOC entry 2639 (class 0 OID 353098)
-- Dependencies: 221
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2608 (class 0 OID 352810)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2623 (class 0 OID 352939)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 353005)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2610 (class 0 OID 352838)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2638 (class 0 OID 353088)
-- Dependencies: 220
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 352995)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2236 (class 2606 OID 352659)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 353137)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 353130)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 353047)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 352828)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2305 (class 2606 OID 352861)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2272 (class 2606 OID 352790)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2359 (class 2606 OID 352991)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2283 (class 2606 OID 352808)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2302 (class 2606 OID 352855)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2243 (class 2606 OID 352691)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 352904)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 352931)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2265 (class 2606 OID 352762)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2240 (class 2606 OID 352668)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2256 (class 2606 OID 352726)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2234 (class 2606 OID 352648)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2227 (class 2606 OID 352633)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 352937)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 352969)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 353084)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2251 (class 2606 OID 352719)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2262 (class 2606 OID 352750)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2330 (class 2606 OID 352910)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 352741)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2281 (class 2606 OID 352799)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 352922)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 353029)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 353072)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 352954)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2324 (class 2606 OID 352895)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2318 (class 2606 OID 352886)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 353066)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 353020)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2218 (class 2606 OID 352605)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 352960)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2225 (class 2606 OID 352622)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2229 (class 2606 OID 352642)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 352978)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2332 (class 2606 OID 352917)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2307 (class 2606 OID 352867)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2248 (class 2606 OID 352698)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 352877)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 353056)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2270 (class 2606 OID 352775)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2221 (class 2606 OID 352616)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 353112)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2287 (class 2606 OID 352814)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 352945)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2367 (class 2606 OID 353011)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 352850)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 353097)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 353004)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2290 (class 1259 OID 352835)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2249 (class 1259 OID 352721)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2339 (class 1259 OID 352938)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2333 (class 1259 OID 352924)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2334 (class 1259 OID 352923)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2285 (class 1259 OID 352815)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2360 (class 1259 OID 352994)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2361 (class 1259 OID 352992)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2362 (class 1259 OID 352993)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2385 (class 1259 OID 353085)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2386 (class 1259 OID 353086)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 353087)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2392 (class 1259 OID 353115)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2393 (class 1259 OID 353114)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2394 (class 1259 OID 353113)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2267 (class 1259 OID 352777)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2268 (class 1259 OID 352776)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2253 (class 1259 OID 352728)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2254 (class 1259 OID 352727)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2348 (class 1259 OID 352961)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2303 (class 1259 OID 352856)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2231 (class 1259 OID 352649)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2232 (class 1259 OID 352650)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2353 (class 1259 OID 352981)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2354 (class 1259 OID 352980)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2355 (class 1259 OID 352979)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2277 (class 1259 OID 352800)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2278 (class 1259 OID 352802)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2279 (class 1259 OID 352801)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2313 (class 1259 OID 352890)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2314 (class 1259 OID 352888)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2315 (class 1259 OID 352887)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2316 (class 1259 OID 352889)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2222 (class 1259 OID 352623)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2223 (class 1259 OID 352624)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2342 (class 1259 OID 352946)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2328 (class 1259 OID 352911)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2368 (class 1259 OID 353021)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2369 (class 1259 OID 353022)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2257 (class 1259 OID 352742)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2258 (class 1259 OID 352743)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2372 (class 1259 OID 353030)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2373 (class 1259 OID 353031)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2403 (class 1259 OID 353140)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2404 (class 1259 OID 353139)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2405 (class 1259 OID 353142)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2406 (class 1259 OID 353138)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2407 (class 1259 OID 353141)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2365 (class 1259 OID 353012)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2319 (class 1259 OID 352899)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2320 (class 1259 OID 352898)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2321 (class 1259 OID 352896)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2322 (class 1259 OID 352897)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2241 (class 1259 OID 352692)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2399 (class 1259 OID 353132)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 353131)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2284 (class 1259 OID 352809)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2237 (class 1259 OID 352670)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2238 (class 1259 OID 352669)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2245 (class 1259 OID 352699)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2246 (class 1259 OID 352700)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2308 (class 1259 OID 352880)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2309 (class 1259 OID 352879)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2310 (class 1259 OID 352878)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2291 (class 1259 OID 352837)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2292 (class 1259 OID 352833)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2293 (class 1259 OID 352830)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2294 (class 1259 OID 352831)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2295 (class 1259 OID 352829)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2296 (class 1259 OID 352834)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2297 (class 1259 OID 352832)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2252 (class 1259 OID 352720)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2273 (class 1259 OID 352791)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2274 (class 1259 OID 352793)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2275 (class 1259 OID 352792)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2276 (class 1259 OID 352794)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2327 (class 1259 OID 352905)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2266 (class 1259 OID 352763)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2219 (class 1259 OID 352617)
-- Name: uniq_7fb775b7f85e0677; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7f85e0677 ON uporabniki USING btree (username);


--
-- TOC entry 2347 (class 1259 OID 352955)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2244 (class 1259 OID 352693)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2263 (class 1259 OID 352751)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2384 (class 1259 OID 353073)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2230 (class 1259 OID 352643)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2298 (class 1259 OID 352836)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2432 (class 2606 OID 353273)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2435 (class 2606 OID 353258)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2434 (class 2606 OID 353263)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2430 (class 2606 OID 353283)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2436 (class 2606 OID 353253)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2431 (class 2606 OID 353278)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2433 (class 2606 OID 353268)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2418 (class 2606 OID 353193)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2453 (class 2606 OID 353368)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2451 (class 2606 OID 353363)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2452 (class 2606 OID 353358)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2429 (class 2606 OID 353248)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2459 (class 2606 OID 353408)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2461 (class 2606 OID 353398)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 353403)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2449 (class 2606 OID 353348)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2470 (class 2606 OID 353443)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2469 (class 2606 OID 353448)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2468 (class 2606 OID 353453)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2471 (class 2606 OID 353468)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2472 (class 2606 OID 353463)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2473 (class 2606 OID 353458)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2423 (class 2606 OID 353223)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2424 (class 2606 OID 353218)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2419 (class 2606 OID 353203)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2420 (class 2606 OID 353198)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2455 (class 2606 OID 353378)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2437 (class 2606 OID 353288)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2411 (class 2606 OID 353153)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2410 (class 2606 OID 353158)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2456 (class 2606 OID 353393)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2457 (class 2606 OID 353388)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2458 (class 2606 OID 353383)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2427 (class 2606 OID 353228)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2425 (class 2606 OID 353238)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2426 (class 2606 OID 353233)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2441 (class 2606 OID 353323)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2443 (class 2606 OID 353313)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2444 (class 2606 OID 353308)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2442 (class 2606 OID 353318)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2409 (class 2606 OID 353143)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2408 (class 2606 OID 353148)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2454 (class 2606 OID 353373)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2450 (class 2606 OID 353353)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2464 (class 2606 OID 353418)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2463 (class 2606 OID 353423)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2422 (class 2606 OID 353208)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2421 (class 2606 OID 353213)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2466 (class 2606 OID 353428)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2465 (class 2606 OID 353433)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2478 (class 2606 OID 353493)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2479 (class 2606 OID 353488)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2476 (class 2606 OID 353503)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2480 (class 2606 OID 353483)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2477 (class 2606 OID 353498)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2462 (class 2606 OID 353413)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2445 (class 2606 OID 353343)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2446 (class 2606 OID 353338)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2448 (class 2606 OID 353328)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2447 (class 2606 OID 353333)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2415 (class 2606 OID 353173)
-- Name: fk_b7229ce169e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT fk_b7229ce169e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2414 (class 2606 OID 353178)
-- Name: fk_b7229ce1a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT fk_b7229ce1a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2474 (class 2606 OID 353478)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2475 (class 2606 OID 353473)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2428 (class 2606 OID 353243)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2467 (class 2606 OID 353438)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2412 (class 2606 OID 353168)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2413 (class 2606 OID 353163)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2417 (class 2606 OID 353183)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2416 (class 2606 OID 353188)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2438 (class 2606 OID 353303)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2439 (class 2606 OID 353298)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2440 (class 2606 OID 353293)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-14 21:00:59 CEST

--
-- PostgreSQL database dump complete
--

