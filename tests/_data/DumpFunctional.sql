--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-04-13 10:45:52 CEST

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
-- TOC entry 177 (class 1259 OID 95702)
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
-- TOC entry 223 (class 1259 OID 96184)
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
-- TOC entry 222 (class 1259 OID 96167)
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
-- TOC entry 215 (class 1259 OID 96083)
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
-- TOC entry 191 (class 1259 OID 95867)
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
-- TOC entry 194 (class 1259 OID 95908)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 187 (class 1259 OID 95829)
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
-- TOC entry 210 (class 1259 OID 96033)
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
-- TOC entry 189 (class 1259 OID 95854)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 193 (class 1259 OID 95902)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 179 (class 1259 OID 95722)
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
-- TOC entry 199 (class 1259 OID 95951)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 203 (class 1259 OID 95976)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 185 (class 1259 OID 95803)
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
-- TOC entry 178 (class 1259 OID 95711)
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
-- TOC entry 182 (class 1259 OID 95773)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 174 (class 1259 OID 95676)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 95695)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 95983)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 96013)
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
-- TOC entry 219 (class 1259 OID 96125)
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
-- TOC entry 181 (class 1259 OID 95752)
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
-- TOC entry 184 (class 1259 OID 95795)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 95957)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 183 (class 1259 OID 95780)
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
-- TOC entry 188 (class 1259 OID 95846)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 95969)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 96074)
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
-- TOC entry 218 (class 1259 OID 96118)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 95998)
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
-- TOC entry 198 (class 1259 OID 95942)
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
-- TOC entry 197 (class 1259 OID 95932)
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
-- TOC entry 217 (class 1259 OID 96108)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 96064)
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
-- TOC entry 171 (class 1259 OID 95648)
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
-- TOC entry 170 (class 1259 OID 95646)
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
-- TOC entry 207 (class 1259 OID 96007)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 95685)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 95669)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 96021)
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
-- TOC entry 201 (class 1259 OID 95963)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 95913)
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
-- TOC entry 180 (class 1259 OID 95745)
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
-- TOC entry 196 (class 1259 OID 95919)
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
-- TOC entry 216 (class 1259 OID 96099)
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
-- TOC entry 186 (class 1259 OID 95815)
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
-- TOC entry 172 (class 1259 OID 95657)
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
-- TOC entry 221 (class 1259 OID 96149)
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
-- TOC entry 190 (class 1259 OID 95861)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 205 (class 1259 OID 95990)
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
-- TOC entry 212 (class 1259 OID 96056)
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
-- TOC entry 192 (class 1259 OID 95889)
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
-- TOC entry 220 (class 1259 OID 96139)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 96046)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2093 (class 2604 OID 95651)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2595 (class 0 OID 95702)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 96184)
-- Dependencies: 223
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 96167)
-- Dependencies: 222
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 96083)
-- Dependencies: 215
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2609 (class 0 OID 95867)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2612 (class 0 OID 95908)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2605 (class 0 OID 95829)
-- Dependencies: 187
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-552b-7002-8831-19a09d3c9845	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-552b-7002-0877-9cfae757fa15	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-552b-7002-09be-7b2f2b9524b0	AL	ALB	008	Albania 	Albanija	\N
00040000-552b-7002-0eb8-711ca0ba7283	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-552b-7002-dff2-41b6dd73f252	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-552b-7002-fc02-25d772ee9fda	AD	AND	020	Andorra 	Andora	\N
00040000-552b-7002-6714-a9a136036a8e	AO	AGO	024	Angola 	Angola	\N
00040000-552b-7002-9459-1fb1d9bc9bca	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-552b-7002-2a30-c0055b1dd4ad	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-552b-7002-f002-d815da4e203e	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-552b-7002-79a5-610ad62109fb	AR	ARG	032	Argentina 	Argenitna	\N
00040000-552b-7002-b0da-8cf273b44419	AM	ARM	051	Armenia 	Armenija	\N
00040000-552b-7002-fe27-17bf05de0952	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-552b-7002-9cbe-8d2ecccecd64	AU	AUS	036	Australia 	Avstralija	\N
00040000-552b-7002-76de-68b65bbbe137	AT	AUT	040	Austria 	Avstrija	\N
00040000-552b-7002-a300-bbdb25782211	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-552b-7002-e3da-5e0cedcc3585	BS	BHS	044	Bahamas 	Bahami	\N
00040000-552b-7002-6ea1-9b2a6e1ce785	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-552b-7002-b53f-7e4f451f1513	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-552b-7002-cf8a-580fd296a8bd	BB	BRB	052	Barbados 	Barbados	\N
00040000-552b-7002-6f3f-251a77843f93	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-552b-7002-355c-a29465259c0c	BE	BEL	056	Belgium 	Belgija	\N
00040000-552b-7002-e5bb-f43f5d837578	BZ	BLZ	084	Belize 	Belize	\N
00040000-552b-7002-62fc-d3a17da22dd1	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-552b-7002-e1b2-83817da96bba	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-552b-7002-605b-17988d28e3ee	BT	BTN	064	Bhutan 	Butan	\N
00040000-552b-7002-29a2-f3d09b2e56cc	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-552b-7002-c555-17fd850e2c8b	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-552b-7002-1c18-9c000f1149cd	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-552b-7002-aaf5-61212b6b3954	BW	BWA	072	Botswana 	Bocvana	\N
00040000-552b-7002-e6a8-4e59875ea10e	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-552b-7002-5dd4-e59f4bbe6e2a	BR	BRA	076	Brazil 	Brazilija	\N
00040000-552b-7002-2433-53b3a188e06b	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-552b-7002-49c7-79821339ffac	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-552b-7002-87d2-3ebd3e07421b	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-552b-7002-0d11-4fd0ad09bcad	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-552b-7002-694b-c6201f56a2d2	BI	BDI	108	Burundi 	Burundi 	\N
00040000-552b-7002-ec0a-0b9a5ceb9a7e	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-552b-7002-2c5c-89b14b2887e2	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-552b-7002-0539-47c2cc53bfda	CA	CAN	124	Canada 	Kanada	\N
00040000-552b-7002-9ea3-217bbab67461	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-552b-7002-365a-659a1f54cbfc	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-552b-7002-fbca-4b2113c1f4d2	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-552b-7002-2641-e4a74f164d61	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-552b-7002-4579-ca70a21e9e69	CL	CHL	152	Chile 	Čile	\N
00040000-552b-7002-3508-25fc986a7249	CN	CHN	156	China 	Kitajska	\N
00040000-552b-7002-01f7-47e11063f3a0	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-552b-7002-eda9-3e684e1258ef	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-552b-7002-9271-2ff7ca550340	CO	COL	170	Colombia 	Kolumbija	\N
00040000-552b-7002-b312-c692ffc04a65	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-552b-7002-28e3-630f543c5cd5	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-552b-7002-214a-ffcc34239843	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-552b-7002-3f34-180e294ad500	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-552b-7002-bdac-2e3de4bcf668	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-552b-7002-716e-1b49313be6e5	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-552b-7002-9f1a-def9d88df612	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-552b-7002-faf2-db79da1c9881	CU	CUB	192	Cuba 	Kuba	\N
00040000-552b-7002-35c2-c1ac17b4cf85	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-552b-7002-ef3d-520ca06691e6	CY	CYP	196	Cyprus 	Ciper	\N
00040000-552b-7002-af32-c195962935fd	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-552b-7002-0203-6b7c0401e2e6	DK	DNK	208	Denmark 	Danska	\N
00040000-552b-7002-5aa5-bd0c59a18452	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-552b-7002-000f-d3292e297226	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-552b-7002-5ff7-b000a1ccadbe	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-552b-7002-438c-3713cb8f74d0	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-552b-7002-7fc4-dfc590cde9d7	EG	EGY	818	Egypt 	Egipt	\N
00040000-552b-7002-8eca-5858c347fbb9	SV	SLV	222	El Salvador 	Salvador	\N
00040000-552b-7002-1863-7636568cb92a	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-552b-7002-aa0a-8558b979949d	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-552b-7002-c327-4705dac322c4	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-552b-7002-a989-22d7e753faba	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-552b-7002-4721-59e90068c65e	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-552b-7002-5319-54630c91e81e	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-552b-7002-cab4-543b7dcb11ab	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-552b-7002-44d4-c502d9b222e0	FI	FIN	246	Finland 	Finska	\N
00040000-552b-7002-63b4-886a8225e757	FR	FRA	250	France 	Francija	\N
00040000-552b-7002-f60c-1391b729cf7b	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-552b-7002-f465-972cd4e72e13	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-552b-7002-25cf-6def75a86735	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-552b-7002-84ae-912ceb872a82	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-552b-7002-aa34-295eb176d0e7	GA	GAB	266	Gabon 	Gabon	\N
00040000-552b-7002-78ce-c1822b12c9e5	GM	GMB	270	Gambia 	Gambija	\N
00040000-552b-7002-f551-9c3f06ff2e9c	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-552b-7002-173d-5f91bf355e86	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-552b-7002-7fcd-302d46cdc01b	GH	GHA	288	Ghana 	Gana	\N
00040000-552b-7002-c642-070497ce123c	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-552b-7002-4a74-521db080ccb4	GR	GRC	300	Greece 	Grčija	\N
00040000-552b-7002-0907-39db531c8466	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-552b-7002-bef8-f90e4b7eedaa	GD	GRD	308	Grenada 	Grenada	\N
00040000-552b-7002-f430-558764243da9	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-552b-7002-446c-7b5e292367df	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-552b-7002-7139-e43de5172e95	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-552b-7002-6039-1ef9c7f9f0ba	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-552b-7002-f9de-7ae921251e0c	GN	GIN	324	Guinea 	Gvineja	\N
00040000-552b-7002-1fc4-e81b639cb23b	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-552b-7002-c5da-f4cec8fb845f	GY	GUY	328	Guyana 	Gvajana	\N
00040000-552b-7002-5ca0-a3b370881deb	HT	HTI	332	Haiti 	Haiti	\N
00040000-552b-7002-2a79-f54099bcf917	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-552b-7002-c725-a0bff556687c	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-552b-7002-74c9-5efd26f81066	HN	HND	340	Honduras 	Honduras	\N
00040000-552b-7002-4005-824aeddd6ede	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-552b-7002-6472-3ce83e69f4fa	HU	HUN	348	Hungary 	Madžarska	\N
00040000-552b-7002-0dde-2a712345ebb4	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-552b-7002-ef26-1e1387c35780	IN	IND	356	India 	Indija	\N
00040000-552b-7002-c15f-ac4156725110	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-552b-7002-2b97-04d09158772e	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-552b-7002-3e21-ae570078667e	IQ	IRQ	368	Iraq 	Irak	\N
00040000-552b-7002-35fb-127380f69d0a	IE	IRL	372	Ireland 	Irska	\N
00040000-552b-7002-c866-a53f5bd794a9	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-552b-7002-0d1a-ad861902699a	IL	ISR	376	Israel 	Izrael	\N
00040000-552b-7002-7f60-511018cdfd0b	IT	ITA	380	Italy 	Italija	\N
00040000-552b-7002-4df1-d1a8a7e5de63	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-552b-7002-d892-db49851fbe29	JP	JPN	392	Japan 	Japonska	\N
00040000-552b-7002-b1b2-263a7fa5b952	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-552b-7002-d192-3baa71f5a3d2	JO	JOR	400	Jordan 	Jordanija	\N
00040000-552b-7002-ee5d-6d0ddb3c50b0	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-552b-7002-2434-3a08f44167b0	KE	KEN	404	Kenya 	Kenija	\N
00040000-552b-7002-6493-9b7099924e69	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-552b-7002-a0a7-8b175ba0febd	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-552b-7002-a67d-2ffcf54e4334	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-552b-7002-eda2-d93fb93989a7	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-552b-7002-455c-df54b808258e	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-552b-7002-5c1c-dfe8d39bc4b7	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-552b-7002-7269-bf61520be592	LV	LVA	428	Latvia 	Latvija	\N
00040000-552b-7002-7c9e-da81c966381a	LB	LBN	422	Lebanon 	Libanon	\N
00040000-552b-7002-0d4c-5dff1064c343	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-552b-7002-0fee-19e295fdc431	LR	LBR	430	Liberia 	Liberija	\N
00040000-552b-7002-c0e3-204e67ec798a	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-552b-7002-dd1b-b3d4f4e9d227	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-552b-7002-e652-4dbb569e3c97	LT	LTU	440	Lithuania 	Litva	\N
00040000-552b-7002-4080-2c5466bf93fc	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-552b-7002-f364-a5b89ada4e64	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-552b-7002-f362-c0431e47de3e	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-552b-7002-0efd-ae1b3b13b6ef	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-552b-7002-27c5-442aa0e5bc3e	MW	MWI	454	Malawi 	Malavi	\N
00040000-552b-7002-3c62-7dedd6a88b7c	MY	MYS	458	Malaysia 	Malezija	\N
00040000-552b-7002-cc5f-f44c912d7788	MV	MDV	462	Maldives 	Maldivi	\N
00040000-552b-7002-94d7-075a3b9bd32a	ML	MLI	466	Mali 	Mali	\N
00040000-552b-7002-d35c-ff6864f7483c	MT	MLT	470	Malta 	Malta	\N
00040000-552b-7002-a70e-87ad5ac7f0ca	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-552b-7002-a7da-32aef28eb130	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-552b-7002-a765-cb39abc0b74d	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-552b-7002-0857-b83338831660	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-552b-7002-a01e-3cbbf68ac3c5	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-552b-7002-3ca9-e81c65303c8c	MX	MEX	484	Mexico 	Mehika	\N
00040000-552b-7002-0a36-acebabc6c83f	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-552b-7002-11e2-754f0b27e0c8	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-552b-7002-66d1-e9779ee20d28	MC	MCO	492	Monaco 	Monako	\N
00040000-552b-7002-9f3d-2f3cd07073a5	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-552b-7002-9699-8383beb8acb8	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-552b-7002-8c78-2e4b881f1090	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-552b-7002-12f0-09fa79679f33	MA	MAR	504	Morocco 	Maroko	\N
00040000-552b-7002-5223-c4eac424b0fe	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-552b-7002-da1f-81fd0365b8ae	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-552b-7002-2f3c-51bfd1fc26f2	NA	NAM	516	Namibia 	Namibija	\N
00040000-552b-7002-0a3c-be93ca6ffb5a	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-552b-7002-04eb-7afbf6b93536	NP	NPL	524	Nepal 	Nepal	\N
00040000-552b-7002-4ba6-9b4a6ac06ed3	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-552b-7002-3345-e1830b57b3d3	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-552b-7002-9119-9aeeb03a1995	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-552b-7002-f76d-74ded4e4f624	NE	NER	562	Niger 	Niger 	\N
00040000-552b-7002-55f8-68b77e337f88	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-552b-7002-53ca-84b10f641927	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-552b-7002-bd7e-2665ff0c7e2f	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-552b-7002-e4ef-35bcf92064f0	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-552b-7002-d9d2-044ac4c78104	NO	NOR	578	Norway 	Norveška	\N
00040000-552b-7002-cd5c-18ecf98e4988	OM	OMN	512	Oman 	Oman	\N
00040000-552b-7002-e705-1f3448da8701	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-552b-7002-be15-e460c9e943c2	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-552b-7002-3503-a151dea5a1be	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-552b-7002-1ce1-a5784738efcc	PA	PAN	591	Panama 	Panama	\N
00040000-552b-7002-a8cc-cc57f0b20c46	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-552b-7002-fe53-944bc52c80e3	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-552b-7002-9444-3f74bfdf9f6a	PE	PER	604	Peru 	Peru	\N
00040000-552b-7002-ef61-876594a2cf96	PH	PHL	608	Philippines 	Filipini	\N
00040000-552b-7002-135b-a94cc3d984c9	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-552b-7002-cc47-b57cd546de62	PL	POL	616	Poland 	Poljska	\N
00040000-552b-7002-e16c-665d5c28f398	PT	PRT	620	Portugal 	Portugalska	\N
00040000-552b-7002-35f9-c582683359be	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-552b-7002-8109-e76f84e04027	QA	QAT	634	Qatar 	Katar	\N
00040000-552b-7002-fa24-dbc49d97c5a1	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-552b-7002-d00b-4a677d5a9a56	RO	ROU	642	Romania 	Romunija	\N
00040000-552b-7002-279e-104e004a2e56	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-552b-7002-e8dd-6aa5c117f848	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-552b-7002-a681-2df0f8dad3d8	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-552b-7002-5735-bc4dce6b7608	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-552b-7002-6900-ed831f80e1af	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-552b-7002-eab5-1ad9cc381713	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-552b-7002-586e-7a461f6b7ec3	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-552b-7002-0cc9-e97ec62f3937	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-552b-7002-1076-94d8b626fa57	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-552b-7002-9564-3e52d475f4ab	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-552b-7002-3663-fe3d004e4b86	SM	SMR	674	San Marino 	San Marino	\N
00040000-552b-7002-38b7-85d012196d38	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-552b-7002-1ab7-07c8fc9be06c	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-552b-7002-ffdc-6a2eb0124a30	SN	SEN	686	Senegal 	Senegal	\N
00040000-552b-7002-6545-f677c3a86570	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-552b-7002-bc28-699e8e608194	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-552b-7002-fb52-1c469f98bce2	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-552b-7002-ff26-71b98fb50f0c	SG	SGP	702	Singapore 	Singapur	\N
00040000-552b-7002-b018-7d8f3b1d22d6	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-552b-7002-c928-12f2fd85844b	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-552b-7002-fccc-52a8eec5f90d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-552b-7002-b0c2-c6a087952ab7	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-552b-7002-e707-e100d602b126	SO	SOM	706	Somalia 	Somalija	\N
00040000-552b-7002-7c9e-9b0cc3fa4a3d	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-552b-7002-d3d6-028e84329018	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-552b-7002-8e0e-06c2e37980e2	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-552b-7002-76b1-9508f82e6c73	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-552b-7002-87b4-e0434fd0d9a7	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-552b-7002-c3ca-9153ecbf6e4b	SD	SDN	729	Sudan 	Sudan	\N
00040000-552b-7002-8ad3-06ad8a174d6d	SR	SUR	740	Suriname 	Surinam	\N
00040000-552b-7002-d283-8705bf9a70cf	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-552b-7002-d9fb-1213f005d6e8	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-552b-7002-49a5-fa744b1715f0	SE	SWE	752	Sweden 	Švedska	\N
00040000-552b-7002-e89f-c454b1c56b0a	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-552b-7002-c499-9f3bd8fa7657	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-552b-7002-8909-2652655230c0	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-552b-7002-10fc-00632bd322cf	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-552b-7002-d6db-b4d466c56c38	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-552b-7002-01fb-1768d324bb3e	TH	THA	764	Thailand 	Tajska	\N
00040000-552b-7002-603f-621003d83eb2	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-552b-7002-b233-cc80d4de4a8f	TG	TGO	768	Togo 	Togo	\N
00040000-552b-7002-7c2b-eccc028c0425	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-552b-7002-19d8-b122015a7136	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-552b-7002-13e0-084efaf7f6bc	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-552b-7002-5c8f-c633d42667ea	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-552b-7002-2d1f-495b9982b49c	TR	TUR	792	Turkey 	Turčija	\N
00040000-552b-7002-3650-35cc4b692938	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-552b-7002-88ee-e3c14a4e0d4c	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-552b-7002-259f-87ea0ec29e6f	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-552b-7002-a5fb-4f550cc70f03	UG	UGA	800	Uganda 	Uganda	\N
00040000-552b-7002-e6a6-194487aa8d87	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-552b-7002-e618-cdcd96b93dca	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-552b-7002-2c1d-b3b96e48e7e4	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-552b-7002-a7f3-1c157482d2c4	US	USA	840	United States 	Združene države Amerike	\N
00040000-552b-7002-66bf-46eaa53c60ff	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-552b-7002-da59-c5b8d4ed1e48	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-552b-7002-45e4-ba901e6b7279	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-552b-7002-6a05-a70493296f55	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-552b-7002-1dde-00de3881aae3	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-552b-7002-b8b2-e4287692e404	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-552b-7002-5462-5a7f84499cff	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-552b-7002-f983-45290466e07b	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-552b-7002-262c-2a93de57bbe6	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-552b-7002-4318-f6ad432448a0	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-552b-7002-32b2-55a3213dbdff	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-552b-7002-a03c-16891f53b62f	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-552b-7002-38f3-22f36cc22708	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2628 (class 0 OID 96033)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2607 (class 0 OID 95854)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2611 (class 0 OID 95902)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2597 (class 0 OID 95722)
-- Dependencies: 179
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2617 (class 0 OID 95951)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2621 (class 0 OID 95976)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2603 (class 0 OID 95803)
-- Dependencies: 185
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-552b-7002-9fb8-11b7a9279806	kravaXXX	color	N;	t	f	f	\N	\N
00000000-552b-7002-ca87-988ef5b97764	privzetInspicient	entity	N;	f	f	f	\N	\N
00000000-552b-7002-2986-3536c18409f0	dogodek-status	map	O:18:"Zend\\Config\\Config":4:{s:21:"	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2596 (class 0 OID 95711)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
\.


--
-- TOC entry 2600 (class 0 OID 95773)
-- Dependencies: 182
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2592 (class 0 OID 95676)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00020000-552b-7002-3d07-4920c97bde84	User-delete	Aaa - Uporabnik - Briši	f
00020000-552b-7002-140d-d844a29d20a7	User-read	Aaa - Uporabnik - Beri	f
00020000-552b-7002-8ea1-ae20bcbe9e80	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552b-7002-6b7e-b9804a5dd71c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552b-7002-cf8a-fc5fcbad86f4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552b-7002-6e15-f71769ba6742	Role-delete	Aaa - Vloga - Briši	f
00020000-552b-7002-1574-4fc26b2cb94f	Role-read	Aaa - Vloga - Beri	f
00020000-552b-7002-91e6-27b0785e834f	Role-update	Aaa - Vloga - Posodobi	f
00020000-552b-7002-5053-7e3ca676a5d9	Role-create	Aaa - Vloga - Ustvari	f
00020000-552b-7002-89bd-526b1fcbd8f7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552b-7002-8631-fbc8679fca63	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552b-7002-104b-e8ffeb0232c0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552b-7002-6bbd-7c1b1735c8ee	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552b-7002-3cb4-ade39a0498d3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552b-7002-081b-f9d21328fb10	User-delete	Aaa - Uporabnik - Briši	f
00020000-552b-7002-c37d-e8e5254a2b4e	User-read	Aaa - Uporabnik - Beri	f
00020000-552b-7002-6c97-cc1142bd0772	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552b-7002-83c5-f672b6e0cb10	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552b-7002-c2e4-9192357033ff	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552b-7002-3f66-fa067b2a9d96	Role-delete	Aaa - Vloga - Briši	f
00020000-552b-7002-f606-d1cf648d50b5	Role-read	Aaa - Vloga - Beri	f
00020000-552b-7002-515a-87e0d8d1d838	Role-update	Aaa - Vloga - Posodobi	f
00020000-552b-7002-5361-e3fb6dda3062	Role-create	Aaa - Vloga - Ustvari	f
00020000-552b-7002-db2c-0da61e7ce026	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552b-7002-e7fc-ebd1791f429c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552b-7002-3c26-153b4f26aec2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552b-7002-dc96-7b16a7b63774	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552b-7002-86f5-8734c500efe3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552b-7002-500c-1d4dbdbe679c	User-delete	Aaa - Uporabnik - Briši	f
00020000-552b-7002-07f0-afdaeda63045	User-read	Aaa - Uporabnik - Beri	f
00020000-552b-7002-f8d5-40728c11bc94	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552b-7002-73ca-4a840c5f7298	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552b-7002-12ed-310a647dd507	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552b-7002-a424-0d94579f4898	Role-delete	Aaa - Vloga - Briši	f
00020000-552b-7002-2748-71a98adbeefb	Role-read	Aaa - Vloga - Beri	f
00020000-552b-7002-1504-8d72ae40e530	Role-update	Aaa - Vloga - Posodobi	f
00020000-552b-7002-34e5-9e5507fb0eea	Role-create	Aaa - Vloga - Ustvari	f
00020000-552b-7002-10ed-0e179035619a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552b-7002-bf03-b28d6579a414	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552b-7002-d642-3a2c2724a8b1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552b-7002-6616-d8cb18c9076d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552b-7002-effc-a080e68fb8cf	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552b-7002-7155-c21e2859ab65	User-delete	Aaa - Uporabnik - Briši	f
00020000-552b-7002-808b-9d176321212f	User-read	Aaa - Uporabnik - Beri	f
00020000-552b-7002-6878-3d32145a7b80	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552b-7002-c503-a12236f19fe9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552b-7002-1bc1-3caed941aa70	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552b-7002-daeb-0b3f33aa9290	Role-delete	Aaa - Vloga - Briši	f
00020000-552b-7002-4fad-b6218ca43d13	Role-read	Aaa - Vloga - Beri	f
00020000-552b-7002-170a-15484469db45	Role-update	Aaa - Vloga - Posodobi	f
00020000-552b-7002-42e6-8adfd2de0f70	Role-create	Aaa - Vloga - Ustvari	f
00020000-552b-7002-b2d6-33d27cd8693b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552b-7002-a134-f447db93b938	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552b-7002-73e0-37b02540ff8f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552b-7002-d18f-c4bed2d7fe2f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552b-7002-33ba-212ba31eee6e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552b-7002-aed1-8f8561d33e57	User-delete	Aaa - Uporabnik - Briši	f
00020000-552b-7002-fc15-256db4ddb79b	User-read	Aaa - Uporabnik - Beri	f
00020000-552b-7002-10fc-4a14839fb91a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552b-7002-ddfb-3d96870b255e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552b-7002-e52b-c6b0a7599cad	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552b-7002-5a0c-d50c709321c0	Role-delete	Aaa - Vloga - Briši	f
00020000-552b-7002-86da-0b9e9acd0f1b	Role-read	Aaa - Vloga - Beri	f
00020000-552b-7002-4765-06d61b81cffc	Role-update	Aaa - Vloga - Posodobi	f
00020000-552b-7002-3c2f-e4223532e963	Role-create	Aaa - Vloga - Ustvari	f
00020000-552b-7002-256a-7b1138a58aa9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552b-7002-1b65-0e031f91abad	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552b-7002-e25c-3669512acc9d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552b-7002-3598-3cce1890ed71	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552b-7002-e8c8-ae065f7507f3	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552b-7002-d7f6-0c7ac64a1280	User-delete	Aaa - Uporabnik - Briši	f
00020000-552b-7002-25f9-7d65b61dd43a	User-read	Aaa - Uporabnik - Beri	f
00020000-552b-7002-03ac-6aada8551028	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552b-7002-8917-55f7d9a5bb67	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552b-7002-3fba-323e17f0fb96	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552b-7002-2096-56f22cd76200	Role-delete	Aaa - Vloga - Briši	f
00020000-552b-7002-1773-3b1f6b844e8a	Role-read	Aaa - Vloga - Beri	f
00020000-552b-7002-8845-b7400f118212	Role-update	Aaa - Vloga - Posodobi	f
00020000-552b-7002-8972-fccbcb2a20be	Role-create	Aaa - Vloga - Ustvari	f
00020000-552b-7002-0155-72129cde3ea4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552b-7002-c7d1-bfc18187885c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552b-7002-a2d8-7995a0a87f8a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552b-7002-600c-5ae39a54c0d1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552b-7002-7d3f-ed477a91d9a9	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552b-7002-6222-d0a5bcf031bd	User-delete	Aaa - Uporabnik - Briši	f
00020000-552b-7002-2e92-111279a77a4c	User-read	Aaa - Uporabnik - Beri	f
00020000-552b-7002-44d8-51f933439c42	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552b-7002-dcf7-a5ca727b6273	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552b-7002-4306-8f73d7b5461a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552b-7002-2c9f-a361ae787446	Role-delete	Aaa - Vloga - Briši	f
00020000-552b-7002-60bd-73ff7d6e1860	Role-read	Aaa - Vloga - Beri	f
00020000-552b-7002-3bc7-d4e7e04b464c	Role-update	Aaa - Vloga - Posodobi	f
00020000-552b-7002-ebd7-c028aca0b731	Role-create	Aaa - Vloga - Ustvari	f
00020000-552b-7002-36f5-23e36d52bed4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552b-7002-837f-b80ec635aa65	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552b-7002-7efc-a1800a68835c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552b-7002-67b8-aa614103a48a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552b-7002-c243-a9122f977950	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552b-7002-11b0-c47d5ebeb614	User-delete	Aaa - Uporabnik - Briši	f
00020000-552b-7002-a99b-322eaed62b2d	User-read	Aaa - Uporabnik - Beri	f
00020000-552b-7002-2a1a-39d3714df73a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552b-7002-03e9-ebf0d050a65d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552b-7002-db2f-dbf35213025a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552b-7002-87b6-39dc9144bdd1	Role-delete	Aaa - Vloga - Briši	f
00020000-552b-7002-5e8c-14852dfdd5b1	Role-read	Aaa - Vloga - Beri	f
00020000-552b-7002-485d-a5460cbca3a5	Role-update	Aaa - Vloga - Posodobi	f
00020000-552b-7002-032e-946fda7e5fe1	Role-create	Aaa - Vloga - Ustvari	f
00020000-552b-7002-0e9a-ac41723802b3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552b-7002-5f0a-1e58630fe6e3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552b-7002-233e-18114bac54c9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552b-7002-3824-a834eae75a7f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552b-7002-9f79-1a877f921dee	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552b-7002-c9f7-8c91c448dfd4	User-delete	Aaa - Uporabnik - Briši	f
00020000-552b-7002-003a-e27b6c98a989	User-read	Aaa - Uporabnik - Beri	f
00020000-552b-7002-9949-3c728b39f84f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552b-7002-213c-96781126a35c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552b-7002-aab4-331cb691d391	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552b-7002-6830-71fc8ad9f8b5	Role-delete	Aaa - Vloga - Briši	f
00020000-552b-7002-aab9-d5bb14b228ef	Role-read	Aaa - Vloga - Beri	f
00020000-552b-7002-d1ce-e88b73394360	Role-update	Aaa - Vloga - Posodobi	f
00020000-552b-7002-42f5-be9529513a10	Role-create	Aaa - Vloga - Ustvari	f
00020000-552b-7002-f384-854ba1df210f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552b-7002-9ef0-4525a93f56f9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552b-7002-0608-6cabfa6ccf12	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552b-7002-09c2-b914ad489bd9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552b-7002-ea85-749097af4141	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552b-7002-4aa0-1701dadff328	User-delete	Aaa - Uporabnik - Briši	f
00020000-552b-7002-cc81-749f13b8368a	User-read	Aaa - Uporabnik - Beri	f
00020000-552b-7002-22f5-b1c4d5f4d901	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552b-7002-622e-6a9eba847f21	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552b-7002-26e8-2851daf844d3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552b-7002-ddb1-c89491a80d63	Role-delete	Aaa - Vloga - Briši	f
00020000-552b-7002-17f8-a10e65b74bcb	Role-read	Aaa - Vloga - Beri	f
00020000-552b-7002-6ab8-2d91858d887a	Role-update	Aaa - Vloga - Posodobi	f
00020000-552b-7002-f5ad-968fae3b17c1	Role-create	Aaa - Vloga - Ustvari	f
00020000-552b-7002-632d-0d27fb42233e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552b-7002-00f3-3af977eeda53	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552b-7002-9865-37bd24d15a9a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552b-7002-6394-feb7b3ead81d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552b-7002-2649-135a84dadbd2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552b-7002-736d-1feb9569c2df	User-delete	Aaa - Uporabnik - Briši	f
00020000-552b-7002-12ce-164d5c33eae6	User-read	Aaa - Uporabnik - Beri	f
00020000-552b-7002-f251-575dca5dca00	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552b-7002-b235-6221397d4bc0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552b-7002-a8ba-37c479f8c980	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552b-7002-8cea-553cec7ec9ae	Role-delete	Aaa - Vloga - Briši	f
00020000-552b-7002-6a09-d062157766fc	Role-read	Aaa - Vloga - Beri	f
00020000-552b-7002-e826-563ee1fd9725	Role-update	Aaa - Vloga - Posodobi	f
00020000-552b-7002-c98d-213dab13e92e	Role-create	Aaa - Vloga - Ustvari	f
00020000-552b-7002-191c-2cb8617745d1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552b-7002-a3a0-ef75a596ef35	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552b-7002-a3b6-e322f0af6de3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552b-7002-00af-b4d49971bad1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552b-7002-b237-5feea4350b10	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552b-7002-f6b8-9b9c6201eb67	User-delete	Aaa - Uporabnik - Briši	f
00020000-552b-7002-265f-e639dbd56d3d	User-read	Aaa - Uporabnik - Beri	f
00020000-552b-7002-b78a-65e92fb4703b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552b-7002-d35a-535afd874af1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552b-7002-c0c2-2d2bc3a8160a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552b-7002-d6ac-ba147ad964ed	Role-delete	Aaa - Vloga - Briši	f
00020000-552b-7002-bddb-2436e7be8d8b	Role-read	Aaa - Vloga - Beri	f
00020000-552b-7002-11d5-4f57006cf086	Role-update	Aaa - Vloga - Posodobi	f
00020000-552b-7002-3696-1bb1000681f6	Role-create	Aaa - Vloga - Ustvari	f
00020000-552b-7002-9a92-c96de35d7fb1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552b-7002-37f4-35dd2ef1bf99	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552b-7002-5107-58e15b1ac939	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552b-7002-6781-91c5e4056c99	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552b-7002-885c-a7beb6ebdab5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552b-7002-7880-3229212e66e2	User-delete	Aaa - Uporabnik - Briši	f
00020000-552b-7002-3b4d-ddd6dafda473	User-read	Aaa - Uporabnik - Beri	f
00020000-552b-7002-dab4-de115cb1593c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552b-7002-90b4-e563536010b0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552b-7002-97ec-f9c04f774ae6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552b-7002-377d-6af90defc52a	Role-delete	Aaa - Vloga - Briši	f
00020000-552b-7002-cb41-48847b3fc21c	Role-read	Aaa - Vloga - Beri	f
00020000-552b-7002-8d70-6cae838b31eb	Role-update	Aaa - Vloga - Posodobi	f
00020000-552b-7002-a096-bad10670486a	Role-create	Aaa - Vloga - Ustvari	f
00020000-552b-7002-39ca-aa68e04acaae	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552b-7002-a50b-5d859d0e4302	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552b-7002-f8ba-ac0cdaea0be6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552b-7002-0b8f-b819ab29ff97	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552b-7002-df95-a105df595a1b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552b-7002-2835-efa6db1d0d69	Drzava-read	Seznam držav	f
00020000-552b-7002-791b-512bf137c6a6	Drzava-write	Urejanje držav	f
00020000-552b-7002-728c-8ebdfaa8953d	Popa-delete	Poslovni partner - Briši	f
00020000-552b-7002-aaea-39a2966fb34d	Popa-list	Poslovni partner - Beri	f
00020000-552b-7002-bfeb-3c88b9bd75e0	Popa-update	Poslovni partner - Posodobi	f
00020000-552b-7002-650c-f806e9ce9b42	Popa-create	Poslovni partner - Ustvari	f
00020000-552b-7002-edcf-d05379e59df7	Posta-delete	Pošta - Briši	f
00020000-552b-7002-a7b2-ea1cd81c7fae	Posta-list	Pošta - Beri	f
00020000-552b-7002-e151-1ce7e9b73ad6	Posta-update	Pošta - Posodobi	f
00020000-552b-7002-38b5-57dcb1a0b447	Posta-create	Pošta - Ustvari	f
00020000-552b-7002-914b-122e993342f5	PostniNaslov-delete	Poštni naslov - Briši	f
00020000-552b-7002-6116-9c30964f1409	PostniNaslov-list	Poštni naslov - Beri	f
00020000-552b-7002-10ac-e1c5f29f79cf	PostniNaslov-update	Poštni naslov - Posodobi	f
00020000-552b-7002-60c9-23c5b99faecd	PostniNaslov-create	Poštni naslov - Ustvari	f
\.


--
-- TOC entry 2594 (class 0 OID 95695)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00000000-552b-7002-da13-b64d4e095247	00020000-552b-7002-2835-efa6db1d0d69
00000000-552b-7002-da13-b64d4e095247	00020000-552b-7002-3cb4-ade39a0498d3
00000000-552b-7002-202a-43f84ae3c901	00020000-552b-7002-791b-512bf137c6a6
00000000-552b-7002-202a-43f84ae3c901	00020000-552b-7002-2835-efa6db1d0d69
\.


--
-- TOC entry 2622 (class 0 OID 95983)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2626 (class 0 OID 96013)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 96125)
-- Dependencies: 219
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2599 (class 0 OID 95752)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2602 (class 0 OID 95795)
-- Dependencies: 184
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-552b-7002-4edb-9cdbfb0e0db6	8341	Adlešiči
00050000-552b-7002-fd3c-ca9f496985ac	5270	Ajdovščina
00050000-552b-7002-4683-68af94c0d2d5	6280	Ankaran/Ancarano
00050000-552b-7002-ac71-9b5959377841	9253	Apače
00050000-552b-7002-1989-b98021ed2a1a	8253	Artiče
00050000-552b-7002-ab45-8cd6e67d272a	4275	Begunje na Gorenjskem
00050000-552b-7002-6bb8-e0a1fbcab665	1382	Begunje pri Cerknici
00050000-552b-7002-7125-56e080f9090a	9231	Beltinci
00050000-552b-7002-a5b9-e8ccc05efbb7	2234	Benedikt
00050000-552b-7002-775e-287e08809d97	2345	Bistrica ob Dravi
00050000-552b-7002-8c5f-1c1d20abb7ac	3256	Bistrica ob Sotli
00050000-552b-7002-f202-bc05180d5069	8259	Bizeljsko
00050000-552b-7002-539e-b39dd2c99159	1223	Blagovica
00050000-552b-7002-d642-bc4e48eeaf21	8283	Blanca
00050000-552b-7002-3ef7-fb6dee35a0fa	4260	Bled
00050000-552b-7002-0ca3-0141b8aefbbe	4273	Blejska Dobrava
00050000-552b-7002-ba74-6e1683d0222e	9265	Bodonci
00050000-552b-7002-44f2-9b6f64e45358	9222	Bogojina
00050000-552b-7002-fecc-d2df0d538c9a	4263	Bohinjska Bela
00050000-552b-7002-2e41-671f958aba99	4264	Bohinjska Bistrica
00050000-552b-7002-ee60-8ec22c219690	4265	Bohinjsko jezero
00050000-552b-7002-34a0-c45784897e3f	1353	Borovnica
00050000-552b-7002-247c-0b490608a396	8294	Boštanj
00050000-552b-7002-502d-9f89120eeb64	5230	Bovec
00050000-552b-7002-3565-875aacd7a012	5295	Branik
00050000-552b-7002-e818-8a78ae92fa06	3314	Braslovče
00050000-552b-7002-9493-6c70f11da375	5223	Breginj
00050000-552b-7002-3893-e303cc33372e	8280	Brestanica
00050000-552b-7002-7972-b20c411e5a8f	2354	Bresternica
00050000-552b-7002-66dd-584ce6c85a77	4243	Brezje
00050000-552b-7002-b6da-bfe4a22af46f	1351	Brezovica pri Ljubljani
00050000-552b-7002-344d-c58dee701cad	8250	Brežice
00050000-552b-7002-8bc8-003333bf9e33	4210	Brnik - Aerodrom
00050000-552b-7002-f47f-12976a599eab	8321	Brusnice
00050000-552b-7002-b719-6b83d74af48a	3255	Buče
00050000-552b-7002-77d6-67e0c05bee11	8276	Bučka 
00050000-552b-7002-7dcf-90a0d2c66bce	9261	Cankova
00050000-552b-7002-0867-f49a601f24c6	3000	Celje 
00050000-552b-7002-7f8f-3f508e6b6c30	3001	Celje - poštni predali
00050000-552b-7002-88d6-701a21b530c9	4207	Cerklje na Gorenjskem
00050000-552b-7002-2cea-d82c085928ad	8263	Cerklje ob Krki
00050000-552b-7002-54ef-60c561fc98db	1380	Cerknica
00050000-552b-7002-e7e7-57a713b10518	5282	Cerkno
00050000-552b-7002-be59-50103be502f3	2236	Cerkvenjak
00050000-552b-7002-d98a-9969c0deff9d	2215	Ceršak
00050000-552b-7002-0a9e-a5d74eb9be4f	2326	Cirkovce
00050000-552b-7002-39cb-7dadbbf6d4f2	2282	Cirkulane
00050000-552b-7002-9ebc-89f2fddebf66	5273	Col
00050000-552b-7002-1676-c62a2742b494	8251	Čatež ob Savi
00050000-552b-7002-aa8a-4b0acaee9efc	1413	Čemšenik
00050000-552b-7002-d0bf-3c425a0b880a	5253	Čepovan
00050000-552b-7002-0d6e-7a88b8b1167b	9232	Črenšovci
00050000-552b-7002-da93-73c24ce5b394	2393	Črna na Koroškem
00050000-552b-7002-da37-c1ede982457c	6275	Črni Kal
00050000-552b-7002-13d5-235754d1c9d9	5274	Črni Vrh nad Idrijo
00050000-552b-7002-9e2b-551bfe59144d	5262	Črniče
00050000-552b-7002-1435-1d812ac7c76d	8340	Črnomelj
00050000-552b-7002-5e17-f166f38b4e7c	6271	Dekani
00050000-552b-7002-3fad-dc3b9491a2e5	5210	Deskle
00050000-552b-7002-eb1a-01c2d5833480	2253	Destrnik
00050000-552b-7002-6617-df8fa710fa8e	6215	Divača
00050000-552b-7002-9209-6be8d27102dd	1233	Dob
00050000-552b-7002-8b3d-c6913d890120	3224	Dobje pri Planini
00050000-552b-7002-824a-2f153f548567	8257	Dobova
00050000-552b-7002-8736-c43ffb84801d	1423	Dobovec
00050000-552b-7002-4693-9f5b841c04bc	5263	Dobravlje
00050000-552b-7002-3bcf-86d0196408bd	3204	Dobrna
00050000-552b-7002-3655-1916cbd2334f	8211	Dobrnič
00050000-552b-7002-7344-120f01113413	1356	Dobrova
00050000-552b-7002-9b7a-0f6cb3a70a85	9223	Dobrovnik/Dobronak 
00050000-552b-7002-5ba3-4bc85204f5d6	5212	Dobrovo v Brdih
00050000-552b-7002-4401-0807e7d5536d	1431	Dol pri Hrastniku
00050000-552b-7002-acad-37c78c7c4e01	1262	Dol pri Ljubljani
00050000-552b-7002-b3c7-e8739ae7dc59	1273	Dole pri Litiji
00050000-552b-7002-e802-20242f1f590d	1331	Dolenja vas
00050000-552b-7002-232f-023a38e3112f	8350	Dolenjske Toplice
00050000-552b-7002-cddc-64aa88bdf157	1230	Domžale
00050000-552b-7002-0096-94e4944f184b	2252	Dornava
00050000-552b-7002-e4f1-a12a922cafa0	5294	Dornberk
00050000-552b-7002-e991-2cc648337283	1319	Draga
00050000-552b-7002-89c7-8281031f9599	8343	Dragatuš
00050000-552b-7002-8ac6-25c9c5b04317	3222	Dramlje
00050000-552b-7002-3886-01ad56ba81c6	2370	Dravograd
00050000-552b-7002-e7f1-c702f68bac73	4203	Duplje
00050000-552b-7002-390b-c3269781683d	6221	Dutovlje
00050000-552b-7002-9609-5d51f74d92a8	8361	Dvor
00050000-552b-7002-e5d4-4a5c6d9f8f5c	2343	Fala
00050000-552b-7002-1afa-b142911e2bb3	9208	Fokovci
00050000-552b-7002-299e-0d10e8c030a7	2313	Fram
00050000-552b-7002-927a-eb9554c4e81f	3213	Frankolovo
00050000-552b-7002-d628-c289ad54fd71	1274	Gabrovka
00050000-552b-7002-9e00-5f239271e89d	8254	Globoko
00050000-552b-7002-3c65-7b5e766047a2	5275	Godovič
00050000-552b-7002-b611-171a2c81e307	4204	Golnik
00050000-552b-7002-b9bc-97623c29b369	3303	Gomilsko
00050000-552b-7002-a2ef-c72e10af7fa7	4224	Gorenja vas
00050000-552b-7002-3ff6-348ab3afc417	3263	Gorica pri Slivnici
00050000-552b-7002-bdf4-a7958da49c12	2272	Gorišnica
00050000-552b-7002-fc23-c22aacf8b5d7	9250	Gornja Radgona
00050000-552b-7002-583d-0a4f6dfd4637	3342	Gornji Grad
00050000-552b-7002-8318-1c5219bfcba8	4282	Gozd Martuljek
00050000-552b-7002-d59b-5934d08afa64	6272	Gračišče
00050000-552b-7002-bb63-73567cd3718e	9264	Grad
00050000-552b-7002-dd74-f73f62e863fe	8332	Gradac
00050000-552b-7002-e2e8-7da94c67493e	1384	Grahovo
00050000-552b-7002-f3b8-33b7cffb84d8	5242	Grahovo ob Bači
00050000-552b-7002-1c08-112d16415402	5251	Grgar
00050000-552b-7002-9069-a4d2f984b62d	3302	Griže
00050000-552b-7002-b866-6d039bcf3a2f	3231	Grobelno
00050000-552b-7002-249b-52fb636c920c	1290	Grosuplje
00050000-552b-7002-1647-a54c004f1829	2288	Hajdina
00050000-552b-7002-7bf4-ed7f8ff05b5e	8362	Hinje
00050000-552b-7002-25d7-5ef5f72dbac1	2311	Hoče
00050000-552b-7002-be49-83a47a0d21ce	9205	Hodoš/Hodos
00050000-552b-7002-7538-63206f978daa	1354	Horjul
00050000-552b-7002-da55-a31fbad58425	1372	Hotedršica
00050000-552b-7002-1716-5326b1bdcc98	1430	Hrastnik
00050000-552b-7002-af20-595a485df570	6225	Hruševje
00050000-552b-7002-32de-6971b5628417	4276	Hrušica
00050000-552b-7002-e278-2ea325923e86	5280	Idrija
00050000-552b-7002-87b2-748fbab8940d	1292	Ig
00050000-552b-7002-0cb8-c7d22189ef90	6250	Ilirska Bistrica
00050000-552b-7002-73a8-33874c4f044d	6251	Ilirska Bistrica-Trnovo
00050000-552b-7002-59a8-757b87974c48	1295	Ivančna Gorica
00050000-552b-7002-5ef9-8dd059726349	2259	Ivanjkovci
00050000-552b-7002-6e1b-c86e1f1f0073	1411	Izlake
00050000-552b-7002-7b77-7ddb49d8eded	6310	Izola/Isola
00050000-552b-7002-0acc-ce421c50148f	2222	Jakobski Dol
00050000-552b-7002-1bb5-a7de97af5cdc	2221	Jarenina
00050000-552b-7002-defc-7d8d6ffffa1a	6254	Jelšane
00050000-552b-7002-e791-0658f15f44bc	4270	Jesenice
00050000-552b-7002-f560-038c4335ebca	8261	Jesenice na Dolenjskem
00050000-552b-7002-da98-0a10da940ccc	3273	Jurklošter
00050000-552b-7002-c154-f214a045afba	2223	Jurovski Dol
00050000-552b-7002-e8d1-9047dd0e1c85	2256	Juršinci
00050000-552b-7002-f5f4-8d07269158c9	5214	Kal nad Kanalom
00050000-552b-7002-e16a-8f1adec9c390	3233	Kalobje
00050000-552b-7002-9534-b720cd68a4e4	4246	Kamna Gorica
00050000-552b-7002-e8a6-f78c79d0a1ef	2351	Kamnica
00050000-552b-7002-851e-5990f5a22fa0	1241	Kamnik
00050000-552b-7002-e346-3766a5290e57	5213	Kanal
00050000-552b-7002-c196-4563901cddbd	8258	Kapele
00050000-552b-7002-7c17-5f0f49fc4757	2362	Kapla
00050000-552b-7002-ec37-a524aa920df3	2325	Kidričevo
00050000-552b-7002-ec72-70f7c0bc8dee	1412	Kisovec
00050000-552b-7002-8594-91aa08677c57	6253	Knežak
00050000-552b-7002-9e89-fae8eed9b061	5222	Kobarid
00050000-552b-7002-3cdd-678cbb554ce9	9227	Kobilje
00050000-552b-7002-7a70-b9c21b90bc05	1330	Kočevje
00050000-552b-7002-7adc-4c0bf49a7384	1338	Kočevska Reka
00050000-552b-7002-b221-d136a2781cdb	2276	Kog
00050000-552b-7002-b062-83195e68072f	5211	Kojsko
00050000-552b-7002-3921-d77c74d62e5d	6223	Komen
00050000-552b-7002-511a-b46e36dcbee4	1218	Komenda
00050000-552b-7002-822e-68b7138c83a3	6000	Koper/Capodistria 
00050000-552b-7002-4171-3baf9d28433f	6001	Koper/Capodistria - poštni predali
00050000-552b-7002-1896-662c513e5c94	8282	Koprivnica
00050000-552b-7002-ff50-213a3bdfe511	5296	Kostanjevica na Krasu
00050000-552b-7002-bfcf-da9d842d0788	8311	Kostanjevica na Krki
00050000-552b-7002-4e84-826bde87fbde	1336	Kostel
00050000-552b-7002-4c69-9fe5a8b60cea	6256	Košana
00050000-552b-7002-dd3f-473dbaa9a099	2394	Kotlje
00050000-552b-7002-a936-e99755e1a3ee	6240	Kozina
00050000-552b-7002-9ebc-8f83f0b101bb	3260	Kozje
00050000-552b-7002-1bcb-b39ef9cd6150	4000	Kranj 
00050000-552b-7002-1433-26f6db671634	4001	Kranj - poštni predali
00050000-552b-7002-e571-6bb11aca4c42	4280	Kranjska Gora
00050000-552b-7002-8390-02f2686cae42	1281	Kresnice
00050000-552b-7002-3fe6-ff319ef93ea1	4294	Križe
00050000-552b-7002-7b18-2f4eaca6ce0f	9206	Križevci
00050000-552b-7002-1c05-7d7a24780a19	9242	Križevci pri Ljutomeru
00050000-552b-7002-a90e-5b557a9a08bc	1301	Krka
00050000-552b-7002-f139-cbc810897d5c	8296	Krmelj
00050000-552b-7002-6193-0fcc4b747230	4245	Kropa
00050000-552b-7002-c2fb-f588badd8823	8262	Krška vas
00050000-552b-7002-e3ff-174c3c6b94bd	8270	Krško
00050000-552b-7002-99f4-b56f9042955a	9263	Kuzma
00050000-552b-7002-bad8-a75ef3d3dae4	2318	Laporje
00050000-552b-7002-1158-63584300e9c0	3270	Laško
00050000-552b-7002-993c-16fff23f6305	1219	Laze v Tuhinju
00050000-552b-7002-09aa-50550ff21731	2230	Lenart v Slovenskih goricah
00050000-552b-7002-de81-54df04bcca42	9220	Lendava/Lendva
00050000-552b-7002-7919-521736a60286	4248	Lesce
00050000-552b-7002-a1c0-4b1772fcea2d	3261	Lesično
00050000-552b-7002-6950-cb4255a76c6c	8273	Leskovec pri Krškem
00050000-552b-7002-bbf6-018d2df1532a	2372	Libeliče
00050000-552b-7002-e04e-3c2f242412ea	2341	Limbuš
00050000-552b-7002-34f4-82295ceaa164	1270	Litija
00050000-552b-7002-653c-cb7fd6351bc7	3202	Ljubečna
00050000-552b-7002-511d-2d3da71290e0	1000	Ljubljana 
00050000-552b-7002-9852-983e309c2ef7	1001	Ljubljana - poštni predali
00050000-552b-7002-e7c4-3d52a6adc0c6	1231	Ljubljana - Črnuče
00050000-552b-7002-73eb-b13989697bbf	1261	Ljubljana - Dobrunje
00050000-552b-7002-3f38-7bd750b538b5	1260	Ljubljana - Polje
00050000-552b-7002-878a-f00f73267329	1210	Ljubljana - Šentvid
00050000-552b-7002-ef1b-f8695cc0d2cb	1211	Ljubljana - Šmartno
00050000-552b-7002-38c4-c13a0013057c	3333	Ljubno ob Savinji
00050000-552b-7002-2fc7-772cf05d0553	9240	Ljutomer
00050000-552b-7002-d503-df7626bcf0aa	3215	Loče
00050000-552b-7002-6d96-979d6f60146a	5231	Log pod Mangartom
00050000-552b-7002-fd6b-f1393839444b	1358	Log pri Brezovici
00050000-552b-7002-5cc3-c06c9a7d3dc4	1370	Logatec
00050000-552b-7002-7a06-475222c82e1e	1371	Logatec
00050000-552b-7002-465d-c9fe35f70bfd	1434	Loka pri Zidanem Mostu
00050000-552b-7002-81b8-ebfeb37113b4	3223	Loka pri Žusmu
00050000-552b-7002-6139-2fa4c48bdb87	6219	Lokev
00050000-552b-7002-d962-0487d641e0fb	1318	Loški Potok
00050000-552b-7002-03ef-92c122d781a0	2324	Lovrenc na Dravskem polju
00050000-552b-7002-883c-bdf93869d33e	2344	Lovrenc na Pohorju
00050000-552b-7002-705f-ec0c7e7fc46d	3334	Luče
00050000-552b-7002-e1d7-f2aba5789b5c	1225	Lukovica
00050000-552b-7002-a65e-4308ec6971d3	9202	Mačkovci
00050000-552b-7002-6a8e-ef9254d9109b	2322	Majšperk
00050000-552b-7002-4dda-9620db8a20c7	2321	Makole
00050000-552b-7002-7123-c2c8bda2460c	9243	Mala Nedelja
00050000-552b-7002-16aa-e640be2bb9d2	2229	Malečnik
00050000-552b-7002-9565-d38f3814dfc4	6273	Marezige
00050000-552b-7002-84bd-1a84f93097de	2000	Maribor 
00050000-552b-7002-bf52-c25a9c0976e6	2001	Maribor - poštni predali
00050000-552b-7002-d43b-e3f45bb08ef6	2206	Marjeta na Dravskem polju
00050000-552b-7002-4514-21cb555cbcc9	2281	Markovci
00050000-552b-7002-15c4-fe90c8500ea7	9221	Martjanci
00050000-552b-7002-3c35-28ac2ecf6b79	6242	Materija
00050000-552b-7002-917d-0fa3852016f9	4211	Mavčiče
00050000-552b-7002-eef3-ba0ec5127824	1215	Medvode
00050000-552b-7002-276a-012217c2cabf	1234	Mengeš
00050000-552b-7002-9196-146411e6c2e5	8330	Metlika
00050000-552b-7002-f03a-3af99aca5628	2392	Mežica
00050000-552b-7002-374f-89806fa36cfa	2204	Miklavž na Dravskem polju
00050000-552b-7002-b54e-cb9097a25086	2275	Miklavž pri Ormožu
00050000-552b-7002-6e5a-02e472adecd2	5291	Miren
00050000-552b-7002-09a2-49736450a222	8233	Mirna
00050000-552b-7002-6b36-0e9ad0f78b41	8216	Mirna Peč
00050000-552b-7002-30ba-16adba15c812	2382	Mislinja
00050000-552b-7002-fb7b-9d1a72689f7e	4281	Mojstrana
00050000-552b-7002-6813-a623a6bd2854	8230	Mokronog
00050000-552b-7002-8efb-2ac75832cc9a	1251	Moravče
00050000-552b-7002-a030-572b5030b4e1	9226	Moravske Toplice
00050000-552b-7002-16ee-9202181507a6	5216	Most na Soči
00050000-552b-7002-7149-aec347644aa4	1221	Motnik
00050000-552b-7002-1c00-8bb8cd035415	3330	Mozirje
00050000-552b-7002-4c81-67493a2097cc	9000	Murska Sobota 
00050000-552b-7002-dbfe-2ba58de064f3	9001	Murska Sobota - poštni predali
00050000-552b-7002-05ac-c60d1fb1df01	2366	Muta
00050000-552b-7002-78ed-739ff356dc72	4202	Naklo
00050000-552b-7002-49a2-5bdb0aafa849	3331	Nazarje
00050000-552b-7002-2622-0d066e023841	1357	Notranje Gorice
00050000-552b-7002-5884-ea4f066edacb	3203	Nova Cerkev
00050000-552b-7002-3315-b1bfc3b62ba7	5000	Nova Gorica 
00050000-552b-7002-71c1-bb1b217987d8	5001	Nova Gorica - poštni predali
00050000-552b-7002-0343-69404f74a5b2	1385	Nova vas
00050000-552b-7002-ac14-f63daaeca414	8000	Novo mesto
00050000-552b-7002-fda6-d30f5d7f0be8	8001	Novo mesto - poštni predali
00050000-552b-7002-d58e-6d9539da4326	6243	Obrov
00050000-552b-7002-90dd-cc00ea18fce2	9233	Odranci
00050000-552b-7002-9679-1bf83e5fd0fe	2317	Oplotnica
00050000-552b-7002-b250-2b4d14329c69	2312	Orehova vas
00050000-552b-7002-3780-436cd6378ab2	2270	Ormož
00050000-552b-7002-11a9-20be6a832a03	1316	Ortnek
00050000-552b-7002-594a-00309da47063	1337	Osilnica
00050000-552b-7002-0697-11ea002336ec	8222	Otočec
00050000-552b-7002-8710-9474e2ad8010	2361	Ožbalt
00050000-552b-7002-ccdc-e8f9a830697a	2231	Pernica
00050000-552b-7002-09cd-a128688313cc	2211	Pesnica pri Mariboru
00050000-552b-7002-478d-b91a2f216538	9203	Petrovci
00050000-552b-7002-d56f-4640b6a42380	3301	Petrovče
00050000-552b-7002-caed-cd772db86e9f	6330	Piran/Pirano
00050000-552b-7002-bb94-5b044538cfb6	8255	Pišece
00050000-552b-7002-406a-036710d84636	6257	Pivka
00050000-552b-7002-801e-50ea45ba2ecb	6232	Planina
00050000-552b-7002-e338-3f792320145d	3225	Planina pri Sevnici
00050000-552b-7002-974f-49597335534a	6276	Pobegi
00050000-552b-7002-281e-435ef7c726fe	8312	Podbočje
00050000-552b-7002-a2ac-5fccf8fda6c9	5243	Podbrdo
00050000-552b-7002-9a16-02d40f45a5d9	3254	Podčetrtek
00050000-552b-7002-1383-8bce9b359310	2273	Podgorci
00050000-552b-7002-7b00-38da489dec3f	6216	Podgorje
00050000-552b-7002-4956-a07a33266895	2381	Podgorje pri Slovenj Gradcu
00050000-552b-7002-00fb-f7ca28f93ef9	6244	Podgrad
00050000-552b-7002-a1b4-17595d6a8cd1	1414	Podkum
00050000-552b-7002-7943-18575872df1c	2286	Podlehnik
00050000-552b-7002-5435-77878e82232b	5272	Podnanos
00050000-552b-7002-0bdd-c65be127e285	4244	Podnart
00050000-552b-7002-41e3-88903f158836	3241	Podplat
00050000-552b-7002-b53f-ae2aa21d2043	3257	Podsreda
00050000-552b-7002-7a13-8929f7b6c99a	2363	Podvelka
00050000-552b-7002-6dac-003233de700b	2208	Pohorje
00050000-552b-7002-5d92-924c84c7122a	2257	Polenšak
00050000-552b-7002-3b3e-a48206a1a444	1355	Polhov Gradec
00050000-552b-7002-4359-a93427a848f9	4223	Poljane nad Škofjo Loko
00050000-552b-7002-d6a9-917ae0724cf9	2319	Poljčane
00050000-552b-7002-ed1e-428311b21696	1272	Polšnik
00050000-552b-7002-4d8d-cfa56ca6ccbf	3313	Polzela
00050000-552b-7002-8332-541633719827	3232	Ponikva
00050000-552b-7002-bfdb-1ccb608c3830	6320	Portorož/Portorose
00050000-552b-7002-2f89-033eb1cb27d5	6230	Postojna
00050000-552b-7002-5959-c4cd711ded96	2331	Pragersko
00050000-552b-7002-69a7-cb50d519d366	3312	Prebold
00050000-552b-7002-5c0a-e427e96722f7	4205	Preddvor
00050000-552b-7002-3c50-2426b08790a4	6255	Prem
00050000-552b-7002-4f04-af00b060af36	1352	Preserje
00050000-552b-7002-ab16-30b480c72ced	6258	Prestranek
00050000-552b-7002-fd91-f22854fe1115	2391	Prevalje
00050000-552b-7002-bd46-9cc5d5f6a3fd	3262	Prevorje
00050000-552b-7002-5c46-5990a19508c7	1276	Primskovo 
00050000-552b-7002-d36f-62d1c6c94041	3253	Pristava pri Mestinju
00050000-552b-7002-77b7-88cf797fc41b	9207	Prosenjakovci/Partosfalva
00050000-552b-7002-0fb7-6f498638e925	5297	Prvačina
00050000-552b-7002-64e8-aeeb332fabb5	2250	Ptuj
00050000-552b-7002-4ccb-d16cd1964b15	2323	Ptujska Gora
00050000-552b-7002-e4be-377bad4dfefc	9201	Puconci
00050000-552b-7002-fd88-e6c6112e31a9	2327	Rače
00050000-552b-7002-038c-a78cf86b9a8e	1433	Radeče
00050000-552b-7002-83d7-8f76b8e06870	9252	Radenci
00050000-552b-7002-d4c9-5c9f810c73a3	2360	Radlje ob Dravi
00050000-552b-7002-9606-ddbc37775810	1235	Radomlje
00050000-552b-7002-2678-6f8534872d74	4240	Radovljica
00050000-552b-7002-dd78-5ac0a02b4799	8274	Raka
00050000-552b-7002-cd1e-30c932c128ee	1381	Rakek
00050000-552b-7002-fd1c-2aadc1a26b60	4283	Rateče - Planica
00050000-552b-7002-1f71-9c1c9e06c9ee	2390	Ravne na Koroškem
00050000-552b-7002-4e8d-66c08b7f1dfd	9246	Razkrižje
00050000-552b-7002-c2ae-56c553aee482	3332	Rečica ob Savinji
00050000-552b-7002-9e97-d40deb86d5b0	5292	Renče
00050000-552b-7002-12bf-4ff2e0f8b270	1310	Ribnica
00050000-552b-7002-07b0-5b730e3c6c00	2364	Ribnica na Pohorju
00050000-552b-7002-1485-c425d0a1b548	3272	Rimske Toplice
00050000-552b-7002-2c1e-bd297bea2a60	1314	Rob
00050000-552b-7002-2a2b-261dc384aad5	5215	Ročinj
00050000-552b-7002-5dd8-cdb3b3f73469	3250	Rogaška Slatina
00050000-552b-7002-5896-e63da46ebbdb	9262	Rogašovci
00050000-552b-7002-b0e8-0ffb8f8d7013	3252	Rogatec
00050000-552b-7002-ccfd-7e79ef9d2bae	1373	Rovte
00050000-552b-7002-c83d-b5516a18062c	2342	Ruše
00050000-552b-7002-479b-3816264552a6	1282	Sava
00050000-552b-7002-27c0-cefab4354e8e	6333	Sečovlje/Sicciole
00050000-552b-7002-b545-2bed724a0a61	4227	Selca
00050000-552b-7002-71d2-fd3f4703f0ca	2352	Selnica ob Dravi
00050000-552b-7002-bc51-b9b0c79f49a7	8333	Semič
00050000-552b-7002-0d99-f8a4c99fb7d9	8281	Senovo
00050000-552b-7002-8e91-e950b4648b52	6224	Senožeče
00050000-552b-7002-70cc-e14616f60c39	8290	Sevnica
00050000-552b-7002-7e39-c1739d012043	6210	Sežana
00050000-552b-7002-c539-630c0ab93a71	2214	Sladki Vrh
00050000-552b-7002-6d60-4e1bd6e8eab8	5283	Slap ob Idrijci
00050000-552b-7002-79bb-27819653055d	2380	Slovenj Gradec
00050000-552b-7002-f2f3-1641fe777f81	2310	Slovenska Bistrica
00050000-552b-7002-a024-a53bd92c5a92	3210	Slovenske Konjice
00050000-552b-7002-36e2-b8ab31e26e07	1216	Smlednik
00050000-552b-7002-9202-ce2b72f3a5ab	5232	Soča
00050000-552b-7002-8b7d-0dae355b99cf	1317	Sodražica
00050000-552b-7002-1eb9-c8847517808b	3335	Solčava
00050000-552b-7002-8104-4a4329d832ae	5250	Solkan
00050000-552b-7002-afe0-7d88a832cadb	4229	Sorica
00050000-552b-7002-21df-eea92768e502	4225	Sovodenj
00050000-552b-7002-42a5-083ce5c6e118	5281	Spodnja Idrija
00050000-552b-7002-0aaf-f0a5fcf87ee0	2241	Spodnji Duplek
00050000-552b-7002-d918-2bfed38df442	9245	Spodnji Ivanjci
00050000-552b-7002-fc7b-0abaa078385d	2277	Središče ob Dravi
00050000-552b-7002-0b92-e8917587a691	4267	Srednja vas v Bohinju
00050000-552b-7002-991f-014ecc9bef68	8256	Sromlje 
00050000-552b-7002-7c5e-cdcafac6f8f2	5224	Srpenica
00050000-552b-7002-59ce-5bc9999bd2d2	1242	Stahovica
00050000-552b-7002-f78b-3e4fe34be641	1332	Stara Cerkev
00050000-552b-7002-622b-faf909f6573b	8342	Stari trg ob Kolpi
00050000-552b-7002-9ab2-5ee376bb79a6	1386	Stari trg pri Ložu
00050000-552b-7002-6785-3f0f09366f98	2205	Starše
00050000-552b-7002-dcc0-45a9e35e5b8e	2289	Stoperce
00050000-552b-7002-4a20-49aaa0bc203d	8322	Stopiče
00050000-552b-7002-a4b2-b755714c2591	3206	Stranice
00050000-552b-7002-965d-a6263a8d8443	8351	Straža
00050000-552b-7002-64b0-dfe47b80d7d2	1313	Struge
00050000-552b-7002-7144-af9a7b2a6bf7	8293	Studenec
00050000-552b-7002-8590-39d517b0e32d	8331	Suhor
00050000-552b-7002-8012-c4036011bcb2	2233	Sv. Ana v Slovenskih goricah
00050000-552b-7002-501a-70d66f133721	2235	Sv. Trojica v Slovenskih goricah
00050000-552b-7002-8e61-77875ec0edf1	2353	Sveti Duh na Ostrem Vrhu
00050000-552b-7002-8b42-8d57f5db1af6	9244	Sveti Jurij ob Ščavnici
00050000-552b-7002-c391-7e463a42db37	3264	Sveti Štefan
00050000-552b-7002-9228-82f4dcdf742f	2258	Sveti Tomaž
00050000-552b-7002-b1c0-251756c36982	9204	Šalovci
00050000-552b-7002-d52b-e5ce07633a9b	5261	Šempas
00050000-552b-7002-a848-272979030242	5290	Šempeter pri Gorici
00050000-552b-7002-2000-91d1c0018a8e	3311	Šempeter v Savinjski dolini
00050000-552b-7002-b70d-24be05d94a68	4208	Šenčur
00050000-552b-7002-29ea-c4601bc2ccf9	2212	Šentilj v Slovenskih goricah
00050000-552b-7002-af2c-7e61cba3ec60	8297	Šentjanž
00050000-552b-7002-6159-b9d6ef91366b	2373	Šentjanž pri Dravogradu
00050000-552b-7002-b636-3186d0e57734	8310	Šentjernej
00050000-552b-7002-d44e-55560481de4d	3230	Šentjur
00050000-552b-7002-cf74-40fb0e227581	3271	Šentrupert
00050000-552b-7002-fdd5-4d6a6a02c6cb	8232	Šentrupert
00050000-552b-7002-691a-5f524b0d3a76	1296	Šentvid pri Stični
00050000-552b-7002-7678-34c0734477c3	8275	Škocjan
00050000-552b-7002-6160-92aaf02b2544	6281	Škofije
00050000-552b-7002-4bf4-7a08390ea775	4220	Škofja Loka
00050000-552b-7002-8b57-aea22c356991	3211	Škofja vas
00050000-552b-7002-2ee0-a00d404fd942	1291	Škofljica
00050000-552b-7002-59fa-7a1544ed038a	6274	Šmarje
00050000-552b-7002-b21f-2d827bbd4c4a	1293	Šmarje - Sap
00050000-552b-7002-12ae-3213793471f0	3240	Šmarje pri Jelšah
00050000-552b-7002-a8d5-fba252ac3663	8220	Šmarješke Toplice
00050000-552b-7002-4843-f1b4f63db2ea	2315	Šmartno na Pohorju
00050000-552b-7002-ad5a-51b0ecea274e	3341	Šmartno ob Dreti
00050000-552b-7002-ed5e-33a6db299e52	3327	Šmartno ob Paki
00050000-552b-7002-560e-934408d9ebcb	1275	Šmartno pri Litiji
00050000-552b-7002-11e3-cd29548b50b1	2383	Šmartno pri Slovenj Gradcu
00050000-552b-7002-7639-8a949bef832f	3201	Šmartno v Rožni dolini
00050000-552b-7002-4a00-8c3a2345c971	3325	Šoštanj
00050000-552b-7002-8f94-d9e0cca0a107	6222	Štanjel
00050000-552b-7002-0043-9aa79c4b3bbe	3220	Štore
00050000-552b-7002-5248-3bb0157cccd8	3304	Tabor
00050000-552b-7002-117f-e738e60f8a9b	3221	Teharje
00050000-552b-7002-fc71-1110312fc8b1	9251	Tišina
00050000-552b-7002-633b-31b2c729a462	5220	Tolmin
00050000-552b-7002-f37a-478ac7b12c84	3326	Topolšica
00050000-552b-7002-5299-457363a531a6	2371	Trbonje
00050000-552b-7002-8ae1-27bd06b5685a	1420	Trbovlje
00050000-552b-7002-069d-8a0184e4ab74	8231	Trebelno 
00050000-552b-7002-6c67-a476056ada10	8210	Trebnje
00050000-552b-7002-3ffc-01cf9411ef4f	5252	Trnovo pri Gorici
00050000-552b-7002-1db1-f29fa60366cf	2254	Trnovska vas
00050000-552b-7002-2ab9-2975e68b8ae8	1222	Trojane
00050000-552b-7002-935d-61e9ef5c14d8	1236	Trzin
00050000-552b-7002-1834-ae031d192704	4290	Tržič
00050000-552b-7002-b078-3a8ff110eb4d	8295	Tržišče
00050000-552b-7002-71e5-11ba5eeff157	1311	Turjak
00050000-552b-7002-f68f-75a7730e816c	9224	Turnišče
00050000-552b-7002-cba4-0068f53ae22e	8323	Uršna sela
00050000-552b-7002-2ec5-4394d066a345	1252	Vače
00050000-552b-7002-4ae8-cc1d7c015d16	3320	Velenje 
00050000-552b-7002-ee0b-6cd350a19deb	3322	Velenje - poštni predali
00050000-552b-7002-b3df-a699cbd07c8b	8212	Velika Loka
00050000-552b-7002-89ce-ff7c045f5a24	2274	Velika Nedelja
00050000-552b-7002-cea4-786a3e44541b	9225	Velika Polana
00050000-552b-7002-2508-6db2f3015d1e	1315	Velike Lašče
00050000-552b-7002-9a97-4b8253f16541	8213	Veliki Gaber
00050000-552b-7002-9019-123298352e43	9241	Veržej
00050000-552b-7002-33f6-5a3e5ce62505	1312	Videm - Dobrepolje
00050000-552b-7002-60ac-0234476e0b48	2284	Videm pri Ptuju
00050000-552b-7002-14c7-fab119927728	8344	Vinica
00050000-552b-7002-fb32-cedb7874c3bb	5271	Vipava
00050000-552b-7002-dc42-ec70427221c8	4212	Visoko
00050000-552b-7002-4b45-20db83865752	1294	Višnja Gora
00050000-552b-7002-38fa-1100f282f311	3205	Vitanje
00050000-552b-7002-3bd1-6005a6b2a9df	2255	Vitomarci
00050000-552b-7002-1207-809c3dc79f07	1217	Vodice
00050000-552b-7002-c77d-2680eb984d7b	3212	Vojnik\t
00050000-552b-7002-e4cb-96e0ad9d625c	5293	Volčja Draga
00050000-552b-7002-935e-bd5932b41501	2232	Voličina
00050000-552b-7002-baca-c26df6332385	3305	Vransko
00050000-552b-7002-921a-dc4123b8ae46	6217	Vremski Britof
00050000-552b-7002-a1ad-1473dc7a9697	1360	Vrhnika
00050000-552b-7002-54ce-8e23cc4f65e7	2365	Vuhred
00050000-552b-7002-9268-6269413e1b44	2367	Vuzenica
00050000-552b-7002-1bf2-4af03d00cf97	8292	Zabukovje 
00050000-552b-7002-58e3-0ed2aa0c64a2	1410	Zagorje ob Savi
00050000-552b-7002-7c9e-5a23688159a0	1303	Zagradec
00050000-552b-7002-ab2a-cb697cc2bbe3	2283	Zavrč
00050000-552b-7002-2fd8-5e034625c053	8272	Zdole 
00050000-552b-7002-6705-1f137b84f713	4201	Zgornja Besnica
00050000-552b-7002-48d9-51784677015d	2242	Zgornja Korena
00050000-552b-7002-efc3-5bef929c4ca4	2201	Zgornja Kungota
00050000-552b-7002-b1b8-9df6fb4aae8b	2316	Zgornja Ložnica
00050000-552b-7002-391f-7b34e10b5d19	2314	Zgornja Polskava
00050000-552b-7002-13e4-e8a144cf54a8	2213	Zgornja Velka
00050000-552b-7002-ee70-04868358c4ea	4247	Zgornje Gorje
00050000-552b-7002-b567-8ab5c5542d11	4206	Zgornje Jezersko
00050000-552b-7002-6c54-cd7da67ae552	2285	Zgornji Leskovec
00050000-552b-7002-479f-44ad76e93add	1432	Zidani Most
00050000-552b-7002-fa5e-3b88202e92e1	3214	Zreče
00050000-552b-7002-89dc-da09b8f37f55	4209	Žabnica
00050000-552b-7002-942f-636b052d48d5	3310	Žalec
00050000-552b-7002-2e49-944adb8dd133	4228	Železniki
00050000-552b-7002-e0e6-34e9ca5e275d	2287	Žetale
00050000-552b-7002-3722-f5007be48e55	4226	Žiri
00050000-552b-7002-2d88-0624a876ea9c	4274	Žirovnica
00050000-552b-7002-05c2-4cb02f627710	8360	Žužemberk
\.


--
-- TOC entry 2618 (class 0 OID 95957)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2601 (class 0 OID 95780)
-- Dependencies: 183
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2606 (class 0 OID 95846)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2620 (class 0 OID 95969)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 96074)
-- Dependencies: 214
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2636 (class 0 OID 96118)
-- Dependencies: 218
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2624 (class 0 OID 95998)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2616 (class 0 OID 95942)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2615 (class 0 OID 95932)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 96108)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 96064)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2589 (class 0 OID 95648)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-552b-7002-ceb5-5393c23bf9c7	00010000-552b-7002-f80c-0118465590ef	2015-04-13 09:28:03	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROdBXN3RdoYccc57MKpG9q054yoovZSIW";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2650 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2625 (class 0 OID 96007)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2593 (class 0 OID 95685)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00000000-552b-7002-31f6-b8ee08f89c9b	beri-vse	Polni dostop do vsega v aplikaciji.	t
00000000-552b-7002-a826-b2148945d996	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00000000-552b-7002-da13-b64d4e095247	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00000000-552b-7002-3d3c-a08c6b3e953a	ifi-all	Polni dostop do vsega v aplikaciji.	t
00000000-552b-7002-a9c9-095b8568903b	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00000000-552b-7002-202a-43f84ae3c901	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2591 (class 0 OID 95669)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-552b-7002-ceb5-5393c23bf9c7	00000000-552b-7002-3d3c-a08c6b3e953a
00010000-552b-7002-706e-488c7ae81c41	00000000-552b-7002-da13-b64d4e095247
\.


--
-- TOC entry 2627 (class 0 OID 96021)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2619 (class 0 OID 95963)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2613 (class 0 OID 95913)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2598 (class 0 OID 95745)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2614 (class 0 OID 95919)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 96099)
-- Dependencies: 216
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2604 (class 0 OID 95815)
-- Dependencies: 186
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2590 (class 0 OID 95657)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, username, password, enabled, expires, defaultroute, defaultrouteparams, email) FROM stdin;
00010000-552b-7002-f80c-0118465590ef	Konzolni	console	$2y$05$NS4xMjkyMTcwMzExMjAxRO7.JwgSmUOUbWGjKuFoB43c12oIwKlX.	t	\N	\N	\N	rootmail@max.si
00010000-552b-7002-706e-488c7ae81c41	Anonimni	anonymous	$2y$05$NS4xMjkyMTcwMzExMjAxROEr4lIXDWPgBp/hGF4ofEbBPKpZt5Kxu	t	\N	\N	\N	noreply@max.si
00010000-552b-7002-ceb5-5393c23bf9c7	Administrator	admin	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@max.si
\.


--
-- TOC entry 2639 (class 0 OID 96149)
-- Dependencies: 221
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2608 (class 0 OID 95861)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2623 (class 0 OID 95990)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 96056)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2610 (class 0 OID 95889)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2638 (class 0 OID 96139)
-- Dependencies: 220
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 96046)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2236 (class 2606 OID 95710)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 96188)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 96181)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 96098)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 95879)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2305 (class 2606 OID 95912)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2272 (class 2606 OID 95841)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2359 (class 2606 OID 96042)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2283 (class 2606 OID 95859)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2302 (class 2606 OID 95906)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2243 (class 2606 OID 95742)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 95955)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 95982)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2265 (class 2606 OID 95813)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2240 (class 2606 OID 95719)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2256 (class 2606 OID 95777)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2234 (class 2606 OID 95699)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2227 (class 2606 OID 95684)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 95988)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 96020)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 96135)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2251 (class 2606 OID 95770)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2262 (class 2606 OID 95801)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2330 (class 2606 OID 95961)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 95792)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2281 (class 2606 OID 95850)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 95973)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 96080)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 96123)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 96005)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2324 (class 2606 OID 95946)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2318 (class 2606 OID 95937)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 96117)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 96071)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2218 (class 2606 OID 95656)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 96011)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2225 (class 2606 OID 95673)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2229 (class 2606 OID 95693)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 96029)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2332 (class 2606 OID 95968)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2307 (class 2606 OID 95918)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2248 (class 2606 OID 95749)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 95928)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 96107)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2270 (class 2606 OID 95826)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2221 (class 2606 OID 95667)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 96163)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2287 (class 2606 OID 95865)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 95996)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2367 (class 2606 OID 96062)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 95901)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 96148)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 96055)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2290 (class 1259 OID 95886)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2249 (class 1259 OID 95772)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2339 (class 1259 OID 95989)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2333 (class 1259 OID 95975)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2334 (class 1259 OID 95974)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2285 (class 1259 OID 95866)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2360 (class 1259 OID 96045)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2361 (class 1259 OID 96043)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2362 (class 1259 OID 96044)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2385 (class 1259 OID 96136)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2386 (class 1259 OID 96137)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 96138)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2392 (class 1259 OID 96166)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2393 (class 1259 OID 96165)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2394 (class 1259 OID 96164)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2267 (class 1259 OID 95828)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2268 (class 1259 OID 95827)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2253 (class 1259 OID 95779)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2254 (class 1259 OID 95778)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2348 (class 1259 OID 96012)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2303 (class 1259 OID 95907)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2231 (class 1259 OID 95700)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2232 (class 1259 OID 95701)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2353 (class 1259 OID 96032)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2354 (class 1259 OID 96031)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2355 (class 1259 OID 96030)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2277 (class 1259 OID 95851)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2278 (class 1259 OID 95853)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2279 (class 1259 OID 95852)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2313 (class 1259 OID 95941)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2314 (class 1259 OID 95939)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2315 (class 1259 OID 95938)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2316 (class 1259 OID 95940)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2222 (class 1259 OID 95674)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2223 (class 1259 OID 95675)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2342 (class 1259 OID 95997)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2328 (class 1259 OID 95962)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2368 (class 1259 OID 96072)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2369 (class 1259 OID 96073)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2257 (class 1259 OID 95793)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2258 (class 1259 OID 95794)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2372 (class 1259 OID 96081)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2373 (class 1259 OID 96082)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2403 (class 1259 OID 96191)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2404 (class 1259 OID 96190)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2405 (class 1259 OID 96193)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2406 (class 1259 OID 96189)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2407 (class 1259 OID 96192)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2365 (class 1259 OID 96063)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2319 (class 1259 OID 95950)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2320 (class 1259 OID 95949)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2321 (class 1259 OID 95947)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2322 (class 1259 OID 95948)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2241 (class 1259 OID 95743)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2399 (class 1259 OID 96183)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 96182)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2284 (class 1259 OID 95860)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2237 (class 1259 OID 95721)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2238 (class 1259 OID 95720)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2245 (class 1259 OID 95750)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2246 (class 1259 OID 95751)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2308 (class 1259 OID 95931)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2309 (class 1259 OID 95930)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2310 (class 1259 OID 95929)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2291 (class 1259 OID 95888)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2292 (class 1259 OID 95884)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2293 (class 1259 OID 95881)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2294 (class 1259 OID 95882)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2295 (class 1259 OID 95880)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2296 (class 1259 OID 95885)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2297 (class 1259 OID 95883)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2252 (class 1259 OID 95771)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2273 (class 1259 OID 95842)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2274 (class 1259 OID 95844)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2275 (class 1259 OID 95843)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2276 (class 1259 OID 95845)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2327 (class 1259 OID 95956)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2266 (class 1259 OID 95814)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2219 (class 1259 OID 95668)
-- Name: uniq_7fb775b7f85e0677; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7f85e0677 ON uporabniki USING btree (username);


--
-- TOC entry 2347 (class 1259 OID 96006)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2244 (class 1259 OID 95744)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2263 (class 1259 OID 95802)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2384 (class 1259 OID 96124)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2230 (class 1259 OID 95694)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2298 (class 1259 OID 95887)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2434 (class 2606 OID 96324)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2431 (class 2606 OID 96309)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2432 (class 2606 OID 96314)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2436 (class 2606 OID 96334)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2430 (class 2606 OID 96304)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2435 (class 2606 OID 96329)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2433 (class 2606 OID 96319)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2418 (class 2606 OID 96244)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2453 (class 2606 OID 96419)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2452 (class 2606 OID 96414)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2451 (class 2606 OID 96409)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2429 (class 2606 OID 96299)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2461 (class 2606 OID 96459)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2459 (class 2606 OID 96449)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 96454)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2449 (class 2606 OID 96399)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2468 (class 2606 OID 96494)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2469 (class 2606 OID 96499)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2470 (class 2606 OID 96504)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2473 (class 2606 OID 96519)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2472 (class 2606 OID 96514)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2471 (class 2606 OID 96509)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2424 (class 2606 OID 96274)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2423 (class 2606 OID 96269)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2420 (class 2606 OID 96254)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2419 (class 2606 OID 96249)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2455 (class 2606 OID 96429)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2437 (class 2606 OID 96339)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2410 (class 2606 OID 96204)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2411 (class 2606 OID 96209)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2458 (class 2606 OID 96444)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2457 (class 2606 OID 96439)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2456 (class 2606 OID 96434)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2425 (class 2606 OID 96279)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2427 (class 2606 OID 96289)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2426 (class 2606 OID 96284)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2444 (class 2606 OID 96374)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2442 (class 2606 OID 96364)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2441 (class 2606 OID 96359)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2443 (class 2606 OID 96369)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2408 (class 2606 OID 96194)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2409 (class 2606 OID 96199)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2454 (class 2606 OID 96424)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2450 (class 2606 OID 96404)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2463 (class 2606 OID 96469)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2464 (class 2606 OID 96474)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2421 (class 2606 OID 96259)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2422 (class 2606 OID 96264)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2465 (class 2606 OID 96479)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2466 (class 2606 OID 96484)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2478 (class 2606 OID 96544)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2477 (class 2606 OID 96539)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2480 (class 2606 OID 96554)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2476 (class 2606 OID 96534)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2479 (class 2606 OID 96549)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2462 (class 2606 OID 96464)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2448 (class 2606 OID 96394)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2447 (class 2606 OID 96389)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2445 (class 2606 OID 96379)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2446 (class 2606 OID 96384)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2414 (class 2606 OID 96224)
-- Name: fk_b7229ce169e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT fk_b7229ce169e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2415 (class 2606 OID 96229)
-- Name: fk_b7229ce1a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT fk_b7229ce1a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2475 (class 2606 OID 96529)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2474 (class 2606 OID 96524)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2428 (class 2606 OID 96294)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2467 (class 2606 OID 96489)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2413 (class 2606 OID 96219)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2412 (class 2606 OID 96214)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2416 (class 2606 OID 96234)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2417 (class 2606 OID 96239)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2440 (class 2606 OID 96354)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2439 (class 2606 OID 96349)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2438 (class 2606 OID 96344)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-13 10:46:00 CEST

--
-- PostgreSQL database dump complete
--

