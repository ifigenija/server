--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-04-14 16:05:42 CEST

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
-- TOC entry 177 (class 1259 OID 294102)
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
-- TOC entry 223 (class 1259 OID 294584)
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
-- TOC entry 222 (class 1259 OID 294567)
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
-- TOC entry 215 (class 1259 OID 294483)
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
-- TOC entry 191 (class 1259 OID 294267)
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
-- TOC entry 194 (class 1259 OID 294308)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 187 (class 1259 OID 294229)
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
-- TOC entry 210 (class 1259 OID 294433)
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
-- TOC entry 189 (class 1259 OID 294254)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 193 (class 1259 OID 294302)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 179 (class 1259 OID 294122)
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
-- TOC entry 199 (class 1259 OID 294351)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 203 (class 1259 OID 294376)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 185 (class 1259 OID 294203)
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
-- TOC entry 178 (class 1259 OID 294111)
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
-- TOC entry 182 (class 1259 OID 294173)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 174 (class 1259 OID 294076)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 294095)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 294383)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 294413)
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
-- TOC entry 219 (class 1259 OID 294525)
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
-- TOC entry 181 (class 1259 OID 294152)
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
-- TOC entry 184 (class 1259 OID 294195)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 294357)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 183 (class 1259 OID 294180)
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
-- TOC entry 188 (class 1259 OID 294246)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 294369)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 294474)
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
-- TOC entry 218 (class 1259 OID 294518)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 294398)
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
-- TOC entry 198 (class 1259 OID 294342)
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
-- TOC entry 197 (class 1259 OID 294332)
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
-- TOC entry 217 (class 1259 OID 294508)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 294464)
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
-- TOC entry 171 (class 1259 OID 294048)
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
-- TOC entry 170 (class 1259 OID 294046)
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
-- TOC entry 207 (class 1259 OID 294407)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 294085)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 294069)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 294421)
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
-- TOC entry 201 (class 1259 OID 294363)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 294313)
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
-- TOC entry 180 (class 1259 OID 294145)
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
-- TOC entry 196 (class 1259 OID 294319)
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
-- TOC entry 216 (class 1259 OID 294499)
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
-- TOC entry 186 (class 1259 OID 294215)
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
-- TOC entry 172 (class 1259 OID 294057)
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
-- TOC entry 221 (class 1259 OID 294549)
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
-- TOC entry 190 (class 1259 OID 294261)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 205 (class 1259 OID 294390)
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
-- TOC entry 212 (class 1259 OID 294456)
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
-- TOC entry 192 (class 1259 OID 294289)
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
-- TOC entry 220 (class 1259 OID 294539)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 294446)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2093 (class 2604 OID 294051)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2595 (class 0 OID 294102)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 294584)
-- Dependencies: 223
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 294567)
-- Dependencies: 222
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 294483)
-- Dependencies: 215
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2609 (class 0 OID 294267)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2612 (class 0 OID 294308)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2605 (class 0 OID 294229)
-- Dependencies: 187
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-552d-1eb4-1813-5577f8255ead	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-552d-1eb4-b954-e449af66d9e1	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-552d-1eb4-7cde-9b2d7e61d615	AL	ALB	008	Albania 	Albanija	\N
00040000-552d-1eb4-94f0-3ac1a57a422e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-552d-1eb4-f76f-fbbea962a7c2	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-552d-1eb4-04e0-c0202b342751	AD	AND	020	Andorra 	Andora	\N
00040000-552d-1eb4-ecda-7c370c5ae037	AO	AGO	024	Angola 	Angola	\N
00040000-552d-1eb4-eecb-37add3755265	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-552d-1eb4-a17f-e4e3a2f0b7bd	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-552d-1eb4-d1d1-e9b87f1699cf	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-552d-1eb4-1a4f-6de22a6ec8aa	AR	ARG	032	Argentina 	Argenitna	\N
00040000-552d-1eb4-0265-fc9d0c6823ff	AM	ARM	051	Armenia 	Armenija	\N
00040000-552d-1eb4-9674-4f408ae6c6ff	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-552d-1eb4-04fe-05ae59b93bb5	AU	AUS	036	Australia 	Avstralija	\N
00040000-552d-1eb4-2dc0-cff302c3ee8a	AT	AUT	040	Austria 	Avstrija	\N
00040000-552d-1eb4-d1c0-9ea45e629b13	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-552d-1eb4-3d32-d193ba46831e	BS	BHS	044	Bahamas 	Bahami	\N
00040000-552d-1eb4-470f-9fab84e4f71a	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-552d-1eb4-d135-50280fb86743	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-552d-1eb4-31f9-231b3d6ae789	BB	BRB	052	Barbados 	Barbados	\N
00040000-552d-1eb4-a174-0165e8298909	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-552d-1eb4-5f97-816ba132db9f	BE	BEL	056	Belgium 	Belgija	\N
00040000-552d-1eb4-8868-fbb1a7fc81a3	BZ	BLZ	084	Belize 	Belize	\N
00040000-552d-1eb4-35f2-ec92572bc76b	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-552d-1eb4-d27b-0f5cb997f8d9	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-552d-1eb4-758d-b92a3fd817c1	BT	BTN	064	Bhutan 	Butan	\N
00040000-552d-1eb4-3d85-2b93ec7f3da4	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-552d-1eb4-07c1-71fd4cdb66b5	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-552d-1eb4-7cec-24fe935b0a98	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-552d-1eb4-12b9-cd3d969ea094	BW	BWA	072	Botswana 	Bocvana	\N
00040000-552d-1eb4-9a53-67a14cecf548	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-552d-1eb4-dd64-17ff7ddf2c83	BR	BRA	076	Brazil 	Brazilija	\N
00040000-552d-1eb4-0bcd-b4b4bcce28fa	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-552d-1eb4-4f37-a37e2623f3ca	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-552d-1eb4-c75f-ebe09ace31c5	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-552d-1eb4-00d5-03e135e8c24b	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-552d-1eb4-0f63-b1f135a0542a	BI	BDI	108	Burundi 	Burundi 	\N
00040000-552d-1eb4-8bde-08184b0b831c	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-552d-1eb4-69ab-b8c13050ae6b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-552d-1eb4-df55-586ad36b5ab6	CA	CAN	124	Canada 	Kanada	\N
00040000-552d-1eb4-5543-62faa7fdc875	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-552d-1eb4-868d-6dc4da246d0b	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-552d-1eb4-e3e1-7062bd36d207	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-552d-1eb4-c9cd-2c3ae8edb721	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-552d-1eb4-835d-690d5613849e	CL	CHL	152	Chile 	Čile	\N
00040000-552d-1eb4-5c32-b771d1463232	CN	CHN	156	China 	Kitajska	\N
00040000-552d-1eb4-a2b2-6770f617ca17	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-552d-1eb4-2a1f-a430768a94de	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-552d-1eb4-4d58-68f70282d024	CO	COL	170	Colombia 	Kolumbija	\N
00040000-552d-1eb4-3ec5-6bb54904ab8a	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-552d-1eb4-bcdb-73c9fce1b676	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-552d-1eb4-b7b5-42fa9946809e	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-552d-1eb4-8863-55e51b2ef242	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-552d-1eb4-13d7-7bccc4b57060	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-552d-1eb4-dd03-2c7b78cad871	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-552d-1eb4-d1b3-523069d75074	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-552d-1eb4-da36-fb459817379b	CU	CUB	192	Cuba 	Kuba	\N
00040000-552d-1eb4-a4cc-e80e6d36b7c6	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-552d-1eb4-2b9a-adcab3e6840d	CY	CYP	196	Cyprus 	Ciper	\N
00040000-552d-1eb4-8e03-5eca6d8c8dbf	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-552d-1eb4-9df3-3d3a7a3da04e	DK	DNK	208	Denmark 	Danska	\N
00040000-552d-1eb4-ee2d-a6b7156ab6c0	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-552d-1eb4-5a57-8cd412c20e5b	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-552d-1eb4-e84c-08f642a85739	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-552d-1eb4-9da6-6c5690a3cb2c	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-552d-1eb4-3050-989c1c53e76e	EG	EGY	818	Egypt 	Egipt	\N
00040000-552d-1eb4-4048-660945ce04a6	SV	SLV	222	El Salvador 	Salvador	\N
00040000-552d-1eb4-8d10-e88aa46ab699	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-552d-1eb4-8022-15520b709bf9	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-552d-1eb4-1d87-be0613648640	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-552d-1eb4-8d1a-60bb40d1b1fd	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-552d-1eb4-9736-4b9c6d400f4a	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-552d-1eb4-0350-478b8e32613a	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-552d-1eb4-efb9-def134d42889	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-552d-1eb4-2a1a-7b1c9cb67433	FI	FIN	246	Finland 	Finska	\N
00040000-552d-1eb4-c67b-ab2c1cd708d7	FR	FRA	250	France 	Francija	\N
00040000-552d-1eb4-b142-40ad0c3bcb98	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-552d-1eb4-abe0-d8868758b9e2	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-552d-1eb4-14ec-e5ab4f976346	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-552d-1eb4-46be-842e026187c9	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-552d-1eb4-1d0f-a097bbf416e7	GA	GAB	266	Gabon 	Gabon	\N
00040000-552d-1eb4-1d69-5642380f7912	GM	GMB	270	Gambia 	Gambija	\N
00040000-552d-1eb4-fa81-a5ef0d8c5445	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-552d-1eb4-8f35-52217b38dcd2	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-552d-1eb4-9da2-923ae5a2bb59	GH	GHA	288	Ghana 	Gana	\N
00040000-552d-1eb4-2e96-9a7595fe276f	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-552d-1eb4-e53b-8770b8bd2415	GR	GRC	300	Greece 	Grčija	\N
00040000-552d-1eb4-a4fb-4803b386780e	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-552d-1eb4-b133-4fa41d245919	GD	GRD	308	Grenada 	Grenada	\N
00040000-552d-1eb4-6838-91df92159061	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-552d-1eb4-083b-199e778f6999	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-552d-1eb4-0708-3bd7e48cbb45	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-552d-1eb4-14f9-258a4b7ef18a	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-552d-1eb4-4d80-4fde0d197b77	GN	GIN	324	Guinea 	Gvineja	\N
00040000-552d-1eb4-b3d1-788d581d2b44	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-552d-1eb4-9c10-78022e6e4e3e	GY	GUY	328	Guyana 	Gvajana	\N
00040000-552d-1eb4-59d7-dfa689d5e70a	HT	HTI	332	Haiti 	Haiti	\N
00040000-552d-1eb4-be48-27f7499e82fc	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-552d-1eb4-60c5-abd0ee2e4148	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-552d-1eb4-aa2d-9c26f79ae68c	HN	HND	340	Honduras 	Honduras	\N
00040000-552d-1eb4-3ae4-2acfabe5bcf6	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-552d-1eb4-fc7c-97ec791e4a60	HU	HUN	348	Hungary 	Madžarska	\N
00040000-552d-1eb4-8d81-175c5e87a3d5	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-552d-1eb4-56e3-8c88941fdbac	IN	IND	356	India 	Indija	\N
00040000-552d-1eb4-4f50-9b350a9cf91a	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-552d-1eb4-0f63-02244a68581b	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-552d-1eb4-08d6-c0a7921bd535	IQ	IRQ	368	Iraq 	Irak	\N
00040000-552d-1eb4-ad1b-e125de71d21a	IE	IRL	372	Ireland 	Irska	\N
00040000-552d-1eb4-a0c1-77b316885b48	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-552d-1eb4-2684-7a7ea57dbdc0	IL	ISR	376	Israel 	Izrael	\N
00040000-552d-1eb4-a5ed-9015eaf4dbb7	IT	ITA	380	Italy 	Italija	\N
00040000-552d-1eb4-eea2-b6b0a7e7a83c	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-552d-1eb4-763d-b78061ad3564	JP	JPN	392	Japan 	Japonska	\N
00040000-552d-1eb4-071f-1e9813c66313	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-552d-1eb4-ceac-706f4ce4f6b1	JO	JOR	400	Jordan 	Jordanija	\N
00040000-552d-1eb4-7a72-f568ba34a8cd	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-552d-1eb4-8f20-3369837b3286	KE	KEN	404	Kenya 	Kenija	\N
00040000-552d-1eb4-519a-db2f3c530ade	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-552d-1eb4-77f9-5b95c4eacb98	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-552d-1eb4-1d7e-f8779b45ff59	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-552d-1eb4-5dc9-612cb496f736	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-552d-1eb4-2bee-180213ca71b4	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-552d-1eb4-1631-a253c0ff9a5b	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-552d-1eb4-5fbe-d4a881342d98	LV	LVA	428	Latvia 	Latvija	\N
00040000-552d-1eb4-f190-59db4e1c1d06	LB	LBN	422	Lebanon 	Libanon	\N
00040000-552d-1eb4-1a9c-635572b40831	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-552d-1eb4-913c-a26a4b80b0f1	LR	LBR	430	Liberia 	Liberija	\N
00040000-552d-1eb4-48e3-d11f130b7967	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-552d-1eb4-5d6d-134c328362bb	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-552d-1eb4-ef5a-ffab57659390	LT	LTU	440	Lithuania 	Litva	\N
00040000-552d-1eb4-2b2e-d0bebb56f84c	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-552d-1eb4-86a7-ef8451421b24	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-552d-1eb4-b2f2-4bcb31534e61	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-552d-1eb4-e458-03f3f2afc261	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-552d-1eb4-195d-1580be1407af	MW	MWI	454	Malawi 	Malavi	\N
00040000-552d-1eb4-b765-40ce0c97656e	MY	MYS	458	Malaysia 	Malezija	\N
00040000-552d-1eb4-b5bc-15518665abac	MV	MDV	462	Maldives 	Maldivi	\N
00040000-552d-1eb4-3a43-216fffa6ab14	ML	MLI	466	Mali 	Mali	\N
00040000-552d-1eb4-b7a3-ce9dfdb1626e	MT	MLT	470	Malta 	Malta	\N
00040000-552d-1eb4-792d-8ccdc1473016	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-552d-1eb4-aa71-d77af2e4caad	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-552d-1eb4-b065-9d946d485e19	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-552d-1eb4-7f9b-92ff9b0e9a44	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-552d-1eb4-84ed-e6beab20111c	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-552d-1eb4-df0f-1b6e21af6148	MX	MEX	484	Mexico 	Mehika	\N
00040000-552d-1eb4-6636-e402f6cc17b8	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-552d-1eb4-1d73-7e690e60d999	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-552d-1eb4-aef6-4519672fa93f	MC	MCO	492	Monaco 	Monako	\N
00040000-552d-1eb4-a7c3-be8f773d65cf	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-552d-1eb4-c695-6d9002d013a4	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-552d-1eb4-1dfa-7de9cf6dd20e	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-552d-1eb4-fea5-f2f178992477	MA	MAR	504	Morocco 	Maroko	\N
00040000-552d-1eb4-39ab-b4887694fbb7	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-552d-1eb4-c689-676944db9742	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-552d-1eb4-076a-1c11bada287e	NA	NAM	516	Namibia 	Namibija	\N
00040000-552d-1eb4-2e83-c8762d211e15	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-552d-1eb4-eb8f-390166b2d93b	NP	NPL	524	Nepal 	Nepal	\N
00040000-552d-1eb4-57be-8f5fa16f04f4	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-552d-1eb4-eb0d-61954dcd7cbd	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-552d-1eb4-46aa-fec14e2b4fc9	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-552d-1eb4-31f7-eefd37e37522	NE	NER	562	Niger 	Niger 	\N
00040000-552d-1eb4-c6e2-000351170820	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-552d-1eb4-f976-3859098014c7	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-552d-1eb4-ed07-e16bc111b9b8	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-552d-1eb4-6dda-ca522d86d6e3	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-552d-1eb4-7023-0cc60d64a9e0	NO	NOR	578	Norway 	Norveška	\N
00040000-552d-1eb4-3d72-bc133b269c43	OM	OMN	512	Oman 	Oman	\N
00040000-552d-1eb4-3e6e-4e1988a6aae3	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-552d-1eb4-ee58-b1938d0bdbad	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-552d-1eb4-d2e7-5d1e9d267eb9	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-552d-1eb4-9465-e935c5081f07	PA	PAN	591	Panama 	Panama	\N
00040000-552d-1eb4-8dd9-3b6896f06ba8	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-552d-1eb4-d0af-8647fb6117c7	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-552d-1eb4-1b26-71307723b26d	PE	PER	604	Peru 	Peru	\N
00040000-552d-1eb4-350f-07c35b4e02ff	PH	PHL	608	Philippines 	Filipini	\N
00040000-552d-1eb4-fd13-043f49ab7e1a	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-552d-1eb4-e54b-82d268340f50	PL	POL	616	Poland 	Poljska	\N
00040000-552d-1eb4-1726-77b9cbdd1786	PT	PRT	620	Portugal 	Portugalska	\N
00040000-552d-1eb4-3d43-59ac5ac3c171	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-552d-1eb4-b16a-b4de9464e075	QA	QAT	634	Qatar 	Katar	\N
00040000-552d-1eb4-6c83-841888d9b328	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-552d-1eb4-add2-316c4196d5d1	RO	ROU	642	Romania 	Romunija	\N
00040000-552d-1eb4-9510-24a07eaaad51	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-552d-1eb4-05c1-144c6782a02a	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-552d-1eb4-69d5-3f464052c19d	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-552d-1eb4-6926-f454d997c4da	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-552d-1eb4-9770-fb71f6b3b040	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-552d-1eb4-11cb-14308995abf7	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-552d-1eb4-d58e-a4609f4111d0	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-552d-1eb4-2333-00f235259a68	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-552d-1eb4-f171-9db4482e2173	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-552d-1eb4-da82-0d629bcbe797	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-552d-1eb4-aeec-38f44dd2f63b	SM	SMR	674	San Marino 	San Marino	\N
00040000-552d-1eb4-a6d5-8feedb2311dd	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-552d-1eb4-3fbd-cd97a353b0f7	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-552d-1eb4-3440-cde496870928	SN	SEN	686	Senegal 	Senegal	\N
00040000-552d-1eb4-7775-355a303ae5e7	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-552d-1eb4-af6a-ea86f4069b48	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-552d-1eb4-59d6-821ef2f3c085	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-552d-1eb4-840a-88bcc1798a5e	SG	SGP	702	Singapore 	Singapur	\N
00040000-552d-1eb4-89f7-42b63dfe559e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-552d-1eb4-a575-64377c05ba4b	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-552d-1eb4-06c0-c4f37cf5b107	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-552d-1eb4-c97a-02a212b474c2	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-552d-1eb4-b45d-120869b53798	SO	SOM	706	Somalia 	Somalija	\N
00040000-552d-1eb4-3bd6-116976d2c0b9	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-552d-1eb4-5993-29ecfa7f2808	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-552d-1eb4-debe-a16cdfb89599	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-552d-1eb4-eb44-5fcb0c002a9c	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-552d-1eb4-8aaf-d3d730a9223d	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-552d-1eb4-47c5-2186159f3eb8	SD	SDN	729	Sudan 	Sudan	\N
00040000-552d-1eb4-e4cd-0ec8f552e79e	SR	SUR	740	Suriname 	Surinam	\N
00040000-552d-1eb4-2e2b-69897f68f294	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-552d-1eb4-3daf-c0eb13bf0623	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-552d-1eb4-da33-2cdd49aa4f64	SE	SWE	752	Sweden 	Švedska	\N
00040000-552d-1eb4-3d8a-e4d7ed10b6e0	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-552d-1eb4-4914-5722b02f7acf	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-552d-1eb4-d765-611d877553e8	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-552d-1eb4-04e9-8d77821a89ca	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-552d-1eb4-5a03-86fe41f31bc5	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-552d-1eb4-9345-88dc6831ec67	TH	THA	764	Thailand 	Tajska	\N
00040000-552d-1eb4-8ed1-ecb4e487b15e	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-552d-1eb4-12c5-566629624afb	TG	TGO	768	Togo 	Togo	\N
00040000-552d-1eb4-f632-334b2cbae8b3	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-552d-1eb4-2380-0df68c9b3b73	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-552d-1eb4-80c6-3ee1f414f84c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-552d-1eb4-e218-12e612fe54a9	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-552d-1eb4-8a4a-8f6d10df5503	TR	TUR	792	Turkey 	Turčija	\N
00040000-552d-1eb4-00d4-b0fca063b05e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-552d-1eb4-56de-65ed5015d45d	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-552d-1eb4-e1bd-d67fe7868c5a	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-552d-1eb4-7cef-7b594c7d1642	UG	UGA	800	Uganda 	Uganda	\N
00040000-552d-1eb4-ca51-d7676a4ff34b	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-552d-1eb4-0e6d-2bf06a66b1dd	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-552d-1eb4-b768-03c0a88367e1	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-552d-1eb4-7f56-2de32bbfc1c7	US	USA	840	United States 	Združene države Amerike	\N
00040000-552d-1eb4-7d60-ff1195aed7b1	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-552d-1eb4-238d-fd49e5b4f15e	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-552d-1eb4-11ff-14c128b32fe5	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-552d-1eb4-ec8e-c017b19088dd	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-552d-1eb4-56b2-5eaedcfa81b4	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-552d-1eb4-eefa-c807edabc8c3	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-552d-1eb4-17ce-f6ea2fb0a743	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-552d-1eb4-2326-300528f01540	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-552d-1eb4-5a72-5a42ec969035	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-552d-1eb4-8b56-b1ccf6700104	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-552d-1eb4-4b16-c2a2a41a54e2	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-552d-1eb4-486b-dd15e16a2f51	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-552d-1eb4-dd12-cb2d43d439e7	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2628 (class 0 OID 294433)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2607 (class 0 OID 294254)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2611 (class 0 OID 294302)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2597 (class 0 OID 294122)
-- Dependencies: 179
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2617 (class 0 OID 294351)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2621 (class 0 OID 294376)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2603 (class 0 OID 294203)
-- Dependencies: 185
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-552d-1eb4-bd5c-a7f28fb2e5eb	kravaXXX	color	N;	t	f	f	\N	\N
00000000-552d-1eb4-38c1-c1fdcf5c7ec4	privzetInspicient	entity	N;	f	f	f	\N	\N
00000000-552d-1eb4-d3c3-f0b9f3d5cc5a	dogodek-status	map	O:18:"Zend\\Config\\Config":4:{s:21:"	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2596 (class 0 OID 294111)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
\.


--
-- TOC entry 2600 (class 0 OID 294173)
-- Dependencies: 182
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2592 (class 0 OID 294076)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00020000-552d-1eb5-4aee-c4c22088ba50	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-857e-96219eed3fe9	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-a00a-a5d803233943	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-f0eb-537234bd1518	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-0ff6-f8f215f67a66	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-4bc0-fa474bba8e87	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-3b37-0efce9722010	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-d212-4d1308e8db29	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-e3d0-ee1c9af75d54	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-cf09-adac22f01d36	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-896c-aca2e4bd8833	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-c707-3a8bc4c9ce51	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-6a42-7785eb947fff	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-16f6-bdf4cc39e804	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-940a-0b2c7d0a04e5	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-fe5b-9ba4b96c0d1e	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-1a3b-1c9cd039fa1a	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-f8bc-1d01de7b9fb5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-aa49-d0b5c32077f7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-d79b-8bc60f267bae	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-7fb2-db2b77489895	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-d4ce-25972179645e	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-3e60-f43076a123b6	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-b2b0-edbe999d9c0b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-a3c8-a9b2cc1c1e2e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-e51f-3f76000a2ba5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-9aeb-e41e95707e88	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-630e-a86093fe472e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-9b48-95f30dd5ff13	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-955c-d282918dccc8	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-813e-6f720cfe3d79	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-9f0f-b4c6a01162c1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-50cc-f214619fe8ef	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-9bb8-c39a0ca0e01c	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-4821-08e41a7c8915	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-c825-d4cf47a138ce	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-3ab8-b903267c4803	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-2624-29ed41c61cad	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-5731-5647173d2bf4	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-a7d4-14ee4f063d3a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-7d21-5e5c69d5dedf	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-35e8-4b3e50e889f2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-b371-4acbf0458740	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-ae35-f7588e594e27	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-7590-9cdf832071bf	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-d660-4e8f29c4d805	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-97dd-67fa513c9c68	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-421f-faa427ff697e	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-9ca5-bfe2f23b1bef	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-2e2e-c3fa6c6cbeb6	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-74e8-0c106e48fdad	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-f68b-4c6d3c18767a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-f272-428dd1578093	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-9c7f-7ae949078cb6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-e4e1-8f3844bfee8a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-0cda-7f1ffabf6050	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-dd44-a8ff12a83caf	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-d3ac-ca6fd5cd151e	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-ff76-35d6319e1488	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-8e4d-e7820891f015	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-620b-7f9c0fc47aad	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-c4c7-c140b43dd9a2	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-42da-e2bf03f91427	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-a97b-78a8c2de2101	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-76d1-e82796a9330b	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-c0a5-923959d76be7	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-f100-10c80840d334	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-7636-a2789e2a0a12	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-8ccb-b97a7bbc357b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-e2b3-9177c53c1b7b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-885c-0f777ee544ef	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-638f-7dddf7c098ff	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-fca4-63e9f8fc91f1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-02bf-683752a3cecd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-c51f-ac74780fc7ad	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-e518-9b380dcb4383	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-dcb0-8beebc83545f	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-cefc-c9677046cebd	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-620d-820568e2bd7a	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-b93c-91bebc45ae5d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-583c-643bc05af219	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-af5f-76d6d5099ea8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-fa06-8c260474998b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-ecf8-fca9fa92b406	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-32ab-029f556a69c0	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-6846-72266d82f317	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-4aa4-94d2932f0009	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-efe7-20af97ec3a29	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-a2dc-f5e3de2b8a69	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-ca0a-ac6a01563080	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-393e-1769f6d13a54	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-9af5-e58a033caa98	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-9de4-2f69a11c6eaa	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-fc2d-182b5b56294a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-035e-33d8c3788eba	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-3d52-0f2d44c5e07b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-a308-8cff9a3bee62	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-8641-d5e003a2a733	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-5c8d-a44a62c77196	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-feab-97bea6ddacaa	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-2570-b4992c81787c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-82bb-af61e0a8c8d3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-a92d-1ec61f1c0527	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-6f31-d8f5e2e0bb67	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-c851-c0e93abb623a	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-72cc-c0312e6ad141	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-41d0-5b0716b87216	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-a386-df517d35f887	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-bb4c-20423e9daa68	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-6fd5-9511cfc702e5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-1e16-028575de179d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-102e-c7a0b25c4b8b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-47e7-71012cf2ded9	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-c17c-0c04dcc133fc	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-2e0a-2ab0c15d026e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-3667-b0ba32e58d14	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-274d-d169fd4c7225	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-3d99-df929dc0ed8a	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-eb1c-9b4d6215071e	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-eb47-4596e6c1a1d7	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-1e25-eab4489e1c2e	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-2d21-d7e40d425934	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-6adf-df7f2d14a7bc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-b861-02e9843ed02f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-33fb-cf9b4a4445f5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-85e7-e193bea7d9c7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-a146-8cd69dc02434	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-f96e-18fd4fdb1619	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-31db-3b10a3c717c4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-790e-066c6c151809	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-ae87-2638f4695fa9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-2ac1-2bfb0e078fe7	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-c583-68d5150f6ea8	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-c50b-f623d2f9d706	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-c7c2-bbc66db681e7	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-7315-56578040b219	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-cf9d-dba684133415	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-a7e3-93c48bb22b7b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-8971-151ca7f6ddc8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-f652-cf003b622aaf	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-a931-4a94db838b5b	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-7535-eb3f5f2fc90f	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-a9e0-78be8b494a91	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-5f2f-3f764f1aaad0	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-bdba-77b0efbe2608	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-585d-ec474da44437	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-668a-77ed113c7b83	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-7e60-b7dfcb5ba5b9	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-550f-47652158c48c	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-7822-1b96358b58dc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-e583-ec5a4ed138d3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-0e71-1b3ed295f604	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-7848-29ce17442dc1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-48ab-3d0dafa7ff8d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-3e40-86a297ce7d77	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-8a38-3192ef55c993	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-bc53-84c9f94be208	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-388d-377d90e366cb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-cae4-4160f7bfccf4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-df7c-b389dffe6797	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-a6a7-7acf79a61b60	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-e694-b4bfeda5cfc0	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-347f-d0707b63ed46	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-707d-782deb5dcebb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-4554-75d6e643ae0a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-edf7-2dac6cb84798	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-9846-02938674cd79	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-42ba-412862908198	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-3d3b-2a10b84c4a79	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-2981-5d4662a1de02	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-8a09-20e87530485c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-a862-59df216163bb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-fcc7-5530141ab75a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-3ff5-dc58741a49cb	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-87ca-ff7b7229c90b	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-da4a-af957a034ea2	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-5a3c-ab1c77d5e15e	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-e251-1953707b5b7a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-2936-bba077ad922a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-99c1-2548f67f416b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-1159-35af7bcf5838	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-c050-be5e9baa0201	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-9db4-b8bca30de4be	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-9b89-f9f80cdcf9c3	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-f401-1b756280e050	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-91c2-4f48a3117dd3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-4e11-699b1c2f45af	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-9c02-a9dc118d4c42	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-b33d-1a7faab1d305	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-eff7-db8dbd119d18	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-1e21-ca4df27e2017	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-d056-6f77c073d488	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-c260-78db7648a0b0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-b7cb-1b79894ddfcc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-ffae-124c8aaae881	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-afd9-7831afb78b50	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-edd0-75679a4af4d1	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-1be6-8b6a729b2210	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-a859-4d1361a02166	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-d1c5-f7159060b4dd	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-3eae-5b5780ec6cb1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-79fb-e29b7b254d64	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-a025-2074494f9a4a	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-bb14-f2739a064277	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-2c52-1edaae572aad	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-c713-bd1a9ef54a28	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-13ea-28f2099954c2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-fce0-1f16a0135ffc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-6433-7f78fb77bfda	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-f366-1d667690b29d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-979e-fa733dc39c83	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-ec45-6f9a88cc95f8	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-9264-52dd8c09839b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-660a-704160e5adc9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-ab91-3606856b14ee	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-dd44-8f3cb85f6036	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-df12-6a400b94a5e6	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-349e-f61481102d66	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-8bba-ab1d66615e78	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-96fb-88170bfb430a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-5089-97e0aa51e180	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-cef0-90d55a9d707b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-0641-da62c61e095a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-0e4a-57de790adc10	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-ded4-835f8677b18e	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-29ec-2501e5fab88e	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-27b8-f72e40a40275	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-89a6-5c13b1819ecc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-1678-0bbd7cda069d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-6688-1bc9f89e6ca0	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-d8c1-7fff0af5913a	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-16fb-3d738a3d21f3	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-9044-fb8afa6bd6a7	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-48ef-2a9c068d3562	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-3240-c0b07ef726c9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-9755-b94407d81d73	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-d69f-f03515f229c8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-fb6a-8c1faf78244f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-1968-6b46203cf221	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-1dce-51c07071dc98	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-5a8a-faf9deb0f2db	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-35ed-a53588e94ba6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-7498-17fdb51cb327	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-e13a-c0636544b366	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-c24c-e86d076d13f6	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-e7b3-7f8f88f97f21	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-cae3-33ebb3a62d7b	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-639e-031964605812	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-1872-4d11836ffd6b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-4e46-f65826545632	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-e01f-afb7cf3ca7ee	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-80e3-54ff4a0c0289	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-b27a-ef3d550a5eac	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-5c4b-baac2da4e523	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-5fdc-463e3f7b104c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-d257-1ba2476d5aee	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-9467-84dbd26b86ff	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-c651-38d9d7a2088a	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-f5b5-6874e8ddf33d	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-b4b6-69044e732482	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-daf6-a017ba7385c1	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-ea64-e369a54b8e5f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-c68a-83df64dde680	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-0dd0-a359d2b3732f	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-5a2c-1778501322e2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-3c1f-9cb358af374e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-dcc9-1e746902795f	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-8aa6-28439a70026f	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-f1c6-fe4898fa7f83	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-3352-3b027382bdc1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-ec69-e070b00aa71f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-ee08-7b6db409215b	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-8fd6-f0b7d4b64ff2	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-d3ac-2f4efdd113e3	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-14da-617cb3e13993	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-db93-59d3bf80086c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-4065-db1e6a43de7d	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-e5ee-b91e65965f86	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-2958-a33a1af80174	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-9a97-85d7decb23fb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-0eb4-d17902b40557	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-5e7d-63420a16634a	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-308b-89198a9bd85d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-42b8-dd3319d29006	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-dd26-e09228e4a598	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-4e68-3d330e794b80	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-b150-d4d033e92b75	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-141a-8a0a8001f888	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-45ba-9b11d07ebea5	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-ba87-8d2f15595c55	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-7a14-27b1c6c36a21	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-5d0a-48d224ec28aa	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-c65c-16d99d0d9da2	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-e541-c4dd628480a1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-6a1d-fae84a9af82a	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-71e3-9895271117f5	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-86c7-64b178facf89	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-cae5-434c89332365	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-3b04-7c312a8d9a04	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-c100-d488fed910cf	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-979b-9409db9ab6e9	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-6c46-83b54e0870f1	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-7738-89410072e344	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-e6bb-bfb9a5311f87	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-ddba-1432009a64d2	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-17e7-540234ebcefc	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-65fc-05d1d9305ede	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-df32-d1e983d38260	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-4210-6fb6a15e9ccd	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-c16c-7aee9678fc37	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-703a-46ab253c926b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-9d38-86fc2bf63b79	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-f1b2-9330599311b9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-a3ed-9b7e650ceccc	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-5eb6-9f6a28229a65	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-26c5-89ef6e5c64c3	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-f7fd-4831af10f509	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-08c6-f2b4cf098745	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-b29d-da987092fef8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-aa3d-bbaa9c47431c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-ed50-0a35ad2434b1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-6ef9-8c320091339d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-5a43-dfb6a366a521	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-759c-f8e4b4aab7f2	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-ac97-c3012273f6f4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-e7f5-43e0f5e7f8cf	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-1a17-e11197b222a6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-ef29-fce8b329eb70	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-1916-1650e180bd78	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-a1e4-e8a6c61cf868	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-eb1f-bc4c6d80dfa3	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-d05c-5d55998696cd	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-77df-eefab018749f	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-43d9-905d0defa479	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-b942-a515e1b48b93	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-82c0-ea043f045c17	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-bc47-297df87e0c5c	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-da24-91154645060f	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-b1f6-f7329e962a42	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-b434-ee4795b58bd2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-987e-ef57513a2627	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-cd35-f5bb5eea339a	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-d5e5-b762a4446cdf	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-09e5-47084fa1e6d4	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-871e-1326da089a35	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-8990-160932841f81	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-38e0-58fc4b0da896	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-6fb4-13d7101c399b	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-f69e-10841fb56b79	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-9d00-795bc6b2059b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-5a80-07c740ac0fd0	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-27ce-d378c891c9c9	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-7784-01e9cfb6e0a8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-b928-104c552994c2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-1faa-d0fbd3d4832a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-65f6-9cefd7e97de9	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-f800-e9613c400287	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-feec-e22ca8dfdc3d	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-7623-c7fe4886e340	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-07dd-f12a96969bc5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-c2f5-7db7cf3ddb47	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-084d-7be93251c503	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-9f0a-6852d68934df	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-3b1e-e282f560f365	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-3898-adb69e51d7c1	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-a0d6-df71b06d5d17	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-8422-c9383e04fb1c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-4db0-fb6fa0214201	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-92e2-88ccb53ad05d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-7b1b-7de3dc819abc	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-06f3-5e63da6b2c8a	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-fdd4-e8f4389e64df	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-b81c-5a737552fd2f	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-5ec4-fad0a767185b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-6124-3a998eface25	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-fff4-7dc6fa4d88f3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-6334-e1df5cd5c55b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-25f3-48afd5464faa	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-2eac-3f111aa44570	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-f03a-bd3d1e4532be	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-83a1-8a67a5c72bad	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-4f55-8768699bb417	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-d41a-7ca01b335cd7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-203e-67b31c530ed5	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-4ea6-731e19aa7149	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-3ef0-c07df6ccf76b	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-88fe-e68fb5d482b6	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-0d13-7406b3b5d6fb	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-caad-b166a34953e5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-a768-043d9fa81748	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-a0af-e944277abd90	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-887c-6d3ad0e9c2c8	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-895f-f8bbe80e878e	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-90bd-c7f06170ddce	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-6883-9779e11267d6	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-e371-690b9fc330a5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-f508-f0f8b00683bf	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-19c5-aa2ea635e313	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-24bc-efe28c3e707f	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-0f17-2ad3efdad508	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-f14f-450fffcfeb32	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-b744-a3a9c3e87e72	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-f141-670fbc22b78a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-1b68-8a2b646f76a3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-8d8b-bbf641e08688	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-fe1a-787e37726086	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-dace-a599f4179770	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-6873-a458e3fcc239	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-6dbc-5b96116f66e8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-dec1-6fd43705a12f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-a5bb-e70f0dbf2cb8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-2792-3f2f56870218	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-f54e-b814ca748aef	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-daa9-1e1eee9ce220	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-ad90-65ecb5871987	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-66ed-ec5b423e4393	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-4387-35549951ec18	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-94a1-72dcc26e8c4a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-a43f-cd16e924f971	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-931c-6e0c0d75eb56	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-d94c-0c81a4988bdd	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-490a-0f965b06246c	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-90a6-f552ca95c452	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-776a-f389c77c5be8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-4d3c-a2496721fc8e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-5628-f8659979d99e	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-a387-cce151d50dc7	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-523c-eae9ab202c29	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-1644-54ced29b090c	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-6b11-69c275edf87d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-1821-a289606e86d0	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-9e14-cda9047dd49a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-8cc6-fa910ece2b42	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-44dd-d6f595796911	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-850b-04af77955c7e	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-2250-90d589fa454b	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-9f34-c1ce3094b68d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-20d6-bfab27df322a	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-2f62-d60b016b6953	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-74c8-01358758708c	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-6939-9bf276604d2f	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-6474-57cee6b99830	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-faa5-2146ee4f9e92	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-ece7-45f15818828e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-faec-985cc0710315	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-8197-742fdc829886	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-50ef-94316dd5df43	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-488d-389d6846bbef	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-ecc1-8bae2ccf1962	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-2630-327a8acbf50b	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-d11e-4df75123233c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-9c69-bb0981453ceb	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-e261-f79f6b3ab622	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-cced-c4287e0ccc8b	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-1a67-d2637249032c	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-0731-4eb344735ca2	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-71fa-2b6ea19caa44	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-a4f7-0e4c2f1f9e81	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-8b42-e823ebcf54d3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-7605-154a34dad7e6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-826f-f48921b09a25	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-fb12-b81bf1e24929	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-5364-61f07ac3656b	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-e1d8-8dd49d73b968	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-ff55-65f58f97256d	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-2674-742141b30950	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-ec31-343287f6a9a0	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-ad0b-08901d374a44	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-4747-994beff647aa	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-f229-032255fd64f2	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-30a5-1937f0bff5b8	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-fe36-ed0c50fa2a12	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-28db-078d8b3fdb4c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-96ab-8c841c3b3e17	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-1f89-4d5ae3e9be52	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-78dd-78d23d6af5d1	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-b88d-a89c871fb292	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-392a-a9d59c146d36	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-e589-738e57728429	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-af68-393d05f9cc2c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-9dd9-b1a63575bf42	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-2294-c421fa9e040d	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-c682-4f08b4d5eac7	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-befe-4ec21d51af61	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-3a81-aa1405351083	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-501e-ec209742b4f3	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-f708-42951d23cdac	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-7058-722139104c6c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-3712-dafadd40aaec	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-b4ea-458046207428	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-5862-c8e1075d1a5f	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-00fa-94570dca617c	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-f4ef-7596f0965a67	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-11f2-901374cdca50	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-790e-7c1e62c16fc4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-7e13-76eb9501cb8a	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-ba4d-3b6a60b9b8a5	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-7b62-f79c3d0697c3	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-03f8-bc9984ab9cd9	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-1d73-616d68a66a36	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-e205-16d583bd7f39	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-6300-4ae45a2c1584	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-01b9-d55745c6f426	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-6ea7-9e30a660114f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-8df6-eacf0b4df607	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-f628-fe96092e64e0	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-5dc4-24f6d91b46e9	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-5c3b-e57323e7e85b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-6235-46a7f27d8692	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-c54e-fc200f61ec2f	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-6cc7-5b921e8ffeb7	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-be8f-46467c7c3111	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-c18c-b62febe64884	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-a631-1162e59f5237	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-1d83-074d198baa29	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-bfda-1446afe40e94	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-d089-8c02bd64cd32	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-7384-3d5dc5fd29c7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-266f-72cfd55dbcde	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-27ea-d5ee4ab2db99	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-fd30-3dd0725d6f89	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-678e-8f9eb180c6b9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-d43d-d7ae04c88bc0	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-ba70-2ff689699729	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-2bbe-99bccad43548	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-ce8b-de591370a8ca	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-0b7d-81b474f8816c	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-fe28-34fa1061592a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-7688-0835dac660bc	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-6674-bbdca3ab1a3d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-767d-affc2005c758	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-6c39-707ed4b0e766	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-fdb1-1f6d0c601fad	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-a028-f923341ae19d	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-321c-f66855d8606f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-2a3f-466a0db24153	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-bcd8-6af3ec04e965	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-b3cc-e70d41db48a7	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-5664-b596144b403b	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-7fc3-a04116a3b807	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-c81a-3de843c31f0f	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-0956-8ab595ab621a	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-1e63-0d4f036489dd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-59d4-690a65f2dd42	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-cdcc-58cd218d3894	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-1112-422074822420	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-758a-1585df2aa851	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-e292-d87cd9ba3ec8	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-05bd-19e0eb50645e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-4a05-5cc916e4769b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-ac92-0de4a6b6433a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-b429-22c0dea84ce6	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-fd95-1d46cac2606e	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-5b60-1cd6b01e1e7a	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-809e-90e851a3dabb	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-d205-6daabac56133	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-0131-3629f2a85b32	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-19f4-d29be8e691b6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-4edb-0305285a104e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-44a9-12759db31eef	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-fa11-1766721fd311	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-19bc-88092efc8990	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-20da-e0a104326770	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-7e48-012603620a0d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-8c12-b4b6b9644cbf	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-5419-72e87bff165a	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-2074-fef76ace883d	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-d824-0a439a6e6207	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-8eb7-be5349c5971d	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-de01-1777e91b22c4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-6e72-e7abbe7afc5c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-1b78-f000f6d681ea	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-0d56-a214f7d81bac	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-eed7-118a6122cc51	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-cc7a-7ad2a687ee40	User-delete	Aaa - Uporabnik - Briši	f
00020000-552d-1eb5-cab7-0ad3a851569c	User-read	Aaa - Uporabnik - Beri	f
00020000-552d-1eb5-5aa1-d212f68f8761	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552d-1eb5-8d99-be796f7955b4	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552d-1eb5-30be-a43b6844fc29	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552d-1eb5-0ee5-1ad7886b9060	Role-delete	Aaa - Vloga - Briši	f
00020000-552d-1eb5-745e-ea7ae0ebbbc2	Role-read	Aaa - Vloga - Beri	f
00020000-552d-1eb5-fea8-8e15cc2204ea	Role-update	Aaa - Vloga - Posodobi	f
00020000-552d-1eb5-5ee7-0791af0af9aa	Role-create	Aaa - Vloga - Ustvari	f
00020000-552d-1eb5-dbf5-338ce28db9a6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552d-1eb5-9d03-11ddd7cf1f76	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552d-1eb5-8b1b-2edec0000e00	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552d-1eb5-a673-266c8b78fb0a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552d-1eb5-cd81-03829aa68209	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552d-1eb5-d4f8-b588751359a3	Drzava-read	Seznam držav	f
00020000-552d-1eb5-e8b9-9491a14978c2	Drzava-write	Urejanje držav	f
00020000-552d-1eb5-d479-c7b0598104c1	Popa-delete	Poslovni partner - Briši	f
00020000-552d-1eb5-6e70-9ee66c5bca32	Popa-list	Poslovni partner - Beri	f
00020000-552d-1eb5-1396-b54232d6792b	Popa-update	Poslovni partner - Posodobi	f
00020000-552d-1eb5-a274-d342d1b92ef8	Popa-create	Poslovni partner - Ustvari	f
00020000-552d-1eb5-8a48-bfe3c57833e8	Posta-delete	Pošta - Briši	f
00020000-552d-1eb5-a9fb-e14ee1692d96	Posta-list	Pošta - Beri	f
00020000-552d-1eb5-762b-0f5a0e944d34	Posta-update	Pošta - Posodobi	f
00020000-552d-1eb5-f6ef-0da36264c7a6	Posta-create	Pošta - Ustvari	f
00020000-552d-1eb5-06e0-ffe95594133a	PostniNaslov-delete	Poštni naslov - Briši	f
00020000-552d-1eb5-320a-b260160bae6e	PostniNaslov-list	Poštni naslov - Beri	f
00020000-552d-1eb5-5aec-e624bed0242e	PostniNaslov-update	Poštni naslov - Posodobi	f
00020000-552d-1eb5-20ef-d825e89263be	PostniNaslov-create	Poštni naslov - Ustvari	f
\.


--
-- TOC entry 2594 (class 0 OID 294095)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00000000-552d-1eb5-1475-84cbe8fd543d	00020000-552d-1eb5-d4f8-b588751359a3
00000000-552d-1eb5-1475-84cbe8fd543d	00020000-552d-1eb5-16f6-bdf4cc39e804
00000000-552d-1eb5-4dee-f5e52e8dd337	00020000-552d-1eb5-e8b9-9491a14978c2
00000000-552d-1eb5-4dee-f5e52e8dd337	00020000-552d-1eb5-d4f8-b588751359a3
\.


--
-- TOC entry 2622 (class 0 OID 294383)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2626 (class 0 OID 294413)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 294525)
-- Dependencies: 219
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2599 (class 0 OID 294152)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2602 (class 0 OID 294195)
-- Dependencies: 184
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-552d-1eb4-7458-3c07c4d8d26d	8341	Adlešiči
00050000-552d-1eb4-2fc8-4ecb096740e8	5270	Ajdovščina
00050000-552d-1eb4-88f6-f77d1a351784	6280	Ankaran/Ancarano
00050000-552d-1eb4-1c4e-8b515401e66d	9253	Apače
00050000-552d-1eb4-99a5-51a1b72e5cd2	8253	Artiče
00050000-552d-1eb4-35b5-83557ca6e5b3	4275	Begunje na Gorenjskem
00050000-552d-1eb4-7a10-9ff3c05912f0	1382	Begunje pri Cerknici
00050000-552d-1eb4-c82f-6a375afd3f16	9231	Beltinci
00050000-552d-1eb4-818f-210011b57605	2234	Benedikt
00050000-552d-1eb4-1cd2-1f9dfb98c174	2345	Bistrica ob Dravi
00050000-552d-1eb4-9ea6-868f2153673a	3256	Bistrica ob Sotli
00050000-552d-1eb4-6152-c2866828bce9	8259	Bizeljsko
00050000-552d-1eb4-691a-3c6c19b04a59	1223	Blagovica
00050000-552d-1eb4-ef46-e34ba8d5f864	8283	Blanca
00050000-552d-1eb4-2249-67dcaa326656	4260	Bled
00050000-552d-1eb4-fbb3-318221180a32	4273	Blejska Dobrava
00050000-552d-1eb4-9317-826a3dd7e9eb	9265	Bodonci
00050000-552d-1eb4-cdf1-2a54d3f1b984	9222	Bogojina
00050000-552d-1eb4-4518-0d626e1d458e	4263	Bohinjska Bela
00050000-552d-1eb4-920f-4e54f1d11969	4264	Bohinjska Bistrica
00050000-552d-1eb4-d0c6-0f0b85b019ae	4265	Bohinjsko jezero
00050000-552d-1eb4-9df2-851d7ebf530e	1353	Borovnica
00050000-552d-1eb4-7e4d-9ff2d78d362e	8294	Boštanj
00050000-552d-1eb4-2745-ad248e29f13d	5230	Bovec
00050000-552d-1eb4-f0ca-f3075d605efe	5295	Branik
00050000-552d-1eb4-9e25-a16cb493c19f	3314	Braslovče
00050000-552d-1eb4-518f-3b7571e7d57c	5223	Breginj
00050000-552d-1eb4-6c0d-67e145458c8a	8280	Brestanica
00050000-552d-1eb4-e09a-302187d2e7e5	2354	Bresternica
00050000-552d-1eb4-669d-04f1007dec7a	4243	Brezje
00050000-552d-1eb4-aee6-76aaf39a374b	1351	Brezovica pri Ljubljani
00050000-552d-1eb4-ca7e-34df41aae2c9	8250	Brežice
00050000-552d-1eb4-764e-ac871fda0c57	4210	Brnik - Aerodrom
00050000-552d-1eb4-9324-df7099b634e4	8321	Brusnice
00050000-552d-1eb4-e544-201a92453ef1	3255	Buče
00050000-552d-1eb4-ef0c-943bbf17d971	8276	Bučka 
00050000-552d-1eb4-b0df-3b783f1ba150	9261	Cankova
00050000-552d-1eb4-d045-07118664279b	3000	Celje 
00050000-552d-1eb4-037a-1143066dc18f	3001	Celje - poštni predali
00050000-552d-1eb4-cfe6-fb0c54934b4e	4207	Cerklje na Gorenjskem
00050000-552d-1eb4-161d-f286fab3fda1	8263	Cerklje ob Krki
00050000-552d-1eb4-b241-9056856b1556	1380	Cerknica
00050000-552d-1eb4-3177-c471ad5a70c9	5282	Cerkno
00050000-552d-1eb4-e129-774557d2c3ac	2236	Cerkvenjak
00050000-552d-1eb4-7078-4af4282ae7c9	2215	Ceršak
00050000-552d-1eb4-1ad8-3ea7478ed1ac	2326	Cirkovce
00050000-552d-1eb4-206c-8b3dcc839d58	2282	Cirkulane
00050000-552d-1eb4-1b65-3cfb6221f0ed	5273	Col
00050000-552d-1eb4-a9d1-694e7b0bf29a	8251	Čatež ob Savi
00050000-552d-1eb4-c42d-889446251c60	1413	Čemšenik
00050000-552d-1eb4-4d97-ecdbc5bd8c7e	5253	Čepovan
00050000-552d-1eb4-3942-83f7ba42200c	9232	Črenšovci
00050000-552d-1eb4-c373-5a501409dfe3	2393	Črna na Koroškem
00050000-552d-1eb4-e2bd-2e73555e289d	6275	Črni Kal
00050000-552d-1eb4-05e1-1bee1b77fed0	5274	Črni Vrh nad Idrijo
00050000-552d-1eb4-d2fb-5c5215eb4717	5262	Črniče
00050000-552d-1eb4-aec6-5064180c39e6	8340	Črnomelj
00050000-552d-1eb4-4095-571a6e737c9b	6271	Dekani
00050000-552d-1eb4-7f37-b509395f2bb7	5210	Deskle
00050000-552d-1eb4-9af2-e81cfab5f9ca	2253	Destrnik
00050000-552d-1eb4-969e-8b51e842fdc9	6215	Divača
00050000-552d-1eb4-11b1-3d9d7c82d253	1233	Dob
00050000-552d-1eb4-e150-5a5715d3dca7	3224	Dobje pri Planini
00050000-552d-1eb4-e63d-1115dc1fa2ae	8257	Dobova
00050000-552d-1eb4-4d12-830405c256fb	1423	Dobovec
00050000-552d-1eb4-43ed-64197393cb7f	5263	Dobravlje
00050000-552d-1eb4-cf1e-14fcb5480d6a	3204	Dobrna
00050000-552d-1eb4-fd3a-2c881e3179ca	8211	Dobrnič
00050000-552d-1eb4-fc11-a66f956d787a	1356	Dobrova
00050000-552d-1eb4-8941-689619c721a9	9223	Dobrovnik/Dobronak 
00050000-552d-1eb4-635d-70a7a952ddaf	5212	Dobrovo v Brdih
00050000-552d-1eb4-de5e-f7f066da23ec	1431	Dol pri Hrastniku
00050000-552d-1eb4-0a1a-0675a5563b11	1262	Dol pri Ljubljani
00050000-552d-1eb4-0f22-82e7805c5c04	1273	Dole pri Litiji
00050000-552d-1eb4-dfe8-ccad0f6e876b	1331	Dolenja vas
00050000-552d-1eb4-d564-432b90b0f3ed	8350	Dolenjske Toplice
00050000-552d-1eb4-d8b9-917c5e067320	1230	Domžale
00050000-552d-1eb4-d740-d8e212db4ab6	2252	Dornava
00050000-552d-1eb4-ea87-324588a163ed	5294	Dornberk
00050000-552d-1eb4-19f7-46d642ce40e1	1319	Draga
00050000-552d-1eb4-cdae-bd400fdddbba	8343	Dragatuš
00050000-552d-1eb4-6db0-fec90d89cd72	3222	Dramlje
00050000-552d-1eb4-699a-67d77895c17f	2370	Dravograd
00050000-552d-1eb4-05f7-5076a8745d9d	4203	Duplje
00050000-552d-1eb4-0bbe-690bf8564322	6221	Dutovlje
00050000-552d-1eb4-e786-094000dfb329	8361	Dvor
00050000-552d-1eb4-7f3d-b0b56be55d1b	2343	Fala
00050000-552d-1eb4-3afa-e5792e4f4247	9208	Fokovci
00050000-552d-1eb4-2b08-77d86954d6eb	2313	Fram
00050000-552d-1eb4-2448-f410908086fa	3213	Frankolovo
00050000-552d-1eb4-78d7-42185a7101d9	1274	Gabrovka
00050000-552d-1eb4-682e-d26ebfbfd660	8254	Globoko
00050000-552d-1eb4-c628-c744acc69bb3	5275	Godovič
00050000-552d-1eb4-0883-caca61d32987	4204	Golnik
00050000-552d-1eb4-d4ae-06712f0c4552	3303	Gomilsko
00050000-552d-1eb4-a899-a2014e1e0994	4224	Gorenja vas
00050000-552d-1eb4-d5be-67d3e328a4da	3263	Gorica pri Slivnici
00050000-552d-1eb4-c6f9-93b6a4a38ba1	2272	Gorišnica
00050000-552d-1eb4-0e69-19efeb1c5a35	9250	Gornja Radgona
00050000-552d-1eb4-8744-710d92d68088	3342	Gornji Grad
00050000-552d-1eb4-aba1-7258c6abff04	4282	Gozd Martuljek
00050000-552d-1eb4-7aee-37a782159abd	6272	Gračišče
00050000-552d-1eb4-edc2-5da1b143d657	9264	Grad
00050000-552d-1eb4-32e9-5a6802770d78	8332	Gradac
00050000-552d-1eb4-3d87-e4fb932f9531	1384	Grahovo
00050000-552d-1eb4-2cb2-32833bb960b5	5242	Grahovo ob Bači
00050000-552d-1eb4-1624-0897eed799d9	5251	Grgar
00050000-552d-1eb4-bc26-68f9709a638f	3302	Griže
00050000-552d-1eb4-0442-79d2addc28be	3231	Grobelno
00050000-552d-1eb4-4dbc-03601d430f70	1290	Grosuplje
00050000-552d-1eb4-2439-30affc73524a	2288	Hajdina
00050000-552d-1eb4-39a7-af3bf5dfbc77	8362	Hinje
00050000-552d-1eb4-1155-66258843872c	2311	Hoče
00050000-552d-1eb4-d669-7376f8e691d3	9205	Hodoš/Hodos
00050000-552d-1eb4-bad4-e57f5cdf0749	1354	Horjul
00050000-552d-1eb4-281c-cc5df73353ca	1372	Hotedršica
00050000-552d-1eb4-4edd-fbb890d65c08	1430	Hrastnik
00050000-552d-1eb4-b291-6b9ce6cc73b6	6225	Hruševje
00050000-552d-1eb4-c65c-6099cd1608d1	4276	Hrušica
00050000-552d-1eb4-f7c3-5a34b11f3913	5280	Idrija
00050000-552d-1eb4-ce6a-355eebb659d9	1292	Ig
00050000-552d-1eb4-944a-8216c079b500	6250	Ilirska Bistrica
00050000-552d-1eb4-16db-5ea7826bfd58	6251	Ilirska Bistrica-Trnovo
00050000-552d-1eb4-3f10-9ad43e3fb451	1295	Ivančna Gorica
00050000-552d-1eb4-fff3-cbed316972b6	2259	Ivanjkovci
00050000-552d-1eb4-4bb9-f7aa04604186	1411	Izlake
00050000-552d-1eb4-91d3-02cfc5efcce8	6310	Izola/Isola
00050000-552d-1eb4-8f92-13ad019e4d04	2222	Jakobski Dol
00050000-552d-1eb4-8059-2675bdb623b8	2221	Jarenina
00050000-552d-1eb4-4ebb-242c20ce3d92	6254	Jelšane
00050000-552d-1eb4-9661-46effad75c03	4270	Jesenice
00050000-552d-1eb4-07e6-d2a662d310c9	8261	Jesenice na Dolenjskem
00050000-552d-1eb4-29ce-61d510a82e33	3273	Jurklošter
00050000-552d-1eb4-ec5d-0583a2e02b84	2223	Jurovski Dol
00050000-552d-1eb4-7eb3-ea305ac602c0	2256	Juršinci
00050000-552d-1eb4-1f41-025a4ebe3555	5214	Kal nad Kanalom
00050000-552d-1eb4-d213-54cc325acb52	3233	Kalobje
00050000-552d-1eb4-0d7d-daf0b110bbee	4246	Kamna Gorica
00050000-552d-1eb4-6857-51e62980ead9	2351	Kamnica
00050000-552d-1eb4-27a8-4dfddde0347c	1241	Kamnik
00050000-552d-1eb4-a863-58c0b22712f4	5213	Kanal
00050000-552d-1eb4-4099-21992cc87d87	8258	Kapele
00050000-552d-1eb4-adf3-cddc5c8ba718	2362	Kapla
00050000-552d-1eb4-0c6d-adc5b74791fc	2325	Kidričevo
00050000-552d-1eb4-1a91-d3afc9dd478d	1412	Kisovec
00050000-552d-1eb4-44b5-5f877a24af6a	6253	Knežak
00050000-552d-1eb4-64d9-91cef48e3465	5222	Kobarid
00050000-552d-1eb4-3cfe-e29b2f638857	9227	Kobilje
00050000-552d-1eb4-02b4-f581d5595732	1330	Kočevje
00050000-552d-1eb4-cc4d-648ad7b42817	1338	Kočevska Reka
00050000-552d-1eb4-1e7c-4d989aed67fb	2276	Kog
00050000-552d-1eb4-8a69-06f8c3e029b0	5211	Kojsko
00050000-552d-1eb4-fd4c-1c1ab76a48e0	6223	Komen
00050000-552d-1eb4-2779-a1fab455d3cb	1218	Komenda
00050000-552d-1eb4-cd88-73bf9017eeee	6000	Koper/Capodistria 
00050000-552d-1eb4-678f-f693460d129c	6001	Koper/Capodistria - poštni predali
00050000-552d-1eb4-c1ba-64321bb7e984	8282	Koprivnica
00050000-552d-1eb4-e650-34bb4e4fa194	5296	Kostanjevica na Krasu
00050000-552d-1eb4-e68b-ac2f7f7a308b	8311	Kostanjevica na Krki
00050000-552d-1eb4-a17c-c97f9d02efaa	1336	Kostel
00050000-552d-1eb4-275c-906e7bba5cd6	6256	Košana
00050000-552d-1eb4-b680-7df4e33b9d91	2394	Kotlje
00050000-552d-1eb4-0e30-4543b419bbcf	6240	Kozina
00050000-552d-1eb4-1561-9343168d86bf	3260	Kozje
00050000-552d-1eb4-8640-c5c5d2c07994	4000	Kranj 
00050000-552d-1eb4-99f0-6d24a8c89220	4001	Kranj - poštni predali
00050000-552d-1eb4-a9db-7e7bd6ce72e2	4280	Kranjska Gora
00050000-552d-1eb4-b7be-3b8a062d8a52	1281	Kresnice
00050000-552d-1eb4-0b81-589ff5b2870b	4294	Križe
00050000-552d-1eb4-76f1-7c50ae3a719d	9206	Križevci
00050000-552d-1eb4-0564-a7aacd9ba50a	9242	Križevci pri Ljutomeru
00050000-552d-1eb4-46bb-fe142c21d326	1301	Krka
00050000-552d-1eb4-61d2-32ee671b58df	8296	Krmelj
00050000-552d-1eb4-ece2-69190f9bffa9	4245	Kropa
00050000-552d-1eb4-b377-be817f27fc6c	8262	Krška vas
00050000-552d-1eb4-cb62-abaedf433229	8270	Krško
00050000-552d-1eb4-0713-e9748bfeca08	9263	Kuzma
00050000-552d-1eb4-7d48-1eeeb93be1d7	2318	Laporje
00050000-552d-1eb4-fc93-b04dc15edf13	3270	Laško
00050000-552d-1eb4-73ac-881cebe2f00a	1219	Laze v Tuhinju
00050000-552d-1eb4-91e0-b1b9e0299419	2230	Lenart v Slovenskih goricah
00050000-552d-1eb4-dfe4-e0b10a5ea80d	9220	Lendava/Lendva
00050000-552d-1eb4-5edb-3453b3a7909f	4248	Lesce
00050000-552d-1eb4-038a-3b884e3af53f	3261	Lesično
00050000-552d-1eb4-8805-1b5e7e200175	8273	Leskovec pri Krškem
00050000-552d-1eb4-537c-3c42f33cbcd5	2372	Libeliče
00050000-552d-1eb4-fa8f-cbec8467debd	2341	Limbuš
00050000-552d-1eb4-f34d-86605b8be94d	1270	Litija
00050000-552d-1eb4-c836-a816bea0a634	3202	Ljubečna
00050000-552d-1eb4-331f-f529e9d0980d	1000	Ljubljana 
00050000-552d-1eb4-9c2d-59dd2db9c6a7	1001	Ljubljana - poštni predali
00050000-552d-1eb4-ea68-3d95394d87b9	1231	Ljubljana - Črnuče
00050000-552d-1eb4-78ea-0895a1931187	1261	Ljubljana - Dobrunje
00050000-552d-1eb4-a027-effed8e7bdaa	1260	Ljubljana - Polje
00050000-552d-1eb4-42bc-b6eb8585fa9b	1210	Ljubljana - Šentvid
00050000-552d-1eb4-effb-a97965a22430	1211	Ljubljana - Šmartno
00050000-552d-1eb4-c9bc-c90266d672ef	3333	Ljubno ob Savinji
00050000-552d-1eb4-ddb8-c2a6b14202ad	9240	Ljutomer
00050000-552d-1eb4-ffbe-eb53f2d9b39d	3215	Loče
00050000-552d-1eb4-749a-ef22c331a979	5231	Log pod Mangartom
00050000-552d-1eb4-9f0e-b59235466768	1358	Log pri Brezovici
00050000-552d-1eb4-e3b0-8065655fc692	1370	Logatec
00050000-552d-1eb4-eb86-0ae97453d477	1371	Logatec
00050000-552d-1eb4-7950-9d761ee870b3	1434	Loka pri Zidanem Mostu
00050000-552d-1eb4-053e-b5c5956343b1	3223	Loka pri Žusmu
00050000-552d-1eb4-4ee7-266e7e255d8d	6219	Lokev
00050000-552d-1eb4-1e43-5ed09e4fcd32	1318	Loški Potok
00050000-552d-1eb4-c1d8-fc0aba6da6a2	2324	Lovrenc na Dravskem polju
00050000-552d-1eb4-fbba-00109f89c01e	2344	Lovrenc na Pohorju
00050000-552d-1eb4-2ae7-28764f1dd81a	3334	Luče
00050000-552d-1eb4-a18e-231d9e0d69aa	1225	Lukovica
00050000-552d-1eb4-4016-18c2e633ef30	9202	Mačkovci
00050000-552d-1eb4-6fc5-227ddbb30e28	2322	Majšperk
00050000-552d-1eb4-25ea-bb0ed3310127	2321	Makole
00050000-552d-1eb4-14bb-5380425c2c1e	9243	Mala Nedelja
00050000-552d-1eb4-f6e0-3768e5c6f8fe	2229	Malečnik
00050000-552d-1eb4-cf9d-6647dc3df9eb	6273	Marezige
00050000-552d-1eb4-c815-1e14ed36025f	2000	Maribor 
00050000-552d-1eb4-6e58-ca6827209d25	2001	Maribor - poštni predali
00050000-552d-1eb4-6658-4abb4a25603a	2206	Marjeta na Dravskem polju
00050000-552d-1eb4-1545-591d719cd5f2	2281	Markovci
00050000-552d-1eb4-b3ab-3f2fe2fffdd3	9221	Martjanci
00050000-552d-1eb4-21ff-a684261d3bc8	6242	Materija
00050000-552d-1eb4-8280-51bb6810f3d8	4211	Mavčiče
00050000-552d-1eb4-0c36-f728cd97bc79	1215	Medvode
00050000-552d-1eb4-7bc6-95f3cb184023	1234	Mengeš
00050000-552d-1eb4-1874-9d3637794742	8330	Metlika
00050000-552d-1eb4-d6ab-f55162466e76	2392	Mežica
00050000-552d-1eb4-00ba-a20cc4fd5857	2204	Miklavž na Dravskem polju
00050000-552d-1eb4-cc6f-041c2300fcd4	2275	Miklavž pri Ormožu
00050000-552d-1eb4-e6d9-edb7b3acf817	5291	Miren
00050000-552d-1eb4-c1b7-f0e12a9f440d	8233	Mirna
00050000-552d-1eb4-22de-4b2b778bcfb6	8216	Mirna Peč
00050000-552d-1eb4-73ac-6403d5ea7970	2382	Mislinja
00050000-552d-1eb4-9466-40597504f2e8	4281	Mojstrana
00050000-552d-1eb4-b779-02058d9ad9b4	8230	Mokronog
00050000-552d-1eb4-6d05-8ff62ca22dba	1251	Moravče
00050000-552d-1eb4-182b-2c44debeca80	9226	Moravske Toplice
00050000-552d-1eb4-db84-9ed99d6dd3c7	5216	Most na Soči
00050000-552d-1eb4-e4b3-ad5469dcf30a	1221	Motnik
00050000-552d-1eb4-2ed6-f466457afc77	3330	Mozirje
00050000-552d-1eb4-0584-ba6d1a9c45f4	9000	Murska Sobota 
00050000-552d-1eb4-5cf4-a41d13d8a151	9001	Murska Sobota - poštni predali
00050000-552d-1eb4-c433-6bdf0cec2344	2366	Muta
00050000-552d-1eb4-7e8d-f10876b528c2	4202	Naklo
00050000-552d-1eb4-7632-433eba393ea3	3331	Nazarje
00050000-552d-1eb4-ded0-764922a53524	1357	Notranje Gorice
00050000-552d-1eb4-c03d-d996573e5fc4	3203	Nova Cerkev
00050000-552d-1eb4-ce5e-8575136fa489	5000	Nova Gorica 
00050000-552d-1eb4-20cb-394182c43e7d	5001	Nova Gorica - poštni predali
00050000-552d-1eb4-9133-d3c86fe171d9	1385	Nova vas
00050000-552d-1eb4-0c6c-5aa47c714558	8000	Novo mesto
00050000-552d-1eb4-fc9d-8ff3eb84c2ed	8001	Novo mesto - poštni predali
00050000-552d-1eb4-d3fb-f134e2a8bc5c	6243	Obrov
00050000-552d-1eb4-0e4f-8d9c0808d08f	9233	Odranci
00050000-552d-1eb4-23e6-4b4a94cc230b	2317	Oplotnica
00050000-552d-1eb4-a286-9d024e7e9c2f	2312	Orehova vas
00050000-552d-1eb4-bc23-9759f959a5d9	2270	Ormož
00050000-552d-1eb4-7b68-c1bf34bca8d9	1316	Ortnek
00050000-552d-1eb4-2a71-d1eed6cee280	1337	Osilnica
00050000-552d-1eb4-502d-4652f2a6626d	8222	Otočec
00050000-552d-1eb4-d365-c3f75abd3b78	2361	Ožbalt
00050000-552d-1eb4-3fc9-df2b9560c20a	2231	Pernica
00050000-552d-1eb4-317e-1cd66572b371	2211	Pesnica pri Mariboru
00050000-552d-1eb4-8168-ed27b231c011	9203	Petrovci
00050000-552d-1eb4-0774-211d3cb0ffad	3301	Petrovče
00050000-552d-1eb4-bc69-42f6fee294c6	6330	Piran/Pirano
00050000-552d-1eb4-c828-47813d2ae9c2	8255	Pišece
00050000-552d-1eb4-b478-84f9ad2910d7	6257	Pivka
00050000-552d-1eb4-1f79-68afdc2a0c31	6232	Planina
00050000-552d-1eb4-72c5-fad99acc841e	3225	Planina pri Sevnici
00050000-552d-1eb4-dac0-ccdaba53ae80	6276	Pobegi
00050000-552d-1eb4-afd9-3e4412188d66	8312	Podbočje
00050000-552d-1eb4-c0a9-81da09f143cb	5243	Podbrdo
00050000-552d-1eb4-974c-685acc9932b5	3254	Podčetrtek
00050000-552d-1eb4-f14d-9ff7f71a9b00	2273	Podgorci
00050000-552d-1eb4-9f96-670316ff5845	6216	Podgorje
00050000-552d-1eb4-1bd2-4e1ea05802cc	2381	Podgorje pri Slovenj Gradcu
00050000-552d-1eb4-6520-58e641404c92	6244	Podgrad
00050000-552d-1eb4-4c18-b334ad189eaa	1414	Podkum
00050000-552d-1eb4-bdc7-9fb877eb62ba	2286	Podlehnik
00050000-552d-1eb4-467b-6da3510efcfe	5272	Podnanos
00050000-552d-1eb4-fc12-b745191b9d9b	4244	Podnart
00050000-552d-1eb4-7ce8-b66117e7074b	3241	Podplat
00050000-552d-1eb4-9e06-5aac625e4e66	3257	Podsreda
00050000-552d-1eb4-a96c-c9aff2b9f281	2363	Podvelka
00050000-552d-1eb4-e05d-f410eb531af9	2208	Pohorje
00050000-552d-1eb4-e924-eb13d436bfd5	2257	Polenšak
00050000-552d-1eb4-4015-c88f6d6ae97a	1355	Polhov Gradec
00050000-552d-1eb4-5df6-5fe7b4612f93	4223	Poljane nad Škofjo Loko
00050000-552d-1eb4-af45-0bc4f9e60e71	2319	Poljčane
00050000-552d-1eb4-7cd7-0631cddaf9fe	1272	Polšnik
00050000-552d-1eb4-13dc-016188ed87dd	3313	Polzela
00050000-552d-1eb4-7eac-eb2e737cd6b4	3232	Ponikva
00050000-552d-1eb4-7e65-e7d348aaca5a	6320	Portorož/Portorose
00050000-552d-1eb4-c7fc-c5e494a4ecc8	6230	Postojna
00050000-552d-1eb4-4c27-5a9826e95561	2331	Pragersko
00050000-552d-1eb4-4f26-8917730d896c	3312	Prebold
00050000-552d-1eb4-ca21-27cbf26eff19	4205	Preddvor
00050000-552d-1eb4-a370-6067fae40339	6255	Prem
00050000-552d-1eb4-fe61-4fece56bb128	1352	Preserje
00050000-552d-1eb4-c82d-561e501c3670	6258	Prestranek
00050000-552d-1eb4-7c6b-a2cc14aa82ba	2391	Prevalje
00050000-552d-1eb4-c176-9f00d4b50657	3262	Prevorje
00050000-552d-1eb4-2574-566c244e602a	1276	Primskovo 
00050000-552d-1eb4-8152-8fa857b7244c	3253	Pristava pri Mestinju
00050000-552d-1eb4-e835-f51a91a62d41	9207	Prosenjakovci/Partosfalva
00050000-552d-1eb4-a1bd-fd351b74041c	5297	Prvačina
00050000-552d-1eb4-8ab8-00bc33333dee	2250	Ptuj
00050000-552d-1eb4-04d8-6178d1090f27	2323	Ptujska Gora
00050000-552d-1eb4-9fe1-d8f2d539d400	9201	Puconci
00050000-552d-1eb4-e113-99e343979b0e	2327	Rače
00050000-552d-1eb4-977b-3bcff12d6b8f	1433	Radeče
00050000-552d-1eb4-8d67-740455b37e51	9252	Radenci
00050000-552d-1eb4-8b56-bf7a11728d78	2360	Radlje ob Dravi
00050000-552d-1eb4-1bee-8b5ed31db1ba	1235	Radomlje
00050000-552d-1eb4-9ad5-f5d7fc69654b	4240	Radovljica
00050000-552d-1eb4-8d18-a5eccd7ae87f	8274	Raka
00050000-552d-1eb4-46c8-3491ab057de1	1381	Rakek
00050000-552d-1eb4-343b-6fd2cf64caee	4283	Rateče - Planica
00050000-552d-1eb4-cd67-afcb875cc4f8	2390	Ravne na Koroškem
00050000-552d-1eb4-eb34-214fd3891676	9246	Razkrižje
00050000-552d-1eb4-6bd9-5365f6cbf62e	3332	Rečica ob Savinji
00050000-552d-1eb4-c4ff-a94b1b8b0329	5292	Renče
00050000-552d-1eb4-72d9-5d674c7c4601	1310	Ribnica
00050000-552d-1eb4-304c-36ba11c1d895	2364	Ribnica na Pohorju
00050000-552d-1eb4-9e20-8f910e0a46c4	3272	Rimske Toplice
00050000-552d-1eb4-508b-6b1b0862a3ec	1314	Rob
00050000-552d-1eb4-aada-759c518205f1	5215	Ročinj
00050000-552d-1eb4-86ce-82dd0bfcfdd0	3250	Rogaška Slatina
00050000-552d-1eb4-f572-9deca50fb74d	9262	Rogašovci
00050000-552d-1eb4-d1fb-e7b72cda015a	3252	Rogatec
00050000-552d-1eb4-c89f-bf26a7be454c	1373	Rovte
00050000-552d-1eb4-0eb2-15f2582dd10d	2342	Ruše
00050000-552d-1eb4-0cc6-20447e41e815	1282	Sava
00050000-552d-1eb4-4d0a-de0d14ed635a	6333	Sečovlje/Sicciole
00050000-552d-1eb4-fee3-b3d693026cba	4227	Selca
00050000-552d-1eb4-979b-d099166b6fad	2352	Selnica ob Dravi
00050000-552d-1eb4-f113-52600c594148	8333	Semič
00050000-552d-1eb4-c3a5-b28b0091a988	8281	Senovo
00050000-552d-1eb4-8e86-5114c396c82d	6224	Senožeče
00050000-552d-1eb4-58fe-1b444cb5745e	8290	Sevnica
00050000-552d-1eb4-bd1c-c753884ee4a8	6210	Sežana
00050000-552d-1eb4-e3a9-57f84a10caa7	2214	Sladki Vrh
00050000-552d-1eb4-ea9c-d54e31f1491c	5283	Slap ob Idrijci
00050000-552d-1eb4-5a13-bbea11022d36	2380	Slovenj Gradec
00050000-552d-1eb4-4cde-e57ca27dae30	2310	Slovenska Bistrica
00050000-552d-1eb4-4ce6-b4cb83722bb5	3210	Slovenske Konjice
00050000-552d-1eb4-29a1-c138a6fbc309	1216	Smlednik
00050000-552d-1eb4-5386-7e2d91368819	5232	Soča
00050000-552d-1eb4-4ccb-e2a73e6744c9	1317	Sodražica
00050000-552d-1eb4-c1c4-7b2197b68e81	3335	Solčava
00050000-552d-1eb4-f5c8-e43bbb16f7c8	5250	Solkan
00050000-552d-1eb4-2b5c-1972e9a41aba	4229	Sorica
00050000-552d-1eb4-016e-1c48094b6e16	4225	Sovodenj
00050000-552d-1eb4-43a6-dcc0be652e60	5281	Spodnja Idrija
00050000-552d-1eb4-818a-ff11e7755539	2241	Spodnji Duplek
00050000-552d-1eb4-baa0-62a6a6473404	9245	Spodnji Ivanjci
00050000-552d-1eb4-0a68-36d52de7ca90	2277	Središče ob Dravi
00050000-552d-1eb4-6413-d87377ddf0d7	4267	Srednja vas v Bohinju
00050000-552d-1eb4-d47b-b13ee5fe8a16	8256	Sromlje 
00050000-552d-1eb4-0f46-6f2c2d3b77aa	5224	Srpenica
00050000-552d-1eb4-de12-60a86f80e98b	1242	Stahovica
00050000-552d-1eb4-17b4-be6d6d04f957	1332	Stara Cerkev
00050000-552d-1eb4-15d2-b84ba360706a	8342	Stari trg ob Kolpi
00050000-552d-1eb4-1d17-a18e9b3ee992	1386	Stari trg pri Ložu
00050000-552d-1eb4-d37e-f2fa147bc8ed	2205	Starše
00050000-552d-1eb4-bfb7-ccd11cb4acb1	2289	Stoperce
00050000-552d-1eb4-f1bf-9ba6e747bda5	8322	Stopiče
00050000-552d-1eb4-c738-18cc14390955	3206	Stranice
00050000-552d-1eb4-ea42-c0c8f3d777ae	8351	Straža
00050000-552d-1eb4-39e8-b9db0fcd97df	1313	Struge
00050000-552d-1eb4-db7a-e1570b7c2d69	8293	Studenec
00050000-552d-1eb4-28e1-c424c92eebc0	8331	Suhor
00050000-552d-1eb4-5702-cbb698a9a5f5	2233	Sv. Ana v Slovenskih goricah
00050000-552d-1eb4-2201-be646ece6aed	2235	Sv. Trojica v Slovenskih goricah
00050000-552d-1eb4-f48c-585f541c3372	2353	Sveti Duh na Ostrem Vrhu
00050000-552d-1eb4-3267-9e632768e94b	9244	Sveti Jurij ob Ščavnici
00050000-552d-1eb4-5368-c337114fad5d	3264	Sveti Štefan
00050000-552d-1eb4-ced7-446a1a70576e	2258	Sveti Tomaž
00050000-552d-1eb4-a37c-5ea2ceef65f4	9204	Šalovci
00050000-552d-1eb4-8312-985b57878df4	5261	Šempas
00050000-552d-1eb4-8a51-fd29bc566f18	5290	Šempeter pri Gorici
00050000-552d-1eb4-d402-38ce042fb2c6	3311	Šempeter v Savinjski dolini
00050000-552d-1eb4-18d0-0ebf247f922e	4208	Šenčur
00050000-552d-1eb4-e834-b657c00f9a63	2212	Šentilj v Slovenskih goricah
00050000-552d-1eb4-ed6d-74594545f9a8	8297	Šentjanž
00050000-552d-1eb4-16cf-08ef95a4eb96	2373	Šentjanž pri Dravogradu
00050000-552d-1eb4-4d34-2c5667edf36a	8310	Šentjernej
00050000-552d-1eb4-ff6f-271a673145be	3230	Šentjur
00050000-552d-1eb4-a259-39f8df5cc48b	3271	Šentrupert
00050000-552d-1eb4-a517-583c8740af50	8232	Šentrupert
00050000-552d-1eb4-0c3a-e7417378ed3b	1296	Šentvid pri Stični
00050000-552d-1eb4-4480-c09c510a9bab	8275	Škocjan
00050000-552d-1eb4-7c8d-815f2a27c79b	6281	Škofije
00050000-552d-1eb4-a5d1-f4e009561b8f	4220	Škofja Loka
00050000-552d-1eb4-4e8f-5209f91bacb3	3211	Škofja vas
00050000-552d-1eb4-edb2-02fdaa5b1786	1291	Škofljica
00050000-552d-1eb4-5cf9-5fcb6bd1c025	6274	Šmarje
00050000-552d-1eb4-9ebe-d85419d2732b	1293	Šmarje - Sap
00050000-552d-1eb4-cd46-d8d2d407a92b	3240	Šmarje pri Jelšah
00050000-552d-1eb4-5926-38b3b1a8a758	8220	Šmarješke Toplice
00050000-552d-1eb4-c1bd-8604963e0e47	2315	Šmartno na Pohorju
00050000-552d-1eb4-6dca-a0efc6d282d8	3341	Šmartno ob Dreti
00050000-552d-1eb4-b466-cfb1ca1a961e	3327	Šmartno ob Paki
00050000-552d-1eb4-2333-ffe10b419f35	1275	Šmartno pri Litiji
00050000-552d-1eb4-dd77-66f63e5f9af8	2383	Šmartno pri Slovenj Gradcu
00050000-552d-1eb4-3516-f0d904d8012c	3201	Šmartno v Rožni dolini
00050000-552d-1eb4-e1a8-99e74f832bde	3325	Šoštanj
00050000-552d-1eb4-65b5-edc31ba4699d	6222	Štanjel
00050000-552d-1eb4-04b3-302f801cd798	3220	Štore
00050000-552d-1eb4-295d-8e2cf62cf7f9	3304	Tabor
00050000-552d-1eb4-c28a-3797c220c5f4	3221	Teharje
00050000-552d-1eb4-abac-9ce5f7e29964	9251	Tišina
00050000-552d-1eb4-47b1-5f940ef8ab85	5220	Tolmin
00050000-552d-1eb4-53d8-4678d7afca2d	3326	Topolšica
00050000-552d-1eb4-b3c9-949f9eb5ff3f	2371	Trbonje
00050000-552d-1eb4-c8fa-a1eec11fadb2	1420	Trbovlje
00050000-552d-1eb4-5ace-60227e1d7fbe	8231	Trebelno 
00050000-552d-1eb4-48fd-ad0df3c62ff8	8210	Trebnje
00050000-552d-1eb4-e751-6a366d80f8fa	5252	Trnovo pri Gorici
00050000-552d-1eb4-83aa-c4ffe6145465	2254	Trnovska vas
00050000-552d-1eb4-f0e7-467e2a31a8f0	1222	Trojane
00050000-552d-1eb4-c2ff-0086f6b3bbcb	1236	Trzin
00050000-552d-1eb4-6134-7e9f0927a62b	4290	Tržič
00050000-552d-1eb4-9aba-c9c00db905cd	8295	Tržišče
00050000-552d-1eb4-ff31-9fabbfb15608	1311	Turjak
00050000-552d-1eb4-91ec-6a5a17612ce4	9224	Turnišče
00050000-552d-1eb4-c1d2-587a8520f7b1	8323	Uršna sela
00050000-552d-1eb4-70cd-634f31e470e9	1252	Vače
00050000-552d-1eb4-688a-e0cc6ba5202a	3320	Velenje 
00050000-552d-1eb4-a7ff-9f6202c00b1e	3322	Velenje - poštni predali
00050000-552d-1eb4-166d-7b64fa2a2a9e	8212	Velika Loka
00050000-552d-1eb4-2acd-5d1612142d2b	2274	Velika Nedelja
00050000-552d-1eb4-1e0e-d872f1104851	9225	Velika Polana
00050000-552d-1eb4-05fd-2bdcfca96939	1315	Velike Lašče
00050000-552d-1eb4-271c-28e2463fdd71	8213	Veliki Gaber
00050000-552d-1eb4-a7b5-b48b701ed210	9241	Veržej
00050000-552d-1eb4-9562-860d646bac49	1312	Videm - Dobrepolje
00050000-552d-1eb4-58b7-b2a37b075752	2284	Videm pri Ptuju
00050000-552d-1eb4-c542-fb2325aea901	8344	Vinica
00050000-552d-1eb4-c7c5-b1b204cd2759	5271	Vipava
00050000-552d-1eb4-1d2d-27b8b3855610	4212	Visoko
00050000-552d-1eb4-229a-30a40837442b	1294	Višnja Gora
00050000-552d-1eb4-9c11-f7120467ffaa	3205	Vitanje
00050000-552d-1eb4-69cb-94cb34758c93	2255	Vitomarci
00050000-552d-1eb4-3038-4263da9d9dcc	1217	Vodice
00050000-552d-1eb4-3dc4-48c2d19a2205	3212	Vojnik\t
00050000-552d-1eb4-1f1b-4a36d9466235	5293	Volčja Draga
00050000-552d-1eb4-41bd-55a411ae115b	2232	Voličina
00050000-552d-1eb4-e496-c3920ef143b4	3305	Vransko
00050000-552d-1eb4-e7ee-91e4e56d9a9e	6217	Vremski Britof
00050000-552d-1eb4-7f41-6b3d83687571	1360	Vrhnika
00050000-552d-1eb4-f568-606eafdd9c6b	2365	Vuhred
00050000-552d-1eb4-0e4f-f0c269b5c34f	2367	Vuzenica
00050000-552d-1eb4-68ac-cee9a91a35bd	8292	Zabukovje 
00050000-552d-1eb4-c9a4-d504e9595d66	1410	Zagorje ob Savi
00050000-552d-1eb4-b4d8-b951a826cf5e	1303	Zagradec
00050000-552d-1eb4-d8b7-2c44182fb5a5	2283	Zavrč
00050000-552d-1eb4-9795-ff788cf678ba	8272	Zdole 
00050000-552d-1eb4-282b-37e22bce711c	4201	Zgornja Besnica
00050000-552d-1eb4-5776-8aa366f414f6	2242	Zgornja Korena
00050000-552d-1eb4-74dc-790852800d60	2201	Zgornja Kungota
00050000-552d-1eb4-daee-e903983b6d3f	2316	Zgornja Ložnica
00050000-552d-1eb4-af55-4e3f8bef4c16	2314	Zgornja Polskava
00050000-552d-1eb4-c700-427abe961a35	2213	Zgornja Velka
00050000-552d-1eb4-870a-9eaccc663136	4247	Zgornje Gorje
00050000-552d-1eb4-2de7-13877894f5a8	4206	Zgornje Jezersko
00050000-552d-1eb4-a96d-49c1aecbbf9f	2285	Zgornji Leskovec
00050000-552d-1eb4-965a-0f1a5badc0f6	1432	Zidani Most
00050000-552d-1eb4-fbd4-f64ad34ce7a4	3214	Zreče
00050000-552d-1eb4-cbb0-cbe524640908	4209	Žabnica
00050000-552d-1eb4-c2c2-49535815f53f	3310	Žalec
00050000-552d-1eb4-808f-4674a55fa7be	4228	Železniki
00050000-552d-1eb4-887d-e017923ba3f2	2287	Žetale
00050000-552d-1eb4-8d9b-c62ac5288384	4226	Žiri
00050000-552d-1eb4-3bc6-c0a23dc261c4	4274	Žirovnica
00050000-552d-1eb4-5dbc-b74b360cad52	8360	Žužemberk
\.


--
-- TOC entry 2618 (class 0 OID 294357)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2601 (class 0 OID 294180)
-- Dependencies: 183
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2606 (class 0 OID 294246)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2620 (class 0 OID 294369)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 294474)
-- Dependencies: 214
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2636 (class 0 OID 294518)
-- Dependencies: 218
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2624 (class 0 OID 294398)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2616 (class 0 OID 294342)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2615 (class 0 OID 294332)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 294508)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 294464)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2589 (class 0 OID 294048)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-552d-1eb5-46fc-64fce42d2aff	00010000-552d-1eb5-1642-a386c38f1e1c	2015-04-14 16:05:42	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROz0t0vUXmArgbFVYQ0WyK8MAttSfcFTy";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2650 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2625 (class 0 OID 294407)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2593 (class 0 OID 294085)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00000000-552d-1eb5-10b4-bf11e322c56d	beri-vse	Polni dostop do vsega v aplikaciji.	t
00000000-552d-1eb5-f9cf-0a090233e6be	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00000000-552d-1eb5-1475-84cbe8fd543d	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00000000-552d-1eb5-be56-10b1e8ca5187	ifi-all	Polni dostop do vsega v aplikaciji.	t
00000000-552d-1eb5-c86f-c288b64f821b	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00000000-552d-1eb5-4dee-f5e52e8dd337	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2591 (class 0 OID 294069)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-552d-1eb5-46fc-64fce42d2aff	00000000-552d-1eb5-be56-10b1e8ca5187
00010000-552d-1eb5-f208-6432953259e8	00000000-552d-1eb5-1475-84cbe8fd543d
\.


--
-- TOC entry 2627 (class 0 OID 294421)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2619 (class 0 OID 294363)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2613 (class 0 OID 294313)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2598 (class 0 OID 294145)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2614 (class 0 OID 294319)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 294499)
-- Dependencies: 216
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2604 (class 0 OID 294215)
-- Dependencies: 186
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2590 (class 0 OID 294057)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, username, password, enabled, expires, defaultroute, defaultrouteparams, email) FROM stdin;
00010000-552d-1eb5-1642-a386c38f1e1c	Konzolni	console	$2y$05$NS4xMjkyMTcwMzExMjAxRObDPgo0g3YFui9u3O0En6.7wXNNLnE.a	t	\N	\N	\N	rootmail@max.si
00010000-552d-1eb5-f208-6432953259e8	Anonimni	anonymous	$2y$05$NS4xMjkyMTcwMzExMjAxROs1mLhVrSI9kkchzullfM4ApcaBvG4gW	t	\N	\N	\N	noreply@max.si
00010000-552d-1eb5-46fc-64fce42d2aff	Administrator	admin	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@max.si
\.


--
-- TOC entry 2639 (class 0 OID 294549)
-- Dependencies: 221
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2608 (class 0 OID 294261)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2623 (class 0 OID 294390)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 294456)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2610 (class 0 OID 294289)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2638 (class 0 OID 294539)
-- Dependencies: 220
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 294446)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2236 (class 2606 OID 294110)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 294588)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 294581)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 294498)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 294279)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2305 (class 2606 OID 294312)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2272 (class 2606 OID 294241)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2359 (class 2606 OID 294442)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2283 (class 2606 OID 294259)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2302 (class 2606 OID 294306)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2243 (class 2606 OID 294142)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 294355)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 294382)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2265 (class 2606 OID 294213)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2240 (class 2606 OID 294119)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2256 (class 2606 OID 294177)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2234 (class 2606 OID 294099)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2227 (class 2606 OID 294084)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 294388)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 294420)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 294535)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2251 (class 2606 OID 294170)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2262 (class 2606 OID 294201)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2330 (class 2606 OID 294361)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 294192)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2281 (class 2606 OID 294250)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 294373)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 294480)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 294523)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 294405)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2324 (class 2606 OID 294346)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2318 (class 2606 OID 294337)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 294517)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 294471)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2218 (class 2606 OID 294056)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 294411)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2225 (class 2606 OID 294073)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2229 (class 2606 OID 294093)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 294429)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2332 (class 2606 OID 294368)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2307 (class 2606 OID 294318)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2248 (class 2606 OID 294149)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 294328)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 294507)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2270 (class 2606 OID 294226)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2221 (class 2606 OID 294067)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 294563)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2287 (class 2606 OID 294265)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 294396)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2367 (class 2606 OID 294462)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 294301)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 294548)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 294455)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2290 (class 1259 OID 294286)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2249 (class 1259 OID 294172)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2339 (class 1259 OID 294389)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2333 (class 1259 OID 294375)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2334 (class 1259 OID 294374)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2285 (class 1259 OID 294266)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2360 (class 1259 OID 294445)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2361 (class 1259 OID 294443)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2362 (class 1259 OID 294444)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2385 (class 1259 OID 294536)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2386 (class 1259 OID 294537)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 294538)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2392 (class 1259 OID 294566)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2393 (class 1259 OID 294565)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2394 (class 1259 OID 294564)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2267 (class 1259 OID 294228)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2268 (class 1259 OID 294227)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2253 (class 1259 OID 294179)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2254 (class 1259 OID 294178)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2348 (class 1259 OID 294412)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2303 (class 1259 OID 294307)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2231 (class 1259 OID 294100)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2232 (class 1259 OID 294101)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2353 (class 1259 OID 294432)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2354 (class 1259 OID 294431)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2355 (class 1259 OID 294430)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2277 (class 1259 OID 294251)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2278 (class 1259 OID 294253)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2279 (class 1259 OID 294252)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2313 (class 1259 OID 294341)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2314 (class 1259 OID 294339)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2315 (class 1259 OID 294338)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2316 (class 1259 OID 294340)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2222 (class 1259 OID 294074)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2223 (class 1259 OID 294075)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2342 (class 1259 OID 294397)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2328 (class 1259 OID 294362)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2368 (class 1259 OID 294472)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2369 (class 1259 OID 294473)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2257 (class 1259 OID 294193)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2258 (class 1259 OID 294194)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2372 (class 1259 OID 294481)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2373 (class 1259 OID 294482)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2403 (class 1259 OID 294591)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2404 (class 1259 OID 294590)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2405 (class 1259 OID 294593)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2406 (class 1259 OID 294589)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2407 (class 1259 OID 294592)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2365 (class 1259 OID 294463)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2319 (class 1259 OID 294350)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2320 (class 1259 OID 294349)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2321 (class 1259 OID 294347)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2322 (class 1259 OID 294348)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2241 (class 1259 OID 294143)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2399 (class 1259 OID 294583)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 294582)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2284 (class 1259 OID 294260)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2237 (class 1259 OID 294121)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2238 (class 1259 OID 294120)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2245 (class 1259 OID 294150)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2246 (class 1259 OID 294151)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2308 (class 1259 OID 294331)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2309 (class 1259 OID 294330)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2310 (class 1259 OID 294329)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2291 (class 1259 OID 294288)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2292 (class 1259 OID 294284)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2293 (class 1259 OID 294281)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2294 (class 1259 OID 294282)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2295 (class 1259 OID 294280)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2296 (class 1259 OID 294285)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2297 (class 1259 OID 294283)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2252 (class 1259 OID 294171)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2273 (class 1259 OID 294242)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2274 (class 1259 OID 294244)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2275 (class 1259 OID 294243)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2276 (class 1259 OID 294245)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2327 (class 1259 OID 294356)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2266 (class 1259 OID 294214)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2219 (class 1259 OID 294068)
-- Name: uniq_7fb775b7f85e0677; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7f85e0677 ON uporabniki USING btree (username);


--
-- TOC entry 2347 (class 1259 OID 294406)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2244 (class 1259 OID 294144)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2263 (class 1259 OID 294202)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2384 (class 1259 OID 294524)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2230 (class 1259 OID 294094)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2298 (class 1259 OID 294287)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2432 (class 2606 OID 294724)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2435 (class 2606 OID 294709)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2434 (class 2606 OID 294714)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2430 (class 2606 OID 294734)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2436 (class 2606 OID 294704)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2431 (class 2606 OID 294729)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2433 (class 2606 OID 294719)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2418 (class 2606 OID 294644)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2453 (class 2606 OID 294819)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2451 (class 2606 OID 294814)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2452 (class 2606 OID 294809)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2429 (class 2606 OID 294699)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2459 (class 2606 OID 294859)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2461 (class 2606 OID 294849)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 294854)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2449 (class 2606 OID 294799)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2470 (class 2606 OID 294894)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2469 (class 2606 OID 294899)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2468 (class 2606 OID 294904)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2471 (class 2606 OID 294919)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2472 (class 2606 OID 294914)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2473 (class 2606 OID 294909)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2423 (class 2606 OID 294674)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2424 (class 2606 OID 294669)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2419 (class 2606 OID 294654)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2420 (class 2606 OID 294649)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2455 (class 2606 OID 294829)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2437 (class 2606 OID 294739)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2411 (class 2606 OID 294604)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2410 (class 2606 OID 294609)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2456 (class 2606 OID 294844)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2457 (class 2606 OID 294839)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2458 (class 2606 OID 294834)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2427 (class 2606 OID 294679)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2425 (class 2606 OID 294689)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2426 (class 2606 OID 294684)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2441 (class 2606 OID 294774)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2443 (class 2606 OID 294764)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2444 (class 2606 OID 294759)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2442 (class 2606 OID 294769)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2409 (class 2606 OID 294594)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2408 (class 2606 OID 294599)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2454 (class 2606 OID 294824)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2450 (class 2606 OID 294804)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2464 (class 2606 OID 294869)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2463 (class 2606 OID 294874)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2422 (class 2606 OID 294659)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2421 (class 2606 OID 294664)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2466 (class 2606 OID 294879)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2465 (class 2606 OID 294884)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2478 (class 2606 OID 294944)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2479 (class 2606 OID 294939)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2476 (class 2606 OID 294954)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2480 (class 2606 OID 294934)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2477 (class 2606 OID 294949)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2462 (class 2606 OID 294864)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2445 (class 2606 OID 294794)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2446 (class 2606 OID 294789)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2448 (class 2606 OID 294779)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2447 (class 2606 OID 294784)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2415 (class 2606 OID 294624)
-- Name: fk_b7229ce169e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT fk_b7229ce169e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2414 (class 2606 OID 294629)
-- Name: fk_b7229ce1a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT fk_b7229ce1a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2474 (class 2606 OID 294929)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2475 (class 2606 OID 294924)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2428 (class 2606 OID 294694)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2467 (class 2606 OID 294889)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2412 (class 2606 OID 294619)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2413 (class 2606 OID 294614)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2417 (class 2606 OID 294634)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2416 (class 2606 OID 294639)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2438 (class 2606 OID 294754)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2439 (class 2606 OID 294749)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2440 (class 2606 OID 294744)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-14 16:05:42 CEST

--
-- PostgreSQL database dump complete
--

