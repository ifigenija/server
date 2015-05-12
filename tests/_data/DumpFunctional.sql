--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-12 14:05:25 CEST

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
-- TOC entry 2693 (class 0 OID 0)
-- Dependencies: 226
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 3165354)
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
-- TOC entry 225 (class 1259 OID 3165841)
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
-- TOC entry 224 (class 1259 OID 3165824)
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
-- TOC entry 217 (class 1259 OID 3165735)
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
-- TOC entry 193 (class 1259 OID 3165519)
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
-- TOC entry 196 (class 1259 OID 3165560)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 3165481)
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
-- TOC entry 212 (class 1259 OID 3165685)
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
-- TOC entry 191 (class 1259 OID 3165506)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 3165554)
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
-- TOC entry 201 (class 1259 OID 3165603)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 3165628)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 3165455)
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
-- TOC entry 180 (class 1259 OID 3165363)
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
-- TOC entry 181 (class 1259 OID 3165374)
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
-- TOC entry 184 (class 1259 OID 3165425)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 3165328)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 3165347)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 3165635)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 3165665)
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
-- TOC entry 221 (class 1259 OID 3165780)
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
-- TOC entry 183 (class 1259 OID 3165405)
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
-- TOC entry 186 (class 1259 OID 3165447)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 3165609)
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
-- TOC entry 185 (class 1259 OID 3165432)
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
-- TOC entry 190 (class 1259 OID 3165498)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 3165621)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 3165726)
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
-- TOC entry 220 (class 1259 OID 3165773)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 3165650)
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
-- TOC entry 200 (class 1259 OID 3165594)
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
-- TOC entry 199 (class 1259 OID 3165584)
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
-- TOC entry 219 (class 1259 OID 3165763)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 3165716)
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
-- TOC entry 173 (class 1259 OID 3165299)
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
-- TOC entry 172 (class 1259 OID 3165297)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2694 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 3165659)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 3165337)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 3165321)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 3165673)
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
-- TOC entry 203 (class 1259 OID 3165615)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 3165565)
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
-- TOC entry 182 (class 1259 OID 3165397)
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
-- TOC entry 198 (class 1259 OID 3165571)
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
-- TOC entry 218 (class 1259 OID 3165751)
-- Name: tipfunkcije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipfunkcije (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis text,
    dovoliprekrivanje boolean,
    maxprekrivanj integer,
    nastopajoc boolean,
    imezenski character varying(255) DEFAULT NULL::character varying,
    podrocje character varying(255) DEFAULT NULL::character varying,
    pomembnost character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 3165467)
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
-- TOC entry 174 (class 1259 OID 3165308)
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
-- TOC entry 223 (class 1259 OID 3165805)
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
-- TOC entry 192 (class 1259 OID 3165513)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 3165642)
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
-- TOC entry 214 (class 1259 OID 3165708)
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
-- TOC entry 194 (class 1259 OID 3165541)
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
-- TOC entry 222 (class 1259 OID 3165795)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 3165698)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 3165302)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2640 (class 0 OID 3165354)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2686 (class 0 OID 3165841)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2685 (class 0 OID 3165824)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 3165735)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 3165519)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 3165560)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 3165481)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5551-ec84-4bb5-6313f3660d1d	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5551-ec84-b02e-83772a0f8db2	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5551-ec84-e719-fcb3653d4dfc	AL	ALB	008	Albania 	Albanija	\N
00040000-5551-ec84-d878-a5f5e79e01d9	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5551-ec84-ba4b-2f30d668e103	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5551-ec84-89ae-9383f2d5481f	AD	AND	020	Andorra 	Andora	\N
00040000-5551-ec84-4c32-8d34c8849aee	AO	AGO	024	Angola 	Angola	\N
00040000-5551-ec84-157a-5fa4d586fb84	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5551-ec84-59bb-9a20bb0a99ac	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5551-ec84-abe9-ac38ccb6a9b6	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5551-ec84-7003-1d3b00ee7d9a	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5551-ec84-3450-e2782ea6b48c	AM	ARM	051	Armenia 	Armenija	\N
00040000-5551-ec84-2c96-33f7321d91e4	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5551-ec84-4b1d-54777bb5a641	AU	AUS	036	Australia 	Avstralija	\N
00040000-5551-ec84-2883-aad0c269b115	AT	AUT	040	Austria 	Avstrija	\N
00040000-5551-ec84-62ac-f6df81349838	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5551-ec84-8030-4d34e5fcd22a	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5551-ec84-71da-54e9da0b742f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5551-ec84-dd43-cd496e3b720b	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5551-ec84-3cfd-aa6632a4b0f2	BB	BRB	052	Barbados 	Barbados	\N
00040000-5551-ec84-7443-bac7f52d91d5	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5551-ec84-8be5-6b08c2cf72b0	BE	BEL	056	Belgium 	Belgija	\N
00040000-5551-ec84-5162-1d71aafbf59c	BZ	BLZ	084	Belize 	Belize	\N
00040000-5551-ec84-5c07-74210b488f53	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5551-ec84-0587-e7815244b6b1	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5551-ec84-055f-1e7518eba8ec	BT	BTN	064	Bhutan 	Butan	\N
00040000-5551-ec84-0327-4fc532116edf	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5551-ec84-e97c-0d1254e5bb01	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5551-ec84-c9e5-0247b724f1ee	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5551-ec84-7a7a-2b470cf22adc	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5551-ec84-b7ab-783813dca890	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5551-ec84-6bb5-5cb988abdea7	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5551-ec84-6aaa-76d7def6da8f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5551-ec84-279b-f7a800007002	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5551-ec84-f105-a23d3c90198c	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5551-ec84-cf74-e4dca0921986	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5551-ec84-2a28-a18bb1533858	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5551-ec84-eec7-1f6aea3599a4	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5551-ec84-0929-7adceb933d48	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5551-ec84-a713-81da9de31ff9	CA	CAN	124	Canada 	Kanada	\N
00040000-5551-ec84-454e-79055637534d	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5551-ec84-c186-e9ee1dc579a2	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5551-ec84-3f1f-18d6f8d81e6d	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5551-ec84-f44c-ee05b6a06b70	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5551-ec84-0854-1bca0efa74d6	CL	CHL	152	Chile 	Čile	\N
00040000-5551-ec84-3d03-1e3b8d5b7d41	CN	CHN	156	China 	Kitajska	\N
00040000-5551-ec84-beca-e2ba386c9726	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5551-ec84-fc60-c5792f9bdcdb	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5551-ec84-edec-d0825212c7ff	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5551-ec84-2b8c-328b16b0a4aa	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5551-ec84-da20-18136639c4aa	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5551-ec84-aeff-fd0c9b269bab	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5551-ec84-8d6a-eb807b6e761d	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5551-ec84-869d-6890be7dc960	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5551-ec84-9bd9-f6a50cf1fda5	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5551-ec84-af51-c36b5a422159	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5551-ec84-6de0-8516b35e9104	CU	CUB	192	Cuba 	Kuba	\N
00040000-5551-ec84-ba6f-5f0841baa1d1	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5551-ec84-bdf4-33a4f05ce24a	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5551-ec84-49cc-7a3c9489a3c1	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5551-ec84-a701-18b1305796a3	DK	DNK	208	Denmark 	Danska	\N
00040000-5551-ec84-70ea-09e821bc5d1e	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5551-ec84-51d9-27db1682e160	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5551-ec84-7002-e44020d81d72	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5551-ec84-7a10-26e3392a2575	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5551-ec84-672d-a931a2fb193c	EG	EGY	818	Egypt 	Egipt	\N
00040000-5551-ec84-26b6-379e930b393d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5551-ec84-89f1-045436b42adc	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5551-ec84-37b1-44fadd45e34b	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5551-ec84-ca12-a18c7589740e	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5551-ec84-f59f-0a00fc2a111e	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5551-ec84-786b-4c924d2a2bf7	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5551-ec84-71e8-48dd7e1381cd	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5551-ec84-cd75-cd569a643b8d	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5551-ec84-8c5e-12f9ce884a3f	FI	FIN	246	Finland 	Finska	\N
00040000-5551-ec84-65d7-1622043f312f	FR	FRA	250	France 	Francija	\N
00040000-5551-ec84-6486-a3d27433c951	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5551-ec84-11bb-48954495d582	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5551-ec84-a02b-e65264f4ffc7	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5551-ec84-1291-84448afdfbb9	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5551-ec84-e027-3e6417a5afa7	GA	GAB	266	Gabon 	Gabon	\N
00040000-5551-ec84-4de6-0b22ee910f2e	GM	GMB	270	Gambia 	Gambija	\N
00040000-5551-ec84-c28f-e6f3b1114125	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5551-ec84-d450-e21391a47131	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5551-ec84-157b-4d65ea2c20ee	GH	GHA	288	Ghana 	Gana	\N
00040000-5551-ec84-89f8-013f740b62a9	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5551-ec84-bce4-f6ab6ebccb50	GR	GRC	300	Greece 	Grčija	\N
00040000-5551-ec84-94dd-79b62b3301c0	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5551-ec84-c1fe-fc832d7ed4de	GD	GRD	308	Grenada 	Grenada	\N
00040000-5551-ec84-d49b-276946b0ecba	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5551-ec84-7425-f07f83ba0214	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5551-ec84-9729-03e184972c5d	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5551-ec84-4be1-668087284424	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5551-ec84-15ce-504970ad52cf	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5551-ec84-5549-874ca11cac8d	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5551-ec84-b04c-4ed885cb3b3a	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5551-ec84-c755-fd3c53c70575	HT	HTI	332	Haiti 	Haiti	\N
00040000-5551-ec84-bde8-8609c057acdd	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5551-ec84-0f4d-e1bcf29cdc0a	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5551-ec84-cbe9-5ca1f255e2b3	HN	HND	340	Honduras 	Honduras	\N
00040000-5551-ec84-fe5e-ed737ebc8423	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5551-ec84-5958-99f138a978aa	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5551-ec84-8c2a-cc67633d8d66	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5551-ec84-7cf9-effa0e20f1d3	IN	IND	356	India 	Indija	\N
00040000-5551-ec84-1f71-c7cd5aae6d7c	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5551-ec84-6cc4-61543889494b	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5551-ec84-382a-2bd03e6bf047	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5551-ec84-29ac-c640d0b52e53	IE	IRL	372	Ireland 	Irska	\N
00040000-5551-ec84-d3c0-b0e75646dc37	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5551-ec84-83ec-a98aba99b379	IL	ISR	376	Israel 	Izrael	\N
00040000-5551-ec84-b125-871c0fdb498f	IT	ITA	380	Italy 	Italija	\N
00040000-5551-ec84-c923-d93b9c01e6a4	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5551-ec84-7975-fb29ea75304b	JP	JPN	392	Japan 	Japonska	\N
00040000-5551-ec84-8306-20654f479808	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5551-ec84-d3bd-338d0fa995ef	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5551-ec84-8867-9fed7d6219f3	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5551-ec84-c86f-d439a78f2a36	KE	KEN	404	Kenya 	Kenija	\N
00040000-5551-ec84-4779-df2000daef16	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5551-ec84-1804-b6c917526fa6	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5551-ec84-864f-62d4f0f353fb	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5551-ec84-a2a2-339c493a1096	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5551-ec84-2513-ca111948dd4a	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5551-ec84-2fe2-bc1a45818fca	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5551-ec84-94b0-2f26198390ee	LV	LVA	428	Latvia 	Latvija	\N
00040000-5551-ec84-7b6c-ebf33cde5355	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5551-ec84-74bd-e8a3aebc420d	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5551-ec84-ae7a-bf55f3e1a9bc	LR	LBR	430	Liberia 	Liberija	\N
00040000-5551-ec84-e989-3f805a2152b5	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5551-ec84-49b2-5a55a2f796ff	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5551-ec84-62bb-2453744668f8	LT	LTU	440	Lithuania 	Litva	\N
00040000-5551-ec84-7418-f17d94e2670b	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5551-ec84-1a97-1a5076ac104a	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5551-ec84-8a60-e92745fda0a4	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5551-ec84-ce93-7bd77ab66f72	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5551-ec84-5ddf-0c80fe69d6b5	MW	MWI	454	Malawi 	Malavi	\N
00040000-5551-ec84-1927-e66598e54b8b	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5551-ec84-c298-ab9ddc36fe5c	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5551-ec84-e4d2-962b41bdd462	ML	MLI	466	Mali 	Mali	\N
00040000-5551-ec84-bf71-12d728700561	MT	MLT	470	Malta 	Malta	\N
00040000-5551-ec84-ad94-58e258fa6030	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5551-ec84-aa78-de94bf9872f7	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5551-ec84-4875-3a064b211fef	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5551-ec84-fab8-633328ffc34c	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5551-ec84-0e1a-dfb4b51c9bdc	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5551-ec84-7b7d-4ee823484a8b	MX	MEX	484	Mexico 	Mehika	\N
00040000-5551-ec84-e169-bad188475c78	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5551-ec84-367e-28fa22e722dc	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5551-ec84-3e43-bfaa83d883e2	MC	MCO	492	Monaco 	Monako	\N
00040000-5551-ec84-993a-41cc9e0198a8	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5551-ec84-f595-1fa0f278573c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5551-ec84-5116-08d1e2973977	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5551-ec84-28b5-383b2b239706	MA	MAR	504	Morocco 	Maroko	\N
00040000-5551-ec84-09fc-7c0292861933	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5551-ec84-ad43-fae469903fa1	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5551-ec84-cd33-c2bcf1c0731b	NA	NAM	516	Namibia 	Namibija	\N
00040000-5551-ec84-2586-17b08efdc792	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5551-ec84-4cdd-a29f798c7351	NP	NPL	524	Nepal 	Nepal	\N
00040000-5551-ec84-234c-c52d9d316abe	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5551-ec84-16a8-41799099b30c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5551-ec84-34f2-4caad69f1263	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5551-ec84-b62c-fc1403d55774	NE	NER	562	Niger 	Niger 	\N
00040000-5551-ec84-ef08-8c51be25189c	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5551-ec84-c7a1-144b60167feb	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5551-ec84-b6b1-e5be20e8ae6d	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5551-ec84-7be9-60a7332c4df1	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5551-ec84-b1f6-bb54e2859b61	NO	NOR	578	Norway 	Norveška	\N
00040000-5551-ec84-168a-1ae58ea69594	OM	OMN	512	Oman 	Oman	\N
00040000-5551-ec84-fa0a-859ddca5645d	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5551-ec84-4c9b-fadb602be1f4	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5551-ec84-957c-31d94db44b3d	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5551-ec84-6a4a-339d3506c233	PA	PAN	591	Panama 	Panama	\N
00040000-5551-ec84-8c2f-8e711f573076	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5551-ec84-ce50-b0344af312e7	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5551-ec84-1900-85e5880fb246	PE	PER	604	Peru 	Peru	\N
00040000-5551-ec84-7446-31ba68af21e5	PH	PHL	608	Philippines 	Filipini	\N
00040000-5551-ec84-448a-831b5078375a	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5551-ec84-ecb1-68d1de04ad8f	PL	POL	616	Poland 	Poljska	\N
00040000-5551-ec84-de6e-05099f5e41b3	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5551-ec84-94fb-67c990d21303	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5551-ec84-3834-83149e44801f	QA	QAT	634	Qatar 	Katar	\N
00040000-5551-ec84-0455-dc5cefa93180	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5551-ec84-42ef-8f0af8ecf4c5	RO	ROU	642	Romania 	Romunija	\N
00040000-5551-ec84-1cf3-d775c17f9e22	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5551-ec84-3cb6-c998be16a735	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5551-ec84-57b3-5f6ad214d034	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5551-ec84-4785-20ffb3655554	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5551-ec84-10c8-5efd333b3c68	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5551-ec84-d254-22598cc32548	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5551-ec84-7eac-827f69066fe5	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5551-ec84-ed43-71ce549b0bee	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5551-ec84-c196-495bda83e222	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5551-ec84-611e-bbca7ed208b5	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5551-ec84-74f7-1de3a4ecc6b6	SM	SMR	674	San Marino 	San Marino	\N
00040000-5551-ec84-ce0a-1405fc82bc37	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5551-ec84-25a8-72b401161bb0	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5551-ec84-8d3b-7000c09490a9	SN	SEN	686	Senegal 	Senegal	\N
00040000-5551-ec84-5f3d-0230e6b5ac5d	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5551-ec84-cd08-593af4ec2aba	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5551-ec84-4348-6b7db6444f49	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5551-ec84-6215-4c3da00fff62	SG	SGP	702	Singapore 	Singapur	\N
00040000-5551-ec84-4d7a-9b6d8026a85c	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5551-ec84-2283-20fa29b59e58	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5551-ec84-6ca0-fd36879c8c48	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5551-ec84-9e14-8c06d2fc83ce	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5551-ec84-f0c5-c9f46b149038	SO	SOM	706	Somalia 	Somalija	\N
00040000-5551-ec84-8f86-989100946e05	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5551-ec84-e9ac-77b85f594990	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5551-ec84-ce9b-72c7847f084b	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5551-ec84-2fda-536095f2d472	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5551-ec84-5690-03619b1f9446	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5551-ec84-a103-88aca84dc5c0	SD	SDN	729	Sudan 	Sudan	\N
00040000-5551-ec84-5507-fad71c48dea9	SR	SUR	740	Suriname 	Surinam	\N
00040000-5551-ec84-03b9-b8391ec52df9	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5551-ec84-0b21-8af773c1d3be	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5551-ec84-675a-c1cfc6422df0	SE	SWE	752	Sweden 	Švedska	\N
00040000-5551-ec84-3aa9-0c7fa2fe57e3	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5551-ec84-794d-e1fa354c5d07	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5551-ec84-20b8-6bc4f4d9cfcd	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5551-ec84-5ed0-94aaf2e764f1	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5551-ec84-a5c4-5a51ed3ccddc	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5551-ec84-ce97-e858b5cb2a00	TH	THA	764	Thailand 	Tajska	\N
00040000-5551-ec84-5e3f-09c0b45b2061	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5551-ec84-e84e-146556e739a6	TG	TGO	768	Togo 	Togo	\N
00040000-5551-ec84-0963-c466700171e3	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5551-ec84-cf35-d58e816611a8	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5551-ec84-1e68-a4d3f9ab7574	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5551-ec84-7a1d-8094b97ea096	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5551-ec84-7361-9ccbe1316dde	TR	TUR	792	Turkey 	Turčija	\N
00040000-5551-ec84-f9a5-d2c3bdb0a60e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5551-ec84-ccdd-a9cc03942eb7	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5551-ec84-3ed1-a3509d23688c	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5551-ec84-1701-aac4a2311a51	UG	UGA	800	Uganda 	Uganda	\N
00040000-5551-ec84-2b2a-2cb31f41096f	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5551-ec84-8f76-1f5f4544c83b	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5551-ec84-2d4f-7782017317ec	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5551-ec84-a68e-b305da3ca2f3	US	USA	840	United States 	Združene države Amerike	\N
00040000-5551-ec84-2205-3a79fb0fc97c	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5551-ec84-f8f5-4e4d60642247	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5551-ec84-5444-f17c640e2c47	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5551-ec84-62e9-5a20f997c8cb	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5551-ec84-f561-ec0417e3adc6	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5551-ec84-7d1b-797409ad7334	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5551-ec84-10a1-2dbaa56c2c49	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5551-ec84-e766-01066daa3a69	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5551-ec84-7d1b-657881403580	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5551-ec84-a946-a801d30fd5b5	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5551-ec84-3985-e1320c864edc	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5551-ec84-cb63-1f56dafb9eb5	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5551-ec84-95b3-7c7ee59ab566	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2673 (class 0 OID 3165685)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 3165506)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 3165554)
-- Dependencies: 195
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 3165603)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 3165628)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 3165455)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5551-ec84-1937-db048a91485b	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5551-ec84-3e16-7ef83f055252	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5551-ec84-7ae9-df44357c5800	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5551-ec84-f2ec-0f3aed714c5e	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5551-ec84-fab9-4486a1d1b1ac	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5551-ec84-e65a-a88fb442cf45	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5551-ec84-0328-6a00dfedf72d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5551-ec84-b85b-6a5894f7b9a9	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5551-ec84-16e3-1e33d6cd795b	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5551-ec84-45d6-2d76d78e1e69	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2641 (class 0 OID 3165363)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5551-ec84-40b5-de55b01a546b	00000000-5551-ec84-fab9-4486a1d1b1ac	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5551-ec84-8296-c466100d977a	00000000-5551-ec84-fab9-4486a1d1b1ac	00010000-5551-ec84-a8fa-7ae3d03b35f9	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5551-ec84-2378-6d15b36c3bc2	00000000-5551-ec84-e65a-a88fb442cf45	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2642 (class 0 OID 3165374)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 3165425)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 3165328)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5551-ec84-fb93-a972152e39b1	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5551-ec84-add7-8795ad3855bb	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5551-ec84-03e3-bf5d846e9db4	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5551-ec84-1303-adf50b172bb5	Abonma-read	Abonma - branje	f
00030000-5551-ec84-ff9d-c3e80dcbda0a	Abonma-write	Abonma - spreminjanje	f
00030000-5551-ec84-35ce-c856b4c35d3b	Alternacija-read	Alternacija - branje	f
00030000-5551-ec84-5c57-38a4b7d081c8	Alternacija-write	Alternacija - spreminjanje	f
00030000-5551-ec84-3e29-3db722d5232c	Arhivalija-read	Arhivalija - branje	f
00030000-5551-ec84-c54f-0aca00ca5d0a	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5551-ec84-77d2-4d885429f315	Besedilo-read	Besedilo - branje	f
00030000-5551-ec84-581e-a50c5b003148	Besedilo-write	Besedilo - spreminjanje	f
00030000-5551-ec84-d240-81d8fd249b8d	DogodekIzven-read	DogodekIzven - branje	f
00030000-5551-ec84-fc2e-5e7b27b29042	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5551-ec84-8ffd-491f1cfae2b8	Dogodek-read	Dogodek - branje	f
00030000-5551-ec84-a3ba-dd8d04f9a22c	Dogodek-write	Dogodek - spreminjanje	f
00030000-5551-ec84-1fa0-f95d0f31339c	Drzava-read	Drzava - branje	f
00030000-5551-ec84-a3bd-352f719b51a7	Drzava-write	Drzava - spreminjanje	f
00030000-5551-ec84-b758-aff348dc2ef3	Funkcija-read	Funkcija - branje	f
00030000-5551-ec84-fad6-4739bc8f2b39	Funkcija-write	Funkcija - spreminjanje	f
00030000-5551-ec84-8ced-95d5d12d2a35	Gostovanje-read	Gostovanje - branje	f
00030000-5551-ec84-ce47-b5695eab348a	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5551-ec84-bba7-210c6528b479	Gostujoca-read	Gostujoca - branje	f
00030000-5551-ec84-7a6f-8f5ced283db7	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5551-ec84-0b3d-854a651cdac7	Kupec-read	Kupec - branje	f
00030000-5551-ec84-c606-03c68e411c28	Kupec-write	Kupec - spreminjanje	f
00030000-5551-ec84-82c1-a421254dd68c	NacinPlacina-read	NacinPlacina - branje	f
00030000-5551-ec84-a367-9b5fa12b8bc7	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5551-ec84-e7d3-12ec96552b8f	Option-read	Option - branje	f
00030000-5551-ec84-54e2-49262c27c715	Option-write	Option - spreminjanje	f
00030000-5551-ec84-76e0-a1eb0b997d90	OptionValue-read	OptionValue - branje	f
00030000-5551-ec84-128b-0c279b18d58f	OptionValue-write	OptionValue - spreminjanje	f
00030000-5551-ec84-e7ef-81602b27dc37	Oseba-read	Oseba - branje	f
00030000-5551-ec84-b957-cd789243cc0b	Oseba-write	Oseba - spreminjanje	f
00030000-5551-ec84-ee23-a5b8fc5c9581	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5551-ec84-d81e-5ba973d2cf78	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5551-ec84-7a7f-61392e1991b6	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5551-ec84-71d0-daa5fdc7f44e	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5551-ec84-3ae0-ee7d574a4b5b	Pogodba-read	Pogodba - branje	f
00030000-5551-ec84-f98c-82857c3de9a1	Pogodba-write	Pogodba - spreminjanje	f
00030000-5551-ec84-1a03-e65be5eae97a	Popa-read	Popa - branje	f
00030000-5551-ec84-35ba-b50453ce61a6	Popa-write	Popa - spreminjanje	f
00030000-5551-ec84-b4e7-813e919f237e	Posta-read	Posta - branje	f
00030000-5551-ec84-ac6b-644edfb5d1cf	Posta-write	Posta - spreminjanje	f
00030000-5551-ec84-ba9d-f201aa15d4b5	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5551-ec84-f564-8d1c4da906d6	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5551-ec84-ee02-2db1c4b3c3e4	PostniNaslov-read	PostniNaslov - branje	f
00030000-5551-ec84-7ee8-efbb7f64e27d	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5551-ec84-20a1-ac85d1c96c5a	Predstava-read	Predstava - branje	f
00030000-5551-ec84-3b0b-3ae23f27263b	Predstava-write	Predstava - spreminjanje	f
00030000-5551-ec84-7b6a-50ecb65b2dec	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5551-ec84-c175-2cc7396f840b	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5551-ec84-18f3-1b6d214ed6fe	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5551-ec84-f7f8-dabb7297e053	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5551-ec84-d034-29e4f5a2445d	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5551-ec84-bc8b-28484b16b8d9	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5551-ec84-1222-de56184ac493	Prostor-read	Prostor - branje	f
00030000-5551-ec84-e979-8591659de428	Prostor-write	Prostor - spreminjanje	f
00030000-5551-ec84-2bd7-e2c1384bbefd	Racun-read	Racun - branje	f
00030000-5551-ec84-88fd-545014da6578	Racun-write	Racun - spreminjanje	f
00030000-5551-ec84-3a38-2ab6e1ad3db6	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5551-ec84-80cd-6ecb0c59e3dd	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5551-ec84-078b-0c7b48639a9b	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5551-ec84-7efa-a727da7d9905	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5551-ec84-fcc0-9c28eb9dc1a0	Rekvizit-read	Rekvizit - branje	f
00030000-5551-ec84-a010-8e681617a102	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5551-ec84-51dc-154b7e79d32e	Rezervacija-read	Rezervacija - branje	f
00030000-5551-ec84-df6d-0e310b99d490	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5551-ec84-4987-2c771f515d49	SedezniRed-read	SedezniRed - branje	f
00030000-5551-ec84-2e7b-2d776ed41cdb	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5551-ec84-c7a9-a9c77695cbba	Sedez-read	Sedez - branje	f
00030000-5551-ec84-f9a7-e6013534763d	Sedez-write	Sedez - spreminjanje	f
00030000-5551-ec84-847b-0401f88d0fc5	Sezona-read	Sezona - branje	f
00030000-5551-ec84-b233-a9b75ee5dc91	Sezona-write	Sezona - spreminjanje	f
00030000-5551-ec84-7dc6-866ce2c428a3	Telefonska-read	Telefonska - branje	f
00030000-5551-ec84-4332-5c025a22a048	Telefonska-write	Telefonska - spreminjanje	f
00030000-5551-ec84-62e5-f3224a7f9d39	TerminStoritve-read	TerminStoritve - branje	f
00030000-5551-ec84-370c-6a1e41a1e94c	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5551-ec84-fae0-1d6a932ab4d3	TipFunkcije-read	TipFunkcije - branje	f
00030000-5551-ec84-09fb-37b9513e7a71	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5551-ec84-7457-232a34ed544b	Trr-read	Trr - branje	f
00030000-5551-ec84-ba2c-63172ea57ce9	Trr-write	Trr - spreminjanje	f
00030000-5551-ec84-a175-c247d48c7af5	Uprizoritev-read	Uprizoritev - branje	f
00030000-5551-ec84-a04a-8b3d01d4a9ee	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5551-ec84-dac4-d233d40aee62	Vaja-read	Vaja - branje	f
00030000-5551-ec84-b2c7-0acffc1eb542	Vaja-write	Vaja - spreminjanje	f
00030000-5551-ec84-ee66-864b8bf1464e	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5551-ec84-b05b-9991fd679431	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5551-ec84-34e4-4b9022dcc87f	Zaposlitev-read	Zaposlitev - branje	f
00030000-5551-ec84-a0ab-82b8b00087c6	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5551-ec84-6ce1-1d63f3635611	Zasedenost-read	Zasedenost - branje	f
00030000-5551-ec84-d6d4-816ae30429a0	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5551-ec84-c5d0-a78cefa69788	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5551-ec84-f843-ffaaa857121b	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5551-ec84-5d99-d63609465e65	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5551-ec84-835f-7dd8096afebf	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2639 (class 0 OID 3165347)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5551-ec84-44c3-fd09e9706b85	00030000-5551-ec84-1fa0-f95d0f31339c
00020000-5551-ec84-a826-9630887f6094	00030000-5551-ec84-a3bd-352f719b51a7
00020000-5551-ec84-a826-9630887f6094	00030000-5551-ec84-1fa0-f95d0f31339c
\.


--
-- TOC entry 2667 (class 0 OID 3165635)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 3165665)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 3165780)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 3165405)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 3165447)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5551-ec84-76ee-3a63329fae3f	8341	Adlešiči
00050000-5551-ec84-6c90-3827fb5e0e14	5270	Ajdovščina
00050000-5551-ec84-450c-c517b7ba2290	6280	Ankaran/Ancarano
00050000-5551-ec84-adc3-2bbb641e3818	9253	Apače
00050000-5551-ec84-7d06-86b82679088e	8253	Artiče
00050000-5551-ec84-9741-94a0c4d8b11b	4275	Begunje na Gorenjskem
00050000-5551-ec84-6c7b-c01dd52f7c51	1382	Begunje pri Cerknici
00050000-5551-ec84-accd-52dad6e4bc09	9231	Beltinci
00050000-5551-ec84-8d40-8bfa2aed35a0	2234	Benedikt
00050000-5551-ec84-10ee-5523ab5d33f9	2345	Bistrica ob Dravi
00050000-5551-ec84-e055-46fada198924	3256	Bistrica ob Sotli
00050000-5551-ec84-7403-8fcd44986756	8259	Bizeljsko
00050000-5551-ec84-c244-98029987ed2f	1223	Blagovica
00050000-5551-ec84-be64-c48d7c17cc32	8283	Blanca
00050000-5551-ec84-d545-eab675e71b17	4260	Bled
00050000-5551-ec84-184c-4224125c2627	4273	Blejska Dobrava
00050000-5551-ec84-ee65-b97905871c46	9265	Bodonci
00050000-5551-ec84-65eb-7aa61e65774f	9222	Bogojina
00050000-5551-ec84-bc4e-e95646da672e	4263	Bohinjska Bela
00050000-5551-ec84-6741-52ded7a56cd2	4264	Bohinjska Bistrica
00050000-5551-ec84-ebc6-fc1f5e978087	4265	Bohinjsko jezero
00050000-5551-ec84-04a2-51058ac9af56	1353	Borovnica
00050000-5551-ec84-7ef6-337f1d8c8c7d	8294	Boštanj
00050000-5551-ec84-e997-df0954d9f7de	5230	Bovec
00050000-5551-ec84-0712-2ebe30504e91	5295	Branik
00050000-5551-ec84-1137-f80997e87c0b	3314	Braslovče
00050000-5551-ec84-65eb-85987e312306	5223	Breginj
00050000-5551-ec84-a971-2ecf3fcb340c	8280	Brestanica
00050000-5551-ec84-ba95-1960f23e400a	2354	Bresternica
00050000-5551-ec84-ca56-cca0ae8c8959	4243	Brezje
00050000-5551-ec84-9dc9-cb2c9f76b875	1351	Brezovica pri Ljubljani
00050000-5551-ec84-aa52-d0710d8a1455	8250	Brežice
00050000-5551-ec84-2697-79d8e0d8f60c	4210	Brnik - Aerodrom
00050000-5551-ec84-c9e9-9383887a9c7a	8321	Brusnice
00050000-5551-ec84-1fff-2d646a373d6e	3255	Buče
00050000-5551-ec84-0020-a895e6234483	8276	Bučka 
00050000-5551-ec84-77a3-27ecb58f5c1b	9261	Cankova
00050000-5551-ec84-ead4-b26d7ed79723	3000	Celje 
00050000-5551-ec84-fd9e-e6c2cec3a39d	3001	Celje - poštni predali
00050000-5551-ec84-f286-471fc917ead6	4207	Cerklje na Gorenjskem
00050000-5551-ec84-bb26-7d2726e52b8e	8263	Cerklje ob Krki
00050000-5551-ec84-bd5e-8c55114f2a01	1380	Cerknica
00050000-5551-ec84-0eed-538ae11b0705	5282	Cerkno
00050000-5551-ec84-3830-18afef0236d9	2236	Cerkvenjak
00050000-5551-ec84-153f-d751241f7aaa	2215	Ceršak
00050000-5551-ec84-2100-65d214827132	2326	Cirkovce
00050000-5551-ec84-d134-4927212f9fda	2282	Cirkulane
00050000-5551-ec84-6068-fdba5cd831d1	5273	Col
00050000-5551-ec84-0d92-206b33169920	8251	Čatež ob Savi
00050000-5551-ec84-dade-dd6ae5795ae8	1413	Čemšenik
00050000-5551-ec84-d7a4-da29ee75b4c7	5253	Čepovan
00050000-5551-ec84-ab85-02949589f470	9232	Črenšovci
00050000-5551-ec84-1f67-9406f7f24e1d	2393	Črna na Koroškem
00050000-5551-ec84-4a05-6c415d2a78a6	6275	Črni Kal
00050000-5551-ec84-1bb5-a3c01aa2f7ba	5274	Črni Vrh nad Idrijo
00050000-5551-ec84-9368-4245c26529cd	5262	Črniče
00050000-5551-ec84-029d-face960aadf9	8340	Črnomelj
00050000-5551-ec84-6cb2-73c817bbe049	6271	Dekani
00050000-5551-ec84-f43f-61885fe22bc4	5210	Deskle
00050000-5551-ec84-b699-ef12a5ecf4ee	2253	Destrnik
00050000-5551-ec84-7683-a4a33a153236	6215	Divača
00050000-5551-ec84-1251-5bc270eb72dd	1233	Dob
00050000-5551-ec84-4465-ecdc85695b37	3224	Dobje pri Planini
00050000-5551-ec84-b47f-ac76c1c89c2e	8257	Dobova
00050000-5551-ec84-4012-de254246fae6	1423	Dobovec
00050000-5551-ec84-c73d-8ec1cb6dcd4a	5263	Dobravlje
00050000-5551-ec84-1a34-ca858093b127	3204	Dobrna
00050000-5551-ec84-6234-a6af977c7185	8211	Dobrnič
00050000-5551-ec84-d700-89b21c8134dc	1356	Dobrova
00050000-5551-ec84-055d-cb96de09336d	9223	Dobrovnik/Dobronak 
00050000-5551-ec84-5302-21509de9e1ad	5212	Dobrovo v Brdih
00050000-5551-ec84-0a56-a635e4794409	1431	Dol pri Hrastniku
00050000-5551-ec84-b46e-b66abfa896c7	1262	Dol pri Ljubljani
00050000-5551-ec84-45e0-cbe85720066e	1273	Dole pri Litiji
00050000-5551-ec84-792a-6cbad0aa35bb	1331	Dolenja vas
00050000-5551-ec84-4a18-913289cf0b90	8350	Dolenjske Toplice
00050000-5551-ec84-a6b5-530bbed6d189	1230	Domžale
00050000-5551-ec84-89a1-79cd2d06bcb0	2252	Dornava
00050000-5551-ec84-29a1-4a202c2f8290	5294	Dornberk
00050000-5551-ec84-e333-d6bd4837abaf	1319	Draga
00050000-5551-ec84-aeec-110f3cab0132	8343	Dragatuš
00050000-5551-ec84-a08d-9303c2241882	3222	Dramlje
00050000-5551-ec84-2e40-66506d1b8811	2370	Dravograd
00050000-5551-ec84-58fc-1e8cb2defe04	4203	Duplje
00050000-5551-ec84-e74a-9206cea3e4be	6221	Dutovlje
00050000-5551-ec84-5b39-77aac93698c0	8361	Dvor
00050000-5551-ec84-84c3-9b0c82ba7a4d	2343	Fala
00050000-5551-ec84-514e-02b5cc7ae62c	9208	Fokovci
00050000-5551-ec84-5840-099a1d5f0e7e	2313	Fram
00050000-5551-ec84-19b9-87cc477e482a	3213	Frankolovo
00050000-5551-ec84-fd26-c330329f6cc3	1274	Gabrovka
00050000-5551-ec84-406c-4fc468258058	8254	Globoko
00050000-5551-ec84-09b0-ceac5abd2d18	5275	Godovič
00050000-5551-ec84-8060-a6f1839273f0	4204	Golnik
00050000-5551-ec84-0784-63e0de58e80f	3303	Gomilsko
00050000-5551-ec84-990a-a1dea49694a8	4224	Gorenja vas
00050000-5551-ec84-54f7-bc20d7d43376	3263	Gorica pri Slivnici
00050000-5551-ec84-dc81-54551e726031	2272	Gorišnica
00050000-5551-ec84-0638-6e74fc3e790b	9250	Gornja Radgona
00050000-5551-ec84-854b-3ddbb0681f54	3342	Gornji Grad
00050000-5551-ec84-d4e9-20d3226f64b7	4282	Gozd Martuljek
00050000-5551-ec84-5d4e-b7154d38d68d	6272	Gračišče
00050000-5551-ec84-bc79-bd02e34fa7d9	9264	Grad
00050000-5551-ec84-0951-14e0ab2780ec	8332	Gradac
00050000-5551-ec84-fe57-a929f5811c34	1384	Grahovo
00050000-5551-ec84-7356-643a6c52b482	5242	Grahovo ob Bači
00050000-5551-ec84-d76d-bea55ad52f51	5251	Grgar
00050000-5551-ec84-b2c0-11e568a3ccac	3302	Griže
00050000-5551-ec84-5bd9-efd7df336aa1	3231	Grobelno
00050000-5551-ec84-a1aa-aae2ad786764	1290	Grosuplje
00050000-5551-ec84-48fd-71f3e230ebae	2288	Hajdina
00050000-5551-ec84-057a-3802bb9ce7f3	8362	Hinje
00050000-5551-ec84-ac15-84d8bd1d2539	2311	Hoče
00050000-5551-ec84-a9eb-028f9519147a	9205	Hodoš/Hodos
00050000-5551-ec84-3a53-e30d1d5c6209	1354	Horjul
00050000-5551-ec84-46fd-c65401d214c7	1372	Hotedršica
00050000-5551-ec84-bd4a-d4c464895c78	1430	Hrastnik
00050000-5551-ec84-b45f-278c60773a36	6225	Hruševje
00050000-5551-ec84-084e-9961b04b55f5	4276	Hrušica
00050000-5551-ec84-ff2f-3b6ab3224a07	5280	Idrija
00050000-5551-ec84-0c75-2a0c6ea37fe4	1292	Ig
00050000-5551-ec84-cf8b-c9e66639e115	6250	Ilirska Bistrica
00050000-5551-ec84-6243-66ad3e43d4c1	6251	Ilirska Bistrica-Trnovo
00050000-5551-ec84-0458-8f78d60f3765	1295	Ivančna Gorica
00050000-5551-ec84-22a4-8c6f8f1f0010	2259	Ivanjkovci
00050000-5551-ec84-b814-2c212223d621	1411	Izlake
00050000-5551-ec84-37b9-199ed472c9c1	6310	Izola/Isola
00050000-5551-ec84-5bb5-7a029276a11d	2222	Jakobski Dol
00050000-5551-ec84-4ab0-3dee4d8d1da8	2221	Jarenina
00050000-5551-ec84-8383-41f3669fe18a	6254	Jelšane
00050000-5551-ec84-6ba8-0a9349c4eb3e	4270	Jesenice
00050000-5551-ec84-0c88-7d66fba71bbc	8261	Jesenice na Dolenjskem
00050000-5551-ec84-9d15-3a06bd2f4ccd	3273	Jurklošter
00050000-5551-ec84-2137-ec6e7db997a2	2223	Jurovski Dol
00050000-5551-ec84-ef92-f7ca1b70991f	2256	Juršinci
00050000-5551-ec84-cdc9-d05c3d389d38	5214	Kal nad Kanalom
00050000-5551-ec84-1a50-89e1076e8025	3233	Kalobje
00050000-5551-ec84-7c9a-5b095a478014	4246	Kamna Gorica
00050000-5551-ec84-9aba-0932919d8c95	2351	Kamnica
00050000-5551-ec84-a5ef-f4954c1ce83a	1241	Kamnik
00050000-5551-ec84-1700-71aab73d9240	5213	Kanal
00050000-5551-ec84-e847-dc625c1d8bfa	8258	Kapele
00050000-5551-ec84-cb7f-4bfd65261af5	2362	Kapla
00050000-5551-ec84-1bb8-fc16a1c3a37f	2325	Kidričevo
00050000-5551-ec84-c950-9bc2d42abf06	1412	Kisovec
00050000-5551-ec84-b9b4-aec40cb07b12	6253	Knežak
00050000-5551-ec84-fd96-8c10a8a78051	5222	Kobarid
00050000-5551-ec84-956c-8fd495860a86	9227	Kobilje
00050000-5551-ec84-5285-d5d56dda1b90	1330	Kočevje
00050000-5551-ec84-2583-e42519121508	1338	Kočevska Reka
00050000-5551-ec84-8f01-4f309fe05ac6	2276	Kog
00050000-5551-ec84-3ec6-d8e201fe32ef	5211	Kojsko
00050000-5551-ec84-53da-b989030392a6	6223	Komen
00050000-5551-ec84-58cd-dfd61aa6799f	1218	Komenda
00050000-5551-ec84-fd7e-72dba3f59e05	6000	Koper/Capodistria 
00050000-5551-ec84-5eac-01c1c121d937	6001	Koper/Capodistria - poštni predali
00050000-5551-ec84-24cc-602131a8c28c	8282	Koprivnica
00050000-5551-ec84-965b-21155c83a590	5296	Kostanjevica na Krasu
00050000-5551-ec84-9c76-bcf61082ac5a	8311	Kostanjevica na Krki
00050000-5551-ec84-fc0c-d0b04964deb7	1336	Kostel
00050000-5551-ec84-8531-fff95a44fec3	6256	Košana
00050000-5551-ec84-675e-e9a935c311cf	2394	Kotlje
00050000-5551-ec84-7109-ac6d06e446ea	6240	Kozina
00050000-5551-ec84-d1d5-992e2ab88599	3260	Kozje
00050000-5551-ec84-6de8-ed85131a9fc9	4000	Kranj 
00050000-5551-ec84-8ace-d3b819b58141	4001	Kranj - poštni predali
00050000-5551-ec84-5ce4-7bfe5c62afca	4280	Kranjska Gora
00050000-5551-ec84-fae2-6a6590b998ab	1281	Kresnice
00050000-5551-ec84-24a2-e53a7038b4c3	4294	Križe
00050000-5551-ec84-a8dd-91256756721c	9206	Križevci
00050000-5551-ec84-4850-01a04b8e8d15	9242	Križevci pri Ljutomeru
00050000-5551-ec84-cb72-0b55a4ad66f9	1301	Krka
00050000-5551-ec84-67bb-8f54d29b71ec	8296	Krmelj
00050000-5551-ec84-561b-15a6cf0ad72b	4245	Kropa
00050000-5551-ec84-4b1c-6dc46bda82e5	8262	Krška vas
00050000-5551-ec84-ed81-4e889af6b699	8270	Krško
00050000-5551-ec84-97c4-32b27a6682f9	9263	Kuzma
00050000-5551-ec84-32b0-b68b17d1dbbb	2318	Laporje
00050000-5551-ec84-878b-6ee7555bb8da	3270	Laško
00050000-5551-ec84-8471-37f65c85be4b	1219	Laze v Tuhinju
00050000-5551-ec84-7ce5-b47a25843244	2230	Lenart v Slovenskih goricah
00050000-5551-ec84-f3ad-62b48a26c63f	9220	Lendava/Lendva
00050000-5551-ec84-b550-d5843519498b	4248	Lesce
00050000-5551-ec84-1c10-25d02304b4c9	3261	Lesično
00050000-5551-ec84-64e6-11e7c46e76bb	8273	Leskovec pri Krškem
00050000-5551-ec84-33b6-59f4cacc4a0a	2372	Libeliče
00050000-5551-ec84-584a-5928fd36c451	2341	Limbuš
00050000-5551-ec84-900a-de10624f6eb8	1270	Litija
00050000-5551-ec84-2c52-dea44a0a54c7	3202	Ljubečna
00050000-5551-ec84-5d7a-9cbd5c446630	1000	Ljubljana 
00050000-5551-ec84-7952-829ab4a1bdf2	1001	Ljubljana - poštni predali
00050000-5551-ec84-0db9-1b8dcbc568e3	1231	Ljubljana - Črnuče
00050000-5551-ec84-61f3-2aa321e127f9	1261	Ljubljana - Dobrunje
00050000-5551-ec84-deb0-a3932a7e2495	1260	Ljubljana - Polje
00050000-5551-ec84-8e1e-5f564b4b1a14	1210	Ljubljana - Šentvid
00050000-5551-ec84-6b4e-ca1cc2885a0e	1211	Ljubljana - Šmartno
00050000-5551-ec84-d777-6ed9006f0592	3333	Ljubno ob Savinji
00050000-5551-ec84-e486-ade8ce563206	9240	Ljutomer
00050000-5551-ec84-a4ba-ab2e36d950be	3215	Loče
00050000-5551-ec84-77af-68e1b4bb0e10	5231	Log pod Mangartom
00050000-5551-ec84-0c6d-e519151999b3	1358	Log pri Brezovici
00050000-5551-ec84-209f-66d279e699bc	1370	Logatec
00050000-5551-ec84-442f-a440466f4ceb	1371	Logatec
00050000-5551-ec84-094e-9dc829fa9097	1434	Loka pri Zidanem Mostu
00050000-5551-ec84-b3d1-05ae12deca1b	3223	Loka pri Žusmu
00050000-5551-ec84-8e03-bddc5b9dce3c	6219	Lokev
00050000-5551-ec84-e5dd-1363c48f23df	1318	Loški Potok
00050000-5551-ec84-f67e-cdeffbae9ba6	2324	Lovrenc na Dravskem polju
00050000-5551-ec84-2b87-fa87e7adc472	2344	Lovrenc na Pohorju
00050000-5551-ec84-4430-91a7ddef6892	3334	Luče
00050000-5551-ec84-be88-250a0728e414	1225	Lukovica
00050000-5551-ec84-623e-7c95ebfbf422	9202	Mačkovci
00050000-5551-ec84-7dd8-98e8361d5730	2322	Majšperk
00050000-5551-ec84-d25d-1d53ccc26354	2321	Makole
00050000-5551-ec84-3543-eb2137147671	9243	Mala Nedelja
00050000-5551-ec84-12d3-e9b979d36f64	2229	Malečnik
00050000-5551-ec84-101a-e43b5fcc4ae4	6273	Marezige
00050000-5551-ec84-a5bd-ae83303befca	2000	Maribor 
00050000-5551-ec84-afcf-ffddb3134386	2001	Maribor - poštni predali
00050000-5551-ec84-aace-b3d79f8cd0a8	2206	Marjeta na Dravskem polju
00050000-5551-ec84-d0b4-4e711b813f0b	2281	Markovci
00050000-5551-ec84-8136-38b15813e8d4	9221	Martjanci
00050000-5551-ec84-662c-9bc912f5b8bf	6242	Materija
00050000-5551-ec84-bd8a-b9988372ef90	4211	Mavčiče
00050000-5551-ec84-36bd-2119480f4d33	1215	Medvode
00050000-5551-ec84-30d0-dbfbc32c1c67	1234	Mengeš
00050000-5551-ec84-6241-71e3c70b8736	8330	Metlika
00050000-5551-ec84-b9ea-cefa3f5c0327	2392	Mežica
00050000-5551-ec84-84a7-29b8b8b1e84e	2204	Miklavž na Dravskem polju
00050000-5551-ec84-abce-b3296571350b	2275	Miklavž pri Ormožu
00050000-5551-ec84-dfea-55bf281a920d	5291	Miren
00050000-5551-ec84-ea06-cd58bfc869aa	8233	Mirna
00050000-5551-ec84-a16f-eb1c0ec2c88c	8216	Mirna Peč
00050000-5551-ec84-30ed-df063b623a02	2382	Mislinja
00050000-5551-ec84-cd5c-b219fac3d39c	4281	Mojstrana
00050000-5551-ec84-bafc-ea1709322e3b	8230	Mokronog
00050000-5551-ec84-4db0-a8823f63a66b	1251	Moravče
00050000-5551-ec84-3e2a-b744c45da40b	9226	Moravske Toplice
00050000-5551-ec84-fee3-16109f2154f8	5216	Most na Soči
00050000-5551-ec84-5ab5-47c82c380a71	1221	Motnik
00050000-5551-ec84-fa34-72db6a5e17d2	3330	Mozirje
00050000-5551-ec84-3388-27d221f6c26d	9000	Murska Sobota 
00050000-5551-ec84-cc17-05d3a921a4eb	9001	Murska Sobota - poštni predali
00050000-5551-ec84-aaf1-614f9fb05961	2366	Muta
00050000-5551-ec84-b23a-3eceaf4ce3d6	4202	Naklo
00050000-5551-ec84-f526-d0cd3e7493ef	3331	Nazarje
00050000-5551-ec84-7086-dc91ab4906ec	1357	Notranje Gorice
00050000-5551-ec84-65b1-959b491411ab	3203	Nova Cerkev
00050000-5551-ec84-53e0-b77a53f24a13	5000	Nova Gorica 
00050000-5551-ec84-6b87-14a41f6b50c9	5001	Nova Gorica - poštni predali
00050000-5551-ec84-f9ce-4d9b7b4e4d1f	1385	Nova vas
00050000-5551-ec84-081e-88e5737b8dba	8000	Novo mesto
00050000-5551-ec84-ed13-27046e569879	8001	Novo mesto - poštni predali
00050000-5551-ec84-1306-4373695ebc8a	6243	Obrov
00050000-5551-ec84-7e69-0630e59654c6	9233	Odranci
00050000-5551-ec84-c306-001de8df8bc2	2317	Oplotnica
00050000-5551-ec84-faa0-b7e7f36167d7	2312	Orehova vas
00050000-5551-ec84-9e07-3f5df977c857	2270	Ormož
00050000-5551-ec84-0407-64a713517f06	1316	Ortnek
00050000-5551-ec84-5636-70ba119fbb91	1337	Osilnica
00050000-5551-ec84-7bc0-f2cef7a6651b	8222	Otočec
00050000-5551-ec84-0b5c-fa4f2793969a	2361	Ožbalt
00050000-5551-ec84-e841-60719aaf556e	2231	Pernica
00050000-5551-ec84-9446-d1caa5f0d3fb	2211	Pesnica pri Mariboru
00050000-5551-ec84-1387-1d7aeac73c34	9203	Petrovci
00050000-5551-ec84-50fb-1cf1eded0a80	3301	Petrovče
00050000-5551-ec84-41e4-9a88389e6132	6330	Piran/Pirano
00050000-5551-ec84-3835-41c1129b0d72	8255	Pišece
00050000-5551-ec84-6bd7-724748fda86c	6257	Pivka
00050000-5551-ec84-3731-913a8169d5e9	6232	Planina
00050000-5551-ec84-3515-73cba3db3d23	3225	Planina pri Sevnici
00050000-5551-ec84-790e-bdcd6462553a	6276	Pobegi
00050000-5551-ec84-911a-813b080d5a99	8312	Podbočje
00050000-5551-ec84-9eb0-7c3e91c789ed	5243	Podbrdo
00050000-5551-ec84-bd31-845dee012af0	3254	Podčetrtek
00050000-5551-ec84-bbe5-cb3622791ff6	2273	Podgorci
00050000-5551-ec84-3061-c4991a058442	6216	Podgorje
00050000-5551-ec84-c320-a5012eca26ec	2381	Podgorje pri Slovenj Gradcu
00050000-5551-ec84-d9d5-d573b8eca211	6244	Podgrad
00050000-5551-ec84-0e73-adf5b0f86d3d	1414	Podkum
00050000-5551-ec84-f273-bf732f03e4fb	2286	Podlehnik
00050000-5551-ec84-bd12-2d570ba9feda	5272	Podnanos
00050000-5551-ec84-3577-cc290ad82297	4244	Podnart
00050000-5551-ec84-2e3a-e9144b67642c	3241	Podplat
00050000-5551-ec84-1f1e-f8b04301ef79	3257	Podsreda
00050000-5551-ec84-583c-b4dbe75d73d2	2363	Podvelka
00050000-5551-ec84-125f-b1dd1f62a2a4	2208	Pohorje
00050000-5551-ec84-1394-1023e4d476a4	2257	Polenšak
00050000-5551-ec84-91fa-d4fa1852d5e9	1355	Polhov Gradec
00050000-5551-ec84-5803-9f9d665442eb	4223	Poljane nad Škofjo Loko
00050000-5551-ec84-55b8-7b8965ac2496	2319	Poljčane
00050000-5551-ec84-afd2-3ba67e5dcc42	1272	Polšnik
00050000-5551-ec84-c9a4-b6290bb77e62	3313	Polzela
00050000-5551-ec84-38cb-df4501ff4a07	3232	Ponikva
00050000-5551-ec84-4687-329f2ec51dd6	6320	Portorož/Portorose
00050000-5551-ec84-1bd2-7e3acae8a192	6230	Postojna
00050000-5551-ec84-f8f3-5d72e0c04950	2331	Pragersko
00050000-5551-ec84-35ae-534492a9f9db	3312	Prebold
00050000-5551-ec84-9c4b-217e9b9d8f3c	4205	Preddvor
00050000-5551-ec84-17ef-bab61636542b	6255	Prem
00050000-5551-ec84-323d-17a064c8a2ca	1352	Preserje
00050000-5551-ec84-9ec8-12856a8db1de	6258	Prestranek
00050000-5551-ec84-1b5f-1538e77cb569	2391	Prevalje
00050000-5551-ec84-c453-1effbfa5f110	3262	Prevorje
00050000-5551-ec84-933e-1d23002958f6	1276	Primskovo 
00050000-5551-ec84-ed6f-6e0731b47f33	3253	Pristava pri Mestinju
00050000-5551-ec84-d14c-da9de8747bd8	9207	Prosenjakovci/Partosfalva
00050000-5551-ec84-a879-b2118ec85c79	5297	Prvačina
00050000-5551-ec84-36b5-c6748130c291	2250	Ptuj
00050000-5551-ec84-3d52-fba505bdb13c	2323	Ptujska Gora
00050000-5551-ec84-9146-fafab8945240	9201	Puconci
00050000-5551-ec84-b172-07cbd9bcb44b	2327	Rače
00050000-5551-ec84-6306-4728e17c887c	1433	Radeče
00050000-5551-ec84-91c9-48b4c73c40bb	9252	Radenci
00050000-5551-ec84-68d1-8658ef1d181d	2360	Radlje ob Dravi
00050000-5551-ec84-ec34-45df54d0e020	1235	Radomlje
00050000-5551-ec84-01d9-5156f3ba4530	4240	Radovljica
00050000-5551-ec84-93e8-ea93552256ef	8274	Raka
00050000-5551-ec84-b9c3-803c7d51da77	1381	Rakek
00050000-5551-ec84-f6cc-dcc2e675af76	4283	Rateče - Planica
00050000-5551-ec84-d697-d52135d07c48	2390	Ravne na Koroškem
00050000-5551-ec84-548c-1d5debf9d3b4	9246	Razkrižje
00050000-5551-ec84-edb4-fd87bedbe9b9	3332	Rečica ob Savinji
00050000-5551-ec84-f2b1-2e828cea5306	5292	Renče
00050000-5551-ec84-0cfb-620018bc0348	1310	Ribnica
00050000-5551-ec84-4ec8-96402f529bb0	2364	Ribnica na Pohorju
00050000-5551-ec84-cb36-b6db7ee1589e	3272	Rimske Toplice
00050000-5551-ec84-9391-99fa71fb9b3c	1314	Rob
00050000-5551-ec84-c942-42fbf324b0fd	5215	Ročinj
00050000-5551-ec84-878d-b1a78fbaeaf1	3250	Rogaška Slatina
00050000-5551-ec84-7d82-fb1b0420df25	9262	Rogašovci
00050000-5551-ec84-9331-e4098a15ae63	3252	Rogatec
00050000-5551-ec84-3ea1-9bf3e6fa4010	1373	Rovte
00050000-5551-ec84-9c89-249f2b39d452	2342	Ruše
00050000-5551-ec84-eae0-f012d5056fd8	1282	Sava
00050000-5551-ec84-93e5-71188d991486	6333	Sečovlje/Sicciole
00050000-5551-ec84-7d93-f5cf47fb2c21	4227	Selca
00050000-5551-ec84-b374-c0118a3977bf	2352	Selnica ob Dravi
00050000-5551-ec84-cc7a-fb4a340fb8e5	8333	Semič
00050000-5551-ec84-e94b-0d1a7d685eb9	8281	Senovo
00050000-5551-ec84-ea66-5272ffa13dfe	6224	Senožeče
00050000-5551-ec84-ed2f-3bd574abbc93	8290	Sevnica
00050000-5551-ec84-120f-997fd9b79ff1	6210	Sežana
00050000-5551-ec84-3a8d-22e04cda4ff0	2214	Sladki Vrh
00050000-5551-ec84-8377-bf2ac3f4e4aa	5283	Slap ob Idrijci
00050000-5551-ec84-2ae5-4b67b2e4bb41	2380	Slovenj Gradec
00050000-5551-ec84-92a1-902a7a741ff4	2310	Slovenska Bistrica
00050000-5551-ec84-a5ae-33b268022990	3210	Slovenske Konjice
00050000-5551-ec84-c854-7be26e0967f5	1216	Smlednik
00050000-5551-ec84-f575-39310c260646	5232	Soča
00050000-5551-ec84-e21f-147495200835	1317	Sodražica
00050000-5551-ec84-14db-a9413ad3b3e7	3335	Solčava
00050000-5551-ec84-41c6-a46284f39763	5250	Solkan
00050000-5551-ec84-600f-3b4f4efe853c	4229	Sorica
00050000-5551-ec84-a7f6-a452135ee863	4225	Sovodenj
00050000-5551-ec84-07c9-2dc0887ad4fa	5281	Spodnja Idrija
00050000-5551-ec84-7b9f-1255d4fa557d	2241	Spodnji Duplek
00050000-5551-ec84-36a4-f70e8eec907d	9245	Spodnji Ivanjci
00050000-5551-ec84-ea19-ca4821fbed82	2277	Središče ob Dravi
00050000-5551-ec84-5707-135dfb37e8c0	4267	Srednja vas v Bohinju
00050000-5551-ec84-d500-30a54baf1ee7	8256	Sromlje 
00050000-5551-ec84-6c44-797d3fd8d674	5224	Srpenica
00050000-5551-ec84-d6a3-2a4440664d33	1242	Stahovica
00050000-5551-ec84-9c69-79cd5a00dbfc	1332	Stara Cerkev
00050000-5551-ec84-0269-378ad40e130f	8342	Stari trg ob Kolpi
00050000-5551-ec84-6a89-3b683a3098ca	1386	Stari trg pri Ložu
00050000-5551-ec84-ff57-b1528cd438a8	2205	Starše
00050000-5551-ec84-e34f-e468925c43cb	2289	Stoperce
00050000-5551-ec84-6158-44bed9200c7b	8322	Stopiče
00050000-5551-ec84-b0ea-1ddf2dde5b2e	3206	Stranice
00050000-5551-ec84-7287-18b875e6d35c	8351	Straža
00050000-5551-ec84-6fee-7090a5b69135	1313	Struge
00050000-5551-ec84-2892-f7c8a75a7966	8293	Studenec
00050000-5551-ec84-d957-80b3ed44fdc1	8331	Suhor
00050000-5551-ec84-38dc-feee4a0b0383	2233	Sv. Ana v Slovenskih goricah
00050000-5551-ec84-c2b7-719c292ef1f1	2235	Sv. Trojica v Slovenskih goricah
00050000-5551-ec84-b2f6-1de73ad3b22c	2353	Sveti Duh na Ostrem Vrhu
00050000-5551-ec84-9ac6-3f087f3036ef	9244	Sveti Jurij ob Ščavnici
00050000-5551-ec84-5b4b-8f41ce3a637e	3264	Sveti Štefan
00050000-5551-ec84-379f-4c57f893186e	2258	Sveti Tomaž
00050000-5551-ec84-1db3-a60d8abe6990	9204	Šalovci
00050000-5551-ec84-b0f2-63f34707adad	5261	Šempas
00050000-5551-ec84-f7e9-8ef38cad883a	5290	Šempeter pri Gorici
00050000-5551-ec84-c071-a58916cd715c	3311	Šempeter v Savinjski dolini
00050000-5551-ec84-0af3-dc2b3b0ce0b3	4208	Šenčur
00050000-5551-ec84-fd3c-f2f22ad1ceb1	2212	Šentilj v Slovenskih goricah
00050000-5551-ec84-6ec8-5aa7bdd314e7	8297	Šentjanž
00050000-5551-ec84-da3c-2c640ae22ee9	2373	Šentjanž pri Dravogradu
00050000-5551-ec84-6d98-b9f223b46599	8310	Šentjernej
00050000-5551-ec84-5186-9c2fe2b13bc6	3230	Šentjur
00050000-5551-ec84-2201-504134bdd3ea	3271	Šentrupert
00050000-5551-ec84-1770-ab8e2b4465b5	8232	Šentrupert
00050000-5551-ec84-7b17-ae47bae0cd9e	1296	Šentvid pri Stični
00050000-5551-ec84-3cc2-25e1246ef71f	8275	Škocjan
00050000-5551-ec84-96c5-bb4dc6298bbb	6281	Škofije
00050000-5551-ec84-64ee-671a4bd97dab	4220	Škofja Loka
00050000-5551-ec84-8621-e54bbad574b1	3211	Škofja vas
00050000-5551-ec84-5ead-f7c7a4eed127	1291	Škofljica
00050000-5551-ec84-fff9-f803cfbea238	6274	Šmarje
00050000-5551-ec84-b9ad-1db40436a019	1293	Šmarje - Sap
00050000-5551-ec84-b1d2-89b1c5d83467	3240	Šmarje pri Jelšah
00050000-5551-ec84-4def-0bf19140e67a	8220	Šmarješke Toplice
00050000-5551-ec84-261b-161ff69218b0	2315	Šmartno na Pohorju
00050000-5551-ec84-8871-c85e53da40da	3341	Šmartno ob Dreti
00050000-5551-ec84-b974-6ab919f737a3	3327	Šmartno ob Paki
00050000-5551-ec84-81c9-24281884f9ac	1275	Šmartno pri Litiji
00050000-5551-ec84-be7a-c93921db1a31	2383	Šmartno pri Slovenj Gradcu
00050000-5551-ec84-93ca-e1dbf48b74e6	3201	Šmartno v Rožni dolini
00050000-5551-ec84-0c23-03bf0df30448	3325	Šoštanj
00050000-5551-ec84-78ee-883003e0188b	6222	Štanjel
00050000-5551-ec84-77f0-b69a4cf0f332	3220	Štore
00050000-5551-ec84-3e82-e8f5579e29be	3304	Tabor
00050000-5551-ec84-df2a-667de5a7e8ef	3221	Teharje
00050000-5551-ec84-ef67-3d3518b9ff0a	9251	Tišina
00050000-5551-ec84-b7d3-d5dbd25ae601	5220	Tolmin
00050000-5551-ec84-db10-cd6bdfae1a73	3326	Topolšica
00050000-5551-ec84-3f90-148c24223ec8	2371	Trbonje
00050000-5551-ec84-daf3-9e1453314bfc	1420	Trbovlje
00050000-5551-ec84-c1a6-abce4328b902	8231	Trebelno 
00050000-5551-ec84-1e50-1e748dd8b17b	8210	Trebnje
00050000-5551-ec84-740c-411837d4a384	5252	Trnovo pri Gorici
00050000-5551-ec84-c32c-26fc9f8e64c0	2254	Trnovska vas
00050000-5551-ec84-664e-c0cc030a4cfd	1222	Trojane
00050000-5551-ec84-ea15-efb4135c0e5c	1236	Trzin
00050000-5551-ec84-5be0-a9ca0bbe64a2	4290	Tržič
00050000-5551-ec84-ec3b-ba1ac43ff3d8	8295	Tržišče
00050000-5551-ec84-d9c4-76336ffe78d2	1311	Turjak
00050000-5551-ec84-211b-f966c6597d24	9224	Turnišče
00050000-5551-ec84-c191-bcdc7c47a95a	8323	Uršna sela
00050000-5551-ec84-b878-347f9863a735	1252	Vače
00050000-5551-ec84-adb8-08800e610f49	3320	Velenje 
00050000-5551-ec84-041f-8d9bb84c0a3f	3322	Velenje - poštni predali
00050000-5551-ec84-4ba0-ec66e12ef253	8212	Velika Loka
00050000-5551-ec84-4c59-bdefceb14cab	2274	Velika Nedelja
00050000-5551-ec84-fcf0-257223ca0d13	9225	Velika Polana
00050000-5551-ec84-91cf-f30216d7b575	1315	Velike Lašče
00050000-5551-ec84-885b-03689f3f07eb	8213	Veliki Gaber
00050000-5551-ec84-46e0-be92a4bc0e5f	9241	Veržej
00050000-5551-ec84-68db-a4e2a5b68231	1312	Videm - Dobrepolje
00050000-5551-ec84-0e3b-421a6cb413ae	2284	Videm pri Ptuju
00050000-5551-ec84-639b-35e662faf62a	8344	Vinica
00050000-5551-ec84-f1c2-58a4670e1fc6	5271	Vipava
00050000-5551-ec84-52eb-e5e2808a721b	4212	Visoko
00050000-5551-ec84-1334-8ffe8ae79f09	1294	Višnja Gora
00050000-5551-ec84-8e69-a73440e0d359	3205	Vitanje
00050000-5551-ec84-61b0-c337564cc4b4	2255	Vitomarci
00050000-5551-ec84-d67b-bee162d677ff	1217	Vodice
00050000-5551-ec84-9eab-3e663dc1bca6	3212	Vojnik\t
00050000-5551-ec84-993d-2cd3e7d8c09f	5293	Volčja Draga
00050000-5551-ec84-e621-adbf0344f5ef	2232	Voličina
00050000-5551-ec84-0015-ea230ed54f37	3305	Vransko
00050000-5551-ec84-60e5-b0036447c26d	6217	Vremski Britof
00050000-5551-ec84-78c7-761cb6e1556d	1360	Vrhnika
00050000-5551-ec84-f7d0-c102cd6a4d6f	2365	Vuhred
00050000-5551-ec84-844d-d56b869b296b	2367	Vuzenica
00050000-5551-ec84-41b5-2e8546c1a709	8292	Zabukovje 
00050000-5551-ec84-4d98-045eeef9cae4	1410	Zagorje ob Savi
00050000-5551-ec84-5f93-394f2624b0b5	1303	Zagradec
00050000-5551-ec84-a446-5e7365751c03	2283	Zavrč
00050000-5551-ec84-96a6-d31fbedde891	8272	Zdole 
00050000-5551-ec84-8be2-750381fb0169	4201	Zgornja Besnica
00050000-5551-ec84-21b6-762eda37521c	2242	Zgornja Korena
00050000-5551-ec84-b2f0-5617a5428d97	2201	Zgornja Kungota
00050000-5551-ec84-1c88-de087a09d180	2316	Zgornja Ložnica
00050000-5551-ec84-5ebb-989c83ddbb0b	2314	Zgornja Polskava
00050000-5551-ec84-a22c-4594eb85c614	2213	Zgornja Velka
00050000-5551-ec84-a9b6-89d0aa7049ae	4247	Zgornje Gorje
00050000-5551-ec84-a95a-8bee4e3386aa	4206	Zgornje Jezersko
00050000-5551-ec84-09d6-ccc154c4cc94	2285	Zgornji Leskovec
00050000-5551-ec84-f024-2b780914d46b	1432	Zidani Most
00050000-5551-ec84-6f2f-c3c6fc0e15c3	3214	Zreče
00050000-5551-ec84-0b8d-52f248d4fa5f	4209	Žabnica
00050000-5551-ec84-1393-ea7c155fa38a	3310	Žalec
00050000-5551-ec84-0d2f-9de0ea86719e	4228	Železniki
00050000-5551-ec84-ad6d-9a87ad00476e	2287	Žetale
00050000-5551-ec84-0fab-46d7fac038fc	4226	Žiri
00050000-5551-ec84-9dd9-538bf8a0c791	4274	Žirovnica
00050000-5551-ec84-98e8-1e5f0ab301b1	8360	Žužemberk
\.


--
-- TOC entry 2663 (class 0 OID 3165609)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 3165432)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 3165498)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 3165621)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 3165726)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 3165773)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 3165650)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 3165594)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 3165584)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2680 (class 0 OID 3165763)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 3165716)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 3165299)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5551-ec84-a8fa-7ae3d03b35f9	00010000-5551-ec84-4500-31a772c63162	2015-05-12 14:05:25	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROhvJMFggJ8UOVxqrFiovxOqsK8A/bCDu";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2695 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2670 (class 0 OID 3165659)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2638 (class 0 OID 3165337)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5551-ec84-d6b8-353b4ae0b789	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5551-ec84-aea6-4e825b3d5e87	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5551-ec84-44c3-fd09e9706b85	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5551-ec84-3212-0c3557007ec5	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5551-ec84-46c3-5ae73215a102	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5551-ec84-a826-9630887f6094	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2636 (class 0 OID 3165321)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5551-ec84-a8fa-7ae3d03b35f9	00020000-5551-ec84-3212-0c3557007ec5
00010000-5551-ec84-4500-31a772c63162	00020000-5551-ec84-3212-0c3557007ec5
\.


--
-- TOC entry 2672 (class 0 OID 3165673)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 3165615)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 3165565)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 3165397)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2659 (class 0 OID 3165571)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 3165751)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 3165467)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 3165308)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5551-ec84-4500-31a772c63162	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROYnb4B2EY0yeYUDC8tVa0HSujqOHRLFO	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5551-ec84-a8fa-7ae3d03b35f9	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2684 (class 0 OID 3165805)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 3165513)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 3165642)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 3165708)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 3165541)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2683 (class 0 OID 3165795)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 3165698)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2278 (class 2606 OID 3165362)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 3165845)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 3165838)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 3165750)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2331 (class 2606 OID 3165531)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 3165564)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2314 (class 2606 OID 3165493)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 3165694)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 3165511)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 3165558)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2253 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 3165607)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 3165634)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2307 (class 2606 OID 3165465)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2282 (class 2606 OID 3165371)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2297 (class 2606 OID 3165429)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2284 (class 2606 OID 3165395)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2276 (class 2606 OID 3165351)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2269 (class 2606 OID 3165336)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 3165640)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2394 (class 2606 OID 3165672)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 3165790)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2292 (class 2606 OID 3165422)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 3165453)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 2606 OID 3165613)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2302 (class 2606 OID 3165443)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2323 (class 2606 OID 3165502)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 3165625)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 3165732)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 3165778)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 3165657)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 3165598)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2360 (class 2606 OID 3165589)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 3165772)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 3165723)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2261 (class 2606 OID 3165307)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 3165663)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2267 (class 2606 OID 3165325)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2271 (class 2606 OID 3165345)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 3165681)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 3165620)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 3165570)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 3165402)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2354 (class 2606 OID 3165580)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 3165762)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 3165478)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 3165320)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 3165820)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 2606 OID 3165517)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 3165648)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 3165714)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 3165553)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 3165804)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 3165707)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2332 (class 1259 OID 3165538)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2290 (class 1259 OID 3165424)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2255 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2256 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2257 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2381 (class 1259 OID 3165641)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2375 (class 1259 OID 3165627)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2376 (class 1259 OID 3165626)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2327 (class 1259 OID 3165518)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2402 (class 1259 OID 3165697)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2403 (class 1259 OID 3165695)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2404 (class 1259 OID 3165696)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2427 (class 1259 OID 3165792)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2428 (class 1259 OID 3165793)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2429 (class 1259 OID 3165794)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2435 (class 1259 OID 3165823)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2436 (class 1259 OID 3165822)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2437 (class 1259 OID 3165821)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2309 (class 1259 OID 3165480)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2310 (class 1259 OID 3165479)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2294 (class 1259 OID 3165431)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2295 (class 1259 OID 3165430)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2390 (class 1259 OID 3165664)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2345 (class 1259 OID 3165559)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2273 (class 1259 OID 3165352)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2274 (class 1259 OID 3165353)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2395 (class 1259 OID 3165684)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2396 (class 1259 OID 3165683)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2397 (class 1259 OID 3165682)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2319 (class 1259 OID 3165503)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2320 (class 1259 OID 3165505)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2321 (class 1259 OID 3165504)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2355 (class 1259 OID 3165593)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2356 (class 1259 OID 3165591)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2357 (class 1259 OID 3165590)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2358 (class 1259 OID 3165592)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2264 (class 1259 OID 3165326)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2265 (class 1259 OID 3165327)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2384 (class 1259 OID 3165649)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2370 (class 1259 OID 3165614)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2410 (class 1259 OID 3165724)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2411 (class 1259 OID 3165725)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2298 (class 1259 OID 3165445)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2299 (class 1259 OID 3165444)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2300 (class 1259 OID 3165446)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2414 (class 1259 OID 3165733)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2415 (class 1259 OID 3165734)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2446 (class 1259 OID 3165848)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 3165847)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2448 (class 1259 OID 3165850)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2449 (class 1259 OID 3165846)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2450 (class 1259 OID 3165849)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2407 (class 1259 OID 3165715)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2361 (class 1259 OID 3165602)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2362 (class 1259 OID 3165601)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2363 (class 1259 OID 3165599)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2364 (class 1259 OID 3165600)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2251 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2442 (class 1259 OID 3165840)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2443 (class 1259 OID 3165839)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2326 (class 1259 OID 3165512)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2279 (class 1259 OID 3165373)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2280 (class 1259 OID 3165372)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2286 (class 1259 OID 3165403)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2287 (class 1259 OID 3165404)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2350 (class 1259 OID 3165583)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2351 (class 1259 OID 3165582)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2352 (class 1259 OID 3165581)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2333 (class 1259 OID 3165540)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2334 (class 1259 OID 3165536)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2335 (class 1259 OID 3165533)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2336 (class 1259 OID 3165534)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2337 (class 1259 OID 3165532)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2338 (class 1259 OID 3165537)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2339 (class 1259 OID 3165535)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2293 (class 1259 OID 3165423)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2315 (class 1259 OID 3165494)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2316 (class 1259 OID 3165496)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2317 (class 1259 OID 3165495)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2318 (class 1259 OID 3165497)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2369 (class 1259 OID 3165608)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2432 (class 1259 OID 3165791)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2285 (class 1259 OID 3165396)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2308 (class 1259 OID 3165466)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2389 (class 1259 OID 3165658)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2254 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2305 (class 1259 OID 3165454)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2426 (class 1259 OID 3165779)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2272 (class 1259 OID 3165346)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2340 (class 1259 OID 3165539)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2475 (class 2606 OID 3165981)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2478 (class 2606 OID 3165966)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2477 (class 2606 OID 3165971)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2473 (class 2606 OID 3165991)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2479 (class 2606 OID 3165961)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2474 (class 2606 OID 3165986)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2476 (class 2606 OID 3165976)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2460 (class 2606 OID 3165896)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2496 (class 2606 OID 3166076)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2494 (class 2606 OID 3166071)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2495 (class 2606 OID 3166066)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2472 (class 2606 OID 3165956)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2502 (class 2606 OID 3166116)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2504 (class 2606 OID 3166106)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2503 (class 2606 OID 3166111)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2492 (class 2606 OID 3166056)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2513 (class 2606 OID 3166151)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2512 (class 2606 OID 3166156)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2511 (class 2606 OID 3166161)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2514 (class 2606 OID 3166176)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2515 (class 2606 OID 3166171)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2516 (class 2606 OID 3166166)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2466 (class 2606 OID 3165931)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2467 (class 2606 OID 3165926)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2461 (class 2606 OID 3165906)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2462 (class 2606 OID 3165901)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 3165881)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2498 (class 2606 OID 3166086)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2480 (class 2606 OID 3165996)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2454 (class 2606 OID 3165861)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2453 (class 2606 OID 3165866)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2499 (class 2606 OID 3166101)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2500 (class 2606 OID 3166096)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2501 (class 2606 OID 3166091)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2470 (class 2606 OID 3165936)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2468 (class 2606 OID 3165946)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2469 (class 2606 OID 3165941)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2484 (class 2606 OID 3166031)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2486 (class 2606 OID 3166021)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2487 (class 2606 OID 3166016)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2485 (class 2606 OID 3166026)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2452 (class 2606 OID 3165851)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2451 (class 2606 OID 3165856)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2497 (class 2606 OID 3166081)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2493 (class 2606 OID 3166061)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2507 (class 2606 OID 3166126)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2506 (class 2606 OID 3166131)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 3165916)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2465 (class 2606 OID 3165911)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2463 (class 2606 OID 3165921)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2509 (class 2606 OID 3166136)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2508 (class 2606 OID 3166141)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2521 (class 2606 OID 3166201)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2522 (class 2606 OID 3166196)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2519 (class 2606 OID 3166211)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2523 (class 2606 OID 3166191)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2520 (class 2606 OID 3166206)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2505 (class 2606 OID 3166121)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2488 (class 2606 OID 3166051)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2489 (class 2606 OID 3166046)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2491 (class 2606 OID 3166036)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2490 (class 2606 OID 3166041)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2517 (class 2606 OID 3166186)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2518 (class 2606 OID 3166181)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2471 (class 2606 OID 3165951)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2510 (class 2606 OID 3166146)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2455 (class 2606 OID 3165876)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2456 (class 2606 OID 3165871)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2459 (class 2606 OID 3165886)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 3165891)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2481 (class 2606 OID 3166011)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2482 (class 2606 OID 3166006)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2483 (class 2606 OID 3166001)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-12 14:05:25 CEST

--
-- PostgreSQL database dump complete
--

