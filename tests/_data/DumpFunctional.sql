--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.0
-- Dumped by pg_dump version 9.4.0
-- Started on 2015-05-24 22:40:35 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 179 (class 1259 OID 122521)
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
-- TOC entry 212 (class 1259 OID 122848)
-- Name: alternacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE alternacija (
    id uuid NOT NULL,
    funkcija_id uuid,
    sodelovanje_id uuid,
    oseba_id uuid,
    koprodukcija_delitev_id uuid,
    pogodba_id uuid,
    zaposlen boolean,
    zacetek date,
    konec date,
    opomba text,
    sort integer,
    privzeti boolean,
    aktivna boolean
);


--
-- TOC entry 213 (class 1259 OID 122861)
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
-- TOC entry 214 (class 1259 OID 122878)
-- Name: besedilo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE besedilo (
    id uuid NOT NULL,
    stevilka character varying(255) NOT NULL,
    naslov character varying(255) DEFAULT NULL::character varying,
    avtor character varying(255) DEFAULT NULL::character varying,
    podnaslov character varying(255) DEFAULT NULL::character varying,
    jezik character varying(255) DEFAULT NULL::character varying,
    naslovizvirnika character varying(255) DEFAULT NULL::character varying,
    datumprejema date,
    moskevloge integer,
    zenskevloge integer,
    prevajalec character varying(255) DEFAULT NULL::character varying,
    povzetekvsebine text
);


--
-- TOC entry 190 (class 1259 OID 122665)
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
-- TOC entry 191 (class 1259 OID 122688)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 180 (class 1259 OID 122530)
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
-- TOC entry 215 (class 1259 OID 122892)
-- Name: funkcija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE funkcija (
    id uuid NOT NULL,
    uprizoritev_id uuid NOT NULL,
    alternacija_id uuid,
    tip_vloge_id uuid,
    podrocje character varying(20) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying,
    velikost character varying(255) DEFAULT NULL::character varying,
    pomembna boolean NOT NULL,
    sort integer,
    seplanira boolean NOT NULL,
    dovoliprekrivanje boolean NOT NULL,
    maxprekirvanj integer
);


--
-- TOC entry 192 (class 1259 OID 122693)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 193 (class 1259 OID 122700)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 199 (class 1259 OID 122747)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 200 (class 1259 OID 122753)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 181 (class 1259 OID 122547)
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
-- TOC entry 182 (class 1259 OID 122559)
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
-- TOC entry 183 (class 1259 OID 122570)
-- Name: oseba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba (
    id uuid NOT NULL,
    user_id uuid,
    naslov_id uuid,
    naziv character varying(40) DEFAULT NULL::character varying,
    ime character varying(255) DEFAULT NULL::character varying,
    priimek character varying(255) DEFAULT NULL::character varying,
    funkcija character varying(40) DEFAULT NULL::character varying,
    srednjeime character varying(255) DEFAULT NULL::character varying,
    psevdonim character varying(255) DEFAULT NULL::character varying,
    email character varying(40) DEFAULT NULL::character varying,
    datumrojstva date,
    emso character varying(255) DEFAULT NULL::character varying,
    davcna character varying(255) DEFAULT NULL::character varying,
    spol character varying(1) DEFAULT NULL::character varying,
    opombe text,
    drzavljanstvo character varying(255) DEFAULT NULL::character varying,
    drzavarojstva character varying(255) DEFAULT NULL::character varying,
    krajrojstva character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 185 (class 1259 OID 122613)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 172 (class 1259 OID 122464)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 122494)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 201 (class 1259 OID 122760)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 202 (class 1259 OID 122767)
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
-- TOC entry 216 (class 1259 OID 122906)
-- Name: pogodba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pogodba (
    id uuid NOT NULL,
    oseba_id uuid,
    popa_id uuid,
    trr_id uuid,
    sifra character varying(7) NOT NULL,
    vrednostdo numeric(10,0) DEFAULT NULL::numeric,
    zacetek date,
    konec date,
    vrednostvaje numeric(12,2) DEFAULT NULL::numeric,
    vrednostpredstave numeric(12,2) DEFAULT NULL::numeric,
    vrednosture numeric(12,2) DEFAULT NULL::numeric,
    aktivna boolean,
    opis text
);


--
-- TOC entry 184 (class 1259 OID 122593)
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
-- TOC entry 186 (class 1259 OID 122620)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 122775)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 187 (class 1259 OID 122628)
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
-- TOC entry 194 (class 1259 OID 122706)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 204 (class 1259 OID 122781)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 122922)
-- Name: produkcijadelitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijadelitev (
    id uuid NOT NULL,
    uprizoritev_id uuid NOT NULL,
    koproducent_id uuid NOT NULL,
    odstotekfinanciranja numeric(10,0) DEFAULT NULL::numeric,
    nasstrosek boolean,
    lastnasredstva numeric(15,2) DEFAULT NULL::numeric,
    zaproseno numeric(15,2) DEFAULT NULL::numeric,
    drugijavni numeric(15,2) DEFAULT NULL::numeric,
    avtorskih numeric(15,2) DEFAULT NULL::numeric,
    tantiemi numeric(15,2) DEFAULT NULL::numeric,
    skupnistrosek numeric(15,2) DEFAULT NULL::numeric,
    zaprosenprocent numeric(6,2) DEFAULT NULL::numeric
);


--
-- TOC entry 218 (class 1259 OID 122937)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 205 (class 1259 OID 122788)
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
-- TOC entry 206 (class 1259 OID 122797)
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
-- TOC entry 207 (class 1259 OID 122806)
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
-- TOC entry 219 (class 1259 OID 122944)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 220 (class 1259 OID 122955)
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
-- TOC entry 174 (class 1259 OID 122475)
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
-- TOC entry 173 (class 1259 OID 122473)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2991 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 208 (class 1259 OID 122816)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 122484)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 122514)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 122822)
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
-- TOC entry 210 (class 1259 OID 122834)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 122714)
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
-- TOC entry 227 (class 1259 OID 123037)
-- Name: stevilcenje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenje (
    id uuid NOT NULL,
    sifra character varying(8) NOT NULL,
    naziv character varying(100) NOT NULL,
    prefix character varying(5) DEFAULT NULL::character varying,
    suffix character varying(5) DEFAULT NULL::character varying,
    zacetek integer NOT NULL,
    dolzina integer NOT NULL,
    format character varying(20) NOT NULL,
    globalno boolean,
    poletih boolean
);


--
-- TOC entry 228 (class 1259 OID 123045)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 229 (class 1259 OID 123052)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 122965)
-- Name: strosekuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE strosekuprizoritve (
    id integer NOT NULL,
    uprizoritev_id uuid,
    popa_id uuid,
    naziv character varying(255) DEFAULT NULL::character varying,
    vrednostdo numeric(10,0) DEFAULT NULL::numeric,
    vrednostna numeric(10,0) DEFAULT NULL::numeric,
    opis text,
    sort integer
);


--
-- TOC entry 230 (class 1259 OID 123057)
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE strosekuprizoritve_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 188 (class 1259 OID 122643)
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
-- TOC entry 198 (class 1259 OID 122734)
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
-- TOC entry 222 (class 1259 OID 122978)
-- Name: tipfunkcije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipfunkcije (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis text,
    nastopajoc boolean,
    imezenski character varying(255) DEFAULT NULL::character varying,
    podrocje character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 189 (class 1259 OID 122651)
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
-- TOC entry 177 (class 1259 OID 122501)
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
-- TOC entry 223 (class 1259 OID 122989)
-- Name: uprizoritev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE uprizoritev (
    id uuid NOT NULL,
    besedilo_id uuid,
    zvrst_uprizoritve_id uuid,
    zvrst_surs_id uuid,
    faza character varying(35) DEFAULT NULL::character varying,
    naslov character varying(255) DEFAULT NULL::character varying,
    podnaslov character varying(255) DEFAULT NULL::character varying,
    delovninaslov character varying(255) DEFAULT NULL::character varying,
    datumzacstudija date,
    stevilovaj integer,
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
    kratkinaslov character varying(255) DEFAULT NULL::character varying,
    maticnioder_id uuid
);


--
-- TOC entry 196 (class 1259 OID 122720)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 211 (class 1259 OID 122840)
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
-- TOC entry 224 (class 1259 OID 123009)
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
-- TOC entry 197 (class 1259 OID 122729)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 123017)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 123027)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2398 (class 2604 OID 122478)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2933 (class 0 OID 122521)
-- Dependencies: 179
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 122848)
-- Dependencies: 212
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 122861)
-- Dependencies: 213
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 122878)
-- Dependencies: 214
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2944 (class 0 OID 122665)
-- Dependencies: 190
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2945 (class 0 OID 122688)
-- Dependencies: 191
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2934 (class 0 OID 122530)
-- Dependencies: 180
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5562-3725-7bd3-dbd1ed210f5c	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5562-3725-0612-82a77e28483f	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5562-3725-5332-7d3eb875a090	AL	ALB	008	Albania 	Albanija	\N
00040000-5562-3725-e08c-2ec7ac0a649c	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5562-3725-d185-e8c24055e66d	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5562-3725-238c-731ab611fa34	AD	AND	020	Andorra 	Andora	\N
00040000-5562-3725-f15c-bc984a71595c	AO	AGO	024	Angola 	Angola	\N
00040000-5562-3725-7ff7-5a73419a58bf	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5562-3725-2b66-8337c8438152	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5562-3725-9178-55f4f50a1489	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5562-3725-96ea-5e70127d46cc	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5562-3725-05da-12377f672080	AM	ARM	051	Armenia 	Armenija	\N
00040000-5562-3725-3b06-8720e9d23b44	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5562-3725-59a8-54d4fd6d6f96	AU	AUS	036	Australia 	Avstralija	\N
00040000-5562-3725-691c-f13b5f5271bb	AT	AUT	040	Austria 	Avstrija	\N
00040000-5562-3725-7f6e-9b556548e0b5	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5562-3725-c6df-76aff1ef0e37	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5562-3725-ba79-0968e208c045	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5562-3725-2432-b19369410c48	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5562-3725-bbdf-f4263ced5a1a	BB	BRB	052	Barbados 	Barbados	\N
00040000-5562-3725-0be9-a2c4716fb43c	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5562-3725-4e97-e325863c0c92	BE	BEL	056	Belgium 	Belgija	\N
00040000-5562-3725-95ef-600d63458035	BZ	BLZ	084	Belize 	Belize	\N
00040000-5562-3725-a80c-325ddba98748	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5562-3725-115e-11b1b9eca65b	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5562-3725-4e1a-f3d238710788	BT	BTN	064	Bhutan 	Butan	\N
00040000-5562-3725-fcd6-8e3abb050148	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5562-3725-6c2d-0a128f09664b	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5562-3725-c367-9b8090bfae05	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5562-3725-4be5-83d417146c51	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5562-3725-e684-84ca3705c99c	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5562-3725-151b-2ca5318788ed	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5562-3725-55a3-59e40c159c63	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5562-3725-585a-fcd9cce28adf	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5562-3725-4ff9-59797df43fe8	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5562-3725-5638-16ddbf2dda4c	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5562-3725-d1df-7eb9be79a0bf	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5562-3725-ecc0-7bff6ba20c9e	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5562-3725-2c09-20a450554e9b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5562-3725-94fb-dec5600f187c	CA	CAN	124	Canada 	Kanada	\N
00040000-5562-3725-2184-4e514b186b5a	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5562-3725-0ed0-e80cf986db5d	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5562-3725-9dff-62a8d1f43689	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5562-3725-65e8-134be15e29bf	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5562-3725-60a5-b48341cdf15b	CL	CHL	152	Chile 	Čile	\N
00040000-5562-3725-e804-43dac2cdaed3	CN	CHN	156	China 	Kitajska	\N
00040000-5562-3725-dcdd-9ea89c1c172d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5562-3725-f01f-85ca250aebe5	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5562-3725-0f31-658338b6504b	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5562-3725-ae7d-bae24897b6d2	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5562-3725-17a6-8dd36220313a	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5562-3725-7d72-296458c09c09	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5562-3725-cec3-848902b2688a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5562-3725-fc0f-9bb80c0d3f62	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5562-3725-299f-7964114be357	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5562-3725-34ee-1cafe7600e6f	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5562-3725-b9ac-04ab1d8d2ae1	CU	CUB	192	Cuba 	Kuba	\N
00040000-5562-3725-2927-294b46137108	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5562-3725-1e9c-c7e0d477e878	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5562-3725-a2a9-cdea2dceb627	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5562-3725-3939-fc165d490552	DK	DNK	208	Denmark 	Danska	\N
00040000-5562-3725-deb4-de358ea248d0	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5562-3725-746b-5a4a4d088b2c	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5562-3725-1ff9-895e7d626aa0	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5562-3725-e301-f7bda5b16038	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5562-3725-6a8f-90d6722fa2f8	EG	EGY	818	Egypt 	Egipt	\N
00040000-5562-3725-a187-35b07dc15b34	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5562-3725-5a95-db5545b282ed	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5562-3725-88c8-d8252f75e4d4	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5562-3725-fa84-00e14e085d06	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5562-3725-8999-4a973fca0110	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5562-3725-4c0a-7c212322a8b9	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5562-3725-2634-fea834294432	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5562-3725-9f5b-49c3921e5234	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5562-3725-ac38-ce274840ec25	FI	FIN	246	Finland 	Finska	\N
00040000-5562-3725-a198-ad700b63c4c9	FR	FRA	250	France 	Francija	\N
00040000-5562-3725-e1f4-ac8cac08d111	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5562-3725-1ca9-8f50dbd2f213	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5562-3725-1ab9-a1b206526dfc	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5562-3725-859b-9fc64f5c04e8	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5562-3725-071d-ed138af9ff43	GA	GAB	266	Gabon 	Gabon	\N
00040000-5562-3725-269f-b23d72e9fe07	GM	GMB	270	Gambia 	Gambija	\N
00040000-5562-3725-45e8-e6d194fc41f0	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5562-3725-6de0-f9e18ea183a8	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5562-3725-a5a0-6c2b8f6a475d	GH	GHA	288	Ghana 	Gana	\N
00040000-5562-3725-e6c0-e09950203cf4	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5562-3725-af1b-3a46ae54b86e	GR	GRC	300	Greece 	Grčija	\N
00040000-5562-3725-1c87-3b053c66462c	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5562-3725-ee0e-69bef5f9aaa6	GD	GRD	308	Grenada 	Grenada	\N
00040000-5562-3725-428a-ae1012945d6f	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5562-3725-11dc-8f640475ef04	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5562-3725-3717-6039f7504fc9	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5562-3725-c24b-b96ea683fa2d	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5562-3725-877d-8e894385d28f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5562-3725-9bc9-5ca767efcc31	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5562-3725-074d-5bd9fc04fd9c	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5562-3725-518f-3957d3aaf176	HT	HTI	332	Haiti 	Haiti	\N
00040000-5562-3725-3360-2fa2c3ca5fbd	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5562-3725-0e12-82e94078726e	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5562-3725-45e4-e3998546f1a2	HN	HND	340	Honduras 	Honduras	\N
00040000-5562-3725-29bd-bea480bce068	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5562-3725-9b54-676109c800c2	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5562-3725-6ae5-029f5d99966a	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5562-3725-d60e-5aea82676eda	IN	IND	356	India 	Indija	\N
00040000-5562-3725-96a6-7c945bbd248b	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5562-3725-c264-74d3c59ad012	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5562-3725-0aec-2dd8e7cfe330	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5562-3725-ef07-7c2dc13606de	IE	IRL	372	Ireland 	Irska	\N
00040000-5562-3725-b7ba-1f99f746c3d8	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5562-3725-aef9-c4f5ed6a5023	IL	ISR	376	Israel 	Izrael	\N
00040000-5562-3725-f815-d4bc20aae7ee	IT	ITA	380	Italy 	Italija	\N
00040000-5562-3725-de52-2265964f14eb	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5562-3725-94a1-1f1610060f59	JP	JPN	392	Japan 	Japonska	\N
00040000-5562-3725-b09d-6166b3db7e65	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5562-3725-0927-476642512284	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5562-3725-e932-2cf5e22f27fd	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5562-3725-37c0-3fbbb2b6be6d	KE	KEN	404	Kenya 	Kenija	\N
00040000-5562-3725-4bc3-dd70772e5591	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5562-3725-2045-2d8561e25c7b	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5562-3725-85b3-a2efb4c91dae	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5562-3725-7c34-9cbb2a67365b	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5562-3725-ef54-c44be2ea3c80	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5562-3725-2e7b-841c026fe660	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5562-3725-49cd-1736f672457c	LV	LVA	428	Latvia 	Latvija	\N
00040000-5562-3725-49fa-55db2231ffad	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5562-3725-468c-d8864d8e5174	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5562-3725-56a7-2180f95899ed	LR	LBR	430	Liberia 	Liberija	\N
00040000-5562-3725-19ea-a09fde449897	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5562-3725-2749-5ab094f936b5	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5562-3725-bd5a-bfac84733145	LT	LTU	440	Lithuania 	Litva	\N
00040000-5562-3725-915e-a5a381202497	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5562-3725-4403-d56aee7af571	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5562-3725-0d81-830df28b8a6d	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5562-3725-8116-28450c20d170	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5562-3725-18f5-316f0381fb30	MW	MWI	454	Malawi 	Malavi	\N
00040000-5562-3725-22d8-b500a23a9ce6	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5562-3725-8c0d-054306bdcb7c	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5562-3725-e78b-fb9b7d2ee28e	ML	MLI	466	Mali 	Mali	\N
00040000-5562-3725-e577-c9974704d758	MT	MLT	470	Malta 	Malta	\N
00040000-5562-3725-b0d4-5f6586adf431	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5562-3725-7ec7-923d957ae748	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5562-3725-84e2-9d09578f81ee	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5562-3725-0db6-947a4fc86b61	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5562-3725-7bc9-290314815f85	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5562-3725-d88b-0f5978eede8e	MX	MEX	484	Mexico 	Mehika	\N
00040000-5562-3725-185b-7e8ae9113259	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5562-3725-37e2-5f129384a7bf	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5562-3725-0891-2724a11dceba	MC	MCO	492	Monaco 	Monako	\N
00040000-5562-3725-bbe9-874ad064315f	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5562-3725-638f-1734d08f4194	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5562-3725-69eb-4f6229b715ea	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5562-3725-8c26-26fdc4951f94	MA	MAR	504	Morocco 	Maroko	\N
00040000-5562-3725-b8a5-8ec40ecd8216	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5562-3725-885c-9bd044fc301a	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5562-3725-65d9-77f4876586ac	NA	NAM	516	Namibia 	Namibija	\N
00040000-5562-3725-b4ed-4396a57863e4	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5562-3725-394e-30fb329d5d87	NP	NPL	524	Nepal 	Nepal	\N
00040000-5562-3725-50b5-c1d96f44ee75	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5562-3725-41de-8714894b488d	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5562-3725-3586-0fcf0446931a	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5562-3725-526c-a161d998618d	NE	NER	562	Niger 	Niger 	\N
00040000-5562-3725-5135-b8fc386b73df	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5562-3725-19a9-79f73403ef54	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5562-3725-3612-49df8ca8ff19	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5562-3725-227e-eeffdcdd40ec	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5562-3725-3d0d-36047e9c73c7	NO	NOR	578	Norway 	Norveška	\N
00040000-5562-3725-6970-3cadabc3c444	OM	OMN	512	Oman 	Oman	\N
00040000-5562-3725-f9bf-142745c121ed	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5562-3725-45d9-e87a944b10a3	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5562-3725-ceed-6b4061ca56c8	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5562-3725-8082-4084b41b2d36	PA	PAN	591	Panama 	Panama	\N
00040000-5562-3725-b0a7-452be08f57ca	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5562-3725-4ff7-8f4c62f4ec7b	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5562-3725-474b-fada71f8a791	PE	PER	604	Peru 	Peru	\N
00040000-5562-3725-b68f-c8e2b61e9b97	PH	PHL	608	Philippines 	Filipini	\N
00040000-5562-3725-c072-168cb99873e0	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5562-3725-f899-b97d0bf49ec2	PL	POL	616	Poland 	Poljska	\N
00040000-5562-3725-2bda-2fd37a984fdb	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5562-3725-dbeb-03ba01e1026c	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5562-3725-0dd8-2b789cad863a	QA	QAT	634	Qatar 	Katar	\N
00040000-5562-3725-b00d-451c5bd944fc	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5562-3725-c94e-6d3bb6f1cab6	RO	ROU	642	Romania 	Romunija	\N
00040000-5562-3725-3f07-ece4092bc99e	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5562-3725-24cd-1509a7daaf8e	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5562-3725-da1b-f9efba94f286	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5562-3725-62f7-9fc43496a546	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5562-3725-b65d-b0432c27f6d3	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5562-3725-4d29-f95bf5c998dc	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5562-3725-f523-be5468f2a263	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5562-3725-d6fe-9765dc3f2258	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5562-3725-7bcb-1ec33a99aafc	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5562-3725-33df-5a08c687f1a8	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5562-3725-a5d2-4460d5eb92fb	SM	SMR	674	San Marino 	San Marino	\N
00040000-5562-3725-1be5-6b59a6eede54	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5562-3725-439a-bb471596e7dd	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5562-3725-4e83-1042e007c959	SN	SEN	686	Senegal 	Senegal	\N
00040000-5562-3725-81c5-04a9c0aad425	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5562-3725-1ed6-d27045b288a6	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5562-3725-be35-67dd17d4b605	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5562-3725-34ea-342d053bac4f	SG	SGP	702	Singapore 	Singapur	\N
00040000-5562-3725-9c92-d7d19bf4361e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5562-3725-7e66-1a0c68588907	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5562-3725-d6a6-57c41267769f	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5562-3725-0bbc-b0ef1828c9a9	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5562-3725-265a-fb268ab7ff38	SO	SOM	706	Somalia 	Somalija	\N
00040000-5562-3725-7ba5-d328d26e81ef	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5562-3725-4ebf-678227b8bd15	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5562-3725-cd0e-c36fd20b6750	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5562-3725-64e4-4a90928ec3dc	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5562-3725-ab09-c68143f21143	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5562-3725-fcee-d1b67141a4f6	SD	SDN	729	Sudan 	Sudan	\N
00040000-5562-3725-9def-b0b2f32d4703	SR	SUR	740	Suriname 	Surinam	\N
00040000-5562-3725-673b-7931c05cfabf	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5562-3725-ad57-23beea3cc372	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5562-3725-3d16-d7b81d5298ca	SE	SWE	752	Sweden 	Švedska	\N
00040000-5562-3725-50f6-579f6230c613	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5562-3725-4a0b-8b137b6be355	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5562-3725-7e0f-d2562ec38a41	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5562-3725-eb81-c55392f34079	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5562-3725-3d69-f073a7c3b7f1	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5562-3725-a41f-65fb059fe1e0	TH	THA	764	Thailand 	Tajska	\N
00040000-5562-3725-60d7-3537ba671d94	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5562-3725-9e7c-d24c2b106c0d	TG	TGO	768	Togo 	Togo	\N
00040000-5562-3725-02f0-ab98a67c0603	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5562-3725-34db-1ac765ea8892	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5562-3725-d2cb-bd8972d98671	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5562-3725-1ea0-3ca68f7f0900	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5562-3725-e6e4-5c75068a58fc	TR	TUR	792	Turkey 	Turčija	\N
00040000-5562-3725-f33c-6e0662d52345	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5562-3725-7ead-a98ed538ea11	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5562-3725-625d-12723847d2b0	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5562-3725-b091-76dba7454a77	UG	UGA	800	Uganda 	Uganda	\N
00040000-5562-3725-a76c-d2d4b71fade9	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5562-3725-5948-87c052aa980e	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5562-3725-288b-de670859bb7f	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5562-3725-3be4-9ec90ccfd9c2	US	USA	840	United States 	Združene države Amerike	\N
00040000-5562-3725-3cdb-cf97651298a4	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5562-3725-05aa-b36a2d8d25ca	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5562-3725-6b26-91bfd559c324	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5562-3725-366e-05a1f4c945f3	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5562-3725-3239-f477b53a7aae	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5562-3725-95ea-9b7effea1245	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5562-3725-9937-e233073ff5ba	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5562-3725-c02a-60939e2911e9	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5562-3725-6858-110c0cd2c12f	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5562-3725-8865-342fbed37b8b	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5562-3725-0fb9-a802dff1e320	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5562-3725-ec32-fd436a7a4d15	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5562-3725-b96e-93e60b67876a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2969 (class 0 OID 122892)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj) FROM stdin;
\.


--
-- TOC entry 2946 (class 0 OID 122693)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 122700)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2953 (class 0 OID 122747)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2954 (class 0 OID 122753)
-- Dependencies: 200
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2935 (class 0 OID 122547)
-- Dependencies: 181
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5562-3727-c220-addfcfc2287d	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5562-3727-a5ea-b232ffeaf732	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5562-3727-b0c3-dcaba35e9545	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5562-3727-8f32-12322514c6fd	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5562-3727-77ae-7a7c62b7341a	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5562-3727-4cfb-08796acb05d6	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5562-3727-767c-a0cf43d2a4be	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5562-3727-738c-bd9cee9066f8	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5562-3727-8806-e0df902f2dd2	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5562-3727-cfff-a236e403a5a2	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5562-3727-f6dc-0a88f4072e18	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5562-3727-d96f-c95c04ba3eef	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5562-3727-cb53-b2ab1ea1eccc	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5562-3727-7473-beee74742bcd	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2936 (class 0 OID 122559)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5562-3727-0b16-6c576166a5d9	00000000-5562-3727-77ae-7a7c62b7341a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5562-3727-1831-ddebd1431413	00000000-5562-3727-77ae-7a7c62b7341a	00010000-5562-3727-f601-fd41e052e9f2	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5562-3727-1772-1b70c1835f67	00000000-5562-3727-4cfb-08796acb05d6	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2937 (class 0 OID 122570)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2939 (class 0 OID 122613)
-- Dependencies: 185
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2926 (class 0 OID 122464)
-- Dependencies: 172
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5562-3727-6b9f-b16fc8616d1c	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5562-3727-23a8-74b11ede2781	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5562-3727-036e-70984c8f3c85	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5562-3727-e339-7c397dc02064	Abonma-read	Abonma - branje	f
00030000-5562-3727-fdce-376d11bf283a	Abonma-write	Abonma - spreminjanje	f
00030000-5562-3727-cae4-452e6de3a346	Alternacija-read	Alternacija - branje	f
00030000-5562-3727-b0ff-9f7f60f7f4f4	Alternacija-write	Alternacija - spreminjanje	f
00030000-5562-3727-f656-88f19d62e703	Arhivalija-read	Arhivalija - branje	f
00030000-5562-3727-f400-3cd5fb48165d	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5562-3727-2a2e-9ea324a5c674	Besedilo-read	Besedilo - branje	f
00030000-5562-3727-2e8e-7b4b6fa6fa05	Besedilo-write	Besedilo - spreminjanje	f
00030000-5562-3727-7d4c-0eaf694f6a2b	DogodekIzven-read	DogodekIzven - branje	f
00030000-5562-3727-9638-55a85c930038	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5562-3727-cc48-6f2504ec4f1c	Dogodek-read	Dogodek - branje	f
00030000-5562-3727-c174-bbc1174566a4	Dogodek-write	Dogodek - spreminjanje	f
00030000-5562-3727-b5cf-d42d98c2197d	Drzava-read	Drzava - branje	f
00030000-5562-3727-738c-c90d5f7c0d0a	Drzava-write	Drzava - spreminjanje	f
00030000-5562-3727-c4c6-a65e46346b1c	Funkcija-read	Funkcija - branje	f
00030000-5562-3727-ae1a-3350f2e99041	Funkcija-write	Funkcija - spreminjanje	f
00030000-5562-3727-8ae8-3d883655d249	Gostovanje-read	Gostovanje - branje	f
00030000-5562-3727-ab34-f06f1978d688	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5562-3727-732a-a7e431dd33a7	Gostujoca-read	Gostujoca - branje	f
00030000-5562-3727-2a21-d17eec0280d5	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5562-3727-a69b-eeb117c3dd09	Kupec-read	Kupec - branje	f
00030000-5562-3727-7c15-ad5a12e354b6	Kupec-write	Kupec - spreminjanje	f
00030000-5562-3727-f6ff-b54f4b5b4c6e	NacinPlacina-read	NacinPlacina - branje	f
00030000-5562-3727-bfe2-ee87f5f91251	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5562-3727-f0b3-8236b9afffe8	Option-read	Option - branje	f
00030000-5562-3727-e642-5029b6dfd7bf	Option-write	Option - spreminjanje	f
00030000-5562-3727-0cc6-751f5f59dc85	OptionValue-read	OptionValue - branje	f
00030000-5562-3727-b49c-0b7581bc4af6	OptionValue-write	OptionValue - spreminjanje	f
00030000-5562-3727-b6c4-1f00b0efa9c1	Oseba-read	Oseba - branje	f
00030000-5562-3727-b42a-5e5a6030d003	Oseba-write	Oseba - spreminjanje	f
00030000-5562-3727-f70c-1d403d6daa1b	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5562-3727-06b2-b386de11fd5a	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5562-3727-f5bf-7a2b1b21726b	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5562-3727-d586-53dc637de03b	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5562-3727-7566-cc77cb9f4dc1	Pogodba-read	Pogodba - branje	f
00030000-5562-3727-51a0-61fc93a72f75	Pogodba-write	Pogodba - spreminjanje	f
00030000-5562-3727-c504-aa9dc487c17b	Popa-read	Popa - branje	f
00030000-5562-3727-c170-f0f2c4e0ee85	Popa-write	Popa - spreminjanje	f
00030000-5562-3727-d335-2ef039cdc347	Posta-read	Posta - branje	f
00030000-5562-3727-5e5a-9090bad1c6a0	Posta-write	Posta - spreminjanje	f
00030000-5562-3727-5466-e0dbf273dff4	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5562-3727-d565-86535a734833	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5562-3727-7dce-847f36bb58f8	PostniNaslov-read	PostniNaslov - branje	f
00030000-5562-3727-2773-8ddbfd433b72	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5562-3727-d649-385a2c40b1b7	Predstava-read	Predstava - branje	f
00030000-5562-3727-9e0e-a716a1861b3a	Predstava-write	Predstava - spreminjanje	f
00030000-5562-3727-8443-bf54795537f2	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5562-3727-9dc4-3917277227e0	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5562-3727-6ddf-a8a514dcbc0c	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5562-3727-6bd4-ae2bb07cb15f	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5562-3727-6e8b-e84d3368614c	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5562-3727-fe3e-0b37be2da0cd	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5562-3727-c739-757b05bc7338	Prostor-read	Prostor - branje	f
00030000-5562-3727-9117-2c3ea04b9040	Prostor-write	Prostor - spreminjanje	f
00030000-5562-3727-1046-83f3a6f42853	Racun-read	Racun - branje	f
00030000-5562-3727-1e5e-21d59b81111d	Racun-write	Racun - spreminjanje	f
00030000-5562-3727-fd62-8a719a0e8776	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5562-3727-e867-d1e6025471cd	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5562-3727-9096-62aa8692e4bc	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5562-3727-2a41-5f38ba8b28af	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5562-3727-7a8c-95e9acd81b16	Rekvizit-read	Rekvizit - branje	f
00030000-5562-3727-9126-eb859db88b36	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5562-3727-6287-c922beda08a6	Rezervacija-read	Rezervacija - branje	f
00030000-5562-3727-10d4-a3218e8dd053	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5562-3727-1d41-d7504368b0b1	SedezniRed-read	SedezniRed - branje	f
00030000-5562-3727-709c-85b2d6232891	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5562-3727-7b5d-71d516e8bd6a	Sedez-read	Sedez - branje	f
00030000-5562-3727-ae38-5f7ea88eae3e	Sedez-write	Sedez - spreminjanje	f
00030000-5562-3727-f8de-c3a268de18de	Sezona-read	Sezona - branje	f
00030000-5562-3727-8298-8bd1b43428ba	Sezona-write	Sezona - spreminjanje	f
00030000-5562-3727-3752-64ef78af3731	Telefonska-read	Telefonska - branje	f
00030000-5562-3727-88f4-6c83f2f1aad3	Telefonska-write	Telefonska - spreminjanje	f
00030000-5562-3727-8604-9c37de5611c8	TerminStoritve-read	TerminStoritve - branje	f
00030000-5562-3727-8d47-72a8ac5f9c1c	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5562-3727-9179-717ee0c2401c	TipFunkcije-read	TipFunkcije - branje	f
00030000-5562-3727-50c5-650a583d4d21	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5562-3727-1681-fbd48671170e	Trr-read	Trr - branje	f
00030000-5562-3727-a239-ec4852e1b5ff	Trr-write	Trr - spreminjanje	f
00030000-5562-3727-4e92-f49425d8d36c	Uprizoritev-read	Uprizoritev - branje	f
00030000-5562-3727-c703-7dfb332ec5fa	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5562-3727-49ff-ac7e5095e1f7	Vaja-read	Vaja - branje	f
00030000-5562-3727-468a-b53cb94e5ea8	Vaja-write	Vaja - spreminjanje	f
00030000-5562-3727-8e2a-90c49b59907a	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5562-3727-15e0-f9087941c256	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5562-3727-8b66-31879c19b4f7	Zaposlitev-read	Zaposlitev - branje	f
00030000-5562-3727-b348-7ee2c87c8540	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5562-3727-8c95-807eb5072586	Zasedenost-read	Zasedenost - branje	f
00030000-5562-3727-c3f7-8b7ef3e15a7d	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5562-3727-81c7-472c8257c37b	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5562-3727-4f3b-d3255c1ddab7	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5562-3727-4d74-bdb84f92c104	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5562-3727-035e-f78924092aa2	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2930 (class 0 OID 122494)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5562-3727-3283-cab30a33e8d9	00030000-5562-3727-b5cf-d42d98c2197d
00020000-5562-3727-28e5-898ea078c386	00030000-5562-3727-738c-c90d5f7c0d0a
00020000-5562-3727-28e5-898ea078c386	00030000-5562-3727-b5cf-d42d98c2197d
\.


--
-- TOC entry 2955 (class 0 OID 122760)
-- Dependencies: 201
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2956 (class 0 OID 122767)
-- Dependencies: 202
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 122906)
-- Dependencies: 216
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2938 (class 0 OID 122593)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5562-372e-ee66-371888088024	00040000-5562-3725-7bd3-dbd1ed210f5c	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5562-372e-aca5-71c036ba056d	00040000-5562-3725-7bd3-dbd1ed210f5c	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2940 (class 0 OID 122620)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5562-3726-7751-463b2cd3f2fd	8341	Adlešiči
00050000-5562-3726-2e2b-40cd4a8715c2	5270	Ajdovščina
00050000-5562-3726-2fd0-c4a72043a4ed	6280	Ankaran/Ancarano
00050000-5562-3726-46a9-7c470ce96220	9253	Apače
00050000-5562-3726-5107-f50c19812b3f	8253	Artiče
00050000-5562-3726-5584-21a6fba0e9c9	4275	Begunje na Gorenjskem
00050000-5562-3726-7d7c-32232a38de59	1382	Begunje pri Cerknici
00050000-5562-3726-2952-ceaf583fccc5	9231	Beltinci
00050000-5562-3726-52f9-d12ebfa6a9c2	2234	Benedikt
00050000-5562-3726-4445-16a8add919cf	2345	Bistrica ob Dravi
00050000-5562-3726-11b2-fabb64fd8d8c	3256	Bistrica ob Sotli
00050000-5562-3726-14e5-d4fb69adaadc	8259	Bizeljsko
00050000-5562-3726-c91b-4ae49bf8ec49	1223	Blagovica
00050000-5562-3726-f136-34cfd373f92c	8283	Blanca
00050000-5562-3726-dbbb-9922755f85c9	4260	Bled
00050000-5562-3726-0dab-455a890ad595	4273	Blejska Dobrava
00050000-5562-3726-cfae-0904184cb257	9265	Bodonci
00050000-5562-3726-f650-2a38fe1a6c70	9222	Bogojina
00050000-5562-3726-a36c-fbd5a078aceb	4263	Bohinjska Bela
00050000-5562-3726-8594-df3819cd04ab	4264	Bohinjska Bistrica
00050000-5562-3726-9b56-b9dec538d2b8	4265	Bohinjsko jezero
00050000-5562-3726-0475-ea3387c3ea7d	1353	Borovnica
00050000-5562-3726-d2bc-13fe99f226cc	8294	Boštanj
00050000-5562-3726-8011-7b57f57f1b9c	5230	Bovec
00050000-5562-3726-4a57-f3d2cdfe3dc7	5295	Branik
00050000-5562-3726-dcfc-7dd9e7c8b0e4	3314	Braslovče
00050000-5562-3726-024e-50b0c31925e1	5223	Breginj
00050000-5562-3726-8c58-86cb6d5e8514	8280	Brestanica
00050000-5562-3726-97e9-e4227ff61e24	2354	Bresternica
00050000-5562-3726-6491-41d9830f60b9	4243	Brezje
00050000-5562-3726-9c60-b74c68791ad3	1351	Brezovica pri Ljubljani
00050000-5562-3726-3548-0f4892327faf	8250	Brežice
00050000-5562-3726-d4d5-e3a172d5609f	4210	Brnik - Aerodrom
00050000-5562-3726-2574-2f1bf2f56e7b	8321	Brusnice
00050000-5562-3726-2875-11879513fa31	3255	Buče
00050000-5562-3726-272b-4fab498aaea9	8276	Bučka 
00050000-5562-3726-c182-0b703e31185d	9261	Cankova
00050000-5562-3726-0745-c87c55b3536e	3000	Celje 
00050000-5562-3726-cd52-36ac7246d9eb	3001	Celje - poštni predali
00050000-5562-3726-649e-40ad508acb74	4207	Cerklje na Gorenjskem
00050000-5562-3726-f4ed-0d84a5ee3649	8263	Cerklje ob Krki
00050000-5562-3726-b27e-ad0d5ac8c2e8	1380	Cerknica
00050000-5562-3726-9125-becfc5ccf56c	5282	Cerkno
00050000-5562-3726-2c1b-f04468366732	2236	Cerkvenjak
00050000-5562-3726-cbfc-a21ff075248c	2215	Ceršak
00050000-5562-3726-112a-b367e13df6e3	2326	Cirkovce
00050000-5562-3726-97d7-927c9834995b	2282	Cirkulane
00050000-5562-3726-6835-df883ceff02c	5273	Col
00050000-5562-3726-c34e-d583f739d2dc	8251	Čatež ob Savi
00050000-5562-3726-e43c-c91505c4c266	1413	Čemšenik
00050000-5562-3726-a866-e4707dff832d	5253	Čepovan
00050000-5562-3726-44c8-a45c7eec0690	9232	Črenšovci
00050000-5562-3726-ea4f-2a6a2f440360	2393	Črna na Koroškem
00050000-5562-3726-4054-3e67a683b213	6275	Črni Kal
00050000-5562-3726-ad1e-73e157465bd5	5274	Črni Vrh nad Idrijo
00050000-5562-3726-6e08-dfa6582a60e5	5262	Črniče
00050000-5562-3726-5380-113a1c05055f	8340	Črnomelj
00050000-5562-3726-1036-50144a76cac0	6271	Dekani
00050000-5562-3726-8083-0cb77d1283e8	5210	Deskle
00050000-5562-3726-89eb-d41a334d03af	2253	Destrnik
00050000-5562-3726-0239-52259480910a	6215	Divača
00050000-5562-3726-53c0-0dbabf2b1131	1233	Dob
00050000-5562-3726-ef32-7249186f96df	3224	Dobje pri Planini
00050000-5562-3726-e915-68f2881ef18b	8257	Dobova
00050000-5562-3726-7740-bc6016ea25e3	1423	Dobovec
00050000-5562-3726-429f-20e5e932d4a1	5263	Dobravlje
00050000-5562-3726-cc40-48b5c9dcede6	3204	Dobrna
00050000-5562-3726-ad50-2c7e34b9e82d	8211	Dobrnič
00050000-5562-3726-4a32-99f49bd97b78	1356	Dobrova
00050000-5562-3726-583b-3a1afe124871	9223	Dobrovnik/Dobronak 
00050000-5562-3726-9ff4-754cd82fe897	5212	Dobrovo v Brdih
00050000-5562-3726-77f2-bc152b21560f	1431	Dol pri Hrastniku
00050000-5562-3726-4f6a-c03288d0308c	1262	Dol pri Ljubljani
00050000-5562-3726-f2ec-5c0c427ea22c	1273	Dole pri Litiji
00050000-5562-3726-d8bb-2172db1e73bc	1331	Dolenja vas
00050000-5562-3726-d031-1ab59d8d794d	8350	Dolenjske Toplice
00050000-5562-3726-59ab-0712430453fb	1230	Domžale
00050000-5562-3726-7070-2a8b24b771d9	2252	Dornava
00050000-5562-3726-4577-73c6c9137029	5294	Dornberk
00050000-5562-3726-8e81-5b2ab7eeec08	1319	Draga
00050000-5562-3726-e81e-bce826051150	8343	Dragatuš
00050000-5562-3726-1308-7c2928db0a1a	3222	Dramlje
00050000-5562-3726-8728-5c42fbc48341	2370	Dravograd
00050000-5562-3726-e52b-9b1323f08cd9	4203	Duplje
00050000-5562-3726-0f9a-d4535ce969b1	6221	Dutovlje
00050000-5562-3726-3007-ddb94f1dbd1e	8361	Dvor
00050000-5562-3726-0391-438d95ae3529	2343	Fala
00050000-5562-3726-1f0d-7584fac8fd45	9208	Fokovci
00050000-5562-3726-0729-bb9fd998a712	2313	Fram
00050000-5562-3726-a49d-ced56dc1890d	3213	Frankolovo
00050000-5562-3726-3be7-378c3334e09c	1274	Gabrovka
00050000-5562-3726-0547-126fb78d1e50	8254	Globoko
00050000-5562-3726-d605-e33d64800da4	5275	Godovič
00050000-5562-3726-07c2-848ebe6bae58	4204	Golnik
00050000-5562-3726-3dbb-1f9f52fa0d8d	3303	Gomilsko
00050000-5562-3726-88a8-86f3c0533895	4224	Gorenja vas
00050000-5562-3726-1d91-94adae79a019	3263	Gorica pri Slivnici
00050000-5562-3726-f8d6-c1c834f41a97	2272	Gorišnica
00050000-5562-3726-1078-ab61888800a6	9250	Gornja Radgona
00050000-5562-3726-d7ba-21b9a4430200	3342	Gornji Grad
00050000-5562-3726-4744-c9e10e82f47e	4282	Gozd Martuljek
00050000-5562-3726-37f6-f39601e57d55	6272	Gračišče
00050000-5562-3726-b143-354238f2eead	9264	Grad
00050000-5562-3726-d071-62778a90c158	8332	Gradac
00050000-5562-3726-cbc1-eb2c1c69e20b	1384	Grahovo
00050000-5562-3726-1880-0d53b6ba7edf	5242	Grahovo ob Bači
00050000-5562-3726-e724-3015dc265b7a	5251	Grgar
00050000-5562-3726-85be-0ef3077c2840	3302	Griže
00050000-5562-3726-7c64-60bd71017abf	3231	Grobelno
00050000-5562-3726-70c8-e9f5f855c460	1290	Grosuplje
00050000-5562-3726-4e89-016c32e17dd9	2288	Hajdina
00050000-5562-3726-017c-c40c25d87702	8362	Hinje
00050000-5562-3726-558e-80b2ffa631e3	2311	Hoče
00050000-5562-3726-5483-fa07e4cdca93	9205	Hodoš/Hodos
00050000-5562-3726-5856-071430d3966a	1354	Horjul
00050000-5562-3726-cf6c-f6dadfc2432d	1372	Hotedršica
00050000-5562-3726-4b37-1b048350fcb6	1430	Hrastnik
00050000-5562-3726-9d42-dd8f1b6381ce	6225	Hruševje
00050000-5562-3726-1260-0fd7179fd523	4276	Hrušica
00050000-5562-3726-a6f6-c107e03d9632	5280	Idrija
00050000-5562-3726-fe9d-9477ac3b4e0c	1292	Ig
00050000-5562-3726-b896-e20972611df5	6250	Ilirska Bistrica
00050000-5562-3726-d4cf-818318ce5c88	6251	Ilirska Bistrica-Trnovo
00050000-5562-3726-e649-c0761acf3020	1295	Ivančna Gorica
00050000-5562-3726-2846-849b057d9493	2259	Ivanjkovci
00050000-5562-3726-1b67-9ebe25cd4631	1411	Izlake
00050000-5562-3726-0219-e502493a1a05	6310	Izola/Isola
00050000-5562-3726-a859-552c1d854d86	2222	Jakobski Dol
00050000-5562-3726-7efc-18848996d08e	2221	Jarenina
00050000-5562-3726-04c7-ac2848c9aaa1	6254	Jelšane
00050000-5562-3726-694d-61ffc8c29f9e	4270	Jesenice
00050000-5562-3726-9e6f-282903bb1fbe	8261	Jesenice na Dolenjskem
00050000-5562-3726-e673-57377353b12b	3273	Jurklošter
00050000-5562-3726-f4ac-3129fbf236f6	2223	Jurovski Dol
00050000-5562-3726-9246-20855911fb4d	2256	Juršinci
00050000-5562-3726-053d-4c3b3e62b172	5214	Kal nad Kanalom
00050000-5562-3726-246e-308ce2adfb1b	3233	Kalobje
00050000-5562-3726-8dee-1b0f225d4e75	4246	Kamna Gorica
00050000-5562-3726-004d-6d4857fb6dc4	2351	Kamnica
00050000-5562-3726-5ee2-19f34145512f	1241	Kamnik
00050000-5562-3726-c11f-59a2193317a0	5213	Kanal
00050000-5562-3726-6a5e-7babc0a62257	8258	Kapele
00050000-5562-3726-84eb-3323c89c902d	2362	Kapla
00050000-5562-3726-8caa-47081052d379	2325	Kidričevo
00050000-5562-3726-2839-9c7301b97877	1412	Kisovec
00050000-5562-3726-aa85-c512fbd93535	6253	Knežak
00050000-5562-3726-069c-9927a3cdac88	5222	Kobarid
00050000-5562-3726-e98c-68c96fe87868	9227	Kobilje
00050000-5562-3726-e83c-763270813108	1330	Kočevje
00050000-5562-3726-8bd6-2867fc6188cb	1338	Kočevska Reka
00050000-5562-3726-efcc-60530a54253a	2276	Kog
00050000-5562-3726-5c60-ea3f9d90b998	5211	Kojsko
00050000-5562-3726-beb2-5c130a1c5aa4	6223	Komen
00050000-5562-3726-ac03-5dfefbbbeabf	1218	Komenda
00050000-5562-3726-2675-4a427cafba2d	6000	Koper/Capodistria 
00050000-5562-3726-68ea-fa33c0c55907	6001	Koper/Capodistria - poštni predali
00050000-5562-3726-353d-085810c88529	8282	Koprivnica
00050000-5562-3726-ffea-a7a0a409b939	5296	Kostanjevica na Krasu
00050000-5562-3726-8b66-6575925f30d7	8311	Kostanjevica na Krki
00050000-5562-3726-6ae7-ea1deb23d8e6	1336	Kostel
00050000-5562-3726-2cb3-bb6c399a516e	6256	Košana
00050000-5562-3726-1499-07d44f85d47c	2394	Kotlje
00050000-5562-3726-696d-283f988f990e	6240	Kozina
00050000-5562-3726-4f3f-e267b7832962	3260	Kozje
00050000-5562-3726-8d17-2fb793ef4716	4000	Kranj 
00050000-5562-3726-5c6c-c9b07921bc71	4001	Kranj - poštni predali
00050000-5562-3726-f59a-bbe552f499f0	4280	Kranjska Gora
00050000-5562-3726-5e9b-8b89952d1c6f	1281	Kresnice
00050000-5562-3726-57f9-071b1a5ada95	4294	Križe
00050000-5562-3726-eca2-714f6b0aeb83	9206	Križevci
00050000-5562-3726-55cd-e69339f468a6	9242	Križevci pri Ljutomeru
00050000-5562-3726-3e44-ea6f886a552b	1301	Krka
00050000-5562-3726-a6ba-f1b60357c04e	8296	Krmelj
00050000-5562-3726-c347-31c066ba0bd9	4245	Kropa
00050000-5562-3726-518e-b0ed457520f3	8262	Krška vas
00050000-5562-3726-ab99-8bb9d767eed8	8270	Krško
00050000-5562-3726-865a-af902a809315	9263	Kuzma
00050000-5562-3726-08ce-5b8ccce63b31	2318	Laporje
00050000-5562-3726-25d5-235d0ecbfe1b	3270	Laško
00050000-5562-3726-b418-4e75d12c58e8	1219	Laze v Tuhinju
00050000-5562-3726-375a-b3958e98277e	2230	Lenart v Slovenskih goricah
00050000-5562-3726-f22b-06b34ec722ab	9220	Lendava/Lendva
00050000-5562-3726-67b8-0dc5d7d376ed	4248	Lesce
00050000-5562-3726-e530-ce8c713023e0	3261	Lesično
00050000-5562-3726-c274-c03a0470024e	8273	Leskovec pri Krškem
00050000-5562-3726-c521-d22065d2c1d9	2372	Libeliče
00050000-5562-3726-bfed-37f2ee37521e	2341	Limbuš
00050000-5562-3726-931a-5815ea9d8f1a	1270	Litija
00050000-5562-3726-a432-3b8c3673ece5	3202	Ljubečna
00050000-5562-3726-b2ba-c2f281289d4d	1000	Ljubljana 
00050000-5562-3726-0d15-2abbd3e42f5d	1001	Ljubljana - poštni predali
00050000-5562-3726-7dc2-e62273ff4da5	1231	Ljubljana - Črnuče
00050000-5562-3726-e8b6-d6bbb13e5d20	1261	Ljubljana - Dobrunje
00050000-5562-3726-08ce-0769b7286113	1260	Ljubljana - Polje
00050000-5562-3726-e96d-794b13e28b5b	1210	Ljubljana - Šentvid
00050000-5562-3726-c1e4-193c270073cf	1211	Ljubljana - Šmartno
00050000-5562-3726-1f63-5ae9cae13774	3333	Ljubno ob Savinji
00050000-5562-3726-9309-40e66d5e4d26	9240	Ljutomer
00050000-5562-3726-91d2-f0225ee05ee4	3215	Loče
00050000-5562-3726-c19e-a335e8195b35	5231	Log pod Mangartom
00050000-5562-3726-450f-07263c1ccafc	1358	Log pri Brezovici
00050000-5562-3726-d0df-35013dc38cb4	1370	Logatec
00050000-5562-3726-9601-6564face210a	1371	Logatec
00050000-5562-3726-4fc6-4b47efcb07e7	1434	Loka pri Zidanem Mostu
00050000-5562-3726-ff88-7503073432b3	3223	Loka pri Žusmu
00050000-5562-3726-adfb-cb7fef700886	6219	Lokev
00050000-5562-3726-66f2-e869b3a80670	1318	Loški Potok
00050000-5562-3726-a740-d611fe642e97	2324	Lovrenc na Dravskem polju
00050000-5562-3726-3c2e-d320617b4749	2344	Lovrenc na Pohorju
00050000-5562-3726-c0a8-7a9d7ee14ff8	3334	Luče
00050000-5562-3726-3e71-8ed9ea46944e	1225	Lukovica
00050000-5562-3726-8eea-69939b5c9b01	9202	Mačkovci
00050000-5562-3726-6d96-270cc9079afc	2322	Majšperk
00050000-5562-3726-8813-791835bd875e	2321	Makole
00050000-5562-3726-ce00-c65b16d2ace4	9243	Mala Nedelja
00050000-5562-3726-3b93-fac65ca22131	2229	Malečnik
00050000-5562-3726-6083-cea5afb46901	6273	Marezige
00050000-5562-3726-7a80-f68b59dcf3ad	2000	Maribor 
00050000-5562-3726-67ac-46c63ee4338d	2001	Maribor - poštni predali
00050000-5562-3726-8ce7-87927d55021c	2206	Marjeta na Dravskem polju
00050000-5562-3726-b2a4-3d283ac99bf0	2281	Markovci
00050000-5562-3726-645f-3b613c1bf072	9221	Martjanci
00050000-5562-3726-432c-c52658d109ca	6242	Materija
00050000-5562-3726-8dd5-4a63667a0a80	4211	Mavčiče
00050000-5562-3726-9da4-cf4500501738	1215	Medvode
00050000-5562-3726-54c3-d0317be131bd	1234	Mengeš
00050000-5562-3726-76fd-5dc4f0b35481	8330	Metlika
00050000-5562-3726-0a7d-952fbbab5896	2392	Mežica
00050000-5562-3726-0045-d3deb1a17afd	2204	Miklavž na Dravskem polju
00050000-5562-3726-058f-64e801dc2c4f	2275	Miklavž pri Ormožu
00050000-5562-3726-6c27-8cc077381383	5291	Miren
00050000-5562-3726-08a4-e6617ab19d68	8233	Mirna
00050000-5562-3726-670c-fc7a1b8e3280	8216	Mirna Peč
00050000-5562-3726-d264-0c1d4330859a	2382	Mislinja
00050000-5562-3726-507e-fde7c89a2381	4281	Mojstrana
00050000-5562-3726-5ae4-2b60f8f032d3	8230	Mokronog
00050000-5562-3726-c048-172a331cd845	1251	Moravče
00050000-5562-3726-832e-1df47d6bc0df	9226	Moravske Toplice
00050000-5562-3726-4c36-0c58230ee7b7	5216	Most na Soči
00050000-5562-3726-47a2-455d1321c098	1221	Motnik
00050000-5562-3726-39ce-91316b1aaf15	3330	Mozirje
00050000-5562-3726-32bd-44522bdb9dde	9000	Murska Sobota 
00050000-5562-3726-5701-916e5f8dca2f	9001	Murska Sobota - poštni predali
00050000-5562-3726-7075-8ec871fa81e5	2366	Muta
00050000-5562-3726-e4aa-e0ef8c76a42b	4202	Naklo
00050000-5562-3726-b4f7-6d78448698c2	3331	Nazarje
00050000-5562-3726-7f76-ea09476a1e44	1357	Notranje Gorice
00050000-5562-3726-2e48-e5e5f80f1878	3203	Nova Cerkev
00050000-5562-3726-07d5-ba5d9a9ed09f	5000	Nova Gorica 
00050000-5562-3726-6cbe-bbf25d5b1ca0	5001	Nova Gorica - poštni predali
00050000-5562-3726-3fc4-87a373ee4322	1385	Nova vas
00050000-5562-3726-c725-884a7a9731bf	8000	Novo mesto
00050000-5562-3726-523c-95abc086285f	8001	Novo mesto - poštni predali
00050000-5562-3726-df6f-95554a375b6a	6243	Obrov
00050000-5562-3726-d4e5-d07ca7f7bdeb	9233	Odranci
00050000-5562-3726-6f3b-2e8d54ce5acc	2317	Oplotnica
00050000-5562-3726-2359-1dba85523332	2312	Orehova vas
00050000-5562-3726-dded-1f758af31bfb	2270	Ormož
00050000-5562-3726-9064-97ef4ee95456	1316	Ortnek
00050000-5562-3726-ccb1-24711a473b46	1337	Osilnica
00050000-5562-3726-7cd5-87d92bdda2ee	8222	Otočec
00050000-5562-3726-1430-08f738c078fd	2361	Ožbalt
00050000-5562-3726-d08c-11b2bddd7239	2231	Pernica
00050000-5562-3726-b33d-c81690cb31d1	2211	Pesnica pri Mariboru
00050000-5562-3726-7b22-1d2f3967156d	9203	Petrovci
00050000-5562-3726-ab7c-2cca1445c234	3301	Petrovče
00050000-5562-3726-3ef1-0550ffd4d077	6330	Piran/Pirano
00050000-5562-3726-3fbc-fbaf8a9371b7	8255	Pišece
00050000-5562-3726-a19a-b5b5b0361d2b	6257	Pivka
00050000-5562-3726-ba05-62cf6a087589	6232	Planina
00050000-5562-3726-29dd-12b1dabbbbff	3225	Planina pri Sevnici
00050000-5562-3726-8f30-b2ed9f1ac316	6276	Pobegi
00050000-5562-3726-4862-abe5e503f785	8312	Podbočje
00050000-5562-3726-0a33-fb933df4e7c4	5243	Podbrdo
00050000-5562-3726-15f3-71aeaabc464c	3254	Podčetrtek
00050000-5562-3726-c034-55e79d7c7a84	2273	Podgorci
00050000-5562-3726-8765-a7f77153e1a8	6216	Podgorje
00050000-5562-3726-4220-a0da458e83eb	2381	Podgorje pri Slovenj Gradcu
00050000-5562-3726-8f20-c1d81b6160e2	6244	Podgrad
00050000-5562-3726-1260-784d45863b4a	1414	Podkum
00050000-5562-3726-dbd9-ef780ca8e41c	2286	Podlehnik
00050000-5562-3726-40ef-ba284f9fadfa	5272	Podnanos
00050000-5562-3726-db86-298a4a5992f4	4244	Podnart
00050000-5562-3726-ff8e-0d7c82d61325	3241	Podplat
00050000-5562-3726-54b5-63943bcdca07	3257	Podsreda
00050000-5562-3726-9a90-b2590b402c33	2363	Podvelka
00050000-5562-3726-95a6-7a50621444a8	2208	Pohorje
00050000-5562-3726-3918-b89f45e4e59c	2257	Polenšak
00050000-5562-3726-42c7-7a42e60051bc	1355	Polhov Gradec
00050000-5562-3726-0a7a-acf98c5d8bf3	4223	Poljane nad Škofjo Loko
00050000-5562-3726-20bd-24b7358f96c6	2319	Poljčane
00050000-5562-3726-b8d1-9d0413843301	1272	Polšnik
00050000-5562-3726-28a7-73515855b7cb	3313	Polzela
00050000-5562-3726-3f24-85997c9f3c93	3232	Ponikva
00050000-5562-3726-6531-092567567636	6320	Portorož/Portorose
00050000-5562-3726-5d5a-b1f2df66333a	6230	Postojna
00050000-5562-3726-40f2-21e02422f4f8	2331	Pragersko
00050000-5562-3726-deac-bd6b500a8e20	3312	Prebold
00050000-5562-3726-1fc7-aab188ac5087	4205	Preddvor
00050000-5562-3726-eb37-53988297a1e8	6255	Prem
00050000-5562-3726-321c-9ddac85c89df	1352	Preserje
00050000-5562-3726-f44f-6fb7b8b8b800	6258	Prestranek
00050000-5562-3726-fbfc-fd234e5f1b78	2391	Prevalje
00050000-5562-3726-703b-ffda38161997	3262	Prevorje
00050000-5562-3726-ea68-7584b2d2765c	1276	Primskovo 
00050000-5562-3726-76d6-30809fd710a1	3253	Pristava pri Mestinju
00050000-5562-3726-471b-494991a7f1e5	9207	Prosenjakovci/Partosfalva
00050000-5562-3726-89fd-851fefe4eb93	5297	Prvačina
00050000-5562-3726-386b-3051b2e2b413	2250	Ptuj
00050000-5562-3726-c308-8d22ce1ee441	2323	Ptujska Gora
00050000-5562-3726-c4e5-3a01a92f84c9	9201	Puconci
00050000-5562-3726-995f-e1b577c36b39	2327	Rače
00050000-5562-3726-5994-09d20c7d9eeb	1433	Radeče
00050000-5562-3726-089b-7f9bdb2d962c	9252	Radenci
00050000-5562-3726-1c08-984237f7cd4b	2360	Radlje ob Dravi
00050000-5562-3726-6a0e-e98523882c08	1235	Radomlje
00050000-5562-3726-2fa8-f6516b4a02cd	4240	Radovljica
00050000-5562-3726-3ada-ef25bc71cc8f	8274	Raka
00050000-5562-3726-3b76-e29e439ae972	1381	Rakek
00050000-5562-3726-7603-97d988e2088f	4283	Rateče - Planica
00050000-5562-3726-0c2e-cbf91cfe7ccc	2390	Ravne na Koroškem
00050000-5562-3726-a4c9-2cd12e0befc4	9246	Razkrižje
00050000-5562-3726-e14c-f6a6e7e64767	3332	Rečica ob Savinji
00050000-5562-3726-2fba-e57361ef8781	5292	Renče
00050000-5562-3726-f7d1-4c6ec4c571b4	1310	Ribnica
00050000-5562-3726-854e-fab4aadb63e1	2364	Ribnica na Pohorju
00050000-5562-3726-fc5c-995bb0e7d544	3272	Rimske Toplice
00050000-5562-3726-93fa-d8271f02829d	1314	Rob
00050000-5562-3726-8e6b-064042fc130f	5215	Ročinj
00050000-5562-3726-2220-2919ad084402	3250	Rogaška Slatina
00050000-5562-3726-8315-85407f8329d2	9262	Rogašovci
00050000-5562-3726-d586-cc3b0e7544f6	3252	Rogatec
00050000-5562-3726-93da-9025cb6103c7	1373	Rovte
00050000-5562-3726-47e7-d38ec660bd4c	2342	Ruše
00050000-5562-3726-81bb-f053a5df174c	1282	Sava
00050000-5562-3726-329a-d61941c83847	6333	Sečovlje/Sicciole
00050000-5562-3726-78ba-02ab13c78cb4	4227	Selca
00050000-5562-3726-472a-6d39eb8396ff	2352	Selnica ob Dravi
00050000-5562-3726-c1b3-5e7f79f438ab	8333	Semič
00050000-5562-3726-f00e-1f057279646c	8281	Senovo
00050000-5562-3726-70a0-4c110375f501	6224	Senožeče
00050000-5562-3726-03dc-9617864e9e5e	8290	Sevnica
00050000-5562-3726-f8ce-11ef973c67c1	6210	Sežana
00050000-5562-3726-3c82-de514c47fc78	2214	Sladki Vrh
00050000-5562-3726-9666-a3d51a786d61	5283	Slap ob Idrijci
00050000-5562-3726-32f3-099e994b9506	2380	Slovenj Gradec
00050000-5562-3726-e439-aeacb27ac727	2310	Slovenska Bistrica
00050000-5562-3726-1013-c187cea00a41	3210	Slovenske Konjice
00050000-5562-3726-05d4-052ec2b3fee0	1216	Smlednik
00050000-5562-3726-14ad-f9e5f2c81538	5232	Soča
00050000-5562-3726-2a3f-1ce6cc26e1e5	1317	Sodražica
00050000-5562-3726-ab22-dda011f9032c	3335	Solčava
00050000-5562-3726-a2f2-4409c454a162	5250	Solkan
00050000-5562-3726-4df0-c6bd2f8b5dde	4229	Sorica
00050000-5562-3726-9264-e29b774c238a	4225	Sovodenj
00050000-5562-3726-9f08-6d02bb1b151b	5281	Spodnja Idrija
00050000-5562-3726-200a-2ffe76d97bbc	2241	Spodnji Duplek
00050000-5562-3726-fc19-294ff1086522	9245	Spodnji Ivanjci
00050000-5562-3726-97aa-b91559d5d365	2277	Središče ob Dravi
00050000-5562-3726-d238-75a97c7287bc	4267	Srednja vas v Bohinju
00050000-5562-3726-19e7-04f22b36616e	8256	Sromlje 
00050000-5562-3726-b2dd-5ed51bd4bc28	5224	Srpenica
00050000-5562-3726-e6fc-81906f9709af	1242	Stahovica
00050000-5562-3726-1a00-b2906d33a67e	1332	Stara Cerkev
00050000-5562-3726-7230-0fbfcff6f52e	8342	Stari trg ob Kolpi
00050000-5562-3726-5573-62ef08971ca9	1386	Stari trg pri Ložu
00050000-5562-3726-c5c0-706a89be821b	2205	Starše
00050000-5562-3726-ac97-5fbb424492f6	2289	Stoperce
00050000-5562-3726-203f-c3956343b2fa	8322	Stopiče
00050000-5562-3726-f852-b37f08e60c11	3206	Stranice
00050000-5562-3726-a082-18af34106cdd	8351	Straža
00050000-5562-3726-8d61-914544c898fe	1313	Struge
00050000-5562-3726-4074-c3beb2664b08	8293	Studenec
00050000-5562-3726-f264-91be6c09706b	8331	Suhor
00050000-5562-3726-ba32-0644eef1e258	2233	Sv. Ana v Slovenskih goricah
00050000-5562-3726-3291-5575db28aa71	2235	Sv. Trojica v Slovenskih goricah
00050000-5562-3726-9938-8b3591d2549c	2353	Sveti Duh na Ostrem Vrhu
00050000-5562-3726-d90a-6b83b333a014	9244	Sveti Jurij ob Ščavnici
00050000-5562-3726-f359-049d38800e7c	3264	Sveti Štefan
00050000-5562-3726-5901-1502d0826ae4	2258	Sveti Tomaž
00050000-5562-3726-2e9a-c4c3a6ecf229	9204	Šalovci
00050000-5562-3726-7b63-14167da171cc	5261	Šempas
00050000-5562-3726-e01b-670e44c7de4c	5290	Šempeter pri Gorici
00050000-5562-3726-489d-204c6f19baa5	3311	Šempeter v Savinjski dolini
00050000-5562-3726-cd96-4276c962162c	4208	Šenčur
00050000-5562-3726-a7c3-460fa5f4fa76	2212	Šentilj v Slovenskih goricah
00050000-5562-3726-1cd8-28acaffe6569	8297	Šentjanž
00050000-5562-3726-8e10-a01bf0735f90	2373	Šentjanž pri Dravogradu
00050000-5562-3726-c9b4-a40c72ade9cc	8310	Šentjernej
00050000-5562-3726-9193-00a15db23bb0	3230	Šentjur
00050000-5562-3726-3f69-a0d26eba4f43	3271	Šentrupert
00050000-5562-3726-f199-15169aded423	8232	Šentrupert
00050000-5562-3726-5147-01827247802d	1296	Šentvid pri Stični
00050000-5562-3726-df8f-ed87a2ac6f9b	8275	Škocjan
00050000-5562-3726-cf3b-d33b6fe22d08	6281	Škofije
00050000-5562-3726-aee3-04481f4dcaa6	4220	Škofja Loka
00050000-5562-3726-3688-f89fbf5a2cfc	3211	Škofja vas
00050000-5562-3726-5883-1a8b0daf0a25	1291	Škofljica
00050000-5562-3726-201d-d5e154ce94cf	6274	Šmarje
00050000-5562-3726-5db0-7ece5c1faae4	1293	Šmarje - Sap
00050000-5562-3726-8bcb-f8e75b4ebf7c	3240	Šmarje pri Jelšah
00050000-5562-3726-8ec4-b096a0b02913	8220	Šmarješke Toplice
00050000-5562-3726-463c-fb76354c0387	2315	Šmartno na Pohorju
00050000-5562-3726-0aee-287ccb09d000	3341	Šmartno ob Dreti
00050000-5562-3726-2c89-a5e615cad451	3327	Šmartno ob Paki
00050000-5562-3726-60b1-efc6997dd0f0	1275	Šmartno pri Litiji
00050000-5562-3726-2123-ecdf41febb21	2383	Šmartno pri Slovenj Gradcu
00050000-5562-3726-cc97-b9270e0d9f23	3201	Šmartno v Rožni dolini
00050000-5562-3726-3b9e-2f7e8a6bfdaf	3325	Šoštanj
00050000-5562-3726-e1ca-f9c0733685db	6222	Štanjel
00050000-5562-3726-f72f-56314e008c76	3220	Štore
00050000-5562-3726-12d2-7aab6c2145c0	3304	Tabor
00050000-5562-3726-fd65-a77a33b53d1a	3221	Teharje
00050000-5562-3726-e0b6-dbe43560ed69	9251	Tišina
00050000-5562-3726-c157-cc29cd16345b	5220	Tolmin
00050000-5562-3726-f54e-829ec322e669	3326	Topolšica
00050000-5562-3726-be56-a2d89716a2cd	2371	Trbonje
00050000-5562-3726-e27a-07f02e1ba179	1420	Trbovlje
00050000-5562-3726-4556-f9c36aee4811	8231	Trebelno 
00050000-5562-3726-60a3-4672baf9ac9b	8210	Trebnje
00050000-5562-3726-6195-20539e0f62c5	5252	Trnovo pri Gorici
00050000-5562-3726-db38-d1a5275fec00	2254	Trnovska vas
00050000-5562-3726-0611-c54c39fb567e	1222	Trojane
00050000-5562-3726-7e2a-3c659bdf447c	1236	Trzin
00050000-5562-3726-060f-5f698f9e2364	4290	Tržič
00050000-5562-3726-f1dc-e0a7f581d3c5	8295	Tržišče
00050000-5562-3726-7158-69aa8d16df4f	1311	Turjak
00050000-5562-3726-af01-324203b31daa	9224	Turnišče
00050000-5562-3726-1653-90cc2c4314f1	8323	Uršna sela
00050000-5562-3726-56ae-3aaef63cdba5	1252	Vače
00050000-5562-3726-45bd-01c1bd40b171	3320	Velenje 
00050000-5562-3726-f985-7175e7b3f2f7	3322	Velenje - poštni predali
00050000-5562-3726-05a5-1a367ba5ca77	8212	Velika Loka
00050000-5562-3726-a2ae-0052e1b74d5a	2274	Velika Nedelja
00050000-5562-3726-7bbf-06bd91f8dbf7	9225	Velika Polana
00050000-5562-3726-5032-42c8baaeae32	1315	Velike Lašče
00050000-5562-3726-2f1f-4ef9dd7b5bc0	8213	Veliki Gaber
00050000-5562-3726-f19a-2143b29edadd	9241	Veržej
00050000-5562-3726-5167-24b4041600ee	1312	Videm - Dobrepolje
00050000-5562-3726-4e77-15650651c1ec	2284	Videm pri Ptuju
00050000-5562-3726-295b-c6a5767769b7	8344	Vinica
00050000-5562-3726-5237-cfffc086569e	5271	Vipava
00050000-5562-3726-c55f-ffba3368fc02	4212	Visoko
00050000-5562-3726-a71b-59b3bcbe3525	1294	Višnja Gora
00050000-5562-3726-691f-e0119f28817c	3205	Vitanje
00050000-5562-3726-b357-f02c8c09fe83	2255	Vitomarci
00050000-5562-3726-00dd-4de76b14f680	1217	Vodice
00050000-5562-3726-72f5-6260f0408021	3212	Vojnik\t
00050000-5562-3726-dabb-dfa2a09ac253	5293	Volčja Draga
00050000-5562-3726-8f8a-1b62d460ff26	2232	Voličina
00050000-5562-3726-ea9b-b98254061d78	3305	Vransko
00050000-5562-3726-62d1-f7d64059ed7b	6217	Vremski Britof
00050000-5562-3726-c1e3-97fbe03fadb2	1360	Vrhnika
00050000-5562-3726-bca9-ada49745d33d	2365	Vuhred
00050000-5562-3726-4278-fc387672a884	2367	Vuzenica
00050000-5562-3726-f384-1788c6a5236a	8292	Zabukovje 
00050000-5562-3726-1451-b9879df123a1	1410	Zagorje ob Savi
00050000-5562-3726-65cd-8fc683078a21	1303	Zagradec
00050000-5562-3726-bac4-9a10b28904b3	2283	Zavrč
00050000-5562-3726-bb34-d01fb06762cb	8272	Zdole 
00050000-5562-3726-e20e-cc4ee09629e0	4201	Zgornja Besnica
00050000-5562-3726-7408-4f40866e3356	2242	Zgornja Korena
00050000-5562-3726-a0b5-8dfbffd13bfc	2201	Zgornja Kungota
00050000-5562-3726-43c4-9df854338b02	2316	Zgornja Ložnica
00050000-5562-3726-7a2b-acb451e7f531	2314	Zgornja Polskava
00050000-5562-3726-938b-1a6aecf676ad	2213	Zgornja Velka
00050000-5562-3726-295c-033557f96ef8	4247	Zgornje Gorje
00050000-5562-3726-3da2-b10b149b91f3	4206	Zgornje Jezersko
00050000-5562-3726-dbf9-a935b1679626	2285	Zgornji Leskovec
00050000-5562-3726-6dc5-b99a0e99257a	1432	Zidani Most
00050000-5562-3726-a331-861a477810a2	3214	Zreče
00050000-5562-3726-6479-3c9e08474e8b	4209	Žabnica
00050000-5562-3726-c905-770de80cc029	3310	Žalec
00050000-5562-3726-2309-b2d21f73612d	4228	Železniki
00050000-5562-3726-95a5-bdd6a3b290b0	2287	Žetale
00050000-5562-3726-6d26-f28771333240	4226	Žiri
00050000-5562-3726-b44a-092e253ca176	4274	Žirovnica
00050000-5562-3726-ca6a-aa772af0d4ff	8360	Žužemberk
\.


--
-- TOC entry 2957 (class 0 OID 122775)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2941 (class 0 OID 122628)
-- Dependencies: 187
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2948 (class 0 OID 122706)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2958 (class 0 OID 122781)
-- Dependencies: 204
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 122922)
-- Dependencies: 217
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 122937)
-- Dependencies: 218
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2959 (class 0 OID 122788)
-- Dependencies: 205
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2960 (class 0 OID 122797)
-- Dependencies: 206
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2961 (class 0 OID 122806)
-- Dependencies: 207
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2973 (class 0 OID 122944)
-- Dependencies: 219
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2974 (class 0 OID 122955)
-- Dependencies: 220
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2928 (class 0 OID 122475)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5562-3727-f601-fd41e052e9f2	00010000-5562-3727-8025-c688ebd4e84d	2015-05-24 22:40:26	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROv2lPJ5QRIqBU.q4dBOVcLwkrDCWAN5a";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2992 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2962 (class 0 OID 122816)
-- Dependencies: 208
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2929 (class 0 OID 122484)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5562-3727-8be6-34bb5688acef	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5562-3727-9bb8-ef72da0fbf04	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5562-3727-3283-cab30a33e8d9	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5562-3727-07bf-b1648152661a	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5562-3727-89c7-83fe5dd268d1	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5562-3727-28e5-898ea078c386	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2932 (class 0 OID 122514)
-- Dependencies: 178
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5562-3727-f601-fd41e052e9f2	00020000-5562-3727-07bf-b1648152661a
00010000-5562-3727-8025-c688ebd4e84d	00020000-5562-3727-07bf-b1648152661a
\.


--
-- TOC entry 2963 (class 0 OID 122822)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 122834)
-- Dependencies: 210
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2949 (class 0 OID 122714)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2981 (class 0 OID 123037)
-- Dependencies: 227
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5562-3727-15c7-f9eb2d31fca6	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5562-3727-555b-580c15c7df6c	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5562-3727-baf7-d796f5b0246d	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5562-3727-0a57-4bc583ae7d54	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2982 (class 0 OID 123045)
-- Dependencies: 228
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5562-3727-083b-80b1a58cf2b1	00000000-5562-3727-baf7-d796f5b0246d	popa
00000000-5562-3727-6331-f8bff489d4bd	00000000-5562-3727-baf7-d796f5b0246d	oseba
00000000-5562-3727-1385-96890a9df3fb	00000000-5562-3727-baf7-d796f5b0246d	besedilo
00000000-5562-3727-2926-ff472cd172bc	00000000-5562-3727-baf7-d796f5b0246d	uprizoritev
00000000-5562-3727-5139-a47c8bfcde61	00000000-5562-3727-baf7-d796f5b0246d	funkcija
00000000-5562-3727-56b1-245659138120	00000000-5562-3727-baf7-d796f5b0246d	tipfunkcije
\.


--
-- TOC entry 2983 (class 0 OID 123052)
-- Dependencies: 229
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2975 (class 0 OID 122965)
-- Dependencies: 221
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 0)
-- Dependencies: 230
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('strosekuprizoritve_id_seq', 1, false);


--
-- TOC entry 2942 (class 0 OID 122643)
-- Dependencies: 188
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2952 (class 0 OID 122734)
-- Dependencies: 198
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2976 (class 0 OID 122978)
-- Dependencies: 222
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5562-3728-5be2-4f77bad6ff33	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5562-3728-5296-a0e522c4c913	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5562-3728-862a-058c92e8e535	Baletnik ali plesalec	Baletniki in plesalci	\N	Baletnica ali plesalka	igralec
000f0000-5562-3728-afc9-ed2d788a2765	Avtor	Avtorji	\N	Avtorka	umetnik
000f0000-5562-3728-d8f4-4a37290ace86	Režiser	Režiserji	\N	Režiserka	umetnik
000f0000-5562-3728-9cf4-9d4b462c0025	Scenograf	Scenografi	\N	Scenografka	tehnik
000f0000-5562-3728-f433-3d8f0ad68ce5	Kostumograf	Kostumografi	\N	Kostumografinja	tehnik
000f0000-5562-3728-0130-25f708c3ca0c	Oblikovalec maske	Oblikovalci maske	\N	Oblikovalka maske	tehnik
000f0000-5562-3728-8598-65af7124aae4	Avtor glasbe	Avtorji glasbe	\N	Avtorica glasbe	umetnik
000f0000-5562-3728-1683-f5bcf8e70b0a	Oblikovalec svetlobe	Oblikovalci svetlobe	\N	Oblikovalka svetlobe	tehnik
000f0000-5562-3728-eaaf-58509aa6aaa4	Koreograf	Koreografi	\N	Koreografinja	umetnik
000f0000-5562-3728-55e6-7125763edf8e	Dramaturg	Dramaturgi	\N	Dramaturginja	umetnik
000f0000-5562-3728-ee90-e18fd86561b7	Lektorj	Lektorji	\N	Lektorica	umetnik
000f0000-5562-3728-d723-754aaa66cac2	Prevajalec	Prevajalci	\N	Prevajalka	umetnik
000f0000-5562-3728-d8bf-14e146e40d13	Oblikovalec videa	Oblikovalci videa	\N	Oblikovalka videa	umetnik
000f0000-5562-3728-237c-51c89e3b0607	Intermedijski ustvarjalec	Intermedijski ustvarjalci	\N	Intermedijska ustvarjalka	umetnik
\.


--
-- TOC entry 2943 (class 0 OID 122651)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 122501)
-- Dependencies: 177
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5562-3727-8025-c688ebd4e84d	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROtrkxJvAPGhEIiPru70eSZfWJdIfxcp.	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5562-3727-f601-fd41e052e9f2	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2977 (class 0 OID 122989)
-- Dependencies: 223
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
\.


--
-- TOC entry 2950 (class 0 OID 122720)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 122840)
-- Dependencies: 211
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 123009)
-- Dependencies: 224
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2951 (class 0 OID 122729)
-- Dependencies: 197
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2979 (class 0 OID 123017)
-- Dependencies: 225
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 123027)
-- Dependencies: 226
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2551 (class 2606 OID 122529)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 122855)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 122875)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 122891)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 122678)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 122692)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2553 (class 2606 OID 122542)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 122902)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 122698)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 122704)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 122751)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 122759)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 122557)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 122567)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 122617)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2567 (class 2606 OID 122590)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 122498)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2534 (class 2606 OID 122472)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 122765)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 122774)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 122917)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 122610)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 122626)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 122779)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 122639)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 122710)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 122785)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 122934)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 122942)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2647 (class 2606 OID 122795)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 122801)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 122811)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 122954)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 122962)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 122483)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 122820)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 122518)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2538 (class 2606 OID 122492)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 122830)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 122839)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 122719)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 123043)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 123049)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 123056)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 122975)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 122648)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 122743)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 122988)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 122662)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 122513)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 123004)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 122727)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 122846)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 123015)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 122733)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 123026)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 123036)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 1259 OID 122685)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2711 (class 1259 OID 122976)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2712 (class 1259 OID 122977)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2569 (class 1259 OID 122612)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2634 (class 1259 OID 122766)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2642 (class 1259 OID 122787)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2643 (class 1259 OID 122786)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2619 (class 1259 OID 122728)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2689 (class 1259 OID 122905)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2690 (class 1259 OID 122903)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2691 (class 1259 OID 122904)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2692 (class 1259 OID 122919)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2693 (class 1259 OID 122920)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2694 (class 1259 OID 122921)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2717 (class 1259 OID 123008)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2718 (class 1259 OID 123005)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2719 (class 1259 OID 123007)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2720 (class 1259 OID 123006)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2589 (class 1259 OID 122664)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2590 (class 1259 OID 122663)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2573 (class 1259 OID 122619)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2574 (class 1259 OID 122618)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2565 (class 1259 OID 122592)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2661 (class 1259 OID 122821)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2611 (class 1259 OID 122705)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2540 (class 1259 OID 122499)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2541 (class 1259 OID 122500)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2664 (class 1259 OID 122833)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2665 (class 1259 OID 122832)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2666 (class 1259 OID 122831)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2612 (class 1259 OID 122711)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2613 (class 1259 OID 122713)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2614 (class 1259 OID 122712)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2733 (class 1259 OID 123051)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2655 (class 1259 OID 122815)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2656 (class 1259 OID 122813)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2657 (class 1259 OID 122812)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2658 (class 1259 OID 122814)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2546 (class 1259 OID 122519)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2547 (class 1259 OID 122520)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2671 (class 1259 OID 122847)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2639 (class 1259 OID 122780)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2707 (class 1259 OID 122963)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2708 (class 1259 OID 122964)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2580 (class 1259 OID 122641)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2581 (class 1259 OID 122640)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2582 (class 1259 OID 122642)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2698 (class 1259 OID 122935)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2699 (class 1259 OID 122936)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2676 (class 1259 OID 122858)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2677 (class 1259 OID 122857)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2678 (class 1259 OID 122860)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2679 (class 1259 OID 122856)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2680 (class 1259 OID 122859)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2723 (class 1259 OID 123016)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2649 (class 1259 OID 122805)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2650 (class 1259 OID 122804)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2651 (class 1259 OID 122802)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2652 (class 1259 OID 122803)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2683 (class 1259 OID 122877)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2684 (class 1259 OID 122876)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2608 (class 1259 OID 122699)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2561 (class 1259 OID 122569)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2562 (class 1259 OID 122568)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2585 (class 1259 OID 122649)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2586 (class 1259 OID 122650)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2624 (class 1259 OID 122746)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2625 (class 1259 OID 122745)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2626 (class 1259 OID 122744)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2596 (class 1259 OID 122687)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2597 (class 1259 OID 122683)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2598 (class 1259 OID 122680)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2599 (class 1259 OID 122681)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2600 (class 1259 OID 122679)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2601 (class 1259 OID 122684)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2602 (class 1259 OID 122682)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2572 (class 1259 OID 122611)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2554 (class 1259 OID 122543)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2555 (class 1259 OID 122545)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2556 (class 1259 OID 122544)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2557 (class 1259 OID 122546)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2631 (class 1259 OID 122752)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2697 (class 1259 OID 122918)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2568 (class 1259 OID 122591)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2732 (class 1259 OID 123044)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2560 (class 1259 OID 122558)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2736 (class 1259 OID 123050)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2648 (class 1259 OID 122796)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2579 (class 1259 OID 122627)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 122943)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2539 (class 1259 OID 122493)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2603 (class 1259 OID 122686)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2761 (class 2606 OID 123169)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2758 (class 2606 OID 123154)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2759 (class 2606 OID 123159)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2763 (class 2606 OID 123179)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2757 (class 2606 OID 123149)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2762 (class 2606 OID 123174)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2760 (class 2606 OID 123164)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2809 (class 2606 OID 123409)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2810 (class 2606 OID 123414)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2747 (class 2606 OID 123099)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2774 (class 2606 OID 123234)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2777 (class 2606 OID 123249)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2776 (class 2606 OID 123244)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2769 (class 2606 OID 123209)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2800 (class 2606 OID 123364)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2798 (class 2606 OID 123354)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2799 (class 2606 OID 123359)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2773 (class 2606 OID 123229)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2801 (class 2606 OID 123369)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2802 (class 2606 OID 123374)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2803 (class 2606 OID 123379)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2814 (class 2606 OID 123434)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2811 (class 2606 OID 123419)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2813 (class 2606 OID 123429)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2812 (class 2606 OID 123424)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2756 (class 2606 OID 123144)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2755 (class 2606 OID 123139)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2749 (class 2606 OID 123109)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2748 (class 2606 OID 123104)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2746 (class 2606 OID 123094)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2745 (class 2606 OID 123089)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2786 (class 2606 OID 123294)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2765 (class 2606 OID 123189)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2739 (class 2606 OID 123059)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2740 (class 2606 OID 123064)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2789 (class 2606 OID 123309)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2788 (class 2606 OID 123304)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2787 (class 2606 OID 123299)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2766 (class 2606 OID 123194)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2768 (class 2606 OID 123204)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2767 (class 2606 OID 123199)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2816 (class 2606 OID 123444)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2785 (class 2606 OID 123289)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2783 (class 2606 OID 123279)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2782 (class 2606 OID 123274)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2784 (class 2606 OID 123284)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2741 (class 2606 OID 123069)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2742 (class 2606 OID 123074)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2790 (class 2606 OID 123314)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2775 (class 2606 OID 123239)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2807 (class 2606 OID 123399)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2808 (class 2606 OID 123404)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2751 (class 2606 OID 123119)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2750 (class 2606 OID 123114)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2752 (class 2606 OID 123124)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2804 (class 2606 OID 123384)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2805 (class 2606 OID 123389)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2793 (class 2606 OID 123329)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2792 (class 2606 OID 123324)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2795 (class 2606 OID 123339)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2791 (class 2606 OID 123319)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2794 (class 2606 OID 123334)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2815 (class 2606 OID 123439)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2781 (class 2606 OID 123269)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2780 (class 2606 OID 123264)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2778 (class 2606 OID 123254)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2779 (class 2606 OID 123259)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2797 (class 2606 OID 123349)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2796 (class 2606 OID 123344)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2764 (class 2606 OID 123184)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2806 (class 2606 OID 123394)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2744 (class 2606 OID 123084)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2743 (class 2606 OID 123079)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2753 (class 2606 OID 123129)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2754 (class 2606 OID 123134)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2772 (class 2606 OID 123224)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2771 (class 2606 OID 123219)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2770 (class 2606 OID 123214)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-24 22:40:36 CEST

--
-- PostgreSQL database dump complete
--

