--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-26 15:59:07 CEST

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
-- TOC entry 180 (class 1259 OID 5136188)
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
-- TOC entry 227 (class 1259 OID 5136698)
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
-- TOC entry 226 (class 1259 OID 5136681)
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
-- TOC entry 219 (class 1259 OID 5136592)
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
-- TOC entry 194 (class 1259 OID 5136362)
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
-- TOC entry 197 (class 1259 OID 5136396)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 5136309)
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
-- TOC entry 213 (class 1259 OID 5136522)
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
-- TOC entry 192 (class 1259 OID 5136346)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 196 (class 1259 OID 5136390)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 5136326)
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
-- TOC entry 202 (class 1259 OID 5136439)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 5136464)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 5136283)
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
-- TOC entry 181 (class 1259 OID 5136197)
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
-- TOC entry 182 (class 1259 OID 5136208)
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
-- TOC entry 177 (class 1259 OID 5136162)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 5136181)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 5136471)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 5136502)
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
-- TOC entry 223 (class 1259 OID 5136635)
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
-- TOC entry 184 (class 1259 OID 5136240)
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
-- TOC entry 186 (class 1259 OID 5136275)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 5136445)
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
-- TOC entry 185 (class 1259 OID 5136260)
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
-- TOC entry 191 (class 1259 OID 5136338)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 5136457)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 5136577)
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
-- TOC entry 222 (class 1259 OID 5136628)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 5136486)
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
-- TOC entry 201 (class 1259 OID 5136430)
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
-- TOC entry 200 (class 1259 OID 5136420)
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
-- TOC entry 221 (class 1259 OID 5136617)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 5136554)
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
-- TOC entry 174 (class 1259 OID 5136133)
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
-- TOC entry 173 (class 1259 OID 5136131)
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
-- TOC entry 210 (class 1259 OID 5136496)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 5136171)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 5136155)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 5136510)
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
-- TOC entry 204 (class 1259 OID 5136451)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 5136401)
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
-- TOC entry 230 (class 1259 OID 5136723)
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
-- TOC entry 229 (class 1259 OID 5136716)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 5136711)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 5136564)
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
-- TOC entry 231 (class 1259 OID 5136731)
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE strosekuprizoritve_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 183 (class 1259 OID 5136232)
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
-- TOC entry 199 (class 1259 OID 5136407)
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
-- TOC entry 220 (class 1259 OID 5136606)
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
-- TOC entry 188 (class 1259 OID 5136295)
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
-- TOC entry 175 (class 1259 OID 5136142)
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
-- TOC entry 225 (class 1259 OID 5136661)
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
-- TOC entry 193 (class 1259 OID 5136353)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 5136478)
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
-- TOC entry 215 (class 1259 OID 5136546)
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
-- TOC entry 195 (class 1259 OID 5136385)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 5136651)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 5136536)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2146 (class 2604 OID 5136136)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2700 (class 0 OID 5136188)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2747 (class 0 OID 5136698)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
\.


--
-- TOC entry 2746 (class 0 OID 5136681)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2739 (class 0 OID 5136592)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-5564-7c2b-e94a-5f6ac6767208	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-5564-7c2b-9993-47ddc81a805b	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-5564-7c2b-43fb-483be925156d	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 2714 (class 0 OID 5136362)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2717 (class 0 OID 5136396)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2709 (class 0 OID 5136309)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5564-7c2a-d1e7-0e1fa6a3ad9c	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5564-7c2a-f8fd-2a4ed4d01fb0	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5564-7c2a-770a-802749b8f814	AL	ALB	008	Albania 	Albanija	\N
00040000-5564-7c2a-d294-787bfd67000e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5564-7c2a-b0be-8faed93078e4	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5564-7c2a-f468-b1aa9f2aee81	AD	AND	020	Andorra 	Andora	\N
00040000-5564-7c2a-2e95-16e912cf5ca1	AO	AGO	024	Angola 	Angola	\N
00040000-5564-7c2a-ac0d-9064629d0921	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5564-7c2a-cfdf-70c3d56d8e4c	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5564-7c2a-7403-dde25e22ecd9	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5564-7c2a-7189-0153f47a5719	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5564-7c2a-bf75-03624481c6c6	AM	ARM	051	Armenia 	Armenija	\N
00040000-5564-7c2a-5087-ffd58ee4ec23	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5564-7c2a-0621-74f353d4b24d	AU	AUS	036	Australia 	Avstralija	\N
00040000-5564-7c2a-7f00-6727572ffff1	AT	AUT	040	Austria 	Avstrija	\N
00040000-5564-7c2a-d3c2-b074e6ac4dc6	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5564-7c2a-9472-865950d28b58	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5564-7c2a-40e1-0313e036da70	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5564-7c2a-bec8-c9ae19b4265e	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5564-7c2a-ac34-7b0f6fab26db	BB	BRB	052	Barbados 	Barbados	\N
00040000-5564-7c2a-aaff-95eb7b86a1e1	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5564-7c2a-3115-406f683b55b8	BE	BEL	056	Belgium 	Belgija	\N
00040000-5564-7c2a-108e-8816608201fe	BZ	BLZ	084	Belize 	Belize	\N
00040000-5564-7c2a-76bc-abb97b8eb7ff	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5564-7c2a-f671-d98e99a5d091	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5564-7c2a-53c7-9b154a116e5b	BT	BTN	064	Bhutan 	Butan	\N
00040000-5564-7c2a-d8bc-207ba198f5c6	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5564-7c2a-6efa-b48ebecdb923	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5564-7c2a-2895-cb8eaad0865b	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5564-7c2a-82c9-745dc1b1f140	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5564-7c2a-726d-f2fe52cfcc28	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5564-7c2a-1ef9-e7253d145c74	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5564-7c2a-b4a9-7e5612288280	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5564-7c2a-76c6-38a721e11457	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5564-7c2a-96e5-76449c290277	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5564-7c2a-1c83-04814d75a863	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5564-7c2a-d657-0d1ab90c6308	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5564-7c2a-8ba5-6dbfa7c6f626	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5564-7c2a-b93e-58f4d55f3b56	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5564-7c2a-f10f-cb9abefd39de	CA	CAN	124	Canada 	Kanada	\N
00040000-5564-7c2a-081d-1140756b78fe	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5564-7c2a-8723-03b99faf29f8	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5564-7c2a-e3e7-227e86a870d3	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5564-7c2a-7616-8cb15f40b0f8	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5564-7c2a-7bc4-1db81c658a00	CL	CHL	152	Chile 	Čile	\N
00040000-5564-7c2a-f290-00c7bf657c9c	CN	CHN	156	China 	Kitajska	\N
00040000-5564-7c2a-5d42-de8e2fe2bdfa	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5564-7c2a-567c-4efd89e37906	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5564-7c2a-91f8-d189dcbf73d5	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5564-7c2a-2409-64b2b89f0b1b	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5564-7c2a-7177-c6c9b7cc6344	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5564-7c2a-a999-bc51955b1acb	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5564-7c2a-d716-20d6bb7ed2e8	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5564-7c2a-8a68-c56d238ac7d0	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5564-7c2a-6e80-eb2ebe8e7bf0	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5564-7c2a-626e-95fa5cf3210a	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5564-7c2a-0027-0fbaea7594c8	CU	CUB	192	Cuba 	Kuba	\N
00040000-5564-7c2a-6f47-d1627fa3613d	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5564-7c2a-59ff-9f2e50a93c14	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5564-7c2a-196a-a1a63c026ec2	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5564-7c2a-6c46-40d1fb2afe32	DK	DNK	208	Denmark 	Danska	\N
00040000-5564-7c2a-6e7d-db8845cab652	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5564-7c2a-48d1-84d1cf81b6c3	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5564-7c2a-a210-b702abda2dec	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5564-7c2a-9991-a1e0b7614207	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5564-7c2a-4bdf-df639fe9f0a0	EG	EGY	818	Egypt 	Egipt	\N
00040000-5564-7c2a-a54d-6a86e1421b0e	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5564-7c2a-0950-f56009332363	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5564-7c2a-0ecf-77eeb1443bce	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5564-7c2a-db5a-1e76b7c17a35	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5564-7c2a-3a6d-993a13a3435d	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5564-7c2a-ca96-ef9af4d993f6	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5564-7c2a-6714-9e9bfd6b29bd	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5564-7c2a-8dd7-265587e5e2c2	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5564-7c2a-f086-e475bd3f8114	FI	FIN	246	Finland 	Finska	\N
00040000-5564-7c2a-e963-6fe22f2c9bb2	FR	FRA	250	France 	Francija	\N
00040000-5564-7c2a-0008-20137ccb4355	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5564-7c2a-96fe-6b42f7bc43f8	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5564-7c2a-8879-1891efb83fe3	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5564-7c2a-5557-12c13b4e5624	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5564-7c2a-e39e-2da64f0f4688	GA	GAB	266	Gabon 	Gabon	\N
00040000-5564-7c2a-30fd-421ebf2f406f	GM	GMB	270	Gambia 	Gambija	\N
00040000-5564-7c2a-7e95-394937eeec80	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5564-7c2a-1c63-238d81d6e421	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5564-7c2a-6ba8-87dc0ae266ad	GH	GHA	288	Ghana 	Gana	\N
00040000-5564-7c2a-0254-a5429524e528	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5564-7c2a-feb3-0d4de329165f	GR	GRC	300	Greece 	Grčija	\N
00040000-5564-7c2a-43ad-7c0cfe108908	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5564-7c2a-1800-7112dc1f7d91	GD	GRD	308	Grenada 	Grenada	\N
00040000-5564-7c2a-aec2-bb78180aaed1	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5564-7c2a-cd6a-1d8fb555b1f7	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5564-7c2a-b76a-d4c504df08a1	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5564-7c2a-935f-f5c7b27725e0	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5564-7c2a-8231-dc81600f9b29	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5564-7c2a-c967-f5cd8f277c19	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5564-7c2a-2682-c1a22f0251c7	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5564-7c2a-69b6-3f2f3bcc9eeb	HT	HTI	332	Haiti 	Haiti	\N
00040000-5564-7c2a-e52c-667733748dac	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5564-7c2a-01aa-094a2b0800a0	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5564-7c2a-54d7-a7229813f6e7	HN	HND	340	Honduras 	Honduras	\N
00040000-5564-7c2a-4a1f-fcd05688c67c	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5564-7c2a-aba8-87f4d09aa9f0	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5564-7c2a-121f-55ecd5e906c8	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5564-7c2a-a1bb-30d32bbf3870	IN	IND	356	India 	Indija	\N
00040000-5564-7c2a-7370-8da57979216a	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5564-7c2a-0821-703007941b80	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5564-7c2a-f542-5a5d62b70ec8	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5564-7c2a-b169-936afdad5313	IE	IRL	372	Ireland 	Irska	\N
00040000-5564-7c2a-21b2-9c183fb7ce87	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5564-7c2a-230d-c26edab3b764	IL	ISR	376	Israel 	Izrael	\N
00040000-5564-7c2a-d755-fefcc2e0773a	IT	ITA	380	Italy 	Italija	\N
00040000-5564-7c2a-0de2-9a8609b437d9	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5564-7c2a-58d7-ea0f0e3e1e04	JP	JPN	392	Japan 	Japonska	\N
00040000-5564-7c2a-8757-cc0f1c5038ed	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5564-7c2a-5a61-483ba51d16cb	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5564-7c2a-2c10-06138e8a5d2f	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5564-7c2a-e460-3380be4293cf	KE	KEN	404	Kenya 	Kenija	\N
00040000-5564-7c2a-b33a-f011fe050e8c	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5564-7c2a-89ff-f4ab6d82efc9	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5564-7c2a-de1f-95a49fd0d655	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5564-7c2a-5ef4-977473a21b95	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5564-7c2a-3309-c8b70444ac67	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5564-7c2a-c3c2-96d5d16e3fc3	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5564-7c2a-a4c5-0ebf748f16d9	LV	LVA	428	Latvia 	Latvija	\N
00040000-5564-7c2a-2df3-683cdd151907	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5564-7c2a-432b-3c543f681e2b	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5564-7c2a-5d0a-28caa09d269c	LR	LBR	430	Liberia 	Liberija	\N
00040000-5564-7c2a-431a-0f1383801f08	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5564-7c2a-a322-591e433ba0d0	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5564-7c2a-8338-2d97854779f8	LT	LTU	440	Lithuania 	Litva	\N
00040000-5564-7c2a-690d-1fbc1f2582c8	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5564-7c2a-c37f-3f4c5911900c	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5564-7c2a-0bf4-ee6732554f36	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5564-7c2a-931e-e19d2ca77bc6	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5564-7c2a-014d-5bcd0b5e8e05	MW	MWI	454	Malawi 	Malavi	\N
00040000-5564-7c2a-75c2-0a9ec97e4fa1	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5564-7c2a-6281-681fed1009b1	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5564-7c2a-6f05-81a75e38d11c	ML	MLI	466	Mali 	Mali	\N
00040000-5564-7c2a-be18-5b364eb5790c	MT	MLT	470	Malta 	Malta	\N
00040000-5564-7c2a-319d-3cf3f51f745e	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5564-7c2a-e576-18e3c155580a	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5564-7c2a-2495-fb5eb69cfddb	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5564-7c2a-1a72-975ae81f4013	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5564-7c2a-ee65-9594e4d7e638	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5564-7c2a-5c36-b30348a77b90	MX	MEX	484	Mexico 	Mehika	\N
00040000-5564-7c2a-82fe-b9bd5d1184b5	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5564-7c2a-9114-536d0b05195c	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5564-7c2a-473d-f8658cc82797	MC	MCO	492	Monaco 	Monako	\N
00040000-5564-7c2a-ab80-b64726c76796	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5564-7c2a-baa7-23f39521b37c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5564-7c2a-f9a5-ec6fe8c74d25	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5564-7c2a-1fcc-763ef70ca3e7	MA	MAR	504	Morocco 	Maroko	\N
00040000-5564-7c2a-1f6c-4289d9653ff2	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5564-7c2a-7be6-c98df1bc2646	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5564-7c2a-3a2d-3809550d86a6	NA	NAM	516	Namibia 	Namibija	\N
00040000-5564-7c2a-0867-69265617851e	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5564-7c2a-f250-fcd451cba5e7	NP	NPL	524	Nepal 	Nepal	\N
00040000-5564-7c2a-cb4d-664b9d3c3556	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5564-7c2a-71c8-0212c38103e7	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5564-7c2a-2fd2-f9487c71d39d	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5564-7c2a-e9d1-38c85a44e82d	NE	NER	562	Niger 	Niger 	\N
00040000-5564-7c2a-8912-a1b3b153da9a	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5564-7c2a-123e-ea08112bbe29	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5564-7c2a-1ef2-d3a13bbc2807	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5564-7c2a-619a-c789d70baef6	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5564-7c2a-eb47-526847bdeeb1	NO	NOR	578	Norway 	Norveška	\N
00040000-5564-7c2a-13c9-1aa9ffe8a238	OM	OMN	512	Oman 	Oman	\N
00040000-5564-7c2a-f989-1c00b4a56a8d	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5564-7c2a-ce7e-a26ffb5cf9b9	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5564-7c2a-ce29-b97a2becad2a	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5564-7c2a-f5e2-5f0a73eadce5	PA	PAN	591	Panama 	Panama	\N
00040000-5564-7c2a-d6ec-a8b0b3a8b33d	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5564-7c2a-ae9f-36649e6f15b4	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5564-7c2a-4d36-88d3113681a6	PE	PER	604	Peru 	Peru	\N
00040000-5564-7c2a-67f9-880be4261979	PH	PHL	608	Philippines 	Filipini	\N
00040000-5564-7c2a-5e24-8f9f284180be	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5564-7c2a-a108-3018a5e77367	PL	POL	616	Poland 	Poljska	\N
00040000-5564-7c2a-babf-ba9fc209f4bb	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5564-7c2a-e045-4b2961d1caa9	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5564-7c2a-7e84-c2423651cc5a	QA	QAT	634	Qatar 	Katar	\N
00040000-5564-7c2a-c775-9455476d4e1e	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5564-7c2a-0302-9374f6fbd49d	RO	ROU	642	Romania 	Romunija	\N
00040000-5564-7c2a-a143-ce905866f4ca	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5564-7c2a-0583-f93c63b22dac	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5564-7c2a-3406-e3c343de4643	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5564-7c2a-aaee-9d596554181b	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5564-7c2a-8d3d-408158a9821b	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5564-7c2a-7170-f184d9590a63	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5564-7c2a-153b-94d4a8264852	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5564-7c2a-61b0-76ca65329e6e	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5564-7c2a-3d2e-dfeb47bf13f5	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5564-7c2a-d2ac-c26421482ccc	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5564-7c2a-b480-554e8656d69b	SM	SMR	674	San Marino 	San Marino	\N
00040000-5564-7c2a-292b-592b41c2caff	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5564-7c2a-5616-f6d2e5031236	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5564-7c2a-6031-c17c5a31eefc	SN	SEN	686	Senegal 	Senegal	\N
00040000-5564-7c2a-bc18-59b52659254c	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5564-7c2a-bc6a-c51f3bfb3256	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5564-7c2a-032a-b7f157b8c8c1	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5564-7c2a-048f-5a6c530a8585	SG	SGP	702	Singapore 	Singapur	\N
00040000-5564-7c2a-b6b9-426afced8002	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5564-7c2a-7702-7b55f68be97f	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5564-7c2a-e1fd-4291a3aa572b	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5564-7c2a-c172-e3ff57a95b3d	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5564-7c2a-e433-30625ba17e12	SO	SOM	706	Somalia 	Somalija	\N
00040000-5564-7c2a-82be-a61b3dbfa6cd	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5564-7c2a-16f6-6beb70c8af15	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5564-7c2a-4465-4ffee072f152	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5564-7c2a-7934-0d30e0ab532d	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5564-7c2a-c4c9-9f9633d313ec	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5564-7c2a-3821-42d6f03b1d4b	SD	SDN	729	Sudan 	Sudan	\N
00040000-5564-7c2a-5fd6-208421360640	SR	SUR	740	Suriname 	Surinam	\N
00040000-5564-7c2a-4d81-4dbf7f075235	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5564-7c2a-9a74-29bfbb268923	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5564-7c2a-0eb2-962fb3a79c76	SE	SWE	752	Sweden 	Švedska	\N
00040000-5564-7c2a-9694-091154d2b5d6	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5564-7c2a-5956-147615c9ac49	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5564-7c2a-ea17-e09b5af018fa	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5564-7c2a-846b-278c19449ec0	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5564-7c2a-d7d9-b843459eea04	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5564-7c2a-c05d-21f279dbfa71	TH	THA	764	Thailand 	Tajska	\N
00040000-5564-7c2a-98f5-a6dc62052eba	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5564-7c2a-b1ca-d5489c686718	TG	TGO	768	Togo 	Togo	\N
00040000-5564-7c2a-42de-59022679db7e	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5564-7c2a-fb96-f158b0b04e3d	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5564-7c2a-65cd-c263d70cdc1c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5564-7c2a-cf47-b1cb8bd51194	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5564-7c2a-a926-09dc0a60acfb	TR	TUR	792	Turkey 	Turčija	\N
00040000-5564-7c2a-8883-8da3f87734e5	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5564-7c2a-afd7-fdd4a889c0d3	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5564-7c2a-6186-5c60e9ccd65b	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5564-7c2a-53d9-9082e67e5c1d	UG	UGA	800	Uganda 	Uganda	\N
00040000-5564-7c2a-9bbc-0c4bcfb9e9f5	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5564-7c2a-f2e7-78db76243be2	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5564-7c2a-0a32-11b9190574bb	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5564-7c2a-784a-249c12a35d37	US	USA	840	United States 	Združene države Amerike	\N
00040000-5564-7c2a-2019-191ebd304a1d	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5564-7c2a-80ab-0cd72c702484	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5564-7c2a-6704-422d3244a6dd	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5564-7c2a-1c18-2c88b7d7af14	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5564-7c2a-b028-22d3b2483bf4	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5564-7c2a-d2a9-16352c4f1d18	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5564-7c2a-af56-55d10271fe76	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5564-7c2a-7edd-1f6c3e3729c5	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5564-7c2a-5635-96c53c272943	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5564-7c2a-915f-8db05b4d0ab7	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5564-7c2a-5d7d-a6d2b43cf9cc	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5564-7c2a-b60f-795759a47ee7	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5564-7c2a-f784-399e49c4e42a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2733 (class 0 OID 5136522)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj) FROM stdin;
\.


--
-- TOC entry 2712 (class 0 OID 5136346)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2716 (class 0 OID 5136390)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2710 (class 0 OID 5136326)
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
-- TOC entry 2722 (class 0 OID 5136439)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2726 (class 0 OID 5136464)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2707 (class 0 OID 5136283)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5564-7c2a-ad50-ef71847828c9	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5564-7c2a-b776-eecc6745fc07	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5564-7c2a-82cf-3e88294b48a2	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5564-7c2a-ba45-f57617bd8b76	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5564-7c2a-d8e0-9ada80bed7d2	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5564-7c2a-ce3d-11a8a31bc0d3	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5564-7c2a-345e-33662a8cc93f	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5564-7c2a-15d9-0508f2554816	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5564-7c2a-590e-39f0cf1caecc	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5564-7c2a-fff8-21da52fe39ea	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5564-7c2a-2648-a410c37c08fa	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5564-7c2a-ca68-b6bdda0ec4d1	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5564-7c2a-7f78-c2feb8b0b94e	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5564-7c2a-8a9a-fe0293237a66	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5564-7c2a-b32e-4847111c27cd	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2701 (class 0 OID 5136197)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5564-7c2a-3869-9e68b048b4ff	00000000-5564-7c2a-d8e0-9ada80bed7d2	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5564-7c2a-6863-5fb198464bdd	00000000-5564-7c2a-d8e0-9ada80bed7d2	00010000-5564-7c2a-ee01-318ba7dd9979	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5564-7c2a-8750-3475f3ffed27	00000000-5564-7c2a-ce3d-11a8a31bc0d3	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2702 (class 0 OID 5136208)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5564-7c2a-7094-e835f07b7cb8	\N	\N	0001	g.	Janez	Novak	a	Peter	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5564-7c2a-f315-5c086ddf9e8d	\N	\N	0002	dr.	Anton	Horvat	b			anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5564-7c2a-93c0-50893f664ec7	\N	\N	0003		Ivan	Kovačič	c			ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5564-7c2a-8f02-99c15696f712	\N	\N	0004	prof.	Jožef	Krajnc	d		Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5564-7c2a-5324-6e887786475d	\N	\N	0005		Marko	Zupančič	e			marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5564-7c2a-3581-508f0e0ac3ab	\N	\N	0006	ga.	Marija	Kovač	f			marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5564-7c2a-1b2a-ed4c68a73763	\N	\N	0007	ga.	Ana	Potočnik	g			ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5564-7c2a-accc-0f45b30905a4	\N	\N	0008	ga.	Maja	Mlakar	h			maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5564-7c2a-2bbc-6a4f6c03aef4	\N	\N	0009		Irena	Kos	i			irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5564-7c2a-7a6b-53b652695c81	\N	\N	0010		Mojca	Vidmar	J			mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5564-7c2a-1170-9923ed825dd6	\N	\N	0011		xx	write protected12345	\N			xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2692 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2697 (class 0 OID 5136162)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5564-7c2a-148d-eddbd5bcdafe	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5564-7c2a-9cb5-56ece04fb286	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5564-7c2a-a7cb-9b9c3089b459	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5564-7c2a-26ee-9f9221ceddcd	Abonma-read	Abonma - branje	f
00030000-5564-7c2a-2f5d-e4e8716c5f96	Abonma-write	Abonma - spreminjanje	f
00030000-5564-7c2a-66db-8a2c6f1cdf3d	Alternacija-read	Alternacija - branje	f
00030000-5564-7c2a-dad0-babb913d9a22	Alternacija-write	Alternacija - spreminjanje	f
00030000-5564-7c2a-b17c-0407777db024	Arhivalija-read	Arhivalija - branje	f
00030000-5564-7c2a-284d-38b001538214	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5564-7c2a-b4ef-4a6cabfe71aa	Besedilo-read	Besedilo - branje	f
00030000-5564-7c2a-d741-5f92e9bca035	Besedilo-write	Besedilo - spreminjanje	f
00030000-5564-7c2a-b819-bf4f93592a45	DogodekIzven-read	DogodekIzven - branje	f
00030000-5564-7c2a-beb4-7de7f825f284	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5564-7c2a-77a9-f9724814118e	Dogodek-read	Dogodek - branje	f
00030000-5564-7c2a-5374-c2bd4b692f02	Dogodek-write	Dogodek - spreminjanje	f
00030000-5564-7c2a-6731-2f69d8cd4a09	Drzava-read	Drzava - branje	f
00030000-5564-7c2a-f7e5-dd8710e57457	Drzava-write	Drzava - spreminjanje	f
00030000-5564-7c2a-6619-c383ce4e1946	Funkcija-read	Funkcija - branje	f
00030000-5564-7c2a-41d9-a5d5e7453129	Funkcija-write	Funkcija - spreminjanje	f
00030000-5564-7c2a-fd22-003921c3603f	Gostovanje-read	Gostovanje - branje	f
00030000-5564-7c2a-f67c-11cb7f5268cb	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5564-7c2a-a521-cd1f66442b84	Gostujoca-read	Gostujoca - branje	f
00030000-5564-7c2a-4172-7e3273de910e	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5564-7c2a-c712-ac933f9fb3c7	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5564-7c2a-fe36-3888a15e3221	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5564-7c2a-08ca-c8b5c5cfe1f9	Kupec-read	Kupec - branje	f
00030000-5564-7c2a-311d-58ecab1e56f3	Kupec-write	Kupec - spreminjanje	f
00030000-5564-7c2a-c80f-885fc6020b9c	NacinPlacina-read	NacinPlacina - branje	f
00030000-5564-7c2a-289d-b194a29c9163	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5564-7c2a-0472-2d0258ecea65	Option-read	Option - branje	f
00030000-5564-7c2a-65c7-599d02355eb8	Option-write	Option - spreminjanje	f
00030000-5564-7c2a-f575-a19a21b1c54b	OptionValue-read	OptionValue - branje	f
00030000-5564-7c2a-7adb-3033ecf15d91	OptionValue-write	OptionValue - spreminjanje	f
00030000-5564-7c2a-6746-0f16d7049ff3	Oseba-read	Oseba - branje	f
00030000-5564-7c2a-5888-543068adf757	Oseba-write	Oseba - spreminjanje	f
00030000-5564-7c2a-d94e-3e8e8447253e	Permission-read	Permission - branje	f
00030000-5564-7c2a-b61a-f5fc2c210d54	Permission-write	Permission - spreminjanje	f
00030000-5564-7c2a-8501-29fe0992d5ad	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5564-7c2a-ef51-166b3f0fda97	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5564-7c2a-4d83-984bd3a4ac45	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5564-7c2a-5cd8-4115f6076b9c	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5564-7c2a-82e2-983591bb874f	Pogodba-read	Pogodba - branje	f
00030000-5564-7c2a-a314-dcc0f788783f	Pogodba-write	Pogodba - spreminjanje	f
00030000-5564-7c2a-e95c-e14bab09d1fa	Popa-read	Popa - branje	f
00030000-5564-7c2a-4eb1-f4763a422a0f	Popa-write	Popa - spreminjanje	f
00030000-5564-7c2a-30f6-428e99727115	Posta-read	Posta - branje	f
00030000-5564-7c2a-0435-1815ba12542b	Posta-write	Posta - spreminjanje	f
00030000-5564-7c2a-0dc7-1e2e0487ad77	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5564-7c2a-c581-5c9607ce21a0	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5564-7c2a-1a6a-58433aaec5b0	PostniNaslov-read	PostniNaslov - branje	f
00030000-5564-7c2a-d134-c1c06d3747fb	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5564-7c2a-0e8c-8d3443ffc475	Predstava-read	Predstava - branje	f
00030000-5564-7c2a-5554-db3c6e7277e1	Predstava-write	Predstava - spreminjanje	f
00030000-5564-7c2a-6249-8a6c210752dc	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5564-7c2a-73de-f31c30a03fa1	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5564-7c2a-0aba-bce74d2659f2	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5564-7c2a-b744-6a431f0bd0f8	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5564-7c2a-b1d5-1a951bf7ae78	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5564-7c2a-ca89-5355e8a7aa37	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5564-7c2a-4e98-1aa3df056d64	Prostor-read	Prostor - branje	f
00030000-5564-7c2a-a0ce-c5b9e524753f	Prostor-write	Prostor - spreminjanje	f
00030000-5564-7c2a-42c9-75c0d136fc33	Racun-read	Racun - branje	f
00030000-5564-7c2a-5c17-afc1197bda6d	Racun-write	Racun - spreminjanje	f
00030000-5564-7c2a-ba9e-a281ef0043ae	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5564-7c2a-846f-1b55ee3991e0	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5564-7c2a-d9ea-367448355808	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5564-7c2a-e01e-22a147ad975d	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5564-7c2a-7307-3297e06c7ab2	Rekvizit-read	Rekvizit - branje	f
00030000-5564-7c2a-5687-b8ed470d8cb5	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5564-7c2a-8770-73edf4077010	Revizija-read	Revizija - branje	f
00030000-5564-7c2a-d7b0-d955e355c165	Revizija-write	Revizija - spreminjanje	f
00030000-5564-7c2a-6123-5c9a453a42c2	Rezervacija-read	Rezervacija - branje	f
00030000-5564-7c2a-590a-ef92a5f952a5	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5564-7c2a-02d4-4b71a7126ebc	Role-read	Role - branje	f
00030000-5564-7c2a-f9e2-01e6323d57c8	Role-write	Role - spreminjanje	f
00030000-5564-7c2a-eb6c-7466334604b2	SedezniRed-read	SedezniRed - branje	f
00030000-5564-7c2a-435b-93bec0073a8f	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5564-7c2a-4aa2-d9395ddf827e	Sedez-read	Sedez - branje	f
00030000-5564-7c2a-4387-c3965ef52955	Sedez-write	Sedez - spreminjanje	f
00030000-5564-7c2a-bc36-4dbe271f0a1d	Sezona-read	Sezona - branje	f
00030000-5564-7c2a-534c-4b6e7f2d9b2d	Sezona-write	Sezona - spreminjanje	f
00030000-5564-7c2a-abd7-8d9e4e0e6748	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5564-7c2a-5943-27da51f9eef8	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5564-7c2a-7d94-f627dab74170	Stevilcenje-read	Stevilcenje - branje	f
00030000-5564-7c2a-22eb-e9ede5938f4f	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5564-7c2a-901c-a997f94b7760	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5564-7c2a-3eac-0e4bae2d2874	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5564-7c2a-a6b4-df21dde96451	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5564-7c2a-4f40-3dca03cefab9	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5564-7c2a-72a7-4557ebea84d0	Telefonska-read	Telefonska - branje	f
00030000-5564-7c2a-6438-1ec9585fca37	Telefonska-write	Telefonska - spreminjanje	f
00030000-5564-7c2a-3bc1-6a89b47a959e	TerminStoritve-read	TerminStoritve - branje	f
00030000-5564-7c2a-1199-69838cbb306f	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5564-7c2a-e0c5-9c1a924d331b	TipFunkcije-read	TipFunkcije - branje	f
00030000-5564-7c2a-a8b3-c2bf0cc888f9	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5564-7c2a-68ae-16d1fb586d44	Trr-read	Trr - branje	f
00030000-5564-7c2a-39fa-54a65af4758f	Trr-write	Trr - spreminjanje	f
00030000-5564-7c2a-364d-bbd52816bd51	Uprizoritev-read	Uprizoritev - branje	f
00030000-5564-7c2a-b9ff-6b3786e546b1	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5564-7c2a-73ec-9206db26bdd3	User-read	User - branje	f
00030000-5564-7c2a-b79f-4d8858b49f1c	User-write	User - spreminjanje	f
00030000-5564-7c2a-0401-f90f9f0e2f98	Vaja-read	Vaja - branje	f
00030000-5564-7c2a-3497-1e85ee321812	Vaja-write	Vaja - spreminjanje	f
00030000-5564-7c2a-be0b-7dbd09bfde4b	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5564-7c2a-a1f2-0ce0abee5748	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5564-7c2a-19fe-b59bdca8bded	Zaposlitev-read	Zaposlitev - branje	f
00030000-5564-7c2a-315d-82111bc10f29	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5564-7c2a-2e8b-e9bc035c26b6	Zasedenost-read	Zasedenost - branje	f
00030000-5564-7c2a-0c6f-16ea573490e0	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5564-7c2a-92c8-78968c6f126d	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5564-7c2a-0c62-67f0edf62aa5	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5564-7c2a-9558-b64845f363b1	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5564-7c2a-760d-6f4909432b59	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2699 (class 0 OID 5136181)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5564-7c2a-76d1-db5c82a4ea5a	00030000-5564-7c2a-6731-2f69d8cd4a09
00020000-5564-7c2a-4cbc-f6f204514929	00030000-5564-7c2a-f7e5-dd8710e57457
00020000-5564-7c2a-4cbc-f6f204514929	00030000-5564-7c2a-6731-2f69d8cd4a09
\.


--
-- TOC entry 2727 (class 0 OID 5136471)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2731 (class 0 OID 5136502)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2743 (class 0 OID 5136635)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2704 (class 0 OID 5136240)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5564-7c2b-c426-822974a6fca0	00040000-5564-7c2a-d1e7-0e1fa6a3ad9c	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5564-7c2b-c949-696e58936f6e	00040000-5564-7c2a-d1e7-0e1fa6a3ad9c	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2706 (class 0 OID 5136275)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5564-7c29-65df-d6f3ba08e436	8341	Adlešiči
00050000-5564-7c29-5285-428f9b595dcb	5270	Ajdovščina
00050000-5564-7c29-9dc4-e1d774c253dc	6280	Ankaran/Ancarano
00050000-5564-7c29-ebc0-00c9ee47fa0e	9253	Apače
00050000-5564-7c29-1419-ecfd24001104	8253	Artiče
00050000-5564-7c29-822f-86b282f99c8f	4275	Begunje na Gorenjskem
00050000-5564-7c29-ff81-644447040771	1382	Begunje pri Cerknici
00050000-5564-7c29-17ba-2a987420e68b	9231	Beltinci
00050000-5564-7c29-6d3d-3cc8a33722de	2234	Benedikt
00050000-5564-7c29-dc28-52297dad1d0a	2345	Bistrica ob Dravi
00050000-5564-7c29-c67d-a851ae4784fa	3256	Bistrica ob Sotli
00050000-5564-7c29-f5c1-cb077bec5e52	8259	Bizeljsko
00050000-5564-7c29-29dc-c3136f29031a	1223	Blagovica
00050000-5564-7c29-076b-cb450b243d08	8283	Blanca
00050000-5564-7c29-763b-64ff37adf51c	4260	Bled
00050000-5564-7c29-982a-79a5cfe25f91	4273	Blejska Dobrava
00050000-5564-7c29-4f09-0324d576a610	9265	Bodonci
00050000-5564-7c29-6cb7-0bd51da807ef	9222	Bogojina
00050000-5564-7c29-56db-44571d3e0c85	4263	Bohinjska Bela
00050000-5564-7c29-af09-4a831f93a694	4264	Bohinjska Bistrica
00050000-5564-7c29-456f-0e996b778452	4265	Bohinjsko jezero
00050000-5564-7c29-3b67-26325cf9f81b	1353	Borovnica
00050000-5564-7c29-76ee-0adc6a3ea28f	8294	Boštanj
00050000-5564-7c29-9d9a-3e1760436a3b	5230	Bovec
00050000-5564-7c29-c43c-98dd2f9a1af5	5295	Branik
00050000-5564-7c29-5b02-55d02b076faf	3314	Braslovče
00050000-5564-7c29-311d-c32dab143a57	5223	Breginj
00050000-5564-7c29-bbc8-fd851a2043bc	8280	Brestanica
00050000-5564-7c29-7522-aed359478611	2354	Bresternica
00050000-5564-7c29-fe16-29301c2ab8c6	4243	Brezje
00050000-5564-7c29-3b76-69fc2a97f020	1351	Brezovica pri Ljubljani
00050000-5564-7c29-f317-a43130a8a489	8250	Brežice
00050000-5564-7c29-f205-82c2b8168532	4210	Brnik - Aerodrom
00050000-5564-7c29-f1e8-c5eba08d2364	8321	Brusnice
00050000-5564-7c29-7e85-10b1a5e22eee	3255	Buče
00050000-5564-7c29-facb-ae33311700e0	8276	Bučka 
00050000-5564-7c29-c237-5757fc1ac173	9261	Cankova
00050000-5564-7c29-9a29-511326ff73e8	3000	Celje 
00050000-5564-7c29-03f8-554ef76ec55f	3001	Celje - poštni predali
00050000-5564-7c29-7150-bd3bdab92751	4207	Cerklje na Gorenjskem
00050000-5564-7c29-64ff-6b6e285fc133	8263	Cerklje ob Krki
00050000-5564-7c29-8503-bee73e6d278f	1380	Cerknica
00050000-5564-7c29-2b01-f52230823079	5282	Cerkno
00050000-5564-7c29-6495-e6d2fc5c3eaa	2236	Cerkvenjak
00050000-5564-7c29-8db0-2aaf89795fd6	2215	Ceršak
00050000-5564-7c29-3a37-03f07b0997cc	2326	Cirkovce
00050000-5564-7c29-128f-5ff7e3bb70d2	2282	Cirkulane
00050000-5564-7c29-3d72-0b14f040df77	5273	Col
00050000-5564-7c29-d7e0-a764a7a3d163	8251	Čatež ob Savi
00050000-5564-7c29-4183-07453732e410	1413	Čemšenik
00050000-5564-7c29-d1d4-702a98c7ac92	5253	Čepovan
00050000-5564-7c29-9b73-af67536b4944	9232	Črenšovci
00050000-5564-7c29-0be3-aabb5d63d7ee	2393	Črna na Koroškem
00050000-5564-7c29-5560-5dae4cee1524	6275	Črni Kal
00050000-5564-7c29-27c1-6c8d3de14e41	5274	Črni Vrh nad Idrijo
00050000-5564-7c29-c153-4000623fb237	5262	Črniče
00050000-5564-7c29-862a-950e601ca7f2	8340	Črnomelj
00050000-5564-7c29-7c22-af32be0bd092	6271	Dekani
00050000-5564-7c29-dee7-f200b6840bdc	5210	Deskle
00050000-5564-7c29-ff96-3295a8951697	2253	Destrnik
00050000-5564-7c29-76b0-df241ee15489	6215	Divača
00050000-5564-7c29-8f57-5fc7b456becc	1233	Dob
00050000-5564-7c29-912b-f108353bd0d7	3224	Dobje pri Planini
00050000-5564-7c29-8767-8b21d2d7b5d2	8257	Dobova
00050000-5564-7c29-fb6d-4f6871b27228	1423	Dobovec
00050000-5564-7c29-0143-5b2e6eeffd1c	5263	Dobravlje
00050000-5564-7c29-3d46-794e71aede00	3204	Dobrna
00050000-5564-7c29-1a70-9aa72e599f06	8211	Dobrnič
00050000-5564-7c29-ecad-1b42e9e2085e	1356	Dobrova
00050000-5564-7c29-a902-8b17545f12f6	9223	Dobrovnik/Dobronak 
00050000-5564-7c29-21bc-20fce182b123	5212	Dobrovo v Brdih
00050000-5564-7c29-20a1-16734c57f21a	1431	Dol pri Hrastniku
00050000-5564-7c29-958a-56f02d0ecdf3	1262	Dol pri Ljubljani
00050000-5564-7c29-7cf0-aa545f758f19	1273	Dole pri Litiji
00050000-5564-7c29-c4e0-fe90587738b0	1331	Dolenja vas
00050000-5564-7c29-6edc-b4885e076ede	8350	Dolenjske Toplice
00050000-5564-7c29-eaa3-aad43e93a1fe	1230	Domžale
00050000-5564-7c29-ac51-fddf3c09023a	2252	Dornava
00050000-5564-7c29-9597-25f6bcb85978	5294	Dornberk
00050000-5564-7c29-bb64-c72d0f9fe567	1319	Draga
00050000-5564-7c29-2573-aaec0edd6454	8343	Dragatuš
00050000-5564-7c29-b33e-1f0c900418f4	3222	Dramlje
00050000-5564-7c29-5e5d-4c9c26b531a4	2370	Dravograd
00050000-5564-7c29-0eed-8f1152ab7949	4203	Duplje
00050000-5564-7c29-627b-51b7dd4e517a	6221	Dutovlje
00050000-5564-7c29-7ed7-9438f5bfb381	8361	Dvor
00050000-5564-7c29-4370-f3ee73b8c42f	2343	Fala
00050000-5564-7c29-8413-2f634c7d7489	9208	Fokovci
00050000-5564-7c29-a21d-96bbc26b5444	2313	Fram
00050000-5564-7c29-0071-4272d8901d65	3213	Frankolovo
00050000-5564-7c29-193f-1f4fc71a8d50	1274	Gabrovka
00050000-5564-7c29-e803-5a8606de49b0	8254	Globoko
00050000-5564-7c29-4a7d-354a613a68bb	5275	Godovič
00050000-5564-7c29-11d5-bdc19baa6f7d	4204	Golnik
00050000-5564-7c29-d6ac-1f50816951c6	3303	Gomilsko
00050000-5564-7c29-3373-03c8e4961080	4224	Gorenja vas
00050000-5564-7c29-b222-7dcc582fc6dc	3263	Gorica pri Slivnici
00050000-5564-7c29-5d06-9f8db8d358ae	2272	Gorišnica
00050000-5564-7c29-21b7-0adb28e65b54	9250	Gornja Radgona
00050000-5564-7c29-a93f-3ec58c160e17	3342	Gornji Grad
00050000-5564-7c29-110a-4ed9a5acfd47	4282	Gozd Martuljek
00050000-5564-7c29-4a15-1e328253f681	6272	Gračišče
00050000-5564-7c29-af1c-cbb302a53684	9264	Grad
00050000-5564-7c29-a98b-f775a3438717	8332	Gradac
00050000-5564-7c29-172e-8e59cd670cb8	1384	Grahovo
00050000-5564-7c29-78ca-79c0461f68d7	5242	Grahovo ob Bači
00050000-5564-7c29-5af8-5886633f70e1	5251	Grgar
00050000-5564-7c29-85e6-c256aee2998c	3302	Griže
00050000-5564-7c29-d69b-d4803d42a969	3231	Grobelno
00050000-5564-7c29-91e9-c8b5afb4b9f7	1290	Grosuplje
00050000-5564-7c29-747c-11ad118c5066	2288	Hajdina
00050000-5564-7c29-49d8-848abc5058b7	8362	Hinje
00050000-5564-7c29-bca2-6504aaae5286	2311	Hoče
00050000-5564-7c29-8057-e357d0e3e2d4	9205	Hodoš/Hodos
00050000-5564-7c29-8998-6a9628af765b	1354	Horjul
00050000-5564-7c29-acbf-4e9cc6fa59fe	1372	Hotedršica
00050000-5564-7c29-29a4-836a0092ebd6	1430	Hrastnik
00050000-5564-7c29-9d7a-89cd573677fe	6225	Hruševje
00050000-5564-7c29-a30a-40c6011ef77e	4276	Hrušica
00050000-5564-7c29-1692-8c40eeddc077	5280	Idrija
00050000-5564-7c29-2c5a-a37f379e312a	1292	Ig
00050000-5564-7c29-6413-10754bb49c4a	6250	Ilirska Bistrica
00050000-5564-7c29-4d50-cebe2ec3e140	6251	Ilirska Bistrica-Trnovo
00050000-5564-7c29-3e3d-1d3cd7d4e7e4	1295	Ivančna Gorica
00050000-5564-7c29-d099-9a7f58cb57a7	2259	Ivanjkovci
00050000-5564-7c29-c5d5-a5c7052cf8ae	1411	Izlake
00050000-5564-7c29-3c9b-bc0c3dad2edc	6310	Izola/Isola
00050000-5564-7c29-77ec-80f0947249ae	2222	Jakobski Dol
00050000-5564-7c29-b738-dd0e02b15fed	2221	Jarenina
00050000-5564-7c29-a6e6-742db9dc1edb	6254	Jelšane
00050000-5564-7c29-95f6-e7d2d1c78b53	4270	Jesenice
00050000-5564-7c29-ec09-4abc665a4048	8261	Jesenice na Dolenjskem
00050000-5564-7c29-7a43-babd16589fae	3273	Jurklošter
00050000-5564-7c29-ff8b-3a14d7b6602d	2223	Jurovski Dol
00050000-5564-7c29-3bdb-591a8b87076d	2256	Juršinci
00050000-5564-7c29-3526-4f5a023be91f	5214	Kal nad Kanalom
00050000-5564-7c29-ac1f-3725c84ec188	3233	Kalobje
00050000-5564-7c29-a3a8-ae3b6a693e20	4246	Kamna Gorica
00050000-5564-7c29-0093-18d9b4280139	2351	Kamnica
00050000-5564-7c29-f2b2-9b4d77152499	1241	Kamnik
00050000-5564-7c29-dcc7-9686031b9830	5213	Kanal
00050000-5564-7c29-109e-d9d2c2a8bc67	8258	Kapele
00050000-5564-7c29-e735-58abee02f594	2362	Kapla
00050000-5564-7c29-772f-ade59cf1661d	2325	Kidričevo
00050000-5564-7c29-eda3-cf34255b8a3f	1412	Kisovec
00050000-5564-7c29-e69b-b40aba8901de	6253	Knežak
00050000-5564-7c29-b2a8-c2fc565036ce	5222	Kobarid
00050000-5564-7c29-1212-25753c8d2feb	9227	Kobilje
00050000-5564-7c29-883f-d436cf6ce2fd	1330	Kočevje
00050000-5564-7c29-20cc-0db2b178ad1e	1338	Kočevska Reka
00050000-5564-7c29-5d4c-9bf96f6a1ecb	2276	Kog
00050000-5564-7c29-90a7-ce370f986ea7	5211	Kojsko
00050000-5564-7c29-235a-e463f4785b68	6223	Komen
00050000-5564-7c29-99d3-f06d7a9ac67d	1218	Komenda
00050000-5564-7c29-447d-b261ce44607f	6000	Koper/Capodistria 
00050000-5564-7c29-cfbb-e134348a6cf8	6001	Koper/Capodistria - poštni predali
00050000-5564-7c29-0d45-01ee63d336ec	8282	Koprivnica
00050000-5564-7c29-bbb7-68274c3fb920	5296	Kostanjevica na Krasu
00050000-5564-7c29-187a-4e6130c1c3bf	8311	Kostanjevica na Krki
00050000-5564-7c29-195a-78d58bbee0d9	1336	Kostel
00050000-5564-7c29-aaf7-d3befc9fc7d3	6256	Košana
00050000-5564-7c29-d113-ab9adeea1196	2394	Kotlje
00050000-5564-7c29-9791-4a58df885f95	6240	Kozina
00050000-5564-7c29-d3e0-a1b5d3469e2b	3260	Kozje
00050000-5564-7c29-3605-2e03da3b2733	4000	Kranj 
00050000-5564-7c29-76ec-444b43bf8bde	4001	Kranj - poštni predali
00050000-5564-7c29-b53c-d37d1d343cec	4280	Kranjska Gora
00050000-5564-7c29-b75c-12ca359947c8	1281	Kresnice
00050000-5564-7c29-f85d-3b27486e51c6	4294	Križe
00050000-5564-7c29-6ecc-f3738689ed67	9206	Križevci
00050000-5564-7c29-6284-37dac00a2b95	9242	Križevci pri Ljutomeru
00050000-5564-7c29-e106-9a19e4876e06	1301	Krka
00050000-5564-7c29-0298-a66d910c7d3d	8296	Krmelj
00050000-5564-7c29-325e-8f516a97dbe3	4245	Kropa
00050000-5564-7c29-020b-b6b6e4c04d6e	8262	Krška vas
00050000-5564-7c29-d942-6efb6f2c6bb7	8270	Krško
00050000-5564-7c29-c752-9256a0e1b099	9263	Kuzma
00050000-5564-7c29-2f0f-242d0bca60db	2318	Laporje
00050000-5564-7c29-da92-7ff57216da22	3270	Laško
00050000-5564-7c29-14c3-5bfa6b637821	1219	Laze v Tuhinju
00050000-5564-7c29-7844-c55b316f837d	2230	Lenart v Slovenskih goricah
00050000-5564-7c29-0485-5c373e7e7968	9220	Lendava/Lendva
00050000-5564-7c29-ebc6-0bff28ecf705	4248	Lesce
00050000-5564-7c29-ed0b-6495797170c4	3261	Lesično
00050000-5564-7c29-c0a5-462b796e406d	8273	Leskovec pri Krškem
00050000-5564-7c29-01de-bbba681e394e	2372	Libeliče
00050000-5564-7c29-0d82-bff4705eaa92	2341	Limbuš
00050000-5564-7c29-053b-5bbeee32045c	1270	Litija
00050000-5564-7c29-593d-06d7d34e242b	3202	Ljubečna
00050000-5564-7c29-6fc5-e1e7edd05fba	1000	Ljubljana 
00050000-5564-7c29-d55b-e87a0a4b9096	1001	Ljubljana - poštni predali
00050000-5564-7c29-ca64-d617db1c4f4c	1231	Ljubljana - Črnuče
00050000-5564-7c29-5423-7039848dd7ee	1261	Ljubljana - Dobrunje
00050000-5564-7c29-3df0-32fe68f49ea6	1260	Ljubljana - Polje
00050000-5564-7c29-8e60-a397140b6fa5	1210	Ljubljana - Šentvid
00050000-5564-7c29-bd29-bd4a91151f9d	1211	Ljubljana - Šmartno
00050000-5564-7c29-f732-ce82c57a77ae	3333	Ljubno ob Savinji
00050000-5564-7c29-c7b1-735bda55e534	9240	Ljutomer
00050000-5564-7c29-23b0-d466f80e6852	3215	Loče
00050000-5564-7c29-9bcd-aa13f7b00bcc	5231	Log pod Mangartom
00050000-5564-7c29-eb1f-4cd484d19e06	1358	Log pri Brezovici
00050000-5564-7c29-1e1b-b8c73fa29585	1370	Logatec
00050000-5564-7c29-b4fa-4af9c1a1f27f	1371	Logatec
00050000-5564-7c29-bd75-2d5742b64798	1434	Loka pri Zidanem Mostu
00050000-5564-7c29-5faa-23626f4f3892	3223	Loka pri Žusmu
00050000-5564-7c29-78d1-d739501ce63b	6219	Lokev
00050000-5564-7c29-a1d1-ea1b3a84eacf	1318	Loški Potok
00050000-5564-7c29-4c5c-7c2d1ddf9ecd	2324	Lovrenc na Dravskem polju
00050000-5564-7c29-3cee-7025cf7afc00	2344	Lovrenc na Pohorju
00050000-5564-7c29-26b4-19fda33f3e24	3334	Luče
00050000-5564-7c29-aad6-e6dde3b39846	1225	Lukovica
00050000-5564-7c29-3f74-916f985d6333	9202	Mačkovci
00050000-5564-7c29-4eca-6a52c405b8a3	2322	Majšperk
00050000-5564-7c29-5c61-ce015276b79a	2321	Makole
00050000-5564-7c29-85cf-ade0f785f539	9243	Mala Nedelja
00050000-5564-7c29-0e8e-7c6de8a7d4dd	2229	Malečnik
00050000-5564-7c29-e7c4-de1604e96b6a	6273	Marezige
00050000-5564-7c29-c403-1423a96d925e	2000	Maribor 
00050000-5564-7c29-0088-952b05b61097	2001	Maribor - poštni predali
00050000-5564-7c29-757f-e1d0e39f06ec	2206	Marjeta na Dravskem polju
00050000-5564-7c29-ebff-a73e6c143db8	2281	Markovci
00050000-5564-7c29-f884-4672117969c5	9221	Martjanci
00050000-5564-7c29-0442-a9dd8d4905cc	6242	Materija
00050000-5564-7c29-4c8f-227c7f0f9ad1	4211	Mavčiče
00050000-5564-7c29-57b4-050502421c58	1215	Medvode
00050000-5564-7c29-df5a-e42a8822feb5	1234	Mengeš
00050000-5564-7c29-5753-a88bee28db1d	8330	Metlika
00050000-5564-7c29-b055-baad2ced5bf4	2392	Mežica
00050000-5564-7c29-0869-e46f18b504cc	2204	Miklavž na Dravskem polju
00050000-5564-7c29-8c14-411801894a90	2275	Miklavž pri Ormožu
00050000-5564-7c29-93bc-cbdf167a9511	5291	Miren
00050000-5564-7c29-9e8c-01fefb910254	8233	Mirna
00050000-5564-7c29-45dd-cacd6cc70f87	8216	Mirna Peč
00050000-5564-7c29-8c67-9695c3ab2900	2382	Mislinja
00050000-5564-7c29-07b0-20b389fadf4c	4281	Mojstrana
00050000-5564-7c29-c38b-126880455dbe	8230	Mokronog
00050000-5564-7c29-fa84-f8ec2a7224ef	1251	Moravče
00050000-5564-7c29-d807-ec1f0dd00cef	9226	Moravske Toplice
00050000-5564-7c29-ba03-3fac14858839	5216	Most na Soči
00050000-5564-7c29-71cf-143aedd7f47b	1221	Motnik
00050000-5564-7c29-c8ed-b5dd69e21014	3330	Mozirje
00050000-5564-7c29-fc80-1a50ca557ec0	9000	Murska Sobota 
00050000-5564-7c29-71aa-e37246f77eb3	9001	Murska Sobota - poštni predali
00050000-5564-7c29-c392-afa1dc225804	2366	Muta
00050000-5564-7c29-476c-1225d23d6275	4202	Naklo
00050000-5564-7c29-bfda-d50ebe1f5ef8	3331	Nazarje
00050000-5564-7c29-adb4-13f6024e4d78	1357	Notranje Gorice
00050000-5564-7c29-51f2-c13ee105eaca	3203	Nova Cerkev
00050000-5564-7c29-2f91-a98831e835a0	5000	Nova Gorica 
00050000-5564-7c29-35f5-a113f2ec05dc	5001	Nova Gorica - poštni predali
00050000-5564-7c29-0dce-4e34166564b8	1385	Nova vas
00050000-5564-7c29-6f29-35ec873c8694	8000	Novo mesto
00050000-5564-7c29-ac68-607cfde9700b	8001	Novo mesto - poštni predali
00050000-5564-7c29-309a-ff2eb92c629f	6243	Obrov
00050000-5564-7c29-3421-ac2cf03439f7	9233	Odranci
00050000-5564-7c29-fff2-e5764a0bfccf	2317	Oplotnica
00050000-5564-7c29-6630-0608ff7d8f64	2312	Orehova vas
00050000-5564-7c29-e437-3eab323ce40f	2270	Ormož
00050000-5564-7c29-a533-e3916d141d64	1316	Ortnek
00050000-5564-7c29-03c1-593444bd872f	1337	Osilnica
00050000-5564-7c29-75fa-0cdfc83a6c09	8222	Otočec
00050000-5564-7c29-9855-28af737345c0	2361	Ožbalt
00050000-5564-7c29-487b-c1f44d311c54	2231	Pernica
00050000-5564-7c29-9fd6-06d504f538cc	2211	Pesnica pri Mariboru
00050000-5564-7c29-fbac-d78db92ca828	9203	Petrovci
00050000-5564-7c29-c00d-f5fbf28d9b77	3301	Petrovče
00050000-5564-7c29-fe94-758722c37757	6330	Piran/Pirano
00050000-5564-7c29-7e7e-371ecdb184fb	8255	Pišece
00050000-5564-7c29-2225-fce32f3dcbde	6257	Pivka
00050000-5564-7c29-2ba9-f81fd0f556b3	6232	Planina
00050000-5564-7c29-38f3-185c60b6acb7	3225	Planina pri Sevnici
00050000-5564-7c29-6e3e-886b37c762e2	6276	Pobegi
00050000-5564-7c29-6d66-a0ecfc6e955b	8312	Podbočje
00050000-5564-7c29-fead-8d298ec7357f	5243	Podbrdo
00050000-5564-7c29-7791-5d2460cd98a9	3254	Podčetrtek
00050000-5564-7c29-d9d4-aeecefd4b9f9	2273	Podgorci
00050000-5564-7c29-925d-6472c2a9f10f	6216	Podgorje
00050000-5564-7c29-909c-335c762389c1	2381	Podgorje pri Slovenj Gradcu
00050000-5564-7c29-6316-e2f92f29d06a	6244	Podgrad
00050000-5564-7c29-1bea-eaf6bd3994ec	1414	Podkum
00050000-5564-7c29-a9a4-817155f0f4ac	2286	Podlehnik
00050000-5564-7c29-7d29-1d6c5a096f74	5272	Podnanos
00050000-5564-7c29-b40e-17cbad0c2973	4244	Podnart
00050000-5564-7c29-9ebe-da339a800fdd	3241	Podplat
00050000-5564-7c29-7a23-8a413019325a	3257	Podsreda
00050000-5564-7c29-3c0b-7b6203c9cc2a	2363	Podvelka
00050000-5564-7c29-22f9-b281e60b311b	2208	Pohorje
00050000-5564-7c29-ab0c-ab521f467662	2257	Polenšak
00050000-5564-7c29-7edd-7addf78a72a4	1355	Polhov Gradec
00050000-5564-7c29-2154-5e903473c393	4223	Poljane nad Škofjo Loko
00050000-5564-7c29-5c0b-31924b089419	2319	Poljčane
00050000-5564-7c29-ea37-bbc2119946c8	1272	Polšnik
00050000-5564-7c29-5375-3c0eb977e26d	3313	Polzela
00050000-5564-7c29-5d96-0eec42b9d2ae	3232	Ponikva
00050000-5564-7c29-0b58-35b8e05132aa	6320	Portorož/Portorose
00050000-5564-7c29-1bbb-4c44b8adf7bd	6230	Postojna
00050000-5564-7c29-ab1b-4c85829e6a2b	2331	Pragersko
00050000-5564-7c29-a24c-ef1e163a33aa	3312	Prebold
00050000-5564-7c29-2046-8d6a66b5087d	4205	Preddvor
00050000-5564-7c29-7055-562f97504ed0	6255	Prem
00050000-5564-7c29-d5c0-94afe6de3c8c	1352	Preserje
00050000-5564-7c29-8ff8-b9f6089ad221	6258	Prestranek
00050000-5564-7c29-f91a-f8a3316ed537	2391	Prevalje
00050000-5564-7c29-00ba-286f67a0a771	3262	Prevorje
00050000-5564-7c29-8802-334854e3813d	1276	Primskovo 
00050000-5564-7c29-cc5c-527b055add66	3253	Pristava pri Mestinju
00050000-5564-7c29-4a91-401912df6b09	9207	Prosenjakovci/Partosfalva
00050000-5564-7c29-158c-5637f54dd3c1	5297	Prvačina
00050000-5564-7c29-f26e-2c60a1bb8214	2250	Ptuj
00050000-5564-7c29-c023-d6a1fe4d1e24	2323	Ptujska Gora
00050000-5564-7c29-5d23-785eb68a7702	9201	Puconci
00050000-5564-7c29-dde5-bcbeb08a13e6	2327	Rače
00050000-5564-7c29-4b9f-6846445d108d	1433	Radeče
00050000-5564-7c29-d298-3d0b918b16ba	9252	Radenci
00050000-5564-7c29-c7c5-c558fe25ed84	2360	Radlje ob Dravi
00050000-5564-7c29-f89a-901f4ec542d3	1235	Radomlje
00050000-5564-7c29-7dce-2294f108126e	4240	Radovljica
00050000-5564-7c29-8257-051167e2d8a9	8274	Raka
00050000-5564-7c29-c57e-9e979df43d98	1381	Rakek
00050000-5564-7c29-9326-05e4b6cf7e4a	4283	Rateče - Planica
00050000-5564-7c29-8e3b-9a3642c6c69d	2390	Ravne na Koroškem
00050000-5564-7c29-3dc2-1fa7e9a8bce1	9246	Razkrižje
00050000-5564-7c29-2aa2-5c49c541cfdf	3332	Rečica ob Savinji
00050000-5564-7c29-497c-1e6af92687f6	5292	Renče
00050000-5564-7c29-e8b2-4dcda02197ad	1310	Ribnica
00050000-5564-7c29-3d56-a4a4b069b6b6	2364	Ribnica na Pohorju
00050000-5564-7c29-ee2b-a1ec9e0ed261	3272	Rimske Toplice
00050000-5564-7c29-709e-9d608d59e23f	1314	Rob
00050000-5564-7c29-b785-9eb7b3e8419c	5215	Ročinj
00050000-5564-7c29-fe82-46d435a1a284	3250	Rogaška Slatina
00050000-5564-7c29-4680-b17321d01d18	9262	Rogašovci
00050000-5564-7c29-d5dc-8f7241273d3b	3252	Rogatec
00050000-5564-7c29-d50e-66397140c851	1373	Rovte
00050000-5564-7c29-d3fb-91514be4315f	2342	Ruše
00050000-5564-7c29-3bc7-3f05b8e9d481	1282	Sava
00050000-5564-7c29-8d91-64035f76387c	6333	Sečovlje/Sicciole
00050000-5564-7c29-5cfd-c78df1f359a4	4227	Selca
00050000-5564-7c29-cc7b-9846e5ac681b	2352	Selnica ob Dravi
00050000-5564-7c29-36dd-a4f867b7b218	8333	Semič
00050000-5564-7c29-3825-a02b8c393e5a	8281	Senovo
00050000-5564-7c29-0ea5-9a9cfe1bcafd	6224	Senožeče
00050000-5564-7c29-1410-7dabfa359acd	8290	Sevnica
00050000-5564-7c29-5e20-ef0c63fa78d2	6210	Sežana
00050000-5564-7c29-14ff-2a67885a3f39	2214	Sladki Vrh
00050000-5564-7c29-9189-b3586144a39e	5283	Slap ob Idrijci
00050000-5564-7c29-5574-212562864f25	2380	Slovenj Gradec
00050000-5564-7c29-f40f-8680ec3f9833	2310	Slovenska Bistrica
00050000-5564-7c29-8553-3574f39d0f2b	3210	Slovenske Konjice
00050000-5564-7c29-3d6f-bd2ccc5cfbf0	1216	Smlednik
00050000-5564-7c29-c670-8bc030d57472	5232	Soča
00050000-5564-7c29-3f0d-2647e345b4dd	1317	Sodražica
00050000-5564-7c29-aa77-1a991545b529	3335	Solčava
00050000-5564-7c29-f0d0-e605b6c5ee75	5250	Solkan
00050000-5564-7c29-2fc0-c3ed5abd4286	4229	Sorica
00050000-5564-7c29-36c7-0dffe8765ec6	4225	Sovodenj
00050000-5564-7c29-00b8-59f822ab966e	5281	Spodnja Idrija
00050000-5564-7c29-3eca-c85876441e0b	2241	Spodnji Duplek
00050000-5564-7c29-706d-a5922ddca1c0	9245	Spodnji Ivanjci
00050000-5564-7c29-4ffb-e32379ca1f37	2277	Središče ob Dravi
00050000-5564-7c29-e758-47833cfeeb5f	4267	Srednja vas v Bohinju
00050000-5564-7c29-24d0-8839f4ff2732	8256	Sromlje 
00050000-5564-7c29-971a-f308ce98cc51	5224	Srpenica
00050000-5564-7c29-e121-f09d71fe0fb6	1242	Stahovica
00050000-5564-7c29-1469-363e0d8abb4b	1332	Stara Cerkev
00050000-5564-7c29-3a5a-0b887cca8a79	8342	Stari trg ob Kolpi
00050000-5564-7c29-7a4c-463f0854fc1a	1386	Stari trg pri Ložu
00050000-5564-7c29-31e9-d4a778856458	2205	Starše
00050000-5564-7c29-ca73-981fbe91a15c	2289	Stoperce
00050000-5564-7c29-f588-d5760de15ffe	8322	Stopiče
00050000-5564-7c29-0811-b8ecac4a9c02	3206	Stranice
00050000-5564-7c29-81b5-2f4f8d15797b	8351	Straža
00050000-5564-7c29-6b31-693169f30ea3	1313	Struge
00050000-5564-7c29-e004-17f9b1e5f389	8293	Studenec
00050000-5564-7c29-3287-52387559e71e	8331	Suhor
00050000-5564-7c29-8c0d-60b33eb21d27	2233	Sv. Ana v Slovenskih goricah
00050000-5564-7c29-47fa-921eeea69714	2235	Sv. Trojica v Slovenskih goricah
00050000-5564-7c29-1751-0e085a741473	2353	Sveti Duh na Ostrem Vrhu
00050000-5564-7c29-6c14-b286beb284bd	9244	Sveti Jurij ob Ščavnici
00050000-5564-7c29-4241-decc0c3d2fe9	3264	Sveti Štefan
00050000-5564-7c29-ce0d-7c761fc522cb	2258	Sveti Tomaž
00050000-5564-7c29-9dae-f4ddb94ace0b	9204	Šalovci
00050000-5564-7c29-ac11-05dc7d085970	5261	Šempas
00050000-5564-7c29-dd48-786235c298fc	5290	Šempeter pri Gorici
00050000-5564-7c29-7692-a78302ad6349	3311	Šempeter v Savinjski dolini
00050000-5564-7c29-6ef1-a936323ea28b	4208	Šenčur
00050000-5564-7c29-5d1e-452e835e4235	2212	Šentilj v Slovenskih goricah
00050000-5564-7c29-84da-e32ca2a16f3c	8297	Šentjanž
00050000-5564-7c29-18e0-3486d8befeb9	2373	Šentjanž pri Dravogradu
00050000-5564-7c29-dbac-6dd525b7e443	8310	Šentjernej
00050000-5564-7c29-ba47-cc55b8c5e469	3230	Šentjur
00050000-5564-7c29-7a68-989747c8a6b2	3271	Šentrupert
00050000-5564-7c29-454f-f149c72e3a76	8232	Šentrupert
00050000-5564-7c29-2cef-990148721d3d	1296	Šentvid pri Stični
00050000-5564-7c29-3323-bf10e13f56d2	8275	Škocjan
00050000-5564-7c29-806c-492d5cc3aaa3	6281	Škofije
00050000-5564-7c29-c41b-e4b6c110e18f	4220	Škofja Loka
00050000-5564-7c29-e8e8-8185d3dd08de	3211	Škofja vas
00050000-5564-7c29-1f52-e90847f7f302	1291	Škofljica
00050000-5564-7c29-b2c6-0eaf57db6f32	6274	Šmarje
00050000-5564-7c29-4281-5eb02085c689	1293	Šmarje - Sap
00050000-5564-7c29-a6e3-c6f0b9839208	3240	Šmarje pri Jelšah
00050000-5564-7c29-0dcb-0a98a4cf187a	8220	Šmarješke Toplice
00050000-5564-7c29-504f-bcf415025ebf	2315	Šmartno na Pohorju
00050000-5564-7c29-6792-dfa2cca7866b	3341	Šmartno ob Dreti
00050000-5564-7c29-67c8-740b10066386	3327	Šmartno ob Paki
00050000-5564-7c29-6153-aeaffcc18deb	1275	Šmartno pri Litiji
00050000-5564-7c29-0ab6-406f0fc4ac86	2383	Šmartno pri Slovenj Gradcu
00050000-5564-7c29-e24d-7c78c43ded7d	3201	Šmartno v Rožni dolini
00050000-5564-7c29-57b5-0300f40a9ca7	3325	Šoštanj
00050000-5564-7c29-2705-9c2fa862c192	6222	Štanjel
00050000-5564-7c29-8cd9-6051d079ab2c	3220	Štore
00050000-5564-7c29-6fa4-aaf24d3d6d8d	3304	Tabor
00050000-5564-7c29-fa7a-d35e123fd147	3221	Teharje
00050000-5564-7c29-c751-e9c8a637654a	9251	Tišina
00050000-5564-7c29-9c8c-61cac9804e21	5220	Tolmin
00050000-5564-7c29-35b6-4f7e09fb25d1	3326	Topolšica
00050000-5564-7c29-266e-fd0f07c19dde	2371	Trbonje
00050000-5564-7c29-8d3c-53868b69295a	1420	Trbovlje
00050000-5564-7c29-d9a1-552ada51bb24	8231	Trebelno 
00050000-5564-7c29-e200-643a308ac35e	8210	Trebnje
00050000-5564-7c29-a784-46057fd7da2b	5252	Trnovo pri Gorici
00050000-5564-7c29-2050-e459fc2c11d6	2254	Trnovska vas
00050000-5564-7c29-8652-b57b6f3170c4	1222	Trojane
00050000-5564-7c29-ec99-2355d5e94d0e	1236	Trzin
00050000-5564-7c29-b69c-568632595034	4290	Tržič
00050000-5564-7c29-400b-445bfa7d54e5	8295	Tržišče
00050000-5564-7c29-7bd2-39831e3e2295	1311	Turjak
00050000-5564-7c29-0428-9a65ac8402db	9224	Turnišče
00050000-5564-7c29-20d0-87affd3b1ba7	8323	Uršna sela
00050000-5564-7c29-07b9-0bf70d32ec20	1252	Vače
00050000-5564-7c29-60ab-c4f6092dfd49	3320	Velenje 
00050000-5564-7c29-f57d-60542cf4ec0c	3322	Velenje - poštni predali
00050000-5564-7c29-60de-359c08220ffe	8212	Velika Loka
00050000-5564-7c29-f608-a290cebd9912	2274	Velika Nedelja
00050000-5564-7c29-6fe9-016c9df91099	9225	Velika Polana
00050000-5564-7c29-df84-9a5d93d1c1f3	1315	Velike Lašče
00050000-5564-7c29-dbd6-28fc242b5a10	8213	Veliki Gaber
00050000-5564-7c29-06f9-f226db8e5044	9241	Veržej
00050000-5564-7c29-f6b8-a9cf5536abf6	1312	Videm - Dobrepolje
00050000-5564-7c29-b505-b432b4cb6c9c	2284	Videm pri Ptuju
00050000-5564-7c29-a7bf-3f721d569ef1	8344	Vinica
00050000-5564-7c29-e15a-27fe8ff04d06	5271	Vipava
00050000-5564-7c29-8db4-c79b3ffc8da7	4212	Visoko
00050000-5564-7c29-11bd-40e9f531d009	1294	Višnja Gora
00050000-5564-7c29-2656-f4c0cf543d02	3205	Vitanje
00050000-5564-7c29-e786-9981cb42d051	2255	Vitomarci
00050000-5564-7c29-19f8-f40984e8d829	1217	Vodice
00050000-5564-7c29-80f2-35441fbd03a6	3212	Vojnik\t
00050000-5564-7c29-2330-8f3a3e2b829f	5293	Volčja Draga
00050000-5564-7c29-cf45-9c4a6428f979	2232	Voličina
00050000-5564-7c29-41cd-1deb1a26b845	3305	Vransko
00050000-5564-7c29-caa7-91bb3fe3bd21	6217	Vremski Britof
00050000-5564-7c29-f67c-db67e2bbd8bd	1360	Vrhnika
00050000-5564-7c29-d83b-4cef1b731688	2365	Vuhred
00050000-5564-7c29-4866-d4f239331d3c	2367	Vuzenica
00050000-5564-7c29-41a1-00a20547f887	8292	Zabukovje 
00050000-5564-7c29-9a56-9141f4e83937	1410	Zagorje ob Savi
00050000-5564-7c29-a9ae-5f35a4dcc96d	1303	Zagradec
00050000-5564-7c29-25e3-52821b81c15e	2283	Zavrč
00050000-5564-7c29-c4fe-37cefddd183a	8272	Zdole 
00050000-5564-7c29-bd98-59e74bd7a731	4201	Zgornja Besnica
00050000-5564-7c29-ecbe-b7cc5572e6d1	2242	Zgornja Korena
00050000-5564-7c29-ab40-59bddf868258	2201	Zgornja Kungota
00050000-5564-7c29-56b4-5a94006deb42	2316	Zgornja Ložnica
00050000-5564-7c29-1e4b-c6d6db197a65	2314	Zgornja Polskava
00050000-5564-7c29-28e2-eab8b9eebdc5	2213	Zgornja Velka
00050000-5564-7c29-6364-d2bfabe067f7	4247	Zgornje Gorje
00050000-5564-7c29-b88c-49ce0c90726f	4206	Zgornje Jezersko
00050000-5564-7c29-81fe-a4cf0d9e6d6b	2285	Zgornji Leskovec
00050000-5564-7c29-45a1-d37b082330e5	1432	Zidani Most
00050000-5564-7c29-2960-81f094e85b7e	3214	Zreče
00050000-5564-7c29-d4c0-b8a107fa80c7	4209	Žabnica
00050000-5564-7c29-3300-09bea23d96fd	3310	Žalec
00050000-5564-7c29-e83e-c561669f8f7f	4228	Železniki
00050000-5564-7c29-4192-69c7ddad8b45	2287	Žetale
00050000-5564-7c29-1fb8-24071735f4a1	4226	Žiri
00050000-5564-7c29-f2b6-6aec8a04894c	4274	Žirovnica
00050000-5564-7c29-821c-1821e928f803	8360	Žužemberk
\.


--
-- TOC entry 2723 (class 0 OID 5136445)
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
-- TOC entry 2705 (class 0 OID 5136260)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2711 (class 0 OID 5136338)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2725 (class 0 OID 5136457)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2738 (class 0 OID 5136577)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2742 (class 0 OID 5136628)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2729 (class 0 OID 5136486)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5564-7c2b-181e-5456e10e9912	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5564-7c2b-1fc2-118d0fdedb03	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5564-7c2b-814b-a931502d6f1c	0003	Kazinska	t	84	Kazinska dvorana
00220000-5564-7c2b-eb49-11351dc094fd	0004	Mali oder	t	24	Mali oder 
00220000-5564-7c2b-edd9-cd5c00abb5fe	0005	Komorni oder	t	15	Komorni oder
00220000-5564-7c2b-d0f3-93e05b7d7c01	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5564-7c2b-bd2b-a3993d4b3d95	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2721 (class 0 OID 5136430)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2720 (class 0 OID 5136420)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2741 (class 0 OID 5136617)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2736 (class 0 OID 5136554)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2694 (class 0 OID 5136133)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5564-7c2a-ee01-318ba7dd9979	00010000-5564-7c2a-b003-5e592d86d22d	2015-05-26 15:59:07	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROUM4NqVkmTN4Dy68nxf/p4H8jkFYbz9K";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2760 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2730 (class 0 OID 5136496)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2698 (class 0 OID 5136171)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5564-7c2a-3029-1731c5bdb41f	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5564-7c2a-ff6b-b2a30660efa8	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5564-7c2a-76d1-db5c82a4ea5a	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5564-7c2a-4d46-46dba79e7ce3	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5564-7c2a-b929-ce759be0bebd	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5564-7c2a-4cbc-f6f204514929	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2696 (class 0 OID 5136155)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5564-7c2a-ee01-318ba7dd9979	00020000-5564-7c2a-4d46-46dba79e7ce3
00010000-5564-7c2a-b003-5e592d86d22d	00020000-5564-7c2a-4d46-46dba79e7ce3
\.


--
-- TOC entry 2732 (class 0 OID 5136510)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2724 (class 0 OID 5136451)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2718 (class 0 OID 5136401)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2750 (class 0 OID 5136723)
-- Dependencies: 230
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5564-7c2a-89fc-7a276caa7804	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5564-7c2a-9775-4571e9271716	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5564-7c2a-5aaa-00e214f77a1c	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5564-7c2a-4fc3-5b41da35fc7e	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5564-7c2a-dfb9-857924256528	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2749 (class 0 OID 5136716)
-- Dependencies: 229
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5564-7c2a-c3c9-95cd4371ac4b	00000000-5564-7c2a-4fc3-5b41da35fc7e	popa
00000000-5564-7c2a-dec5-e10540668a83	00000000-5564-7c2a-4fc3-5b41da35fc7e	oseba
00000000-5564-7c2a-0679-ff5bd0f22430	00000000-5564-7c2a-9775-4571e9271716	prostor
00000000-5564-7c2a-c908-23f1f5c63ba4	00000000-5564-7c2a-4fc3-5b41da35fc7e	besedilo
00000000-5564-7c2a-752b-385fabf22d60	00000000-5564-7c2a-4fc3-5b41da35fc7e	uprizoritev
00000000-5564-7c2a-792c-3f845b159fcb	00000000-5564-7c2a-4fc3-5b41da35fc7e	funkcija
00000000-5564-7c2a-63fd-05bfacc947b3	00000000-5564-7c2a-4fc3-5b41da35fc7e	tipfunkcije
\.


--
-- TOC entry 2748 (class 0 OID 5136711)
-- Dependencies: 228
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2737 (class 0 OID 5136564)
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
-- TOC entry 2703 (class 0 OID 5136232)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2719 (class 0 OID 5136407)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2740 (class 0 OID 5136606)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5564-7c2a-cd45-5ae64c79836c	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5564-7c2a-84fc-0f3233d46864	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5564-7c2a-1072-f37f3733c97c	Baletnik ali plesalec	Baletniki in plesalci	\N	Baletnica ali plesalka	igralec
000f0000-5564-7c2a-7ad7-21371561cfe1	Avtor	Avtorji	\N	Avtorka	umetnik
000f0000-5564-7c2a-0a19-a1075d4297c8	Režiser	Režiserji	\N	Režiserka	umetnik
000f0000-5564-7c2a-c81c-8d491ac21de5	Scenograf	Scenografi	\N	Scenografka	tehnik
000f0000-5564-7c2a-6539-00c0045fc033	Kostumograf	Kostumografi	\N	Kostumografinja	tehnik
000f0000-5564-7c2a-3f8c-df4ee4240ae6	Oblikovalec maske	Oblikovalci maske	\N	Oblikovalka maske	tehnik
000f0000-5564-7c2a-4ef1-2e09693549d1	Avtor glasbe	Avtorji glasbe	\N	Avtorica glasbe	umetnik
000f0000-5564-7c2a-6df3-d0dea654f8d5	Oblikovalec svetlobe	Oblikovalci svetlobe	\N	Oblikovalka svetlobe	tehnik
000f0000-5564-7c2a-0a70-1c87f54c5e83	Koreograf	Koreografi	\N	Koreografinja	umetnik
000f0000-5564-7c2a-8ea1-6666b988f79c	Dramaturg	Dramaturgi	\N	Dramaturginja	umetnik
000f0000-5564-7c2a-6274-314372fd5db1	Lektorj	Lektorji	\N	Lektorica	umetnik
000f0000-5564-7c2a-0883-7526805512d0	Prevajalec	Prevajalci	\N	Prevajalka	umetnik
000f0000-5564-7c2a-3830-8575e9491d40	Oblikovalec videa	Oblikovalci videa	\N	Oblikovalka videa	umetnik
000f0000-5564-7c2a-cecd-e547ba4033ac	Intermedijski ustvarjalec	Intermedijski ustvarjalci	\N	Intermedijska ustvarjalka	umetnik
\.


--
-- TOC entry 2708 (class 0 OID 5136295)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2695 (class 0 OID 5136142)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5564-7c2a-b003-5e592d86d22d	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO4JoaAJaC3fNGH6s6jXokJ22omRR9qli	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5564-7c2a-9889-c575a4bed551	Jani	$2y$05$NS4xMjkyMTcwMzExMjAxROy31yUxI0h651B4M68uogTWxWkuyYAhe	t	\N	\N	\N	jani@ifigenija.si	\N	\N	\N
00010000-5564-7c2a-28dc-dcd552d615f0	Tona	$2y$05$NS4xMjkyMTcwMzExMjAxROUn4Vf6FvN6/4CSCqGTXa5m6JIDzQ80.	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5564-7c2a-0fe0-2b057555c919	Ivo	$2y$05$NS4xMjkyMTcwMzExMjAxROb/UXQAZFaFy9o2Lv5fLrOiy8g2UlScC	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5564-7c2a-8009-2248d62a74f5	Jože	$2y$05$NS4xMjkyMTcwMzExMjAxROAS28jUkT5e2wnrenhdSmEHamGpGsPCG	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5564-7c2a-4377-70c20d207048	Marko	$2y$05$NS4xMjkyMTcwMzExMjAxROHfrJVVY8zOROPg5.ElZK.OQx/frU1km	t	\N	\N	\N	marko@ifigenija.si	\N	\N	\N
00010000-5564-7c2a-df7e-b59d7e598a0a	Marija	$2y$05$NS4xMjkyMTcwMzExMjAxROaEzEsCSrB.q3pkoC/DLRjs4RYZ1wFci	t	\N	\N	\N	marija@ifigenija.si	\N	\N	\N
00010000-5564-7c2a-ae6b-7002e4d44aee	Ana	$2y$05$NS4xMjkyMTcwMzExMjAxROx6NAyYhSpB3MnhOYviEp6pC0QpPorCS	t	\N	\N	\N	ana@ifigenija.si	\N	\N	\N
00010000-5564-7c2a-72d0-cbdb5a9e6bd8	Maja	$2y$05$NS4xMjkyMTcwMzExMjAxROo/.SN9nOhydJgdnuhf4gToS9Q9OUflW	t	\N	\N	\N	maja@ifigenija.si	\N	\N	\N
00010000-5564-7c2a-6b79-69231d5e9128	Irena	$2y$05$NS4xMjkyMTcwMzExMjAxRO8xWeiH0jScDj6Ihq2p9zH.aLBZhIPfy	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5564-7c2a-7832-1ef5d77f9c69	Mojca	$2y$05$NS4xMjkyMTcwMzExMjAxROaTnTRqpfoZQIJwwfemcGd/TraWGNOZK	t	\N	\N	\N	mojca@ifigenija.si	\N	\N	\N
00010000-5564-7c2a-ee01-318ba7dd9979	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2745 (class 0 OID 5136661)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5564-7c2b-5c56-68145965d3e2	00160000-5564-7c2b-e94a-5f6ac6767208	00150000-5564-7c2a-317c-f6fc3fff1c1d	00140000-5564-7c2a-b75f-561c88244e32	produkcija	Sen kresne noči		Sanje	2016-02-01	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5564-7c2b-edd9-cd5c00abb5fe
000e0000-5564-7c2b-9e3b-34fb624233f8	00160000-5564-7c2b-43fb-483be925156d	00150000-5564-7c2a-81f9-9a7a8c932045	00140000-5564-7c2a-0aa6-bd10642597e3	predprodukcija-ideja	Smoletov vrt			2017-01-01	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5564-7c2b-d0f3-93e05b7d7c01
\.


--
-- TOC entry 2713 (class 0 OID 5136353)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2728 (class 0 OID 5136478)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2735 (class 0 OID 5136546)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2715 (class 0 OID 5136385)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2744 (class 0 OID 5136651)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-5564-7c2a-b75f-561c88244e32	Drama	drama (SURS 01)
00140000-5564-7c2a-6675-e59447f1f790	Opera	opera (SURS 02)
00140000-5564-7c2a-6ac8-37cfb496b6a4	Balet	balet (SURS 03)
00140000-5564-7c2a-8afa-fcebc566131f	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5564-7c2a-8453-86dd5a2a7aaa	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5564-7c2a-0aa6-bd10642597e3	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5564-7c2a-04d3-e26840f28286	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2734 (class 0 OID 5136536)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-5564-7c2a-5239-fb466efc2965	Opera	opera
00150000-5564-7c2a-ee66-0c1ad8451b44	Opereta	opereta
00150000-5564-7c2a-9aa0-ce226e4fed09	Balet	balet
00150000-5564-7c2a-a24c-3b788a47c603	Plesne prireditve	plesne prireditve
00150000-5564-7c2a-aea6-f2f77a4587f7	Lutkovno gledališče	lutkovno gledališče
00150000-5564-7c2a-f855-d4873057b646	Raziskovalno gledališče	raziskovalno gledališče
00150000-5564-7c2a-a26e-2539249c69d1	Biografska drama	biografska drama
00150000-5564-7c2a-317c-f6fc3fff1c1d	Komedija	komedija
00150000-5564-7c2a-1945-32a94e1bc08c	Črna komedija	črna komedija
00150000-5564-7c2a-64c2-acf00697641a	E-igra	E-igra
00150000-5564-7c2a-81f9-9a7a8c932045	Kriminalka	kriminalka
00150000-5564-7c2a-67da-0cdeeb213120	Musical	musical
\.


--
-- TOC entry 2315 (class 2606 OID 5136196)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 5136705)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 5136695)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 5136605)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 5136375)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 5136400)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 5136321)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 5136532)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 5136351)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 5136394)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 5136335)
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
-- TOC entry 2407 (class 2606 OID 5136443)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 5136470)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 5136293)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 5136205)
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
-- TOC entry 2322 (class 2606 OID 5136228)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2313 (class 2606 OID 5136185)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2306 (class 2606 OID 5136170)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 5136476)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 5136509)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 5136646)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2331 (class 2606 OID 5136257)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 5136281)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 5136449)
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
-- TOC entry 2337 (class 2606 OID 5136271)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 5136342)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 5136461)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 5136589)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 5136633)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 5136493)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 5136434)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 5136425)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 5136627)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 5136561)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 5136141)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 5136500)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 5136159)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2308 (class 2606 OID 5136179)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 5136518)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 5136456)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 5136406)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 5136729)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 5136720)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 5136715)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 5136574)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 5136237)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 5136416)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 5136616)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 5136306)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 5136154)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 5136676)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 5136360)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 5136484)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 5136552)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 5136389)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 5136660)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 5136545)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 1259 OID 5136382)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2454 (class 1259 OID 5136575)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2455 (class 1259 OID 5136576)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2329 (class 1259 OID 5136259)
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
-- TOC entry 2420 (class 1259 OID 5136477)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2414 (class 1259 OID 5136463)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2415 (class 1259 OID 5136462)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2366 (class 1259 OID 5136361)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2442 (class 1259 OID 5136535)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2443 (class 1259 OID 5136533)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2444 (class 1259 OID 5136534)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2354 (class 1259 OID 5136337)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2355 (class 1259 OID 5136336)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2471 (class 1259 OID 5136648)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2472 (class 1259 OID 5136649)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2473 (class 1259 OID 5136650)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2479 (class 1259 OID 5136680)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2480 (class 1259 OID 5136677)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2481 (class 1259 OID 5136679)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2482 (class 1259 OID 5136678)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2344 (class 1259 OID 5136308)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2345 (class 1259 OID 5136307)
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
-- TOC entry 2320 (class 1259 OID 5136231)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2430 (class 1259 OID 5136501)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2384 (class 1259 OID 5136395)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2310 (class 1259 OID 5136186)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2311 (class 1259 OID 5136187)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2435 (class 1259 OID 5136521)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2436 (class 1259 OID 5136520)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2437 (class 1259 OID 5136519)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2358 (class 1259 OID 5136343)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2359 (class 1259 OID 5136345)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2360 (class 1259 OID 5136344)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2498 (class 1259 OID 5136722)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2394 (class 1259 OID 5136429)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2395 (class 1259 OID 5136427)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2396 (class 1259 OID 5136426)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2397 (class 1259 OID 5136428)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2301 (class 1259 OID 5136160)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 5136161)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2423 (class 1259 OID 5136485)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2409 (class 1259 OID 5136450)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2450 (class 1259 OID 5136562)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2451 (class 1259 OID 5136563)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2333 (class 1259 OID 5136273)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2334 (class 1259 OID 5136272)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2335 (class 1259 OID 5136274)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2458 (class 1259 OID 5136590)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2459 (class 1259 OID 5136591)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2491 (class 1259 OID 5136708)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2492 (class 1259 OID 5136707)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2493 (class 1259 OID 5136710)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2494 (class 1259 OID 5136706)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2495 (class 1259 OID 5136709)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2447 (class 1259 OID 5136553)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2400 (class 1259 OID 5136438)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2401 (class 1259 OID 5136437)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2402 (class 1259 OID 5136435)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2403 (class 1259 OID 5136436)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2284 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2487 (class 1259 OID 5136697)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2488 (class 1259 OID 5136696)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2365 (class 1259 OID 5136352)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2316 (class 1259 OID 5136207)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2317 (class 1259 OID 5136206)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2325 (class 1259 OID 5136238)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2326 (class 1259 OID 5136239)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2389 (class 1259 OID 5136419)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2390 (class 1259 OID 5136418)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2391 (class 1259 OID 5136417)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2372 (class 1259 OID 5136384)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2373 (class 1259 OID 5136380)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2374 (class 1259 OID 5136377)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2375 (class 1259 OID 5136378)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2376 (class 1259 OID 5136376)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2377 (class 1259 OID 5136381)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2378 (class 1259 OID 5136379)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2332 (class 1259 OID 5136258)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2350 (class 1259 OID 5136322)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2351 (class 1259 OID 5136324)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2352 (class 1259 OID 5136323)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2353 (class 1259 OID 5136325)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2408 (class 1259 OID 5136444)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2476 (class 1259 OID 5136647)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2323 (class 1259 OID 5136229)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2324 (class 1259 OID 5136230)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2504 (class 1259 OID 5136730)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2343 (class 1259 OID 5136294)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2501 (class 1259 OID 5136721)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2428 (class 1259 OID 5136495)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2429 (class 1259 OID 5136494)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2287 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2340 (class 1259 OID 5136282)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 5136634)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2309 (class 1259 OID 5136180)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2379 (class 1259 OID 5136383)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2530 (class 2606 OID 5136868)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2533 (class 2606 OID 5136853)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2532 (class 2606 OID 5136858)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2528 (class 2606 OID 5136878)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2534 (class 2606 OID 5136848)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2529 (class 2606 OID 5136873)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2531 (class 2606 OID 5136863)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2564 (class 2606 OID 5137023)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2563 (class 2606 OID 5137028)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2515 (class 2606 OID 5136783)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2551 (class 2606 OID 5136963)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2549 (class 2606 OID 5136958)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2550 (class 2606 OID 5136953)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2527 (class 2606 OID 5136843)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2557 (class 2606 OID 5137003)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2559 (class 2606 OID 5136993)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2558 (class 2606 OID 5136998)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2521 (class 2606 OID 5136818)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2522 (class 2606 OID 5136813)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2547 (class 2606 OID 5136943)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2570 (class 2606 OID 5137048)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2569 (class 2606 OID 5137053)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2568 (class 2606 OID 5137058)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2571 (class 2606 OID 5137078)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2574 (class 2606 OID 5137063)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2572 (class 2606 OID 5137073)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2573 (class 2606 OID 5137068)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2519 (class 2606 OID 5136808)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2520 (class 2606 OID 5136803)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2511 (class 2606 OID 5136768)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2512 (class 2606 OID 5136763)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2553 (class 2606 OID 5136973)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2535 (class 2606 OID 5136883)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2508 (class 2606 OID 5136743)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2507 (class 2606 OID 5136748)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2554 (class 2606 OID 5136988)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2555 (class 2606 OID 5136983)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2556 (class 2606 OID 5136978)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2525 (class 2606 OID 5136823)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2523 (class 2606 OID 5136833)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2524 (class 2606 OID 5136828)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2582 (class 2606 OID 5137118)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2539 (class 2606 OID 5136918)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2541 (class 2606 OID 5136908)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2542 (class 2606 OID 5136903)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2540 (class 2606 OID 5136913)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2506 (class 2606 OID 5136733)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2505 (class 2606 OID 5136738)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2552 (class 2606 OID 5136968)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2548 (class 2606 OID 5136948)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2562 (class 2606 OID 5137013)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2561 (class 2606 OID 5137018)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2517 (class 2606 OID 5136793)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 5136788)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2516 (class 2606 OID 5136798)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2566 (class 2606 OID 5137033)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2565 (class 2606 OID 5137038)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2579 (class 2606 OID 5137103)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2580 (class 2606 OID 5137098)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2577 (class 2606 OID 5137113)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2581 (class 2606 OID 5137093)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2578 (class 2606 OID 5137108)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2560 (class 2606 OID 5137008)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2543 (class 2606 OID 5136938)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2544 (class 2606 OID 5136933)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2546 (class 2606 OID 5136923)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2545 (class 2606 OID 5136928)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2575 (class 2606 OID 5137088)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2576 (class 2606 OID 5137083)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2526 (class 2606 OID 5136838)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2567 (class 2606 OID 5137043)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 5136758)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2510 (class 2606 OID 5136753)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2514 (class 2606 OID 5136773)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2513 (class 2606 OID 5136778)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2536 (class 2606 OID 5136898)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2537 (class 2606 OID 5136893)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2538 (class 2606 OID 5136888)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-26 15:59:07 CEST

--
-- PostgreSQL database dump complete
--

