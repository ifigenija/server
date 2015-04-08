--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.5
-- Dumped by pg_dump version 9.3.5
-- Started on 2015-04-07 23:42:51 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 177 (class 1259 OID 2144702)
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
-- TOC entry 210 (class 1259 OID 2145032)
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
-- TOC entry 211 (class 1259 OID 2145042)
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
-- TOC entry 212 (class 1259 OID 2145059)
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
-- TOC entry 188 (class 1259 OID 2144845)
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
-- TOC entry 189 (class 1259 OID 2144867)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 178 (class 1259 OID 2144711)
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
-- TOC entry 213 (class 1259 OID 2145075)
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
-- TOC entry 190 (class 1259 OID 2144872)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 191 (class 1259 OID 2144879)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 181 (class 1259 OID 2144751)
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
-- TOC entry 197 (class 1259 OID 2144931)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 198 (class 1259 OID 2144937)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 179 (class 1259 OID 2144728)
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
-- TOC entry 180 (class 1259 OID 2144740)
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
-- TOC entry 183 (class 1259 OID 2144795)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 170 (class 1259 OID 2144646)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 174 (class 1259 OID 2144676)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 199 (class 1259 OID 2144944)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 2144951)
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
-- TOC entry 214 (class 1259 OID 2145088)
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
-- TOC entry 182 (class 1259 OID 2144774)
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
-- TOC entry 184 (class 1259 OID 2144802)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 2144959)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 185 (class 1259 OID 2144809)
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
-- TOC entry 192 (class 1259 OID 2144885)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 2144965)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 2145102)
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
-- TOC entry 216 (class 1259 OID 2145111)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 2144972)
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
-- TOC entry 204 (class 1259 OID 2144981)
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
-- TOC entry 205 (class 1259 OID 2144990)
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
-- TOC entry 217 (class 1259 OID 2145118)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 2145128)
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
-- TOC entry 172 (class 1259 OID 2144657)
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
-- TOC entry 171 (class 1259 OID 2144655)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2873 (class 0 OID 0)
-- Dependencies: 171
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 206 (class 1259 OID 2145000)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 173 (class 1259 OID 2144666)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 2144695)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 2145006)
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
-- TOC entry 208 (class 1259 OID 2145018)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 193 (class 1259 OID 2144893)
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
-- TOC entry 186 (class 1259 OID 2144824)
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
-- TOC entry 196 (class 1259 OID 2144918)
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
-- TOC entry 219 (class 1259 OID 2145138)
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
-- TOC entry 187 (class 1259 OID 2144831)
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
-- TOC entry 175 (class 1259 OID 2144683)
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
-- TOC entry 220 (class 1259 OID 2145147)
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
-- TOC entry 194 (class 1259 OID 2144899)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 209 (class 1259 OID 2145024)
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
-- TOC entry 221 (class 1259 OID 2145165)
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
-- TOC entry 195 (class 1259 OID 2144905)
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
-- TOC entry 222 (class 1259 OID 2145173)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 223 (class 1259 OID 2145183)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2320 (class 2604 OID 2144660)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2820 (class 0 OID 2144702)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 2145032)
-- Dependencies: 210
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2854 (class 0 OID 2145042)
-- Dependencies: 211
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 2145059)
-- Dependencies: 212
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 2144845)
-- Dependencies: 188
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2832 (class 0 OID 2144867)
-- Dependencies: 189
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 2144711)
-- Dependencies: 178
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00000000-5524-4f4b-9086-5cd81f1a736d	AF	AFG	004	Afghanistan 	Afganistan	\N
00000000-5524-4f4b-d7ae-eaecae408e44	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00000000-5524-4f4b-46b0-e57ead4ef73a	AL	ALB	008	Albania 	Albanija	\N
00000000-5524-4f4b-fcfd-6ded2a257dfe	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00000000-5524-4f4b-5cbe-02857da1a760	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00000000-5524-4f4b-16c9-d021b970f664	AD	AND	020	Andorra 	Andora	\N
00000000-5524-4f4b-759d-7845a4ec78a9	AO	AGO	024	Angola 	Angola	\N
00000000-5524-4f4b-726a-f79ef939234c	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00000000-5524-4f4b-23f6-fc32628f9510	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00000000-5524-4f4b-c252-bd838330a81a	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00000000-5524-4f4b-5a73-3b9bbe0d2700	AR	ARG	032	Argentina 	Argenitna	\N
00000000-5524-4f4b-8fec-ef0644a5047b	AM	ARM	051	Armenia 	Armenija	\N
00000000-5524-4f4b-3ae1-42b553334b8a	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00000000-5524-4f4b-4fde-d1cbf1f9ebfd	AU	AUS	036	Australia 	Avstralija	\N
00000000-5524-4f4b-00b9-f89f29fffd92	AT	AUT	040	Austria 	Avstrija	\N
00000000-5524-4f4b-0918-48cf816dc510	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00000000-5524-4f4b-f3d5-9a15640af409	BS	BHS	044	Bahamas 	Bahami	\N
00000000-5524-4f4b-cecf-01d57e198da3	BH	BHR	048	Bahrain 	Bahrajn	\N
00000000-5524-4f4b-fb81-3a0c7311cc77	BD	BGD	050	Bangladesh 	Bangladeš	\N
00000000-5524-4f4b-66da-37f290d69043	BB	BRB	052	Barbados 	Barbados	\N
00000000-5524-4f4b-e99b-410a06d2aec1	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00000000-5524-4f4b-db60-7cb39c93d03e	BE	BEL	056	Belgium 	Belgija	\N
00000000-5524-4f4b-bc33-6e0e6aabf5e4	BZ	BLZ	084	Belize 	Belize	\N
00000000-5524-4f4b-2aa5-a2fdfe84f95f	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00000000-5524-4f4b-1b37-e5c4d898910a	BM	BMU	060	Bermuda 	Bermudi	\N
00000000-5524-4f4b-f502-672671f385b9	BT	BTN	064	Bhutan 	Butan	\N
00000000-5524-4f4b-52a7-fbdea00dfe93	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00000000-5524-4f4b-18c1-3ff1f9c91ae4	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00000000-5524-4f4b-302a-861cee9b4997	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00000000-5524-4f4b-f9b8-dbd6a2577222	BW	BWA	072	Botswana 	Bocvana	\N
00000000-5524-4f4b-68db-a620cea3de05	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00000000-5524-4f4b-3733-6a3eae741bdc	BR	BRA	076	Brazil 	Brazilija	\N
00000000-5524-4f4b-15a4-f6d697bdf8d0	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00000000-5524-4f4b-b145-60561ecf5e91	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00000000-5524-4f4b-d2fd-5781ed7851cf	BG	BGR	100	Bulgaria 	Bolgarija	\N
00000000-5524-4f4b-e775-02ee0b7d6c9c	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00000000-5524-4f4b-56c3-221ed9ba43b8	BI	BDI	108	Burundi 	Burundi 	\N
00000000-5524-4f4b-ee4d-6f22fc12c15e	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00000000-5524-4f4b-06aa-9ce1112c8fa7	CM	CMR	120	Cameroon 	Kamerun	\N
00000000-5524-4f4b-62c1-4812190c4e2a	CA	CAN	124	Canada 	Kanada	\N
00000000-5524-4f4b-3322-b0c493b5f439	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00000000-5524-4f4b-ee41-9e45134ea026	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00000000-5524-4f4b-f9d1-ec8dbe112a92	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00000000-5524-4f4b-b2c6-1e9604f10e1e	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00000000-5524-4f4b-3d97-5c84fceaf40a	CL	CHL	152	Chile 	Čile	\N
00000000-5524-4f4b-0d61-4d5f6c1edc32	CN	CHN	156	China 	Kitajska	\N
00000000-5524-4f4b-58ae-e82f236c1ab0	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00000000-5524-4f4b-523c-4ee493d0fefc	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00000000-5524-4f4b-8ba2-8c83c75d32fe	CO	COL	170	Colombia 	Kolumbija	\N
00000000-5524-4f4b-7532-c1af9bd05e76	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00000000-5524-4f4b-f465-bda5604a1276	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00000000-5524-4f4b-003d-78495238338d	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00000000-5524-4f4b-f9b4-a3523a250360	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00000000-5524-4f4b-8318-26d360987501	CR	CRI	188	Costa Rica 	Kostarika	\N
00000000-5524-4f4b-49d2-be19ea52d65e	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00000000-5524-4f4b-13d9-7ac152e2ae91	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00000000-5524-4f4b-ae6a-030f9b6934f4	CU	CUB	192	Cuba 	Kuba	\N
00000000-5524-4f4b-3b2d-7c04bbd14e1d	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00000000-5524-4f4b-481b-eed54957ceac	CY	CYP	196	Cyprus 	Ciper	\N
00000000-5524-4f4b-73b7-8ddcd05a124d	CZ	CZE	203	Czech Republic 	Češka	\N
00000000-5524-4f4b-9e3c-4d7bed30c042	DK	DNK	208	Denmark 	Danska	\N
00000000-5524-4f4b-9707-535988c56ac3	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00000000-5524-4f4b-abb5-7410e4168138	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00000000-5524-4f4b-14dd-95f5326bc6f1	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00000000-5524-4f4b-392a-ac67db947cff	EC	ECU	218	Ecuador 	Ekvador	\N
00000000-5524-4f4b-ddfb-5a4a9a7f91d6	EG	EGY	818	Egypt 	Egipt	\N
00000000-5524-4f4b-9921-432fe4a67e31	SV	SLV	222	El Salvador 	Salvador	\N
00000000-5524-4f4b-a20d-99af30f2e9db	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00000000-5524-4f4b-5a69-30628581fbaf	ER	ERI	232	Eritrea 	Eritreja	\N
00000000-5524-4f4b-8d09-1492fb49b608	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00000000-5524-4f4b-9361-5359f42d5988	ET	ETH	231	Ethiopia 	Etiopija	\N
00000000-5524-4f4b-4aff-014f2d24fefc	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00000000-5524-4f4b-e2d4-7c8b6d50402e	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00000000-5524-4f4b-6817-b96cbd767e5b	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00000000-5524-4f4b-d3f8-2bdcea2d862b	FI	FIN	246	Finland 	Finska	\N
00000000-5524-4f4b-a722-be4188efd078	FR	FRA	250	France 	Francija	\N
00000000-5524-4f4b-f480-7a26f3519d01	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00000000-5524-4f4b-9828-53b38f7d5a23	NL	NLD	528	Netherlands 	Nizozemska	\N
00000000-5524-4f4b-6211-87ec1f66d56a	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00000000-5524-4f4b-d8a4-47d4e1a89c26	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00000000-5524-4f4b-5062-bf44316c991f	GA	GAB	266	Gabon 	Gabon	\N
00000000-5524-4f4b-ec62-829ce5a9642e	GM	GMB	270	Gambia 	Gambija	\N
00000000-5524-4f4b-cbf6-082abb0a2a8d	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00000000-5524-4f4b-ba87-55990851c79f	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00000000-5524-4f4b-354b-db19375bf669	GH	GHA	288	Ghana 	Gana	\N
00000000-5524-4f4b-a953-7f4168a937fb	GI	GIB	292	Gibraltar 	Gibraltar	\N
00000000-5524-4f4b-fab0-694d15699bc3	GR	GRC	300	Greece 	Grčija	\N
00000000-5524-4f4b-3254-86c780aa923c	GL	GRL	304	Greenland 	Grenlandija	\N
00000000-5524-4f4b-08e8-cf8b4acd8abb	GD	GRD	308	Grenada 	Grenada	\N
00000000-5524-4f4b-cf07-30dda0370d5f	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00000000-5524-4f4b-5e3e-cb8a1e52e107	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00000000-5524-4f4b-fb22-c897be32a8db	GT	GTM	320	Guatemala 	Gvatemala	\N
00000000-5524-4f4b-8f6a-34abb37f1d36	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00000000-5524-4f4b-d33e-f93f3d2cec38	GN	GIN	324	Guinea 	Gvineja	\N
00000000-5524-4f4b-7bc5-553b397a9aec	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00000000-5524-4f4b-1401-5258505b6e8d	GY	GUY	328	Guyana 	Gvajana	\N
00000000-5524-4f4b-3eb0-f0fd9752e151	HT	HTI	332	Haiti 	Haiti	\N
00000000-5524-4f4b-5212-f984f51f8bc0	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00000000-5524-4f4b-f4b3-14cecb70e459	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00000000-5524-4f4b-e14c-dc2f1bbb43bf	HN	HND	340	Honduras 	Honduras	\N
00000000-5524-4f4b-8b07-5f5e102dec81	HK	HKG	344	Hong Kong 	Hong Kong	\N
00000000-5524-4f4b-9f59-7ff2a06e580d	HU	HUN	348	Hungary 	Madžarska	\N
00000000-5524-4f4b-f44a-4f4084bd9f10	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00000000-5524-4f4b-1b7b-4d273fda6c36	IN	IND	356	India 	Indija	\N
00000000-5524-4f4b-3381-e49fa3ee37f5	ID	IDN	360	Indonesia 	Indonezija	\N
00000000-5524-4f4b-5882-893a58f76f62	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00000000-5524-4f4b-c350-c75d74f78ee1	IQ	IRQ	368	Iraq 	Irak	\N
00000000-5524-4f4b-6a80-96dc96374c3e	IE	IRL	372	Ireland 	Irska	\N
00000000-5524-4f4b-65c9-1a4574c2ada8	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00000000-5524-4f4b-8222-491ba26d9218	IL	ISR	376	Israel 	Izrael	\N
00000000-5524-4f4b-c773-d386d3d12f09	IT	ITA	380	Italy 	Italija	\N
00000000-5524-4f4b-3050-105e141072d8	JM	JAM	388	Jamaica 	Jamajka	\N
00000000-5524-4f4b-245f-e7e703703ec7	JP	JPN	392	Japan 	Japonska	\N
00000000-5524-4f4b-434e-de718b6db804	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00000000-5524-4f4b-ce2f-fcccde53ef7f	JO	JOR	400	Jordan 	Jordanija	\N
00000000-5524-4f4b-b8eb-00fa17e70686	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00000000-5524-4f4b-01a3-4590d45542ee	KE	KEN	404	Kenya 	Kenija	\N
00000000-5524-4f4b-6446-ffa6ab4f48fe	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00000000-5524-4f4b-1c8f-fff2268d281d	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00000000-5524-4f4b-9add-c4fde76d3aff	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00000000-5524-4f4b-c869-68dac10879c8	KW	KWT	414	Kuwait 	Kuvajt	\N
00000000-5524-4f4b-75d8-ff9dde74543f	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00000000-5524-4f4b-be30-bf7685bba803	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00000000-5524-4f4b-2f80-f75213f8f08a	LV	LVA	428	Latvia 	Latvija	\N
00000000-5524-4f4b-4c34-3d660ad19b42	LB	LBN	422	Lebanon 	Libanon	\N
00000000-5524-4f4b-e99e-d3943339ab8d	LS	LSO	426	Lesotho 	Lesoto	\N
00000000-5524-4f4b-ad68-a4d083220874	LR	LBR	430	Liberia 	Liberija	\N
00000000-5524-4f4b-6a97-39fa2b1cf21c	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00000000-5524-4f4b-2454-654f8715fb46	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00000000-5524-4f4b-b71a-3715c3a58cbc	LT	LTU	440	Lithuania 	Litva	\N
00000000-5524-4f4b-951b-f8de16289600	LU	LUX	442	Luxembourg 	Luksemburg	\N
00000000-5524-4f4b-87e2-34a94ced6f6b	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00000000-5524-4f4b-5578-bbd317be7a97	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00000000-5524-4f4b-3ada-c78e2d4be4c5	MG	MDG	450	Madagascar 	Madagaskar	\N
00000000-5524-4f4b-6e0f-d706d19a3698	MW	MWI	454	Malawi 	Malavi	\N
00000000-5524-4f4b-1011-253556c22bad	MY	MYS	458	Malaysia 	Malezija	\N
00000000-5524-4f4b-9ae2-8a48349ac103	MV	MDV	462	Maldives 	Maldivi	\N
00000000-5524-4f4b-b4f5-6e90ec454887	ML	MLI	466	Mali 	Mali	\N
00000000-5524-4f4b-5cd8-a4818020e60d	MT	MLT	470	Malta 	Malta	\N
00000000-5524-4f4b-8ea1-354032e13515	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00000000-5524-4f4b-82c2-48b73da580cc	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00000000-5524-4f4b-fa87-89a6bd11233b	MR	MRT	478	Mauritania 	Mavretanija	\N
00000000-5524-4f4b-100f-7abb1f8fb312	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00000000-5524-4f4b-1015-d568752181c1	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00000000-5524-4f4b-b62f-5c357cc8a16a	MX	MEX	484	Mexico 	Mehika	\N
00000000-5524-4f4b-01bb-ba6bffe01f13	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00000000-5524-4f4b-12e9-6d62b11a94ce	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00000000-5524-4f4b-d38b-e7426d34e142	MC	MCO	492	Monaco 	Monako	\N
00000000-5524-4f4b-37c7-1cb0727fe1ae	MN	MNG	496	Mongolia 	Mongolija	\N
00000000-5524-4f4b-9a04-1f8953d7b7f5	ME	MNE	499	Montenegro 	Črna Gora	\N
00000000-5524-4f4b-cce0-f39a8e2aa46d	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00000000-5524-4f4b-b066-2a0c88a0630f	MA	MAR	504	Morocco 	Maroko	\N
00000000-5524-4f4b-45db-b0a28914e9ed	MZ	MOZ	508	Mozambique 	Mozambik	\N
00000000-5524-4f4b-9ab3-039ef884f4f4	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00000000-5524-4f4b-861b-5597a97848a1	NA	NAM	516	Namibia 	Namibija	\N
00000000-5524-4f4b-db9e-596f40ea32e3	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00000000-5524-4f4b-5166-d97e0075d15b	NP	NPL	524	Nepal 	Nepal	\N
00000000-5524-4f4b-3d38-bc1593e101bf	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00000000-5524-4f4b-fff7-7a1d2d8acb6f	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00000000-5524-4f4b-8ca4-e73ca0c0b1e9	NI	NIC	558	Nicaragua 	Nikaragva	\N
00000000-5524-4f4b-d5d7-bd618da9c1e5	NE	NER	562	Niger 	Niger 	\N
00000000-5524-4f4b-7528-7da87de54299	NG	NGA	566	Nigeria 	Nigerija	\N
00000000-5524-4f4b-6b5e-cb4babc208a7	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00000000-5524-4f4b-438b-dd36a20e6b13	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00000000-5524-4f4b-7219-45cb25c5adcb	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00000000-5524-4f4b-9f88-f93a09ef7269	NO	NOR	578	Norway 	Norveška	\N
00000000-5524-4f4b-6314-cb6e4879e602	OM	OMN	512	Oman 	Oman	\N
00000000-5524-4f4b-6398-5d4969c6fa16	PK	PAK	586	Pakistan 	Pakistan	\N
00000000-5524-4f4b-0efa-4c3bbad3d8e5	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00000000-5524-4f4b-7dbf-62039367fd2b	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00000000-5524-4f4b-8bd4-40cb995c0617	PA	PAN	591	Panama 	Panama	\N
00000000-5524-4f4b-aa76-75ca7b1494cb	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00000000-5524-4f4b-2e9c-96db6cd3c040	PY	PRY	600	Paraguay 	Paragvaj	\N
00000000-5524-4f4b-851a-1c891a1bf127	PE	PER	604	Peru 	Peru	\N
00000000-5524-4f4b-8887-e7b097ca532c	PH	PHL	608	Philippines 	Filipini	\N
00000000-5524-4f4b-0cc7-2a1e5f99d2e6	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00000000-5524-4f4b-b964-4c29db5ecb84	PL	POL	616	Poland 	Poljska	\N
00000000-5524-4f4b-6524-281437b6aadb	PT	PRT	620	Portugal 	Portugalska	\N
00000000-5524-4f4b-7d1d-09b23b18a96c	PR	PRI	630	Puerto Rico 	Portoriko	\N
00000000-5524-4f4b-fc17-3290ecd3165f	QA	QAT	634	Qatar 	Katar	\N
00000000-5524-4f4b-a31c-023006b36dce	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00000000-5524-4f4b-4772-100fb7c3e5a3	RO	ROU	642	Romania 	Romunija	\N
00000000-5524-4f4b-a780-cfa9cd0cbff5	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00000000-5524-4f4b-e4df-21b35e10957e	RW	RWA	646	Rwanda 	Ruanda	\N
00000000-5524-4f4b-3741-7b638e05e091	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00000000-5524-4f4b-1e39-ff1dd20cdc11	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00000000-5524-4f4b-0c75-870124439214	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00000000-5524-4f4b-406d-d4bf7a5ffa09	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00000000-5524-4f4b-285c-9d594d6ac3e1	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00000000-5524-4f4b-76f8-e96803f25748	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00000000-5524-4f4b-14aa-a3caf6070b56	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00000000-5524-4f4b-c90a-4eac8b24bc8b	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00000000-5524-4f4b-578d-c2266b333294	SM	SMR	674	San Marino 	San Marino	\N
00000000-5524-4f4b-b77f-4755f6f79dc1	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00000000-5524-4f4b-7c64-0812925ec04d	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00000000-5524-4f4b-2f22-7a6e6e2b39af	SN	SEN	686	Senegal 	Senegal	\N
00000000-5524-4f4b-5abe-87f855b9d3ee	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00000000-5524-4f4b-20d4-8ec795afdc62	SC	SYC	690	Seychelles 	Sejšeli	\N
00000000-5524-4f4b-2269-379e992a8398	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00000000-5524-4f4b-4dc7-711c3465be5c	SG	SGP	702	Singapore 	Singapur	\N
00000000-5524-4f4b-68bd-f6e5395c70b8	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00000000-5524-4f4b-e149-c7e9d5310266	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00000000-5524-4f4b-16ac-9cf05211047e	SI	SVN	705	Slovenia 	Slovenija	\N
00000000-5524-4f4b-ea87-bd828b4c9ce8	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00000000-5524-4f4b-dc73-459d571ad8d8	SO	SOM	706	Somalia 	Somalija	\N
00000000-5524-4f4b-4804-502f53db3cc8	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00000000-5524-4f4b-7682-c5d995d1df73	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00000000-5524-4f4b-46f9-718b8b7c350e	SS	SSD	728	South Sudan 	Južni Sudan	\N
00000000-5524-4f4b-9450-96e9c1d0a971	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00000000-5524-4f4b-6560-26fa55944d5a	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00000000-5524-4f4b-8d58-e091b8f63f2f	SD	SDN	729	Sudan 	Sudan	\N
00000000-5524-4f4b-12c0-4c8f82a3ac02	SR	SUR	740	Suriname 	Surinam	\N
00000000-5524-4f4b-179e-aa913c18aaf4	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00000000-5524-4f4b-586a-d073672d1c85	SZ	SWZ	748	Swaziland 	Svazi	\N
00000000-5524-4f4b-b855-0a912f4a0d0b	SE	SWE	752	Sweden 	Švedska	\N
00000000-5524-4f4b-e920-44f41f84ce72	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00000000-5524-4f4b-bfc4-b22670dcf0cc	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00000000-5524-4f4b-1f50-cc7e1b440336	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00000000-5524-4f4b-4ba5-3fb14fbad8f7	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00000000-5524-4f4b-1344-4cbbbe6a877c	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00000000-5524-4f4b-db9e-f142c107b447	TH	THA	764	Thailand 	Tajska	\N
00000000-5524-4f4b-9620-a16438e3e4f0	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00000000-5524-4f4b-18c0-f10ca37962d4	TG	TGO	768	Togo 	Togo	\N
00000000-5524-4f4b-3d1d-005a4bb86bc2	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00000000-5524-4f4b-139e-4aaa8c912d8d	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00000000-5524-4f4b-fa04-33ead737a67f	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00000000-5524-4f4b-9022-41395d11158c	TN	TUN	788	Tunisia 	Tunizija	\N
00000000-5524-4f4b-4951-8d3019d4bae9	TR	TUR	792	Turkey 	Turčija	\N
00000000-5524-4f4b-2bdf-3c99c15f46f5	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00000000-5524-4f4b-cb5b-3c8eb431794f	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00000000-5524-4f4b-f303-09e04a1c797d	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00000000-5524-4f4b-d1d5-995516589de2	UG	UGA	800	Uganda 	Uganda	\N
00000000-5524-4f4b-e78d-0cbb57723463	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00000000-5524-4f4b-9b79-23825a34b217	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00000000-5524-4f4b-c298-a020bb1a73d2	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00000000-5524-4f4b-1a6d-27a4d025bd0b	US	USA	840	United States 	Združene države Amerike	\N
00000000-5524-4f4b-b317-72efe40bb984	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00000000-5524-4f4b-d2d3-6ee64711af03	UY	URY	858	Uruguay 	Urugvaj	\N
00000000-5524-4f4b-4b6c-5631e6c0a271	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00000000-5524-4f4b-347b-df02a219bdea	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00000000-5524-4f4c-90dd-063d9c873090	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00000000-5524-4f4c-0192-ae0449f36924	VN	VNM	704	Viet Nam 	Vietnam	\N
00000000-5524-4f4c-1ff6-4e9aa8835809	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00000000-5524-4f4c-855a-7dec90b524d0	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00000000-5524-4f4c-643f-6a5cc0a29e39	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00000000-5524-4f4c-0595-603537f2cfde	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00000000-5524-4f4c-ba59-5a058ddb8170	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00000000-5524-4f4c-244f-b32351d9d750	ZM	ZMB	894	Zambia 	Zambija	\N
00000000-5524-4f4c-a8fe-b1203ce782be	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2856 (class 0 OID 2145075)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2833 (class 0 OID 2144872)
-- Dependencies: 190
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 2144879)
-- Dependencies: 191
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2824 (class 0 OID 2144751)
-- Dependencies: 181
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2840 (class 0 OID 2144931)
-- Dependencies: 197
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 2144937)
-- Dependencies: 198
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 2144728)
-- Dependencies: 179
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5524-4f4c-c0d3-cb00181206b9	kravaXXX	color	N;	t	f	f	\N	\N
00000000-5524-4f4c-2b3c-dfe47d0b0764	privzetInspicient	entity	N;	f	f	f	\N	\N
00000000-5524-4f4c-509a-fe6c0190fbd0	dogodek-status	map	O:18:"Zend\\Config\\Config":4:{s:21:"	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2823 (class 0 OID 2144740)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
\.


--
-- TOC entry 2826 (class 0 OID 2144795)
-- Dependencies: 183
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2813 (class 0 OID 2144646)
-- Dependencies: 170
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00020000-5524-4f4c-c31d-694e81bff571	User-delete	Aaa - Uporabnik - Briši	f
00020000-5524-4f4c-4c68-6b753a8b1b8a	User-read	Aaa - Uporabnik - Beri	f
00020000-5524-4f4c-d239-7944549b436e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5524-4f4c-95cc-70a8382ea08e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5524-4f4c-d142-3322980f3949	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5524-4f4c-c7f0-15943bb61caa	Role-delete	Aaa - Vloga - Briši	f
00020000-5524-4f4c-a917-cf26fb37ad81	Role-read	Aaa - Vloga - Beri	f
00020000-5524-4f4c-121e-84ac5b5f345f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5524-4f4c-2250-cad4ade8bde8	Role-create	Aaa - Vloga - Ustvari	f
00020000-5524-4f4c-05ee-89a2eea54918	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5524-4f4c-e60c-910900471aca	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5524-4f4c-e507-91a684623118	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5524-4f4c-d83b-aedc792f942c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5524-4f4c-586d-b89077643352	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5524-4f4c-9caa-c2b0a6f48903	User-delete	Aaa - Uporabnik - Briši	f
00020000-5524-4f4c-8dd5-9a1a96a89591	User-read	Aaa - Uporabnik - Beri	f
00020000-5524-4f4c-90d0-80dc2f59a969	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5524-4f4c-f008-07ac89bdf654	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5524-4f4c-784d-b833c39b5c08	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5524-4f4c-983c-846c420c5640	Role-delete	Aaa - Vloga - Briši	f
00020000-5524-4f4c-6dfd-262e6cce1983	Role-read	Aaa - Vloga - Beri	f
00020000-5524-4f4c-df61-c3646959e6b4	Role-update	Aaa - Vloga - Posodobi	f
00020000-5524-4f4c-c3c9-fee445139aeb	Role-create	Aaa - Vloga - Ustvari	f
00020000-5524-4f4c-8b62-0d4776a2aa4e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5524-4f4c-6991-cf05261ac6b3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5524-4f4c-f788-ab8facbc77e1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5524-4f4c-29b1-67b557d2b766	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5524-4f4c-1e5b-74a0cbd5f8cf	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5524-4f4c-d914-427945f39f47	User-delete	Aaa - Uporabnik - Briši	f
00020000-5524-4f4c-5afc-d1e2b6b06ef9	User-read	Aaa - Uporabnik - Beri	f
00020000-5524-4f4c-a7dd-84a2871eea62	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5524-4f4c-7bc1-9f03c49671aa	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5524-4f4c-2721-f34b5f8a0db5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5524-4f4c-cf72-5ffc1f265b1e	Role-delete	Aaa - Vloga - Briši	f
00020000-5524-4f4c-15ee-56608eecb3f5	Role-read	Aaa - Vloga - Beri	f
00020000-5524-4f4c-526e-92438650d43e	Role-update	Aaa - Vloga - Posodobi	f
00020000-5524-4f4c-b7dd-6005f938e24c	Role-create	Aaa - Vloga - Ustvari	f
00020000-5524-4f4c-2280-863c7404da95	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5524-4f4c-326c-20de37732b9f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5524-4f4c-b9ea-6626bddae86a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5524-4f4c-d40e-0c2d36f3ea98	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5524-4f4c-6477-e09a1f38a6be	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5524-4f4c-6675-baf0c0581017	User-delete	Aaa - Uporabnik - Briši	f
00020000-5524-4f4c-8d2b-d032fee3e1f6	User-read	Aaa - Uporabnik - Beri	f
00020000-5524-4f4c-bffe-b1d455bdf819	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5524-4f4c-3153-d8258441b178	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5524-4f4c-9995-f5d593014ebf	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5524-4f4c-c197-543f320fba2c	Role-delete	Aaa - Vloga - Briši	f
00020000-5524-4f4c-dec8-ead9b0873f41	Role-read	Aaa - Vloga - Beri	f
00020000-5524-4f4c-a226-d4606019e6cf	Role-update	Aaa - Vloga - Posodobi	f
00020000-5524-4f4c-f18b-6faaf0b53aa1	Role-create	Aaa - Vloga - Ustvari	f
00020000-5524-4f4c-7474-bc8cf8464441	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5524-4f4c-06ef-172dcb9793a4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5524-4f4c-27c4-f6ee9073f8da	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5524-4f4c-11d1-0eee06b7d58d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5524-4f4c-0a1a-cdfccd940ee7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5524-4f4c-779f-b6befb917df7	Drzava-list	Seznam držav	f
00020000-5524-4f4c-5322-bb832163fe3e	Popa-delete	Poslovni partner - Briši	f
00020000-5524-4f4c-ec10-3a6dfde7477e	Popa-list	Poslovni partner - Beri	f
00020000-5524-4f4c-cb69-00d2c3462804	Popa-update	Poslovni partner - Posodobi	f
00020000-5524-4f4c-6ae8-2dfd2f0e2005	Popa-create	Poslovni partner - Ustvari	f
00020000-5524-4f4c-f13d-18d9d64a0fe1	Posta-delete	Pošta - Briši	f
00020000-5524-4f4c-e335-c0eb1c6f6755	Posta-list	Pošta - Beri	f
00020000-5524-4f4c-e28d-7ba5feb95c5c	Posta-update	Pošta - Posodobi	f
00020000-5524-4f4c-b0ad-8816a94ecbad	Posta-create	Pošta - Ustvari	f
00020000-5524-4f4c-5e74-c28b66dcfdfa	PostniNaslov-delete	Poštni naslov - Briši	f
00020000-5524-4f4c-e286-679d88de6f21	PostniNaslov-list	Poštni naslov - Beri	f
00020000-5524-4f4c-ae55-65a61c6015ce	PostniNaslov-update	Poštni naslov - Posodobi	f
00020000-5524-4f4c-6e9b-616c1aa03a0a	PostniNaslov-create	Poštni naslov - Ustvari	f
\.


--
-- TOC entry 2817 (class 0 OID 2144676)
-- Dependencies: 174
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00000000-5524-4f4c-4473-00e56d88bb4d	00020000-5524-4f4c-779f-b6befb917df7
00000000-5524-4f4c-4473-00e56d88bb4d	00020000-5524-4f4c-586d-b89077643352
\.


--
-- TOC entry 2842 (class 0 OID 2144944)
-- Dependencies: 199
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2843 (class 0 OID 2144951)
-- Dependencies: 200
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2857 (class 0 OID 2145088)
-- Dependencies: 214
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 2144774)
-- Dependencies: 182
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2827 (class 0 OID 2144802)
-- Dependencies: 184
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
\.


--
-- TOC entry 2844 (class 0 OID 2144959)
-- Dependencies: 201
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 2144809)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2835 (class 0 OID 2144885)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2845 (class 0 OID 2144965)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2858 (class 0 OID 2145102)
-- Dependencies: 215
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2859 (class 0 OID 2145111)
-- Dependencies: 216
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 2144972)
-- Dependencies: 203
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 2144981)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 2144990)
-- Dependencies: 205
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 2145118)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 2145128)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2815 (class 0 OID 2144657)
-- Dependencies: 172
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5524-4f4c-33d8-55dfdc08ee61	00010000-5524-4f4c-3326-9559c037c70f	2015-04-07 21:42:41	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRObM5v/V56f.ymQmRlRjaCIlFLm2Q2NAO";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROghAvzuCF8jOl8T62YPLDhN8Taqo03di";}}
\.


--
-- TOC entry 2874 (class 0 OID 0)
-- Dependencies: 171
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2849 (class 0 OID 2145000)
-- Dependencies: 206
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2816 (class 0 OID 2144666)
-- Dependencies: 173
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00000000-5524-4f4c-006b-4bc6d6fe4b01	beri-vse	Polni dostop do vsega v aplikaciji.	t
00000000-5524-4f4c-88b9-5498a384ae34	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00000000-5524-4f4c-4473-00e56d88bb4d	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00000000-5524-4f4c-006b-77fd66c16256	ifi-vse	Polni dostop do vsega v aplikaciji.	t
00000000-5524-4f4c-1270-81054d2d6d80	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2819 (class 0 OID 2144695)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5524-4f4c-33d8-55dfdc08ee61	00000000-5524-4f4c-006b-77fd66c16256
00010000-5524-4f4c-33d8-55dfdc08ee61	00000000-5524-4f4c-1270-81054d2d6d80
00010000-5524-4f4c-fc79-d87f8431ab8a	00000000-5524-4f4c-4473-00e56d88bb4d
\.


--
-- TOC entry 2850 (class 0 OID 2145006)
-- Dependencies: 207
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 2145018)
-- Dependencies: 208
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 2144893)
-- Dependencies: 193
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2829 (class 0 OID 2144824)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2839 (class 0 OID 2144918)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 2145138)
-- Dependencies: 219
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 2144831)
-- Dependencies: 187
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2818 (class 0 OID 2144683)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, username, password, enabled, expires, defaultroute, defaultrouteparams, email) FROM stdin;
00010000-5524-4f4c-3326-9559c037c70f	Konzolni	console	$2y$05$NS4xMjkyMTcwMzExMjAxRO/sIpKRP8E663ljqWb7tc2S/L2IwPnQa	t	\N	\N	\N	rootmail@max.si
00010000-5524-4f4c-fc79-d87f8431ab8a	Anonimni	anonymous	$2y$05$NS4xMjkyMTcwMzExMjAxROaCV4ueAInqj6vqO9H/nDCJRjdTyIX/W	t	\N	\N	\N	noreply@max.si
00010000-5524-4f4c-33d8-55dfdc08ee61	Administrator	admin	$2y$05$NS4xMjkyMTcwMzExMjAxROghAvzuCF8jOl8T62YPLDhN8Taqo03di	t	\N	\N	\N	admin@max.si
\.


--
-- TOC entry 2863 (class 0 OID 2145147)
-- Dependencies: 220
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2837 (class 0 OID 2144899)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 2145024)
-- Dependencies: 209
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2864 (class 0 OID 2145165)
-- Dependencies: 221
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 2144905)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 2145173)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 2145183)
-- Dependencies: 223
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2462 (class 2606 OID 2144710)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 2145036)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 2145056)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 2145074)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 2144857)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 2144871)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 2144723)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 2145084)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 2144877)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 2144883)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 2144771)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 2144935)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 2144943)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 2144738)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 2144748)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 2144799)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2453 (class 2606 OID 2144680)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2444 (class 2606 OID 2144654)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 2144949)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 2144958)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 2145098)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 2144792)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 2144808)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 2144963)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 2144821)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 2144889)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 2144969)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 2145108)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 2145116)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 2144979)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 2144985)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 2144995)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 2145127)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 2145135)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 2144665)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 2145004)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 2144699)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2448 (class 2606 OID 2144674)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 2145014)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 2145023)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 2144898)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 2144828)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 2144927)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 2145146)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 2144842)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 2144693)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 2145161)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2530 (class 2606 OID 2144903)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 2145030)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 2145171)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 2144917)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 2145182)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 2145192)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 1259 OID 2144864)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2480 (class 1259 OID 2144794)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2543 (class 1259 OID 2144950)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2551 (class 1259 OID 2144971)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2552 (class 1259 OID 2144970)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2528 (class 1259 OID 2144904)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2598 (class 1259 OID 2145087)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2599 (class 1259 OID 2145085)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2600 (class 1259 OID 2145086)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2601 (class 1259 OID 2145099)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2602 (class 1259 OID 2145100)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2603 (class 1259 OID 2145101)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2621 (class 1259 OID 2145164)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2622 (class 1259 OID 2145163)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2623 (class 1259 OID 2145162)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2498 (class 1259 OID 2144844)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2499 (class 1259 OID 2144843)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2484 (class 1259 OID 2144801)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2485 (class 1259 OID 2144800)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2570 (class 1259 OID 2145005)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2520 (class 1259 OID 2144884)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2450 (class 1259 OID 2144681)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2451 (class 1259 OID 2144682)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2573 (class 1259 OID 2145017)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2574 (class 1259 OID 2145016)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2575 (class 1259 OID 2145015)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2521 (class 1259 OID 2144890)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2522 (class 1259 OID 2144892)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2523 (class 1259 OID 2144891)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2564 (class 1259 OID 2144999)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2565 (class 1259 OID 2144997)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2566 (class 1259 OID 2144996)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2567 (class 1259 OID 2144998)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2457 (class 1259 OID 2144700)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2458 (class 1259 OID 2144701)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2580 (class 1259 OID 2145031)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2548 (class 1259 OID 2144964)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2615 (class 1259 OID 2145136)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2616 (class 1259 OID 2145137)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2490 (class 1259 OID 2144822)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2491 (class 1259 OID 2144823)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2606 (class 1259 OID 2145109)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2607 (class 1259 OID 2145110)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2585 (class 1259 OID 2145039)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2586 (class 1259 OID 2145038)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2587 (class 1259 OID 2145041)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2588 (class 1259 OID 2145037)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2589 (class 1259 OID 2145040)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2626 (class 1259 OID 2145172)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2558 (class 1259 OID 2144989)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2559 (class 1259 OID 2144988)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2560 (class 1259 OID 2144986)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2561 (class 1259 OID 2144987)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2476 (class 1259 OID 2144772)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2592 (class 1259 OID 2145058)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2593 (class 1259 OID 2145057)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2517 (class 1259 OID 2144878)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2472 (class 1259 OID 2144750)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2473 (class 1259 OID 2144749)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2494 (class 1259 OID 2144829)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2495 (class 1259 OID 2144830)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2533 (class 1259 OID 2144930)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2534 (class 1259 OID 2144929)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2535 (class 1259 OID 2144928)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2505 (class 1259 OID 2144866)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2506 (class 1259 OID 2144862)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2507 (class 1259 OID 2144859)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2508 (class 1259 OID 2144860)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2509 (class 1259 OID 2144858)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2510 (class 1259 OID 2144863)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2511 (class 1259 OID 2144861)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2483 (class 1259 OID 2144793)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2465 (class 1259 OID 2144724)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2466 (class 1259 OID 2144726)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2467 (class 1259 OID 2144725)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2468 (class 1259 OID 2144727)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2540 (class 1259 OID 2144936)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2471 (class 1259 OID 2144739)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2454 (class 1259 OID 2144694)
-- Name: uniq_7fb775b7f85e0677; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7f85e0677 ON uporabniki USING btree (username);


--
-- TOC entry 2557 (class 1259 OID 2144980)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2479 (class 1259 OID 2144773)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2612 (class 1259 OID 2145117)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2449 (class 1259 OID 2144675)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2512 (class 1259 OID 2144865)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2654 (class 2606 OID 2145298)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2651 (class 2606 OID 2145283)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2652 (class 2606 OID 2145288)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2656 (class 2606 OID 2145308)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2650 (class 2606 OID 2145278)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2655 (class 2606 OID 2145303)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2653 (class 2606 OID 2145293)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2641 (class 2606 OID 2145233)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2667 (class 2606 OID 2145363)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2670 (class 2606 OID 2145378)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2669 (class 2606 OID 2145373)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2662 (class 2606 OID 2145338)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2693 (class 2606 OID 2145493)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2691 (class 2606 OID 2145483)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2692 (class 2606 OID 2145488)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2666 (class 2606 OID 2145358)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2694 (class 2606 OID 2145498)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2695 (class 2606 OID 2145503)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2696 (class 2606 OID 2145508)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2704 (class 2606 OID 2145548)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2703 (class 2606 OID 2145543)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2702 (class 2606 OID 2145538)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2649 (class 2606 OID 2145273)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2648 (class 2606 OID 2145268)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2643 (class 2606 OID 2145243)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2642 (class 2606 OID 2145238)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2679 (class 2606 OID 2145423)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2658 (class 2606 OID 2145318)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2633 (class 2606 OID 2145193)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2634 (class 2606 OID 2145198)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2682 (class 2606 OID 2145438)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2681 (class 2606 OID 2145433)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2680 (class 2606 OID 2145428)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2659 (class 2606 OID 2145323)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2661 (class 2606 OID 2145333)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2660 (class 2606 OID 2145328)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2678 (class 2606 OID 2145418)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2676 (class 2606 OID 2145408)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2675 (class 2606 OID 2145403)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2677 (class 2606 OID 2145413)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2635 (class 2606 OID 2145203)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2636 (class 2606 OID 2145208)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2683 (class 2606 OID 2145443)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2668 (class 2606 OID 2145368)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2700 (class 2606 OID 2145528)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2701 (class 2606 OID 2145533)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2644 (class 2606 OID 2145248)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2645 (class 2606 OID 2145253)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2697 (class 2606 OID 2145513)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2698 (class 2606 OID 2145518)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2686 (class 2606 OID 2145458)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2685 (class 2606 OID 2145453)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2688 (class 2606 OID 2145468)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2684 (class 2606 OID 2145448)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2687 (class 2606 OID 2145463)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2705 (class 2606 OID 2145553)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2674 (class 2606 OID 2145398)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2673 (class 2606 OID 2145393)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2671 (class 2606 OID 2145383)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2672 (class 2606 OID 2145388)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2639 (class 2606 OID 2145223)
-- Name: fk_b7229ce169e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT fk_b7229ce169e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2640 (class 2606 OID 2145228)
-- Name: fk_b7229ce1a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT fk_b7229ce1a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2690 (class 2606 OID 2145478)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2689 (class 2606 OID 2145473)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2657 (class 2606 OID 2145313)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2699 (class 2606 OID 2145523)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2638 (class 2606 OID 2145218)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2637 (class 2606 OID 2145213)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2646 (class 2606 OID 2145258)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2647 (class 2606 OID 2145263)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2665 (class 2606 OID 2145353)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2664 (class 2606 OID 2145348)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2663 (class 2606 OID 2145343)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-07 23:42:51 CEST

--
-- PostgreSQL database dump complete
--

