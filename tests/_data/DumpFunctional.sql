--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-13 15:52:50 CEST

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
-- TOC entry 2695 (class 0 OID 0)
-- Dependencies: 226
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 3330795)
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
-- TOC entry 225 (class 1259 OID 3331284)
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
-- TOC entry 224 (class 1259 OID 3331267)
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
-- TOC entry 217 (class 1259 OID 3331178)
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
-- TOC entry 193 (class 1259 OID 3330960)
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
    planiranzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status integer,
    razred character varying(10) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 196 (class 1259 OID 3331003)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 3330922)
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
-- TOC entry 212 (class 1259 OID 3331128)
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
-- TOC entry 191 (class 1259 OID 3330947)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 3330997)
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
-- TOC entry 201 (class 1259 OID 3331046)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 3331071)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 3330896)
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
-- TOC entry 180 (class 1259 OID 3330804)
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
-- TOC entry 181 (class 1259 OID 3330815)
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
-- TOC entry 184 (class 1259 OID 3330866)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 3330769)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 3330788)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 3331078)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 3331108)
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
-- TOC entry 221 (class 1259 OID 3331223)
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
-- TOC entry 183 (class 1259 OID 3330846)
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
-- TOC entry 186 (class 1259 OID 3330888)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 3331052)
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
-- TOC entry 185 (class 1259 OID 3330873)
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
-- TOC entry 190 (class 1259 OID 3330939)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 3331064)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 3331169)
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
-- TOC entry 220 (class 1259 OID 3331216)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 3331093)
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
-- TOC entry 200 (class 1259 OID 3331037)
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
-- TOC entry 199 (class 1259 OID 3331027)
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
-- TOC entry 219 (class 1259 OID 3331206)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 3331159)
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
-- TOC entry 173 (class 1259 OID 3330740)
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
-- TOC entry 172 (class 1259 OID 3330738)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2696 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 3331102)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 3330778)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 3330762)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 3331116)
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
-- TOC entry 203 (class 1259 OID 3331058)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 3331008)
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
-- TOC entry 182 (class 1259 OID 3330838)
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
-- TOC entry 198 (class 1259 OID 3331014)
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
-- TOC entry 218 (class 1259 OID 3331194)
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
-- TOC entry 188 (class 1259 OID 3330908)
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
-- TOC entry 174 (class 1259 OID 3330749)
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
-- TOC entry 223 (class 1259 OID 3331248)
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
-- TOC entry 192 (class 1259 OID 3330954)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 3331085)
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
-- TOC entry 214 (class 1259 OID 3331151)
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
-- TOC entry 194 (class 1259 OID 3330983)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    planiranzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status integer,
    razred character varying(10) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 222 (class 1259 OID 3331238)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 3331141)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 3330743)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2642 (class 0 OID 3330795)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2688 (class 0 OID 3331284)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2687 (class 0 OID 3331267)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2680 (class 0 OID 3331178)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 3330960)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2659 (class 0 OID 3331003)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 3330922)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5553-5731-3a37-24499a387102	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5553-5731-c25d-1d5fe9f2e44d	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5553-5731-64a9-a1c57e6c3493	AL	ALB	008	Albania 	Albanija	\N
00040000-5553-5731-a09e-d9e972250148	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5553-5731-4db8-fb48fb5e08a3	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5553-5731-1679-72469696ecf4	AD	AND	020	Andorra 	Andora	\N
00040000-5553-5731-c143-f838aeae5ac3	AO	AGO	024	Angola 	Angola	\N
00040000-5553-5731-ff44-974914b5084e	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5553-5731-f2e6-3e5089521054	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5553-5731-73cb-df138e4ef00e	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5553-5731-86bf-06ae9e10407d	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5553-5731-32af-0649aaa0e226	AM	ARM	051	Armenia 	Armenija	\N
00040000-5553-5731-155d-d4a5752229c3	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5553-5731-7214-eb7b493e3c9b	AU	AUS	036	Australia 	Avstralija	\N
00040000-5553-5731-2855-5b786051de7e	AT	AUT	040	Austria 	Avstrija	\N
00040000-5553-5731-37a2-e44839dbd210	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5553-5731-6d73-2269185ce4a1	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5553-5731-0d73-6d28d766b6fd	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5553-5731-5bac-0fb7af638365	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5553-5731-b515-906222e60e0c	BB	BRB	052	Barbados 	Barbados	\N
00040000-5553-5731-2a91-3a82b7d556f6	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5553-5731-434d-7d69f7b279bd	BE	BEL	056	Belgium 	Belgija	\N
00040000-5553-5731-692a-e4525b45f96e	BZ	BLZ	084	Belize 	Belize	\N
00040000-5553-5731-f39f-90e0c6cc8f81	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5553-5731-b806-9f4354d261ba	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5553-5731-d0f8-90fe6d3388dd	BT	BTN	064	Bhutan 	Butan	\N
00040000-5553-5731-ced9-3d15706aabfe	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5553-5731-99e0-237a3e680809	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5553-5731-75ef-6519da36dca9	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5553-5731-f19e-042b62802fc5	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5553-5731-9621-ea6ca1476cd8	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5553-5731-2976-55166a588566	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5553-5731-1084-c9c9925332f7	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5553-5731-ff63-080fd68b2465	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5553-5731-3548-c13a7c2f5cf5	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5553-5731-9697-155eb2ce3545	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5553-5731-ea5e-086168babbb2	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5553-5731-efb2-7549b82bf11a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5553-5731-38ca-616ee11f6807	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5553-5731-71ea-0e21c1ed7b7d	CA	CAN	124	Canada 	Kanada	\N
00040000-5553-5731-1b27-69ff21c5ccb0	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5553-5731-0cbd-303989cca543	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5553-5731-8349-81c440f8e0c0	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5553-5731-132e-994bbba45bc2	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5553-5731-181d-e670b5225659	CL	CHL	152	Chile 	Čile	\N
00040000-5553-5731-ebf7-8705e621da0b	CN	CHN	156	China 	Kitajska	\N
00040000-5553-5731-31f8-af8523cd3d57	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5553-5731-3cb4-fa396aaf822d	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5553-5731-1519-f703f605da68	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5553-5731-2b4f-dffbba257b79	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5553-5731-c004-506838d05dc0	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5553-5731-a3d7-914ffcea0193	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5553-5731-8cdb-1840039aeac3	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5553-5731-8b6b-0766b21923ac	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5553-5731-f58f-ef401923e3f5	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5553-5731-7abd-709d7e8fb9d5	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5553-5731-7893-d77432906f16	CU	CUB	192	Cuba 	Kuba	\N
00040000-5553-5731-eb4a-b52105179506	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5553-5731-b881-b49f2be7eb24	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5553-5731-af8e-1c907ef826e4	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5553-5731-0a78-8c770b700b19	DK	DNK	208	Denmark 	Danska	\N
00040000-5553-5731-5e68-a05ed8b913fc	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5553-5731-7a38-91162fbfeba5	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5553-5731-90dc-689fb1ae9ddb	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5553-5731-34bc-f009d3e8e70d	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5553-5731-e164-86ce08f5b7ea	EG	EGY	818	Egypt 	Egipt	\N
00040000-5553-5731-ba9c-703d84ab35fc	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5553-5731-5b4d-83bac832e7d6	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5553-5731-3dbd-1cbc3a783065	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5553-5731-bbcb-eff06428bada	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5553-5731-2abe-f08706881ea1	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5553-5731-585f-250b7ad51a5b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5553-5731-87c9-368191358bff	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5553-5731-9bae-73a209673dbe	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5553-5731-d75d-21eaa25d57ba	FI	FIN	246	Finland 	Finska	\N
00040000-5553-5731-7843-9672f8604b4d	FR	FRA	250	France 	Francija	\N
00040000-5553-5731-b7d1-e6a15b4c7a22	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5553-5731-b511-789a362ed8fa	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5553-5731-03a9-6f91158a3e80	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5553-5731-d6ad-7b6a34541389	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5553-5731-e2bb-57616dde1eeb	GA	GAB	266	Gabon 	Gabon	\N
00040000-5553-5731-0cfb-d7a9ffc3236d	GM	GMB	270	Gambia 	Gambija	\N
00040000-5553-5731-b96b-38641182dc52	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5553-5731-fea5-f6b5b3ee4ac9	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5553-5731-5c31-350a60a1712d	GH	GHA	288	Ghana 	Gana	\N
00040000-5553-5731-91b4-352d355ecb1c	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5553-5731-856d-ca4d46721980	GR	GRC	300	Greece 	Grčija	\N
00040000-5553-5731-4577-277b252d5c4e	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5553-5731-779f-185d83212c94	GD	GRD	308	Grenada 	Grenada	\N
00040000-5553-5731-3bd5-c472e21f717c	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5553-5731-5630-6f303fdcabdd	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5553-5731-6fd5-5c5863095016	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5553-5731-4a89-afe6506f9562	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5553-5731-a571-0f2c78b69cae	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5553-5731-f4f7-faf87d893056	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5553-5731-28f6-1706f32e40ed	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5553-5731-c1d7-61375607f549	HT	HTI	332	Haiti 	Haiti	\N
00040000-5553-5731-27d0-a358546c97b9	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5553-5731-4607-b9261a39a130	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5553-5731-14c1-83464429b6f3	HN	HND	340	Honduras 	Honduras	\N
00040000-5553-5731-6dbf-6e57d9176fcb	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5553-5731-2d57-f908e0c1b549	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5553-5731-0456-b11a0c4c0330	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5553-5731-9af5-6fb9bf58b6ca	IN	IND	356	India 	Indija	\N
00040000-5553-5731-82f4-7ec2c5b38281	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5553-5731-2da2-4d08de05f126	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5553-5731-99ef-e5500742561f	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5553-5731-2c87-c6978c8727b1	IE	IRL	372	Ireland 	Irska	\N
00040000-5553-5731-190a-0d9d77dd8290	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5553-5731-fa9a-62f0ca586046	IL	ISR	376	Israel 	Izrael	\N
00040000-5553-5731-bc0c-bfd66adc547f	IT	ITA	380	Italy 	Italija	\N
00040000-5553-5731-baa9-971c6bc800d8	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5553-5731-cd43-83635e7d9e39	JP	JPN	392	Japan 	Japonska	\N
00040000-5553-5731-edd6-f9ceb716f9a7	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5553-5731-333b-1ba98b1b7166	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5553-5731-6d56-d82bde581f17	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5553-5731-c1d1-30e1e0625e2b	KE	KEN	404	Kenya 	Kenija	\N
00040000-5553-5731-931b-dd9af6b51fed	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5553-5731-e8e0-ffd1b6df9b3f	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5553-5731-37af-03b905c6f6e0	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5553-5731-1794-6d22cee4d057	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5553-5731-cd17-977261639f76	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5553-5731-92f6-4dd82047d531	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5553-5731-5f33-79cb4355cfe3	LV	LVA	428	Latvia 	Latvija	\N
00040000-5553-5731-37fc-149b4d033c3b	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5553-5731-b51a-6b21b10c86e3	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5553-5731-7cc4-9d9da914f572	LR	LBR	430	Liberia 	Liberija	\N
00040000-5553-5731-95a1-5ed8d11fc924	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5553-5731-792e-9c3667cf4e8c	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5553-5731-d06e-ae93c421a11d	LT	LTU	440	Lithuania 	Litva	\N
00040000-5553-5731-dc6a-1ca7e034d1cf	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5553-5731-cac1-297e4f71d727	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5553-5731-4c9e-5b1bb0a12bcf	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5553-5731-b041-a26ba161f52c	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5553-5731-8d72-d1b26b2647a7	MW	MWI	454	Malawi 	Malavi	\N
00040000-5553-5731-c6b0-8945488761a6	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5553-5731-d63f-1642641ec595	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5553-5731-daca-a97f3b18970d	ML	MLI	466	Mali 	Mali	\N
00040000-5553-5731-6f47-a860e5c07736	MT	MLT	470	Malta 	Malta	\N
00040000-5553-5731-7822-2b87e813a8b1	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5553-5731-4af4-4ccdd2b3f1b9	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5553-5731-1ea6-0c837c987339	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5553-5731-7124-2f2ebfa1e000	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5553-5731-bf06-235a22efe233	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5553-5731-9487-74b281ebf4dc	MX	MEX	484	Mexico 	Mehika	\N
00040000-5553-5731-26c9-2a5530f2a707	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5553-5731-ac0c-b20cfeb5ad1a	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5553-5731-8349-233c6734acd4	MC	MCO	492	Monaco 	Monako	\N
00040000-5553-5731-0580-5751f8401dea	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5553-5731-b87b-b12658d38e8d	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5553-5731-852a-d90004c4663c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5553-5731-1c88-49648ee3e7a3	MA	MAR	504	Morocco 	Maroko	\N
00040000-5553-5731-59f9-9ff662f2963e	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5553-5731-b828-5a56a292cebc	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5553-5731-5eb6-7bc55e31fa86	NA	NAM	516	Namibia 	Namibija	\N
00040000-5553-5731-07bb-74c9a691809c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5553-5731-f4d3-24b16c4cd757	NP	NPL	524	Nepal 	Nepal	\N
00040000-5553-5731-e358-da95f00194dc	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5553-5731-cfc3-bc0cf922156c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5553-5731-9de9-6e030cde13f7	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5553-5731-9470-a8cfc319f3ac	NE	NER	562	Niger 	Niger 	\N
00040000-5553-5731-bf1a-3b04e0174e31	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5553-5731-8ce3-44c7af241cf9	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5553-5731-62ae-da410ac67959	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5553-5731-5bc2-807078295e03	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5553-5731-deff-1b289c735a81	NO	NOR	578	Norway 	Norveška	\N
00040000-5553-5731-ab84-4213c457ecde	OM	OMN	512	Oman 	Oman	\N
00040000-5553-5731-0cd7-327e06c32cf7	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5553-5731-2d11-62d460394feb	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5553-5731-2ee0-b0bab7a8b83f	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5553-5731-5b82-2781bd91d89c	PA	PAN	591	Panama 	Panama	\N
00040000-5553-5731-be5a-f0088b94b085	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5553-5731-c60f-2e693f931fa2	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5553-5731-ef24-6acb33f03533	PE	PER	604	Peru 	Peru	\N
00040000-5553-5731-a624-81cad2e751bf	PH	PHL	608	Philippines 	Filipini	\N
00040000-5553-5731-a186-7dff30b27189	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5553-5731-e8af-525cbbe82f5c	PL	POL	616	Poland 	Poljska	\N
00040000-5553-5731-5b72-85a548bd8a68	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5553-5731-17dc-74776f442240	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5553-5731-3def-be8256adf7e9	QA	QAT	634	Qatar 	Katar	\N
00040000-5553-5731-a003-f48d811f8339	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5553-5731-18fa-1c3c71b99aec	RO	ROU	642	Romania 	Romunija	\N
00040000-5553-5731-4004-f99cd1aac873	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5553-5731-9dff-1a7a3a8c1d25	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5553-5731-ce5c-daa439b4c665	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5553-5731-6bf0-65785154bc90	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5553-5731-e515-149f7c2c47b6	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5553-5731-b216-482e32d1e3a7	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5553-5731-9e3e-b5feb870fade	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5553-5731-8304-aa129f75ec10	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5553-5731-5eed-a2fda9b2684e	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5553-5731-08aa-4223a310c6f1	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5553-5731-086b-002611b8a921	SM	SMR	674	San Marino 	San Marino	\N
00040000-5553-5731-6ea6-ff4a34149faf	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5553-5731-3cdf-19ab8ecfae1e	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5553-5731-b698-c7c0a1940e2f	SN	SEN	686	Senegal 	Senegal	\N
00040000-5553-5731-a462-51c1ddb1ad13	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5553-5731-3f9e-639555ebd93b	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5553-5731-e09f-9003ed206a39	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5553-5731-b4a3-e7c106ce1261	SG	SGP	702	Singapore 	Singapur	\N
00040000-5553-5731-9ffe-a8d272f7f757	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5553-5731-58b7-4ca3941e96af	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5553-5731-70b2-48c6cb0de6f1	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5553-5731-5aa5-7a3b8e88d220	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5553-5731-45cf-2b15c5e2a5f5	SO	SOM	706	Somalia 	Somalija	\N
00040000-5553-5731-29d2-4ba2ca9eabdc	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5553-5731-e087-b78d7818a022	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5553-5731-9b41-fe8f303a92a0	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5553-5731-2e4a-660cc03b8e09	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5553-5731-a575-6810524cc4ae	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5553-5731-3934-95a437fbdfd4	SD	SDN	729	Sudan 	Sudan	\N
00040000-5553-5731-1f00-ca5a82bd69f8	SR	SUR	740	Suriname 	Surinam	\N
00040000-5553-5731-8783-04084924b856	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5553-5731-e783-28290013be82	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5553-5731-767d-e739bd1f3b95	SE	SWE	752	Sweden 	Švedska	\N
00040000-5553-5731-7edd-83533be70390	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5553-5731-250f-14590c8caa2b	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5553-5731-66e9-0c840c84a444	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5553-5731-4cc1-42b9105e5966	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5553-5731-67bf-d45b85da3bd7	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5553-5731-e1f5-ee8a42b858c6	TH	THA	764	Thailand 	Tajska	\N
00040000-5553-5731-dd8e-abe9d76eaac8	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5553-5731-c0f0-5de480f6f12a	TG	TGO	768	Togo 	Togo	\N
00040000-5553-5731-5502-68e382273bd6	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5553-5731-eacb-2d9e794025ce	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5553-5731-04d0-f6b68e6a8aed	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5553-5731-031c-60bd4013ff18	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5553-5731-b36e-18561a7cdd64	TR	TUR	792	Turkey 	Turčija	\N
00040000-5553-5731-b1e3-e5b3eaea5659	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5553-5731-928b-e3411fcb3256	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5553-5731-abce-848530d22b27	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5553-5731-a14b-4dc1ed63e01b	UG	UGA	800	Uganda 	Uganda	\N
00040000-5553-5731-67f4-d7cdb5f17d13	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5553-5731-048e-6ec04d593120	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5553-5731-331f-e6c0ce227fa2	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5553-5731-4982-e74c4ce73b18	US	USA	840	United States 	Združene države Amerike	\N
00040000-5553-5731-8ca6-3ccf6d2a4979	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5553-5731-aa82-9309b3e508a0	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5553-5731-c22b-9837b21e29e2	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5553-5731-1fed-7e4d45d1c1b8	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5553-5731-c13f-e3e93e2b2a93	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5553-5731-761f-1ab35b4f76ed	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5553-5731-95f1-47415d488fe6	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5553-5731-5df1-474cc122b5c5	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5553-5731-a67f-35e137bded81	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5553-5731-327d-99da88646fe5	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5553-5731-c280-98ab57f061a8	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5553-5731-b010-b20424dc39d9	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5553-5731-fea2-93b3396172e0	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2675 (class 0 OID 3331128)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 3330947)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 3330997)
-- Dependencies: 195
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 3331046)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 3331071)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 3330896)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5553-5731-30c7-4cc418867c9a	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5553-5731-41f0-ac71e5b36746	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5553-5731-e392-1c8dfc841f96	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5553-5731-842e-8f526d4afb46	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5553-5731-88f3-c1372e0f1a95	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5553-5731-8601-a3f67065b87b	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5553-5731-1e3a-d8456dae5174	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5553-5731-eb39-9e365f845936	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5553-5731-7bff-3decbfbceebe	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5553-5731-0348-63b32704e8ba	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2643 (class 0 OID 3330804)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5553-5731-205d-ee32ff7aa330	00000000-5553-5731-88f3-c1372e0f1a95	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5553-5731-3898-0f9e1bf3143b	00000000-5553-5731-88f3-c1372e0f1a95	00010000-5553-5731-c282-fd0bc44f2bf0	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5553-5731-db3c-981248f685e5	00000000-5553-5731-8601-a3f67065b87b	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2644 (class 0 OID 3330815)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 3330866)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 3330769)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5553-5731-b168-978b54d4c5f5	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5553-5731-c5e7-5f9555a4ecdd	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5553-5731-6680-2996d63aeed6	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5553-5731-b845-7e58b049a0e6	Abonma-read	Abonma - branje	f
00030000-5553-5731-c90f-633e44abffea	Abonma-write	Abonma - spreminjanje	f
00030000-5553-5731-59d8-268a50ac5262	Alternacija-read	Alternacija - branje	f
00030000-5553-5731-13eb-5c4e5cf0a935	Alternacija-write	Alternacija - spreminjanje	f
00030000-5553-5731-82a2-d7817d2dbb8f	Arhivalija-read	Arhivalija - branje	f
00030000-5553-5731-3358-a40b242a2a50	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5553-5731-3d0a-2b4a742620c8	Besedilo-read	Besedilo - branje	f
00030000-5553-5731-8e94-8fa8110887ca	Besedilo-write	Besedilo - spreminjanje	f
00030000-5553-5731-5a86-f917a156260c	DogodekIzven-read	DogodekIzven - branje	f
00030000-5553-5731-eff7-36895d1910f7	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5553-5731-840c-b4b364023397	Dogodek-read	Dogodek - branje	f
00030000-5553-5731-1471-86301dc3ccac	Dogodek-write	Dogodek - spreminjanje	f
00030000-5553-5731-600d-094453b68834	Drzava-read	Drzava - branje	f
00030000-5553-5731-28dd-c09cfec4e398	Drzava-write	Drzava - spreminjanje	f
00030000-5553-5731-5396-a52d46414d8f	Funkcija-read	Funkcija - branje	f
00030000-5553-5731-c84a-fa96d13f36e6	Funkcija-write	Funkcija - spreminjanje	f
00030000-5553-5731-f1b8-be34f34e5394	Gostovanje-read	Gostovanje - branje	f
00030000-5553-5731-0743-52bdfc9b3d05	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5553-5731-2ac3-1b09dccd9d65	Gostujoca-read	Gostujoca - branje	f
00030000-5553-5731-f90d-41b699199542	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5553-5731-ad30-b923a9981509	Kupec-read	Kupec - branje	f
00030000-5553-5731-33da-53e563ea92c6	Kupec-write	Kupec - spreminjanje	f
00030000-5553-5731-8a37-b99cf35d429b	NacinPlacina-read	NacinPlacina - branje	f
00030000-5553-5731-c103-af9966dd1acb	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5553-5731-c833-c9583e4744fd	Option-read	Option - branje	f
00030000-5553-5731-b244-28ceb7bd2776	Option-write	Option - spreminjanje	f
00030000-5553-5731-fcc7-0a5f3710e937	OptionValue-read	OptionValue - branje	f
00030000-5553-5731-e1f1-71a52bede9f5	OptionValue-write	OptionValue - spreminjanje	f
00030000-5553-5731-b44b-008b5cf667d6	Oseba-read	Oseba - branje	f
00030000-5553-5731-7037-579b261511c5	Oseba-write	Oseba - spreminjanje	f
00030000-5553-5731-142e-396f8c7f2ae3	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5553-5731-2e45-648d8ceee83b	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5553-5731-edd5-ff94c1c52f4b	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5553-5731-03c2-e1734a046e60	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5553-5731-cf9c-cdfb7f35483f	Pogodba-read	Pogodba - branje	f
00030000-5553-5731-5a81-ddbd19e6ca97	Pogodba-write	Pogodba - spreminjanje	f
00030000-5553-5731-bd61-35736af6c028	Popa-read	Popa - branje	f
00030000-5553-5731-4bca-4699ad91d271	Popa-write	Popa - spreminjanje	f
00030000-5553-5731-4251-8184b18cd1d4	Posta-read	Posta - branje	f
00030000-5553-5731-ec4e-2fee5da67c13	Posta-write	Posta - spreminjanje	f
00030000-5553-5731-bd6a-3dec11fa9768	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5553-5731-e6eb-46f982688a9b	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5553-5731-8a45-11645d6475ce	PostniNaslov-read	PostniNaslov - branje	f
00030000-5553-5731-4b29-e7d2a2cee164	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5553-5731-3819-c09e555955e0	Predstava-read	Predstava - branje	f
00030000-5553-5731-74d1-a46581be91f4	Predstava-write	Predstava - spreminjanje	f
00030000-5553-5731-735f-5703a178afaf	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5553-5731-078d-14f05a0bd82f	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5553-5731-dd24-0b5134afe268	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5553-5731-51e4-8e37eeb0a24f	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5553-5731-8b04-27d7b501466c	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5553-5731-8e40-0f36f8401636	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5553-5731-344d-cda9689bc6c7	Prostor-read	Prostor - branje	f
00030000-5553-5731-9b49-8a68b78567b5	Prostor-write	Prostor - spreminjanje	f
00030000-5553-5731-f32f-98811cbc2e44	Racun-read	Racun - branje	f
00030000-5553-5731-da73-4d37835be49a	Racun-write	Racun - spreminjanje	f
00030000-5553-5731-59e2-705bb053fb5a	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5553-5731-2ae5-3257d67858e0	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5553-5731-fc1f-dca269dbb80f	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5553-5731-5803-065f9607dba1	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5553-5731-b5d9-4791fcd9f93e	Rekvizit-read	Rekvizit - branje	f
00030000-5553-5731-cd27-407575d2b8e8	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5553-5731-366b-f0e69dcf996b	Rezervacija-read	Rezervacija - branje	f
00030000-5553-5731-a44e-2ed82e270309	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5553-5731-bd5a-5078c51ca82a	SedezniRed-read	SedezniRed - branje	f
00030000-5553-5731-e7d4-c7f3548daa41	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5553-5731-da06-b9275318853f	Sedez-read	Sedez - branje	f
00030000-5553-5731-8c1f-39b4bae065d3	Sedez-write	Sedez - spreminjanje	f
00030000-5553-5731-89ba-4cdea2497234	Sezona-read	Sezona - branje	f
00030000-5553-5731-32b9-12f96ba85eb6	Sezona-write	Sezona - spreminjanje	f
00030000-5553-5731-60d5-c11d032c1efe	Telefonska-read	Telefonska - branje	f
00030000-5553-5731-efee-06db62ebc6af	Telefonska-write	Telefonska - spreminjanje	f
00030000-5553-5731-b467-f7394857d610	TerminStoritve-read	TerminStoritve - branje	f
00030000-5553-5731-fcc0-a6b614bff9b4	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5553-5731-450a-2db566dce2e2	TipFunkcije-read	TipFunkcije - branje	f
00030000-5553-5731-f7e6-0ee1f4098520	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5553-5731-bcd1-549c85690e14	Trr-read	Trr - branje	f
00030000-5553-5731-d19f-74eb2c9058c2	Trr-write	Trr - spreminjanje	f
00030000-5553-5731-f08f-12d38b2f43f4	Uprizoritev-read	Uprizoritev - branje	f
00030000-5553-5731-e647-a04e7b317bde	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5553-5731-f99a-d19d649a1208	Vaja-read	Vaja - branje	f
00030000-5553-5731-7b38-5863bd9b88b3	Vaja-write	Vaja - spreminjanje	f
00030000-5553-5731-1ce0-8c57e409cc46	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5553-5731-408a-16103d3e4439	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5553-5731-7ac9-77d77c7f513b	Zaposlitev-read	Zaposlitev - branje	f
00030000-5553-5731-cd4f-7c76bc49643d	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5553-5731-36eb-62114ea1562b	Zasedenost-read	Zasedenost - branje	f
00030000-5553-5731-51a6-396fab9a2cfb	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5553-5731-6c46-ef1af0f8c428	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5553-5731-2e84-5cd506e2d831	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5553-5731-ca77-04a48b8a74a4	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5553-5731-4fbd-023c03116a35	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2641 (class 0 OID 3330788)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5553-5731-c7aa-67c86cb87351	00030000-5553-5731-600d-094453b68834
00020000-5553-5731-6f5e-5a04c9315466	00030000-5553-5731-28dd-c09cfec4e398
00020000-5553-5731-6f5e-5a04c9315466	00030000-5553-5731-600d-094453b68834
\.


--
-- TOC entry 2669 (class 0 OID 3331078)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 3331108)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2684 (class 0 OID 3331223)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 3330846)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 3330888)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5553-5731-4546-9fcf9ef0405e	8341	Adlešiči
00050000-5553-5731-4d89-8a45d480bb11	5270	Ajdovščina
00050000-5553-5731-71ae-c93a10fa21e9	6280	Ankaran/Ancarano
00050000-5553-5731-52f2-3db0574404ff	9253	Apače
00050000-5553-5731-fb9f-702e86893577	8253	Artiče
00050000-5553-5731-aa28-06f3ed4b7af4	4275	Begunje na Gorenjskem
00050000-5553-5731-43cd-7e59b4bdcefb	1382	Begunje pri Cerknici
00050000-5553-5731-8f7e-1012d3082c92	9231	Beltinci
00050000-5553-5731-bd06-a9159447b353	2234	Benedikt
00050000-5553-5731-2690-4199d8ba49e5	2345	Bistrica ob Dravi
00050000-5553-5731-25c4-6ae6e3e1f5e8	3256	Bistrica ob Sotli
00050000-5553-5731-0c3b-e2914ec94570	8259	Bizeljsko
00050000-5553-5731-02d9-fabf52276879	1223	Blagovica
00050000-5553-5731-7d33-9ff5aaa74c01	8283	Blanca
00050000-5553-5731-026a-70a1ec322349	4260	Bled
00050000-5553-5731-31b0-1268a29da76f	4273	Blejska Dobrava
00050000-5553-5731-8872-39f62913d015	9265	Bodonci
00050000-5553-5731-41b5-28776f0fd6f4	9222	Bogojina
00050000-5553-5731-e085-ef5004cb274a	4263	Bohinjska Bela
00050000-5553-5731-3446-69a4f05db63f	4264	Bohinjska Bistrica
00050000-5553-5731-723c-1f196c9ef7e0	4265	Bohinjsko jezero
00050000-5553-5731-8539-1894dc409c4d	1353	Borovnica
00050000-5553-5731-8a4a-f7b38c41e9b2	8294	Boštanj
00050000-5553-5731-a9bd-542d5d1bebaa	5230	Bovec
00050000-5553-5731-8f28-fd4573771434	5295	Branik
00050000-5553-5731-c4a0-4cf7016fe8d9	3314	Braslovče
00050000-5553-5731-1b92-a865cf75c47a	5223	Breginj
00050000-5553-5731-9cc8-9a2917bb1552	8280	Brestanica
00050000-5553-5731-42ac-d2bcd84cdd26	2354	Bresternica
00050000-5553-5731-e850-6c7e68e63ae4	4243	Brezje
00050000-5553-5731-0275-b3a1554387c3	1351	Brezovica pri Ljubljani
00050000-5553-5731-bbbb-5c3d5903d1ac	8250	Brežice
00050000-5553-5731-7ffb-a16712574386	4210	Brnik - Aerodrom
00050000-5553-5731-fbf6-da5ad09bc1c9	8321	Brusnice
00050000-5553-5731-84e1-2c07decb6ebd	3255	Buče
00050000-5553-5731-61c0-334b0562cd86	8276	Bučka 
00050000-5553-5731-8829-6391add0fe94	9261	Cankova
00050000-5553-5731-2712-078db540f135	3000	Celje 
00050000-5553-5731-05e8-14a957f8ff1d	3001	Celje - poštni predali
00050000-5553-5731-6533-9d7406e10002	4207	Cerklje na Gorenjskem
00050000-5553-5731-5988-147ea6f91893	8263	Cerklje ob Krki
00050000-5553-5731-1918-7c34ff23d69c	1380	Cerknica
00050000-5553-5731-a465-c9a0b4ff12e4	5282	Cerkno
00050000-5553-5731-5ca4-e4b583c9079f	2236	Cerkvenjak
00050000-5553-5731-81bd-12e61a24656f	2215	Ceršak
00050000-5553-5731-b308-74bdd0b8e3af	2326	Cirkovce
00050000-5553-5731-b2aa-a2c8233ec223	2282	Cirkulane
00050000-5553-5731-9bcb-30d1acd9ef96	5273	Col
00050000-5553-5731-2819-96b57902f69a	8251	Čatež ob Savi
00050000-5553-5731-1663-a10c49e90dde	1413	Čemšenik
00050000-5553-5731-4ea9-a2f264cfe7c6	5253	Čepovan
00050000-5553-5731-8101-cd1840dd3e38	9232	Črenšovci
00050000-5553-5731-0b17-b1810bed7c86	2393	Črna na Koroškem
00050000-5553-5731-2236-b71299388f05	6275	Črni Kal
00050000-5553-5731-7275-f9142bbc88e7	5274	Črni Vrh nad Idrijo
00050000-5553-5731-dd80-aaafe1250f77	5262	Črniče
00050000-5553-5731-9f59-a82411b24629	8340	Črnomelj
00050000-5553-5731-f0b8-962701c1e9dd	6271	Dekani
00050000-5553-5731-5699-739ac5230e69	5210	Deskle
00050000-5553-5731-ba8a-a078af789b75	2253	Destrnik
00050000-5553-5731-f810-e6f7bbc6bdca	6215	Divača
00050000-5553-5731-3daf-6bf97d47ab70	1233	Dob
00050000-5553-5731-d63d-e1496199273f	3224	Dobje pri Planini
00050000-5553-5731-9d1f-cf5a46d3d608	8257	Dobova
00050000-5553-5731-e3f6-2844212dbab7	1423	Dobovec
00050000-5553-5731-1e18-10e87cc04647	5263	Dobravlje
00050000-5553-5731-0131-67bc56329bd3	3204	Dobrna
00050000-5553-5731-0e29-b091524a4445	8211	Dobrnič
00050000-5553-5731-549d-82048b8b6417	1356	Dobrova
00050000-5553-5731-3eef-f5f909cb3a4a	9223	Dobrovnik/Dobronak 
00050000-5553-5731-7ff5-41f893bec93f	5212	Dobrovo v Brdih
00050000-5553-5731-d4ab-c15abd3114d8	1431	Dol pri Hrastniku
00050000-5553-5731-a5a2-f64f4b7277c6	1262	Dol pri Ljubljani
00050000-5553-5731-1fed-6bc8ecaa2af0	1273	Dole pri Litiji
00050000-5553-5731-337c-3a24f32adc99	1331	Dolenja vas
00050000-5553-5731-3d9e-f8693a0bbabe	8350	Dolenjske Toplice
00050000-5553-5731-42c5-262fde3e6de8	1230	Domžale
00050000-5553-5731-1e7b-c75e4a58616f	2252	Dornava
00050000-5553-5731-f3d5-4f1d76e4ccd6	5294	Dornberk
00050000-5553-5731-f1f2-444e6a67e1f6	1319	Draga
00050000-5553-5731-bfa9-011fa015d490	8343	Dragatuš
00050000-5553-5731-8d85-c41663db99c5	3222	Dramlje
00050000-5553-5731-8b81-dfeada79441d	2370	Dravograd
00050000-5553-5731-b34a-6845c0802602	4203	Duplje
00050000-5553-5731-7d30-00a4cc65c870	6221	Dutovlje
00050000-5553-5731-8014-99010d04fdaa	8361	Dvor
00050000-5553-5731-89c5-9986a2317ae4	2343	Fala
00050000-5553-5731-0297-c4cba38206cc	9208	Fokovci
00050000-5553-5731-fb40-44d4f2f95dda	2313	Fram
00050000-5553-5731-bf9a-c1dbfdaa8f59	3213	Frankolovo
00050000-5553-5731-1000-7a3300ce4219	1274	Gabrovka
00050000-5553-5731-0aeb-91d9d933b0a3	8254	Globoko
00050000-5553-5731-689a-11ce7a8572c5	5275	Godovič
00050000-5553-5731-bc3e-c94348774d3a	4204	Golnik
00050000-5553-5731-a1e3-5de2ca8882e1	3303	Gomilsko
00050000-5553-5731-d153-203c9089bdbf	4224	Gorenja vas
00050000-5553-5731-3719-60d8b0447f2e	3263	Gorica pri Slivnici
00050000-5553-5731-caaf-5442e9b3b24c	2272	Gorišnica
00050000-5553-5731-ab40-5e17698fa55a	9250	Gornja Radgona
00050000-5553-5731-412c-f81854525aac	3342	Gornji Grad
00050000-5553-5731-dd0e-72e449732fd9	4282	Gozd Martuljek
00050000-5553-5731-06f3-331e426944c1	6272	Gračišče
00050000-5553-5731-7741-f60d0a60594f	9264	Grad
00050000-5553-5731-091c-b18c3da2b180	8332	Gradac
00050000-5553-5731-2e61-eaa64b8e3381	1384	Grahovo
00050000-5553-5731-faa6-4e2d83a24dec	5242	Grahovo ob Bači
00050000-5553-5731-9d5a-b082646aea7d	5251	Grgar
00050000-5553-5731-dbbd-685a08022c6c	3302	Griže
00050000-5553-5731-2dd9-15207268bfaa	3231	Grobelno
00050000-5553-5731-ea8f-82153a131a86	1290	Grosuplje
00050000-5553-5731-6048-30731681545b	2288	Hajdina
00050000-5553-5731-14d1-05ddf3e965ca	8362	Hinje
00050000-5553-5731-a0ea-608886f78e50	2311	Hoče
00050000-5553-5731-24e4-1ac99cf94a6c	9205	Hodoš/Hodos
00050000-5553-5731-9f4e-955389f5d47a	1354	Horjul
00050000-5553-5731-2b35-66924dfb6a24	1372	Hotedršica
00050000-5553-5731-942d-773869b64af6	1430	Hrastnik
00050000-5553-5731-c159-0b77cbfb897a	6225	Hruševje
00050000-5553-5731-629e-6c45c933501e	4276	Hrušica
00050000-5553-5731-e453-48e59b6f05be	5280	Idrija
00050000-5553-5731-4f13-8264ae950fa2	1292	Ig
00050000-5553-5731-e079-62a05267d69a	6250	Ilirska Bistrica
00050000-5553-5731-764f-0088cf3fc2e2	6251	Ilirska Bistrica-Trnovo
00050000-5553-5731-8133-57a2c4215d3f	1295	Ivančna Gorica
00050000-5553-5731-4f0b-dd7b53e7154d	2259	Ivanjkovci
00050000-5553-5731-6d92-a2b013f13255	1411	Izlake
00050000-5553-5731-0871-f2c030449469	6310	Izola/Isola
00050000-5553-5731-e7e5-3a904de6f989	2222	Jakobski Dol
00050000-5553-5731-a336-bd9f02d86e04	2221	Jarenina
00050000-5553-5731-80b3-84faaaaa509c	6254	Jelšane
00050000-5553-5731-279e-d86c415e2d0c	4270	Jesenice
00050000-5553-5731-057a-87e7cced2e8a	8261	Jesenice na Dolenjskem
00050000-5553-5731-a2d8-a9b1f0e78e1a	3273	Jurklošter
00050000-5553-5731-5c46-585526b3a2d8	2223	Jurovski Dol
00050000-5553-5731-3556-5a38bddf4bd5	2256	Juršinci
00050000-5553-5731-af12-42200a89cfbc	5214	Kal nad Kanalom
00050000-5553-5731-6ab7-b2f09bcc543d	3233	Kalobje
00050000-5553-5731-afb6-f862a628e3e2	4246	Kamna Gorica
00050000-5553-5731-7fd0-61c13ddd459e	2351	Kamnica
00050000-5553-5731-1590-ea75f2ac3036	1241	Kamnik
00050000-5553-5731-4167-74194f86840b	5213	Kanal
00050000-5553-5731-57aa-f9c340213421	8258	Kapele
00050000-5553-5731-3ba7-1dee6c9a802f	2362	Kapla
00050000-5553-5731-a7cf-039a19b4858f	2325	Kidričevo
00050000-5553-5731-8f50-b5d2c8bd432a	1412	Kisovec
00050000-5553-5731-74b6-dc75917e441e	6253	Knežak
00050000-5553-5731-77e3-093956488160	5222	Kobarid
00050000-5553-5731-5e9f-bc497534ccbe	9227	Kobilje
00050000-5553-5731-d961-815354baddc4	1330	Kočevje
00050000-5553-5731-a357-e779a8dcfa99	1338	Kočevska Reka
00050000-5553-5731-d500-d66ab0b8aa31	2276	Kog
00050000-5553-5731-8cfb-0866b24db82d	5211	Kojsko
00050000-5553-5731-5117-c6ce4ed77e3e	6223	Komen
00050000-5553-5731-e6f0-b4912c8d175f	1218	Komenda
00050000-5553-5731-bf99-fbe976980a30	6000	Koper/Capodistria 
00050000-5553-5731-e5b3-44cb6f84b26b	6001	Koper/Capodistria - poštni predali
00050000-5553-5731-2dac-8aa7294d184a	8282	Koprivnica
00050000-5553-5731-58bf-390d8167cc80	5296	Kostanjevica na Krasu
00050000-5553-5731-8f33-8288f3d65ae4	8311	Kostanjevica na Krki
00050000-5553-5731-a337-f05a3935ef2e	1336	Kostel
00050000-5553-5731-3bb0-1b4a7d5cebfa	6256	Košana
00050000-5553-5731-0396-73257fc0c927	2394	Kotlje
00050000-5553-5731-2df2-526b05190ddd	6240	Kozina
00050000-5553-5731-5e4a-bdb77fc64e01	3260	Kozje
00050000-5553-5731-3eb1-1d08aa53abcd	4000	Kranj 
00050000-5553-5731-e602-8239b94853fb	4001	Kranj - poštni predali
00050000-5553-5731-2483-5cb9a5258ba0	4280	Kranjska Gora
00050000-5553-5731-c775-f65697a6fcf8	1281	Kresnice
00050000-5553-5731-a5ca-dee9a02f2490	4294	Križe
00050000-5553-5731-396e-195ff26f6cc7	9206	Križevci
00050000-5553-5731-efa3-8ad13e51140a	9242	Križevci pri Ljutomeru
00050000-5553-5731-828a-153e9f406b95	1301	Krka
00050000-5553-5731-311a-b3d8d418361a	8296	Krmelj
00050000-5553-5731-f752-d8f6bea0243e	4245	Kropa
00050000-5553-5731-21b4-05c29bf35d51	8262	Krška vas
00050000-5553-5731-acd2-d0b673b6e806	8270	Krško
00050000-5553-5731-a5bd-9d7b8f67625a	9263	Kuzma
00050000-5553-5731-3621-45b3777aa0a3	2318	Laporje
00050000-5553-5731-02a9-6ba49b16871e	3270	Laško
00050000-5553-5731-8d42-7cf5462bec1e	1219	Laze v Tuhinju
00050000-5553-5731-5747-b93c758afbc7	2230	Lenart v Slovenskih goricah
00050000-5553-5731-bb44-34d7b1ef8bf0	9220	Lendava/Lendva
00050000-5553-5731-0de3-f653e6dfe858	4248	Lesce
00050000-5553-5731-fd52-338adf4318a6	3261	Lesično
00050000-5553-5731-eafb-9f3c71d21a81	8273	Leskovec pri Krškem
00050000-5553-5731-96d7-160de11b8c28	2372	Libeliče
00050000-5553-5731-b765-0a5a71cb6750	2341	Limbuš
00050000-5553-5731-7b48-fea8f1d9ac7f	1270	Litija
00050000-5553-5731-95ac-fa8be8b92722	3202	Ljubečna
00050000-5553-5731-2826-1efdf3e10adb	1000	Ljubljana 
00050000-5553-5731-773b-609e8ac61e7b	1001	Ljubljana - poštni predali
00050000-5553-5731-424f-bb3f39f175f1	1231	Ljubljana - Črnuče
00050000-5553-5731-84eb-5e868880e15e	1261	Ljubljana - Dobrunje
00050000-5553-5731-e42a-55cdc9124725	1260	Ljubljana - Polje
00050000-5553-5731-9159-74d7b58d06e6	1210	Ljubljana - Šentvid
00050000-5553-5731-eb64-9f8afd167c3f	1211	Ljubljana - Šmartno
00050000-5553-5731-5699-0c7155365b16	3333	Ljubno ob Savinji
00050000-5553-5731-676a-93468bcbaf8a	9240	Ljutomer
00050000-5553-5731-75c9-9ae9c9d21a71	3215	Loče
00050000-5553-5731-d4df-379305a5539c	5231	Log pod Mangartom
00050000-5553-5731-953d-1f410f0bc6b5	1358	Log pri Brezovici
00050000-5553-5731-f9fe-188a0c960139	1370	Logatec
00050000-5553-5731-e5ef-827572f2ef72	1371	Logatec
00050000-5553-5731-d13e-b782b191f79f	1434	Loka pri Zidanem Mostu
00050000-5553-5731-cb63-9b23d367ca44	3223	Loka pri Žusmu
00050000-5553-5731-bbbc-d9ec662ad743	6219	Lokev
00050000-5553-5731-2c17-a1b316ad5441	1318	Loški Potok
00050000-5553-5731-d0df-eba8e2424849	2324	Lovrenc na Dravskem polju
00050000-5553-5731-e58c-d3daf9ef9ff0	2344	Lovrenc na Pohorju
00050000-5553-5731-3e05-91d699afd150	3334	Luče
00050000-5553-5731-6877-ca14efde0f7f	1225	Lukovica
00050000-5553-5731-7133-9f5de5cbf436	9202	Mačkovci
00050000-5553-5731-9293-2c974a4d4bfc	2322	Majšperk
00050000-5553-5731-ca0d-bc29c10d6ee7	2321	Makole
00050000-5553-5731-8968-2d601cf75ff8	9243	Mala Nedelja
00050000-5553-5731-1e10-e20bf5e44ac6	2229	Malečnik
00050000-5553-5731-bdf4-580be381e053	6273	Marezige
00050000-5553-5731-7a1a-6cc8d6e9506e	2000	Maribor 
00050000-5553-5731-3734-5b8fb2189e0b	2001	Maribor - poštni predali
00050000-5553-5731-1ba2-1fb016dac7b1	2206	Marjeta na Dravskem polju
00050000-5553-5731-268f-ac72834f8c9f	2281	Markovci
00050000-5553-5731-1fda-50f8f597e985	9221	Martjanci
00050000-5553-5731-f25d-3a35736a183c	6242	Materija
00050000-5553-5731-179d-f969461a5e93	4211	Mavčiče
00050000-5553-5731-3e0d-291f699d597b	1215	Medvode
00050000-5553-5731-7269-a345216564b8	1234	Mengeš
00050000-5553-5731-fd44-2c71cb69041d	8330	Metlika
00050000-5553-5731-0133-79a3eba634ea	2392	Mežica
00050000-5553-5731-261c-18b6f83e0bae	2204	Miklavž na Dravskem polju
00050000-5553-5731-9067-fa2e4ec6a01a	2275	Miklavž pri Ormožu
00050000-5553-5731-6512-57673271309f	5291	Miren
00050000-5553-5731-b9b5-db7556becb8b	8233	Mirna
00050000-5553-5731-ca42-47fa674cf6f7	8216	Mirna Peč
00050000-5553-5731-abb5-7f4745674b9d	2382	Mislinja
00050000-5553-5731-acb0-c073217ed0e8	4281	Mojstrana
00050000-5553-5731-3ae9-0da883b37497	8230	Mokronog
00050000-5553-5731-d722-b6d35178b49c	1251	Moravče
00050000-5553-5731-eff7-6fd95244ad2f	9226	Moravske Toplice
00050000-5553-5731-2b12-8903836ed9fc	5216	Most na Soči
00050000-5553-5731-e3ea-5dd2a8e70df0	1221	Motnik
00050000-5553-5731-0d89-c613bbdc1814	3330	Mozirje
00050000-5553-5731-d565-28e14d43375b	9000	Murska Sobota 
00050000-5553-5731-3f94-3d62526454d3	9001	Murska Sobota - poštni predali
00050000-5553-5731-7b5d-66fa45d648f8	2366	Muta
00050000-5553-5731-101e-7062adf8caf2	4202	Naklo
00050000-5553-5731-1a16-f0878b48ea2e	3331	Nazarje
00050000-5553-5731-cef1-7a86a2bc29fd	1357	Notranje Gorice
00050000-5553-5731-847c-99425a212d3c	3203	Nova Cerkev
00050000-5553-5731-43c3-097aeef6d04b	5000	Nova Gorica 
00050000-5553-5731-1d9a-dc27f527da2c	5001	Nova Gorica - poštni predali
00050000-5553-5731-33e8-216e21676e85	1385	Nova vas
00050000-5553-5731-28d7-8b4e5e9a12b8	8000	Novo mesto
00050000-5553-5731-ad5a-44c4d548bb7d	8001	Novo mesto - poštni predali
00050000-5553-5731-5803-b4866c0139c6	6243	Obrov
00050000-5553-5731-964d-92b88d01fe1a	9233	Odranci
00050000-5553-5731-c3c9-99e5f20b7efe	2317	Oplotnica
00050000-5553-5731-6929-cada75eafe86	2312	Orehova vas
00050000-5553-5731-2fe7-d7a9613979a8	2270	Ormož
00050000-5553-5731-6c4b-78b3f4fcc645	1316	Ortnek
00050000-5553-5731-1490-5be6bafc70cc	1337	Osilnica
00050000-5553-5731-c6bb-7203a45e5110	8222	Otočec
00050000-5553-5731-1fc7-8016382b369c	2361	Ožbalt
00050000-5553-5731-7a5a-083b8f3c5cbb	2231	Pernica
00050000-5553-5731-3dad-9e1a52f91c11	2211	Pesnica pri Mariboru
00050000-5553-5731-ee4a-e3899b375474	9203	Petrovci
00050000-5553-5731-e43f-fc32693b9cc5	3301	Petrovče
00050000-5553-5731-f617-04abb78578ae	6330	Piran/Pirano
00050000-5553-5731-b76e-edf3eda40dd3	8255	Pišece
00050000-5553-5731-5820-c9a2f25411bc	6257	Pivka
00050000-5553-5731-b629-4b5aa52e6247	6232	Planina
00050000-5553-5731-1a41-9c09d072f2e3	3225	Planina pri Sevnici
00050000-5553-5731-e63a-3d45e9636d47	6276	Pobegi
00050000-5553-5731-9955-2fa96066bfc9	8312	Podbočje
00050000-5553-5731-598f-f6fa271d1f91	5243	Podbrdo
00050000-5553-5731-d366-6333535a1538	3254	Podčetrtek
00050000-5553-5731-057a-fa8f1f662672	2273	Podgorci
00050000-5553-5731-a88a-a569547957ae	6216	Podgorje
00050000-5553-5731-4e49-5e85e3a0a941	2381	Podgorje pri Slovenj Gradcu
00050000-5553-5731-bffb-8b0528592d9e	6244	Podgrad
00050000-5553-5731-8c06-9ec0c1ebaf8d	1414	Podkum
00050000-5553-5731-1f95-dae2476f653d	2286	Podlehnik
00050000-5553-5731-b8af-5f11fb8d8196	5272	Podnanos
00050000-5553-5731-0e27-75644b0eee5e	4244	Podnart
00050000-5553-5731-1423-431377d59138	3241	Podplat
00050000-5553-5731-3846-74795d46c63f	3257	Podsreda
00050000-5553-5731-620e-4dc14ee628f3	2363	Podvelka
00050000-5553-5731-3fdc-e0bbfb9b946e	2208	Pohorje
00050000-5553-5731-febb-418547dc2296	2257	Polenšak
00050000-5553-5731-9756-602f4f6ad071	1355	Polhov Gradec
00050000-5553-5731-b6d2-79d491237347	4223	Poljane nad Škofjo Loko
00050000-5553-5731-c58a-48cc3b731c3b	2319	Poljčane
00050000-5553-5731-126a-9954c22e4730	1272	Polšnik
00050000-5553-5731-2c1d-f968cefa6fda	3313	Polzela
00050000-5553-5731-48af-7da5f64d09a7	3232	Ponikva
00050000-5553-5731-473b-20a9e8c5c8bf	6320	Portorož/Portorose
00050000-5553-5731-d27f-2cabb74a1687	6230	Postojna
00050000-5553-5731-f064-52747e475534	2331	Pragersko
00050000-5553-5731-09c4-61279838eee2	3312	Prebold
00050000-5553-5731-6eb9-e3efe9611912	4205	Preddvor
00050000-5553-5731-3926-44d6834f9f19	6255	Prem
00050000-5553-5731-7daa-ac0b5d7dc3ab	1352	Preserje
00050000-5553-5731-e5fc-37250746d711	6258	Prestranek
00050000-5553-5731-504c-892b19dbe502	2391	Prevalje
00050000-5553-5731-f2e2-857a34d44234	3262	Prevorje
00050000-5553-5731-bd41-89c11b25da32	1276	Primskovo 
00050000-5553-5731-3684-a48c89877027	3253	Pristava pri Mestinju
00050000-5553-5731-f446-a083acaebe7b	9207	Prosenjakovci/Partosfalva
00050000-5553-5731-b0e8-4dca672d5453	5297	Prvačina
00050000-5553-5731-6760-6e0224e79492	2250	Ptuj
00050000-5553-5731-6cf6-ad2f1439c808	2323	Ptujska Gora
00050000-5553-5731-59a5-96651f0f89e5	9201	Puconci
00050000-5553-5731-bb81-6246f9d0092a	2327	Rače
00050000-5553-5731-41a2-39ba6f290558	1433	Radeče
00050000-5553-5731-d384-b8dc1a34a5de	9252	Radenci
00050000-5553-5731-2ee0-d818a89dc367	2360	Radlje ob Dravi
00050000-5553-5731-bbdd-c39edaa770cd	1235	Radomlje
00050000-5553-5731-484d-890130ece831	4240	Radovljica
00050000-5553-5731-b72a-15492ae128d1	8274	Raka
00050000-5553-5731-45b1-6f274e362bc6	1381	Rakek
00050000-5553-5731-fc1d-7ca74456250d	4283	Rateče - Planica
00050000-5553-5731-bb9f-b57972ee167d	2390	Ravne na Koroškem
00050000-5553-5731-adb0-482c97d93c79	9246	Razkrižje
00050000-5553-5731-6524-255a869c1ad4	3332	Rečica ob Savinji
00050000-5553-5731-ca6d-a576c585f45b	5292	Renče
00050000-5553-5731-d5ec-87bb7266dd90	1310	Ribnica
00050000-5553-5731-31d6-4c47735f4c82	2364	Ribnica na Pohorju
00050000-5553-5731-25e3-0d6725eb737d	3272	Rimske Toplice
00050000-5553-5731-f6d1-cc10a170a18a	1314	Rob
00050000-5553-5731-d6fe-dcde799faaaa	5215	Ročinj
00050000-5553-5731-4d8d-4c6d2236a18a	3250	Rogaška Slatina
00050000-5553-5731-6953-5c5ffa674dd7	9262	Rogašovci
00050000-5553-5731-9039-a6febfda19cb	3252	Rogatec
00050000-5553-5731-0186-9b1e592cc06b	1373	Rovte
00050000-5553-5731-d658-03312785a5fa	2342	Ruše
00050000-5553-5731-068a-3bccba6e1cee	1282	Sava
00050000-5553-5731-6f68-1816c5fae2b8	6333	Sečovlje/Sicciole
00050000-5553-5731-10d6-acd4192d073b	4227	Selca
00050000-5553-5731-e55a-5712f2d689c7	2352	Selnica ob Dravi
00050000-5553-5731-b664-a546a42f0c7a	8333	Semič
00050000-5553-5731-a0a7-b7f5bc2a77a8	8281	Senovo
00050000-5553-5731-f8ce-e13c1af4d7a4	6224	Senožeče
00050000-5553-5731-2a71-8903d0f4b194	8290	Sevnica
00050000-5553-5731-2fda-2f84bcab039f	6210	Sežana
00050000-5553-5731-8333-ce89ca1b87dd	2214	Sladki Vrh
00050000-5553-5731-bde7-3410b9e87b1d	5283	Slap ob Idrijci
00050000-5553-5731-fd2d-9801749c7f71	2380	Slovenj Gradec
00050000-5553-5731-8eb3-3b745e0767ee	2310	Slovenska Bistrica
00050000-5553-5731-dc3e-5b7695c866c8	3210	Slovenske Konjice
00050000-5553-5731-ab5e-3864d56c1be6	1216	Smlednik
00050000-5553-5731-a025-5b97d7a45aa8	5232	Soča
00050000-5553-5731-b6f5-3b9fc31383c1	1317	Sodražica
00050000-5553-5731-c83e-5b889bb0ecaa	3335	Solčava
00050000-5553-5731-e012-d3c704627ca3	5250	Solkan
00050000-5553-5731-0fb9-31eac48f7cce	4229	Sorica
00050000-5553-5731-9f4f-86cebb53c181	4225	Sovodenj
00050000-5553-5731-2cc4-2b8776a6b881	5281	Spodnja Idrija
00050000-5553-5731-293e-cb155fc1d5c4	2241	Spodnji Duplek
00050000-5553-5731-4199-6c077ad96967	9245	Spodnji Ivanjci
00050000-5553-5731-607d-8d5a8381d35b	2277	Središče ob Dravi
00050000-5553-5731-d5e9-2583ab68173d	4267	Srednja vas v Bohinju
00050000-5553-5731-bfbd-773de091f76b	8256	Sromlje 
00050000-5553-5731-5c49-aaf37a579251	5224	Srpenica
00050000-5553-5731-951f-1030d52eab88	1242	Stahovica
00050000-5553-5731-c680-1af393087d07	1332	Stara Cerkev
00050000-5553-5731-7f5f-c992159b026b	8342	Stari trg ob Kolpi
00050000-5553-5731-2d9b-e3b76d6267bb	1386	Stari trg pri Ložu
00050000-5553-5731-66d4-79119476e98e	2205	Starše
00050000-5553-5731-91ac-e8cf93e3a4a6	2289	Stoperce
00050000-5553-5731-633e-3d32d4f3084a	8322	Stopiče
00050000-5553-5731-1958-f6d671b3ca68	3206	Stranice
00050000-5553-5731-2140-917d0a91b637	8351	Straža
00050000-5553-5731-6cbb-9fe0c8937412	1313	Struge
00050000-5553-5731-b12b-25f6968078b4	8293	Studenec
00050000-5553-5731-a2b5-067edaadd31e	8331	Suhor
00050000-5553-5731-fc54-c604735310bd	2233	Sv. Ana v Slovenskih goricah
00050000-5553-5731-c5d5-917f2457caa0	2235	Sv. Trojica v Slovenskih goricah
00050000-5553-5731-ed44-eda6c0103fb1	2353	Sveti Duh na Ostrem Vrhu
00050000-5553-5731-7910-6d9df179e8e3	9244	Sveti Jurij ob Ščavnici
00050000-5553-5731-6345-1ecb117aed2e	3264	Sveti Štefan
00050000-5553-5731-fd1b-8758053d8062	2258	Sveti Tomaž
00050000-5553-5731-ae30-d26429097fad	9204	Šalovci
00050000-5553-5731-3074-6b03e04a861b	5261	Šempas
00050000-5553-5731-a4b3-21d64728aebf	5290	Šempeter pri Gorici
00050000-5553-5731-9ec8-8344e705bc38	3311	Šempeter v Savinjski dolini
00050000-5553-5731-1115-6fead7dc7f73	4208	Šenčur
00050000-5553-5731-c6ca-d6c4a0115008	2212	Šentilj v Slovenskih goricah
00050000-5553-5731-12f0-aa21cf3fc281	8297	Šentjanž
00050000-5553-5731-09b8-2d6c5527da1a	2373	Šentjanž pri Dravogradu
00050000-5553-5731-4e40-81eff55f7bc4	8310	Šentjernej
00050000-5553-5731-5e6b-d6cd934e83c9	3230	Šentjur
00050000-5553-5731-bf1e-bb798857f1f4	3271	Šentrupert
00050000-5553-5731-1827-10cfac4df117	8232	Šentrupert
00050000-5553-5731-ea44-dbb109a44530	1296	Šentvid pri Stični
00050000-5553-5731-8658-b33b13844573	8275	Škocjan
00050000-5553-5731-51cc-16b24eb5ef46	6281	Škofije
00050000-5553-5731-98e1-654183ed6f39	4220	Škofja Loka
00050000-5553-5731-5495-a8d25bd4e928	3211	Škofja vas
00050000-5553-5731-d0df-39ffe3bf3ae9	1291	Škofljica
00050000-5553-5731-39b4-1fb37128c614	6274	Šmarje
00050000-5553-5731-c64c-e3e4ed02188d	1293	Šmarje - Sap
00050000-5553-5731-0279-77e361500f90	3240	Šmarje pri Jelšah
00050000-5553-5731-5689-70d7b5dfbba4	8220	Šmarješke Toplice
00050000-5553-5731-fb06-ee8c04598cb7	2315	Šmartno na Pohorju
00050000-5553-5731-04ed-65510a638c85	3341	Šmartno ob Dreti
00050000-5553-5731-673c-1d41d0f3c000	3327	Šmartno ob Paki
00050000-5553-5731-d161-ab0a637451d7	1275	Šmartno pri Litiji
00050000-5553-5731-ba58-eb7111def422	2383	Šmartno pri Slovenj Gradcu
00050000-5553-5731-1bbe-0662a26e3f8e	3201	Šmartno v Rožni dolini
00050000-5553-5731-3cfd-dba9a670ad0c	3325	Šoštanj
00050000-5553-5731-8519-8aedb5b01b23	6222	Štanjel
00050000-5553-5731-716a-9b9176749a01	3220	Štore
00050000-5553-5731-385c-63d0762afb61	3304	Tabor
00050000-5553-5731-e476-ace6ccc120a5	3221	Teharje
00050000-5553-5731-62cf-a9125ff70461	9251	Tišina
00050000-5553-5731-5a1c-a10b00976313	5220	Tolmin
00050000-5553-5731-cb0a-94e32dc0e549	3326	Topolšica
00050000-5553-5731-5e90-619c882c00ff	2371	Trbonje
00050000-5553-5731-b472-a599d19a6a55	1420	Trbovlje
00050000-5553-5731-95eb-7ee3f85ec6be	8231	Trebelno 
00050000-5553-5731-825f-24bd1198574f	8210	Trebnje
00050000-5553-5731-edd7-c90b937c788a	5252	Trnovo pri Gorici
00050000-5553-5731-cec1-3694ace46cd1	2254	Trnovska vas
00050000-5553-5731-72e2-7fe617a1f755	1222	Trojane
00050000-5553-5731-ee9c-92227a36e6b2	1236	Trzin
00050000-5553-5731-5c61-86fb897b3243	4290	Tržič
00050000-5553-5731-f083-8aa40b5d606d	8295	Tržišče
00050000-5553-5731-d6f1-6c8bd5198bcd	1311	Turjak
00050000-5553-5731-fe72-6d9fe1362dc2	9224	Turnišče
00050000-5553-5731-119b-7748874948ec	8323	Uršna sela
00050000-5553-5731-1904-c89279be0f31	1252	Vače
00050000-5553-5731-8e1f-d40c239064a9	3320	Velenje 
00050000-5553-5731-bc45-c9f1a6d19715	3322	Velenje - poštni predali
00050000-5553-5731-9f43-2aa00d6f844c	8212	Velika Loka
00050000-5553-5731-9ac9-5e7cf9e1f43e	2274	Velika Nedelja
00050000-5553-5731-d602-c7f98109e59d	9225	Velika Polana
00050000-5553-5731-a2f7-57ec2b5b52b0	1315	Velike Lašče
00050000-5553-5731-f6fc-6f3b393f7d5c	8213	Veliki Gaber
00050000-5553-5731-02e2-ad5ee4ae4383	9241	Veržej
00050000-5553-5731-7ca1-6898f8b7fe5d	1312	Videm - Dobrepolje
00050000-5553-5731-6c85-39d6eb6a74e5	2284	Videm pri Ptuju
00050000-5553-5731-f917-f3616c244087	8344	Vinica
00050000-5553-5731-bdbf-c89cedbc416d	5271	Vipava
00050000-5553-5731-4381-26a8f2765c82	4212	Visoko
00050000-5553-5731-f9a2-1fc7fe2d7e45	1294	Višnja Gora
00050000-5553-5731-d625-db1753dc24d4	3205	Vitanje
00050000-5553-5731-b8c7-bf586a4dbf5c	2255	Vitomarci
00050000-5553-5731-87a1-7721bffe1b46	1217	Vodice
00050000-5553-5731-9420-4ea034d53686	3212	Vojnik\t
00050000-5553-5731-25f5-a5157a328596	5293	Volčja Draga
00050000-5553-5731-ae1f-cebeb729929f	2232	Voličina
00050000-5553-5731-828a-d7fe8d44d28c	3305	Vransko
00050000-5553-5731-8e3d-24e2954aa674	6217	Vremski Britof
00050000-5553-5731-ab97-89334db9624c	1360	Vrhnika
00050000-5553-5731-a4f9-690d83e1edcb	2365	Vuhred
00050000-5553-5731-7943-1088b11e5b6e	2367	Vuzenica
00050000-5553-5731-541a-d6d391236c79	8292	Zabukovje 
00050000-5553-5731-2ae0-0f2e89f6de87	1410	Zagorje ob Savi
00050000-5553-5731-068f-2ee13b5a9f0b	1303	Zagradec
00050000-5553-5731-c90d-bab695797db4	2283	Zavrč
00050000-5553-5731-0c52-b7ab40e0776f	8272	Zdole 
00050000-5553-5731-1a09-10cb5297ea81	4201	Zgornja Besnica
00050000-5553-5731-bc6a-527d5142482e	2242	Zgornja Korena
00050000-5553-5731-17d8-15e71462a209	2201	Zgornja Kungota
00050000-5553-5731-6d63-8918d59820a2	2316	Zgornja Ložnica
00050000-5553-5731-be08-109eaf8d9836	2314	Zgornja Polskava
00050000-5553-5731-e452-c37aee173e45	2213	Zgornja Velka
00050000-5553-5731-435b-00dd96daefb7	4247	Zgornje Gorje
00050000-5553-5731-2031-b1ecedf30785	4206	Zgornje Jezersko
00050000-5553-5731-84fc-6547719d2b7c	2285	Zgornji Leskovec
00050000-5553-5731-03c3-d9a5e28812c5	1432	Zidani Most
00050000-5553-5731-8165-8a18ce5704a2	3214	Zreče
00050000-5553-5731-3a8b-c5029bfed0c6	4209	Žabnica
00050000-5553-5731-e88b-fe1639b89116	3310	Žalec
00050000-5553-5731-77c4-9d8bf7fca775	4228	Železniki
00050000-5553-5731-f771-d91243ffec8e	2287	Žetale
00050000-5553-5731-5fe5-880f481d5d0c	4226	Žiri
00050000-5553-5731-b73b-f52f0656b580	4274	Žirovnica
00050000-5553-5731-0a8d-1133ed477a32	8360	Žužemberk
\.


--
-- TOC entry 2665 (class 0 OID 3331052)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 3330873)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 3330939)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 3331064)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 3331169)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2683 (class 0 OID 3331216)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 3331093)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 3331037)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 3331027)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 3331206)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 3331159)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2636 (class 0 OID 3330740)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5553-5731-c282-fd0bc44f2bf0	00010000-5553-5731-56ee-c42d548b5631	2015-05-13 15:52:50	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROPmWMj72PdTkei0NpMwZp0.IKde7GQ4S";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2697 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2672 (class 0 OID 3331102)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 3330778)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5553-5731-07bb-0061e7d3ff8d	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5553-5731-9b89-f95fdb929769	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5553-5731-c7aa-67c86cb87351	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5553-5731-63f5-15d0793dea3d	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5553-5731-bd98-7283c6289156	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5553-5731-6f5e-5a04c9315466	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2638 (class 0 OID 3330762)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5553-5731-c282-fd0bc44f2bf0	00020000-5553-5731-63f5-15d0793dea3d
00010000-5553-5731-56ee-c42d548b5631	00020000-5553-5731-63f5-15d0793dea3d
\.


--
-- TOC entry 2674 (class 0 OID 3331116)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2666 (class 0 OID 3331058)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 3331008)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 3330838)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 3331014)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 3331194)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 3330908)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 3330749)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5553-5731-56ee-c42d548b5631	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROWXiFSe/TCOcfQGg/mGTtbPzR2bgNhBq	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5553-5731-c282-fd0bc44f2bf0	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2686 (class 0 OID 3331248)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 3330954)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 3331085)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 3331151)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 3330983)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2685 (class 0 OID 3331238)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 3331141)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2280 (class 2606 OID 3330803)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2447 (class 2606 OID 3331288)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 3331281)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 3331193)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2333 (class 2606 OID 3330973)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 3331007)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2316 (class 2606 OID 3330934)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 3331137)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 3330952)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 3331001)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 3331050)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 3331077)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2309 (class 2606 OID 3330906)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2284 (class 2606 OID 3330812)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 3330870)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2286 (class 2606 OID 3330836)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2278 (class 2606 OID 3330792)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2271 (class 2606 OID 3330777)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 3331083)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 3331115)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 3331233)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 3330863)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2306 (class 2606 OID 3330894)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 3331056)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2261 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 3330884)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 3330943)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 3331068)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 3331175)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 3331221)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 3331100)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 3331041)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 3331032)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 3331215)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 3331166)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 3330748)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2394 (class 2606 OID 3331106)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2269 (class 2606 OID 3330766)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2273 (class 2606 OID 3330786)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2401 (class 2606 OID 3331124)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 3331063)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2351 (class 2606 OID 3331013)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2291 (class 2606 OID 3330843)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 3331023)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 3331205)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2314 (class 2606 OID 3330919)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2265 (class 2606 OID 3330761)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 3331263)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2331 (class 2606 OID 3330958)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 3331091)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 3331157)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 3330996)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2436 (class 2606 OID 3331247)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2408 (class 2606 OID 3331150)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2334 (class 1259 OID 3330980)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2292 (class 1259 OID 3330865)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2257 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2258 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2259 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2383 (class 1259 OID 3331084)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2377 (class 1259 OID 3331070)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2378 (class 1259 OID 3331069)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2329 (class 1259 OID 3330959)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2404 (class 1259 OID 3331140)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2405 (class 1259 OID 3331138)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2406 (class 1259 OID 3331139)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2429 (class 1259 OID 3331235)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2430 (class 1259 OID 3331236)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2431 (class 1259 OID 3331237)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2437 (class 1259 OID 3331266)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2438 (class 1259 OID 3331265)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2439 (class 1259 OID 3331264)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2311 (class 1259 OID 3330921)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2312 (class 1259 OID 3330920)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2296 (class 1259 OID 3330872)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2297 (class 1259 OID 3330871)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2392 (class 1259 OID 3331107)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2347 (class 1259 OID 3331002)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2275 (class 1259 OID 3330793)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2276 (class 1259 OID 3330794)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2397 (class 1259 OID 3331127)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2398 (class 1259 OID 3331126)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2399 (class 1259 OID 3331125)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2321 (class 1259 OID 3330944)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2322 (class 1259 OID 3330946)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2323 (class 1259 OID 3330945)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2357 (class 1259 OID 3331036)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2358 (class 1259 OID 3331034)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2359 (class 1259 OID 3331033)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2360 (class 1259 OID 3331035)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2266 (class 1259 OID 3330767)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2267 (class 1259 OID 3330768)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2386 (class 1259 OID 3331092)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2372 (class 1259 OID 3331057)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2412 (class 1259 OID 3331167)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2413 (class 1259 OID 3331168)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2300 (class 1259 OID 3330886)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2301 (class 1259 OID 3330885)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2302 (class 1259 OID 3330887)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2416 (class 1259 OID 3331176)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2417 (class 1259 OID 3331177)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2448 (class 1259 OID 3331291)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2449 (class 1259 OID 3331290)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2450 (class 1259 OID 3331293)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2451 (class 1259 OID 3331289)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2452 (class 1259 OID 3331292)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2409 (class 1259 OID 3331158)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2363 (class 1259 OID 3331045)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2364 (class 1259 OID 3331044)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2365 (class 1259 OID 3331042)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2366 (class 1259 OID 3331043)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2253 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2444 (class 1259 OID 3331283)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2445 (class 1259 OID 3331282)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2328 (class 1259 OID 3330953)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2281 (class 1259 OID 3330814)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2282 (class 1259 OID 3330813)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2288 (class 1259 OID 3330844)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2289 (class 1259 OID 3330845)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2352 (class 1259 OID 3331026)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2353 (class 1259 OID 3331025)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2354 (class 1259 OID 3331024)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2335 (class 1259 OID 3330982)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2336 (class 1259 OID 3330978)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2337 (class 1259 OID 3330975)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2338 (class 1259 OID 3330976)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2339 (class 1259 OID 3330974)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2340 (class 1259 OID 3330979)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2341 (class 1259 OID 3330977)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2295 (class 1259 OID 3330864)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2317 (class 1259 OID 3330935)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2318 (class 1259 OID 3330937)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2319 (class 1259 OID 3330936)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2320 (class 1259 OID 3330938)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2371 (class 1259 OID 3331051)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2434 (class 1259 OID 3331234)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2287 (class 1259 OID 3330837)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2310 (class 1259 OID 3330907)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2391 (class 1259 OID 3331101)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2256 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2307 (class 1259 OID 3330895)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2428 (class 1259 OID 3331222)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2274 (class 1259 OID 3330787)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2342 (class 1259 OID 3330981)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2477 (class 2606 OID 3331424)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2480 (class 2606 OID 3331409)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2479 (class 2606 OID 3331414)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2475 (class 2606 OID 3331434)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2481 (class 2606 OID 3331404)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2476 (class 2606 OID 3331429)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2478 (class 2606 OID 3331419)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2462 (class 2606 OID 3331339)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2498 (class 2606 OID 3331519)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2496 (class 2606 OID 3331514)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2497 (class 2606 OID 3331509)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2474 (class 2606 OID 3331399)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 3331559)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2506 (class 2606 OID 3331549)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2505 (class 2606 OID 3331554)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2494 (class 2606 OID 3331499)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2515 (class 2606 OID 3331594)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2514 (class 2606 OID 3331599)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2513 (class 2606 OID 3331604)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2516 (class 2606 OID 3331619)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2517 (class 2606 OID 3331614)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2518 (class 2606 OID 3331609)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2468 (class 2606 OID 3331374)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2469 (class 2606 OID 3331369)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2463 (class 2606 OID 3331349)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2464 (class 2606 OID 3331344)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 3331324)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2500 (class 2606 OID 3331529)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2482 (class 2606 OID 3331439)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2456 (class 2606 OID 3331304)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2455 (class 2606 OID 3331309)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2501 (class 2606 OID 3331544)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2502 (class 2606 OID 3331539)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2503 (class 2606 OID 3331534)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2472 (class 2606 OID 3331379)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2470 (class 2606 OID 3331389)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2471 (class 2606 OID 3331384)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2486 (class 2606 OID 3331474)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2488 (class 2606 OID 3331464)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2489 (class 2606 OID 3331459)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2487 (class 2606 OID 3331469)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2454 (class 2606 OID 3331294)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2453 (class 2606 OID 3331299)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2499 (class 2606 OID 3331524)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2495 (class 2606 OID 3331504)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2509 (class 2606 OID 3331569)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2508 (class 2606 OID 3331574)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2466 (class 2606 OID 3331359)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2467 (class 2606 OID 3331354)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2465 (class 2606 OID 3331364)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2511 (class 2606 OID 3331579)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2510 (class 2606 OID 3331584)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2523 (class 2606 OID 3331644)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2524 (class 2606 OID 3331639)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2521 (class 2606 OID 3331654)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2525 (class 2606 OID 3331634)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2522 (class 2606 OID 3331649)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2507 (class 2606 OID 3331564)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2490 (class 2606 OID 3331494)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2491 (class 2606 OID 3331489)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2493 (class 2606 OID 3331479)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2492 (class 2606 OID 3331484)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2519 (class 2606 OID 3331629)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2520 (class 2606 OID 3331624)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2473 (class 2606 OID 3331394)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2512 (class 2606 OID 3331589)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 3331319)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2458 (class 2606 OID 3331314)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2461 (class 2606 OID 3331329)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2460 (class 2606 OID 3331334)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2483 (class 2606 OID 3331454)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 3331449)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2485 (class 2606 OID 3331444)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-13 15:52:50 CEST

--
-- PostgreSQL database dump complete
--

