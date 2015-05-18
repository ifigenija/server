--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-18 16:13:00 CEST

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
-- TOC entry 2689 (class 0 OID 0)
-- Dependencies: 226
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 3820507)
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
-- TOC entry 225 (class 1259 OID 3820991)
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
-- TOC entry 224 (class 1259 OID 3820974)
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
-- TOC entry 217 (class 1259 OID 3820884)
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
-- TOC entry 193 (class 1259 OID 3820675)
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
-- TOC entry 196 (class 1259 OID 3820709)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 3820634)
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
-- TOC entry 212 (class 1259 OID 3820834)
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
-- TOC entry 191 (class 1259 OID 3820659)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 3820703)
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
-- TOC entry 201 (class 1259 OID 3820752)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 3820777)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 3820608)
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
-- TOC entry 180 (class 1259 OID 3820516)
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
-- TOC entry 181 (class 1259 OID 3820527)
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
-- TOC entry 184 (class 1259 OID 3820578)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 3820481)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 3820500)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 3820784)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 3820814)
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
-- TOC entry 221 (class 1259 OID 3820929)
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
-- TOC entry 183 (class 1259 OID 3820558)
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
-- TOC entry 186 (class 1259 OID 3820600)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 3820758)
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
-- TOC entry 185 (class 1259 OID 3820585)
-- Name: postninaslovi; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postninaslovi (
    id uuid NOT NULL,
    popa_id uuid,
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
-- TOC entry 190 (class 1259 OID 3820651)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 3820770)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 3820875)
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
-- TOC entry 220 (class 1259 OID 3820922)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 3820799)
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
-- TOC entry 200 (class 1259 OID 3820743)
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
-- TOC entry 199 (class 1259 OID 3820733)
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
-- TOC entry 219 (class 1259 OID 3820912)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 3820865)
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
-- TOC entry 173 (class 1259 OID 3820452)
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
-- TOC entry 172 (class 1259 OID 3820450)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2690 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 3820808)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 3820490)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 3820474)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 3820822)
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
-- TOC entry 203 (class 1259 OID 3820764)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 3820714)
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
-- TOC entry 182 (class 1259 OID 3820550)
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
-- TOC entry 198 (class 1259 OID 3820720)
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
-- TOC entry 218 (class 1259 OID 3820900)
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
-- TOC entry 188 (class 1259 OID 3820620)
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
-- TOC entry 174 (class 1259 OID 3820461)
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
-- TOC entry 223 (class 1259 OID 3820955)
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
-- TOC entry 192 (class 1259 OID 3820666)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 3820791)
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
-- TOC entry 214 (class 1259 OID 3820857)
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
-- TOC entry 194 (class 1259 OID 3820698)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 3820945)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 3820847)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 3820455)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 3820507)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 3820991)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 3820974)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 3820884)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 3820675)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 3820709)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 3820634)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5559-f36b-5344-a9cce9ee1667	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5559-f36b-d439-25e1730ba626	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5559-f36b-5125-5e673351e94f	AL	ALB	008	Albania 	Albanija	\N
00040000-5559-f36b-2535-1bbf8f6caac8	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5559-f36b-a9dc-cbdd71f54e5e	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5559-f36b-86cd-f964402eb696	AD	AND	020	Andorra 	Andora	\N
00040000-5559-f36b-389e-a0d36212d832	AO	AGO	024	Angola 	Angola	\N
00040000-5559-f36b-ef04-78b57913cdf8	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5559-f36b-e6dc-47d86e1a4fa8	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5559-f36b-a444-083a43b99c6e	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5559-f36b-427c-795014425119	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5559-f36b-c76a-440c8b0581ae	AM	ARM	051	Armenia 	Armenija	\N
00040000-5559-f36b-1638-b3de3c496f2c	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5559-f36b-d9ed-f24eb8e2de01	AU	AUS	036	Australia 	Avstralija	\N
00040000-5559-f36b-64d3-7ade0884e48f	AT	AUT	040	Austria 	Avstrija	\N
00040000-5559-f36b-9b5c-e60a86c78017	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5559-f36b-c9a2-6c9fcd6bbc7b	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5559-f36b-5751-96d541f36e07	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5559-f36b-bbf2-17914efade6b	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5559-f36b-2ea2-be3975e09d9e	BB	BRB	052	Barbados 	Barbados	\N
00040000-5559-f36b-e602-c880109c4e3a	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5559-f36b-673e-6e9bb0b95c40	BE	BEL	056	Belgium 	Belgija	\N
00040000-5559-f36b-115c-15756e77e6be	BZ	BLZ	084	Belize 	Belize	\N
00040000-5559-f36b-7bd5-aca19d7ccfee	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5559-f36b-a1b5-34a3bf26e9f9	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5559-f36b-e731-cb54cdd0599e	BT	BTN	064	Bhutan 	Butan	\N
00040000-5559-f36b-757f-d47db4f61184	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5559-f36b-ab39-28d623774658	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5559-f36b-26cb-a6e17ccca3e7	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5559-f36b-ed11-e939b5ec7aa3	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5559-f36b-e680-54cd388e36c8	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5559-f36b-67fe-89b97079d88d	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5559-f36b-a8e7-d79e9fe5c6ae	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5559-f36b-725c-d56b4bbfc35d	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5559-f36b-65c3-e8298dd335d3	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5559-f36b-46a1-7fc51f8dade7	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5559-f36b-397f-2aa4a4ae8c2c	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5559-f36b-0f14-1a386ba179ed	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5559-f36b-d058-c61ae20561f9	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5559-f36b-0ebf-d69b9a6371e4	CA	CAN	124	Canada 	Kanada	\N
00040000-5559-f36b-4acc-51a0724b8b0e	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5559-f36b-f000-130cf9afa895	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5559-f36b-1388-19f0e351827f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5559-f36b-7cd9-ca3178706cd3	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5559-f36b-cb33-0c2de0157426	CL	CHL	152	Chile 	Čile	\N
00040000-5559-f36b-cb7b-e5c879bb7be4	CN	CHN	156	China 	Kitajska	\N
00040000-5559-f36b-fb79-e8f1702208ff	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5559-f36b-be5c-9a7adc51ee10	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5559-f36b-1bb2-c1a2aafb557f	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5559-f36b-95ce-cdc1d7fecfd5	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5559-f36b-b378-dabfefd2b797	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5559-f36b-6bb2-3202d3dec329	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5559-f36b-3e74-8aae21b0c759	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5559-f36b-e593-d2ad2fb4954a	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5559-f36b-dfbe-fc201b871a7c	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5559-f36b-0f2d-07c2850b2970	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5559-f36b-5496-80fe7f7b1959	CU	CUB	192	Cuba 	Kuba	\N
00040000-5559-f36b-9d99-bb4515eb06f4	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5559-f36b-2069-fcc2ce020920	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5559-f36b-c14e-c83fd23563ef	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5559-f36b-910e-8b8bb44ab851	DK	DNK	208	Denmark 	Danska	\N
00040000-5559-f36b-24fb-3557a9ac3975	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5559-f36b-51ef-8bd9d9eee98f	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5559-f36b-7dee-732f8dc377f9	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5559-f36b-4558-ab2ae8c5c76c	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5559-f36b-5862-d9c6a23b975b	EG	EGY	818	Egypt 	Egipt	\N
00040000-5559-f36b-657f-d59d448be1e9	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5559-f36b-f04d-6a55fd416a1a	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5559-f36b-766e-553b9587e4bc	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5559-f36b-e334-5ba5d9590e5d	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5559-f36b-ed8e-40fba2a61fab	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5559-f36b-2b7c-05d201e653eb	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5559-f36b-d192-f9030cd4d7b3	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5559-f36b-2db9-dabbc646f128	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5559-f36b-15a7-24186cda18a3	FI	FIN	246	Finland 	Finska	\N
00040000-5559-f36b-241a-bdc42caa19d8	FR	FRA	250	France 	Francija	\N
00040000-5559-f36b-d2c0-938e74e2e105	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5559-f36b-e7e0-e981b280cf08	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5559-f36b-9a81-5354714143e6	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5559-f36b-b2e2-693e55204859	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5559-f36b-b361-033ef6806391	GA	GAB	266	Gabon 	Gabon	\N
00040000-5559-f36b-aa73-f6e40f3ad853	GM	GMB	270	Gambia 	Gambija	\N
00040000-5559-f36b-fd60-50dfc285c4b3	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5559-f36b-c4bb-1d8469c53be7	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5559-f36b-90ff-052a98c15255	GH	GHA	288	Ghana 	Gana	\N
00040000-5559-f36b-30eb-230ff6b46764	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5559-f36b-b1b4-469de13367bd	GR	GRC	300	Greece 	Grčija	\N
00040000-5559-f36b-ba5a-78669f156493	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5559-f36b-e1d4-9cf9ea03a591	GD	GRD	308	Grenada 	Grenada	\N
00040000-5559-f36b-a100-24caebe0e31f	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5559-f36b-8010-e80323a7020a	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5559-f36b-d12d-d7a3869f3b8a	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5559-f36b-3edc-12e98f48f212	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5559-f36b-efb3-d77c489b7ccb	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5559-f36b-8e56-f2a5e0dd9090	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5559-f36b-9c91-3ba60b9cf179	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5559-f36b-0bd0-849241dbc6c0	HT	HTI	332	Haiti 	Haiti	\N
00040000-5559-f36b-2c02-d9552055a164	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5559-f36b-0c5b-aa5ae66f87e0	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5559-f36b-117f-f42eb7f1efd6	HN	HND	340	Honduras 	Honduras	\N
00040000-5559-f36b-dc0a-28c315974422	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5559-f36b-af46-1cdc250bc556	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5559-f36b-184d-c96c550fee0c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5559-f36b-499d-3c0573017d23	IN	IND	356	India 	Indija	\N
00040000-5559-f36b-4084-cf580b8149e9	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5559-f36b-c134-fa23cb0b7d33	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5559-f36b-5a66-4cdce8a75c63	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5559-f36b-0983-e1a6224480b6	IE	IRL	372	Ireland 	Irska	\N
00040000-5559-f36b-8f15-3cb65fa66b26	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5559-f36b-92dc-b585976fdd17	IL	ISR	376	Israel 	Izrael	\N
00040000-5559-f36b-065a-302623915c4b	IT	ITA	380	Italy 	Italija	\N
00040000-5559-f36b-4b7b-0d8f8cdb808d	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5559-f36b-1b9d-c8b3bba9a88b	JP	JPN	392	Japan 	Japonska	\N
00040000-5559-f36b-8e07-225e632f283f	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5559-f36b-d14f-f1517b3c489a	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5559-f36b-5d1a-1487b21d1560	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5559-f36b-a36b-229d1f416494	KE	KEN	404	Kenya 	Kenija	\N
00040000-5559-f36b-8dac-8e1feb645df2	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5559-f36b-5f63-a1e89d91ce4f	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5559-f36b-16ff-d2e2e53bbd0e	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5559-f36b-8d80-c1e5b75df470	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5559-f36b-5f6c-b98835b0316b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5559-f36b-61b4-15b7bec21ed7	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5559-f36b-24eb-ff6bf51924b1	LV	LVA	428	Latvia 	Latvija	\N
00040000-5559-f36b-3791-bb0501b26e89	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5559-f36b-f397-8660594b626f	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5559-f36b-5279-13ece6b2f715	LR	LBR	430	Liberia 	Liberija	\N
00040000-5559-f36b-8419-74a3f2acb115	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5559-f36b-677a-92ba77ada4f0	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5559-f36b-6d0a-d6566ec65d86	LT	LTU	440	Lithuania 	Litva	\N
00040000-5559-f36b-4a2f-12aee2985cc2	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5559-f36b-2e55-200811ba6b41	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5559-f36b-64f8-e996c0b6473c	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5559-f36b-2cfb-f704e27b6dcb	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5559-f36b-e6de-6a0a5077c32d	MW	MWI	454	Malawi 	Malavi	\N
00040000-5559-f36b-38bc-d0294ba1d93f	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5559-f36b-be6a-470e9db91678	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5559-f36b-d1c5-0b29f7165b73	ML	MLI	466	Mali 	Mali	\N
00040000-5559-f36b-49ff-132f50afcc4a	MT	MLT	470	Malta 	Malta	\N
00040000-5559-f36b-c75a-d4b5ef993fad	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5559-f36b-449d-093f4ff2df23	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5559-f36b-5936-9bd9d435a7e1	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5559-f36b-45ec-0dd74039fdb0	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5559-f36b-93a8-2f79e9f8115b	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5559-f36b-68c1-c2bdfbfc5479	MX	MEX	484	Mexico 	Mehika	\N
00040000-5559-f36b-7d4a-1991001ab70e	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5559-f36b-88d5-973c1eb0e7e8	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5559-f36b-31b9-c3e528f71a89	MC	MCO	492	Monaco 	Monako	\N
00040000-5559-f36b-8f91-2cf467bdef76	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5559-f36b-b587-6cc945ca2e39	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5559-f36b-56d5-743f305d87e1	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5559-f36b-0d61-e43a679629a3	MA	MAR	504	Morocco 	Maroko	\N
00040000-5559-f36b-ee3e-a7b3f81d1449	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5559-f36b-9296-741133facc06	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5559-f36b-d30d-ee8ce31274da	NA	NAM	516	Namibia 	Namibija	\N
00040000-5559-f36b-db48-4d21587686ae	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5559-f36b-93c8-aeb3af901694	NP	NPL	524	Nepal 	Nepal	\N
00040000-5559-f36b-4c90-377a2cfb44f6	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5559-f36b-9d41-cb3e670987ab	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5559-f36b-13ec-1582423953e0	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5559-f36b-3c53-888db934cdd4	NE	NER	562	Niger 	Niger 	\N
00040000-5559-f36b-2d81-b0b5379d9b05	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5559-f36b-b3f8-fdc2a64df49c	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5559-f36b-6171-e21798ef9f49	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5559-f36b-3af4-3f42280f7ef3	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5559-f36b-919c-8634b1133da2	NO	NOR	578	Norway 	Norveška	\N
00040000-5559-f36b-0f74-985641d970c4	OM	OMN	512	Oman 	Oman	\N
00040000-5559-f36b-0861-8c0b059c358f	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5559-f36b-1898-5d2187c34856	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5559-f36b-ad68-93bb197e94de	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5559-f36b-e8a4-9518b95b8cd0	PA	PAN	591	Panama 	Panama	\N
00040000-5559-f36b-ee09-a2efec974241	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5559-f36b-8924-c6333eca3a14	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5559-f36b-5a85-75803ff5f9dd	PE	PER	604	Peru 	Peru	\N
00040000-5559-f36b-0395-048d776e57ce	PH	PHL	608	Philippines 	Filipini	\N
00040000-5559-f36b-88dd-2dfcc2f52410	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5559-f36b-f523-7b9c01aaa6d2	PL	POL	616	Poland 	Poljska	\N
00040000-5559-f36b-2abc-4e68e2f549cf	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5559-f36b-c5f2-fe8d284494f0	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5559-f36b-1de4-0af37502ff2a	QA	QAT	634	Qatar 	Katar	\N
00040000-5559-f36b-a57a-2f4374502728	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5559-f36b-47ab-0f5192532a85	RO	ROU	642	Romania 	Romunija	\N
00040000-5559-f36b-e0fe-d7e5ad82ed80	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5559-f36b-a2b5-f8fca23d099c	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5559-f36b-3975-7b19cb6b06e5	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5559-f36c-e2ea-9893f86557af	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5559-f36c-fc90-f53808c3223f	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5559-f36c-eb68-d978fca0eed8	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5559-f36c-2e05-9e543f3fb03f	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5559-f36c-4650-bd5711cc5316	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5559-f36c-be19-5353836c71f0	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5559-f36c-a49e-e5bd760771f8	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5559-f36c-8313-179322e7c04e	SM	SMR	674	San Marino 	San Marino	\N
00040000-5559-f36c-3451-05e0738a0cf3	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5559-f36c-35e3-52d24b8474f6	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5559-f36c-43e6-15b076512201	SN	SEN	686	Senegal 	Senegal	\N
00040000-5559-f36c-6e4f-8b33ce4a904e	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5559-f36c-e97b-332b9ffd8cf3	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5559-f36c-e464-8e8a1266a867	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5559-f36c-9044-b2823a08d60d	SG	SGP	702	Singapore 	Singapur	\N
00040000-5559-f36c-032d-a0ab38bffa3f	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5559-f36c-6ff4-212678498174	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5559-f36c-f62d-85c8e59633eb	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5559-f36c-2b7d-c3fb0b92cc5d	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5559-f36c-f95a-72d30ed3fa18	SO	SOM	706	Somalia 	Somalija	\N
00040000-5559-f36c-cbc6-aeb808007ef7	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5559-f36c-056c-df17f0c4a2e8	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5559-f36c-3897-3e13c0206da2	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5559-f36c-19b0-9489452a9ac1	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5559-f36c-f712-0576dbc00a1d	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5559-f36c-3778-a8c15e981d61	SD	SDN	729	Sudan 	Sudan	\N
00040000-5559-f36c-5cb1-be3d9bdd2a37	SR	SUR	740	Suriname 	Surinam	\N
00040000-5559-f36c-a3d2-d2317b0b1680	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5559-f36c-7fc2-b2924f52d35a	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5559-f36c-cf5f-9e3fe6c7220a	SE	SWE	752	Sweden 	Švedska	\N
00040000-5559-f36c-5b98-234962b73ace	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5559-f36c-fb36-41a5d5bd58d7	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5559-f36c-20d9-4b7fecaddc13	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5559-f36c-a264-550325aaa841	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5559-f36c-1f61-db49c50be965	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5559-f36c-603c-bd9806f47120	TH	THA	764	Thailand 	Tajska	\N
00040000-5559-f36c-159b-c621d13bd3e1	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5559-f36c-08d2-b3f79944c753	TG	TGO	768	Togo 	Togo	\N
00040000-5559-f36c-8b2f-381b08d13b2b	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5559-f36c-b2c4-8eb0f3c27651	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5559-f36c-b8a3-df6a58b345c1	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5559-f36c-79b8-cde5972180c6	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5559-f36c-3747-986802caacc9	TR	TUR	792	Turkey 	Turčija	\N
00040000-5559-f36c-8434-498211af81b8	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5559-f36c-2443-290f37fdad07	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5559-f36c-a0e8-c598a2c225cc	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5559-f36c-2c36-8a2a857a1383	UG	UGA	800	Uganda 	Uganda	\N
00040000-5559-f36c-cdf0-a3faa365c61d	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5559-f36c-fc1e-3a1bf0196eed	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5559-f36c-58e5-2f7203dc2233	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5559-f36c-22a1-735c0fcb4a49	US	USA	840	United States 	Združene države Amerike	\N
00040000-5559-f36c-aba2-6d57d8a27542	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5559-f36c-bcc7-df3e9fda0134	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5559-f36c-d226-bc24e72ff6b6	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5559-f36c-6e6f-3cc7091d405c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5559-f36c-9391-af6db538144a	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5559-f36c-00d2-e6011603e52b	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5559-f36c-41fa-24460d52ebde	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5559-f36c-c050-6e50c0d8ba9f	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5559-f36c-36f9-db9f36d5fc61	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5559-f36c-65eb-811dac3266cd	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5559-f36c-1150-9effeb32766f	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5559-f36c-f45d-68f2d359c57e	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5559-f36c-ca6a-b978841db786	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 3820834)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 3820659)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 3820703)
-- Dependencies: 195
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2627 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 3820752)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 3820777)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 3820608)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5559-f36c-ce62-a532285da530	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5559-f36c-1f46-55684fa441fb	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5559-f36c-9528-8244e182dbf7	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5559-f36c-b63c-e6fc7e0b2877	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5559-f36c-649a-5750ee498375	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5559-f36c-fe14-69280caf893c	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5559-f36c-7faa-c6fd158ed2ae	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5559-f36c-2bf2-97b101b10c3d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5559-f36c-67da-80955743d471	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5559-f36c-1e82-cfe83732f800	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 3820516)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5559-f36c-3c1d-0f039769f5d1	00000000-5559-f36c-649a-5750ee498375	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5559-f36c-3a7b-f6714be556b7	00000000-5559-f36c-649a-5750ee498375	00010000-5559-f36c-bdf5-cf29a96b214b	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5559-f36c-0b27-5dddd171b879	00000000-5559-f36c-fe14-69280caf893c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 3820527)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 3820578)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 3820481)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5559-f36c-c10a-f3f77bc8a9a1	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5559-f36c-d3de-a530f5c689ef	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5559-f36c-eb1f-b17eca449ba9	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5559-f36c-fe21-dfd6b18a5fec	Abonma-read	Abonma - branje	f
00030000-5559-f36c-6526-f30c0b7cfde5	Abonma-write	Abonma - spreminjanje	f
00030000-5559-f36c-07ce-98ccfb8d48fc	Alternacija-read	Alternacija - branje	f
00030000-5559-f36c-ffa3-671b77536144	Alternacija-write	Alternacija - spreminjanje	f
00030000-5559-f36c-5ae2-24db049940ca	Arhivalija-read	Arhivalija - branje	f
00030000-5559-f36c-e406-e940615f3e9c	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5559-f36c-24af-5922a8d2dcf2	Besedilo-read	Besedilo - branje	f
00030000-5559-f36c-2aae-084bae1d82e0	Besedilo-write	Besedilo - spreminjanje	f
00030000-5559-f36c-115e-0c3ac4342d5c	DogodekIzven-read	DogodekIzven - branje	f
00030000-5559-f36c-97c0-adf186c27548	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5559-f36c-7fe3-1f3a78a9c4d1	Dogodek-read	Dogodek - branje	f
00030000-5559-f36c-b948-6ed9b5afb330	Dogodek-write	Dogodek - spreminjanje	f
00030000-5559-f36c-07a3-8618b2c9b2a0	Drzava-read	Drzava - branje	f
00030000-5559-f36c-a75b-2d49f38fa34f	Drzava-write	Drzava - spreminjanje	f
00030000-5559-f36c-f676-010d47be5867	Funkcija-read	Funkcija - branje	f
00030000-5559-f36c-da7b-460a1a2de0f7	Funkcija-write	Funkcija - spreminjanje	f
00030000-5559-f36c-877b-288e650eccc6	Gostovanje-read	Gostovanje - branje	f
00030000-5559-f36c-dee5-6833fe377d82	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5559-f36c-1b81-254cbbf1322f	Gostujoca-read	Gostujoca - branje	f
00030000-5559-f36c-3e34-2dd8942748f6	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5559-f36c-7fbb-9b9645abfd9a	Kupec-read	Kupec - branje	f
00030000-5559-f36c-fa84-1d13f60f3a66	Kupec-write	Kupec - spreminjanje	f
00030000-5559-f36c-648e-a35b94cea42d	NacinPlacina-read	NacinPlacina - branje	f
00030000-5559-f36c-c9fe-047eea90931d	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5559-f36c-fd7a-eedbcb6138f0	Option-read	Option - branje	f
00030000-5559-f36c-2034-0fb039fc6dcc	Option-write	Option - spreminjanje	f
00030000-5559-f36c-6413-13a26a768398	OptionValue-read	OptionValue - branje	f
00030000-5559-f36c-056c-654a9d9666cd	OptionValue-write	OptionValue - spreminjanje	f
00030000-5559-f36c-5926-b70c6747ca95	Oseba-read	Oseba - branje	f
00030000-5559-f36c-b5e9-f11c7804c57c	Oseba-write	Oseba - spreminjanje	f
00030000-5559-f36c-c53c-335495af9b94	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5559-f36c-93af-94e40b4e4abc	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5559-f36c-4bc3-63c092ef3a98	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5559-f36c-1cc1-c757cbf6b609	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5559-f36c-2756-cbb1750759ae	Pogodba-read	Pogodba - branje	f
00030000-5559-f36c-f62b-53b08559e4d9	Pogodba-write	Pogodba - spreminjanje	f
00030000-5559-f36c-6f6b-1bca4d141f8f	Popa-read	Popa - branje	f
00030000-5559-f36c-eed0-a2990fa24ae8	Popa-write	Popa - spreminjanje	f
00030000-5559-f36c-ed16-101f8449727e	Posta-read	Posta - branje	f
00030000-5559-f36c-e8f2-bc976b2d39fb	Posta-write	Posta - spreminjanje	f
00030000-5559-f36c-a69c-d50915d41fc6	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5559-f36c-a993-b8c818633453	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5559-f36c-7081-9547224e02b2	PostniNaslov-read	PostniNaslov - branje	f
00030000-5559-f36c-3f85-93238de39361	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5559-f36c-f18e-a2210c553697	Predstava-read	Predstava - branje	f
00030000-5559-f36c-d0d7-6cfc844a614f	Predstava-write	Predstava - spreminjanje	f
00030000-5559-f36c-e020-d2f8be89e7e6	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5559-f36c-b4a1-3b14a09aa1a5	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5559-f36c-b788-c00148474f1a	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5559-f36c-9ea2-9322272da5e7	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5559-f36c-e0df-b203d8a401f3	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5559-f36c-27e0-efe5e7838d89	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5559-f36c-d6e7-8555055feada	Prostor-read	Prostor - branje	f
00030000-5559-f36c-836e-265cada1d987	Prostor-write	Prostor - spreminjanje	f
00030000-5559-f36c-c012-c31d09c09819	Racun-read	Racun - branje	f
00030000-5559-f36c-010a-6bc576aff43b	Racun-write	Racun - spreminjanje	f
00030000-5559-f36c-3944-f1d20e5a60d9	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5559-f36c-b260-6e63c42dfcf6	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5559-f36c-cd51-5c242b11f426	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5559-f36c-4ad1-8d17c308972f	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5559-f36c-be05-6b6de569f84e	Rekvizit-read	Rekvizit - branje	f
00030000-5559-f36c-4584-5860a9369872	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5559-f36c-d416-2a257d096206	Rezervacija-read	Rezervacija - branje	f
00030000-5559-f36c-347b-f4e16acf4a54	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5559-f36c-4cf7-c42359fc9998	SedezniRed-read	SedezniRed - branje	f
00030000-5559-f36c-378d-66fc42b95ffe	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5559-f36c-7fa9-cd1859dd2359	Sedez-read	Sedez - branje	f
00030000-5559-f36c-5e1f-82eca0f0e1c7	Sedez-write	Sedez - spreminjanje	f
00030000-5559-f36c-3dcf-0ef676fa05e9	Sezona-read	Sezona - branje	f
00030000-5559-f36c-1996-929128b45cc3	Sezona-write	Sezona - spreminjanje	f
00030000-5559-f36c-4957-c713649c22df	Telefonska-read	Telefonska - branje	f
00030000-5559-f36c-b9a9-1d3719c139f3	Telefonska-write	Telefonska - spreminjanje	f
00030000-5559-f36c-5499-112721018881	TerminStoritve-read	TerminStoritve - branje	f
00030000-5559-f36c-b65e-61c5442506e1	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5559-f36c-2a8a-1cc0fa82c990	TipFunkcije-read	TipFunkcije - branje	f
00030000-5559-f36c-0c52-b01f07a1daea	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5559-f36c-708c-d920b870b8db	Trr-read	Trr - branje	f
00030000-5559-f36c-f357-8c365077210e	Trr-write	Trr - spreminjanje	f
00030000-5559-f36c-6aa9-2cb3e1ad301d	Uprizoritev-read	Uprizoritev - branje	f
00030000-5559-f36c-52a4-2003c3fabc35	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5559-f36c-06c7-1ec4042a1ef4	Vaja-read	Vaja - branje	f
00030000-5559-f36c-1aad-65dad3958bbf	Vaja-write	Vaja - spreminjanje	f
00030000-5559-f36c-e0a1-e3d5cd1b7cc4	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5559-f36c-355a-39fa0656772e	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5559-f36c-3a70-e6659327a2a8	Zaposlitev-read	Zaposlitev - branje	f
00030000-5559-f36c-3504-15d4ef2cba12	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5559-f36c-a98c-63ff612b304e	Zasedenost-read	Zasedenost - branje	f
00030000-5559-f36c-aec4-57653e8aeb1f	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5559-f36c-b2b9-fa621f6aac10	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5559-f36c-9d40-e81e6f349c0a	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5559-f36c-fc8f-1f5cf41b5a42	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5559-f36c-4c7c-9ee9007c1d06	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2635 (class 0 OID 3820500)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5559-f36c-c523-638870a05c88	00030000-5559-f36c-07a3-8618b2c9b2a0
00020000-5559-f36c-f687-d7c6cf805a52	00030000-5559-f36c-a75b-2d49f38fa34f
00020000-5559-f36c-f687-d7c6cf805a52	00030000-5559-f36c-07a3-8618b2c9b2a0
\.


--
-- TOC entry 2663 (class 0 OID 3820784)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 3820814)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 3820929)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 3820558)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 3820600)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5559-f36b-2081-666fe53ed6ff	8341	Adlešiči
00050000-5559-f36b-853f-f0662da96bac	5270	Ajdovščina
00050000-5559-f36b-bcbb-1e5551346360	6280	Ankaran/Ancarano
00050000-5559-f36b-a9b1-c36a8f3eff35	9253	Apače
00050000-5559-f36b-ec5b-c143753fb732	8253	Artiče
00050000-5559-f36b-8f5e-ad2a3be21ebc	4275	Begunje na Gorenjskem
00050000-5559-f36b-01f2-67605243acf8	1382	Begunje pri Cerknici
00050000-5559-f36b-8f4f-a89b040e343e	9231	Beltinci
00050000-5559-f36b-88c9-2fa998f82435	2234	Benedikt
00050000-5559-f36b-25cc-f24e1c427da0	2345	Bistrica ob Dravi
00050000-5559-f36b-fafc-70a18ab1f792	3256	Bistrica ob Sotli
00050000-5559-f36b-dca5-563af2f91d2c	8259	Bizeljsko
00050000-5559-f36b-3b3c-3ba1f3960025	1223	Blagovica
00050000-5559-f36b-94e6-78b79a10f4c0	8283	Blanca
00050000-5559-f36b-481e-c0b0f40b34ab	4260	Bled
00050000-5559-f36b-cb5e-1fb36affc53b	4273	Blejska Dobrava
00050000-5559-f36b-5c8b-64e9e52950cc	9265	Bodonci
00050000-5559-f36b-d830-7530bf103fff	9222	Bogojina
00050000-5559-f36b-7bc6-d53622d5740f	4263	Bohinjska Bela
00050000-5559-f36b-1f0e-a6303abe8157	4264	Bohinjska Bistrica
00050000-5559-f36b-0f45-9b443debeb87	4265	Bohinjsko jezero
00050000-5559-f36b-2eda-adb0f71f79c2	1353	Borovnica
00050000-5559-f36b-130d-0e466ce97dc0	8294	Boštanj
00050000-5559-f36b-eca5-88ea6b6333bc	5230	Bovec
00050000-5559-f36b-cb7e-d42fd787481e	5295	Branik
00050000-5559-f36b-c876-3276b4a3de5f	3314	Braslovče
00050000-5559-f36b-a771-79ed28d4bbcd	5223	Breginj
00050000-5559-f36b-c365-6a951c6936fb	8280	Brestanica
00050000-5559-f36b-e354-84929a4ee38c	2354	Bresternica
00050000-5559-f36b-a9c8-d6c907adde72	4243	Brezje
00050000-5559-f36b-0e28-d45be966b4b1	1351	Brezovica pri Ljubljani
00050000-5559-f36b-dd7f-5999c4ca9103	8250	Brežice
00050000-5559-f36b-1529-b409fda41328	4210	Brnik - Aerodrom
00050000-5559-f36b-e82b-f301565b0ca7	8321	Brusnice
00050000-5559-f36b-68a8-28bf47f73e34	3255	Buče
00050000-5559-f36b-6a0d-9331681a5038	8276	Bučka 
00050000-5559-f36b-8490-b9037ae96642	9261	Cankova
00050000-5559-f36b-9aa5-2e659e2d93ad	3000	Celje 
00050000-5559-f36b-42d6-70807417aa4e	3001	Celje - poštni predali
00050000-5559-f36b-4a1a-8a33a4635326	4207	Cerklje na Gorenjskem
00050000-5559-f36b-8495-87831fc99ca3	8263	Cerklje ob Krki
00050000-5559-f36b-ffc1-ee821e7689a6	1380	Cerknica
00050000-5559-f36b-00f6-7c6985a7cba0	5282	Cerkno
00050000-5559-f36b-66b9-7f99211da137	2236	Cerkvenjak
00050000-5559-f36b-002b-84955c7428ad	2215	Ceršak
00050000-5559-f36b-1bca-83728ab343f1	2326	Cirkovce
00050000-5559-f36b-76e6-24ee37e07193	2282	Cirkulane
00050000-5559-f36b-2d2b-d0f38b00ffe1	5273	Col
00050000-5559-f36b-244b-b43ddf976252	8251	Čatež ob Savi
00050000-5559-f36b-b959-a5ab4917988c	1413	Čemšenik
00050000-5559-f36b-2757-98638c00d7d5	5253	Čepovan
00050000-5559-f36b-43bf-a98daa9779df	9232	Črenšovci
00050000-5559-f36b-167e-01be37d2701a	2393	Črna na Koroškem
00050000-5559-f36b-acfb-2124577d7904	6275	Črni Kal
00050000-5559-f36b-cb1f-6dd035db1180	5274	Črni Vrh nad Idrijo
00050000-5559-f36b-0cf8-6be7b3bd76d5	5262	Črniče
00050000-5559-f36b-9922-36856140b47f	8340	Črnomelj
00050000-5559-f36b-6517-4c4d99d2d910	6271	Dekani
00050000-5559-f36b-0bbc-6a3248a612ef	5210	Deskle
00050000-5559-f36b-1b2d-9535b7624cb0	2253	Destrnik
00050000-5559-f36b-0f9b-66135378af9d	6215	Divača
00050000-5559-f36b-73a1-fdd3f6e273c3	1233	Dob
00050000-5559-f36b-2ad3-2322dd677868	3224	Dobje pri Planini
00050000-5559-f36b-c5d1-0066d30d9000	8257	Dobova
00050000-5559-f36b-ae85-06972a5643d4	1423	Dobovec
00050000-5559-f36b-bba8-d37930625c97	5263	Dobravlje
00050000-5559-f36b-8c28-0ddddb790cf3	3204	Dobrna
00050000-5559-f36b-c11f-a1ce8db40da7	8211	Dobrnič
00050000-5559-f36b-bdc0-b9f1727ceb5d	1356	Dobrova
00050000-5559-f36b-1b49-4d32aae5c78f	9223	Dobrovnik/Dobronak 
00050000-5559-f36b-f841-3b5df662a2ad	5212	Dobrovo v Brdih
00050000-5559-f36b-4b5f-3f3436e8ba6a	1431	Dol pri Hrastniku
00050000-5559-f36b-c5b6-23e6a3843224	1262	Dol pri Ljubljani
00050000-5559-f36b-5ac7-69a0e03a19fa	1273	Dole pri Litiji
00050000-5559-f36b-a2ee-9e7c5663dd91	1331	Dolenja vas
00050000-5559-f36b-5a80-5df350975aac	8350	Dolenjske Toplice
00050000-5559-f36b-f949-6995a6da0085	1230	Domžale
00050000-5559-f36b-944c-83e2a70f48cc	2252	Dornava
00050000-5559-f36b-334a-dd44751e40d6	5294	Dornberk
00050000-5559-f36b-0eb5-149cae857de7	1319	Draga
00050000-5559-f36b-a347-892bfacb2071	8343	Dragatuš
00050000-5559-f36b-1cda-027abe94164f	3222	Dramlje
00050000-5559-f36b-f75b-7b2b7308d3f1	2370	Dravograd
00050000-5559-f36b-7cfa-bc25dbe60f6d	4203	Duplje
00050000-5559-f36b-9281-673fa2032d4f	6221	Dutovlje
00050000-5559-f36b-dc1c-48f1227998a9	8361	Dvor
00050000-5559-f36b-6dc2-3fc1d5bdebe8	2343	Fala
00050000-5559-f36b-827e-64c05f2f80b5	9208	Fokovci
00050000-5559-f36b-4441-a24a9c4eb1a2	2313	Fram
00050000-5559-f36b-18ed-fafef65d337b	3213	Frankolovo
00050000-5559-f36b-412e-52532fd40289	1274	Gabrovka
00050000-5559-f36b-04ed-6285919582dd	8254	Globoko
00050000-5559-f36b-8444-0c4fbebcec7c	5275	Godovič
00050000-5559-f36b-c310-46ea21b8cd8e	4204	Golnik
00050000-5559-f36b-7b4f-6416412b2ea5	3303	Gomilsko
00050000-5559-f36b-a70a-0a8c6aabd6d1	4224	Gorenja vas
00050000-5559-f36b-709c-de094016273f	3263	Gorica pri Slivnici
00050000-5559-f36b-d1dc-5dbd1217e20e	2272	Gorišnica
00050000-5559-f36b-63e3-5e87e3d69642	9250	Gornja Radgona
00050000-5559-f36b-b0bf-bb22d9807801	3342	Gornji Grad
00050000-5559-f36b-e3bc-3d4c76572a4d	4282	Gozd Martuljek
00050000-5559-f36b-1c95-ad04997b9fad	6272	Gračišče
00050000-5559-f36b-9384-7c03180c6528	9264	Grad
00050000-5559-f36b-1a7f-f09b318c53d9	8332	Gradac
00050000-5559-f36b-c51d-bf6334cdd23a	1384	Grahovo
00050000-5559-f36b-9b3f-1ccad8d0f768	5242	Grahovo ob Bači
00050000-5559-f36b-fdb2-69850dbb0dc3	5251	Grgar
00050000-5559-f36b-dc9a-dc54c66e49e1	3302	Griže
00050000-5559-f36b-eb5e-872dc2799e99	3231	Grobelno
00050000-5559-f36b-b2af-e5f284149431	1290	Grosuplje
00050000-5559-f36b-56c4-0b9e834791e6	2288	Hajdina
00050000-5559-f36b-3f23-7e61e9017041	8362	Hinje
00050000-5559-f36b-fbaa-a6e8e9c4c1f2	2311	Hoče
00050000-5559-f36b-f5f8-5147fa6c45a1	9205	Hodoš/Hodos
00050000-5559-f36b-e710-a09a5a303063	1354	Horjul
00050000-5559-f36b-3470-8f94e71f1fcd	1372	Hotedršica
00050000-5559-f36b-a997-5fa0a810b0f0	1430	Hrastnik
00050000-5559-f36b-cca7-2e62595cfa9d	6225	Hruševje
00050000-5559-f36b-0f92-ceee1c7c21ad	4276	Hrušica
00050000-5559-f36b-5f96-70c8e5aa79ed	5280	Idrija
00050000-5559-f36b-ab12-76332171721e	1292	Ig
00050000-5559-f36b-0c9e-12ea87d205a2	6250	Ilirska Bistrica
00050000-5559-f36b-f9a5-fd40431c10e3	6251	Ilirska Bistrica-Trnovo
00050000-5559-f36b-8754-7a18b7480c5c	1295	Ivančna Gorica
00050000-5559-f36b-f89a-cf829a26cc8c	2259	Ivanjkovci
00050000-5559-f36b-da79-a9b9b61ed0e4	1411	Izlake
00050000-5559-f36b-4851-6fb8e8ccac73	6310	Izola/Isola
00050000-5559-f36b-ed93-98cce34d964e	2222	Jakobski Dol
00050000-5559-f36b-13b5-602951dc7221	2221	Jarenina
00050000-5559-f36b-61e7-e2dd044b64b4	6254	Jelšane
00050000-5559-f36b-8135-6bbc48b1492d	4270	Jesenice
00050000-5559-f36b-970c-800889ff7a4e	8261	Jesenice na Dolenjskem
00050000-5559-f36b-8d58-983a58ba853f	3273	Jurklošter
00050000-5559-f36b-f53a-1d7ada0c7537	2223	Jurovski Dol
00050000-5559-f36b-d5df-a2fac548b699	2256	Juršinci
00050000-5559-f36b-e2b1-210a0a895b1e	5214	Kal nad Kanalom
00050000-5559-f36b-666d-628a6e2d80d2	3233	Kalobje
00050000-5559-f36b-5e6b-d27aebda7a5d	4246	Kamna Gorica
00050000-5559-f36b-3046-7c906feb8b95	2351	Kamnica
00050000-5559-f36b-a3e5-118f17a3517d	1241	Kamnik
00050000-5559-f36b-b26f-4c296e4a9ea1	5213	Kanal
00050000-5559-f36b-dfdd-acd2c87126dd	8258	Kapele
00050000-5559-f36b-3304-dbe6614f0d3f	2362	Kapla
00050000-5559-f36b-0608-53c28ebea20d	2325	Kidričevo
00050000-5559-f36b-5648-d573a20e09c1	1412	Kisovec
00050000-5559-f36b-d38e-e1d5c3440e40	6253	Knežak
00050000-5559-f36b-ee23-1ef33b8440f8	5222	Kobarid
00050000-5559-f36b-f963-7578f56bdb8c	9227	Kobilje
00050000-5559-f36b-b86d-688b3d9ba59a	1330	Kočevje
00050000-5559-f36b-78df-88e41b7d776c	1338	Kočevska Reka
00050000-5559-f36b-8f3f-a8dede118075	2276	Kog
00050000-5559-f36b-2c62-ea5b97599709	5211	Kojsko
00050000-5559-f36b-e6e2-4fa067125991	6223	Komen
00050000-5559-f36b-2298-5daa3db5da0d	1218	Komenda
00050000-5559-f36b-f3ff-b5bc9f21e7a4	6000	Koper/Capodistria 
00050000-5559-f36b-f359-3b0712487665	6001	Koper/Capodistria - poštni predali
00050000-5559-f36b-983b-0d8e5d761905	8282	Koprivnica
00050000-5559-f36b-3fa3-9748044b6c2c	5296	Kostanjevica na Krasu
00050000-5559-f36b-fb78-27eda62589fd	8311	Kostanjevica na Krki
00050000-5559-f36b-a3b8-930b0506627f	1336	Kostel
00050000-5559-f36b-a537-651267c1aacb	6256	Košana
00050000-5559-f36b-fbeb-eba5908ac864	2394	Kotlje
00050000-5559-f36b-44ca-0ba3be2021b2	6240	Kozina
00050000-5559-f36b-683a-e5ded68eb0b8	3260	Kozje
00050000-5559-f36b-1a66-7ecba287cb7d	4000	Kranj 
00050000-5559-f36b-484f-c8ea49e5cd3c	4001	Kranj - poštni predali
00050000-5559-f36b-54cb-e98f0f66b8e6	4280	Kranjska Gora
00050000-5559-f36b-14ba-e615324e3e70	1281	Kresnice
00050000-5559-f36b-4d5d-3ac0522a5131	4294	Križe
00050000-5559-f36b-dd23-4f0e00a1ec2e	9206	Križevci
00050000-5559-f36b-58cc-5fec7a532266	9242	Križevci pri Ljutomeru
00050000-5559-f36b-73cd-57d9f53efd73	1301	Krka
00050000-5559-f36b-e574-e15efec01b76	8296	Krmelj
00050000-5559-f36b-5ed9-364668fc2a60	4245	Kropa
00050000-5559-f36b-5deb-0002eb91120e	8262	Krška vas
00050000-5559-f36b-2204-57109ba067fe	8270	Krško
00050000-5559-f36b-fcda-344be2773f34	9263	Kuzma
00050000-5559-f36b-bdcf-953270387ab3	2318	Laporje
00050000-5559-f36b-8b86-71082e08a046	3270	Laško
00050000-5559-f36b-c943-2a8ac7cabce3	1219	Laze v Tuhinju
00050000-5559-f36b-4f70-79fc1c188e34	2230	Lenart v Slovenskih goricah
00050000-5559-f36b-de9a-bfcdd53aa860	9220	Lendava/Lendva
00050000-5559-f36b-d7a5-1f7721d82343	4248	Lesce
00050000-5559-f36b-2ebf-5cf1f64036e1	3261	Lesično
00050000-5559-f36b-f91a-2796a583a14a	8273	Leskovec pri Krškem
00050000-5559-f36b-398b-f7c1b9d9597e	2372	Libeliče
00050000-5559-f36b-1e57-020f0c7dccf3	2341	Limbuš
00050000-5559-f36b-5e14-c162c90bda60	1270	Litija
00050000-5559-f36b-871b-27450340515a	3202	Ljubečna
00050000-5559-f36b-00af-ceea0ad879f0	1000	Ljubljana 
00050000-5559-f36b-db21-7f8222230e41	1001	Ljubljana - poštni predali
00050000-5559-f36b-7b14-44847d9e9b4b	1231	Ljubljana - Črnuče
00050000-5559-f36b-b005-3805bd1dc56b	1261	Ljubljana - Dobrunje
00050000-5559-f36b-f27f-7ee0c65e4c6a	1260	Ljubljana - Polje
00050000-5559-f36b-46d3-079448f95bbc	1210	Ljubljana - Šentvid
00050000-5559-f36b-ec64-666ccbc90193	1211	Ljubljana - Šmartno
00050000-5559-f36b-ec88-5dd61b488221	3333	Ljubno ob Savinji
00050000-5559-f36b-31bb-2c2c7e536533	9240	Ljutomer
00050000-5559-f36b-817a-52f6e103390a	3215	Loče
00050000-5559-f36b-6926-8eb20e179840	5231	Log pod Mangartom
00050000-5559-f36b-0bf9-2688df3ccc5d	1358	Log pri Brezovici
00050000-5559-f36b-c7a6-ba65cd8a9fa9	1370	Logatec
00050000-5559-f36b-dd58-54c1dd7ba596	1371	Logatec
00050000-5559-f36b-4f0e-620dbf965261	1434	Loka pri Zidanem Mostu
00050000-5559-f36b-5602-9d19c427c8f5	3223	Loka pri Žusmu
00050000-5559-f36b-6a1e-9c4eb6a6f562	6219	Lokev
00050000-5559-f36b-6333-ed701c158ecc	1318	Loški Potok
00050000-5559-f36b-4c8c-d8ed9f36b2e6	2324	Lovrenc na Dravskem polju
00050000-5559-f36b-41ac-3d84c68f373a	2344	Lovrenc na Pohorju
00050000-5559-f36b-cb65-994f27a991a7	3334	Luče
00050000-5559-f36b-ff19-ba97fb55801d	1225	Lukovica
00050000-5559-f36b-a9e6-b874e19df4e2	9202	Mačkovci
00050000-5559-f36b-6db3-3700ca3680d1	2322	Majšperk
00050000-5559-f36b-dfa4-af15d675124c	2321	Makole
00050000-5559-f36b-5952-8c0aff0479ec	9243	Mala Nedelja
00050000-5559-f36b-afbc-21a208a08cd1	2229	Malečnik
00050000-5559-f36b-09eb-2f7d02292f79	6273	Marezige
00050000-5559-f36b-dee7-ba925feae2d3	2000	Maribor 
00050000-5559-f36b-77ea-120b517bcbf1	2001	Maribor - poštni predali
00050000-5559-f36b-81b7-702b1ff76fab	2206	Marjeta na Dravskem polju
00050000-5559-f36b-7bc8-35847baa8f91	2281	Markovci
00050000-5559-f36b-c7b7-99e4e96c7876	9221	Martjanci
00050000-5559-f36b-9339-dbf40b83bc33	6242	Materija
00050000-5559-f36b-43ed-56bdd6359169	4211	Mavčiče
00050000-5559-f36b-9a79-8e5a6b04b011	1215	Medvode
00050000-5559-f36b-b9eb-84afa18ae81f	1234	Mengeš
00050000-5559-f36b-adb0-ade93717defe	8330	Metlika
00050000-5559-f36b-6c52-599bfed0395b	2392	Mežica
00050000-5559-f36b-d5df-0e6007f7cce6	2204	Miklavž na Dravskem polju
00050000-5559-f36b-a62f-7ceb0c17ac3c	2275	Miklavž pri Ormožu
00050000-5559-f36b-2baf-e9778064471a	5291	Miren
00050000-5559-f36b-431d-f53ec623b5fa	8233	Mirna
00050000-5559-f36b-85fa-28c0db7907ad	8216	Mirna Peč
00050000-5559-f36b-28b6-d3b1701292f6	2382	Mislinja
00050000-5559-f36b-c27b-7a5917b049e6	4281	Mojstrana
00050000-5559-f36b-6c8f-5461185d87fe	8230	Mokronog
00050000-5559-f36b-8cd5-c1332d72b899	1251	Moravče
00050000-5559-f36b-5b25-7a7939deaaf5	9226	Moravske Toplice
00050000-5559-f36b-b8d7-3f50deeb9369	5216	Most na Soči
00050000-5559-f36b-cbd2-5dec264f87c2	1221	Motnik
00050000-5559-f36b-ce54-c1885c0b08a1	3330	Mozirje
00050000-5559-f36b-2912-284bda2ecc9d	9000	Murska Sobota 
00050000-5559-f36b-5c27-6aac29666181	9001	Murska Sobota - poštni predali
00050000-5559-f36b-c701-60a3fd04b362	2366	Muta
00050000-5559-f36b-9cdf-ef1ecb3e3e83	4202	Naklo
00050000-5559-f36b-4624-b86163a1ceab	3331	Nazarje
00050000-5559-f36b-7a56-5b076a212eed	1357	Notranje Gorice
00050000-5559-f36b-5b13-ae3af47b23d7	3203	Nova Cerkev
00050000-5559-f36b-5f54-f0b7ae1501ed	5000	Nova Gorica 
00050000-5559-f36b-9b3a-34fa964d97d8	5001	Nova Gorica - poštni predali
00050000-5559-f36b-9060-84d69f026f91	1385	Nova vas
00050000-5559-f36b-2acf-74d3ef81c0a6	8000	Novo mesto
00050000-5559-f36b-8fda-fbd7675e39e7	8001	Novo mesto - poštni predali
00050000-5559-f36b-7ef5-ca9b9b1ece5b	6243	Obrov
00050000-5559-f36b-2cca-95cad20b448b	9233	Odranci
00050000-5559-f36b-93e4-b13020ef94e5	2317	Oplotnica
00050000-5559-f36b-d2b4-8236957744c7	2312	Orehova vas
00050000-5559-f36b-ca62-221997a85b05	2270	Ormož
00050000-5559-f36b-c147-dd73cc30c43d	1316	Ortnek
00050000-5559-f36b-f5b5-c1ec0b76bcd8	1337	Osilnica
00050000-5559-f36b-4c65-6d9f35eaa190	8222	Otočec
00050000-5559-f36b-2c91-213a34d92d0b	2361	Ožbalt
00050000-5559-f36b-e500-1ea905c438e9	2231	Pernica
00050000-5559-f36b-582e-4eb485887b5e	2211	Pesnica pri Mariboru
00050000-5559-f36b-b7d6-6b46d63b5993	9203	Petrovci
00050000-5559-f36b-b4f8-42166a049b4e	3301	Petrovče
00050000-5559-f36b-759f-cf1b33d4c6e3	6330	Piran/Pirano
00050000-5559-f36b-ae7e-26b7b4915efc	8255	Pišece
00050000-5559-f36b-f118-19a57d0f417c	6257	Pivka
00050000-5559-f36b-565d-a8efe526bacb	6232	Planina
00050000-5559-f36b-ddd9-690d01f14a6a	3225	Planina pri Sevnici
00050000-5559-f36b-02aa-966eef9dc8dc	6276	Pobegi
00050000-5559-f36b-0e56-6fb4e4559026	8312	Podbočje
00050000-5559-f36b-aca1-635556ae68c9	5243	Podbrdo
00050000-5559-f36b-3eee-6bc4107d67ce	3254	Podčetrtek
00050000-5559-f36b-732f-01098e2556a1	2273	Podgorci
00050000-5559-f36b-74bd-f8145029386b	6216	Podgorje
00050000-5559-f36b-2306-9821cc613441	2381	Podgorje pri Slovenj Gradcu
00050000-5559-f36b-9579-a0a44b5a74e1	6244	Podgrad
00050000-5559-f36b-c50e-6b91caadb41c	1414	Podkum
00050000-5559-f36b-9e20-3f84b3c6994d	2286	Podlehnik
00050000-5559-f36b-5193-12f415e57f6f	5272	Podnanos
00050000-5559-f36b-af98-0282deb360e1	4244	Podnart
00050000-5559-f36b-dfdd-cf7b86b32d5a	3241	Podplat
00050000-5559-f36b-04ca-ea6ddb929be9	3257	Podsreda
00050000-5559-f36b-e919-0709ab75ef1b	2363	Podvelka
00050000-5559-f36b-e9bd-42261eaa3f79	2208	Pohorje
00050000-5559-f36b-19fc-133daaa869af	2257	Polenšak
00050000-5559-f36b-9a66-e76fd832c734	1355	Polhov Gradec
00050000-5559-f36b-2570-bdda8ee20ba4	4223	Poljane nad Škofjo Loko
00050000-5559-f36b-8fc8-e02ee57769b6	2319	Poljčane
00050000-5559-f36b-29a6-07ef59ae90f8	1272	Polšnik
00050000-5559-f36b-1f4d-1181dd6321ea	3313	Polzela
00050000-5559-f36b-acad-f0fa1f1d94ff	3232	Ponikva
00050000-5559-f36b-b14c-76e29b45b142	6320	Portorož/Portorose
00050000-5559-f36b-ae20-ed8cb873a484	6230	Postojna
00050000-5559-f36b-1e18-6bc3a9119e3f	2331	Pragersko
00050000-5559-f36b-4f0e-06d70e74be77	3312	Prebold
00050000-5559-f36b-76d8-46bfc0f12b08	4205	Preddvor
00050000-5559-f36b-4a89-ef5a3ea069bb	6255	Prem
00050000-5559-f36b-b8d3-3d3fafc08b90	1352	Preserje
00050000-5559-f36b-0691-5f1445d27916	6258	Prestranek
00050000-5559-f36b-22a5-54828e0f8e7d	2391	Prevalje
00050000-5559-f36b-b381-e05b041964b7	3262	Prevorje
00050000-5559-f36b-e16d-71418e80f3d6	1276	Primskovo 
00050000-5559-f36b-6888-6a01b67a438a	3253	Pristava pri Mestinju
00050000-5559-f36b-7f82-4776e6c804e2	9207	Prosenjakovci/Partosfalva
00050000-5559-f36b-b264-1c86e0a6eeb4	5297	Prvačina
00050000-5559-f36b-7185-99673e720faf	2250	Ptuj
00050000-5559-f36b-19f6-bb4ba4be88b9	2323	Ptujska Gora
00050000-5559-f36b-17a1-6a98971b02d1	9201	Puconci
00050000-5559-f36b-4b12-4418f5e1de13	2327	Rače
00050000-5559-f36b-aae5-b8c21da449c7	1433	Radeče
00050000-5559-f36b-7139-2425939b32ad	9252	Radenci
00050000-5559-f36b-f4e2-e8811fa91b42	2360	Radlje ob Dravi
00050000-5559-f36b-488a-7dd00d63cb9a	1235	Radomlje
00050000-5559-f36b-baa8-b872ea6b5acd	4240	Radovljica
00050000-5559-f36b-b3f3-664de4210073	8274	Raka
00050000-5559-f36b-fc78-76d5f4690e9c	1381	Rakek
00050000-5559-f36b-a146-56b2288f292b	4283	Rateče - Planica
00050000-5559-f36b-1c50-78d97e9889d6	2390	Ravne na Koroškem
00050000-5559-f36b-426d-082ea65847c6	9246	Razkrižje
00050000-5559-f36b-12e2-77a5a67e06f2	3332	Rečica ob Savinji
00050000-5559-f36b-50bd-71cdc4932be7	5292	Renče
00050000-5559-f36b-0f49-c2588ead0eac	1310	Ribnica
00050000-5559-f36b-453f-173a0b15b3cf	2364	Ribnica na Pohorju
00050000-5559-f36b-741e-5a7bcfc0a58a	3272	Rimske Toplice
00050000-5559-f36b-9b9d-cdd3a720fc1b	1314	Rob
00050000-5559-f36b-2186-6511a1609210	5215	Ročinj
00050000-5559-f36b-96ef-d592d64d726a	3250	Rogaška Slatina
00050000-5559-f36b-c535-2aefcbafdd24	9262	Rogašovci
00050000-5559-f36b-fdde-8f4e822f3e50	3252	Rogatec
00050000-5559-f36b-6ffd-1d8ae009a4da	1373	Rovte
00050000-5559-f36b-4154-c4697559b18c	2342	Ruše
00050000-5559-f36b-63a8-aa6b24cd70b6	1282	Sava
00050000-5559-f36b-648e-1942f9a93346	6333	Sečovlje/Sicciole
00050000-5559-f36b-7beb-540af8fcf024	4227	Selca
00050000-5559-f36b-d346-7ef837f6329a	2352	Selnica ob Dravi
00050000-5559-f36b-53c9-22e45988df40	8333	Semič
00050000-5559-f36b-fad4-48405bcb9175	8281	Senovo
00050000-5559-f36b-50d6-74dfe84351a8	6224	Senožeče
00050000-5559-f36b-6bf0-e8fbb7b544da	8290	Sevnica
00050000-5559-f36b-6e1e-b38db5ee3132	6210	Sežana
00050000-5559-f36b-e040-674b74d60399	2214	Sladki Vrh
00050000-5559-f36b-1b88-db67048826a4	5283	Slap ob Idrijci
00050000-5559-f36b-5027-13bb92633917	2380	Slovenj Gradec
00050000-5559-f36b-312a-cb2d6c226652	2310	Slovenska Bistrica
00050000-5559-f36b-e4a7-921e3bea0fe3	3210	Slovenske Konjice
00050000-5559-f36b-f329-c02a2bad609c	1216	Smlednik
00050000-5559-f36b-d1ac-913e7283dd7e	5232	Soča
00050000-5559-f36b-1d4e-ac2504b07744	1317	Sodražica
00050000-5559-f36b-f1b5-33884cf49df5	3335	Solčava
00050000-5559-f36b-577c-a52cd79f5045	5250	Solkan
00050000-5559-f36b-7850-f913b9d2c332	4229	Sorica
00050000-5559-f36b-ba0d-3d60aaafa40a	4225	Sovodenj
00050000-5559-f36b-f22e-52768f8f4d62	5281	Spodnja Idrija
00050000-5559-f36b-4f6f-a2784bb5b3a9	2241	Spodnji Duplek
00050000-5559-f36b-2b43-5745a41da0db	9245	Spodnji Ivanjci
00050000-5559-f36b-4905-322729886117	2277	Središče ob Dravi
00050000-5559-f36b-dbb6-78f6325e7381	4267	Srednja vas v Bohinju
00050000-5559-f36b-c3f6-548fde43a1b0	8256	Sromlje 
00050000-5559-f36b-9354-c57c0de3c7f4	5224	Srpenica
00050000-5559-f36b-d871-7a78d28cf307	1242	Stahovica
00050000-5559-f36b-c352-8c78f1ee3c4f	1332	Stara Cerkev
00050000-5559-f36b-050a-c33b2a5439db	8342	Stari trg ob Kolpi
00050000-5559-f36b-34b9-82f9f163a277	1386	Stari trg pri Ložu
00050000-5559-f36b-6d1b-b53302e1347a	2205	Starše
00050000-5559-f36b-fda1-5d2228473355	2289	Stoperce
00050000-5559-f36b-e054-2ccf3aa8392b	8322	Stopiče
00050000-5559-f36b-8afa-6a941827e00f	3206	Stranice
00050000-5559-f36b-1732-8d50f296cd22	8351	Straža
00050000-5559-f36b-13bd-955591e3fa62	1313	Struge
00050000-5559-f36b-bbba-39d380476d64	8293	Studenec
00050000-5559-f36b-9a25-5ac36cf0fc0e	8331	Suhor
00050000-5559-f36b-42e3-4976c3a12aaa	2233	Sv. Ana v Slovenskih goricah
00050000-5559-f36b-9d43-1c6596d5fc21	2235	Sv. Trojica v Slovenskih goricah
00050000-5559-f36b-177c-c2b6d20e7c59	2353	Sveti Duh na Ostrem Vrhu
00050000-5559-f36b-01fa-a8900da49f43	9244	Sveti Jurij ob Ščavnici
00050000-5559-f36b-e1b6-c143451ae54f	3264	Sveti Štefan
00050000-5559-f36b-45b8-74f752a07e66	2258	Sveti Tomaž
00050000-5559-f36b-af52-aca10a347115	9204	Šalovci
00050000-5559-f36b-3958-66664426eff5	5261	Šempas
00050000-5559-f36b-ae13-d4ae190db893	5290	Šempeter pri Gorici
00050000-5559-f36b-fdaf-dc5e1d93b4ee	3311	Šempeter v Savinjski dolini
00050000-5559-f36b-04a2-3f58a225d0f4	4208	Šenčur
00050000-5559-f36b-baed-716bd61d136f	2212	Šentilj v Slovenskih goricah
00050000-5559-f36b-6517-a4637c68a9e7	8297	Šentjanž
00050000-5559-f36b-295c-cc0398bdff32	2373	Šentjanž pri Dravogradu
00050000-5559-f36b-dc7b-d6235246aeb6	8310	Šentjernej
00050000-5559-f36b-df7e-2cbec3882bb4	3230	Šentjur
00050000-5559-f36b-d611-ce0bde1781d0	3271	Šentrupert
00050000-5559-f36b-4b1c-7fcb1ed88a32	8232	Šentrupert
00050000-5559-f36b-a439-709e51c7a4ea	1296	Šentvid pri Stični
00050000-5559-f36b-cd7b-b018d5877649	8275	Škocjan
00050000-5559-f36b-9214-3fca920a648b	6281	Škofije
00050000-5559-f36b-c280-12173e700f0d	4220	Škofja Loka
00050000-5559-f36b-1e29-a4b7ef9370cb	3211	Škofja vas
00050000-5559-f36b-a781-856e96b95409	1291	Škofljica
00050000-5559-f36b-d2ad-1a1e3b3f9b0a	6274	Šmarje
00050000-5559-f36b-f20c-32e8ef11f861	1293	Šmarje - Sap
00050000-5559-f36b-835c-c21c9240dc5f	3240	Šmarje pri Jelšah
00050000-5559-f36b-c6c3-0a31209726c9	8220	Šmarješke Toplice
00050000-5559-f36b-e293-5c6050d2b982	2315	Šmartno na Pohorju
00050000-5559-f36b-14ff-fc0bc21ba287	3341	Šmartno ob Dreti
00050000-5559-f36b-6f1e-363ef1f1a005	3327	Šmartno ob Paki
00050000-5559-f36b-b10c-b3bd59788c0a	1275	Šmartno pri Litiji
00050000-5559-f36b-ec2c-6a6a6a58c929	2383	Šmartno pri Slovenj Gradcu
00050000-5559-f36b-8c81-a6b432fd7b5e	3201	Šmartno v Rožni dolini
00050000-5559-f36b-7ccc-fcc5c2bbb71b	3325	Šoštanj
00050000-5559-f36b-a20f-0e62cacb3578	6222	Štanjel
00050000-5559-f36b-f7b6-91011a586a18	3220	Štore
00050000-5559-f36b-c0e5-773c276f9fff	3304	Tabor
00050000-5559-f36b-cbbf-09740c0f223f	3221	Teharje
00050000-5559-f36b-38ae-2e3758729a0f	9251	Tišina
00050000-5559-f36b-a88d-e1b618ef8988	5220	Tolmin
00050000-5559-f36b-416a-08d211c043db	3326	Topolšica
00050000-5559-f36b-724f-4127485da2d4	2371	Trbonje
00050000-5559-f36b-5de8-3f7a5dec5615	1420	Trbovlje
00050000-5559-f36b-1332-0fa2fa026212	8231	Trebelno 
00050000-5559-f36b-2490-3af316cd6b67	8210	Trebnje
00050000-5559-f36b-476e-330336b4b0c2	5252	Trnovo pri Gorici
00050000-5559-f36b-2ff5-c6048c562827	2254	Trnovska vas
00050000-5559-f36b-f6aa-41ba643ed28e	1222	Trojane
00050000-5559-f36b-0460-25981e409da5	1236	Trzin
00050000-5559-f36b-dbfd-09453e276b2a	4290	Tržič
00050000-5559-f36b-9eaf-6a143261ac5f	8295	Tržišče
00050000-5559-f36b-a53e-8c3c76a4b954	1311	Turjak
00050000-5559-f36b-39fd-5cb9f29e04fa	9224	Turnišče
00050000-5559-f36b-9e1e-7adce67d4b48	8323	Uršna sela
00050000-5559-f36b-05b3-d3d7d271936c	1252	Vače
00050000-5559-f36b-b3dd-00a4e927047b	3320	Velenje 
00050000-5559-f36b-0e68-fc19afadf85e	3322	Velenje - poštni predali
00050000-5559-f36b-e4f1-ef099fb07b0d	8212	Velika Loka
00050000-5559-f36b-a519-9a483980707c	2274	Velika Nedelja
00050000-5559-f36b-87ef-0c78eb122188	9225	Velika Polana
00050000-5559-f36b-9021-a66bab0d35a7	1315	Velike Lašče
00050000-5559-f36b-da0d-079066b86ac1	8213	Veliki Gaber
00050000-5559-f36b-d621-70d8465629fa	9241	Veržej
00050000-5559-f36b-2785-dc339c98c7bb	1312	Videm - Dobrepolje
00050000-5559-f36b-cde6-9a91545c57be	2284	Videm pri Ptuju
00050000-5559-f36b-15d4-d1f4d67bec82	8344	Vinica
00050000-5559-f36b-3682-61f0fa72cfd7	5271	Vipava
00050000-5559-f36b-fb91-1cea0b3872f0	4212	Visoko
00050000-5559-f36b-0549-e17e41d175d6	1294	Višnja Gora
00050000-5559-f36b-dd8c-1fe644bc090b	3205	Vitanje
00050000-5559-f36b-f362-cac0f1a87af2	2255	Vitomarci
00050000-5559-f36b-47e5-40a080008ee0	1217	Vodice
00050000-5559-f36b-a513-34edaa47f06f	3212	Vojnik\t
00050000-5559-f36b-3dc9-43dcabf1f756	5293	Volčja Draga
00050000-5559-f36b-b6ef-a57a0ff0b8cb	2232	Voličina
00050000-5559-f36b-5314-7cd06c491dbe	3305	Vransko
00050000-5559-f36b-394d-5773655d7d74	6217	Vremski Britof
00050000-5559-f36b-f0a5-ea2fd66e4a7b	1360	Vrhnika
00050000-5559-f36b-b057-3e39c549a8ce	2365	Vuhred
00050000-5559-f36b-d14e-7a59f403bdda	2367	Vuzenica
00050000-5559-f36b-d80a-23a7a409dcdf	8292	Zabukovje 
00050000-5559-f36b-3aad-ebee0852105a	1410	Zagorje ob Savi
00050000-5559-f36b-16b5-4ee624a12f62	1303	Zagradec
00050000-5559-f36b-ce8b-6cb1c297a871	2283	Zavrč
00050000-5559-f36b-16bb-b7604d279bd4	8272	Zdole 
00050000-5559-f36b-9879-cbd6692349e2	4201	Zgornja Besnica
00050000-5559-f36b-c905-6c748dd07b03	2242	Zgornja Korena
00050000-5559-f36b-82f7-4e05b8a57a1a	2201	Zgornja Kungota
00050000-5559-f36b-2bf0-66c8c60b08e1	2316	Zgornja Ložnica
00050000-5559-f36b-5e78-120ee54765a4	2314	Zgornja Polskava
00050000-5559-f36b-24fb-862df9375dc5	2213	Zgornja Velka
00050000-5559-f36b-7b4e-271da96de5fa	4247	Zgornje Gorje
00050000-5559-f36b-9c19-108fce60dac4	4206	Zgornje Jezersko
00050000-5559-f36b-a29d-083923b9f5d0	2285	Zgornji Leskovec
00050000-5559-f36b-5795-6040d16556e1	1432	Zidani Most
00050000-5559-f36b-d8ea-cd7283ead6ec	3214	Zreče
00050000-5559-f36b-0f64-385d810290f2	4209	Žabnica
00050000-5559-f36b-114d-904bba4f3b84	3310	Žalec
00050000-5559-f36b-8e21-097d49cffad3	4228	Železniki
00050000-5559-f36b-8add-514e5548924c	2287	Žetale
00050000-5559-f36b-c4fe-cfd3a7883551	4226	Žiri
00050000-5559-f36b-ecea-8f53a2f6e99b	4274	Žirovnica
00050000-5559-f36b-56c9-4ecd5a9dc3c5	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 3820758)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2628 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2642 (class 0 OID 3820585)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 3820651)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 3820770)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 3820875)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 3820922)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 3820799)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 3820743)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 3820733)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 3820912)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 3820865)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 3820452)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5559-f36c-bdf5-cf29a96b214b	00010000-5559-f36c-899c-c8f5a283c4d6	2015-05-18 16:13:00	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROyMa9XMo8uvEzCY.PULoUX6GkQLCc1FO";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 3820808)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 3820490)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5559-f36c-1f94-afb19499a15a	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5559-f36c-5f07-0fb0eaa9b02e	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5559-f36c-c523-638870a05c88	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5559-f36c-7f6d-9508270c5290	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5559-f36c-e1e2-25d4e12c9075	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5559-f36c-f687-d7c6cf805a52	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 3820474)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5559-f36c-bdf5-cf29a96b214b	00020000-5559-f36c-7f6d-9508270c5290
00010000-5559-f36c-899c-c8f5a283c4d6	00020000-5559-f36c-7f6d-9508270c5290
\.


--
-- TOC entry 2668 (class 0 OID 3820822)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 3820764)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 3820714)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 3820550)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 3820720)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 3820900)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 3820620)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 3820461)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5559-f36c-899c-c8f5a283c4d6	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO2Z/VDhoakwLOOpNFdFRR07OL67ZnnjS	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5559-f36c-bdf5-cf29a96b214b	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 3820955)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 3820666)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 3820791)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 3820857)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 3820698)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 3820945)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 3820847)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2274 (class 2606 OID 3820515)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 3820995)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 3820988)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 3820899)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 3820688)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2343 (class 2606 OID 3820713)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 3820646)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 3820843)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 3820664)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 3820707)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2249 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 3820756)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 3820783)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2303 (class 2606 OID 3820618)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2278 (class 2606 OID 3820524)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2293 (class 2606 OID 3820582)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2280 (class 2606 OID 3820548)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2272 (class 2606 OID 3820504)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2265 (class 2606 OID 3820489)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 3820789)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 3820821)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 3820939)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2288 (class 2606 OID 3820575)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 3820606)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 3820762)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2255 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 3820596)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 3820655)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 3820774)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 3820881)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 3820927)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 3820806)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 3820747)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 3820738)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 3820921)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 3820872)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2257 (class 2606 OID 3820460)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 3820812)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 3820478)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2267 (class 2606 OID 3820498)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2395 (class 2606 OID 3820830)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 3820769)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 3820719)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2285 (class 2606 OID 3820555)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 3820729)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 3820911)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2308 (class 2606 OID 3820631)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 3820473)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 3820970)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 3820673)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 3820797)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 3820863)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 3820702)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 3820954)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 3820856)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 1259 OID 3820695)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2286 (class 1259 OID 3820577)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2251 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2252 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2253 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2377 (class 1259 OID 3820790)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2371 (class 1259 OID 3820776)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2372 (class 1259 OID 3820775)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2323 (class 1259 OID 3820674)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2398 (class 1259 OID 3820846)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2399 (class 1259 OID 3820844)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 3820845)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2423 (class 1259 OID 3820941)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2424 (class 1259 OID 3820942)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2425 (class 1259 OID 3820944)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 3820973)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 3820972)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 3820971)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2305 (class 1259 OID 3820633)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2306 (class 1259 OID 3820632)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2290 (class 1259 OID 3820584)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 3820583)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2386 (class 1259 OID 3820813)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2341 (class 1259 OID 3820708)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2269 (class 1259 OID 3820505)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2270 (class 1259 OID 3820506)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2391 (class 1259 OID 3820833)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2392 (class 1259 OID 3820832)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2393 (class 1259 OID 3820831)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2315 (class 1259 OID 3820656)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2316 (class 1259 OID 3820658)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2317 (class 1259 OID 3820657)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2351 (class 1259 OID 3820742)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2352 (class 1259 OID 3820740)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2353 (class 1259 OID 3820739)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2354 (class 1259 OID 3820741)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2260 (class 1259 OID 3820479)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2261 (class 1259 OID 3820480)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2380 (class 1259 OID 3820798)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2366 (class 1259 OID 3820763)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2406 (class 1259 OID 3820873)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2407 (class 1259 OID 3820874)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2294 (class 1259 OID 3820598)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2295 (class 1259 OID 3820597)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2296 (class 1259 OID 3820599)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2410 (class 1259 OID 3820882)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2411 (class 1259 OID 3820883)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 3820998)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 3820997)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 3821000)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 3820996)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2446 (class 1259 OID 3820999)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2403 (class 1259 OID 3820864)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2357 (class 1259 OID 3820751)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2358 (class 1259 OID 3820750)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2359 (class 1259 OID 3820748)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2360 (class 1259 OID 3820749)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2247 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 3820990)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 3820989)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2322 (class 1259 OID 3820665)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2275 (class 1259 OID 3820526)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2276 (class 1259 OID 3820525)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2282 (class 1259 OID 3820556)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2283 (class 1259 OID 3820557)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2346 (class 1259 OID 3820732)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2347 (class 1259 OID 3820731)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2348 (class 1259 OID 3820730)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2329 (class 1259 OID 3820697)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2330 (class 1259 OID 3820693)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2331 (class 1259 OID 3820690)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2332 (class 1259 OID 3820691)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2333 (class 1259 OID 3820689)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2334 (class 1259 OID 3820694)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2335 (class 1259 OID 3820692)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2289 (class 1259 OID 3820576)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2311 (class 1259 OID 3820647)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 3820649)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2313 (class 1259 OID 3820648)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2314 (class 1259 OID 3820650)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2365 (class 1259 OID 3820757)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2428 (class 1259 OID 3820940)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2281 (class 1259 OID 3820549)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2304 (class 1259 OID 3820619)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2385 (class 1259 OID 3820807)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2250 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2301 (class 1259 OID 3820607)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2422 (class 1259 OID 3820928)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2268 (class 1259 OID 3820499)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2336 (class 1259 OID 3820696)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2473 (class 2606 OID 3821131)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2470 (class 2606 OID 3821116)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2471 (class 2606 OID 3821121)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2475 (class 2606 OID 3821141)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2469 (class 2606 OID 3821111)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2474 (class 2606 OID 3821136)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 3821126)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 3821046)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 3821226)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2491 (class 2606 OID 3821221)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2490 (class 2606 OID 3821216)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 3821106)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2500 (class 2606 OID 3821266)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2498 (class 2606 OID 3821256)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 3821261)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 3821206)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 3821301)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 3821306)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 3821311)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2512 (class 2606 OID 3821326)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 3821321)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2510 (class 2606 OID 3821316)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2463 (class 2606 OID 3821081)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2462 (class 2606 OID 3821076)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2458 (class 2606 OID 3821056)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2457 (class 2606 OID 3821051)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 3821031)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 3821236)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 3821146)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2449 (class 2606 OID 3821011)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2450 (class 2606 OID 3821016)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2497 (class 2606 OID 3821251)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 3821246)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2495 (class 2606 OID 3821241)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2464 (class 2606 OID 3821086)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2466 (class 2606 OID 3821096)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 3821091)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2483 (class 2606 OID 3821181)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2481 (class 2606 OID 3821171)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2480 (class 2606 OID 3821166)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2482 (class 2606 OID 3821176)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2447 (class 2606 OID 3821001)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2448 (class 2606 OID 3821006)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 3821231)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 3821211)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2502 (class 2606 OID 3821276)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2503 (class 2606 OID 3821281)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 3821066)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2459 (class 2606 OID 3821061)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2461 (class 2606 OID 3821071)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2504 (class 2606 OID 3821286)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2505 (class 2606 OID 3821291)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 3821351)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2516 (class 2606 OID 3821346)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2519 (class 2606 OID 3821361)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2515 (class 2606 OID 3821341)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2518 (class 2606 OID 3821356)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 3821271)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2487 (class 2606 OID 3821201)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2486 (class 2606 OID 3821196)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2484 (class 2606 OID 3821186)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2485 (class 2606 OID 3821191)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2514 (class 2606 OID 3821336)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2513 (class 2606 OID 3821331)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 3821101)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 3821296)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2452 (class 2606 OID 3821026)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2451 (class 2606 OID 3821021)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2454 (class 2606 OID 3821036)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2455 (class 2606 OID 3821041)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2479 (class 2606 OID 3821161)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 3821156)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2477 (class 2606 OID 3821151)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-18 16:13:00 CEST

--
-- PostgreSQL database dump complete
--

