--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-27 08:17:33 CEST

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
-- TOC entry 2758 (class 0 OID 0)
-- Dependencies: 232
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 5151057)
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
-- TOC entry 227 (class 1259 OID 5151567)
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
-- TOC entry 226 (class 1259 OID 5151550)
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
-- TOC entry 219 (class 1259 OID 5151461)
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
-- TOC entry 194 (class 1259 OID 5151231)
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
-- TOC entry 197 (class 1259 OID 5151265)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 5151178)
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
-- TOC entry 213 (class 1259 OID 5151391)
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
-- TOC entry 192 (class 1259 OID 5151215)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 196 (class 1259 OID 5151259)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 5151195)
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
-- TOC entry 202 (class 1259 OID 5151308)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 5151333)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 5151152)
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
-- TOC entry 181 (class 1259 OID 5151066)
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
-- TOC entry 182 (class 1259 OID 5151077)
-- Name: oseba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba (
    id uuid NOT NULL,
    user_id uuid,
    naslov_id uuid,
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
-- TOC entry 177 (class 1259 OID 5151031)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 5151050)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 5151340)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 5151371)
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
-- TOC entry 223 (class 1259 OID 5151504)
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
-- TOC entry 184 (class 1259 OID 5151109)
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
-- TOC entry 186 (class 1259 OID 5151144)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 5151314)
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
-- TOC entry 185 (class 1259 OID 5151129)
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
-- TOC entry 191 (class 1259 OID 5151207)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 5151326)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 5151446)
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
-- TOC entry 222 (class 1259 OID 5151497)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 5151355)
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
-- TOC entry 201 (class 1259 OID 5151299)
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
-- TOC entry 200 (class 1259 OID 5151289)
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
-- TOC entry 221 (class 1259 OID 5151486)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 5151423)
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
-- TOC entry 174 (class 1259 OID 5151002)
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
-- TOC entry 173 (class 1259 OID 5151000)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2759 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 5151365)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 5151040)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 5151024)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 5151379)
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
-- TOC entry 204 (class 1259 OID 5151320)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 5151270)
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
-- TOC entry 230 (class 1259 OID 5151592)
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
-- TOC entry 229 (class 1259 OID 5151585)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 5151580)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 5151433)
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
-- TOC entry 231 (class 1259 OID 5151600)
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE strosekuprizoritve_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 183 (class 1259 OID 5151101)
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
-- TOC entry 199 (class 1259 OID 5151276)
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
-- TOC entry 220 (class 1259 OID 5151475)
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
-- TOC entry 188 (class 1259 OID 5151164)
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
-- TOC entry 175 (class 1259 OID 5151011)
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
-- TOC entry 225 (class 1259 OID 5151530)
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
-- TOC entry 193 (class 1259 OID 5151222)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 5151347)
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
-- TOC entry 215 (class 1259 OID 5151415)
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
-- TOC entry 195 (class 1259 OID 5151254)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 5151520)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 5151405)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2146 (class 2604 OID 5151005)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2700 (class 0 OID 5151057)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2747 (class 0 OID 5151567)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
\.


--
-- TOC entry 2746 (class 0 OID 5151550)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2739 (class 0 OID 5151461)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-5565-617d-77f4-886e1e48180e	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-5565-617d-85e1-97a3d4e8125d	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-5565-617d-9245-b940d13a76e6	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 2714 (class 0 OID 5151231)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2717 (class 0 OID 5151265)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2709 (class 0 OID 5151178)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5565-617b-c23e-20423f1e2e72	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5565-617b-921a-a86800729122	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5565-617b-05d7-69609ce87a6e	AL	ALB	008	Albania 	Albanija	\N
00040000-5565-617b-e257-c5bf470c60ec	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5565-617b-2618-94351bb9d51b	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5565-617b-fa8c-54ae7d411ebe	AD	AND	020	Andorra 	Andora	\N
00040000-5565-617b-562a-f4ab877498ad	AO	AGO	024	Angola 	Angola	\N
00040000-5565-617b-9d3a-bd6d80e98749	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5565-617b-9176-bd03dae497b2	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5565-617b-d40a-7c67d1635d69	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5565-617b-a433-dd08aa11e8c9	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5565-617b-5019-3d58368e9298	AM	ARM	051	Armenia 	Armenija	\N
00040000-5565-617b-773f-3363bc23620d	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5565-617b-9203-b92604153df7	AU	AUS	036	Australia 	Avstralija	\N
00040000-5565-617b-27f6-25df6ec00815	AT	AUT	040	Austria 	Avstrija	\N
00040000-5565-617b-890e-8e84aba7b9f5	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5565-617b-0bb5-64e23b3a6330	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5565-617b-7e1a-772d052f9e1f	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5565-617b-e10a-5bd7dd9d885c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5565-617b-bf47-0fbec6739ab4	BB	BRB	052	Barbados 	Barbados	\N
00040000-5565-617b-c034-cfe893d50244	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5565-617b-402b-ba8f60cdddf3	BE	BEL	056	Belgium 	Belgija	\N
00040000-5565-617b-fd39-24d7ff100253	BZ	BLZ	084	Belize 	Belize	\N
00040000-5565-617b-74b0-52547e165ba6	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5565-617b-6b6f-2dc817130b34	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5565-617b-116c-b9918a70339d	BT	BTN	064	Bhutan 	Butan	\N
00040000-5565-617b-d5ea-a7edf3f30ab9	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5565-617b-b8ea-b9322b49e84d	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5565-617b-da7b-51ace7ddebdf	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5565-617b-e74e-6ec881812aea	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5565-617b-e32f-f363eed2c04e	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5565-617b-8def-88bbb51d7b76	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5565-617b-c597-d712e3b0c9a0	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5565-617b-5857-61c87cc29e12	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5565-617b-0598-a97385f0b51f	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5565-617b-d106-bd1cbd83446b	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5565-617b-38d6-c8c294d50f6b	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5565-617b-94e3-6152f5d8a602	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5565-617b-3476-aa64c8d0fdf5	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5565-617b-a1b5-f4cd066fdef9	CA	CAN	124	Canada 	Kanada	\N
00040000-5565-617c-fbfa-de17cf4bd580	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5565-617c-2bf3-633a48376ebf	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5565-617c-b428-ad74db2e4332	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5565-617c-87ad-5fc60b6b2532	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5565-617c-7f00-c46f90dd97a8	CL	CHL	152	Chile 	Čile	\N
00040000-5565-617c-1284-4d69966f6ec4	CN	CHN	156	China 	Kitajska	\N
00040000-5565-617c-a37d-9761226f70e0	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5565-617c-9668-3c32ae49dcf7	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5565-617c-9b46-5f549665482a	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5565-617c-6821-cdc2210d7eca	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5565-617c-bb9d-9b6fa70eadc2	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5565-617c-77c5-784920f8ea6b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5565-617c-5272-6e05176cd5db	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5565-617c-2ae0-434cf6d4daf4	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5565-617c-50bc-7b6620bf8efb	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5565-617c-3767-644431976fd6	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5565-617c-6fac-d9e83d5416f2	CU	CUB	192	Cuba 	Kuba	\N
00040000-5565-617c-f272-6caa48ba71ef	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5565-617c-4476-80b8e1ae7dee	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5565-617c-ef88-a75a86eb7a18	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5565-617c-25b1-2461e62a7885	DK	DNK	208	Denmark 	Danska	\N
00040000-5565-617c-a71e-7a2a8dc96e1b	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5565-617c-1015-8b21e2f53d0b	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5565-617c-84e5-b04f66c04638	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5565-617c-f8b7-d9acf150d032	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5565-617c-52f1-4042b6dff474	EG	EGY	818	Egypt 	Egipt	\N
00040000-5565-617c-fae7-a4daa856d28f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5565-617c-fe25-3d0e42007b6e	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5565-617c-f9c2-2a4a37285264	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5565-617c-739d-08ec7e2d22ba	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5565-617c-5c3e-c252f50e5767	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5565-617c-ba21-f0c101677355	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5565-617c-1867-0c3e207d96cf	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5565-617c-0f78-7239bd9f7d5f	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5565-617c-e356-4bef30f2116b	FI	FIN	246	Finland 	Finska	\N
00040000-5565-617c-1488-008fe1e33220	FR	FRA	250	France 	Francija	\N
00040000-5565-617c-ad99-e6d51ceb4bad	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5565-617c-868b-599ff14b15ca	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5565-617c-854f-89f47615c7f0	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5565-617c-4eba-93ce92e38db6	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5565-617c-05b6-5c55af3b1eea	GA	GAB	266	Gabon 	Gabon	\N
00040000-5565-617c-f691-d8af8db83758	GM	GMB	270	Gambia 	Gambija	\N
00040000-5565-617c-ea19-7d8a964e60a6	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5565-617c-d18a-d85b84fbf14f	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5565-617c-cc8e-b5b756368f80	GH	GHA	288	Ghana 	Gana	\N
00040000-5565-617c-68eb-c61535bd0581	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5565-617c-05cb-e0f560976c0b	GR	GRC	300	Greece 	Grčija	\N
00040000-5565-617c-f67e-0a16c5a2aceb	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5565-617c-a612-0c56b15e92d0	GD	GRD	308	Grenada 	Grenada	\N
00040000-5565-617c-231a-88dc7d06ddb4	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5565-617c-58a7-a905407dec6c	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5565-617c-83ab-51112d299a43	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5565-617c-9d73-06133fe57a75	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5565-617c-b634-976812b091fe	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5565-617c-4183-78eab8261d33	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5565-617c-688f-d1fb45326624	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5565-617c-0591-e25c6de6673d	HT	HTI	332	Haiti 	Haiti	\N
00040000-5565-617c-d668-e810252f9a51	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5565-617c-b52e-870df417f883	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5565-617c-6293-20e73125fb6d	HN	HND	340	Honduras 	Honduras	\N
00040000-5565-617c-b0d4-fe86594f5da8	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5565-617c-dfe6-af8b5e011601	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5565-617c-dac7-949e046f268c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5565-617c-63d6-3de33ecdd5ed	IN	IND	356	India 	Indija	\N
00040000-5565-617c-0bfd-f906825af969	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5565-617c-e189-debe0c70a922	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5565-617c-6af2-86ed2ed84693	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5565-617c-6b19-06314b11ccfa	IE	IRL	372	Ireland 	Irska	\N
00040000-5565-617c-ee0e-2ccad0ca9be6	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5565-617c-019c-b23b474040a2	IL	ISR	376	Israel 	Izrael	\N
00040000-5565-617c-2f26-ad6c795078fd	IT	ITA	380	Italy 	Italija	\N
00040000-5565-617c-b1de-69bc33f75e87	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5565-617c-66a8-98b7e3f58e56	JP	JPN	392	Japan 	Japonska	\N
00040000-5565-617c-ae44-5edc4c56213a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5565-617c-8ce0-020a80348041	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5565-617c-7ff7-01259d1bf7c9	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5565-617c-940a-5bd275337635	KE	KEN	404	Kenya 	Kenija	\N
00040000-5565-617c-f5dd-3a4718df6d0c	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5565-617c-954f-ef596e96aa72	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5565-617c-592e-0c40f995c2a4	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5565-617c-b930-ddd01686fdea	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5565-617c-1996-bf64e36f8ac5	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5565-617c-796e-7969eec26260	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5565-617c-8d88-2f0415fb03a6	LV	LVA	428	Latvia 	Latvija	\N
00040000-5565-617c-2982-20113f6a74e6	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5565-617c-91ae-f42a8cfc772d	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5565-617c-911d-c5a64c553ee6	LR	LBR	430	Liberia 	Liberija	\N
00040000-5565-617c-fa41-d94a43872177	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5565-617c-768f-4ed592d86ac4	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5565-617c-cd32-726619433da0	LT	LTU	440	Lithuania 	Litva	\N
00040000-5565-617c-0f3c-2bfa94e6ee42	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5565-617c-61a1-861a29f77138	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5565-617c-e3c3-f8d17236bd8b	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5565-617c-7f5d-db61a87657b4	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5565-617c-5dd2-d50552ca62da	MW	MWI	454	Malawi 	Malavi	\N
00040000-5565-617c-016e-a84db5176c38	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5565-617c-a540-649f1727c2d0	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5565-617c-a867-76da0c62c07e	ML	MLI	466	Mali 	Mali	\N
00040000-5565-617c-692c-6b51982ce0f4	MT	MLT	470	Malta 	Malta	\N
00040000-5565-617c-0baf-ae1e598de62b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5565-617c-085e-a10e234b085b	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5565-617c-1e8b-0cc571bdd046	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5565-617c-50fe-20667dfebff1	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5565-617c-1f66-bd5b06765c74	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5565-617c-94f4-88376e3d80d6	MX	MEX	484	Mexico 	Mehika	\N
00040000-5565-617c-fa85-dcb3258dcc16	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5565-617c-40eb-275f521aa757	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5565-617c-d488-c65127cfcb89	MC	MCO	492	Monaco 	Monako	\N
00040000-5565-617c-e9ae-bd79cc440c3d	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5565-617c-300b-21130b9ecbe4	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5565-617c-177b-a14c3134fd9e	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5565-617c-4f1e-875b58219335	MA	MAR	504	Morocco 	Maroko	\N
00040000-5565-617c-5f51-fc8189478c46	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5565-617c-5e2d-5e1c64d8f30a	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5565-617c-e748-c370e4ecd685	NA	NAM	516	Namibia 	Namibija	\N
00040000-5565-617c-b55a-5bc3c138f309	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5565-617c-d69c-ca5bd04116df	NP	NPL	524	Nepal 	Nepal	\N
00040000-5565-617c-5082-86738673dc8f	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5565-617c-1c77-5b21bd5b3213	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5565-617c-b5ca-731478f1a2dd	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5565-617c-6557-4b9574138e2a	NE	NER	562	Niger 	Niger 	\N
00040000-5565-617c-2644-bdd07361d88b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5565-617c-c031-2113ea7aada6	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5565-617c-f623-1b3005b8b580	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5565-617c-bdfd-0ec1268993cb	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5565-617c-b350-5542e0d79c1f	NO	NOR	578	Norway 	Norveška	\N
00040000-5565-617c-174e-a3abd6ffc947	OM	OMN	512	Oman 	Oman	\N
00040000-5565-617c-47a1-0235e959c0ab	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5565-617c-e1b4-d488b86512c9	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5565-617c-b390-33b503750ca0	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5565-617c-f3f5-846a8ad01bfa	PA	PAN	591	Panama 	Panama	\N
00040000-5565-617c-3bec-a4de973d0b37	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5565-617c-a084-6a7dfcc15352	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5565-617c-38f8-b8208cec4ae5	PE	PER	604	Peru 	Peru	\N
00040000-5565-617c-3e94-e083675ffe4a	PH	PHL	608	Philippines 	Filipini	\N
00040000-5565-617c-7405-67d863359948	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5565-617c-17f7-e21b03057b46	PL	POL	616	Poland 	Poljska	\N
00040000-5565-617c-d406-97599c1ae1b0	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5565-617c-0b2d-b3f56cf3d154	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5565-617c-4198-6e04262e79f7	QA	QAT	634	Qatar 	Katar	\N
00040000-5565-617c-7f30-20b2d2ea72e9	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5565-617c-b0d6-2c30d0907303	RO	ROU	642	Romania 	Romunija	\N
00040000-5565-617c-91cd-eff641ea6100	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5565-617c-72e1-8fcf494f0054	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5565-617c-4a3e-185daf50adad	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5565-617c-1a76-391c2da91905	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5565-617c-3ecf-36c534cdf5c8	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5565-617c-6989-006014666bc9	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5565-617c-c63b-2d52b05fdd85	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5565-617c-3f8b-be758c0a13d0	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5565-617c-33c9-6bcad02db93a	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5565-617c-e80e-04ab5df01263	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5565-617c-a9d3-317bd1dbe46b	SM	SMR	674	San Marino 	San Marino	\N
00040000-5565-617c-84db-d4b01bc566f3	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5565-617c-d3bb-7660484b3e73	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5565-617c-045c-013b636f0635	SN	SEN	686	Senegal 	Senegal	\N
00040000-5565-617c-8bc2-6300c6e71254	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5565-617c-a40f-741aa63f993f	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5565-617c-1db6-e8a265c4026d	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5565-617c-253c-3fdd55ce0cbc	SG	SGP	702	Singapore 	Singapur	\N
00040000-5565-617c-56c1-d75debaf6a5a	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5565-617c-942f-4497a203116d	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5565-617c-480f-b3771a30c9c4	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5565-617c-f031-a6317a56de55	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5565-617c-144c-27ca0d6f131d	SO	SOM	706	Somalia 	Somalija	\N
00040000-5565-617c-d3e4-ce5fb895e3ae	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5565-617c-c705-0a5c608c6d45	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5565-617c-311f-c587fc842dcc	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5565-617c-63d1-14cde6896c8e	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5565-617c-7f4a-ae2bb7c01a7d	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5565-617c-f492-1e69d2e2bd91	SD	SDN	729	Sudan 	Sudan	\N
00040000-5565-617c-83f6-a2ee8c911871	SR	SUR	740	Suriname 	Surinam	\N
00040000-5565-617c-5932-fe8a1a35767c	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5565-617c-d0b4-04f5438334d8	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5565-617c-b2e6-fe4d2fd3b1b2	SE	SWE	752	Sweden 	Švedska	\N
00040000-5565-617c-bbfc-28ea1b50d60e	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5565-617c-23ca-837fd30c1f47	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5565-617c-cd81-f05bfc8af92b	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5565-617c-e013-c522c8a8e08b	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5565-617c-9ec2-a95b14dd60fe	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5565-617c-6544-221bf385eca4	TH	THA	764	Thailand 	Tajska	\N
00040000-5565-617c-c967-49f7e7809149	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5565-617c-ea7a-4f4f6265ea94	TG	TGO	768	Togo 	Togo	\N
00040000-5565-617c-7f07-9cd5eb14ee8d	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5565-617c-b397-03626d07796d	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5565-617c-7d41-7b2659f4574b	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5565-617c-1670-e7b7a0f58b73	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5565-617c-7b68-0d4a73d241c1	TR	TUR	792	Turkey 	Turčija	\N
00040000-5565-617c-0a0f-d4208bcdd611	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5565-617c-a77a-6e011daaa894	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5565-617c-cb7c-ce1d8b68b649	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5565-617c-a4fa-66113324766c	UG	UGA	800	Uganda 	Uganda	\N
00040000-5565-617c-3e77-4fe34c9c1885	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5565-617c-2b24-f300ad01c8c3	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5565-617c-a48e-28a1998dd88b	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5565-617c-4418-322b4d2b0507	US	USA	840	United States 	Združene države Amerike	\N
00040000-5565-617c-25ee-7a44c6f51dfb	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5565-617c-9046-4063ce24c12c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5565-617c-6fd0-f25f919b6022	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5565-617c-90d5-93f62d97577b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5565-617c-bf9f-02da5d09e628	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5565-617c-8274-92f270d7e8d1	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5565-617c-9740-6c70d5d62fd7	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5565-617c-bd14-f8a87c0d0822	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5565-617c-d9f4-fac4935763c2	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5565-617c-12fd-5eac27340caa	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5565-617c-1303-16e691376181	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5565-617c-d687-50569e8586b7	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5565-617c-93d7-5fe54da23408	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2733 (class 0 OID 5151391)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj) FROM stdin;
000d0000-5565-617d-6156-08d9791c7df9	000e0000-5565-617d-3b8a-1eef72333c03	\N	000f0000-5565-617b-a6c9-78289c6e7196	igralec	Hipolita	velika	t	9	t	t	\N
000d0000-5565-617d-c720-463ed2966c3e	000e0000-5565-617d-3b8a-1eef72333c03	\N	000f0000-5565-617b-a6c9-78289c6e7196	igralec	Tezej	velika	t	9	t	t	\N
\.


--
-- TOC entry 2712 (class 0 OID 5151215)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2716 (class 0 OID 5151259)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2710 (class 0 OID 5151195)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
\.


--
-- TOC entry 2690 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2722 (class 0 OID 5151308)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2726 (class 0 OID 5151333)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2707 (class 0 OID 5151152)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5565-617c-7347-a8280ebbed61	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5565-617c-30f2-5a7dc7f49bb1	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5565-617c-9af1-e8a361fbf211	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5565-617c-6c9e-78db501f513f	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5565-617c-bda2-34f2a7ab59c0	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5565-617c-84a7-4a79be377221	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5565-617c-0958-8fe18ef78979	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5565-617c-b553-9174ea75bc7d	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5565-617c-8364-008448a7d15b	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5565-617c-be15-635814154f31	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5565-617c-6a1a-b427cf80d416	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5565-617c-2bda-d12f5698012b	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5565-617c-0b78-c356f46e6e54	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5565-617c-2835-930e9f4c0b34	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5565-617c-9547-d40af9abbaa8	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2701 (class 0 OID 5151066)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5565-617c-d0a2-00db6d84a76a	00000000-5565-617c-bda2-34f2a7ab59c0	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5565-617c-8e90-3abe19c0740c	00000000-5565-617c-bda2-34f2a7ab59c0	00010000-5565-617c-5bd9-35a5baa9e9cd	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5565-617c-2529-fa584c73ee9d	00000000-5565-617c-84a7-4a79be377221	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2702 (class 0 OID 5151077)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5565-617c-e42c-40c2633108e8	\N	\N	0001	g.	Janez	Novak	a	Peter	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5565-617d-5a13-028705c83269	\N	\N	0002	dr.	Anton	Horvat	b			anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5565-617d-dfdf-91f1de65e0dc	\N	\N	0003		Ivan	Kovačič	c			ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5565-617d-4d61-908935d2ae4a	\N	\N	0004	prof.	Jožef	Krajnc	d		Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5565-617d-e4f8-35eae743f019	\N	\N	0005		Marko	Zupančič	e			marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5565-617d-f51f-89f077904855	\N	\N	0006	ga.	Marija	Kovač	f			marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5565-617d-5de0-84a8c2eb5e63	\N	\N	0007	ga.	Ana	Potočnik	g			ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5565-617d-74fb-66c0111346be	\N	\N	0008	ga.	Maja	Mlakar	h			maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5565-617d-a49a-336f40c04f6f	\N	\N	0009		Irena	Kos	i			irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5565-617d-8bd8-3cc39f98ed98	\N	\N	0010		Mojca	Vidmar	J			mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5565-617d-430d-aa7532667041	\N	\N	0011		xx	write protected12345	\N			xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2692 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2697 (class 0 OID 5151031)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5565-617c-c162-e84d3a5aacc7	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5565-617c-fe73-46a2af097675	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5565-617c-4da7-4f97e5e0e094	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5565-617c-2019-0f6cd12680c2	Abonma-read	Abonma - branje	f
00030000-5565-617c-d6fc-a9c7c30e835c	Abonma-write	Abonma - spreminjanje	f
00030000-5565-617c-e67b-a4971ce22e1a	Alternacija-read	Alternacija - branje	f
00030000-5565-617c-6970-178300946f75	Alternacija-write	Alternacija - spreminjanje	f
00030000-5565-617c-8566-5cf5f743a844	Arhivalija-read	Arhivalija - branje	f
00030000-5565-617c-a847-3f90d2ecdb7b	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5565-617c-e9c3-6e2f0874a1f9	Besedilo-read	Besedilo - branje	f
00030000-5565-617c-1490-3a85908e4c21	Besedilo-write	Besedilo - spreminjanje	f
00030000-5565-617c-8081-f9d32b56376c	DogodekIzven-read	DogodekIzven - branje	f
00030000-5565-617c-5414-53bd0170b024	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5565-617c-d850-45a928469c62	Dogodek-read	Dogodek - branje	f
00030000-5565-617c-42ff-95f84a265d2f	Dogodek-write	Dogodek - spreminjanje	f
00030000-5565-617c-4f07-1fa9a3d6cea1	Drzava-read	Drzava - branje	f
00030000-5565-617c-b320-c82bf43ce288	Drzava-write	Drzava - spreminjanje	f
00030000-5565-617c-e9a2-e132d17c033a	Funkcija-read	Funkcija - branje	f
00030000-5565-617c-5311-1ea922a68492	Funkcija-write	Funkcija - spreminjanje	f
00030000-5565-617c-5336-4c7512366094	Gostovanje-read	Gostovanje - branje	f
00030000-5565-617c-0cf0-020eba73e434	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5565-617c-db4c-07d84b593475	Gostujoca-read	Gostujoca - branje	f
00030000-5565-617c-f686-938c44f70a11	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5565-617c-92e9-6323827dea16	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5565-617c-fa2c-a3c6835589e2	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5565-617c-da26-32dd1c186cb4	Kupec-read	Kupec - branje	f
00030000-5565-617c-3e95-412669a4d179	Kupec-write	Kupec - spreminjanje	f
00030000-5565-617c-fd37-7d7eb9a223fd	NacinPlacina-read	NacinPlacina - branje	f
00030000-5565-617c-a68a-4a127f04d1e1	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5565-617c-38da-e8ef6c7d8d31	Option-read	Option - branje	f
00030000-5565-617c-c76c-205e88d0c15f	Option-write	Option - spreminjanje	f
00030000-5565-617c-6ee0-c31a96a19ecb	OptionValue-read	OptionValue - branje	f
00030000-5565-617c-0770-8491ffd355fd	OptionValue-write	OptionValue - spreminjanje	f
00030000-5565-617c-4373-6563efa8110f	Oseba-read	Oseba - branje	f
00030000-5565-617c-bc25-87dd33526218	Oseba-write	Oseba - spreminjanje	f
00030000-5565-617c-10ed-411969d7a331	Permission-read	Permission - branje	f
00030000-5565-617c-eb79-9dea1ea8daef	Permission-write	Permission - spreminjanje	f
00030000-5565-617c-570b-b38cdc58aff9	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5565-617c-e1b6-81774d40990c	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5565-617c-7746-638e6ae72c26	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5565-617c-8b66-559da7cccef3	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5565-617c-5a07-4a1d753d9121	Pogodba-read	Pogodba - branje	f
00030000-5565-617c-4bec-88f5affc308c	Pogodba-write	Pogodba - spreminjanje	f
00030000-5565-617c-dd33-4297e47667ab	Popa-read	Popa - branje	f
00030000-5565-617c-c4fb-749920625521	Popa-write	Popa - spreminjanje	f
00030000-5565-617c-33ee-6097bcb699ca	Posta-read	Posta - branje	f
00030000-5565-617c-0d3f-f97305e674de	Posta-write	Posta - spreminjanje	f
00030000-5565-617c-addc-239ba93b71d6	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5565-617c-2e0c-eb9316f9e3d5	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5565-617c-3abf-c3f9f1f2e05e	PostniNaslov-read	PostniNaslov - branje	f
00030000-5565-617c-232b-d251f8867bb6	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5565-617c-1ffe-e72c13660f18	Predstava-read	Predstava - branje	f
00030000-5565-617c-5c79-16fc19145ae9	Predstava-write	Predstava - spreminjanje	f
00030000-5565-617c-5570-e4ccc1c4ecc8	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5565-617c-5db7-7d4ff59c0d36	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5565-617c-6116-68bf9cb25b43	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5565-617c-6d99-774ab7ffa2ef	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5565-617c-c280-498580f917b0	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5565-617c-5170-9f81a1155e8d	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5565-617c-7ce9-f82da055d282	Prostor-read	Prostor - branje	f
00030000-5565-617c-f099-928921802c01	Prostor-write	Prostor - spreminjanje	f
00030000-5565-617c-aa42-d319bc5331ac	Racun-read	Racun - branje	f
00030000-5565-617c-c93f-1a49e26c8348	Racun-write	Racun - spreminjanje	f
00030000-5565-617c-9d8a-339ee1bdb82e	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5565-617c-f343-26ef9f126bf6	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5565-617c-7c86-9c24ffebd82e	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5565-617c-e2a5-fb43042e741d	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5565-617c-ca3c-439345c5b410	Rekvizit-read	Rekvizit - branje	f
00030000-5565-617c-f1b5-e42e7a9f1c6d	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5565-617c-28e0-8ee3ce71de0f	Revizija-read	Revizija - branje	f
00030000-5565-617c-39d1-d7cd1043b073	Revizija-write	Revizija - spreminjanje	f
00030000-5565-617c-2e57-3f4b58eeb052	Rezervacija-read	Rezervacija - branje	f
00030000-5565-617c-5ec5-42f7a6823893	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5565-617c-5277-830446bc2306	Role-read	Role - branje	f
00030000-5565-617c-63de-d2ed4e33c261	Role-write	Role - spreminjanje	f
00030000-5565-617c-caa9-d6f934301903	SedezniRed-read	SedezniRed - branje	f
00030000-5565-617c-2546-2cc584da09bc	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5565-617c-d8aa-1e0b9c0fd7b5	Sedez-read	Sedez - branje	f
00030000-5565-617c-6432-972bbdfa9a79	Sedez-write	Sedez - spreminjanje	f
00030000-5565-617c-6795-e85e623d8bf4	Sezona-read	Sezona - branje	f
00030000-5565-617c-56cb-9280cc2fbec6	Sezona-write	Sezona - spreminjanje	f
00030000-5565-617c-14a2-2b8a85c66fc7	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5565-617c-12d2-9779f880e83d	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5565-617c-5391-2d7dd7f4827c	Stevilcenje-read	Stevilcenje - branje	f
00030000-5565-617c-aed6-5ec45211b83a	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5565-617c-3d29-94d8b9ff2efd	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5565-617c-cfc8-3fb4ec6f536c	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5565-617c-958c-5565b9a6698d	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5565-617c-d228-32a074fc857f	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5565-617c-5b10-7f484c3cdb10	Telefonska-read	Telefonska - branje	f
00030000-5565-617c-1e88-c2f45b8f3a2b	Telefonska-write	Telefonska - spreminjanje	f
00030000-5565-617c-7fd4-0392f6e66761	TerminStoritve-read	TerminStoritve - branje	f
00030000-5565-617c-fce0-8c222b1c29ac	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5565-617c-462d-56ff1be7177e	TipFunkcije-read	TipFunkcije - branje	f
00030000-5565-617c-c6a9-cb4fe08a5ddd	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5565-617c-2e3c-c58c765f5bf1	Trr-read	Trr - branje	f
00030000-5565-617c-ba66-7cf75a153ab0	Trr-write	Trr - spreminjanje	f
00030000-5565-617c-a34e-a708a4fb3393	Uprizoritev-read	Uprizoritev - branje	f
00030000-5565-617c-e7eb-46f3f0dc4f2d	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5565-617c-9d22-f824dc07b031	User-read	User - branje	f
00030000-5565-617c-b16e-82d0f7b3dcf8	User-write	User - spreminjanje	f
00030000-5565-617c-bbcb-3fe603bfb670	Vaja-read	Vaja - branje	f
00030000-5565-617c-a51c-d482265b24fd	Vaja-write	Vaja - spreminjanje	f
00030000-5565-617c-531c-baf165495c36	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5565-617c-e241-032761de5b39	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5565-617c-2576-eb90a0fc76fa	Zaposlitev-read	Zaposlitev - branje	f
00030000-5565-617c-03de-5904aaad6367	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5565-617c-bce4-4b5a84e8bfee	Zasedenost-read	Zasedenost - branje	f
00030000-5565-617c-0291-224f151f998a	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5565-617c-1782-1c2017732502	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5565-617c-f00f-ea6e07a7c4ea	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5565-617c-f536-96a1b5b4aae7	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5565-617c-2b38-0ed16169ca6d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2699 (class 0 OID 5151050)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5565-617c-2b47-ff63db750fde	00030000-5565-617c-4f07-1fa9a3d6cea1
00020000-5565-617c-82fb-fab14d7ead8a	00030000-5565-617c-b320-c82bf43ce288
00020000-5565-617c-82fb-fab14d7ead8a	00030000-5565-617c-4f07-1fa9a3d6cea1
\.


--
-- TOC entry 2727 (class 0 OID 5151340)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2731 (class 0 OID 5151371)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2743 (class 0 OID 5151504)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2704 (class 0 OID 5151109)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5565-617d-5e69-2ca861e695a3	00040000-5565-617b-c23e-20423f1e2e72	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5565-617d-9bdb-f475a516e5ff	00040000-5565-617b-c23e-20423f1e2e72	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2706 (class 0 OID 5151144)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5565-617b-d6a1-e65704655f2c	8341	Adlešiči
00050000-5565-617b-fa2a-5f5202477bb5	5270	Ajdovščina
00050000-5565-617b-0807-57bca44b8401	6280	Ankaran/Ancarano
00050000-5565-617b-0005-0ec110742f6d	9253	Apače
00050000-5565-617b-e713-cae5936d19de	8253	Artiče
00050000-5565-617b-52ef-97c0dc471bb2	4275	Begunje na Gorenjskem
00050000-5565-617b-ef0a-068ad42928bd	1382	Begunje pri Cerknici
00050000-5565-617b-ea42-0c11f9ca0f6e	9231	Beltinci
00050000-5565-617b-da81-17055f7d626a	2234	Benedikt
00050000-5565-617b-9697-b5442704453f	2345	Bistrica ob Dravi
00050000-5565-617b-d8cd-b221d15857e1	3256	Bistrica ob Sotli
00050000-5565-617b-de50-3c9352d70045	8259	Bizeljsko
00050000-5565-617b-e94d-3dc63ad77bf6	1223	Blagovica
00050000-5565-617b-faaf-316b5d7c2dd2	8283	Blanca
00050000-5565-617b-a5c9-33624eeaf633	4260	Bled
00050000-5565-617b-eac5-b447f37e9285	4273	Blejska Dobrava
00050000-5565-617b-9b05-7e67d066a40e	9265	Bodonci
00050000-5565-617b-ca97-734226b17378	9222	Bogojina
00050000-5565-617b-bbb2-bd07543f6c44	4263	Bohinjska Bela
00050000-5565-617b-0fe4-5f387ceba028	4264	Bohinjska Bistrica
00050000-5565-617b-c241-d2efdc1254ed	4265	Bohinjsko jezero
00050000-5565-617b-6a18-c298285056fc	1353	Borovnica
00050000-5565-617b-232c-1ac3fa1db585	8294	Boštanj
00050000-5565-617b-66cb-fd85d650c86d	5230	Bovec
00050000-5565-617b-f1d5-6746c45459d6	5295	Branik
00050000-5565-617b-4fcf-7c664ec91a34	3314	Braslovče
00050000-5565-617b-0a51-08c51aabcb72	5223	Breginj
00050000-5565-617b-4474-cb95ebad399b	8280	Brestanica
00050000-5565-617b-95cc-d0073423f11d	2354	Bresternica
00050000-5565-617b-a673-d27f572430e1	4243	Brezje
00050000-5565-617b-db79-9a6b4d12824e	1351	Brezovica pri Ljubljani
00050000-5565-617b-a1b9-7863c1af317b	8250	Brežice
00050000-5565-617b-a40c-4a37bb0d876c	4210	Brnik - Aerodrom
00050000-5565-617b-c917-67f2e6830746	8321	Brusnice
00050000-5565-617b-94d7-9f776f6d3d61	3255	Buče
00050000-5565-617b-c4c9-de8bcf2bae2c	8276	Bučka 
00050000-5565-617b-1725-849996549aa2	9261	Cankova
00050000-5565-617b-bce1-f10205b76317	3000	Celje 
00050000-5565-617b-c87c-364dafa82ecd	3001	Celje - poštni predali
00050000-5565-617b-12e7-659cd97f5de8	4207	Cerklje na Gorenjskem
00050000-5565-617b-539b-08c96853121b	8263	Cerklje ob Krki
00050000-5565-617b-19e6-ad1042b1bf05	1380	Cerknica
00050000-5565-617b-c366-492dd48ead85	5282	Cerkno
00050000-5565-617b-4321-7fe4e90c8b33	2236	Cerkvenjak
00050000-5565-617b-e1d3-08d278a04b38	2215	Ceršak
00050000-5565-617b-5f00-8d59674bc132	2326	Cirkovce
00050000-5565-617b-4821-08eec0a1b937	2282	Cirkulane
00050000-5565-617b-073d-4fbb2989c616	5273	Col
00050000-5565-617b-7d60-3d00be09a36a	8251	Čatež ob Savi
00050000-5565-617b-376b-a4d648eaf6cf	1413	Čemšenik
00050000-5565-617b-74c6-dd4d439c22f7	5253	Čepovan
00050000-5565-617b-50bd-9fa86b36471f	9232	Črenšovci
00050000-5565-617b-aeb0-d53b0c54aa9f	2393	Črna na Koroškem
00050000-5565-617b-bf2f-c9ca9da110ae	6275	Črni Kal
00050000-5565-617b-4852-be8a0054cc27	5274	Črni Vrh nad Idrijo
00050000-5565-617b-3022-5e8c4511c348	5262	Črniče
00050000-5565-617b-e3e0-6f6ac5e8d837	8340	Črnomelj
00050000-5565-617b-2ac6-9205de518cbd	6271	Dekani
00050000-5565-617b-b518-7636f033e9f0	5210	Deskle
00050000-5565-617b-47c1-e26056aa6191	2253	Destrnik
00050000-5565-617b-06d0-19952db27cbe	6215	Divača
00050000-5565-617b-efff-5e94a115ad94	1233	Dob
00050000-5565-617b-940f-067448879f15	3224	Dobje pri Planini
00050000-5565-617b-2954-17e047032d9b	8257	Dobova
00050000-5565-617b-48bc-76c3107c9a2e	1423	Dobovec
00050000-5565-617b-02a3-5368301d46aa	5263	Dobravlje
00050000-5565-617b-1816-8349d0517120	3204	Dobrna
00050000-5565-617b-8395-14e2f999dd9a	8211	Dobrnič
00050000-5565-617b-9cf4-1803ac7df0db	1356	Dobrova
00050000-5565-617b-0b18-019e75de8b3b	9223	Dobrovnik/Dobronak 
00050000-5565-617b-88b4-cbe3478b46c5	5212	Dobrovo v Brdih
00050000-5565-617b-77ec-c318f19adbbf	1431	Dol pri Hrastniku
00050000-5565-617b-43df-c206b8c5684e	1262	Dol pri Ljubljani
00050000-5565-617b-3a48-dd7c3aff9e4b	1273	Dole pri Litiji
00050000-5565-617b-fc56-7c785c3d4625	1331	Dolenja vas
00050000-5565-617b-1aaf-6da5c801d896	8350	Dolenjske Toplice
00050000-5565-617b-2896-0fa48729a457	1230	Domžale
00050000-5565-617b-62f1-e6a9f966db4b	2252	Dornava
00050000-5565-617b-e3f5-ef2fe7b461e6	5294	Dornberk
00050000-5565-617b-9bdb-7191d961db42	1319	Draga
00050000-5565-617b-f172-83033724e3e1	8343	Dragatuš
00050000-5565-617b-8ea8-3f482cec5f03	3222	Dramlje
00050000-5565-617b-5996-36103a09ef69	2370	Dravograd
00050000-5565-617b-c8e0-af617f429d55	4203	Duplje
00050000-5565-617b-3c4f-94e57d84803d	6221	Dutovlje
00050000-5565-617b-d3d0-7f83e61e2b35	8361	Dvor
00050000-5565-617b-618f-468d75e0c732	2343	Fala
00050000-5565-617b-2e76-5dc3b8fdcdbf	9208	Fokovci
00050000-5565-617b-c12f-6a8688be1e3d	2313	Fram
00050000-5565-617b-3940-65d004d3c80f	3213	Frankolovo
00050000-5565-617b-6b6f-68c1928402cc	1274	Gabrovka
00050000-5565-617b-1e05-8b0bd64627c6	8254	Globoko
00050000-5565-617b-5883-2a3eddc11fcb	5275	Godovič
00050000-5565-617b-0a15-4a9fcedee1f5	4204	Golnik
00050000-5565-617b-6567-0a5134e5fc01	3303	Gomilsko
00050000-5565-617b-69ee-5fc1c75ae35e	4224	Gorenja vas
00050000-5565-617b-f87f-c86c6026e439	3263	Gorica pri Slivnici
00050000-5565-617b-8500-0f908c861ad9	2272	Gorišnica
00050000-5565-617b-05ec-d7432a6b63ab	9250	Gornja Radgona
00050000-5565-617b-4643-81c4d3ddee7d	3342	Gornji Grad
00050000-5565-617b-d6e0-bd024afabf30	4282	Gozd Martuljek
00050000-5565-617b-70b7-f7ee0348dcae	6272	Gračišče
00050000-5565-617b-dab0-ccb9b769a9ce	9264	Grad
00050000-5565-617b-284c-e325080d670c	8332	Gradac
00050000-5565-617b-3c01-275c21c3dc34	1384	Grahovo
00050000-5565-617b-d207-bd6cd8c42c7b	5242	Grahovo ob Bači
00050000-5565-617b-7369-d28dcc32f670	5251	Grgar
00050000-5565-617b-9208-35188208025b	3302	Griže
00050000-5565-617b-b4f1-a02978b782bf	3231	Grobelno
00050000-5565-617b-d05b-6aaeac8ac274	1290	Grosuplje
00050000-5565-617b-d188-bb4b77690f04	2288	Hajdina
00050000-5565-617b-d4e2-92bc8f1ab6fa	8362	Hinje
00050000-5565-617b-691f-e55ca0dfa993	2311	Hoče
00050000-5565-617b-91b2-16905548a1ea	9205	Hodoš/Hodos
00050000-5565-617b-0e82-f0d355d92bd6	1354	Horjul
00050000-5565-617b-28d4-2abdae09e318	1372	Hotedršica
00050000-5565-617b-7647-0ec06a2b188e	1430	Hrastnik
00050000-5565-617b-0a9d-d547efbe31df	6225	Hruševje
00050000-5565-617b-554c-553c3a53d6bb	4276	Hrušica
00050000-5565-617b-00f7-d44e9ecaa1de	5280	Idrija
00050000-5565-617b-1ca7-df13231886e2	1292	Ig
00050000-5565-617b-8412-6f8e33126722	6250	Ilirska Bistrica
00050000-5565-617b-2f47-3c40eb800709	6251	Ilirska Bistrica-Trnovo
00050000-5565-617b-774d-ec276ee7d37e	1295	Ivančna Gorica
00050000-5565-617b-2fdf-c2ddd327d714	2259	Ivanjkovci
00050000-5565-617b-7dad-34e3da97d03a	1411	Izlake
00050000-5565-617b-301e-412964a81fb7	6310	Izola/Isola
00050000-5565-617b-5b9a-57da20cd8c14	2222	Jakobski Dol
00050000-5565-617b-18da-283a28bd7b63	2221	Jarenina
00050000-5565-617b-4de3-9b92a062d8bb	6254	Jelšane
00050000-5565-617b-b9ba-856bed9f1ef0	4270	Jesenice
00050000-5565-617b-0f24-6c17e8ce99ad	8261	Jesenice na Dolenjskem
00050000-5565-617b-e964-10fb366bfd1a	3273	Jurklošter
00050000-5565-617b-81ad-fcc57ef777e8	2223	Jurovski Dol
00050000-5565-617b-beb7-dc9a559fcb5f	2256	Juršinci
00050000-5565-617b-d8a0-af020f43e17c	5214	Kal nad Kanalom
00050000-5565-617b-9ba8-77d87eeeba04	3233	Kalobje
00050000-5565-617b-630c-6e03a58a38b6	4246	Kamna Gorica
00050000-5565-617b-3ded-86c78a95995f	2351	Kamnica
00050000-5565-617b-0e9a-b80b76f14a3d	1241	Kamnik
00050000-5565-617b-1958-3b620fa8160c	5213	Kanal
00050000-5565-617b-19eb-4e4c71a7bb65	8258	Kapele
00050000-5565-617b-ae8f-c0cd7f3a6a6d	2362	Kapla
00050000-5565-617b-6089-019aed16a64d	2325	Kidričevo
00050000-5565-617b-2155-473cef996ee1	1412	Kisovec
00050000-5565-617b-057c-cf403a98d36e	6253	Knežak
00050000-5565-617b-2ed0-99b5297a9f0b	5222	Kobarid
00050000-5565-617b-fc50-d5c1b89de0a1	9227	Kobilje
00050000-5565-617b-4264-a9534a550b65	1330	Kočevje
00050000-5565-617b-3ff8-4f6c7d1f90f2	1338	Kočevska Reka
00050000-5565-617b-fd41-4020545015bc	2276	Kog
00050000-5565-617b-1be0-b1dcb17e3ee8	5211	Kojsko
00050000-5565-617b-2a11-1969a9e82065	6223	Komen
00050000-5565-617b-883b-14336acef048	1218	Komenda
00050000-5565-617b-932c-f229626ca39b	6000	Koper/Capodistria 
00050000-5565-617b-eee7-d4da09cf615e	6001	Koper/Capodistria - poštni predali
00050000-5565-617b-77d9-c0d78adb7bb9	8282	Koprivnica
00050000-5565-617b-91fb-6fc7325a576f	5296	Kostanjevica na Krasu
00050000-5565-617b-2c3b-5cd18f9199a8	8311	Kostanjevica na Krki
00050000-5565-617b-197f-1b90924572c7	1336	Kostel
00050000-5565-617b-0ffc-a693102a540c	6256	Košana
00050000-5565-617b-64f1-d3f74ee2e907	2394	Kotlje
00050000-5565-617b-0425-5751d5aa888a	6240	Kozina
00050000-5565-617b-3a97-228c02114e54	3260	Kozje
00050000-5565-617b-4213-4d1bf2db090a	4000	Kranj 
00050000-5565-617b-3601-f38cb0368b04	4001	Kranj - poštni predali
00050000-5565-617b-5214-9709ec08a54a	4280	Kranjska Gora
00050000-5565-617b-9112-b6550e7e1d5b	1281	Kresnice
00050000-5565-617b-6127-52da776de4b5	4294	Križe
00050000-5565-617b-b046-e9decb6ce4c2	9206	Križevci
00050000-5565-617b-c302-9fca51b592f1	9242	Križevci pri Ljutomeru
00050000-5565-617b-b204-bc63b9e8d3f4	1301	Krka
00050000-5565-617b-b166-1f0b30babb92	8296	Krmelj
00050000-5565-617b-53bc-5d47d44a41c4	4245	Kropa
00050000-5565-617b-0c9c-af5ce68d52b3	8262	Krška vas
00050000-5565-617b-1685-3117e0874aae	8270	Krško
00050000-5565-617b-f23f-84b92d375995	9263	Kuzma
00050000-5565-617b-9d36-b6fe8da6a2e8	2318	Laporje
00050000-5565-617b-b38b-6fd9ae909105	3270	Laško
00050000-5565-617b-c324-e69cdc8dd627	1219	Laze v Tuhinju
00050000-5565-617b-c662-eb57bde4e8c4	2230	Lenart v Slovenskih goricah
00050000-5565-617b-6df3-c5daa3d9b0b3	9220	Lendava/Lendva
00050000-5565-617b-41ea-4029c27a7f2d	4248	Lesce
00050000-5565-617b-6f3a-7b17f06d57c9	3261	Lesično
00050000-5565-617b-7c9f-7cdd305dec07	8273	Leskovec pri Krškem
00050000-5565-617b-9cc6-3b7cfccfeb14	2372	Libeliče
00050000-5565-617b-00d3-cb4056e82b80	2341	Limbuš
00050000-5565-617b-3861-96628a04c34b	1270	Litija
00050000-5565-617b-bbb9-7354f9bf483b	3202	Ljubečna
00050000-5565-617b-60a2-89d675e10aa6	1000	Ljubljana 
00050000-5565-617b-8b7c-d82e7f7b2bd6	1001	Ljubljana - poštni predali
00050000-5565-617b-3d95-bb1e08683941	1231	Ljubljana - Črnuče
00050000-5565-617b-3dfa-f9782e99ab88	1261	Ljubljana - Dobrunje
00050000-5565-617b-cc9c-c81899ada7c4	1260	Ljubljana - Polje
00050000-5565-617b-7420-4f9fe3db9671	1210	Ljubljana - Šentvid
00050000-5565-617b-ed20-c3d50a2358ba	1211	Ljubljana - Šmartno
00050000-5565-617b-d9f3-aee91db8086f	3333	Ljubno ob Savinji
00050000-5565-617b-7cac-fa1234fa8f25	9240	Ljutomer
00050000-5565-617b-bfd2-74ddc3ae0f2e	3215	Loče
00050000-5565-617b-f168-5c0624f9a8b8	5231	Log pod Mangartom
00050000-5565-617b-ab80-8714cbbc4190	1358	Log pri Brezovici
00050000-5565-617b-f515-b1be2d0c6349	1370	Logatec
00050000-5565-617b-07f6-bb7514e77dca	1371	Logatec
00050000-5565-617b-57ee-b5d0f9df58cb	1434	Loka pri Zidanem Mostu
00050000-5565-617b-47b4-e969cef92dc8	3223	Loka pri Žusmu
00050000-5565-617b-4a57-1561c8a88131	6219	Lokev
00050000-5565-617b-786d-198eae475af1	1318	Loški Potok
00050000-5565-617b-7b43-a81f5772d9ed	2324	Lovrenc na Dravskem polju
00050000-5565-617b-cd48-4f3825ea3cba	2344	Lovrenc na Pohorju
00050000-5565-617b-bfbe-d559045aa33b	3334	Luče
00050000-5565-617b-09cc-df6f1f8358c9	1225	Lukovica
00050000-5565-617b-8f3c-69617b139aac	9202	Mačkovci
00050000-5565-617b-5bd8-9ac1277bf9b3	2322	Majšperk
00050000-5565-617b-f5fd-0607b4d09174	2321	Makole
00050000-5565-617b-ecee-e6e900c82786	9243	Mala Nedelja
00050000-5565-617b-3b56-606549e01759	2229	Malečnik
00050000-5565-617b-1f2b-d39877edee86	6273	Marezige
00050000-5565-617b-3fd7-963a2d1b8671	2000	Maribor 
00050000-5565-617b-3d4d-42e878dbc8df	2001	Maribor - poštni predali
00050000-5565-617b-df59-93048e095e41	2206	Marjeta na Dravskem polju
00050000-5565-617b-511d-69a737602099	2281	Markovci
00050000-5565-617b-bbde-cacfe7360fad	9221	Martjanci
00050000-5565-617b-19d8-8f398957a251	6242	Materija
00050000-5565-617b-4a79-d68a552463b5	4211	Mavčiče
00050000-5565-617b-04e9-e98710d330ea	1215	Medvode
00050000-5565-617b-046f-3e953c3a2a1d	1234	Mengeš
00050000-5565-617b-2e6b-b47223eb38d9	8330	Metlika
00050000-5565-617b-7c33-bb37a3a3fe89	2392	Mežica
00050000-5565-617b-1161-97a8899f06f0	2204	Miklavž na Dravskem polju
00050000-5565-617b-c7f6-3ad7cf403212	2275	Miklavž pri Ormožu
00050000-5565-617b-ce1a-f6e2729b2d51	5291	Miren
00050000-5565-617b-ac9c-fad9a2f4f1c9	8233	Mirna
00050000-5565-617b-8ede-20e779e1517d	8216	Mirna Peč
00050000-5565-617b-a6ea-cba9d34425e9	2382	Mislinja
00050000-5565-617b-1a8d-0c5200162cef	4281	Mojstrana
00050000-5565-617b-8ce0-255ca0a4fa66	8230	Mokronog
00050000-5565-617b-9864-98840c8da2be	1251	Moravče
00050000-5565-617b-fbde-ffbee9979486	9226	Moravske Toplice
00050000-5565-617b-1037-bc071e435046	5216	Most na Soči
00050000-5565-617b-a73d-5d89d7d78306	1221	Motnik
00050000-5565-617b-203d-392557bb03b4	3330	Mozirje
00050000-5565-617b-b30d-52bafc7c6899	9000	Murska Sobota 
00050000-5565-617b-3213-67cf15ea2216	9001	Murska Sobota - poštni predali
00050000-5565-617b-1e77-75961069a2f1	2366	Muta
00050000-5565-617b-d4f5-7fee25109649	4202	Naklo
00050000-5565-617b-dfa9-fb66f54845a6	3331	Nazarje
00050000-5565-617b-98ef-907a075ab8fd	1357	Notranje Gorice
00050000-5565-617b-aada-5a9fff128218	3203	Nova Cerkev
00050000-5565-617b-4e9e-9aa2413aaaf9	5000	Nova Gorica 
00050000-5565-617b-f99d-32066c9c4c59	5001	Nova Gorica - poštni predali
00050000-5565-617b-6dc5-62b3fb66e623	1385	Nova vas
00050000-5565-617b-d653-5a6fd7fae045	8000	Novo mesto
00050000-5565-617b-4873-f51c5aaecd7e	8001	Novo mesto - poštni predali
00050000-5565-617b-1d04-ab79e9fb95d6	6243	Obrov
00050000-5565-617b-811f-5c89a90fe307	9233	Odranci
00050000-5565-617b-e7f3-b975842fcef4	2317	Oplotnica
00050000-5565-617b-372a-53fbd37d9707	2312	Orehova vas
00050000-5565-617b-0c68-e3d3e74d1c13	2270	Ormož
00050000-5565-617b-34c8-e6e4de8f5827	1316	Ortnek
00050000-5565-617b-8816-97aba0f1ca4d	1337	Osilnica
00050000-5565-617b-1997-2e3f99464320	8222	Otočec
00050000-5565-617b-3755-c9c9226a0def	2361	Ožbalt
00050000-5565-617b-cd0a-9e3d2bb44f88	2231	Pernica
00050000-5565-617b-d1f1-37fe0add9fb7	2211	Pesnica pri Mariboru
00050000-5565-617b-e2ca-a2f037bac01b	9203	Petrovci
00050000-5565-617b-dd38-83f0c4fd879b	3301	Petrovče
00050000-5565-617b-9cf5-0fdae195e0fe	6330	Piran/Pirano
00050000-5565-617b-6b81-48e3c19aee96	8255	Pišece
00050000-5565-617b-a60f-adf16c9d9af2	6257	Pivka
00050000-5565-617b-e433-b87b7e6aa00d	6232	Planina
00050000-5565-617b-d320-b7b0879f4777	3225	Planina pri Sevnici
00050000-5565-617b-2681-ac0b3eaa1bcf	6276	Pobegi
00050000-5565-617b-dae7-66fd9386f027	8312	Podbočje
00050000-5565-617b-7a82-a46ec46574ef	5243	Podbrdo
00050000-5565-617b-5f9c-f40a658ba286	3254	Podčetrtek
00050000-5565-617b-6c69-906e98d36405	2273	Podgorci
00050000-5565-617b-e36b-d76b28310adb	6216	Podgorje
00050000-5565-617b-1db1-d245db72e6c3	2381	Podgorje pri Slovenj Gradcu
00050000-5565-617b-1d81-efb47e75c6ce	6244	Podgrad
00050000-5565-617b-7a1a-ee93548a97d9	1414	Podkum
00050000-5565-617b-ef22-eb1c8012880b	2286	Podlehnik
00050000-5565-617b-0303-dac5f92a339a	5272	Podnanos
00050000-5565-617b-1163-5d3eac88fcd6	4244	Podnart
00050000-5565-617b-1b7e-b4741d5a4eb9	3241	Podplat
00050000-5565-617b-8035-a6cdcf0af666	3257	Podsreda
00050000-5565-617b-7c35-c270b8f79648	2363	Podvelka
00050000-5565-617b-168f-7f38ef5b9b0b	2208	Pohorje
00050000-5565-617b-eb8c-dbafd5a339c6	2257	Polenšak
00050000-5565-617b-497b-0b95079d9fb5	1355	Polhov Gradec
00050000-5565-617b-0d89-ebe5c550cff6	4223	Poljane nad Škofjo Loko
00050000-5565-617b-53c3-1703d46c24f1	2319	Poljčane
00050000-5565-617b-336c-929b98ab4e2d	1272	Polšnik
00050000-5565-617b-469e-9a71d03106d1	3313	Polzela
00050000-5565-617b-1c11-d18365cb0572	3232	Ponikva
00050000-5565-617b-a2fa-566436c630c9	6320	Portorož/Portorose
00050000-5565-617b-10bc-7835bf3b72d1	6230	Postojna
00050000-5565-617b-c416-a1e64a731c0b	2331	Pragersko
00050000-5565-617b-5eb0-5f69bb234676	3312	Prebold
00050000-5565-617b-cd98-187475c07a50	4205	Preddvor
00050000-5565-617b-f810-e35423895cb1	6255	Prem
00050000-5565-617b-0c47-353e4052bacc	1352	Preserje
00050000-5565-617b-bc44-849d87f6568a	6258	Prestranek
00050000-5565-617b-6fe7-ccc2e82162ea	2391	Prevalje
00050000-5565-617b-fb8d-3c41549b9307	3262	Prevorje
00050000-5565-617b-dd2d-461afbf4fa7a	1276	Primskovo 
00050000-5565-617b-99b9-361043ef64fe	3253	Pristava pri Mestinju
00050000-5565-617b-8f5e-8d97a07ee63a	9207	Prosenjakovci/Partosfalva
00050000-5565-617b-7cc2-2554fee71335	5297	Prvačina
00050000-5565-617b-1f6f-9c3ac490648b	2250	Ptuj
00050000-5565-617b-fdca-bb6edbccfe1a	2323	Ptujska Gora
00050000-5565-617b-6082-79af875ac128	9201	Puconci
00050000-5565-617b-54ca-7bb8c70ac02e	2327	Rače
00050000-5565-617b-640c-a8e522b1179f	1433	Radeče
00050000-5565-617b-0d24-eccd590f2e0f	9252	Radenci
00050000-5565-617b-f9ca-2de5b331553e	2360	Radlje ob Dravi
00050000-5565-617b-59ee-41591af16fb2	1235	Radomlje
00050000-5565-617b-a6a3-8b0ed9314feb	4240	Radovljica
00050000-5565-617b-9169-dfaafbfb21be	8274	Raka
00050000-5565-617b-25aa-b428601d9cf3	1381	Rakek
00050000-5565-617b-de5f-231689cb1e0c	4283	Rateče - Planica
00050000-5565-617b-64d5-d96734315fcd	2390	Ravne na Koroškem
00050000-5565-617b-da7f-5fccfb2377b0	9246	Razkrižje
00050000-5565-617b-cc76-7a71c2204830	3332	Rečica ob Savinji
00050000-5565-617b-77f3-571230ca62ec	5292	Renče
00050000-5565-617b-058c-5343641c068f	1310	Ribnica
00050000-5565-617b-93a9-3225cda18003	2364	Ribnica na Pohorju
00050000-5565-617b-51fe-c9ce81874ae7	3272	Rimske Toplice
00050000-5565-617b-378d-6cebe23d49a9	1314	Rob
00050000-5565-617b-84c4-df8b4ab20712	5215	Ročinj
00050000-5565-617b-b5cf-5bb31d160cba	3250	Rogaška Slatina
00050000-5565-617b-bd7b-3f3465efde86	9262	Rogašovci
00050000-5565-617b-fc24-90c4bf8ddd31	3252	Rogatec
00050000-5565-617b-4126-f8bc60f613c0	1373	Rovte
00050000-5565-617b-c18e-11d12665f074	2342	Ruše
00050000-5565-617b-cc2b-f1c259cd5a90	1282	Sava
00050000-5565-617b-3988-67b4351749a3	6333	Sečovlje/Sicciole
00050000-5565-617b-92e1-6aaa9ad6ae01	4227	Selca
00050000-5565-617b-a0cb-1c42a7426de1	2352	Selnica ob Dravi
00050000-5565-617b-68cb-28918991b080	8333	Semič
00050000-5565-617b-509b-d1f874538988	8281	Senovo
00050000-5565-617b-805b-cd63a0f3810a	6224	Senožeče
00050000-5565-617b-c60b-4303a9d61ad0	8290	Sevnica
00050000-5565-617b-48d2-f33600259674	6210	Sežana
00050000-5565-617b-4bc6-a6e0cbc41d7f	2214	Sladki Vrh
00050000-5565-617b-a36a-f72c81a529e6	5283	Slap ob Idrijci
00050000-5565-617b-fe34-eed8b1821166	2380	Slovenj Gradec
00050000-5565-617b-a543-5854208afe69	2310	Slovenska Bistrica
00050000-5565-617b-7560-a6b91980fcd0	3210	Slovenske Konjice
00050000-5565-617b-c578-8d82695d808f	1216	Smlednik
00050000-5565-617b-40ca-1a5a37d62469	5232	Soča
00050000-5565-617b-5785-8d725a70421c	1317	Sodražica
00050000-5565-617b-6c5e-9b5e0dcbbba3	3335	Solčava
00050000-5565-617b-5e5a-102fc414b34b	5250	Solkan
00050000-5565-617b-4dca-51db4f40ef40	4229	Sorica
00050000-5565-617b-9d2e-d28d11260810	4225	Sovodenj
00050000-5565-617b-7aaa-a5eb3c3fa9df	5281	Spodnja Idrija
00050000-5565-617b-475c-3909aaf3c314	2241	Spodnji Duplek
00050000-5565-617b-6b63-415bf7937946	9245	Spodnji Ivanjci
00050000-5565-617b-927b-c86c735bd3d7	2277	Središče ob Dravi
00050000-5565-617b-c29c-77a7476518fc	4267	Srednja vas v Bohinju
00050000-5565-617b-48f5-831df1941803	8256	Sromlje 
00050000-5565-617b-9184-7973c1790695	5224	Srpenica
00050000-5565-617b-e217-e98238944e90	1242	Stahovica
00050000-5565-617b-7119-47893723bf4f	1332	Stara Cerkev
00050000-5565-617b-97da-15b7ba7048c4	8342	Stari trg ob Kolpi
00050000-5565-617b-1e4b-80880cfdb8f1	1386	Stari trg pri Ložu
00050000-5565-617b-d6dd-1c981e58b608	2205	Starše
00050000-5565-617b-276f-e8af2324506a	2289	Stoperce
00050000-5565-617b-d2d0-66407bdef979	8322	Stopiče
00050000-5565-617b-56aa-ea313a2f1816	3206	Stranice
00050000-5565-617b-8f3a-3c8baa4f368c	8351	Straža
00050000-5565-617b-0ef9-0a66526158f3	1313	Struge
00050000-5565-617b-aa35-e2a674549f3d	8293	Studenec
00050000-5565-617b-a682-2cd03708db14	8331	Suhor
00050000-5565-617b-396c-e54df1069634	2233	Sv. Ana v Slovenskih goricah
00050000-5565-617b-a025-856285bf2fe5	2235	Sv. Trojica v Slovenskih goricah
00050000-5565-617b-218a-7bae15525be1	2353	Sveti Duh na Ostrem Vrhu
00050000-5565-617b-525e-a28bc1e0baa6	9244	Sveti Jurij ob Ščavnici
00050000-5565-617b-04d1-bcb49487b0d1	3264	Sveti Štefan
00050000-5565-617b-1123-f0fa26af70c0	2258	Sveti Tomaž
00050000-5565-617b-67ca-bb57d19206d0	9204	Šalovci
00050000-5565-617b-3f54-00a1c87efa5a	5261	Šempas
00050000-5565-617b-cb52-05816a98216e	5290	Šempeter pri Gorici
00050000-5565-617b-f999-bbde6f93eba9	3311	Šempeter v Savinjski dolini
00050000-5565-617b-c9b1-ea139239e7ba	4208	Šenčur
00050000-5565-617b-daf4-13d70c772b14	2212	Šentilj v Slovenskih goricah
00050000-5565-617b-c528-f853986af904	8297	Šentjanž
00050000-5565-617b-5b71-43893a06f38a	2373	Šentjanž pri Dravogradu
00050000-5565-617b-59f1-08cad8fcc4b3	8310	Šentjernej
00050000-5565-617b-4d8f-eb1b0a6981d4	3230	Šentjur
00050000-5565-617b-1aef-1f201ffc5a40	3271	Šentrupert
00050000-5565-617b-fa36-ac5647c40161	8232	Šentrupert
00050000-5565-617b-bde4-f0bed500fc8c	1296	Šentvid pri Stični
00050000-5565-617b-b4b5-ae48e41425db	8275	Škocjan
00050000-5565-617b-1cba-a0edd2089400	6281	Škofije
00050000-5565-617b-f207-6a4068e3c6ac	4220	Škofja Loka
00050000-5565-617b-bb5a-cdf59fda991e	3211	Škofja vas
00050000-5565-617b-3297-be054a3efbbb	1291	Škofljica
00050000-5565-617b-c6c2-66254450dec0	6274	Šmarje
00050000-5565-617b-465f-eed4214bc0f7	1293	Šmarje - Sap
00050000-5565-617b-24c5-4fc65d7d1d99	3240	Šmarje pri Jelšah
00050000-5565-617b-e464-a821690c07f7	8220	Šmarješke Toplice
00050000-5565-617b-b55b-8d9b2a445f2c	2315	Šmartno na Pohorju
00050000-5565-617b-9dce-8517128b2aab	3341	Šmartno ob Dreti
00050000-5565-617b-050f-d2561189347d	3327	Šmartno ob Paki
00050000-5565-617b-93ff-8344a40e07a8	1275	Šmartno pri Litiji
00050000-5565-617b-c687-8d5227937b71	2383	Šmartno pri Slovenj Gradcu
00050000-5565-617b-6e18-ba5b74adead5	3201	Šmartno v Rožni dolini
00050000-5565-617b-4d03-e7ddccae10a5	3325	Šoštanj
00050000-5565-617b-3ef8-4674a45457c9	6222	Štanjel
00050000-5565-617b-4f2c-79dce464f61f	3220	Štore
00050000-5565-617b-04b8-b2aa1bb22c0e	3304	Tabor
00050000-5565-617b-fcfb-8073d15f100b	3221	Teharje
00050000-5565-617b-95aa-99562d6bd296	9251	Tišina
00050000-5565-617b-7cba-c20b450d3cbe	5220	Tolmin
00050000-5565-617b-6159-5c2a589d99ff	3326	Topolšica
00050000-5565-617b-88ff-ee18f8032f18	2371	Trbonje
00050000-5565-617b-7493-8b2ae4e71beb	1420	Trbovlje
00050000-5565-617b-bf9c-0826ebd1a18f	8231	Trebelno 
00050000-5565-617b-1cb1-82d69fea15f4	8210	Trebnje
00050000-5565-617b-96ec-94d4d79e4a56	5252	Trnovo pri Gorici
00050000-5565-617b-246e-de63435a1450	2254	Trnovska vas
00050000-5565-617b-4ad7-10c92277bf6d	1222	Trojane
00050000-5565-617b-5593-4ae201fa2ed3	1236	Trzin
00050000-5565-617b-2a53-011e4eb3c42c	4290	Tržič
00050000-5565-617b-37e2-8f0f1bb65781	8295	Tržišče
00050000-5565-617b-e849-1325adfe21cc	1311	Turjak
00050000-5565-617b-695a-8661dcb57ce6	9224	Turnišče
00050000-5565-617b-e745-7bc2655c32bd	8323	Uršna sela
00050000-5565-617b-907f-9e8a18d882fa	1252	Vače
00050000-5565-617b-6353-a1fb21a12fea	3320	Velenje 
00050000-5565-617b-2cbc-5959f181f204	3322	Velenje - poštni predali
00050000-5565-617b-a9df-1b709c56b0e5	8212	Velika Loka
00050000-5565-617b-666b-5b15acf8f766	2274	Velika Nedelja
00050000-5565-617b-2ef4-298899a9e4ae	9225	Velika Polana
00050000-5565-617b-f324-b43ab0bdc76b	1315	Velike Lašče
00050000-5565-617b-2643-f4a7038aa1a9	8213	Veliki Gaber
00050000-5565-617b-b168-e7cecb6feb3c	9241	Veržej
00050000-5565-617b-2f34-5e9365200f5a	1312	Videm - Dobrepolje
00050000-5565-617b-5b74-1d799470fcf4	2284	Videm pri Ptuju
00050000-5565-617b-7196-84ce318cc3ff	8344	Vinica
00050000-5565-617b-39f9-ffe1d8a4c94e	5271	Vipava
00050000-5565-617b-8c67-76f84640ed2a	4212	Visoko
00050000-5565-617b-6faa-05cd23137403	1294	Višnja Gora
00050000-5565-617b-bd24-f95d95382c48	3205	Vitanje
00050000-5565-617b-5526-6037e7166ab0	2255	Vitomarci
00050000-5565-617b-b5db-d365502f5932	1217	Vodice
00050000-5565-617b-d445-c4a2c2189921	3212	Vojnik\t
00050000-5565-617b-4837-a577e5abf360	5293	Volčja Draga
00050000-5565-617b-d2e7-285d3716563d	2232	Voličina
00050000-5565-617b-f83a-81dc4bdb6b92	3305	Vransko
00050000-5565-617b-5b48-111b3a895798	6217	Vremski Britof
00050000-5565-617b-f506-dfdd1ce08a2d	1360	Vrhnika
00050000-5565-617b-e625-920d4e38d6db	2365	Vuhred
00050000-5565-617b-bcbc-1455a3ffbd31	2367	Vuzenica
00050000-5565-617b-3398-dd2c073c473f	8292	Zabukovje 
00050000-5565-617b-e136-c327c1f7130f	1410	Zagorje ob Savi
00050000-5565-617b-7186-054a1610d9b3	1303	Zagradec
00050000-5565-617b-34dd-507a00fb785a	2283	Zavrč
00050000-5565-617b-60f5-0ceedc9e8c2e	8272	Zdole 
00050000-5565-617b-36a1-d9a10ea8f490	4201	Zgornja Besnica
00050000-5565-617b-376a-6fdcd6669f80	2242	Zgornja Korena
00050000-5565-617b-fc99-1d93256b3fee	2201	Zgornja Kungota
00050000-5565-617b-4810-69c0cc2ea28e	2316	Zgornja Ložnica
00050000-5565-617b-a193-2f5157cda1e4	2314	Zgornja Polskava
00050000-5565-617b-d8f8-d483be3d7fef	2213	Zgornja Velka
00050000-5565-617b-6eb2-439a5328a983	4247	Zgornje Gorje
00050000-5565-617b-0358-4d5c8c399879	4206	Zgornje Jezersko
00050000-5565-617b-cc9b-d418609b1357	2285	Zgornji Leskovec
00050000-5565-617b-ad06-a996e0066ae2	1432	Zidani Most
00050000-5565-617b-6931-c45aa733eb83	3214	Zreče
00050000-5565-617b-86b8-426e83b7cbdf	4209	Žabnica
00050000-5565-617b-cf2c-5a620a37aa7e	3310	Žalec
00050000-5565-617b-23eb-90de13837634	4228	Železniki
00050000-5565-617b-3d44-af065940aa41	2287	Žetale
00050000-5565-617b-1d4e-3b6889c5b983	4226	Žiri
00050000-5565-617b-6d21-ccf28fd04daf	4274	Žirovnica
00050000-5565-617b-6e0d-0b2771d48e48	8360	Žužemberk
\.


--
-- TOC entry 2723 (class 0 OID 5151314)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2691 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2705 (class 0 OID 5151129)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2711 (class 0 OID 5151207)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2725 (class 0 OID 5151326)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2738 (class 0 OID 5151446)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2742 (class 0 OID 5151497)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2729 (class 0 OID 5151355)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5565-617d-a34c-f2c572a6dc64	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5565-617d-3108-e486e38e6373	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5565-617d-961c-787278746327	0003	Kazinska	t	84	Kazinska dvorana
00220000-5565-617d-4e92-71b6a11321c0	0004	Mali oder	t	24	Mali oder 
00220000-5565-617d-5fe0-c6acb5b4279f	0005	Komorni oder	t	15	Komorni oder
00220000-5565-617d-61ff-5a4028ff84d5	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5565-617d-e948-9d561158e168	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2721 (class 0 OID 5151299)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2720 (class 0 OID 5151289)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2741 (class 0 OID 5151486)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2736 (class 0 OID 5151423)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2694 (class 0 OID 5151002)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5565-617c-5bd9-35a5baa9e9cd	00010000-5565-617c-50b5-48c8646a6eb4	2015-05-27 08:17:33	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROUHmkmbWH.l3UXIbWpOgm7M76T92PJYO";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2760 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2730 (class 0 OID 5151365)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2698 (class 0 OID 5151040)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5565-617c-07c1-0f6b6271ccf0	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5565-617c-fee1-79b6f7ab6926	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5565-617c-2b47-ff63db750fde	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5565-617c-c23c-3c002eec53a0	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5565-617c-e354-338b91cdb5ad	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5565-617c-82fb-fab14d7ead8a	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2696 (class 0 OID 5151024)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5565-617c-5bd9-35a5baa9e9cd	00020000-5565-617c-c23c-3c002eec53a0
00010000-5565-617c-50b5-48c8646a6eb4	00020000-5565-617c-c23c-3c002eec53a0
\.


--
-- TOC entry 2732 (class 0 OID 5151379)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2724 (class 0 OID 5151320)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2718 (class 0 OID 5151270)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2750 (class 0 OID 5151592)
-- Dependencies: 230
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5565-617b-4853-b96a2a71fd4f	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5565-617b-9a04-bfac9a7f7619	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5565-617b-7017-6a603db94710	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5565-617b-0543-a2421dee7740	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5565-617b-40c5-11811412b49a	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2749 (class 0 OID 5151585)
-- Dependencies: 229
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5565-617b-6120-a149ddf94e06	00000000-5565-617b-0543-a2421dee7740	popa
00000000-5565-617b-3ce4-75d267754147	00000000-5565-617b-0543-a2421dee7740	oseba
00000000-5565-617b-1517-cc274147d4f6	00000000-5565-617b-9a04-bfac9a7f7619	prostor
00000000-5565-617b-215a-9e7d89340cbe	00000000-5565-617b-0543-a2421dee7740	besedilo
00000000-5565-617b-b6e7-673b1007fc57	00000000-5565-617b-0543-a2421dee7740	uprizoritev
00000000-5565-617b-2166-e3392c611968	00000000-5565-617b-0543-a2421dee7740	funkcija
00000000-5565-617b-e9ee-e9b0e65cc572	00000000-5565-617b-0543-a2421dee7740	tipfunkcije
\.


--
-- TOC entry 2748 (class 0 OID 5151580)
-- Dependencies: 228
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2737 (class 0 OID 5151433)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2761 (class 0 OID 0)
-- Dependencies: 231
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('strosekuprizoritve_id_seq', 1, false);


--
-- TOC entry 2703 (class 0 OID 5151101)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2719 (class 0 OID 5151276)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2740 (class 0 OID 5151475)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5565-617b-a6c9-78289c6e7196	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5565-617b-3f12-51d53f8a2c41	Baletnik ali plesalec	Baletniki in plesalci	\N	Baletnica ali plesalka	igralec
000f0000-5565-617b-4159-750b441c0fee	Avtor	Avtorji	\N	Avtorka	umetnik
000f0000-5565-617b-9370-94b178baf3e1	Režiser	Režiserji	\N	Režiserka	umetnik
000f0000-5565-617b-a6fa-2eff1b43153c	Scenograf	Scenografi	\N	Scenografka	tehnik
000f0000-5565-617b-05df-e9fe84719ac4	Kostumograf	Kostumografi	\N	Kostumografinja	tehnik
000f0000-5565-617b-11f8-b6df0970633f	Oblikovalec maske	Oblikovalci maske	\N	Oblikovalka maske	tehnik
000f0000-5565-617b-ff63-9747a6c760e4	Avtor glasbe	Avtorji glasbe	\N	Avtorica glasbe	umetnik
000f0000-5565-617b-f2f0-7894aa8629e3	Oblikovalec svetlobe	Oblikovalci svetlobe	\N	Oblikovalka svetlobe	tehnik
000f0000-5565-617b-5626-3f981a08c1d1	Koreograf	Koreografi	\N	Koreografinja	umetnik
000f0000-5565-617b-64e5-ece12886e58e	Dramaturg	Dramaturgi	\N	Dramaturginja	umetnik
000f0000-5565-617b-e407-96cf0ff78670	Lektorj	Lektorji	\N	Lektorica	umetnik
000f0000-5565-617b-2fa1-a3e2e8f826b8	Prevajalec	Prevajalci	\N	Prevajalka	umetnik
000f0000-5565-617b-3695-3b587f1be484	Oblikovalec videa	Oblikovalci videa	\N	Oblikovalka videa	umetnik
000f0000-5565-617b-31bd-b70088fd8f32	Intermedijski ustvarjalec	Intermedijski ustvarjalci	\N	Intermedijska ustvarjalka	umetnik
\.


--
-- TOC entry 2708 (class 0 OID 5151164)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2695 (class 0 OID 5151011)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5565-617c-50b5-48c8646a6eb4	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROpCib8zCdEkVVl6pHvmpecFQGKQ65AMi	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5565-617c-8fa7-f93ee3e50e21	Jani	$2y$05$NS4xMjkyMTcwMzExMjAxROkFGChzLwiOz03p4BKXPBrjThoWg32GG	t	\N	\N	\N	jani@ifigenija.si	\N	\N	\N
00010000-5565-617c-722e-7ca885a99403	Tona	$2y$05$NS4xMjkyMTcwMzExMjAxRO1mrhb9Hvuz9w22D7vK1eaWBhAeBE43e	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5565-617c-b7f7-19be887ec628	Ivo	$2y$05$NS4xMjkyMTcwMzExMjAxROC/Tz3Rp2A6Attfwn.MxbLW2behEoHUW	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5565-617c-ac52-a40c4ff2f978	Jože	$2y$05$NS4xMjkyMTcwMzExMjAxRO6hsMMF0Y5cleKy.T7p1r1zU7oEjHVuW	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5565-617c-bb0e-4dceab2c5262	Marko	$2y$05$NS4xMjkyMTcwMzExMjAxRO1mtDgzkwPwRdgf6vCgjQkfVoRv8jdH2	t	\N	\N	\N	marko@ifigenija.si	\N	\N	\N
00010000-5565-617c-1223-28f9213a5bd6	Marija	$2y$05$NS4xMjkyMTcwMzExMjAxROEnHjKQp9bOawW9gPttz/GenypiowfKG	t	\N	\N	\N	marija@ifigenija.si	\N	\N	\N
00010000-5565-617c-58de-319e8a88bccf	Ana	$2y$05$NS4xMjkyMTcwMzExMjAxROFxiW1VrcmaG7/UtZ8kGstDlkFrPqowu	t	\N	\N	\N	ana@ifigenija.si	\N	\N	\N
00010000-5565-617c-3b94-a46ea95d13a6	Maja	$2y$05$NS4xMjkyMTcwMzExMjAxROrkm39hHMPxaoFrhUdShz9EUhQjyrsnG	t	\N	\N	\N	maja@ifigenija.si	\N	\N	\N
00010000-5565-617c-bdfa-4f27f8072364	Irena	$2y$05$NS4xMjkyMTcwMzExMjAxROiDNrybK0tBUvWx2wKz..hLPfu07R5eG	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5565-617c-1887-3d07d2432c91	Mojca	$2y$05$NS4xMjkyMTcwMzExMjAxROYAyNAyg3cw8Z16ANcpzEG2SHso8uiGW	t	\N	\N	\N	mojca@ifigenija.si	\N	\N	\N
00010000-5565-617c-5bd9-35a5baa9e9cd	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2745 (class 0 OID 5151530)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5565-617d-3b8a-1eef72333c03	00160000-5565-617d-77f4-886e1e48180e	00150000-5565-617b-e991-a6c87e39e5b6	00140000-5565-617b-aad3-723ec3985e65	produkcija	Sen kresne noči		Sanje	2016-02-01	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5565-617d-5fe0-c6acb5b4279f
000e0000-5565-617d-6d30-c256c6aa6a14	00160000-5565-617d-9245-b940d13a76e6	00150000-5565-617b-1d88-d290cd9a2e03	00140000-5565-617b-78e1-332564a6d02a	predprodukcija-ideja	Smoletov vrt			2017-01-01	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5565-617d-61ff-5a4028ff84d5
\.


--
-- TOC entry 2713 (class 0 OID 5151222)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2728 (class 0 OID 5151347)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2735 (class 0 OID 5151415)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2715 (class 0 OID 5151254)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2744 (class 0 OID 5151520)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-5565-617b-aad3-723ec3985e65	Drama	drama (SURS 01)
00140000-5565-617b-b15a-b65bacbe394f	Opera	opera (SURS 02)
00140000-5565-617b-5203-800c07ad008f	Balet	balet (SURS 03)
00140000-5565-617b-49dd-a6bf4e29bc56	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5565-617b-9ab2-6693e0b071fe	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5565-617b-78e1-332564a6d02a	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5565-617b-1b74-6b59aceeadfb	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2734 (class 0 OID 5151405)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-5565-617b-cfe2-1e5d57d5abc7	Opera	opera
00150000-5565-617b-6104-95832f54285e	Opereta	opereta
00150000-5565-617b-f0de-05b119c0834a	Balet	balet
00150000-5565-617b-104f-bd2e129935c7	Plesne prireditve	plesne prireditve
00150000-5565-617b-d68a-734435746456	Lutkovno gledališče	lutkovno gledališče
00150000-5565-617b-54e9-5263a15a671d	Raziskovalno gledališče	raziskovalno gledališče
00150000-5565-617b-b99f-79a3c871e3b4	Biografska drama	biografska drama
00150000-5565-617b-e991-a6c87e39e5b6	Komedija	komedija
00150000-5565-617b-c08c-7f13150b4da3	Črna komedija	črna komedija
00150000-5565-617b-94db-5c518c5a6d5d	E-igra	E-igra
00150000-5565-617b-1d88-d290cd9a2e03	Kriminalka	kriminalka
00150000-5565-617b-be65-a1e625375cd5	Musical	musical
\.


--
-- TOC entry 2315 (class 2606 OID 5151065)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 5151574)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 5151564)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 5151474)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 5151244)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 5151269)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 5151190)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 5151401)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 5151220)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 5151263)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 5151204)
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
-- TOC entry 2407 (class 2606 OID 5151312)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 5151339)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 5151162)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 5151074)
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
-- TOC entry 2322 (class 2606 OID 5151097)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2313 (class 2606 OID 5151054)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2306 (class 2606 OID 5151039)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 5151345)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 5151378)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 5151515)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2331 (class 2606 OID 5151126)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 5151150)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 5151318)
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
-- TOC entry 2337 (class 2606 OID 5151140)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 5151211)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 5151330)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 5151458)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 5151502)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 5151362)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 5151303)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 5151294)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 5151496)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 5151430)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 5151010)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 5151369)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 5151028)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2308 (class 2606 OID 5151048)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 5151387)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 5151325)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 5151275)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 5151598)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 5151589)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 5151584)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 5151443)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 5151106)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 5151285)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 5151485)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 5151175)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 5151023)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 5151545)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 5151229)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 5151353)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 5151421)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 5151258)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 5151529)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 5151414)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 1259 OID 5151251)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2454 (class 1259 OID 5151444)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2455 (class 1259 OID 5151445)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2329 (class 1259 OID 5151128)
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
-- TOC entry 2420 (class 1259 OID 5151346)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2414 (class 1259 OID 5151332)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2415 (class 1259 OID 5151331)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2366 (class 1259 OID 5151230)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2442 (class 1259 OID 5151404)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2443 (class 1259 OID 5151402)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2444 (class 1259 OID 5151403)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2354 (class 1259 OID 5151206)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2355 (class 1259 OID 5151205)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2471 (class 1259 OID 5151517)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2472 (class 1259 OID 5151518)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2473 (class 1259 OID 5151519)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2479 (class 1259 OID 5151549)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2480 (class 1259 OID 5151546)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2481 (class 1259 OID 5151548)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2482 (class 1259 OID 5151547)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2344 (class 1259 OID 5151177)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2345 (class 1259 OID 5151176)
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
-- TOC entry 2320 (class 1259 OID 5151100)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2430 (class 1259 OID 5151370)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2384 (class 1259 OID 5151264)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2310 (class 1259 OID 5151055)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2311 (class 1259 OID 5151056)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2435 (class 1259 OID 5151390)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2436 (class 1259 OID 5151389)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2437 (class 1259 OID 5151388)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2358 (class 1259 OID 5151212)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2359 (class 1259 OID 5151214)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2360 (class 1259 OID 5151213)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2498 (class 1259 OID 5151591)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2394 (class 1259 OID 5151298)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2395 (class 1259 OID 5151296)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2396 (class 1259 OID 5151295)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2397 (class 1259 OID 5151297)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2301 (class 1259 OID 5151029)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 5151030)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2423 (class 1259 OID 5151354)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2409 (class 1259 OID 5151319)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2450 (class 1259 OID 5151431)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2451 (class 1259 OID 5151432)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2333 (class 1259 OID 5151142)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2334 (class 1259 OID 5151141)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2335 (class 1259 OID 5151143)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2458 (class 1259 OID 5151459)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2459 (class 1259 OID 5151460)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2491 (class 1259 OID 5151577)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2492 (class 1259 OID 5151576)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2493 (class 1259 OID 5151579)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2494 (class 1259 OID 5151575)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2495 (class 1259 OID 5151578)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2447 (class 1259 OID 5151422)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2400 (class 1259 OID 5151307)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2401 (class 1259 OID 5151306)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2402 (class 1259 OID 5151304)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2403 (class 1259 OID 5151305)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2284 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2487 (class 1259 OID 5151566)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2488 (class 1259 OID 5151565)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2365 (class 1259 OID 5151221)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2316 (class 1259 OID 5151076)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2317 (class 1259 OID 5151075)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2325 (class 1259 OID 5151107)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2326 (class 1259 OID 5151108)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2389 (class 1259 OID 5151288)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2390 (class 1259 OID 5151287)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2391 (class 1259 OID 5151286)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2372 (class 1259 OID 5151253)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2373 (class 1259 OID 5151249)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2374 (class 1259 OID 5151246)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2375 (class 1259 OID 5151247)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2376 (class 1259 OID 5151245)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2377 (class 1259 OID 5151250)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2378 (class 1259 OID 5151248)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2332 (class 1259 OID 5151127)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2350 (class 1259 OID 5151191)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2351 (class 1259 OID 5151193)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2352 (class 1259 OID 5151192)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2353 (class 1259 OID 5151194)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2408 (class 1259 OID 5151313)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2476 (class 1259 OID 5151516)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2323 (class 1259 OID 5151098)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2324 (class 1259 OID 5151099)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2504 (class 1259 OID 5151599)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2343 (class 1259 OID 5151163)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2501 (class 1259 OID 5151590)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2428 (class 1259 OID 5151364)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2429 (class 1259 OID 5151363)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2287 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2340 (class 1259 OID 5151151)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 5151503)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2309 (class 1259 OID 5151049)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2379 (class 1259 OID 5151252)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2530 (class 2606 OID 5151737)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2533 (class 2606 OID 5151722)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2532 (class 2606 OID 5151727)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2528 (class 2606 OID 5151747)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2534 (class 2606 OID 5151717)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2529 (class 2606 OID 5151742)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2531 (class 2606 OID 5151732)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2564 (class 2606 OID 5151892)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2563 (class 2606 OID 5151897)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2515 (class 2606 OID 5151652)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2551 (class 2606 OID 5151832)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2549 (class 2606 OID 5151827)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2550 (class 2606 OID 5151822)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2527 (class 2606 OID 5151712)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2557 (class 2606 OID 5151872)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2559 (class 2606 OID 5151862)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2558 (class 2606 OID 5151867)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2521 (class 2606 OID 5151687)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2522 (class 2606 OID 5151682)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2547 (class 2606 OID 5151812)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2570 (class 2606 OID 5151917)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2569 (class 2606 OID 5151922)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2568 (class 2606 OID 5151927)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2571 (class 2606 OID 5151947)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2574 (class 2606 OID 5151932)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2572 (class 2606 OID 5151942)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2573 (class 2606 OID 5151937)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2519 (class 2606 OID 5151677)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2520 (class 2606 OID 5151672)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2511 (class 2606 OID 5151637)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2512 (class 2606 OID 5151632)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2553 (class 2606 OID 5151842)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2535 (class 2606 OID 5151752)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2508 (class 2606 OID 5151612)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2507 (class 2606 OID 5151617)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2554 (class 2606 OID 5151857)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2555 (class 2606 OID 5151852)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2556 (class 2606 OID 5151847)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2525 (class 2606 OID 5151692)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2523 (class 2606 OID 5151702)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2524 (class 2606 OID 5151697)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2582 (class 2606 OID 5151987)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2539 (class 2606 OID 5151787)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2541 (class 2606 OID 5151777)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2542 (class 2606 OID 5151772)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2540 (class 2606 OID 5151782)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2506 (class 2606 OID 5151602)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2505 (class 2606 OID 5151607)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2552 (class 2606 OID 5151837)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2548 (class 2606 OID 5151817)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2562 (class 2606 OID 5151882)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2561 (class 2606 OID 5151887)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2517 (class 2606 OID 5151662)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 5151657)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2516 (class 2606 OID 5151667)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2566 (class 2606 OID 5151902)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2565 (class 2606 OID 5151907)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2579 (class 2606 OID 5151972)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2580 (class 2606 OID 5151967)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2577 (class 2606 OID 5151982)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2581 (class 2606 OID 5151962)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2578 (class 2606 OID 5151977)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2560 (class 2606 OID 5151877)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2543 (class 2606 OID 5151807)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2544 (class 2606 OID 5151802)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2546 (class 2606 OID 5151792)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2545 (class 2606 OID 5151797)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2575 (class 2606 OID 5151957)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2576 (class 2606 OID 5151952)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2526 (class 2606 OID 5151707)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2567 (class 2606 OID 5151912)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 5151627)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2510 (class 2606 OID 5151622)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2514 (class 2606 OID 5151642)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2513 (class 2606 OID 5151647)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2536 (class 2606 OID 5151767)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2537 (class 2606 OID 5151762)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2538 (class 2606 OID 5151757)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-27 08:17:33 CEST

--
-- PostgreSQL database dump complete
--

