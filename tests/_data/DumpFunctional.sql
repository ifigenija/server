--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-12 09:36:00 CEST

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
-- TOC entry 2690 (class 0 OID 0)
-- Dependencies: 226
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 3111941)
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
-- TOC entry 225 (class 1259 OID 3112425)
-- Name: alternacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE alternacija (
    id uuid NOT NULL,
    funkcija_id uuid,
    sodelovanje_id uuid,
    oseba_id uuid,
    koprodukcija_delitev_id uuid,
    pogodba_id uuid,
    zaposlen boolean
);


--
-- TOC entry 224 (class 1259 OID 3112408)
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
-- TOC entry 217 (class 1259 OID 3112322)
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
-- TOC entry 193 (class 1259 OID 3112106)
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
-- TOC entry 196 (class 1259 OID 3112147)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 3112068)
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
-- TOC entry 212 (class 1259 OID 3112272)
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
-- TOC entry 191 (class 1259 OID 3112093)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 3112141)
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
-- TOC entry 201 (class 1259 OID 3112190)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 3112215)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 3112042)
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
-- TOC entry 180 (class 1259 OID 3111950)
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
-- TOC entry 181 (class 1259 OID 3111961)
-- Name: oseba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba (
    id uuid NOT NULL,
    user_id uuid,
    naziv character varying(40) DEFAULT NULL::character varying,
    ime character varying(255) DEFAULT NULL::character varying,
    priimek character varying(255) DEFAULT NULL::character varying,
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
-- TOC entry 184 (class 1259 OID 3112012)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 3111915)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 3111934)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 3112222)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 3112252)
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
-- TOC entry 221 (class 1259 OID 3112364)
-- Name: pogodba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pogodba (
    id uuid NOT NULL,
    oseba_id uuid,
    popa_id uuid,
    trr_id uuid,
    sifra character varying(7) NOT NULL,
    vrednostvaje numeric(12,2) DEFAULT NULL::numeric,
    vrednostpredstave numeric(12,2) DEFAULT NULL::numeric,
    vrednosture numeric(12,2) DEFAULT NULL::numeric,
    aktivna boolean,
    opis text
);


--
-- TOC entry 183 (class 1259 OID 3111992)
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
-- TOC entry 186 (class 1259 OID 3112034)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 3112196)
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
-- TOC entry 185 (class 1259 OID 3112019)
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
-- TOC entry 190 (class 1259 OID 3112085)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 3112208)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 3112313)
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
-- TOC entry 220 (class 1259 OID 3112357)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 3112237)
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
-- TOC entry 200 (class 1259 OID 3112181)
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
-- TOC entry 199 (class 1259 OID 3112171)
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
-- TOC entry 219 (class 1259 OID 3112347)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 3112303)
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
-- TOC entry 173 (class 1259 OID 3111886)
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
-- TOC entry 172 (class 1259 OID 3111884)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 3112246)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 3111924)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 3111908)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 3112260)
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
-- TOC entry 203 (class 1259 OID 3112202)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 3112152)
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
-- TOC entry 182 (class 1259 OID 3111984)
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
-- TOC entry 198 (class 1259 OID 3112158)
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
-- TOC entry 218 (class 1259 OID 3112338)
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
-- TOC entry 188 (class 1259 OID 3112054)
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
-- TOC entry 174 (class 1259 OID 3111895)
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
-- TOC entry 223 (class 1259 OID 3112389)
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
    sloavtor boolean,
    kratkinaslov character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 3112100)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 3112229)
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
-- TOC entry 214 (class 1259 OID 3112295)
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
-- TOC entry 194 (class 1259 OID 3112128)
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
-- TOC entry 222 (class 1259 OID 3112379)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 3112285)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 3111889)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2637 (class 0 OID 3111941)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2683 (class 0 OID 3112425)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 3112408)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 3112322)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 3112106)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 3112147)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 3112068)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5551-ad5f-7de3-0fb38e380473	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5551-ad5f-87f6-79f6e2ad3a74	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5551-ad5f-0722-8f141f3222d1	AL	ALB	008	Albania 	Albanija	\N
00040000-5551-ad5f-194d-fd9bde3d806e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5551-ad5f-4217-c4ab40f67796	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5551-ad5f-e530-be10ce524752	AD	AND	020	Andorra 	Andora	\N
00040000-5551-ad5f-e757-25b3fd855364	AO	AGO	024	Angola 	Angola	\N
00040000-5551-ad5f-3e53-4faad3bfdaa1	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5551-ad5f-bf26-d80f8be3bf51	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5551-ad5f-48bf-95bbff077ddc	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5551-ad5f-5d05-2d6e86c18091	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5551-ad5f-2fe2-753e09862074	AM	ARM	051	Armenia 	Armenija	\N
00040000-5551-ad5f-936d-aacd8b5c0a38	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5551-ad5f-14ae-0369ade3f6fc	AU	AUS	036	Australia 	Avstralija	\N
00040000-5551-ad5f-8da0-929b08aa8e3c	AT	AUT	040	Austria 	Avstrija	\N
00040000-5551-ad5f-a221-97967f35e353	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5551-ad5f-5cd1-d705709aadba	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5551-ad5f-c056-5be8fa0b3403	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5551-ad5f-f2fc-d2914798a03c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5551-ad5f-cc70-6e823e4ccd76	BB	BRB	052	Barbados 	Barbados	\N
00040000-5551-ad5f-86a5-777b7cf4178b	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5551-ad5f-4cbc-1e27fdb66100	BE	BEL	056	Belgium 	Belgija	\N
00040000-5551-ad5f-a6b7-b796ac36e1c2	BZ	BLZ	084	Belize 	Belize	\N
00040000-5551-ad5f-2c4e-2ec0e2dafa13	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5551-ad5f-2f33-2faf60453236	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5551-ad5f-cc36-5b2470087721	BT	BTN	064	Bhutan 	Butan	\N
00040000-5551-ad5f-696d-b8c128cfed88	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5551-ad5f-427f-47c9a8c8e281	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5551-ad5f-aac0-9c23a6a972e9	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5551-ad5f-1eb4-c9b80037ab6c	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5551-ad5f-33af-9d708f64187d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5551-ad5f-9b24-41d67f2e0d84	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5551-ad5f-fb75-39d8337b5425	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5551-ad5f-b734-584866045ef6	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5551-ad5f-8dcb-946692405037	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5551-ad5f-d63e-1010ed2538e0	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5551-ad5f-e92a-1d2104d9873d	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5551-ad5f-03d8-714720f53742	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5551-ad5f-6c86-ccf2f6ee1877	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5551-ad5f-a1c3-9216e97efed7	CA	CAN	124	Canada 	Kanada	\N
00040000-5551-ad5f-3a3b-62716293c0d5	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5551-ad5f-2757-2fb9aa41511f	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5551-ad5f-e861-912d51e50d13	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5551-ad5f-56a3-3d5f1c4cc383	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5551-ad5f-c8e6-4f9fbf09bd20	CL	CHL	152	Chile 	Čile	\N
00040000-5551-ad5f-a35d-773d53c76d1e	CN	CHN	156	China 	Kitajska	\N
00040000-5551-ad5f-7dbf-8fe6f9a79a07	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5551-ad5f-75a4-c4e77c748b1b	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5551-ad5f-9c7b-8011566121f4	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5551-ad5f-95ae-5b0eddb2bf12	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5551-ad5f-9f9e-fd088155e892	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5551-ad5f-5da2-5a8e17fe5952	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5551-ad5f-5186-c0ffb5a16dac	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5551-ad5f-a235-608711adddbb	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5551-ad5f-7914-34d50051e8ec	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5551-ad5f-04f6-50f5bf396e93	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5551-ad5f-191e-9df34027d87e	CU	CUB	192	Cuba 	Kuba	\N
00040000-5551-ad5f-6f5b-5dae3e955a3e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5551-ad5f-b6f7-a704814d9809	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5551-ad5f-8250-13098c1dbf97	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5551-ad5f-c0e8-1cacdd25ff61	DK	DNK	208	Denmark 	Danska	\N
00040000-5551-ad5f-9a20-9c31bb26d9de	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5551-ad5f-4331-ab39ec313405	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5551-ad5f-af38-f3cdb36cc94b	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5551-ad5f-2803-fa9d45f4f5e9	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5551-ad5f-e3ac-a1c9cc24671b	EG	EGY	818	Egypt 	Egipt	\N
00040000-5551-ad5f-1c79-6ed081a5b59c	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5551-ad5f-1120-10b73f115c29	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5551-ad5f-0838-f359460fea1f	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5551-ad5f-0ae2-72a4db709714	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5551-ad5f-32f3-826c4c53b6cf	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5551-ad5f-b156-7d9f0a626b54	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5551-ad5f-e2ed-e788ae9504a4	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5551-ad5f-d94a-eee095fcaaf1	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5551-ad5f-f0b9-9d50806c7958	FI	FIN	246	Finland 	Finska	\N
00040000-5551-ad5f-9906-8e04ed9478f4	FR	FRA	250	France 	Francija	\N
00040000-5551-ad5f-fe30-3a157702730a	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5551-ad5f-0f24-db40bb439cf7	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5551-ad5f-6f09-d4233879a453	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5551-ad5f-bdf1-292a0375ba5e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5551-ad5f-b3c1-3256af777196	GA	GAB	266	Gabon 	Gabon	\N
00040000-5551-ad5f-4365-f8a4c225d1e9	GM	GMB	270	Gambia 	Gambija	\N
00040000-5551-ad5f-c738-1f650c36bf19	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5551-ad5f-6c55-971c46e6c2c9	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5551-ad5f-560d-c1d16d84d7c2	GH	GHA	288	Ghana 	Gana	\N
00040000-5551-ad5f-4f19-52843024f5ce	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5551-ad5f-5f85-4c40e36d95ee	GR	GRC	300	Greece 	Grčija	\N
00040000-5551-ad5f-59f3-d288f58ebb67	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5551-ad5f-d1a7-03fad0b66d11	GD	GRD	308	Grenada 	Grenada	\N
00040000-5551-ad5f-136c-e3142ea982aa	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5551-ad5f-8341-a17235f6abc7	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5551-ad5f-4575-b2f6e944144f	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5551-ad5f-8131-b99f8b902fa0	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5551-ad5f-e223-dd21ef799e70	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5551-ad5f-9dc5-b5c313ae138b	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5551-ad5f-8593-046953273bc3	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5551-ad5f-d049-330e6ae23dfd	HT	HTI	332	Haiti 	Haiti	\N
00040000-5551-ad5f-1abb-1657d0a436fb	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5551-ad5f-55d7-982c05ba1419	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5551-ad5f-ed74-28864bd8df42	HN	HND	340	Honduras 	Honduras	\N
00040000-5551-ad5f-b07a-8a71c064e08c	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5551-ad5f-95c6-470acd7d0978	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5551-ad5f-9f91-54d67a78c181	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5551-ad5f-579f-fb8d55a162c6	IN	IND	356	India 	Indija	\N
00040000-5551-ad5f-0904-af701520dcd6	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5551-ad5f-f9f0-e62c6015a5cb	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5551-ad5f-3ab6-91d0b6d053f7	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5551-ad5f-98e0-d023bc0d434c	IE	IRL	372	Ireland 	Irska	\N
00040000-5551-ad5f-92d3-2d824881e8f9	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5551-ad5f-12cd-6842c4301c20	IL	ISR	376	Israel 	Izrael	\N
00040000-5551-ad5f-49dc-171cfacce0cd	IT	ITA	380	Italy 	Italija	\N
00040000-5551-ad5f-8efa-febe9e0b322d	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5551-ad5f-b362-e0295631a456	JP	JPN	392	Japan 	Japonska	\N
00040000-5551-ad5f-21b1-8f498acfe3c8	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5551-ad5f-e0fb-e865620a95b4	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5551-ad5f-6294-adf7e24da0af	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5551-ad5f-8379-c99e45a6aae2	KE	KEN	404	Kenya 	Kenija	\N
00040000-5551-ad5f-5cfb-b286c9d00357	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5551-ad5f-70d2-0cac782a497e	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5551-ad5f-31fa-bfc96522af8f	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5551-ad5f-9922-d67d42a9cca7	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5551-ad5f-23d1-8c5b684951da	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5551-ad5f-670a-0ed591ace760	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5551-ad5f-f360-8ab00b572c0b	LV	LVA	428	Latvia 	Latvija	\N
00040000-5551-ad5f-e71f-44b026ac0f9c	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5551-ad5f-36c0-c77682db8e6b	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5551-ad5f-a4b4-ea61c506d468	LR	LBR	430	Liberia 	Liberija	\N
00040000-5551-ad5f-cadf-646a6908fd9b	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5551-ad5f-81ef-d81ea545c419	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5551-ad5f-2db0-f0e02dffb378	LT	LTU	440	Lithuania 	Litva	\N
00040000-5551-ad5f-15f3-9ab93e397d54	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5551-ad5f-1e71-9dfbebaea212	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5551-ad5f-be63-39943385b21a	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5551-ad5f-e312-4adcd7b1700c	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5551-ad5f-2989-ee88430df304	MW	MWI	454	Malawi 	Malavi	\N
00040000-5551-ad5f-0ed5-054556c2318c	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5551-ad5f-7f08-850245171adb	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5551-ad5f-37b5-c51dd4032d37	ML	MLI	466	Mali 	Mali	\N
00040000-5551-ad5f-969f-b5f180208c0d	MT	MLT	470	Malta 	Malta	\N
00040000-5551-ad5f-8e49-982d2977ac0d	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5551-ad5f-028c-f0fdd6f657ac	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5551-ad5f-34fc-3e54c10dfd2c	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5551-ad5f-b34c-1c3d98966f60	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5551-ad5f-1699-21b56d2802ad	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5551-ad5f-90aa-a813de4edb0f	MX	MEX	484	Mexico 	Mehika	\N
00040000-5551-ad5f-7bbe-6a856d118df8	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5551-ad5f-15e8-a273a35977c0	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5551-ad5f-6760-f0245e02d6ba	MC	MCO	492	Monaco 	Monako	\N
00040000-5551-ad5f-0551-b55f6fac0cf8	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5551-ad5f-9043-6b0f95078193	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5551-ad5f-e689-643f5e354469	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5551-ad5f-159e-6772c5aa4e9d	MA	MAR	504	Morocco 	Maroko	\N
00040000-5551-ad5f-e257-85f34a03a593	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5551-ad5f-2496-5aa92ce4ca80	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5551-ad5f-57dd-23765a430f1a	NA	NAM	516	Namibia 	Namibija	\N
00040000-5551-ad5f-1379-8e1eb713d704	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5551-ad5f-147e-87921be95ec2	NP	NPL	524	Nepal 	Nepal	\N
00040000-5551-ad5f-4143-1192ded2a4ab	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5551-ad5f-6ca2-53784e08d981	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5551-ad5f-536e-abdd08cd16dd	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5551-ad5f-6dde-efd5b12c8e15	NE	NER	562	Niger 	Niger 	\N
00040000-5551-ad5f-7fb1-9ea5a699ac8b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5551-ad5f-e599-65a172b3ee30	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5551-ad5f-6346-8f2b46550e91	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5551-ad5f-f092-0f60b80d2ac7	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5551-ad5f-ed5c-ce0aa250ca27	NO	NOR	578	Norway 	Norveška	\N
00040000-5551-ad5f-f476-e51eeecaafc3	OM	OMN	512	Oman 	Oman	\N
00040000-5551-ad5f-9efc-f39c511e28f7	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5551-ad5f-b718-397759c7e514	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5551-ad5f-0c8b-22ce458c112b	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5551-ad5f-befc-eb63439fd195	PA	PAN	591	Panama 	Panama	\N
00040000-5551-ad5f-5b80-26335650b927	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5551-ad5f-7e39-faf51f464c15	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5551-ad5f-4ddd-a175c93e8f42	PE	PER	604	Peru 	Peru	\N
00040000-5551-ad5f-ffd0-f043c576f7c0	PH	PHL	608	Philippines 	Filipini	\N
00040000-5551-ad5f-1886-d27532da330a	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5551-ad5f-f37e-a0f71b97e3ea	PL	POL	616	Poland 	Poljska	\N
00040000-5551-ad5f-c68d-b9832c5c2300	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5551-ad5f-0a50-1cb3412bb080	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5551-ad5f-aef7-bbc63805526a	QA	QAT	634	Qatar 	Katar	\N
00040000-5551-ad5f-bec9-9666ec0c3725	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5551-ad5f-17bc-3eb167e14ee5	RO	ROU	642	Romania 	Romunija	\N
00040000-5551-ad5f-9077-1ac5a17c34d9	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5551-ad5f-0f9c-f23350487380	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5551-ad5f-3f5d-66f49428f0f7	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5551-ad5f-c0a9-ec87b5999d21	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5551-ad5f-c8b8-5ce0039e18e9	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5551-ad5f-ac6e-13dfc868e8b2	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5551-ad5f-9123-302cea479161	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5551-ad5f-b4ad-e650921b0c2a	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5551-ad5f-4021-1e79ea73c812	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5551-ad5f-6dac-c9253200ae90	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5551-ad5f-85a7-c31093c5d63d	SM	SMR	674	San Marino 	San Marino	\N
00040000-5551-ad5f-2f8a-099865200754	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5551-ad5f-3fcd-37b0c4e32cd7	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5551-ad5f-46d4-0cf12f75b63e	SN	SEN	686	Senegal 	Senegal	\N
00040000-5551-ad5f-4d31-8c2df40835a2	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5551-ad5f-9b80-afc4c1f2561d	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5551-ad5f-cd4e-43e136bd163d	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5551-ad5f-e374-df846b348336	SG	SGP	702	Singapore 	Singapur	\N
00040000-5551-ad5f-8a76-2dfe9cc0da0a	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5551-ad5f-9515-7ff99b39de8d	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5551-ad5f-9e32-241d71ca0bbe	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5551-ad5f-2198-8c32c28c9b78	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5551-ad5f-b914-72ec090fe1ed	SO	SOM	706	Somalia 	Somalija	\N
00040000-5551-ad5f-d49f-a5313d35fc1a	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5551-ad5f-e7b1-b5cd6bc546cd	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5551-ad5f-12d1-04f25e6a2ab3	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5551-ad5f-95ce-44c17c4dce53	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5551-ad5f-eeae-486a80396f7c	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5551-ad5f-29bc-a3728045adb6	SD	SDN	729	Sudan 	Sudan	\N
00040000-5551-ad5f-12c3-8adf285b0435	SR	SUR	740	Suriname 	Surinam	\N
00040000-5551-ad5f-59bc-e357e8589284	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5551-ad5f-33f8-515d1383dd29	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5551-ad5f-a1ee-5f9947bdd111	SE	SWE	752	Sweden 	Švedska	\N
00040000-5551-ad5f-0c4b-8b35180a300f	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5551-ad5f-349a-a65b5475a277	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5551-ad5f-3030-3674a8b55be7	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5551-ad5f-7b8d-75417eb9aca9	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5551-ad5f-a851-d908b8174d61	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5551-ad5f-7f66-3ba47a915fa2	TH	THA	764	Thailand 	Tajska	\N
00040000-5551-ad5f-4350-1d5a7d3dc5e2	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5551-ad5f-79ca-9fe5f55874a3	TG	TGO	768	Togo 	Togo	\N
00040000-5551-ad5f-2653-0e482a8a7c9d	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5551-ad5f-7271-1b42c5e40bcd	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5551-ad5f-b789-bbec7f6bdbef	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5551-ad5f-a533-5221266faec0	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5551-ad5f-0655-8fd91eabb416	TR	TUR	792	Turkey 	Turčija	\N
00040000-5551-ad5f-1c43-28a3ea92efff	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5551-ad5f-9293-3a4672472c19	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5551-ad5f-80a1-6bf6ee4ff93e	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5551-ad5f-fd65-36a69a0a4b29	UG	UGA	800	Uganda 	Uganda	\N
00040000-5551-ad5f-661e-862a244940e6	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5551-ad5f-72c3-ccaa2888a702	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5551-ad5f-0390-ba411ad6e4fc	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5551-ad5f-b4eb-e742ed43c542	US	USA	840	United States 	Združene države Amerike	\N
00040000-5551-ad5f-9884-f89febbc3b19	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5551-ad5f-9c20-eb383a3a4667	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5551-ad5f-755d-afc68b68dcab	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5551-ad5f-f4c5-ad6ba949987f	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5551-ad5f-0448-70be000ebcec	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5551-ad5f-9143-4c91d04d4cf9	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5551-ad5f-b55f-8f0b7d41d611	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5551-ad5f-a729-5ac8db05bd62	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5551-ad5f-0540-06a7c14437fd	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5551-ad5f-bd59-ce530f590850	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5551-ad5f-8196-caac2c06d777	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5551-ad5f-2a32-d96a1718e78d	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5551-ad5f-bd18-c367a2feafb9	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2670 (class 0 OID 3112272)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 3112093)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 3112141)
-- Dependencies: 195
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2628 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2659 (class 0 OID 3112190)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 3112215)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 3112042)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5551-ad60-2d97-39ae22bb7e16	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5551-ad60-e30f-3c1586bdd315	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5551-ad60-4fbf-b0520ff77237	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5551-ad60-61e7-5874dac8988d	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5551-ad60-4f91-7a9b0dede024	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5551-ad60-e8e2-e6221f6c7454	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5551-ad60-a17d-477bdb330c0e	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5551-ad60-3829-f49dcaa4301b	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5551-ad60-1b89-4f1223a1fd93	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5551-ad60-3933-0a357c1c963c	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2638 (class 0 OID 3111950)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5551-ad60-7773-ffdc90f5bf3f	00000000-5551-ad60-4f91-7a9b0dede024	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5551-ad60-243c-194b9338887f	00000000-5551-ad60-4f91-7a9b0dede024	00010000-5551-ad5f-2318-96a11dd787e4	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5551-ad60-eb0b-5eddaf7cc036	00000000-5551-ad60-e8e2-e6221f6c7454	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2639 (class 0 OID 3111961)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 3112012)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 3111915)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5551-ad5f-1da9-df6b15772ab7	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5551-ad5f-946b-b16178e753f9	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5551-ad5f-2f46-33e55d6c9d3d	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5551-ad5f-fcd4-1ede9ad41776	Abonma-read	Abonma - branje	f
00030000-5551-ad5f-9f23-5d4ebb82b0b4	Abonma-write	Abonma - spreminjanje	f
00030000-5551-ad5f-ef73-277284b8dbac	Alternacija-read	Alternacija - branje	f
00030000-5551-ad5f-d431-6dc9487b6c68	Alternacija-write	Alternacija - spreminjanje	f
00030000-5551-ad5f-dad9-24370ab1490e	Arhivalija-read	Arhivalija - branje	f
00030000-5551-ad5f-1c02-3513848c22ea	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5551-ad5f-cff5-265f5d15060e	Besedilo-read	Besedilo - branje	f
00030000-5551-ad5f-51b6-b43bb4349446	Besedilo-write	Besedilo - spreminjanje	f
00030000-5551-ad5f-d9d3-44eda99cdd1a	DogodekIzven-read	DogodekIzven - branje	f
00030000-5551-ad5f-e15b-c97f96a3d113	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5551-ad5f-fb73-f03cb5e21e13	Dogodek-read	Dogodek - branje	f
00030000-5551-ad5f-e460-59c88aa351ed	Dogodek-write	Dogodek - spreminjanje	f
00030000-5551-ad5f-527a-baa58b8afafb	Drzava-read	Drzava - branje	f
00030000-5551-ad5f-683e-a2d009e32df4	Drzava-write	Drzava - spreminjanje	f
00030000-5551-ad5f-5114-ed5b7f3a35a4	Funkcija-read	Funkcija - branje	f
00030000-5551-ad5f-625a-3fdc00ba8371	Funkcija-write	Funkcija - spreminjanje	f
00030000-5551-ad5f-09ed-501f45f43a50	Gostovanje-read	Gostovanje - branje	f
00030000-5551-ad5f-51b8-b9bb600c5f98	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5551-ad5f-6333-a1664278d4e2	Gostujoca-read	Gostujoca - branje	f
00030000-5551-ad5f-5770-c13e87f30428	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5551-ad5f-6913-15cd5bcd3585	Kupec-read	Kupec - branje	f
00030000-5551-ad5f-e739-8b827ea1581b	Kupec-write	Kupec - spreminjanje	f
00030000-5551-ad5f-0ac5-70a574aebb5b	NacinPlacina-read	NacinPlacina - branje	f
00030000-5551-ad5f-3e50-d36675a7837b	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5551-ad5f-3249-279eb26746fc	Option-read	Option - branje	f
00030000-5551-ad5f-ba0b-9524c8e39b06	Option-write	Option - spreminjanje	f
00030000-5551-ad5f-2581-79c161bbcaea	OptionValue-read	OptionValue - branje	f
00030000-5551-ad5f-8a8d-f1b90bf593a6	OptionValue-write	OptionValue - spreminjanje	f
00030000-5551-ad5f-2225-f2e24e29668d	Oseba-read	Oseba - branje	f
00030000-5551-ad5f-2612-483e8a15a608	Oseba-write	Oseba - spreminjanje	f
00030000-5551-ad5f-d98b-2eba92cadf63	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5551-ad5f-7397-24890b8e1854	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5551-ad5f-2d71-5dcd1028e936	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5551-ad5f-93fd-47f9c7801822	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5551-ad5f-52b9-669cb16e8b9a	Pogodba-read	Pogodba - branje	f
00030000-5551-ad5f-5397-1216c593c420	Pogodba-write	Pogodba - spreminjanje	f
00030000-5551-ad5f-4b0c-24eae02ce17a	Popa-read	Popa - branje	f
00030000-5551-ad5f-df88-8ef118296ce1	Popa-write	Popa - spreminjanje	f
00030000-5551-ad5f-260b-6833b0d82d06	Posta-read	Posta - branje	f
00030000-5551-ad5f-6386-b831dc7dc83b	Posta-write	Posta - spreminjanje	f
00030000-5551-ad5f-b2c9-6b1c1e54046c	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5551-ad5f-b309-7ad6748da87f	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5551-ad5f-b4cf-3b22d8aeef36	PostniNaslov-read	PostniNaslov - branje	f
00030000-5551-ad5f-ae31-b11a58f0e506	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5551-ad5f-75ad-12e0eeccca80	Predstava-read	Predstava - branje	f
00030000-5551-ad5f-c54a-5d87ee248ff3	Predstava-write	Predstava - spreminjanje	f
00030000-5551-ad5f-793d-b29146af1243	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5551-ad5f-4654-670a23e98b01	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5551-ad5f-44b7-8addbfd7ac5c	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5551-ad5f-0913-79b9990232d5	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5551-ad5f-fe2c-5a6fd4363769	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5551-ad5f-7031-1340bcad865b	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5551-ad5f-5350-01194a3b94b6	Prostor-read	Prostor - branje	f
00030000-5551-ad5f-74e4-5440d9939f25	Prostor-write	Prostor - spreminjanje	f
00030000-5551-ad5f-5206-6d1e914cf120	Racun-read	Racun - branje	f
00030000-5551-ad5f-8679-71947927a32f	Racun-write	Racun - spreminjanje	f
00030000-5551-ad5f-8361-74c109d17629	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5551-ad5f-af17-e440a3dfdb88	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5551-ad5f-6936-fef511f45f22	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5551-ad5f-a29e-d672e488f767	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5551-ad5f-7da6-8ac704de4109	Rekvizit-read	Rekvizit - branje	f
00030000-5551-ad5f-555b-adb20991630f	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5551-ad5f-c926-10cd9d694b62	Rezervacija-read	Rezervacija - branje	f
00030000-5551-ad5f-620c-a77284ecfb22	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5551-ad5f-a2a4-c65aab1d70f5	SedezniRed-read	SedezniRed - branje	f
00030000-5551-ad5f-bf91-a00cff011dc2	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5551-ad5f-2838-a42ca9965299	Sedez-read	Sedez - branje	f
00030000-5551-ad5f-8f7f-aaf292e93a59	Sedez-write	Sedez - spreminjanje	f
00030000-5551-ad5f-1fc1-02b261df6fa1	Sezona-read	Sezona - branje	f
00030000-5551-ad5f-7dbb-7c414440eeac	Sezona-write	Sezona - spreminjanje	f
00030000-5551-ad5f-6158-bf1e9520eeb4	Telefonska-read	Telefonska - branje	f
00030000-5551-ad5f-f739-651f510248b0	Telefonska-write	Telefonska - spreminjanje	f
00030000-5551-ad5f-e2a5-08574d3233a5	TerminStoritve-read	TerminStoritve - branje	f
00030000-5551-ad5f-7f61-8b1ce667f697	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5551-ad5f-6123-d8d6d322bbc8	TipFunkcije-read	TipFunkcije - branje	f
00030000-5551-ad5f-d9ce-e2879ff11bbd	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5551-ad5f-c248-1cd33d608689	Trr-read	Trr - branje	f
00030000-5551-ad5f-b663-1bed2dbe1756	Trr-write	Trr - spreminjanje	f
00030000-5551-ad5f-e4f4-0ff4198c0a96	Uprizoritev-read	Uprizoritev - branje	f
00030000-5551-ad5f-33dd-7dcfcea0d1f8	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5551-ad5f-a882-8c694c9f67b5	Vaja-read	Vaja - branje	f
00030000-5551-ad5f-315d-4ebb0a7f6b19	Vaja-write	Vaja - spreminjanje	f
00030000-5551-ad5f-42d7-4b1c45c1311e	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5551-ad5f-2a4c-7c66d54cc1cc	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5551-ad5f-ddfd-d092d6b888a5	Zaposlitev-read	Zaposlitev - branje	f
00030000-5551-ad5f-3b1a-1f6043c9e8fc	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5551-ad5f-c030-ac3ff12fd6b4	Zasedenost-read	Zasedenost - branje	f
00030000-5551-ad5f-1008-f93d787f956d	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5551-ad5f-3eae-9bb530b8a063	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5551-ad5f-a298-4d92099f6731	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5551-ad5f-61a3-ce708e470b65	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5551-ad5f-22d3-8bdc0ca275f5	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2636 (class 0 OID 3111934)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5551-ad5f-4b5e-07aeafb55848	00030000-5551-ad5f-527a-baa58b8afafb
00020000-5551-ad5f-6307-69cd5bd33201	00030000-5551-ad5f-683e-a2d009e32df4
00020000-5551-ad5f-6307-69cd5bd33201	00030000-5551-ad5f-527a-baa58b8afafb
\.


--
-- TOC entry 2664 (class 0 OID 3112222)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 3112252)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 3112364)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 3111992)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 3112034)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5551-ad5f-7b53-e9a5810ce02d	8341	Adlešiči
00050000-5551-ad5f-79af-657b0084fe34	5270	Ajdovščina
00050000-5551-ad5f-621d-8b6e0404136f	6280	Ankaran/Ancarano
00050000-5551-ad5f-b37d-86f934757c53	9253	Apače
00050000-5551-ad5f-bdaa-d20d7cdd8375	8253	Artiče
00050000-5551-ad5f-4b1f-bd1f0b08f2c8	4275	Begunje na Gorenjskem
00050000-5551-ad5f-4e08-60191ff51fc3	1382	Begunje pri Cerknici
00050000-5551-ad5f-cdba-5dd1541ed998	9231	Beltinci
00050000-5551-ad5f-ee2c-e423899afcd9	2234	Benedikt
00050000-5551-ad5f-8ce1-f2453313379d	2345	Bistrica ob Dravi
00050000-5551-ad5f-5456-7f31d3ffb2b9	3256	Bistrica ob Sotli
00050000-5551-ad5f-8fbe-37cfa4dbe0e2	8259	Bizeljsko
00050000-5551-ad5f-12fd-88d4eb66fd32	1223	Blagovica
00050000-5551-ad5f-81c8-5180a831b08d	8283	Blanca
00050000-5551-ad5f-e1c6-d830dd092ac3	4260	Bled
00050000-5551-ad5f-b1a8-dee379dc8b3e	4273	Blejska Dobrava
00050000-5551-ad5f-11e9-0d25b8ae682b	9265	Bodonci
00050000-5551-ad5f-4f03-85c146882fe1	9222	Bogojina
00050000-5551-ad5f-4f78-e488bed2957f	4263	Bohinjska Bela
00050000-5551-ad5f-bd34-97a3d4fcb616	4264	Bohinjska Bistrica
00050000-5551-ad5f-be79-113dca2c79a0	4265	Bohinjsko jezero
00050000-5551-ad5f-d451-239407481075	1353	Borovnica
00050000-5551-ad5f-8e30-284b7b637f55	8294	Boštanj
00050000-5551-ad5f-1aa9-305c5c80357f	5230	Bovec
00050000-5551-ad5f-9cc6-044534ff8eab	5295	Branik
00050000-5551-ad5f-50a0-1bc0040b7677	3314	Braslovče
00050000-5551-ad5f-d5f5-9ec03eea7337	5223	Breginj
00050000-5551-ad5f-9136-1606e73504f8	8280	Brestanica
00050000-5551-ad5f-8204-d11719c97fb5	2354	Bresternica
00050000-5551-ad5f-d99a-d0812d27ac7f	4243	Brezje
00050000-5551-ad5f-8962-2386bb3702c0	1351	Brezovica pri Ljubljani
00050000-5551-ad5f-9c14-2e54da6cddf1	8250	Brežice
00050000-5551-ad5f-3af6-194c17a92f75	4210	Brnik - Aerodrom
00050000-5551-ad5f-e34c-31244f02dc3a	8321	Brusnice
00050000-5551-ad5f-e7eb-d89cd6a9ac6c	3255	Buče
00050000-5551-ad5f-28e8-02202002bf90	8276	Bučka 
00050000-5551-ad5f-ee3e-016040c56e39	9261	Cankova
00050000-5551-ad5f-70e6-6ff34c5abe19	3000	Celje 
00050000-5551-ad5f-2508-ea1c4364bf0d	3001	Celje - poštni predali
00050000-5551-ad5f-004d-1344614ae2c1	4207	Cerklje na Gorenjskem
00050000-5551-ad5f-2817-cbf9fa8627fb	8263	Cerklje ob Krki
00050000-5551-ad5f-6aff-66023287598b	1380	Cerknica
00050000-5551-ad5f-e0c1-06e105a36f5b	5282	Cerkno
00050000-5551-ad5f-7e30-77edaaa5682f	2236	Cerkvenjak
00050000-5551-ad5f-1a1f-fe6a15224ad5	2215	Ceršak
00050000-5551-ad5f-2d35-ea459952f568	2326	Cirkovce
00050000-5551-ad5f-3b75-4899ae055db4	2282	Cirkulane
00050000-5551-ad5f-3a7b-24e71ff0830f	5273	Col
00050000-5551-ad5f-9c14-cedc27d6b83d	8251	Čatež ob Savi
00050000-5551-ad5f-ae04-4e13d48cc036	1413	Čemšenik
00050000-5551-ad5f-ecae-a3f8321a72ba	5253	Čepovan
00050000-5551-ad5f-3857-4582b7372ad5	9232	Črenšovci
00050000-5551-ad5f-4776-b6809fe92e4e	2393	Črna na Koroškem
00050000-5551-ad5f-f239-ef19088e1fa0	6275	Črni Kal
00050000-5551-ad5f-3e8d-3a38ffddac36	5274	Črni Vrh nad Idrijo
00050000-5551-ad5f-8532-79edee95ae1f	5262	Črniče
00050000-5551-ad5f-6f5b-b0489d01112c	8340	Črnomelj
00050000-5551-ad5f-1268-559d165b7ea4	6271	Dekani
00050000-5551-ad5f-1bdf-471b7ac56354	5210	Deskle
00050000-5551-ad5f-739f-23bc083d6105	2253	Destrnik
00050000-5551-ad5f-ccb3-3816c78a3c4a	6215	Divača
00050000-5551-ad5f-4761-7500f7fda8f6	1233	Dob
00050000-5551-ad5f-7001-4c4864d45aaa	3224	Dobje pri Planini
00050000-5551-ad5f-0ef4-96d0f82065dc	8257	Dobova
00050000-5551-ad5f-e720-ee41b5b47513	1423	Dobovec
00050000-5551-ad5f-01f2-112851a61bf6	5263	Dobravlje
00050000-5551-ad5f-9d81-4c56e0fa37ac	3204	Dobrna
00050000-5551-ad5f-66b8-a556e26ca45f	8211	Dobrnič
00050000-5551-ad5f-efc9-100b4017727b	1356	Dobrova
00050000-5551-ad5f-33bc-0e7438c51c2c	9223	Dobrovnik/Dobronak 
00050000-5551-ad5f-4541-bcadcbad030c	5212	Dobrovo v Brdih
00050000-5551-ad5f-10f7-42e0b287f44d	1431	Dol pri Hrastniku
00050000-5551-ad5f-3319-3215a8148736	1262	Dol pri Ljubljani
00050000-5551-ad5f-d925-884c5a06d1e0	1273	Dole pri Litiji
00050000-5551-ad5f-2b09-d0c0f8e143d5	1331	Dolenja vas
00050000-5551-ad5f-bda2-41ca8ed415b7	8350	Dolenjske Toplice
00050000-5551-ad5f-814f-e33d0cc68d02	1230	Domžale
00050000-5551-ad5f-f4dd-29e9480469bc	2252	Dornava
00050000-5551-ad5f-e1b9-34bf0ed253c7	5294	Dornberk
00050000-5551-ad5f-75dd-b030e4880cc0	1319	Draga
00050000-5551-ad5f-11ad-d8ecd73ba31f	8343	Dragatuš
00050000-5551-ad5f-5fb3-25c3a93a12c4	3222	Dramlje
00050000-5551-ad5f-50e6-dd40d05628d2	2370	Dravograd
00050000-5551-ad5f-e0ab-8db0df07c141	4203	Duplje
00050000-5551-ad5f-e18c-46a5d2a4f3bd	6221	Dutovlje
00050000-5551-ad5f-af87-5547bf147ee4	8361	Dvor
00050000-5551-ad5f-4c34-bc5b3891dd03	2343	Fala
00050000-5551-ad5f-a5a2-cc5c32960ec9	9208	Fokovci
00050000-5551-ad5f-c0df-60b3f6981d06	2313	Fram
00050000-5551-ad5f-d1f5-ef5dca3d397c	3213	Frankolovo
00050000-5551-ad5f-a1bf-4a33f928f363	1274	Gabrovka
00050000-5551-ad5f-23e6-02fdbc59b1e6	8254	Globoko
00050000-5551-ad5f-b614-26a2052d638b	5275	Godovič
00050000-5551-ad5f-3e59-eb3b7e5cfdd6	4204	Golnik
00050000-5551-ad5f-abc6-d2cd71b1b284	3303	Gomilsko
00050000-5551-ad5f-7b18-546fb402810d	4224	Gorenja vas
00050000-5551-ad5f-3094-3a9b6397348f	3263	Gorica pri Slivnici
00050000-5551-ad5f-ee66-cebe535fd72e	2272	Gorišnica
00050000-5551-ad5f-521e-69ee73f96843	9250	Gornja Radgona
00050000-5551-ad5f-7773-8b2fade48c4f	3342	Gornji Grad
00050000-5551-ad5f-1bd1-7f19f4995745	4282	Gozd Martuljek
00050000-5551-ad5f-8ba1-bea124d88a83	6272	Gračišče
00050000-5551-ad5f-9994-3885d11b9635	9264	Grad
00050000-5551-ad5f-331f-1faa34b3f937	8332	Gradac
00050000-5551-ad5f-819b-e8681e222a5d	1384	Grahovo
00050000-5551-ad5f-19ea-1cdc156bd34f	5242	Grahovo ob Bači
00050000-5551-ad5f-1c2b-dd1aa5dd8682	5251	Grgar
00050000-5551-ad5f-3b65-d6066f447d9c	3302	Griže
00050000-5551-ad5f-84e9-14ee7520f2bb	3231	Grobelno
00050000-5551-ad5f-4a87-50ea3bbae06f	1290	Grosuplje
00050000-5551-ad5f-b100-c8dadfe1db1a	2288	Hajdina
00050000-5551-ad5f-74d1-0aa6522ee60c	8362	Hinje
00050000-5551-ad5f-0c9d-ccf42b040b0c	2311	Hoče
00050000-5551-ad5f-338b-f97a40b4655e	9205	Hodoš/Hodos
00050000-5551-ad5f-baef-b23d63da8fb0	1354	Horjul
00050000-5551-ad5f-fbc7-1296a6dba568	1372	Hotedršica
00050000-5551-ad5f-1161-6648d5b41866	1430	Hrastnik
00050000-5551-ad5f-a72c-5ceeebb3821d	6225	Hruševje
00050000-5551-ad5f-1c26-9a92203ff2bf	4276	Hrušica
00050000-5551-ad5f-64e3-f39255535ee2	5280	Idrija
00050000-5551-ad5f-a656-2b3c75a6794d	1292	Ig
00050000-5551-ad5f-3e7c-b3e25336f646	6250	Ilirska Bistrica
00050000-5551-ad5f-3776-7249f5712d87	6251	Ilirska Bistrica-Trnovo
00050000-5551-ad5f-1317-727f9b6bfcc0	1295	Ivančna Gorica
00050000-5551-ad5f-3da7-158fb97b583b	2259	Ivanjkovci
00050000-5551-ad5f-b460-f8a0ed35c005	1411	Izlake
00050000-5551-ad5f-978f-42f9cb7735f5	6310	Izola/Isola
00050000-5551-ad5f-2c08-a5bd60b4793b	2222	Jakobski Dol
00050000-5551-ad5f-e4b9-869045e364ee	2221	Jarenina
00050000-5551-ad5f-1152-dfcd0f685f3d	6254	Jelšane
00050000-5551-ad5f-34b8-227d4add348f	4270	Jesenice
00050000-5551-ad5f-6ada-9399f8c86c93	8261	Jesenice na Dolenjskem
00050000-5551-ad5f-e531-73fb87e16ca0	3273	Jurklošter
00050000-5551-ad5f-918b-58a7cf39db71	2223	Jurovski Dol
00050000-5551-ad5f-5a8a-e588a9c20a93	2256	Juršinci
00050000-5551-ad5f-5e92-6d2b3e1e88bb	5214	Kal nad Kanalom
00050000-5551-ad5f-84bd-0cebdcb2110e	3233	Kalobje
00050000-5551-ad5f-c6fd-e448e5c51dd7	4246	Kamna Gorica
00050000-5551-ad5f-a50f-61cf064fb96e	2351	Kamnica
00050000-5551-ad5f-105a-8848479dadd6	1241	Kamnik
00050000-5551-ad5f-8bcb-4cf1d5ccd28a	5213	Kanal
00050000-5551-ad5f-c72e-2cc89af3f08a	8258	Kapele
00050000-5551-ad5f-2695-9be0453f5c11	2362	Kapla
00050000-5551-ad5f-b504-1bdabc541144	2325	Kidričevo
00050000-5551-ad5f-2a95-fb2b137195df	1412	Kisovec
00050000-5551-ad5f-882e-3e0dee79d5cf	6253	Knežak
00050000-5551-ad5f-4e6d-14bda0cb9244	5222	Kobarid
00050000-5551-ad5f-7999-143bc73b7616	9227	Kobilje
00050000-5551-ad5f-70e8-3539e011470e	1330	Kočevje
00050000-5551-ad5f-9969-066966cbf939	1338	Kočevska Reka
00050000-5551-ad5f-6b2f-82b1740399f5	2276	Kog
00050000-5551-ad5f-c0c1-1e8748293c28	5211	Kojsko
00050000-5551-ad5f-ab54-e588ed5616f8	6223	Komen
00050000-5551-ad5f-e07d-23fe61f6322a	1218	Komenda
00050000-5551-ad5f-bebe-8b695f861de0	6000	Koper/Capodistria 
00050000-5551-ad5f-262f-43703b8c4a62	6001	Koper/Capodistria - poštni predali
00050000-5551-ad5f-069e-4823a46a22e4	8282	Koprivnica
00050000-5551-ad5f-afa0-bbf996628b7c	5296	Kostanjevica na Krasu
00050000-5551-ad5f-06c0-9f138ee7f05b	8311	Kostanjevica na Krki
00050000-5551-ad5f-0922-237115221f68	1336	Kostel
00050000-5551-ad5f-9cf2-0c649b3c2067	6256	Košana
00050000-5551-ad5f-7985-8ace79d8fced	2394	Kotlje
00050000-5551-ad5f-f013-3ff7d7a584dd	6240	Kozina
00050000-5551-ad5f-2632-e7cd4474b625	3260	Kozje
00050000-5551-ad5f-76fc-7e28162cc273	4000	Kranj 
00050000-5551-ad5f-394c-4e7799e112ae	4001	Kranj - poštni predali
00050000-5551-ad5f-88c1-d129b0e4dadd	4280	Kranjska Gora
00050000-5551-ad5f-71bb-a87d114b099a	1281	Kresnice
00050000-5551-ad5f-ec2d-036110c35216	4294	Križe
00050000-5551-ad5f-8502-4374a4cae387	9206	Križevci
00050000-5551-ad5f-99c5-12df16c3ce90	9242	Križevci pri Ljutomeru
00050000-5551-ad5f-6ab2-9efd92e1066a	1301	Krka
00050000-5551-ad5f-e3d4-b1210e6fcd69	8296	Krmelj
00050000-5551-ad5f-9870-fd82281795b8	4245	Kropa
00050000-5551-ad5f-0e97-9b48cf301629	8262	Krška vas
00050000-5551-ad5f-c270-2215f496fbc0	8270	Krško
00050000-5551-ad5f-cd4c-2f2c13704a77	9263	Kuzma
00050000-5551-ad5f-c9e8-c748f88a172f	2318	Laporje
00050000-5551-ad5f-6883-22398410dd7b	3270	Laško
00050000-5551-ad5f-c0ba-b7ae21776e37	1219	Laze v Tuhinju
00050000-5551-ad5f-c3b3-241044244dbe	2230	Lenart v Slovenskih goricah
00050000-5551-ad5f-86f5-3983817df973	9220	Lendava/Lendva
00050000-5551-ad5f-0f93-bc0e01bd7d69	4248	Lesce
00050000-5551-ad5f-e38e-0e72b1612170	3261	Lesično
00050000-5551-ad5f-1735-8134bf2f1489	8273	Leskovec pri Krškem
00050000-5551-ad5f-eec4-18ccaa5972e2	2372	Libeliče
00050000-5551-ad5f-1044-090a17d20072	2341	Limbuš
00050000-5551-ad5f-5154-e3ff1f662551	1270	Litija
00050000-5551-ad5f-c531-258412bfece5	3202	Ljubečna
00050000-5551-ad5f-ff20-3437c7507ad5	1000	Ljubljana 
00050000-5551-ad5f-cf64-ecbe269d2903	1001	Ljubljana - poštni predali
00050000-5551-ad5f-2f66-14dc88dfc8ed	1231	Ljubljana - Črnuče
00050000-5551-ad5f-0316-ae7ddc0a5d09	1261	Ljubljana - Dobrunje
00050000-5551-ad5f-f36c-dc50263a3f53	1260	Ljubljana - Polje
00050000-5551-ad5f-7121-3dc874fcec63	1210	Ljubljana - Šentvid
00050000-5551-ad5f-4f1f-b65028198dbf	1211	Ljubljana - Šmartno
00050000-5551-ad5f-0589-8c567daa9198	3333	Ljubno ob Savinji
00050000-5551-ad5f-de84-dbf1fdc6f049	9240	Ljutomer
00050000-5551-ad5f-dfea-5637578b0f5e	3215	Loče
00050000-5551-ad5f-4e00-bfe7811e4b32	5231	Log pod Mangartom
00050000-5551-ad5f-97ae-1ab19f67e983	1358	Log pri Brezovici
00050000-5551-ad5f-5980-5f8a48372e72	1370	Logatec
00050000-5551-ad5f-e8d8-02397a692f5a	1371	Logatec
00050000-5551-ad5f-1cd4-ad857cf553a9	1434	Loka pri Zidanem Mostu
00050000-5551-ad5f-3412-37c48934433d	3223	Loka pri Žusmu
00050000-5551-ad5f-596f-bd156c72826f	6219	Lokev
00050000-5551-ad5f-a96a-ac933d8b4d08	1318	Loški Potok
00050000-5551-ad5f-cf4f-a9c05a8c8553	2324	Lovrenc na Dravskem polju
00050000-5551-ad5f-99fd-ea3ae7590767	2344	Lovrenc na Pohorju
00050000-5551-ad5f-6dcf-3cbd0f539f33	3334	Luče
00050000-5551-ad5f-4f38-fc9d2cefa106	1225	Lukovica
00050000-5551-ad5f-0bd9-a0e780a9dc61	9202	Mačkovci
00050000-5551-ad5f-180f-86f17d7f6199	2322	Majšperk
00050000-5551-ad5f-899c-088fd12b56c8	2321	Makole
00050000-5551-ad5f-7a37-ae50d8cf70a3	9243	Mala Nedelja
00050000-5551-ad5f-9406-8556d6a84526	2229	Malečnik
00050000-5551-ad5f-3d5e-bbc258440495	6273	Marezige
00050000-5551-ad5f-4f26-99cad59021c6	2000	Maribor 
00050000-5551-ad5f-0558-049c9b543190	2001	Maribor - poštni predali
00050000-5551-ad5f-59c4-7483fd164e3b	2206	Marjeta na Dravskem polju
00050000-5551-ad5f-9559-0b790d858b44	2281	Markovci
00050000-5551-ad5f-e27f-213eb38bfd97	9221	Martjanci
00050000-5551-ad5f-6ce3-9e0ac7700286	6242	Materija
00050000-5551-ad5f-8b5b-088fdbc0e85f	4211	Mavčiče
00050000-5551-ad5f-3f28-f1b729d7ac60	1215	Medvode
00050000-5551-ad5f-e8b2-02eb5bafc45f	1234	Mengeš
00050000-5551-ad5f-6126-65346ef49cc2	8330	Metlika
00050000-5551-ad5f-a206-893f506386b2	2392	Mežica
00050000-5551-ad5f-889c-12bfe87ce27d	2204	Miklavž na Dravskem polju
00050000-5551-ad5f-9bae-a329716897b6	2275	Miklavž pri Ormožu
00050000-5551-ad5f-5ee8-4a10b7f32133	5291	Miren
00050000-5551-ad5f-fea2-200ecaf5155c	8233	Mirna
00050000-5551-ad5f-0213-4b7db9a89fbc	8216	Mirna Peč
00050000-5551-ad5f-f781-924a701efdd8	2382	Mislinja
00050000-5551-ad5f-986b-9252b09916c9	4281	Mojstrana
00050000-5551-ad5f-0db4-976df144379a	8230	Mokronog
00050000-5551-ad5f-c3d4-9687205e6125	1251	Moravče
00050000-5551-ad5f-1ce5-40267b596263	9226	Moravske Toplice
00050000-5551-ad5f-e883-b04e0512153b	5216	Most na Soči
00050000-5551-ad5f-68de-971da4291acb	1221	Motnik
00050000-5551-ad5f-7489-64ea3d607b02	3330	Mozirje
00050000-5551-ad5f-b642-54378f583e75	9000	Murska Sobota 
00050000-5551-ad5f-6476-571bb2a8c21b	9001	Murska Sobota - poštni predali
00050000-5551-ad5f-c920-5bc504344ced	2366	Muta
00050000-5551-ad5f-0cd8-fb14759d8cb1	4202	Naklo
00050000-5551-ad5f-546a-acb2606bb7dd	3331	Nazarje
00050000-5551-ad5f-1b0d-b960353a992d	1357	Notranje Gorice
00050000-5551-ad5f-94d0-ee3970cd19fd	3203	Nova Cerkev
00050000-5551-ad5f-9e44-78b48c9cd238	5000	Nova Gorica 
00050000-5551-ad5f-0bc8-ea80c67f66ea	5001	Nova Gorica - poštni predali
00050000-5551-ad5f-0ae6-497a1047ce15	1385	Nova vas
00050000-5551-ad5f-5ca2-eeec1f8c5c11	8000	Novo mesto
00050000-5551-ad5f-4f31-41d5a4cb2ece	8001	Novo mesto - poštni predali
00050000-5551-ad5f-2585-673cbb45f082	6243	Obrov
00050000-5551-ad5f-f2bf-9dbf4660a76b	9233	Odranci
00050000-5551-ad5f-6a67-8af26a11770f	2317	Oplotnica
00050000-5551-ad5f-e15e-e91b3b732b20	2312	Orehova vas
00050000-5551-ad5f-cbf5-c768377c197e	2270	Ormož
00050000-5551-ad5f-a0bf-d4a855b9bd9b	1316	Ortnek
00050000-5551-ad5f-b35b-9af5c78c542a	1337	Osilnica
00050000-5551-ad5f-7f55-62eed6407be9	8222	Otočec
00050000-5551-ad5f-9792-5e80447ad70d	2361	Ožbalt
00050000-5551-ad5f-2c28-834e1e470453	2231	Pernica
00050000-5551-ad5f-2047-a13ef329145f	2211	Pesnica pri Mariboru
00050000-5551-ad5f-711d-179c9647abe9	9203	Petrovci
00050000-5551-ad5f-09b8-66ca68f48409	3301	Petrovče
00050000-5551-ad5f-dbc8-597c4e96c9e2	6330	Piran/Pirano
00050000-5551-ad5f-7779-61b9f17123c4	8255	Pišece
00050000-5551-ad5f-27ee-ce29f69d82ad	6257	Pivka
00050000-5551-ad5f-ccf8-5bab163fd307	6232	Planina
00050000-5551-ad5f-d8d5-ae2b02cb4a3c	3225	Planina pri Sevnici
00050000-5551-ad5f-4d39-177dcddf82dd	6276	Pobegi
00050000-5551-ad5f-2809-87a31e8da882	8312	Podbočje
00050000-5551-ad5f-4386-995ebca9e597	5243	Podbrdo
00050000-5551-ad5f-d9eb-9da83ca55372	3254	Podčetrtek
00050000-5551-ad5f-a8d0-ae01692c0763	2273	Podgorci
00050000-5551-ad5f-bf0a-502cff373f41	6216	Podgorje
00050000-5551-ad5f-7c9f-954047deb696	2381	Podgorje pri Slovenj Gradcu
00050000-5551-ad5f-69f6-0dc099d249ba	6244	Podgrad
00050000-5551-ad5f-ca78-aea57c6a5ac0	1414	Podkum
00050000-5551-ad5f-25fa-622061d76a99	2286	Podlehnik
00050000-5551-ad5f-6446-499263d18e12	5272	Podnanos
00050000-5551-ad5f-1824-770ac5907830	4244	Podnart
00050000-5551-ad5f-f03c-adfd37857ef9	3241	Podplat
00050000-5551-ad5f-c0f1-89d54d8b8c30	3257	Podsreda
00050000-5551-ad5f-a972-b615ab6a47b4	2363	Podvelka
00050000-5551-ad5f-7719-dda7de011f6a	2208	Pohorje
00050000-5551-ad5f-f70d-c4b87ea9e59a	2257	Polenšak
00050000-5551-ad5f-a1d2-3f5973731d1a	1355	Polhov Gradec
00050000-5551-ad5f-cd36-8e9011766a10	4223	Poljane nad Škofjo Loko
00050000-5551-ad5f-3144-61260c6b02e6	2319	Poljčane
00050000-5551-ad5f-9f57-c7405f31d5df	1272	Polšnik
00050000-5551-ad5f-5c12-a080918e853e	3313	Polzela
00050000-5551-ad5f-a138-5109262fe7dc	3232	Ponikva
00050000-5551-ad5f-f296-4bcf20a3ca17	6320	Portorož/Portorose
00050000-5551-ad5f-85b3-1d8efc01b83c	6230	Postojna
00050000-5551-ad5f-5673-07adf7d5cc05	2331	Pragersko
00050000-5551-ad5f-0ef9-8061d42189c1	3312	Prebold
00050000-5551-ad5f-73cd-c2b8d957f69d	4205	Preddvor
00050000-5551-ad5f-f565-227dcd0ae9e6	6255	Prem
00050000-5551-ad5f-cc94-2fbfc35e837c	1352	Preserje
00050000-5551-ad5f-841f-f03fa3ac9730	6258	Prestranek
00050000-5551-ad5f-1a69-f82ca92a6dcc	2391	Prevalje
00050000-5551-ad5f-eabb-a76d97e77fd7	3262	Prevorje
00050000-5551-ad5f-1745-c95e6ba98c5f	1276	Primskovo 
00050000-5551-ad5f-db4a-c4d8cf433c8d	3253	Pristava pri Mestinju
00050000-5551-ad5f-8e5a-6df6804e74fc	9207	Prosenjakovci/Partosfalva
00050000-5551-ad5f-f1e9-276069608c8b	5297	Prvačina
00050000-5551-ad5f-2fc8-c1c2ee2d6238	2250	Ptuj
00050000-5551-ad5f-38cb-07dd2a89ff91	2323	Ptujska Gora
00050000-5551-ad5f-ebc4-316828762195	9201	Puconci
00050000-5551-ad5f-2286-a0c83dd51c9e	2327	Rače
00050000-5551-ad5f-7939-01b1ee1a8b7b	1433	Radeče
00050000-5551-ad5f-5da1-8f4833797f17	9252	Radenci
00050000-5551-ad5f-da07-85f2078c5e62	2360	Radlje ob Dravi
00050000-5551-ad5f-6534-4e22775e9fab	1235	Radomlje
00050000-5551-ad5f-f939-f34bc839842b	4240	Radovljica
00050000-5551-ad5f-702f-9b6a5dcfe531	8274	Raka
00050000-5551-ad5f-d541-74fba8acf8dd	1381	Rakek
00050000-5551-ad5f-a64b-1c32bfd4fbae	4283	Rateče - Planica
00050000-5551-ad5f-b96e-fd9888caedfd	2390	Ravne na Koroškem
00050000-5551-ad5f-dd96-9f360682c3bc	9246	Razkrižje
00050000-5551-ad5f-48cf-76347c4efe84	3332	Rečica ob Savinji
00050000-5551-ad5f-e275-4f6c32cf285a	5292	Renče
00050000-5551-ad5f-bbdb-8f0c8263df35	1310	Ribnica
00050000-5551-ad5f-5232-c4475d57cf28	2364	Ribnica na Pohorju
00050000-5551-ad5f-3971-5263bf8678eb	3272	Rimske Toplice
00050000-5551-ad5f-c798-89df500d310e	1314	Rob
00050000-5551-ad5f-f16f-9ac9734d2437	5215	Ročinj
00050000-5551-ad5f-6584-ae0c96883101	3250	Rogaška Slatina
00050000-5551-ad5f-3993-a9ad13ab329f	9262	Rogašovci
00050000-5551-ad5f-8b00-0805a128aa46	3252	Rogatec
00050000-5551-ad5f-e58f-d54af8219943	1373	Rovte
00050000-5551-ad5f-58f3-fbd0003b3a08	2342	Ruše
00050000-5551-ad5f-36a1-e127c018a04a	1282	Sava
00050000-5551-ad5f-cbd1-5573377d4690	6333	Sečovlje/Sicciole
00050000-5551-ad5f-4910-d5a1cb3722f8	4227	Selca
00050000-5551-ad5f-2bee-5250b80afeeb	2352	Selnica ob Dravi
00050000-5551-ad5f-892b-bc325dd6aa94	8333	Semič
00050000-5551-ad5f-593c-5def89bea5d0	8281	Senovo
00050000-5551-ad5f-d78a-5229736e342f	6224	Senožeče
00050000-5551-ad5f-165c-434a5cf12604	8290	Sevnica
00050000-5551-ad5f-561c-1399fa057452	6210	Sežana
00050000-5551-ad5f-0cf7-c23f440107c1	2214	Sladki Vrh
00050000-5551-ad5f-68ab-87e0324a9215	5283	Slap ob Idrijci
00050000-5551-ad5f-9227-d1d9f5cc962f	2380	Slovenj Gradec
00050000-5551-ad5f-767a-02996c47f7cc	2310	Slovenska Bistrica
00050000-5551-ad5f-67a5-2da4b18f79e6	3210	Slovenske Konjice
00050000-5551-ad5f-52f6-4297fc256f64	1216	Smlednik
00050000-5551-ad5f-5b79-789dd2a711f4	5232	Soča
00050000-5551-ad5f-f172-db2e4c48ec51	1317	Sodražica
00050000-5551-ad5f-655e-ed84f3e565e6	3335	Solčava
00050000-5551-ad5f-e344-60e347b7f9f2	5250	Solkan
00050000-5551-ad5f-43f4-5c04d75db741	4229	Sorica
00050000-5551-ad5f-43bc-852d5f0918d5	4225	Sovodenj
00050000-5551-ad5f-d7f1-62b210f862aa	5281	Spodnja Idrija
00050000-5551-ad5f-a289-3c67495c9fbc	2241	Spodnji Duplek
00050000-5551-ad5f-7e2e-d28de311476f	9245	Spodnji Ivanjci
00050000-5551-ad5f-0a96-e64b6ea031f5	2277	Središče ob Dravi
00050000-5551-ad5f-1818-40547e21af84	4267	Srednja vas v Bohinju
00050000-5551-ad5f-993f-502a7e31e810	8256	Sromlje 
00050000-5551-ad5f-e7c5-ecf037c3c7b3	5224	Srpenica
00050000-5551-ad5f-4b82-01a98c98e05d	1242	Stahovica
00050000-5551-ad5f-dd58-72301d8d2452	1332	Stara Cerkev
00050000-5551-ad5f-b878-ba4f31c48f7a	8342	Stari trg ob Kolpi
00050000-5551-ad5f-00f1-59bc2292affe	1386	Stari trg pri Ložu
00050000-5551-ad5f-c277-640d0649304c	2205	Starše
00050000-5551-ad5f-3812-56f60b5241fc	2289	Stoperce
00050000-5551-ad5f-ce71-1bddb882af56	8322	Stopiče
00050000-5551-ad5f-53c5-2d6294b27a58	3206	Stranice
00050000-5551-ad5f-e1fe-f1062c668dc3	8351	Straža
00050000-5551-ad5f-129a-53573c8003f4	1313	Struge
00050000-5551-ad5f-95d5-2c84e94a5f8d	8293	Studenec
00050000-5551-ad5f-886d-cbe06906f1ca	8331	Suhor
00050000-5551-ad5f-1cef-ca84107a2bce	2233	Sv. Ana v Slovenskih goricah
00050000-5551-ad5f-a9f6-992ec526b7f5	2235	Sv. Trojica v Slovenskih goricah
00050000-5551-ad5f-f264-a528c287d33c	2353	Sveti Duh na Ostrem Vrhu
00050000-5551-ad5f-b34e-6e05e693bb88	9244	Sveti Jurij ob Ščavnici
00050000-5551-ad5f-079f-481014f20399	3264	Sveti Štefan
00050000-5551-ad5f-e3be-1d68b022358e	2258	Sveti Tomaž
00050000-5551-ad5f-cf3d-3f9a4549c4dc	9204	Šalovci
00050000-5551-ad5f-a76b-078df1e39899	5261	Šempas
00050000-5551-ad5f-cce1-a12f312b2d4c	5290	Šempeter pri Gorici
00050000-5551-ad5f-1936-6555b79df2c7	3311	Šempeter v Savinjski dolini
00050000-5551-ad5f-8f4f-fcd107a0171d	4208	Šenčur
00050000-5551-ad5f-d045-92fc6267c913	2212	Šentilj v Slovenskih goricah
00050000-5551-ad5f-e953-e6148d466426	8297	Šentjanž
00050000-5551-ad5f-2e22-dfccd7970b54	2373	Šentjanž pri Dravogradu
00050000-5551-ad5f-d57b-fc22c8668401	8310	Šentjernej
00050000-5551-ad5f-259e-34df504fee6c	3230	Šentjur
00050000-5551-ad5f-a62a-1e061e42fc25	3271	Šentrupert
00050000-5551-ad5f-8894-3ac3b28bc670	8232	Šentrupert
00050000-5551-ad5f-55ac-9016c2a0c40d	1296	Šentvid pri Stični
00050000-5551-ad5f-31ae-8712e05a2f51	8275	Škocjan
00050000-5551-ad5f-cb8f-66d0357078fc	6281	Škofije
00050000-5551-ad5f-e091-804d389c4ade	4220	Škofja Loka
00050000-5551-ad5f-1f42-49c71404f30b	3211	Škofja vas
00050000-5551-ad5f-0674-afab5982d94b	1291	Škofljica
00050000-5551-ad5f-5dba-13e6b35922b3	6274	Šmarje
00050000-5551-ad5f-fc9e-eea8527f4c7a	1293	Šmarje - Sap
00050000-5551-ad5f-04aa-153d476b0f59	3240	Šmarje pri Jelšah
00050000-5551-ad5f-4c45-ed528148536a	8220	Šmarješke Toplice
00050000-5551-ad5f-f2a7-569a69013839	2315	Šmartno na Pohorju
00050000-5551-ad5f-e2c6-23743eacc290	3341	Šmartno ob Dreti
00050000-5551-ad5f-c4f4-f15c1a6587f9	3327	Šmartno ob Paki
00050000-5551-ad5f-4d2a-058611f036ad	1275	Šmartno pri Litiji
00050000-5551-ad5f-2dcf-48b4ff78252b	2383	Šmartno pri Slovenj Gradcu
00050000-5551-ad5f-db26-ffc351a5a22e	3201	Šmartno v Rožni dolini
00050000-5551-ad5f-5b6e-9fadaff685f8	3325	Šoštanj
00050000-5551-ad5f-d2d3-fbbb0cede9c8	6222	Štanjel
00050000-5551-ad5f-bcd9-b4ed6758b5a3	3220	Štore
00050000-5551-ad5f-af8f-369f42e062a5	3304	Tabor
00050000-5551-ad5f-6886-93bb0a94a0e7	3221	Teharje
00050000-5551-ad5f-cc7f-92358bf7684c	9251	Tišina
00050000-5551-ad5f-f758-1c290b3300f6	5220	Tolmin
00050000-5551-ad5f-d711-d85ec8a4bb1b	3326	Topolšica
00050000-5551-ad5f-c479-78351b1edef7	2371	Trbonje
00050000-5551-ad5f-8a1f-054aa9f8ba76	1420	Trbovlje
00050000-5551-ad5f-1eda-61659b5cfa60	8231	Trebelno 
00050000-5551-ad5f-1164-0e3b5edfb89c	8210	Trebnje
00050000-5551-ad5f-db23-ba5b5c704643	5252	Trnovo pri Gorici
00050000-5551-ad5f-e2ca-35e8702a5fb7	2254	Trnovska vas
00050000-5551-ad5f-221e-5e816b76f86b	1222	Trojane
00050000-5551-ad5f-dc23-a4fd0ea20226	1236	Trzin
00050000-5551-ad5f-58a6-61711b44777d	4290	Tržič
00050000-5551-ad5f-96ea-b941007df48f	8295	Tržišče
00050000-5551-ad5f-3b6f-144629bbe98b	1311	Turjak
00050000-5551-ad5f-3bf6-e2f9c2b140a0	9224	Turnišče
00050000-5551-ad5f-0205-543516691f8e	8323	Uršna sela
00050000-5551-ad5f-51ad-7f2d9e55f9b8	1252	Vače
00050000-5551-ad5f-831c-275e2d8e3280	3320	Velenje 
00050000-5551-ad5f-1778-39aded035ff2	3322	Velenje - poštni predali
00050000-5551-ad5f-cf50-34be00fd73fa	8212	Velika Loka
00050000-5551-ad5f-28f0-ec96ca748494	2274	Velika Nedelja
00050000-5551-ad5f-836f-39441306acae	9225	Velika Polana
00050000-5551-ad5f-1817-6f16dfd9a518	1315	Velike Lašče
00050000-5551-ad5f-7992-bb01cd3c0b3f	8213	Veliki Gaber
00050000-5551-ad5f-22fc-7207e7a7f779	9241	Veržej
00050000-5551-ad5f-1743-27b1bfb2729d	1312	Videm - Dobrepolje
00050000-5551-ad5f-2517-1707001d085c	2284	Videm pri Ptuju
00050000-5551-ad5f-a963-82a8fa4254c4	8344	Vinica
00050000-5551-ad5f-8a11-e28a694ee363	5271	Vipava
00050000-5551-ad5f-a38d-a9787c843a2a	4212	Visoko
00050000-5551-ad5f-9de7-9034cccc05cb	1294	Višnja Gora
00050000-5551-ad5f-01ca-0af4a0100c69	3205	Vitanje
00050000-5551-ad5f-2f5a-5695d0cc8aa9	2255	Vitomarci
00050000-5551-ad5f-ec5f-75376e31305b	1217	Vodice
00050000-5551-ad5f-264c-3b8116ec0e7b	3212	Vojnik\t
00050000-5551-ad5f-b09b-883887eaf42f	5293	Volčja Draga
00050000-5551-ad5f-e9f0-f15a3d858675	2232	Voličina
00050000-5551-ad5f-e42f-7b34e1d05a27	3305	Vransko
00050000-5551-ad5f-29e2-b93f1eef9e96	6217	Vremski Britof
00050000-5551-ad5f-c027-e022c6e9ef37	1360	Vrhnika
00050000-5551-ad5f-1bd0-7629aa64c6ec	2365	Vuhred
00050000-5551-ad5f-3727-1781cfd80d1a	2367	Vuzenica
00050000-5551-ad5f-3ca2-540dd527c68c	8292	Zabukovje 
00050000-5551-ad5f-5698-9e42da74806b	1410	Zagorje ob Savi
00050000-5551-ad5f-aa8d-9e5c9034c91d	1303	Zagradec
00050000-5551-ad5f-9a83-17db41ba93b0	2283	Zavrč
00050000-5551-ad5f-c8d6-7b0da2019957	8272	Zdole 
00050000-5551-ad5f-7a3f-0681ac1aa636	4201	Zgornja Besnica
00050000-5551-ad5f-8632-d4e254448eac	2242	Zgornja Korena
00050000-5551-ad5f-fddc-e61ea56861ed	2201	Zgornja Kungota
00050000-5551-ad5f-2cd8-5e1d47e122e4	2316	Zgornja Ložnica
00050000-5551-ad5f-e227-21cf9eb7dbdc	2314	Zgornja Polskava
00050000-5551-ad5f-409a-253a0a60f105	2213	Zgornja Velka
00050000-5551-ad5f-c735-478c895af293	4247	Zgornje Gorje
00050000-5551-ad5f-7281-bcfef37e4f52	4206	Zgornje Jezersko
00050000-5551-ad5f-ebb4-a7badf7aa347	2285	Zgornji Leskovec
00050000-5551-ad5f-a791-efbe1994f2de	1432	Zidani Most
00050000-5551-ad5f-2972-203ee3962d49	3214	Zreče
00050000-5551-ad5f-2a09-406e1b9c1e70	4209	Žabnica
00050000-5551-ad5f-1c86-8b9fd352a9ac	3310	Žalec
00050000-5551-ad5f-e765-96872d4adb20	4228	Železniki
00050000-5551-ad5f-81a5-70671f01cbe4	2287	Žetale
00050000-5551-ad5f-bdb3-4d79d143779a	4226	Žiri
00050000-5551-ad5f-3647-c71cde0c992f	4274	Žirovnica
00050000-5551-ad5f-4d8e-5b84cf764270	8360	Žužemberk
\.


--
-- TOC entry 2660 (class 0 OID 3112196)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 3112019)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 3112085)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 3112208)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 3112313)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 3112357)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 3112237)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 3112181)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 3112171)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 3112347)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 3112303)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 3111886)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5551-ad5f-2318-96a11dd787e4	00010000-5551-ad5f-aa62-dd49bcd8c2ec	2015-05-12 09:36:00	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO4kie3LoPnJeRVKe3JoQ0GO7iNOAC/uG";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2692 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2667 (class 0 OID 3112246)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 3111924)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5551-ad5f-a1e4-1bff9add35ec	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5551-ad5f-7fd9-e7d926b7bf5e	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5551-ad5f-4b5e-07aeafb55848	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5551-ad5f-b689-ee2f4460eee0	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5551-ad5f-7106-351453274c62	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5551-ad5f-6307-69cd5bd33201	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2633 (class 0 OID 3111908)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5551-ad5f-2318-96a11dd787e4	00020000-5551-ad5f-b689-ee2f4460eee0
00010000-5551-ad5f-aa62-dd49bcd8c2ec	00020000-5551-ad5f-b689-ee2f4460eee0
\.


--
-- TOC entry 2669 (class 0 OID 3112260)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 3112202)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 3112152)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 3111984)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 3112158)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 3112338)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 3112054)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 3111895)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5551-ad5f-aa62-dd49bcd8c2ec	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO9WKJxpR7fBpLYYDw2Pu8OW3kk5pE8zK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5551-ad5f-2318-96a11dd787e4	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2681 (class 0 OID 3112389)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 3112100)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 3112229)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 3112295)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 3112128)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2680 (class 0 OID 3112379)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 3112285)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2275 (class 2606 OID 3111949)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 3112429)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 3112422)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 3112337)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 3112118)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 3112151)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2311 (class 2606 OID 3112080)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 3112281)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2322 (class 2606 OID 3112098)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 3112145)
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
-- TOC entry 2365 (class 2606 OID 3112194)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 3112221)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 3112052)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2279 (class 2606 OID 3111958)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 3112016)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2281 (class 2606 OID 3111982)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2273 (class 2606 OID 3111938)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2266 (class 2606 OID 3111923)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 3112227)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 3112259)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 3112374)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 3112009)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2301 (class 2606 OID 3112040)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 3112200)
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
-- TOC entry 2299 (class 2606 OID 3112030)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2320 (class 2606 OID 3112089)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 3112212)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 3112319)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 3112362)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 3112244)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 3112185)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 3112176)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 3112356)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 3112310)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2258 (class 2606 OID 3111894)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 3112250)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2264 (class 2606 OID 3111912)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2268 (class 2606 OID 3111932)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 3112268)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 3112207)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 3112157)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2286 (class 2606 OID 3111989)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2351 (class 2606 OID 3112167)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 3112346)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2309 (class 2606 OID 3112065)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 3111907)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2436 (class 2606 OID 3112404)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 3112104)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 3112235)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 3112301)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 3112140)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 3112388)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 3112294)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 1259 OID 3112125)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2287 (class 1259 OID 3112011)
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
-- TOC entry 2378 (class 1259 OID 3112228)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2372 (class 1259 OID 3112214)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2373 (class 1259 OID 3112213)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2324 (class 1259 OID 3112105)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2399 (class 1259 OID 3112284)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2400 (class 1259 OID 3112282)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2401 (class 1259 OID 3112283)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2424 (class 1259 OID 3112376)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2425 (class 1259 OID 3112377)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2426 (class 1259 OID 3112378)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2432 (class 1259 OID 3112407)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2433 (class 1259 OID 3112406)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2434 (class 1259 OID 3112405)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2306 (class 1259 OID 3112067)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2307 (class 1259 OID 3112066)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2291 (class 1259 OID 3112018)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2292 (class 1259 OID 3112017)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 3112251)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2342 (class 1259 OID 3112146)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2270 (class 1259 OID 3111939)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2271 (class 1259 OID 3111940)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2392 (class 1259 OID 3112271)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2393 (class 1259 OID 3112270)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2394 (class 1259 OID 3112269)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2316 (class 1259 OID 3112090)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2317 (class 1259 OID 3112092)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2318 (class 1259 OID 3112091)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2352 (class 1259 OID 3112180)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2353 (class 1259 OID 3112178)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2354 (class 1259 OID 3112177)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2355 (class 1259 OID 3112179)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2261 (class 1259 OID 3111913)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2262 (class 1259 OID 3111914)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2381 (class 1259 OID 3112236)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2367 (class 1259 OID 3112201)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2407 (class 1259 OID 3112311)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2408 (class 1259 OID 3112312)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2295 (class 1259 OID 3112032)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2296 (class 1259 OID 3112031)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2297 (class 1259 OID 3112033)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2411 (class 1259 OID 3112320)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2412 (class 1259 OID 3112321)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2443 (class 1259 OID 3112432)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2444 (class 1259 OID 3112431)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2445 (class 1259 OID 3112434)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2446 (class 1259 OID 3112430)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2447 (class 1259 OID 3112433)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2404 (class 1259 OID 3112302)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2358 (class 1259 OID 3112189)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2359 (class 1259 OID 3112188)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2360 (class 1259 OID 3112186)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2361 (class 1259 OID 3112187)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2248 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2439 (class 1259 OID 3112424)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2440 (class 1259 OID 3112423)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2323 (class 1259 OID 3112099)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2276 (class 1259 OID 3111960)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2277 (class 1259 OID 3111959)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2283 (class 1259 OID 3111990)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2284 (class 1259 OID 3111991)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2347 (class 1259 OID 3112170)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2348 (class 1259 OID 3112169)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2349 (class 1259 OID 3112168)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2330 (class 1259 OID 3112127)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2331 (class 1259 OID 3112123)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2332 (class 1259 OID 3112120)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2333 (class 1259 OID 3112121)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2334 (class 1259 OID 3112119)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2335 (class 1259 OID 3112124)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2336 (class 1259 OID 3112122)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2290 (class 1259 OID 3112010)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 3112081)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2313 (class 1259 OID 3112083)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2314 (class 1259 OID 3112082)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2315 (class 1259 OID 3112084)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2366 (class 1259 OID 3112195)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2429 (class 1259 OID 3112375)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2282 (class 1259 OID 3111983)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2305 (class 1259 OID 3112053)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2386 (class 1259 OID 3112245)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2251 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 3112041)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2423 (class 1259 OID 3112363)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2269 (class 1259 OID 3111933)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2337 (class 1259 OID 3112126)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2472 (class 2606 OID 3112565)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2475 (class 2606 OID 3112550)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2474 (class 2606 OID 3112555)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2470 (class 2606 OID 3112575)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2476 (class 2606 OID 3112545)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2471 (class 2606 OID 3112570)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2473 (class 2606 OID 3112560)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2457 (class 2606 OID 3112480)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2493 (class 2606 OID 3112660)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2491 (class 2606 OID 3112655)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2492 (class 2606 OID 3112650)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2469 (class 2606 OID 3112540)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 3112700)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2501 (class 2606 OID 3112690)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2500 (class 2606 OID 3112695)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2489 (class 2606 OID 3112640)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2510 (class 2606 OID 3112735)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2509 (class 2606 OID 3112740)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2508 (class 2606 OID 3112745)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2511 (class 2606 OID 3112760)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2512 (class 2606 OID 3112755)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2513 (class 2606 OID 3112750)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2463 (class 2606 OID 3112515)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2464 (class 2606 OID 3112510)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2458 (class 2606 OID 3112490)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2459 (class 2606 OID 3112485)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2454 (class 2606 OID 3112465)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2495 (class 2606 OID 3112670)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2477 (class 2606 OID 3112580)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2451 (class 2606 OID 3112445)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2450 (class 2606 OID 3112450)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2496 (class 2606 OID 3112685)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2497 (class 2606 OID 3112680)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2498 (class 2606 OID 3112675)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2467 (class 2606 OID 3112520)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2465 (class 2606 OID 3112530)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2466 (class 2606 OID 3112525)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2481 (class 2606 OID 3112615)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2483 (class 2606 OID 3112605)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2484 (class 2606 OID 3112600)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2482 (class 2606 OID 3112610)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2449 (class 2606 OID 3112435)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2448 (class 2606 OID 3112440)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2494 (class 2606 OID 3112665)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2490 (class 2606 OID 3112645)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2504 (class 2606 OID 3112710)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2503 (class 2606 OID 3112715)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2461 (class 2606 OID 3112500)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2462 (class 2606 OID 3112495)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2460 (class 2606 OID 3112505)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 3112720)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2505 (class 2606 OID 3112725)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2518 (class 2606 OID 3112785)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2519 (class 2606 OID 3112780)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2516 (class 2606 OID 3112795)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2520 (class 2606 OID 3112775)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2517 (class 2606 OID 3112790)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2502 (class 2606 OID 3112705)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2485 (class 2606 OID 3112635)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2486 (class 2606 OID 3112630)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2488 (class 2606 OID 3112620)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2487 (class 2606 OID 3112625)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2514 (class 2606 OID 3112770)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2515 (class 2606 OID 3112765)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2468 (class 2606 OID 3112535)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2507 (class 2606 OID 3112730)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2452 (class 2606 OID 3112460)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2453 (class 2606 OID 3112455)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2456 (class 2606 OID 3112470)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2455 (class 2606 OID 3112475)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2478 (class 2606 OID 3112595)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2479 (class 2606 OID 3112590)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2480 (class 2606 OID 3112585)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-12 09:36:00 CEST

--
-- PostgreSQL database dump complete
--

