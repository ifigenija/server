--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-04-14 08:08:14 CEST

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
-- TOC entry 177 (class 1259 OID 194322)
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
-- TOC entry 223 (class 1259 OID 194804)
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
-- TOC entry 222 (class 1259 OID 194787)
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
-- TOC entry 215 (class 1259 OID 194703)
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
-- TOC entry 191 (class 1259 OID 194487)
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
-- TOC entry 194 (class 1259 OID 194528)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 187 (class 1259 OID 194449)
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
-- TOC entry 210 (class 1259 OID 194653)
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
-- TOC entry 189 (class 1259 OID 194474)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 193 (class 1259 OID 194522)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 179 (class 1259 OID 194342)
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
-- TOC entry 199 (class 1259 OID 194571)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 203 (class 1259 OID 194596)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 185 (class 1259 OID 194423)
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
-- TOC entry 178 (class 1259 OID 194331)
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
-- TOC entry 182 (class 1259 OID 194393)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 174 (class 1259 OID 194296)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 194315)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 194603)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 194633)
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
-- TOC entry 219 (class 1259 OID 194745)
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
-- TOC entry 181 (class 1259 OID 194372)
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
-- TOC entry 184 (class 1259 OID 194415)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 194577)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 183 (class 1259 OID 194400)
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
-- TOC entry 188 (class 1259 OID 194466)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 194589)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 194694)
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
-- TOC entry 218 (class 1259 OID 194738)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 194618)
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
-- TOC entry 198 (class 1259 OID 194562)
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
-- TOC entry 197 (class 1259 OID 194552)
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
-- TOC entry 217 (class 1259 OID 194728)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 194684)
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
-- TOC entry 171 (class 1259 OID 194268)
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
-- TOC entry 170 (class 1259 OID 194266)
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
-- TOC entry 207 (class 1259 OID 194627)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 194305)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 194289)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 194641)
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
-- TOC entry 201 (class 1259 OID 194583)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 194533)
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
-- TOC entry 180 (class 1259 OID 194365)
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
-- TOC entry 196 (class 1259 OID 194539)
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
-- TOC entry 216 (class 1259 OID 194719)
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
-- TOC entry 186 (class 1259 OID 194435)
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
-- TOC entry 172 (class 1259 OID 194277)
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
-- TOC entry 221 (class 1259 OID 194769)
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
-- TOC entry 190 (class 1259 OID 194481)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 205 (class 1259 OID 194610)
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
-- TOC entry 212 (class 1259 OID 194676)
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
-- TOC entry 192 (class 1259 OID 194509)
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
-- TOC entry 220 (class 1259 OID 194759)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 194666)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2093 (class 2604 OID 194271)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2595 (class 0 OID 194322)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 194804)
-- Dependencies: 223
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 194787)
-- Dependencies: 222
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 194703)
-- Dependencies: 215
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2609 (class 0 OID 194487)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2612 (class 0 OID 194528)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2605 (class 0 OID 194449)
-- Dependencies: 187
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-552c-aeae-bd9d-074de451fc56	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-552c-aeae-39aa-2f32fff87e9f	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-552c-aeae-798b-621630c06721	AL	ALB	008	Albania 	Albanija	\N
00040000-552c-aeae-4ef6-e8dda8b45949	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-552c-aeae-ab5c-f4c0753cf2ca	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-552c-aeae-a975-b31b158e2c76	AD	AND	020	Andorra 	Andora	\N
00040000-552c-aeae-f76f-11be6b88bebb	AO	AGO	024	Angola 	Angola	\N
00040000-552c-aeae-96f5-96e6b545a909	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-552c-aeae-ef93-4f2288b255f8	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-552c-aeae-5c22-4d862d85c8b7	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-552c-aeae-6f4c-d15fd3283a7c	AR	ARG	032	Argentina 	Argenitna	\N
00040000-552c-aeae-91c3-1df3f2da3b19	AM	ARM	051	Armenia 	Armenija	\N
00040000-552c-aeae-c96b-34630633afd9	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-552c-aeae-f1a5-f8b0d2bce538	AU	AUS	036	Australia 	Avstralija	\N
00040000-552c-aeae-e5d5-71b416c4a556	AT	AUT	040	Austria 	Avstrija	\N
00040000-552c-aeae-f907-c0c22765ac3b	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-552c-aeae-f2c6-a4891c7e632c	BS	BHS	044	Bahamas 	Bahami	\N
00040000-552c-aeae-68e0-abd80b6d3e2c	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-552c-aeae-e712-446630e7998b	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-552c-aeae-5914-722b97ff3b77	BB	BRB	052	Barbados 	Barbados	\N
00040000-552c-aeae-2af9-b2f41fee7bb0	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-552c-aeae-b2c8-00e439c364c7	BE	BEL	056	Belgium 	Belgija	\N
00040000-552c-aeae-8cf1-ba85ff9ef669	BZ	BLZ	084	Belize 	Belize	\N
00040000-552c-aeae-f187-a011d7b2bd91	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-552c-aeae-3ba5-6484428c5afa	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-552c-aeae-5a87-bd9451ad6893	BT	BTN	064	Bhutan 	Butan	\N
00040000-552c-aeae-c13f-eaba18f063ad	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-552c-aeae-4df9-8aac8cf9dae8	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-552c-aeae-e4b1-146a515650db	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-552c-aeae-933a-a5ac1f4d3ac5	BW	BWA	072	Botswana 	Bocvana	\N
00040000-552c-aeae-4045-c093ea752151	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-552c-aeae-ccb4-515d549b57c0	BR	BRA	076	Brazil 	Brazilija	\N
00040000-552c-aeae-8d03-41b143093daa	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-552c-aeae-7831-c495def5a6ff	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-552c-aeae-0e02-1de6fcf9f9c3	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-552c-aeae-5fdd-9e1b064f0a10	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-552c-aeae-08f6-484ff8471a50	BI	BDI	108	Burundi 	Burundi 	\N
00040000-552c-aeae-88d7-aec715c16e4a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-552c-aeae-cd92-89ef12e6adcb	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-552c-aeae-f69b-f360e0425d9f	CA	CAN	124	Canada 	Kanada	\N
00040000-552c-aeae-fc81-e0763954c52d	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-552c-aeae-e58d-f1d10e105c4c	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-552c-aeae-e019-8c9208944b29	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-552c-aeae-4d9f-e53b81b4b19f	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-552c-aeae-9305-47d02b6f4c2e	CL	CHL	152	Chile 	Čile	\N
00040000-552c-aeae-e47d-efdfab299f13	CN	CHN	156	China 	Kitajska	\N
00040000-552c-aeae-bec1-fa14084d27c2	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-552c-aeae-d438-a51569a72f46	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-552c-aeae-f707-8792f156760a	CO	COL	170	Colombia 	Kolumbija	\N
00040000-552c-aeae-35ce-dbb39c5471e0	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-552c-aeae-f292-130b89376757	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-552c-aeae-e663-f46ff7d750d5	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-552c-aeae-4a16-df35da1c1d6f	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-552c-aeae-b09b-df9ec17d6631	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-552c-aeae-9464-3321537adee2	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-552c-aeae-22f9-dcccd82d1997	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-552c-aeae-0648-55b06db4edfe	CU	CUB	192	Cuba 	Kuba	\N
00040000-552c-aeae-5ee4-00c90b9d3ed5	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-552c-aeae-a06c-b15da07397dd	CY	CYP	196	Cyprus 	Ciper	\N
00040000-552c-aeae-76c4-c3cf0689c9ec	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-552c-aeae-dde5-7d2f4f4f8bf0	DK	DNK	208	Denmark 	Danska	\N
00040000-552c-aeae-9a90-460810b69a7a	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-552c-aeae-99fa-d28e492d0e75	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-552c-aeae-e2ae-00059bf43e34	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-552c-aeae-230f-bcb7f58e83ad	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-552c-aeae-14d6-d5b1a65d45e5	EG	EGY	818	Egypt 	Egipt	\N
00040000-552c-aeae-db97-98eb131bd46c	SV	SLV	222	El Salvador 	Salvador	\N
00040000-552c-aeae-cb0e-d0201abf0e9a	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-552c-aeae-1593-db138a909c21	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-552c-aeae-a80a-61aa299b70f6	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-552c-aeae-cfdd-3c17d315a02c	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-552c-aeae-3fff-72914ca02405	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-552c-aeae-6230-ef3212a85a37	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-552c-aeae-1e22-99c27afba609	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-552c-aeae-f21b-e1b551a7909e	FI	FIN	246	Finland 	Finska	\N
00040000-552c-aeae-80ad-ff9d84c75dce	FR	FRA	250	France 	Francija	\N
00040000-552c-aeae-fb61-15c9c145e974	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-552c-aeae-ceba-19b731c917e6	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-552c-aeae-32b4-5750dfdafb1b	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-552c-aeae-8744-7172ea1eabf8	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-552c-aeae-b1ad-1026fcf6ee1b	GA	GAB	266	Gabon 	Gabon	\N
00040000-552c-aeae-aeea-4359584abbf6	GM	GMB	270	Gambia 	Gambija	\N
00040000-552c-aeae-e2c9-6842ff45e906	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-552c-aeae-cdb0-8c7fc15d0ed3	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-552c-aeae-4260-a85bd44921d0	GH	GHA	288	Ghana 	Gana	\N
00040000-552c-aeae-51a4-431ce3d855f4	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-552c-aeae-79f6-1c8d8570a6e4	GR	GRC	300	Greece 	Grčija	\N
00040000-552c-aeae-8065-6e4f736f7121	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-552c-aeae-e77d-3b71b03bf048	GD	GRD	308	Grenada 	Grenada	\N
00040000-552c-aeae-f976-01c92d022968	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-552c-aeae-19c1-acc05ceb2c57	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-552c-aeae-7131-eb1f4b502985	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-552c-aeae-610d-c640859498ad	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-552c-aeae-3196-45200d675200	GN	GIN	324	Guinea 	Gvineja	\N
00040000-552c-aeae-d009-b9448a6bafce	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-552c-aeae-c1a5-338f8c694fe8	GY	GUY	328	Guyana 	Gvajana	\N
00040000-552c-aeae-9def-ee8f67978564	HT	HTI	332	Haiti 	Haiti	\N
00040000-552c-aeae-386d-b77233671a19	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-552c-aeae-3481-a39999aec757	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-552c-aeae-7399-2f2130641dfd	HN	HND	340	Honduras 	Honduras	\N
00040000-552c-aeae-31d9-ba5eaf0ee10b	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-552c-aeae-a900-d5f3a721d897	HU	HUN	348	Hungary 	Madžarska	\N
00040000-552c-aeae-67c4-b410ec4f78ae	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-552c-aeae-acd0-d6d7e75eaa13	IN	IND	356	India 	Indija	\N
00040000-552c-aeae-ad83-616c158eb95d	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-552c-aeae-9302-62d2225023d8	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-552c-aeae-fece-a803b20959d5	IQ	IRQ	368	Iraq 	Irak	\N
00040000-552c-aeae-d9ee-e6bf3643521d	IE	IRL	372	Ireland 	Irska	\N
00040000-552c-aeae-6963-351d3b707255	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-552c-aeae-4d1e-f0e57c07ddcd	IL	ISR	376	Israel 	Izrael	\N
00040000-552c-aeae-98e9-00c28c387472	IT	ITA	380	Italy 	Italija	\N
00040000-552c-aeae-d8de-c6bd1a97d3c8	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-552c-aeae-b2e2-3d3c60368353	JP	JPN	392	Japan 	Japonska	\N
00040000-552c-aeae-54bc-0dc00d71e97c	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-552c-aeae-709c-1c40a2183e31	JO	JOR	400	Jordan 	Jordanija	\N
00040000-552c-aeae-f90e-2fa6060edd1d	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-552c-aeae-b576-15993bb2c486	KE	KEN	404	Kenya 	Kenija	\N
00040000-552c-aeae-3215-b3b527f7ce9f	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-552c-aeae-05c6-ec31e5cd221b	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-552c-aeae-82f5-6b8e1cf1dbf9	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-552c-aeae-d858-558d0bc78d2d	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-552c-aeae-d9b5-3a87755684b3	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-552c-aeae-5aae-7c9831ceb4a9	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-552c-aeae-af01-46706322c320	LV	LVA	428	Latvia 	Latvija	\N
00040000-552c-aeae-6702-acb483264f72	LB	LBN	422	Lebanon 	Libanon	\N
00040000-552c-aeae-9b56-1666b364960e	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-552c-aeae-3469-3c4c790b2303	LR	LBR	430	Liberia 	Liberija	\N
00040000-552c-aeae-fd56-79f3be4c7971	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-552c-aeae-9086-136c67ac60e6	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-552c-aeae-6953-3f4f394e20a6	LT	LTU	440	Lithuania 	Litva	\N
00040000-552c-aeae-83b3-bd0ca2d3517d	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-552c-aeae-e3d5-eff2e70b775e	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-552c-aeae-0fa5-807914597cad	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-552c-aeae-9542-e9cd4cbcf581	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-552c-aeae-f5db-4f5b17a77244	MW	MWI	454	Malawi 	Malavi	\N
00040000-552c-aeae-360c-cf848852aa2b	MY	MYS	458	Malaysia 	Malezija	\N
00040000-552c-aeae-aa78-f447275c7e1c	MV	MDV	462	Maldives 	Maldivi	\N
00040000-552c-aeae-c41e-6b2ca885224c	ML	MLI	466	Mali 	Mali	\N
00040000-552c-aeae-a410-87a71846e347	MT	MLT	470	Malta 	Malta	\N
00040000-552c-aeae-eedc-ba9887d45f53	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-552c-aeae-4b52-103c7a3c7876	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-552c-aeae-2b6c-49c7f9a3d26a	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-552c-aeae-dae9-f9db9ab23c04	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-552c-aeae-9b62-8dde69a87ade	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-552c-aeae-778f-1ba80a1dbd31	MX	MEX	484	Mexico 	Mehika	\N
00040000-552c-aeae-6e88-ef463653736c	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-552c-aeae-5ef7-8ac2415b9208	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-552c-aeae-7dd6-c801abd3d350	MC	MCO	492	Monaco 	Monako	\N
00040000-552c-aeae-95a9-e407f864c33c	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-552c-aeae-7d6f-161616cad3c3	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-552c-aeae-e59c-275ac1860d08	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-552c-aeae-637a-7dad19b3691a	MA	MAR	504	Morocco 	Maroko	\N
00040000-552c-aeae-c950-e0adc294bec6	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-552c-aeae-40a9-7c7fa33efec6	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-552c-aeae-7060-6928214ebec8	NA	NAM	516	Namibia 	Namibija	\N
00040000-552c-aeae-074a-1fb344ab06f9	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-552c-aeae-ede0-0b95d2aa8834	NP	NPL	524	Nepal 	Nepal	\N
00040000-552c-aeae-1144-93f3c7e5dae0	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-552c-aeae-365a-301c7cbd9f96	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-552c-aeae-2237-74e5317fd21f	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-552c-aeae-d364-d4e5557b0135	NE	NER	562	Niger 	Niger 	\N
00040000-552c-aeae-c5b4-33858e3ac21c	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-552c-aeae-4bce-ab90007ce16f	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-552c-aeae-a55e-ffac558898b9	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-552c-aeae-335f-c6661e72b1d8	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-552c-aeae-c8c6-574f7599ff79	NO	NOR	578	Norway 	Norveška	\N
00040000-552c-aeae-5c8c-0467278944e2	OM	OMN	512	Oman 	Oman	\N
00040000-552c-aeae-1e9d-45746c2db8e5	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-552c-aeae-1097-efb381b3ee0f	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-552c-aeae-ea0d-8b1c32de8f71	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-552c-aeae-5104-1ead8ca485b3	PA	PAN	591	Panama 	Panama	\N
00040000-552c-aeae-4c4a-c09c185bd4a1	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-552c-aeae-005d-57aa8fdf5c54	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-552c-aeae-6fcb-00581e4dd3b8	PE	PER	604	Peru 	Peru	\N
00040000-552c-aeae-18bf-c718f4295955	PH	PHL	608	Philippines 	Filipini	\N
00040000-552c-aeae-4651-b48cccfbf575	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-552c-aeae-37e6-8feaf2656248	PL	POL	616	Poland 	Poljska	\N
00040000-552c-aeae-db29-cf928f0da3f5	PT	PRT	620	Portugal 	Portugalska	\N
00040000-552c-aeae-5573-afb318506955	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-552c-aeae-2836-02aa5a4f2d8c	QA	QAT	634	Qatar 	Katar	\N
00040000-552c-aeae-b63d-cdfffecbef92	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-552c-aeae-9412-cace6eb4b506	RO	ROU	642	Romania 	Romunija	\N
00040000-552c-aeae-4125-64499bbc33e0	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-552c-aeae-cd95-fd0afa0a3260	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-552c-aeae-4813-cf6493a6faeb	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-552c-aeae-2dea-c38f6f1e53f9	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-552c-aeae-e5bc-a102d9a326b0	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-552c-aeae-7614-783753171b26	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-552c-aeae-b556-4eb6a79e68a6	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-552c-aeae-91e4-18c8c6f772d0	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-552c-aeae-250d-a267fef07465	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-552c-aeae-c182-684723087585	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-552c-aeae-c037-80a18cffb7ec	SM	SMR	674	San Marino 	San Marino	\N
00040000-552c-aeae-717c-4cdf9cdd46a7	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-552c-aeae-77f6-f475fe5c6a08	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-552c-aeae-987e-2cf0e42dae34	SN	SEN	686	Senegal 	Senegal	\N
00040000-552c-aeae-9932-1408d8bb82f6	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-552c-aeae-05a9-06c46ac6bc86	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-552c-aeae-20eb-070fe5425b52	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-552c-aeae-c417-78dbd4e23f40	SG	SGP	702	Singapore 	Singapur	\N
00040000-552c-aeae-8d0e-e2b73fea3c80	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-552c-aeae-6f83-cf0d68155586	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-552c-aeae-d5ee-c5ba2368fab6	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-552c-aeae-8447-147c14411858	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-552c-aeae-2e0f-0011553df474	SO	SOM	706	Somalia 	Somalija	\N
00040000-552c-aeae-7daa-95d26719d54e	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-552c-aeae-68df-377af66cf5df	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-552c-aeae-6d88-780be7de94d2	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-552c-aeae-74c0-d3a53960989e	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-552c-aeae-131c-4128b271d839	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-552c-aeae-f527-a88a647d8298	SD	SDN	729	Sudan 	Sudan	\N
00040000-552c-aeae-f326-9718484ac335	SR	SUR	740	Suriname 	Surinam	\N
00040000-552c-aeae-20fe-6ae085d46adf	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-552c-aeae-df17-9dfe157f5bfe	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-552c-aeae-5c01-1b5996a4a501	SE	SWE	752	Sweden 	Švedska	\N
00040000-552c-aeae-b924-70de3e179fbf	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-552c-aeae-a27b-9f2416978836	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-552c-aeae-d8c0-5580c31078fe	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-552c-aeae-5e60-f74ea02d11bc	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-552c-aeae-bae8-73d7fe136f34	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-552c-aeae-cfba-f5400509648b	TH	THA	764	Thailand 	Tajska	\N
00040000-552c-aeae-204b-a2e372508a78	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-552c-aeae-ebb5-410d58668f8f	TG	TGO	768	Togo 	Togo	\N
00040000-552c-aeae-1cf5-d0014aadc87c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-552c-aeae-c680-1ef36943bc50	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-552c-aeae-1412-40481c9b2af8	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-552c-aeae-9c51-850b5362bb3b	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-552c-aeae-f7ac-994607d35232	TR	TUR	792	Turkey 	Turčija	\N
00040000-552c-aeae-83f8-2b9398b6af64	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-552c-aeae-f765-d5ad3b97002e	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-552c-aeae-dfe7-a20acd43eca9	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-552c-aeae-cdc0-1392a1a29975	UG	UGA	800	Uganda 	Uganda	\N
00040000-552c-aeae-d6f5-39a7110d4e72	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-552c-aeae-f606-aea23ca932ab	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-552c-aeae-c90b-e11623cec7ba	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-552c-aeae-d3fa-f7670df33b9c	US	USA	840	United States 	Združene države Amerike	\N
00040000-552c-aeae-cb88-7e7f0588822a	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-552c-aeae-9710-5e01c1047542	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-552c-aeae-a6a9-c7229ee853c8	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-552c-aeae-7264-6587420d537e	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-552c-aeae-216b-38c138ba0411	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-552c-aeae-358e-24355b23cfb1	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-552c-aeae-c1f8-a82a64cdd39d	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-552c-aeae-e67f-3c6113f08006	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-552c-aeae-8100-baf19fc82a61	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-552c-aeae-92ec-45ff3982091c	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-552c-aeae-386b-4fc2c7e78945	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-552c-aeae-78aa-dca6a99fab98	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-552c-aeae-57cf-6d1209df3a77	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2628 (class 0 OID 194653)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2607 (class 0 OID 194474)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2611 (class 0 OID 194522)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2597 (class 0 OID 194342)
-- Dependencies: 179
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2617 (class 0 OID 194571)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2621 (class 0 OID 194596)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2603 (class 0 OID 194423)
-- Dependencies: 185
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-552c-aeae-5052-654590b9ae44	kravaXXX	color	N;	t	f	f	\N	\N
00000000-552c-aeae-a01c-320e0068806d	privzetInspicient	entity	N;	f	f	f	\N	\N
00000000-552c-aeae-e853-508d8069bb0d	dogodek-status	map	O:18:"Zend\\Config\\Config":4:{s:21:"	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2596 (class 0 OID 194331)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
\.


--
-- TOC entry 2600 (class 0 OID 194393)
-- Dependencies: 182
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2592 (class 0 OID 194296)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00020000-552c-aeaf-1fd7-a62af505205a	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-aeaf-8c1b-6de91e817625	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-aeaf-a7e4-5069013aa9ce	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-aeaf-8a97-49f9774c3532	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-aeaf-4344-22fac7efebc5	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-aeaf-24d0-b38e1914a4f0	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-aeaf-a2c2-4cebb323c847	Role-read	Aaa - Vloga - Beri	f
00020000-552c-aeaf-c94a-b6e93f554b98	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-aeaf-956b-22848e39d5ec	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-aeaf-c38c-ae20284337ef	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-aeaf-9b5e-24f1955e2e70	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-aeaf-240f-51a3519b443d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-aeaf-05ec-047d6c53e29e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-aeaf-e84a-3a6272387e8a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-aeaf-274f-5939d1e0fd89	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-aeaf-3bbc-d656af21b93a	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-aeaf-9887-5e40527dba40	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-aeaf-6894-613459965785	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-aeaf-64df-e36086910a18	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-aeaf-1a86-bd42ef4c4f43	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-aeaf-da65-373e18154ebd	Role-read	Aaa - Vloga - Beri	f
00020000-552c-aeaf-d354-f30a0991174c	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-aeaf-29fb-4c398cd7e048	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-aeaf-cf3c-a80fba429bde	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-aeaf-eb66-6471ba4e3fec	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-aeaf-50bf-d900560ad5b0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-aeaf-35a9-e45a28252782	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-aeaf-5bed-5bf632f6db38	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-aeaf-40df-4a8625c6ffad	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-aeaf-1e79-f67afe443dff	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-aeaf-0332-0f072c9c2447	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-aeaf-336c-5e924b1dfda0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-aeaf-cbe4-2c54ac64aad2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-aeaf-0298-0d821ddc152b	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-aeaf-17c9-187059969e1c	Role-read	Aaa - Vloga - Beri	f
00020000-552c-aeaf-e115-66e15757330f	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-aeaf-a481-3d4828d4ea39	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-aeaf-95b6-901462697244	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-aeaf-bf9f-e6f76ab9d823	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-aeaf-2837-c49f31da57d4	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-aeaf-0f9f-a03f9c2ff2c7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-aeaf-571a-a7c4399cce3e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-aeaf-5dc4-26af1e555b80	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-aeaf-8ca6-b70bbfc4229c	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-aeaf-7063-161817c17027	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-aeaf-31dc-6560aab260f2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-aeaf-1b85-9b0ab83608db	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-aeaf-f19d-e3d490508c67	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-aeaf-7add-eeb5beae9639	Role-read	Aaa - Vloga - Beri	f
00020000-552c-aeaf-5ff1-39af6cb7bf8e	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-aeaf-0b10-985f5571e27e	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-aeaf-646c-addfa9fdbfa5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-aeaf-aa3b-22b61b50def8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-aeaf-1865-0733f21ea7b6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-aeaf-39d6-62fb0faa30fb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-aeaf-fb56-698de8d59467	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-aeaf-37ab-77bd4530cdce	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-aeaf-8503-d8608fdd0124	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-aeaf-d5fa-ecfb88985a3f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-aeaf-803e-c4b1415c2648	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-aeaf-2233-16fc104be84d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-aeaf-0011-23614fd72682	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-aeaf-7d95-9f9907b2a600	Role-read	Aaa - Vloga - Beri	f
00020000-552c-aeaf-8ee0-f1cbb5149209	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-aeaf-4d42-549957776222	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-aeaf-75e3-0fece4628a83	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-aeaf-f6a5-c629cc47a826	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-aeaf-e5ad-796aed8ce88b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-aeaf-6360-7678231ed53a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-aeaf-a6ad-e1d7ae0cc971	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-aeaf-ab4b-4b4aca4082e5	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-aeaf-87a0-ce2c8fb93f56	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-aeaf-1a81-f04aed2f8c75	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-aeaf-309a-f9589cf8fd3c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-aeaf-fb09-2675f82e8ed2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-aeaf-fe11-46d00ffab2db	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-aeaf-0810-20b6edd54c3a	Role-read	Aaa - Vloga - Beri	f
00020000-552c-aeaf-a005-43b6dc92cd29	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-aeaf-c7e9-13e096b0ade8	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-aeaf-b43f-f094e00bb595	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-aeaf-1d95-9143322732d7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-aeaf-817c-bb0daed161b2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-aeaf-b414-fa62c1350575	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-aeaf-5dab-ece1d6f53058	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-aeaf-bfaf-c0f887e06c64	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-aeaf-3fe8-54f81089298d	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-aeaf-e7f1-9a4ecf6df2c1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-aeaf-4f11-d1a2d45b1c5f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-aeaf-912b-b222b06b6af1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-aeaf-ab45-74a53de335a3	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-aeaf-3eee-3e1f13ae5bf8	Role-read	Aaa - Vloga - Beri	f
00020000-552c-aeaf-d6a0-89146848fb99	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-aeaf-a75f-a284f068a4dc	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-aeaf-ff1e-2a4c1b2b5f67	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-aeaf-d714-890be22e471a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-aeaf-c374-60648ce010b0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-aeaf-eea2-e9cf7d42bee4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-aeaf-228f-63523739a7cc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-aeaf-c544-dea2d6a46fde	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-aeaf-be05-000f24be1e89	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-aeaf-5f93-3c7998a484f5	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-aeaf-24e2-1aea179177f0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-aeaf-4bd5-28c3b7635ebf	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-aeaf-3790-77587ecaaaeb	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-aeaf-5f05-0fea4c7393c0	Role-read	Aaa - Vloga - Beri	f
00020000-552c-aeaf-d9b5-cf398843ddc4	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-aeaf-3a2a-912cfad2e708	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-aeaf-6813-3a80f1ecc638	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-aeaf-ace7-4931be163bea	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-aeaf-5006-03709fed4726	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-aeaf-c088-d49bb40b941e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-aeaf-a1e1-abece4300893	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-aeaf-3584-5d9290198222	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-aeaf-e001-0ddb4c368515	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-aeaf-4567-609c9b021c05	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-aeaf-a5d3-faba5c1b0dde	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-aeaf-9a5a-6d1cc2679a79	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-aeaf-3167-bc7e32d71b12	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-aeaf-78c3-2a04630f8e7a	Role-read	Aaa - Vloga - Beri	f
00020000-552c-aeaf-1b50-5b49b91d31a5	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-aeaf-218e-a6bdc578678e	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-aeaf-bf3e-ed55502af660	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-aeaf-80c5-4cb99881180a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-aeaf-3eca-b37306b9985e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-aeaf-0fb2-6bb40eba2bba	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-aeaf-0546-91dc4e9d894a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-aeaf-f603-ebcb75fbb2db	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-aeaf-490d-877a8c52da75	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-aeaf-987a-3bafbd44dd7b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-aeaf-ccba-8c8bdda006a4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-aeaf-ddc3-891f353d0ff0	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-aeaf-4a98-d03ea467390b	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-aeaf-698d-c14bad677458	Role-read	Aaa - Vloga - Beri	f
00020000-552c-aeaf-6c79-21894c9b2686	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-aeaf-070a-095fcfecd37f	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-aeaf-44e0-926c9cab9687	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-aeaf-693f-24194a2a76d5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-aeaf-1947-2ec0409b9e5a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-aeaf-1380-5cdff1ad217d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-aeaf-c27e-628c9f85c31f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-aeaf-19ab-eec32b385a83	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-aeaf-b105-d4fbb5394351	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-aeaf-f7af-a90a19907a11	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-aeaf-7ea8-7a6e053f2aa4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-aeaf-0f07-51082ba486a4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-aeaf-fc3c-82a885b5b903	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-aeaf-0a35-e9af24ac1835	Role-read	Aaa - Vloga - Beri	f
00020000-552c-aeaf-245e-14ba5194a2c7	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-aeaf-9fec-7cc8aa079d4f	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-aeaf-311e-3d22e2d17cfc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-aeaf-ad79-dd05fcdbfaef	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-aeaf-d623-fbd3afc2d33e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-aeaf-d141-f4b6df96be1f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-aeaf-c845-fed765e68583	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-aeaf-06fe-41427fa186fd	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-aeaf-4413-0188f2872a00	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-aeaf-cbee-2e62d7829e08	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-aeaf-e091-680fc6b509d7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-aeaf-1232-db532ddfee6f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-aeaf-cc00-bc1ebeb2951e	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-aeaf-33f1-5b9062abdb93	Role-read	Aaa - Vloga - Beri	f
00020000-552c-aeaf-1b57-c2c24d2bf264	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-aeaf-dffb-e1e546f49e58	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-aeaf-9401-442020844d85	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-aeaf-c60b-595442149cab	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-aeaf-753f-b097802d858b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-aeaf-a2f4-9f7a0d7d4e18	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-aeaf-6f3c-3c936c5477af	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-aeaf-3cd7-4ae90b5bfa4d	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-aeaf-e8dc-3eef6d19dae3	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-aeaf-5593-a6d530ba0fbf	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-aeaf-f39d-f52a447d9ade	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-aeaf-63e2-9fcb7eb1703a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-aeaf-5a78-bf8885c24bf9	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-aeaf-51ab-69472b114c76	Role-read	Aaa - Vloga - Beri	f
00020000-552c-aeaf-041f-a6cb28c9d926	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-aeaf-cc3c-64a7e0b490d9	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-aeaf-2204-7479105a5724	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-aeaf-f43d-032e0cfd69a8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-aeaf-3abf-b1de356e36f7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-aeaf-73a3-9f2c2b197000	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-aeaf-3227-94e616f98bc7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-aeaf-93e1-0820c4952269	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-aeaf-0058-2a7046d8ed4e	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-aeaf-fc5f-5edf567fb22c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-aeaf-d2b5-8a21c203e2ba	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-aeaf-1429-23b1e117edfe	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-aeaf-e82e-961250c44e12	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-aeaf-d600-31d21065ce75	Role-read	Aaa - Vloga - Beri	f
00020000-552c-aeaf-e867-af2a75551260	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-aeaf-6a67-06d18307b9c9	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-aeaf-ce96-7cba7b54567d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-aeaf-a4b4-f6e051eb1e28	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-aeaf-f306-8bd33516fbd0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-aeaf-3d3b-37e440e8cadf	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-aeaf-386c-2dbb5134cbb0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-aeaf-a406-c28ddfd0845b	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-aeaf-51d6-7123d2a5d68c	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-aeaf-d26b-7ec3bdefe272	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-aeaf-a9cc-820fde33f73d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-aeaf-aede-862c41adcb84	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-aeaf-5867-3d2d8068b2e2	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-aeaf-c9ed-04185b739289	Role-read	Aaa - Vloga - Beri	f
00020000-552c-aeaf-2696-23998cdb347b	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-aeaf-9961-36bb45ce050a	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-aeaf-a865-a99cb8b77953	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-aeaf-55d5-7d63808c04e6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-aeaf-f3a2-3aada00dff6a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-aeaf-aedb-9756befd15dd	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-aeaf-05b3-b2bf2c71adfa	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-aeaf-59a8-64232b333878	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-aeaf-74d8-dcc3f14c250d	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-aeaf-5ac0-45b2ccf4c395	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-aeaf-f280-bb5ff28d65c6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-aeaf-3c2d-651637d5677a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-aeaf-3ec5-b5de94a1e63e	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-aeaf-280d-4db60da1d5fa	Role-read	Aaa - Vloga - Beri	f
00020000-552c-aeaf-c09e-b0567d91c6a3	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-aeaf-ff8d-5288531ccc46	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-aeaf-f9bf-7ea9688e52eb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-aeaf-a122-6cbc87abc108	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-aeaf-32a9-1aae58681414	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-aeaf-5b3b-dc93c07c88bf	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-aeaf-c292-37a0447327dd	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-aeaf-2bf4-fb185269751b	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-aeaf-d95c-66df67e7c6ef	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-aeaf-1af1-850758360eff	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-aeaf-3539-25a07bf74eb1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-aeaf-1905-634710cc2f55	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-aeaf-c84b-8a1870286cd6	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-aeaf-5fbc-3d5d6cbdc520	Role-read	Aaa - Vloga - Beri	f
00020000-552c-aeaf-ffa2-a8b32c0cece9	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-aeaf-534e-2c74427eca89	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-aeaf-01eb-9f33f74afea1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-aeaf-b930-ca5f1e7ed8c7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-aeaf-de76-f1f7cf46c06d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-aeaf-b873-1f586fcd9156	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-aeaf-d49a-bbcbdf96df4e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-aeaf-c81d-62be247e8693	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-aeaf-708c-a0cbf5d2f3d9	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-aeaf-ca7b-a1062c60bd4f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-aeaf-5070-f6908581197a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-aeaf-c880-ef2b3db90769	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-aeaf-8522-811215b1642c	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-aeaf-06b2-549ca513e31b	Role-read	Aaa - Vloga - Beri	f
00020000-552c-aeaf-6055-d43bdbbd30b4	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-aeaf-7f69-e628b1953597	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-aeaf-20c8-9362a15b2fde	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-aeaf-d768-b6ae59d1d8d2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-aeaf-f111-de24a51bda35	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-aeaf-c999-add832f14a3a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-aeaf-2c9c-396f3affcf36	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-aeaf-ee75-54a8bd764023	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-aeaf-94f7-81b23f516761	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-aeaf-c234-3bb00e35095c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-aeaf-232e-4f7902250d2d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-aeaf-0163-2288a75a9969	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-aeaf-2766-162a8f1cdc10	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-aeaf-968c-6a173b32d730	Role-read	Aaa - Vloga - Beri	f
00020000-552c-aeaf-8da9-50ac83efa7e2	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-aeaf-5842-e61ff2ccb25b	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-aeaf-7cf8-9998c6f01b44	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-aeaf-af33-4a550e86f614	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-aeaf-b711-0df298e2c92b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-aeaf-77a1-ef16f8a5fa19	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-aeaf-070f-f295fea4bc30	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-aeaf-52d2-fb2086aee1d5	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-aeaf-aa0d-88f2e60e5d76	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-aeaf-3202-0cc777bbeff0	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-aeaf-46fc-8907232cbe95	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-aeaf-33f0-de2c11a85453	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-aeaf-d7b9-ac121f10c71a	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-aeaf-0003-a420c37c4816	Role-read	Aaa - Vloga - Beri	f
00020000-552c-aeaf-fb37-d25394b81461	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-aeaf-f167-11bbec68a592	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-aeaf-8cd8-bbfcefa757e3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-aeaf-a7bb-7e92e32e8a9e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-aeaf-48d5-52250ff91b6b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-aeaf-6d5e-df48016ed89c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-aeaf-0613-c79904587e26	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-aeaf-eb9b-5e453a844f2f	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-aeaf-5c4d-4ffc25d50ca9	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-aeaf-5026-2a28895a5da6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-aeaf-d621-fc8f2bcbc251	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-aeaf-5346-fca85c8cbeb8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-aeaf-5755-0ca4bf7adf48	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-aeaf-4384-878ca657f0bd	Role-read	Aaa - Vloga - Beri	f
00020000-552c-aeaf-9c3a-b0a2eed09a7e	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-aeaf-576f-1039d7e2ab79	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-aeaf-ad9c-b07e97845a29	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-aeaf-4ca5-27a8ae5d1808	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-aeaf-7fb4-cb34173da13e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-aeaf-fd14-e9e8eda9256f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-aeaf-8aad-b4429df812aa	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-aeaf-a155-fd18172c109d	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-aeaf-5755-183fadb65a9c	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-aeaf-394a-bd7df6b3660c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-aeaf-9471-f9f1ac25cedb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-aeaf-2034-1e14fc9346ea	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-aeaf-8dfc-50f1763e20ee	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-aeaf-6877-b831d9162625	Role-read	Aaa - Vloga - Beri	f
00020000-552c-aeaf-54ed-06c78cd74af4	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-aeaf-9557-ac50768686c1	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-aeaf-b039-ef7f81598044	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-aeaf-ed78-64675102c2c6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-aeaf-e7ba-fcedfb97b460	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-aeaf-d106-25ffeeecfedc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-aeaf-cb19-b69909d885f4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-aeaf-6008-1d679310acc8	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-aeaf-f179-18a83aa194ba	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-aeaf-262e-8ea00915a444	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-aeaf-a206-b139a0e7260b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-aeaf-ef38-e7a52da7eee2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-aeaf-5f56-1a38da41b5aa	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-aeaf-2e78-87a974578236	Role-read	Aaa - Vloga - Beri	f
00020000-552c-aeaf-0f4e-f257bea97761	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-aeaf-ff39-80f96c3d23a1	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-aeaf-5e56-b101d728e292	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-aeaf-ba00-db90f3b926d1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-aeaf-9176-f5818e081b38	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-aeaf-2e19-c9b16149e40e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-aeaf-88ec-dcd0f8d50f73	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-aeaf-6ff5-800c7704efa1	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-aeaf-ef18-9ddbd841f242	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-aeaf-ee43-796d5db8116d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-aeaf-f55d-6de3ba18ace7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-aeaf-c446-8082d7fbf0aa	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-aeaf-4f4a-5e058948f82f	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-aeaf-42dd-36873af3ae10	Role-read	Aaa - Vloga - Beri	f
00020000-552c-aeaf-4f1a-6712591a72bd	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-aeaf-9630-4417d158eff6	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-aeaf-2ce0-1507141a2d00	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-aeaf-eb28-e0b422aa7781	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-aeaf-02b5-f9946a499ab0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-aeaf-41a8-97d4832a2ab6	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-aeaf-9586-1e4b7e81ff88	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-aeaf-9023-b535f7168f12	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-aeaf-8bc4-ce680be02869	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-aeaf-fd0e-41206c3fd6f8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-aeaf-1f06-e1e4b128dc7b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-aeaf-d01f-829edca8d53c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-aeaf-0bac-6678f1fdc4a1	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-aeaf-4217-9c836af0b7e3	Role-read	Aaa - Vloga - Beri	f
00020000-552c-aeaf-3a90-ae028d79ff4a	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-aeaf-78e4-903d62be38fb	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-aeaf-afae-694e9f7eb7e1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-aeaf-7433-54f9835552de	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-aeaf-b932-93202be66ea0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-aeaf-f2b8-bada246b0ea4	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-aeaf-268b-7c06635cac28	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-aeaf-2f93-455f91e21511	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-aeaf-9fe1-4eeb9542ef9f	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-aeaf-4843-65ed0cf8fec1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-aeaf-e069-ccec9341811b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-aeaf-b155-08239e8f2df1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-aeaf-653e-c47c67caed29	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-aeaf-de37-ab8bdc09512c	Role-read	Aaa - Vloga - Beri	f
00020000-552c-aeaf-11c6-b9a189616889	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-aeaf-a249-20bf68ba96ac	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-aeaf-4876-be0af58f9753	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-aeaf-d853-3b43e6a2afec	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-aeaf-62ad-c79e04e39666	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-aeaf-300f-9d49a2c0538d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-aeaf-41c8-6f67fec35b6d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-aeaf-479c-064147a94d6a	User-delete	Aaa - Uporabnik - Briši	f
00020000-552c-aeaf-83bd-21d3bb6546fb	User-read	Aaa - Uporabnik - Beri	f
00020000-552c-aeaf-4442-d9823d31f2ef	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552c-aeaf-2752-babc89d96bce	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552c-aeaf-80a1-b4a2ae94f1c4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552c-aeaf-3b1e-58054e782637	Role-delete	Aaa - Vloga - Briši	f
00020000-552c-aeaf-ba04-7ccf2241fc38	Role-read	Aaa - Vloga - Beri	f
00020000-552c-aeaf-8025-eb2f0f89be73	Role-update	Aaa - Vloga - Posodobi	f
00020000-552c-aeaf-c527-1b7a9b63d1d3	Role-create	Aaa - Vloga - Ustvari	f
00020000-552c-aeaf-97c3-98e9522e1738	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552c-aeaf-c5e9-e7e1ec921ae3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552c-aeaf-88d3-c7daf4ca944a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552c-aeaf-ff4a-ffbad0a384ed	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552c-aeaf-dfdf-83facc6c802c	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552c-aeaf-e8a8-7bc35b865bf2	Drzava-read	Seznam držav	f
00020000-552c-aeaf-ed9c-5fc32c70b85c	Drzava-write	Urejanje držav	f
00020000-552c-aeaf-56ff-3c08810d55db	Popa-delete	Poslovni partner - Briši	f
00020000-552c-aeaf-cb22-f7a483122616	Popa-list	Poslovni partner - Beri	f
00020000-552c-aeaf-1aa9-7029cc8ed6b6	Popa-update	Poslovni partner - Posodobi	f
00020000-552c-aeaf-a5ec-196d7ac722ed	Popa-create	Poslovni partner - Ustvari	f
00020000-552c-aeaf-1d4a-e9ef254dff62	Posta-delete	Pošta - Briši	f
00020000-552c-aeaf-c74f-1bf9f2f8323b	Posta-list	Pošta - Beri	f
00020000-552c-aeaf-5b37-9e10007e401b	Posta-update	Pošta - Posodobi	f
00020000-552c-aeaf-a25e-fbcd9cda44e9	Posta-create	Pošta - Ustvari	f
00020000-552c-aeaf-bc5e-d7bd05b7fc1c	PostniNaslov-delete	Poštni naslov - Briši	f
00020000-552c-aeaf-8bc2-e34d6694dcbc	PostniNaslov-list	Poštni naslov - Beri	f
00020000-552c-aeaf-97cc-de639a478a23	PostniNaslov-update	Poštni naslov - Posodobi	f
00020000-552c-aeaf-82dd-7d972a3da6f8	PostniNaslov-create	Poštni naslov - Ustvari	f
\.


--
-- TOC entry 2594 (class 0 OID 194315)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00000000-552c-aeaf-e53d-e8ae3ca12370	00020000-552c-aeaf-e8a8-7bc35b865bf2
00000000-552c-aeaf-e53d-e8ae3ca12370	00020000-552c-aeaf-e84a-3a6272387e8a
00000000-552c-aeaf-8b26-ba7d53f9696c	00020000-552c-aeaf-ed9c-5fc32c70b85c
00000000-552c-aeaf-8b26-ba7d53f9696c	00020000-552c-aeaf-e8a8-7bc35b865bf2
\.


--
-- TOC entry 2622 (class 0 OID 194603)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2626 (class 0 OID 194633)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 194745)
-- Dependencies: 219
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2599 (class 0 OID 194372)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2602 (class 0 OID 194415)
-- Dependencies: 184
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-552c-aeae-dbe6-8cf1aff14eb6	8341	Adlešiči
00050000-552c-aeae-f824-a3ca6d800b1f	5270	Ajdovščina
00050000-552c-aeae-59e8-1cb7cc1647e0	6280	Ankaran/Ancarano
00050000-552c-aeae-62eb-e32dc9c1a597	9253	Apače
00050000-552c-aeae-82cd-df225f2401bd	8253	Artiče
00050000-552c-aeae-417a-daf23c050c08	4275	Begunje na Gorenjskem
00050000-552c-aeae-af04-610ef84546cb	1382	Begunje pri Cerknici
00050000-552c-aeae-20fe-561a75a1cf4b	9231	Beltinci
00050000-552c-aeae-4088-ade25d9296cf	2234	Benedikt
00050000-552c-aeae-8f04-3f6584b7915f	2345	Bistrica ob Dravi
00050000-552c-aeae-9746-9a0714b5c730	3256	Bistrica ob Sotli
00050000-552c-aeae-0bf9-6f192f85e35c	8259	Bizeljsko
00050000-552c-aeae-c8fd-9fc05b573b23	1223	Blagovica
00050000-552c-aeae-dee7-b39abf84c705	8283	Blanca
00050000-552c-aeae-1229-7b121eab40bf	4260	Bled
00050000-552c-aeae-9a2c-9fa2c40c522c	4273	Blejska Dobrava
00050000-552c-aeae-aa90-5ec4d2b6a022	9265	Bodonci
00050000-552c-aeae-3f0d-a67f20d3a2f6	9222	Bogojina
00050000-552c-aeae-864f-e80ba3a581bb	4263	Bohinjska Bela
00050000-552c-aeae-f873-0b4a4549a1e7	4264	Bohinjska Bistrica
00050000-552c-aeae-4591-586341bdaa8b	4265	Bohinjsko jezero
00050000-552c-aeae-1d47-4547dee85eef	1353	Borovnica
00050000-552c-aeae-d8e0-835af0f81269	8294	Boštanj
00050000-552c-aeae-538b-3b52b181f920	5230	Bovec
00050000-552c-aeae-01ec-f97af624ee29	5295	Branik
00050000-552c-aeae-5991-e19d71900abd	3314	Braslovče
00050000-552c-aeae-2b0e-a069774271a8	5223	Breginj
00050000-552c-aeae-2f27-069c50dc6993	8280	Brestanica
00050000-552c-aeae-7f9b-bc5b5f373ccc	2354	Bresternica
00050000-552c-aeae-e637-ba7d0addb1e5	4243	Brezje
00050000-552c-aeae-9640-1f003f6ddd34	1351	Brezovica pri Ljubljani
00050000-552c-aeae-2419-a1a501cab67b	8250	Brežice
00050000-552c-aeae-cdac-2113333b6dba	4210	Brnik - Aerodrom
00050000-552c-aeae-cf99-419459f3ba6a	8321	Brusnice
00050000-552c-aeae-71cd-33f19c526960	3255	Buče
00050000-552c-aeae-a8ec-411d83e6aafa	8276	Bučka 
00050000-552c-aeae-0db9-74a187599d00	9261	Cankova
00050000-552c-aeae-b205-96ca0012e7a9	3000	Celje 
00050000-552c-aeae-526d-56a926b4859a	3001	Celje - poštni predali
00050000-552c-aeae-ac7f-a15b8bb7b474	4207	Cerklje na Gorenjskem
00050000-552c-aeae-724f-21ca07ac7b2d	8263	Cerklje ob Krki
00050000-552c-aeae-3972-800845d9d2ca	1380	Cerknica
00050000-552c-aeae-2441-a47d2442f999	5282	Cerkno
00050000-552c-aeae-759e-c4da233329d9	2236	Cerkvenjak
00050000-552c-aeae-bca7-6f5dcdbea354	2215	Ceršak
00050000-552c-aeae-b4b0-1a3af9eed57e	2326	Cirkovce
00050000-552c-aeae-e883-74541a0ff05a	2282	Cirkulane
00050000-552c-aeae-2d28-ed881834ecb2	5273	Col
00050000-552c-aeae-dde4-98f267a463fa	8251	Čatež ob Savi
00050000-552c-aeae-80a1-9a999531cf01	1413	Čemšenik
00050000-552c-aeae-281d-8d0cbe6697ab	5253	Čepovan
00050000-552c-aeae-7793-6c4ff5954a2c	9232	Črenšovci
00050000-552c-aeae-a472-c6aed74ba97b	2393	Črna na Koroškem
00050000-552c-aeae-ff84-b54571e38aa9	6275	Črni Kal
00050000-552c-aeae-5f27-49bf9cfd84ce	5274	Črni Vrh nad Idrijo
00050000-552c-aeae-396e-faaa82125878	5262	Črniče
00050000-552c-aeae-1af2-2f7010b21250	8340	Črnomelj
00050000-552c-aeae-2252-4d5143717df3	6271	Dekani
00050000-552c-aeae-971c-d1d591407472	5210	Deskle
00050000-552c-aeae-bd57-f96ec344a1c9	2253	Destrnik
00050000-552c-aeae-0a62-f9494ee97bba	6215	Divača
00050000-552c-aeae-16e6-937bd8f6bdf8	1233	Dob
00050000-552c-aeae-937e-f4b7319b4fa6	3224	Dobje pri Planini
00050000-552c-aeae-ffd1-98d4a8f2c392	8257	Dobova
00050000-552c-aeae-003f-954a606dd054	1423	Dobovec
00050000-552c-aeae-c49f-07aedb21b725	5263	Dobravlje
00050000-552c-aeae-8f7b-559bb424e243	3204	Dobrna
00050000-552c-aeae-8a1e-ffcf215ee384	8211	Dobrnič
00050000-552c-aeae-432e-2fabb3cfacf7	1356	Dobrova
00050000-552c-aeae-7822-e539a4a3b98c	9223	Dobrovnik/Dobronak 
00050000-552c-aeae-73a5-5f8ae3e5a0d0	5212	Dobrovo v Brdih
00050000-552c-aeae-cc2c-fbf082f5e8e9	1431	Dol pri Hrastniku
00050000-552c-aeae-750f-f4325116a9c9	1262	Dol pri Ljubljani
00050000-552c-aeae-b101-97bf4f3c2158	1273	Dole pri Litiji
00050000-552c-aeae-c4df-69f3a761d9c5	1331	Dolenja vas
00050000-552c-aeae-0c29-f6332931b929	8350	Dolenjske Toplice
00050000-552c-aeae-62ed-1b947967df65	1230	Domžale
00050000-552c-aeae-730d-e9b801fb50ba	2252	Dornava
00050000-552c-aeae-c38c-ffdeca47ab48	5294	Dornberk
00050000-552c-aeae-2704-00b7206ddb0e	1319	Draga
00050000-552c-aeae-cd5f-923d4778cf99	8343	Dragatuš
00050000-552c-aeae-6546-0de8bd367add	3222	Dramlje
00050000-552c-aeae-2546-99c2c1108b39	2370	Dravograd
00050000-552c-aeae-56ae-a7ddbe0e1ae9	4203	Duplje
00050000-552c-aeae-8670-4cfe7b64036b	6221	Dutovlje
00050000-552c-aeae-96e5-f532d193f2a5	8361	Dvor
00050000-552c-aeae-9952-cd00d4b47ac3	2343	Fala
00050000-552c-aeae-d824-283ba566a522	9208	Fokovci
00050000-552c-aeae-e9af-39da00a5fc46	2313	Fram
00050000-552c-aeae-239c-9f12974e8133	3213	Frankolovo
00050000-552c-aeae-3bd4-dc2a09601217	1274	Gabrovka
00050000-552c-aeae-dc34-5fd735bd1df7	8254	Globoko
00050000-552c-aeae-ee0e-044cc0ba3ded	5275	Godovič
00050000-552c-aeae-aa2c-78594588c28f	4204	Golnik
00050000-552c-aeae-3534-dcc07c7382d1	3303	Gomilsko
00050000-552c-aeae-a0e0-64f01458b8e9	4224	Gorenja vas
00050000-552c-aeae-dec2-b02c40bc3282	3263	Gorica pri Slivnici
00050000-552c-aeae-12aa-42191ddca45f	2272	Gorišnica
00050000-552c-aeae-f54f-b134c7320801	9250	Gornja Radgona
00050000-552c-aeae-995c-3de32632a161	3342	Gornji Grad
00050000-552c-aeae-eda7-ddf1d1979bfc	4282	Gozd Martuljek
00050000-552c-aeae-f573-247f85b6ca11	6272	Gračišče
00050000-552c-aeae-cee5-613dc77943f7	9264	Grad
00050000-552c-aeae-943e-559c832b551a	8332	Gradac
00050000-552c-aeae-fccb-3a830009ca7c	1384	Grahovo
00050000-552c-aeae-2923-80e7f6669248	5242	Grahovo ob Bači
00050000-552c-aeae-9386-0321ef1f29e7	5251	Grgar
00050000-552c-aeae-48fb-d219df26efe4	3302	Griže
00050000-552c-aeae-d5ec-167cc4a3ecd5	3231	Grobelno
00050000-552c-aeae-7910-bae1e13b108a	1290	Grosuplje
00050000-552c-aeae-7774-5030e2313e56	2288	Hajdina
00050000-552c-aeae-2f71-c9ccdcf8e19d	8362	Hinje
00050000-552c-aeae-b587-2c88084ce983	2311	Hoče
00050000-552c-aeae-b799-f8a9557dbdc7	9205	Hodoš/Hodos
00050000-552c-aeae-bb61-4dbe09ef98f4	1354	Horjul
00050000-552c-aeae-0bbc-bba4e628eea0	1372	Hotedršica
00050000-552c-aeae-a3f3-8c8e9c989779	1430	Hrastnik
00050000-552c-aeae-9d0c-f34f07e88b28	6225	Hruševje
00050000-552c-aeae-98ab-63e4c6087647	4276	Hrušica
00050000-552c-aeae-2eca-e8ce413777a7	5280	Idrija
00050000-552c-aeae-3e43-0c3f660e0a64	1292	Ig
00050000-552c-aeae-abf6-34561159ed39	6250	Ilirska Bistrica
00050000-552c-aeae-afc3-0796784965ed	6251	Ilirska Bistrica-Trnovo
00050000-552c-aeae-fffc-e831d0c29e14	1295	Ivančna Gorica
00050000-552c-aeae-338a-fc8c405d5d41	2259	Ivanjkovci
00050000-552c-aeae-8090-61f547e32d53	1411	Izlake
00050000-552c-aeae-40c6-29268823723c	6310	Izola/Isola
00050000-552c-aeae-e795-9d4fc9f99ccc	2222	Jakobski Dol
00050000-552c-aeae-15e5-5bdb3e679830	2221	Jarenina
00050000-552c-aeae-4880-717b6bd9b102	6254	Jelšane
00050000-552c-aeae-8d9e-6af04ec01aea	4270	Jesenice
00050000-552c-aeae-b25f-326add0c60b3	8261	Jesenice na Dolenjskem
00050000-552c-aeae-2567-2b348d20f65c	3273	Jurklošter
00050000-552c-aeae-d26e-c75abd8f6afa	2223	Jurovski Dol
00050000-552c-aeae-1d0e-7d731c86dd39	2256	Juršinci
00050000-552c-aeae-39d9-ab737f93a178	5214	Kal nad Kanalom
00050000-552c-aeae-a910-6a9cdd4eba5b	3233	Kalobje
00050000-552c-aeae-04a1-a378ba54414b	4246	Kamna Gorica
00050000-552c-aeae-22eb-4509163c489a	2351	Kamnica
00050000-552c-aeae-ee2c-bf9a099f6e1a	1241	Kamnik
00050000-552c-aeae-a537-aa8798d60991	5213	Kanal
00050000-552c-aeae-6992-ed2a14b3a1cc	8258	Kapele
00050000-552c-aeae-c93c-27008a816e5d	2362	Kapla
00050000-552c-aeae-3add-43d3d70c716c	2325	Kidričevo
00050000-552c-aeae-d000-332b7ead7575	1412	Kisovec
00050000-552c-aeae-4403-c22591069431	6253	Knežak
00050000-552c-aeae-36e8-4f0867bb7b3a	5222	Kobarid
00050000-552c-aeae-58d1-b866de92ed9d	9227	Kobilje
00050000-552c-aeae-c733-e25a16fe365e	1330	Kočevje
00050000-552c-aeae-7570-4169dc633585	1338	Kočevska Reka
00050000-552c-aeae-1e37-0cc9630d9065	2276	Kog
00050000-552c-aeae-8389-12a025f3321f	5211	Kojsko
00050000-552c-aeae-c1f7-fa556c931cbd	6223	Komen
00050000-552c-aeae-6ae1-67fb4a1d2f88	1218	Komenda
00050000-552c-aeae-9192-6ae3711ce3ce	6000	Koper/Capodistria 
00050000-552c-aeae-240f-586ba714fb00	6001	Koper/Capodistria - poštni predali
00050000-552c-aeae-74f9-d37264cd65ed	8282	Koprivnica
00050000-552c-aeae-0744-87b3d42bb74b	5296	Kostanjevica na Krasu
00050000-552c-aeae-9c25-51694c0cbeef	8311	Kostanjevica na Krki
00050000-552c-aeae-694e-cf83a26058c8	1336	Kostel
00050000-552c-aeae-8f70-f1f877d7e942	6256	Košana
00050000-552c-aeae-11a5-1b66da8fcc5a	2394	Kotlje
00050000-552c-aeae-cbac-2e2905d1dd83	6240	Kozina
00050000-552c-aeae-408d-b0d884bce3d2	3260	Kozje
00050000-552c-aeae-f51b-6d1dfff8cdcf	4000	Kranj 
00050000-552c-aeae-55ca-e878b4c4b9df	4001	Kranj - poštni predali
00050000-552c-aeae-7ea7-b1f3a3c38f78	4280	Kranjska Gora
00050000-552c-aeae-07f8-021cf3862969	1281	Kresnice
00050000-552c-aeae-083e-7e3de5b6a6f0	4294	Križe
00050000-552c-aeae-c8f5-7107f06e67fb	9206	Križevci
00050000-552c-aeae-2da1-ead1322a2cf8	9242	Križevci pri Ljutomeru
00050000-552c-aeae-736c-f9640128fc32	1301	Krka
00050000-552c-aeae-eb93-031eec4073be	8296	Krmelj
00050000-552c-aeae-97ed-7cf449a2737f	4245	Kropa
00050000-552c-aeae-50b7-54d7377ecbee	8262	Krška vas
00050000-552c-aeae-c0cf-35e7a4007803	8270	Krško
00050000-552c-aeae-0c84-e61dee407ad5	9263	Kuzma
00050000-552c-aeae-f88a-2e5b104dc0b5	2318	Laporje
00050000-552c-aeae-c755-4d0a7cd54450	3270	Laško
00050000-552c-aeae-7997-1a190749c69f	1219	Laze v Tuhinju
00050000-552c-aeae-4cab-9c21554374cd	2230	Lenart v Slovenskih goricah
00050000-552c-aeae-ef83-b983f40af61e	9220	Lendava/Lendva
00050000-552c-aeae-183f-72b83a3e0074	4248	Lesce
00050000-552c-aeae-a325-fb22a2e06c62	3261	Lesično
00050000-552c-aeae-e34a-9558fac6aedd	8273	Leskovec pri Krškem
00050000-552c-aeae-bd66-337dfc5e3b4f	2372	Libeliče
00050000-552c-aeae-b063-a9b9bde79bee	2341	Limbuš
00050000-552c-aeae-7785-8a449840b304	1270	Litija
00050000-552c-aeae-ac21-d51d2346aa35	3202	Ljubečna
00050000-552c-aeae-e46a-976ef60be0f1	1000	Ljubljana 
00050000-552c-aeae-cce8-4afc6d7e15db	1001	Ljubljana - poštni predali
00050000-552c-aeae-8b8a-6486b61daacc	1231	Ljubljana - Črnuče
00050000-552c-aeae-c996-0d4254c5ef07	1261	Ljubljana - Dobrunje
00050000-552c-aeae-99ab-572d3dbae0b0	1260	Ljubljana - Polje
00050000-552c-aeae-068d-7312c5114b72	1210	Ljubljana - Šentvid
00050000-552c-aeae-8f81-65c0c13dad1b	1211	Ljubljana - Šmartno
00050000-552c-aeae-7330-71c81dd68403	3333	Ljubno ob Savinji
00050000-552c-aeae-2352-859e8a1ff4ab	9240	Ljutomer
00050000-552c-aeae-0263-0dc53ee69e88	3215	Loče
00050000-552c-aeae-9cf7-fe5e47a9a4e4	5231	Log pod Mangartom
00050000-552c-aeae-deb6-28a5364f7111	1358	Log pri Brezovici
00050000-552c-aeae-a766-acbf11aeea47	1370	Logatec
00050000-552c-aeae-4ef4-70af81019b28	1371	Logatec
00050000-552c-aeae-475f-5bcc1911c3a5	1434	Loka pri Zidanem Mostu
00050000-552c-aeae-af4f-baf043b1ffed	3223	Loka pri Žusmu
00050000-552c-aeae-293d-a1359be44704	6219	Lokev
00050000-552c-aeae-d36b-e2b9df57e4f7	1318	Loški Potok
00050000-552c-aeae-2771-2f1c5ff306d1	2324	Lovrenc na Dravskem polju
00050000-552c-aeae-3a87-176924b4925f	2344	Lovrenc na Pohorju
00050000-552c-aeae-aee4-a6856a9d522e	3334	Luče
00050000-552c-aeae-1a47-7b62ba5f98e4	1225	Lukovica
00050000-552c-aeae-77bd-2799280dc2ae	9202	Mačkovci
00050000-552c-aeae-36d1-2ab856b70db1	2322	Majšperk
00050000-552c-aeae-0f7f-383753c797c6	2321	Makole
00050000-552c-aeae-7311-20ef2fbdc25e	9243	Mala Nedelja
00050000-552c-aeae-5d1d-06052573a0ab	2229	Malečnik
00050000-552c-aeae-2a7c-a409789fad8a	6273	Marezige
00050000-552c-aeae-706b-e86b26ef9a8a	2000	Maribor 
00050000-552c-aeae-b09f-2daf5453233f	2001	Maribor - poštni predali
00050000-552c-aeae-36bd-2f0de00cd5e1	2206	Marjeta na Dravskem polju
00050000-552c-aeae-f0fc-6c623c4bd80b	2281	Markovci
00050000-552c-aeae-03f2-98c5dc4430f6	9221	Martjanci
00050000-552c-aeae-6e6b-99334e451c49	6242	Materija
00050000-552c-aeae-a722-c389815883ac	4211	Mavčiče
00050000-552c-aeae-430b-5ce5f8ad924f	1215	Medvode
00050000-552c-aeae-389e-fa4bc00346e5	1234	Mengeš
00050000-552c-aeae-ff21-bcc10b07ea20	8330	Metlika
00050000-552c-aeae-e390-04f46ed1fce2	2392	Mežica
00050000-552c-aeae-05ee-e839270eb2c8	2204	Miklavž na Dravskem polju
00050000-552c-aeae-0277-8e3bf6a97554	2275	Miklavž pri Ormožu
00050000-552c-aeae-7cc3-a5f4521ce0c2	5291	Miren
00050000-552c-aeae-0e46-4ee9b4c13907	8233	Mirna
00050000-552c-aeae-8047-02d1551c4a54	8216	Mirna Peč
00050000-552c-aeae-e597-097ec0db7167	2382	Mislinja
00050000-552c-aeae-8c71-ee488e9862ed	4281	Mojstrana
00050000-552c-aeae-01fc-1f3b102a343b	8230	Mokronog
00050000-552c-aeae-852c-b6efa188da39	1251	Moravče
00050000-552c-aeae-932e-de08936cba3b	9226	Moravske Toplice
00050000-552c-aeae-c4fa-f9b7cc60d2bf	5216	Most na Soči
00050000-552c-aeae-a84c-d1edab28c6fb	1221	Motnik
00050000-552c-aeae-f0e3-ffcb8bb03d1f	3330	Mozirje
00050000-552c-aeae-2ed4-18cef258139c	9000	Murska Sobota 
00050000-552c-aeae-e1aa-a21963c3759d	9001	Murska Sobota - poštni predali
00050000-552c-aeae-b7c7-7c1539820055	2366	Muta
00050000-552c-aeae-710f-351539e83166	4202	Naklo
00050000-552c-aeae-9206-9bd05304598d	3331	Nazarje
00050000-552c-aeae-e09b-ca40e8a8316d	1357	Notranje Gorice
00050000-552c-aeae-b9b4-c39aefdf01f4	3203	Nova Cerkev
00050000-552c-aeae-0dbe-4517f15f79be	5000	Nova Gorica 
00050000-552c-aeae-6cfa-4742f79dd45a	5001	Nova Gorica - poštni predali
00050000-552c-aeae-b0b4-c6ae9a734b39	1385	Nova vas
00050000-552c-aeae-2e9b-949075046935	8000	Novo mesto
00050000-552c-aeae-3465-aac53ddd1276	8001	Novo mesto - poštni predali
00050000-552c-aeae-eea0-b8a181e300fd	6243	Obrov
00050000-552c-aeae-429b-3f1ae53104a6	9233	Odranci
00050000-552c-aeae-30e7-8e29181b18f6	2317	Oplotnica
00050000-552c-aeae-7f72-2305d4f992d8	2312	Orehova vas
00050000-552c-aeae-c852-4ea9eacc2bf1	2270	Ormož
00050000-552c-aeae-d73e-25e1a939d0c2	1316	Ortnek
00050000-552c-aeae-d498-0804fe720de3	1337	Osilnica
00050000-552c-aeae-750b-7cc79d76351d	8222	Otočec
00050000-552c-aeae-4794-cf3e991d3556	2361	Ožbalt
00050000-552c-aeae-a58c-b2c0b60442e2	2231	Pernica
00050000-552c-aeae-c702-3bbec6e43cc4	2211	Pesnica pri Mariboru
00050000-552c-aeae-c162-f08cba1ebef2	9203	Petrovci
00050000-552c-aeae-3717-3612d286b7d1	3301	Petrovče
00050000-552c-aeae-e424-49bc19eb6a78	6330	Piran/Pirano
00050000-552c-aeae-89b1-97bfeb9adfb4	8255	Pišece
00050000-552c-aeae-c84a-8ce29a479627	6257	Pivka
00050000-552c-aeae-27ec-3a3efd62a23d	6232	Planina
00050000-552c-aeae-402a-c22ccd1ae34e	3225	Planina pri Sevnici
00050000-552c-aeae-8efa-11b6278bfae5	6276	Pobegi
00050000-552c-aeae-fabf-ba1fca2e030d	8312	Podbočje
00050000-552c-aeae-1a60-b7f78667aa6f	5243	Podbrdo
00050000-552c-aeae-5600-fbd194e08db6	3254	Podčetrtek
00050000-552c-aeae-017a-125e3cfd0a2d	2273	Podgorci
00050000-552c-aeae-4566-9665d3eced27	6216	Podgorje
00050000-552c-aeae-a89c-00d4b019edb2	2381	Podgorje pri Slovenj Gradcu
00050000-552c-aeae-e8e7-1895e6403cf7	6244	Podgrad
00050000-552c-aeae-28b7-b1ac85803533	1414	Podkum
00050000-552c-aeae-a4a6-81921e1da26e	2286	Podlehnik
00050000-552c-aeae-28fc-0cf6a2e1e276	5272	Podnanos
00050000-552c-aeae-2d9c-a50d61a8762e	4244	Podnart
00050000-552c-aeae-2cbe-0b7e06a8f27b	3241	Podplat
00050000-552c-aeae-1403-a20c19b26e81	3257	Podsreda
00050000-552c-aeae-59b4-271943e40fed	2363	Podvelka
00050000-552c-aeae-ae68-d76b3a14b2a3	2208	Pohorje
00050000-552c-aeae-c0f3-fae7eb0c3066	2257	Polenšak
00050000-552c-aeae-9b00-3968e175d48d	1355	Polhov Gradec
00050000-552c-aeae-e54a-b95ba4c48fda	4223	Poljane nad Škofjo Loko
00050000-552c-aeae-e3c5-ac915d561e30	2319	Poljčane
00050000-552c-aeae-9e3b-8d24a759755e	1272	Polšnik
00050000-552c-aeae-d3f4-1b4172e19410	3313	Polzela
00050000-552c-aeae-aeed-43bcf57e6ba9	3232	Ponikva
00050000-552c-aeae-7f2b-306952b95f02	6320	Portorož/Portorose
00050000-552c-aeae-121f-1d82ae3266f2	6230	Postojna
00050000-552c-aeae-b9af-21dbf02cd47b	2331	Pragersko
00050000-552c-aeae-be85-67770a531a5c	3312	Prebold
00050000-552c-aeae-54c0-a0761a92876a	4205	Preddvor
00050000-552c-aeae-cb54-99fed3dc9e5f	6255	Prem
00050000-552c-aeae-cb41-f9d16776b67f	1352	Preserje
00050000-552c-aeae-400f-e45736361a15	6258	Prestranek
00050000-552c-aeae-28d3-b3132fd16c73	2391	Prevalje
00050000-552c-aeae-a650-31b71bf548bb	3262	Prevorje
00050000-552c-aeae-17af-4ff388c801d5	1276	Primskovo 
00050000-552c-aeae-8795-06a658c331ab	3253	Pristava pri Mestinju
00050000-552c-aeae-fc8f-4cfcf729b5fe	9207	Prosenjakovci/Partosfalva
00050000-552c-aeae-311f-b9f8f975b8ff	5297	Prvačina
00050000-552c-aeae-e81b-fc5754b7bc85	2250	Ptuj
00050000-552c-aeae-0082-cb22bdb18511	2323	Ptujska Gora
00050000-552c-aeae-5d40-6fa73906cb87	9201	Puconci
00050000-552c-aeae-29d9-7138bf93fe4d	2327	Rače
00050000-552c-aeae-c58e-209d50d88678	1433	Radeče
00050000-552c-aeae-1de0-08df4f767d06	9252	Radenci
00050000-552c-aeae-5426-8d0d62f2853f	2360	Radlje ob Dravi
00050000-552c-aeae-d346-946160efaadf	1235	Radomlje
00050000-552c-aeae-5403-1f810ce36078	4240	Radovljica
00050000-552c-aeae-9f68-bd7210e0f15c	8274	Raka
00050000-552c-aeae-6af2-519e85d5769d	1381	Rakek
00050000-552c-aeae-c3cd-f3a1068cb767	4283	Rateče - Planica
00050000-552c-aeae-7460-c1f184ff8feb	2390	Ravne na Koroškem
00050000-552c-aeae-c68a-83767611ba52	9246	Razkrižje
00050000-552c-aeae-ffa7-15de8013f65d	3332	Rečica ob Savinji
00050000-552c-aeae-9cab-e755ab69d800	5292	Renče
00050000-552c-aeae-c769-5cd21dc05f13	1310	Ribnica
00050000-552c-aeae-b189-08b39f6cd8cb	2364	Ribnica na Pohorju
00050000-552c-aeae-1b8c-f74afcb41160	3272	Rimske Toplice
00050000-552c-aeae-cf18-99f45489f8b3	1314	Rob
00050000-552c-aeae-4a13-dcdf1a2fd6f3	5215	Ročinj
00050000-552c-aeae-2cdd-40dfe2ac77b2	3250	Rogaška Slatina
00050000-552c-aeae-3d84-577e6b226b41	9262	Rogašovci
00050000-552c-aeae-dbda-e300992cb312	3252	Rogatec
00050000-552c-aeae-6986-53e4a05a2336	1373	Rovte
00050000-552c-aeae-774f-9b99b41c8350	2342	Ruše
00050000-552c-aeae-7b93-e4b68aed7a79	1282	Sava
00050000-552c-aeae-5833-9d371777cce6	6333	Sečovlje/Sicciole
00050000-552c-aeae-ffb7-f18e0487f1b7	4227	Selca
00050000-552c-aeae-94a2-66c069ed6f76	2352	Selnica ob Dravi
00050000-552c-aeae-41a3-f2d1d378b231	8333	Semič
00050000-552c-aeae-83e0-0d03208bd70b	8281	Senovo
00050000-552c-aeae-0e01-98b83ababcb6	6224	Senožeče
00050000-552c-aeae-5d5a-491b47005d75	8290	Sevnica
00050000-552c-aeae-8fed-7c793857b134	6210	Sežana
00050000-552c-aeae-96c4-c97622dd4dd9	2214	Sladki Vrh
00050000-552c-aeae-3d31-a55a30bc8da3	5283	Slap ob Idrijci
00050000-552c-aeae-7d33-67cf2cc90c9f	2380	Slovenj Gradec
00050000-552c-aeae-62ff-81b3d56d9240	2310	Slovenska Bistrica
00050000-552c-aeae-dc86-1b6b6f72248e	3210	Slovenske Konjice
00050000-552c-aeae-2085-044e0a9c7e7a	1216	Smlednik
00050000-552c-aeae-32e5-1c9b4851cf30	5232	Soča
00050000-552c-aeae-a139-164c6fe1e56b	1317	Sodražica
00050000-552c-aeae-881c-8c6d50a146dd	3335	Solčava
00050000-552c-aeae-79e6-ac5d63221d3d	5250	Solkan
00050000-552c-aeae-d5d6-4866f7934781	4229	Sorica
00050000-552c-aeae-1fa2-82f2e90cb7b3	4225	Sovodenj
00050000-552c-aeae-39d4-31e25c640b96	5281	Spodnja Idrija
00050000-552c-aeae-5f73-e786c297904d	2241	Spodnji Duplek
00050000-552c-aeae-6640-feca121468fd	9245	Spodnji Ivanjci
00050000-552c-aeae-c4b3-f8452e668ac0	2277	Središče ob Dravi
00050000-552c-aeae-d6e4-d2e3aa4b1821	4267	Srednja vas v Bohinju
00050000-552c-aeae-e3cd-6f0e940d2557	8256	Sromlje 
00050000-552c-aeae-de51-8692e73f73d2	5224	Srpenica
00050000-552c-aeae-8afe-55422ba6cb6c	1242	Stahovica
00050000-552c-aeae-00aa-267991a57f5c	1332	Stara Cerkev
00050000-552c-aeae-fe9b-c29ea3d0af31	8342	Stari trg ob Kolpi
00050000-552c-aeae-0e69-3c9952cf0882	1386	Stari trg pri Ložu
00050000-552c-aeae-562d-db01b26e32a8	2205	Starše
00050000-552c-aeae-d83f-7593884faae3	2289	Stoperce
00050000-552c-aeae-180b-9544625a0636	8322	Stopiče
00050000-552c-aeae-ac59-392e65a1eb52	3206	Stranice
00050000-552c-aeae-6599-56e535f60e56	8351	Straža
00050000-552c-aeae-fc6d-733e00f64bc0	1313	Struge
00050000-552c-aeae-4b50-986fe5156339	8293	Studenec
00050000-552c-aeae-83e1-82cd5996870e	8331	Suhor
00050000-552c-aeae-f806-7a0632072c9c	2233	Sv. Ana v Slovenskih goricah
00050000-552c-aeae-169c-627719bbc38a	2235	Sv. Trojica v Slovenskih goricah
00050000-552c-aeae-9ea9-f00c1588f8b9	2353	Sveti Duh na Ostrem Vrhu
00050000-552c-aeae-37c0-0df6222fc4af	9244	Sveti Jurij ob Ščavnici
00050000-552c-aeae-1ce7-daccf5377c32	3264	Sveti Štefan
00050000-552c-aeae-157a-1387b8514821	2258	Sveti Tomaž
00050000-552c-aeae-40c9-2c64a559cfb8	9204	Šalovci
00050000-552c-aeae-d9c4-bc2282a7573b	5261	Šempas
00050000-552c-aeae-d7ee-2532cb9bf43c	5290	Šempeter pri Gorici
00050000-552c-aeae-12d4-895f7d6a19ae	3311	Šempeter v Savinjski dolini
00050000-552c-aeae-791c-fd888ac2f1b3	4208	Šenčur
00050000-552c-aeae-f303-026eae70f7b3	2212	Šentilj v Slovenskih goricah
00050000-552c-aeae-7ef0-a501dfa5fcbe	8297	Šentjanž
00050000-552c-aeae-a1f9-7065d512e99e	2373	Šentjanž pri Dravogradu
00050000-552c-aeae-3c48-0b957025ed92	8310	Šentjernej
00050000-552c-aeae-9282-e615ddfae807	3230	Šentjur
00050000-552c-aeae-ac9e-ff3d59669b4c	3271	Šentrupert
00050000-552c-aeae-ac13-824fd135f4e0	8232	Šentrupert
00050000-552c-aeae-7d1e-69f20bc9c81f	1296	Šentvid pri Stični
00050000-552c-aeae-6e02-3e7737fbf59c	8275	Škocjan
00050000-552c-aeae-4dbc-0eb47cf94134	6281	Škofije
00050000-552c-aeae-fc85-44d817a395c8	4220	Škofja Loka
00050000-552c-aeae-2f85-71eec66881b2	3211	Škofja vas
00050000-552c-aeae-2665-e18464e8c227	1291	Škofljica
00050000-552c-aeae-b1ed-ab377a9cad3d	6274	Šmarje
00050000-552c-aeae-4825-5b9d6b31de60	1293	Šmarje - Sap
00050000-552c-aeae-397a-f2104855c3fb	3240	Šmarje pri Jelšah
00050000-552c-aeae-6aee-7460a0838036	8220	Šmarješke Toplice
00050000-552c-aeae-23d8-e6e5bf1bc487	2315	Šmartno na Pohorju
00050000-552c-aeae-5d2b-cd35f471b6ad	3341	Šmartno ob Dreti
00050000-552c-aeae-4e7c-42b20d064a13	3327	Šmartno ob Paki
00050000-552c-aeae-3654-60fb6af84ca5	1275	Šmartno pri Litiji
00050000-552c-aeae-8651-e47d2dda32ed	2383	Šmartno pri Slovenj Gradcu
00050000-552c-aeae-dfa4-ef9cd51ea232	3201	Šmartno v Rožni dolini
00050000-552c-aeae-eb8c-a6ab9a06b49f	3325	Šoštanj
00050000-552c-aeae-a9b3-9859c08fc0ce	6222	Štanjel
00050000-552c-aeae-5aba-c25f9e8bba9f	3220	Štore
00050000-552c-aeae-d4b8-4ae27579909c	3304	Tabor
00050000-552c-aeae-bb5c-69f9b196ee24	3221	Teharje
00050000-552c-aeae-7513-ab90eda724f5	9251	Tišina
00050000-552c-aeae-c25f-2b8adb963d6b	5220	Tolmin
00050000-552c-aeae-0a86-56c59fe7c4e0	3326	Topolšica
00050000-552c-aeae-0bd5-1f1616218c0b	2371	Trbonje
00050000-552c-aeae-e981-1b1e7185454d	1420	Trbovlje
00050000-552c-aeae-012a-372c2cef8f54	8231	Trebelno 
00050000-552c-aeae-4bc5-121f411a6f51	8210	Trebnje
00050000-552c-aeae-55e2-35217ab59cca	5252	Trnovo pri Gorici
00050000-552c-aeae-1539-f3045827a0a3	2254	Trnovska vas
00050000-552c-aeae-fe55-aad6e01c321b	1222	Trojane
00050000-552c-aeae-9d1f-cb5b32ed09f7	1236	Trzin
00050000-552c-aeae-33ff-172d6e22f385	4290	Tržič
00050000-552c-aeae-132a-5b7dcd4899ab	8295	Tržišče
00050000-552c-aeae-1fc4-a5dc5fc32fcd	1311	Turjak
00050000-552c-aeae-9130-9ff978428510	9224	Turnišče
00050000-552c-aeae-5f47-ea221df47bc9	8323	Uršna sela
00050000-552c-aeae-4c12-f2eed2082f37	1252	Vače
00050000-552c-aeae-d9cd-936f11a7331a	3320	Velenje 
00050000-552c-aeae-cbfa-a6a689e91d47	3322	Velenje - poštni predali
00050000-552c-aeae-bd99-af49abe4efac	8212	Velika Loka
00050000-552c-aeae-168b-8798c19a5632	2274	Velika Nedelja
00050000-552c-aeae-7fbe-5e1b67d78ada	9225	Velika Polana
00050000-552c-aeae-847d-73815a98b428	1315	Velike Lašče
00050000-552c-aeae-c901-5dc6f37adfdb	8213	Veliki Gaber
00050000-552c-aeae-aaea-fcd37df45d4f	9241	Veržej
00050000-552c-aeae-1c43-45d1a139e58a	1312	Videm - Dobrepolje
00050000-552c-aeae-a8c6-92d49a8fbffa	2284	Videm pri Ptuju
00050000-552c-aeae-9050-5f5ebc7fa9cb	8344	Vinica
00050000-552c-aeae-bea2-8d4e4e750ea9	5271	Vipava
00050000-552c-aeae-539f-91505fe3f0ae	4212	Visoko
00050000-552c-aeae-5832-548d2cd87561	1294	Višnja Gora
00050000-552c-aeae-7e2e-af7500e00105	3205	Vitanje
00050000-552c-aeae-8e92-1e39c431ccca	2255	Vitomarci
00050000-552c-aeae-d7d1-4986a4d3ab0c	1217	Vodice
00050000-552c-aeae-94ed-59952de0d2e1	3212	Vojnik\t
00050000-552c-aeae-da43-53da5cbc02fb	5293	Volčja Draga
00050000-552c-aeae-7a58-c65269c901a8	2232	Voličina
00050000-552c-aeae-c9f4-d413061b3219	3305	Vransko
00050000-552c-aeae-c632-34be735ef6ea	6217	Vremski Britof
00050000-552c-aeae-7392-579383915a74	1360	Vrhnika
00050000-552c-aeae-7e71-77d95b453c6e	2365	Vuhred
00050000-552c-aeae-7d35-ada49eef3000	2367	Vuzenica
00050000-552c-aeae-aa14-0ae16b6580bb	8292	Zabukovje 
00050000-552c-aeae-42bc-2c9bd748b956	1410	Zagorje ob Savi
00050000-552c-aeae-7fcd-f0ef3b4985d8	1303	Zagradec
00050000-552c-aeae-1f3b-adf88f95b5fa	2283	Zavrč
00050000-552c-aeae-f615-025410d16bd7	8272	Zdole 
00050000-552c-aeae-ae7f-875c4b35182e	4201	Zgornja Besnica
00050000-552c-aeae-348f-0eafb16617a2	2242	Zgornja Korena
00050000-552c-aeae-6da0-7a3dd1277adf	2201	Zgornja Kungota
00050000-552c-aeae-d771-ffa95a4fc6b8	2316	Zgornja Ložnica
00050000-552c-aeae-5e9b-4fda72381ffc	2314	Zgornja Polskava
00050000-552c-aeae-3c57-8f52e5f7929d	2213	Zgornja Velka
00050000-552c-aeae-93f2-6e8776eff3b4	4247	Zgornje Gorje
00050000-552c-aeae-4a12-ba8de103c352	4206	Zgornje Jezersko
00050000-552c-aeae-7600-f244a628b7c6	2285	Zgornji Leskovec
00050000-552c-aeae-7b60-007eadf0bb1c	1432	Zidani Most
00050000-552c-aeae-42d0-e4990fe9a05a	3214	Zreče
00050000-552c-aeae-8c33-228d7e88b447	4209	Žabnica
00050000-552c-aeae-056d-7c3dc46b3b53	3310	Žalec
00050000-552c-aeae-06d4-63791a357895	4228	Železniki
00050000-552c-aeae-3f97-345309394c53	2287	Žetale
00050000-552c-aeae-acc1-a00f1f4bbe84	4226	Žiri
00050000-552c-aeae-04ac-5de2be38b87c	4274	Žirovnica
00050000-552c-aeae-9436-5c4e16ffc10e	8360	Žužemberk
\.


--
-- TOC entry 2618 (class 0 OID 194577)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2601 (class 0 OID 194400)
-- Dependencies: 183
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2606 (class 0 OID 194466)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2620 (class 0 OID 194589)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 194694)
-- Dependencies: 214
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2636 (class 0 OID 194738)
-- Dependencies: 218
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2624 (class 0 OID 194618)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2616 (class 0 OID 194562)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2615 (class 0 OID 194552)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 194728)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 194684)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2589 (class 0 OID 194268)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-552c-aeaf-b4f0-6051de802417	00010000-552c-aeaf-5e92-e69706641b85	2015-04-14 08:07:43	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROXfsqxYLFdr0K2r.Y0TIFQGmKyELqR7G";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2650 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2625 (class 0 OID 194627)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2593 (class 0 OID 194305)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00000000-552c-aeaf-3a6b-4412203541ef	beri-vse	Polni dostop do vsega v aplikaciji.	t
00000000-552c-aeaf-15ce-3d54c070e22f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00000000-552c-aeaf-e53d-e8ae3ca12370	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00000000-552c-aeaf-4756-816c0c00eb4b	ifi-all	Polni dostop do vsega v aplikaciji.	t
00000000-552c-aeaf-0d12-991ea2592dc9	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00000000-552c-aeaf-8b26-ba7d53f9696c	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2591 (class 0 OID 194289)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-552c-aeaf-b4f0-6051de802417	00000000-552c-aeaf-4756-816c0c00eb4b
00010000-552c-aeaf-276a-86ec08a86257	00000000-552c-aeaf-e53d-e8ae3ca12370
\.


--
-- TOC entry 2627 (class 0 OID 194641)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2619 (class 0 OID 194583)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2613 (class 0 OID 194533)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2598 (class 0 OID 194365)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2614 (class 0 OID 194539)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 194719)
-- Dependencies: 216
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2604 (class 0 OID 194435)
-- Dependencies: 186
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2590 (class 0 OID 194277)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, username, password, enabled, expires, defaultroute, defaultrouteparams, email) FROM stdin;
00010000-552c-aeaf-5e92-e69706641b85	Konzolni	console	$2y$05$NS4xMjkyMTcwMzExMjAxRO9ORj4GZ0QKNluM4abd0YSSSAxhqPmLC	t	\N	\N	\N	rootmail@max.si
00010000-552c-aeaf-276a-86ec08a86257	Anonimni	anonymous	$2y$05$NS4xMjkyMTcwMzExMjAxROnk9zrO7KtRvUolKO3BBaztXp0lIp8Fi	t	\N	\N	\N	noreply@max.si
00010000-552c-aeaf-b4f0-6051de802417	Administrator	admin	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@max.si
\.


--
-- TOC entry 2639 (class 0 OID 194769)
-- Dependencies: 221
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2608 (class 0 OID 194481)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2623 (class 0 OID 194610)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 194676)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2610 (class 0 OID 194509)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2638 (class 0 OID 194759)
-- Dependencies: 220
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 194666)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2236 (class 2606 OID 194330)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 194808)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 194801)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 194718)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 194499)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2305 (class 2606 OID 194532)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2272 (class 2606 OID 194461)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2359 (class 2606 OID 194662)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2283 (class 2606 OID 194479)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2302 (class 2606 OID 194526)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2243 (class 2606 OID 194362)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 194575)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 194602)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2265 (class 2606 OID 194433)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2240 (class 2606 OID 194339)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2256 (class 2606 OID 194397)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2234 (class 2606 OID 194319)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2227 (class 2606 OID 194304)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 194608)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 194640)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 194755)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2251 (class 2606 OID 194390)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2262 (class 2606 OID 194421)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2330 (class 2606 OID 194581)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 194412)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2281 (class 2606 OID 194470)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 194593)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 194700)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 194743)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 194625)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2324 (class 2606 OID 194566)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2318 (class 2606 OID 194557)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 194737)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 194691)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2218 (class 2606 OID 194276)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 194631)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2225 (class 2606 OID 194293)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2229 (class 2606 OID 194313)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 194649)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2332 (class 2606 OID 194588)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2307 (class 2606 OID 194538)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2248 (class 2606 OID 194369)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 194548)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 194727)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2270 (class 2606 OID 194446)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2221 (class 2606 OID 194287)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 194783)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2287 (class 2606 OID 194485)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 194616)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2367 (class 2606 OID 194682)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 194521)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 194768)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 194675)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2290 (class 1259 OID 194506)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2249 (class 1259 OID 194392)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2339 (class 1259 OID 194609)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2333 (class 1259 OID 194595)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2334 (class 1259 OID 194594)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2285 (class 1259 OID 194486)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2360 (class 1259 OID 194665)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2361 (class 1259 OID 194663)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2362 (class 1259 OID 194664)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2385 (class 1259 OID 194756)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2386 (class 1259 OID 194757)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 194758)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2392 (class 1259 OID 194786)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2393 (class 1259 OID 194785)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2394 (class 1259 OID 194784)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2267 (class 1259 OID 194448)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2268 (class 1259 OID 194447)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2253 (class 1259 OID 194399)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2254 (class 1259 OID 194398)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2348 (class 1259 OID 194632)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2303 (class 1259 OID 194527)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2231 (class 1259 OID 194320)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2232 (class 1259 OID 194321)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2353 (class 1259 OID 194652)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2354 (class 1259 OID 194651)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2355 (class 1259 OID 194650)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2277 (class 1259 OID 194471)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2278 (class 1259 OID 194473)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2279 (class 1259 OID 194472)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2313 (class 1259 OID 194561)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2314 (class 1259 OID 194559)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2315 (class 1259 OID 194558)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2316 (class 1259 OID 194560)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2222 (class 1259 OID 194294)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2223 (class 1259 OID 194295)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2342 (class 1259 OID 194617)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2328 (class 1259 OID 194582)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2368 (class 1259 OID 194692)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2369 (class 1259 OID 194693)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2257 (class 1259 OID 194413)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2258 (class 1259 OID 194414)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2372 (class 1259 OID 194701)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2373 (class 1259 OID 194702)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2403 (class 1259 OID 194811)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2404 (class 1259 OID 194810)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2405 (class 1259 OID 194813)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2406 (class 1259 OID 194809)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2407 (class 1259 OID 194812)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2365 (class 1259 OID 194683)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2319 (class 1259 OID 194570)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2320 (class 1259 OID 194569)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2321 (class 1259 OID 194567)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2322 (class 1259 OID 194568)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2241 (class 1259 OID 194363)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2399 (class 1259 OID 194803)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 194802)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2284 (class 1259 OID 194480)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2237 (class 1259 OID 194341)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2238 (class 1259 OID 194340)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2245 (class 1259 OID 194370)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2246 (class 1259 OID 194371)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2308 (class 1259 OID 194551)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2309 (class 1259 OID 194550)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2310 (class 1259 OID 194549)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2291 (class 1259 OID 194508)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2292 (class 1259 OID 194504)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2293 (class 1259 OID 194501)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2294 (class 1259 OID 194502)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2295 (class 1259 OID 194500)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2296 (class 1259 OID 194505)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2297 (class 1259 OID 194503)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2252 (class 1259 OID 194391)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2273 (class 1259 OID 194462)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2274 (class 1259 OID 194464)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2275 (class 1259 OID 194463)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2276 (class 1259 OID 194465)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2327 (class 1259 OID 194576)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2266 (class 1259 OID 194434)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2219 (class 1259 OID 194288)
-- Name: uniq_7fb775b7f85e0677; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7f85e0677 ON uporabniki USING btree (username);


--
-- TOC entry 2347 (class 1259 OID 194626)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2244 (class 1259 OID 194364)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2263 (class 1259 OID 194422)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2384 (class 1259 OID 194744)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2230 (class 1259 OID 194314)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2298 (class 1259 OID 194507)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2432 (class 2606 OID 194944)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2435 (class 2606 OID 194929)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2434 (class 2606 OID 194934)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2430 (class 2606 OID 194954)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2436 (class 2606 OID 194924)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2431 (class 2606 OID 194949)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2433 (class 2606 OID 194939)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2418 (class 2606 OID 194864)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2453 (class 2606 OID 195039)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2451 (class 2606 OID 195034)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2452 (class 2606 OID 195029)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2429 (class 2606 OID 194919)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2459 (class 2606 OID 195079)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2461 (class 2606 OID 195069)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 195074)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2449 (class 2606 OID 195019)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2470 (class 2606 OID 195114)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2469 (class 2606 OID 195119)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2468 (class 2606 OID 195124)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2471 (class 2606 OID 195139)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2472 (class 2606 OID 195134)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2473 (class 2606 OID 195129)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2423 (class 2606 OID 194894)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2424 (class 2606 OID 194889)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2419 (class 2606 OID 194874)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2420 (class 2606 OID 194869)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2455 (class 2606 OID 195049)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2437 (class 2606 OID 194959)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2411 (class 2606 OID 194824)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2410 (class 2606 OID 194829)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2456 (class 2606 OID 195064)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2457 (class 2606 OID 195059)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2458 (class 2606 OID 195054)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2427 (class 2606 OID 194899)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2425 (class 2606 OID 194909)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2426 (class 2606 OID 194904)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2441 (class 2606 OID 194994)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2443 (class 2606 OID 194984)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2444 (class 2606 OID 194979)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2442 (class 2606 OID 194989)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2409 (class 2606 OID 194814)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2408 (class 2606 OID 194819)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2454 (class 2606 OID 195044)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2450 (class 2606 OID 195024)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2464 (class 2606 OID 195089)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2463 (class 2606 OID 195094)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2422 (class 2606 OID 194879)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2421 (class 2606 OID 194884)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2466 (class 2606 OID 195099)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2465 (class 2606 OID 195104)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2478 (class 2606 OID 195164)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2479 (class 2606 OID 195159)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2476 (class 2606 OID 195174)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2480 (class 2606 OID 195154)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2477 (class 2606 OID 195169)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2462 (class 2606 OID 195084)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2445 (class 2606 OID 195014)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2446 (class 2606 OID 195009)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2448 (class 2606 OID 194999)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2447 (class 2606 OID 195004)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2415 (class 2606 OID 194844)
-- Name: fk_b7229ce169e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT fk_b7229ce169e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2414 (class 2606 OID 194849)
-- Name: fk_b7229ce1a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT fk_b7229ce1a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2474 (class 2606 OID 195149)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2475 (class 2606 OID 195144)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2428 (class 2606 OID 194914)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2467 (class 2606 OID 195109)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2412 (class 2606 OID 194839)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2413 (class 2606 OID 194834)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2417 (class 2606 OID 194854)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2416 (class 2606 OID 194859)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2438 (class 2606 OID 194974)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2439 (class 2606 OID 194969)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2440 (class 2606 OID 194964)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-14 08:08:18 CEST

--
-- PostgreSQL database dump complete
--

