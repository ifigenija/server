--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-04-14 10:29:22 CEST

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
-- TOC entry 177 (class 1259 OID 249230)
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
-- TOC entry 223 (class 1259 OID 249712)
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
-- TOC entry 222 (class 1259 OID 249695)
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
-- TOC entry 215 (class 1259 OID 249611)
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
-- TOC entry 191 (class 1259 OID 249395)
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
-- TOC entry 194 (class 1259 OID 249436)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 187 (class 1259 OID 249357)
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
-- TOC entry 210 (class 1259 OID 249561)
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
-- TOC entry 189 (class 1259 OID 249382)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 193 (class 1259 OID 249430)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 179 (class 1259 OID 249250)
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
-- TOC entry 199 (class 1259 OID 249479)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 203 (class 1259 OID 249504)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 185 (class 1259 OID 249331)
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
-- TOC entry 178 (class 1259 OID 249239)
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
-- TOC entry 182 (class 1259 OID 249301)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 174 (class 1259 OID 249204)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 249223)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 249511)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 249541)
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
-- TOC entry 219 (class 1259 OID 249653)
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
-- TOC entry 181 (class 1259 OID 249280)
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
-- TOC entry 184 (class 1259 OID 249323)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 249485)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 183 (class 1259 OID 249308)
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
-- TOC entry 188 (class 1259 OID 249374)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 249497)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 249602)
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
-- TOC entry 218 (class 1259 OID 249646)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 249526)
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
-- TOC entry 198 (class 1259 OID 249470)
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
-- TOC entry 197 (class 1259 OID 249460)
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
-- TOC entry 217 (class 1259 OID 249636)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 249592)
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
-- TOC entry 171 (class 1259 OID 249176)
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
-- TOC entry 170 (class 1259 OID 249174)
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
-- TOC entry 207 (class 1259 OID 249535)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 249213)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 249197)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 249549)
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
-- TOC entry 201 (class 1259 OID 249491)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 249441)
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
-- TOC entry 180 (class 1259 OID 249273)
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
-- TOC entry 196 (class 1259 OID 249447)
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
-- TOC entry 216 (class 1259 OID 249627)
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
-- TOC entry 186 (class 1259 OID 249343)
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
-- TOC entry 172 (class 1259 OID 249185)
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
-- TOC entry 221 (class 1259 OID 249677)
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
-- TOC entry 190 (class 1259 OID 249389)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 205 (class 1259 OID 249518)
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
-- TOC entry 212 (class 1259 OID 249584)
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
-- TOC entry 192 (class 1259 OID 249417)
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
-- TOC entry 220 (class 1259 OID 249667)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 249574)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2093 (class 2604 OID 249179)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2595 (class 0 OID 249230)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 249712)
-- Dependencies: 223
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 249695)
-- Dependencies: 222
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 249611)
-- Dependencies: 215
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2609 (class 0 OID 249395)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2612 (class 0 OID 249436)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2605 (class 0 OID 249357)
-- Dependencies: 187
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-552c-cfe0-b1f2-44b433883dc7	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-552c-cfe0-8944-dfc259da88c9	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-552c-cfe0-3b3d-0ec2903f7dd5	AL	ALB	008	Albania 	Albanija	\N
00040000-552c-cfe0-a787-cdfc0bcd43ec	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-552c-cfe0-c5da-ff832783606e	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-552c-cfe0-b4eb-d5aecf5f7c5d	AD	AND	020	Andorra 	Andora	\N
00040000-552c-cfe0-25a7-7fc2a484ee7a	AO	AGO	024	Angola 	Angola	\N
00040000-552c-cfe0-ac44-82373efbf3df	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-552c-cfe0-574e-30ad44b660e9	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-552c-cfe0-64bf-d417bad66205	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-552c-cfe0-7950-74caa8a1d4d2	AR	ARG	032	Argentina 	Argenitna	\N
00040000-552c-cfe0-d7b6-c32504f9539e	AM	ARM	051	Armenia 	Armenija	\N
00040000-552c-cfe0-99fd-0b79443f9a2a	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-552c-cfe0-fda3-21eb1467f512	AU	AUS	036	Australia 	Avstralija	\N
00040000-552c-cfe0-259d-2dc4275eb3b8	AT	AUT	040	Austria 	Avstrija	\N
00040000-552c-cfe0-a53a-151ff7991ca3	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-552c-cfe0-8c8b-6463d9eb1f9d	BS	BHS	044	Bahamas 	Bahami	\N
00040000-552c-cfe0-058a-61cb51026645	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-552c-cfe0-4100-7585a511b33d	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-552c-cfe0-8bac-fe054472209d	BB	BRB	052	Barbados 	Barbados	\N
00040000-552c-cfe0-940f-ab1661c42d1b	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-552c-cfe0-2da2-0caed8027b86	BE	BEL	056	Belgium 	Belgija	\N
00040000-552c-cfe0-b36f-5b684532e09b	BZ	BLZ	084	Belize 	Belize	\N
00040000-552c-cfe0-ba11-68a2580b8402	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-552c-cfe0-c42c-d21c449a957f	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-552c-cfe0-289d-5153fdf5a1a4	BT	BTN	064	Bhutan 	Butan	\N
00040000-552c-cfe0-5b6a-61fe376f6b2e	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-552c-cfe0-26b7-0cb7f80d80fe	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-552c-cfe0-7d64-72134c9c4dd8	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-552c-cfe0-a64b-7dd4715a80de	BW	BWA	072	Botswana 	Bocvana	\N
00040000-552c-cfe0-5931-f4f7e275d1b3	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-552c-cfe0-0d81-6ad525e65803	BR	BRA	076	Brazil 	Brazilija	\N
00040000-552c-cfe0-1ba6-294bc6692bde	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-552c-cfe0-0b67-48246111f13d	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-552c-cfe0-00fa-1e6445bfe4d5	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-552c-cfe0-afd2-f282506bbe7c	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-552c-cfe0-f31e-0351944aba2c	BI	BDI	108	Burundi 	Burundi 	\N
00040000-552c-cfe0-d01c-b75512b94ba9	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-552c-cfe0-d89b-ce8412657452	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-552c-cfe0-5913-132da5feb44f	CA	CAN	124	Canada 	Kanada	\N
00040000-552c-cfe0-465a-55b51ae96ead	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-552c-cfe0-a4fa-60adba7a02ba	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-552c-cfe0-5993-de51f1d2bc36	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-552c-cfe0-6daa-cebf16eb029d	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-552c-cfe0-1ce0-cfc8b724ad29	CL	CHL	152	Chile 	Čile	\N
00040000-552c-cfe0-b2aa-85713bbd26a9	CN	CHN	156	China 	Kitajska	\N
00040000-552c-cfe0-4269-408390ab572f	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-552c-cfe0-18b1-ed9b9378020d	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-552c-cfe0-b3f6-79e91d9b0574	CO	COL	170	Colombia 	Kolumbija	\N
00040000-552c-cfe0-e4c2-6bd397796e9f	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-552c-cfe0-3b71-a5298f5cc1fd	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-552c-cfe0-7869-f2ba8a61205b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-552c-cfe0-f091-f34df871bf0a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-552c-cfe0-64df-7f5476aefc26	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-552c-cfe0-d7c9-8ddf4da939b7	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-552c-cfe0-8484-81f11587ddef	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-552c-cfe0-f962-cac64ddd46c2	CU	CUB	192	Cuba 	Kuba	\N
00040000-552c-cfe0-2090-40308e4cb4e3	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-552c-cfe0-332e-ddab85177e59	CY	CYP	196	Cyprus 	Ciper	\N
00040000-552c-cfe0-6c1d-e41eb3ae1543	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-552c-cfe0-3dde-b5810e2220c6	DK	DNK	208	Denmark 	Danska	\N
00040000-552c-cfe0-5bf6-7c6aee768799	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-552c-cfe0-4a3b-da33ad7dc0a0	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-552c-cfe0-7d25-fb092fb12dc0	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-552c-cfe0-ee53-17fe9fea313f	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-552c-cfe0-02c3-1d3090f84f46	EG	EGY	818	Egypt 	Egipt	\N
00040000-552c-cfe0-fbae-519b8ce5c1b2	SV	SLV	222	El Salvador 	Salvador	\N
00040000-552c-cfe0-c454-f8031b62c4b8	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-552c-cfe0-9170-9c98d019ab10	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-552c-cfe0-4993-991748d67a80	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-552c-cfe0-a843-efe7a6cf9916	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-552c-cfe0-c1f9-6b13a255eec4	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-552c-cfe0-1834-d97f08f28755	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-552c-cfe0-b07b-d0fe33ac314d	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-552c-cfe0-450b-f295c54efd65	FI	FIN	246	Finland 	Finska	\N
00040000-552c-cfe0-d252-df18b23503ea	FR	FRA	250	France 	Francija	\N
00040000-552c-cfe0-0f09-a5ae7a053136	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-552c-cfe0-2c6d-86e4400f0273	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-552c-cfe0-8c83-8c36236d2dab	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-552c-cfe0-4a9c-aefb597d618b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-552c-cfe0-cf67-a514fad8d3a5	GA	GAB	266	Gabon 	Gabon	\N
00040000-552c-cfe0-9037-d047df8a5073	GM	GMB	270	Gambia 	Gambija	\N
00040000-552c-cfe0-d045-3cefa4a31ea0	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-552c-cfe0-2219-65b751f32db5	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-552c-cfe0-2321-c4cf5a4dd7cd	GH	GHA	288	Ghana 	Gana	\N
00040000-552c-cfe0-4c32-df98b59bc374	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-552c-cfe0-3087-f3fb227c400a	GR	GRC	300	Greece 	Grčija	\N
00040000-552c-cfe0-d5dd-73f0eeff0171	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-552c-cfe0-e811-bdaa197593ef	GD	GRD	308	Grenada 	Grenada	\N
00040000-552c-cfe0-d99a-7009baa80d85	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-552c-cfe0-acbf-09048e64dfd5	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-552c-cfe0-53eb-1e94210c2c50	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-552c-cfe0-f501-01bf5209cc11	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-552c-cfe0-5c5b-203994516bdc	GN	GIN	324	Guinea 	Gvineja	\N
00040000-552c-cfe0-1d71-5fc38b8fa647	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-552c-cfe0-a746-c74d2b256736	GY	GUY	328	Guyana 	Gvajana	\N
00040000-552c-cfe0-212a-73dad55326ac	HT	HTI	332	Haiti 	Haiti	\N
00040000-552c-cfe0-2171-4ab316d07829	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-552c-cfe0-5f50-1ff2bdc30b36	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-552c-cfe0-20f2-94f5f1f0f061	HN	HND	340	Honduras 	Honduras	\N
00040000-552c-cfe0-39ff-13b6b3c1e6cd	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-552c-cfe0-6208-0417c6a54d5a	HU	HUN	348	Hungary 	Madžarska	\N
00040000-552c-cfe0-f218-2bdd33c355ef	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-552c-cfe0-2e4f-68a2f060f2d3	IN	IND	356	India 	Indija	\N
00040000-552c-cfe0-806a-4a83bb01efad	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-552c-cfe0-1541-87d9f7a26459	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-552c-cfe0-eaec-de8a54cd755d	IQ	IRQ	368	Iraq 	Irak	\N
00040000-552c-cfe0-a9c8-916c0ccdf53f	IE	IRL	372	Ireland 	Irska	\N
00040000-552c-cfe0-f393-910d478c5a89	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-552c-cfe0-cf1a-cdad70c15395	IL	ISR	376	Israel 	Izrael	\N
00040000-552c-cfe0-a9cd-e07e65cf931e	IT	ITA	380	Italy 	Italija	\N
00040000-552c-cfe0-ba88-3b7c903375e2	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-552c-cfe0-8a93-c7d2243bfda5	JP	JPN	392	Japan 	Japonska	\N
00040000-552c-cfe0-1a07-398f9d534ace	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-552c-cfe0-b1eb-5682cd4a781c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-552c-cfe0-9a7e-1841e3656e2f	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-552c-cfe0-7ce4-4f9d400884d7	KE	KEN	404	Kenya 	Kenija	\N
00040000-552c-cfe0-c124-afe33226c5b5	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-552c-cfe0-ad80-9f3397510c27	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-552c-cfe0-4420-929c8f13b0be	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-552c-cfe0-08fa-e6cad420ec21	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-552c-cfe0-4a60-666d1e7709a6	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-552c-cfe0-0408-26f1743582b9	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-552c-cfe0-3e56-4cd5336be787	LV	LVA	428	Latvia 	Latvija	\N
00040000-552c-cfe0-62cd-bf861f85c537	LB	LBN	422	Lebanon 	Libanon	\N
00040000-552c-cfe0-cf64-7f27b61a2f2c	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-552c-cfe0-6e74-5af26e3115b2	LR	LBR	430	Liberia 	Liberija	\N
00040000-552c-cfe0-eb3a-87d3b1027ff2	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-552c-cfe0-5f5b-e0679d6951a5	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-552c-cfe0-d3cf-eb98df6e0d2d	LT	LTU	440	Lithuania 	Litva	\N
00040000-552c-cfe0-fab2-c2905f4973e6	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-552c-cfe0-ed50-8fd93a987fc7	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-552c-cfe0-577a-ae188c4ebf9a	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-552c-cfe0-aa1f-25667b13632c	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-552c-cfe0-eae3-bba832fa674a	MW	MWI	454	Malawi 	Malavi	\N
00040000-552c-cfe0-2454-948f990df5de	MY	MYS	458	Malaysia 	Malezija	\N
00040000-552c-cfe0-41ee-c3635852de32	MV	MDV	462	Maldives 	Maldivi	\N
00040000-552c-cfe0-ef72-9b4422ada1ad	ML	MLI	466	Mali 	Mali	\N
00040000-552c-cfe0-0838-a714731ea65d	MT	MLT	470	Malta 	Malta	\N
00040000-552c-cfe0-5539-629626bb160c	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-552c-cfe0-e13b-32080d15d00b	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-552c-cfe0-a179-8a176bc2bc9f	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-552c-cfe0-8a2f-7588ab066640	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-552c-cfe0-fea8-32bfb93cf6be	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-552c-cfe0-feed-ce6132661dfa	MX	MEX	484	Mexico 	Mehika	\N
00040000-552c-cfe0-256d-9b1e532b4a9e	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-552c-cfe0-c614-0c6d3fff5434	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-552c-cfe0-6282-fcff35dfe5f8	MC	MCO	492	Monaco 	Monako	\N
00040000-552c-cfe0-4028-371400596607	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-552c-cfe0-a594-b647c02dcafb	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-552c-cfe0-c9af-3eb6096df19d	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-552c-cfe0-af62-dbd7ed5a7d0d	MA	MAR	504	Morocco 	Maroko	\N
00040000-552c-cfe0-944b-2f857c1c7415	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-552c-cfe0-4e76-4d8ec05bc55c	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-552c-cfe0-0ca1-f55824f60c02	NA	NAM	516	Namibia 	Namibija	\N
00040000-552c-cfe0-bfb1-cc7ed8948084	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-552c-cfe0-497b-09df5f504164	NP	NPL	524	Nepal 	Nepal	\N
00040000-552c-cfe0-35e8-e2c62db151f9	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-552c-cfe0-26c2-26f73754ebec	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-552c-cfe0-e04c-60fbf5570d02	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-552c-cfe0-46e1-cbdc9dd3287b	NE	NER	562	Niger 	Niger 	\N
00040000-552c-cfe0-0d0a-e7bd42deed88	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-552c-cfe0-764a-b19318ce471d	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-552c-cfe0-ae61-62a7faf66e5d	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-552c-cfe0-5974-d038d01bc903	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-552c-cfe0-49e3-64d7693269f1	NO	NOR	578	Norway 	Norveška	\N
00040000-552c-cfe0-f9bf-bf55b317f05f	OM	OMN	512	Oman 	Oman	\N
00040000-552c-cfe0-48d4-a0430b2b970b	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-552c-cfe0-7bc9-723cd3197b85	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-552c-cfe0-c255-5efe15013565	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-552c-cfe0-b1fc-791f650b545a	PA	PAN	591	Panama 	Panama	\N
00040000-552c-cfe0-920f-3faae94fdcaf	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-552c-cfe0-694a-4f71cb24ff50	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-552c-cfe0-344b-cfac22919e55	PE	PER	604	Peru 	Peru	\N
00040000-552c-cfe0-b35e-8564e8b8bacc	PH	PHL	608	Philippines 	Filipini	\N
00040000-552c-cfe0-2201-e273576991be	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-552c-cfe0-6a94-4948be5aa3ec	PL	POL	616	Poland 	Poljska	\N
00040000-552c-cfe0-71a8-89e813b6c3f0	PT	PRT	620	Portugal 	Portugalska	\N
00040000-552c-cfe0-8c82-8b69bbf08190	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-552c-cfe0-e32e-e8df1007b4de	QA	QAT	634	Qatar 	Katar	\N
00040000-552c-cfe0-3994-c7c9faae7738	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-552c-cfe0-2f8c-1fe17bf7d22a	RO	ROU	642	Romania 	Romunija	\N
00040000-552c-cfe0-bde2-752acaa5e207	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-552c-cfe0-7b26-89d5a39f1fe3	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-552c-cfe0-b9e3-c96b16a7b0f6	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-552c-cfe0-9447-e576a76148e0	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-552c-cfe0-58e8-660310bb0461	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-552c-cfe0-aed0-d99cb113071d	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-552c-cfe0-8549-32e16a0438f3	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-552c-cfe0-1742-130f7ac8a1a2	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-552c-cfe0-2eab-7f07d7ade978	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-552c-cfe0-75dd-0fe192dbdb63	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-552c-cfe0-3151-5313ce6aa89f	SM	SMR	674	San Marino 	San Marino	\N
00040000-552c-cfe0-23b3-105e800212d8	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-552c-cfe0-72f6-ace9875078c0	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-552c-cfe0-ab9c-47ed68198561	SN	SEN	686	Senegal 	Senegal	\N
00040000-552c-cfe0-fc6d-a0d23bffc940	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-552c-cfe0-5679-57225f8943fb	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-552c-cfe0-3720-52fa19eea4a9	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-552c-cfe0-96c2-34d758d28207	SG	SGP	702	Singapore 	Singapur	\N
00040000-552c-cfe0-35fe-df598c474f58	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-552c-cfe0-8454-4380aa83e003	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-552c-cfe0-3f42-d3e28fd95b1e	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-552c-cfe0-8a79-c2a0ca18df97	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-552c-cfe0-d84f-e0d1269a783e	SO	SOM	706	Somalia 	Somalija	\N
00040000-552c-cfe0-7f14-c57163ca9f2d	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-552c-cfe0-e0cc-739fad11d000	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-552c-cfe0-96ce-c5e974d7a549	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-552c-cfe0-ae8d-7c8abf015a0a	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-552c-cfe0-7d82-64bfd4ad5628	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-552c-cfe0-a3df-7af3d705791a	SD	SDN	729	Sudan 	Sudan	\N
00040000-552c-cfe0-9d67-08000d4ef31f	SR	SUR	740	Suriname 	Surinam	\N
00040000-552c-cfe0-538d-1db56aea55f4	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-552c-cfe0-a6dd-2fe9b1491596	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-552c-cfe0-b31f-0034ffb13467	SE	SWE	752	Sweden 	Švedska	\N
00040000-552c-cfe1-20f7-829a1e54406d	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-552c-cfe1-d26f-73f131db3866	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-552c-cfe1-faf9-2097768e8c8a	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-552c-cfe1-9172-4df44bfc1375	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-552c-cfe1-7bc7-14b9e4f1c39d	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-552c-cfe1-273b-d4c98ecc9f52	TH	THA	764	Thailand 	Tajska	\N
00040000-552c-cfe1-5ead-378aafea50de	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-552c-cfe1-48c2-d9666d2a6418	TG	TGO	768	Togo 	Togo	\N
00040000-552c-cfe1-da61-eba1b44c0212	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-552c-cfe1-15ca-0e0d5accc169	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-552c-cfe1-fcb7-f674eb20cb09	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-552c-cfe1-fa6c-339c98564696	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-552c-cfe1-9073-eefb605ed1da	TR	TUR	792	Turkey 	Turčija	\N
00040000-552c-cfe1-0700-c934ca38c0ff	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-552c-cfe1-9656-b890973b8aa8	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-552c-cfe1-af82-dfa6fad9107a	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-552c-cfe1-6c8d-5e2ed598fa14	UG	UGA	800	Uganda 	Uganda	\N
00040000-552c-cfe1-457d-956a82ee61a7	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-552c-cfe1-4a7f-da690ad21e49	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-552c-cfe1-6c3a-5d61a901e59a	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-552c-cfe1-69f6-390652ae541d	US	USA	840	United States 	Združene države Amerike	\N
00040000-552c-cfe1-a554-dfb55e165907	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-552c-cfe1-56c4-61f929f39005	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-552c-cfe1-ac5e-1fed87ddf09e	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-552c-cfe1-7fec-5f8a563f4f4d	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-552c-cfe1-851f-2091305f9a34	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-552c-cfe1-2ee0-4213df473480	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-552c-cfe1-b05b-b98f9cb5b7cd	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-552c-cfe1-9792-7e8a702ff219	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-552c-cfe1-a6f5-89384d8d8535	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-552c-cfe1-36ad-bf93b6451da5	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-552c-cfe1-13ff-7f32de9ff419	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-552c-cfe1-cbd4-e52cb81425d1	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-552c-cfe1-dcc3-9eedd4a3bbf4	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2628 (class 0 OID 249561)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2607 (class 0 OID 249382)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2611 (class 0 OID 249430)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2597 (class 0 OID 249250)
-- Dependencies: 179
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2617 (class 0 OID 249479)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2621 (class 0 OID 249504)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2603 (class 0 OID 249331)
-- Dependencies: 185
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-552c-cfe1-ed3a-d4d8633a72b0	kravaXXX	color	N;	t	f	f	\N	\N
00000000-552c-cfe1-d8a3-bef6ec3e34d8	privzetInspicient	entity	N;	f	f	f	\N	\N
00000000-552c-cfe1-a702-886809455750	dogodek-status	map	O:18:"Zend\\Config\\Config":4:{s:21:"	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2596 (class 0 OID 249239)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
\.


--
-- TOC entry 2600 (class 0 OID 249301)
-- Dependencies: 182
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2592 (class 0 OID 249204)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00020000-552c-cfe1-8488-8e10ad7f4486	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-3a87-27c54c51a2cf	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-7e22-2e26387306b5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-5f31-4ad749f2eb2b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-d5b0-a856d23e1cd4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-4c30-63a905467214	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-2c48-f94d69a89478	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-2e1c-a685d8869dab	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-27a8-0534fb190b8c	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-5e7b-0442b7b9e315	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-0653-7f62fb7ebef1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-0620-e0a50d5070e4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-3107-fe59fd4c2bc9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-0f05-8daf15621279	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-0ea6-b36c427c13d5	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-21da-aa316c51fb79	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-c04a-2e8fc4d909a6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-9f0b-be5c69331e39	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-92e7-dc1a113da10d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-5aea-c939688bf5fd	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-30f3-9bb6da192205	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-9ae2-a1bbb47bcb54	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-3a21-c341e8755c34	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-bfc1-81851c342104	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-5ff7-a3627672fa37	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-c209-841a362aba4c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-7c6f-aa841a05edb9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-6349-eeeb2860b947	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-d7b4-92a540de5a77	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-fa85-77732c2cffbd	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-17b9-36f658184bbf	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-c0a9-09f73c95abe1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-7327-d38ba1fe111c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-21a5-ec61c6ff32e0	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-3064-6daaa237e650	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-a90b-4f7c06cdac6d	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-b7ae-38cdde769382	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-0b2a-580f8d162825	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-d326-27c822771f30	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-e882-a6f87c0ac201	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-2c33-ddbb04ecca7d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-7ee7-a44ccde51acc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-e57d-0d405410aa0a	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-7e37-74f848bdfe10	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-6ed9-7240e9871bc2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-f807-575160079a03	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-d997-a672ff3e6b24	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-4867-badd20f88a57	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-9f14-781af907b1fb	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-2176-5e3d486166d5	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-4182-744ed7445097	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-4dc8-13df456e19d3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-a6d5-553a9834f98f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-abe9-9837d0fa50ed	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-0e16-8d50612bbfdd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-2349-23c6664cd61d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-7d94-3f3b807dfc8a	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-b88c-372007f82291	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-946a-601193d3904e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-6783-398bedada319	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-ebf4-7f44a06b2eec	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-8ff9-036598787bb9	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-d2f7-2c43d953dcd1	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-e116-c8dddf021a86	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-1178-bb8d9cccfa35	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-4b97-d4f16a1d67a3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-4e91-00706be68035	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-d1f9-089677207edb	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-6d1b-41bf38abcdf5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-1d7f-c63047e06045	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-7709-8be23d81e6da	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-8004-c38d561ea76f	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-a647-032944aa93e1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-c73c-57a8f6d4b3f5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-ab56-9fdda30e729e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-eeea-3a0a7b635a57	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-200a-b2e05734f9ff	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-4208-94d1c56be561	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-c561-606448b2caf1	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-a108-b2e4d8cce2ba	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-4b2c-97cd838e45df	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-bf86-9f5996c4ff5b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-7c09-c4924d358ded	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-bd69-a7fceaad8456	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-5639-6298f0ced3b7	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-d3d8-7abec58419f2	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-f467-375760fbde06	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-9dd1-6178391abc18	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-28d0-46d6762d9c45	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-430c-194a63e3ae01	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-9018-e5f38b632c48	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-bbf6-91bee82f2025	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-f1a2-a284c96c43bb	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-66e9-66564414b22c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-13c3-ef6c64126248	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-1857-7fb18a085138	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-1dc9-f40c55830b99	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-2d54-188a7ee12e31	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-a1e2-a95efa786a0f	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-daa0-e15076c48dc8	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-d73b-658ce9bf0f3a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-b991-45562670831e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-9934-4a0150e8d9ca	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-1d82-82a70fc47824	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-9e09-eeedc3cc6b6d	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-9b2d-0362b499c87e	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-59e8-bca0a58afa4a	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-42e5-f43ace5f5820	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-16e0-d21fe2d32118	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-b7eb-f38deab3ec97	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-d6cd-299ce2110305	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-9779-630a2831bf27	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-4b2c-e300dea65c32	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-6872-ee38962e9502	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-c8d9-d981eb66a145	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-300a-dcbdf3e3d233	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-e7c8-44167b66aa14	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-e2c7-c08cc3c6087b	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-aa27-067ac3f2b980	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-9f84-7d490c52c939	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-5b21-86afc3a61d47	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-b405-4435be30ae4c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-8de6-42bec2d67a0c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-172f-e74b70621e0a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-70ef-f5fcb129dcb5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-181d-fbfc5d04a44d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-21f5-d1542d6f0c90	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-0c31-c6388d6c3939	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-2c61-62c1bd89c009	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-372e-c43583f6ed5d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-9723-cd835ec673b4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-5f84-e802db3def7c	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-ade8-3bb052a03f71	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-1049-d6efbc4a22b8	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-f99d-047f89651d25	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-23e5-f105f517aa00	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-bea2-d6ff488501c5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-c733-b8e46487f350	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-4c6b-8f2415ef3839	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-8ea8-d33b94ba2ecd	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-4ac7-dd1c23a8d93d	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-3c34-26b726ec04b5	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-7c89-0a68a9ffbacb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-bceb-5bff78e9da2d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-3dce-12e635dad2fc	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-b416-e8a9ea36ee85	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-f44b-24b6884eb6ef	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-ceec-d6012bf2e041	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-59fe-33931400feb6	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-8c9e-54905f1451f3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-833b-81f40efa6921	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-0c78-863dda35a678	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-d252-9ee66639377e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-d7d8-9c6a87b24a3f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-0ba3-70b126257b4f	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-7caf-2584d8be863c	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-4f49-ea31fd3380d1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-df6f-f81b515549fb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-36aa-e9fb3e344d64	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-3e0f-ccde20566aab	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-0b38-c31a7f73675e	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-c993-7bb7ad002ea9	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-e429-3b97f6df2d31	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-ffb0-42a20260183e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-8790-c3207a9ba3f5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-d56f-f45d51e4947c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-34a8-a1ae5cda82a5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-5538-1dde12c7828e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-2a0b-c26249810195	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-cf89-ff448ec7e88a	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-8eaa-9e53943c762b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-62e1-6f30a973414e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-0cc4-7664688aff89	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-6a4e-6d578bd512d6	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-f052-ceb80865f007	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-47ec-c3248418cdf1	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-fd4f-b42bd44e834c	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-5c64-14f101bae927	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-84d3-c4f1893ce589	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-21ee-307e846b2ff3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-501d-df2dcae1079e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-f336-77e80478f3d8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-024c-b845b823e622	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-0c70-2d98a7c3d342	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-cff4-6d976ce907ac	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-3261-9dfc2b29cd9e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-a5f2-0e655d8c525e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-e473-9de9248e1982	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-2200-9dcdfd7b6ee1	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-c55b-7c8708cc0bb3	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-68f1-ff61146f4f3e	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-e684-de46facb8f0d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-e90e-cf2d686c3d8a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-4bbb-9ebc4e13568f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-3a51-e4a61eed89f7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-58bc-24669810df0f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-8b60-f8f18211b08b	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-ebf1-96e0807abd91	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-0e21-96f059924f8b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-d108-340b16966b06	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-df52-cab25bbe222d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-e0fb-8b4ede2e0440	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-0a81-6b558c60c862	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-a3d1-713323241b05	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-0372-a84b1f5dba20	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-4cf2-c28671b602d5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-f7e4-15a3cf52af34	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-43b1-acccffe90c17	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-02b8-d007268a7b2a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-aeeb-a9fd33ee0df2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-a15f-1f0f42c76817	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-4e55-d43805a5f2a4	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-5240-133405164204	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-deae-efc41bf978dd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-af18-4c3805ebd355	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-b11d-c15335b51f4f	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-e85e-4b616042594e	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-66ca-3e4073c99645	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-f573-37cd54e31097	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-1a32-9dbcb2f15699	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-a62c-68b5c97f7e9f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-a76e-36836ce59c9c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-f908-b11c73d58756	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-088e-a84410cad523	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-68c9-be16f3334b85	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-2771-0dbd3eff6bc5	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-40c0-e90e5d56eaaa	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-cb1c-5fbadee699bf	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-0216-0b4fca594cdf	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-4cd4-71e0990cafd4	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-8004-9d5e778f12dc	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-ede9-9bd6468d935d	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-27d3-620ac0a13e0b	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-dcc7-a935ea91cf5d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-c5fd-a3649e8e6e53	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-2225-67b6672d0988	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-8606-2d500a609d3f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-3e7e-ae20856e8ceb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-33f9-9e332fcb7713	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-3dc5-0be95a7ceb08	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-2664-04b97e878e28	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-93a8-c85390efadab	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-7fe7-279da01b611b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-0689-3365bd061531	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-cdad-a81552944ab5	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-4ded-ea1001f9405d	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-3812-dcb07c66cabc	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-96c0-1d04b8f741c9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-af3c-1b5ef1499bf5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-ea32-9b7a6585f6a5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-56d6-6fe7087dd843	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-ca97-c19c84a9ab01	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-f8d2-23b15e54e9c7	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-6bac-fcc111422095	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-0007-6a08a7d8e657	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-1f49-c2dcdd76bc37	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-32d4-377f2c07f64e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-7ee6-c574906fc223	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-cb08-c8b256fbf187	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-32c7-f6901ac55352	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-a4bc-7442119aedb5	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-809c-905d1e04721c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-302f-e00791052ee5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-dd99-36104ca67285	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-4c0f-e2245a43af82	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-7111-231e44ce0100	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-58f4-42758d206acc	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-624c-f551a4248890	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-bcc6-0e250c5a3774	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-e1ea-8b20d7a376f3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-0023-a8fd1fefd85c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-4610-2f4847663462	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-fbc3-9feb4480cec8	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-2e55-3f6b305befac	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-f69f-900ea07679fd	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-04b3-c370b24aaee6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-144b-9d22cf45f821	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-28a4-a5cea5b4fb32	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-adb9-d07c90f4a59f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-979f-f867829dcf73	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-c7ea-fff8eca861b5	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-ef60-ddda2c2fddf0	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-6063-c7ae357623e5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-2cb4-d13385be6f55	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-fc43-3af9427c51f7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-7eca-13ce038709c1	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-95fc-dce27e6dffaa	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-b7fc-77799418c2c3	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-271e-f2e7662ea9e8	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-ae2b-fb14d086f6c9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-127d-b975bf5ed619	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-880a-f4240c84ffa4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-a641-3e8c74a1f475	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-1ef3-07ee1b307865	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-d68f-6a78ddf10bad	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-c271-ae0020993fcd	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-637c-7540226b87f2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-894a-3b1306345e13	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-e9a2-d9cd3ba3322d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-6888-10a406164dfc	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-5184-6257e4e1abca	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-36ce-004e59c58cfb	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-7325-13411d44a56d	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-a34f-dca86ea0d0b7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-0911-3d314197a930	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-08ff-d71cee6427a7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-9659-54aad9d72b64	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-bd6a-423ba4888442	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-a4d8-c968613d8959	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-0fa1-f1cab7bdf904	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-6620-efa107f157a3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-0d02-20073316a39d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-763e-a4f65f0a69ae	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-3610-b14b62571c06	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-6d42-d78049a53c45	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-457d-0ea9efa25a08	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-d05a-c2904b8abbfb	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-e009-a2e190c4d9f6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-ed0f-4ec2261f4199	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-f314-b6b49359f44d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-fdc4-e228065ad154	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-febb-5de1ece896bf	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-5230-e9d623f098e4	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-f954-5b6da877abd1	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-0c46-686b5ff38617	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-4cd3-3641f3e02ad9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-b1fc-2fd6ebf2e1c5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-d5f8-68054f90d272	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-0285-37d5af26d972	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-d5ab-e39022a9647c	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-38b9-01a76b5f4211	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-d17d-fe0954af80ab	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-cf15-1360754a323f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-1185-c3b4c693c560	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-7f87-9f1a8b4fc669	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-db47-5fa0294e8ef9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-a18c-0783696816d0	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-3e04-49e0cb3c0c87	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-9f6c-ca7e376b1612	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-cfa9-75ce754eb09b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-cebe-b4b514df527f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-6d94-3572c8631f92	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-3f39-3b580ab2938f	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-3541-731cb754562a	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-f4f0-bc435d7b62b4	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-9fde-781db1420dea	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-f45d-d640474c31a0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-6856-e845d72cc23b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-9312-af38cb7893b1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-acb6-8ab621640079	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-a68f-3d99e378848d	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-9fa1-b21dcf96ce9d	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-2982-8da85bd11680	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-cb3d-f9645debd0d8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-0e06-5c7da41a3ac6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-9c53-57674081cc76	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-0a91-a73a04d22bd2	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-bebf-1390aeeab33d	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-3421-fb297907465a	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-3db3-feae2f1735d4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-d2e8-a05ffb2dbde0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-cdff-d8e6212d405d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-61e0-e18321850d71	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-1ada-b0656009e65f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-1a7c-99350172e4dd	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-ee3a-ae285fdd0f0b	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-94d6-0588e76a1304	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-880f-70b64f09414a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-ae6d-7ad8df332267	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-f85c-12b5c86e3bbb	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-f793-df5b6ef9f93a	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-bb6f-fd2e6bf5696a	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-6832-15741d900254	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-eb88-17ef93966276	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-7c8d-8c3dddde7216	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-ff8b-863d7b93d07d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-e644-7cb60489f61d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-2324-31fa5bef1f76	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-683b-ffc3a356f909	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-629e-c0f096fdb86c	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-a0cb-9e43ff129c84	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-4af9-1a2829b4a371	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-c570-18d2af593192	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-f208-3ffd482aa22b	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-daca-a7cc48a2c739	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-7070-99ca01010bc4	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-279d-2fb603738a1b	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-f8db-9f03d54865d6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-0535-9c0c9c014157	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-0a79-ea5993409604	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-4aeb-e67daf5d80d4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-d21f-73b2ddf28c00	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-21f8-311e02627ae7	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-4d40-e1b8f416e4a3	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-7d29-e73222e19f2c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-d1a3-3f5b1ed7a3ba	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-c448-2870426c5b5e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-cc44-65edd14e5968	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-92c7-3b2123dc29a2	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-8437-0ffba5ed62f4	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-62ab-3983296a1eaa	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-e426-83d0df88de4f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-f3cc-fa1c61af1898	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-0151-421b654d63f6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-c9d7-12d53a55a4fc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-de8d-f1ee65a23062	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-f8ad-3f5420eb0eee	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-cfe1-34ea-6a0d1fb1c75b	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-cfe1-3afa-12b40c5acce6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-cfe1-b91e-f08970086750	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-cfe1-957f-dcb0b86cf9a6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-cfe1-f8b7-7fb416983c5d	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-cfe1-08bc-e83e6d7c7efe	Role-read	Aaa - Vloga - Beri	f
00020000-552c-cfe1-4709-5890a3693b41	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-cfe1-be7d-dec650872c52	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-cfe1-d694-ff042f781c26	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-cfe1-0b8c-abea2f570514	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-cfe1-6eba-60be997014ff	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-cfe1-a7aa-1c093e900324	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-cfe1-0a4b-e5a5b84cddd8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-cfe1-d8a4-4fb41b9b626a	Drzava-read	Seznam držav	f
00020000-552c-cfe1-9baf-bcc7dc8db667	Drzava-write	Urejanje držav	f
00020000-552c-cfe1-29d3-51a4171a8cca	Popa-delete	Poslovni partner - Briši	f
00020000-552c-cfe1-4424-80247a9c5e70	Popa-list	Poslovni partner - Beri	f
00020000-552c-cfe1-3479-31ac308e0f00	Popa-update	Poslovni partner - Posodobi	f
00020000-552c-cfe1-7296-e5107672ebe5	Popa-create	Poslovni partner - Ustvari	f
00020000-552c-cfe1-3e57-4df862ae6d7f	Posta-delete	Pošta - Briši	f
00020000-552c-cfe1-704e-c05536cebc98	Posta-list	Pošta - Beri	f
00020000-552c-cfe1-ca7e-87816e753e0c	Posta-update	Pošta - Posodobi	f
00020000-552c-cfe1-75b7-82d4236fd943	Posta-create	Pošta - Ustvari	f
00020000-552c-cfe1-7e26-73f7aef61985	PostniNaslov-delete	Poštni naslov - Briši	f
00020000-552c-cfe1-1589-09dc3ce11798	PostniNaslov-list	Poštni naslov - Beri	f
00020000-552c-cfe1-0ca7-8f67b9fb8f69	PostniNaslov-update	Poštni naslov - Posodobi	f
00020000-552c-cfe1-4e33-d615cbaa0bb0	PostniNaslov-create	Poštni naslov - Ustvari	f
\.


--
-- TOC entry 2594 (class 0 OID 249223)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00000000-552c-cfe1-e429-15b66b7e4324	00020000-552c-cfe1-d8a4-4fb41b9b626a
00000000-552c-cfe1-e429-15b66b7e4324	00020000-552c-cfe1-0f05-8daf15621279
00000000-552c-cfe1-6cf7-b88870292196	00020000-552c-cfe1-9baf-bcc7dc8db667
00000000-552c-cfe1-6cf7-b88870292196	00020000-552c-cfe1-d8a4-4fb41b9b626a
\.


--
-- TOC entry 2622 (class 0 OID 249511)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2626 (class 0 OID 249541)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 249653)
-- Dependencies: 219
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2599 (class 0 OID 249280)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2602 (class 0 OID 249323)
-- Dependencies: 184
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-552c-cfe0-c124-56c06cf3907d	8341	Adlešiči
00050000-552c-cfe0-cbca-acc591eab287	5270	Ajdovščina
00050000-552c-cfe0-b069-5ed17051250e	6280	Ankaran/Ancarano
00050000-552c-cfe0-8e1c-9194cc2bae7d	9253	Apače
00050000-552c-cfe0-2332-a097a4b830dd	8253	Artiče
00050000-552c-cfe0-c323-43558f67965f	4275	Begunje na Gorenjskem
00050000-552c-cfe0-ad2a-35b27dfcf553	1382	Begunje pri Cerknici
00050000-552c-cfe0-3a0a-3dba1d901ca0	9231	Beltinci
00050000-552c-cfe0-ba9d-5cefff45f61c	2234	Benedikt
00050000-552c-cfe0-f1a5-cad1e941b77b	2345	Bistrica ob Dravi
00050000-552c-cfe0-9431-a335b9ada987	3256	Bistrica ob Sotli
00050000-552c-cfe0-e641-6648f398920b	8259	Bizeljsko
00050000-552c-cfe0-2e3a-efac96089be4	1223	Blagovica
00050000-552c-cfe0-713c-c58952708fdf	8283	Blanca
00050000-552c-cfe0-9b82-16330b8fd552	4260	Bled
00050000-552c-cfe0-8dc5-07f8338193d4	4273	Blejska Dobrava
00050000-552c-cfe0-09ba-921e5388b0f3	9265	Bodonci
00050000-552c-cfe0-d8eb-230257dc6d4a	9222	Bogojina
00050000-552c-cfe0-6e83-67d462cac571	4263	Bohinjska Bela
00050000-552c-cfe0-a731-24bb814bbfb4	4264	Bohinjska Bistrica
00050000-552c-cfe0-e0bb-e9f4d9309d20	4265	Bohinjsko jezero
00050000-552c-cfe0-af65-5de0ed8c8e73	1353	Borovnica
00050000-552c-cfe0-2582-51b1723f33e0	8294	Boštanj
00050000-552c-cfe0-c289-c3cf19e0e5d5	5230	Bovec
00050000-552c-cfe0-fa07-37d1f2200605	5295	Branik
00050000-552c-cfe0-0e37-90d3c1bb2c35	3314	Braslovče
00050000-552c-cfe0-65cb-ec45846e8886	5223	Breginj
00050000-552c-cfe0-4b54-fbb883a2635b	8280	Brestanica
00050000-552c-cfe0-e01e-36a32bdf344e	2354	Bresternica
00050000-552c-cfe0-3718-aa30991c9882	4243	Brezje
00050000-552c-cfe0-3db6-a6da6749d132	1351	Brezovica pri Ljubljani
00050000-552c-cfe0-e42e-d8e4f9bd5e0a	8250	Brežice
00050000-552c-cfe0-00f6-46defe3039a4	4210	Brnik - Aerodrom
00050000-552c-cfe0-768a-0011517a278e	8321	Brusnice
00050000-552c-cfe0-8161-20cd6829a3d0	3255	Buče
00050000-552c-cfe0-9487-c1aa40d190e4	8276	Bučka 
00050000-552c-cfe0-6328-ea4396fc75f4	9261	Cankova
00050000-552c-cfe0-eb93-031c81ace74a	3000	Celje 
00050000-552c-cfe0-c454-fb3126272bb0	3001	Celje - poštni predali
00050000-552c-cfe0-e015-325f8b58da0b	4207	Cerklje na Gorenjskem
00050000-552c-cfe0-fedc-ee93757a353e	8263	Cerklje ob Krki
00050000-552c-cfe0-4be6-cb187349257e	1380	Cerknica
00050000-552c-cfe0-fba3-a6498392a4f6	5282	Cerkno
00050000-552c-cfe0-6e37-7fe1e5647e17	2236	Cerkvenjak
00050000-552c-cfe0-9af6-bb9ab7d6c149	2215	Ceršak
00050000-552c-cfe0-febe-d682ff2414a5	2326	Cirkovce
00050000-552c-cfe0-27ca-76ff9681a175	2282	Cirkulane
00050000-552c-cfe0-40a9-c960a37567a4	5273	Col
00050000-552c-cfe0-8159-7984307a806e	8251	Čatež ob Savi
00050000-552c-cfe0-38df-8264c48c6425	1413	Čemšenik
00050000-552c-cfe0-d818-3b58f888aff1	5253	Čepovan
00050000-552c-cfe0-7e2d-79a45e1ddb3d	9232	Črenšovci
00050000-552c-cfe0-c716-bdb5cff37dee	2393	Črna na Koroškem
00050000-552c-cfe0-7a6b-eb0737b0391c	6275	Črni Kal
00050000-552c-cfe0-c0d7-6c2dafcd021e	5274	Črni Vrh nad Idrijo
00050000-552c-cfe0-5069-5862fd4726c8	5262	Črniče
00050000-552c-cfe0-57b7-18808cdf21bd	8340	Črnomelj
00050000-552c-cfe0-098e-63d378f87b61	6271	Dekani
00050000-552c-cfe0-d697-b44ef9ab2b57	5210	Deskle
00050000-552c-cfe0-efad-dbb4acf36a45	2253	Destrnik
00050000-552c-cfe0-af26-2493358cb6f4	6215	Divača
00050000-552c-cfe0-b314-e1a0c9843934	1233	Dob
00050000-552c-cfe0-d9e4-e0255418620c	3224	Dobje pri Planini
00050000-552c-cfe0-31cd-6f622f3f2f6f	8257	Dobova
00050000-552c-cfe0-2d5a-cc8fb338ac6d	1423	Dobovec
00050000-552c-cfe0-b1b0-50e46ea2210b	5263	Dobravlje
00050000-552c-cfe0-6a3f-74e59bba7c0e	3204	Dobrna
00050000-552c-cfe0-72f5-273b6c8a9015	8211	Dobrnič
00050000-552c-cfe0-4aa7-d382e47a54f1	1356	Dobrova
00050000-552c-cfe0-c99d-c285308958a1	9223	Dobrovnik/Dobronak 
00050000-552c-cfe0-c2c8-bc7af2cf1b05	5212	Dobrovo v Brdih
00050000-552c-cfe0-df66-dbdf5930beb6	1431	Dol pri Hrastniku
00050000-552c-cfe0-0b1e-d313a70fd641	1262	Dol pri Ljubljani
00050000-552c-cfe0-923a-86d4b7385c6a	1273	Dole pri Litiji
00050000-552c-cfe0-a170-dc1e69912d6d	1331	Dolenja vas
00050000-552c-cfe0-7ae1-200fe486c73a	8350	Dolenjske Toplice
00050000-552c-cfe0-5090-0e5b6a3bae9a	1230	Domžale
00050000-552c-cfe0-af47-110433260a70	2252	Dornava
00050000-552c-cfe0-df47-f8f0b52674e4	5294	Dornberk
00050000-552c-cfe0-3acb-db1f8489ed47	1319	Draga
00050000-552c-cfe0-fc60-38864d69858c	8343	Dragatuš
00050000-552c-cfe0-f489-3ba6c886e440	3222	Dramlje
00050000-552c-cfe0-022f-0efe1730477e	2370	Dravograd
00050000-552c-cfe0-0e40-a34432e40c57	4203	Duplje
00050000-552c-cfe0-dc81-6f7732598358	6221	Dutovlje
00050000-552c-cfe0-b91f-47960db3a269	8361	Dvor
00050000-552c-cfe0-0ce2-21dd0725b7b3	2343	Fala
00050000-552c-cfe0-f23c-81686faa644c	9208	Fokovci
00050000-552c-cfe0-fc7b-9d28292d2a5d	2313	Fram
00050000-552c-cfe0-7072-bed4a712e95a	3213	Frankolovo
00050000-552c-cfe0-cc10-781899e44a04	1274	Gabrovka
00050000-552c-cfe0-fd58-8197d23b6690	8254	Globoko
00050000-552c-cfe0-f63a-e2c8a7dd8abf	5275	Godovič
00050000-552c-cfe0-3134-f629dcad3026	4204	Golnik
00050000-552c-cfe0-cc90-6d68d6ab4f05	3303	Gomilsko
00050000-552c-cfe0-d4ef-b95331426769	4224	Gorenja vas
00050000-552c-cfe0-3663-291dd0fcf141	3263	Gorica pri Slivnici
00050000-552c-cfe0-3946-4d0c79040bf2	2272	Gorišnica
00050000-552c-cfe0-a9a4-ecaa87efe679	9250	Gornja Radgona
00050000-552c-cfe0-faba-54be0419c3fe	3342	Gornji Grad
00050000-552c-cfe0-0be0-3b6ed8b77550	4282	Gozd Martuljek
00050000-552c-cfe0-6960-d83ddd63a819	6272	Gračišče
00050000-552c-cfe0-2cb6-fcb28b9b07f3	9264	Grad
00050000-552c-cfe0-d178-49972b335231	8332	Gradac
00050000-552c-cfe0-bed3-1fbd755c1fe6	1384	Grahovo
00050000-552c-cfe0-897c-5fab6610799b	5242	Grahovo ob Bači
00050000-552c-cfe0-e6a7-e28ddcaa98b3	5251	Grgar
00050000-552c-cfe0-a584-1dfd1b95d58a	3302	Griže
00050000-552c-cfe0-447e-4475a41ed49b	3231	Grobelno
00050000-552c-cfe0-6264-25dca9cc3a3a	1290	Grosuplje
00050000-552c-cfe0-0e0a-ba936645096b	2288	Hajdina
00050000-552c-cfe0-5dc1-fa04ca0b64ca	8362	Hinje
00050000-552c-cfe0-47f9-d59b95672837	2311	Hoče
00050000-552c-cfe0-9479-a7d5fe01abb7	9205	Hodoš/Hodos
00050000-552c-cfe0-a7d3-2b9638b60e80	1354	Horjul
00050000-552c-cfe0-fc5a-bed95aff2d0f	1372	Hotedršica
00050000-552c-cfe0-56b5-3f6a3d3fae45	1430	Hrastnik
00050000-552c-cfe0-66b0-dae2abb6c895	6225	Hruševje
00050000-552c-cfe0-9ff0-b165fc8434c6	4276	Hrušica
00050000-552c-cfe0-7785-84c04ceffe88	5280	Idrija
00050000-552c-cfe0-e78d-7a79a41e7172	1292	Ig
00050000-552c-cfe0-7696-a98218cd0a91	6250	Ilirska Bistrica
00050000-552c-cfe0-22f7-8f21141d4e9a	6251	Ilirska Bistrica-Trnovo
00050000-552c-cfe0-e2cf-a72d0ebd2256	1295	Ivančna Gorica
00050000-552c-cfe0-899a-aa82bd0eb793	2259	Ivanjkovci
00050000-552c-cfe0-3bc7-8c5c13b12cd0	1411	Izlake
00050000-552c-cfe0-4ea2-c1a5e5db67c2	6310	Izola/Isola
00050000-552c-cfe0-6bc2-f7433b38e36e	2222	Jakobski Dol
00050000-552c-cfe0-a5e2-8782749a9eb5	2221	Jarenina
00050000-552c-cfe0-d16a-540fa12eb734	6254	Jelšane
00050000-552c-cfe0-9ff2-3ee2a64734ca	4270	Jesenice
00050000-552c-cfe0-2a08-a04eca30c23a	8261	Jesenice na Dolenjskem
00050000-552c-cfe0-b945-d3680cd234bc	3273	Jurklošter
00050000-552c-cfe0-9f8d-4c5af14c74ac	2223	Jurovski Dol
00050000-552c-cfe0-c5e5-63b2d7f6ae20	2256	Juršinci
00050000-552c-cfe0-8150-f662a3f2fdd0	5214	Kal nad Kanalom
00050000-552c-cfe0-df4a-c25ef2016345	3233	Kalobje
00050000-552c-cfe0-e38f-6e06590af843	4246	Kamna Gorica
00050000-552c-cfe0-0ee3-615b7e1d4ec9	2351	Kamnica
00050000-552c-cfe0-fc64-39d9d627ba66	1241	Kamnik
00050000-552c-cfe0-6c5a-0f7531007092	5213	Kanal
00050000-552c-cfe0-a501-57401d8d74da	8258	Kapele
00050000-552c-cfe0-9b29-3a9c64476562	2362	Kapla
00050000-552c-cfe0-0990-1b29692839e4	2325	Kidričevo
00050000-552c-cfe0-d155-939db976c9c9	1412	Kisovec
00050000-552c-cfe0-4994-061feff005de	6253	Knežak
00050000-552c-cfe0-2260-1ec1fbe21b2c	5222	Kobarid
00050000-552c-cfe0-e2e5-231c0404b314	9227	Kobilje
00050000-552c-cfe0-5098-e4a113f0b9db	1330	Kočevje
00050000-552c-cfe0-fd11-1dcf96fdc762	1338	Kočevska Reka
00050000-552c-cfe0-e182-6978afa4b611	2276	Kog
00050000-552c-cfe0-c4a9-2d62413efaa4	5211	Kojsko
00050000-552c-cfe0-ac52-534d4db4e6d3	6223	Komen
00050000-552c-cfe0-8f93-0f4724198a59	1218	Komenda
00050000-552c-cfe0-ff62-22f1c18cdbb0	6000	Koper/Capodistria 
00050000-552c-cfe0-a3fa-e4be9890d1ef	6001	Koper/Capodistria - poštni predali
00050000-552c-cfe0-1eca-888aaca95cef	8282	Koprivnica
00050000-552c-cfe0-3e14-598a87d567d6	5296	Kostanjevica na Krasu
00050000-552c-cfe0-3167-fb353457ab9b	8311	Kostanjevica na Krki
00050000-552c-cfe0-2f25-fa398f80d9bf	1336	Kostel
00050000-552c-cfe0-9d9f-c085e244923d	6256	Košana
00050000-552c-cfe0-5fe5-f48f2642525c	2394	Kotlje
00050000-552c-cfe0-dd4f-4a44e899a667	6240	Kozina
00050000-552c-cfe0-ed86-5034f3356b46	3260	Kozje
00050000-552c-cfe0-65ea-ef070ff4ce27	4000	Kranj 
00050000-552c-cfe0-8798-8abcd994bd6d	4001	Kranj - poštni predali
00050000-552c-cfe0-d5b9-672edc5a1b64	4280	Kranjska Gora
00050000-552c-cfe0-49df-ed95f5893a23	1281	Kresnice
00050000-552c-cfe0-1bc5-cd4df1b13511	4294	Križe
00050000-552c-cfe0-c581-ba4643013757	9206	Križevci
00050000-552c-cfe0-d11a-2d57497d5815	9242	Križevci pri Ljutomeru
00050000-552c-cfe0-fccb-7a5605079bfa	1301	Krka
00050000-552c-cfe0-e5d2-bcb6d254ceaa	8296	Krmelj
00050000-552c-cfe0-b11c-88d8696d8f04	4245	Kropa
00050000-552c-cfe0-f9f0-9e0d25fe19f1	8262	Krška vas
00050000-552c-cfe0-f562-4562601c650c	8270	Krško
00050000-552c-cfe0-4f19-3fc22b63def5	9263	Kuzma
00050000-552c-cfe0-b482-aa3d05ffbd67	2318	Laporje
00050000-552c-cfe0-1829-05d0e3d48c28	3270	Laško
00050000-552c-cfe0-21ce-5480c88f6ca5	1219	Laze v Tuhinju
00050000-552c-cfe0-5187-555192de6316	2230	Lenart v Slovenskih goricah
00050000-552c-cfe0-eef0-06991c0f7a91	9220	Lendava/Lendva
00050000-552c-cfe0-1810-07c0c90605d9	4248	Lesce
00050000-552c-cfe0-b7b1-33553c5d0102	3261	Lesično
00050000-552c-cfe0-52d4-9127a83d000e	8273	Leskovec pri Krškem
00050000-552c-cfe0-2df9-2718f4775a66	2372	Libeliče
00050000-552c-cfe0-a0e1-68bbfbb01869	2341	Limbuš
00050000-552c-cfe0-d486-deba24a7c94d	1270	Litija
00050000-552c-cfe0-8d95-b23931349b6b	3202	Ljubečna
00050000-552c-cfe0-3d88-b7c609f12d04	1000	Ljubljana 
00050000-552c-cfe0-fdb0-b4002205ad98	1001	Ljubljana - poštni predali
00050000-552c-cfe0-fc26-86fa67932404	1231	Ljubljana - Črnuče
00050000-552c-cfe0-9a0c-c4cbc42cbbcd	1261	Ljubljana - Dobrunje
00050000-552c-cfe0-85bb-0b222c4edc54	1260	Ljubljana - Polje
00050000-552c-cfe0-2c44-50fca8ed4502	1210	Ljubljana - Šentvid
00050000-552c-cfe0-9bbc-9f238b757bf3	1211	Ljubljana - Šmartno
00050000-552c-cfe0-0ff6-0c4e7f8f1cbf	3333	Ljubno ob Savinji
00050000-552c-cfe0-e4b2-86d671b81aee	9240	Ljutomer
00050000-552c-cfe0-0a5d-ba4f0f2ac9d7	3215	Loče
00050000-552c-cfe0-271c-a4c5a30833fb	5231	Log pod Mangartom
00050000-552c-cfe0-b06a-3fcde05d036c	1358	Log pri Brezovici
00050000-552c-cfe0-7ebe-f047ac3cc154	1370	Logatec
00050000-552c-cfe0-a33a-a6e3c83c7b3d	1371	Logatec
00050000-552c-cfe0-4853-efa4795bcd97	1434	Loka pri Zidanem Mostu
00050000-552c-cfe0-3e70-4bfaefdb9889	3223	Loka pri Žusmu
00050000-552c-cfe0-1f93-335057bc4d59	6219	Lokev
00050000-552c-cfe0-2f38-be29b27f239d	1318	Loški Potok
00050000-552c-cfe0-b120-bd82e8097c46	2324	Lovrenc na Dravskem polju
00050000-552c-cfe0-c60a-da23ec631103	2344	Lovrenc na Pohorju
00050000-552c-cfe0-c587-b938f8d0203d	3334	Luče
00050000-552c-cfe0-ef2a-570c20c71ca8	1225	Lukovica
00050000-552c-cfe0-e4e9-4f71f7918427	9202	Mačkovci
00050000-552c-cfe0-f980-bb6fd5a0271f	2322	Majšperk
00050000-552c-cfe0-b8f1-558f60c9824e	2321	Makole
00050000-552c-cfe0-0b21-27d1fa9df91f	9243	Mala Nedelja
00050000-552c-cfe0-fb46-07ca86b023a4	2229	Malečnik
00050000-552c-cfe0-ebb1-1c9b8ce5ec8e	6273	Marezige
00050000-552c-cfe0-3aec-05f8d2a4353a	2000	Maribor 
00050000-552c-cfe0-8747-a95d3ec9fde7	2001	Maribor - poštni predali
00050000-552c-cfe0-3681-be33b9d84527	2206	Marjeta na Dravskem polju
00050000-552c-cfe0-45a6-53a25dac689a	2281	Markovci
00050000-552c-cfe0-12f0-9c71d5bb3f94	9221	Martjanci
00050000-552c-cfe0-f9c9-eb78f83f7a8e	6242	Materija
00050000-552c-cfe0-af63-ea783355dd57	4211	Mavčiče
00050000-552c-cfe0-52c8-88a737322a8d	1215	Medvode
00050000-552c-cfe0-0f7f-ac427ad8a4c6	1234	Mengeš
00050000-552c-cfe0-a8d1-5e6aba079741	8330	Metlika
00050000-552c-cfe0-4060-1859a1dbc634	2392	Mežica
00050000-552c-cfe0-41aa-d66de709ab94	2204	Miklavž na Dravskem polju
00050000-552c-cfe0-e15e-1f4060942b81	2275	Miklavž pri Ormožu
00050000-552c-cfe0-eeae-5863b0857f35	5291	Miren
00050000-552c-cfe0-95a7-0f857d3b171a	8233	Mirna
00050000-552c-cfe0-9d1a-ef67816ae1a0	8216	Mirna Peč
00050000-552c-cfe0-4a15-bc4a6e05d345	2382	Mislinja
00050000-552c-cfe0-2f24-5af8b1a03d74	4281	Mojstrana
00050000-552c-cfe0-9dd4-7b5efa630d88	8230	Mokronog
00050000-552c-cfe0-22ea-c47f40df182c	1251	Moravče
00050000-552c-cfe0-cc4c-f1966f59d585	9226	Moravske Toplice
00050000-552c-cfe0-e214-f3d2cfb0a8a9	5216	Most na Soči
00050000-552c-cfe0-00cd-ff0ae45a43c4	1221	Motnik
00050000-552c-cfe0-c169-bc8fd68eccda	3330	Mozirje
00050000-552c-cfe0-8b8c-e805dc2031d6	9000	Murska Sobota 
00050000-552c-cfe0-4453-88bc1bc2548f	9001	Murska Sobota - poštni predali
00050000-552c-cfe0-ae7e-32802c274390	2366	Muta
00050000-552c-cfe0-856d-bd581d2c4f39	4202	Naklo
00050000-552c-cfe0-3839-b50087168146	3331	Nazarje
00050000-552c-cfe0-46cb-f948a3cf050b	1357	Notranje Gorice
00050000-552c-cfe0-2ae5-a7cb35f4fad0	3203	Nova Cerkev
00050000-552c-cfe0-aa84-56645c945fb0	5000	Nova Gorica 
00050000-552c-cfe0-2886-6c205840bbf0	5001	Nova Gorica - poštni predali
00050000-552c-cfe0-7896-f6df43f24a3e	1385	Nova vas
00050000-552c-cfe0-73c2-3895adeb3571	8000	Novo mesto
00050000-552c-cfe0-bc1e-4ee3303e60d8	8001	Novo mesto - poštni predali
00050000-552c-cfe0-a15e-4df715cd124e	6243	Obrov
00050000-552c-cfe0-b441-6e86a419f6cf	9233	Odranci
00050000-552c-cfe0-407b-9c131287f4c7	2317	Oplotnica
00050000-552c-cfe0-f5e5-c0736cdf64a4	2312	Orehova vas
00050000-552c-cfe0-1036-da40bc73fc81	2270	Ormož
00050000-552c-cfe0-b3f8-20a10dd90604	1316	Ortnek
00050000-552c-cfe0-3285-a9635b9a4536	1337	Osilnica
00050000-552c-cfe0-6061-7b60a241e8bf	8222	Otočec
00050000-552c-cfe0-aa54-4058ece0a71e	2361	Ožbalt
00050000-552c-cfe0-6b5b-161832e84ad3	2231	Pernica
00050000-552c-cfe0-2b94-56a123585894	2211	Pesnica pri Mariboru
00050000-552c-cfe0-bb32-b2cbce7e4e5e	9203	Petrovci
00050000-552c-cfe0-2831-657164f831f8	3301	Petrovče
00050000-552c-cfe0-dce5-f8f11bd9fdcb	6330	Piran/Pirano
00050000-552c-cfe0-f88c-d974e7377337	8255	Pišece
00050000-552c-cfe0-c512-79201d487186	6257	Pivka
00050000-552c-cfe0-f79e-be1a8978d4b3	6232	Planina
00050000-552c-cfe0-8853-6b27ed89636c	3225	Planina pri Sevnici
00050000-552c-cfe0-fde8-bb5740b0c1e2	6276	Pobegi
00050000-552c-cfe0-c67a-55b397a743d7	8312	Podbočje
00050000-552c-cfe0-8bd5-c3aa97d871c6	5243	Podbrdo
00050000-552c-cfe0-bab9-23a4c399a95f	3254	Podčetrtek
00050000-552c-cfe0-2a9c-748017f66116	2273	Podgorci
00050000-552c-cfe0-e0dc-9e84b9672ec8	6216	Podgorje
00050000-552c-cfe0-e40a-404106ac6d9b	2381	Podgorje pri Slovenj Gradcu
00050000-552c-cfe0-38cf-3965534cfc6a	6244	Podgrad
00050000-552c-cfe0-425c-014921ab1191	1414	Podkum
00050000-552c-cfe0-d52f-ebe6588ed716	2286	Podlehnik
00050000-552c-cfe0-223e-408e245e3410	5272	Podnanos
00050000-552c-cfe0-9cd8-9290b8eebfb9	4244	Podnart
00050000-552c-cfe0-d760-7e625b22d067	3241	Podplat
00050000-552c-cfe0-c2e1-cdc641e2a691	3257	Podsreda
00050000-552c-cfe0-51fb-e3b705964730	2363	Podvelka
00050000-552c-cfe0-4461-82c8399e8365	2208	Pohorje
00050000-552c-cfe0-e303-9d255a6e8c20	2257	Polenšak
00050000-552c-cfe0-a348-67c66f17ce03	1355	Polhov Gradec
00050000-552c-cfe0-f6eb-2b6c14407da6	4223	Poljane nad Škofjo Loko
00050000-552c-cfe0-f9ad-b314c4530947	2319	Poljčane
00050000-552c-cfe0-5826-79c0e264bfc5	1272	Polšnik
00050000-552c-cfe0-4647-72e96cf4df4a	3313	Polzela
00050000-552c-cfe0-31b2-53bf00a1edd5	3232	Ponikva
00050000-552c-cfe0-47bb-2403eb202831	6320	Portorož/Portorose
00050000-552c-cfe0-1b6c-1948fab5d31e	6230	Postojna
00050000-552c-cfe0-118c-422228871fd9	2331	Pragersko
00050000-552c-cfe0-c9ea-3fcc7849cbd2	3312	Prebold
00050000-552c-cfe0-6091-153823def42f	4205	Preddvor
00050000-552c-cfe0-f3d4-b0e10968499d	6255	Prem
00050000-552c-cfe0-faaf-418c68b89289	1352	Preserje
00050000-552c-cfe0-9f93-8a6bfa1bf9e7	6258	Prestranek
00050000-552c-cfe0-56a2-fb312040500b	2391	Prevalje
00050000-552c-cfe0-d26f-e0f378fe6499	3262	Prevorje
00050000-552c-cfe0-7da4-5eab89bc9d07	1276	Primskovo 
00050000-552c-cfe0-7211-be67215754c1	3253	Pristava pri Mestinju
00050000-552c-cfe0-bedc-fe32226b6adc	9207	Prosenjakovci/Partosfalva
00050000-552c-cfe0-839d-16d6004933e9	5297	Prvačina
00050000-552c-cfe0-8d9f-b87f71007fda	2250	Ptuj
00050000-552c-cfe0-89c3-af2bcc48dd96	2323	Ptujska Gora
00050000-552c-cfe0-1171-b5ea3058f330	9201	Puconci
00050000-552c-cfe0-3337-8f04f14c84d1	2327	Rače
00050000-552c-cfe0-3043-878c490ac941	1433	Radeče
00050000-552c-cfe0-5bb5-800f6256c2d3	9252	Radenci
00050000-552c-cfe0-5fff-f039cdf9f9f7	2360	Radlje ob Dravi
00050000-552c-cfe0-1207-5b3c64a654fa	1235	Radomlje
00050000-552c-cfe0-1f2c-c151272ca5f8	4240	Radovljica
00050000-552c-cfe0-6a7c-120d7a2a5197	8274	Raka
00050000-552c-cfe0-12bc-09550c8289fa	1381	Rakek
00050000-552c-cfe0-7b4a-7f55daa6b1fe	4283	Rateče - Planica
00050000-552c-cfe0-4d90-c6ab239876fa	2390	Ravne na Koroškem
00050000-552c-cfe0-bef3-49ff9df7393b	9246	Razkrižje
00050000-552c-cfe0-5936-0f65071218a8	3332	Rečica ob Savinji
00050000-552c-cfe0-e312-7f2b5b1221b6	5292	Renče
00050000-552c-cfe0-21c7-5691cd2c4b92	1310	Ribnica
00050000-552c-cfe0-7157-cfd452d22b21	2364	Ribnica na Pohorju
00050000-552c-cfe0-a161-e659981f50a5	3272	Rimske Toplice
00050000-552c-cfe0-1092-d16c96ff2c8a	1314	Rob
00050000-552c-cfe0-9520-477d83344215	5215	Ročinj
00050000-552c-cfe0-2f05-67d293b487fa	3250	Rogaška Slatina
00050000-552c-cfe0-9189-83b405c8922f	9262	Rogašovci
00050000-552c-cfe0-82ec-124ac43955d2	3252	Rogatec
00050000-552c-cfe0-29c4-cee4955a7f30	1373	Rovte
00050000-552c-cfe0-c759-aff7de81bb34	2342	Ruše
00050000-552c-cfe0-bb71-c90f5ca9666c	1282	Sava
00050000-552c-cfe0-b808-0f22b743f616	6333	Sečovlje/Sicciole
00050000-552c-cfe0-3713-2394e77644ed	4227	Selca
00050000-552c-cfe0-7fc4-89c32ba7beb1	2352	Selnica ob Dravi
00050000-552c-cfe0-7779-498011cf0eb3	8333	Semič
00050000-552c-cfe0-272a-bacd8d4c3204	8281	Senovo
00050000-552c-cfe0-2837-9592cd0dd4b6	6224	Senožeče
00050000-552c-cfe0-c61b-02319fc0177d	8290	Sevnica
00050000-552c-cfe0-8e8b-e66a552b6aed	6210	Sežana
00050000-552c-cfe0-660f-f4f3dd68da0d	2214	Sladki Vrh
00050000-552c-cfe0-69ca-06f886981f0d	5283	Slap ob Idrijci
00050000-552c-cfe0-d56f-e68c6d10e247	2380	Slovenj Gradec
00050000-552c-cfe0-6feb-5514f4e1fc8c	2310	Slovenska Bistrica
00050000-552c-cfe0-df2f-1b3d5bf58150	3210	Slovenske Konjice
00050000-552c-cfe0-2764-411886d79343	1216	Smlednik
00050000-552c-cfe0-79ec-5b37a729e62a	5232	Soča
00050000-552c-cfe0-5a7a-5742e00921ca	1317	Sodražica
00050000-552c-cfe0-ff3c-a70d3745db1e	3335	Solčava
00050000-552c-cfe0-1717-7e37bbf9f714	5250	Solkan
00050000-552c-cfe0-1abf-a71ccce557e6	4229	Sorica
00050000-552c-cfe0-e0cd-cdc817012978	4225	Sovodenj
00050000-552c-cfe0-d5ca-04466091c335	5281	Spodnja Idrija
00050000-552c-cfe0-8765-450214b5556c	2241	Spodnji Duplek
00050000-552c-cfe0-7d17-db62ed070a8b	9245	Spodnji Ivanjci
00050000-552c-cfe0-ac66-37d32e576d79	2277	Središče ob Dravi
00050000-552c-cfe0-98fe-35f22995f817	4267	Srednja vas v Bohinju
00050000-552c-cfe0-bf4b-bf545bb45bf9	8256	Sromlje 
00050000-552c-cfe0-31d7-08a307946450	5224	Srpenica
00050000-552c-cfe0-62b5-e717d9d0e269	1242	Stahovica
00050000-552c-cfe0-0dcd-aeba560cc1ac	1332	Stara Cerkev
00050000-552c-cfe0-6f42-a1b73ea080dc	8342	Stari trg ob Kolpi
00050000-552c-cfe0-393f-aa71a996a58d	1386	Stari trg pri Ložu
00050000-552c-cfe0-b10c-327362f7a3c4	2205	Starše
00050000-552c-cfe0-a3d4-e88662cc95bf	2289	Stoperce
00050000-552c-cfe0-37fb-46d156f36419	8322	Stopiče
00050000-552c-cfe0-d039-adace4e8c4af	3206	Stranice
00050000-552c-cfe0-4293-d21770cfa847	8351	Straža
00050000-552c-cfe0-2882-aaf5c8f639a9	1313	Struge
00050000-552c-cfe0-1b6e-5922f820fbd3	8293	Studenec
00050000-552c-cfe0-0875-a93e23cb1549	8331	Suhor
00050000-552c-cfe0-3938-84fb0dabd0c5	2233	Sv. Ana v Slovenskih goricah
00050000-552c-cfe0-e283-102b15f76437	2235	Sv. Trojica v Slovenskih goricah
00050000-552c-cfe0-7051-505ec960b146	2353	Sveti Duh na Ostrem Vrhu
00050000-552c-cfe0-1d9c-5c66cf066889	9244	Sveti Jurij ob Ščavnici
00050000-552c-cfe0-ce34-0864ede4924a	3264	Sveti Štefan
00050000-552c-cfe0-30ca-97b0284b7fd4	2258	Sveti Tomaž
00050000-552c-cfe0-da44-4e287158674c	9204	Šalovci
00050000-552c-cfe0-3a77-8b42bbe928fc	5261	Šempas
00050000-552c-cfe0-22aa-bf7f12b8d60a	5290	Šempeter pri Gorici
00050000-552c-cfe0-6a13-1cb1fcf100dc	3311	Šempeter v Savinjski dolini
00050000-552c-cfe0-5766-cc1d2b6aaa7f	4208	Šenčur
00050000-552c-cfe0-2367-8a7737ebdc26	2212	Šentilj v Slovenskih goricah
00050000-552c-cfe0-4eef-a7c59e283a85	8297	Šentjanž
00050000-552c-cfe0-80aa-558368973f96	2373	Šentjanž pri Dravogradu
00050000-552c-cfe0-6eda-1e46ad809f3e	8310	Šentjernej
00050000-552c-cfe0-8dff-0ba9e6f50245	3230	Šentjur
00050000-552c-cfe0-abfd-2080fee7e68f	3271	Šentrupert
00050000-552c-cfe0-3a3f-30b0e0c25165	8232	Šentrupert
00050000-552c-cfe0-5b99-9e2a3cb51ee9	1296	Šentvid pri Stični
00050000-552c-cfe0-499a-397b99f4d6b1	8275	Škocjan
00050000-552c-cfe0-f4b5-531b13dffd05	6281	Škofije
00050000-552c-cfe0-714d-27d06a9a7c7e	4220	Škofja Loka
00050000-552c-cfe0-e1c9-87e4639609e6	3211	Škofja vas
00050000-552c-cfe0-e0f7-365d4a9d4ef8	1291	Škofljica
00050000-552c-cfe0-32e2-fad9a36a23b9	6274	Šmarje
00050000-552c-cfe0-4ddb-5ab21fee01cd	1293	Šmarje - Sap
00050000-552c-cfe0-e3b3-7a001eaec287	3240	Šmarje pri Jelšah
00050000-552c-cfe0-6429-c810654c0198	8220	Šmarješke Toplice
00050000-552c-cfe0-4388-7e6624f21eec	2315	Šmartno na Pohorju
00050000-552c-cfe0-0cd3-893662005526	3341	Šmartno ob Dreti
00050000-552c-cfe0-bf75-a86e3d7c5a38	3327	Šmartno ob Paki
00050000-552c-cfe0-bff9-fa3efd309ba7	1275	Šmartno pri Litiji
00050000-552c-cfe0-7a1e-139d313fe067	2383	Šmartno pri Slovenj Gradcu
00050000-552c-cfe0-e672-43799bf63a02	3201	Šmartno v Rožni dolini
00050000-552c-cfe0-f3b7-81ba881b4519	3325	Šoštanj
00050000-552c-cfe0-4679-377e4c4135da	6222	Štanjel
00050000-552c-cfe0-4f4c-22b2204f20f5	3220	Štore
00050000-552c-cfe0-1033-6408f03c0af4	3304	Tabor
00050000-552c-cfe0-4394-3ec3bc348708	3221	Teharje
00050000-552c-cfe0-3f48-575d7cd58b4e	9251	Tišina
00050000-552c-cfe0-b4ac-6a18d5c78900	5220	Tolmin
00050000-552c-cfe0-4594-d49c08ee2836	3326	Topolšica
00050000-552c-cfe0-72f5-d8dda87e9d2b	2371	Trbonje
00050000-552c-cfe0-4fa3-d9916b78074a	1420	Trbovlje
00050000-552c-cfe0-ccb0-0f6fb702196b	8231	Trebelno 
00050000-552c-cfe0-20b6-d741e14bc52f	8210	Trebnje
00050000-552c-cfe0-aa60-8a5a4ebcf280	5252	Trnovo pri Gorici
00050000-552c-cfe0-b1b6-3e89fa7d1597	2254	Trnovska vas
00050000-552c-cfe0-f2d0-491432ffbdb8	1222	Trojane
00050000-552c-cfe0-09a7-28e3c49e8dd9	1236	Trzin
00050000-552c-cfe0-5571-fa50e881fc17	4290	Tržič
00050000-552c-cfe0-ca69-19761fa468ea	8295	Tržišče
00050000-552c-cfe0-b839-fd83b47dd6d1	1311	Turjak
00050000-552c-cfe0-cf6e-1dd5ff7cdc7d	9224	Turnišče
00050000-552c-cfe0-835f-3e20a8a83eb0	8323	Uršna sela
00050000-552c-cfe0-7d84-177aecc66dd7	1252	Vače
00050000-552c-cfe0-aa04-82af11bb2ff1	3320	Velenje 
00050000-552c-cfe0-26d8-dffeef9cdd8f	3322	Velenje - poštni predali
00050000-552c-cfe0-c32e-153d97e8319b	8212	Velika Loka
00050000-552c-cfe0-cc6e-dc414178fafb	2274	Velika Nedelja
00050000-552c-cfe0-da88-0ac54b832ea7	9225	Velika Polana
00050000-552c-cfe0-3246-f2f8a0e94ab9	1315	Velike Lašče
00050000-552c-cfe0-b589-cdb0104fff42	8213	Veliki Gaber
00050000-552c-cfe0-f263-92c47d352a41	9241	Veržej
00050000-552c-cfe0-676a-dec1c385bc01	1312	Videm - Dobrepolje
00050000-552c-cfe0-86ca-2a90d9cbd339	2284	Videm pri Ptuju
00050000-552c-cfe0-a370-08b435910afe	8344	Vinica
00050000-552c-cfe0-a222-a1e91b726207	5271	Vipava
00050000-552c-cfe0-cb3c-ad7ffeff3a7c	4212	Visoko
00050000-552c-cfe0-05b6-80bf5827ad2a	1294	Višnja Gora
00050000-552c-cfe0-59bc-45719afacbf5	3205	Vitanje
00050000-552c-cfe0-926d-a16400d5b5e9	2255	Vitomarci
00050000-552c-cfe0-e05f-f13c537921d1	1217	Vodice
00050000-552c-cfe0-aa7b-5477cbffaece	3212	Vojnik\t
00050000-552c-cfe0-0425-e112d5c109f8	5293	Volčja Draga
00050000-552c-cfe0-e227-dbd148e9d5a2	2232	Voličina
00050000-552c-cfe0-f366-3bbd1f333523	3305	Vransko
00050000-552c-cfe0-a2be-99ab6300c15d	6217	Vremski Britof
00050000-552c-cfe0-8dac-565afa466a4a	1360	Vrhnika
00050000-552c-cfe0-3da5-c679dc5cc1aa	2365	Vuhred
00050000-552c-cfe0-7604-21c699c98b61	2367	Vuzenica
00050000-552c-cfe0-5e55-e6cfe8a814ee	8292	Zabukovje 
00050000-552c-cfe0-0b8c-57b4dd571e26	1410	Zagorje ob Savi
00050000-552c-cfe0-3561-6ec548d75dc1	1303	Zagradec
00050000-552c-cfe0-c3ae-fbe70559a234	2283	Zavrč
00050000-552c-cfe0-c30a-57742b6aa1e8	8272	Zdole 
00050000-552c-cfe0-e56d-b8731e1ecc1f	4201	Zgornja Besnica
00050000-552c-cfe0-850d-89c412d8f972	2242	Zgornja Korena
00050000-552c-cfe0-b10f-143c6fcf584c	2201	Zgornja Kungota
00050000-552c-cfe0-5743-2de18bad54a8	2316	Zgornja Ložnica
00050000-552c-cfe0-2cde-182f5d76d4e1	2314	Zgornja Polskava
00050000-552c-cfe0-5ca4-008d22c6ada7	2213	Zgornja Velka
00050000-552c-cfe0-41c3-5c61311955c7	4247	Zgornje Gorje
00050000-552c-cfe0-2926-704f1e72a05a	4206	Zgornje Jezersko
00050000-552c-cfe0-ad46-ac30ab6b048f	2285	Zgornji Leskovec
00050000-552c-cfe0-07fa-3a720e422291	1432	Zidani Most
00050000-552c-cfe0-3302-a884a7bfe543	3214	Zreče
00050000-552c-cfe0-6b2e-0f44df49ac86	4209	Žabnica
00050000-552c-cfe0-8826-606973401854	3310	Žalec
00050000-552c-cfe0-a738-6e79c7f03afd	4228	Železniki
00050000-552c-cfe0-eb68-59ee66e2faa2	2287	Žetale
00050000-552c-cfe0-a68b-a7652cfa9c93	4226	Žiri
00050000-552c-cfe0-524d-9a5301b41787	4274	Žirovnica
00050000-552c-cfe0-9e9f-9b05e9280024	8360	Žužemberk
\.


--
-- TOC entry 2618 (class 0 OID 249485)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2601 (class 0 OID 249308)
-- Dependencies: 183
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2606 (class 0 OID 249374)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2620 (class 0 OID 249497)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 249602)
-- Dependencies: 214
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2636 (class 0 OID 249646)
-- Dependencies: 218
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2624 (class 0 OID 249526)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2616 (class 0 OID 249470)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2615 (class 0 OID 249460)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 249636)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 249592)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2589 (class 0 OID 249176)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-552c-cfe1-6c49-0e1887ee0864	00010000-552c-cfe1-c8b1-4c39a223ad87	2015-04-14 10:29:21	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO4X.5PFKpcSu2IVzM4q6p2v5sw5bPuY6";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2650 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2625 (class 0 OID 249535)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2593 (class 0 OID 249213)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00000000-552c-cfe1-0033-766517057149	beri-vse	Polni dostop do vsega v aplikaciji.	t
00000000-552c-cfe1-0cdb-ece986cff6bf	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00000000-552c-cfe1-e429-15b66b7e4324	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00000000-552c-cfe1-55e8-d556e4e75b2e	ifi-all	Polni dostop do vsega v aplikaciji.	t
00000000-552c-cfe1-9d6c-2d65cc16287a	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00000000-552c-cfe1-6cf7-b88870292196	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2591 (class 0 OID 249197)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-552c-cfe1-6c49-0e1887ee0864	00000000-552c-cfe1-55e8-d556e4e75b2e
00010000-552c-cfe1-1530-2fee254c3385	00000000-552c-cfe1-e429-15b66b7e4324
\.


--
-- TOC entry 2627 (class 0 OID 249549)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2619 (class 0 OID 249491)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2613 (class 0 OID 249441)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2598 (class 0 OID 249273)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2614 (class 0 OID 249447)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 249627)
-- Dependencies: 216
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2604 (class 0 OID 249343)
-- Dependencies: 186
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2590 (class 0 OID 249185)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, username, password, enabled, expires, defaultroute, defaultrouteparams, email) FROM stdin;
00010000-552c-cfe1-c8b1-4c39a223ad87	Konzolni	console	$2y$05$NS4xMjkyMTcwMzExMjAxROhG.1Uv9q4wcZ0E3a927RoMgIE7/jrfW	t	\N	\N	\N	rootmail@max.si
00010000-552c-cfe1-1530-2fee254c3385	Anonimni	anonymous	$2y$05$NS4xMjkyMTcwMzExMjAxRONEA7M8hj7pbVrfrRfXoAmAP0QVznu0a	t	\N	\N	\N	noreply@max.si
00010000-552c-cfe1-6c49-0e1887ee0864	Administrator	admin	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@max.si
\.


--
-- TOC entry 2639 (class 0 OID 249677)
-- Dependencies: 221
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2608 (class 0 OID 249389)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2623 (class 0 OID 249518)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 249584)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2610 (class 0 OID 249417)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2638 (class 0 OID 249667)
-- Dependencies: 220
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 249574)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2236 (class 2606 OID 249238)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 249716)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 249709)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 249626)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 249407)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2305 (class 2606 OID 249440)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2272 (class 2606 OID 249369)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2359 (class 2606 OID 249570)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2283 (class 2606 OID 249387)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2302 (class 2606 OID 249434)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2243 (class 2606 OID 249270)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 249483)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 249510)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2265 (class 2606 OID 249341)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2240 (class 2606 OID 249247)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2256 (class 2606 OID 249305)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2234 (class 2606 OID 249227)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2227 (class 2606 OID 249212)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 249516)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 249548)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 249663)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2251 (class 2606 OID 249298)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2262 (class 2606 OID 249329)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2330 (class 2606 OID 249489)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 249320)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2281 (class 2606 OID 249378)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 249501)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 249608)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 249651)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 249533)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2324 (class 2606 OID 249474)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2318 (class 2606 OID 249465)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 249645)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 249599)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2218 (class 2606 OID 249184)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 249539)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2225 (class 2606 OID 249201)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2229 (class 2606 OID 249221)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 249557)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2332 (class 2606 OID 249496)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2307 (class 2606 OID 249446)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2248 (class 2606 OID 249277)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 249456)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 249635)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2270 (class 2606 OID 249354)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2221 (class 2606 OID 249195)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 249691)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2287 (class 2606 OID 249393)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 249524)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2367 (class 2606 OID 249590)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 249429)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 249676)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 249583)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2290 (class 1259 OID 249414)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2249 (class 1259 OID 249300)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2339 (class 1259 OID 249517)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2333 (class 1259 OID 249503)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2334 (class 1259 OID 249502)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2285 (class 1259 OID 249394)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2360 (class 1259 OID 249573)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2361 (class 1259 OID 249571)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2362 (class 1259 OID 249572)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2385 (class 1259 OID 249664)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2386 (class 1259 OID 249665)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 249666)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2392 (class 1259 OID 249694)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2393 (class 1259 OID 249693)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2394 (class 1259 OID 249692)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2267 (class 1259 OID 249356)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2268 (class 1259 OID 249355)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2253 (class 1259 OID 249307)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2254 (class 1259 OID 249306)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2348 (class 1259 OID 249540)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2303 (class 1259 OID 249435)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2231 (class 1259 OID 249228)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2232 (class 1259 OID 249229)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2353 (class 1259 OID 249560)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2354 (class 1259 OID 249559)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2355 (class 1259 OID 249558)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2277 (class 1259 OID 249379)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2278 (class 1259 OID 249381)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2279 (class 1259 OID 249380)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2313 (class 1259 OID 249469)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2314 (class 1259 OID 249467)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2315 (class 1259 OID 249466)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2316 (class 1259 OID 249468)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2222 (class 1259 OID 249202)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2223 (class 1259 OID 249203)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2342 (class 1259 OID 249525)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2328 (class 1259 OID 249490)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2368 (class 1259 OID 249600)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2369 (class 1259 OID 249601)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2257 (class 1259 OID 249321)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2258 (class 1259 OID 249322)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2372 (class 1259 OID 249609)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2373 (class 1259 OID 249610)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2403 (class 1259 OID 249719)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2404 (class 1259 OID 249718)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2405 (class 1259 OID 249721)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2406 (class 1259 OID 249717)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2407 (class 1259 OID 249720)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2365 (class 1259 OID 249591)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2319 (class 1259 OID 249478)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2320 (class 1259 OID 249477)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2321 (class 1259 OID 249475)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2322 (class 1259 OID 249476)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2241 (class 1259 OID 249271)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2399 (class 1259 OID 249711)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 249710)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2284 (class 1259 OID 249388)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2237 (class 1259 OID 249249)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2238 (class 1259 OID 249248)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2245 (class 1259 OID 249278)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2246 (class 1259 OID 249279)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2308 (class 1259 OID 249459)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2309 (class 1259 OID 249458)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2310 (class 1259 OID 249457)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2291 (class 1259 OID 249416)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2292 (class 1259 OID 249412)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2293 (class 1259 OID 249409)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2294 (class 1259 OID 249410)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2295 (class 1259 OID 249408)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2296 (class 1259 OID 249413)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2297 (class 1259 OID 249411)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2252 (class 1259 OID 249299)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2273 (class 1259 OID 249370)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2274 (class 1259 OID 249372)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2275 (class 1259 OID 249371)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2276 (class 1259 OID 249373)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2327 (class 1259 OID 249484)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2266 (class 1259 OID 249342)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2219 (class 1259 OID 249196)
-- Name: uniq_7fb775b7f85e0677; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7f85e0677 ON uporabniki USING btree (username);


--
-- TOC entry 2347 (class 1259 OID 249534)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2244 (class 1259 OID 249272)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2263 (class 1259 OID 249330)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2384 (class 1259 OID 249652)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2230 (class 1259 OID 249222)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2298 (class 1259 OID 249415)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2432 (class 2606 OID 249852)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2435 (class 2606 OID 249837)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2434 (class 2606 OID 249842)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2430 (class 2606 OID 249862)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2436 (class 2606 OID 249832)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2431 (class 2606 OID 249857)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2433 (class 2606 OID 249847)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2418 (class 2606 OID 249772)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2453 (class 2606 OID 249947)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2451 (class 2606 OID 249942)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2452 (class 2606 OID 249937)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2429 (class 2606 OID 249827)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2459 (class 2606 OID 249987)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2461 (class 2606 OID 249977)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 249982)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2449 (class 2606 OID 249927)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2470 (class 2606 OID 250022)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2469 (class 2606 OID 250027)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2468 (class 2606 OID 250032)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2471 (class 2606 OID 250047)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2472 (class 2606 OID 250042)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2473 (class 2606 OID 250037)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2423 (class 2606 OID 249802)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2424 (class 2606 OID 249797)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2419 (class 2606 OID 249782)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2420 (class 2606 OID 249777)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2455 (class 2606 OID 249957)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2437 (class 2606 OID 249867)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2411 (class 2606 OID 249732)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2410 (class 2606 OID 249737)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2456 (class 2606 OID 249972)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2457 (class 2606 OID 249967)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2458 (class 2606 OID 249962)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2427 (class 2606 OID 249807)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2425 (class 2606 OID 249817)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2426 (class 2606 OID 249812)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2441 (class 2606 OID 249902)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2443 (class 2606 OID 249892)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2444 (class 2606 OID 249887)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2442 (class 2606 OID 249897)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2409 (class 2606 OID 249722)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2408 (class 2606 OID 249727)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2454 (class 2606 OID 249952)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2450 (class 2606 OID 249932)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2464 (class 2606 OID 249997)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2463 (class 2606 OID 250002)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2422 (class 2606 OID 249787)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2421 (class 2606 OID 249792)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2466 (class 2606 OID 250007)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2465 (class 2606 OID 250012)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2478 (class 2606 OID 250072)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2479 (class 2606 OID 250067)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2476 (class 2606 OID 250082)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2480 (class 2606 OID 250062)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2477 (class 2606 OID 250077)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2462 (class 2606 OID 249992)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2445 (class 2606 OID 249922)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2446 (class 2606 OID 249917)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2448 (class 2606 OID 249907)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2447 (class 2606 OID 249912)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2415 (class 2606 OID 249752)
-- Name: fk_b7229ce169e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT fk_b7229ce169e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2414 (class 2606 OID 249757)
-- Name: fk_b7229ce1a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT fk_b7229ce1a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2474 (class 2606 OID 250057)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2475 (class 2606 OID 250052)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2428 (class 2606 OID 249822)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2467 (class 2606 OID 250017)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2412 (class 2606 OID 249747)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2413 (class 2606 OID 249742)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2417 (class 2606 OID 249762)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2416 (class 2606 OID 249767)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2438 (class 2606 OID 249882)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2439 (class 2606 OID 249877)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2440 (class 2606 OID 249872)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-14 10:29:26 CEST

--
-- PostgreSQL database dump complete
--

