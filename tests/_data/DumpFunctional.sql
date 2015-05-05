--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-05 12:10:09 CEST

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
-- TOC entry 179 (class 1259 OID 2247696)
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
-- TOC entry 225 (class 1259 OID 2248181)
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
-- TOC entry 224 (class 1259 OID 2248164)
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
-- TOC entry 217 (class 1259 OID 2248080)
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
-- TOC entry 193 (class 1259 OID 2247862)
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
-- TOC entry 196 (class 1259 OID 2247903)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 2247823)
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
-- TOC entry 212 (class 1259 OID 2248030)
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
-- TOC entry 191 (class 1259 OID 2247849)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 2247897)
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
-- TOC entry 201 (class 1259 OID 2247946)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 205 (class 1259 OID 2247971)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 2247797)
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
-- TOC entry 180 (class 1259 OID 2247705)
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
-- TOC entry 181 (class 1259 OID 2247716)
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
-- TOC entry 184 (class 1259 OID 2247767)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 2247670)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 2247689)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 2247978)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 210 (class 1259 OID 2248010)
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
-- TOC entry 221 (class 1259 OID 2248122)
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
-- TOC entry 183 (class 1259 OID 2247747)
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
-- TOC entry 186 (class 1259 OID 2247789)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 2247952)
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
-- TOC entry 185 (class 1259 OID 2247774)
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
-- TOC entry 190 (class 1259 OID 2247841)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 2247964)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 2248071)
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
-- TOC entry 220 (class 1259 OID 2248115)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 2247994)
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
-- TOC entry 200 (class 1259 OID 2247937)
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
-- TOC entry 199 (class 1259 OID 2247927)
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
-- TOC entry 219 (class 1259 OID 2248105)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 2248061)
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
-- TOC entry 173 (class 1259 OID 2247640)
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
-- TOC entry 172 (class 1259 OID 2247638)
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
-- TOC entry 209 (class 1259 OID 2248003)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 177 (class 1259 OID 2247680)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) NOT NULL,
    description text,
    builtin boolean
);


--
-- TOC entry 175 (class 1259 OID 2247663)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 2248018)
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
-- TOC entry 203 (class 1259 OID 2247958)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 197 (class 1259 OID 2247908)
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
-- TOC entry 182 (class 1259 OID 2247739)
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
-- TOC entry 198 (class 1259 OID 2247914)
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
-- TOC entry 218 (class 1259 OID 2248096)
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
-- TOC entry 188 (class 1259 OID 2247809)
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
-- TOC entry 174 (class 1259 OID 2247649)
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
-- TOC entry 223 (class 1259 OID 2248146)
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
-- TOC entry 192 (class 1259 OID 2247856)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 207 (class 1259 OID 2247985)
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
-- TOC entry 214 (class 1259 OID 2248053)
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
-- TOC entry 194 (class 1259 OID 2247884)
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
-- TOC entry 222 (class 1259 OID 2248136)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 2248043)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2121 (class 2604 OID 2247643)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2636 (class 0 OID 2247696)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2682 (class 0 OID 2248181)
-- Dependencies: 225
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2681 (class 0 OID 2248164)
-- Dependencies: 224
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2674 (class 0 OID 2248080)
-- Dependencies: 217
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2650 (class 0 OID 2247862)
-- Dependencies: 193
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2653 (class 0 OID 2247903)
-- Dependencies: 196
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 2247823)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5548-9700-0f74-7e8dec17fb11	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5548-9700-9c8d-f9cbf3bd9333	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5548-9700-6cc1-3451f015fd2b	AL	ALB	008	Albania 	Albanija	\N
00040000-5548-9700-b109-f49844836a12	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5548-9700-0a86-19b660b1ecb7	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5548-9700-2373-d67e89acf34a	AD	AND	020	Andorra 	Andora	\N
00040000-5548-9700-e30d-4036a0b3e492	AO	AGO	024	Angola 	Angola	\N
00040000-5548-9700-1e82-07e1633de82a	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5548-9700-3029-843c915ae6b7	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5548-9700-81a3-3e541a6a03cd	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5548-9700-d5a2-d7ff7f718ad9	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5548-9700-4b89-9b8baa01b455	AM	ARM	051	Armenia 	Armenija	\N
00040000-5548-9700-0d25-8f79cd82c476	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5548-9700-a49f-843f57c3db0c	AU	AUS	036	Australia 	Avstralija	\N
00040000-5548-9700-b8aa-7c3c0614fd38	AT	AUT	040	Austria 	Avstrija	\N
00040000-5548-9700-c250-4f2b8c8db61f	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5548-9700-2a30-e40db6b6f481	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5548-9700-95c7-e5df4296caea	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5548-9700-8c22-415837ab373a	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5548-9700-b8e2-58d399c5bd3d	BB	BRB	052	Barbados 	Barbados	\N
00040000-5548-9700-f4ca-d4b216436282	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5548-9700-b3d5-f12faadcffe1	BE	BEL	056	Belgium 	Belgija	\N
00040000-5548-9700-e5a3-7cc8c40e6e61	BZ	BLZ	084	Belize 	Belize	\N
00040000-5548-9700-7666-15a823976332	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5548-9700-6632-2a6db69bf41f	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5548-9700-6c46-f661c4bef2a7	BT	BTN	064	Bhutan 	Butan	\N
00040000-5548-9700-adee-e537b5903f2c	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5548-9700-f52b-20b0dd16f1b4	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5548-9700-be37-235b84dae3a7	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5548-9700-8a41-825c19e667f5	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5548-9700-2eda-e97bab2128f9	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5548-9700-b3a9-b7b59b1d45f9	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5548-9700-29d2-4c92eb26126f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5548-9700-e2b8-92b197cef0b6	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5548-9700-06ec-d5fdc8c6f31c	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5548-9700-c9fd-c3983e04dab5	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5548-9700-e2d3-9b028844afb9	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5548-9700-1143-c71f48b932ba	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5548-9700-568f-64403c6163d8	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5548-9700-974d-a84bca70eafe	CA	CAN	124	Canada 	Kanada	\N
00040000-5548-9700-d299-ba7f2a8f1741	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5548-9700-a3e6-b281158cd14d	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5548-9700-cb61-de718ea5ed2f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5548-9700-5dab-387c8462bc65	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5548-9700-7202-70377111b25a	CL	CHL	152	Chile 	Čile	\N
00040000-5548-9700-de45-45169360bd74	CN	CHN	156	China 	Kitajska	\N
00040000-5548-9700-0681-5f403350db95	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5548-9700-70c4-0b23a338d245	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5548-9700-cb4c-725de1c2bd04	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5548-9700-0de7-a718c06e31e2	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5548-9700-6014-887a152434f0	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5548-9700-6c4d-271519a60ad2	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5548-9700-2451-ac7a40b05520	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5548-9700-423b-e668457d3be6	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5548-9700-09e9-2c5504772984	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5548-9700-fec0-79e9eac60caa	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5548-9700-f796-4219b324b65a	CU	CUB	192	Cuba 	Kuba	\N
00040000-5548-9700-cb30-41ca3e383c5d	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5548-9700-62f9-0d6a0935ae8b	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5548-9700-ae26-afbefabead03	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5548-9700-4a52-29f60252e183	DK	DNK	208	Denmark 	Danska	\N
00040000-5548-9700-d46c-47b67679c288	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5548-9700-1fcd-2c695da7f7f2	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5548-9700-03ed-8636e70b040c	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5548-9700-dab2-9c51eda8ee25	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5548-9700-1d12-0d5f111f1956	EG	EGY	818	Egypt 	Egipt	\N
00040000-5548-9700-5865-fe58c064d9d4	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5548-9700-b510-8f3bba132c85	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5548-9700-a96f-1e51422d7463	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5548-9700-69f6-bc4f2f92c885	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5548-9700-cf50-dd3df569ead2	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5548-9700-6593-80abc87c312f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5548-9700-76d0-f183222e7136	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5548-9700-a597-78ed7666a2ef	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5548-9700-8d90-fb24c738bd74	FI	FIN	246	Finland 	Finska	\N
00040000-5548-9700-1208-e7208da006c8	FR	FRA	250	France 	Francija	\N
00040000-5548-9700-0d44-e8d4ac29ed76	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5548-9700-6828-54591bf5ac7b	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5548-9700-e0ab-e66b427b91e8	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5548-9700-ec81-073190fc731c	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5548-9700-8217-a240028b5054	GA	GAB	266	Gabon 	Gabon	\N
00040000-5548-9700-1d25-9c7bdebe7f89	GM	GMB	270	Gambia 	Gambija	\N
00040000-5548-9700-fd8b-e6e140ef4b83	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5548-9700-3b4c-4c92c21b3092	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5548-9700-cdcd-513f12a44ecf	GH	GHA	288	Ghana 	Gana	\N
00040000-5548-9700-1c89-f9d08d0808f3	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5548-9700-fb77-7deecfd5eeaf	GR	GRC	300	Greece 	Grčija	\N
00040000-5548-9700-2408-df960fd935e6	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5548-9700-484c-574d331094cb	GD	GRD	308	Grenada 	Grenada	\N
00040000-5548-9700-60c7-d3e197cc2d2f	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5548-9700-e1f4-0be158807828	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5548-9700-6b3a-1bd5ba1ec3f0	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5548-9700-f031-c3e6967054d1	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5548-9700-eb88-1959b39e9f1a	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5548-9700-d79e-3611d429c3f5	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5548-9700-0ee8-8ae9831ed995	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5548-9700-c54f-4ab6d39a92e4	HT	HTI	332	Haiti 	Haiti	\N
00040000-5548-9700-b099-35179a157f6d	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5548-9700-4f33-ad596aa6696f	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5548-9700-37ae-009f6e1aebfc	HN	HND	340	Honduras 	Honduras	\N
00040000-5548-9700-5d58-b939b20d39c2	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5548-9700-f0b7-e4b24d097cab	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5548-9700-100a-fcaa48c883bf	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5548-9700-016a-96d40bbd3c70	IN	IND	356	India 	Indija	\N
00040000-5548-9700-eab2-4dd0abf9d961	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5548-9700-cb5e-be7b1844acf0	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5548-9700-a565-f1e10af44295	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5548-9700-5d81-23cd8e3b4d73	IE	IRL	372	Ireland 	Irska	\N
00040000-5548-9700-74f9-93da72ca113e	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5548-9700-d848-803c3df0f928	IL	ISR	376	Israel 	Izrael	\N
00040000-5548-9700-f964-be9d72cfbd77	IT	ITA	380	Italy 	Italija	\N
00040000-5548-9700-8d31-b5f5152661b6	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5548-9700-fed4-c0a2499d6a1c	JP	JPN	392	Japan 	Japonska	\N
00040000-5548-9700-2f50-ba83dab1767d	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5548-9700-e40a-0a4fbfa714f4	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5548-9700-d05a-c233d0d18df2	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5548-9700-58d1-64adfa036572	KE	KEN	404	Kenya 	Kenija	\N
00040000-5548-9700-187c-0ad5f5c54225	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5548-9700-9497-933ba12d2616	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5548-9700-3297-f2f86e872706	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5548-9700-ae15-229e1829f449	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5548-9700-5a8c-5ca74c2da55a	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5548-9700-3f71-b3226524ebff	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5548-9700-204f-a92e4f40b6bc	LV	LVA	428	Latvia 	Latvija	\N
00040000-5548-9700-cdef-4d7ce9fb2e1d	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5548-9700-1c62-79f383ab5072	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5548-9700-3a9c-b88639079580	LR	LBR	430	Liberia 	Liberija	\N
00040000-5548-9700-4c7d-6db0e05b7f94	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5548-9700-32c6-bb6f517f797e	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5548-9700-7483-108c81ba87da	LT	LTU	440	Lithuania 	Litva	\N
00040000-5548-9700-d1ab-cd6a837bb006	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5548-9700-fcc5-a3accde6aa5b	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5548-9700-e515-cb46975f565a	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5548-9700-c9c7-89eb9d69a877	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5548-9700-e078-35a898a9b7b5	MW	MWI	454	Malawi 	Malavi	\N
00040000-5548-9700-5d21-def8f31e75ab	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5548-9700-2b30-f74eab0a74a8	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5548-9700-6197-a8679b74d095	ML	MLI	466	Mali 	Mali	\N
00040000-5548-9700-cf23-e20a1119dfdc	MT	MLT	470	Malta 	Malta	\N
00040000-5548-9700-b897-b81ef7aa554b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5548-9700-9b60-2ce2cb6a6c0a	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5548-9700-7ab1-008595717619	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5548-9700-4950-1365a289cadc	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5548-9700-36b7-2cc49a95b243	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5548-9700-20cb-041742aacb50	MX	MEX	484	Mexico 	Mehika	\N
00040000-5548-9700-d697-8f1cbed109e9	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5548-9700-aebf-038f334dfb49	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5548-9700-7c1a-51c0173adbf9	MC	MCO	492	Monaco 	Monako	\N
00040000-5548-9700-bc01-7823a7a5d661	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5548-9700-5297-aeab246fea11	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5548-9700-5648-f8ab73bbd7d6	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5548-9700-eeb7-5ee114b87a78	MA	MAR	504	Morocco 	Maroko	\N
00040000-5548-9700-5cd1-7aa846389313	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5548-9700-dae7-191dd820e0f8	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5548-9700-0fa7-f6960956d98a	NA	NAM	516	Namibia 	Namibija	\N
00040000-5548-9700-74bb-022234d244f6	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5548-9700-f4cc-fca0466b8598	NP	NPL	524	Nepal 	Nepal	\N
00040000-5548-9700-7884-d390ea356abb	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5548-9700-db32-9c2cf974dc12	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5548-9700-6e4e-0a15571eea38	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5548-9700-7280-6892adde6f1e	NE	NER	562	Niger 	Niger 	\N
00040000-5548-9700-65b6-92aaa4c04050	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5548-9700-7c91-4857c7e9e20a	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5548-9700-4f14-f16e15d925ac	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5548-9700-3255-1647f482ff1b	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5548-9700-5e38-57b976a99c30	NO	NOR	578	Norway 	Norveška	\N
00040000-5548-9700-c716-725e1b312236	OM	OMN	512	Oman 	Oman	\N
00040000-5548-9700-3dc8-42d174c8b03d	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5548-9700-6eb0-7c28ea33caa6	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5548-9700-6456-83f64ef927c8	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5548-9700-a3af-5f428c16a450	PA	PAN	591	Panama 	Panama	\N
00040000-5548-9700-326a-42ba0df4a447	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5548-9700-6741-96a17c25a28c	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5548-9700-bb8a-f67bf7139ff7	PE	PER	604	Peru 	Peru	\N
00040000-5548-9700-a261-04bd45eb8ac8	PH	PHL	608	Philippines 	Filipini	\N
00040000-5548-9700-5e21-c077da99f2b8	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5548-9700-7745-cf7deb707a10	PL	POL	616	Poland 	Poljska	\N
00040000-5548-9700-6f11-fe84ce36d937	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5548-9700-7add-f1df04803ef6	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5548-9700-8e3d-a5bd678a114d	QA	QAT	634	Qatar 	Katar	\N
00040000-5548-9700-da97-90530ee9d197	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5548-9700-cb79-27ea2b769d04	RO	ROU	642	Romania 	Romunija	\N
00040000-5548-9700-05e0-19735329db9f	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5548-9700-686a-2b5d4f07c35c	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5548-9700-04aa-c0b6e5b9f299	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5548-9700-9235-3d717c6b93a9	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5548-9700-a4a5-21c4b2716a2c	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5548-9700-303f-27ab9e98b0bd	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5548-9700-4791-6edeee3756b2	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5548-9700-628b-eee2b93ceaaa	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5548-9700-7eee-54bcaaba3a56	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5548-9700-4c7e-3de21306cfdd	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5548-9700-86ea-a2c6d3ba8f4d	SM	SMR	674	San Marino 	San Marino	\N
00040000-5548-9700-d03e-e8201c5b0a29	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5548-9700-234d-eea673e438de	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5548-9700-b536-3b6a0bd18f2c	SN	SEN	686	Senegal 	Senegal	\N
00040000-5548-9700-ef24-4101354c9668	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5548-9700-1faf-9cc35b0698b6	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5548-9700-57a4-eb8149033e23	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5548-9700-9d9e-4ccc08a5639c	SG	SGP	702	Singapore 	Singapur	\N
00040000-5548-9700-6c91-493c8755cd60	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5548-9700-b86d-2c58b0643562	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5548-9700-8492-dbbd7cf1eea7	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5548-9700-127f-f6f9ccde2028	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5548-9700-45be-c43db2280981	SO	SOM	706	Somalia 	Somalija	\N
00040000-5548-9700-7f7a-078a3a2e759d	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5548-9700-6d3d-7a22017b367d	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5548-9700-84d8-e324fba4dd73	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5548-9700-5c7d-f94866944af9	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5548-9700-db59-6a0980f71ad4	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5548-9700-5381-e463f1e1188d	SD	SDN	729	Sudan 	Sudan	\N
00040000-5548-9700-cdbb-db9a301e33da	SR	SUR	740	Suriname 	Surinam	\N
00040000-5548-9700-aac9-d31e8582a5e1	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5548-9700-cc08-0889e0f4e97e	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5548-9700-bef0-32f724f51b94	SE	SWE	752	Sweden 	Švedska	\N
00040000-5548-9700-0d70-9264e06bbad9	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5548-9700-452b-8001c24348d0	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5548-9700-02fb-133376a91956	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5548-9700-8ba3-bcd0096cdcd7	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5548-9700-b852-da5e090deb80	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5548-9700-0493-e608416f3fcf	TH	THA	764	Thailand 	Tajska	\N
00040000-5548-9700-9bd3-74b7b890a25c	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5548-9700-103d-ae64d36df080	TG	TGO	768	Togo 	Togo	\N
00040000-5548-9700-c5fd-9f380fed06b3	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5548-9700-b827-0f966136dc71	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5548-9700-5086-11287b1fd093	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5548-9700-eac6-34a364125ff8	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5548-9700-29f3-d83b959f7962	TR	TUR	792	Turkey 	Turčija	\N
00040000-5548-9700-9009-50cb8bcb8b34	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5548-9700-f111-d149fe961fc6	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5548-9700-0bbc-53e58726d805	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5548-9700-084f-ee29c58979c6	UG	UGA	800	Uganda 	Uganda	\N
00040000-5548-9700-7197-100ee4ee9f04	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5548-9700-7afe-5a97ea1795d1	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5548-9700-d015-4cfa7efaad06	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5548-9700-fc5e-2a1f8154d0c2	US	USA	840	United States 	Združene države Amerike	\N
00040000-5548-9700-7146-ec4906ca1bdb	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5548-9700-6ebb-532a3af7cf95	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5548-9700-731d-a0856aea9787	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5548-9700-8cb4-ceb90ecab979	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5548-9700-7e4d-6aa5b8c9b056	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5548-9700-04d8-e2e8e3be5412	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5548-9700-9278-f5487958260a	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5548-9700-a486-63b018668330	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5548-9700-6ffc-561515decc1e	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5548-9700-0e3a-844e02dd82bd	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5548-9700-fa24-18c95ca57b7c	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5548-9700-6d9c-80eb7bf98c80	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5548-9700-6a05-5fddcaaa8a55	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2669 (class 0 OID 2248030)
-- Dependencies: 212
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 2247849)
-- Dependencies: 191
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2652 (class 0 OID 2247897)
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
-- TOC entry 2658 (class 0 OID 2247946)
-- Dependencies: 201
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2662 (class 0 OID 2247971)
-- Dependencies: 205
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2644 (class 0 OID 2247797)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5548-9701-57af-dbfc6e239ea7	popa.tipkli	array	a:4:{i:0;a:2:{s:3:"key";s:10:"dobavitelj";s:5:"value";s:10:"Dobavitelj";}i:1;a:2:{s:3:"key";s:5:"kupec";s:5:"value";s:5:"Kupec";}i:2;a:2:{s:3:"key";s:11:"koproducent";s:5:"value";s:11:"Koproducent";}i:3;a:2:{s:3:"key";s:5:"multi";s:5:"value";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5548-9701-d43e-9fdaeb8a5968	popa.stakli	array	a:2:{i:0;a:2:{s:3:"key";s:2:"AK";s:5:"value";s:7:"aktiven";}i:1;a:2:{s:3:"key";s:2:"NA";s:5:"value";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5548-9701-adcc-29dda13c455e	oseba.spol	array	a:2:{i:0;a:2:{s:3:"key";s:1:"M";s:5:"value";s:6:"Moški";}i:1;a:2:{s:3:"key";s:1:"Z";s:5:"value";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5548-9701-36f3-d004d5802eec	telefonska.vrsta	array	a:3:{i:0;a:2:{s:3:"key";s:7:"mobilna";s:5:"value";s:7:"Mobilni";}i:1;a:2:{s:3:"key";s:6:"domaca";s:5:"value";s:6:"Domač";}i:2;a:2:{s:3:"key";s:6:"fiksna";s:5:"value";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5548-9701-8888-02dd785806ba	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5548-9701-01ed-efebff8774a3	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5548-9701-8726-23abff50f95b	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5548-9701-55b2-0eaba1ee550b	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5548-9701-9bde-9844e3dcd672	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5548-9701-95a9-d63868deeb15	dogodek.status	array	a:2:{i:0;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:11:"Dolgoročno";}i:1;a:2:{s:3:"key";s:8:"planiran";s:5:"value";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2637 (class 0 OID 2247705)
-- Dependencies: 180
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5548-9701-beee-a10cf1ae78ac	00000000-5548-9701-8888-02dd785806ba	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5548-9701-e3a7-d0e8cf69f9fe	00000000-5548-9701-8888-02dd785806ba	00010000-5548-9701-5c82-48a3fa911882	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5548-9701-c2c8-12d0614a8cea	00000000-5548-9701-01ed-efebff8774a3	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2638 (class 0 OID 2247716)
-- Dependencies: 181
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 2247767)
-- Dependencies: 184
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 2247670)
-- Dependencies: 176
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5548-9701-9de6-20b0d40c8b6b	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5548-9701-ecfa-b18541850633	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5548-9701-6642-a23049fc2eaf	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5548-9701-c52f-90f7dc4e896e	Abonma-read	Abonma - branje	f
00030000-5548-9701-9659-d7007f19255e	Abonma-write	Abonma - spreminjanje	f
00030000-5548-9701-0f3e-4588e52f0ab3	Alternacija-read	Alternacija - branje	f
00030000-5548-9701-bca5-25c402965e99	Alternacija-write	Alternacija - spreminjanje	f
00030000-5548-9701-5119-67d423205899	Arhivalija-read	Arhivalija - branje	f
00030000-5548-9701-afa2-0ea062d9193d	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5548-9701-c8b0-5c3114639b04	Besedilo-read	Besedilo - branje	f
00030000-5548-9701-eb4e-4091c1f23e57	Besedilo-write	Besedilo - spreminjanje	f
00030000-5548-9701-a342-b2b0e7e2c103	DogodekIzven-read	DogodekIzven - branje	f
00030000-5548-9701-5590-8a6a341af610	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5548-9701-a275-d24ae8252418	Dogodek-read	Dogodek - branje	f
00030000-5548-9701-5414-86033cb6fe84	Dogodek-write	Dogodek - spreminjanje	f
00030000-5548-9701-1631-d41c13756a65	Drzava-read	Drzava - branje	f
00030000-5548-9701-f3fd-5d8202a9738c	Drzava-write	Drzava - spreminjanje	f
00030000-5548-9701-ec5d-e9ea5a85b232	Funkcija-read	Funkcija - branje	f
00030000-5548-9701-8d26-839d74574386	Funkcija-write	Funkcija - spreminjanje	f
00030000-5548-9701-f263-cab11b70e4d3	Gostovanje-read	Gostovanje - branje	f
00030000-5548-9701-b73b-81bd41524886	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5548-9701-d00c-c4a58c9e0f62	Gostujoca-read	Gostujoca - branje	f
00030000-5548-9701-3c8f-ad8416caa25f	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5548-9701-64f2-449ee79b42ae	Kupec-read	Kupec - branje	f
00030000-5548-9701-94df-1ca5d5543812	Kupec-write	Kupec - spreminjanje	f
00030000-5548-9701-8681-34e73e8cbd96	NacinPlacina-read	NacinPlacina - branje	f
00030000-5548-9701-842e-804365345bd3	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5548-9701-14ad-c3e30633da6c	Option-read	Option - branje	f
00030000-5548-9701-9c01-7cf6aa02300c	Option-write	Option - spreminjanje	f
00030000-5548-9701-398e-50bb44742a7b	OptionValue-read	OptionValue - branje	f
00030000-5548-9701-ca9b-9e859c4322ab	OptionValue-write	OptionValue - spreminjanje	f
00030000-5548-9701-dd5d-5bc4faf15fd4	Oseba-read	Oseba - branje	f
00030000-5548-9701-36f1-80013fabd59c	Oseba-write	Oseba - spreminjanje	f
00030000-5548-9701-4451-0ae68cb11421	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5548-9701-8f27-79650b125218	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5548-9701-837c-4057c37383a7	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5548-9701-f30c-e6aeb2e13fc6	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5548-9701-3f34-03ee1bb0b3a5	Pogodba-read	Pogodba - branje	f
00030000-5548-9701-9392-461d245348a3	Pogodba-write	Pogodba - spreminjanje	f
00030000-5548-9701-a569-9ccc9188af52	Popa-read	Popa - branje	f
00030000-5548-9701-bb84-aef9cc7b79bc	Popa-write	Popa - spreminjanje	f
00030000-5548-9701-4c1f-66043f9a0e72	Posta-read	Posta - branje	f
00030000-5548-9701-e8ee-f868290131e2	Posta-write	Posta - spreminjanje	f
00030000-5548-9701-4403-c1ceb2ec351f	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5548-9701-7ed3-7dbae0b908b4	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5548-9701-c094-39c438961bea	PostniNaslov-read	PostniNaslov - branje	f
00030000-5548-9701-af0b-d4758ff79a81	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5548-9701-4c4d-4eac37f88e95	Predstava-read	Predstava - branje	f
00030000-5548-9701-6b2f-05dae590b095	Predstava-write	Predstava - spreminjanje	f
00030000-5548-9701-7cfc-d0715add5e1b	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5548-9701-6d1f-dd88d4b8e903	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5548-9701-96f5-ee6eb698a48d	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5548-9701-ae4d-13767a821a40	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5548-9701-72a5-cf74fc6d1f42	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5548-9701-0848-d518f46ec76e	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5548-9701-fc9d-b82db98b5d2b	Prostor-read	Prostor - branje	f
00030000-5548-9701-d811-3fb9f24e13be	Prostor-write	Prostor - spreminjanje	f
00030000-5548-9701-c894-88c9bb2f10dc	Racun-read	Racun - branje	f
00030000-5548-9701-915d-4be41c42b527	Racun-write	Racun - spreminjanje	f
00030000-5548-9701-2a86-e3c647297784	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5548-9701-b3ab-b278b53f2475	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5548-9701-52c5-d6e537f1c3cd	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5548-9701-9a79-bf5156ef8973	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5548-9701-f932-1f9d628540a3	Rekvizit-read	Rekvizit - branje	f
00030000-5548-9701-738a-7076c7dc3ea4	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5548-9701-0edb-9d5237029470	Rezervacija-read	Rezervacija - branje	f
00030000-5548-9701-9348-947588ac5b76	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5548-9701-5019-ecfa94229511	SedezniRed-read	SedezniRed - branje	f
00030000-5548-9701-acb3-c7da7b987c0e	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5548-9701-9cee-d18458363832	Sedez-read	Sedez - branje	f
00030000-5548-9701-aa12-f4ae6357a55c	Sedez-write	Sedez - spreminjanje	f
00030000-5548-9701-ddc1-4cfb7ce729a6	Sezona-read	Sezona - branje	f
00030000-5548-9701-da49-966a9e15f1d4	Sezona-write	Sezona - spreminjanje	f
00030000-5548-9701-3504-d24e8d5acc00	Telefonska-read	Telefonska - branje	f
00030000-5548-9701-8d17-ba6cc22a3a3c	Telefonska-write	Telefonska - spreminjanje	f
00030000-5548-9701-29d8-a27ae8039cf6	TerminStoritve-read	TerminStoritve - branje	f
00030000-5548-9701-7c2c-019b4b717780	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5548-9701-17ec-dd033c0a62b6	TipFunkcije-read	TipFunkcije - branje	f
00030000-5548-9701-a230-945f6f44e76b	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5548-9701-05e5-dbe31401196f	Trr-read	Trr - branje	f
00030000-5548-9701-19fe-de73e42cbdda	Trr-write	Trr - spreminjanje	f
00030000-5548-9701-fc27-ef65fbb9cde8	Uprizoritev-read	Uprizoritev - branje	f
00030000-5548-9701-a248-1eca24660d1c	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5548-9701-db4a-64184f2bc234	Vaja-read	Vaja - branje	f
00030000-5548-9701-2443-8141e857a55e	Vaja-write	Vaja - spreminjanje	f
00030000-5548-9701-d185-17245eaee638	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5548-9701-492d-e12c1386f91f	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5548-9701-2dc7-63b2fd9d0a84	Zaposlitev-read	Zaposlitev - branje	f
00030000-5548-9701-1d8e-df34c2e79b66	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5548-9701-0df6-c67058ca471c	Zasedenost-read	Zasedenost - branje	f
00030000-5548-9701-45e1-9a3befdcfa20	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5548-9701-6aed-125435cb5dfe	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5548-9701-598d-5af280bd64ff	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5548-9701-8048-217dde9d1251	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5548-9701-3a90-0154935c7b3f	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2635 (class 0 OID 2247689)
-- Dependencies: 178
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5548-9701-2120-85295efc6edb	00030000-5548-9701-1631-d41c13756a65
00020000-5548-9701-b9cf-10fcc9716022	00030000-5548-9701-f3fd-5d8202a9738c
00020000-5548-9701-b9cf-10fcc9716022	00030000-5548-9701-1631-d41c13756a65
\.


--
-- TOC entry 2663 (class 0 OID 2247978)
-- Dependencies: 206
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2667 (class 0 OID 2248010)
-- Dependencies: 210
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2678 (class 0 OID 2248122)
-- Dependencies: 221
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 2247747)
-- Dependencies: 183
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 2247789)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5548-9700-07af-ab6aa711e4e3	8341	Adlešiči
00050000-5548-9700-e781-7e4d9d28aaf4	5270	Ajdovščina
00050000-5548-9700-abb0-05d00319eef3	6280	Ankaran/Ancarano
00050000-5548-9700-5851-7367d57d686d	9253	Apače
00050000-5548-9700-7c2d-f81e56490396	8253	Artiče
00050000-5548-9700-d972-9f52d4525dca	4275	Begunje na Gorenjskem
00050000-5548-9700-6dd5-5c91009fe7c9	1382	Begunje pri Cerknici
00050000-5548-9700-7b79-dadaf8d6673c	9231	Beltinci
00050000-5548-9700-59e5-09fb58b4ffb2	2234	Benedikt
00050000-5548-9700-38b2-f597d3625079	2345	Bistrica ob Dravi
00050000-5548-9700-5618-7c1e70514d37	3256	Bistrica ob Sotli
00050000-5548-9700-a958-6f65551ec22f	8259	Bizeljsko
00050000-5548-9700-4ecf-0cdbc7e2f521	1223	Blagovica
00050000-5548-9700-5651-785a4c6c6ffa	8283	Blanca
00050000-5548-9700-0028-796fdbd79483	4260	Bled
00050000-5548-9700-3a38-b9c4c9296473	4273	Blejska Dobrava
00050000-5548-9700-2b1e-af3e3c57b162	9265	Bodonci
00050000-5548-9700-3566-bb1fe612e1c7	9222	Bogojina
00050000-5548-9700-20d3-5e7c5f8f014d	4263	Bohinjska Bela
00050000-5548-9700-79ff-3a612e679c36	4264	Bohinjska Bistrica
00050000-5548-9700-cca4-f5c3ea2b8207	4265	Bohinjsko jezero
00050000-5548-9700-fb0e-039f864c06ce	1353	Borovnica
00050000-5548-9700-277e-f1030b036bf4	8294	Boštanj
00050000-5548-9700-f6dc-3532cca2a8a6	5230	Bovec
00050000-5548-9700-be4e-d4aa6ff9f593	5295	Branik
00050000-5548-9700-c117-e7ad9dec3e35	3314	Braslovče
00050000-5548-9700-0cf5-3f779fc1e064	5223	Breginj
00050000-5548-9700-4e28-bc3302369084	8280	Brestanica
00050000-5548-9700-4904-d2b73373c87c	2354	Bresternica
00050000-5548-9700-19b6-c252c331a938	4243	Brezje
00050000-5548-9700-6f16-cea456fc6f9a	1351	Brezovica pri Ljubljani
00050000-5548-9700-727c-f893b072e227	8250	Brežice
00050000-5548-9700-d448-318125fcab96	4210	Brnik - Aerodrom
00050000-5548-9700-de32-923e3f596230	8321	Brusnice
00050000-5548-9700-f519-ecec0d9c3976	3255	Buče
00050000-5548-9700-812a-2d8e62bf9d9c	8276	Bučka 
00050000-5548-9700-17d7-ef0590ba57ff	9261	Cankova
00050000-5548-9700-6170-3fb64401a55a	3000	Celje 
00050000-5548-9700-1819-0012485250f8	3001	Celje - poštni predali
00050000-5548-9700-cdbe-4d9d55107a80	4207	Cerklje na Gorenjskem
00050000-5548-9700-71a9-50e93c69c136	8263	Cerklje ob Krki
00050000-5548-9700-56de-bd538c21d978	1380	Cerknica
00050000-5548-9700-4cd8-7c27f660b866	5282	Cerkno
00050000-5548-9700-9666-4c076e8068fd	2236	Cerkvenjak
00050000-5548-9700-46bd-e38d4d7a3d9c	2215	Ceršak
00050000-5548-9700-83ed-46c802fff804	2326	Cirkovce
00050000-5548-9700-4b47-84ba757db250	2282	Cirkulane
00050000-5548-9700-e7a5-3b348540f6f2	5273	Col
00050000-5548-9700-1a58-eefb6c9dd67c	8251	Čatež ob Savi
00050000-5548-9700-107b-c134079cf6be	1413	Čemšenik
00050000-5548-9700-605e-d9c738b501a2	5253	Čepovan
00050000-5548-9700-ff30-f3131b072fe5	9232	Črenšovci
00050000-5548-9700-d776-3896a058394b	2393	Črna na Koroškem
00050000-5548-9700-bd9a-75e972ff03f5	6275	Črni Kal
00050000-5548-9700-2264-a4803fe48c0a	5274	Črni Vrh nad Idrijo
00050000-5548-9700-5c93-63d700173e21	5262	Črniče
00050000-5548-9700-c234-3e97df4c5bd8	8340	Črnomelj
00050000-5548-9700-5675-ec3c8e54ee88	6271	Dekani
00050000-5548-9700-32ac-b6df11dd665f	5210	Deskle
00050000-5548-9700-97ee-dbe221941576	2253	Destrnik
00050000-5548-9700-04a0-24e0add14a2e	6215	Divača
00050000-5548-9700-bb63-07312041526f	1233	Dob
00050000-5548-9700-3966-fba463c0c716	3224	Dobje pri Planini
00050000-5548-9700-32d8-d9bfc5bd91ac	8257	Dobova
00050000-5548-9700-ff50-2075a0761bd2	1423	Dobovec
00050000-5548-9700-f36f-45cbbbc400ff	5263	Dobravlje
00050000-5548-9700-b09f-9f5dc28cc08d	3204	Dobrna
00050000-5548-9700-dcfa-1c8af977680e	8211	Dobrnič
00050000-5548-9700-35e7-314cfcaaaf18	1356	Dobrova
00050000-5548-9700-3f03-665c77ef628c	9223	Dobrovnik/Dobronak 
00050000-5548-9700-4e55-f9c33ed91f9c	5212	Dobrovo v Brdih
00050000-5548-9700-6342-ff2b7a349ba6	1431	Dol pri Hrastniku
00050000-5548-9700-b8d8-a7f629002ff9	1262	Dol pri Ljubljani
00050000-5548-9700-73a7-ce10812a2c7d	1273	Dole pri Litiji
00050000-5548-9700-21f1-d940db3eb0dc	1331	Dolenja vas
00050000-5548-9700-d388-8090c44dbcc6	8350	Dolenjske Toplice
00050000-5548-9700-225e-45d39f2329a3	1230	Domžale
00050000-5548-9700-e5af-27423262a4d2	2252	Dornava
00050000-5548-9700-63c6-db8c1879bc6d	5294	Dornberk
00050000-5548-9700-98cd-890c1dbd074f	1319	Draga
00050000-5548-9700-3406-223dbcc6ee4f	8343	Dragatuš
00050000-5548-9700-d633-0f9292ff3afe	3222	Dramlje
00050000-5548-9700-d284-171fb1cdb321	2370	Dravograd
00050000-5548-9700-80e6-61f4b76d4e5a	4203	Duplje
00050000-5548-9700-3eb1-051ea77a1aca	6221	Dutovlje
00050000-5548-9700-a687-866a4beed73f	8361	Dvor
00050000-5548-9700-4505-37c69e9343f5	2343	Fala
00050000-5548-9700-9012-ed66c11b3c64	9208	Fokovci
00050000-5548-9700-5d25-823f6b8835cd	2313	Fram
00050000-5548-9700-18c8-cdf84de0a9f0	3213	Frankolovo
00050000-5548-9700-d5a7-02c9ce2bec4b	1274	Gabrovka
00050000-5548-9700-f3b2-0bc1c55f3275	8254	Globoko
00050000-5548-9700-14b8-77312939a0cb	5275	Godovič
00050000-5548-9700-115c-6f1060aa57ad	4204	Golnik
00050000-5548-9700-b115-702d81ecf988	3303	Gomilsko
00050000-5548-9700-cfcb-0a26e8f5f89f	4224	Gorenja vas
00050000-5548-9700-65ff-ecfa930c8fd6	3263	Gorica pri Slivnici
00050000-5548-9700-fe4e-f14da8359a1e	2272	Gorišnica
00050000-5548-9700-4c7a-ffa8a0f46d8e	9250	Gornja Radgona
00050000-5548-9700-9d4f-b64509b2564a	3342	Gornji Grad
00050000-5548-9700-e285-1ac9dda9c7e0	4282	Gozd Martuljek
00050000-5548-9700-5f34-cd1b8e8792ba	6272	Gračišče
00050000-5548-9700-eb93-942592a5d15b	9264	Grad
00050000-5548-9700-c24c-89f9ea3de6a1	8332	Gradac
00050000-5548-9700-37ff-96e729b0e917	1384	Grahovo
00050000-5548-9700-3e07-1623ff0a5d82	5242	Grahovo ob Bači
00050000-5548-9700-ea19-b5ef68c6da57	5251	Grgar
00050000-5548-9700-a400-a8948d92a383	3302	Griže
00050000-5548-9700-3185-624c6962abea	3231	Grobelno
00050000-5548-9700-13ac-b8af3cccc2ee	1290	Grosuplje
00050000-5548-9700-c25b-2dd6376559b6	2288	Hajdina
00050000-5548-9700-4c7c-4364569bc84e	8362	Hinje
00050000-5548-9700-4914-5f07242cec01	2311	Hoče
00050000-5548-9700-0c77-41b0bfd2af7c	9205	Hodoš/Hodos
00050000-5548-9700-ce5b-1ac359653ff8	1354	Horjul
00050000-5548-9700-1024-81b0caa4b04b	1372	Hotedršica
00050000-5548-9700-c015-23a168d987af	1430	Hrastnik
00050000-5548-9700-1640-2433f3d8347b	6225	Hruševje
00050000-5548-9700-df86-b75017e0c4d0	4276	Hrušica
00050000-5548-9700-8c96-a23d74698d45	5280	Idrija
00050000-5548-9700-64ea-e5990c8b1936	1292	Ig
00050000-5548-9700-ab64-44fdb9156c05	6250	Ilirska Bistrica
00050000-5548-9700-f928-cb65aa6b72b1	6251	Ilirska Bistrica-Trnovo
00050000-5548-9700-d225-e2b7ca601213	1295	Ivančna Gorica
00050000-5548-9700-a854-fbcf72d44aad	2259	Ivanjkovci
00050000-5548-9700-9f76-c2deae8dc238	1411	Izlake
00050000-5548-9700-3289-a9757619e63d	6310	Izola/Isola
00050000-5548-9700-5b73-72e9c38b291a	2222	Jakobski Dol
00050000-5548-9700-b96a-8ca68f9b0a0b	2221	Jarenina
00050000-5548-9700-0df8-009d6886ddfd	6254	Jelšane
00050000-5548-9700-d7d2-f246b954767a	4270	Jesenice
00050000-5548-9700-7770-1c47162b58e7	8261	Jesenice na Dolenjskem
00050000-5548-9700-8af5-b1696a994114	3273	Jurklošter
00050000-5548-9700-9406-07d296074fd4	2223	Jurovski Dol
00050000-5548-9700-efbb-ad0738bd7bca	2256	Juršinci
00050000-5548-9700-1d53-0f6e43f59a91	5214	Kal nad Kanalom
00050000-5548-9700-3cba-066b299f57f7	3233	Kalobje
00050000-5548-9700-07a2-f2ce04581e88	4246	Kamna Gorica
00050000-5548-9700-0905-602ed0ec14b1	2351	Kamnica
00050000-5548-9700-5a06-1c8a54d33d84	1241	Kamnik
00050000-5548-9700-0790-1869bef56d9c	5213	Kanal
00050000-5548-9700-4b66-3210997e332e	8258	Kapele
00050000-5548-9700-6e85-90df4481cf6d	2362	Kapla
00050000-5548-9700-e162-4d1fd03be16d	2325	Kidričevo
00050000-5548-9700-755b-8a5a8cdae4c7	1412	Kisovec
00050000-5548-9700-34c9-3315c966bd2a	6253	Knežak
00050000-5548-9700-13d1-b3bb524bc8a4	5222	Kobarid
00050000-5548-9700-c8c7-a02c0b1f1b26	9227	Kobilje
00050000-5548-9700-861c-fdf6b75f7607	1330	Kočevje
00050000-5548-9700-9648-789742ef2708	1338	Kočevska Reka
00050000-5548-9700-e563-dc8ff9f52cc1	2276	Kog
00050000-5548-9700-0e1a-62174397dd49	5211	Kojsko
00050000-5548-9700-c8d4-22b2e44717d4	6223	Komen
00050000-5548-9700-4746-cac39bb9013e	1218	Komenda
00050000-5548-9700-dd54-666bcc2678b5	6000	Koper/Capodistria 
00050000-5548-9700-d454-f89531df7a7a	6001	Koper/Capodistria - poštni predali
00050000-5548-9700-075a-07e59761cd6c	8282	Koprivnica
00050000-5548-9700-c864-addd1606897d	5296	Kostanjevica na Krasu
00050000-5548-9700-4224-6e314c74d804	8311	Kostanjevica na Krki
00050000-5548-9700-320b-aa0e5e713f37	1336	Kostel
00050000-5548-9700-fa37-383d1ab643b2	6256	Košana
00050000-5548-9700-5167-488f1c8e3966	2394	Kotlje
00050000-5548-9700-8853-55e62ae63841	6240	Kozina
00050000-5548-9700-3b32-e8fd00505b2f	3260	Kozje
00050000-5548-9700-70d5-799a62e8823d	4000	Kranj 
00050000-5548-9700-007c-ffb3f432fae2	4001	Kranj - poštni predali
00050000-5548-9700-0fc9-a2ddb674157f	4280	Kranjska Gora
00050000-5548-9700-62a8-ca8198f02c11	1281	Kresnice
00050000-5548-9700-abfd-cbb2974e2ffe	4294	Križe
00050000-5548-9700-aa14-54955476826f	9206	Križevci
00050000-5548-9700-076d-29997af05997	9242	Križevci pri Ljutomeru
00050000-5548-9700-40f6-7a778b2fa9cd	1301	Krka
00050000-5548-9700-accc-f6b0859cdec8	8296	Krmelj
00050000-5548-9700-c8bc-36865fb9ba00	4245	Kropa
00050000-5548-9700-3541-2a6871e4a3ff	8262	Krška vas
00050000-5548-9700-4c3e-57e944121ef3	8270	Krško
00050000-5548-9700-bd46-dce0e016fae0	9263	Kuzma
00050000-5548-9700-482e-d8a817dc5005	2318	Laporje
00050000-5548-9700-7175-f2b575371bb2	3270	Laško
00050000-5548-9700-99bf-67950f96ccb6	1219	Laze v Tuhinju
00050000-5548-9700-d266-11d33bba7d49	2230	Lenart v Slovenskih goricah
00050000-5548-9700-1836-8d6bb0d6089a	9220	Lendava/Lendva
00050000-5548-9700-30e8-c19ae7fe4c6d	4248	Lesce
00050000-5548-9700-7df5-cb69acaaa5c7	3261	Lesično
00050000-5548-9700-96ef-5fcd97c9baef	8273	Leskovec pri Krškem
00050000-5548-9700-1ae3-256a306a561a	2372	Libeliče
00050000-5548-9700-9ccc-397d28e533f5	2341	Limbuš
00050000-5548-9700-3b05-4de66e870f15	1270	Litija
00050000-5548-9700-1cba-66f330b2dce9	3202	Ljubečna
00050000-5548-9700-b0a0-7c6316e292b1	1000	Ljubljana 
00050000-5548-9700-d939-4fd43e3af212	1001	Ljubljana - poštni predali
00050000-5548-9700-7699-7c6832e44124	1231	Ljubljana - Črnuče
00050000-5548-9700-cc39-e5c075d1922c	1261	Ljubljana - Dobrunje
00050000-5548-9700-a980-3b427cbe6264	1260	Ljubljana - Polje
00050000-5548-9700-3874-5f4279e7e5fc	1210	Ljubljana - Šentvid
00050000-5548-9700-28a7-e1843356a84d	1211	Ljubljana - Šmartno
00050000-5548-9700-440f-c1ae62a256d6	3333	Ljubno ob Savinji
00050000-5548-9700-0baa-9834567682cc	9240	Ljutomer
00050000-5548-9700-e63a-ce01e075bd84	3215	Loče
00050000-5548-9700-70fc-1e3cd5858713	5231	Log pod Mangartom
00050000-5548-9700-0abf-c42d1bf369cb	1358	Log pri Brezovici
00050000-5548-9700-803a-5b368595ef29	1370	Logatec
00050000-5548-9700-4137-042399cbf3be	1371	Logatec
00050000-5548-9700-bf0d-91582c9b7a9c	1434	Loka pri Zidanem Mostu
00050000-5548-9700-f256-9411cf1d60ac	3223	Loka pri Žusmu
00050000-5548-9700-d04e-b7f1ceb8f6b9	6219	Lokev
00050000-5548-9700-366d-918311f479d6	1318	Loški Potok
00050000-5548-9700-cecb-4ec61b385558	2324	Lovrenc na Dravskem polju
00050000-5548-9700-738e-3b7ea9301c92	2344	Lovrenc na Pohorju
00050000-5548-9700-875b-415ff659a032	3334	Luče
00050000-5548-9700-d9ee-4ce09cbc3eac	1225	Lukovica
00050000-5548-9700-ae02-cae86b14ce3f	9202	Mačkovci
00050000-5548-9700-ba35-306fbef83235	2322	Majšperk
00050000-5548-9700-c4a3-3e2331d87a90	2321	Makole
00050000-5548-9700-8df4-bf76e074d468	9243	Mala Nedelja
00050000-5548-9700-47a5-cbe95b9c6a93	2229	Malečnik
00050000-5548-9700-e108-ec31d7643bf5	6273	Marezige
00050000-5548-9700-9811-b41dea8c8b67	2000	Maribor 
00050000-5548-9700-31f9-ed3ee4946d7b	2001	Maribor - poštni predali
00050000-5548-9700-7979-0f442b7fc1d3	2206	Marjeta na Dravskem polju
00050000-5548-9700-8771-133daaeacfd0	2281	Markovci
00050000-5548-9700-f01b-ef47ffd28256	9221	Martjanci
00050000-5548-9700-51ed-981e8518b86c	6242	Materija
00050000-5548-9700-5d02-6de845b5e430	4211	Mavčiče
00050000-5548-9700-ccf7-d9b8315cbac2	1215	Medvode
00050000-5548-9700-8512-8728bd28dfbf	1234	Mengeš
00050000-5548-9700-4f3f-466a5e1139f6	8330	Metlika
00050000-5548-9700-e686-28ee14da2430	2392	Mežica
00050000-5548-9700-b1b8-968d3970f37f	2204	Miklavž na Dravskem polju
00050000-5548-9700-1d92-4b5a15e581b4	2275	Miklavž pri Ormožu
00050000-5548-9700-4034-f7b5fd2deb4f	5291	Miren
00050000-5548-9700-069c-ab78ea17d6e6	8233	Mirna
00050000-5548-9700-81b6-a73afe5def63	8216	Mirna Peč
00050000-5548-9700-35b1-6764c2e28a46	2382	Mislinja
00050000-5548-9700-e7be-dffa71de5bcd	4281	Mojstrana
00050000-5548-9700-34bb-e584196b183c	8230	Mokronog
00050000-5548-9700-70c9-927d14804621	1251	Moravče
00050000-5548-9700-0b29-b330207b28bf	9226	Moravske Toplice
00050000-5548-9700-38ed-95018e017f6c	5216	Most na Soči
00050000-5548-9700-884d-9ccb133a9bdf	1221	Motnik
00050000-5548-9700-d1d8-265b86b0e7a4	3330	Mozirje
00050000-5548-9700-324f-5e8f3498a09e	9000	Murska Sobota 
00050000-5548-9700-9455-18c4d9b07996	9001	Murska Sobota - poštni predali
00050000-5548-9700-3326-3b00db4788f8	2366	Muta
00050000-5548-9700-bd55-2a0f285c04ea	4202	Naklo
00050000-5548-9700-c003-32eaafaeac3a	3331	Nazarje
00050000-5548-9700-19c6-bde23fe92221	1357	Notranje Gorice
00050000-5548-9700-2a74-913ec18ffa64	3203	Nova Cerkev
00050000-5548-9700-5e79-ef86fa467249	5000	Nova Gorica 
00050000-5548-9700-6dac-37b47c3c9934	5001	Nova Gorica - poštni predali
00050000-5548-9700-bddb-e545a76ce64c	1385	Nova vas
00050000-5548-9700-dbbe-8ad6044d9bf4	8000	Novo mesto
00050000-5548-9700-6fd3-f47b20b0969f	8001	Novo mesto - poštni predali
00050000-5548-9700-55ff-480692e00d18	6243	Obrov
00050000-5548-9700-a08e-c0072a96ba89	9233	Odranci
00050000-5548-9700-40c1-d3347110318e	2317	Oplotnica
00050000-5548-9700-2c78-56f44df68588	2312	Orehova vas
00050000-5548-9700-84c7-5ac7dd78c044	2270	Ormož
00050000-5548-9700-0751-a2c1fe2ce6a0	1316	Ortnek
00050000-5548-9700-197c-212f3dbc8acc	1337	Osilnica
00050000-5548-9700-6ba5-6713c8c66d92	8222	Otočec
00050000-5548-9700-a220-872e47caf184	2361	Ožbalt
00050000-5548-9700-f2ed-4b5840bfa14e	2231	Pernica
00050000-5548-9700-ec4c-6c7501c42645	2211	Pesnica pri Mariboru
00050000-5548-9700-1974-e252bfb9f414	9203	Petrovci
00050000-5548-9700-8121-a55558f561f6	3301	Petrovče
00050000-5548-9700-5a69-deb701db1a92	6330	Piran/Pirano
00050000-5548-9700-7a12-a98fdec5751f	8255	Pišece
00050000-5548-9700-c2f4-5caa7b9e9fa6	6257	Pivka
00050000-5548-9700-dd9b-74d3919fe9b3	6232	Planina
00050000-5548-9700-0b67-1f664280f244	3225	Planina pri Sevnici
00050000-5548-9700-52c6-48b94fec0ccf	6276	Pobegi
00050000-5548-9700-419c-048f3a1c5455	8312	Podbočje
00050000-5548-9700-c2b7-92bd69a33be2	5243	Podbrdo
00050000-5548-9700-7276-d42485db0917	3254	Podčetrtek
00050000-5548-9700-a88c-db2ffc8e88c5	2273	Podgorci
00050000-5548-9700-b824-dd34eb839d1d	6216	Podgorje
00050000-5548-9700-31e3-90317b323819	2381	Podgorje pri Slovenj Gradcu
00050000-5548-9700-f068-903a58966206	6244	Podgrad
00050000-5548-9700-3377-2b7dafbd268d	1414	Podkum
00050000-5548-9700-b834-144f7e5cf646	2286	Podlehnik
00050000-5548-9700-925a-f670e50fbfda	5272	Podnanos
00050000-5548-9700-9ce5-9fa1e107bfcc	4244	Podnart
00050000-5548-9700-8af8-7dc264a425aa	3241	Podplat
00050000-5548-9700-70f8-b4249ed7a730	3257	Podsreda
00050000-5548-9700-d160-adeeb3d6f44d	2363	Podvelka
00050000-5548-9700-3b73-b16ac222590b	2208	Pohorje
00050000-5548-9700-d65c-7970b62e609c	2257	Polenšak
00050000-5548-9700-94ba-634778a60af2	1355	Polhov Gradec
00050000-5548-9700-b0d6-79ce94bf59cd	4223	Poljane nad Škofjo Loko
00050000-5548-9700-5cd0-3157704587b0	2319	Poljčane
00050000-5548-9700-ab60-47e47b5f86a5	1272	Polšnik
00050000-5548-9700-4470-cd2ff358a34d	3313	Polzela
00050000-5548-9700-4e51-7b98c621dbb1	3232	Ponikva
00050000-5548-9700-92f5-89982a1380d8	6320	Portorož/Portorose
00050000-5548-9700-9f88-11df684cda89	6230	Postojna
00050000-5548-9700-a3e8-9fb15c3312e6	2331	Pragersko
00050000-5548-9700-a6d0-7511421e4456	3312	Prebold
00050000-5548-9700-846b-434838e558a0	4205	Preddvor
00050000-5548-9700-887d-4a015ff484bc	6255	Prem
00050000-5548-9700-6f39-4f3b2a85db02	1352	Preserje
00050000-5548-9700-192f-02b905d323fa	6258	Prestranek
00050000-5548-9700-fe41-7650e61c8df5	2391	Prevalje
00050000-5548-9700-8c41-ff41dc05fdd9	3262	Prevorje
00050000-5548-9700-d73d-f888b08e3ba1	1276	Primskovo 
00050000-5548-9700-b6d3-98ec9f7e2c8f	3253	Pristava pri Mestinju
00050000-5548-9700-15d6-4afee52cf52f	9207	Prosenjakovci/Partosfalva
00050000-5548-9700-3f2c-1d2d47faae31	5297	Prvačina
00050000-5548-9700-1a74-bcb21779b0a3	2250	Ptuj
00050000-5548-9700-6b52-b220bc774650	2323	Ptujska Gora
00050000-5548-9700-de57-4db9d8c359f2	9201	Puconci
00050000-5548-9700-0a53-953751112839	2327	Rače
00050000-5548-9700-82c1-bcf6e9740feb	1433	Radeče
00050000-5548-9700-9ef6-7e323a89d605	9252	Radenci
00050000-5548-9700-87ad-716603db8ec5	2360	Radlje ob Dravi
00050000-5548-9700-5b2b-b2a52f5c3c24	1235	Radomlje
00050000-5548-9700-c759-4aac6e05388d	4240	Radovljica
00050000-5548-9700-a6c1-742691695139	8274	Raka
00050000-5548-9700-fd3b-f17d0d0c653d	1381	Rakek
00050000-5548-9700-ae69-0f9eb56b3c93	4283	Rateče - Planica
00050000-5548-9700-735f-a8c80cd75182	2390	Ravne na Koroškem
00050000-5548-9700-6f12-60595e17e4fd	9246	Razkrižje
00050000-5548-9700-3f6e-216d0d160f1a	3332	Rečica ob Savinji
00050000-5548-9700-7b00-12b03823161d	5292	Renče
00050000-5548-9700-dd32-3b74a73d8123	1310	Ribnica
00050000-5548-9700-7953-290f7dbc94f3	2364	Ribnica na Pohorju
00050000-5548-9700-aa53-f825643c438f	3272	Rimske Toplice
00050000-5548-9700-52be-a6f10ec24a80	1314	Rob
00050000-5548-9700-f467-83df1923f363	5215	Ročinj
00050000-5548-9700-e7ff-71fcc7390403	3250	Rogaška Slatina
00050000-5548-9700-1b14-9bdc3b8ae584	9262	Rogašovci
00050000-5548-9700-a9f6-2866efa1e298	3252	Rogatec
00050000-5548-9700-a3ed-093e8e866d61	1373	Rovte
00050000-5548-9700-3bb4-a7f1934a9fdd	2342	Ruše
00050000-5548-9700-6c01-7512ec349082	1282	Sava
00050000-5548-9700-e746-c91adb244464	6333	Sečovlje/Sicciole
00050000-5548-9700-7124-a9791c0c9560	4227	Selca
00050000-5548-9700-cc2b-b1e9c46f3179	2352	Selnica ob Dravi
00050000-5548-9700-ff69-ebd6ca06ee0e	8333	Semič
00050000-5548-9700-d112-da54a87555e2	8281	Senovo
00050000-5548-9700-6f63-5c39e324a394	6224	Senožeče
00050000-5548-9700-0ee9-450f9e56b9de	8290	Sevnica
00050000-5548-9700-2db8-d91629c8e5bd	6210	Sežana
00050000-5548-9700-db41-ba7edbe1e026	2214	Sladki Vrh
00050000-5548-9700-d763-dcd96c238cb8	5283	Slap ob Idrijci
00050000-5548-9700-0c61-835eba3ee5e7	2380	Slovenj Gradec
00050000-5548-9700-f266-d60bcea62c08	2310	Slovenska Bistrica
00050000-5548-9700-1e00-f9a7c5357b6c	3210	Slovenske Konjice
00050000-5548-9700-351e-7b8e51e60c89	1216	Smlednik
00050000-5548-9700-1132-641270cd2670	5232	Soča
00050000-5548-9700-6625-f0469595a31e	1317	Sodražica
00050000-5548-9700-8fa9-a3d07bf99564	3335	Solčava
00050000-5548-9700-09f6-0a8055dd21e3	5250	Solkan
00050000-5548-9700-4ae8-c28c65da49d8	4229	Sorica
00050000-5548-9700-06c4-5b6d078e4d60	4225	Sovodenj
00050000-5548-9700-4853-7db960976fb5	5281	Spodnja Idrija
00050000-5548-9700-604e-32d19e7fa311	2241	Spodnji Duplek
00050000-5548-9700-ddc9-d07a7d152a09	9245	Spodnji Ivanjci
00050000-5548-9700-e949-ba82f495b1bc	2277	Središče ob Dravi
00050000-5548-9700-982d-26dc343943c9	4267	Srednja vas v Bohinju
00050000-5548-9700-62c4-70ce116a8be7	8256	Sromlje 
00050000-5548-9700-6268-018f29299fe6	5224	Srpenica
00050000-5548-9700-7146-ad95558b6260	1242	Stahovica
00050000-5548-9700-ba3e-e69822a781b4	1332	Stara Cerkev
00050000-5548-9700-5c0d-4d447a4c28ce	8342	Stari trg ob Kolpi
00050000-5548-9700-3bc0-8044da69008e	1386	Stari trg pri Ložu
00050000-5548-9700-ad9e-ae0386f9c0a0	2205	Starše
00050000-5548-9700-8d56-3c6696699795	2289	Stoperce
00050000-5548-9700-0064-0b48602c248a	8322	Stopiče
00050000-5548-9700-baa1-582bd86ac48e	3206	Stranice
00050000-5548-9700-960e-8f67b325c92a	8351	Straža
00050000-5548-9700-3840-738862763c63	1313	Struge
00050000-5548-9700-85ca-e564398eb1ea	8293	Studenec
00050000-5548-9700-c3f4-dae9fb702af9	8331	Suhor
00050000-5548-9700-883a-76e5bb2b3124	2233	Sv. Ana v Slovenskih goricah
00050000-5548-9700-eb1a-1f79ffe0be41	2235	Sv. Trojica v Slovenskih goricah
00050000-5548-9700-8dfe-f6440e792cd3	2353	Sveti Duh na Ostrem Vrhu
00050000-5548-9700-8ee8-2abbe0706119	9244	Sveti Jurij ob Ščavnici
00050000-5548-9700-3107-9391a8d4b887	3264	Sveti Štefan
00050000-5548-9700-83bc-48dd6f300a68	2258	Sveti Tomaž
00050000-5548-9700-95ce-e19ea6bb83ab	9204	Šalovci
00050000-5548-9700-f1a1-6589f39b6047	5261	Šempas
00050000-5548-9700-1e83-f0d78f868144	5290	Šempeter pri Gorici
00050000-5548-9700-1c34-589cabf2cfd0	3311	Šempeter v Savinjski dolini
00050000-5548-9700-00dd-1b4f96fd0db1	4208	Šenčur
00050000-5548-9700-6737-53ad15c36241	2212	Šentilj v Slovenskih goricah
00050000-5548-9700-d4c6-602566759733	8297	Šentjanž
00050000-5548-9700-fe2d-485d41610684	2373	Šentjanž pri Dravogradu
00050000-5548-9700-fc80-dc69a1a8828d	8310	Šentjernej
00050000-5548-9700-3602-4b5a706b89d0	3230	Šentjur
00050000-5548-9700-3f27-09c4304b7eee	3271	Šentrupert
00050000-5548-9700-fbb0-92ae9ba05813	8232	Šentrupert
00050000-5548-9700-4962-cd806736fe91	1296	Šentvid pri Stični
00050000-5548-9700-3ebb-a3b4a8587700	8275	Škocjan
00050000-5548-9700-10f6-c07a65729169	6281	Škofije
00050000-5548-9700-6211-96a79fd3bf23	4220	Škofja Loka
00050000-5548-9700-4b03-7b008b83cf63	3211	Škofja vas
00050000-5548-9700-76e8-94a47a4e0c2e	1291	Škofljica
00050000-5548-9700-ecf3-c7d9cf541e5e	6274	Šmarje
00050000-5548-9700-cd40-93fa39d6cab7	1293	Šmarje - Sap
00050000-5548-9700-27f4-df381d60b78b	3240	Šmarje pri Jelšah
00050000-5548-9700-d3e0-618ecd495bba	8220	Šmarješke Toplice
00050000-5548-9700-2617-645c7e3489ad	2315	Šmartno na Pohorju
00050000-5548-9700-e1d9-4c959524dcf0	3341	Šmartno ob Dreti
00050000-5548-9700-bd25-100da29ce909	3327	Šmartno ob Paki
00050000-5548-9700-e31c-f6e5372c0c70	1275	Šmartno pri Litiji
00050000-5548-9700-ea6d-561a4abb2a12	2383	Šmartno pri Slovenj Gradcu
00050000-5548-9700-3aee-c0f75cfc06d6	3201	Šmartno v Rožni dolini
00050000-5548-9700-ec1f-34f60f36aa59	3325	Šoštanj
00050000-5548-9700-895f-e092addfe3dd	6222	Štanjel
00050000-5548-9700-ccca-a0107c6372ae	3220	Štore
00050000-5548-9700-980a-3be276d8797b	3304	Tabor
00050000-5548-9700-d259-c4b116c736de	3221	Teharje
00050000-5548-9700-cbfc-1379205f6146	9251	Tišina
00050000-5548-9700-69ac-2193dd681ea9	5220	Tolmin
00050000-5548-9700-65e3-de5f5a7da0b6	3326	Topolšica
00050000-5548-9700-2060-d39006e5ae0d	2371	Trbonje
00050000-5548-9700-a429-ebb8e60863cc	1420	Trbovlje
00050000-5548-9700-9a0f-a2170b9ee1ac	8231	Trebelno 
00050000-5548-9700-d067-406642a57fc9	8210	Trebnje
00050000-5548-9700-8b69-e0b2acc92145	5252	Trnovo pri Gorici
00050000-5548-9700-cc90-987efa9814d3	2254	Trnovska vas
00050000-5548-9700-c121-ec1f64607468	1222	Trojane
00050000-5548-9700-c624-ab8a316a6d75	1236	Trzin
00050000-5548-9700-1f7c-da085d97a2da	4290	Tržič
00050000-5548-9700-80a4-2051f8f18dd8	8295	Tržišče
00050000-5548-9700-7005-0bb57240b4e7	1311	Turjak
00050000-5548-9700-2b62-a2baadba76ff	9224	Turnišče
00050000-5548-9700-c023-575bf3d51439	8323	Uršna sela
00050000-5548-9700-f0dc-078958643fb7	1252	Vače
00050000-5548-9700-c1d7-c80b564fe71b	3320	Velenje 
00050000-5548-9700-b119-c7969a075bb9	3322	Velenje - poštni predali
00050000-5548-9700-7d66-155f63a4028c	8212	Velika Loka
00050000-5548-9700-09e5-d9a330ae555c	2274	Velika Nedelja
00050000-5548-9700-9dc2-992f25e66e9a	9225	Velika Polana
00050000-5548-9700-dd50-c498ea1c0d07	1315	Velike Lašče
00050000-5548-9700-959c-cd398a289339	8213	Veliki Gaber
00050000-5548-9700-f120-1a653c0cec44	9241	Veržej
00050000-5548-9700-8fda-c31375e3222c	1312	Videm - Dobrepolje
00050000-5548-9700-0a30-5dba4a0b629e	2284	Videm pri Ptuju
00050000-5548-9700-3dc6-c14446d65033	8344	Vinica
00050000-5548-9700-13c9-0eaa9a547910	5271	Vipava
00050000-5548-9700-a48b-d84b91c494b4	4212	Visoko
00050000-5548-9700-ecc4-f464c7239e83	1294	Višnja Gora
00050000-5548-9700-40a9-dbd7e16a669b	3205	Vitanje
00050000-5548-9700-76dd-667c1aa2e96d	2255	Vitomarci
00050000-5548-9700-0264-bc5dc9f15f8c	1217	Vodice
00050000-5548-9700-f58c-31e6eb132c84	3212	Vojnik\t
00050000-5548-9700-6864-024ae7ab5795	5293	Volčja Draga
00050000-5548-9700-2989-acd431c3f5b4	2232	Voličina
00050000-5548-9700-5d64-05e2a5f05d12	3305	Vransko
00050000-5548-9700-ea5e-700a15109089	6217	Vremski Britof
00050000-5548-9700-03c8-fd5438ef5e07	1360	Vrhnika
00050000-5548-9700-b9d3-ac831ab97a3f	2365	Vuhred
00050000-5548-9700-2837-5f855d5f9b93	2367	Vuzenica
00050000-5548-9700-2d91-b8257fc4e04a	8292	Zabukovje 
00050000-5548-9700-40f7-8b73cabd423a	1410	Zagorje ob Savi
00050000-5548-9700-48e6-3822e346f9c6	1303	Zagradec
00050000-5548-9700-bc2b-75a59c0758bd	2283	Zavrč
00050000-5548-9700-81c5-828053208d0c	8272	Zdole 
00050000-5548-9700-7727-eb1a9aa396cc	4201	Zgornja Besnica
00050000-5548-9700-d235-7cd8ee9a411b	2242	Zgornja Korena
00050000-5548-9700-47b7-27aba43570c7	2201	Zgornja Kungota
00050000-5548-9700-0c51-05130f554074	2316	Zgornja Ložnica
00050000-5548-9700-7d77-8faea2594927	2314	Zgornja Polskava
00050000-5548-9700-aebe-c48c7f58ead8	2213	Zgornja Velka
00050000-5548-9700-e239-b1938c63853d	4247	Zgornje Gorje
00050000-5548-9700-126c-0c4ef2219968	4206	Zgornje Jezersko
00050000-5548-9700-d163-3d0dcc9e77f1	2285	Zgornji Leskovec
00050000-5548-9700-76b8-d4ac2cf81140	1432	Zidani Most
00050000-5548-9700-f066-74734bf6b9dd	3214	Zreče
00050000-5548-9700-a85f-46eac76f8897	4209	Žabnica
00050000-5548-9700-c41a-2798b27d0de9	3310	Žalec
00050000-5548-9700-1a2b-dbe3660accfa	4228	Železniki
00050000-5548-9700-3032-67617c2c845a	2287	Žetale
00050000-5548-9700-67fe-377882b3025d	4226	Žiri
00050000-5548-9700-5927-3b79dcbf9b7a	4274	Žirovnica
00050000-5548-9700-c79d-634ae5709a97	8360	Žužemberk
\.


--
-- TOC entry 2659 (class 0 OID 2247952)
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
-- TOC entry 2642 (class 0 OID 2247774)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, popa_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 2247841)
-- Dependencies: 190
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2661 (class 0 OID 2247964)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2673 (class 0 OID 2248071)
-- Dependencies: 216
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2677 (class 0 OID 2248115)
-- Dependencies: 220
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2665 (class 0 OID 2247994)
-- Dependencies: 208
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2657 (class 0 OID 2247937)
-- Dependencies: 200
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2656 (class 0 OID 2247927)
-- Dependencies: 199
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2676 (class 0 OID 2248105)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2672 (class 0 OID 2248061)
-- Dependencies: 215
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 2247640)
-- Dependencies: 173
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5548-9701-5c82-48a3fa911882	00010000-5548-9701-f6c7-0a02f928d63c	2015-05-05 12:10:09	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROQI4x/UNUGL7WXJWS.j...OGO.4yDtvS";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2691 (class 0 OID 0)
-- Dependencies: 172
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2666 (class 0 OID 2248003)
-- Dependencies: 209
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 2247680)
-- Dependencies: 177
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5548-9701-6daf-f4555c1e5c83	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5548-9701-6f1b-1501ad238df9	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5548-9701-2120-85295efc6edb	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5548-9701-2294-8887d74cc70f	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5548-9701-a972-516762027ab7	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5548-9701-b9cf-10fcc9716022	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2632 (class 0 OID 2247663)
-- Dependencies: 175
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5548-9701-5c82-48a3fa911882	00020000-5548-9701-2294-8887d74cc70f
00010000-5548-9701-f6c7-0a02f928d63c	00020000-5548-9701-2294-8887d74cc70f
\.


--
-- TOC entry 2668 (class 0 OID 2248018)
-- Dependencies: 211
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 2247958)
-- Dependencies: 203
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2654 (class 0 OID 2247908)
-- Dependencies: 197
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2639 (class 0 OID 2247739)
-- Dependencies: 182
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2655 (class 0 OID 2247914)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2675 (class 0 OID 2248096)
-- Dependencies: 218
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 2247809)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 2247649)
-- Dependencies: 174
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5548-9701-f6c7-0a02f928d63c	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRON8m3i23cUbiuecuxewBKdWN7k9ZMKFS	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5548-9701-5c82-48a3fa911882	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2680 (class 0 OID 2248146)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 2247856)
-- Dependencies: 192
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2664 (class 0 OID 2247985)
-- Dependencies: 207
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2671 (class 0 OID 2248053)
-- Dependencies: 214
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2651 (class 0 OID 2247884)
-- Dependencies: 194
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2679 (class 0 OID 2248136)
-- Dependencies: 222
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2670 (class 0 OID 2248043)
-- Dependencies: 213
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2275 (class 2606 OID 2247704)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 2248185)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 2248178)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 2248095)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 2247874)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 2247907)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2311 (class 2606 OID 2247835)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 2248039)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2322 (class 2606 OID 2247854)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 2247901)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2248 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2365 (class 2606 OID 2247950)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 2247977)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 2247807)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2279 (class 2606 OID 2247713)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 2247771)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2281 (class 2606 OID 2247737)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2273 (class 2606 OID 2247693)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2265 (class 2606 OID 2247678)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 2247983)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 2248017)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 2248132)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 2247764)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2301 (class 2606 OID 2247795)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 2247956)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2254 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 2247785)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2320 (class 2606 OID 2247845)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 2247968)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 2248077)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 2248120)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 2248001)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 2247941)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 2247932)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 2248114)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 2248068)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2256 (class 2606 OID 2247648)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 2248007)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2263 (class 2606 OID 2247667)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2268 (class 2606 OID 2247687)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 2248026)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 2247963)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 2247913)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2286 (class 2606 OID 2247744)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2351 (class 2606 OID 2247923)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 2248104)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2309 (class 2606 OID 2247820)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2259 (class 2606 OID 2247661)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 2248160)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 2247860)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 2247991)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 2248059)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 2247896)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 2248145)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 2248052)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 1259 OID 2247881)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2287 (class 1259 OID 2247766)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2250 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2251 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2252 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2378 (class 1259 OID 2247984)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2372 (class 1259 OID 2247970)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2373 (class 1259 OID 2247969)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2324 (class 1259 OID 2247861)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2399 (class 1259 OID 2248042)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2400 (class 1259 OID 2248040)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2401 (class 1259 OID 2248041)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2424 (class 1259 OID 2248133)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2425 (class 1259 OID 2248134)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2426 (class 1259 OID 2248135)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2431 (class 1259 OID 2248163)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2432 (class 1259 OID 2248162)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2433 (class 1259 OID 2248161)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2306 (class 1259 OID 2247822)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2307 (class 1259 OID 2247821)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2291 (class 1259 OID 2247773)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2292 (class 1259 OID 2247772)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 2248008)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2342 (class 1259 OID 2247902)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2270 (class 1259 OID 2247694)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2271 (class 1259 OID 2247695)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2392 (class 1259 OID 2248029)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2393 (class 1259 OID 2248028)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2394 (class 1259 OID 2248027)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2316 (class 1259 OID 2247846)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2317 (class 1259 OID 2247848)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2318 (class 1259 OID 2247847)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2352 (class 1259 OID 2247936)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2353 (class 1259 OID 2247934)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2354 (class 1259 OID 2247933)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2355 (class 1259 OID 2247935)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2260 (class 1259 OID 2247668)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2261 (class 1259 OID 2247669)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2381 (class 1259 OID 2247992)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2367 (class 1259 OID 2247957)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2407 (class 1259 OID 2248069)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2408 (class 1259 OID 2248070)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2295 (class 1259 OID 2247787)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2296 (class 1259 OID 2247786)
-- Name: idx_89c1f9d26beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d26beede51 ON postninaslovi USING btree (popa_id);


--
-- TOC entry 2297 (class 1259 OID 2247788)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2411 (class 1259 OID 2248078)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2412 (class 1259 OID 2248079)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2442 (class 1259 OID 2248188)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2443 (class 1259 OID 2248187)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2444 (class 1259 OID 2248190)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2445 (class 1259 OID 2248186)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2446 (class 1259 OID 2248189)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2404 (class 1259 OID 2248060)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2358 (class 1259 OID 2247945)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2359 (class 1259 OID 2247944)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2360 (class 1259 OID 2247942)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2361 (class 1259 OID 2247943)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2246 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2438 (class 1259 OID 2248180)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 2248179)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2323 (class 1259 OID 2247855)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2276 (class 1259 OID 2247715)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2277 (class 1259 OID 2247714)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2283 (class 1259 OID 2247745)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2284 (class 1259 OID 2247746)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2347 (class 1259 OID 2247926)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2348 (class 1259 OID 2247925)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2349 (class 1259 OID 2247924)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2330 (class 1259 OID 2247883)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2331 (class 1259 OID 2247879)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2332 (class 1259 OID 2247876)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2333 (class 1259 OID 2247877)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2334 (class 1259 OID 2247875)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2335 (class 1259 OID 2247880)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2336 (class 1259 OID 2247878)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2290 (class 1259 OID 2247765)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2312 (class 1259 OID 2247836)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2313 (class 1259 OID 2247838)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2314 (class 1259 OID 2247837)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2315 (class 1259 OID 2247839)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2366 (class 1259 OID 2247951)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2282 (class 1259 OID 2247738)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2305 (class 1259 OID 2247808)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2257 (class 1259 OID 2247662)
-- Name: uniq_7fb775b7e7927c74; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7e7927c74 ON uporabniki USING btree (email);


--
-- TOC entry 2386 (class 1259 OID 2248002)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2266 (class 1259 OID 2247679)
-- Name: uniq_af14917a5e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_af14917a5e237e06 ON permission USING btree (name);


--
-- TOC entry 2249 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 2247796)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2423 (class 1259 OID 2248121)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2269 (class 1259 OID 2247688)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2337 (class 1259 OID 2247882)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2471 (class 2606 OID 2248321)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2474 (class 2606 OID 2248306)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2473 (class 2606 OID 2248311)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2469 (class 2606 OID 2248331)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2475 (class 2606 OID 2248301)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2470 (class 2606 OID 2248326)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2472 (class 2606 OID 2248316)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2456 (class 2606 OID 2248236)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2492 (class 2606 OID 2248416)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2490 (class 2606 OID 2248411)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2491 (class 2606 OID 2248406)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2468 (class 2606 OID 2248296)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2498 (class 2606 OID 2248456)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2500 (class 2606 OID 2248446)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2499 (class 2606 OID 2248451)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2488 (class 2606 OID 2248396)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 2248491)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2508 (class 2606 OID 2248496)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2507 (class 2606 OID 2248501)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2510 (class 2606 OID 2248516)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2511 (class 2606 OID 2248511)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2512 (class 2606 OID 2248506)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2462 (class 2606 OID 2248271)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2463 (class 2606 OID 2248266)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2457 (class 2606 OID 2248246)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2458 (class 2606 OID 2248241)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2453 (class 2606 OID 2248221)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2494 (class 2606 OID 2248426)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2476 (class 2606 OID 2248336)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2450 (class 2606 OID 2248201)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2449 (class 2606 OID 2248206)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2495 (class 2606 OID 2248441)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2496 (class 2606 OID 2248436)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2497 (class 2606 OID 2248431)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2466 (class 2606 OID 2248276)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2464 (class 2606 OID 2248286)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2465 (class 2606 OID 2248281)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2480 (class 2606 OID 2248371)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2482 (class 2606 OID 2248361)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2483 (class 2606 OID 2248356)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2481 (class 2606 OID 2248366)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2448 (class 2606 OID 2248191)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2447 (class 2606 OID 2248196)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2493 (class 2606 OID 2248421)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2489 (class 2606 OID 2248401)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2503 (class 2606 OID 2248466)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2502 (class 2606 OID 2248471)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 2248256)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2461 (class 2606 OID 2248251)
-- Name: fk_89c1f9d26beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d26beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2459 (class 2606 OID 2248261)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2505 (class 2606 OID 2248476)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2504 (class 2606 OID 2248481)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2517 (class 2606 OID 2248541)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 2248536)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2515 (class 2606 OID 2248551)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2519 (class 2606 OID 2248531)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2516 (class 2606 OID 2248546)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2501 (class 2606 OID 2248461)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2484 (class 2606 OID 2248391)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2485 (class 2606 OID 2248386)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2487 (class 2606 OID 2248376)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2486 (class 2606 OID 2248381)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2513 (class 2606 OID 2248526)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2514 (class 2606 OID 2248521)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2467 (class 2606 OID 2248291)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2506 (class 2606 OID 2248486)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2451 (class 2606 OID 2248216)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2452 (class 2606 OID 2248211)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2455 (class 2606 OID 2248226)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2454 (class 2606 OID 2248231)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2477 (class 2606 OID 2248351)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2478 (class 2606 OID 2248346)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2479 (class 2606 OID 2248341)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-05 12:10:10 CEST

--
-- PostgreSQL database dump complete
--

