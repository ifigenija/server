--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-14 11:50:46 CEST

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
-- TOC entry 2696 (class 0 OID 0)
-- Dependencies: 226
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 3371627)
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
-- TOC entry 225 (class 1259 OID 3372119)
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
-- TOC entry 224 (class 1259 OID 3372102)
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
-- TOC entry 217 (class 1259 OID 3372013)
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
-- TOC entry 193 (class 1259 OID 3371795)
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
-- TOC entry 196 (class 1259 OID 3371838)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 3371754)
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
-- TOC entry 212 (class 1259 OID 3371963)
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
-- TOC entry 191 (class 1259 OID 3371779)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 3371832)
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
-- TOC entry 201 (class 1259 OID 3371881)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 3371906)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 3371728)
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
-- TOC entry 180 (class 1259 OID 3371636)
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
-- TOC entry 181 (class 1259 OID 3371647)
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
-- TOC entry 184 (class 1259 OID 3371698)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 3371601)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 3371620)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 3371913)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 3371943)
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
-- TOC entry 221 (class 1259 OID 3372058)
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
-- TOC entry 183 (class 1259 OID 3371678)
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
-- TOC entry 186 (class 1259 OID 3371720)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 3371887)
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
-- TOC entry 185 (class 1259 OID 3371705)
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
-- TOC entry 190 (class 1259 OID 3371771)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 3371899)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 3372004)
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
-- TOC entry 220 (class 1259 OID 3372051)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 3371928)
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
-- TOC entry 200 (class 1259 OID 3371872)
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
-- TOC entry 199 (class 1259 OID 3371862)
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
-- TOC entry 219 (class 1259 OID 3372041)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 3371994)
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
-- TOC entry 173 (class 1259 OID 3371572)
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
-- TOC entry 172 (class 1259 OID 3371570)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2697 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 209 (class 1259 OID 3371937)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 3371610)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 3371594)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 3371951)
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
-- TOC entry 203 (class 1259 OID 3371893)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 3371843)
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
-- TOC entry 182 (class 1259 OID 3371670)
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
-- TOC entry 198 (class 1259 OID 3371849)
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
-- TOC entry 218 (class 1259 OID 3372029)
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
-- TOC entry 188 (class 1259 OID 3371740)
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
-- TOC entry 174 (class 1259 OID 3371581)
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
-- TOC entry 223 (class 1259 OID 3372083)
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
-- TOC entry 192 (class 1259 OID 3371786)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 3371920)
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
-- TOC entry 214 (class 1259 OID 3371986)
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
-- TOC entry 194 (class 1259 OID 3371818)
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
-- TOC entry 222 (class 1259 OID 3372073)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 3371976)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2122 (class 2604 OID 3371575)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2643 (class 0 OID 3371627)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2689 (class 0 OID 3372119)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2688 (class 0 OID 3372102)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 3372013)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 3371795)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 3371838)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 3371754)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5554-6ff4-1a1a-44be02852ba2	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5554-6ff4-a59f-0cfb94fa3a66	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5554-6ff4-15e0-e3b3dd29a525	AL	ALB	008	Albania 	Albanija	\N
00040000-5554-6ff4-2025-f8e4b60b67ed	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5554-6ff4-faee-57c861606050	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5554-6ff4-6fbd-e45b5b0cfc10	AD	AND	020	Andorra 	Andora	\N
00040000-5554-6ff4-6c98-789b6c90bcd7	AO	AGO	024	Angola 	Angola	\N
00040000-5554-6ff4-4bbc-c872c3071f56	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5554-6ff4-996e-a502894df6dc	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5554-6ff4-1e57-b1ba2f867ff7	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5554-6ff4-f627-883c2efc4ba3	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5554-6ff4-a6a5-c0826992650a	AM	ARM	051	Armenia 	Armenija	\N
00040000-5554-6ff4-2257-5b27b30c8407	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5554-6ff4-a5c1-0b1fc9f88fdc	AU	AUS	036	Australia 	Avstralija	\N
00040000-5554-6ff4-b46f-c8b35b2eb146	AT	AUT	040	Austria 	Avstrija	\N
00040000-5554-6ff5-0e01-06beb743b0ef	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5554-6ff5-7406-da0f0a3eb743	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5554-6ff5-0cb7-57241dcce44f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5554-6ff5-1932-0568f7ca71a6	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5554-6ff5-316f-6716c9936d7d	BB	BRB	052	Barbados 	Barbados	\N
00040000-5554-6ff5-20e5-5737e3173276	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5554-6ff5-5fae-7af1a04d2bb0	BE	BEL	056	Belgium 	Belgija	\N
00040000-5554-6ff5-d79e-78d0e0d925c2	BZ	BLZ	084	Belize 	Belize	\N
00040000-5554-6ff5-4b51-e551675a07af	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5554-6ff5-df40-f051824815a2	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5554-6ff5-04ce-880d9d369ccf	BT	BTN	064	Bhutan 	Butan	\N
00040000-5554-6ff5-fe28-a43db4fab48a	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5554-6ff5-7c6f-696e25ebd84b	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5554-6ff5-9009-c2c19698aba7	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5554-6ff5-aa74-f3621aee8808	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5554-6ff5-3f3c-f22474d5398b	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5554-6ff5-61ad-a38f690db73e	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5554-6ff5-455b-fd30b6c17a34	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5554-6ff5-0d51-2813ad9f09a9	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5554-6ff5-3a3e-87018710f423	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5554-6ff5-92a3-c172da9463ae	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5554-6ff5-0f01-1de9cd20b570	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5554-6ff5-c50d-4eb03311d25d	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5554-6ff5-7b44-fbdf29a76092	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5554-6ff5-40ef-287f000f38fe	CA	CAN	124	Canada 	Kanada	\N
00040000-5554-6ff5-e3ed-90841e95e17b	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5554-6ff5-1281-c4cedb55cd94	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5554-6ff5-05ee-f9d97dceff5c	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5554-6ff5-e1c4-ae894d46bf73	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5554-6ff5-ad47-fff7bcf2966b	CL	CHL	152	Chile 	Čile	\N
00040000-5554-6ff5-bc2f-8dc539206fe5	CN	CHN	156	China 	Kitajska	\N
00040000-5554-6ff5-644a-b2489d34bd5b	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5554-6ff5-a967-905b867c9e97	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5554-6ff5-f0c8-b4db4837fe53	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5554-6ff5-6b2c-d4c86489785b	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5554-6ff5-f704-80e43dcec48c	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5554-6ff5-8d2e-ee2562166f99	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5554-6ff5-6b4f-dc47839b139e	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5554-6ff5-da22-15f8c5b2b93f	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5554-6ff5-84a4-9802a887e782	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5554-6ff5-5f5f-f301a0efc852	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5554-6ff5-5146-f75307d60d2c	CU	CUB	192	Cuba 	Kuba	\N
00040000-5554-6ff5-86f6-0d38cd462587	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5554-6ff5-5ffe-5e5caad7d72e	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5554-6ff5-5c69-25fa114648de	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5554-6ff5-64c9-54f43a3af274	DK	DNK	208	Denmark 	Danska	\N
00040000-5554-6ff5-5caa-ef9c28cff3de	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5554-6ff5-f90f-9d6daf8e3431	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5554-6ff5-e011-aebded1aa789	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5554-6ff5-bfff-9960881cf632	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5554-6ff5-3b57-a0c846a523d4	EG	EGY	818	Egypt 	Egipt	\N
00040000-5554-6ff5-511f-5b53399e6b6d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5554-6ff5-5e14-990481b11524	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5554-6ff5-7f49-80c181911fce	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5554-6ff5-f0be-e7c005a650cc	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5554-6ff5-08a9-4d582c3a78e1	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5554-6ff5-ed19-3f33be8d677c	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5554-6ff5-c159-a6c544e64b3b	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5554-6ff5-b303-da11516dcf69	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5554-6ff5-cfd0-3676575447fa	FI	FIN	246	Finland 	Finska	\N
00040000-5554-6ff5-89f9-343489c4c1de	FR	FRA	250	France 	Francija	\N
00040000-5554-6ff5-5455-4e8b4d4cec8c	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5554-6ff5-d90b-2bf13cac07e7	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5554-6ff5-945e-ed7f8ee39b14	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5554-6ff5-e31b-9f23a232a76f	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5554-6ff5-1593-095c47710c9b	GA	GAB	266	Gabon 	Gabon	\N
00040000-5554-6ff5-495f-82b015b7f099	GM	GMB	270	Gambia 	Gambija	\N
00040000-5554-6ff5-e8ec-29e4b629af76	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5554-6ff5-d404-b18cfa774155	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5554-6ff5-b516-26973c48b743	GH	GHA	288	Ghana 	Gana	\N
00040000-5554-6ff5-4a58-d1fcaa7da0ed	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5554-6ff5-998a-4012303e6c88	GR	GRC	300	Greece 	Grčija	\N
00040000-5554-6ff5-e6cd-b4de8cf0c946	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5554-6ff5-857e-2bccab00c866	GD	GRD	308	Grenada 	Grenada	\N
00040000-5554-6ff5-422d-9d417fbd22bd	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5554-6ff5-e844-580112dbdcc1	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5554-6ff5-f409-53fc3fff27d0	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5554-6ff5-fd97-0f1a1304588b	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5554-6ff5-f08d-8741d0c5b878	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5554-6ff5-3fa8-c97e858c4d40	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5554-6ff5-f6a6-3e469ac2f5b5	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5554-6ff5-c25b-746acf20162e	HT	HTI	332	Haiti 	Haiti	\N
00040000-5554-6ff5-a025-5a5c4281595d	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5554-6ff5-813a-5d530d93ec95	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5554-6ff5-3e6e-333f29bb8969	HN	HND	340	Honduras 	Honduras	\N
00040000-5554-6ff5-af27-364cfd349d75	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5554-6ff5-c180-95e35af15a14	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5554-6ff5-7f0b-775cd4de8195	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5554-6ff5-f2d2-cfc404374130	IN	IND	356	India 	Indija	\N
00040000-5554-6ff5-4670-c2303c592852	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5554-6ff5-01db-48178e5a5e81	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5554-6ff5-b254-57e4ce29d4b8	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5554-6ff5-3593-9c4654469f55	IE	IRL	372	Ireland 	Irska	\N
00040000-5554-6ff5-0a2a-4e05158f4d09	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5554-6ff5-05ab-14c10d81fc67	IL	ISR	376	Israel 	Izrael	\N
00040000-5554-6ff5-d4b5-8774c5f95617	IT	ITA	380	Italy 	Italija	\N
00040000-5554-6ff5-603a-4dc3d927d20c	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5554-6ff5-24a2-7c0bbe90b14a	JP	JPN	392	Japan 	Japonska	\N
00040000-5554-6ff5-2472-21b47f02a4ad	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5554-6ff5-a4b9-c22bf7f44c3e	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5554-6ff5-e201-1e24425dc3f9	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5554-6ff5-3a56-81f4758090fd	KE	KEN	404	Kenya 	Kenija	\N
00040000-5554-6ff5-790d-6a69a2055e4c	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5554-6ff5-8b01-242f4a7771f6	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5554-6ff5-db41-0aed3bb53f13	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5554-6ff5-0277-261909587137	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5554-6ff5-9f63-ea3f2739eaaa	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5554-6ff5-4990-c4df731c1c85	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5554-6ff5-8b03-9b226d8c7445	LV	LVA	428	Latvia 	Latvija	\N
00040000-5554-6ff5-a0e1-21cb893cf6ed	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5554-6ff5-819a-084628c02431	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5554-6ff5-2c2e-e665fb7df5bf	LR	LBR	430	Liberia 	Liberija	\N
00040000-5554-6ff5-eca7-87b7c095bbc9	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5554-6ff5-ff38-fe6172c96b9a	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5554-6ff5-498b-0ff4e51eb0d9	LT	LTU	440	Lithuania 	Litva	\N
00040000-5554-6ff5-0630-da08fd6bbd81	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5554-6ff5-0a0f-3fa42113c7ed	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5554-6ff5-fa6f-3935e9f39bbb	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5554-6ff5-1d26-ddb6c60393c4	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5554-6ff5-5284-ffb446f6b12a	MW	MWI	454	Malawi 	Malavi	\N
00040000-5554-6ff5-be3d-8f6c0db59284	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5554-6ff5-d35f-993a4e9eaf56	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5554-6ff5-4110-a7bc1eb7365e	ML	MLI	466	Mali 	Mali	\N
00040000-5554-6ff5-31ce-570107e697b8	MT	MLT	470	Malta 	Malta	\N
00040000-5554-6ff5-ca32-aedf65d869bb	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5554-6ff5-f3ec-7f3a987d2b72	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5554-6ff5-2feb-760cfaeca534	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5554-6ff5-5943-fe6dc5872ae0	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5554-6ff5-3d61-5f8b2b71c7cd	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5554-6ff5-19ea-d138a45c2b3f	MX	MEX	484	Mexico 	Mehika	\N
00040000-5554-6ff5-0522-42ab1caf5bf7	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5554-6ff5-e20c-7ef514ed40f7	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5554-6ff5-0ce4-f6cfd579abec	MC	MCO	492	Monaco 	Monako	\N
00040000-5554-6ff5-c7a7-5809891d793b	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5554-6ff5-1c95-e70f505d1c54	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5554-6ff5-303f-1c0cdeb07467	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5554-6ff5-00ab-421871656009	MA	MAR	504	Morocco 	Maroko	\N
00040000-5554-6ff5-fcab-857143a83091	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5554-6ff5-bf9b-29c60f7e96cd	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5554-6ff5-4a43-682425590c51	NA	NAM	516	Namibia 	Namibija	\N
00040000-5554-6ff5-eb53-f50276a75d8c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5554-6ff5-0393-91f5b106e6e7	NP	NPL	524	Nepal 	Nepal	\N
00040000-5554-6ff5-4e54-9de8d86b83bd	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5554-6ff5-914d-5deea71c1786	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5554-6ff5-eda8-bdb5dc3c3ba5	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5554-6ff5-b3b4-9110a19a4ba2	NE	NER	562	Niger 	Niger 	\N
00040000-5554-6ff5-93c6-e3ef7c4bde37	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5554-6ff5-e2b7-3e85a1393a1f	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5554-6ff5-7ac1-9e71a16c68bd	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5554-6ff5-be76-174336eb2983	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5554-6ff5-b079-a75d7682b040	NO	NOR	578	Norway 	Norveška	\N
00040000-5554-6ff5-76a5-c1a5d7f5dae3	OM	OMN	512	Oman 	Oman	\N
00040000-5554-6ff5-b533-531bad13b58a	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5554-6ff5-e86e-dd726254e5df	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5554-6ff5-2f87-c5a8f58ec025	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5554-6ff5-c344-d55d27ce2e0d	PA	PAN	591	Panama 	Panama	\N
00040000-5554-6ff5-a347-9591636ed071	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5554-6ff5-9121-3288056326ba	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5554-6ff5-bd39-30a7a8076076	PE	PER	604	Peru 	Peru	\N
00040000-5554-6ff5-5a3e-945f6ee95b2a	PH	PHL	608	Philippines 	Filipini	\N
00040000-5554-6ff5-5caa-4f2bff006eb9	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5554-6ff5-155d-b6bbc647e139	PL	POL	616	Poland 	Poljska	\N
00040000-5554-6ff5-61ce-4bf6ce5977d3	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5554-6ff5-4e05-428b87cfe710	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5554-6ff5-7188-d5553aab2881	QA	QAT	634	Qatar 	Katar	\N
00040000-5554-6ff5-7ebe-3e4208b9b548	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5554-6ff5-ec35-a73d08a6705b	RO	ROU	642	Romania 	Romunija	\N
00040000-5554-6ff5-b4b4-c8d349ea41e7	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5554-6ff5-1f61-4cfebb2cd30f	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5554-6ff5-99dc-d6ada8a58a29	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5554-6ff5-e3c3-6c4e07899b49	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5554-6ff5-9fe8-717c09cef6eb	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5554-6ff5-231d-261520303d16	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5554-6ff5-11c3-ae2d3f9e17ff	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5554-6ff5-fe5a-ab85cd5a8316	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5554-6ff5-40b0-8f202d876957	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5554-6ff5-ba06-116e7e0cc6ba	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5554-6ff5-cf97-194ad1a21a4d	SM	SMR	674	San Marino 	San Marino	\N
00040000-5554-6ff5-2ab9-1398064aa7d3	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5554-6ff5-f74f-58c31cc8d011	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5554-6ff5-6d51-0f7aae9abb8d	SN	SEN	686	Senegal 	Senegal	\N
00040000-5554-6ff5-7583-a02548d513f6	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5554-6ff5-9ecc-8105ca06fde5	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5554-6ff5-275a-71ef45e56a04	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5554-6ff5-b6c5-6a851d328d11	SG	SGP	702	Singapore 	Singapur	\N
00040000-5554-6ff5-63a4-eef2cf5b7799	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5554-6ff5-6810-e09a88afc206	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5554-6ff5-6b7c-67df841dc22e	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5554-6ff5-b384-33a37db109a9	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5554-6ff5-a328-cb924d3988bf	SO	SOM	706	Somalia 	Somalija	\N
00040000-5554-6ff5-fa3b-a3af9399bd30	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5554-6ff5-c11d-90e62cc4d2bb	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5554-6ff5-2b67-ae5c42c3d4f0	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5554-6ff5-79f7-cfe52072d6e7	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5554-6ff5-29da-749889b5f83d	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5554-6ff5-68f9-5914409f827f	SD	SDN	729	Sudan 	Sudan	\N
00040000-5554-6ff5-5f64-a6452840c19e	SR	SUR	740	Suriname 	Surinam	\N
00040000-5554-6ff5-0c6a-6da93382e304	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5554-6ff5-a3c1-54bfc6494a29	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5554-6ff5-f1e9-081e07f2807f	SE	SWE	752	Sweden 	Švedska	\N
00040000-5554-6ff5-636c-939aa7fdaab8	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5554-6ff5-961c-61a11eaad0e6	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5554-6ff5-aeb3-f15b51a4b6d8	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5554-6ff5-4da1-2b14e6a6ad00	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5554-6ff5-38a2-39310a4e9ac4	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5554-6ff5-2ccd-311da8de32ca	TH	THA	764	Thailand 	Tajska	\N
00040000-5554-6ff5-e12f-b85ef6b43258	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5554-6ff5-8315-14131121e372	TG	TGO	768	Togo 	Togo	\N
00040000-5554-6ff5-ab8f-836c855c7291	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5554-6ff5-41b6-b02e39f47011	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5554-6ff5-5d4a-06cc89d79aa4	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5554-6ff5-988f-ffbbe003d189	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5554-6ff5-fd35-d01e65e03c32	TR	TUR	792	Turkey 	Turčija	\N
00040000-5554-6ff5-6ad0-f6c66126ace7	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5554-6ff5-2784-67e3b8cd8f10	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5554-6ff5-bd33-4d62917bd43a	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5554-6ff5-3dce-4f7e2c43d831	UG	UGA	800	Uganda 	Uganda	\N
00040000-5554-6ff5-301e-705a9a4615a4	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5554-6ff5-85d1-9c6e29dbef20	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5554-6ff5-5eb1-d38ee48f236c	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5554-6ff5-ebf4-222026717eed	US	USA	840	United States 	Združene države Amerike	\N
00040000-5554-6ff5-5217-ae8bfbb8e58d	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5554-6ff5-a01f-aee3e63d2aa7	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5554-6ff5-2873-1dd0099c4dcf	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5554-6ff5-1668-a00c36004098	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5554-6ff5-1c8f-3fb86cc5dfdf	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5554-6ff5-e7c2-54f8fb0b26bd	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5554-6ff5-503f-153e01ceb4f8	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5554-6ff5-c661-dbde12d0a1f5	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5554-6ff5-b13a-1a8c440a509f	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5554-6ff5-67b2-025afdde49a3	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5554-6ff5-1f28-a161b7013b30	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5554-6ff5-99be-ec1b62b796f4	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5554-6ff5-44e0-e2d24087e00a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2676 (class 0 OID 3371963)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 3371779)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2659 (class 0 OID 3371832)
-- Dependencies: 195
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 3371881)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2669 (class 0 OID 3371906)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 3371728)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5554-6ff5-b620-55661301842a	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5554-6ff5-72a2-79e8594cf903	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5554-6ff5-2abb-8e4a1ccfa7c2	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5554-6ff5-45fd-2a1d7b94516e	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5554-6ff5-2fe9-e371eca5cefd	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5554-6ff5-d9f9-49eb63a2b116	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5554-6ff5-8c34-58bc9cc730b0	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5554-6ff5-fb63-34c989d61f11	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5554-6ff5-0c99-29963cbe76ed	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5554-6ff5-214d-d75e4b3940f0	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2644 (class 0 OID 3371636)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5554-6ff5-376e-ca10c1a165c2	00000000-5554-6ff5-2fe9-e371eca5cefd	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5554-6ff5-2d7e-def38541b532	00000000-5554-6ff5-2fe9-e371eca5cefd	00010000-5554-6ff5-8c27-ff0f6b6fdad0	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5554-6ff5-6c54-e80528cdd707	00000000-5554-6ff5-d9f9-49eb63a2b116	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2645 (class 0 OID 3371647)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 3371698)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 3371601)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5554-6ff5-4b96-f17ba4fd455f	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5554-6ff5-a19c-3adccb5cb8ee	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5554-6ff5-462f-1f874b8273c2	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5554-6ff5-3b96-ec36a1bf719e	Abonma-read	Abonma - branje	f
00030000-5554-6ff5-c4a9-96aac515f2d3	Abonma-write	Abonma - spreminjanje	f
00030000-5554-6ff5-d247-e35ac0c82db3	Alternacija-read	Alternacija - branje	f
00030000-5554-6ff5-a9cd-95d0adc39303	Alternacija-write	Alternacija - spreminjanje	f
00030000-5554-6ff5-2d24-6463291a9e44	Arhivalija-read	Arhivalija - branje	f
00030000-5554-6ff5-d10c-e564b3262a40	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5554-6ff5-ec62-93c8a5c830bc	Besedilo-read	Besedilo - branje	f
00030000-5554-6ff5-00ef-e5df56b7b212	Besedilo-write	Besedilo - spreminjanje	f
00030000-5554-6ff5-2b9b-ab6736dee630	DogodekIzven-read	DogodekIzven - branje	f
00030000-5554-6ff5-c944-a6dd01c5610c	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5554-6ff5-99a7-83d2649daf3a	Dogodek-read	Dogodek - branje	f
00030000-5554-6ff5-5772-f7fd5c8a086d	Dogodek-write	Dogodek - spreminjanje	f
00030000-5554-6ff5-4c90-d3c143f92076	Drzava-read	Drzava - branje	f
00030000-5554-6ff5-2bd1-a55a74b53d1b	Drzava-write	Drzava - spreminjanje	f
00030000-5554-6ff5-a19a-60a15acfbe08	Funkcija-read	Funkcija - branje	f
00030000-5554-6ff5-bd12-b8fd4af0f927	Funkcija-write	Funkcija - spreminjanje	f
00030000-5554-6ff5-f66d-7ab24bb68c8f	Gostovanje-read	Gostovanje - branje	f
00030000-5554-6ff5-b968-5488bfa3f99d	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5554-6ff5-fc53-2ee818b13352	Gostujoca-read	Gostujoca - branje	f
00030000-5554-6ff5-1e01-34099acfc80d	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5554-6ff5-74f7-2df56e74c9fc	Kupec-read	Kupec - branje	f
00030000-5554-6ff5-65aa-2906f3622790	Kupec-write	Kupec - spreminjanje	f
00030000-5554-6ff5-a619-bd1a78b81fff	NacinPlacina-read	NacinPlacina - branje	f
00030000-5554-6ff5-3a47-c24ec96cc26b	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5554-6ff5-5013-9d7aabe0728b	Option-read	Option - branje	f
00030000-5554-6ff5-6141-a7163301278a	Option-write	Option - spreminjanje	f
00030000-5554-6ff5-9bd5-24f6e0de906a	OptionValue-read	OptionValue - branje	f
00030000-5554-6ff5-3e3c-1ec21bf62d83	OptionValue-write	OptionValue - spreminjanje	f
00030000-5554-6ff5-b14c-9e61179396ac	Oseba-read	Oseba - branje	f
00030000-5554-6ff5-88d6-25659de7dc88	Oseba-write	Oseba - spreminjanje	f
00030000-5554-6ff5-52d6-cda8070bbc7d	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5554-6ff5-beb1-64aefb6645a0	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5554-6ff5-9af6-3bf98563efa2	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5554-6ff5-e78b-6160a68254cb	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5554-6ff5-5de9-eab9a1e68caf	Pogodba-read	Pogodba - branje	f
00030000-5554-6ff5-ad2e-c34f602c1a1d	Pogodba-write	Pogodba - spreminjanje	f
00030000-5554-6ff5-c2d9-42e7b133074c	Popa-read	Popa - branje	f
00030000-5554-6ff5-e0fc-2f607d1f9598	Popa-write	Popa - spreminjanje	f
00030000-5554-6ff5-d21a-dc1572fc5d0e	Posta-read	Posta - branje	f
00030000-5554-6ff5-278d-a350632b1cf2	Posta-write	Posta - spreminjanje	f
00030000-5554-6ff5-c360-5babd1363a05	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5554-6ff5-d356-40bd2a19912f	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5554-6ff5-b4c1-c0448e96617a	PostniNaslov-read	PostniNaslov - branje	f
00030000-5554-6ff5-8310-866cd9889067	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5554-6ff5-bd38-fb00f215c922	Predstava-read	Predstava - branje	f
00030000-5554-6ff5-fffe-2293a7f9ba21	Predstava-write	Predstava - spreminjanje	f
00030000-5554-6ff5-1874-6fcdbfbd8fcb	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5554-6ff5-d605-2c848a883e85	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5554-6ff5-5383-527dfd0cb163	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5554-6ff5-6b02-8005ede16e36	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5554-6ff5-b138-515b3af0bf71	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5554-6ff5-111b-1fb04951e8fa	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5554-6ff5-0f5a-329651bc767b	Prostor-read	Prostor - branje	f
00030000-5554-6ff5-7d97-108fec041a60	Prostor-write	Prostor - spreminjanje	f
00030000-5554-6ff5-5adf-8ee71d9cba88	Racun-read	Racun - branje	f
00030000-5554-6ff5-0a97-5434eab41d07	Racun-write	Racun - spreminjanje	f
00030000-5554-6ff5-0cd9-41eea2757ded	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5554-6ff5-0177-9d52214ee741	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5554-6ff5-4b4d-487a4c43f689	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5554-6ff5-e7a9-8129445dc404	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5554-6ff5-40af-aa1205598fc8	Rekvizit-read	Rekvizit - branje	f
00030000-5554-6ff5-195d-3ac7d1e17e6a	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5554-6ff5-0b12-528d0f0a8123	Rezervacija-read	Rezervacija - branje	f
00030000-5554-6ff5-4e3e-4bed1f0b5a2d	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5554-6ff5-7081-e211b3b49d6e	SedezniRed-read	SedezniRed - branje	f
00030000-5554-6ff5-8321-c2ab794132d6	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5554-6ff5-6791-8554eef1b4e6	Sedez-read	Sedez - branje	f
00030000-5554-6ff5-7a0a-9e92fd25c3db	Sedez-write	Sedez - spreminjanje	f
00030000-5554-6ff5-e825-1e1980fe5d09	Sezona-read	Sezona - branje	f
00030000-5554-6ff5-da0c-2e571717cc8a	Sezona-write	Sezona - spreminjanje	f
00030000-5554-6ff5-7d55-ba19b4be04b4	Telefonska-read	Telefonska - branje	f
00030000-5554-6ff5-5a64-e7bf00dbd205	Telefonska-write	Telefonska - spreminjanje	f
00030000-5554-6ff5-b36a-d4dc8d784ff2	TerminStoritve-read	TerminStoritve - branje	f
00030000-5554-6ff5-5f2d-f33a2fff6656	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5554-6ff5-fe17-fd6d236db2f4	TipFunkcije-read	TipFunkcije - branje	f
00030000-5554-6ff5-4433-7edda928d0c0	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5554-6ff5-48ee-0287c32d40f4	Trr-read	Trr - branje	f
00030000-5554-6ff5-f905-e65d49a83d9c	Trr-write	Trr - spreminjanje	f
00030000-5554-6ff5-3060-d37e9198d979	Uprizoritev-read	Uprizoritev - branje	f
00030000-5554-6ff5-86e2-f0cc94042767	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5554-6ff5-3c81-cbb324d43b49	Vaja-read	Vaja - branje	f
00030000-5554-6ff5-e000-5cd2ea6ce709	Vaja-write	Vaja - spreminjanje	f
00030000-5554-6ff5-6c05-29245f18d3b6	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5554-6ff5-bcb6-7b8c647b554b	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5554-6ff5-1107-db2aed8eba3f	Zaposlitev-read	Zaposlitev - branje	f
00030000-5554-6ff5-e1d4-717b585a6a47	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5554-6ff5-3862-114693e8582d	Zasedenost-read	Zasedenost - branje	f
00030000-5554-6ff5-7fc2-d4f09acca668	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5554-6ff5-170c-be83753a870c	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5554-6ff5-80ca-091ac4d83a63	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5554-6ff5-e7d8-a4c0794f9ae7	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5554-6ff5-de93-4232d52d79b8	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2642 (class 0 OID 3371620)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5554-6ff5-d80c-33794f4dc63b	00030000-5554-6ff5-4c90-d3c143f92076
00020000-5554-6ff5-8bd7-ee43d7a29cd1	00030000-5554-6ff5-2bd1-a55a74b53d1b
00020000-5554-6ff5-8bd7-ee43d7a29cd1	00030000-5554-6ff5-4c90-d3c143f92076
\.


--
-- TOC entry 2670 (class 0 OID 3371913)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 3371943)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2685 (class 0 OID 3372058)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 3371678)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 3371720)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5554-6ff4-8bcf-dc005c6251cb	8341	Adlešiči
00050000-5554-6ff4-efc2-6beb5bbe49dc	5270	Ajdovščina
00050000-5554-6ff4-5ad3-3016852d1757	6280	Ankaran/Ancarano
00050000-5554-6ff4-6267-31ba9833ba66	9253	Apače
00050000-5554-6ff4-75b8-e35a222577a4	8253	Artiče
00050000-5554-6ff4-9cf3-17199b21d580	4275	Begunje na Gorenjskem
00050000-5554-6ff4-05cd-da854f3ab236	1382	Begunje pri Cerknici
00050000-5554-6ff4-ca57-2b0e82922250	9231	Beltinci
00050000-5554-6ff4-250c-26733dfc7197	2234	Benedikt
00050000-5554-6ff4-90c1-c6b3454294ac	2345	Bistrica ob Dravi
00050000-5554-6ff4-efad-2c9f86cb8a7e	3256	Bistrica ob Sotli
00050000-5554-6ff4-d6b8-01728886ea71	8259	Bizeljsko
00050000-5554-6ff4-2704-d7afb7bf673b	1223	Blagovica
00050000-5554-6ff4-55da-102a1b5527dd	8283	Blanca
00050000-5554-6ff4-40b8-cf4b789cbbb8	4260	Bled
00050000-5554-6ff4-df48-65879ce68c7c	4273	Blejska Dobrava
00050000-5554-6ff4-2143-f32d5ae1dd9c	9265	Bodonci
00050000-5554-6ff4-a411-5119566708e8	9222	Bogojina
00050000-5554-6ff4-b025-b5b265756245	4263	Bohinjska Bela
00050000-5554-6ff4-c513-3fcd962a0f29	4264	Bohinjska Bistrica
00050000-5554-6ff4-163c-2d0603de7dcf	4265	Bohinjsko jezero
00050000-5554-6ff4-41e7-ffd5960ad93f	1353	Borovnica
00050000-5554-6ff4-9716-d6d6120e4084	8294	Boštanj
00050000-5554-6ff4-1e09-65f346033d66	5230	Bovec
00050000-5554-6ff4-aa7e-c7904577be63	5295	Branik
00050000-5554-6ff4-31fd-2c4968d7eb6c	3314	Braslovče
00050000-5554-6ff4-dc7c-944b1b6a32d7	5223	Breginj
00050000-5554-6ff4-0b14-49aaf340153a	8280	Brestanica
00050000-5554-6ff4-bc41-067e2a0742d5	2354	Bresternica
00050000-5554-6ff4-c09d-04cbf9952190	4243	Brezje
00050000-5554-6ff4-72f5-eb1efebeeed5	1351	Brezovica pri Ljubljani
00050000-5554-6ff4-dce2-528c238e3c20	8250	Brežice
00050000-5554-6ff4-5a91-ebc4665d955b	4210	Brnik - Aerodrom
00050000-5554-6ff4-c524-f8b22ab41f21	8321	Brusnice
00050000-5554-6ff4-c200-70358088df06	3255	Buče
00050000-5554-6ff4-e6cd-e011adb6b20e	8276	Bučka 
00050000-5554-6ff4-1e0e-203db2046d75	9261	Cankova
00050000-5554-6ff4-8003-5062708df8d4	3000	Celje 
00050000-5554-6ff4-596e-3ab75f94131d	3001	Celje - poštni predali
00050000-5554-6ff4-e064-cd313cd162ef	4207	Cerklje na Gorenjskem
00050000-5554-6ff4-244a-b4ec0e87ed1c	8263	Cerklje ob Krki
00050000-5554-6ff4-7768-8ea4f7bd34e7	1380	Cerknica
00050000-5554-6ff4-958b-03ccde231e2e	5282	Cerkno
00050000-5554-6ff4-a582-71de593d85a5	2236	Cerkvenjak
00050000-5554-6ff4-b7e4-8789a46aa059	2215	Ceršak
00050000-5554-6ff4-fc8f-1bd248df6fb9	2326	Cirkovce
00050000-5554-6ff4-dacc-a7afb33ea9d7	2282	Cirkulane
00050000-5554-6ff4-ad85-d1033c6cbb46	5273	Col
00050000-5554-6ff4-efbb-a6a4001f7c99	8251	Čatež ob Savi
00050000-5554-6ff4-5a55-be6492ea0bfc	1413	Čemšenik
00050000-5554-6ff4-f835-130eb808d460	5253	Čepovan
00050000-5554-6ff4-2098-d73ba58fd29e	9232	Črenšovci
00050000-5554-6ff4-9832-2353bf50195f	2393	Črna na Koroškem
00050000-5554-6ff4-cda2-f65a0f89d71f	6275	Črni Kal
00050000-5554-6ff4-c500-678276e85096	5274	Črni Vrh nad Idrijo
00050000-5554-6ff4-595d-7c303b97424d	5262	Črniče
00050000-5554-6ff4-96cc-d999a840f0eb	8340	Črnomelj
00050000-5554-6ff4-a7dc-9367919bfcf6	6271	Dekani
00050000-5554-6ff4-71eb-d965b2f3cac4	5210	Deskle
00050000-5554-6ff4-74ba-e6ae1428959a	2253	Destrnik
00050000-5554-6ff4-698f-2254550c9649	6215	Divača
00050000-5554-6ff4-6d0d-0cba50e95e32	1233	Dob
00050000-5554-6ff4-7974-f1043ab417e0	3224	Dobje pri Planini
00050000-5554-6ff4-1be0-ce087c4ff298	8257	Dobova
00050000-5554-6ff4-f7c4-7199c37c6811	1423	Dobovec
00050000-5554-6ff4-b012-9ea3a3ea4393	5263	Dobravlje
00050000-5554-6ff4-c33c-909dafbc5f8c	3204	Dobrna
00050000-5554-6ff4-d61d-5aafab54eb29	8211	Dobrnič
00050000-5554-6ff4-ab95-deaf1ec0c0e5	1356	Dobrova
00050000-5554-6ff4-edc8-0afd79ef23b7	9223	Dobrovnik/Dobronak 
00050000-5554-6ff4-5a2c-d7a1be7c2c1e	5212	Dobrovo v Brdih
00050000-5554-6ff4-68bb-08611e2b94a5	1431	Dol pri Hrastniku
00050000-5554-6ff4-4436-aec5a51b63d0	1262	Dol pri Ljubljani
00050000-5554-6ff4-c964-e188cb9ed4b3	1273	Dole pri Litiji
00050000-5554-6ff4-4686-6254ac19bf97	1331	Dolenja vas
00050000-5554-6ff4-c3cb-38162a6751d2	8350	Dolenjske Toplice
00050000-5554-6ff4-5ab3-4a6efe975da8	1230	Domžale
00050000-5554-6ff4-60ec-213d6f99dc7b	2252	Dornava
00050000-5554-6ff4-693e-9c73df74064e	5294	Dornberk
00050000-5554-6ff4-ac53-2b45db6ab2fd	1319	Draga
00050000-5554-6ff4-d221-c1c56faaa650	8343	Dragatuš
00050000-5554-6ff4-57c1-69b8f38ad825	3222	Dramlje
00050000-5554-6ff4-f0d2-6eb2ee2c14d5	2370	Dravograd
00050000-5554-6ff4-9125-817cff99a4f8	4203	Duplje
00050000-5554-6ff4-0571-f21942aa884d	6221	Dutovlje
00050000-5554-6ff4-c2b6-bf20648d60a6	8361	Dvor
00050000-5554-6ff4-dd86-728c65dacf8b	2343	Fala
00050000-5554-6ff4-f817-19920a2ff181	9208	Fokovci
00050000-5554-6ff4-3dbb-f290fa6a3000	2313	Fram
00050000-5554-6ff4-fae7-7abb10a9b879	3213	Frankolovo
00050000-5554-6ff4-0064-21cb5cc61439	1274	Gabrovka
00050000-5554-6ff4-f19a-0f75020b6610	8254	Globoko
00050000-5554-6ff4-6b3b-36e4b7336656	5275	Godovič
00050000-5554-6ff4-0c28-b9f1aa5f5cc9	4204	Golnik
00050000-5554-6ff4-5aca-bcbcfb03cf56	3303	Gomilsko
00050000-5554-6ff4-e34e-288725466f4b	4224	Gorenja vas
00050000-5554-6ff4-3a7d-816ed1660dd8	3263	Gorica pri Slivnici
00050000-5554-6ff4-20f5-76ca0af5090c	2272	Gorišnica
00050000-5554-6ff4-a8cf-dcd8c4e7f5dd	9250	Gornja Radgona
00050000-5554-6ff4-6f6b-09b206c2b3b9	3342	Gornji Grad
00050000-5554-6ff4-90a0-72c24fbe8a0e	4282	Gozd Martuljek
00050000-5554-6ff4-3faf-5cb779aa7b80	6272	Gračišče
00050000-5554-6ff4-4bcd-88045fec595e	9264	Grad
00050000-5554-6ff4-a015-30ade9a84330	8332	Gradac
00050000-5554-6ff4-7f47-96cafdebfe2c	1384	Grahovo
00050000-5554-6ff4-693c-acc840a259bf	5242	Grahovo ob Bači
00050000-5554-6ff4-3c24-9a1599f4abd3	5251	Grgar
00050000-5554-6ff4-66bb-344188ac4875	3302	Griže
00050000-5554-6ff4-7f8f-66afd2c0ec52	3231	Grobelno
00050000-5554-6ff4-12fe-85d0716c7ab4	1290	Grosuplje
00050000-5554-6ff4-03d4-b20725d66a0b	2288	Hajdina
00050000-5554-6ff4-12b4-fef250678de6	8362	Hinje
00050000-5554-6ff4-422a-d02b066a4f17	2311	Hoče
00050000-5554-6ff4-47fe-4e57d821a18d	9205	Hodoš/Hodos
00050000-5554-6ff4-3010-854b781e41d0	1354	Horjul
00050000-5554-6ff4-82f6-d167966816f8	1372	Hotedršica
00050000-5554-6ff4-f4d9-21ba346d2249	1430	Hrastnik
00050000-5554-6ff4-93f2-04a75ff5b06f	6225	Hruševje
00050000-5554-6ff4-2008-268efaa52443	4276	Hrušica
00050000-5554-6ff4-2679-293c4dc002f8	5280	Idrija
00050000-5554-6ff4-0eac-e408fc8bb403	1292	Ig
00050000-5554-6ff4-03ad-7d71247876d5	6250	Ilirska Bistrica
00050000-5554-6ff4-b419-5b3d944025c5	6251	Ilirska Bistrica-Trnovo
00050000-5554-6ff4-858d-820ebbe5aefc	1295	Ivančna Gorica
00050000-5554-6ff4-4e2d-21d834f2e0a7	2259	Ivanjkovci
00050000-5554-6ff4-80f7-bd56e63caf8e	1411	Izlake
00050000-5554-6ff4-e8d1-4fee92300fad	6310	Izola/Isola
00050000-5554-6ff4-064b-a2bb2adf4fd2	2222	Jakobski Dol
00050000-5554-6ff4-e717-ce09b0b75262	2221	Jarenina
00050000-5554-6ff4-264b-2fde6c385bbd	6254	Jelšane
00050000-5554-6ff4-1fdd-c76ee64fa148	4270	Jesenice
00050000-5554-6ff4-7763-d98e0832a937	8261	Jesenice na Dolenjskem
00050000-5554-6ff4-3671-39de74f83956	3273	Jurklošter
00050000-5554-6ff4-6138-a68dd461f297	2223	Jurovski Dol
00050000-5554-6ff4-fbe9-aa3d081c1e53	2256	Juršinci
00050000-5554-6ff4-4112-4330ca489e07	5214	Kal nad Kanalom
00050000-5554-6ff4-7a74-ebf6f5ebc010	3233	Kalobje
00050000-5554-6ff4-eaa4-f05b865e6554	4246	Kamna Gorica
00050000-5554-6ff4-7374-163144b8c4a5	2351	Kamnica
00050000-5554-6ff4-a64c-2842884b4673	1241	Kamnik
00050000-5554-6ff4-557d-40075186cdd3	5213	Kanal
00050000-5554-6ff4-231c-acc9d93cd6b1	8258	Kapele
00050000-5554-6ff4-1c22-f7f00dda6ee5	2362	Kapla
00050000-5554-6ff4-5ec4-02ee94efef2b	2325	Kidričevo
00050000-5554-6ff4-3e77-10455f151675	1412	Kisovec
00050000-5554-6ff4-9b20-0ce4c3919da3	6253	Knežak
00050000-5554-6ff4-50d0-83978d3f599e	5222	Kobarid
00050000-5554-6ff4-34ca-dce7be383417	9227	Kobilje
00050000-5554-6ff4-0f15-b20dad3a7296	1330	Kočevje
00050000-5554-6ff4-d688-46ede62b35e7	1338	Kočevska Reka
00050000-5554-6ff4-1f92-530417086cef	2276	Kog
00050000-5554-6ff4-80c1-05fc91d885ca	5211	Kojsko
00050000-5554-6ff4-8423-32c376fe54db	6223	Komen
00050000-5554-6ff4-a29a-7ce5ffdd18fe	1218	Komenda
00050000-5554-6ff4-a495-e20e5aeb8037	6000	Koper/Capodistria 
00050000-5554-6ff4-0f91-d17f6ecd6bd7	6001	Koper/Capodistria - poštni predali
00050000-5554-6ff4-b73e-1f95e1d011bc	8282	Koprivnica
00050000-5554-6ff4-34a2-6878439d5ed3	5296	Kostanjevica na Krasu
00050000-5554-6ff4-7140-960326ea3b3c	8311	Kostanjevica na Krki
00050000-5554-6ff4-a0ec-e84fe513cabd	1336	Kostel
00050000-5554-6ff4-9f13-d9ba9148c222	6256	Košana
00050000-5554-6ff4-7d73-d0d5f441fd2f	2394	Kotlje
00050000-5554-6ff4-36b5-1622e77f6dad	6240	Kozina
00050000-5554-6ff4-502b-425d443a853b	3260	Kozje
00050000-5554-6ff4-743e-2a592cf846c1	4000	Kranj 
00050000-5554-6ff4-08dd-f8f8e5fb64fd	4001	Kranj - poštni predali
00050000-5554-6ff4-15fd-e2f6f8297a9f	4280	Kranjska Gora
00050000-5554-6ff4-97b5-1c56d12b9efd	1281	Kresnice
00050000-5554-6ff4-5e83-fc71f434bddc	4294	Križe
00050000-5554-6ff4-9ff9-1296e4e66e99	9206	Križevci
00050000-5554-6ff4-c682-0894d8c510f3	9242	Križevci pri Ljutomeru
00050000-5554-6ff4-ec74-d142587dee05	1301	Krka
00050000-5554-6ff4-60de-0ba063f079e6	8296	Krmelj
00050000-5554-6ff4-d3d1-6e2f6a0ca6b8	4245	Kropa
00050000-5554-6ff4-0889-4ab691b08c72	8262	Krška vas
00050000-5554-6ff4-a66c-b6e7a7ee6385	8270	Krško
00050000-5554-6ff4-d057-62d65ff82ae1	9263	Kuzma
00050000-5554-6ff4-8306-96b8d062ec90	2318	Laporje
00050000-5554-6ff4-5431-3f1a23727e1a	3270	Laško
00050000-5554-6ff4-4bd9-a678a85630c3	1219	Laze v Tuhinju
00050000-5554-6ff4-76ba-a483b1387f61	2230	Lenart v Slovenskih goricah
00050000-5554-6ff4-98de-5721483a00b4	9220	Lendava/Lendva
00050000-5554-6ff4-4e4e-bd23daa058b9	4248	Lesce
00050000-5554-6ff4-97c0-2a9532df55a5	3261	Lesično
00050000-5554-6ff4-054c-8b8146366dad	8273	Leskovec pri Krškem
00050000-5554-6ff4-4f0a-1f3f991dceb0	2372	Libeliče
00050000-5554-6ff4-688e-be54daa81e52	2341	Limbuš
00050000-5554-6ff4-d828-5c697da703f9	1270	Litija
00050000-5554-6ff4-46b2-38b4e0a1b763	3202	Ljubečna
00050000-5554-6ff4-99e6-e518ded5f8aa	1000	Ljubljana 
00050000-5554-6ff4-905a-5c99300c2032	1001	Ljubljana - poštni predali
00050000-5554-6ff4-fa8e-59d643b0cf3b	1231	Ljubljana - Črnuče
00050000-5554-6ff4-b22c-98a18931f0d2	1261	Ljubljana - Dobrunje
00050000-5554-6ff4-57af-f4ad77c78f0c	1260	Ljubljana - Polje
00050000-5554-6ff4-d8d1-c72c4354bce3	1210	Ljubljana - Šentvid
00050000-5554-6ff4-2ec6-3b8883a90f59	1211	Ljubljana - Šmartno
00050000-5554-6ff4-4c45-41b628da424c	3333	Ljubno ob Savinji
00050000-5554-6ff4-6968-d6ead3e1c1e5	9240	Ljutomer
00050000-5554-6ff4-4660-3d5e8896610f	3215	Loče
00050000-5554-6ff4-2898-5f2804dd37d1	5231	Log pod Mangartom
00050000-5554-6ff4-65a4-31d27ccea469	1358	Log pri Brezovici
00050000-5554-6ff4-b1f7-b5ddbb36f98a	1370	Logatec
00050000-5554-6ff4-6cb4-583d19cb2c1a	1371	Logatec
00050000-5554-6ff4-ffdb-6ad35f646d82	1434	Loka pri Zidanem Mostu
00050000-5554-6ff4-b1ca-32d3321b9b38	3223	Loka pri Žusmu
00050000-5554-6ff4-648e-eac4a10296db	6219	Lokev
00050000-5554-6ff4-b9c7-89a99120fcfc	1318	Loški Potok
00050000-5554-6ff4-94b8-afabc2be1b79	2324	Lovrenc na Dravskem polju
00050000-5554-6ff4-fb18-7a1af94de5e8	2344	Lovrenc na Pohorju
00050000-5554-6ff4-f6b2-3ba273f47248	3334	Luče
00050000-5554-6ff4-b1f8-112dea816145	1225	Lukovica
00050000-5554-6ff4-6629-d0e6ad9aba5c	9202	Mačkovci
00050000-5554-6ff4-d734-1fcf93dc2242	2322	Majšperk
00050000-5554-6ff4-7ec0-961b185feeba	2321	Makole
00050000-5554-6ff4-a351-76f0ee4bdecc	9243	Mala Nedelja
00050000-5554-6ff4-7ef8-0e5de2604e6b	2229	Malečnik
00050000-5554-6ff4-6cdd-3841747b8a5b	6273	Marezige
00050000-5554-6ff4-cc2a-4f6c1b4f0bc5	2000	Maribor 
00050000-5554-6ff4-9805-7d68493b7582	2001	Maribor - poštni predali
00050000-5554-6ff4-f4ec-45afa2cee62a	2206	Marjeta na Dravskem polju
00050000-5554-6ff4-0791-a2871734fea1	2281	Markovci
00050000-5554-6ff4-c317-4b302669ed19	9221	Martjanci
00050000-5554-6ff4-cf63-f1874594bd30	6242	Materija
00050000-5554-6ff4-a99b-8a1023d2a9f8	4211	Mavčiče
00050000-5554-6ff4-0620-12f97e1719aa	1215	Medvode
00050000-5554-6ff4-aa0e-72eeae2cd467	1234	Mengeš
00050000-5554-6ff4-f939-722ead2465e8	8330	Metlika
00050000-5554-6ff4-8b50-954001cd41fc	2392	Mežica
00050000-5554-6ff4-6ec8-e51e47218a4d	2204	Miklavž na Dravskem polju
00050000-5554-6ff4-a2b4-2a2463f7f7bb	2275	Miklavž pri Ormožu
00050000-5554-6ff4-f698-79689559eb7f	5291	Miren
00050000-5554-6ff4-e99e-60a1f6d89c41	8233	Mirna
00050000-5554-6ff4-fda6-53b83c101841	8216	Mirna Peč
00050000-5554-6ff4-5a9a-180429373686	2382	Mislinja
00050000-5554-6ff4-941d-ef24b3c923f0	4281	Mojstrana
00050000-5554-6ff4-d93d-9daca389aaaa	8230	Mokronog
00050000-5554-6ff4-e05b-85d01077c7c6	1251	Moravče
00050000-5554-6ff4-1ee2-359da872378a	9226	Moravske Toplice
00050000-5554-6ff4-319e-f4a09ecc885b	5216	Most na Soči
00050000-5554-6ff4-fac0-2ca2a933360e	1221	Motnik
00050000-5554-6ff4-589c-65da417a3fda	3330	Mozirje
00050000-5554-6ff4-2d66-867dfd21d585	9000	Murska Sobota 
00050000-5554-6ff4-3908-e7839931024c	9001	Murska Sobota - poštni predali
00050000-5554-6ff4-49e5-333a19d7b757	2366	Muta
00050000-5554-6ff4-e413-61c7809819d7	4202	Naklo
00050000-5554-6ff4-4ce3-bfd70fb5d60a	3331	Nazarje
00050000-5554-6ff4-e784-3f36cf79f8a5	1357	Notranje Gorice
00050000-5554-6ff4-cbac-18d0daedf2aa	3203	Nova Cerkev
00050000-5554-6ff4-5afe-eac25e5a15b0	5000	Nova Gorica 
00050000-5554-6ff4-b9a3-6090a071e2e3	5001	Nova Gorica - poštni predali
00050000-5554-6ff4-633b-f6ceee02aa4a	1385	Nova vas
00050000-5554-6ff4-14f2-64152b731c09	8000	Novo mesto
00050000-5554-6ff4-de83-d6dd6fb7f5aa	8001	Novo mesto - poštni predali
00050000-5554-6ff4-5f4e-42dc6db6f4ea	6243	Obrov
00050000-5554-6ff4-0e4c-b76d67d48fa1	9233	Odranci
00050000-5554-6ff4-7bf0-2f513de307e0	2317	Oplotnica
00050000-5554-6ff4-a57c-8f593a67b00a	2312	Orehova vas
00050000-5554-6ff4-9529-89b200225650	2270	Ormož
00050000-5554-6ff4-a7c5-8cf2d6a61cbf	1316	Ortnek
00050000-5554-6ff4-74a2-5ede33e28ebb	1337	Osilnica
00050000-5554-6ff4-80a7-84d2762b18a3	8222	Otočec
00050000-5554-6ff4-7b3c-996e3ecdc9fa	2361	Ožbalt
00050000-5554-6ff4-bd2e-e402adfcb1a9	2231	Pernica
00050000-5554-6ff4-dfef-7b5842d3c49d	2211	Pesnica pri Mariboru
00050000-5554-6ff4-c6d9-50d9142ef3ba	9203	Petrovci
00050000-5554-6ff4-e80f-a7f58084e313	3301	Petrovče
00050000-5554-6ff4-772b-7e4e44ad4231	6330	Piran/Pirano
00050000-5554-6ff4-e61d-25baf8aaeeb8	8255	Pišece
00050000-5554-6ff4-73d6-8db34302573f	6257	Pivka
00050000-5554-6ff4-423c-3aa16efeab73	6232	Planina
00050000-5554-6ff4-7608-9ab9268eee72	3225	Planina pri Sevnici
00050000-5554-6ff4-cc54-aab3b67b26d0	6276	Pobegi
00050000-5554-6ff4-5a7a-e2990b429648	8312	Podbočje
00050000-5554-6ff4-1720-f142af5410b9	5243	Podbrdo
00050000-5554-6ff4-4c9d-e5e7d7ace0a6	3254	Podčetrtek
00050000-5554-6ff4-3b8d-b6148129ef7f	2273	Podgorci
00050000-5554-6ff4-3693-f3919cab2273	6216	Podgorje
00050000-5554-6ff4-4e57-7073888bf8bb	2381	Podgorje pri Slovenj Gradcu
00050000-5554-6ff4-2d52-6b86e6d0d8f5	6244	Podgrad
00050000-5554-6ff4-e83d-47447a4886ec	1414	Podkum
00050000-5554-6ff4-75b4-3f4c82af9470	2286	Podlehnik
00050000-5554-6ff4-8f2d-7646be679af1	5272	Podnanos
00050000-5554-6ff4-8d70-190b5d8a676b	4244	Podnart
00050000-5554-6ff4-d33a-45a7334414de	3241	Podplat
00050000-5554-6ff4-3c32-285b70a394ab	3257	Podsreda
00050000-5554-6ff4-4245-a03982643021	2363	Podvelka
00050000-5554-6ff4-8b7f-f651fd5d50bc	2208	Pohorje
00050000-5554-6ff4-ef1b-309d5d10ffa3	2257	Polenšak
00050000-5554-6ff4-8f98-7d308624df51	1355	Polhov Gradec
00050000-5554-6ff4-e0f7-6998e851d656	4223	Poljane nad Škofjo Loko
00050000-5554-6ff4-d26b-045ef325c538	2319	Poljčane
00050000-5554-6ff4-f52a-670a20bd918a	1272	Polšnik
00050000-5554-6ff4-e320-c1d062a5f842	3313	Polzela
00050000-5554-6ff4-ac9e-b6e0427badf0	3232	Ponikva
00050000-5554-6ff4-86c7-d72103869b97	6320	Portorož/Portorose
00050000-5554-6ff4-477a-4b3324506cf6	6230	Postojna
00050000-5554-6ff4-aea3-4d593c272f11	2331	Pragersko
00050000-5554-6ff4-a238-c7d35b0f8657	3312	Prebold
00050000-5554-6ff4-0d84-8f80e240d4f3	4205	Preddvor
00050000-5554-6ff4-504f-a7d6def49a07	6255	Prem
00050000-5554-6ff4-a72f-734d3f02c33c	1352	Preserje
00050000-5554-6ff4-a42a-5eedb0c7c724	6258	Prestranek
00050000-5554-6ff4-3dbb-9158d3687b90	2391	Prevalje
00050000-5554-6ff4-804f-8e0b220e1f8b	3262	Prevorje
00050000-5554-6ff4-ee85-58958b6dc3c8	1276	Primskovo 
00050000-5554-6ff4-a966-a9255eedff9e	3253	Pristava pri Mestinju
00050000-5554-6ff4-68fc-fd99d06f8db9	9207	Prosenjakovci/Partosfalva
00050000-5554-6ff4-91c9-5ebe36ffdaff	5297	Prvačina
00050000-5554-6ff4-9db5-70a550a299c0	2250	Ptuj
00050000-5554-6ff4-08a5-1fa9c6110de0	2323	Ptujska Gora
00050000-5554-6ff4-ac5e-4553eaa4a2fa	9201	Puconci
00050000-5554-6ff4-af23-4954f6abbdd0	2327	Rače
00050000-5554-6ff4-e067-642170dd0ed0	1433	Radeče
00050000-5554-6ff4-6a25-e05b02a21ebf	9252	Radenci
00050000-5554-6ff4-c6d0-4d9ce58adc13	2360	Radlje ob Dravi
00050000-5554-6ff4-3f75-32e2f0577a6a	1235	Radomlje
00050000-5554-6ff4-f95e-73d5fb3d485f	4240	Radovljica
00050000-5554-6ff4-8eae-5d8fcfd2cf2b	8274	Raka
00050000-5554-6ff4-be67-bb8866cd0a90	1381	Rakek
00050000-5554-6ff4-47e0-8ebf23a9b9d0	4283	Rateče - Planica
00050000-5554-6ff4-76b7-457e8f02f2b0	2390	Ravne na Koroškem
00050000-5554-6ff4-c171-eb93a71fe351	9246	Razkrižje
00050000-5554-6ff4-0d45-01a790dc11de	3332	Rečica ob Savinji
00050000-5554-6ff4-efea-38612a79b93e	5292	Renče
00050000-5554-6ff4-416e-ada99d55a9f1	1310	Ribnica
00050000-5554-6ff4-18ff-60f8994deccd	2364	Ribnica na Pohorju
00050000-5554-6ff4-0f95-fb87fc4ff608	3272	Rimske Toplice
00050000-5554-6ff4-8ad1-cb7c27c85f50	1314	Rob
00050000-5554-6ff4-f4f2-32323e04f9fe	5215	Ročinj
00050000-5554-6ff4-93e4-580fe8c016ab	3250	Rogaška Slatina
00050000-5554-6ff4-8b71-d9a12bc05dbf	9262	Rogašovci
00050000-5554-6ff4-b3d1-9c61c5192cd0	3252	Rogatec
00050000-5554-6ff4-31ea-31f2b1e47dea	1373	Rovte
00050000-5554-6ff4-54a5-199907b63120	2342	Ruše
00050000-5554-6ff4-4a2f-ebe9c1fad55f	1282	Sava
00050000-5554-6ff4-7345-761f65c55d7f	6333	Sečovlje/Sicciole
00050000-5554-6ff4-cbc9-711bb3770f8c	4227	Selca
00050000-5554-6ff4-a912-efe1244d6cee	2352	Selnica ob Dravi
00050000-5554-6ff4-8682-ae9fc6728c3a	8333	Semič
00050000-5554-6ff4-fb3d-948b119ed14a	8281	Senovo
00050000-5554-6ff4-fcb6-c8d21a7c0d1a	6224	Senožeče
00050000-5554-6ff4-0b81-f85d028fd667	8290	Sevnica
00050000-5554-6ff4-18ae-6830967858a5	6210	Sežana
00050000-5554-6ff4-6324-67e340979eb7	2214	Sladki Vrh
00050000-5554-6ff4-9c74-84013cf83094	5283	Slap ob Idrijci
00050000-5554-6ff4-126d-6dc28f0086c8	2380	Slovenj Gradec
00050000-5554-6ff4-0fba-ed6e8c6496cd	2310	Slovenska Bistrica
00050000-5554-6ff4-1ec2-b7da2cceb1a1	3210	Slovenske Konjice
00050000-5554-6ff4-439b-efb00c97e5f1	1216	Smlednik
00050000-5554-6ff4-8537-895fed085165	5232	Soča
00050000-5554-6ff4-c7b3-460b9f94efa8	1317	Sodražica
00050000-5554-6ff4-7350-e5b262e71fe5	3335	Solčava
00050000-5554-6ff4-229d-a6d8b26d6077	5250	Solkan
00050000-5554-6ff4-aece-0d0c7cb54cc5	4229	Sorica
00050000-5554-6ff4-72d0-200aeb7a532d	4225	Sovodenj
00050000-5554-6ff4-167c-126fe30cd169	5281	Spodnja Idrija
00050000-5554-6ff4-24d3-ce2544cbd377	2241	Spodnji Duplek
00050000-5554-6ff4-1a5a-d34803bd4f27	9245	Spodnji Ivanjci
00050000-5554-6ff4-48d4-c98fbd92f020	2277	Središče ob Dravi
00050000-5554-6ff4-b019-62532772a57b	4267	Srednja vas v Bohinju
00050000-5554-6ff4-c20e-83063aed5b08	8256	Sromlje 
00050000-5554-6ff4-9ecf-04c70e26cfa4	5224	Srpenica
00050000-5554-6ff4-5578-3573812be359	1242	Stahovica
00050000-5554-6ff4-28da-c99d17bc971b	1332	Stara Cerkev
00050000-5554-6ff4-b36e-cecb27d4566b	8342	Stari trg ob Kolpi
00050000-5554-6ff4-b62f-41b6b9e6c8dc	1386	Stari trg pri Ložu
00050000-5554-6ff4-1d08-30c65c002622	2205	Starše
00050000-5554-6ff4-f236-040b790012c2	2289	Stoperce
00050000-5554-6ff4-ff7e-30ef801bdc52	8322	Stopiče
00050000-5554-6ff4-8846-6c20668171c3	3206	Stranice
00050000-5554-6ff4-9586-00a5da8c2bca	8351	Straža
00050000-5554-6ff4-d5cd-43389bc56a6e	1313	Struge
00050000-5554-6ff4-a6cc-1bb070ffc8fa	8293	Studenec
00050000-5554-6ff4-495b-a8d7f57534a6	8331	Suhor
00050000-5554-6ff4-9ec7-08ed36885ee6	2233	Sv. Ana v Slovenskih goricah
00050000-5554-6ff4-c4e1-c43ba28d22ff	2235	Sv. Trojica v Slovenskih goricah
00050000-5554-6ff4-9160-447fcaba4d73	2353	Sveti Duh na Ostrem Vrhu
00050000-5554-6ff4-0700-e452280983bb	9244	Sveti Jurij ob Ščavnici
00050000-5554-6ff4-515c-1796f7714b81	3264	Sveti Štefan
00050000-5554-6ff4-20be-c5828c8635fe	2258	Sveti Tomaž
00050000-5554-6ff4-c507-f8239a12c7fa	9204	Šalovci
00050000-5554-6ff4-0dd6-52f8bde1db34	5261	Šempas
00050000-5554-6ff4-819d-30658db5f513	5290	Šempeter pri Gorici
00050000-5554-6ff4-8f9f-b7685d93ff0b	3311	Šempeter v Savinjski dolini
00050000-5554-6ff4-7216-a710a445e8c4	4208	Šenčur
00050000-5554-6ff4-a825-63364543f165	2212	Šentilj v Slovenskih goricah
00050000-5554-6ff4-4efb-c3fd6b7ff77b	8297	Šentjanž
00050000-5554-6ff4-2591-b4d5134c6e10	2373	Šentjanž pri Dravogradu
00050000-5554-6ff4-75b5-35a01f11044d	8310	Šentjernej
00050000-5554-6ff4-b656-88f55dd8ffe5	3230	Šentjur
00050000-5554-6ff4-5e65-8aae8d0d8bf5	3271	Šentrupert
00050000-5554-6ff4-88ce-8d69a9365da2	8232	Šentrupert
00050000-5554-6ff4-21a7-9ecfce7588e0	1296	Šentvid pri Stični
00050000-5554-6ff4-e644-80abee16e52e	8275	Škocjan
00050000-5554-6ff4-4aa2-31ffa491fd51	6281	Škofije
00050000-5554-6ff4-9ab7-40f74723fe7c	4220	Škofja Loka
00050000-5554-6ff4-43d6-ab150889131e	3211	Škofja vas
00050000-5554-6ff4-0925-eb517ab328a4	1291	Škofljica
00050000-5554-6ff4-5752-6895607cf8af	6274	Šmarje
00050000-5554-6ff4-5164-2f05a8c50a77	1293	Šmarje - Sap
00050000-5554-6ff4-30f2-6c7328e4285d	3240	Šmarje pri Jelšah
00050000-5554-6ff4-8507-a9bd28996fe8	8220	Šmarješke Toplice
00050000-5554-6ff4-114f-9d19524eed39	2315	Šmartno na Pohorju
00050000-5554-6ff4-c2cf-5e152e2a29f6	3341	Šmartno ob Dreti
00050000-5554-6ff4-407f-d4486c19237a	3327	Šmartno ob Paki
00050000-5554-6ff4-f3e2-21ee9589b4e4	1275	Šmartno pri Litiji
00050000-5554-6ff4-aaaa-9293590cab6c	2383	Šmartno pri Slovenj Gradcu
00050000-5554-6ff4-6549-b7354c82e600	3201	Šmartno v Rožni dolini
00050000-5554-6ff4-50ec-e8d6140259ad	3325	Šoštanj
00050000-5554-6ff4-a1ff-09126f31fcda	6222	Štanjel
00050000-5554-6ff4-82b2-c11400aff4b7	3220	Štore
00050000-5554-6ff4-ff43-ee99251fe835	3304	Tabor
00050000-5554-6ff4-6102-a6ffb5939610	3221	Teharje
00050000-5554-6ff4-5c09-dcb3f7a24d5f	9251	Tišina
00050000-5554-6ff4-e67d-47fbc6fee087	5220	Tolmin
00050000-5554-6ff4-be41-d74154dab058	3326	Topolšica
00050000-5554-6ff4-d69f-d575ff4877e6	2371	Trbonje
00050000-5554-6ff4-5d7b-e5981832c0a2	1420	Trbovlje
00050000-5554-6ff4-eb8d-46f26c5b458d	8231	Trebelno 
00050000-5554-6ff4-f1f7-7cf303df8f05	8210	Trebnje
00050000-5554-6ff4-d5a0-edc934eb189b	5252	Trnovo pri Gorici
00050000-5554-6ff4-350a-fb47630104d0	2254	Trnovska vas
00050000-5554-6ff4-cbc4-7528b8e9108f	1222	Trojane
00050000-5554-6ff4-fa47-1bc26fb80a6e	1236	Trzin
00050000-5554-6ff4-1845-7690033b0002	4290	Tržič
00050000-5554-6ff4-4fd1-31904ca048bb	8295	Tržišče
00050000-5554-6ff4-c87b-b9957844113c	1311	Turjak
00050000-5554-6ff4-7eb4-0169ee7dbf24	9224	Turnišče
00050000-5554-6ff4-5376-5debcc7b6995	8323	Uršna sela
00050000-5554-6ff4-41f4-ee3efc87fb39	1252	Vače
00050000-5554-6ff4-afa0-87b714684189	3320	Velenje 
00050000-5554-6ff4-4f75-927c4691d205	3322	Velenje - poštni predali
00050000-5554-6ff4-ef28-b7dc340f93d1	8212	Velika Loka
00050000-5554-6ff4-d8c0-58c66d338c8c	2274	Velika Nedelja
00050000-5554-6ff4-1758-adba0aa7a404	9225	Velika Polana
00050000-5554-6ff4-2140-53ed30ba0374	1315	Velike Lašče
00050000-5554-6ff4-48f1-d0806f6ee0ab	8213	Veliki Gaber
00050000-5554-6ff4-4299-1c2c8a2466d8	9241	Veržej
00050000-5554-6ff4-f8b0-8cf8d6c8c4ca	1312	Videm - Dobrepolje
00050000-5554-6ff4-a8b0-821a4dcc9da9	2284	Videm pri Ptuju
00050000-5554-6ff4-f766-8f518a09fb64	8344	Vinica
00050000-5554-6ff4-9b41-96689b6c04bf	5271	Vipava
00050000-5554-6ff4-1b16-23bfdd0ac11a	4212	Visoko
00050000-5554-6ff4-1fea-99a24d0862a1	1294	Višnja Gora
00050000-5554-6ff4-914c-c0b107c89782	3205	Vitanje
00050000-5554-6ff4-9210-6accd39bb78e	2255	Vitomarci
00050000-5554-6ff4-9686-a88cfd931667	1217	Vodice
00050000-5554-6ff4-56dd-bfdd47cf968b	3212	Vojnik\t
00050000-5554-6ff4-c9fa-74380d0c86a8	5293	Volčja Draga
00050000-5554-6ff4-7628-9bc89f11dc88	2232	Voličina
00050000-5554-6ff4-f51a-e905cd67b745	3305	Vransko
00050000-5554-6ff4-94af-17109fd4bed4	6217	Vremski Britof
00050000-5554-6ff4-929a-8b9d7f08741c	1360	Vrhnika
00050000-5554-6ff4-423b-a3000dd5a5d1	2365	Vuhred
00050000-5554-6ff4-5e7d-755814fabcdb	2367	Vuzenica
00050000-5554-6ff4-d763-3aaec18ef7c7	8292	Zabukovje 
00050000-5554-6ff4-611a-82de6a9c3782	1410	Zagorje ob Savi
00050000-5554-6ff4-353a-6540c722c74a	1303	Zagradec
00050000-5554-6ff4-a346-49c91b4ace06	2283	Zavrč
00050000-5554-6ff4-2995-45384f185521	8272	Zdole 
00050000-5554-6ff4-8838-a73e9fc440f0	4201	Zgornja Besnica
00050000-5554-6ff4-11af-913087beb047	2242	Zgornja Korena
00050000-5554-6ff4-1eda-caf96f07a24f	2201	Zgornja Kungota
00050000-5554-6ff4-9b40-3856f3d2fc20	2316	Zgornja Ložnica
00050000-5554-6ff4-e61f-6fcda4239682	2314	Zgornja Polskava
00050000-5554-6ff4-c335-92b2000c9dd0	2213	Zgornja Velka
00050000-5554-6ff4-86a3-4fcca0b2f153	4247	Zgornje Gorje
00050000-5554-6ff4-9826-3c99489d104f	4206	Zgornje Jezersko
00050000-5554-6ff4-73b0-adb3306a82f2	2285	Zgornji Leskovec
00050000-5554-6ff4-516e-7af335a43593	1432	Zidani Most
00050000-5554-6ff4-6f6a-f60df8c7f133	3214	Zreče
00050000-5554-6ff4-99df-34bce32ffeea	4209	Žabnica
00050000-5554-6ff4-e78c-5bb35bd15bee	3310	Žalec
00050000-5554-6ff4-83c6-5d7990f19c7c	4228	Železniki
00050000-5554-6ff4-53e8-1400b86f2ff4	2287	Žetale
00050000-5554-6ff4-3472-6f47b2a57b99	4226	Žiri
00050000-5554-6ff4-84db-9da73db6f411	4274	Žirovnica
00050000-5554-6ff4-debf-cefb2eb928fc	8360	Žužemberk
\.


--
-- TOC entry 2666 (class 0 OID 3371887)
-- Dependencies: 202
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 3371705)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 3371771)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2668 (class 0 OID 3371899)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2680 (class 0 OID 3372004)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2684 (class 0 OID 3372051)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 3371928)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 3371872)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2663 (class 0 OID 3371862)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2683 (class 0 OID 3372041)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 3371994)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 3371572)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5554-6ff5-8c27-ff0f6b6fdad0	00010000-5554-6ff5-dfaf-774d4bc031ab	2015-05-14 11:50:45	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROyjdBD1ri4qQlhfJODJhhyb9CfryNc9e";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2698 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2673 (class 0 OID 3371937)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 3371610)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5554-6ff5-fbfd-656f2279186a	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5554-6ff5-b521-7064a506549f	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5554-6ff5-d80c-33794f4dc63b	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5554-6ff5-1788-1240d40ff201	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5554-6ff5-80e1-d797e4e74c75	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5554-6ff5-8bd7-ee43d7a29cd1	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2639 (class 0 OID 3371594)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5554-6ff5-8c27-ff0f6b6fdad0	00020000-5554-6ff5-1788-1240d40ff201
00010000-5554-6ff5-dfaf-774d4bc031ab	00020000-5554-6ff5-1788-1240d40ff201
\.


--
-- TOC entry 2675 (class 0 OID 3371951)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 3371893)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 3371843)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 3371670)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 3371849)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 3372029)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc, imezenski, podrocje, pomembnost) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 3371740)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2638 (class 0 OID 3371581)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5554-6ff5-dfaf-774d4bc031ab	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROXfoMqY8oaSdoUaRrWivG076ghxujZ7i	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5554-6ff5-8c27-ff0f6b6fdad0	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2687 (class 0 OID 3372083)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 3371786)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 3371920)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 3371986)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2658 (class 0 OID 3371818)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2686 (class 0 OID 3372073)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 3371976)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2281 (class 2606 OID 3371635)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 3372123)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2444 (class 2606 OID 3372116)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 3372028)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2334 (class 2606 OID 3371808)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 3371842)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2317 (class 2606 OID 3371766)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 3371972)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 3371784)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 3371836)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2256 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 3371885)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 3371912)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2310 (class 2606 OID 3371738)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2285 (class 2606 OID 3371644)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 3371702)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2287 (class 2606 OID 3371668)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2279 (class 2606 OID 3371624)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2272 (class 2606 OID 3371609)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 3371918)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 3371950)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 3372068)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2295 (class 2606 OID 3371695)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2307 (class 2606 OID 3371726)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 3371891)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2262 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2305 (class 2606 OID 3371716)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 3371775)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 3371903)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 3372010)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 3372056)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 3371935)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 3371876)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 3371867)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 3372050)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 3372001)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2264 (class 2606 OID 3371580)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2395 (class 2606 OID 3371941)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2270 (class 2606 OID 3371598)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2274 (class 2606 OID 3371618)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 3371959)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 3371898)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 3371848)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2292 (class 2606 OID 3371675)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 3371858)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 3372040)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2315 (class 2606 OID 3371751)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2266 (class 2606 OID 3371593)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 3372098)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2332 (class 2606 OID 3371793)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 3371926)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2412 (class 2606 OID 3371992)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 3371831)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 3372082)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 3371985)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2335 (class 1259 OID 3371815)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2293 (class 1259 OID 3371697)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2258 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2259 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2260 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2384 (class 1259 OID 3371919)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2378 (class 1259 OID 3371905)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2379 (class 1259 OID 3371904)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2330 (class 1259 OID 3371794)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2405 (class 1259 OID 3371975)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2406 (class 1259 OID 3371973)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2407 (class 1259 OID 3371974)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2430 (class 1259 OID 3372070)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2431 (class 1259 OID 3372071)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2432 (class 1259 OID 3372072)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2438 (class 1259 OID 3372101)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2439 (class 1259 OID 3372100)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2440 (class 1259 OID 3372099)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2312 (class 1259 OID 3371753)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2313 (class 1259 OID 3371752)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2297 (class 1259 OID 3371704)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2298 (class 1259 OID 3371703)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2393 (class 1259 OID 3371942)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2348 (class 1259 OID 3371837)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2276 (class 1259 OID 3371625)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2277 (class 1259 OID 3371626)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2398 (class 1259 OID 3371962)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2399 (class 1259 OID 3371961)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2400 (class 1259 OID 3371960)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2322 (class 1259 OID 3371776)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2323 (class 1259 OID 3371778)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2324 (class 1259 OID 3371777)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2358 (class 1259 OID 3371871)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2359 (class 1259 OID 3371869)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2360 (class 1259 OID 3371868)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2361 (class 1259 OID 3371870)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2267 (class 1259 OID 3371599)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2268 (class 1259 OID 3371600)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2387 (class 1259 OID 3371927)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2373 (class 1259 OID 3371892)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2413 (class 1259 OID 3372002)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2414 (class 1259 OID 3372003)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2301 (class 1259 OID 3371718)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2302 (class 1259 OID 3371717)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2303 (class 1259 OID 3371719)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2417 (class 1259 OID 3372011)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2418 (class 1259 OID 3372012)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2449 (class 1259 OID 3372126)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2450 (class 1259 OID 3372125)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2451 (class 1259 OID 3372128)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2452 (class 1259 OID 3372124)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2453 (class 1259 OID 3372127)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2410 (class 1259 OID 3371993)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2364 (class 1259 OID 3371880)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2365 (class 1259 OID 3371879)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2366 (class 1259 OID 3371877)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2367 (class 1259 OID 3371878)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2254 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2445 (class 1259 OID 3372118)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2446 (class 1259 OID 3372117)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2329 (class 1259 OID 3371785)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2282 (class 1259 OID 3371646)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2283 (class 1259 OID 3371645)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2289 (class 1259 OID 3371676)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2290 (class 1259 OID 3371677)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2353 (class 1259 OID 3371861)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2354 (class 1259 OID 3371860)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2355 (class 1259 OID 3371859)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2336 (class 1259 OID 3371817)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2337 (class 1259 OID 3371813)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2338 (class 1259 OID 3371810)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2339 (class 1259 OID 3371811)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2340 (class 1259 OID 3371809)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2341 (class 1259 OID 3371814)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2342 (class 1259 OID 3371812)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2296 (class 1259 OID 3371696)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2318 (class 1259 OID 3371767)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2319 (class 1259 OID 3371769)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2320 (class 1259 OID 3371768)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2321 (class 1259 OID 3371770)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2372 (class 1259 OID 3371886)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2435 (class 1259 OID 3372069)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2288 (class 1259 OID 3371669)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2311 (class 1259 OID 3371739)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2392 (class 1259 OID 3371936)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2257 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2308 (class 1259 OID 3371727)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2429 (class 1259 OID 3372057)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2275 (class 1259 OID 3371619)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2343 (class 1259 OID 3371816)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2478 (class 2606 OID 3372259)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2481 (class 2606 OID 3372244)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2480 (class 2606 OID 3372249)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2476 (class 2606 OID 3372269)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2482 (class 2606 OID 3372239)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2477 (class 2606 OID 3372264)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2479 (class 2606 OID 3372254)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2463 (class 2606 OID 3372174)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2499 (class 2606 OID 3372354)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2497 (class 2606 OID 3372349)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2498 (class 2606 OID 3372344)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2475 (class 2606 OID 3372234)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2505 (class 2606 OID 3372394)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2507 (class 2606 OID 3372384)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2506 (class 2606 OID 3372389)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2495 (class 2606 OID 3372334)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2516 (class 2606 OID 3372429)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2515 (class 2606 OID 3372434)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2514 (class 2606 OID 3372439)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2517 (class 2606 OID 3372454)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2518 (class 2606 OID 3372449)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2519 (class 2606 OID 3372444)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2469 (class 2606 OID 3372209)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2470 (class 2606 OID 3372204)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2464 (class 2606 OID 3372184)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2465 (class 2606 OID 3372179)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2460 (class 2606 OID 3372159)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2501 (class 2606 OID 3372364)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2483 (class 2606 OID 3372274)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2457 (class 2606 OID 3372139)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2456 (class 2606 OID 3372144)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2502 (class 2606 OID 3372379)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2503 (class 2606 OID 3372374)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2504 (class 2606 OID 3372369)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2473 (class 2606 OID 3372214)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2471 (class 2606 OID 3372224)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2472 (class 2606 OID 3372219)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2487 (class 2606 OID 3372309)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2489 (class 2606 OID 3372299)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2490 (class 2606 OID 3372294)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2488 (class 2606 OID 3372304)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2455 (class 2606 OID 3372129)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2454 (class 2606 OID 3372134)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2500 (class 2606 OID 3372359)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 3372339)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2510 (class 2606 OID 3372404)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2509 (class 2606 OID 3372409)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2467 (class 2606 OID 3372194)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2468 (class 2606 OID 3372189)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2466 (class 2606 OID 3372199)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2512 (class 2606 OID 3372414)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2511 (class 2606 OID 3372419)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2524 (class 2606 OID 3372479)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2525 (class 2606 OID 3372474)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2522 (class 2606 OID 3372489)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2526 (class 2606 OID 3372469)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2523 (class 2606 OID 3372484)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2508 (class 2606 OID 3372399)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2491 (class 2606 OID 3372329)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2492 (class 2606 OID 3372324)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2494 (class 2606 OID 3372314)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2493 (class 2606 OID 3372319)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2520 (class 2606 OID 3372464)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2521 (class 2606 OID 3372459)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2474 (class 2606 OID 3372229)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2513 (class 2606 OID 3372424)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2458 (class 2606 OID 3372154)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2459 (class 2606 OID 3372149)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2462 (class 2606 OID 3372164)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 3372169)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2484 (class 2606 OID 3372289)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2485 (class 2606 OID 3372284)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2486 (class 2606 OID 3372279)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-14 11:50:46 CEST

--
-- PostgreSQL database dump complete
--

