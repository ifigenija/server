--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-27 09:13:42 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 232 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2756 (class 0 OID 0)
-- Dependencies: 232
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 5173767)
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
-- TOC entry 227 (class 1259 OID 5174276)
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
-- TOC entry 226 (class 1259 OID 5174259)
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
-- TOC entry 219 (class 1259 OID 5174170)
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
-- TOC entry 194 (class 1259 OID 5173940)
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
-- TOC entry 197 (class 1259 OID 5173974)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 5173887)
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
-- TOC entry 213 (class 1259 OID 5174100)
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
-- TOC entry 192 (class 1259 OID 5173924)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 196 (class 1259 OID 5173968)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 5173904)
-- Name: kontaktnaoseba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kontaktnaoseba (
    id uuid NOT NULL,
    popa_id uuid,
    oseba_id uuid,
    status character varying(20) DEFAULT NULL::character varying,
    funkcija character varying(255) DEFAULT NULL::character varying,
    opis text
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
-- TOC entry 202 (class 1259 OID 5174017)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 5174042)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 5173861)
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
-- TOC entry 181 (class 1259 OID 5173776)
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
-- TOC entry 182 (class 1259 OID 5173787)
-- Name: oseba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba (
    id uuid NOT NULL,
    user_id uuid,
    sifra character varying(4) NOT NULL,
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
-- TOC entry 172 (class 1259 OID 4729417)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 177 (class 1259 OID 5173741)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 5173760)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 5174049)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 5174080)
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
-- TOC entry 223 (class 1259 OID 5174213)
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
-- TOC entry 184 (class 1259 OID 5173818)
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
-- TOC entry 186 (class 1259 OID 5173853)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 5174023)
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
-- TOC entry 185 (class 1259 OID 5173838)
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
-- TOC entry 191 (class 1259 OID 5173916)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 5174035)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 5174155)
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
-- TOC entry 222 (class 1259 OID 5174206)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 5174064)
-- Name: prostor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prostor (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    jeprizorisce boolean,
    kapaciteta integer,
    opis text
);


--
-- TOC entry 201 (class 1259 OID 5174008)
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
-- TOC entry 200 (class 1259 OID 5173998)
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
-- TOC entry 221 (class 1259 OID 5174195)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 5174132)
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
-- TOC entry 174 (class 1259 OID 5173712)
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
-- TOC entry 173 (class 1259 OID 5173710)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2757 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 5174074)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 5173750)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 5173734)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 5174088)
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
-- TOC entry 204 (class 1259 OID 5174029)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 5173979)
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
-- TOC entry 230 (class 1259 OID 5174301)
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
-- TOC entry 229 (class 1259 OID 5174294)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 5174289)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 5174142)
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
-- TOC entry 231 (class 1259 OID 5174309)
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE strosekuprizoritve_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 183 (class 1259 OID 5173810)
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
-- TOC entry 199 (class 1259 OID 5173985)
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
-- TOC entry 220 (class 1259 OID 5174184)
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
-- TOC entry 188 (class 1259 OID 5173873)
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
-- TOC entry 175 (class 1259 OID 5173721)
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
-- TOC entry 225 (class 1259 OID 5174239)
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
-- TOC entry 193 (class 1259 OID 5173931)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 5174056)
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
-- TOC entry 215 (class 1259 OID 5174124)
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
-- TOC entry 195 (class 1259 OID 5173963)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 5174229)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 5174114)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2146 (class 2604 OID 5173715)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2698 (class 0 OID 5173767)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2745 (class 0 OID 5174276)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
\.


--
-- TOC entry 2744 (class 0 OID 5174259)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2737 (class 0 OID 5174170)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-5565-6ea6-ccb6-4452450103eb	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-5565-6ea6-aa39-5165204e13af	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-5565-6ea6-5f81-0a6d53313df9	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 2712 (class 0 OID 5173940)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2715 (class 0 OID 5173974)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2707 (class 0 OID 5173887)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5565-6ea5-ee59-c5c614c11bb4	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5565-6ea5-1975-327301bc9bd3	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5565-6ea5-c42e-220d0452be1f	AL	ALB	008	Albania 	Albanija	\N
00040000-5565-6ea5-9c52-7e7f0e8e77d0	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5565-6ea5-f41a-d6898638d881	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5565-6ea5-1b8f-99ace9f401e4	AD	AND	020	Andorra 	Andora	\N
00040000-5565-6ea5-5ea7-77b9a579d62e	AO	AGO	024	Angola 	Angola	\N
00040000-5565-6ea5-ef84-20a0c490c835	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5565-6ea5-e969-61ebb34d9295	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5565-6ea5-3005-e980be963384	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5565-6ea5-e0ed-98ea7253d967	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5565-6ea5-bb4b-bfd1e2319596	AM	ARM	051	Armenia 	Armenija	\N
00040000-5565-6ea5-07eb-8bda541a7374	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5565-6ea5-62fe-73e3418a4ff7	AU	AUS	036	Australia 	Avstralija	\N
00040000-5565-6ea5-7232-bd17be37ceb5	AT	AUT	040	Austria 	Avstrija	\N
00040000-5565-6ea5-c110-cbe9edf54bf0	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5565-6ea5-0336-b21e744b4ecf	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5565-6ea5-26c9-c0a22ce9c1ff	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5565-6ea5-0a18-b45850eb05aa	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5565-6ea5-8417-8f5cefb62b5d	BB	BRB	052	Barbados 	Barbados	\N
00040000-5565-6ea5-f1c2-2b3cbbcca43e	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5565-6ea5-b3a1-f7886ed301eb	BE	BEL	056	Belgium 	Belgija	\N
00040000-5565-6ea5-aad7-d784d8c2ea19	BZ	BLZ	084	Belize 	Belize	\N
00040000-5565-6ea5-538c-e3157d66ed26	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5565-6ea5-e73d-c56dcfeb3b48	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5565-6ea5-c495-112d63ca3e84	BT	BTN	064	Bhutan 	Butan	\N
00040000-5565-6ea5-c7be-23472ff337b7	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5565-6ea5-cd87-243ef43f9df9	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5565-6ea5-ea7d-914530a6d393	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5565-6ea5-91ed-e50c40c7ef05	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5565-6ea5-edd6-e84b8270fd90	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5565-6ea5-1e3e-0f1a3fb19592	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5565-6ea5-e434-b1f4495d8c55	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5565-6ea5-353c-ab17f0a71a77	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5565-6ea5-2123-286b31dd1614	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5565-6ea5-9745-3b1a4e2ab758	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5565-6ea5-cc34-4264bd40094d	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5565-6ea5-0471-0ce2590231d3	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5565-6ea5-85d0-ef8983600ae6	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5565-6ea5-7742-1c9f2e69877b	CA	CAN	124	Canada 	Kanada	\N
00040000-5565-6ea5-cf34-416abc644290	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5565-6ea5-202b-011ec4700fc0	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5565-6ea5-9a94-89f594aeed55	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5565-6ea5-2d5a-ca43c212d985	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5565-6ea5-c203-606e773d92bc	CL	CHL	152	Chile 	Čile	\N
00040000-5565-6ea5-4cb8-88fac80563e1	CN	CHN	156	China 	Kitajska	\N
00040000-5565-6ea5-8345-eb40452cfc01	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5565-6ea5-d9cf-04ddb71e1f51	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5565-6ea5-af0d-62788783d853	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5565-6ea5-9f5f-c4e511138bee	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5565-6ea5-ec4e-6a37f4d0489c	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5565-6ea5-7cef-8003a666b364	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5565-6ea5-dbb8-8d29386e9f75	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5565-6ea5-ab0b-7eb612a76f56	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5565-6ea5-702d-b3916a308251	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5565-6ea5-3aec-cd771bc45393	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5565-6ea5-68b4-f31b5408a92e	CU	CUB	192	Cuba 	Kuba	\N
00040000-5565-6ea5-8bcb-ee1fd7a12c7c	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5565-6ea5-a0eb-856ef372767f	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5565-6ea5-6b5f-f0327ca61e3c	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5565-6ea5-9800-bf339a89b65a	DK	DNK	208	Denmark 	Danska	\N
00040000-5565-6ea5-fbd7-48cf9ad18186	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5565-6ea5-9930-f7da12984da5	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5565-6ea5-745a-df06c236fffe	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5565-6ea5-bbad-44ddb4e5d43c	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5565-6ea5-e6f9-325139191f42	EG	EGY	818	Egypt 	Egipt	\N
00040000-5565-6ea5-2b41-ecce6bc253a1	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5565-6ea5-c229-0243276b55dd	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5565-6ea5-68ab-60a844c466c1	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5565-6ea5-5371-aa2aee9fabf3	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5565-6ea5-baf1-938edbc89c8a	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5565-6ea5-c31c-ee0f2b58ce5a	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5565-6ea5-c695-0cd5dfbef8ea	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5565-6ea5-7e9b-3639ce633962	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5565-6ea5-2694-2fc20ef53090	FI	FIN	246	Finland 	Finska	\N
00040000-5565-6ea5-98f2-64c620b05a43	FR	FRA	250	France 	Francija	\N
00040000-5565-6ea5-1fcd-15b9e4ed4035	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5565-6ea5-3b87-5cdd03e84c04	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5565-6ea5-8dd6-50f6323fb66f	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5565-6ea5-454c-1130aa8f7395	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5565-6ea5-6076-a5649e687554	GA	GAB	266	Gabon 	Gabon	\N
00040000-5565-6ea5-5449-70ffd81be22e	GM	GMB	270	Gambia 	Gambija	\N
00040000-5565-6ea5-20f6-1f91bc0c9168	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5565-6ea5-81a8-e805e593a636	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5565-6ea5-743e-9d928125fd97	GH	GHA	288	Ghana 	Gana	\N
00040000-5565-6ea5-8267-4a1ba43a8fd2	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5565-6ea5-d5a5-8b7d0cc4ecbc	GR	GRC	300	Greece 	Grčija	\N
00040000-5565-6ea5-5308-090a48eb0a27	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5565-6ea5-14c9-f515873335ed	GD	GRD	308	Grenada 	Grenada	\N
00040000-5565-6ea5-cc2a-d28d2114d150	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5565-6ea5-75fe-2d9adce49641	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5565-6ea5-ba12-24b9a6590fe1	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5565-6ea5-4576-447c1275ac62	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5565-6ea5-077f-93a0a1d3a318	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5565-6ea5-e819-da1634387ae7	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5565-6ea5-efd7-af44f8b07a9d	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5565-6ea5-4ad2-4e63ddb3a9c2	HT	HTI	332	Haiti 	Haiti	\N
00040000-5565-6ea5-3440-f5e0b98adcfc	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5565-6ea5-766d-dea7b9043155	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5565-6ea5-9282-882ec9da76b2	HN	HND	340	Honduras 	Honduras	\N
00040000-5565-6ea5-4ac2-47e41287a4c3	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5565-6ea5-9379-529a654d7071	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5565-6ea5-231d-a30e128b3768	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5565-6ea5-8986-6d6fc9a5c23d	IN	IND	356	India 	Indija	\N
00040000-5565-6ea5-2196-fd176cceb8a9	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5565-6ea5-8047-8d179360d92c	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5565-6ea5-931f-c0180299d35a	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5565-6ea5-3631-91430247c805	IE	IRL	372	Ireland 	Irska	\N
00040000-5565-6ea5-6c95-3c979d2e3b47	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5565-6ea5-c2e8-e5b0a84fc431	IL	ISR	376	Israel 	Izrael	\N
00040000-5565-6ea5-3483-9ae901c78fe5	IT	ITA	380	Italy 	Italija	\N
00040000-5565-6ea5-efd7-bb0c44df0140	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5565-6ea5-c42b-a880218ceb55	JP	JPN	392	Japan 	Japonska	\N
00040000-5565-6ea5-ca32-8a617fe3ba7f	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5565-6ea5-d14b-a365ca19a941	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5565-6ea5-41e0-c07a3a304e1d	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5565-6ea5-8235-d317d46a2af9	KE	KEN	404	Kenya 	Kenija	\N
00040000-5565-6ea5-f6b5-a391f5bb46a4	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5565-6ea5-3d54-f4477aa1a798	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5565-6ea5-48a4-4b512dd5ef70	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5565-6ea5-a4ef-23ace384b130	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5565-6ea5-78f0-353d87aeee8a	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5565-6ea5-492c-2a51aceb4e79	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5565-6ea5-874a-ad9df92153d1	LV	LVA	428	Latvia 	Latvija	\N
00040000-5565-6ea5-ccf4-97092acf9f54	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5565-6ea5-f94b-84423aebad07	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5565-6ea5-461e-6d12e5dcaacf	LR	LBR	430	Liberia 	Liberija	\N
00040000-5565-6ea5-2f6a-35dab09e860e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5565-6ea5-f23f-041d83eeda86	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5565-6ea5-68e3-2b87a13ed360	LT	LTU	440	Lithuania 	Litva	\N
00040000-5565-6ea5-093f-ac6653f8783a	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5565-6ea5-283d-8cfe7e6439fd	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5565-6ea5-6a2d-d4679e860130	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5565-6ea5-4ef2-af4a80f56235	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5565-6ea5-ae5e-70799f183908	MW	MWI	454	Malawi 	Malavi	\N
00040000-5565-6ea5-2387-6a7b6e215648	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5565-6ea5-7616-8698afc8ab67	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5565-6ea5-a713-f7dc11116ab1	ML	MLI	466	Mali 	Mali	\N
00040000-5565-6ea5-05f9-054dcab48132	MT	MLT	470	Malta 	Malta	\N
00040000-5565-6ea5-e433-4b457fa3a045	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5565-6ea5-12c1-3ca88ee58b51	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5565-6ea5-0af7-fe8d83da3919	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5565-6ea5-9184-a4ddfbc76b7a	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5565-6ea5-1f57-decf7514b5d3	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5565-6ea5-7986-6d9300830283	MX	MEX	484	Mexico 	Mehika	\N
00040000-5565-6ea5-22dd-6441fda2e174	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5565-6ea5-6980-45fc0717c312	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5565-6ea5-059d-8f0360e27eb7	MC	MCO	492	Monaco 	Monako	\N
00040000-5565-6ea5-eb04-7c0889348031	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5565-6ea5-287c-231764387f01	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5565-6ea5-abbf-6d41fac132fc	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5565-6ea5-b0cd-a669647c737f	MA	MAR	504	Morocco 	Maroko	\N
00040000-5565-6ea5-fb59-20b0fb99184b	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5565-6ea5-df07-4a01a898ee71	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5565-6ea5-63a8-e349e8aa6777	NA	NAM	516	Namibia 	Namibija	\N
00040000-5565-6ea5-d254-3e5841699871	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5565-6ea5-98c4-a1502bab1795	NP	NPL	524	Nepal 	Nepal	\N
00040000-5565-6ea5-3f42-50ae07d3effb	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5565-6ea5-f02c-3732bba50015	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5565-6ea5-8f7b-c9f22d5ea710	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5565-6ea5-254f-faf9db8e4e13	NE	NER	562	Niger 	Niger 	\N
00040000-5565-6ea5-11c4-1194a381a6f9	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5565-6ea5-77be-2ab997801695	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5565-6ea5-27f5-88424c0405fb	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5565-6ea5-5586-466ac7d49f34	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5565-6ea5-93f1-da2c869d7e8e	NO	NOR	578	Norway 	Norveška	\N
00040000-5565-6ea5-1fe1-f1950efb3c48	OM	OMN	512	Oman 	Oman	\N
00040000-5565-6ea5-480f-922b1d64fba0	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5565-6ea5-7e90-56e5870157b4	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5565-6ea5-2209-f4727cf3cc62	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5565-6ea5-f4fb-96eb7c3ce8c4	PA	PAN	591	Panama 	Panama	\N
00040000-5565-6ea5-e696-58d58c7264b3	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5565-6ea5-5e73-c57bc93e6d12	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5565-6ea5-8fa7-9f313efd6b74	PE	PER	604	Peru 	Peru	\N
00040000-5565-6ea5-feae-3a90d5150ee5	PH	PHL	608	Philippines 	Filipini	\N
00040000-5565-6ea5-592b-a92872fb9c8f	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5565-6ea5-d825-55debfb74534	PL	POL	616	Poland 	Poljska	\N
00040000-5565-6ea5-b544-d6942de098ab	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5565-6ea5-64aa-16e9736a10aa	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5565-6ea5-7816-a08fe5b2354e	QA	QAT	634	Qatar 	Katar	\N
00040000-5565-6ea5-1baa-30c324bd53a9	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5565-6ea5-3507-2f25f6b272ce	RO	ROU	642	Romania 	Romunija	\N
00040000-5565-6ea5-705c-5995cd908b3b	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5565-6ea5-f7d3-a9223dd34dc9	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5565-6ea5-0c8e-e60cf190f2a0	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5565-6ea5-9a39-2a17ea963510	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5565-6ea5-ea5f-160a27bfab10	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5565-6ea5-7c64-92380f8272db	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5565-6ea5-c2cc-83f291056077	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5565-6ea5-a9aa-2eddeaafc1fa	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5565-6ea5-4d63-9cf6953daee6	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5565-6ea5-b026-2842482f55f5	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5565-6ea5-9b6e-db10b2e29c45	SM	SMR	674	San Marino 	San Marino	\N
00040000-5565-6ea5-e3a0-2ece9bd5a72f	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5565-6ea5-8fc5-4fd5286e6af1	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5565-6ea5-0b8a-ed557b8d87d9	SN	SEN	686	Senegal 	Senegal	\N
00040000-5565-6ea5-8ed1-e2bef4559ad6	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5565-6ea5-4c7a-36f10961d7ad	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5565-6ea5-88af-a0fb834a57c0	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5565-6ea5-2760-d86dbde56351	SG	SGP	702	Singapore 	Singapur	\N
00040000-5565-6ea5-4204-9dc4224955ca	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5565-6ea5-89e3-1d48b454ed16	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5565-6ea5-0194-98ea43cfe8bb	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5565-6ea5-51c0-af3a6f65ac41	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5565-6ea5-0fb2-c108bce63cdf	SO	SOM	706	Somalia 	Somalija	\N
00040000-5565-6ea5-8257-9dfaf2789cb7	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5565-6ea5-e929-0c4f6d79f321	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5565-6ea5-1e81-93b8169241f1	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5565-6ea5-9758-24830fccbdc3	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5565-6ea5-2796-104fef641070	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5565-6ea5-2b2b-1d0c0bdcb65b	SD	SDN	729	Sudan 	Sudan	\N
00040000-5565-6ea5-3584-0c2ad9fd2965	SR	SUR	740	Suriname 	Surinam	\N
00040000-5565-6ea5-6dbe-fd8c4f903ae6	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5565-6ea5-39ac-cc801b09e4c9	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5565-6ea5-8f0b-2ba663c78401	SE	SWE	752	Sweden 	Švedska	\N
00040000-5565-6ea5-ee32-914d99b4fe12	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5565-6ea5-9caa-5f184ecc8753	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5565-6ea5-5515-cad066f5a47e	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5565-6ea5-87e7-f2ed58eda52a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5565-6ea5-021d-20cd841ffc8a	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5565-6ea5-2d1f-63e38a0e37cd	TH	THA	764	Thailand 	Tajska	\N
00040000-5565-6ea5-62ce-87d0d6dd648a	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5565-6ea5-ba11-4a5506bea57c	TG	TGO	768	Togo 	Togo	\N
00040000-5565-6ea5-7713-4dc324b6078c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5565-6ea5-b974-458346f5eb8e	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5565-6ea5-8da0-4f41f87345d5	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5565-6ea5-7c76-39a2c0ba6737	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5565-6ea5-a6d4-15d0ca6b7b9d	TR	TUR	792	Turkey 	Turčija	\N
00040000-5565-6ea5-a1b4-ab9e94e48826	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5565-6ea5-0e19-16f0173ba971	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5565-6ea5-bb07-fc5bc0083940	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5565-6ea5-9cb3-b01430eb353a	UG	UGA	800	Uganda 	Uganda	\N
00040000-5565-6ea5-31bd-422cb6e5eb48	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5565-6ea5-a13e-d6623eb34886	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5565-6ea5-c31f-6bab037a0e03	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5565-6ea5-00d3-407a39dd2359	US	USA	840	United States 	Združene države Amerike	\N
00040000-5565-6ea5-6b2d-a482588d4e07	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5565-6ea5-bf6a-c903d299daad	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5565-6ea5-a339-75770bd1caf9	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5565-6ea5-e197-94c09a330dd6	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5565-6ea5-d254-6309ede225b7	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5565-6ea5-05d3-484c8f93145c	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5565-6ea5-44a3-3c67bbf471a8	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5565-6ea5-20e4-950de5d47d40	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5565-6ea5-7e5b-bab295575d36	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5565-6ea5-054e-1adca4c5ac86	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5565-6ea5-5fb8-48c8f6b57bd5	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5565-6ea5-de34-06c6eab4ddaa	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5565-6ea5-56b1-701cfc2e228b	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2731 (class 0 OID 5174100)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj) FROM stdin;
000d0000-5565-6ea6-0a07-07ba10e2a943	000e0000-5565-6ea6-f0a6-5a2ae14d132f	\N	000f0000-5565-6ea5-706c-045443a53bed	igralec	Hipolita	velika	t	9	t	t	\N
000d0000-5565-6ea6-268c-0529184f732d	000e0000-5565-6ea6-f0a6-5a2ae14d132f	\N	000f0000-5565-6ea5-706c-045443a53bed	igralec	Tezej	velika	t	9	t	t	\N
\.


--
-- TOC entry 2710 (class 0 OID 5173924)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2714 (class 0 OID 5173968)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2708 (class 0 OID 5173904)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
\.


--
-- TOC entry 2688 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2720 (class 0 OID 5174017)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2724 (class 0 OID 5174042)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2705 (class 0 OID 5173861)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5565-6ea5-5193-a7ae41126bc7	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5565-6ea5-871a-bb2b9276eb6b	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5565-6ea5-1465-c5dde1e8410d	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5565-6ea5-829e-cd6a7807f5a2	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5565-6ea5-d8a6-7bdd16695a3a	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5565-6ea5-0d23-ae9f69efd2dd	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5565-6ea5-b03d-1d17896c441c	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5565-6ea5-f9f3-471119e7b20b	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5565-6ea5-d4b8-4d8015733d36	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5565-6ea5-9bf8-0887437fba43	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5565-6ea5-08fe-5e2d46c96865	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5565-6ea5-6c43-3655f782c753	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5565-6ea5-adbb-e44f9485b278	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5565-6ea5-cdf1-ca1f6474d041	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5565-6ea5-f843-8e08bddbc227	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2699 (class 0 OID 5173776)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5565-6ea5-6d60-e150f61cae01	00000000-5565-6ea5-d8a6-7bdd16695a3a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5565-6ea5-3a7c-661ef4d023d6	00000000-5565-6ea5-d8a6-7bdd16695a3a	00010000-5565-6ea5-ec5b-71642e5634fb	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5565-6ea5-57ee-adc15d4de0af	00000000-5565-6ea5-0d23-ae9f69efd2dd	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2700 (class 0 OID 5173787)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, sifra, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5565-6ea6-f0ea-4d15f745f5b7	\N	0001	g.	Janez	Novak	a	Peter	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5565-6ea6-5487-293a3053ff2a	\N	0002	dr.	Anton	Horvat	b			anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5565-6ea6-fd98-43cf73dc8c42	\N	0003		Ivan	Kovačič	c			ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5565-6ea6-1dad-9fd34f066df6	\N	0004	prof.	Jožef	Krajnc	d		Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5565-6ea6-6faa-17be064d22ec	\N	0005		Marko	Zupančič	e			marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5565-6ea6-aaf6-c3ba83ccfd7a	\N	0006	ga.	Marija	Kovač	f			marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5565-6ea6-adf0-6d7c66760bfa	\N	0007	ga.	Ana	Potočnik	g			ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5565-6ea6-8cf7-b7b3c94a475e	\N	0008	ga.	Maja	Mlakar	h			maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5565-6ea6-89ac-53848f515c6e	\N	0009		Irena	Kos	i			irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5565-6ea6-22a1-446680077a2c	\N	0010		Mojca	Vidmar	J			mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5565-6ea6-993b-00966988c677	\N	0011		xx	write protected12345	\N			xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2690 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2695 (class 0 OID 5173741)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5565-6ea5-02d1-2b6f17470a44	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5565-6ea5-385f-65fd3dcc312a	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5565-6ea5-571c-bf266ad864ba	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5565-6ea5-e5af-e671860b68b0	Abonma-read	Abonma - branje	f
00030000-5565-6ea5-c9c1-6d568c48a982	Abonma-write	Abonma - spreminjanje	f
00030000-5565-6ea5-8fa3-36c603209b68	Alternacija-read	Alternacija - branje	f
00030000-5565-6ea5-3345-8e9b54ae515c	Alternacija-write	Alternacija - spreminjanje	f
00030000-5565-6ea5-b2f4-bddc8056b78e	Arhivalija-read	Arhivalija - branje	f
00030000-5565-6ea5-8c1d-7d4bc72ea15d	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5565-6ea5-877f-60a0e899e03d	Besedilo-read	Besedilo - branje	f
00030000-5565-6ea5-ea3a-d560bcc9f523	Besedilo-write	Besedilo - spreminjanje	f
00030000-5565-6ea5-98a5-100c8763e70d	DogodekIzven-read	DogodekIzven - branje	f
00030000-5565-6ea5-55c6-0fa31a571cf7	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5565-6ea5-9008-dee19e7176cf	Dogodek-read	Dogodek - branje	f
00030000-5565-6ea5-acb2-9fac41c4bd8a	Dogodek-write	Dogodek - spreminjanje	f
00030000-5565-6ea5-c07f-dcc5e5fea44b	Drzava-read	Drzava - branje	f
00030000-5565-6ea5-17bb-6cd74a09d80a	Drzava-write	Drzava - spreminjanje	f
00030000-5565-6ea5-a364-033e43d71774	Funkcija-read	Funkcija - branje	f
00030000-5565-6ea5-90d8-c91095a3d89f	Funkcija-write	Funkcija - spreminjanje	f
00030000-5565-6ea5-d7c1-9b0235670be3	Gostovanje-read	Gostovanje - branje	f
00030000-5565-6ea5-fb1e-baefca72d638	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5565-6ea5-c9e6-844127dcc538	Gostujoca-read	Gostujoca - branje	f
00030000-5565-6ea5-1f01-629d31ffcdfd	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5565-6ea5-5488-b2496c776702	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5565-6ea5-f1ff-2cb0bbf24fbe	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5565-6ea5-dbc1-c1db0a25a9e4	Kupec-read	Kupec - branje	f
00030000-5565-6ea5-11d8-8810b4621acc	Kupec-write	Kupec - spreminjanje	f
00030000-5565-6ea5-9d2f-0611363179bb	NacinPlacina-read	NacinPlacina - branje	f
00030000-5565-6ea5-952e-e5559a08ed15	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5565-6ea5-76b9-4c8e9a786b54	Option-read	Option - branje	f
00030000-5565-6ea5-4e11-9d4497d8e17e	Option-write	Option - spreminjanje	f
00030000-5565-6ea5-178a-63659af75eb1	OptionValue-read	OptionValue - branje	f
00030000-5565-6ea5-2655-a416a5476333	OptionValue-write	OptionValue - spreminjanje	f
00030000-5565-6ea5-d5cb-3cc4c1f25d1b	Oseba-read	Oseba - branje	f
00030000-5565-6ea5-25fe-9ed076d5ae7b	Oseba-write	Oseba - spreminjanje	f
00030000-5565-6ea5-036a-1448afdd0fc0	Permission-read	Permission - branje	f
00030000-5565-6ea5-e060-620e7b3b129d	Permission-write	Permission - spreminjanje	f
00030000-5565-6ea5-0d01-67e20191ed73	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5565-6ea5-87c5-0892dde6554a	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5565-6ea5-cbf6-ed1f48ded636	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5565-6ea5-f916-86a03a16dae8	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5565-6ea5-6bd4-86d5641ac9a1	Pogodba-read	Pogodba - branje	f
00030000-5565-6ea5-b2f1-e58049bc0c60	Pogodba-write	Pogodba - spreminjanje	f
00030000-5565-6ea5-03af-07e86faa8728	Popa-read	Popa - branje	f
00030000-5565-6ea5-79ef-644bc4dce6b0	Popa-write	Popa - spreminjanje	f
00030000-5565-6ea5-8eda-c7a417eb9742	Posta-read	Posta - branje	f
00030000-5565-6ea5-c818-4dc65b77bc61	Posta-write	Posta - spreminjanje	f
00030000-5565-6ea5-2e80-07c8b5812886	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5565-6ea5-3c97-7176e7ce70fa	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5565-6ea5-0d1d-370c1fd33c83	PostniNaslov-read	PostniNaslov - branje	f
00030000-5565-6ea5-692a-82d4395758cd	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5565-6ea5-9572-3fab8807ba0b	Predstava-read	Predstava - branje	f
00030000-5565-6ea5-13fc-de2f7f1a01bc	Predstava-write	Predstava - spreminjanje	f
00030000-5565-6ea5-af4a-9b430ba5a0c0	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5565-6ea5-8028-dfec96371c38	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5565-6ea5-e116-47aa67728eb6	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5565-6ea5-2694-aa66354f2138	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5565-6ea5-0d5f-2d16f5b0fe56	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5565-6ea5-cb82-caa3f38941b3	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5565-6ea5-47de-3f37b7073bd5	Prostor-read	Prostor - branje	f
00030000-5565-6ea5-e514-e581c37f6582	Prostor-write	Prostor - spreminjanje	f
00030000-5565-6ea5-fda7-628fee8db025	Racun-read	Racun - branje	f
00030000-5565-6ea5-cec7-112da76ef559	Racun-write	Racun - spreminjanje	f
00030000-5565-6ea5-b6ce-554c22c65c7a	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5565-6ea5-f6fc-43362bb684e6	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5565-6ea5-1b39-3ca9123752e7	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5565-6ea5-d13d-3ca8b0afa8cd	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5565-6ea5-4a95-797bc7839e15	Rekvizit-read	Rekvizit - branje	f
00030000-5565-6ea5-20a8-594f472f38c7	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5565-6ea5-f83a-5c78dab33075	Revizija-read	Revizija - branje	f
00030000-5565-6ea5-1aa3-60ef35c63dda	Revizija-write	Revizija - spreminjanje	f
00030000-5565-6ea5-719e-bb5e19be0d97	Rezervacija-read	Rezervacija - branje	f
00030000-5565-6ea5-274e-089ad722d9bc	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5565-6ea5-6160-241545a10d66	Role-read	Role - branje	f
00030000-5565-6ea5-c6e5-6e0ec31236f4	Role-write	Role - spreminjanje	f
00030000-5565-6ea5-1b9f-a78c6b849467	SedezniRed-read	SedezniRed - branje	f
00030000-5565-6ea5-fefc-75155f4bdf77	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5565-6ea5-6ca4-661c36784454	Sedez-read	Sedez - branje	f
00030000-5565-6ea5-2182-8d5770fd3fbc	Sedez-write	Sedez - spreminjanje	f
00030000-5565-6ea5-4319-234d9373326b	Sezona-read	Sezona - branje	f
00030000-5565-6ea5-8192-1b95f73ecfce	Sezona-write	Sezona - spreminjanje	f
00030000-5565-6ea5-3d2a-ccc15e6ce89b	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5565-6ea5-3c70-35468793edc0	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5565-6ea5-ff3b-f47d71668658	Stevilcenje-read	Stevilcenje - branje	f
00030000-5565-6ea5-a3a3-a5ddcc4fdcf5	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5565-6ea5-9cad-d436c7082b57	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5565-6ea5-3a34-2d8deaec644c	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5565-6ea5-0dc3-cede2e01afc4	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5565-6ea5-3668-47f6ad9194fb	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5565-6ea5-abde-6725ac21910c	Telefonska-read	Telefonska - branje	f
00030000-5565-6ea5-bbe4-c2ff1acac79d	Telefonska-write	Telefonska - spreminjanje	f
00030000-5565-6ea5-7cb7-f861e35bdc9f	TerminStoritve-read	TerminStoritve - branje	f
00030000-5565-6ea5-029d-89e78381d8c9	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5565-6ea5-4af1-f2284fd0109d	TipFunkcije-read	TipFunkcije - branje	f
00030000-5565-6ea5-4b5d-3ffdd72b6ee9	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5565-6ea5-264f-d3bde79f1c72	Trr-read	Trr - branje	f
00030000-5565-6ea5-58e8-2b0c8c736baf	Trr-write	Trr - spreminjanje	f
00030000-5565-6ea5-0639-cfa8a61efa6d	Uprizoritev-read	Uprizoritev - branje	f
00030000-5565-6ea5-86cc-c70eea4f480d	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5565-6ea5-a283-8a21e84d08c6	User-read	User - branje	f
00030000-5565-6ea5-e444-9a372f6ec474	User-write	User - spreminjanje	f
00030000-5565-6ea5-e693-c315bc11e0d9	Vaja-read	Vaja - branje	f
00030000-5565-6ea5-83a2-b45cb4595075	Vaja-write	Vaja - spreminjanje	f
00030000-5565-6ea5-703f-17cc34ee3a7b	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5565-6ea5-8164-5407a8a88163	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5565-6ea5-1c46-264f7adf6f20	Zaposlitev-read	Zaposlitev - branje	f
00030000-5565-6ea5-1fd5-1d267d7c5c38	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5565-6ea5-fceb-0228a185fe93	Zasedenost-read	Zasedenost - branje	f
00030000-5565-6ea5-2de6-e726f935d255	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5565-6ea5-3ce6-41f6d303868e	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5565-6ea5-849b-af6f20198fdb	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5565-6ea5-5479-162182869dd2	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5565-6ea5-d4e4-c21a82a2040c	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2697 (class 0 OID 5173760)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5565-6ea5-a2c2-cb9d83c90b54	00030000-5565-6ea5-c07f-dcc5e5fea44b
00020000-5565-6ea5-6ce6-94fc8743441a	00030000-5565-6ea5-17bb-6cd74a09d80a
00020000-5565-6ea5-6ce6-94fc8743441a	00030000-5565-6ea5-c07f-dcc5e5fea44b
\.


--
-- TOC entry 2725 (class 0 OID 5174049)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2729 (class 0 OID 5174080)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2741 (class 0 OID 5174213)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2702 (class 0 OID 5173818)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5565-6ea6-d63f-4f982a67b972	00040000-5565-6ea5-ee59-c5c614c11bb4	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5565-6ea6-0854-8b882c2b0d2d	00040000-5565-6ea5-ee59-c5c614c11bb4	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2704 (class 0 OID 5173853)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5565-6ea4-7182-f2b05a29224d	8341	Adlešiči
00050000-5565-6ea4-5fee-fc820fcf8336	5270	Ajdovščina
00050000-5565-6ea4-1d3e-18d2091e369f	6280	Ankaran/Ancarano
00050000-5565-6ea4-644b-ceb7eee67207	9253	Apače
00050000-5565-6ea4-b42f-36f9a03adbf0	8253	Artiče
00050000-5565-6ea4-fbfb-4f2c806137a3	4275	Begunje na Gorenjskem
00050000-5565-6ea4-50aa-7a2ad714815c	1382	Begunje pri Cerknici
00050000-5565-6ea4-7716-70fdf1bde3a4	9231	Beltinci
00050000-5565-6ea4-07fb-dc1aaeb582e7	2234	Benedikt
00050000-5565-6ea4-e1ae-05e30dde9ea7	2345	Bistrica ob Dravi
00050000-5565-6ea4-a5c1-8f9cdc0c2443	3256	Bistrica ob Sotli
00050000-5565-6ea4-10ce-bac5aec871e9	8259	Bizeljsko
00050000-5565-6ea4-53f4-c33a1cae7498	1223	Blagovica
00050000-5565-6ea4-b102-80b2c955c0c5	8283	Blanca
00050000-5565-6ea4-e0f6-286379912b31	4260	Bled
00050000-5565-6ea4-fded-82d197a71924	4273	Blejska Dobrava
00050000-5565-6ea4-b044-5742051548d4	9265	Bodonci
00050000-5565-6ea4-c9bd-621ad90e5083	9222	Bogojina
00050000-5565-6ea4-ca98-6e4e0a308b87	4263	Bohinjska Bela
00050000-5565-6ea4-59c6-6348e3d631d4	4264	Bohinjska Bistrica
00050000-5565-6ea4-4449-f905ad60777d	4265	Bohinjsko jezero
00050000-5565-6ea4-1e9f-2d34039189e8	1353	Borovnica
00050000-5565-6ea4-8b52-4f0f0bb5d3e3	8294	Boštanj
00050000-5565-6ea4-35ac-d8770a25844c	5230	Bovec
00050000-5565-6ea4-dd35-672c12c5c428	5295	Branik
00050000-5565-6ea4-f70f-cd63e0a11228	3314	Braslovče
00050000-5565-6ea4-9ac0-b6c372764a37	5223	Breginj
00050000-5565-6ea4-64d6-c30fc9c0edf0	8280	Brestanica
00050000-5565-6ea4-0a92-e64572bc0fc6	2354	Bresternica
00050000-5565-6ea4-8ce8-86e1db85789f	4243	Brezje
00050000-5565-6ea4-3f35-5223779b926f	1351	Brezovica pri Ljubljani
00050000-5565-6ea4-6c74-db882aa0e216	8250	Brežice
00050000-5565-6ea4-c7b6-f569fa37743f	4210	Brnik - Aerodrom
00050000-5565-6ea4-59ce-60873ab311a7	8321	Brusnice
00050000-5565-6ea4-30dd-569e924827e7	3255	Buče
00050000-5565-6ea4-2b1b-59eeff89d49d	8276	Bučka 
00050000-5565-6ea4-1f6e-6ba2a62f3598	9261	Cankova
00050000-5565-6ea4-988a-c16ea82e2632	3000	Celje 
00050000-5565-6ea4-291a-e4b72efda15a	3001	Celje - poštni predali
00050000-5565-6ea4-3c25-ce60f0da6592	4207	Cerklje na Gorenjskem
00050000-5565-6ea4-9ba9-528f28275668	8263	Cerklje ob Krki
00050000-5565-6ea4-20a2-f5590395f7cf	1380	Cerknica
00050000-5565-6ea4-eb9e-739c2a367462	5282	Cerkno
00050000-5565-6ea4-38fb-7b3e76dcf27f	2236	Cerkvenjak
00050000-5565-6ea4-69a6-8184b9978937	2215	Ceršak
00050000-5565-6ea4-85ae-cbe1d55eb38c	2326	Cirkovce
00050000-5565-6ea4-b5be-deaad4e18c87	2282	Cirkulane
00050000-5565-6ea4-cb69-3d8e0577261a	5273	Col
00050000-5565-6ea4-476e-e46b2cad5413	8251	Čatež ob Savi
00050000-5565-6ea4-c16a-4563e7844cba	1413	Čemšenik
00050000-5565-6ea4-5dde-ec39ca20ac8d	5253	Čepovan
00050000-5565-6ea4-7df6-172dbea300dd	9232	Črenšovci
00050000-5565-6ea4-2313-a3dd73a2759c	2393	Črna na Koroškem
00050000-5565-6ea4-01bf-19b6cfd88f61	6275	Črni Kal
00050000-5565-6ea4-366e-d884f31ccc95	5274	Črni Vrh nad Idrijo
00050000-5565-6ea4-c7b0-aa8d0161ce42	5262	Črniče
00050000-5565-6ea4-525d-d93d8f05f8eb	8340	Črnomelj
00050000-5565-6ea4-c58d-f2ab8a06486c	6271	Dekani
00050000-5565-6ea4-4b29-106c0dae6b5d	5210	Deskle
00050000-5565-6ea4-bb5a-71736ec89cdc	2253	Destrnik
00050000-5565-6ea4-ab51-1232c1fb4b7e	6215	Divača
00050000-5565-6ea4-9f43-1f5a4cd67e5e	1233	Dob
00050000-5565-6ea4-932b-53bc770124f9	3224	Dobje pri Planini
00050000-5565-6ea4-fcaf-b2574190f27c	8257	Dobova
00050000-5565-6ea4-3024-0c2ffd8336bf	1423	Dobovec
00050000-5565-6ea4-b19d-f486178489db	5263	Dobravlje
00050000-5565-6ea4-2c71-24aca29eb3cb	3204	Dobrna
00050000-5565-6ea4-1a3d-510ff01afdae	8211	Dobrnič
00050000-5565-6ea4-98f8-bd61a7811066	1356	Dobrova
00050000-5565-6ea4-42d8-f751b81816ad	9223	Dobrovnik/Dobronak 
00050000-5565-6ea4-8eed-e2ae5e550bb9	5212	Dobrovo v Brdih
00050000-5565-6ea4-36a1-a61dd139c655	1431	Dol pri Hrastniku
00050000-5565-6ea4-cc4a-2949690905e0	1262	Dol pri Ljubljani
00050000-5565-6ea4-415e-5ea5ee4b3d29	1273	Dole pri Litiji
00050000-5565-6ea4-d6de-38e19237346c	1331	Dolenja vas
00050000-5565-6ea4-7fb5-6b346a1ab1a8	8350	Dolenjske Toplice
00050000-5565-6ea4-afe0-e8611e2bbb69	1230	Domžale
00050000-5565-6ea4-98df-b8a181988b84	2252	Dornava
00050000-5565-6ea4-4089-e419c844af3e	5294	Dornberk
00050000-5565-6ea4-799a-f08440a357f2	1319	Draga
00050000-5565-6ea4-8adf-343cd25d24ca	8343	Dragatuš
00050000-5565-6ea4-cfc4-363c20e120a8	3222	Dramlje
00050000-5565-6ea4-877f-d69f538ad564	2370	Dravograd
00050000-5565-6ea4-2c69-dc33dc97dcb7	4203	Duplje
00050000-5565-6ea4-0b27-55f06467aa34	6221	Dutovlje
00050000-5565-6ea4-7670-3f596f3575fc	8361	Dvor
00050000-5565-6ea4-f580-b06a842e3b81	2343	Fala
00050000-5565-6ea4-2766-8a98c3e356fc	9208	Fokovci
00050000-5565-6ea4-6161-9f19bc5bf8ea	2313	Fram
00050000-5565-6ea4-51f1-88aaae5b1715	3213	Frankolovo
00050000-5565-6ea4-ba3b-7467b0ddd129	1274	Gabrovka
00050000-5565-6ea4-c6b6-949cad5cc135	8254	Globoko
00050000-5565-6ea4-e223-049eb2af9e3a	5275	Godovič
00050000-5565-6ea4-18a9-de670e9296a4	4204	Golnik
00050000-5565-6ea4-c766-c0c71977f90b	3303	Gomilsko
00050000-5565-6ea4-ee27-c6d2e23dff74	4224	Gorenja vas
00050000-5565-6ea4-2878-2b4ff512b0c4	3263	Gorica pri Slivnici
00050000-5565-6ea4-ce86-1a7acedfd4b6	2272	Gorišnica
00050000-5565-6ea4-a4f1-1dc994170692	9250	Gornja Radgona
00050000-5565-6ea4-5cf7-b694fe0abd5c	3342	Gornji Grad
00050000-5565-6ea4-87b0-b67627f90505	4282	Gozd Martuljek
00050000-5565-6ea4-9184-4df2aebb60cd	6272	Gračišče
00050000-5565-6ea4-d57f-c1f827a9f03b	9264	Grad
00050000-5565-6ea4-1a02-760ef3d510c8	8332	Gradac
00050000-5565-6ea4-2908-d836b4ba5116	1384	Grahovo
00050000-5565-6ea4-fb05-677928413f5c	5242	Grahovo ob Bači
00050000-5565-6ea4-a40e-be450df022ef	5251	Grgar
00050000-5565-6ea4-a78a-2d29833c3327	3302	Griže
00050000-5565-6ea4-d2e5-7101035ee0f5	3231	Grobelno
00050000-5565-6ea4-003e-8af7b57c9280	1290	Grosuplje
00050000-5565-6ea4-588c-45c5ed4a6e84	2288	Hajdina
00050000-5565-6ea4-5b16-b3dd5510ff20	8362	Hinje
00050000-5565-6ea4-ef08-4dde8920ef09	2311	Hoče
00050000-5565-6ea4-cfa5-604f661ba89e	9205	Hodoš/Hodos
00050000-5565-6ea4-e3a3-f8d23dc30b09	1354	Horjul
00050000-5565-6ea4-78bb-75689eb1eba3	1372	Hotedršica
00050000-5565-6ea4-4de3-9a4935bda5ab	1430	Hrastnik
00050000-5565-6ea4-6f34-721a36d2ad6d	6225	Hruševje
00050000-5565-6ea4-7eb2-30f884712297	4276	Hrušica
00050000-5565-6ea4-ae4b-da738875bf36	5280	Idrija
00050000-5565-6ea4-55e0-53dfafd20558	1292	Ig
00050000-5565-6ea4-d12a-3388950319c0	6250	Ilirska Bistrica
00050000-5565-6ea4-5df9-5a3c59242795	6251	Ilirska Bistrica-Trnovo
00050000-5565-6ea4-19c6-d4ef4ab79fb3	1295	Ivančna Gorica
00050000-5565-6ea4-06f9-1ce439355592	2259	Ivanjkovci
00050000-5565-6ea4-6027-819b8d8d1c14	1411	Izlake
00050000-5565-6ea4-99c1-a17bc9b42ede	6310	Izola/Isola
00050000-5565-6ea4-a2aa-a5eb8e04e194	2222	Jakobski Dol
00050000-5565-6ea4-0977-7550961a2f70	2221	Jarenina
00050000-5565-6ea4-cb7c-19487e80b5d9	6254	Jelšane
00050000-5565-6ea4-149b-cf2aaf16fbc0	4270	Jesenice
00050000-5565-6ea4-6899-da9c8aad8e0c	8261	Jesenice na Dolenjskem
00050000-5565-6ea4-c736-f9dcaff6972f	3273	Jurklošter
00050000-5565-6ea4-a1b2-952040f3bda9	2223	Jurovski Dol
00050000-5565-6ea4-d903-3003288dd35f	2256	Juršinci
00050000-5565-6ea4-6437-64b62e25a202	5214	Kal nad Kanalom
00050000-5565-6ea4-849e-d26b94172946	3233	Kalobje
00050000-5565-6ea4-dd3c-da8a40507d7e	4246	Kamna Gorica
00050000-5565-6ea4-1d16-386fe109f001	2351	Kamnica
00050000-5565-6ea4-e9fc-e86f9db75a3b	1241	Kamnik
00050000-5565-6ea4-9391-09e647050563	5213	Kanal
00050000-5565-6ea4-3ca0-b130ef314a79	8258	Kapele
00050000-5565-6ea4-872a-9f97b3ca152c	2362	Kapla
00050000-5565-6ea4-a95f-1459d3168b24	2325	Kidričevo
00050000-5565-6ea4-268f-c8892a592117	1412	Kisovec
00050000-5565-6ea4-389c-2bffae04278b	6253	Knežak
00050000-5565-6ea4-2156-09987a58c081	5222	Kobarid
00050000-5565-6ea4-8128-ed541f3973af	9227	Kobilje
00050000-5565-6ea4-ea07-b197f2a3a956	1330	Kočevje
00050000-5565-6ea4-bc37-fceebcd656c3	1338	Kočevska Reka
00050000-5565-6ea4-9457-458545f20493	2276	Kog
00050000-5565-6ea4-a535-0adf87b0a64e	5211	Kojsko
00050000-5565-6ea4-28aa-b6fb3fba5517	6223	Komen
00050000-5565-6ea4-ea5b-704858890e0c	1218	Komenda
00050000-5565-6ea4-0f96-21bfb43a4704	6000	Koper/Capodistria 
00050000-5565-6ea4-86c0-f21de7c78347	6001	Koper/Capodistria - poštni predali
00050000-5565-6ea4-bb77-7b4f955d966f	8282	Koprivnica
00050000-5565-6ea4-935c-a2473050d454	5296	Kostanjevica na Krasu
00050000-5565-6ea4-fbbb-1c8602937318	8311	Kostanjevica na Krki
00050000-5565-6ea4-a5c1-3afe660bfbe6	1336	Kostel
00050000-5565-6ea4-dd47-9136703260d9	6256	Košana
00050000-5565-6ea4-581a-99e849539a87	2394	Kotlje
00050000-5565-6ea4-50c3-ad82c1f9da19	6240	Kozina
00050000-5565-6ea4-65dd-d68fa7b2ad34	3260	Kozje
00050000-5565-6ea4-6b32-23b4336bf851	4000	Kranj 
00050000-5565-6ea4-45a2-7a9dd14b48b6	4001	Kranj - poštni predali
00050000-5565-6ea4-3ca7-0b5da986b23f	4280	Kranjska Gora
00050000-5565-6ea4-4d36-56e08af2d52e	1281	Kresnice
00050000-5565-6ea4-b7dd-895657aafef2	4294	Križe
00050000-5565-6ea4-dff8-05c7e66f353d	9206	Križevci
00050000-5565-6ea4-9783-7a243ad8058c	9242	Križevci pri Ljutomeru
00050000-5565-6ea4-04f8-18289ac352a4	1301	Krka
00050000-5565-6ea4-12ed-d8a31ebdcc22	8296	Krmelj
00050000-5565-6ea4-1889-22390e95d357	4245	Kropa
00050000-5565-6ea4-c8c6-175ce17a4944	8262	Krška vas
00050000-5565-6ea4-5126-84734e265ec6	8270	Krško
00050000-5565-6ea4-25fb-f32b4e1aa1eb	9263	Kuzma
00050000-5565-6ea4-f48e-ff8ddb60490c	2318	Laporje
00050000-5565-6ea4-d1e6-b401998ffc71	3270	Laško
00050000-5565-6ea4-a884-f7d7d9b07b18	1219	Laze v Tuhinju
00050000-5565-6ea4-6afc-59271b1439d9	2230	Lenart v Slovenskih goricah
00050000-5565-6ea4-7f6a-37f49132e538	9220	Lendava/Lendva
00050000-5565-6ea4-cde0-e1d7962a7ea3	4248	Lesce
00050000-5565-6ea4-446f-c6b3f2615bc4	3261	Lesično
00050000-5565-6ea4-baf5-7ad1ef4fff03	8273	Leskovec pri Krškem
00050000-5565-6ea4-3317-527958dcbd62	2372	Libeliče
00050000-5565-6ea4-0ba0-31acc848d53d	2341	Limbuš
00050000-5565-6ea4-3606-78cfe2912435	1270	Litija
00050000-5565-6ea4-e859-cc25f0928306	3202	Ljubečna
00050000-5565-6ea4-5b4e-4bdeb5a72697	1000	Ljubljana 
00050000-5565-6ea4-214e-099020996eb5	1001	Ljubljana - poštni predali
00050000-5565-6ea4-21e8-536807cf0694	1231	Ljubljana - Črnuče
00050000-5565-6ea4-ee5e-ff4bed26e513	1261	Ljubljana - Dobrunje
00050000-5565-6ea4-3b80-8a25503221d0	1260	Ljubljana - Polje
00050000-5565-6ea4-88d2-a9349a34c1f8	1210	Ljubljana - Šentvid
00050000-5565-6ea4-a59e-df1106183aa5	1211	Ljubljana - Šmartno
00050000-5565-6ea4-b17e-c77d7f77fc21	3333	Ljubno ob Savinji
00050000-5565-6ea4-3a4a-661ebb320614	9240	Ljutomer
00050000-5565-6ea4-d7e4-9dd45b844fdf	3215	Loče
00050000-5565-6ea4-8b97-542be27c5b6e	5231	Log pod Mangartom
00050000-5565-6ea4-879f-8a569f235fb0	1358	Log pri Brezovici
00050000-5565-6ea4-82bf-a5db7908e43e	1370	Logatec
00050000-5565-6ea4-0968-95724226858a	1371	Logatec
00050000-5565-6ea4-7e80-e07e351daef2	1434	Loka pri Zidanem Mostu
00050000-5565-6ea4-8023-f54fcb946448	3223	Loka pri Žusmu
00050000-5565-6ea4-500d-8dc4d9797464	6219	Lokev
00050000-5565-6ea4-8bc9-5e2bda1b1665	1318	Loški Potok
00050000-5565-6ea4-d05c-86b4a755d725	2324	Lovrenc na Dravskem polju
00050000-5565-6ea4-4b0d-36f6be57634b	2344	Lovrenc na Pohorju
00050000-5565-6ea4-c417-4d1843b64e51	3334	Luče
00050000-5565-6ea4-385d-8cf5da30aaf1	1225	Lukovica
00050000-5565-6ea4-1c89-cca90be3bb56	9202	Mačkovci
00050000-5565-6ea4-aa3c-633c26c36ffe	2322	Majšperk
00050000-5565-6ea4-03f9-2d5ac079230d	2321	Makole
00050000-5565-6ea4-d250-728e083e4831	9243	Mala Nedelja
00050000-5565-6ea4-574f-6b4bc71e4ddb	2229	Malečnik
00050000-5565-6ea4-c109-09dbe15e207b	6273	Marezige
00050000-5565-6ea4-afac-00a4798a71c4	2000	Maribor 
00050000-5565-6ea4-d5db-483aa943119b	2001	Maribor - poštni predali
00050000-5565-6ea4-49de-d183e66bef9e	2206	Marjeta na Dravskem polju
00050000-5565-6ea4-1442-f6965f3f3a8b	2281	Markovci
00050000-5565-6ea4-87f5-e3c43af16cd3	9221	Martjanci
00050000-5565-6ea4-73e8-1b345dfde557	6242	Materija
00050000-5565-6ea4-98ab-263900bcd413	4211	Mavčiče
00050000-5565-6ea4-1546-6c3ccbaa29da	1215	Medvode
00050000-5565-6ea4-807f-60046a6a0287	1234	Mengeš
00050000-5565-6ea4-871b-1f1500e2f2c4	8330	Metlika
00050000-5565-6ea4-4b46-9994be4bf8d9	2392	Mežica
00050000-5565-6ea4-2e5f-f24978d8b01b	2204	Miklavž na Dravskem polju
00050000-5565-6ea4-3b83-8b29a2783341	2275	Miklavž pri Ormožu
00050000-5565-6ea4-decd-f0f528aa5e8d	5291	Miren
00050000-5565-6ea4-6417-b2a7ac4e31e7	8233	Mirna
00050000-5565-6ea4-9558-05a882e33a35	8216	Mirna Peč
00050000-5565-6ea4-e14c-7b45db248ea7	2382	Mislinja
00050000-5565-6ea4-52b6-c5382e28050d	4281	Mojstrana
00050000-5565-6ea4-4696-a5e574dea7ec	8230	Mokronog
00050000-5565-6ea4-e9ba-edff46341a99	1251	Moravče
00050000-5565-6ea4-291c-c2b3352665b5	9226	Moravske Toplice
00050000-5565-6ea4-82e5-5a13df68e25f	5216	Most na Soči
00050000-5565-6ea4-0cff-a4da67b435f6	1221	Motnik
00050000-5565-6ea4-7b09-cb0a1ced3490	3330	Mozirje
00050000-5565-6ea4-3956-95b7b7b71604	9000	Murska Sobota 
00050000-5565-6ea4-1e7a-d49e342f2f87	9001	Murska Sobota - poštni predali
00050000-5565-6ea4-485f-6879d679498e	2366	Muta
00050000-5565-6ea4-a908-c73f339e3930	4202	Naklo
00050000-5565-6ea4-4d22-f8334fbc97de	3331	Nazarje
00050000-5565-6ea4-410f-3cb872291f7b	1357	Notranje Gorice
00050000-5565-6ea4-97b6-f1661df36ad2	3203	Nova Cerkev
00050000-5565-6ea4-1b2c-ca2fe88de46c	5000	Nova Gorica 
00050000-5565-6ea4-84da-fd7ded2a94bb	5001	Nova Gorica - poštni predali
00050000-5565-6ea4-e4c4-dbdf377ca823	1385	Nova vas
00050000-5565-6ea4-c14b-f095de354190	8000	Novo mesto
00050000-5565-6ea4-47e6-e4c271e742a2	8001	Novo mesto - poštni predali
00050000-5565-6ea4-3a41-47799949f6de	6243	Obrov
00050000-5565-6ea4-7f44-6eaedc7d89dd	9233	Odranci
00050000-5565-6ea4-d0d0-bf06e17fedd4	2317	Oplotnica
00050000-5565-6ea4-2169-a0bd58acb65e	2312	Orehova vas
00050000-5565-6ea4-c7e9-f8dc81c32ebd	2270	Ormož
00050000-5565-6ea4-46a2-82d9ed18b6f1	1316	Ortnek
00050000-5565-6ea4-89f1-caea99eebbb0	1337	Osilnica
00050000-5565-6ea4-e8f8-6374b6260d7a	8222	Otočec
00050000-5565-6ea4-d4ff-65e4298787b7	2361	Ožbalt
00050000-5565-6ea4-32ad-32468ced4b3e	2231	Pernica
00050000-5565-6ea4-6458-ccc635b27369	2211	Pesnica pri Mariboru
00050000-5565-6ea4-636d-86b8278710bf	9203	Petrovci
00050000-5565-6ea4-8512-5538429a1c2c	3301	Petrovče
00050000-5565-6ea4-84f1-a6e25c795a1a	6330	Piran/Pirano
00050000-5565-6ea4-02c3-bd1425e701ec	8255	Pišece
00050000-5565-6ea4-edd0-6023b8ba0725	6257	Pivka
00050000-5565-6ea4-ae88-617e5f412937	6232	Planina
00050000-5565-6ea4-22fa-c53f1d3adf25	3225	Planina pri Sevnici
00050000-5565-6ea4-252f-d72c88d854ac	6276	Pobegi
00050000-5565-6ea4-62d3-21db77c130ed	8312	Podbočje
00050000-5565-6ea4-8b4b-78072d883d5f	5243	Podbrdo
00050000-5565-6ea5-0163-927c9b073bae	3254	Podčetrtek
00050000-5565-6ea5-f5be-4d798f43ca2f	2273	Podgorci
00050000-5565-6ea5-c235-9977f67c3580	6216	Podgorje
00050000-5565-6ea5-0da3-06bd715eeb26	2381	Podgorje pri Slovenj Gradcu
00050000-5565-6ea5-278c-41c671a62213	6244	Podgrad
00050000-5565-6ea5-0f37-efd679f4cb57	1414	Podkum
00050000-5565-6ea5-661b-298ebb6a2fd7	2286	Podlehnik
00050000-5565-6ea5-6ccc-c1dd66d47d91	5272	Podnanos
00050000-5565-6ea5-33e7-ad0aa40a2205	4244	Podnart
00050000-5565-6ea5-bfed-2e70384e201c	3241	Podplat
00050000-5565-6ea5-8bb5-088bcd4e57b4	3257	Podsreda
00050000-5565-6ea5-03fb-015f2a3564f0	2363	Podvelka
00050000-5565-6ea5-ca7f-54a3131e1072	2208	Pohorje
00050000-5565-6ea5-b176-cef9c80ead05	2257	Polenšak
00050000-5565-6ea5-1b85-c5e782165d76	1355	Polhov Gradec
00050000-5565-6ea5-9905-5e5e84f22279	4223	Poljane nad Škofjo Loko
00050000-5565-6ea5-a0d7-8db2c101ca03	2319	Poljčane
00050000-5565-6ea5-cb4f-e97e2c5e1b88	1272	Polšnik
00050000-5565-6ea5-6529-03f659574087	3313	Polzela
00050000-5565-6ea5-e666-237360721adc	3232	Ponikva
00050000-5565-6ea5-099a-823abb465aea	6320	Portorož/Portorose
00050000-5565-6ea5-5d88-69a8dc7fafb9	6230	Postojna
00050000-5565-6ea5-cc18-c992e9f497a5	2331	Pragersko
00050000-5565-6ea5-4755-bfb3e65273e2	3312	Prebold
00050000-5565-6ea5-d287-b9425e3ea473	4205	Preddvor
00050000-5565-6ea5-88b4-1165f5eb6eb4	6255	Prem
00050000-5565-6ea5-354c-5dbbf9db4d1f	1352	Preserje
00050000-5565-6ea5-6eb8-06858151ec61	6258	Prestranek
00050000-5565-6ea5-9dca-8ffb9ee4916d	2391	Prevalje
00050000-5565-6ea5-6bec-97e0e3a1605e	3262	Prevorje
00050000-5565-6ea5-6458-25c8265af208	1276	Primskovo 
00050000-5565-6ea5-8647-c8330fd85473	3253	Pristava pri Mestinju
00050000-5565-6ea5-c617-1d21c090177a	9207	Prosenjakovci/Partosfalva
00050000-5565-6ea5-570f-88f39b500404	5297	Prvačina
00050000-5565-6ea5-5454-91cfd5217c0c	2250	Ptuj
00050000-5565-6ea5-8600-0b510be3f49e	2323	Ptujska Gora
00050000-5565-6ea5-0a08-2bd059175e6b	9201	Puconci
00050000-5565-6ea5-22bb-db5e09a52395	2327	Rače
00050000-5565-6ea5-4154-6809360f3f05	1433	Radeče
00050000-5565-6ea5-57b0-70dad5d20609	9252	Radenci
00050000-5565-6ea5-419a-ba837dd5b889	2360	Radlje ob Dravi
00050000-5565-6ea5-35cc-14247cffc38e	1235	Radomlje
00050000-5565-6ea5-95dc-77e469be9b08	4240	Radovljica
00050000-5565-6ea5-bf8f-eae9ff994651	8274	Raka
00050000-5565-6ea5-5221-c4e9741f7cf9	1381	Rakek
00050000-5565-6ea5-c35b-59e5a29e3055	4283	Rateče - Planica
00050000-5565-6ea5-41ba-eb71983f0317	2390	Ravne na Koroškem
00050000-5565-6ea5-8b4b-c38494c8f821	9246	Razkrižje
00050000-5565-6ea5-040f-775bc9c98fcc	3332	Rečica ob Savinji
00050000-5565-6ea5-572c-4017f60fef90	5292	Renče
00050000-5565-6ea5-270c-0ecd8e56e199	1310	Ribnica
00050000-5565-6ea5-827b-7cf07a813a34	2364	Ribnica na Pohorju
00050000-5565-6ea5-5b62-321856eba564	3272	Rimske Toplice
00050000-5565-6ea5-5fc1-3bdb5521f48c	1314	Rob
00050000-5565-6ea5-0540-150c5871e06c	5215	Ročinj
00050000-5565-6ea5-ab6b-ce5670e06c49	3250	Rogaška Slatina
00050000-5565-6ea5-dc67-33f6d65d227b	9262	Rogašovci
00050000-5565-6ea5-e34f-6d47523b96d5	3252	Rogatec
00050000-5565-6ea5-7dbc-0cff61247827	1373	Rovte
00050000-5565-6ea5-7df7-a4ed030817f0	2342	Ruše
00050000-5565-6ea5-4f52-4dadc9bde7ee	1282	Sava
00050000-5565-6ea5-aabc-8b3c5b14d7b8	6333	Sečovlje/Sicciole
00050000-5565-6ea5-3976-a6338ed03c41	4227	Selca
00050000-5565-6ea5-5248-6b84062eef69	2352	Selnica ob Dravi
00050000-5565-6ea5-212e-32cb0dd0566b	8333	Semič
00050000-5565-6ea5-cfeb-cc82649db59e	8281	Senovo
00050000-5565-6ea5-669e-e97c66d533ca	6224	Senožeče
00050000-5565-6ea5-54fb-24529a87a24a	8290	Sevnica
00050000-5565-6ea5-11bf-e5d7d12e2b43	6210	Sežana
00050000-5565-6ea5-f208-8da8149fb346	2214	Sladki Vrh
00050000-5565-6ea5-bcb5-c52185d0fca2	5283	Slap ob Idrijci
00050000-5565-6ea5-daf5-a7071b97a20e	2380	Slovenj Gradec
00050000-5565-6ea5-4d3c-71782798b6d2	2310	Slovenska Bistrica
00050000-5565-6ea5-7cbc-9090e41261e9	3210	Slovenske Konjice
00050000-5565-6ea5-a588-a07602dcf4e9	1216	Smlednik
00050000-5565-6ea5-e1ca-a3dc91d7784d	5232	Soča
00050000-5565-6ea5-bb96-21fa45301bc3	1317	Sodražica
00050000-5565-6ea5-888e-140ad97a5ffa	3335	Solčava
00050000-5565-6ea5-d34d-d7d1d2f78f3b	5250	Solkan
00050000-5565-6ea5-cf06-e36c31ec3d75	4229	Sorica
00050000-5565-6ea5-ab11-546f511a04ce	4225	Sovodenj
00050000-5565-6ea5-bfd5-3f203c48a37a	5281	Spodnja Idrija
00050000-5565-6ea5-ce69-34b843c78504	2241	Spodnji Duplek
00050000-5565-6ea5-e292-23a1a97c8659	9245	Spodnji Ivanjci
00050000-5565-6ea5-c514-d3c33dc8f2f6	2277	Središče ob Dravi
00050000-5565-6ea5-bfd3-52eba3c5fb49	4267	Srednja vas v Bohinju
00050000-5565-6ea5-531a-160f6d87d008	8256	Sromlje 
00050000-5565-6ea5-ef4d-eb31aba6c1c1	5224	Srpenica
00050000-5565-6ea5-e154-70f06d1a7b50	1242	Stahovica
00050000-5565-6ea5-5f37-c695a69f5c8f	1332	Stara Cerkev
00050000-5565-6ea5-f897-c620f6c915d6	8342	Stari trg ob Kolpi
00050000-5565-6ea5-96c8-12b96f48eb9a	1386	Stari trg pri Ložu
00050000-5565-6ea5-6793-fc1f9aedfbd2	2205	Starše
00050000-5565-6ea5-55d5-e6be41719538	2289	Stoperce
00050000-5565-6ea5-a955-3b407a65878b	8322	Stopiče
00050000-5565-6ea5-5c08-176298d272de	3206	Stranice
00050000-5565-6ea5-fb45-c3862e86de4a	8351	Straža
00050000-5565-6ea5-a5fb-7723a8e1c33c	1313	Struge
00050000-5565-6ea5-42c2-d7934b3b288d	8293	Studenec
00050000-5565-6ea5-87d7-67d7ea3eaa63	8331	Suhor
00050000-5565-6ea5-7d2a-8c4de4ce507f	2233	Sv. Ana v Slovenskih goricah
00050000-5565-6ea5-05dd-f02200f0552e	2235	Sv. Trojica v Slovenskih goricah
00050000-5565-6ea5-9e1e-6f452d5609b5	2353	Sveti Duh na Ostrem Vrhu
00050000-5565-6ea5-111d-462a303929d4	9244	Sveti Jurij ob Ščavnici
00050000-5565-6ea5-bfe6-cb305e28f3f1	3264	Sveti Štefan
00050000-5565-6ea5-fcf5-b81638044618	2258	Sveti Tomaž
00050000-5565-6ea5-ae0f-0183d4042804	9204	Šalovci
00050000-5565-6ea5-e1d9-236d300102bb	5261	Šempas
00050000-5565-6ea5-818c-c30d2065f368	5290	Šempeter pri Gorici
00050000-5565-6ea5-bf2c-f5cdb4b50527	3311	Šempeter v Savinjski dolini
00050000-5565-6ea5-5ac6-e37c35635e3b	4208	Šenčur
00050000-5565-6ea5-9b4a-3ce69c6b4871	2212	Šentilj v Slovenskih goricah
00050000-5565-6ea5-6340-539a446cf004	8297	Šentjanž
00050000-5565-6ea5-a566-801768e32eb6	2373	Šentjanž pri Dravogradu
00050000-5565-6ea5-7aac-13055b264430	8310	Šentjernej
00050000-5565-6ea5-23d0-8b27ab67b197	3230	Šentjur
00050000-5565-6ea5-0ac9-c2fb48322742	3271	Šentrupert
00050000-5565-6ea5-adcf-bb2714807e82	8232	Šentrupert
00050000-5565-6ea5-9f57-b381538e03b6	1296	Šentvid pri Stični
00050000-5565-6ea5-b8a8-892151bb1b41	8275	Škocjan
00050000-5565-6ea5-5c67-168e350f107f	6281	Škofije
00050000-5565-6ea5-e94b-ff7873e120fe	4220	Škofja Loka
00050000-5565-6ea5-9be3-22d78307a1d3	3211	Škofja vas
00050000-5565-6ea5-53a4-75c11414cbd9	1291	Škofljica
00050000-5565-6ea5-25d9-f8390f5cbe8d	6274	Šmarje
00050000-5565-6ea5-a220-6f6808034f16	1293	Šmarje - Sap
00050000-5565-6ea5-dc9a-81ae5fced089	3240	Šmarje pri Jelšah
00050000-5565-6ea5-0af2-fc61d02fb0bf	8220	Šmarješke Toplice
00050000-5565-6ea5-4047-0f3de3797b71	2315	Šmartno na Pohorju
00050000-5565-6ea5-bb76-5b8032476e9d	3341	Šmartno ob Dreti
00050000-5565-6ea5-7612-cce8ca4a6401	3327	Šmartno ob Paki
00050000-5565-6ea5-69bc-26ff66a64ba0	1275	Šmartno pri Litiji
00050000-5565-6ea5-04e9-6c4f2b82dd85	2383	Šmartno pri Slovenj Gradcu
00050000-5565-6ea5-8187-50fb53b5489a	3201	Šmartno v Rožni dolini
00050000-5565-6ea5-f48b-dc56ff2c5d01	3325	Šoštanj
00050000-5565-6ea5-09f1-c81b021f37cc	6222	Štanjel
00050000-5565-6ea5-2b5f-d8d188a33f8a	3220	Štore
00050000-5565-6ea5-5cd5-0515fb98ee71	3304	Tabor
00050000-5565-6ea5-26bc-5f812ab2d97f	3221	Teharje
00050000-5565-6ea5-1618-fdc145216086	9251	Tišina
00050000-5565-6ea5-cd6b-4713d8564e66	5220	Tolmin
00050000-5565-6ea5-2220-0ec2ae1e4a5f	3326	Topolšica
00050000-5565-6ea5-fc9d-04832ff67d02	2371	Trbonje
00050000-5565-6ea5-8f24-f3cf1ede7218	1420	Trbovlje
00050000-5565-6ea5-5e46-5b6d19668825	8231	Trebelno 
00050000-5565-6ea5-91cb-c3ef53d1d994	8210	Trebnje
00050000-5565-6ea5-eca6-9b78bc1cdfde	5252	Trnovo pri Gorici
00050000-5565-6ea5-f86c-ca5ef7982efb	2254	Trnovska vas
00050000-5565-6ea5-ac61-318e9504f714	1222	Trojane
00050000-5565-6ea5-d92f-d06c39b3836f	1236	Trzin
00050000-5565-6ea5-53e8-1b380ba75944	4290	Tržič
00050000-5565-6ea5-f265-7b557c9efe11	8295	Tržišče
00050000-5565-6ea5-8c48-2b0431c712ec	1311	Turjak
00050000-5565-6ea5-2659-dc21ceaa553e	9224	Turnišče
00050000-5565-6ea5-6ee5-f2e2c3917d84	8323	Uršna sela
00050000-5565-6ea5-0b0c-f9a958153d88	1252	Vače
00050000-5565-6ea5-27ae-6b701a5cfdca	3320	Velenje 
00050000-5565-6ea5-0586-218a8d37728a	3322	Velenje - poštni predali
00050000-5565-6ea5-c240-eebe421333e9	8212	Velika Loka
00050000-5565-6ea5-3577-5969fba35248	2274	Velika Nedelja
00050000-5565-6ea5-7725-399cfbe0a5e0	9225	Velika Polana
00050000-5565-6ea5-b00e-0f24350908e9	1315	Velike Lašče
00050000-5565-6ea5-ab12-7ae2f5d511d5	8213	Veliki Gaber
00050000-5565-6ea5-bb15-0b996efaa360	9241	Veržej
00050000-5565-6ea5-4680-96473a72b097	1312	Videm - Dobrepolje
00050000-5565-6ea5-e3ba-26796f2d03ae	2284	Videm pri Ptuju
00050000-5565-6ea5-6641-fd4a784e5e3d	8344	Vinica
00050000-5565-6ea5-edc5-8b41cd9f28f9	5271	Vipava
00050000-5565-6ea5-0dc5-7fc08b948d98	4212	Visoko
00050000-5565-6ea5-1580-601aa7151e92	1294	Višnja Gora
00050000-5565-6ea5-7bda-aeeab0bf43da	3205	Vitanje
00050000-5565-6ea5-9557-fd796cbc625f	2255	Vitomarci
00050000-5565-6ea5-0d24-9e6cb92200b7	1217	Vodice
00050000-5565-6ea5-97bb-e381906cb5bc	3212	Vojnik\t
00050000-5565-6ea5-84aa-a7d69f3ea0e2	5293	Volčja Draga
00050000-5565-6ea5-b045-af310209add1	2232	Voličina
00050000-5565-6ea5-04bd-308e9c4edcd7	3305	Vransko
00050000-5565-6ea5-2f53-1a4f10c6640a	6217	Vremski Britof
00050000-5565-6ea5-e128-750a9f730d94	1360	Vrhnika
00050000-5565-6ea5-8cfc-c018e55d4e37	2365	Vuhred
00050000-5565-6ea5-26e3-158a33622ae0	2367	Vuzenica
00050000-5565-6ea5-4a40-7f976bd51f26	8292	Zabukovje 
00050000-5565-6ea5-6809-304b784bd181	1410	Zagorje ob Savi
00050000-5565-6ea5-13e5-cf61b807acb4	1303	Zagradec
00050000-5565-6ea5-d525-1a043dbf017c	2283	Zavrč
00050000-5565-6ea5-7182-7941c5117a3d	8272	Zdole 
00050000-5565-6ea5-89d7-768f9c2a2814	4201	Zgornja Besnica
00050000-5565-6ea5-da1f-abfe8c795fa5	2242	Zgornja Korena
00050000-5565-6ea5-63fd-c5adf51c2ac9	2201	Zgornja Kungota
00050000-5565-6ea5-894c-042cb5f20b99	2316	Zgornja Ložnica
00050000-5565-6ea5-27ce-465b79b0a599	2314	Zgornja Polskava
00050000-5565-6ea5-9bf1-7d3013ed5c54	2213	Zgornja Velka
00050000-5565-6ea5-720c-1c3c45d74baa	4247	Zgornje Gorje
00050000-5565-6ea5-d8c8-cb93b418d39c	4206	Zgornje Jezersko
00050000-5565-6ea5-ca6c-c229df14746c	2285	Zgornji Leskovec
00050000-5565-6ea5-9567-5f69cd1f7aa6	1432	Zidani Most
00050000-5565-6ea5-a978-347c15a8e1f1	3214	Zreče
00050000-5565-6ea5-2e40-458e6d07ba1f	4209	Žabnica
00050000-5565-6ea5-1347-76cbe0c31147	3310	Žalec
00050000-5565-6ea5-28d7-2b250c2b121c	4228	Železniki
00050000-5565-6ea5-cd44-b9b77ab3806d	2287	Žetale
00050000-5565-6ea5-cc54-2aa9a8794b1d	4226	Žiri
00050000-5565-6ea5-50bc-227b104a07e0	4274	Žirovnica
00050000-5565-6ea5-ab27-a942ad66fe19	8360	Žužemberk
\.


--
-- TOC entry 2721 (class 0 OID 5174023)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2689 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2703 (class 0 OID 5173838)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2709 (class 0 OID 5173916)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2723 (class 0 OID 5174035)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2736 (class 0 OID 5174155)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2740 (class 0 OID 5174206)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2727 (class 0 OID 5174064)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5565-6ea6-962e-f5fdb121a0aa	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5565-6ea6-e484-5f7505b47b60	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5565-6ea6-7b4b-06921405b658	0003	Kazinska	t	84	Kazinska dvorana
00220000-5565-6ea6-c4e1-bc48e200816c	0004	Mali oder	t	24	Mali oder 
00220000-5565-6ea6-1380-5149c6616369	0005	Komorni oder	t	15	Komorni oder
00220000-5565-6ea6-a2c0-956016c03d8f	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5565-6ea6-5177-b841efc1a519	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2719 (class 0 OID 5174008)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2718 (class 0 OID 5173998)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2739 (class 0 OID 5174195)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2734 (class 0 OID 5174132)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2692 (class 0 OID 5173712)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5565-6ea5-ec5b-71642e5634fb	00010000-5565-6ea5-814b-e08d112cbad3	2015-05-27 09:13:42	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO7cClyuDYGHF0XPiuZZb.Ob0J0y.ZDtS";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2758 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2728 (class 0 OID 5174074)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2696 (class 0 OID 5173750)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5565-6ea5-0683-44c237e3c9ec	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5565-6ea5-97fb-997f77a721b3	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5565-6ea5-a2c2-cb9d83c90b54	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5565-6ea5-3325-ea9f0a829cb9	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5565-6ea5-059d-b8fb9d975d9a	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5565-6ea5-6ce6-94fc8743441a	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2694 (class 0 OID 5173734)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5565-6ea5-ec5b-71642e5634fb	00020000-5565-6ea5-3325-ea9f0a829cb9
00010000-5565-6ea5-814b-e08d112cbad3	00020000-5565-6ea5-3325-ea9f0a829cb9
\.


--
-- TOC entry 2730 (class 0 OID 5174088)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2722 (class 0 OID 5174029)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2716 (class 0 OID 5173979)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2748 (class 0 OID 5174301)
-- Dependencies: 230
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5565-6ea5-b8dd-0af5512f4c02	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5565-6ea5-db17-79616688dbe7	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5565-6ea5-da0b-f34df936edb3	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5565-6ea5-3942-f648f89fcec6	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5565-6ea5-6bab-4900069f5b29	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2747 (class 0 OID 5174294)
-- Dependencies: 229
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5565-6ea5-22a2-e59f3d38081d	00000000-5565-6ea5-3942-f648f89fcec6	popa
00000000-5565-6ea5-0a1c-7ef7682fd325	00000000-5565-6ea5-3942-f648f89fcec6	oseba
00000000-5565-6ea5-887e-63b65104f5c5	00000000-5565-6ea5-db17-79616688dbe7	prostor
00000000-5565-6ea5-5d73-175647aad626	00000000-5565-6ea5-3942-f648f89fcec6	besedilo
00000000-5565-6ea5-1f69-802fb2d901ef	00000000-5565-6ea5-3942-f648f89fcec6	uprizoritev
00000000-5565-6ea5-cf84-c9ba77a8596d	00000000-5565-6ea5-3942-f648f89fcec6	funkcija
00000000-5565-6ea5-c882-d9000cdd6f23	00000000-5565-6ea5-3942-f648f89fcec6	tipfunkcije
\.


--
-- TOC entry 2746 (class 0 OID 5174289)
-- Dependencies: 228
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2735 (class 0 OID 5174142)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2759 (class 0 OID 0)
-- Dependencies: 231
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('strosekuprizoritve_id_seq', 1, false);


--
-- TOC entry 2701 (class 0 OID 5173810)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2717 (class 0 OID 5173985)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2738 (class 0 OID 5174184)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5565-6ea5-706c-045443a53bed	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5565-6ea5-f650-2752e9b18977	Baletnik ali plesalec	Baletniki in plesalci	\N	Baletnica ali plesalka	igralec
000f0000-5565-6ea5-4736-4973088bae4a	Avtor	Avtorji	\N	Avtorka	umetnik
000f0000-5565-6ea5-e15a-508f50965312	Režiser	Režiserji	\N	Režiserka	umetnik
000f0000-5565-6ea5-1b51-b742886a5020	Scenograf	Scenografi	\N	Scenografka	tehnik
000f0000-5565-6ea5-66be-ece4f1537aad	Kostumograf	Kostumografi	\N	Kostumografinja	tehnik
000f0000-5565-6ea5-1ca8-886888b53c53	Oblikovalec maske	Oblikovalci maske	\N	Oblikovalka maske	tehnik
000f0000-5565-6ea5-a804-b8afd6dd2893	Avtor glasbe	Avtorji glasbe	\N	Avtorica glasbe	umetnik
000f0000-5565-6ea5-d4c6-57cb797ac1ab	Oblikovalec svetlobe	Oblikovalci svetlobe	\N	Oblikovalka svetlobe	tehnik
000f0000-5565-6ea5-5d5e-9c85d8cdc1b6	Koreograf	Koreografi	\N	Koreografinja	umetnik
000f0000-5565-6ea5-9b28-4d38e5efa941	Dramaturg	Dramaturgi	\N	Dramaturginja	umetnik
000f0000-5565-6ea5-2148-c1f37d18a767	Lektorj	Lektorji	\N	Lektorica	umetnik
000f0000-5565-6ea5-b81e-1f5455604b62	Prevajalec	Prevajalci	\N	Prevajalka	umetnik
000f0000-5565-6ea5-6d6b-cc4dc5cf2fbe	Oblikovalec videa	Oblikovalci videa	\N	Oblikovalka videa	umetnik
000f0000-5565-6ea5-8f40-3595932b5eaf	Intermedijski ustvarjalec	Intermedijski ustvarjalci	\N	Intermedijska ustvarjalka	umetnik
\.


--
-- TOC entry 2706 (class 0 OID 5173873)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2693 (class 0 OID 5173721)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5565-6ea5-814b-e08d112cbad3	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROJI7SQB2HOc2UXZ4OS.Rze5O2TeBJOwm	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5565-6ea5-49d4-988066b71970	Jani	$2y$05$NS4xMjkyMTcwMzExMjAxROpqp72YrdNkxDX97GToZi9wYTe6I.c1S	t	\N	\N	\N	jani@ifigenija.si	\N	\N	\N
00010000-5565-6ea5-629d-1f01e3154d4e	Tona	$2y$05$NS4xMjkyMTcwMzExMjAxROGgCW8a6DxvoVWurJzbdRbnbZVY2R0nq	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5565-6ea5-6a3a-e78bc77963e7	Ivo	$2y$05$NS4xMjkyMTcwMzExMjAxROmS9cOjPYsPc1C9Ps3394YevVn3aHu8i	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5565-6ea5-6f4e-68f22657b80a	Jože	$2y$05$NS4xMjkyMTcwMzExMjAxROymtMK5SC2RIJWBEu97ee/1IejvyDPIm	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5565-6ea5-81c7-4d505c69a1f1	Marko	$2y$05$NS4xMjkyMTcwMzExMjAxROXIBXzbmxn5nG6QOdhmOKlIuh9k1kXTC	t	\N	\N	\N	marko@ifigenija.si	\N	\N	\N
00010000-5565-6ea5-8580-0aa4e88803b9	Marija	$2y$05$NS4xMjkyMTcwMzExMjAxROVL27wOG1X70AHeiH31PPNeXUcmo5JRy	t	\N	\N	\N	marija@ifigenija.si	\N	\N	\N
00010000-5565-6ea5-b09a-0bbc64f05e3f	Ana	$2y$05$NS4xMjkyMTcwMzExMjAxROP2DniqrpkgIqGKbrlJeZI5rv7s5F78m	t	\N	\N	\N	ana@ifigenija.si	\N	\N	\N
00010000-5565-6ea5-01b9-7886c660a93d	Maja	$2y$05$NS4xMjkyMTcwMzExMjAxROfwH01FKmWMSaMDD3nAktZZVDoBkOXm6	t	\N	\N	\N	maja@ifigenija.si	\N	\N	\N
00010000-5565-6ea5-0bb2-781b13dd2d7c	Irena	$2y$05$NS4xMjkyMTcwMzExMjAxROke95lUJXjUXq0lWU/XmvzSSzDJW2PZW	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5565-6ea5-72e1-c3f8c01fd741	Mojca	$2y$05$NS4xMjkyMTcwMzExMjAxROXrj9.V7xoJZVgz.UT13tu9ecNEGuKum	t	\N	\N	\N	mojca@ifigenija.si	\N	\N	\N
00010000-5565-6ea5-ec5b-71642e5634fb	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2743 (class 0 OID 5174239)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5565-6ea6-f0a6-5a2ae14d132f	00160000-5565-6ea6-ccb6-4452450103eb	00150000-5565-6ea5-de0d-86b66cf0e37a	00140000-5565-6ea5-35cc-3aafc6df1f87	produkcija	Sen kresne noči		Sanje	2016-02-01	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5565-6ea6-1380-5149c6616369
000e0000-5565-6ea6-3374-a57ec9ffd788	00160000-5565-6ea6-5f81-0a6d53313df9	00150000-5565-6ea5-2d72-25403d7c1e6d	00140000-5565-6ea5-7038-3f71414489dc	predprodukcija-ideja	Smoletov vrt			2017-01-01	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5565-6ea6-a2c0-956016c03d8f
\.


--
-- TOC entry 2711 (class 0 OID 5173931)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2726 (class 0 OID 5174056)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2733 (class 0 OID 5174124)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2713 (class 0 OID 5173963)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2742 (class 0 OID 5174229)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-5565-6ea5-35cc-3aafc6df1f87	Drama	drama (SURS 01)
00140000-5565-6ea5-6576-3b54416aac42	Opera	opera (SURS 02)
00140000-5565-6ea5-e215-ad857dbcfa55	Balet	balet (SURS 03)
00140000-5565-6ea5-fe3d-f1ab800f99cb	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5565-6ea5-3176-10061f0c7762	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5565-6ea5-7038-3f71414489dc	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5565-6ea5-3a23-e39684b35357	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2732 (class 0 OID 5174114)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-5565-6ea5-12d6-8b32c6612696	Opera	opera
00150000-5565-6ea5-786b-7e9899b466c2	Opereta	opereta
00150000-5565-6ea5-f416-d2dad35c7d41	Balet	balet
00150000-5565-6ea5-79fb-1c787f945857	Plesne prireditve	plesne prireditve
00150000-5565-6ea5-afb1-224a21b3b762	Lutkovno gledališče	lutkovno gledališče
00150000-5565-6ea5-483a-a556c88fb0a5	Raziskovalno gledališče	raziskovalno gledališče
00150000-5565-6ea5-f311-baabf73ca415	Biografska drama	biografska drama
00150000-5565-6ea5-de0d-86b66cf0e37a	Komedija	komedija
00150000-5565-6ea5-d35e-0acf8983f21a	Črna komedija	črna komedija
00150000-5565-6ea5-293e-4a0e3f176061	E-igra	E-igra
00150000-5565-6ea5-2d72-25403d7c1e6d	Kriminalka	kriminalka
00150000-5565-6ea5-9c4c-e268a8175db4	Musical	musical
\.


--
-- TOC entry 2315 (class 2606 OID 5173775)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 5174283)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 5174273)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 5174183)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 5173953)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 5173978)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2348 (class 2606 OID 5173899)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 5174110)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 5173929)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 5173972)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 5173913)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2286 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 5174021)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 5174048)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 5173871)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 5173784)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2296 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2321 (class 2606 OID 5173807)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2313 (class 2606 OID 5173764)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2306 (class 2606 OID 5173749)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 5174054)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 5174087)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 5174224)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2330 (class 2606 OID 5173835)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 5173859)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 5174027)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2292 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 5173849)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2361 (class 2606 OID 5173920)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 5174039)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 5174167)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 5174211)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 5174071)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 5174012)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 5174003)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 5174205)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 5174139)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 5173720)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 5174078)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 5173738)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2308 (class 2606 OID 5173758)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 5174096)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2412 (class 2606 OID 5174034)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2387 (class 2606 OID 5173984)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 5174307)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 5174298)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 5174293)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 5174152)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 5173815)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 5173994)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 5174194)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 5173884)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 5173733)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 5174254)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2367 (class 2606 OID 5173938)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 5174062)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 5174130)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 5173967)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 5174238)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 5174123)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 1259 OID 5173960)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2453 (class 1259 OID 5174153)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2454 (class 1259 OID 5174154)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2328 (class 1259 OID 5173837)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2288 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2289 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2290 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2419 (class 1259 OID 5174055)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2413 (class 1259 OID 5174041)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2414 (class 1259 OID 5174040)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2365 (class 1259 OID 5173939)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2441 (class 1259 OID 5174113)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2442 (class 1259 OID 5174111)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2443 (class 1259 OID 5174112)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2353 (class 1259 OID 5173915)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2354 (class 1259 OID 5173914)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2470 (class 1259 OID 5174226)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2471 (class 1259 OID 5174227)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2472 (class 1259 OID 5174228)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2478 (class 1259 OID 5174258)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2479 (class 1259 OID 5174255)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2480 (class 1259 OID 5174257)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2481 (class 1259 OID 5174256)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2343 (class 1259 OID 5173886)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2344 (class 1259 OID 5173885)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2293 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2294 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2429 (class 1259 OID 5174079)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2383 (class 1259 OID 5173973)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2310 (class 1259 OID 5173765)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2311 (class 1259 OID 5173766)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2434 (class 1259 OID 5174099)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2435 (class 1259 OID 5174098)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2436 (class 1259 OID 5174097)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2357 (class 1259 OID 5173921)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2358 (class 1259 OID 5173923)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2359 (class 1259 OID 5173922)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2497 (class 1259 OID 5174300)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2393 (class 1259 OID 5174007)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2394 (class 1259 OID 5174005)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2395 (class 1259 OID 5174004)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2396 (class 1259 OID 5174006)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2301 (class 1259 OID 5173739)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 5173740)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2422 (class 1259 OID 5174063)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2408 (class 1259 OID 5174028)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2449 (class 1259 OID 5174140)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2450 (class 1259 OID 5174141)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2332 (class 1259 OID 5173851)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2333 (class 1259 OID 5173850)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2334 (class 1259 OID 5173852)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2457 (class 1259 OID 5174168)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2458 (class 1259 OID 5174169)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2490 (class 1259 OID 5174286)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2491 (class 1259 OID 5174285)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2492 (class 1259 OID 5174288)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2493 (class 1259 OID 5174284)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2494 (class 1259 OID 5174287)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2446 (class 1259 OID 5174131)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2399 (class 1259 OID 5174016)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2400 (class 1259 OID 5174015)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2401 (class 1259 OID 5174013)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2402 (class 1259 OID 5174014)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2284 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2486 (class 1259 OID 5174275)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2487 (class 1259 OID 5174274)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2364 (class 1259 OID 5173930)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2316 (class 1259 OID 5173786)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2317 (class 1259 OID 5173785)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2324 (class 1259 OID 5173816)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2325 (class 1259 OID 5173817)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2388 (class 1259 OID 5173997)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2389 (class 1259 OID 5173996)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2390 (class 1259 OID 5173995)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2371 (class 1259 OID 5173962)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2372 (class 1259 OID 5173958)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2373 (class 1259 OID 5173955)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2374 (class 1259 OID 5173956)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2375 (class 1259 OID 5173954)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2376 (class 1259 OID 5173959)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2377 (class 1259 OID 5173957)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2331 (class 1259 OID 5173836)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2349 (class 1259 OID 5173900)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2350 (class 1259 OID 5173902)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2351 (class 1259 OID 5173901)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2352 (class 1259 OID 5173903)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2407 (class 1259 OID 5174022)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2475 (class 1259 OID 5174225)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2322 (class 1259 OID 5173808)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2323 (class 1259 OID 5173809)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2503 (class 1259 OID 5174308)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2342 (class 1259 OID 5173872)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2500 (class 1259 OID 5174299)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2427 (class 1259 OID 5174073)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2428 (class 1259 OID 5174072)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2287 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2339 (class 1259 OID 5173860)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 5174212)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2309 (class 1259 OID 5173759)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2378 (class 1259 OID 5173961)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2528 (class 2606 OID 5174441)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2531 (class 2606 OID 5174426)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2530 (class 2606 OID 5174431)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2526 (class 2606 OID 5174451)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2532 (class 2606 OID 5174421)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2527 (class 2606 OID 5174446)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2529 (class 2606 OID 5174436)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2562 (class 2606 OID 5174596)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2561 (class 2606 OID 5174601)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2513 (class 2606 OID 5174356)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2549 (class 2606 OID 5174536)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2547 (class 2606 OID 5174531)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2548 (class 2606 OID 5174526)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2525 (class 2606 OID 5174416)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2555 (class 2606 OID 5174576)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2557 (class 2606 OID 5174566)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2556 (class 2606 OID 5174571)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2519 (class 2606 OID 5174391)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2520 (class 2606 OID 5174386)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2545 (class 2606 OID 5174516)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2568 (class 2606 OID 5174621)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2567 (class 2606 OID 5174626)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2566 (class 2606 OID 5174631)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2569 (class 2606 OID 5174651)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2572 (class 2606 OID 5174636)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2570 (class 2606 OID 5174646)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2571 (class 2606 OID 5174641)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2517 (class 2606 OID 5174381)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 5174376)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2510 (class 2606 OID 5174341)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2551 (class 2606 OID 5174546)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2533 (class 2606 OID 5174456)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2507 (class 2606 OID 5174321)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2506 (class 2606 OID 5174326)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2552 (class 2606 OID 5174561)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2553 (class 2606 OID 5174556)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2554 (class 2606 OID 5174551)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2523 (class 2606 OID 5174396)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2521 (class 2606 OID 5174406)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2522 (class 2606 OID 5174401)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2580 (class 2606 OID 5174691)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2537 (class 2606 OID 5174491)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2539 (class 2606 OID 5174481)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2540 (class 2606 OID 5174476)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2538 (class 2606 OID 5174486)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2505 (class 2606 OID 5174311)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2504 (class 2606 OID 5174316)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2550 (class 2606 OID 5174541)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2546 (class 2606 OID 5174521)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2560 (class 2606 OID 5174586)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2559 (class 2606 OID 5174591)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2515 (class 2606 OID 5174366)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2516 (class 2606 OID 5174361)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2514 (class 2606 OID 5174371)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2564 (class 2606 OID 5174606)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2563 (class 2606 OID 5174611)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2577 (class 2606 OID 5174676)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2578 (class 2606 OID 5174671)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2575 (class 2606 OID 5174686)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2579 (class 2606 OID 5174666)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2576 (class 2606 OID 5174681)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2558 (class 2606 OID 5174581)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2541 (class 2606 OID 5174511)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2542 (class 2606 OID 5174506)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2544 (class 2606 OID 5174496)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2543 (class 2606 OID 5174501)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2573 (class 2606 OID 5174661)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2574 (class 2606 OID 5174656)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2524 (class 2606 OID 5174411)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2565 (class 2606 OID 5174616)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2508 (class 2606 OID 5174336)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2509 (class 2606 OID 5174331)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2512 (class 2606 OID 5174346)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2511 (class 2606 OID 5174351)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2534 (class 2606 OID 5174471)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2535 (class 2606 OID 5174466)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2536 (class 2606 OID 5174461)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-27 09:13:43 CEST

--
-- PostgreSQL database dump complete
--

