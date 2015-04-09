--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.5
-- Dumped by pg_dump version 9.3.5
-- Started on 2015-04-09 11:40:02 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 177 (class 1259 OID 2195026)
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
-- TOC entry 210 (class 1259 OID 2195357)
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
-- TOC entry 211 (class 1259 OID 2195367)
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
-- TOC entry 212 (class 1259 OID 2195384)
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
-- TOC entry 188 (class 1259 OID 2195170)
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
-- TOC entry 189 (class 1259 OID 2195192)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 178 (class 1259 OID 2195035)
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
-- TOC entry 213 (class 1259 OID 2195400)
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
-- TOC entry 190 (class 1259 OID 2195197)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 191 (class 1259 OID 2195204)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 181 (class 1259 OID 2195075)
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
-- TOC entry 197 (class 1259 OID 2195256)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 198 (class 1259 OID 2195262)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 179 (class 1259 OID 2195052)
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
-- TOC entry 180 (class 1259 OID 2195064)
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
-- TOC entry 183 (class 1259 OID 2195119)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 170 (class 1259 OID 2194970)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 174 (class 1259 OID 2195000)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 199 (class 1259 OID 2195269)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 2195276)
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
-- TOC entry 214 (class 1259 OID 2195413)
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
-- TOC entry 182 (class 1259 OID 2195098)
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
-- TOC entry 184 (class 1259 OID 2195126)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 201 (class 1259 OID 2195284)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 185 (class 1259 OID 2195134)
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
-- TOC entry 192 (class 1259 OID 2195210)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 2195290)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 2195427)
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
-- TOC entry 216 (class 1259 OID 2195436)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 2195297)
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
-- TOC entry 204 (class 1259 OID 2195306)
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
-- TOC entry 205 (class 1259 OID 2195315)
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
-- TOC entry 217 (class 1259 OID 2195443)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 2195453)
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
-- TOC entry 172 (class 1259 OID 2194981)
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
-- TOC entry 171 (class 1259 OID 2194979)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2874 (class 0 OID 0)
-- Dependencies: 171
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 206 (class 1259 OID 2195325)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 173 (class 1259 OID 2194990)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 2195019)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 2195331)
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
-- TOC entry 208 (class 1259 OID 2195343)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 193 (class 1259 OID 2195218)
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
-- TOC entry 186 (class 1259 OID 2195149)
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
-- TOC entry 196 (class 1259 OID 2195243)
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
-- TOC entry 219 (class 1259 OID 2195463)
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
-- TOC entry 187 (class 1259 OID 2195156)
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
-- TOC entry 175 (class 1259 OID 2195007)
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
-- TOC entry 220 (class 1259 OID 2195472)
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
-- TOC entry 194 (class 1259 OID 2195224)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 209 (class 1259 OID 2195349)
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
-- TOC entry 221 (class 1259 OID 2195490)
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
-- TOC entry 195 (class 1259 OID 2195230)
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
-- TOC entry 222 (class 1259 OID 2195498)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 223 (class 1259 OID 2195508)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2320 (class 2604 OID 2194984)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2821 (class 0 OID 2195026)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2854 (class 0 OID 2195357)
-- Dependencies: 210
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 2195367)
-- Dependencies: 211
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 2195384)
-- Dependencies: 212
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2832 (class 0 OID 2195170)
-- Dependencies: 188
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2833 (class 0 OID 2195192)
-- Dependencies: 189
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 2195035)
-- Dependencies: 178
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5526-44bb-0173-b6640b0cc0e3	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5526-44bb-dc28-347159966bd6	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5526-44bb-2f46-4043fa02f43d	AL	ALB	008	Albania 	Albanija	\N
00040000-5526-44bb-b354-dcfe82f169da	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5526-44bb-5337-c7f2764b4dc4	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5526-44bb-3f56-ac0f56a3f615	AD	AND	020	Andorra 	Andora	\N
00040000-5526-44bb-e72b-43f620f62bde	AO	AGO	024	Angola 	Angola	\N
00040000-5526-44bb-8670-46d6b7ba7ab8	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5526-44bb-c742-3648a7365507	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5526-44bb-67fb-46e48f996b65	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5526-44bb-6a8c-190a4067ebf1	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5526-44bb-3a18-a7f2c0c21122	AM	ARM	051	Armenia 	Armenija	\N
00040000-5526-44bb-de17-280b57c824e3	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5526-44bb-58a5-f5834a72559f	AU	AUS	036	Australia 	Avstralija	\N
00040000-5526-44bb-b99f-be4d65074871	AT	AUT	040	Austria 	Avstrija	\N
00040000-5526-44bb-e131-98a8ddb61715	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5526-44bb-5404-e0bdf042665d	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5526-44bb-50b6-922fe89bc22f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5526-44bb-06bf-08fac1e22a2c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5526-44bb-ee11-d50c8e539132	BB	BRB	052	Barbados 	Barbados	\N
00040000-5526-44bb-d905-bffdaecfc9e2	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5526-44bb-9513-fb6b4a577be2	BE	BEL	056	Belgium 	Belgija	\N
00040000-5526-44bb-54f5-0d5fbba15426	BZ	BLZ	084	Belize 	Belize	\N
00040000-5526-44bb-7de5-06b483ee172a	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5526-44bb-b3c0-ea737a5d94ae	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5526-44bb-7579-490df54abb71	BT	BTN	064	Bhutan 	Butan	\N
00040000-5526-44bb-6737-079c514143dd	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5526-44bb-9ea9-067d03a730d7	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5526-44bb-1efd-452cd8d00b5b	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5526-44bb-08e8-e6813a874c31	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5526-44bb-2576-a58747bd785d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5526-44bb-87ea-e8a2573ebf8b	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5526-44bb-3129-593b669b41e5	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5526-44bb-4d95-10125aaf4715	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5526-44bb-3099-003fe46e4e57	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5526-44bb-1f04-5ce073c1d995	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5526-44bb-8894-6688b2085770	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5526-44bb-867f-d5ae77387214	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5526-44bb-919c-6e99ce26ea09	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5526-44bb-6c09-df9e73c6d3b4	CA	CAN	124	Canada 	Kanada	\N
00040000-5526-44bb-61e1-b8c476ddf494	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5526-44bb-6d39-28ce2a6958c4	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5526-44bb-5f60-8c1355ca4856	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5526-44bb-2071-7460f0ebf098	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5526-44bb-8670-98b980f816c8	CL	CHL	152	Chile 	Čile	\N
00040000-5526-44bb-1209-19eff4cd841b	CN	CHN	156	China 	Kitajska	\N
00040000-5526-44bb-50c5-2fbb1d37ad96	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5526-44bb-5931-fa6b7d6abfed	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5526-44bb-8c12-be81b94808ad	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5526-44bb-b29a-3df1a9007abb	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5526-44bb-8da0-0cca6c17cfe4	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5526-44bb-1959-0acdfac5866b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5526-44bb-c182-36f5e76a2970	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5526-44bb-579e-26ef5f82653b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5526-44bb-a389-c893fd5c0116	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5526-44bb-ca48-0b24abc82dfe	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5526-44bb-10b5-30bd632adddc	CU	CUB	192	Cuba 	Kuba	\N
00040000-5526-44bb-45cb-1a87ae4bc39d	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5526-44bb-19e8-c7f113e50804	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5526-44bb-0f1a-daa2b173dff2	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5526-44bb-96c4-5c2fe469df34	DK	DNK	208	Denmark 	Danska	\N
00040000-5526-44bb-ee33-1c40e20ef258	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5526-44bb-9c53-261655b7ec82	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5526-44bb-f421-d07161d11408	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5526-44bb-990e-e392217ebf45	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5526-44bb-7295-73a9afe24557	EG	EGY	818	Egypt 	Egipt	\N
00040000-5526-44bb-d289-4839ba80245d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5526-44bb-6e1b-e2441b583d63	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5526-44bb-9c56-4378c51059a3	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5526-44bb-82a1-412b1f3ef1a6	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5526-44bb-ec47-5f2909870920	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5526-44bb-dbd0-58b9a8501ba6	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5526-44bb-0921-d280d21296cf	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5526-44bb-e09e-2eb278135b32	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5526-44bb-8521-5912c1f438ef	FI	FIN	246	Finland 	Finska	\N
00040000-5526-44bb-072f-5100791d4983	FR	FRA	250	France 	Francija	\N
00040000-5526-44bb-751d-6fe997fed25a	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5526-44bb-a025-38444e6e6b88	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5526-44bb-c416-1c9d07664a26	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5526-44bb-9c30-6b77df3dae39	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5526-44bb-28ff-a3404a0233b2	GA	GAB	266	Gabon 	Gabon	\N
00040000-5526-44bb-0f8b-e34ac58c3e83	GM	GMB	270	Gambia 	Gambija	\N
00040000-5526-44bb-1586-1cae8af4c7d4	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5526-44bb-92ef-7a684c6dfcf2	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5526-44bb-0628-399676cf9a31	GH	GHA	288	Ghana 	Gana	\N
00040000-5526-44bb-756a-34f50bb70001	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5526-44bb-96e8-386904bf4108	GR	GRC	300	Greece 	Grčija	\N
00040000-5526-44bb-a3d6-d85a0f2f69ce	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5526-44bb-e274-8cbbee9b5f3f	GD	GRD	308	Grenada 	Grenada	\N
00040000-5526-44bb-dadd-c396d6b025f0	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5526-44bb-04b1-974cb62ab565	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5526-44bb-6839-021a0187a592	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5526-44bb-f113-a6f65de33a78	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5526-44bb-4f82-e4a4355f3137	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5526-44bb-7b04-fb178e32444d	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5526-44bb-fdc1-fd82ad5568a1	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5526-44bb-74b7-dcb89cf58d46	HT	HTI	332	Haiti 	Haiti	\N
00040000-5526-44bb-93ac-3390a3d7c004	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5526-44bb-8cfd-3018e0c4f3e6	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5526-44bb-6102-72818a334846	HN	HND	340	Honduras 	Honduras	\N
00040000-5526-44bb-0937-d60be3ef93b4	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5526-44bb-a141-9ae68a38adcd	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5526-44bb-b110-1d9572082aa0	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5526-44bb-c8ab-96ff886027e1	IN	IND	356	India 	Indija	\N
00040000-5526-44bb-b28a-3d01e11f6486	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5526-44bb-c0e0-dbd6af1e6b6b	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5526-44bb-6783-88309a8fe41c	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5526-44bb-5ba8-de986ef67890	IE	IRL	372	Ireland 	Irska	\N
00040000-5526-44bb-832c-ab935656d3f0	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5526-44bb-8851-9b2beec7400b	IL	ISR	376	Israel 	Izrael	\N
00040000-5526-44bb-cfd5-65546f0b6f7e	IT	ITA	380	Italy 	Italija	\N
00040000-5526-44bb-ea14-9b570cbd12a3	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5526-44bb-85aa-ded92146d6e1	JP	JPN	392	Japan 	Japonska	\N
00040000-5526-44bb-bf82-0bb71cbefd2c	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5526-44bb-d671-029aa2fabf4f	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5526-44bb-dbc8-defc1eb21559	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5526-44bb-5d13-63513ea5a914	KE	KEN	404	Kenya 	Kenija	\N
00040000-5526-44bb-d564-19d8b647ceac	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5526-44bb-7199-f4dab1ea8fc0	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5526-44bb-2bec-8cd15a5ab599	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5526-44bb-22ad-fdf01f3e7d88	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5526-44bb-e8da-f17c28b31132	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5526-44bb-b7b8-36006cd0763a	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5526-44bb-b716-b14aef967a28	LV	LVA	428	Latvia 	Latvija	\N
00040000-5526-44bb-56c5-16f93b8476d4	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5526-44bb-21d9-086999d47222	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5526-44bb-f71d-a84ef4371d0a	LR	LBR	430	Liberia 	Liberija	\N
00040000-5526-44bb-ecba-cd9c94d93418	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5526-44bb-cc6e-8691c8da9650	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5526-44bb-6049-b4bbb68010be	LT	LTU	440	Lithuania 	Litva	\N
00040000-5526-44bb-58c2-bfc667145878	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5526-44bb-a606-6d554de33a31	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5526-44bb-8d68-5932fb131958	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5526-44bb-656c-171a497eab84	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5526-44bb-6a21-ccdf1a9b75c6	MW	MWI	454	Malawi 	Malavi	\N
00040000-5526-44bb-9daf-3bdfb8df6879	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5526-44bb-41a1-cd4b797e9fee	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5526-44bb-4032-27f06924499f	ML	MLI	466	Mali 	Mali	\N
00040000-5526-44bb-868c-9d23fa3ad09f	MT	MLT	470	Malta 	Malta	\N
00040000-5526-44bb-796a-8e9d18a77827	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5526-44bb-9c8a-fb902949a341	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5526-44bb-373b-be5a4f2ef07f	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5526-44bb-1194-991814633755	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5526-44bb-9c83-f757b338235a	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5526-44bb-0ca7-5cfacef7e57b	MX	MEX	484	Mexico 	Mehika	\N
00040000-5526-44bb-76b5-09235ff53d32	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5526-44bb-ba81-4d74f052625d	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5526-44bb-7d69-e739f925572a	MC	MCO	492	Monaco 	Monako	\N
00040000-5526-44bb-2927-b8a5410b306e	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5526-44bb-6bfe-6a31918ddc99	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5526-44bb-b8f1-c7ea412e6d98	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5526-44bb-9163-2bdaf899ca97	MA	MAR	504	Morocco 	Maroko	\N
00040000-5526-44bb-1139-79a24db0df96	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5526-44bb-a3cb-8cb005107f03	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5526-44bb-2bdb-bb709e02d4e1	NA	NAM	516	Namibia 	Namibija	\N
00040000-5526-44bb-2dc2-cf32b0cc795f	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5526-44bb-3ac7-326cbc429039	NP	NPL	524	Nepal 	Nepal	\N
00040000-5526-44bb-1fd5-596854ac698a	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5526-44bb-8e1a-d3c4b947727b	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5526-44bb-159e-4e9bffe06476	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5526-44bb-8f14-08744cc0c7b0	NE	NER	562	Niger 	Niger 	\N
00040000-5526-44bb-2094-bc5b1a8e2eeb	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5526-44bb-a160-1e803f0bd2e1	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5526-44bb-e119-1a12a593d544	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5526-44bb-f45f-bd098ea5078d	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5526-44bb-c05e-3b640e312089	NO	NOR	578	Norway 	Norveška	\N
00040000-5526-44bb-1dc5-d91aac755d17	OM	OMN	512	Oman 	Oman	\N
00040000-5526-44bb-01f7-5c6d4e273079	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5526-44bb-ad6c-1a2c1384227e	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5526-44bb-6f5e-982ff7d0223c	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5526-44bb-8750-9ff00c3c9add	PA	PAN	591	Panama 	Panama	\N
00040000-5526-44bb-f553-1af5af3958e9	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5526-44bb-1cba-12230352cd6e	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5526-44bb-5ff5-16a226c6fa7e	PE	PER	604	Peru 	Peru	\N
00040000-5526-44bb-9878-a58e97f0c858	PH	PHL	608	Philippines 	Filipini	\N
00040000-5526-44bb-f2e0-81813fa4232a	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5526-44bb-9462-bb36b02c35af	PL	POL	616	Poland 	Poljska	\N
00040000-5526-44bb-52a4-a54249c1ec10	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5526-44bb-97dc-91b1f42f74b1	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5526-44bb-10ec-43ed2ba50807	QA	QAT	634	Qatar 	Katar	\N
00040000-5526-44bb-8439-6fef04fb878d	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5526-44bb-18a9-31e4cffe0643	RO	ROU	642	Romania 	Romunija	\N
00040000-5526-44bb-777b-3482ebf8020e	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5526-44bb-05cf-276a4cdc7050	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5526-44bb-9e87-12f9712e7cd3	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5526-44bb-ef4a-c0235b3f6304	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5526-44bb-45f1-d5f0e230201a	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5526-44bb-fe3f-a9b968298d83	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5526-44bb-3e71-d2fd5d0d403c	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5526-44bb-4543-41ca59ea60ad	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5526-44bb-5896-797f0bcc30fc	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5526-44bb-7f7b-78ed1377c94e	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5526-44bb-9b11-eb7e12f33130	SM	SMR	674	San Marino 	San Marino	\N
00040000-5526-44bb-96d7-3c2a9cd7b10a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5526-44bb-a4f1-25e3d0d7f951	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5526-44bb-9478-52267f50b4aa	SN	SEN	686	Senegal 	Senegal	\N
00040000-5526-44bb-3b67-11c59bde85a2	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5526-44bb-bf8f-bbc6f7c7a3ac	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5526-44bb-c570-821436a4de28	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5526-44bb-58a1-f0ebe3b10bdf	SG	SGP	702	Singapore 	Singapur	\N
00040000-5526-44bb-8e22-6fb2a146f6f9	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5526-44bb-2184-160bd9a9701f	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5526-44bb-e839-709ec0e53d72	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5526-44bb-b649-cdbbfccc8cf4	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5526-44bb-19f8-7b57e7592a6b	SO	SOM	706	Somalia 	Somalija	\N
00040000-5526-44bb-60fc-9aeb7652b572	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5526-44bb-82c5-5276b170c185	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5526-44bb-d532-5c6ef858c4e2	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5526-44bb-c178-768814621a33	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5526-44bb-2cf9-54b66c888513	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5526-44bb-b442-c930745c2183	SD	SDN	729	Sudan 	Sudan	\N
00040000-5526-44bb-dd69-19087ba75e91	SR	SUR	740	Suriname 	Surinam	\N
00040000-5526-44bb-da1c-8825ee24ff0a	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5526-44bb-07bb-dd8e9b2ac10c	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5526-44bb-d035-8b428865bbcc	SE	SWE	752	Sweden 	Švedska	\N
00040000-5526-44bb-6697-73099f265f6e	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5526-44bb-1076-26d5c93187dd	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5526-44bb-e9dd-a844c61bc339	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5526-44bb-3b26-05fa768c25b3	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5526-44bb-4418-2e99345cad73	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5526-44bb-35df-3b88794ce123	TH	THA	764	Thailand 	Tajska	\N
00040000-5526-44bb-70b0-083c8a6886a7	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5526-44bb-4572-3e9e7ee2ff50	TG	TGO	768	Togo 	Togo	\N
00040000-5526-44bb-4f1e-25ffacca5d21	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5526-44bb-eecf-90a5137fa351	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5526-44bb-0199-368c407cf56c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5526-44bb-3e8c-8c4eebfb3600	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5526-44bb-f445-eef1cfdb6a03	TR	TUR	792	Turkey 	Turčija	\N
00040000-5526-44bb-eb5c-00083ff723eb	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5526-44bb-a9ca-08c902856be2	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5526-44bb-4f82-95ea37d35576	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5526-44bb-2afe-4bb6d4762786	UG	UGA	800	Uganda 	Uganda	\N
00040000-5526-44bb-b550-cda2300301cb	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5526-44bb-1f25-888c6f46f3f0	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5526-44bb-4762-123de54b67f8	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5526-44bb-dc71-37d7e4dd2fec	US	USA	840	United States 	Združene države Amerike	\N
00040000-5526-44bb-dfaa-bba1fd42875f	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5526-44bb-96fe-e3f06b1ff3c2	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5526-44bb-f46e-6cd4d0671edc	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5526-44bb-3d26-c2b02db869e9	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5526-44bb-f677-e74e7d66445d	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5526-44bb-1dee-c772bc487b4a	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5526-44bb-9e04-16fdecd42b12	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5526-44bb-0c93-415c418a5c84	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5526-44bb-a052-7cb6171a113e	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5526-44bb-0225-71440ff557cd	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5526-44bb-c446-d8e70729a916	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5526-44bb-3a92-5ee9dcd488b8	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5526-44bb-dc57-5c378ba9d63d	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2857 (class 0 OID 2195400)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2834 (class 0 OID 2195197)
-- Dependencies: 190
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2835 (class 0 OID 2195204)
-- Dependencies: 191
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 2195075)
-- Dependencies: 181
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 2195256)
-- Dependencies: 197
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2842 (class 0 OID 2195262)
-- Dependencies: 198
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 2195052)
-- Dependencies: 179
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5526-44bb-4fdc-74be5bebe34a	kravaXXX	color	N;	t	f	f	\N	\N
00000000-5526-44bb-0a97-4dc481a46312	privzetInspicient	entity	N;	f	f	f	\N	\N
00000000-5526-44bb-ee32-cc8a25d7604d	dogodek-status	map	O:18:"Zend\\Config\\Config":4:{s:21:"	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2824 (class 0 OID 2195064)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
\.


--
-- TOC entry 2827 (class 0 OID 2195119)
-- Dependencies: 183
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2814 (class 0 OID 2194970)
-- Dependencies: 170
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00020000-5526-44bc-017b-5b5cde7fe841	User-delete	Aaa - Uporabnik - Briši	f
00020000-5526-44bc-5279-673d222846bc	User-read	Aaa - Uporabnik - Beri	f
00020000-5526-44bc-5d66-1e4d6e3254e3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5526-44bc-3bf1-1501bbc55b6a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5526-44bc-fc79-29dd633d0c32	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5526-44bc-01c2-d794a522b01c	Role-delete	Aaa - Vloga - Briši	f
00020000-5526-44bc-1e68-b6e10da85c0d	Role-read	Aaa - Vloga - Beri	f
00020000-5526-44bc-96e5-f7fb5232249f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5526-44bc-2058-708a5736b2a7	Role-create	Aaa - Vloga - Ustvari	f
00020000-5526-44bc-3e81-956dd8c7d1ab	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5526-44bc-6439-f1637a66103c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5526-44bc-18fc-c47feedc2b66	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5526-44bc-b8d8-f91907c9da5f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5526-44bc-17c4-20df7b674f2f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5526-44bc-80d1-e6a634eb7972	User-delete	Aaa - Uporabnik - Briši	f
00020000-5526-44bc-85f6-f3b2ca25b911	User-read	Aaa - Uporabnik - Beri	f
00020000-5526-44bc-b32a-2a993ee7b462	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5526-44bc-8cb3-84f07c0a1488	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5526-44bc-ab3b-cf05e3c3b094	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5526-44bc-f2ae-ae62a75bd10f	Role-delete	Aaa - Vloga - Briši	f
00020000-5526-44bc-f5df-437e1a1c5fdd	Role-read	Aaa - Vloga - Beri	f
00020000-5526-44bc-fdf7-ca0353d0f5d6	Role-update	Aaa - Vloga - Posodobi	f
00020000-5526-44bc-3ae4-f16fc1f0c476	Role-create	Aaa - Vloga - Ustvari	f
00020000-5526-44bc-6413-7bf12a2fe30a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5526-44bc-4ae7-f990d89fe31c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5526-44bc-924b-0191761b2095	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5526-44bc-3625-ed13f48c72d3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5526-44bc-54de-3c57932dadc1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5526-44bc-43bc-77de09fd6612	User-delete	Aaa - Uporabnik - Briši	f
00020000-5526-44bc-ac2e-eda46305dfd5	User-read	Aaa - Uporabnik - Beri	f
00020000-5526-44bc-0a19-2363fddf4340	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5526-44bc-7f9a-a3fa31cf5318	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5526-44bc-3f53-07e782916903	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5526-44bc-5cf4-c338f7e9209c	Role-delete	Aaa - Vloga - Briši	f
00020000-5526-44bc-3bd6-9a26aa569aed	Role-read	Aaa - Vloga - Beri	f
00020000-5526-44bc-5fa1-dcf92b4ff290	Role-update	Aaa - Vloga - Posodobi	f
00020000-5526-44bc-f03d-2745038c8b20	Role-create	Aaa - Vloga - Ustvari	f
00020000-5526-44bc-068f-abe32d472b02	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5526-44bc-7009-4f5f7e0b8b29	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5526-44bc-2b03-f5bbf533185b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5526-44bc-70f9-5fccf8887cb9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5526-44bc-fd9c-60bd33a2841a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5526-44bc-03d1-ec10ce197f1f	User-delete	Aaa - Uporabnik - Briši	f
00020000-5526-44bc-5d80-0fd04abe7396	User-read	Aaa - Uporabnik - Beri	f
00020000-5526-44bc-a973-c86b6aeb896b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5526-44bc-cfdb-62ec8a5a6fe9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5526-44bc-806a-cf5d0204b74f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5526-44bc-286a-dfe9e86bc70e	Role-delete	Aaa - Vloga - Briši	f
00020000-5526-44bc-cd2a-baf587f1834d	Role-read	Aaa - Vloga - Beri	f
00020000-5526-44bc-85f6-b9c9f14de58f	Role-update	Aaa - Vloga - Posodobi	f
00020000-5526-44bc-5aa7-312905bbff45	Role-create	Aaa - Vloga - Ustvari	f
00020000-5526-44bc-8adb-44862ef193b8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5526-44bc-82ee-057b90fce583	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5526-44bc-b19f-88aa343471f7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5526-44bc-e6e8-b246faad4722	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5526-44bc-1a7f-83a4c62c003f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5526-44bc-ddca-d89647560956	User-delete	Aaa - Uporabnik - Briši	f
00020000-5526-44bc-a71c-bfdf2176dbc7	User-read	Aaa - Uporabnik - Beri	f
00020000-5526-44bc-a10d-e9a37082e327	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5526-44bc-fdad-7433a6e30dc4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5526-44bc-a635-77433da7329c	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5526-44bc-3ff0-b2be032475ae	Role-delete	Aaa - Vloga - Briši	f
00020000-5526-44bc-4745-f0fdda21b0cc	Role-read	Aaa - Vloga - Beri	f
00020000-5526-44bc-d3e8-f2c2888f2566	Role-update	Aaa - Vloga - Posodobi	f
00020000-5526-44bc-06d8-741e2f77303f	Role-create	Aaa - Vloga - Ustvari	f
00020000-5526-44bc-56a8-e55c083e79e2	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5526-44bc-8074-fa959358cfbd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5526-44bc-ef19-32013a4181f6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5526-44bc-0fd0-52ea5884c05c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5526-44bc-5273-61d85ff08453	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5526-44bc-48a0-2fe46f7b2c8c	User-delete	Aaa - Uporabnik - Briši	f
00020000-5526-44bc-8000-867c3ce396f6	User-read	Aaa - Uporabnik - Beri	f
00020000-5526-44bc-c230-a435990f274d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5526-44bc-8a4d-e88d27de8396	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5526-44bc-d1ff-57627b3cac13	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5526-44bc-db37-45b0889e416c	Role-delete	Aaa - Vloga - Briši	f
00020000-5526-44bc-345d-d0e8054b905a	Role-read	Aaa - Vloga - Beri	f
00020000-5526-44bc-51c9-f91a90ce3683	Role-update	Aaa - Vloga - Posodobi	f
00020000-5526-44bc-916e-e01a82e71417	Role-create	Aaa - Vloga - Ustvari	f
00020000-5526-44bc-d4c3-243f36f4eaba	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5526-44bc-c48e-31054623abd9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5526-44bc-3bf3-3d6763dbd445	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5526-44bc-1e25-33a8c01521eb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5526-44bc-0f0a-d99c48e16be8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5526-44bc-18c7-ad49e32372d4	User-delete	Aaa - Uporabnik - Briši	f
00020000-5526-44bc-080f-a29fea04528c	User-read	Aaa - Uporabnik - Beri	f
00020000-5526-44bc-ad96-9cb90a474da7	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5526-44bc-e35a-a16387459a08	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5526-44bc-42d1-f675bec45480	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5526-44bc-b32b-2178a631daba	Role-delete	Aaa - Vloga - Briši	f
00020000-5526-44bc-2d29-cec4779114eb	Role-read	Aaa - Vloga - Beri	f
00020000-5526-44bc-a6eb-17dc8b430c87	Role-update	Aaa - Vloga - Posodobi	f
00020000-5526-44bc-0b6d-d94d342a9634	Role-create	Aaa - Vloga - Ustvari	f
00020000-5526-44bc-f57d-fc78c60cdd48	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5526-44bc-9a14-2ab2bcd37f60	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5526-44bc-7fb4-c7d6996a0567	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5526-44bc-bb28-303d265e1bc3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5526-44bc-e660-d595d60e1aea	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5526-44bc-7eed-d9144905348b	User-delete	Aaa - Uporabnik - Briši	f
00020000-5526-44bc-458e-bbcef7ab3b1c	User-read	Aaa - Uporabnik - Beri	f
00020000-5526-44bc-e836-523a8905bed4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5526-44bc-3de1-0a982515dffe	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5526-44bc-ea08-2445d1c5d020	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5526-44bc-ab3c-51c45fb3a505	Role-delete	Aaa - Vloga - Briši	f
00020000-5526-44bc-7fa8-205e78f48d02	Role-read	Aaa - Vloga - Beri	f
00020000-5526-44bc-0f43-d4b5a4e71ec1	Role-update	Aaa - Vloga - Posodobi	f
00020000-5526-44bc-6c5b-7cb6c8c552fa	Role-create	Aaa - Vloga - Ustvari	f
00020000-5526-44bc-ae55-d86e4522ffe7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5526-44bc-b923-7a80ba8ca8ad	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5526-44bc-e8bd-c0192b76f518	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5526-44bc-0e78-c333663ed0f9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5526-44bc-72fd-311f3fad2cf9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5526-44bc-6f5b-371e9ffa6405	User-delete	Aaa - Uporabnik - Briši	f
00020000-5526-44bc-819c-40a5e32735b1	User-read	Aaa - Uporabnik - Beri	f
00020000-5526-44bc-0876-64f4ab2ddcb4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-5526-44bc-99f6-0f39c7d5979b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-5526-44bc-803d-8cffab83ae98	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-5526-44bc-ce7c-95d5943d1730	Role-delete	Aaa - Vloga - Briši	f
00020000-5526-44bc-d844-b00867368fb8	Role-read	Aaa - Vloga - Beri	f
00020000-5526-44bc-e03d-7d580aa57710	Role-update	Aaa - Vloga - Posodobi	f
00020000-5526-44bc-df2e-95ab161155e3	Role-create	Aaa - Vloga - Ustvari	f
00020000-5526-44bc-2537-2a95f7234f4c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-5526-44bc-d643-8268633a6b20	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-5526-44bc-35d7-9dc405b9a5f2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-5526-44bc-0b3a-a28d4b7cdb8d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-5526-44bc-b165-b091b9c56994	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-5526-44bc-3cfe-54ad70593dde	Drzava-read	Seznam držav	f
00020000-5526-44bc-f57c-227bfb7b9744	Drzava-write	Urejanje držav	f
00020000-5526-44bc-c30c-352c6185a4b0	Popa-delete	Poslovni partner - Briši	f
00020000-5526-44bc-b4e7-182edb23dba3	Popa-list	Poslovni partner - Beri	f
00020000-5526-44bc-3265-18ca29eaff2a	Popa-update	Poslovni partner - Posodobi	f
00020000-5526-44bc-5d9a-049e3c4ec438	Popa-create	Poslovni partner - Ustvari	f
00020000-5526-44bc-6382-35158655c66c	Posta-delete	Pošta - Briši	f
00020000-5526-44bc-ed8b-b45f27ea1ddc	Posta-list	Pošta - Beri	f
00020000-5526-44bc-decf-37391bf62a4c	Posta-update	Pošta - Posodobi	f
00020000-5526-44bc-38ea-4db25e2edc5d	Posta-create	Pošta - Ustvari	f
00020000-5526-44bc-62e4-75ef8a8206bf	PostniNaslov-delete	Poštni naslov - Briši	f
00020000-5526-44bc-b80b-f3f88c43cd73	PostniNaslov-list	Poštni naslov - Beri	f
00020000-5526-44bc-c6b7-ed8d04ad2c28	PostniNaslov-update	Poštni naslov - Posodobi	f
00020000-5526-44bc-5c12-b7f46db12dab	PostniNaslov-create	Poštni naslov - Ustvari	f
\.


--
-- TOC entry 2818 (class 0 OID 2195000)
-- Dependencies: 174
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00000000-5526-44bc-87b5-df451eef6b63	00020000-5526-44bc-3cfe-54ad70593dde
00000000-5526-44bc-87b5-df451eef6b63	00020000-5526-44bc-17c4-20df7b674f2f
00000000-5526-44bc-5469-76bc446235a4	00020000-5526-44bc-f57c-227bfb7b9744
00000000-5526-44bc-5469-76bc446235a4	00020000-5526-44bc-3cfe-54ad70593dde
\.


--
-- TOC entry 2843 (class 0 OID 2195269)
-- Dependencies: 199
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2844 (class 0 OID 2195276)
-- Dependencies: 200
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2858 (class 0 OID 2195413)
-- Dependencies: 214
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2826 (class 0 OID 2195098)
-- Dependencies: 182
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 2195126)
-- Dependencies: 184
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5526-44bb-2963-4e357e1cf1e7	8341	Adlešiči
00050000-5526-44bb-398a-1db3ae252c3a	5270	Ajdovščina
00050000-5526-44bb-8f22-ed49f84ae926	6280	Ankaran/Ancarano
00050000-5526-44bb-b7d1-971beebb9c7b	9253	Apače
00050000-5526-44bb-b4d8-a4bddf297410	8253	Artiče
00050000-5526-44bb-817f-2f10bcc69c79	4275	Begunje na Gorenjskem
00050000-5526-44bb-eb53-db1168012ac1	1382	Begunje pri Cerknici
00050000-5526-44bb-38db-c26ddbbe705c	9231	Beltinci
00050000-5526-44bb-6ff2-cefb4aa16600	2234	Benedikt
00050000-5526-44bb-35bc-3d88da3c28e7	2345	Bistrica ob Dravi
00050000-5526-44bb-69a1-a3e975cda94a	3256	Bistrica ob Sotli
00050000-5526-44bb-d494-4701a13bfd1b	8259	Bizeljsko
00050000-5526-44bb-5adc-e8235523d935	1223	Blagovica
00050000-5526-44bb-62bc-48a1ac5e8189	8283	Blanca
00050000-5526-44bb-1920-4cc91d1ee269	4260	Bled
00050000-5526-44bb-d4c9-4da0f34a61bb	4273	Blejska Dobrava
00050000-5526-44bb-febb-87dcf490bde1	9265	Bodonci
00050000-5526-44bb-d1df-8fbe5a6d9cf0	9222	Bogojina
00050000-5526-44bb-4c7b-0b7c3b65f963	4263	Bohinjska Bela
00050000-5526-44bb-7388-a5abaad3acac	4264	Bohinjska Bistrica
00050000-5526-44bb-e4e1-6c0a68acca4b	4265	Bohinjsko jezero
00050000-5526-44bb-ec3e-357c6c7daaf2	1353	Borovnica
00050000-5526-44bb-c134-1656c70ed5c9	8294	Boštanj
00050000-5526-44bb-0f2a-a5e6ab7d5bc9	5230	Bovec
00050000-5526-44bb-a582-a7d7e3ad308b	5295	Branik
00050000-5526-44bb-0559-337ab68d8ad0	3314	Braslovče
00050000-5526-44bb-78eb-1fab2a3947b8	5223	Breginj
00050000-5526-44bb-320a-5c53ff7dd9b4	8280	Brestanica
00050000-5526-44bb-e69f-8ad771517efe	2354	Bresternica
00050000-5526-44bb-e06e-e6961ecfdc99	4243	Brezje
00050000-5526-44bb-cffc-bfd74ac308dc	1351	Brezovica pri Ljubljani
00050000-5526-44bb-68ec-22d39db2a0c2	8250	Brežice
00050000-5526-44bb-723e-5637f2da7e75	4210	Brnik - Aerodrom
00050000-5526-44bb-2b9e-9c8763b7503f	8321	Brusnice
00050000-5526-44bb-21e2-67f25ab6584d	3255	Buče
00050000-5526-44bb-09b6-673ef2bb03a3	8276	Bučka 
00050000-5526-44bb-c769-ceeb6b3c2e5d	9261	Cankova
00050000-5526-44bb-3683-3dac3df222be	3000	Celje 
00050000-5526-44bb-ea8b-374dac33563c	3001	Celje - poštni predali
00050000-5526-44bb-ec2a-124f650a7f37	4207	Cerklje na Gorenjskem
00050000-5526-44bb-a757-b36c97e9c981	8263	Cerklje ob Krki
00050000-5526-44bb-5116-5b1e19f73296	1380	Cerknica
00050000-5526-44bb-8eb4-472cc81d1630	5282	Cerkno
00050000-5526-44bb-6939-71e14f41b1e9	2236	Cerkvenjak
00050000-5526-44bb-517f-3c99746c100d	2215	Ceršak
00050000-5526-44bb-5667-5765ad8edd0d	2326	Cirkovce
00050000-5526-44bb-4306-50d5809132ff	2282	Cirkulane
00050000-5526-44bb-1fc8-41a45c1f7ace	5273	Col
00050000-5526-44bb-1c72-9c9dc01376d5	8251	Čatež ob Savi
00050000-5526-44bb-0968-312b96d3e7c5	1413	Čemšenik
00050000-5526-44bb-0cce-d97e0a8b1e56	5253	Čepovan
00050000-5526-44bb-a4b7-6e95a135903b	9232	Črenšovci
00050000-5526-44bb-c7b0-d08c9f2abe98	2393	Črna na Koroškem
00050000-5526-44bb-4ad1-8d35431597ce	6275	Črni Kal
00050000-5526-44bb-6ccd-bb207585a8cd	5274	Črni Vrh nad Idrijo
00050000-5526-44bb-9110-e1d68e2f6ed6	5262	Črniče
00050000-5526-44bb-3fad-157fbbd42e7a	8340	Črnomelj
00050000-5526-44bb-e5c3-ad262817f1bb	6271	Dekani
00050000-5526-44bb-e07f-cfa6a6435301	5210	Deskle
00050000-5526-44bb-04f3-79f25cf50079	2253	Destrnik
00050000-5526-44bb-1b84-2ab871bd5bef	6215	Divača
00050000-5526-44bb-feb9-9a1ae01743bd	1233	Dob
00050000-5526-44bb-3bbd-98f9fc82d42a	3224	Dobje pri Planini
00050000-5526-44bb-7db2-34960ec8f79c	8257	Dobova
00050000-5526-44bb-95f1-15f8d3678c7e	1423	Dobovec
00050000-5526-44bb-c451-9db5257ca044	5263	Dobravlje
00050000-5526-44bb-777f-e9132df4eeab	3204	Dobrna
00050000-5526-44bb-5e01-ef9d39029d28	8211	Dobrnič
00050000-5526-44bb-f82d-68881fa93f3c	1356	Dobrova
00050000-5526-44bb-f223-68d60332fd0f	9223	Dobrovnik/Dobronak 
00050000-5526-44bb-f91c-a8327527eff7	5212	Dobrovo v Brdih
00050000-5526-44bb-b340-fb9562cb1a2d	1431	Dol pri Hrastniku
00050000-5526-44bb-7ed9-0cafafd24f3e	1262	Dol pri Ljubljani
00050000-5526-44bb-f282-d497959773ca	1273	Dole pri Litiji
00050000-5526-44bb-1c84-2c4e7bbb87f3	1331	Dolenja vas
00050000-5526-44bb-32ba-dfc2d05aee94	8350	Dolenjske Toplice
00050000-5526-44bb-dbc6-af778ca7f085	1230	Domžale
00050000-5526-44bb-374f-c5f2402747dc	2252	Dornava
00050000-5526-44bb-d13f-564c0d0bfe97	5294	Dornberk
00050000-5526-44bb-edfd-42ea401e11e8	1319	Draga
00050000-5526-44bb-876a-4ac655b12f49	8343	Dragatuš
00050000-5526-44bb-8efa-c643f178c6da	3222	Dramlje
00050000-5526-44bb-c373-6ea458279584	2370	Dravograd
00050000-5526-44bb-f0be-4a676aa7c7f5	4203	Duplje
00050000-5526-44bb-a090-d7ffc27bbcc5	6221	Dutovlje
00050000-5526-44bb-6bf9-7542fe91aa37	8361	Dvor
00050000-5526-44bb-457e-eb389d9d1695	2343	Fala
00050000-5526-44bb-ddb0-3e999c6b66b7	9208	Fokovci
00050000-5526-44bb-3c9c-026e92261993	2313	Fram
00050000-5526-44bb-5ce0-30921aa1346f	3213	Frankolovo
00050000-5526-44bb-8053-be404da44336	1274	Gabrovka
00050000-5526-44bb-0db6-1242ebfc7718	8254	Globoko
00050000-5526-44bb-c924-27dbe3bbfe23	5275	Godovič
00050000-5526-44bb-90ae-9acdb8a77040	4204	Golnik
00050000-5526-44bb-8ad5-edb70a3a1e52	3303	Gomilsko
00050000-5526-44bb-94c5-eecca5a7c5e9	4224	Gorenja vas
00050000-5526-44bb-b653-a972674bdec3	3263	Gorica pri Slivnici
00050000-5526-44bb-1b05-206b001e8018	2272	Gorišnica
00050000-5526-44bb-e93d-c439ea9f6eb0	9250	Gornja Radgona
00050000-5526-44bb-745c-77d0c4e59ee4	3342	Gornji Grad
00050000-5526-44bb-67a6-27c7dded6521	4282	Gozd Martuljek
00050000-5526-44bb-fea6-b04ec83c36f4	6272	Gračišče
00050000-5526-44bb-2192-c0c5803bcf2d	9264	Grad
00050000-5526-44bb-af69-a43725028441	8332	Gradac
00050000-5526-44bb-32b0-a77381338661	1384	Grahovo
00050000-5526-44bb-7cea-ea2b570545e1	5242	Grahovo ob Bači
00050000-5526-44bb-a52b-e20c4d80e961	5251	Grgar
00050000-5526-44bb-6a11-14e6b0a223f1	3302	Griže
00050000-5526-44bb-98a4-765ab9e1b393	3231	Grobelno
00050000-5526-44bb-2771-9af454275c42	1290	Grosuplje
00050000-5526-44bb-d826-b0bd4bb6d482	2288	Hajdina
00050000-5526-44bb-b15a-93416072dc76	8362	Hinje
00050000-5526-44bb-cf86-63f8976cd5c2	2311	Hoče
00050000-5526-44bb-4a31-b17e43147503	9205	Hodoš/Hodos
00050000-5526-44bb-8f43-5c36bb09c611	1354	Horjul
00050000-5526-44bb-0462-89e54b42552b	1372	Hotedršica
00050000-5526-44bb-5496-35a5a429fdaa	1430	Hrastnik
00050000-5526-44bb-06d3-49d1b7b5f637	6225	Hruševje
00050000-5526-44bb-adf1-36eeb84ccaaf	4276	Hrušica
00050000-5526-44bb-ec5b-d148a8f9a877	5280	Idrija
00050000-5526-44bb-4eb1-ff8377e100c6	1292	Ig
00050000-5526-44bb-befc-fdab481a608a	6250	Ilirska Bistrica
00050000-5526-44bb-7bd4-583d7e0fec4b	6251	Ilirska Bistrica-Trnovo
00050000-5526-44bb-f964-167f2661aa9c	1295	Ivančna Gorica
00050000-5526-44bb-31d0-1cb88eceadc4	2259	Ivanjkovci
00050000-5526-44bb-dbca-415fc71bfca7	1411	Izlake
00050000-5526-44bb-0b4e-d2c38d60e995	6310	Izola/Isola
00050000-5526-44bb-5d4b-5058768c7ff2	2222	Jakobski Dol
00050000-5526-44bb-a8a5-44e745a3df81	2221	Jarenina
00050000-5526-44bb-3c8a-67437d49506c	6254	Jelšane
00050000-5526-44bb-1353-f76f294172e6	4270	Jesenice
00050000-5526-44bb-a31e-652895244bf2	8261	Jesenice na Dolenjskem
00050000-5526-44bb-b110-699d3a8a618d	3273	Jurklošter
00050000-5526-44bb-25a5-ed2eec10b25b	2223	Jurovski Dol
00050000-5526-44bb-79d7-253f38572d81	2256	Juršinci
00050000-5526-44bb-e2a6-8148e6ca9782	5214	Kal nad Kanalom
00050000-5526-44bb-0f49-91e2c92a8f9c	3233	Kalobje
00050000-5526-44bb-6a14-750c7a7b9b25	4246	Kamna Gorica
00050000-5526-44bb-79e7-95e0b60b0569	2351	Kamnica
00050000-5526-44bb-9544-f1274b04df49	1241	Kamnik
00050000-5526-44bb-2347-c9cffc32d03c	5213	Kanal
00050000-5526-44bb-3026-57594ab6c61b	8258	Kapele
00050000-5526-44bb-0570-b310de9a4cb0	2362	Kapla
00050000-5526-44bb-611f-a4f517857509	2325	Kidričevo
00050000-5526-44bb-ee85-972bf314bf71	1412	Kisovec
00050000-5526-44bb-9d10-b8cfc35d514c	6253	Knežak
00050000-5526-44bb-68d6-af7638cb5a58	5222	Kobarid
00050000-5526-44bb-cbc8-b906dbd93702	9227	Kobilje
00050000-5526-44bb-558f-a372d1541bcd	1330	Kočevje
00050000-5526-44bb-c25b-68693f2862bd	1338	Kočevska Reka
00050000-5526-44bb-9aa5-56aa4ddef532	2276	Kog
00050000-5526-44bb-a320-5f19a8e2518d	5211	Kojsko
00050000-5526-44bb-d849-3d1a1222ae54	6223	Komen
00050000-5526-44bb-6a1c-037451ab198c	1218	Komenda
00050000-5526-44bb-ed56-1e3fd8a0e82a	6000	Koper/Capodistria 
00050000-5526-44bb-8d89-a3aa07da5233	6001	Koper/Capodistria - poštni predali
00050000-5526-44bb-8e15-41327eedb63b	8282	Koprivnica
00050000-5526-44bb-a3af-4419c8168e73	5296	Kostanjevica na Krasu
00050000-5526-44bb-e2c9-55819cb9aaea	8311	Kostanjevica na Krki
00050000-5526-44bb-9db8-a57fc6af8e34	1336	Kostel
00050000-5526-44bb-f8f6-5a751ef2b379	6256	Košana
00050000-5526-44bb-1f79-60f8c24041ea	2394	Kotlje
00050000-5526-44bb-8a15-1254e933b998	6240	Kozina
00050000-5526-44bb-f276-235dd7212425	3260	Kozje
00050000-5526-44bb-8e54-d4538a085b7a	4000	Kranj 
00050000-5526-44bb-ff49-bb14418e22ba	4001	Kranj - poštni predali
00050000-5526-44bb-45c1-765a44095421	4280	Kranjska Gora
00050000-5526-44bb-16a4-c77c6147bb40	1281	Kresnice
00050000-5526-44bb-f81d-ea50a82b42b2	4294	Križe
00050000-5526-44bb-1541-a1d417722eb2	9206	Križevci
00050000-5526-44bb-a281-9e74d707090d	9242	Križevci pri Ljutomeru
00050000-5526-44bb-151e-4c08db6f9c15	1301	Krka
00050000-5526-44bb-ed0e-cb85cc5f57c5	8296	Krmelj
00050000-5526-44bb-8b5b-b17681d41ad6	4245	Kropa
00050000-5526-44bb-3bd9-775353f52a74	8262	Krška vas
00050000-5526-44bb-9926-4bf9548d62e4	8270	Krško
00050000-5526-44bb-bcbb-1b4358fd0c2d	9263	Kuzma
00050000-5526-44bb-b8cf-1b85efcf6626	2318	Laporje
00050000-5526-44bb-d8a6-888e601d9c3c	3270	Laško
00050000-5526-44bb-02e2-febb43cbf8c4	1219	Laze v Tuhinju
00050000-5526-44bb-bba0-29e5eaf3f766	2230	Lenart v Slovenskih goricah
00050000-5526-44bb-2e40-bc500e972fbd	9220	Lendava/Lendva
00050000-5526-44bb-d80c-fbee8133877e	4248	Lesce
00050000-5526-44bb-8448-1acd139662ff	3261	Lesično
00050000-5526-44bb-9057-25559b0afa61	8273	Leskovec pri Krškem
00050000-5526-44bb-5239-bb9b37aabc0a	2372	Libeliče
00050000-5526-44bb-12f0-92d66f4a2bea	2341	Limbuš
00050000-5526-44bb-d1b4-bdac250737a4	1270	Litija
00050000-5526-44bb-5821-d37e9188db84	3202	Ljubečna
00050000-5526-44bb-e295-6c49079529d4	1000	Ljubljana 
00050000-5526-44bb-cb6d-dcbc08e0068a	1001	Ljubljana - poštni predali
00050000-5526-44bb-b2fa-00fcbacf1de8	1231	Ljubljana - Črnuče
00050000-5526-44bb-d95f-726607363198	1261	Ljubljana - Dobrunje
00050000-5526-44bb-9118-01d3ca138cc6	1260	Ljubljana - Polje
00050000-5526-44bb-f065-b7f594bb41a6	1210	Ljubljana - Šentvid
00050000-5526-44bb-645e-fdbd80ac3be0	1211	Ljubljana - Šmartno
00050000-5526-44bb-2c60-86db217459b9	3333	Ljubno ob Savinji
00050000-5526-44bb-338e-df13915d39ec	9240	Ljutomer
00050000-5526-44bb-6af9-19cb030de534	3215	Loče
00050000-5526-44bb-4969-2e3a073449f5	5231	Log pod Mangartom
00050000-5526-44bb-727a-d5d39494f161	1358	Log pri Brezovici
00050000-5526-44bb-3849-99b49ad28c87	1370	Logatec
00050000-5526-44bb-95d6-dca5a0c23a9a	1371	Logatec
00050000-5526-44bb-51f6-82567e63b2b6	1434	Loka pri Zidanem Mostu
00050000-5526-44bb-8e64-a7434859a318	3223	Loka pri Žusmu
00050000-5526-44bb-6276-062234502985	6219	Lokev
00050000-5526-44bb-6c2e-6a1e4459525e	1318	Loški Potok
00050000-5526-44bb-90b6-2f652cac49ff	2324	Lovrenc na Dravskem polju
00050000-5526-44bb-bb82-6ec2196c3164	2344	Lovrenc na Pohorju
00050000-5526-44bb-557e-33008a323151	3334	Luče
00050000-5526-44bb-54ec-0f1b678ad4b4	1225	Lukovica
00050000-5526-44bb-b7f1-5b62555e105c	9202	Mačkovci
00050000-5526-44bb-3e7c-4a0f14f7b910	2322	Majšperk
00050000-5526-44bb-adce-3e44a08f5c23	2321	Makole
00050000-5526-44bb-d8ce-7eb70f339140	9243	Mala Nedelja
00050000-5526-44bb-3ff3-07446c794940	2229	Malečnik
00050000-5526-44bb-157e-c1b84ff7005a	6273	Marezige
00050000-5526-44bb-5077-f0d53023f72f	2000	Maribor 
00050000-5526-44bb-614f-4b37d429d24b	2001	Maribor - poštni predali
00050000-5526-44bb-e8f6-dc46812684eb	2206	Marjeta na Dravskem polju
00050000-5526-44bb-1a8f-74c121220c31	2281	Markovci
00050000-5526-44bb-bb45-8d7a6e4eeba3	9221	Martjanci
00050000-5526-44bb-954b-f666d63cd644	6242	Materija
00050000-5526-44bb-a72f-fb0ce10933a6	4211	Mavčiče
00050000-5526-44bb-d4ce-d23bfb348464	1215	Medvode
00050000-5526-44bb-3ff5-c9914a12a21c	1234	Mengeš
00050000-5526-44bb-253e-8f9391d557ef	8330	Metlika
00050000-5526-44bb-ca6b-ef5f7fe22699	2392	Mežica
00050000-5526-44bb-694f-0dd8fad55b27	2204	Miklavž na Dravskem polju
00050000-5526-44bb-af9c-334a6d2b412b	2275	Miklavž pri Ormožu
00050000-5526-44bb-1546-c2edee9d57e8	5291	Miren
00050000-5526-44bb-60bf-a9daba8cbe36	8233	Mirna
00050000-5526-44bb-7682-53c1308a2b7e	8216	Mirna Peč
00050000-5526-44bb-59da-30600b429de5	2382	Mislinja
00050000-5526-44bb-abe9-799392ad4776	4281	Mojstrana
00050000-5526-44bb-d7cb-cfbc3221c424	8230	Mokronog
00050000-5526-44bb-0349-f97192302ff0	1251	Moravče
00050000-5526-44bb-cebc-57ec3d933085	9226	Moravske Toplice
00050000-5526-44bb-4f7f-c7c5953ffcfd	5216	Most na Soči
00050000-5526-44bb-1930-ef1f2ca4437c	1221	Motnik
00050000-5526-44bb-8d2b-ade55d2049ab	3330	Mozirje
00050000-5526-44bb-ca4b-6d0479cbcd3d	9000	Murska Sobota 
00050000-5526-44bb-829f-b6b2f4fa18ca	9001	Murska Sobota - poštni predali
00050000-5526-44bb-4fe6-2b74c09d9ec0	2366	Muta
00050000-5526-44bb-b217-7068a6242357	4202	Naklo
00050000-5526-44bb-386e-fd5c3b03765c	3331	Nazarje
00050000-5526-44bb-6947-5fe5991f0982	1357	Notranje Gorice
00050000-5526-44bb-5c69-4d15c6179b0f	3203	Nova Cerkev
00050000-5526-44bb-9300-19d195e49f59	5000	Nova Gorica 
00050000-5526-44bb-3a88-969fdf904058	5001	Nova Gorica - poštni predali
00050000-5526-44bb-39f9-e76c21d57818	1385	Nova vas
00050000-5526-44bb-3364-bee89a4ef18c	8000	Novo mesto
00050000-5526-44bb-d3c0-9155d266669c	8001	Novo mesto - poštni predali
00050000-5526-44bb-8ec1-093128867086	6243	Obrov
00050000-5526-44bb-95c8-f314f3e59a9b	9233	Odranci
00050000-5526-44bb-354c-891501130e5e	2317	Oplotnica
00050000-5526-44bb-2620-96536fb14c7d	2312	Orehova vas
00050000-5526-44bb-e3a3-a3930ae112e8	2270	Ormož
00050000-5526-44bb-f890-c2573fa1b538	1316	Ortnek
00050000-5526-44bb-851e-ddfce25f78ac	1337	Osilnica
00050000-5526-44bb-5a9c-06d69c65586c	8222	Otočec
00050000-5526-44bb-8057-6f1e6ffa8cd4	2361	Ožbalt
00050000-5526-44bb-9c56-dfeaa0314ed6	2231	Pernica
00050000-5526-44bb-da3a-93266fdf1875	2211	Pesnica pri Mariboru
00050000-5526-44bb-256b-aa1b145b9dee	9203	Petrovci
00050000-5526-44bb-6b49-2fafe0a19529	3301	Petrovče
00050000-5526-44bb-0492-4b728681993c	6330	Piran/Pirano
00050000-5526-44bb-b059-5b71b9c85382	8255	Pišece
00050000-5526-44bb-246d-31c73c669485	6257	Pivka
00050000-5526-44bb-6108-a9e0f9728ce4	6232	Planina
00050000-5526-44bb-cbb5-afa373e37303	3225	Planina pri Sevnici
00050000-5526-44bb-56a4-c28f48c8ab33	6276	Pobegi
00050000-5526-44bb-2c81-b9a8c79e0dea	8312	Podbočje
00050000-5526-44bb-f336-c0574728fbd1	5243	Podbrdo
00050000-5526-44bb-225f-d0370cf25275	3254	Podčetrtek
00050000-5526-44bb-73d0-cf609186477f	2273	Podgorci
00050000-5526-44bb-648c-65a907b010bb	6216	Podgorje
00050000-5526-44bb-96ad-5a4d398f2971	2381	Podgorje pri Slovenj Gradcu
00050000-5526-44bb-21ba-6740dcc7b1df	6244	Podgrad
00050000-5526-44bb-5326-d6fab1d1678b	1414	Podkum
00050000-5526-44bb-b8bc-98f8c43d63ba	2286	Podlehnik
00050000-5526-44bb-7cc7-636191ab92f9	5272	Podnanos
00050000-5526-44bb-d872-6e305b42ccde	4244	Podnart
00050000-5526-44bb-a97a-32b3041c1560	3241	Podplat
00050000-5526-44bb-0fbf-e3925c42254a	3257	Podsreda
00050000-5526-44bb-86af-dc85b8c21855	2363	Podvelka
00050000-5526-44bb-aa43-1049e7589b62	2208	Pohorje
00050000-5526-44bb-6e6a-efeacaba8bdf	2257	Polenšak
00050000-5526-44bb-eda5-7793e9787569	1355	Polhov Gradec
00050000-5526-44bb-4b87-7aae5434bd9b	4223	Poljane nad Škofjo Loko
00050000-5526-44bb-f83b-b0c8d68de8a7	2319	Poljčane
00050000-5526-44bb-6a5c-a23ba6245bca	1272	Polšnik
00050000-5526-44bb-0d80-eee8d428aa78	3313	Polzela
00050000-5526-44bb-9372-f530e7c8ac0a	3232	Ponikva
00050000-5526-44bb-05e5-50f78b1adbb0	6320	Portorož/Portorose
00050000-5526-44bb-2498-8c71049b8ae8	6230	Postojna
00050000-5526-44bb-6874-b2c35281990a	2331	Pragersko
00050000-5526-44bb-2d5a-0c571be6c6aa	3312	Prebold
00050000-5526-44bb-75e8-c1662be5a019	4205	Preddvor
00050000-5526-44bb-e475-a6fc2238bd9a	6255	Prem
00050000-5526-44bb-be94-1568b2c6ef3a	1352	Preserje
00050000-5526-44bb-bffa-160496e3847b	6258	Prestranek
00050000-5526-44bb-3e00-f1ec9959fa11	2391	Prevalje
00050000-5526-44bb-a2c5-f48cb438ea19	3262	Prevorje
00050000-5526-44bb-09f8-40d58b2db0d8	1276	Primskovo 
00050000-5526-44bb-d3c7-89f0b4aef388	3253	Pristava pri Mestinju
00050000-5526-44bb-9f0c-3baa9a77610b	9207	Prosenjakovci/Partosfalva
00050000-5526-44bb-8005-dd2e30c59060	5297	Prvačina
00050000-5526-44bb-48a4-0d92b4b9d40c	2250	Ptuj
00050000-5526-44bb-952e-39b8481323b2	2323	Ptujska Gora
00050000-5526-44bb-bea3-0e133fd47007	9201	Puconci
00050000-5526-44bb-ffc0-1949bd674530	2327	Rače
00050000-5526-44bb-dce1-5120a7c9b5ef	1433	Radeče
00050000-5526-44bb-118b-aa00aacfda5f	9252	Radenci
00050000-5526-44bb-4e71-0e6b591f4c99	2360	Radlje ob Dravi
00050000-5526-44bb-45de-8a23a082b2ee	1235	Radomlje
00050000-5526-44bb-b3e7-117324d5112f	4240	Radovljica
00050000-5526-44bb-d52c-984f4c130eb3	8274	Raka
00050000-5526-44bb-2017-85a857ae0fbb	1381	Rakek
00050000-5526-44bb-c07a-2c18e0676eb3	4283	Rateče - Planica
00050000-5526-44bb-7882-ad12ebd3d957	2390	Ravne na Koroškem
00050000-5526-44bb-6e49-ea887f308a5d	9246	Razkrižje
00050000-5526-44bb-2c75-1aec413fb0a3	3332	Rečica ob Savinji
00050000-5526-44bb-edc7-7a7847e480b5	5292	Renče
00050000-5526-44bb-d0cd-531e4161b92d	1310	Ribnica
00050000-5526-44bb-7ff5-d39d0a575fe8	2364	Ribnica na Pohorju
00050000-5526-44bb-3eab-992ba07a5319	3272	Rimske Toplice
00050000-5526-44bb-8111-8cd95bb7683c	1314	Rob
00050000-5526-44bb-bf67-ef866e5fd81b	5215	Ročinj
00050000-5526-44bb-94aa-a75d78214259	3250	Rogaška Slatina
00050000-5526-44bb-3412-3626166eaabe	9262	Rogašovci
00050000-5526-44bb-29cd-2310b9a6e57c	3252	Rogatec
00050000-5526-44bb-6713-c361ddca7b9a	1373	Rovte
00050000-5526-44bb-5014-86b35c6b3622	2342	Ruše
00050000-5526-44bb-96cf-47084b2b81df	1282	Sava
00050000-5526-44bb-2e3b-32f6ee2e92da	6333	Sečovlje/Sicciole
00050000-5526-44bb-8ada-ec06f0c7a6e5	4227	Selca
00050000-5526-44bb-6236-37ecdc84fc29	2352	Selnica ob Dravi
00050000-5526-44bb-1b6c-19152ee1d449	8333	Semič
00050000-5526-44bb-cd0d-4ea3983514c4	8281	Senovo
00050000-5526-44bb-61c9-0d47fe5551da	6224	Senožeče
00050000-5526-44bb-9f41-f0d4279358eb	8290	Sevnica
00050000-5526-44bb-418b-7330067685b1	6210	Sežana
00050000-5526-44bb-7f87-8f4732ffc385	2214	Sladki Vrh
00050000-5526-44bb-4394-f0fee4edacd5	5283	Slap ob Idrijci
00050000-5526-44bb-a83e-8782843162fb	2380	Slovenj Gradec
00050000-5526-44bb-7b34-a20abada77d9	2310	Slovenska Bistrica
00050000-5526-44bb-6e10-08af50135a75	3210	Slovenske Konjice
00050000-5526-44bb-084f-6e50c2b26556	1216	Smlednik
00050000-5526-44bb-531a-de40f65d91d6	5232	Soča
00050000-5526-44bb-7a13-b8dd64fb33e0	1317	Sodražica
00050000-5526-44bb-ace7-34122d27c7d4	3335	Solčava
00050000-5526-44bb-3c29-616d76ef0487	5250	Solkan
00050000-5526-44bb-d80f-9d9d329fd133	4229	Sorica
00050000-5526-44bb-6f60-4ba5e622e503	4225	Sovodenj
00050000-5526-44bb-9ea4-2f61317241ec	5281	Spodnja Idrija
00050000-5526-44bb-dbdd-be8d8376608a	2241	Spodnji Duplek
00050000-5526-44bb-ec57-7a6c85b556a5	9245	Spodnji Ivanjci
00050000-5526-44bb-8cb2-5163271e812a	2277	Središče ob Dravi
00050000-5526-44bb-b0f4-df3fbd6597d8	4267	Srednja vas v Bohinju
00050000-5526-44bb-13af-e2c6ec40037f	8256	Sromlje 
00050000-5526-44bb-b291-13876e92bbfa	5224	Srpenica
00050000-5526-44bb-fd72-05e797c196aa	1242	Stahovica
00050000-5526-44bb-0d0e-6271a1c7328d	1332	Stara Cerkev
00050000-5526-44bb-f790-007a82a87030	8342	Stari trg ob Kolpi
00050000-5526-44bb-f033-18532825c108	1386	Stari trg pri Ložu
00050000-5526-44bb-0195-2ab94e232a41	2205	Starše
00050000-5526-44bb-6ea2-a2b6f4d9a2fd	2289	Stoperce
00050000-5526-44bb-10da-af82f9cd51f9	8322	Stopiče
00050000-5526-44bb-a56b-ac252210f4dd	3206	Stranice
00050000-5526-44bb-46f8-9e3ff85261ee	8351	Straža
00050000-5526-44bb-6219-678c5c7e718d	1313	Struge
00050000-5526-44bb-9708-c88e74089066	8293	Studenec
00050000-5526-44bb-3b37-3bcb64ffe805	8331	Suhor
00050000-5526-44bb-dcbc-e41f7a1af09a	2233	Sv. Ana v Slovenskih goricah
00050000-5526-44bb-dabf-0b23da7e7da1	2235	Sv. Trojica v Slovenskih goricah
00050000-5526-44bb-565d-c780e872fddd	2353	Sveti Duh na Ostrem Vrhu
00050000-5526-44bb-b98b-0b4f17b1d536	9244	Sveti Jurij ob Ščavnici
00050000-5526-44bb-4b11-8e75019c8a10	3264	Sveti Štefan
00050000-5526-44bb-471e-614467a37474	2258	Sveti Tomaž
00050000-5526-44bb-7974-2eedcaba303b	9204	Šalovci
00050000-5526-44bb-33b1-e35a90f313d4	5261	Šempas
00050000-5526-44bb-33ea-6e065c6962cb	5290	Šempeter pri Gorici
00050000-5526-44bb-a47e-40b5d6fcfe42	3311	Šempeter v Savinjski dolini
00050000-5526-44bb-535f-e9d4a45d9343	4208	Šenčur
00050000-5526-44bb-b4f6-3bc1892a410c	2212	Šentilj v Slovenskih goricah
00050000-5526-44bb-d62c-76515afd6c0d	8297	Šentjanž
00050000-5526-44bb-9760-bacb823663aa	2373	Šentjanž pri Dravogradu
00050000-5526-44bb-ecfd-27cb2e716861	8310	Šentjernej
00050000-5526-44bb-7a71-4aedc56e58ba	3230	Šentjur
00050000-5526-44bb-5a47-f97848c7ba86	3271	Šentrupert
00050000-5526-44bb-3e44-1bfd0ee90978	8232	Šentrupert
00050000-5526-44bb-3198-be9ea99f5717	1296	Šentvid pri Stični
00050000-5526-44bb-5d52-a64195258298	8275	Škocjan
00050000-5526-44bb-b0b6-ba62d93c0e59	6281	Škofije
00050000-5526-44bb-4036-4dadb556c549	4220	Škofja Loka
00050000-5526-44bb-ae27-6aa60719f061	3211	Škofja vas
00050000-5526-44bb-ea1a-57d94ad1d34f	1291	Škofljica
00050000-5526-44bb-461f-8cd3f36eca9c	6274	Šmarje
00050000-5526-44bb-c5fe-32105bfe6503	1293	Šmarje - Sap
00050000-5526-44bb-d882-7bae184bf168	3240	Šmarje pri Jelšah
00050000-5526-44bb-a58a-709e7556a302	8220	Šmarješke Toplice
00050000-5526-44bb-7e37-297aa1b57fe3	2315	Šmartno na Pohorju
00050000-5526-44bb-80ac-882fc521171d	3341	Šmartno ob Dreti
00050000-5526-44bb-84df-f2a9687c54b7	3327	Šmartno ob Paki
00050000-5526-44bb-a8e5-e7cc7b8729b5	1275	Šmartno pri Litiji
00050000-5526-44bb-c2c6-f180b73cf9f1	2383	Šmartno pri Slovenj Gradcu
00050000-5526-44bb-767c-14f3b2d721c9	3201	Šmartno v Rožni dolini
00050000-5526-44bb-5f89-67290feb735b	3325	Šoštanj
00050000-5526-44bb-a6f6-521269aa1c12	6222	Štanjel
00050000-5526-44bb-57df-844b655bdae4	3220	Štore
00050000-5526-44bb-2eca-4ef6db6378a5	3304	Tabor
00050000-5526-44bb-1a48-e87c6681a544	3221	Teharje
00050000-5526-44bb-f4fc-9a03ee08e0e1	9251	Tišina
00050000-5526-44bb-1229-bed02eaae96f	5220	Tolmin
00050000-5526-44bb-fc07-b69f3687d216	3326	Topolšica
00050000-5526-44bb-1648-5fd1ccc4dcac	2371	Trbonje
00050000-5526-44bb-8c01-2bfb6ba2666d	1420	Trbovlje
00050000-5526-44bb-3c4c-9701efe5cdf3	8231	Trebelno 
00050000-5526-44bb-735b-3fab1f623e95	8210	Trebnje
00050000-5526-44bb-11f5-fecebcc21bc8	5252	Trnovo pri Gorici
00050000-5526-44bb-8121-34049f4d3033	2254	Trnovska vas
00050000-5526-44bb-4079-c9b948698764	1222	Trojane
00050000-5526-44bb-0054-75bbd39b5038	1236	Trzin
00050000-5526-44bb-8ff3-c1e54929036e	4290	Tržič
00050000-5526-44bb-98e5-466985340cff	8295	Tržišče
00050000-5526-44bb-353a-4e5647e91e2e	1311	Turjak
00050000-5526-44bb-b3b5-b2899d7b9c55	9224	Turnišče
00050000-5526-44bb-df62-3b48d15233f1	8323	Uršna sela
00050000-5526-44bb-ab4e-39e7eb82a9de	1252	Vače
00050000-5526-44bb-bef5-4ff5339f24d3	3320	Velenje 
00050000-5526-44bb-91dc-5f481759fa66	3322	Velenje - poštni predali
00050000-5526-44bb-c739-57cd354f71d7	8212	Velika Loka
00050000-5526-44bb-0831-d419834316a0	2274	Velika Nedelja
00050000-5526-44bb-725b-786c35092e84	9225	Velika Polana
00050000-5526-44bb-5d01-6801019e48c7	1315	Velike Lašče
00050000-5526-44bb-57f1-2535a5b2b28c	8213	Veliki Gaber
00050000-5526-44bb-1a78-e6ce622d977e	9241	Veržej
00050000-5526-44bb-ca9e-fc71350fe4d6	1312	Videm - Dobrepolje
00050000-5526-44bb-d37f-1ef11cfceaa2	2284	Videm pri Ptuju
00050000-5526-44bb-9d00-6e0f34e52cc5	8344	Vinica
00050000-5526-44bb-9355-1e7dff6b3d97	5271	Vipava
00050000-5526-44bb-541b-cced6ee57ad7	4212	Visoko
00050000-5526-44bb-003b-6c8e12e0d01c	1294	Višnja Gora
00050000-5526-44bb-7a84-245724ccca7d	3205	Vitanje
00050000-5526-44bb-8582-566f0d9ccb4c	2255	Vitomarci
00050000-5526-44bb-e1c9-784aff901eac	1217	Vodice
00050000-5526-44bb-974b-af743e7af8fd	3212	Vojnik\t
00050000-5526-44bb-9806-f8a5a6f76267	5293	Volčja Draga
00050000-5526-44bb-9b99-3239e51d5533	2232	Voličina
00050000-5526-44bb-a94c-2bf4a2b48cc0	3305	Vransko
00050000-5526-44bb-8d66-6d409914ba3a	6217	Vremski Britof
00050000-5526-44bb-189b-083e83cb5928	1360	Vrhnika
00050000-5526-44bb-afff-d91fac581202	2365	Vuhred
00050000-5526-44bb-2b36-c0f3972dda11	2367	Vuzenica
00050000-5526-44bb-c75f-6a90990debcf	8292	Zabukovje 
00050000-5526-44bb-25ce-f3e8819a544c	1410	Zagorje ob Savi
00050000-5526-44bb-5b0c-9f5cc066debd	1303	Zagradec
00050000-5526-44bb-b23b-8280b26dd17f	2283	Zavrč
00050000-5526-44bb-1fa2-e38c8f7c3791	8272	Zdole 
00050000-5526-44bb-7c34-829a1dba2625	4201	Zgornja Besnica
00050000-5526-44bb-35ce-d032045c260e	2242	Zgornja Korena
00050000-5526-44bb-5254-656d4bd34c66	2201	Zgornja Kungota
00050000-5526-44bb-b60a-45f6aa3301bd	2316	Zgornja Ložnica
00050000-5526-44bb-87f2-a9a5b4448a86	2314	Zgornja Polskava
00050000-5526-44bb-23f6-9fcd13a95165	2213	Zgornja Velka
00050000-5526-44bb-db13-43b101b309e1	4247	Zgornje Gorje
00050000-5526-44bb-51d3-969531f44c4d	4206	Zgornje Jezersko
00050000-5526-44bb-2e46-025d9428237e	2285	Zgornji Leskovec
00050000-5526-44bb-059f-22e211dbcfc2	1432	Zidani Most
00050000-5526-44bb-9be9-907be2cf78dc	3214	Zreče
00050000-5526-44bb-59a3-ad3dae86058c	4209	Žabnica
00050000-5526-44bb-c110-ae0ae257dc25	3310	Žalec
00050000-5526-44bb-335b-adc7ec1a3a9f	4228	Železniki
00050000-5526-44bb-3629-060915639865	2287	Žetale
00050000-5526-44bb-491b-82bf028bc34e	4226	Žiri
00050000-5526-44bb-1f10-187af660bebd	4274	Žirovnica
00050000-5526-44bb-76ef-c41afb42ea56	8360	Žužemberk
\.


--
-- TOC entry 2845 (class 0 OID 2195284)
-- Dependencies: 201
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2829 (class 0 OID 2195134)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 2195210)
-- Dependencies: 192
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 2195290)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2859 (class 0 OID 2195427)
-- Dependencies: 215
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2860 (class 0 OID 2195436)
-- Dependencies: 216
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2847 (class 0 OID 2195297)
-- Dependencies: 203
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2848 (class 0 OID 2195306)
-- Dependencies: 204
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2849 (class 0 OID 2195315)
-- Dependencies: 205
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2861 (class 0 OID 2195443)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2862 (class 0 OID 2195453)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2816 (class 0 OID 2194981)
-- Dependencies: 172
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5526-44bc-5d79-b8f924dd1aad	00010000-5526-44bc-3b21-159862ef9739	2015-04-09 09:22:09	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROyADSCNAl06h06ub6CG0Cwjj6sLYDo7m";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2875 (class 0 OID 0)
-- Dependencies: 171
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2850 (class 0 OID 2195325)
-- Dependencies: 206
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2817 (class 0 OID 2194990)
-- Dependencies: 173
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00000000-5526-44bc-d10d-20075fbe9327	beri-vse	Polni dostop do vsega v aplikaciji.	t
00000000-5526-44bc-5436-4f9fa7eb3437	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00000000-5526-44bc-87b5-df451eef6b63	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00000000-5526-44bc-e656-7ae280e3fd02	ifi-all	Polni dostop do vsega v aplikaciji.	t
00000000-5526-44bc-fa03-352a19355753	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00000000-5526-44bc-5469-76bc446235a4	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2820 (class 0 OID 2195019)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5526-44bc-5d79-b8f924dd1aad	00000000-5526-44bc-e656-7ae280e3fd02
00010000-5526-44bc-31a3-94dda6a0aa11	00000000-5526-44bc-87b5-df451eef6b63
\.


--
-- TOC entry 2851 (class 0 OID 2195331)
-- Dependencies: 207
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 2195343)
-- Dependencies: 208
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2837 (class 0 OID 2195218)
-- Dependencies: 193
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 2195149)
-- Dependencies: 186
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2840 (class 0 OID 2195243)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2863 (class 0 OID 2195463)
-- Dependencies: 219
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 2195156)
-- Dependencies: 187
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 2195007)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, username, password, enabled, expires, defaultroute, defaultrouteparams, email) FROM stdin;
00010000-5526-44bc-3b21-159862ef9739	Konzolni	console	$2y$05$NS4xMjkyMTcwMzExMjAxROX08cdSjr/BtwV0qRge5HyAB.WOpeVBi	t	\N	\N	\N	rootmail@max.si
00010000-5526-44bc-31a3-94dda6a0aa11	Anonimni	anonymous	$2y$05$NS4xMjkyMTcwMzExMjAxROPZWrfvzOcycpkLxo5tCQK6S4t9Gvid6	t	\N	\N	\N	noreply@max.si
00010000-5526-44bc-5d79-b8f924dd1aad	Administrator	admin	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@max.si
\.


--
-- TOC entry 2864 (class 0 OID 2195472)
-- Dependencies: 220
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 2195224)
-- Dependencies: 194
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 2195349)
-- Dependencies: 209
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2865 (class 0 OID 2195490)
-- Dependencies: 221
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2839 (class 0 OID 2195230)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2866 (class 0 OID 2195498)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2867 (class 0 OID 2195508)
-- Dependencies: 223
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2462 (class 2606 OID 2195034)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 2195361)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 2195381)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 2195399)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 2606 OID 2195182)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 2195196)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 2195047)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 2195409)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 2195202)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 2195208)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 2195095)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 2195260)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 2195268)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 2195062)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 2195072)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 2195123)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2453 (class 2606 OID 2195004)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2444 (class 2606 OID 2194978)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 2195274)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 2195283)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2606 (class 2606 OID 2195423)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 2195116)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 2195132)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 2195288)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 2195146)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 2195214)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 2195294)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 2195433)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 2195441)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 2195304)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 2195310)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 2195320)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 2195452)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 2195460)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 2194989)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 2195329)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 2195023)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2448 (class 2606 OID 2194998)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 2195339)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 2195348)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 2195223)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 2195153)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 2195252)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 2195471)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 2195167)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 2195017)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 2195486)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 2195228)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 2195355)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 2195496)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 2195242)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 2195507)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 2195517)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 1259 OID 2195189)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2480 (class 1259 OID 2195118)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2544 (class 1259 OID 2195275)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2552 (class 1259 OID 2195296)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2553 (class 1259 OID 2195295)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2529 (class 1259 OID 2195229)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2599 (class 1259 OID 2195412)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2600 (class 1259 OID 2195410)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2601 (class 1259 OID 2195411)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2602 (class 1259 OID 2195424)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2603 (class 1259 OID 2195425)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2604 (class 1259 OID 2195426)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2622 (class 1259 OID 2195489)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2623 (class 1259 OID 2195488)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2624 (class 1259 OID 2195487)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2499 (class 1259 OID 2195169)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2500 (class 1259 OID 2195168)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2484 (class 1259 OID 2195125)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2485 (class 1259 OID 2195124)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2571 (class 1259 OID 2195330)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2521 (class 1259 OID 2195209)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2450 (class 1259 OID 2195005)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2451 (class 1259 OID 2195006)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2574 (class 1259 OID 2195342)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2575 (class 1259 OID 2195341)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2576 (class 1259 OID 2195340)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2522 (class 1259 OID 2195215)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2523 (class 1259 OID 2195217)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2524 (class 1259 OID 2195216)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2565 (class 1259 OID 2195324)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2566 (class 1259 OID 2195322)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2567 (class 1259 OID 2195321)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2568 (class 1259 OID 2195323)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2457 (class 1259 OID 2195024)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2458 (class 1259 OID 2195025)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2581 (class 1259 OID 2195356)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2549 (class 1259 OID 2195289)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2616 (class 1259 OID 2195461)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2617 (class 1259 OID 2195462)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2491 (class 1259 OID 2195147)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2492 (class 1259 OID 2195148)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2607 (class 1259 OID 2195434)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2608 (class 1259 OID 2195435)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2586 (class 1259 OID 2195364)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2587 (class 1259 OID 2195363)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2588 (class 1259 OID 2195366)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2589 (class 1259 OID 2195362)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2590 (class 1259 OID 2195365)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2627 (class 1259 OID 2195497)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2559 (class 1259 OID 2195314)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2560 (class 1259 OID 2195313)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2561 (class 1259 OID 2195311)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2562 (class 1259 OID 2195312)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2476 (class 1259 OID 2195096)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2593 (class 1259 OID 2195383)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2594 (class 1259 OID 2195382)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2518 (class 1259 OID 2195203)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2472 (class 1259 OID 2195074)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2473 (class 1259 OID 2195073)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2495 (class 1259 OID 2195154)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2496 (class 1259 OID 2195155)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2534 (class 1259 OID 2195255)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2535 (class 1259 OID 2195254)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2536 (class 1259 OID 2195253)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2506 (class 1259 OID 2195191)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2507 (class 1259 OID 2195187)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2508 (class 1259 OID 2195184)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2509 (class 1259 OID 2195185)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2510 (class 1259 OID 2195183)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2511 (class 1259 OID 2195188)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2512 (class 1259 OID 2195186)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2483 (class 1259 OID 2195117)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2465 (class 1259 OID 2195048)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2466 (class 1259 OID 2195050)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2467 (class 1259 OID 2195049)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2468 (class 1259 OID 2195051)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2541 (class 1259 OID 2195261)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2471 (class 1259 OID 2195063)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2454 (class 1259 OID 2195018)
-- Name: uniq_7fb775b7f85e0677; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7f85e0677 ON uporabniki USING btree (username);


--
-- TOC entry 2558 (class 1259 OID 2195305)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2479 (class 1259 OID 2195097)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2490 (class 1259 OID 2195133)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 2195442)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2449 (class 1259 OID 2194999)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2513 (class 1259 OID 2195190)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2655 (class 2606 OID 2195623)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2652 (class 2606 OID 2195608)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2653 (class 2606 OID 2195613)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2657 (class 2606 OID 2195633)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2651 (class 2606 OID 2195603)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2656 (class 2606 OID 2195628)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2654 (class 2606 OID 2195618)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2642 (class 2606 OID 2195558)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2668 (class 2606 OID 2195688)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2671 (class 2606 OID 2195703)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2670 (class 2606 OID 2195698)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2663 (class 2606 OID 2195663)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2694 (class 2606 OID 2195818)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2692 (class 2606 OID 2195808)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2693 (class 2606 OID 2195813)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2667 (class 2606 OID 2195683)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2695 (class 2606 OID 2195823)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2696 (class 2606 OID 2195828)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2697 (class 2606 OID 2195833)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2705 (class 2606 OID 2195873)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2704 (class 2606 OID 2195868)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2703 (class 2606 OID 2195863)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2650 (class 2606 OID 2195598)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2649 (class 2606 OID 2195593)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2644 (class 2606 OID 2195568)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2643 (class 2606 OID 2195563)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2680 (class 2606 OID 2195748)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2659 (class 2606 OID 2195643)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2634 (class 2606 OID 2195518)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2635 (class 2606 OID 2195523)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2683 (class 2606 OID 2195763)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2682 (class 2606 OID 2195758)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2681 (class 2606 OID 2195753)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2660 (class 2606 OID 2195648)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2662 (class 2606 OID 2195658)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2661 (class 2606 OID 2195653)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2679 (class 2606 OID 2195743)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2677 (class 2606 OID 2195733)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2676 (class 2606 OID 2195728)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2678 (class 2606 OID 2195738)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2636 (class 2606 OID 2195528)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2637 (class 2606 OID 2195533)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2684 (class 2606 OID 2195768)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2669 (class 2606 OID 2195693)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2701 (class 2606 OID 2195853)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2702 (class 2606 OID 2195858)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2645 (class 2606 OID 2195573)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2646 (class 2606 OID 2195578)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2698 (class 2606 OID 2195838)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2699 (class 2606 OID 2195843)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2687 (class 2606 OID 2195783)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2686 (class 2606 OID 2195778)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2689 (class 2606 OID 2195793)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2685 (class 2606 OID 2195773)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2688 (class 2606 OID 2195788)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2706 (class 2606 OID 2195878)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2675 (class 2606 OID 2195723)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2674 (class 2606 OID 2195718)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2672 (class 2606 OID 2195708)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2673 (class 2606 OID 2195713)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2640 (class 2606 OID 2195548)
-- Name: fk_b7229ce169e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT fk_b7229ce169e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2641 (class 2606 OID 2195553)
-- Name: fk_b7229ce1a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT fk_b7229ce1a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2691 (class 2606 OID 2195803)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2690 (class 2606 OID 2195798)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2658 (class 2606 OID 2195638)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2700 (class 2606 OID 2195848)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2639 (class 2606 OID 2195543)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2638 (class 2606 OID 2195538)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2647 (class 2606 OID 2195583)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2648 (class 2606 OID 2195588)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2666 (class 2606 OID 2195678)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2665 (class 2606 OID 2195673)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2664 (class 2606 OID 2195668)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-09 11:40:02 CEST

--
-- PostgreSQL database dump complete
--

