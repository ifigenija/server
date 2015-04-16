--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-04-16 11:13:38 CEST

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
-- TOC entry 177 (class 1259 OID 459701)
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
-- TOC entry 223 (class 1259 OID 460183)
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
-- TOC entry 222 (class 1259 OID 460166)
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
-- TOC entry 215 (class 1259 OID 460082)
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
-- TOC entry 191 (class 1259 OID 459866)
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
-- TOC entry 194 (class 1259 OID 459907)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 187 (class 1259 OID 459828)
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
-- TOC entry 210 (class 1259 OID 460032)
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
-- TOC entry 189 (class 1259 OID 459853)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 193 (class 1259 OID 459901)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 179 (class 1259 OID 459721)
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
-- TOC entry 199 (class 1259 OID 459950)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 203 (class 1259 OID 459975)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 185 (class 1259 OID 459802)
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
-- TOC entry 178 (class 1259 OID 459710)
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
-- TOC entry 182 (class 1259 OID 459772)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 174 (class 1259 OID 459675)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 459694)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 459982)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 460012)
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
-- TOC entry 219 (class 1259 OID 460124)
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
-- TOC entry 181 (class 1259 OID 459751)
-- Name: popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE popa (
    id uuid NOT NULL,
    drzava_id uuid,
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
-- TOC entry 184 (class 1259 OID 459794)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 459956)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 183 (class 1259 OID 459779)
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
-- TOC entry 188 (class 1259 OID 459845)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 459968)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 460073)
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
-- TOC entry 218 (class 1259 OID 460117)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 459997)
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
-- TOC entry 198 (class 1259 OID 459941)
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
-- TOC entry 197 (class 1259 OID 459931)
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
-- TOC entry 217 (class 1259 OID 460107)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 460063)
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
-- TOC entry 171 (class 1259 OID 459647)
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
-- TOC entry 170 (class 1259 OID 459645)
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
-- TOC entry 207 (class 1259 OID 460006)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 459684)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 459668)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 460020)
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
-- TOC entry 201 (class 1259 OID 459962)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 459912)
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
-- TOC entry 180 (class 1259 OID 459744)
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
-- TOC entry 196 (class 1259 OID 459918)
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
-- TOC entry 216 (class 1259 OID 460098)
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
-- TOC entry 186 (class 1259 OID 459814)
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
-- TOC entry 172 (class 1259 OID 459656)
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
-- TOC entry 221 (class 1259 OID 460148)
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
-- TOC entry 190 (class 1259 OID 459860)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 205 (class 1259 OID 459989)
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
-- TOC entry 212 (class 1259 OID 460055)
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
-- TOC entry 192 (class 1259 OID 459888)
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
-- TOC entry 220 (class 1259 OID 460138)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 460045)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2093 (class 2604 OID 459650)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2595 (class 0 OID 459701)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 460183)
-- Dependencies: 223
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 460166)
-- Dependencies: 222
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 460082)
-- Dependencies: 215
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2609 (class 0 OID 459866)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2612 (class 0 OID 459907)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2605 (class 0 OID 459828)
-- Dependencies: 187
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-552f-7d40-0a31-f3d43a3021d6	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-552f-7d40-fac2-462ceaba22c7	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-552f-7d40-4e1e-6060dad1011e	AL	ALB	008	Albania 	Albanija	\N
00040000-552f-7d40-882a-bd69767280dc	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-552f-7d40-8e59-9ec9940c183c	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-552f-7d40-9eca-1b336c6430ff	AD	AND	020	Andorra 	Andora	\N
00040000-552f-7d40-9a85-1619ae1ef7a3	AO	AGO	024	Angola 	Angola	\N
00040000-552f-7d40-2d72-87eddfd56e69	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-552f-7d40-aa12-4fd696598289	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-552f-7d40-1562-2f86bb20d992	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-552f-7d40-f972-eab8867af1e2	AR	ARG	032	Argentina 	Argenitna	\N
00040000-552f-7d40-c0dd-3cbda41ec99b	AM	ARM	051	Armenia 	Armenija	\N
00040000-552f-7d40-af8d-4f288808d22a	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-552f-7d40-a916-62d98feccc86	AU	AUS	036	Australia 	Avstralija	\N
00040000-552f-7d40-c81c-9d0d6786a659	AT	AUT	040	Austria 	Avstrija	\N
00040000-552f-7d40-3b51-e03e89cd033a	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-552f-7d40-aced-68fda709e2be	BS	BHS	044	Bahamas 	Bahami	\N
00040000-552f-7d40-c8ca-acc7957c02fe	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-552f-7d40-4895-efe349bb9aaf	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-552f-7d40-14ea-b86444e4961f	BB	BRB	052	Barbados 	Barbados	\N
00040000-552f-7d40-b744-d522b9fdedda	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-552f-7d40-971e-37b8c3e8287e	BE	BEL	056	Belgium 	Belgija	\N
00040000-552f-7d40-f91c-87d26df9317f	BZ	BLZ	084	Belize 	Belize	\N
00040000-552f-7d40-f2b5-7ddf2d0a71a8	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-552f-7d40-365d-14085bb37f4a	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-552f-7d40-2386-fb5c298a4221	BT	BTN	064	Bhutan 	Butan	\N
00040000-552f-7d40-dd78-cff0980b3ace	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-552f-7d40-37fd-bf81148e08ab	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-552f-7d40-fac1-6574a9fa2b09	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-552f-7d40-d394-73409a96349f	BW	BWA	072	Botswana 	Bocvana	\N
00040000-552f-7d40-6c13-b0b0c56a22db	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-552f-7d40-f2a3-337a5e796378	BR	BRA	076	Brazil 	Brazilija	\N
00040000-552f-7d40-1c5b-7f8155886d80	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-552f-7d40-ee4b-c359e307c823	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-552f-7d40-55e8-ac30277b889d	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-552f-7d40-cb3f-7a18ee5d6ecf	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-552f-7d40-f33a-a5a0c39add7c	BI	BDI	108	Burundi 	Burundi 	\N
00040000-552f-7d40-b0d8-9e4ebe54b8b4	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-552f-7d40-2125-7cdc6de5714b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-552f-7d40-14c4-2c1bd7f668d0	CA	CAN	124	Canada 	Kanada	\N
00040000-552f-7d40-c933-acb7c1dc5d4f	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-552f-7d40-7b5c-4dea279d61bf	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-552f-7d40-cf69-1ba085fdc64b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-552f-7d40-f3a1-aeb3dc6f4ecf	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-552f-7d40-7d85-447f3abac1c1	CL	CHL	152	Chile 	Čile	\N
00040000-552f-7d40-9c85-2662029440ee	CN	CHN	156	China 	Kitajska	\N
00040000-552f-7d40-f375-ba6e52624d7d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-552f-7d40-79a5-05cd9ac948ab	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-552f-7d40-60b4-7f04b3f849cd	CO	COL	170	Colombia 	Kolumbija	\N
00040000-552f-7d40-6b3f-9fc8fb13f632	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-552f-7d40-659a-a0d36efce204	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-552f-7d40-cb09-073899dfb321	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-552f-7d40-95a7-d77edf29d6f0	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-552f-7d40-323c-177dc3b1845e	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-552f-7d40-3532-5b2dd1813826	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-552f-7d40-9560-739dd28ce48a	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-552f-7d40-7b38-c23e3ca123c5	CU	CUB	192	Cuba 	Kuba	\N
00040000-552f-7d40-1848-dc613f3bab2b	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-552f-7d40-5972-fcfb278320a9	CY	CYP	196	Cyprus 	Ciper	\N
00040000-552f-7d40-8d3f-e2f1767f7d01	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-552f-7d40-2424-ebe0c513508f	DK	DNK	208	Denmark 	Danska	\N
00040000-552f-7d40-0b83-d02b1953289d	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-552f-7d40-5f06-de1df0c15748	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-552f-7d40-d7ff-f9fbfc4ce429	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-552f-7d40-dc8e-daf116ed921f	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-552f-7d40-96d8-8ab2f67954d9	EG	EGY	818	Egypt 	Egipt	\N
00040000-552f-7d40-3eb1-3b9a4d90149a	SV	SLV	222	El Salvador 	Salvador	\N
00040000-552f-7d40-7abf-9f35e455fac8	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-552f-7d40-f4df-194a422f5e49	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-552f-7d40-63d9-baaf8c47a41a	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-552f-7d40-445b-22e1f6fad9d7	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-552f-7d40-f27a-37d1f0f24740	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-552f-7d40-5b9d-1cf09652a1a8	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-552f-7d40-bc33-bf3979e722ea	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-552f-7d40-bc7b-b1e1d26e7e52	FI	FIN	246	Finland 	Finska	\N
00040000-552f-7d40-e893-443d921efa34	FR	FRA	250	France 	Francija	\N
00040000-552f-7d40-1c26-a6516e54a1cc	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-552f-7d41-933b-64e80017951a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-552f-7d40-92b4-ff4fd3f004c0	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-552f-7d40-c2a4-43601073e980	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-552f-7d40-c0ae-5eb639b94276	GA	GAB	266	Gabon 	Gabon	\N
00040000-552f-7d40-5fd8-772b5ba1bcf8	GM	GMB	270	Gambia 	Gambija	\N
00040000-552f-7d40-65f8-08c5dbd28312	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-552f-7d40-306d-ede894675248	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-552f-7d40-b6e9-7d2c40206865	GH	GHA	288	Ghana 	Gana	\N
00040000-552f-7d40-7e94-3e4178f29f84	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-552f-7d40-4c0a-07a09379227f	GR	GRC	300	Greece 	Grčija	\N
00040000-552f-7d40-9466-baeff8435f10	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-552f-7d40-3c3e-30ab15653c68	GD	GRD	308	Grenada 	Grenada	\N
00040000-552f-7d40-b5b1-1d8c4118108c	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-552f-7d40-5aa7-41c9a26b3110	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-552f-7d40-4d22-941464f3d602	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-552f-7d40-926a-ed02f4074a45	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-552f-7d40-7724-432a654e27ba	GN	GIN	324	Guinea 	Gvineja	\N
00040000-552f-7d40-3662-e62495d9f601	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-552f-7d40-2106-594ee8b9a762	GY	GUY	328	Guyana 	Gvajana	\N
00040000-552f-7d40-1d70-84ea9af5a12a	HT	HTI	332	Haiti 	Haiti	\N
00040000-552f-7d40-2282-77279f1df748	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-552f-7d40-5c07-b078eb97facd	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-552f-7d40-78cf-3b6b03194a77	HN	HND	340	Honduras 	Honduras	\N
00040000-552f-7d40-19bb-71c83f7956a5	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-552f-7d40-76f5-35817cfe176a	HU	HUN	348	Hungary 	Madžarska	\N
00040000-552f-7d40-3806-1cb3adeb5470	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-552f-7d40-fa28-6bf3ec5cfed3	IN	IND	356	India 	Indija	\N
00040000-552f-7d40-05f0-4cb2d5312541	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-552f-7d40-7d58-21a54a63b878	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-552f-7d40-8291-84b5c5e9af99	IQ	IRQ	368	Iraq 	Irak	\N
00040000-552f-7d40-4387-197a55a1cf51	IE	IRL	372	Ireland 	Irska	\N
00040000-552f-7d40-6300-5bd2a0763faf	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-552f-7d40-c3c1-33ffed46cf95	IL	ISR	376	Israel 	Izrael	\N
00040000-552f-7d40-676a-061da9056f14	IT	ITA	380	Italy 	Italija	\N
00040000-552f-7d40-3094-20e28c03c507	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-552f-7d40-38c6-d5fe5f370653	JP	JPN	392	Japan 	Japonska	\N
00040000-552f-7d40-8998-3d551f785707	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-552f-7d40-5079-0df95e76e6c9	JO	JOR	400	Jordan 	Jordanija	\N
00040000-552f-7d40-067d-b92042c0924a	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-552f-7d40-b96d-4487d444f64b	KE	KEN	404	Kenya 	Kenija	\N
00040000-552f-7d40-a50f-c3543143854c	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-552f-7d40-ba28-b4a77a170dcd	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-552f-7d40-7fbb-b3188e817d58	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-552f-7d40-6a4d-09e3657fd232	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-552f-7d40-7534-450c61e2d183	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-552f-7d40-5d8c-d6e373eedb55	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-552f-7d41-dc39-55c4af154d9a	LV	LVA	428	Latvia 	Latvija	\N
00040000-552f-7d41-7008-85d6ac0ffe68	LB	LBN	422	Lebanon 	Libanon	\N
00040000-552f-7d41-92b8-99521db3c228	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-552f-7d41-62ec-2cdf3c68c7e8	LR	LBR	430	Liberia 	Liberija	\N
00040000-552f-7d41-b2fe-cd240a576887	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-552f-7d41-4a37-83fba5fa7e08	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-552f-7d41-33dc-9ac87dc52826	LT	LTU	440	Lithuania 	Litva	\N
00040000-552f-7d41-4b82-aab028802a3c	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-552f-7d41-92d5-50855d0bda0b	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-552f-7d41-a113-488c360af3c1	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-552f-7d41-25f0-f7bf743a7363	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-552f-7d41-aba8-1abe25bf976c	MW	MWI	454	Malawi 	Malavi	\N
00040000-552f-7d41-023d-80b4b91bc58e	MY	MYS	458	Malaysia 	Malezija	\N
00040000-552f-7d41-1269-2018d1b3e6f0	MV	MDV	462	Maldives 	Maldivi	\N
00040000-552f-7d41-6fac-c30d26424f70	ML	MLI	466	Mali 	Mali	\N
00040000-552f-7d41-3954-b51f0b6936b1	MT	MLT	470	Malta 	Malta	\N
00040000-552f-7d41-33ff-42d4b18bbd85	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-552f-7d41-3847-7cb65f426254	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-552f-7d41-14c6-c5057fbd3abb	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-552f-7d41-c917-1ff691d9d9b8	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-552f-7d41-6e15-7e23dfd0cdc8	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-552f-7d41-3b16-9dba469c7223	MX	MEX	484	Mexico 	Mehika	\N
00040000-552f-7d41-ed84-738a8340d0f0	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-552f-7d41-9fea-d28181d76eb4	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-552f-7d41-1dd0-2bb339668140	MC	MCO	492	Monaco 	Monako	\N
00040000-552f-7d41-5297-a8c1cbadef17	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-552f-7d41-24ea-0b1d991edd92	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-552f-7d41-9f24-a81b919a9c4f	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-552f-7d41-e467-ec81215f1109	MA	MAR	504	Morocco 	Maroko	\N
00040000-552f-7d41-93cb-cd55294500d0	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-552f-7d41-035c-40373cc55aad	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-552f-7d41-aef9-875ad4196620	NA	NAM	516	Namibia 	Namibija	\N
00040000-552f-7d41-aaf1-997b5c8c144b	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-552f-7d41-4450-c39d5dd082d2	NP	NPL	524	Nepal 	Nepal	\N
00040000-552f-7d41-dee6-987148d5dd40	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-552f-7d41-fc1a-bf1de9460de8	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-552f-7d41-05a8-306f082d8a22	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-552f-7d41-7fe4-81b6e023a405	NE	NER	562	Niger 	Niger 	\N
00040000-552f-7d41-dd8b-8a1de4a09f98	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-552f-7d41-5094-ac2583827514	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-552f-7d41-bdd9-e0221f53e8fa	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-552f-7d41-953c-b982b97e69e2	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-552f-7d41-b721-dd6819369247	NO	NOR	578	Norway 	Norveška	\N
00040000-552f-7d41-c5dd-e8e0e3b5aa1d	OM	OMN	512	Oman 	Oman	\N
00040000-552f-7d41-4313-0bfd81bb2455	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-552f-7d41-73d5-61ff8ed0e780	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-552f-7d41-9e21-12c94df8e1c4	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-552f-7d41-7f3a-e957deb823ed	PA	PAN	591	Panama 	Panama	\N
00040000-552f-7d41-ea1a-b700ddf107f0	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-552f-7d41-2a24-ab3083dc63de	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-552f-7d41-c587-b3954ced8bdf	PE	PER	604	Peru 	Peru	\N
00040000-552f-7d41-3434-7740365e55c0	PH	PHL	608	Philippines 	Filipini	\N
00040000-552f-7d41-399a-a25ad8fdf738	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-552f-7d41-a324-04a5a25ec4cc	PL	POL	616	Poland 	Poljska	\N
00040000-552f-7d41-b559-7ef2e2ed7b72	PT	PRT	620	Portugal 	Portugalska	\N
00040000-552f-7d41-609e-b94224578db3	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-552f-7d41-fc34-dd4bad240cbc	QA	QAT	634	Qatar 	Katar	\N
00040000-552f-7d41-bfdb-c5fb75688d26	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-552f-7d41-323f-e8528f755e65	RO	ROU	642	Romania 	Romunija	\N
00040000-552f-7d41-7786-369c1481953f	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-552f-7d41-2ef7-5acb54f2713f	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-552f-7d41-bb09-7260ec7fcf6c	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-552f-7d41-0844-dde64de4fcb9	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-552f-7d41-802d-32fc45cfbc28	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-552f-7d41-dc8e-47e34abc3ac4	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-552f-7d41-9d83-bf75d797435d	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-552f-7d41-594f-e2c8cc98cb37	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-552f-7d41-12d6-704ede64708f	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-552f-7d41-8a61-ae895584a915	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-552f-7d41-a444-0b4baf636730	SM	SMR	674	San Marino 	San Marino	\N
00040000-552f-7d41-d3f7-a970bcfae653	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-552f-7d41-caa8-256f36390cda	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-552f-7d41-bcb1-3efd81303a48	SN	SEN	686	Senegal 	Senegal	\N
00040000-552f-7d41-2a6c-6fdb4e187e39	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-552f-7d41-62e2-255edf273f01	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-552f-7d41-8c52-d892285498c4	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-552f-7d41-72e7-a5d615025c30	SG	SGP	702	Singapore 	Singapur	\N
00040000-552f-7d41-5229-c39e37a5ff48	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-552f-7d41-2c3f-ace74fcdbe47	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-552f-7d41-5ca6-6771dadeb56d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-552f-7d41-d677-fb100ba65fd9	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-552f-7d41-094a-190234584a3b	SO	SOM	706	Somalia 	Somalija	\N
00040000-552f-7d41-b889-558ed2da3271	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-552f-7d41-aa9b-f273c9ab44bd	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-552f-7d41-4560-8babcbcdb578	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-552f-7d41-d2f4-53bdf9207f02	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-552f-7d41-544c-07edba219ac0	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-552f-7d41-2274-52860fcc514d	SD	SDN	729	Sudan 	Sudan	\N
00040000-552f-7d41-5421-28bebc0ed362	SR	SUR	740	Suriname 	Surinam	\N
00040000-552f-7d41-bcf7-4648ce535048	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-552f-7d41-26df-1d9506c99180	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-552f-7d41-397e-d052cd8207a2	SE	SWE	752	Sweden 	Švedska	\N
00040000-552f-7d41-ff87-5f1d31de2273	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-552f-7d41-d610-314d052c5f66	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-552f-7d41-9222-bdf5b9b36ef1	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-552f-7d41-7b18-90124f816030	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-552f-7d41-1bb0-e6fa99b084e0	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-552f-7d41-db53-8baf92bc6b5d	TH	THA	764	Thailand 	Tajska	\N
00040000-552f-7d41-c799-2567059147c0	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-552f-7d41-d3fe-91d93f0fa1a0	TG	TGO	768	Togo 	Togo	\N
00040000-552f-7d41-e403-1d78435e8551	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-552f-7d41-3ef7-40909a08e958	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-552f-7d41-406d-192ab70c304a	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-552f-7d41-6608-a0adbfb702ed	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-552f-7d41-6954-3bb7eb4cba10	TR	TUR	792	Turkey 	Turčija	\N
00040000-552f-7d41-b225-c6b0168849b8	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-552f-7d41-114f-ccfca717dfe3	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-552f-7d41-130c-596907742f5d	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-552f-7d41-043e-cf16c3c4d91a	UG	UGA	800	Uganda 	Uganda	\N
00040000-552f-7d41-004c-c9ca1f473b09	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-552f-7d41-527b-c133765ae603	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-552f-7d41-9638-761841cf14e3	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-552f-7d41-ea12-a3cf6a794510	US	USA	840	United States 	Združene države Amerike	\N
00040000-552f-7d41-2ac1-39e1064e647e	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-552f-7d41-4a20-fc77bab41012	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-552f-7d41-b14c-b089b7b6dfe5	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-552f-7d41-edcc-fc18104106cd	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-552f-7d41-0b9f-ecd37e429c7e	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-552f-7d41-fd91-303de984eb8f	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-552f-7d41-dc51-ad7bde959540	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-552f-7d41-691f-584df2198a15	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-552f-7d41-cbeb-e895688672d2	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-552f-7d41-f410-1a7a926ded19	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-552f-7d41-1a03-dadb083c50ea	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-552f-7d41-d714-c817c678eda2	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-552f-7d41-0ec5-9b88c219eecf	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2628 (class 0 OID 460032)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2607 (class 0 OID 459853)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2611 (class 0 OID 459901)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2597 (class 0 OID 459721)
-- Dependencies: 179
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2617 (class 0 OID 459950)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2621 (class 0 OID 459975)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2603 (class 0 OID 459802)
-- Dependencies: 185
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-552f-7d41-d503-7fe85f056570	privzetInspicient	entity	N;	f	f	f	\N	Privzeti inspicient
00000000-552f-7d41-9a84-d0d4404f5ad0	dogodek-status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-552f-7d41-db70-3575d6243c35	popa.Maxkli	array	a:2:{i:0;a:2:{s:3:"key";i:1;s:5:"value";s:6:"odprto";}i:1;a:2:{s:3:"key";i:2;s:5:"value";s:6:"zaprto";}}	f	t	f	\N	Tip poslovnega partnerja
\.


--
-- TOC entry 2596 (class 0 OID 459710)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
\.


--
-- TOC entry 2600 (class 0 OID 459772)
-- Dependencies: 182
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2592 (class 0 OID 459675)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00020000-552f-7d41-3132-c08be4f1c0a0	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-a640-27780b62ffdf	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-c6bf-5405d0fb754e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-386e-5ed6e5fc5631	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-9910-9d3e471b184c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-638a-7aeab82faa6c	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-6697-2ae73ba9ceea	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-93d6-4fe563a391b0	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-b823-84688c53b5d2	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-497f-45dab54c5584	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-3468-1e7301a4fa67	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-6801-9798894d0294	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-9d04-777f4e699b0f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-f805-5f9b550878e1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-3d57-67c2f3c2fda9	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-b1b1-c2a60299f2f7	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-61a6-c8e6d6657e32	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-db77-41315993936f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-606e-2a75208fb575	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-ce9d-86b77cafbf4c	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-06d5-15e86bf0d83f	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-7f56-6c78a06bf788	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-5ef3-2152baffdd98	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-6ab8-1b6fef90e9b3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-98dd-b289ea8554b4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-0bf3-6bdf6ac70a49	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-2194-631691d4ba2e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-f3f0-f0562319472f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-bc85-0e6acfd7f012	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-7d3a-588b1076bf1c	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-6b30-0e0da4955bc7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-27fb-91926d9a52e9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-2714-548a3e5d41ef	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-0040-236c5d2347d9	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-ca4a-ae729dd0d86f	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-5b9c-eef10c85993d	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-3198-a3db5ccc531c	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-4e2f-05131bb86952	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-1aed-b3de037411ee	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-33db-14de3c5c9168	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-d379-ad880d765c8a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-8328-964a8dce19a1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-013a-d225b40c0d2e	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-a1f9-445c070c8c38	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-f6fb-cc200aa0b908	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-cd71-c91c45ec7d7b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-2b0c-64f5de91c833	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-0eb8-a14fdc52c82f	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-e136-a27f410ad21a	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-951a-eb833840c9c6	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-7000-b0403c0364a6	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-db49-5498bbdc9104	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-df4a-d7f2e8a41a02	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-d91d-49e9293cfb41	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-1537-a1aaf1181407	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-7775-db6eef279548	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-b3f9-1ac89e56e881	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-51a4-79a8ff228fcd	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-ea15-a229e85ee3f6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-4f2c-bbd8a22fa635	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-f09f-80ac0b0a8219	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-61fb-d7f5772e3d58	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-5a1f-1921a784a4ed	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-602f-40d8888fc6de	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-758e-c4686b07f856	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-b108-44d5211d7771	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-536d-3ba013a3bfbe	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-b7dc-5e79b2997aa3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-4883-1f6060c47bde	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-ceba-bde3c765bcb5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-0c65-c18831a43719	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-d93c-aaa13cffda99	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-48e3-0a3f8ac08a28	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-0033-572116a0b243	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-abe3-3e0bc48c7038	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-c120-4a9fd88cc185	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-eedc-f3515252465e	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-7095-619f93503aeb	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-0d1d-e69f72eb5f66	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-56c3-e93fd11cf214	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-22e4-5952efd0836f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-dc73-c4d2139d9f29	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-dd53-cc06d5a42b2e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-5e79-19ab126fde26	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-82d2-d7580fe339e3	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-aa55-0491146e439e	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-6c22-d03ccacd6a1a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-222e-76234a0171f0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-96dd-6ec4fdbab6d4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-e90f-2aa891d6d9f7	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-197b-6c4d0a87e5f2	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-231b-c146ea792b5a	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-cce9-75b6d5c08af2	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-cf02-a5eac5e6ccd4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-f5e8-ea84ff8107ca	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-0e57-723a40ea38f4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-7406-ee53e03713c3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-d379-450aabf7348d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-9e0c-5fb0807e3d26	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-0663-3bf0ce5dd792	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-2e01-4c837fd8e5a7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-86dc-e29616e84db6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-005c-ddd06b0d3426	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-b4be-5ba7a886d5ad	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-2d2b-583df70e6489	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-4bcd-c44426c858cc	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-2d05-e63def14dd1a	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-08fe-1524010a635a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-3804-36cce2262fdf	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-7e3c-f484a16ec709	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-f463-59f5dc7967d5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-81f1-ac13a5beb4f6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-78b9-bbfc3dc5ad4c	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-2cf3-3188989fd6e6	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-8fcc-8d8ec02a900d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-62df-bea8e95b0302	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-876f-7557533db00a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-fd93-3381e877c070	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-d385-71cde9d9d6c9	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-f44c-0a1053e70541	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-02d1-eecc1fadf1f1	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-2854-49bc81fcb70d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-1cc6-99e82e395d58	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-43d3-6cafb2866836	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-2cbe-427ee2587b46	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-9f1a-74564c7e6102	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-4ee7-ad8936c2ca38	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-a77d-538df57594ab	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-e81c-0c43d386ab0d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-f33b-3b72b7478e15	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-d196-181bc3b832a7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-0074-d8d3618eec15	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-f34a-2e16e88b5b3b	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-6cdf-e6214d7f3dc8	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-11cb-a5d83fa0d5ca	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-bfda-beaf174a3bd7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-7e89-6f8e134efa3c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-36a0-dbb970cb60c3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-c37a-0b96cf9e324a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-8b10-5ec40077b763	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-bae5-fc101af2ae04	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-3615-614c8cd7c3a7	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-51c5-6fc4075a80e4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-2c23-c01d08044228	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-326b-cd6eaca30822	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-18f5-c37d88ee3ec2	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-a73e-0b3ceb01d0bc	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-e05c-c302b1c69401	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-4c5c-77523543fe5b	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-1465-33f97f4a22bf	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-91aa-5e65f4bafe5e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-30fe-dab8797ae510	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-1604-9a22da169df3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-56ce-039c9adabdc1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-1775-22608263a38b	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-5848-cbfd82846caf	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-e6a5-0f9ced4ebb14	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-ffc0-81fb4e98ebb7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-1758-bba9758ccd6c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-6535-0a76f305f28c	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-479a-bab0e1fbb3eb	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-3dc6-58c1704a7483	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-979a-20abb773ff65	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-675e-052a992136d9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-0596-41b8cbe28c49	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-f914-1ea22055390d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-0f05-56b6d86c2fa9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-2574-630548c9db20	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-8ed7-c70d6746cf64	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-832e-a49c84a0624e	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-cd35-7de6ccc4c802	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-0ceb-4fead2c387df	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-6ebe-c17747f0b2ce	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-630e-8e5e788f8e89	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-0e2e-c4f3da5eff0d	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-fd58-eca91c23c7dd	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-aa40-d8fa40739105	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-fd36-6d6601d97490	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-3aca-01bd3ca5f8a5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-52ce-a1d7a0f08e29	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-f593-342f365a84c0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-2bb9-9864ba8ec079	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-7ec6-d28aff2a6c68	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-7f02-d052247076af	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-93e0-87b787fdf28a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-e236-1bfac7202f7d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-0e0d-d7430fc8456b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-2b2f-c117f1613778	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-2ec5-3365934f0ead	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-9700-22d2354286fe	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-275a-3d88f6aa2bcc	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-b2aa-4cba7a275fd8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-27bf-1e37ffa7e9d9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-0cd7-123bc52ec66c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-edab-ecd336cfb91d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-7fab-b740af26d27c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-f6f3-6943eec25525	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-d81b-77060d552e27	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-d6c2-199f125b4507	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-a5a4-8f7584b919ac	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-16e7-2ccd27811764	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-a47b-98a1f9dc1f96	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-16a2-273d09d28033	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-e3ff-df658c0297e6	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-51d0-cea52b27ec1b	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-1b71-26d2d635ed5d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-f86d-7835e05d97fa	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-9b97-f8a02356e23b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-545e-eb91b64b7cdf	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-d708-b28d3f2cb219	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-42ac-102930700620	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-6551-6d5623d15e35	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-64ea-5076463c4e7d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-b08e-040893e4fc26	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-19bf-2546551f3135	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-b3c0-e34907fbb5bc	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-ab0a-862d09e43c61	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-83bc-c4621f142d2e	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-c84f-a4e1ff24d7f5	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-7d17-7d053c5174bf	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-cde8-81db17c40cb0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-2985-8c62c1317825	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-c9db-dbe587751dcd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-0b58-379d3c3887d6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-62f4-c9bf18387b9c	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-7b43-4c4ec440b8e6	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-43a4-9b3b37242563	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-6786-02565f98712b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-508c-38a784da3ee4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-1089-57fa8ea1e5a0	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-3b8c-a118c537e1bf	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-c3a1-cbe63b8cd7f6	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-0bb7-223e6f7801bd	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-0a94-1bd432886a57	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-0627-84f3427bb4d5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-9c42-86fd670caa05	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-ed86-ff1f41a2c912	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-24de-761bb33a691d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-2783-8bce76bfadee	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-5862-87c32d1362d8	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-6056-b87f13cf4e44	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-6797-6e9802fb5c9e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-220c-6d8368bb5a3d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-75c3-284d14af73fe	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-feb0-d225b07ba8f6	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-5f9c-3c6b3722e256	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-835b-aaa7a4e99f9f	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-3764-ca53fdbb6c9c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-f63d-6548fe3ae7cf	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-a4e6-1b1d86f5864a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-d743-9fca874bdbcd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-38b5-63b8b9b4ce51	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-e53f-9ac287670c75	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-c7cb-571904128de6	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-63d8-fb6340a80650	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-c58f-e276ba2ed852	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-6a2b-c45587239744	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-4ee7-d1fc6ebdab69	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-e9bb-d1176259c0c7	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-04b9-f6993fecd3ee	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-491c-34a6612f403d	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-96a5-6b8ea0c4418f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-dd15-9a8b134a04a7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-4ac1-0f69da1e2393	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-9e31-adf2ec100fd2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-c8f5-6c153e064002	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-350b-2df577061aa2	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-61ef-49f1c92e8462	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-b658-f19d7d256b59	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-af04-af2268ab16aa	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-dc84-d70352f8b547	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-d118-0a9d295cae63	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-b005-bce126624a50	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-8568-0b5356ae020e	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-ea62-36c98dbbf17a	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-d015-1a84f5901b0b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-4941-f4534015715d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-6b15-e3cefb3b0de6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-fded-f8732c3e9444	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-e987-023dcdc1ba87	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-42bc-ecb7fae47eeb	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-c31b-a84729386f74	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-469d-ac547de4e73b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-2120-babc696712b1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-c47f-d42e44d9479c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-7aa5-c3af559421ac	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-4264-33af82f6f17e	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-a62f-0507c16d0e08	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-4c51-51fab7c3773e	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-afbc-e2f28056868f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-af02-aba5c6e4cb43	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-bc8d-fa6f2a6f97ff	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-bdea-4d7b0ddf0fad	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-beba-fe95213e7e82	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-7d65-1e9dfb6aa6a9	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-a700-796a52691773	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-f2d2-79d9e49e7cb0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-5721-e780e69d3b32	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-28b4-e26ae9d424bf	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-4b17-6ed0b6fcde60	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-6322-93ae8787ecde	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-9ec7-76280096ac84	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-e2e3-f251b597df0d	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-9514-4bc36693632a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-f67d-ff15d5375dda	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-1b6c-4f2f3aec2b37	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-9072-cffb7ebbaea8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-9d7b-8b86ebc73480	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-e5c1-a513d19efee4	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-7012-0dd22ced529d	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-1693-74831788127c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-1ebf-95a447329d77	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-5f3a-eeb7cbe96158	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-021a-e4ac322f54f7	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-d6c6-3d2df5602cce	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-5571-10c2f0e24ca8	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-a207-b2978c3a0686	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-30ca-c82ec95ab5a7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-8e3a-ff7f63814de9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-6975-23e047aec621	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-eb60-462e33a74670	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-de3c-09e952002649	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-d003-71930d066e11	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-b1fe-5197df3b41d6	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-2690-d9dfb42c7b1f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-337f-d332c8c79adb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-5e90-3613315e8f56	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-36e8-1b9535569adb	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-a928-348abdfa554e	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-c151-fd84a48fd9ef	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-d9dc-3288ad258cb6	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-9dae-31644539b221	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-2c34-6c664779f3a2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-a597-9a5a7b48aabc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-c69c-16ea36efe49b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-7561-366aa0c36dfa	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-bb94-c7dd7c36950b	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-4f26-686f824d37d5	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-e342-b215aa77bebc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-7b07-909b2e251c79	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-b87b-84da22779c0d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-c20e-68016bebe17a	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-b2e8-9bc6711862b2	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-29b3-bd97e975eca5	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-9748-c67b2ed57d10	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-8098-11f67a7a75ea	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-63e6-86b7c0a956f0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-11ad-6c5b01f6a5a8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-01b8-17b572d7b574	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-2bb1-564a3d29d253	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-73ee-b974e66d915c	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-2006-b5c97d52fad2	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-48cf-2dae498c9db6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-52cd-486ad5118140	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-ff44-759edad41e3f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-db6d-5ddc37d56e2e	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-fafb-7194536e0cc1	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-06cb-d40f3738e057	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-8536-16c700cbd5ee	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-df39-4e4585018783	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-fdfe-b18898de8cc6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-9f6d-5df75abcc0de	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-f456-365b33a01784	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-0d9e-d286c06f0f8d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-ff0f-13150d1bd4d0	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-e293-7375c133cb37	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-60d1-bb117fc7c0bf	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-d2ae-5fa661ce3baa	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-8bbe-8204fb78238f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-26ef-90a69dbb3064	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-9f20-dbad0370d0c0	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-045d-8f1614502719	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-273e-39d29520805e	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-0f7f-a0d3fc1d0f5e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-6e0f-fbf264f77f81	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-4a5b-d081f98df63c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-1b05-8d6bc00effa0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-c9ed-d6cf4123c9c2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-08f3-6f87ea841789	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-09fd-04733b99bcfc	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-4213-45e315800313	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-e8c3-cce3cf433073	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-8385-87bdd7d1fd31	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-4833-b3893a05b1af	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-6774-738d5fa5804c	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-38f3-89300944faff	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-39b3-42f1536cecf7	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-7bb1-4cb13d510331	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-0af1-ca219fd70ef9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-3e82-d5e5f776b40d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-e7a3-a45ea97e6bca	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-def7-1b1d5939fc5b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-fc2a-07ec3e669fec	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-d052-9a4446f94efa	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-f71a-1409939b459f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-946d-340b5236c995	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-cb67-5dd630910f11	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-388d-bd8cb1e05a36	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-c717-ed35f7a9869a	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-2a67-467d5eb519c6	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-1184-2e1ee1b94a4f	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-aeb2-8593e687458f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-ca9a-6701bb2bd90a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-9932-dc875639e918	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-087b-d9c40fea40e1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-6f8c-39c1be75dfeb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-a7be-0c0c0a3e6ea2	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-d7fd-2464b46e5659	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-ea5c-76a909ff592b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-6e4c-9e3811116f99	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-7235-94963282b17b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-ffe2-cc9232b30870	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-c21c-7406c56cfae9	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-613e-6949b83d444b	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-5aa9-4e26c5aea5eb	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-26c8-4f0238ed3f0f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-6e56-df50d13b3072	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-3af1-836456061078	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-89d8-cadd7863cf43	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-e098-c35135c98bab	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-e11f-a4ae98c6d72b	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-7b1d-0e1258c992f3	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-7f40-48dbf5502b4a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-d263-98b96d51dce8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-f9c5-44846d6d9ce2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-4d8d-79d6f87a31cc	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-6319-1b4cfd1331b4	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-337d-c4fac87a9167	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-2c9c-1e5686a55941	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-2ba7-75f038fcd547	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-da20-ebd01901f90e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-cb18-81aab78616df	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-bbdc-69be3410e306	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-2af4-18aa7230beb8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-13bd-e840fd155b7c	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-443e-bdeb6550065a	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-0ffa-005dcc69cfb3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-8af0-f22ed2f59dc0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-52b9-e4a82a77e033	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-7d93-9fd0f6d937f5	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-4011-a6991d26b75e	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-3765-bf5f7e8dee38	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-c910-eeee1bc6ccee	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-3354-0adb6c61c843	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-7d35-f604136f6ee8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-096b-201e41a0c7a4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-a5c6-d3090afef773	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-aa23-48e9bff681d6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-b0cf-c990d4b08851	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-7095-9ce30760e2bb	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-e786-25d56dec3ec5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-472d-014fe594ad51	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-4449-eaaa71a53a56	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-605d-2c7967c0a28a	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-3849-401885f25632	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-e135-8436e53dd0fb	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-c443-74d754254cdd	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-968e-1fbf8f2b19a3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-2653-7ed60cb39f62	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-dca2-7979b8d31064	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-6c4c-9c191f72c0ba	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-d8fb-42f1b80a3de1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-a74e-dfbc4ceca700	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-3d18-c70b2122c72a	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-f384-ed44285eb68e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-e7a6-d5b4faa41328	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-f9c9-ebe222ca563d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-f8a1-45fd60e15ac6	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-e0ff-a23146ef6b5e	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-bc23-b4ad8a3c92c3	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-e924-007b52de899f	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-3387-5eb509a69f6b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-517d-45314ac28969	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-3256-27fd03a6d3b6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-d3f7-7e361284b083	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-5eff-5c995f21817e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-f1e5-fe31f1bb3486	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-5828-7cf41bc91dab	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-9bf9-618485c3cbf9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-14ff-0f10e33437a8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-946e-7cee2c396103	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-238d-bbb8ff95ebe9	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-6ef6-0283ea75140a	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-0852-64e821efb413	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-6926-35323fda5127	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-0663-c8e95a6ef32e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-1db4-44e4ca27438e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-b2c7-65c8bd34304b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-2d69-85f73559cce0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-fb02-32e7ccf19e07	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-c3f8-b7e4037fee01	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-7e09-709f5c4e9f58	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-e990-446705fbde8d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-9866-ecd2f62f67a3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-68a3-c9781bd0dc02	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-bfb7-01484d932539	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-4073-0f07de8f6efa	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-49c9-4c21ec0943a7	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-bfc2-1f982ca0b4ed	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-8f7d-586da8acc347	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-7181-878d460a501b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-efee-849a3faf59d7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-0f82-080b6782fdd8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-4085-d5080c2dd412	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-48a6-3e120e793486	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-7206-195f8cba1a86	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-887f-a340924dbd72	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-d3e2-7589cebb953a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-c760-111346482e40	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-90f3-065f9e27999f	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-bbea-99fc4f9aa314	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-b145-cd5c5ee467fb	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-aceb-b05e042621b4	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-7f62-2da3708147d4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-7193-35965aa3327c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-29ba-51e6e38bcbdf	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-8b92-32287db96f95	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-dfa8-7ac71dee7523	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-5d3f-5b533ec7c814	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-7554-1914f2993a9e	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-aaa9-e466eded0f6c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-fc48-240ae6ae9ff0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-5ce2-529a9e9a3630	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-4c56-5c3fcfd77e21	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-45a0-3a05dd316c90	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-579c-e53572f25ce2	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-bf16-8f5d50c8acb4	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-8d5b-91163749853c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-69dd-7a4deb596806	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-5dca-b321466a1a28	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-98f1-ab8d615ca319	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-2f8f-61e0c9dbd4e4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-92d9-2bab985bda8b	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-59b2-5b7bafeac6cf	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-c843-febe3cdc6373	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-c50e-cf83dbd32eb2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-66d4-df969acddf33	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-718e-7d7ee691bab7	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-7ebf-1702debb8bfc	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-69f3-2e62c9c9c120	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-37e3-450d7d4f7c66	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-1957-be27cac62e40	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-06c2-36ee8fa6d770	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-68af-0b7ca135f536	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-c76f-edec64c9e4c5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-4133-ffd65c7178d6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-c098-569932492fed	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-c266-9cad0661c005	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-b02e-ce9eccb67024	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-6abb-458a65bec070	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-81c6-42f2c5aa39d8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-ee95-0664a833ba80	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-89d7-55be86df08a0	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-d710-5a020787b4c8	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-e70b-42943438649f	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-21fa-9e0a6becfc84	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-54a8-3d5ae8cc521e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-168e-79b641828f0c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-5dab-2ae8a78d9b4b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-0ac9-717458232f42	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-1ccf-27ae254adde1	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-1765-0b80dd34ca57	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-e92a-24e257874bdc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-91dc-c112c6bd5633	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-88c5-dc836edacb13	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-4b01-a16926b0e91d	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-eb7a-5d7fe5f13f43	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-1942-a9151c157113	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-a8c7-55dc06977be6	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-5e77-a02133bb0b0c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-488a-c28f07662c60	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-7587-3e0c2e869d82	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-a5b5-e2fa8431d6f7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-7a66-0f98a253b6c5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-d4e8-4a4359be045c	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-9fc8-10414f3764b3	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-9b34-8e38ca979caa	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-a470-d343dd4953c8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-e5b5-73cf6e84ade4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-4270-7184524cb871	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-d5b8-c2a24264c268	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-1253-7dada3bab497	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-12ae-4b61f4f6399d	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-6773-73ff8b969f53	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-d0cd-8681f8b1291d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-6f0e-beca9dd071c9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-7752-87cfc881996d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-0118-379cb234b0d6	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-185c-784708c0fca6	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-ab71-c69894f6aa25	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-c9d9-72ead70229b4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-2de5-5143b32502f2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-e0fb-9e29973aefe9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-e9d4-51554a382bfd	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-9593-a8cd0ae645b0	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-d31e-83f501c72e1a	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-e952-54a658683703	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-4a11-6109c35f3ef0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-add0-beaad3bc6073	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-0cec-c4a8e8984893	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-1428-d4716acd33db	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-f14c-1209bd9095cc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-fb2d-c0d19109bca5	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-f2b5-85581145b38c	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-cde3-06314c548bd0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-c8f2-3bc07c2f2ad7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-0dbe-f7a5cc7030be	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-20a2-7424e7027632	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-2a69-f938108b76f5	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-1132-578e41857bff	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-04ed-0be43849c932	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-0b50-e9f690075f7b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-1d41-e0beb229346f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-01b4-ef6f4fcdaba1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-e110-cbcc66b6fa8d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-1680-f4529e17f1ac	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-70ce-8fbb410f7c95	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-31c6-308a53f57d35	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-a6bb-57fa316e6683	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-ff0a-332294d594b0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-1787-ad0ca3d5bdba	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-0865-677d05cf0cda	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-d44e-c908da4ebac8	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-fea0-10e500bf75b2	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-66e8-2f3168f75c0a	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-ddbb-39a5be8c6765	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-9672-c44fa3b9857e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-7a48-78a6fb5030c3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-6983-6aaac1fc7165	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-65c3-55bcd06232be	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-ade1-a8f1f507e0a0	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-4518-18b08ce0c64e	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-c08b-a70119afdbf0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-ee0c-96387317ba42	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-5b42-92ec51c69df1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-72c7-deb77932aca4	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-cd4f-9f1c5031d2a9	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-de36-1a46899991a4	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-5e0a-8b9ee3cc1ae1	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-ddfc-f92aafc7b845	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-6417-272249f1cf15	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-98c3-a31fda5a08db	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-8295-a1b2703f8a25	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-0edf-0685e198d047	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-b374-80ed51666df3	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-0b6c-20bb9437cb8e	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-a35e-574fabcabb27	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-3560-ca860bb30e97	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-c21d-ffcb772c385e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-2898-a2db5c537a67	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-2b3b-ff0a1f08ff34	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-c8d5-b2291b0b6d73	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-7da7-4f7852a734c1	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-2ff1-131fb67fde35	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-1140-fcf650ffc18e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-ced5-1ddae660e8df	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-a58c-b4ca3aa2b910	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-df54-8c3966332b4c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-adb5-e8f561fa48cc	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-cb1b-4711051c501f	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-9f62-0f73cce91332	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-bfcd-685359811941	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-9a0e-9443353ed2b8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-f990-71c0272d37c1	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-418d-1ed2495587ac	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-4f5e-0c26d2999fbe	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-1177-143bd98773bc	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-93df-23735fa011a4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-e114-86d856174bcb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-ec92-2d32b3ef056e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-40b2-bc44ad9371a9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-efb7-f4b12ebd31ed	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-38fc-459cd0717a4f	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-3a41-8b4d9dd7349a	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-e1d5-4b0b11ab83b7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-50ad-bcd1a8f842ae	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-10e7-7bba57c52448	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-01fd-84f979d2e1e6	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-2801-cc3e745ce507	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-e818-48ef489f26a1	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-c18a-e7407a17e647	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-146d-bc93dd67f071	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-780e-a9afecd1af7c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-fea8-164650a558c3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-1cd8-9fc50f120a5f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-b063-b98e02036d9b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-cbfe-ebbd8054ff78	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-960e-16d0a64ef6b0	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-32a9-e6c31f0dca9e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-cf58-a37c42ea1e2d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-49eb-619d7d849e5e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-500f-a37ac454e58a	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-45d9-72704f15be32	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-b6c1-365a1b6ae5a5	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-c4ef-f71276730856	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-6ad0-1b1ca35aa4c9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-3b21-391cebfb3849	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-fa9c-4eadcae286e9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-71e8-b8030cf26714	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-dce2-f34a9f899429	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-a9cf-41fb2d3123f2	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-548c-88b9923e0129	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-1305-d647472b0fc4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-533a-cc9106d80c5a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-a29c-685f1a405665	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-9542-180cab14f539	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-a39d-ab66bdbf0480	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-bb17-eff82293745a	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-7f3d-1f63c64c76c9	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-9ce7-a54042ec8f49	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-4d79-8ad4adee793f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-0450-b44b9fd4097a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-3b56-d5921e37b3ab	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-b69b-56a2c5854361	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-c0ed-801d9d550326	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-2608-fe46cde597d4	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-9993-bea343212e70	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-7a25-eddba5633bc0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-d16c-bc07f2c66d7a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-5d7b-31ae08478633	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-b3ad-65d7025db22e	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-8d90-064d77c367e2	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-1aa7-b83130ab1304	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-c8e9-ed97ba5c1420	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-fe22-7531d9eb7052	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-6e44-2aba4bc40f65	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-914e-ce23c74c6840	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-3930-d95fa00e0cc1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-5137-e18239cfe19a	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-2f5b-bfbcd04679f7	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-a2d0-d834a69b4e1f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-9896-a22b922c7548	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-9f32-f02be83b3d3f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-ee4a-27f2ec4fe969	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-6877-15d1d7dbd47b	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-8f20-856bfd4c17d5	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-374b-288fb0598111	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-04a7-16472f44c28c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-25d1-c5c8521c788d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-36de-232632469d19	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-1612-705096879527	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-34b7-74adbdc52e3e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-ea41-64d5052f81b7	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-df8d-43f6185ed801	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-413a-fb4ab8d32b18	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-9489-2da806a57335	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-6065-5f54d3d436a2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-4b97-8dc45430d567	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-2d5f-0eb10db4b5ba	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-1b91-8f8a2c2b28e4	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-ef90-1a4f0cacf8a3	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-6aa3-ca2864d01f85	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-b1c3-eeb4e097d4ce	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-eaf7-d0893904d07a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-3c33-3e3db06796bd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-b45f-3268a6ea491e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-2670-aafb648e419d	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-7de2-90c837cfcff7	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-c85b-1bc8f6ab56bb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-3f3c-335afe73ce1b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-065b-1dc45ce56210	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-e7c2-5be0ccd5c18c	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-5da9-b9c6faf46f81	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-a8a3-7383287f9bfd	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-55af-155927fe6981	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-3684-971905e9af10	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-e911-d7ae49ca0b0f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-dbb3-593dd834af82	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-09ee-88ff730a9830	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-4045-eadb7d4426d2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-64b8-6a73b97493df	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-99ff-70565a644cd3	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-4eac-e2bf7c19c3b1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-ec1a-bcd1058ccb58	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-d5ff-740cddd37086	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-f8b4-21f1654cfcec	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-58d9-ebba21be1589	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-c074-7786c039837d	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-9250-d5c48fe1e9a0	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-c304-d28fd4e8bd57	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-6691-79d6cf1a6abd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-a019-81a1f5c7011f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-e23a-7579894f39f0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-9bbe-b50d567e64d2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-a687-b348a5bee8bb	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-1308-f068a40bfcd8	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-425c-44c3b25f8330	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-af98-10587a374a91	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-09ec-c5a6d81f2274	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-ee79-db9579352920	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-21ce-222d084df136	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-05d1-8011e7bed847	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-60e7-fd67ff0c560d	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-13fe-29077755f0a5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-15b9-5480df3709c2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-8db3-97c841ea40e4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-c718-89381f085b7b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-0408-424ebed2bda8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-472d-b895c79d17c3	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-de46-87506e43c669	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-864c-44c26b845c34	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-3788-85f360046a8d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-f8a2-3a422ce04047	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-414d-211abd95b599	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-4cc4-0fd299d8a489	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-b4ae-ccc7cfba46bb	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-69db-fefb84fad733	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-e962-a592b7805e4c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-0982-cd2d99f1b7e6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-640b-63a6ebd5710e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-3aa8-4f3a5f526c49	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-6048-00e9857941f8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-3adb-92f87c975a39	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-aa7a-3a56e6b2677c	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-2734-b205c852d4c4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-1412-c6ee7f3c9d44	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-b28e-b99739d602c6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-4d8c-50a7b3f96d2b	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-f8c6-dd6aa68727ae	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-7b96-79a682b821fa	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-87a7-aeec3a791afb	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-5273-c03eabc0a251	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-6b1b-4e24f2eafb7c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-9dfc-432240fe1154	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-13b5-fec3ffb4809a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-63b3-26ae7730eb1a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-4662-eaa7ad357e16	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-ffa5-189757ec8891	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-7fe7-a92732863ad5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-019a-483ca048dfa7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-ab21-4d72766c64c1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-f989-822abfc99cd2	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-81da-6effce23a1d4	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-c769-95d2b4ce09c3	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-a2b7-1c846addfaff	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-387c-839063b82759	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-5082-ebc4737601f8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-e158-dc71b34d079c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-463f-54eae598a78a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-fede-557edcc8a201	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-037d-740432c4d578	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-3484-56f7413b8cc3	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-23c4-14caa3dc3a0a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-e6c7-f3e503f85317	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-7758-71628d902d91	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-3237-8977914bf47b	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-fc8e-fe6c97b132d5	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-0d01-7d9bb2b7f312	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-1e4a-3dc20b9f1276	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-bc12-950a9d84698b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-8c88-790f1dc92078	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-f018-7816dd7f6bda	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-8e16-bab8ab2a851c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-add5-9356192941a1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-718e-6e1d9b764950	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-9267-1e4b55164022	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-db66-a1a012d376ed	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-3287-d5ea51fffc4b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-a37b-64173c14f6f6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-b56a-22551941d169	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-61f2-cf4fc820a1f9	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-32c1-6f589f7c6db4	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-de96-d2cecec42bcd	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-3837-4f9198ba698c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-782d-cfe4125593d5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-da66-785eb1b5d3ac	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-826c-4697d6fc29b9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-e5ea-b16dc97bf754	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-475d-eda6e5bbf4fd	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-5819-022dbbc9fa44	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-2d62-d2960a0033fa	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-b854-6ee65d1a51a3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-5397-18cf5e7b7803	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-f1a2-a8f2106bf18e	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-6a29-e63a59148909	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-9468-cf5dc158b7bb	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-54fe-d670680ab07e	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-f7df-c3588def67db	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-3a39-0b157812a7ed	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-6a7c-25d4465af7af	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-1434-8a15a93ba82c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-4a00-051e7d026a7c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-0ff9-fba055920d45	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-09d0-f4f48ad85ec0	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-358a-fee64eca1358	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-db35-81b239236d43	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-d382-59e9524a5127	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-6069-c82ba84342e6	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-4d3e-8bde771e83bb	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-d2e3-c4702e8f6b6e	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-50c2-3d07a2f11c47	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-26f6-89122b6ec46a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-87f8-709a076e8986	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-fba5-76119d65d38f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-5dcc-f80d878b3213	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-5a73-16f6796bdbe1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-a285-419f6e066714	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-4677-7185aa25a8de	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-6e25-cc78440f3a26	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-4a0c-f151001142d0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-637d-9e7eaf2c16f9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-56e8-b47c49edcc61	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-bc70-e856ef46976b	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-afea-4692a4f93548	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-a9c2-86e40d78403f	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-51d5-c955b87c34e4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-0a6e-1f38bb24f79b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-2be5-cd06b2ab2c7c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-dd1f-1fba86436c44	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-a40b-841e995fe436	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-c1b1-f8c1e3c5b5c7	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-3b65-9a021c300915	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-448d-87f4338f488a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-6957-cdddad4f50e8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-23fd-7b080e2e2fcd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-368a-6a951b0995fe	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-b2da-81e60ad642ac	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-3f0e-3d9aaba8dde7	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-76e2-1e6adb002ab4	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-ed40-b0602cc4f278	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-0756-ab19b235a4bd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-c8bf-7d1db679298a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-905b-3dde21c19030	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-6582-3d344f6e35d3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-40bf-2ed3bf1a3fee	User-delete	Aaa - Uporabnik - Briši	f
00020000-552f-7d41-ee26-d4e49e6d6512	User-read	Aaa - Uporabnik - Beri	f
00020000-552f-7d41-e034-907a934e1d61	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552f-7d41-7d66-0a3c2ede36ef	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552f-7d41-e7ae-9010c4e86d0b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552f-7d41-8f71-8db9e17552e0	Role-delete	Aaa - Vloga - Briši	f
00020000-552f-7d41-f9cb-e31617c74037	Role-read	Aaa - Vloga - Beri	f
00020000-552f-7d41-0da0-b11634f1a4c7	Role-update	Aaa - Vloga - Posodobi	f
00020000-552f-7d41-053d-4236a484691f	Role-create	Aaa - Vloga - Ustvari	f
00020000-552f-7d41-141d-f6b4aedb065a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552f-7d41-38b3-a926668c4f46	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552f-7d41-577c-86025cabb645	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552f-7d41-705e-c148e6ccdb65	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552f-7d41-3e55-5ddeb25f9ecd	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552f-7d41-819b-70d1612743f8	Drzava-read	Seznam držav	f
00020000-552f-7d41-2722-3aa1e6999911	Drzava-write	Urejanje držav	f
00020000-552f-7d41-976f-4336836b7a73	Popa-delete	Poslovni partner - Briši	f
00020000-552f-7d41-9a95-d77980ee218f	Popa-list	Poslovni partner - Beri	f
00020000-552f-7d41-129d-a4d07b41e9b2	Popa-update	Poslovni partner - Posodobi	f
00020000-552f-7d41-691a-17b9494937fd	Popa-create	Poslovni partner - Ustvari	f
00020000-552f-7d41-0bb1-b36786834620	Posta-delete	Pošta - Briši	f
00020000-552f-7d41-5e3d-e65ef3b01447	Posta-list	Pošta - Beri	f
00020000-552f-7d41-4ae5-7bad9113c8e0	Posta-update	Pošta - Posodobi	f
00020000-552f-7d41-48a8-f5804f2d6fe5	Posta-create	Pošta - Ustvari	f
00020000-552f-7d41-5a96-51243efc6be8	PostniNaslov-delete	Poštni naslov - Briši	f
00020000-552f-7d41-c173-ee0a9608e13c	PostniNaslov-list	Poštni naslov - Beri	f
00020000-552f-7d41-fd1f-113275ff0556	PostniNaslov-update	Poštni naslov - Posodobi	f
00020000-552f-7d41-819a-d246030da01d	PostniNaslov-create	Poštni naslov - Ustvari	f
\.


--
-- TOC entry 2594 (class 0 OID 459694)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00000000-552f-7d42-e940-c73d32292317	00020000-552f-7d41-819b-70d1612743f8
00000000-552f-7d42-e940-c73d32292317	00020000-552f-7d41-f805-5f9b550878e1
00000000-552f-7d42-cae1-21dd13ac33a3	00020000-552f-7d41-2722-3aa1e6999911
00000000-552f-7d42-cae1-21dd13ac33a3	00020000-552f-7d41-819b-70d1612743f8
\.


--
-- TOC entry 2622 (class 0 OID 459982)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2626 (class 0 OID 460012)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 460124)
-- Dependencies: 219
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2599 (class 0 OID 459751)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2602 (class 0 OID 459794)
-- Dependencies: 184
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-552f-7d40-095e-c9b94bb655c8	8341	Adlešiči
00050000-552f-7d40-e37a-610807ec23f6	5270	Ajdovščina
00050000-552f-7d40-d268-066a445bb889	6280	Ankaran/Ancarano
00050000-552f-7d40-cb79-54509459b500	9253	Apače
00050000-552f-7d40-2cd9-e82a5b79829b	8253	Artiče
00050000-552f-7d40-c097-980ce8bb59f5	4275	Begunje na Gorenjskem
00050000-552f-7d40-f7ea-962b335d20dd	1382	Begunje pri Cerknici
00050000-552f-7d40-9f16-eec64c5199cf	9231	Beltinci
00050000-552f-7d40-941c-9578e8f14516	2234	Benedikt
00050000-552f-7d40-1217-96122c30c95c	2345	Bistrica ob Dravi
00050000-552f-7d40-af97-7587d711e9ea	3256	Bistrica ob Sotli
00050000-552f-7d40-11a5-1ea279d490c5	8259	Bizeljsko
00050000-552f-7d40-a26c-6fbc65c76a70	1223	Blagovica
00050000-552f-7d40-3f1a-8df8ac7a07e7	8283	Blanca
00050000-552f-7d40-2b0f-5e36a3e97c74	4260	Bled
00050000-552f-7d40-477c-c99799a904c0	4273	Blejska Dobrava
00050000-552f-7d40-167f-8c41f1a8db86	9265	Bodonci
00050000-552f-7d40-b07c-fdad41326fed	9222	Bogojina
00050000-552f-7d40-5e44-4ff198ad404d	4263	Bohinjska Bela
00050000-552f-7d40-c736-1104cee58795	4264	Bohinjska Bistrica
00050000-552f-7d40-5066-0976e110f3eb	4265	Bohinjsko jezero
00050000-552f-7d40-5088-e36b49c1c4a8	1353	Borovnica
00050000-552f-7d40-5feb-e9340ea64c3d	8294	Boštanj
00050000-552f-7d40-e357-842e2c863ab2	5230	Bovec
00050000-552f-7d40-7bda-99c0318e8cac	5295	Branik
00050000-552f-7d40-6d2a-03f78be57e6e	3314	Braslovče
00050000-552f-7d40-7e22-c073d066a410	5223	Breginj
00050000-552f-7d40-ed34-9c3b8d87df88	8280	Brestanica
00050000-552f-7d40-9e23-d3b426ba9f6f	2354	Bresternica
00050000-552f-7d40-fc91-9fa04370b855	4243	Brezje
00050000-552f-7d40-fd0e-b8ed040a7dd1	1351	Brezovica pri Ljubljani
00050000-552f-7d40-71c9-06eed58a75f3	8250	Brežice
00050000-552f-7d40-985e-c308939b9c22	4210	Brnik - Aerodrom
00050000-552f-7d40-2c06-f0bd51f06035	8321	Brusnice
00050000-552f-7d40-1cbf-54aecd1238d8	3255	Buče
00050000-552f-7d40-7ebb-44dc1c62c395	8276	Bučka 
00050000-552f-7d40-db6a-4b5da3a8c074	9261	Cankova
00050000-552f-7d40-adfe-96bfb7ff3e97	3000	Celje 
00050000-552f-7d40-0193-ff8b09d533be	3001	Celje - poštni predali
00050000-552f-7d40-ec33-f59f7e2d32d6	4207	Cerklje na Gorenjskem
00050000-552f-7d40-4716-5bd92ca90043	8263	Cerklje ob Krki
00050000-552f-7d40-9e2f-65ac953f6bd7	1380	Cerknica
00050000-552f-7d40-76d4-974e833a767e	5282	Cerkno
00050000-552f-7d40-ad1d-ca39183ed838	2236	Cerkvenjak
00050000-552f-7d40-a004-2c4b74426dfe	2215	Ceršak
00050000-552f-7d40-a085-b4aa76ef8270	2326	Cirkovce
00050000-552f-7d40-409d-2955f7ded5f9	2282	Cirkulane
00050000-552f-7d40-cb70-e5aaa6b93112	5273	Col
00050000-552f-7d40-45f4-1ba5f7a5724b	8251	Čatež ob Savi
00050000-552f-7d40-8c21-0e95403c8321	1413	Čemšenik
00050000-552f-7d40-acbd-79bacdc258b6	5253	Čepovan
00050000-552f-7d40-86f0-b5c1beb8539e	9232	Črenšovci
00050000-552f-7d40-d425-eb6413200f01	2393	Črna na Koroškem
00050000-552f-7d40-9f50-de910cf3a673	6275	Črni Kal
00050000-552f-7d40-9fe5-aa077bf1ad02	5274	Črni Vrh nad Idrijo
00050000-552f-7d40-4638-7a701c4785f0	5262	Črniče
00050000-552f-7d40-20cd-ddd09692edd1	8340	Črnomelj
00050000-552f-7d40-907c-578f43057e6c	6271	Dekani
00050000-552f-7d40-dcfb-59c7c659d18a	5210	Deskle
00050000-552f-7d40-17b8-c4e39bd20f17	2253	Destrnik
00050000-552f-7d40-1dd1-36aca6755558	6215	Divača
00050000-552f-7d40-bd02-3b147d75bcea	1233	Dob
00050000-552f-7d40-1086-3bec05ae309b	3224	Dobje pri Planini
00050000-552f-7d40-8407-6c25f1041b1e	8257	Dobova
00050000-552f-7d40-e464-f34b30246e57	1423	Dobovec
00050000-552f-7d40-0541-aa235e00196a	5263	Dobravlje
00050000-552f-7d40-3229-3f6fe9f55db3	3204	Dobrna
00050000-552f-7d40-f840-9ac92a96db92	8211	Dobrnič
00050000-552f-7d40-0805-38850b9f8cb7	1356	Dobrova
00050000-552f-7d40-c860-1c65dc7d6695	9223	Dobrovnik/Dobronak 
00050000-552f-7d40-3c31-ccad26a15b42	5212	Dobrovo v Brdih
00050000-552f-7d40-fcc5-4aacaad3065a	1431	Dol pri Hrastniku
00050000-552f-7d40-9cc8-d49d0401ff45	1262	Dol pri Ljubljani
00050000-552f-7d40-8d87-30bfc6920919	1273	Dole pri Litiji
00050000-552f-7d40-9c7d-608a4069af98	1331	Dolenja vas
00050000-552f-7d40-7ab7-118d6bd51b62	8350	Dolenjske Toplice
00050000-552f-7d40-9397-cd9b408eaebd	1230	Domžale
00050000-552f-7d40-db34-36569369e210	2252	Dornava
00050000-552f-7d40-51be-7a4ae72313a4	5294	Dornberk
00050000-552f-7d40-b70c-870b08f475b4	1319	Draga
00050000-552f-7d40-582f-640796231cfa	8343	Dragatuš
00050000-552f-7d40-97f9-348940a19837	3222	Dramlje
00050000-552f-7d40-3123-6cfaf76a394d	2370	Dravograd
00050000-552f-7d40-51e2-ae7efa206a01	4203	Duplje
00050000-552f-7d40-0aa7-ab8db53d1989	6221	Dutovlje
00050000-552f-7d40-fb18-9b6081694a61	8361	Dvor
00050000-552f-7d40-3f88-95a2726866a9	2343	Fala
00050000-552f-7d40-14a0-4e850f19d9db	9208	Fokovci
00050000-552f-7d40-657a-b79d22fe83f3	2313	Fram
00050000-552f-7d40-60eb-d93c3b392964	3213	Frankolovo
00050000-552f-7d40-5307-2712b702ab0c	1274	Gabrovka
00050000-552f-7d40-5d22-cb72ee264285	8254	Globoko
00050000-552f-7d40-5001-d468419a7216	5275	Godovič
00050000-552f-7d40-a0df-d325910d2868	4204	Golnik
00050000-552f-7d40-2959-13e5561b29a5	3303	Gomilsko
00050000-552f-7d40-6817-55978ab60880	4224	Gorenja vas
00050000-552f-7d40-1f1b-d383f9fed1a6	3263	Gorica pri Slivnici
00050000-552f-7d40-e5e7-48af2405d1a2	2272	Gorišnica
00050000-552f-7d40-d475-067caf7fc1d8	9250	Gornja Radgona
00050000-552f-7d40-b54b-b04c4151753a	3342	Gornji Grad
00050000-552f-7d40-e34d-af98514191e3	4282	Gozd Martuljek
00050000-552f-7d40-5c1c-fa88c12ad791	6272	Gračišče
00050000-552f-7d40-8daf-4a10029d3d4a	9264	Grad
00050000-552f-7d40-0898-880b23f9036c	8332	Gradac
00050000-552f-7d40-9f5f-05b1d1667f9f	1384	Grahovo
00050000-552f-7d40-7ded-5a978c49dc0d	5242	Grahovo ob Bači
00050000-552f-7d40-3908-2ccb0b81544d	5251	Grgar
00050000-552f-7d40-b255-9541f69f3d0c	3302	Griže
00050000-552f-7d40-4891-8c61cf06c5a9	3231	Grobelno
00050000-552f-7d40-fdb9-448fd3d52729	1290	Grosuplje
00050000-552f-7d40-bfbd-f51b5fb8b9ca	2288	Hajdina
00050000-552f-7d40-ff3e-229b0a87254e	8362	Hinje
00050000-552f-7d40-75e7-41babd7963e7	2311	Hoče
00050000-552f-7d40-81bf-871be8720be4	9205	Hodoš/Hodos
00050000-552f-7d40-5ce7-eba355acd36a	1354	Horjul
00050000-552f-7d40-30fe-6f3de95c5f5c	1372	Hotedršica
00050000-552f-7d40-47c3-410aeeb459c1	1430	Hrastnik
00050000-552f-7d40-ccdd-bc163effed17	6225	Hruševje
00050000-552f-7d40-e0c6-a5824bf96444	4276	Hrušica
00050000-552f-7d40-10b8-f96ee1c11b9d	5280	Idrija
00050000-552f-7d40-d461-8d2b5fbd39f3	1292	Ig
00050000-552f-7d40-2769-1e39282b71a2	6250	Ilirska Bistrica
00050000-552f-7d40-a44b-f0b69c102c69	6251	Ilirska Bistrica-Trnovo
00050000-552f-7d40-57ad-f2ce45d102bf	1295	Ivančna Gorica
00050000-552f-7d40-51f5-5427b6789932	2259	Ivanjkovci
00050000-552f-7d40-5f6e-50635823496f	1411	Izlake
00050000-552f-7d40-5326-825b966bbaa7	6310	Izola/Isola
00050000-552f-7d40-316d-7883da6106be	2222	Jakobski Dol
00050000-552f-7d40-d2bf-0e0cfe85940f	2221	Jarenina
00050000-552f-7d40-ce47-4835a07527b9	6254	Jelšane
00050000-552f-7d40-f20a-f0979d1fc9ee	4270	Jesenice
00050000-552f-7d40-c4c5-29dddecf0c06	8261	Jesenice na Dolenjskem
00050000-552f-7d40-e109-c7f9ab06b2bd	3273	Jurklošter
00050000-552f-7d40-d00c-5844e23ccb75	2223	Jurovski Dol
00050000-552f-7d40-a449-2e8c900e4598	2256	Juršinci
00050000-552f-7d40-ec69-a34a0cdf7f03	5214	Kal nad Kanalom
00050000-552f-7d40-2f47-9430f9c0094f	3233	Kalobje
00050000-552f-7d40-36f5-a83208e40b73	4246	Kamna Gorica
00050000-552f-7d40-9737-1593749cd169	2351	Kamnica
00050000-552f-7d40-32e6-fc91d07d4a5e	1241	Kamnik
00050000-552f-7d40-3572-b215d3d9cecf	5213	Kanal
00050000-552f-7d40-d901-71540e905aae	8258	Kapele
00050000-552f-7d40-0467-e7b5f1dd4d0d	2362	Kapla
00050000-552f-7d40-61d4-0258034cebcd	2325	Kidričevo
00050000-552f-7d40-c6a4-2c22ac1a533b	1412	Kisovec
00050000-552f-7d40-03be-330b775aede6	6253	Knežak
00050000-552f-7d40-8c9b-ba53e2d4ae3d	5222	Kobarid
00050000-552f-7d40-2dee-e77b91ef5e3a	9227	Kobilje
00050000-552f-7d40-197d-88fea8e7aef4	1330	Kočevje
00050000-552f-7d40-816e-a72db5b2f153	1338	Kočevska Reka
00050000-552f-7d40-6328-178be3b02649	2276	Kog
00050000-552f-7d40-b1d5-f8d4fe358f85	5211	Kojsko
00050000-552f-7d40-2fd5-d313d6394f7d	6223	Komen
00050000-552f-7d40-e073-b47991b55812	1218	Komenda
00050000-552f-7d40-329a-d07108661aae	6000	Koper/Capodistria 
00050000-552f-7d40-7da6-f00a83161cd6	6001	Koper/Capodistria - poštni predali
00050000-552f-7d40-237d-005fa088c35e	8282	Koprivnica
00050000-552f-7d40-880d-d79f45fc8642	5296	Kostanjevica na Krasu
00050000-552f-7d40-52f6-5ab34bf8589a	8311	Kostanjevica na Krki
00050000-552f-7d40-89a8-eb990d80d73e	1336	Kostel
00050000-552f-7d40-6605-72b6a0ac8daf	6256	Košana
00050000-552f-7d40-643f-864901d785b0	2394	Kotlje
00050000-552f-7d40-1641-76141abff2a9	6240	Kozina
00050000-552f-7d40-62ea-ca0f70a1d2b9	3260	Kozje
00050000-552f-7d40-b0cc-86db85a3b53b	4000	Kranj 
00050000-552f-7d40-3396-144b0f8544d5	4001	Kranj - poštni predali
00050000-552f-7d40-f595-8ce878d2be86	4280	Kranjska Gora
00050000-552f-7d40-825f-285ce9239f56	1281	Kresnice
00050000-552f-7d40-f84b-397c571fa8c7	4294	Križe
00050000-552f-7d40-1607-d68e076560d0	9206	Križevci
00050000-552f-7d40-a5f4-45daaf15a012	9242	Križevci pri Ljutomeru
00050000-552f-7d40-960a-d43a7b717a6f	1301	Krka
00050000-552f-7d40-cce6-ccb5b23b4dff	8296	Krmelj
00050000-552f-7d40-818d-452a3d28bc2a	4245	Kropa
00050000-552f-7d40-3e15-4f28a0d0d2c0	8262	Krška vas
00050000-552f-7d40-13ca-1c818a657486	8270	Krško
00050000-552f-7d40-78f5-1d3284651781	9263	Kuzma
00050000-552f-7d40-1b4a-f74d11ce2fdd	2318	Laporje
00050000-552f-7d40-d813-41d30ec9c8ac	3270	Laško
00050000-552f-7d40-80a4-46bb88133c3f	1219	Laze v Tuhinju
00050000-552f-7d40-761e-c1bbc51b15f1	2230	Lenart v Slovenskih goricah
00050000-552f-7d40-e137-6043b3229a5b	9220	Lendava/Lendva
00050000-552f-7d40-c535-394dd7da9303	4248	Lesce
00050000-552f-7d40-1bcb-d68d102a7cca	3261	Lesično
00050000-552f-7d40-6274-24c0f5e8a2b3	8273	Leskovec pri Krškem
00050000-552f-7d40-9a22-e3cac1254165	2372	Libeliče
00050000-552f-7d40-9f57-86bc09ae7266	2341	Limbuš
00050000-552f-7d40-771d-746dbec4ef2a	1270	Litija
00050000-552f-7d40-ef62-36e4fd004a56	3202	Ljubečna
00050000-552f-7d40-2927-49a7d71c9843	1000	Ljubljana 
00050000-552f-7d40-d365-d9d490ef4d63	1001	Ljubljana - poštni predali
00050000-552f-7d40-b322-05e082a2ae19	1231	Ljubljana - Črnuče
00050000-552f-7d40-35b1-d669b3349080	1261	Ljubljana - Dobrunje
00050000-552f-7d40-cba7-c745f2e88d00	1260	Ljubljana - Polje
00050000-552f-7d40-fc61-5b4c0f37f635	1210	Ljubljana - Šentvid
00050000-552f-7d40-d4c2-405be0efe7da	1211	Ljubljana - Šmartno
00050000-552f-7d40-53f0-46590a3461e3	3333	Ljubno ob Savinji
00050000-552f-7d40-bd15-059d583c893b	9240	Ljutomer
00050000-552f-7d40-2554-04c3f276727f	3215	Loče
00050000-552f-7d40-e42a-d9d35f14760b	5231	Log pod Mangartom
00050000-552f-7d40-e095-f94e11951e20	1358	Log pri Brezovici
00050000-552f-7d40-bfe5-c61d406b9a34	1370	Logatec
00050000-552f-7d40-684e-b3d87c9e8f3e	1371	Logatec
00050000-552f-7d40-2aa6-c26b1033bb00	1434	Loka pri Zidanem Mostu
00050000-552f-7d40-5247-58aef0c347d6	3223	Loka pri Žusmu
00050000-552f-7d40-8898-91ee7c98626e	6219	Lokev
00050000-552f-7d40-6f44-2d6cdd9c3eea	1318	Loški Potok
00050000-552f-7d40-d95d-2c2dfebb8562	2324	Lovrenc na Dravskem polju
00050000-552f-7d40-4ea0-992221d67295	2344	Lovrenc na Pohorju
00050000-552f-7d40-9820-4c343abcf472	3334	Luče
00050000-552f-7d40-4299-f71f461666be	1225	Lukovica
00050000-552f-7d40-1ded-a90ba4ac3ff0	9202	Mačkovci
00050000-552f-7d40-23b0-34554b623c91	2322	Majšperk
00050000-552f-7d40-ccff-e14fceec76e4	2321	Makole
00050000-552f-7d40-6f4b-021bcfe4cd05	9243	Mala Nedelja
00050000-552f-7d40-ed6f-2f4f1543e8fa	2229	Malečnik
00050000-552f-7d40-96cd-d029f138e7a2	6273	Marezige
00050000-552f-7d40-5c39-18fb114531d2	2000	Maribor 
00050000-552f-7d40-f519-551ce9eced6b	2001	Maribor - poštni predali
00050000-552f-7d40-c80e-8b922d31ba07	2206	Marjeta na Dravskem polju
00050000-552f-7d40-860f-754c8db3da0a	2281	Markovci
00050000-552f-7d40-c58f-ba94f9c9b479	9221	Martjanci
00050000-552f-7d40-29ac-a2797e440fdb	6242	Materija
00050000-552f-7d40-94fd-f581801c9f47	4211	Mavčiče
00050000-552f-7d40-74db-cb7d0daca00d	1215	Medvode
00050000-552f-7d40-2868-b8fcd949a5b5	1234	Mengeš
00050000-552f-7d40-176a-237e7dc03883	8330	Metlika
00050000-552f-7d40-3470-4e92528806fa	2392	Mežica
00050000-552f-7d40-3bf1-7fcb83d4d8bf	2204	Miklavž na Dravskem polju
00050000-552f-7d40-c99a-2dee9a939313	2275	Miklavž pri Ormožu
00050000-552f-7d40-fc5a-b822eb0054a9	5291	Miren
00050000-552f-7d40-b585-03a017c93624	8233	Mirna
00050000-552f-7d40-d3ae-d48d036f1048	8216	Mirna Peč
00050000-552f-7d40-9a70-00503c541000	2382	Mislinja
00050000-552f-7d40-a0b3-ee4b0cf6a7b5	4281	Mojstrana
00050000-552f-7d40-c216-a571f54030db	8230	Mokronog
00050000-552f-7d40-7223-713a07ff3f02	1251	Moravče
00050000-552f-7d40-b173-08c999872e9a	9226	Moravske Toplice
00050000-552f-7d40-248d-0080ee386df0	5216	Most na Soči
00050000-552f-7d40-2fbf-87b616148d97	1221	Motnik
00050000-552f-7d40-32ff-0e5a0fb8a2b7	3330	Mozirje
00050000-552f-7d40-1781-f544931b8edb	9000	Murska Sobota 
00050000-552f-7d40-110b-04b1c89ba236	9001	Murska Sobota - poštni predali
00050000-552f-7d40-cd5f-0c599710a3e0	2366	Muta
00050000-552f-7d40-7d66-1474908c1df7	4202	Naklo
00050000-552f-7d40-3594-24cf1d5683b4	3331	Nazarje
00050000-552f-7d40-2f89-cc1a5347ba85	1357	Notranje Gorice
00050000-552f-7d40-e426-6196903c9924	3203	Nova Cerkev
00050000-552f-7d40-ec87-95e531d93fcc	5000	Nova Gorica 
00050000-552f-7d40-9f8a-c74b2262df36	5001	Nova Gorica - poštni predali
00050000-552f-7d40-d4e9-a6faee22cc69	1385	Nova vas
00050000-552f-7d40-8aae-80c8bb168e20	8000	Novo mesto
00050000-552f-7d40-da3d-bba182c610a4	8001	Novo mesto - poštni predali
00050000-552f-7d40-3385-5898120952fe	6243	Obrov
00050000-552f-7d40-8b5d-681f03ce6af3	9233	Odranci
00050000-552f-7d40-f737-65c9f3069c0f	2317	Oplotnica
00050000-552f-7d40-297d-f1b7c05e62b7	2312	Orehova vas
00050000-552f-7d40-d0af-35d43f3ae4ce	2270	Ormož
00050000-552f-7d40-0b03-1b9cc3c36a2e	1316	Ortnek
00050000-552f-7d40-a242-6c2b2c15af4d	1337	Osilnica
00050000-552f-7d40-6bba-9c22a54aff24	8222	Otočec
00050000-552f-7d40-cc14-0751566b3d27	2361	Ožbalt
00050000-552f-7d40-5dd9-cc16876023d0	2231	Pernica
00050000-552f-7d40-4c28-c2e37590cbb5	2211	Pesnica pri Mariboru
00050000-552f-7d40-f3f4-62dd2b0c1fe2	9203	Petrovci
00050000-552f-7d40-8694-0ecf4122c8f2	3301	Petrovče
00050000-552f-7d40-8b6c-000e1fe0c70a	6330	Piran/Pirano
00050000-552f-7d40-1e40-9c95f76747e8	8255	Pišece
00050000-552f-7d40-f897-a1ce755b11e2	6257	Pivka
00050000-552f-7d40-45c3-16e84a4b4545	6232	Planina
00050000-552f-7d40-e182-5bcfa5c10f3b	3225	Planina pri Sevnici
00050000-552f-7d40-850e-d705dda26675	6276	Pobegi
00050000-552f-7d40-79b8-7ba85ec82340	8312	Podbočje
00050000-552f-7d40-2601-09884b186018	5243	Podbrdo
00050000-552f-7d40-e311-88739f002b88	3254	Podčetrtek
00050000-552f-7d40-c9e6-de29afac02cf	2273	Podgorci
00050000-552f-7d40-768b-4c59e6b4ec91	6216	Podgorje
00050000-552f-7d40-06a6-7df3b7338163	2381	Podgorje pri Slovenj Gradcu
00050000-552f-7d40-2c92-6ff20bc74611	6244	Podgrad
00050000-552f-7d40-0372-5055e46b7e4b	1414	Podkum
00050000-552f-7d40-dca2-7b10f5d5442d	2286	Podlehnik
00050000-552f-7d40-fffe-49cc3f1d93c2	5272	Podnanos
00050000-552f-7d40-5709-040c5c5a4f85	4244	Podnart
00050000-552f-7d40-376e-3c1818457943	3241	Podplat
00050000-552f-7d40-1462-9f994564b3f6	3257	Podsreda
00050000-552f-7d40-df7a-ca9e1f32d185	2363	Podvelka
00050000-552f-7d40-cbc6-8ae3306241ea	2208	Pohorje
00050000-552f-7d40-85f8-9cd9b177b217	2257	Polenšak
00050000-552f-7d40-405b-803860d900b1	1355	Polhov Gradec
00050000-552f-7d40-959b-fef06fd9b5e1	4223	Poljane nad Škofjo Loko
00050000-552f-7d40-33fc-e774506b5a7a	2319	Poljčane
00050000-552f-7d40-b138-14323fa00278	1272	Polšnik
00050000-552f-7d40-1245-e4975a65a085	3313	Polzela
00050000-552f-7d40-9675-830e2ba2ca5f	3232	Ponikva
00050000-552f-7d40-a71d-1dc9b4ef0c5f	6320	Portorož/Portorose
00050000-552f-7d40-39f9-c56c898bffa1	6230	Postojna
00050000-552f-7d40-c487-99a7363ba5d8	2331	Pragersko
00050000-552f-7d40-9dd5-047418de530e	3312	Prebold
00050000-552f-7d40-499e-ac5d338896de	4205	Preddvor
00050000-552f-7d40-a31d-b1e3a3a8e000	6255	Prem
00050000-552f-7d40-e5c9-ca5f6bf47dd9	1352	Preserje
00050000-552f-7d40-391f-304f073dbab2	6258	Prestranek
00050000-552f-7d40-721a-16266d89e7b7	2391	Prevalje
00050000-552f-7d40-7f31-8df5ff0e3451	3262	Prevorje
00050000-552f-7d40-1fc6-eae2e6da0dd5	1276	Primskovo 
00050000-552f-7d40-948b-7751da2a5cc1	3253	Pristava pri Mestinju
00050000-552f-7d40-34b9-6f733117ad4b	9207	Prosenjakovci/Partosfalva
00050000-552f-7d40-fcd3-35b25f4dba7c	5297	Prvačina
00050000-552f-7d40-8918-39b3539c51aa	2250	Ptuj
00050000-552f-7d40-e3f0-b6c20591b64f	2323	Ptujska Gora
00050000-552f-7d40-b90b-336c6bb47796	9201	Puconci
00050000-552f-7d40-c902-1996a773b165	2327	Rače
00050000-552f-7d40-3f26-f23c03b3a154	1433	Radeče
00050000-552f-7d40-56e9-35b2beadd4f4	9252	Radenci
00050000-552f-7d40-af48-13e321fb9da5	2360	Radlje ob Dravi
00050000-552f-7d40-5167-d9412fd93bd8	1235	Radomlje
00050000-552f-7d40-d48b-3203f617badc	4240	Radovljica
00050000-552f-7d40-8c51-2dc4c3748792	8274	Raka
00050000-552f-7d40-f846-20494b9632b6	1381	Rakek
00050000-552f-7d40-7205-7a9062f8becf	4283	Rateče - Planica
00050000-552f-7d40-b213-c86da3452cca	2390	Ravne na Koroškem
00050000-552f-7d40-ece1-b911d4cd1065	9246	Razkrižje
00050000-552f-7d40-bdc0-4997d2b702a5	3332	Rečica ob Savinji
00050000-552f-7d40-a1d0-faa4552bef56	5292	Renče
00050000-552f-7d40-3702-987e852f1631	1310	Ribnica
00050000-552f-7d40-9756-6c9931a8121f	2364	Ribnica na Pohorju
00050000-552f-7d40-d68a-1b49eff86748	3272	Rimske Toplice
00050000-552f-7d40-a0bd-55a51532e55f	1314	Rob
00050000-552f-7d40-f641-e0b6cb714cf5	5215	Ročinj
00050000-552f-7d40-cc9a-4aedd81fb30a	3250	Rogaška Slatina
00050000-552f-7d40-a5df-a9796c7bfa1f	9262	Rogašovci
00050000-552f-7d40-a872-cae6c21f3f8f	3252	Rogatec
00050000-552f-7d40-5f74-3203db03c802	1373	Rovte
00050000-552f-7d40-c5e6-29ee09757b2c	2342	Ruše
00050000-552f-7d40-4225-d8e460bc5a37	1282	Sava
00050000-552f-7d40-4a31-bcf5ecd70e86	6333	Sečovlje/Sicciole
00050000-552f-7d40-0933-7ef425088dfa	4227	Selca
00050000-552f-7d40-2801-37c4c62cfefa	2352	Selnica ob Dravi
00050000-552f-7d40-823f-b650fad802cc	8333	Semič
00050000-552f-7d40-a909-5c0bbf97dce1	8281	Senovo
00050000-552f-7d40-bf99-71585af1c468	6224	Senožeče
00050000-552f-7d40-59b9-18509d802e57	8290	Sevnica
00050000-552f-7d40-efa4-203a5374875d	6210	Sežana
00050000-552f-7d40-0af4-144a842d4885	2214	Sladki Vrh
00050000-552f-7d40-e232-1000e17e07b0	5283	Slap ob Idrijci
00050000-552f-7d40-476c-8e4bea791ade	2380	Slovenj Gradec
00050000-552f-7d40-b420-9be514f015dd	2310	Slovenska Bistrica
00050000-552f-7d40-08d0-7cf04bc4f94b	3210	Slovenske Konjice
00050000-552f-7d40-629a-5059830ecca2	1216	Smlednik
00050000-552f-7d40-f0ff-14a7ad95cb91	5232	Soča
00050000-552f-7d40-41bb-fffc985d48f5	1317	Sodražica
00050000-552f-7d40-a8fe-0311126bbb94	3335	Solčava
00050000-552f-7d40-2138-0bd26f5f75ed	5250	Solkan
00050000-552f-7d40-8fe7-ed2507e79609	4229	Sorica
00050000-552f-7d40-8eb4-38bcbbc40380	4225	Sovodenj
00050000-552f-7d40-292d-8bbdc849597e	5281	Spodnja Idrija
00050000-552f-7d40-279d-76463ec957bb	2241	Spodnji Duplek
00050000-552f-7d40-ced8-a7e54252f74d	9245	Spodnji Ivanjci
00050000-552f-7d40-00d1-5705e6b18753	2277	Središče ob Dravi
00050000-552f-7d40-2aa4-bed9f3d63560	4267	Srednja vas v Bohinju
00050000-552f-7d40-dae0-e97983cf051d	8256	Sromlje 
00050000-552f-7d40-9962-205a46a1be6a	5224	Srpenica
00050000-552f-7d40-2b0a-9e2820b10797	1242	Stahovica
00050000-552f-7d40-d79b-766d581eddb8	1332	Stara Cerkev
00050000-552f-7d40-a986-9572c771bdb4	8342	Stari trg ob Kolpi
00050000-552f-7d40-25cc-73617bb4932d	1386	Stari trg pri Ložu
00050000-552f-7d40-c09e-e07766293ba6	2205	Starše
00050000-552f-7d40-80c3-3d2b95540bd9	2289	Stoperce
00050000-552f-7d40-920c-9e0e51b96f30	8322	Stopiče
00050000-552f-7d40-6a1a-d0a339393c65	3206	Stranice
00050000-552f-7d40-c713-ec6c528f73de	8351	Straža
00050000-552f-7d40-e2aa-71657e692c8d	1313	Struge
00050000-552f-7d40-303c-f370cacbd584	8293	Studenec
00050000-552f-7d40-3a29-2368b64f23e9	8331	Suhor
00050000-552f-7d40-ff7e-8509638b3a72	2233	Sv. Ana v Slovenskih goricah
00050000-552f-7d40-a3df-f4fc8b2d994f	2235	Sv. Trojica v Slovenskih goricah
00050000-552f-7d40-a82b-fadd7a6303db	2353	Sveti Duh na Ostrem Vrhu
00050000-552f-7d40-094f-32ef1914bb59	9244	Sveti Jurij ob Ščavnici
00050000-552f-7d40-d2cd-eaef791e061d	3264	Sveti Štefan
00050000-552f-7d40-d3d0-c68f3756d7db	2258	Sveti Tomaž
00050000-552f-7d40-bd8c-5e92c37be4ad	9204	Šalovci
00050000-552f-7d40-070b-4370198330eb	5261	Šempas
00050000-552f-7d40-58bc-2b16e92389d5	5290	Šempeter pri Gorici
00050000-552f-7d40-7f33-6ff0b126cd87	3311	Šempeter v Savinjski dolini
00050000-552f-7d40-82e9-da82a89b3159	4208	Šenčur
00050000-552f-7d40-0ded-8414528ee893	2212	Šentilj v Slovenskih goricah
00050000-552f-7d40-455a-45b65f0261be	8297	Šentjanž
00050000-552f-7d40-a558-5a885c64efdd	2373	Šentjanž pri Dravogradu
00050000-552f-7d40-2212-25e648e7bfbb	8310	Šentjernej
00050000-552f-7d40-ed0f-eb83674f88e8	3230	Šentjur
00050000-552f-7d40-960d-b605f3dea852	3271	Šentrupert
00050000-552f-7d40-4fa1-639084ec8ec8	8232	Šentrupert
00050000-552f-7d40-988f-86901ca98c7e	1296	Šentvid pri Stični
00050000-552f-7d40-62c8-9fea49149e86	8275	Škocjan
00050000-552f-7d40-5188-e7b052cfad59	6281	Škofije
00050000-552f-7d40-e2b3-021154079173	4220	Škofja Loka
00050000-552f-7d40-ae2f-d2785c44fab3	3211	Škofja vas
00050000-552f-7d40-8aa2-91793a4d6a94	1291	Škofljica
00050000-552f-7d40-1dc5-72c572a9ff78	6274	Šmarje
00050000-552f-7d40-8a1c-1f5398f900e8	1293	Šmarje - Sap
00050000-552f-7d40-91f2-da95f329b937	3240	Šmarje pri Jelšah
00050000-552f-7d40-ffd0-10c99a661442	8220	Šmarješke Toplice
00050000-552f-7d40-cc99-e4e57a4d32a1	2315	Šmartno na Pohorju
00050000-552f-7d40-0a89-008d40d9be2b	3341	Šmartno ob Dreti
00050000-552f-7d40-78fb-70dc0dfcdea1	3327	Šmartno ob Paki
00050000-552f-7d40-6f25-234c45fa5d49	1275	Šmartno pri Litiji
00050000-552f-7d40-f0f7-eae3464c7064	2383	Šmartno pri Slovenj Gradcu
00050000-552f-7d40-f457-76a9bfed82b5	3201	Šmartno v Rožni dolini
00050000-552f-7d40-88a4-91a2e7972162	3325	Šoštanj
00050000-552f-7d40-39be-d940f7e33530	6222	Štanjel
00050000-552f-7d40-c42f-5fce4ce12649	3220	Štore
00050000-552f-7d40-0bd1-d732f73d1711	3304	Tabor
00050000-552f-7d40-a9b9-29638fad8491	3221	Teharje
00050000-552f-7d40-e83b-91c49d5bd36b	9251	Tišina
00050000-552f-7d40-99b7-8844a2a2af7e	5220	Tolmin
00050000-552f-7d40-e934-150af6359181	3326	Topolšica
00050000-552f-7d40-5336-b9d1353b7548	2371	Trbonje
00050000-552f-7d40-0799-ed08f3680935	1420	Trbovlje
00050000-552f-7d40-2137-b8f22fabf51c	8231	Trebelno 
00050000-552f-7d40-5957-4c1a22159e10	8210	Trebnje
00050000-552f-7d40-b96b-8c8228a1921c	5252	Trnovo pri Gorici
00050000-552f-7d40-2dce-55ff91d79772	2254	Trnovska vas
00050000-552f-7d40-7b61-4aec47c72caf	1222	Trojane
00050000-552f-7d40-e9cd-b05e212ba9b4	1236	Trzin
00050000-552f-7d40-83d6-6f34aae04046	4290	Tržič
00050000-552f-7d40-0dd1-693d469eb914	8295	Tržišče
00050000-552f-7d40-d536-35f29b631427	1311	Turjak
00050000-552f-7d40-a781-015760bfb5c7	9224	Turnišče
00050000-552f-7d40-0c1b-01fd822a8068	8323	Uršna sela
00050000-552f-7d40-3579-263f8271c35b	1252	Vače
00050000-552f-7d40-3a62-4b4149b13cb2	3320	Velenje 
00050000-552f-7d40-72ef-3596cf8836ca	3322	Velenje - poštni predali
00050000-552f-7d40-6f59-9227afc4f68d	8212	Velika Loka
00050000-552f-7d40-8df9-1e7a93251975	2274	Velika Nedelja
00050000-552f-7d40-6c1e-abd2fd65bae3	9225	Velika Polana
00050000-552f-7d40-7fd4-fbd78e0a98fd	1315	Velike Lašče
00050000-552f-7d40-eb90-1e5a6a02acc7	8213	Veliki Gaber
00050000-552f-7d40-7326-a8959b5dd833	9241	Veržej
00050000-552f-7d40-f4c0-6fd6097d7ea8	1312	Videm - Dobrepolje
00050000-552f-7d40-9dbe-d59821e7a3d6	2284	Videm pri Ptuju
00050000-552f-7d40-b295-666d14f83b53	8344	Vinica
00050000-552f-7d40-e307-dc545036b2a9	5271	Vipava
00050000-552f-7d40-7d9c-274ad10cfd13	4212	Visoko
00050000-552f-7d40-3edf-63aa908c5741	1294	Višnja Gora
00050000-552f-7d40-06fc-4059728a0f40	3205	Vitanje
00050000-552f-7d40-b042-d1ba7537bb0d	2255	Vitomarci
00050000-552f-7d40-9a8d-3c0a09047267	1217	Vodice
00050000-552f-7d40-a463-f7a8a2519cce	3212	Vojnik\t
00050000-552f-7d40-9bbd-32674e267314	5293	Volčja Draga
00050000-552f-7d40-5eb6-3075ebf7ec14	2232	Voličina
00050000-552f-7d40-8015-51e5e484d217	3305	Vransko
00050000-552f-7d40-4893-4db9126af0a6	6217	Vremski Britof
00050000-552f-7d40-df79-314808882db7	1360	Vrhnika
00050000-552f-7d40-41a5-df833b7fc687	2365	Vuhred
00050000-552f-7d40-58a3-04c15e22b6e3	2367	Vuzenica
00050000-552f-7d40-2eea-482b2fca4106	8292	Zabukovje 
00050000-552f-7d40-0a36-839fc04cffc5	1410	Zagorje ob Savi
00050000-552f-7d40-56bb-8744333e63fc	1303	Zagradec
00050000-552f-7d40-316b-346e48866467	2283	Zavrč
00050000-552f-7d40-c7a2-dc3ff08d4ae2	8272	Zdole 
00050000-552f-7d40-a1c5-19d0a722719b	4201	Zgornja Besnica
00050000-552f-7d40-7a32-3a37e7ad52b7	2242	Zgornja Korena
00050000-552f-7d40-898f-be78a81d9e62	2201	Zgornja Kungota
00050000-552f-7d40-a808-dfdb6ad72bbe	2316	Zgornja Ložnica
00050000-552f-7d40-bf19-8127253617ec	2314	Zgornja Polskava
00050000-552f-7d40-3d16-a26c66049729	2213	Zgornja Velka
00050000-552f-7d40-c0af-587bac505df9	4247	Zgornje Gorje
00050000-552f-7d40-232b-bfbaf3dd8e52	4206	Zgornje Jezersko
00050000-552f-7d40-cc72-3977fcc234ed	2285	Zgornji Leskovec
00050000-552f-7d40-c7b6-966b7bcebb71	1432	Zidani Most
00050000-552f-7d40-a173-59e8902af656	3214	Zreče
00050000-552f-7d40-9731-946659da2924	4209	Žabnica
00050000-552f-7d40-5e1f-951c85aa3626	3310	Žalec
00050000-552f-7d40-4c03-80a4ec4a09a2	4228	Železniki
00050000-552f-7d40-dcf6-885b4f927d27	2287	Žetale
00050000-552f-7d40-4ca2-a359395acc03	4226	Žiri
00050000-552f-7d40-869c-f9d04662d748	4274	Žirovnica
00050000-552f-7d40-8485-9956c6a6723b	8360	Žužemberk
\.


--
-- TOC entry 2618 (class 0 OID 459956)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2601 (class 0 OID 459779)
-- Dependencies: 183
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2606 (class 0 OID 459845)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2620 (class 0 OID 459968)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 460073)
-- Dependencies: 214
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2636 (class 0 OID 460117)
-- Dependencies: 218
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2624 (class 0 OID 459997)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2616 (class 0 OID 459941)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2615 (class 0 OID 459931)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 460107)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 460063)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2589 (class 0 OID 459647)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-552f-7d42-e714-70b13547132d	00010000-552f-7d42-f8b9-c4326ca2648e	2015-04-16 11:13:38	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO7vrt2VovpoRcDR0iXn.a7ZAdy/ys.4S";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2650 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2625 (class 0 OID 460006)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2593 (class 0 OID 459684)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00000000-552f-7d42-2251-ec11b28570a4	beri-vse	Polni dostop do vsega v aplikaciji.	t
00000000-552f-7d42-99ad-d6e6f0398849	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00000000-552f-7d42-e940-c73d32292317	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00000000-552f-7d42-8523-d57ce29f1dd2	ifi-all	Polni dostop do vsega v aplikaciji.	t
00000000-552f-7d42-eea9-868e4e1576f6	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00000000-552f-7d42-cae1-21dd13ac33a3	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2591 (class 0 OID 459668)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-552f-7d42-e714-70b13547132d	00000000-552f-7d42-8523-d57ce29f1dd2
00010000-552f-7d42-b3c9-4e11c3a2df65	00000000-552f-7d42-e940-c73d32292317
\.


--
-- TOC entry 2627 (class 0 OID 460020)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2619 (class 0 OID 459962)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2613 (class 0 OID 459912)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2598 (class 0 OID 459744)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2614 (class 0 OID 459918)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 460098)
-- Dependencies: 216
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2604 (class 0 OID 459814)
-- Dependencies: 186
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2590 (class 0 OID 459656)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, username, password, enabled, expires, defaultroute, defaultrouteparams, email) FROM stdin;
00010000-552f-7d42-f8b9-c4326ca2648e	Konzolni	console	$2y$05$NS4xMjkyMTcwMzExMjAxRO5qA7BjKjP2Cg8fPHv5XKQC3TGTXeQ36	t	\N	\N	\N	rootmail@max.si
00010000-552f-7d42-b3c9-4e11c3a2df65	Anonimni	anonymous	$2y$05$NS4xMjkyMTcwMzExMjAxROK30BwyWT/JFmOarBxVzbWpMyIniTbSG	t	\N	\N	\N	noreply@max.si
00010000-552f-7d42-e714-70b13547132d	Administrator	admin	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@max.si
\.


--
-- TOC entry 2639 (class 0 OID 460148)
-- Dependencies: 221
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2608 (class 0 OID 459860)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2623 (class 0 OID 459989)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 460055)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2610 (class 0 OID 459888)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2638 (class 0 OID 460138)
-- Dependencies: 220
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 460045)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2236 (class 2606 OID 459709)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 460187)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 460180)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 460097)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 459878)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2305 (class 2606 OID 459911)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2272 (class 2606 OID 459840)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2359 (class 2606 OID 460041)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2283 (class 2606 OID 459858)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2302 (class 2606 OID 459905)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2243 (class 2606 OID 459741)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 459954)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 459981)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2265 (class 2606 OID 459812)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2240 (class 2606 OID 459718)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2256 (class 2606 OID 459776)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2234 (class 2606 OID 459698)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2227 (class 2606 OID 459683)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 459987)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 460019)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 460134)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2251 (class 2606 OID 459769)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2262 (class 2606 OID 459800)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2330 (class 2606 OID 459960)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 459791)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2281 (class 2606 OID 459849)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 459972)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 460079)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 460122)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 460004)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2324 (class 2606 OID 459945)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2318 (class 2606 OID 459936)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 460116)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 460070)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2218 (class 2606 OID 459655)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 460010)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2225 (class 2606 OID 459672)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2229 (class 2606 OID 459692)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 460028)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2332 (class 2606 OID 459967)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2307 (class 2606 OID 459917)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2248 (class 2606 OID 459748)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 459927)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 460106)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2270 (class 2606 OID 459825)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2221 (class 2606 OID 459666)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 460162)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2287 (class 2606 OID 459864)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 459995)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2367 (class 2606 OID 460061)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 459900)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 460147)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 460054)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2290 (class 1259 OID 459885)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2249 (class 1259 OID 459771)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2339 (class 1259 OID 459988)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2333 (class 1259 OID 459974)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2334 (class 1259 OID 459973)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2285 (class 1259 OID 459865)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2360 (class 1259 OID 460044)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2361 (class 1259 OID 460042)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2362 (class 1259 OID 460043)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2385 (class 1259 OID 460135)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2386 (class 1259 OID 460136)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 460137)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2392 (class 1259 OID 460165)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2393 (class 1259 OID 460164)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2394 (class 1259 OID 460163)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2267 (class 1259 OID 459827)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2268 (class 1259 OID 459826)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2253 (class 1259 OID 459778)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2254 (class 1259 OID 459777)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2348 (class 1259 OID 460011)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2303 (class 1259 OID 459906)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2231 (class 1259 OID 459699)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2232 (class 1259 OID 459700)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2353 (class 1259 OID 460031)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2354 (class 1259 OID 460030)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2355 (class 1259 OID 460029)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2277 (class 1259 OID 459850)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2278 (class 1259 OID 459852)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2279 (class 1259 OID 459851)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2313 (class 1259 OID 459940)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2314 (class 1259 OID 459938)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2315 (class 1259 OID 459937)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2316 (class 1259 OID 459939)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2222 (class 1259 OID 459673)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2223 (class 1259 OID 459674)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2342 (class 1259 OID 459996)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2328 (class 1259 OID 459961)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2368 (class 1259 OID 460071)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2369 (class 1259 OID 460072)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2257 (class 1259 OID 459792)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2258 (class 1259 OID 459793)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2372 (class 1259 OID 460080)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2373 (class 1259 OID 460081)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2403 (class 1259 OID 460190)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2404 (class 1259 OID 460189)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2405 (class 1259 OID 460192)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2406 (class 1259 OID 460188)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2407 (class 1259 OID 460191)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2365 (class 1259 OID 460062)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2319 (class 1259 OID 459949)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2320 (class 1259 OID 459948)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2321 (class 1259 OID 459946)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2322 (class 1259 OID 459947)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2241 (class 1259 OID 459742)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2399 (class 1259 OID 460182)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 460181)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2284 (class 1259 OID 459859)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2237 (class 1259 OID 459720)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2238 (class 1259 OID 459719)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2245 (class 1259 OID 459749)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2246 (class 1259 OID 459750)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2308 (class 1259 OID 459930)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2309 (class 1259 OID 459929)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2310 (class 1259 OID 459928)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2291 (class 1259 OID 459887)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2292 (class 1259 OID 459883)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2293 (class 1259 OID 459880)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2294 (class 1259 OID 459881)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2295 (class 1259 OID 459879)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2296 (class 1259 OID 459884)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2297 (class 1259 OID 459882)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2252 (class 1259 OID 459770)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2273 (class 1259 OID 459841)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2274 (class 1259 OID 459843)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2275 (class 1259 OID 459842)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2276 (class 1259 OID 459844)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2327 (class 1259 OID 459955)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2266 (class 1259 OID 459813)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2219 (class 1259 OID 459667)
-- Name: uniq_7fb775b7f85e0677; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7f85e0677 ON uporabniki USING btree (username);


--
-- TOC entry 2347 (class 1259 OID 460005)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2244 (class 1259 OID 459743)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2263 (class 1259 OID 459801)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2384 (class 1259 OID 460123)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2230 (class 1259 OID 459693)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2298 (class 1259 OID 459886)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2432 (class 2606 OID 460323)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2435 (class 2606 OID 460308)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2434 (class 2606 OID 460313)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2430 (class 2606 OID 460333)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2436 (class 2606 OID 460303)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2431 (class 2606 OID 460328)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2433 (class 2606 OID 460318)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2418 (class 2606 OID 460243)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2453 (class 2606 OID 460418)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2451 (class 2606 OID 460413)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2452 (class 2606 OID 460408)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2429 (class 2606 OID 460298)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2459 (class 2606 OID 460458)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2461 (class 2606 OID 460448)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 460453)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2449 (class 2606 OID 460398)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2470 (class 2606 OID 460493)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2469 (class 2606 OID 460498)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2468 (class 2606 OID 460503)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2471 (class 2606 OID 460518)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2472 (class 2606 OID 460513)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2473 (class 2606 OID 460508)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2423 (class 2606 OID 460273)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2424 (class 2606 OID 460268)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2419 (class 2606 OID 460253)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2420 (class 2606 OID 460248)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2455 (class 2606 OID 460428)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2437 (class 2606 OID 460338)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2411 (class 2606 OID 460203)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2410 (class 2606 OID 460208)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2456 (class 2606 OID 460443)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2457 (class 2606 OID 460438)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2458 (class 2606 OID 460433)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2427 (class 2606 OID 460278)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2425 (class 2606 OID 460288)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2426 (class 2606 OID 460283)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2441 (class 2606 OID 460373)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2443 (class 2606 OID 460363)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2444 (class 2606 OID 460358)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2442 (class 2606 OID 460368)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2409 (class 2606 OID 460193)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2408 (class 2606 OID 460198)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2454 (class 2606 OID 460423)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2450 (class 2606 OID 460403)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2464 (class 2606 OID 460468)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2463 (class 2606 OID 460473)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2422 (class 2606 OID 460258)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2421 (class 2606 OID 460263)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2466 (class 2606 OID 460478)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2465 (class 2606 OID 460483)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2478 (class 2606 OID 460543)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2479 (class 2606 OID 460538)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2476 (class 2606 OID 460553)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2480 (class 2606 OID 460533)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2477 (class 2606 OID 460548)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2462 (class 2606 OID 460463)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2445 (class 2606 OID 460393)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2446 (class 2606 OID 460388)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2448 (class 2606 OID 460378)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2447 (class 2606 OID 460383)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2415 (class 2606 OID 460223)
-- Name: fk_b7229ce169e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT fk_b7229ce169e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2414 (class 2606 OID 460228)
-- Name: fk_b7229ce1a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT fk_b7229ce1a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2474 (class 2606 OID 460528)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2475 (class 2606 OID 460523)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2428 (class 2606 OID 460293)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2467 (class 2606 OID 460488)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2412 (class 2606 OID 460218)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2413 (class 2606 OID 460213)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2417 (class 2606 OID 460233)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2416 (class 2606 OID 460238)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2438 (class 2606 OID 460353)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2439 (class 2606 OID 460348)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2440 (class 2606 OID 460343)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-16 11:13:38 CEST

--
-- PostgreSQL database dump complete
--

