--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-04-15 08:43:27 CEST

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
-- TOC entry 177 (class 1259 OID 408473)
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
-- TOC entry 223 (class 1259 OID 408955)
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
-- TOC entry 222 (class 1259 OID 408938)
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
-- TOC entry 215 (class 1259 OID 408854)
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
-- TOC entry 191 (class 1259 OID 408638)
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
-- TOC entry 194 (class 1259 OID 408679)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 187 (class 1259 OID 408600)
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
-- TOC entry 210 (class 1259 OID 408804)
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
-- TOC entry 189 (class 1259 OID 408625)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 193 (class 1259 OID 408673)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 179 (class 1259 OID 408493)
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
-- TOC entry 199 (class 1259 OID 408722)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 203 (class 1259 OID 408747)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 185 (class 1259 OID 408574)
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
-- TOC entry 178 (class 1259 OID 408482)
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
-- TOC entry 182 (class 1259 OID 408544)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 174 (class 1259 OID 408447)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 408466)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 204 (class 1259 OID 408754)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 408784)
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
-- TOC entry 219 (class 1259 OID 408896)
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
-- TOC entry 181 (class 1259 OID 408523)
-- Name: popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE popa (
    id uuid NOT NULL,
    drzava_id uuid,
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
-- TOC entry 184 (class 1259 OID 408566)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 408728)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 183 (class 1259 OID 408551)
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
-- TOC entry 188 (class 1259 OID 408617)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 202 (class 1259 OID 408740)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 408845)
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
-- TOC entry 218 (class 1259 OID 408889)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 408769)
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
-- TOC entry 198 (class 1259 OID 408713)
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
-- TOC entry 197 (class 1259 OID 408703)
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
-- TOC entry 217 (class 1259 OID 408879)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 408835)
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
-- TOC entry 171 (class 1259 OID 408419)
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
-- TOC entry 170 (class 1259 OID 408417)
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
-- TOC entry 207 (class 1259 OID 408778)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 175 (class 1259 OID 408456)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 173 (class 1259 OID 408440)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 408792)
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
-- TOC entry 201 (class 1259 OID 408734)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 195 (class 1259 OID 408684)
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
-- TOC entry 180 (class 1259 OID 408516)
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
-- TOC entry 196 (class 1259 OID 408690)
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
-- TOC entry 216 (class 1259 OID 408870)
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
-- TOC entry 186 (class 1259 OID 408586)
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
-- TOC entry 172 (class 1259 OID 408428)
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
-- TOC entry 221 (class 1259 OID 408920)
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
-- TOC entry 190 (class 1259 OID 408632)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 205 (class 1259 OID 408761)
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
-- TOC entry 212 (class 1259 OID 408827)
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
-- TOC entry 192 (class 1259 OID 408660)
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
-- TOC entry 220 (class 1259 OID 408910)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 408817)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2093 (class 2604 OID 408422)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2595 (class 0 OID 408473)
-- Dependencies: 177
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 408955)
-- Dependencies: 223
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, vloga_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen) FROM stdin;
\.


--
-- TOC entry 2640 (class 0 OID 408938)
-- Dependencies: 222
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2633 (class 0 OID 408854)
-- Dependencies: 215
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2609 (class 0 OID 408638)
-- Dependencies: 191
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2612 (class 0 OID 408679)
-- Dependencies: 194
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2605 (class 0 OID 408600)
-- Dependencies: 187
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-552e-088d-268e-590ed5909b19	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-552e-088d-d9d8-3cd728ff2bed	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-552e-088d-25af-012c04deb86a	AL	ALB	008	Albania 	Albanija	\N
00040000-552e-088d-c02f-b4d212805178	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-552e-088d-2a97-15fa41e40465	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-552e-088d-b5a4-0456535f657d	AD	AND	020	Andorra 	Andora	\N
00040000-552e-088d-aede-879aee17a526	AO	AGO	024	Angola 	Angola	\N
00040000-552e-088d-f9ed-c7d71368d9a5	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-552e-088d-0be7-ea951ef84bf8	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-552e-088d-0ef4-024c77e83be1	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-552e-088d-318d-b3bd24305817	AR	ARG	032	Argentina 	Argenitna	\N
00040000-552e-088d-b992-6bc029403f8f	AM	ARM	051	Armenia 	Armenija	\N
00040000-552e-088d-3c27-245c640d0943	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-552e-088d-0180-3d486d1f6f12	AU	AUS	036	Australia 	Avstralija	\N
00040000-552e-088d-d834-7e96553fdc6c	AT	AUT	040	Austria 	Avstrija	\N
00040000-552e-088d-d1e1-ae051d432f00	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-552e-088d-ac7a-1d35b9472800	BS	BHS	044	Bahamas 	Bahami	\N
00040000-552e-088d-c547-6c0f828ce3d2	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-552e-088d-5c59-c905d6240201	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-552e-088d-c720-255a1de2bf4e	BB	BRB	052	Barbados 	Barbados	\N
00040000-552e-088d-3b7f-09f55cca1100	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-552e-088d-6e0a-b3b36934814b	BE	BEL	056	Belgium 	Belgija	\N
00040000-552e-088d-dd5e-7c5ffe09a372	BZ	BLZ	084	Belize 	Belize	\N
00040000-552e-088d-d1e6-6f040719ca1a	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-552e-088d-bb1b-9fe78f918e8a	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-552e-088d-1d0d-9343c2d62122	BT	BTN	064	Bhutan 	Butan	\N
00040000-552e-088d-4ef8-48a4688e630f	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-552e-088d-2f39-7ad08822fab3	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-552e-088d-dc52-ee45f5853d34	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-552e-088d-f56d-828088bd8636	BW	BWA	072	Botswana 	Bocvana	\N
00040000-552e-088d-0ee3-cffb1f608fbf	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-552e-088d-70fb-b167be7ab9d9	BR	BRA	076	Brazil 	Brazilija	\N
00040000-552e-088d-f543-f05790a9b98f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-552e-088d-11df-d190a9d2e9b2	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-552e-088d-b973-ab5c57bff6d6	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-552e-088d-b3a8-2eef5b550c22	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-552e-088d-7012-8bb6f0a0c1ac	BI	BDI	108	Burundi 	Burundi 	\N
00040000-552e-088d-e5db-2efb66a93dd6	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-552e-088d-fade-374dd73d944a	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-552e-088d-5849-56573d201d2f	CA	CAN	124	Canada 	Kanada	\N
00040000-552e-088d-93fb-c1b62b972a5b	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-552e-088d-51cd-f79dd8498f11	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-552e-088d-0035-e15cd422a689	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-552e-088d-de73-11fa7d31c228	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-552e-088d-56df-82d9e59a8b3b	CL	CHL	152	Chile 	Čile	\N
00040000-552e-088d-0884-02a941d5f1bc	CN	CHN	156	China 	Kitajska	\N
00040000-552e-088d-1a74-52a75fdd8cf6	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-552e-088d-774b-6ddf64580f14	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-552e-088d-4ab2-f52102adb510	CO	COL	170	Colombia 	Kolumbija	\N
00040000-552e-088d-42e6-1b4dbbfbbbf4	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-552e-088d-25c8-e14b791fc5c1	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-552e-088d-9deb-8a424e65b045	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-552e-088d-efec-f8b16ea5db93	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-552e-088d-1147-9af78b64904b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-552e-088d-5342-f0be76414658	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-552e-088d-b826-fce6b7678985	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-552e-088d-35c5-469f373c6e98	CU	CUB	192	Cuba 	Kuba	\N
00040000-552e-088d-d002-4f64dcf72b44	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-552e-088d-5361-ecdab0649e9e	CY	CYP	196	Cyprus 	Ciper	\N
00040000-552e-088d-8cf2-7faccb511274	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-552e-088d-a125-fae0123b955c	DK	DNK	208	Denmark 	Danska	\N
00040000-552e-088d-45e2-877ecd78f18a	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-552e-088d-db6a-a90e2df41b5a	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-552e-088d-1db6-5907da8f6d7f	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-552e-088d-7fb9-abc20f188272	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-552e-088d-0130-a61785eedf95	EG	EGY	818	Egypt 	Egipt	\N
00040000-552e-088d-d4d5-ee93a5811677	SV	SLV	222	El Salvador 	Salvador	\N
00040000-552e-088d-5f9c-0888b9e9809b	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-552e-088d-4e8c-1ee758bea399	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-552e-088d-71b8-cbeca2cd5848	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-552e-088d-44c5-f79c26bf083d	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-552e-088d-69cf-3da51eb58c51	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-552e-088d-804e-cd20b5ac8ccf	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-552e-088d-8185-08927fa69bda	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-552e-088d-c717-46c892e037f3	FI	FIN	246	Finland 	Finska	\N
00040000-552e-088d-3ff1-88eaca9f7389	FR	FRA	250	France 	Francija	\N
00040000-552e-088d-861a-0c84100625b6	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-552e-088d-0247-6c3d8e4b5a8b	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-552e-088d-e72d-426ea0e17bf1	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-552e-088d-ee22-b8d0670ce35b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-552e-088d-5031-d0fcb8b13ccb	GA	GAB	266	Gabon 	Gabon	\N
00040000-552e-088d-a6df-497edcd08826	GM	GMB	270	Gambia 	Gambija	\N
00040000-552e-088d-bf4e-5da786ac717d	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-552e-088d-2717-ec063105c824	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-552e-088d-9652-2d66577acac9	GH	GHA	288	Ghana 	Gana	\N
00040000-552e-088d-e0b3-9ae0b8afdc12	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-552e-088d-7960-798b37102d6a	GR	GRC	300	Greece 	Grčija	\N
00040000-552e-088d-7cea-e07d55bc0cd4	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-552e-088d-709b-d8176df9b826	GD	GRD	308	Grenada 	Grenada	\N
00040000-552e-088d-718b-e08172153c54	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-552e-088d-a89a-7f5f33d8aba8	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-552e-088d-61f4-be71e2fdd2f8	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-552e-088d-20ab-13f4150c380b	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-552e-088d-20cb-34563c5795f9	GN	GIN	324	Guinea 	Gvineja	\N
00040000-552e-088d-3d67-ae2c9a8ba21c	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-552e-088d-265e-c22ae490deb5	GY	GUY	328	Guyana 	Gvajana	\N
00040000-552e-088d-9846-758bb9a82224	HT	HTI	332	Haiti 	Haiti	\N
00040000-552e-088d-b32a-89bd3abba999	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-552e-088d-99fa-a94d7ed9562c	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-552e-088d-d60f-5b2737ed0bd6	HN	HND	340	Honduras 	Honduras	\N
00040000-552e-088d-cc67-3ef5218880b5	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-552e-088d-22bd-bf610e6db203	HU	HUN	348	Hungary 	Madžarska	\N
00040000-552e-088d-734d-c963c9789cd7	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-552e-088d-0bf6-b383ea601083	IN	IND	356	India 	Indija	\N
00040000-552e-088d-6391-1d2574679d2f	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-552e-088d-dd17-2d1d5a39ad69	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-552e-088d-a72e-4e71fa3b26e9	IQ	IRQ	368	Iraq 	Irak	\N
00040000-552e-088d-5733-b6d8a2225029	IE	IRL	372	Ireland 	Irska	\N
00040000-552e-088d-dbb9-47132afd7e79	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-552e-088d-1ee1-79f72ea77f47	IL	ISR	376	Israel 	Izrael	\N
00040000-552e-088d-ba07-ca3410b03b8c	IT	ITA	380	Italy 	Italija	\N
00040000-552e-088d-c749-e832abd22362	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-552e-088d-57f2-1036433fdf54	JP	JPN	392	Japan 	Japonska	\N
00040000-552e-088d-11b8-69b75c1bc3a0	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-552e-088d-b0c7-d5355d5fc2a4	JO	JOR	400	Jordan 	Jordanija	\N
00040000-552e-088d-62f9-88168299546c	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-552e-088d-2efb-b7e50fa74256	KE	KEN	404	Kenya 	Kenija	\N
00040000-552e-088d-f880-9cad142f6d77	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-552e-088d-4069-4dbc02aa27d3	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-552e-088d-7b5b-2dfc37a7c7f0	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-552e-088d-e781-577da0e67bde	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-552e-088d-3870-0a8d8117df63	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-552e-088d-e3fa-f2bc7b564b06	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-552e-088d-b71a-f5a06ffe5962	LV	LVA	428	Latvia 	Latvija	\N
00040000-552e-088d-f366-66fe24e29537	LB	LBN	422	Lebanon 	Libanon	\N
00040000-552e-088d-c1b3-899c14faf8e5	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-552e-088d-c3d9-83d439e2b9cc	LR	LBR	430	Liberia 	Liberija	\N
00040000-552e-088d-279a-81a7b3a55729	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-552e-088d-ba31-4dd0e3c818fe	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-552e-088d-2a2e-28e9954ad83a	LT	LTU	440	Lithuania 	Litva	\N
00040000-552e-088d-6145-039d5440f2be	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-552e-088d-ac48-87f67df4462d	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-552e-088d-514a-f896f7297e45	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-552e-088d-2e3b-0a9dcdb32601	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-552e-088d-7fd5-54af56462ddb	MW	MWI	454	Malawi 	Malavi	\N
00040000-552e-088d-0068-08132ed7ba12	MY	MYS	458	Malaysia 	Malezija	\N
00040000-552e-088d-9bb9-d3423fadbcb0	MV	MDV	462	Maldives 	Maldivi	\N
00040000-552e-088d-3b37-7bb1d82a55e2	ML	MLI	466	Mali 	Mali	\N
00040000-552e-088d-0aa4-e866fd22615f	MT	MLT	470	Malta 	Malta	\N
00040000-552e-088d-bca6-a6c13075fac3	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-552e-088d-bdfb-dbd55bd05f9e	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-552e-088d-1ad3-06c24f027ae4	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-552e-088d-0d2a-5a9c7d948df6	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-552e-088d-3b8e-96a68c84ea36	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-552e-088d-9395-434133e29b27	MX	MEX	484	Mexico 	Mehika	\N
00040000-552e-088d-6dab-5004702d2bee	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-552e-088d-e546-21a765cc832d	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-552e-088d-8e57-9cc73cc6620b	MC	MCO	492	Monaco 	Monako	\N
00040000-552e-088d-04d6-4154eaf3d84c	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-552e-088d-75d0-0a0ec209c909	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-552e-088d-c107-d725b6815ed8	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-552e-088d-f883-783b1a485421	MA	MAR	504	Morocco 	Maroko	\N
00040000-552e-088d-afec-d2c554752e39	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-552e-088d-8290-b7205b281f4d	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-552e-088d-e6bf-faab2bd9e7a9	NA	NAM	516	Namibia 	Namibija	\N
00040000-552e-088d-b2d2-c128c24ed2e4	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-552e-088d-b2b9-3b626a397cf5	NP	NPL	524	Nepal 	Nepal	\N
00040000-552e-088d-79b6-1aa30ec1a592	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-552e-088d-7307-5e7f7c4fc6dd	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-552e-088d-b552-108827efbfc9	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-552e-088d-6a4d-0b47a49d0537	NE	NER	562	Niger 	Niger 	\N
00040000-552e-088d-f5ed-b87f41a31cf4	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-552e-088d-b601-caf2aa54ba7d	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-552e-088d-1590-63407269c2c5	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-552e-088d-2d55-73c1f009d616	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-552e-088d-3ff9-d5fbb9f59b0e	NO	NOR	578	Norway 	Norveška	\N
00040000-552e-088d-f710-3020d22e6729	OM	OMN	512	Oman 	Oman	\N
00040000-552e-088d-2a50-20a4d9db9f1f	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-552e-088d-fe97-51c6f1451c71	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-552e-088d-becf-5520e3e75b2b	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-552e-088d-e887-38e3e76f1a68	PA	PAN	591	Panama 	Panama	\N
00040000-552e-088d-1903-7cb4c243abcd	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-552e-088d-b39b-075b2542c5dc	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-552e-088d-718b-7a9f9f27e9f6	PE	PER	604	Peru 	Peru	\N
00040000-552e-088d-9be0-faed5128225a	PH	PHL	608	Philippines 	Filipini	\N
00040000-552e-088d-eaf8-0ae5b1d5959f	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-552e-088d-0a09-266f3e03ccd8	PL	POL	616	Poland 	Poljska	\N
00040000-552e-088d-1be2-8d864462a728	PT	PRT	620	Portugal 	Portugalska	\N
00040000-552e-088d-6102-a84edd150337	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-552e-088d-1f2c-1de67f541455	QA	QAT	634	Qatar 	Katar	\N
00040000-552e-088d-69da-85cd0cd4714b	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-552e-088e-57d4-a271f85665c9	RO	ROU	642	Romania 	Romunija	\N
00040000-552e-088e-79cb-26fa4e7b5483	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-552e-088e-df1c-505bbb8fb9e9	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-552e-088e-6098-1cf0ef7b97d4	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-552e-088e-deec-28045b50e6d5	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-552e-088e-10e4-f051cdec350f	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-552e-088e-28ce-d98f64ace676	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-552e-088e-eb37-f9d81f95a307	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-552e-088e-26ab-f73e357d2102	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-552e-088e-0bc8-977fe0ca9910	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-552e-088e-6630-0968ecec4865	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-552e-088e-ccae-48f4ce42e5df	SM	SMR	674	San Marino 	San Marino	\N
00040000-552e-088e-69dc-f3d4074b7e5d	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-552e-088e-d5f3-2b4755dc82bd	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-552e-088e-36f3-be4fdc2350fd	SN	SEN	686	Senegal 	Senegal	\N
00040000-552e-088e-6bad-4bcd5411900f	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-552e-088e-7adc-0d3703dafca2	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-552e-088e-9ce7-9da18f7e637d	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-552e-088e-661e-5c14e690ac8b	SG	SGP	702	Singapore 	Singapur	\N
00040000-552e-088e-5547-83d63c67a832	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-552e-088e-5f87-0d02b4079367	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-552e-088e-091d-593f069cfc05	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-552e-088e-4b4f-d41b4ebd1ff5	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-552e-088e-aa6b-ab3770fc7e27	SO	SOM	706	Somalia 	Somalija	\N
00040000-552e-088e-1adf-24f4aaa7cc80	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-552e-088e-37c5-527fe303b2ef	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-552e-088e-1a47-9b215d095839	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-552e-088e-b6f9-598c745c2a80	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-552e-088e-b360-423b8adc912b	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-552e-088e-ec81-d7ad6e91e124	SD	SDN	729	Sudan 	Sudan	\N
00040000-552e-088e-4d19-e635917c238a	SR	SUR	740	Suriname 	Surinam	\N
00040000-552e-088e-4fee-dabf578843aa	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-552e-088e-0018-d62cda16f8a0	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-552e-088e-38af-a703bb0458aa	SE	SWE	752	Sweden 	Švedska	\N
00040000-552e-088e-7787-956a4f2b7490	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-552e-088e-feab-71c463597176	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-552e-088e-2a51-171eb76489d8	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-552e-088e-92ff-b45c85710cf5	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-552e-088e-cc95-bb9c332178f0	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-552e-088e-e840-6d98b20a08e1	TH	THA	764	Thailand 	Tajska	\N
00040000-552e-088e-f186-47e74c1035d4	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-552e-088e-1a4f-68c27dc023a2	TG	TGO	768	Togo 	Togo	\N
00040000-552e-088e-7831-55c0a7ebfbdb	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-552e-088e-924c-bcfe0324834e	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-552e-088e-3152-abaae19f22d3	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-552e-088e-a8ee-c35e6d0b8a5d	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-552e-088e-90f8-15eff59fcebb	TR	TUR	792	Turkey 	Turčija	\N
00040000-552e-088e-412f-297eb7b1443f	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-552e-088e-b46e-c3ce3e6936f5	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-552e-088e-4cde-709f044dd846	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-552e-088e-6e57-5eb2b4af036d	UG	UGA	800	Uganda 	Uganda	\N
00040000-552e-088e-589e-f17086399ed6	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-552e-088e-1a86-6db802ebe297	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-552e-088e-7ce2-3bc3b09059bf	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-552e-088e-16f5-7449cee22c2d	US	USA	840	United States 	Združene države Amerike	\N
00040000-552e-088e-3cdf-efb427780d5e	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-552e-088e-b4bd-d15c0a5a77e3	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-552e-088e-797d-428f2ebae92d	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-552e-088e-669a-a6b6fe78a06b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-552e-088e-3d13-74ebdc74acc3	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-552e-088e-867b-e3b7051ea700	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-552e-088e-5f1d-dce497412101	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-552e-088e-475e-a29759dcacb4	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-552e-088e-be8d-cca9a4006630	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-552e-088e-729a-a12ef0a7c7f5	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-552e-088e-b82e-05b286f36914	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-552e-088e-07b7-569c4c1b3553	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-552e-088e-bab1-8d2174bb2805	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2628 (class 0 OID 408804)
-- Dependencies: 210
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort) FROM stdin;
\.


--
-- TOC entry 2607 (class 0 OID 408625)
-- Dependencies: 189
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta) FROM stdin;
\.


--
-- TOC entry 2611 (class 0 OID 408673)
-- Dependencies: 193
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2597 (class 0 OID 408493)
-- Dependencies: 179
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2617 (class 0 OID 408722)
-- Dependencies: 199
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2621 (class 0 OID 408747)
-- Dependencies: 203
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2603 (class 0 OID 408574)
-- Dependencies: 185
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-552e-088e-138d-c84a4679e433	kravaXXX	color	N;	t	f	f	\N	\N
00000000-552e-088e-bbd4-a0cb34e8e915	privzetInspicient	entity	N;	f	f	f	\N	\N
00000000-552e-088e-a82e-b63d77c0d085	dogodek-status	map	O:18:"Zend\\Config\\Config":4:{s:21:"	f	f	t	\N	Tabela statusa dogodkov
\.


--
-- TOC entry 2596 (class 0 OID 408482)
-- Dependencies: 178
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
\.


--
-- TOC entry 2600 (class 0 OID 408544)
-- Dependencies: 182
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2592 (class 0 OID 408447)
-- Dependencies: 174
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00020000-552e-088e-f9d7-48e779f73285	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-652f-8b0945d1d160	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-3962-bdfd9382a739	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-fc9a-b4322205873d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-309e-1164a72cb6c7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-cc03-b558d4c22a24	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-f223-db4e01718de4	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-c597-8fe85da7d89d	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-7a37-f2cfd42261bc	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-aedf-27ea00eefee1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-7ca7-bb2e35b1ab63	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-b45e-93d89320fab9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-8aaa-33ff9b4bda37	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-0f5a-4df297fdb765	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-3cd7-23c2a09527aa	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-6f62-0b9f4a5b5239	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-8f75-940f5a0dd2b8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-a8ef-3c10995cd6df	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-aeba-5c8c613551b1	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-97e6-c5eb611b4fd5	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-d99a-0ec87f47f951	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-cea6-cb49ebd4ba92	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-7dee-a0728758d3e8	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-ce4d-7aae3df553f8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-80eb-85ab30c60bef	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-2faa-c37bcab635bd	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-a8f8-b1982af622dc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-6d3f-fce317258098	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-8dbf-83810146c9c9	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-5784-6e298d61059a	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-1e7c-477cce7e4af3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-fe85-b552eaa68bf8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-03e5-33db0eb7ebef	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-2fe4-b33c1c606789	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-0627-cc2e2bb6b159	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-8f7b-678fea2205d8	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-ab95-5826be3b0087	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-1ec6-a1179454005c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-cba3-b0bff444e8b1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-0a29-b959f988a7be	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-a99d-182ab0b535bc	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-50ac-6743dca4b786	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-36ff-06b1a6222afa	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-dfa5-7f82596ba031	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-4de8-77b1f86a7025	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-e9cf-c9bec8482e00	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-06e5-52c296a9d91f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-a801-136e64261040	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-893a-d82ddbc44d20	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-80ca-b055862b89fe	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-2bc2-17ecbfb98e3f	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-2901-be826eb6f4db	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-3c78-5241a5b374da	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-0db3-3584f2cac1fa	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-d9a4-cb57da93f12e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-95a8-9e068a3d7697	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-7630-f7b2d7c94831	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-ce0e-751e0c462155	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-16c6-fb75760ddeba	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-0dcb-5cc390601274	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-91e1-35190078a25f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-de1c-9f7298caefa1	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-071f-9195c0586cf9	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-7686-07268392516d	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-a676-d794ae3cfd82	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-444e-4398866f9d74	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-d708-1228c49f7f2c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-696d-5c404811c3ec	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-002e-3bb5d0360139	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-e4e0-b2fab1ce4dfe	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-1b7f-cead8b24c4ed	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-1b01-5d842c74ef4b	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-245b-532aa1a88e76	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-57e4-e71d9ce77d06	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-a6e1-59fc241c98ce	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-a406-8e30b32a47e0	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-16ea-870125e3eccf	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-1635-22ef87d9a28f	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-4b8a-6733fd7578d7	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-6abc-bc6aaa30db03	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-8f29-8bf3e2920e03	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-fb0d-5bd09a24ce02	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-809a-18f95a3d9f21	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-10c7-27d98b51ea0e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-c370-ff5f66678b34	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-d91c-f1d56e79fb14	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-2ca6-077539d3e9f3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-9ea8-a34a77dc7cf8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-fcdf-b6fc8083ecb8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-b335-b325502851c6	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-509f-005bfa06d19a	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-e283-c54ce43f68df	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-5502-23ae2c9ea3c4	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-5333-2c2d853587e8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-7a08-7111c7673dcb	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-dd52-541bd3458a28	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-62e4-48551084490d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-87e3-0914bda2eca5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-3ee3-df335b4fb059	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-419f-bdb68709d4e7	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-092c-67c856fc1d74	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-7022-56abb9109dc3	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-b2a4-44cb93bc8279	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-aadb-a3ac8814ece8	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-9437-30cfff2903d0	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-bc53-7da480717c24	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-e897-23dbb4e8735d	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-017b-7d8d2ae21992	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-80f5-267e5ae9a9a9	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-c6b6-500519053444	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-cad5-0d0aa8d56378	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-cdab-3a11d4781dc7	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-0d84-8eb9186a74b2	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-8746-f56cc0003764	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-31d8-7ab0e230aad1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-cc56-a12422e32461	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-3079-a44a916b84bf	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-92e2-3424df40cc49	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-959b-e36ee25db3a6	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-1973-37b21a46c322	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-9808-1139e61d5e05	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-f73d-113b842ebf2b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-e825-313d8c19caf7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-134e-f72ae87c45c0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-9ba2-a21d75347128	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-ce70-e4c20cc2034b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-7f59-0cb2d10e8686	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-39b6-5e722003e8f7	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-c079-7aa544c3ef75	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-f41a-dea2df5f65fa	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-5ef5-57b28b3c3fa3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-546c-180425a2ed04	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-562a-9aaa008afaba	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-d9fc-15c94955282a	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-1d4b-567222e20e66	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-e2e2-cea5321c9905	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-0c8f-b3139d5da3f3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-3f28-2ddd223c1ea1	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-02d1-202880df061b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-6194-34e9909af69a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-1bf5-f3b9dcc26da7	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-0f9e-49b945b747b6	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-3d48-6135078437e4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-4a6b-e4d7153ec77f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-50f0-80af1c3c3afd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-a4e9-eba226d5b6a7	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-53ed-437953ae4a4a	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-3060-9bee33d3402d	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-0e40-574adb0ff150	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-a9b5-2a32767aad96	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-60f7-0360eef0ab6e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-cf22-59b3caf91342	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-3493-6f5b51a2279d	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-a019-87027050cb85	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-2d9a-25d8b7004961	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-032b-1ce940832b6a	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-c4b8-8f8a58c35044	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-a348-6b8d0844621b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-a9d6-20ef5be2a8c0	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-c89e-5095271a8b8e	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-8524-9ae631e70667	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-5c16-dd7a33a0ba10	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-010e-cca32ee3273f	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-cc22-e3ac5e8a56b1	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-5e1c-bb85c81cdf05	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-d436-ae3cc28f94b6	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-f16f-0d27314e4eb5	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-9732-6c99c5915b63	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-c2b5-88ed8e2de92b	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-512d-fc1a39a97837	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-3c0a-4d48f11e7c65	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-c4bd-8bc7dd304d27	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-54c8-0109da581ba6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-120f-dbe61b03d8a1	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-07fa-553eddacf9c6	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-6276-b3fe95af7d09	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-f03b-b0f1ed1319d5	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-2c05-743607ea37c0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-9674-284ceaee9b2b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-3338-94902ec302cd	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-6658-95fbc1c5abd3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-9885-e6ccdaa99d0e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-7242-11d92c68393c	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-eca4-31eee7edfe04	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-f1b3-b92991bb1d44	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-dd66-35e85e11fcd9	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-639c-89dab2bf60bd	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-edf3-ccc6057a64fd	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-5bcb-a8e7c07c3df3	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-a1ce-33b7473528b6	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-2556-549d88a6bdc7	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-d932-76392ad21757	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-8c7e-c25e239ef17b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-58b6-d14962beaf38	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-9aba-644f1e85510e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-6625-92c81e118515	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-bf94-5ced32a74fd4	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-d274-e14ec404ee22	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-9215-4b4b0c005f2b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-e023-d87c2ee671f7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-ccfb-15314f6023ca	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-d28b-ebf4fb46a3f7	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-1cbc-7868a9e7689f	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-9981-406915616d8d	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-4fd6-324c78840b4b	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-ebbb-695f7b1c2725	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-73da-4bec5c6ee826	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-7569-a645b4e48f2e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-faf4-6c0c0dd40b43	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-bb03-73f81f881450	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-6407-1ea74d02bfd3	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-4d8c-b835b21219a2	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-84bb-fba4028d884e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-109b-5ee9f10f816e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-307c-c89a951e63d9	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-d0de-8a9de9b010b5	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-5805-fa05a6d8b3a8	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-6ebb-86e81040d7ac	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-6063-d0d99b86ceaf	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-a1e0-e3e0a31fdc82	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-8630-24546e5980c3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-be8c-14c699b8905c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-19fc-03a931938ca7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-4263-3ed9c3907afb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-dca0-2b26f724f12c	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-a8d1-2ce3097ecfe6	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-49cf-7c94cbef7732	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-e589-9a110cb20f5e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-283f-8b15849eea96	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-ae2b-fefe42884a04	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-1d21-bb49132b159f	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-0038-5ff2b74a7f5d	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-c3a9-f6c0777943c3	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-7b2e-59c6e09fc44e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-72bd-e2c0dc724c26	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-10d3-4dc1f09a5063	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-5c0a-1ad8252089f7	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-9468-ab412366bdd2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-39a1-f16878d482cd	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-c4e5-67063451d487	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-260b-1ca2d0ac5b8f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-3ccf-74367b38f954	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-974c-fe3e59029aa4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-9f28-2fd2c8ab0b4c	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-5bef-0e05950fb385	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-c9fa-b74586ac78dc	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-489a-5b8057176fda	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-19e0-389ac0a8c648	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-2a34-9322743bf915	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-b5e5-33cadae6f6b0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-bb2a-1fed96ae11e3	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-ab51-cf88de0135ee	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-d096-42cd68f4727b	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-829e-27018268bbdb	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-d7df-86db790b241f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-5da1-1ceeb4acf57d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-4c75-3bbe5e7fd1f7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-ba20-1f3ef844a95c	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-ca3d-0e8e4d49fc63	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-0ab0-60f114619354	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-a8c0-12a0a50fe514	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-36c2-e089f4173814	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-8194-75ec7f3111ea	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-cf43-49b9bb3a2c68	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-e1f9-f4cee2fa5dcb	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-f35e-d9346a3e94a0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-bd49-2bfcd7123069	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-8435-3d2b6651480c	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-1037-24accbe86053	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-bcd1-40d9e3ab3e61	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-7043-45f226e3e4ed	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-73de-958513adb3e9	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-c710-5e41100c20d8	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-1885-00ef0de8695d	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-388a-426dcf83da3a	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-2342-f27ea41b75e5	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-cbff-adf0a4e32d9e	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-4ebb-9a681cf32469	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-2f58-67d27ec7f255	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-cf09-56aee8a9a7ed	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-217c-5e1518dcc285	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-d71d-16cf9de7e2ac	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-5a58-efd8277a5126	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-f8fb-9674cc2560ab	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-f796-c196a3e6a81d	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-4a67-d161965fac53	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-2b42-5ca6b9369daf	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-b3ca-3fad80383a71	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-ce56-67de3245c173	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-7f28-462245d2b0e9	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-a971-dc3bb60c21f8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-c9c0-f66bdf8339d7	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-b880-f90ccda5d83a	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-7698-cf82da7cd36f	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-d2d7-2d7b1fc55737	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-8213-6f724b2b3b3c	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-5a1f-fade89d6e465	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-0d58-2bbc52e6f15c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-0406-66204f77dfcb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-17b7-6212793d2f4c	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-f7f2-2818eb5beff5	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-9948-726e9b8503d8	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-49c1-171b16e667cc	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-484b-9b6d0ef23f2c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-4443-ccddfc099d3c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-617b-4fae0097a736	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-b9ce-9db79af4d93f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-e3ba-c2fa44368d92	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-9d1e-0b20893b3642	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-4d10-8bf720fba851	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-3a09-2e478bdc7371	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-96d7-dea3c189facc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-da32-4cb5827b3d9a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-f570-8d03886a260e	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-9cce-a9ea0f82af24	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-052f-b77ff8e3ea8d	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-0d3a-625b729cda43	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-9a17-dd3f8b0ca303	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-be64-a770585fb958	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-6df5-29f6a7c860a9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-6697-2a77c5fdd49f	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-68bc-f3a1175e65eb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-8a0b-07a0a9109c86	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-ac4b-a5028b340cdb	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-ff2e-ad52e2b9a262	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-7470-fa12d7c0aedc	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-380c-46241cb30055	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-cff8-f681a9cf9501	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-ba2d-c8aa4426f6f9	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-5325-2b0128f977ba	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-ed1f-94097027b207	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-e350-a0272d9b70bf	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-193e-ac174db5c915	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-4106-f1ee612b3b12	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-5a34-52c4cb2f041b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-fa29-e8a7722aa3e2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-44c6-e2bafeeb7b34	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-5d81-f6d5ae18f2c3	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-45de-ea62d1dde8fb	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-4c39-c234e593dc3e	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-9d29-c5f2c916d6f7	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-dd37-f89178f5e442	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-1def-8f797d32c75d	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-f092-519c839f37c9	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-f16f-88dc91277909	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-15af-925fdab63f91	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-e780-db0ce6747bbd	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-9266-f308f58e183a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-b27f-125f3e412a57	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-7013-12a6ca638a21	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-84dc-3ccbc207cdfd	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-15f9-25b2b6025125	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-2987-41f6e1a57136	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-2474-d98cf9a9cca8	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-ca2e-77a15f43f4eb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-1e75-49e6a8b50ae7	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-dff7-2b74046fd10f	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-91be-a407d17c65b1	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-a04b-28d9a17e4898	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-16d9-720c4e952c84	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-7a80-34c406179ec3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-04ac-962edec50953	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-c145-230c1d42aa09	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-8c36-160650a7f69b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-0610-90f8a6ad06e3	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-bfbf-2bdad82c0df4	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-0523-70475c2c27a8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-b28a-488e162c078f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-da89-77fcb61e6a5f	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-d1ae-7f7188fd1b2c	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-1d6e-5c026b2b86ea	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-ab86-23c4fc33e0e4	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-d593-30e10d3fb651	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-fa37-7367f6b92408	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-c043-dc1a1f0e5720	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-d8a0-1d5d1814b18d	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-7299-98026eab68bf	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-210a-c470a39c4bfa	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-cf43-3cdf34af8506	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-e5eb-feb630bc63d4	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-1257-f2e45b52f72b	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-828a-f53e231a936b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-2eee-d25080ad2174	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-3bc2-71c790b98eaa	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-9ec4-693f19a1ebe8	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-c10f-7319785c7458	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-b6be-4d6c2e575cf9	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-8123-3b9348e51c70	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-cfb6-be8c68d36e3c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-9dab-f0d46c52b4ff	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-a712-931209a7bf15	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-2f0e-344d4bda0316	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-783b-f49de3a8a6aa	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-2904-6b11b5bfa045	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-3fb0-0dd3f47a2d08	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-5888-96d2924fe651	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-cd98-a955f4acc109	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-474d-05f56686bbc7	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-da42-f4114272e0b3	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-11c4-79e5ee964cd9	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-ec74-b70ef80ad4ab	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-39ef-21c513e59397	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-4fab-22d15890e503	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-a6e5-38a5400ca416	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-ec0c-52ac6fe4f2b0	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-6b63-5ed41a17bfbf	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-e093-c75895b27886	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-ebf1-e939068c8e76	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-1ee0-d49a349f156e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-b14d-fd8a82fa5971	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-8748-479ef00d68c2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-d99a-f79654c96a2a	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-05e5-b0b5ec9852d3	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-04f4-75140c3610c7	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-ec93-616f4f3299a6	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-6413-6ef00d22526b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-a6f9-512d6ddb05a7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-0b19-e722b134f1fa	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-8428-39e31e2d181c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-a16c-16d1eb039a2b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-ffda-894547505866	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-28c5-87f66149d7be	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-d417-6faa50612f41	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-7c2a-ed908f61507b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-b952-5cf8e7b98d90	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-4224-3260a7732698	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-67ac-3c65929d9cfd	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-8cbb-b6146a91a6aa	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-c61c-4fe586e178d1	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-14f8-5e2640ed8f9c	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-88db-716d8c9e58a5	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-b737-2e59b828a77e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-7793-60a4fa89a5ee	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-8fbf-26de4f5f7434	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-9bee-94504788a7d7	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-9f9d-510cfd4a2d4b	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-1fa7-1e9e1c2a4ce1	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-5ef8-37c8d6225a15	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-94f9-7a7d56ca8063	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-e7b9-5792cb0967fe	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-968e-b3a51fcc1996	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-4a47-373247186271	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-c267-8999bc19c75f	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-503e-ab12cfd40c3e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-8284-c11970115a73	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-f1ab-a97f6c9136c0	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-6ca8-f2ad70d5b26e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-0258-50a16996b6db	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-765c-1746887f524b	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-731f-80a3cf98f286	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-e0b4-e4ec126baeb8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-083b-5dc52170f76c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-6315-8f44b34f4759	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-625a-3bb495ad9d18	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-30e9-3df41d75ab46	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-a89f-c468eecba260	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-f1c1-6fbcf83c3602	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-dc7b-16f33c9ddebf	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-f93e-0a83961bd574	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-907f-78bf5db40591	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-cc6d-73394e84c77e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-b4d9-67fb089d4596	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-8781-103e588dadb9	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-665a-8533b320a10b	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-4282-445dbbfa153f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-145d-01c17002c99f	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-a798-a800b633969e	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-f13e-b852fdcf6cd5	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-690e-25e4f655b582	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-9b32-86a44a07d86c	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-3326-0e80045616ed	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-0285-fac1946cf40e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-2184-c102198ab7a3	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-6452-b22c9714f423	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-26cd-80445025a5b1	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-939b-6449f14092f0	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-c73c-3e2ca2288802	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-a9d2-44ff8c9cfc4e	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-c84e-e360470f8ea2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-1371-2642c81ca086	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-3e40-c593aeb9e723	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-b555-67f4c74bbe65	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-9a99-477970af6db6	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-f781-32f8688fbdc9	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-2f49-1762aa4e3818	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-4936-600f4418a22b	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-97a8-e28791585778	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-6f45-8ea19e8ccaa5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-6ddf-19d63709155c	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-ab39-f9aeb9626e1e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-2c75-d87ed235359d	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-f894-09b431817a9f	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-128f-fc4a156aeb27	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-97fb-6670addc2d76	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-8e25-d299cbecfcb8	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-9cda-f3b691efd4e6	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-583e-9fcfbaca9de9	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-9a6e-d40aee7d8dd6	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-b933-9e9e8d854d2a	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-0abb-be7cbb8c0d75	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-887a-d21f13b7e1b8	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-0d88-c310fa221e05	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-e1e6-46be0a4bfb95	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-2770-2093759a9d22	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-df5a-4157e45f7c5d	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-5c8d-870297e92f1a	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-bbd7-5743b40c2002	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-4fe5-ac50a15af831	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-37aa-069ac0d161a6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-d7e5-b26c6f3d34af	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-5ed3-2eb048a2c9ad	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-85ff-248c1c6f1015	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-355e-41ad7d933e1a	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-87f3-aee7d023d3ff	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-2976-4c29e37b0a56	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-f627-8b96431140af	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-c1bd-ba13d11c39b9	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-388e-b9b629fab523	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-473e-69bb18f17da0	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-9d23-e97cb2c49368	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-9fcb-65177ec13d0f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-2a1a-2cd2fc71c697	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-aae8-d3d64bde80e3	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-f8f1-62e04741814e	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-82e5-d75665682373	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-6da8-b613e558e0f0	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-7855-2c7252fb6f88	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-cb48-a3802ef3f8c6	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-531e-c66b944e5544	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-97f1-e00f7702ab94	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-983a-4afd72d9e947	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-3a54-fb4c95acc7a2	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-960c-ba100dc24235	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-47b6-8fcbd78058a4	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-21e2-a2f0ff854d9c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-da1b-9cb1f257cc1c	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-d5bb-66ea816e24ba	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-ff6b-b3b998d2be6c	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-984c-7c029c459dfe	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-1d66-7bc6f80b43fa	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-0a24-90fc21d2814d	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-e460-d9d8b21f2f5e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-3cff-6b5b9c4f79e7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-ed28-b9e253832e03	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-8f8f-19c856ea772e	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-f163-c4b3bed5673d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-73dc-3fbeb7ccbb06	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-447d-4ce32a2b7078	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-059b-4d8ce4220ced	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-cd13-fa75744610b1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-ded7-41bb4cf8ac83	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-3acc-3082d66e9cd8	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-94c4-1128a1a2aff5	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-32a0-bfff14604f6c	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-5a2a-150275b8b30a	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-137b-57d2a5eee08d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-6285-7b55c0d69619	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-8f56-8692091806d5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-f031-cc40bb111639	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-31ce-d89ebc9b31e4	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-4afd-73111855b6f2	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-8aff-e367f893ac76	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-381c-10cafd5476ee	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-d727-7cacf5703f7d	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-0a44-231fdb7a3042	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-69ad-9118dc8bbc45	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-fded-b00fae85416d	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-f679-43ff7e9ca6de	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-b56f-80d4d594a202	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-8201-b173dc11608f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-a68b-cb611db626c1	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-68b9-4e74439b03f3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-fef7-cb5e38367c65	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-25dd-bcfbbb21646b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-96e5-e59a2dcc9013	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-5319-4d16973da306	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-8d16-5bbb00a5d03e	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-dce6-9e9c2e0e68db	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-19bb-7348115a66fb	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-3032-eed67f4d6f19	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-e074-952f2e748fd2	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-4fbd-2ce84c3cbbf7	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-3b72-7178303bd939	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-dc8d-b34ff5c9b7bc	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-5c68-9ca346278fac	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-d04f-a474dac1172a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-7f67-39b53705a8ef	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-b85e-09e7ca9e9617	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-8b8c-204418613c1d	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-7917-a8f73267d465	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-4ca4-0e931eb168c2	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-c55f-a52c970a3286	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-8c1e-97b1a23b2b70	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-656c-896256b054ad	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-ab20-6108c384ac0f	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-af9d-522e8e456759	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-e175-13105d9ebc89	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-fe42-724862a80958	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-e169-ec99bca39258	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-dac9-e7d1e34f0f2a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-80e9-755cfe786ec8	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-d056-9061f1d99a56	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-26d1-4ebdc4e55b3a	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-098f-401ec51e4355	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-bc47-2ae0e43ed466	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-da50-397098bd8df6	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-c8f6-15d647d91787	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-fd7a-22b10c08587a	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-3bc9-c8a30649e50e	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-c97c-369ea87b474d	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-3796-bb2de098a538	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-efa2-e79e15550411	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-5242-4bb2f2ef782c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-cb24-e932feb448a5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-c794-daf195ddc1db	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-c07f-53258bd132b5	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-39b6-15eece9cd7be	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-b25f-55808d49f5d0	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-e6b3-07a589524abc	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-348b-036a258daff2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-fd33-c4b8ed47134b	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-c76e-573f46bd4526	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-290e-ad4a19ff43e2	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-9788-48e0278e4f95	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-84f0-7c171df3e403	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-ce48-a78dd9ef14d0	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-adf0-d79ed8ac6e39	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-f676-82490870e2aa	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-0872-22072081cc36	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-5390-6a8ac81e229e	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-863b-fb0393865f6b	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-de29-bf25c9becac0	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-f7cb-0de81a1278ed	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-9342-090cc6b5d8ef	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-92c2-58e617f93fe2	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-3644-d77b3b1d708d	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-d6ff-bac3c51aaf20	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-c5c0-09a6671a9a0c	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-a8db-14996d643029	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-a5e3-8ba475d6eabe	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-2d2f-e8b6aa2a0d2b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-2658-def447a771c2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-54f9-047b0b54d034	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-841d-9678dd5e4053	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-8011-d251c5488d5d	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-f738-0071d85eaeda	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-9e44-1860b6c684c3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-ffae-c3c44a53e321	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-4d3a-4d88854510d4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-d2e6-39c9645437b9	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-46ce-afd02b056077	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-c21d-455081d35055	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-51bc-35ca73f0dd11	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-cbbe-d2a3963b00d8	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-e5a0-183233b63686	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-2c00-257eab6142c8	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-aee0-0cfb64d55e83	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-3f7c-51aaa970007a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-7ea4-e43430acd00b	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-7d80-6ba2a66030c0	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-609e-34ae9a3edc81	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-51f4-8e4d92f15e38	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-be7c-1c01904e8dec	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-4b25-a2750aa4ec82	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-b634-eb1da9190f9a	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-f7d1-297da0287d23	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-7589-d949222ef957	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-649c-6d8fb3fc0ae4	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-24bc-c8936acedf19	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-be5c-e903123e3fa3	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-e020-62b1c5ea8282	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-eb74-762a7e311d5b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-dd55-5c6e1c506dda	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-d108-34a340232f34	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-44a1-b205e382312f	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-f446-a90005a51bf5	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-d091-81654c09c833	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-c6df-2b3767b15d76	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-fe7d-9c661a756cc7	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-b455-815a70772d21	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-3263-473a96775bb5	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-2a1c-a113e9940798	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-7938-956c7f62af1c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-1eab-d533238cec9e	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-6285-6355b213e479	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-bedf-8fbc797beedb	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-d83a-898487d740a2	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-c55d-5acd9d8c607a	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-7f79-71255a906e1c	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-f2a6-3e59d76cfcca	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-af03-3ba5f2074d68	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-4838-d3f6c2488538	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-7880-7c9f5599749b	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-7602-1a92981243a4	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-f104-733edc87afdd	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-6970-e409c8b53b96	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-929a-4aa95674243c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-5f44-b8547660cec5	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-69e1-66b83dd57977	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-a450-8ef9b3351297	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-82b3-2508d647e409	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-c110-d8fa67488a97	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-9f2a-97f41f039a86	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-4836-8f3e34a4bbe2	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-3c0a-a320b50b8981	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-7ea8-d2719d63719d	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-ff7b-b69ca14cbb28	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-a6bf-1a05f3fb2156	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-14d4-4ce387a5ea93	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-8e9a-2f53175c368f	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-6c56-0d9fca691b6a	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-6ceb-a6c44b6ec61c	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-17cf-72338d53af51	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-085d-97d1edde693d	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-cade-4e3f883fb455	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-4739-784ebf7b260e	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-5def-f2f5d5e11193	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-5b22-4c10e008eb26	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-a59c-dbe5e2f58fa6	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-aa14-32663bf4feeb	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-8e13-a7a6fc89c580	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-0577-f741a5b2f0b5	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-25d5-db890522c707	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-5b11-e61174b5c7ea	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-1ed0-8bc43f88d97b	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-b84f-ece286dab7f2	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-3500-0a02b5614808	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-9204-eaea1eb86b51	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-f6e0-0ce02da3f758	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-6273-c76d20e15d4e	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-9a34-af6f22c9ae38	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-78d7-1d044501d3e7	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-bf59-afdc6f4d466a	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-d737-016258f42602	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-8198-7def8595abd6	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-5966-9b111ddc705b	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-c61f-4429c06f1838	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-a2fe-825e2bff9963	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-a6e6-3cd813fea173	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-1066-5a37206d7ec9	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-3b06-be6e9cc11efa	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-fdf0-8b1e8321d15a	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-7bfa-f4cc3f156a52	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-d8aa-36a0b5a0632e	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-8298-31c8249f92c3	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-ae93-c95a88f003b1	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-7a15-7ef47d16ef84	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-9084-6181de773b8e	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-14d6-ed2a842b7480	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-f1a4-deb18354e104	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-7ba7-2ba91b4ab7bb	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-7c80-468e6f90200e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-f9e6-2fd01817a95c	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-93ba-53d61b0d618a	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-510c-cc255a0d6a85	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-c14c-0349486ec75b	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-bcaf-2a6388182e14	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-2e20-be3ca3e0914d	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-5b4c-ce60071b4aa4	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-06bb-48e2ba7b5695	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-f1a5-72c093a0c8d4	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-8c97-71ba4a6bb3ee	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-48d1-c6ef01c94050	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-8e7b-cdb92bae44c1	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-55a8-24f93b9a0abf	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-4c07-4b8b67c7567e	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-6f64-dc692e84beb6	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-5183-393b65d6ba63	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-17a8-6595e6d33887	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-004c-4b9b7bdab161	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-acaa-2feca6ea3553	User-delete	Aaa - Uporabnik - Briši	f
00020000-552e-088e-e917-ffa188ed67c9	User-read	Aaa - Uporabnik - Beri	f
00020000-552e-088e-0246-94445d54ccd8	User-update	Aaa - Uporabnik - Posodobi	f
00020000-552e-088e-e2a4-37e8dca74a3b	User-create	Aaa - Uporabnik - Ustvari	f
00020000-552e-088e-942d-6d7b5d7add47	User-lookup	Aaa - Uporabnik - Iskanje	f
00020000-552e-088e-7588-a190e309eb47	Role-delete	Aaa - Vloga - Briši	f
00020000-552e-088e-ab08-e31c9452c254	Role-read	Aaa - Vloga - Beri	f
00020000-552e-088e-abdd-8a8ac628d0b9	Role-update	Aaa - Vloga - Posodobi	f
00020000-552e-088e-eac3-7f1f114b680e	Role-create	Aaa - Vloga - Ustvari	f
00020000-552e-088e-05bb-b0e6edc6697d	Permission-delete	Aaa - Dovoljenje - Briši	f
00020000-552e-088e-ff61-9f49ed4075b7	Permission-read	Aaa - Dovoljenje - Beri	f
00020000-552e-088e-d311-66b15a39f369	Permission-update	Aaa - Dovoljenje - Posodobi	f
00020000-552e-088e-0e00-75652ed8c24b	Permission-create	Aaa - Dovoljenje - Ustvari	f
00020000-552e-088e-b1f1-93eb10975dcc	Permission-list	Aaa - Dovoljenje - Seznam	f
00020000-552e-088e-8dbd-dfe630303035	Drzava-read	Seznam držav	f
00020000-552e-088e-0878-1e27d909a6da	Drzava-write	Urejanje držav	f
00020000-552e-088e-aa57-6de0b5cad658	Popa-delete	Poslovni partner - Briši	f
00020000-552e-088e-dc0d-264a80849fee	Popa-list	Poslovni partner - Beri	f
00020000-552e-088e-2153-ac14d84eb372	Popa-update	Poslovni partner - Posodobi	f
00020000-552e-088e-2fd0-cf8a7967be06	Popa-create	Poslovni partner - Ustvari	f
00020000-552e-088e-c6f6-69b1025e113b	Posta-delete	Pošta - Briši	f
00020000-552e-088e-cecb-684708afab68	Posta-list	Pošta - Beri	f
00020000-552e-088e-4de9-d166b6a593c9	Posta-update	Pošta - Posodobi	f
00020000-552e-088e-ec02-bcb05d3dfda8	Posta-create	Pošta - Ustvari	f
00020000-552e-088e-2607-9638c1b216e3	PostniNaslov-delete	Poštni naslov - Briši	f
00020000-552e-088e-dbcf-f83a03bc1eba	PostniNaslov-list	Poštni naslov - Beri	f
00020000-552e-088e-cfb4-eb006019b8d5	PostniNaslov-update	Poštni naslov - Posodobi	f
00020000-552e-088e-6d7b-afed7f136c93	PostniNaslov-create	Poštni naslov - Ustvari	f
\.


--
-- TOC entry 2594 (class 0 OID 408466)
-- Dependencies: 176
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00000000-552e-088e-8e7c-ed31546ecc16	00020000-552e-088e-8dbd-dfe630303035
00000000-552e-088e-8e7c-ed31546ecc16	00020000-552e-088e-0f5a-4df297fdb765
00000000-552e-088e-eee4-f5816922f02e	00020000-552e-088e-0878-1e27d909a6da
00000000-552e-088e-eee4-f5816922f02e	00020000-552e-088e-8dbd-dfe630303035
\.


--
-- TOC entry 2622 (class 0 OID 408754)
-- Dependencies: 204
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2626 (class 0 OID 408784)
-- Dependencies: 208
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 408896)
-- Dependencies: 219
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2599 (class 0 OID 408523)
-- Dependencies: 181
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2602 (class 0 OID 408566)
-- Dependencies: 184
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-552e-088d-b560-f46158a50c8c	8341	Adlešiči
00050000-552e-088d-da4e-81d94fdb0ce6	5270	Ajdovščina
00050000-552e-088d-9364-c9991f767bbc	6280	Ankaran/Ancarano
00050000-552e-088d-94e6-6898834ef122	9253	Apače
00050000-552e-088d-ffdf-3a7e4eb91a8c	8253	Artiče
00050000-552e-088d-746e-80167434f91e	4275	Begunje na Gorenjskem
00050000-552e-088d-e4eb-481720f0cc1b	1382	Begunje pri Cerknici
00050000-552e-088d-be27-9a1faaeacb50	9231	Beltinci
00050000-552e-088d-a9a9-13a9dea3ef89	2234	Benedikt
00050000-552e-088d-8c36-55a5844b9bda	2345	Bistrica ob Dravi
00050000-552e-088d-b6df-4fd421574f2a	3256	Bistrica ob Sotli
00050000-552e-088d-109c-caf5380ddb08	8259	Bizeljsko
00050000-552e-088d-f188-cac79bbc76ab	1223	Blagovica
00050000-552e-088d-9f79-c8ba20e779b1	8283	Blanca
00050000-552e-088d-0e71-57da83d17b9f	4260	Bled
00050000-552e-088d-90b7-4dc8b9a1a181	4273	Blejska Dobrava
00050000-552e-088d-0187-03226fcd214b	9265	Bodonci
00050000-552e-088d-6869-d50fe0d8b6c8	9222	Bogojina
00050000-552e-088d-eaa9-c13db90d2983	4263	Bohinjska Bela
00050000-552e-088d-50f2-1c10760d5ee5	4264	Bohinjska Bistrica
00050000-552e-088d-f30f-04d86f5ce173	4265	Bohinjsko jezero
00050000-552e-088d-50b2-b67fe5842631	1353	Borovnica
00050000-552e-088d-ad2f-f570553a3c5b	8294	Boštanj
00050000-552e-088d-8bef-b7cd1184d600	5230	Bovec
00050000-552e-088d-2254-a8c6f12b10cb	5295	Branik
00050000-552e-088d-d86d-93b648bd25f4	3314	Braslovče
00050000-552e-088d-0404-75f0855b5151	5223	Breginj
00050000-552e-088d-8761-b11cf075f945	8280	Brestanica
00050000-552e-088d-d419-161ddcdbbecc	2354	Bresternica
00050000-552e-088d-a9df-f1d90d908cfc	4243	Brezje
00050000-552e-088d-9f6f-c09568905e5a	1351	Brezovica pri Ljubljani
00050000-552e-088d-e05b-f574fd709ae7	8250	Brežice
00050000-552e-088d-fe21-5c185eb5c66e	4210	Brnik - Aerodrom
00050000-552e-088d-2872-adda7979910c	8321	Brusnice
00050000-552e-088d-50f0-ae0b98996d78	3255	Buče
00050000-552e-088d-959d-d1ff504b42e6	8276	Bučka 
00050000-552e-088d-9854-0fa5d1786057	9261	Cankova
00050000-552e-088d-1360-0743f2249e28	3000	Celje 
00050000-552e-088d-84fb-629eda9c22c1	3001	Celje - poštni predali
00050000-552e-088d-8de0-c56297ffc285	4207	Cerklje na Gorenjskem
00050000-552e-088d-7cd1-c5514b2472eb	8263	Cerklje ob Krki
00050000-552e-088d-d4e2-debd92387fd2	1380	Cerknica
00050000-552e-088d-73b5-a278f175a9ac	5282	Cerkno
00050000-552e-088d-ab8c-781d19cefda0	2236	Cerkvenjak
00050000-552e-088d-0e8b-af6415fd5a92	2215	Ceršak
00050000-552e-088d-e41b-16f3cebfbbd9	2326	Cirkovce
00050000-552e-088d-ef14-0768e777a486	2282	Cirkulane
00050000-552e-088d-8027-e73c658f6732	5273	Col
00050000-552e-088d-de39-6c27a1b2102e	8251	Čatež ob Savi
00050000-552e-088d-0994-2c4fb7aa3ed1	1413	Čemšenik
00050000-552e-088d-3749-6ee8f45bffe1	5253	Čepovan
00050000-552e-088d-5e10-25c264e67dc3	9232	Črenšovci
00050000-552e-088d-ded0-2366776c23f9	2393	Črna na Koroškem
00050000-552e-088d-4d9f-b189adbce5c1	6275	Črni Kal
00050000-552e-088d-d7cf-92d805a1342e	5274	Črni Vrh nad Idrijo
00050000-552e-088d-dd05-54d13b1ec058	5262	Črniče
00050000-552e-088d-1107-dcab1d73b12f	8340	Črnomelj
00050000-552e-088d-d7f9-fd32a0fea37d	6271	Dekani
00050000-552e-088d-9755-2673aea868de	5210	Deskle
00050000-552e-088d-6418-1184a7c19bce	2253	Destrnik
00050000-552e-088d-e6c2-9625ecedf106	6215	Divača
00050000-552e-088d-d8c5-b5c5c3274e4d	1233	Dob
00050000-552e-088d-fe80-8fd72c7add20	3224	Dobje pri Planini
00050000-552e-088d-67b0-c178ed6adb7a	8257	Dobova
00050000-552e-088d-9104-68a822a03ce0	1423	Dobovec
00050000-552e-088d-0c79-3e2ede246cb0	5263	Dobravlje
00050000-552e-088d-2b57-a7da2d3b2a09	3204	Dobrna
00050000-552e-088d-3153-6198067b58b2	8211	Dobrnič
00050000-552e-088d-47ba-a840fd317991	1356	Dobrova
00050000-552e-088d-e588-ab39056a657f	9223	Dobrovnik/Dobronak 
00050000-552e-088d-957c-64316eb6ea6c	5212	Dobrovo v Brdih
00050000-552e-088d-9d4b-9ef0a4585b33	1431	Dol pri Hrastniku
00050000-552e-088d-b2df-a85f907d0149	1262	Dol pri Ljubljani
00050000-552e-088d-1e04-01a427de6fa6	1273	Dole pri Litiji
00050000-552e-088d-b150-3a5c190d1641	1331	Dolenja vas
00050000-552e-088d-bb50-999d6a77b166	8350	Dolenjske Toplice
00050000-552e-088d-1596-c5e17375c05d	1230	Domžale
00050000-552e-088d-dc2c-5462b73f7eac	2252	Dornava
00050000-552e-088d-f9d9-0b16cb26ba4c	5294	Dornberk
00050000-552e-088d-2629-1fa111a916f4	1319	Draga
00050000-552e-088d-b8f1-f4a828c847ff	8343	Dragatuš
00050000-552e-088d-03ef-bd163ac1eb83	3222	Dramlje
00050000-552e-088d-ca68-55ccbcfdc412	2370	Dravograd
00050000-552e-088d-a3c5-c1aaa966cd7b	4203	Duplje
00050000-552e-088d-b20e-a955020c3525	6221	Dutovlje
00050000-552e-088d-63ec-6d1a76afb19f	8361	Dvor
00050000-552e-088d-a443-9e95526ecdba	2343	Fala
00050000-552e-088d-2c34-760a50b06d80	9208	Fokovci
00050000-552e-088d-a439-7eaca1ccbad9	2313	Fram
00050000-552e-088d-a1cf-d1cad83df6e7	3213	Frankolovo
00050000-552e-088d-d8e8-b2b2b41d9d23	1274	Gabrovka
00050000-552e-088d-7fd7-3583e66aba22	8254	Globoko
00050000-552e-088d-2bcc-9b2e412a83d1	5275	Godovič
00050000-552e-088d-dba3-0d7ec8f98653	4204	Golnik
00050000-552e-088d-a86e-d90b13b7fd5c	3303	Gomilsko
00050000-552e-088d-45cb-5a9f8d50caf5	4224	Gorenja vas
00050000-552e-088d-4d60-0e3f7d2b938c	3263	Gorica pri Slivnici
00050000-552e-088d-8147-ad8413126c9c	2272	Gorišnica
00050000-552e-088d-3ff5-542996e322e1	9250	Gornja Radgona
00050000-552e-088d-cd51-9688bebe7943	3342	Gornji Grad
00050000-552e-088d-0aa6-c3984d55617d	4282	Gozd Martuljek
00050000-552e-088d-504a-086004d87610	6272	Gračišče
00050000-552e-088d-e604-4d25a70d359f	9264	Grad
00050000-552e-088d-ef04-bea6188229c0	8332	Gradac
00050000-552e-088d-d185-d62f1042f302	1384	Grahovo
00050000-552e-088d-2939-c94cdcdd9c40	5242	Grahovo ob Bači
00050000-552e-088d-017b-b4342d753099	5251	Grgar
00050000-552e-088d-6f0e-70b4ea266d37	3302	Griže
00050000-552e-088d-4c3a-11850f480b2c	3231	Grobelno
00050000-552e-088d-cc70-b5b75b41e72a	1290	Grosuplje
00050000-552e-088d-c9b3-4ab053a2aaea	2288	Hajdina
00050000-552e-088d-21af-4149a7e726fc	8362	Hinje
00050000-552e-088d-2b9d-f69cd4d21311	2311	Hoče
00050000-552e-088d-12c0-5e6ea8e2155b	9205	Hodoš/Hodos
00050000-552e-088d-9421-e2f026646cf3	1354	Horjul
00050000-552e-088d-62bf-e52cfc87bb79	1372	Hotedršica
00050000-552e-088d-de0d-fb90ee0649d6	1430	Hrastnik
00050000-552e-088d-0ca2-bc0d3660ec85	6225	Hruševje
00050000-552e-088d-0226-e45151135a7d	4276	Hrušica
00050000-552e-088d-c678-b4dba12d4b8c	5280	Idrija
00050000-552e-088d-a36b-e26df8616730	1292	Ig
00050000-552e-088d-f5df-8e4224beeb6e	6250	Ilirska Bistrica
00050000-552e-088d-77b0-1dab8d4bec27	6251	Ilirska Bistrica-Trnovo
00050000-552e-088d-d7a8-62e8ae070cf7	1295	Ivančna Gorica
00050000-552e-088d-0314-f854767695e3	2259	Ivanjkovci
00050000-552e-088d-65b0-5d77043a5ec2	1411	Izlake
00050000-552e-088d-99a1-d99b6da3eba4	6310	Izola/Isola
00050000-552e-088d-913b-6306fdd5251e	2222	Jakobski Dol
00050000-552e-088d-e70c-8f4d7f45a89d	2221	Jarenina
00050000-552e-088d-6321-606f4997afd3	6254	Jelšane
00050000-552e-088d-0033-29d1743609fe	4270	Jesenice
00050000-552e-088d-b877-b7db226a0041	8261	Jesenice na Dolenjskem
00050000-552e-088d-ddfe-8992e8593d2c	3273	Jurklošter
00050000-552e-088d-0ac0-6a4efdd4d554	2223	Jurovski Dol
00050000-552e-088d-dd20-0df326f4f87b	2256	Juršinci
00050000-552e-088d-b6c8-b98afc754784	5214	Kal nad Kanalom
00050000-552e-088d-ff63-1cbda88eab3d	3233	Kalobje
00050000-552e-088d-6634-2d6eb7be09a0	4246	Kamna Gorica
00050000-552e-088d-2bf9-11db8f954b2b	2351	Kamnica
00050000-552e-088d-cd32-a4b39e8ae858	1241	Kamnik
00050000-552e-088d-9445-0115a80f3bd9	5213	Kanal
00050000-552e-088d-afad-a8bfd23bee5b	8258	Kapele
00050000-552e-088d-69f5-c7a3e061039c	2362	Kapla
00050000-552e-088d-85c6-c9974b6354a0	2325	Kidričevo
00050000-552e-088d-cf11-97081f4ca707	1412	Kisovec
00050000-552e-088d-0015-cff9f57fdd3e	6253	Knežak
00050000-552e-088d-ff7b-09d39ed1191e	5222	Kobarid
00050000-552e-088d-32e7-8bcb11957ac7	9227	Kobilje
00050000-552e-088d-4347-c6b6f94fe787	1330	Kočevje
00050000-552e-088d-441e-1197d3a0c12b	1338	Kočevska Reka
00050000-552e-088d-bdaa-23ff2c121b89	2276	Kog
00050000-552e-088d-b2ef-9be10e2f733d	5211	Kojsko
00050000-552e-088d-58e9-cd94c60b2165	6223	Komen
00050000-552e-088d-2f40-e23c84cc4ef2	1218	Komenda
00050000-552e-088d-d99c-6aee696483eb	6000	Koper/Capodistria 
00050000-552e-088d-f442-c4b2536e5724	6001	Koper/Capodistria - poštni predali
00050000-552e-088d-b748-278e3c960f7a	8282	Koprivnica
00050000-552e-088d-ad83-69e97d7f0588	5296	Kostanjevica na Krasu
00050000-552e-088d-16aa-3bdaf5d5834c	8311	Kostanjevica na Krki
00050000-552e-088d-c741-24802574b38f	1336	Kostel
00050000-552e-088d-9a61-8c6b8239500b	6256	Košana
00050000-552e-088d-2c4a-05bd9f21b8d0	2394	Kotlje
00050000-552e-088d-772c-2bf77ffe8ede	6240	Kozina
00050000-552e-088d-b109-af7862dfc226	3260	Kozje
00050000-552e-088d-4549-d0bbe5f9a332	4000	Kranj 
00050000-552e-088d-b00d-caaadd19a30f	4001	Kranj - poštni predali
00050000-552e-088d-101f-fd47d2a4941f	4280	Kranjska Gora
00050000-552e-088d-2a2e-a2884be93bb3	1281	Kresnice
00050000-552e-088d-8a04-1a74462d5f3f	4294	Križe
00050000-552e-088d-ff76-929c2e62d4bc	9206	Križevci
00050000-552e-088d-48e7-fc1c3533ff09	9242	Križevci pri Ljutomeru
00050000-552e-088d-7d95-5c64c6b9c9f5	1301	Krka
00050000-552e-088d-f398-c4a2da397efa	8296	Krmelj
00050000-552e-088d-9a9d-5711df72002b	4245	Kropa
00050000-552e-088d-6945-db9c5e43b696	8262	Krška vas
00050000-552e-088d-27d7-a0de0343cc7b	8270	Krško
00050000-552e-088d-9913-d94e9b2ab171	9263	Kuzma
00050000-552e-088d-850d-99f9855038a6	2318	Laporje
00050000-552e-088d-8289-424a94cf5e88	3270	Laško
00050000-552e-088d-08ef-af0a89e51f7f	1219	Laze v Tuhinju
00050000-552e-088d-b53d-a10d7505408a	2230	Lenart v Slovenskih goricah
00050000-552e-088d-df9f-cb366f553b10	9220	Lendava/Lendva
00050000-552e-088d-1a88-e184ce59b96f	4248	Lesce
00050000-552e-088d-d933-945d4af646c3	3261	Lesično
00050000-552e-088d-911e-437139aaf468	8273	Leskovec pri Krškem
00050000-552e-088d-ad02-025781d4760f	2372	Libeliče
00050000-552e-088d-21b5-b5fbed648188	2341	Limbuš
00050000-552e-088d-ef69-18469cc30f9b	1270	Litija
00050000-552e-088d-bd87-dee199ef2e91	3202	Ljubečna
00050000-552e-088d-a0b4-4fd95ddef423	1000	Ljubljana 
00050000-552e-088d-c7cb-8246236073b4	1001	Ljubljana - poštni predali
00050000-552e-088d-8917-c685004737fb	1231	Ljubljana - Črnuče
00050000-552e-088d-bfa0-a35f2133492b	1261	Ljubljana - Dobrunje
00050000-552e-088d-dda6-d6c3d56c3732	1260	Ljubljana - Polje
00050000-552e-088d-88ae-c786c6ae389b	1210	Ljubljana - Šentvid
00050000-552e-088d-7d84-96401354ae3e	1211	Ljubljana - Šmartno
00050000-552e-088d-85e2-551e99304b49	3333	Ljubno ob Savinji
00050000-552e-088d-6ecb-47e085432fa6	9240	Ljutomer
00050000-552e-088d-d6be-829f22474322	3215	Loče
00050000-552e-088d-1d4f-d11dfc93de2d	5231	Log pod Mangartom
00050000-552e-088d-1320-a1bbe08f654b	1358	Log pri Brezovici
00050000-552e-088d-17e2-531c642b7d6f	1370	Logatec
00050000-552e-088d-0b3b-14b1a8364001	1371	Logatec
00050000-552e-088d-bb2e-147214c37671	1434	Loka pri Zidanem Mostu
00050000-552e-088d-c89f-6b1f0daaf5be	3223	Loka pri Žusmu
00050000-552e-088d-0038-182746cd1245	6219	Lokev
00050000-552e-088d-ab02-1422c55b769d	1318	Loški Potok
00050000-552e-088d-cb2e-3f75c93e4fa5	2324	Lovrenc na Dravskem polju
00050000-552e-088d-e11c-449501bea723	2344	Lovrenc na Pohorju
00050000-552e-088d-65d3-f256890fdff5	3334	Luče
00050000-552e-088d-9b2f-3f4a8e061e54	1225	Lukovica
00050000-552e-088d-3f7b-7881ce4f701a	9202	Mačkovci
00050000-552e-088d-8c2a-0662567e6bdc	2322	Majšperk
00050000-552e-088d-0d94-4285ffdc9342	2321	Makole
00050000-552e-088d-45fd-1602273891e1	9243	Mala Nedelja
00050000-552e-088d-970e-c628d4df4540	2229	Malečnik
00050000-552e-088d-8311-5eacdf28a218	6273	Marezige
00050000-552e-088d-f600-a1f027b48f9d	2000	Maribor 
00050000-552e-088d-27e3-dbb4c1e55960	2001	Maribor - poštni predali
00050000-552e-088d-f5a8-18887e3d753e	2206	Marjeta na Dravskem polju
00050000-552e-088d-9aaf-9ec4f50a3e71	2281	Markovci
00050000-552e-088d-fba6-715743a469ca	9221	Martjanci
00050000-552e-088d-0cba-68d0b5e54a59	6242	Materija
00050000-552e-088d-ec34-73106156bb2b	4211	Mavčiče
00050000-552e-088d-c34f-943082d5f404	1215	Medvode
00050000-552e-088d-a094-19955b226b79	1234	Mengeš
00050000-552e-088d-aa45-59ebcc19b3d8	8330	Metlika
00050000-552e-088d-4cfc-a4ae40938bb3	2392	Mežica
00050000-552e-088d-4835-48bf9a99785b	2204	Miklavž na Dravskem polju
00050000-552e-088d-6a80-c7cd9ace2ab1	2275	Miklavž pri Ormožu
00050000-552e-088d-c149-13fc0fc7472b	5291	Miren
00050000-552e-088d-8324-cf02af7d8e26	8233	Mirna
00050000-552e-088d-41fc-38f79be2701a	8216	Mirna Peč
00050000-552e-088d-c579-7179655cea2c	2382	Mislinja
00050000-552e-088d-c6e1-3bb77a886ed3	4281	Mojstrana
00050000-552e-088d-ad43-9ecdbce2ea6d	8230	Mokronog
00050000-552e-088d-f9dd-5c7e944e7010	1251	Moravče
00050000-552e-088d-57a9-f864e817df8c	9226	Moravske Toplice
00050000-552e-088d-415c-e1f5e5fd7aad	5216	Most na Soči
00050000-552e-088d-1230-0c02bd02b04a	1221	Motnik
00050000-552e-088d-8369-91652f38b9d5	3330	Mozirje
00050000-552e-088d-9d96-c0c81cc25881	9000	Murska Sobota 
00050000-552e-088d-fac6-b4a52face207	9001	Murska Sobota - poštni predali
00050000-552e-088d-f69f-57e28b2c8d15	2366	Muta
00050000-552e-088d-8301-917a17f3d965	4202	Naklo
00050000-552e-088d-3de6-d7acac90690a	3331	Nazarje
00050000-552e-088d-7b39-7f7364e73b8a	1357	Notranje Gorice
00050000-552e-088d-072a-b4648b5fbbcc	3203	Nova Cerkev
00050000-552e-088d-fea2-1268a8794ddf	5000	Nova Gorica 
00050000-552e-088d-b60d-adde84b31632	5001	Nova Gorica - poštni predali
00050000-552e-088d-20c7-c87c8673a937	1385	Nova vas
00050000-552e-088d-74c7-f3cda09ab9be	8000	Novo mesto
00050000-552e-088d-22a3-863fd6431818	8001	Novo mesto - poštni predali
00050000-552e-088d-3743-6b3194729d4c	6243	Obrov
00050000-552e-088d-daad-f491bab291d1	9233	Odranci
00050000-552e-088d-1612-c5b934e4c471	2317	Oplotnica
00050000-552e-088d-f52d-d46fd25fc99e	2312	Orehova vas
00050000-552e-088d-66d0-356d2ce6b04b	2270	Ormož
00050000-552e-088d-572a-f774d1ebab32	1316	Ortnek
00050000-552e-088d-d960-8ab9b236e37f	1337	Osilnica
00050000-552e-088d-8b40-368262dfb2df	8222	Otočec
00050000-552e-088d-803b-966588174405	2361	Ožbalt
00050000-552e-088d-beda-8b80a56efd55	2231	Pernica
00050000-552e-088d-880e-0a3447cdb0dd	2211	Pesnica pri Mariboru
00050000-552e-088d-ccc5-66ebf0c9854d	9203	Petrovci
00050000-552e-088d-1002-8da32829939a	3301	Petrovče
00050000-552e-088d-5f27-3f481b713a01	6330	Piran/Pirano
00050000-552e-088d-6275-fe1dbecc8208	8255	Pišece
00050000-552e-088d-c203-30ccdb0ce1e7	6257	Pivka
00050000-552e-088d-8a8b-e9133f7d63cc	6232	Planina
00050000-552e-088d-5277-8c69d12babb6	3225	Planina pri Sevnici
00050000-552e-088d-41b5-d3eba8a7a239	6276	Pobegi
00050000-552e-088d-f140-13444032bc13	8312	Podbočje
00050000-552e-088d-d6ba-509cc5513c54	5243	Podbrdo
00050000-552e-088d-a91a-b3a579f0c8d7	3254	Podčetrtek
00050000-552e-088d-f82c-fe1539c558f5	2273	Podgorci
00050000-552e-088d-19dd-d94512862d3a	6216	Podgorje
00050000-552e-088d-2f71-ae699c460a59	2381	Podgorje pri Slovenj Gradcu
00050000-552e-088d-0e6c-442541eeca5e	6244	Podgrad
00050000-552e-088d-8e97-9677028ebb8c	1414	Podkum
00050000-552e-088d-5bd1-2a6f41389193	2286	Podlehnik
00050000-552e-088d-3463-5a96961c6464	5272	Podnanos
00050000-552e-088d-7321-336a47c61a82	4244	Podnart
00050000-552e-088d-8cfe-20668a293223	3241	Podplat
00050000-552e-088d-905d-8e6c0b72480f	3257	Podsreda
00050000-552e-088d-4955-11267eadd2ab	2363	Podvelka
00050000-552e-088d-1649-f1199e44ae53	2208	Pohorje
00050000-552e-088d-56d2-c1ad7b2d811d	2257	Polenšak
00050000-552e-088d-ef2d-7e9ebfe30f20	1355	Polhov Gradec
00050000-552e-088d-16ba-734180efcf03	4223	Poljane nad Škofjo Loko
00050000-552e-088d-5a54-9190070e8b43	2319	Poljčane
00050000-552e-088d-e98f-1263099ec279	1272	Polšnik
00050000-552e-088d-573b-94f977efa846	3313	Polzela
00050000-552e-088d-daca-a2a088cf971e	3232	Ponikva
00050000-552e-088d-4957-0fcd07128372	6320	Portorož/Portorose
00050000-552e-088d-8b41-3f95e382d87e	6230	Postojna
00050000-552e-088d-9128-a7755653c045	2331	Pragersko
00050000-552e-088d-1ed8-fdef87bc24bf	3312	Prebold
00050000-552e-088d-8d8a-112787db5ecf	4205	Preddvor
00050000-552e-088d-4777-2b12fd3bb103	6255	Prem
00050000-552e-088d-0bc5-1fef27b88ca7	1352	Preserje
00050000-552e-088d-fd6a-7e5f1cc25b1a	6258	Prestranek
00050000-552e-088d-fc3a-0090fc5ff82a	2391	Prevalje
00050000-552e-088d-fbb6-608ccd523104	3262	Prevorje
00050000-552e-088d-7254-cf1aa0a7239e	1276	Primskovo 
00050000-552e-088d-96c2-71b53b9c5054	3253	Pristava pri Mestinju
00050000-552e-088d-c9eb-e68972c00ab4	9207	Prosenjakovci/Partosfalva
00050000-552e-088d-bca2-7409ccfb8786	5297	Prvačina
00050000-552e-088d-4be3-6a1db58f8341	2250	Ptuj
00050000-552e-088d-eaca-c6dbbbf7aaa6	2323	Ptujska Gora
00050000-552e-088d-298a-6a048f4c4a0f	9201	Puconci
00050000-552e-088d-bf1c-a8d41c384f3d	2327	Rače
00050000-552e-088d-5cf6-e6430170c039	1433	Radeče
00050000-552e-088d-1ddd-b98ab5e3eace	9252	Radenci
00050000-552e-088d-9760-e352066c4181	2360	Radlje ob Dravi
00050000-552e-088d-10a8-d1ce0795a850	1235	Radomlje
00050000-552e-088d-22cf-054da89e1986	4240	Radovljica
00050000-552e-088d-06b5-c3e9b8649dbb	8274	Raka
00050000-552e-088d-efbd-509b04430655	1381	Rakek
00050000-552e-088d-8e28-5bbfdcf6c605	4283	Rateče - Planica
00050000-552e-088d-e195-abfd76928021	2390	Ravne na Koroškem
00050000-552e-088d-838a-2f860a7d6be8	9246	Razkrižje
00050000-552e-088d-f8ff-e2eb137b5d41	3332	Rečica ob Savinji
00050000-552e-088d-2081-5a774f747e26	5292	Renče
00050000-552e-088d-1316-9498bfb0c59c	1310	Ribnica
00050000-552e-088d-dfd4-a289829cfc72	2364	Ribnica na Pohorju
00050000-552e-088d-4b24-ee8d75a97509	3272	Rimske Toplice
00050000-552e-088d-e73c-f7bde31555cb	1314	Rob
00050000-552e-088d-1022-d4384de7eb97	5215	Ročinj
00050000-552e-088d-9eba-bae372e253fb	3250	Rogaška Slatina
00050000-552e-088d-91e5-c76c98348de4	9262	Rogašovci
00050000-552e-088d-70cc-932c34f7f526	3252	Rogatec
00050000-552e-088d-3bec-2ab5972bde19	1373	Rovte
00050000-552e-088d-0bc6-84a06400497e	2342	Ruše
00050000-552e-088d-80c4-aeac0ecd2607	1282	Sava
00050000-552e-088d-b128-6e4633726f2b	6333	Sečovlje/Sicciole
00050000-552e-088d-5e2d-c36cc62a3f80	4227	Selca
00050000-552e-088d-4650-5f70fe5abe31	2352	Selnica ob Dravi
00050000-552e-088d-4f04-a81ff6d83ac5	8333	Semič
00050000-552e-088d-581e-9d058a4a37f2	8281	Senovo
00050000-552e-088d-bb9e-726998271caa	6224	Senožeče
00050000-552e-088d-cf4a-136485ccea9f	8290	Sevnica
00050000-552e-088d-47b5-91aeb1c50236	6210	Sežana
00050000-552e-088d-7d16-2560417ff6d0	2214	Sladki Vrh
00050000-552e-088d-188e-e89a04dd8a59	5283	Slap ob Idrijci
00050000-552e-088d-f011-d1553f03273d	2380	Slovenj Gradec
00050000-552e-088d-6847-ad5b4096ff04	2310	Slovenska Bistrica
00050000-552e-088d-0ea2-f59b942b146f	3210	Slovenske Konjice
00050000-552e-088d-21fe-6139a929dd60	1216	Smlednik
00050000-552e-088d-3b3e-e293c2c713d6	5232	Soča
00050000-552e-088d-e3ec-c916dcd10a65	1317	Sodražica
00050000-552e-088d-f50f-00f62b5ae4d0	3335	Solčava
00050000-552e-088d-021b-09b71437d907	5250	Solkan
00050000-552e-088d-ab61-55b615ddf091	4229	Sorica
00050000-552e-088d-3470-2fac519ae8cb	4225	Sovodenj
00050000-552e-088d-521b-e42e821dacab	5281	Spodnja Idrija
00050000-552e-088d-4b43-23e3e2a5caf2	2241	Spodnji Duplek
00050000-552e-088d-1712-8f49fa4e75bd	9245	Spodnji Ivanjci
00050000-552e-088d-818c-666c6de0a63e	2277	Središče ob Dravi
00050000-552e-088d-c821-112a16afdb60	4267	Srednja vas v Bohinju
00050000-552e-088d-e4b3-8f6c2b34c153	8256	Sromlje 
00050000-552e-088d-cd06-c8796081d79b	5224	Srpenica
00050000-552e-088d-18e3-1032e0e2c8cd	1242	Stahovica
00050000-552e-088d-c660-720ce5eda942	1332	Stara Cerkev
00050000-552e-088d-5e92-1c0fd893b1f3	8342	Stari trg ob Kolpi
00050000-552e-088d-ff1a-4c611bbda177	1386	Stari trg pri Ložu
00050000-552e-088d-10ad-81166e1531c3	2205	Starše
00050000-552e-088d-da78-5be03ac1982c	2289	Stoperce
00050000-552e-088d-8249-84a87bea1ef6	8322	Stopiče
00050000-552e-088d-6b2f-2ab4022cc671	3206	Stranice
00050000-552e-088d-ab1c-8a2fd226342d	8351	Straža
00050000-552e-088d-b2c1-15ef80f51436	1313	Struge
00050000-552e-088d-71fc-c82889af819b	8293	Studenec
00050000-552e-088d-b691-6806cfbed26b	8331	Suhor
00050000-552e-088d-cd16-d8415a5ba4c6	2233	Sv. Ana v Slovenskih goricah
00050000-552e-088d-4352-b58dfdd06b73	2235	Sv. Trojica v Slovenskih goricah
00050000-552e-088d-91bb-994f34939f4e	2353	Sveti Duh na Ostrem Vrhu
00050000-552e-088d-056b-32ed55ecb882	9244	Sveti Jurij ob Ščavnici
00050000-552e-088d-a053-3070e3fc9420	3264	Sveti Štefan
00050000-552e-088d-6faf-81f5aa222abf	2258	Sveti Tomaž
00050000-552e-088d-f473-8b510208135e	9204	Šalovci
00050000-552e-088d-f883-0d0a570f03bb	5261	Šempas
00050000-552e-088d-eef8-af8b11965009	5290	Šempeter pri Gorici
00050000-552e-088d-5a24-07abde5e4f97	3311	Šempeter v Savinjski dolini
00050000-552e-088d-d10a-8f542c6bd1af	4208	Šenčur
00050000-552e-088d-734c-9add4a25425b	2212	Šentilj v Slovenskih goricah
00050000-552e-088d-7ac6-7e35ab5411d4	8297	Šentjanž
00050000-552e-088d-058c-905450030874	2373	Šentjanž pri Dravogradu
00050000-552e-088d-7095-a30156ff406d	8310	Šentjernej
00050000-552e-088d-45c7-0baa36dc631c	3230	Šentjur
00050000-552e-088d-078f-89228fee9f43	3271	Šentrupert
00050000-552e-088d-bf02-bf5b12c375f4	8232	Šentrupert
00050000-552e-088d-1015-6cfab488f481	1296	Šentvid pri Stični
00050000-552e-088d-3452-220f3eb7d82d	8275	Škocjan
00050000-552e-088d-8129-87fb3fc41a74	6281	Škofije
00050000-552e-088d-3c9e-297e32d06294	4220	Škofja Loka
00050000-552e-088d-4a99-51021fc4af40	3211	Škofja vas
00050000-552e-088d-84a9-fdce4f91e71e	1291	Škofljica
00050000-552e-088d-06a7-1e8a1845c49f	6274	Šmarje
00050000-552e-088d-7399-a4f7a555c8d2	1293	Šmarje - Sap
00050000-552e-088d-8976-835219b44582	3240	Šmarje pri Jelšah
00050000-552e-088d-1ae7-b2e67faea09b	8220	Šmarješke Toplice
00050000-552e-088d-c0a2-e553c1227b82	2315	Šmartno na Pohorju
00050000-552e-088d-ffc1-e5e6b5d789aa	3341	Šmartno ob Dreti
00050000-552e-088d-6fb4-5f866493f0af	3327	Šmartno ob Paki
00050000-552e-088d-61e7-5f401f371e8f	1275	Šmartno pri Litiji
00050000-552e-088d-fd33-44c0ca40cdf8	2383	Šmartno pri Slovenj Gradcu
00050000-552e-088d-99e1-65f82c3f2f0e	3201	Šmartno v Rožni dolini
00050000-552e-088d-1f9e-25f58daa7f0b	3325	Šoštanj
00050000-552e-088d-132e-2c2f239742ba	6222	Štanjel
00050000-552e-088d-ef6d-a75ea04fa616	3220	Štore
00050000-552e-088d-5eb8-f14abc2cacd8	3304	Tabor
00050000-552e-088d-c7b5-338533d927ce	3221	Teharje
00050000-552e-088d-7309-07fce89bf928	9251	Tišina
00050000-552e-088d-5816-77c810e33f2e	5220	Tolmin
00050000-552e-088d-ff00-721abe947c85	3326	Topolšica
00050000-552e-088d-bab7-f341aee148d1	2371	Trbonje
00050000-552e-088d-ec3e-60694070cfe0	1420	Trbovlje
00050000-552e-088d-fa82-de72e177983a	8231	Trebelno 
00050000-552e-088d-48e3-11a389a2b4ed	8210	Trebnje
00050000-552e-088d-bd74-c2c88de0ba86	5252	Trnovo pri Gorici
00050000-552e-088d-e3e3-77f6557a3ef5	2254	Trnovska vas
00050000-552e-088d-32a3-ffef90209ecb	1222	Trojane
00050000-552e-088d-3654-0cb8bcb38cb8	1236	Trzin
00050000-552e-088d-aca4-e948d446c420	4290	Tržič
00050000-552e-088d-2d65-f5026b75fccb	8295	Tržišče
00050000-552e-088d-b991-654cba0b80ab	1311	Turjak
00050000-552e-088d-fa21-4683528d77a1	9224	Turnišče
00050000-552e-088d-a904-0743a3a45ce7	8323	Uršna sela
00050000-552e-088d-3708-e51af5463055	1252	Vače
00050000-552e-088d-7401-077a47beabcb	3320	Velenje 
00050000-552e-088d-572c-09196da25ed4	3322	Velenje - poštni predali
00050000-552e-088d-d07b-899975a823c6	8212	Velika Loka
00050000-552e-088d-dc0d-3211a3af1f57	2274	Velika Nedelja
00050000-552e-088d-62b1-fa06dadf19fe	9225	Velika Polana
00050000-552e-088d-4bea-5da534aac829	1315	Velike Lašče
00050000-552e-088d-c60d-be62e45ad14a	8213	Veliki Gaber
00050000-552e-088d-21ab-111a6d42ee48	9241	Veržej
00050000-552e-088d-f4f2-9a31e7ca49a2	1312	Videm - Dobrepolje
00050000-552e-088d-560f-805bb42a901a	2284	Videm pri Ptuju
00050000-552e-088d-71bb-e6df4d7f542b	8344	Vinica
00050000-552e-088d-2a23-d390a6e36f76	5271	Vipava
00050000-552e-088d-4939-378a143b51a9	4212	Visoko
00050000-552e-088d-6378-3a6375ed6c7f	1294	Višnja Gora
00050000-552e-088d-4960-ae53d3eac7f1	3205	Vitanje
00050000-552e-088d-d7ce-51a3c6968200	2255	Vitomarci
00050000-552e-088d-3131-273957e9155d	1217	Vodice
00050000-552e-088d-db6c-f9d3cba43fa6	3212	Vojnik\t
00050000-552e-088d-7387-35f4ce473913	5293	Volčja Draga
00050000-552e-088d-a621-9638f023cade	2232	Voličina
00050000-552e-088d-9ddd-315c96b44158	3305	Vransko
00050000-552e-088d-6c7e-7ccf6fa0126b	6217	Vremski Britof
00050000-552e-088d-4427-656803dbcb51	1360	Vrhnika
00050000-552e-088d-5091-f782698d9f1f	2365	Vuhred
00050000-552e-088d-1768-9d4252540322	2367	Vuzenica
00050000-552e-088d-5e1c-360e4771cc3c	8292	Zabukovje 
00050000-552e-088d-8b5e-7e369a386d36	1410	Zagorje ob Savi
00050000-552e-088d-e00e-6fe2bb7d9df4	1303	Zagradec
00050000-552e-088d-2375-cad81c5e91de	2283	Zavrč
00050000-552e-088d-159e-0bb1d1b03a53	8272	Zdole 
00050000-552e-088d-281d-d0a3351465d5	4201	Zgornja Besnica
00050000-552e-088d-65eb-274277e63f14	2242	Zgornja Korena
00050000-552e-088d-908c-c80eeec0ffe5	2201	Zgornja Kungota
00050000-552e-088d-aed8-f12600276df5	2316	Zgornja Ložnica
00050000-552e-088d-5918-e24c1a61a42d	2314	Zgornja Polskava
00050000-552e-088d-7765-b637669e24ff	2213	Zgornja Velka
00050000-552e-088d-0bfc-eec7ec50bb6f	4247	Zgornje Gorje
00050000-552e-088d-1926-192b1bf41286	4206	Zgornje Jezersko
00050000-552e-088d-c7e9-d2d6ba7b95d0	2285	Zgornji Leskovec
00050000-552e-088d-8936-a9a00ae12be8	1432	Zidani Most
00050000-552e-088d-2ac3-82405c08c95e	3214	Zreče
00050000-552e-088d-0ada-dd15fb183764	4209	Žabnica
00050000-552e-088d-eea6-ad6a05226e95	3310	Žalec
00050000-552e-088d-866f-210c4ed63385	4228	Železniki
00050000-552e-088d-7a62-da6a930948a7	2287	Žetale
00050000-552e-088d-e941-b3d7d0725d62	4226	Žiri
00050000-552e-088d-882e-19d9b0d2c9fd	4274	Žirovnica
00050000-552e-088d-9262-962f1f12587f	8360	Žužemberk
\.


--
-- TOC entry 2618 (class 0 OID 408728)
-- Dependencies: 200
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2601 (class 0 OID 408551)
-- Dependencies: 183
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2606 (class 0 OID 408617)
-- Dependencies: 188
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2620 (class 0 OID 408740)
-- Dependencies: 202
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 408845)
-- Dependencies: 214
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, vrstakoproducenta) FROM stdin;
\.


--
-- TOC entry 2636 (class 0 OID 408889)
-- Dependencies: 218
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2624 (class 0 OID 408769)
-- Dependencies: 206
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, ime, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2616 (class 0 OID 408713)
-- Dependencies: 198
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2615 (class 0 OID 408703)
-- Dependencies: 197
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2635 (class 0 OID 408879)
-- Dependencies: 217
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2631 (class 0 OID 408835)
-- Dependencies: 213
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2589 (class 0 OID 408419)
-- Dependencies: 171
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-552e-088e-22c2-fb5f96eae584	00010000-552e-088e-6a29-7f76f47faa34	2015-04-15 08:43:27	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROhyHSf6u5OT48LFhI//U4UU/irbxe4zu";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2650 (class 0 OID 0)
-- Dependencies: 170
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2625 (class 0 OID 408778)
-- Dependencies: 207
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2593 (class 0 OID 408456)
-- Dependencies: 175
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00000000-552e-088e-c356-011409e20a98	beri-vse	Polni dostop do vsega v aplikaciji.	t
00000000-552e-088e-f2a5-3002692480f4	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00000000-552e-088e-8e7c-ed31546ecc16	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00000000-552e-088e-b3c0-30a8479d50e3	ifi-all	Polni dostop do vsega v aplikaciji.	t
00000000-552e-088e-6bf8-28a8c1f10546	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00000000-552e-088e-eee4-f5816922f02e	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2591 (class 0 OID 408440)
-- Dependencies: 173
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-552e-088e-22c2-fb5f96eae584	00000000-552e-088e-b3c0-30a8479d50e3
00010000-552e-088e-ecef-7abcf36aad20	00000000-552e-088e-8e7c-ed31546ecc16
\.


--
-- TOC entry 2627 (class 0 OID 408792)
-- Dependencies: 209
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2619 (class 0 OID 408734)
-- Dependencies: 201
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2613 (class 0 OID 408684)
-- Dependencies: 195
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2598 (class 0 OID 408516)
-- Dependencies: 180
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2614 (class 0 OID 408690)
-- Dependencies: 196
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2634 (class 0 OID 408870)
-- Dependencies: 216
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, dovoliprekrivanje, maxprekrivanj, nastopajoc) FROM stdin;
\.


--
-- TOC entry 2604 (class 0 OID 408586)
-- Dependencies: 186
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2590 (class 0 OID 408428)
-- Dependencies: 172
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, username, password, enabled, expires, defaultroute, defaultrouteparams, email) FROM stdin;
00010000-552e-088e-6a29-7f76f47faa34	Konzolni	console	$2y$05$NS4xMjkyMTcwMzExMjAxROIUUaRrSvUZUnw0MdDjAPFWNd0o70LEu	t	\N	\N	\N	rootmail@max.si
00010000-552e-088e-ecef-7abcf36aad20	Anonimni	anonymous	$2y$05$NS4xMjkyMTcwMzExMjAxRO2zdWe4ekwVjw7qj8i1EC3i0QxWCbS7.	t	\N	\N	\N	noreply@max.si
00010000-552e-088e-22c2-fb5f96eae584	Administrator	admin	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@max.si
\.


--
-- TOC entry 2639 (class 0 OID 408920)
-- Dependencies: 221
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor) FROM stdin;
\.


--
-- TOC entry 2608 (class 0 OID 408632)
-- Dependencies: 190
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2623 (class 0 OID 408761)
-- Dependencies: 205
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2630 (class 0 OID 408827)
-- Dependencies: 212
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2610 (class 0 OID 408660)
-- Dependencies: 192
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2638 (class 0 OID 408910)
-- Dependencies: 220
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 408817)
-- Dependencies: 211
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2236 (class 2606 OID 408481)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 408959)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 408952)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 408869)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 408650)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2305 (class 2606 OID 408683)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2272 (class 2606 OID 408612)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2359 (class 2606 OID 408813)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2283 (class 2606 OID 408630)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2302 (class 2606 OID 408677)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2243 (class 2606 OID 408513)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 408726)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 408753)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2265 (class 2606 OID 408584)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2240 (class 2606 OID 408490)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2256 (class 2606 OID 408548)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2234 (class 2606 OID 408470)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2227 (class 2606 OID 408455)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 408759)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 408791)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 408906)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2251 (class 2606 OID 408541)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2262 (class 2606 OID 408572)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2330 (class 2606 OID 408732)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2260 (class 2606 OID 408563)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2281 (class 2606 OID 408621)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 408744)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 408851)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 408894)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 408776)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2324 (class 2606 OID 408717)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2318 (class 2606 OID 408708)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 408888)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 408842)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2218 (class 2606 OID 408427)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 408782)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2225 (class 2606 OID 408444)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2229 (class 2606 OID 408464)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 408800)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2332 (class 2606 OID 408739)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2307 (class 2606 OID 408689)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2248 (class 2606 OID 408520)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 408699)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 408878)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2270 (class 2606 OID 408597)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2221 (class 2606 OID 408438)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 408934)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2287 (class 2606 OID 408636)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 408767)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2367 (class 2606 OID 408833)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 408672)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 408919)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 408826)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2290 (class 1259 OID 408657)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2249 (class 1259 OID 408543)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2339 (class 1259 OID 408760)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2333 (class 1259 OID 408746)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2334 (class 1259 OID 408745)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2285 (class 1259 OID 408637)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2360 (class 1259 OID 408816)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2361 (class 1259 OID 408814)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2362 (class 1259 OID 408815)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2385 (class 1259 OID 408907)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2386 (class 1259 OID 408908)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 408909)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2392 (class 1259 OID 408937)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2393 (class 1259 OID 408936)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2394 (class 1259 OID 408935)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2267 (class 1259 OID 408599)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2268 (class 1259 OID 408598)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2253 (class 1259 OID 408550)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2254 (class 1259 OID 408549)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2348 (class 1259 OID 408783)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2303 (class 1259 OID 408678)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2231 (class 1259 OID 408471)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2232 (class 1259 OID 408472)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2353 (class 1259 OID 408803)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2354 (class 1259 OID 408802)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2355 (class 1259 OID 408801)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2277 (class 1259 OID 408622)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2278 (class 1259 OID 408624)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2279 (class 1259 OID 408623)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2313 (class 1259 OID 408712)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2314 (class 1259 OID 408710)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2315 (class 1259 OID 408709)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2316 (class 1259 OID 408711)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2222 (class 1259 OID 408445)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2223 (class 1259 OID 408446)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2342 (class 1259 OID 408768)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2328 (class 1259 OID 408733)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2368 (class 1259 OID 408843)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2369 (class 1259 OID 408844)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2257 (class 1259 OID 408564)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2258 (class 1259 OID 408565)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2372 (class 1259 OID 408852)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2373 (class 1259 OID 408853)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2403 (class 1259 OID 408962)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2404 (class 1259 OID 408961)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2405 (class 1259 OID 408964)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2406 (class 1259 OID 408960)
-- Name: idx_a4b7244f8b21fb79; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f8b21fb79 ON alternacija USING btree (vloga_id);


--
-- TOC entry 2407 (class 1259 OID 408963)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2365 (class 1259 OID 408834)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2319 (class 1259 OID 408721)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2320 (class 1259 OID 408720)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2321 (class 1259 OID 408718)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2322 (class 1259 OID 408719)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2241 (class 1259 OID 408514)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2399 (class 1259 OID 408954)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2400 (class 1259 OID 408953)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2284 (class 1259 OID 408631)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2237 (class 1259 OID 408492)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2238 (class 1259 OID 408491)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2245 (class 1259 OID 408521)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2246 (class 1259 OID 408522)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2308 (class 1259 OID 408702)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2309 (class 1259 OID 408701)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2310 (class 1259 OID 408700)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2291 (class 1259 OID 408659)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2292 (class 1259 OID 408655)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2293 (class 1259 OID 408652)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2294 (class 1259 OID 408653)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2295 (class 1259 OID 408651)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2296 (class 1259 OID 408656)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2297 (class 1259 OID 408654)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2252 (class 1259 OID 408542)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2273 (class 1259 OID 408613)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2274 (class 1259 OID 408615)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2275 (class 1259 OID 408614)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2276 (class 1259 OID 408616)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2327 (class 1259 OID 408727)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2266 (class 1259 OID 408585)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2219 (class 1259 OID 408439)
-- Name: uniq_7fb775b7f85e0677; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7fb775b7f85e0677 ON uporabniki USING btree (username);


--
-- TOC entry 2347 (class 1259 OID 408777)
-- Name: uniq_952dd21955cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21955cca980 ON prostor USING btree (ime);


--
-- TOC entry 2244 (class 1259 OID 408515)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2263 (class 1259 OID 408573)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2384 (class 1259 OID 408895)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2230 (class 1259 OID 408465)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2298 (class 1259 OID 408658)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2432 (class 2606 OID 409095)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2435 (class 2606 OID 409080)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2434 (class 2606 OID 409085)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2430 (class 2606 OID 409105)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2436 (class 2606 OID 409075)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2431 (class 2606 OID 409100)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2433 (class 2606 OID 409090)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2418 (class 2606 OID 409015)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2453 (class 2606 OID 409190)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2451 (class 2606 OID 409185)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2452 (class 2606 OID 409180)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2429 (class 2606 OID 409070)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2459 (class 2606 OID 409230)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2461 (class 2606 OID 409220)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2460 (class 2606 OID 409225)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2449 (class 2606 OID 409170)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2470 (class 2606 OID 409265)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2469 (class 2606 OID 409270)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2468 (class 2606 OID 409275)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2471 (class 2606 OID 409290)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2472 (class 2606 OID 409285)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2473 (class 2606 OID 409280)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2423 (class 2606 OID 409045)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2424 (class 2606 OID 409040)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2419 (class 2606 OID 409025)
-- Name: fk_4472a4c610389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c610389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2420 (class 2606 OID 409020)
-- Name: fk_4472a4c66beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT fk_4472a4c66beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2455 (class 2606 OID 409200)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2437 (class 2606 OID 409110)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2411 (class 2606 OID 408975)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2410 (class 2606 OID 408980)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2456 (class 2606 OID 409215)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2457 (class 2606 OID 409210)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2458 (class 2606 OID 409205)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2427 (class 2606 OID 409050)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2425 (class 2606 OID 409060)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2426 (class 2606 OID 409055)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2441 (class 2606 OID 409145)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2443 (class 2606 OID 409135)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2444 (class 2606 OID 409130)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2442 (class 2606 OID 409140)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2409 (class 2606 OID 408965)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2408 (class 2606 OID 408970)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2454 (class 2606 OID 409195)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2450 (class 2606 OID 409175)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2464 (class 2606 OID 409240)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2463 (class 2606 OID 409245)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2422 (class 2606 OID 409030)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2421 (class 2606 OID 409035)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2466 (class 2606 OID 409250)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2465 (class 2606 OID 409255)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2478 (class 2606 OID 409315)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2479 (class 2606 OID 409310)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2476 (class 2606 OID 409325)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2480 (class 2606 OID 409305)
-- Name: fk_a4b7244f8b21fb79; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f8b21fb79 FOREIGN KEY (vloga_id) REFERENCES funkcija(id);


--
-- TOC entry 2477 (class 2606 OID 409320)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2462 (class 2606 OID 409235)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2445 (class 2606 OID 409165)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2446 (class 2606 OID 409160)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2448 (class 2606 OID 409150)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2447 (class 2606 OID 409155)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2415 (class 2606 OID 408995)
-- Name: fk_b7229ce169e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT fk_b7229ce169e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2414 (class 2606 OID 409000)
-- Name: fk_b7229ce1a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT fk_b7229ce1a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2474 (class 2606 OID 409300)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2475 (class 2606 OID 409295)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2428 (class 2606 OID 409065)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2467 (class 2606 OID 409260)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2412 (class 2606 OID 408990)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2413 (class 2606 OID 408985)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2417 (class 2606 OID 409005)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2416 (class 2606 OID 409010)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2438 (class 2606 OID 409125)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES kose(id);


--
-- TOC entry 2439 (class 2606 OID 409120)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2440 (class 2606 OID 409115)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-04-15 08:43:27 CEST

--
-- PostgreSQL database dump complete
--

