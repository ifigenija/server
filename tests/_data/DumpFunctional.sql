--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-25 16:27:23 CEST

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
-- TOC entry 180 (class 1259 OID 4909128)
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
-- TOC entry 227 (class 1259 OID 4909638)
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
-- TOC entry 226 (class 1259 OID 4909621)
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
-- TOC entry 219 (class 1259 OID 4909532)
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
-- TOC entry 194 (class 1259 OID 4909302)
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
-- TOC entry 197 (class 1259 OID 4909336)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 4909249)
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
-- TOC entry 213 (class 1259 OID 4909462)
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
-- TOC entry 192 (class 1259 OID 4909286)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 196 (class 1259 OID 4909330)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 4909266)
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
-- TOC entry 202 (class 1259 OID 4909379)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 4909404)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 4909223)
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
-- TOC entry 181 (class 1259 OID 4909137)
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
-- TOC entry 182 (class 1259 OID 4909148)
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
-- TOC entry 177 (class 1259 OID 4909102)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 4909121)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 4909411)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 4909442)
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
-- TOC entry 223 (class 1259 OID 4909575)
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
-- TOC entry 184 (class 1259 OID 4909180)
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
-- TOC entry 186 (class 1259 OID 4909215)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 4909385)
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
-- TOC entry 185 (class 1259 OID 4909200)
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
-- TOC entry 191 (class 1259 OID 4909278)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 4909397)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 4909517)
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
-- TOC entry 222 (class 1259 OID 4909568)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 4909426)
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
-- TOC entry 201 (class 1259 OID 4909370)
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
-- TOC entry 200 (class 1259 OID 4909360)
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
-- TOC entry 221 (class 1259 OID 4909557)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 4909494)
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
-- TOC entry 174 (class 1259 OID 4909073)
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
-- TOC entry 173 (class 1259 OID 4909071)
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
-- TOC entry 210 (class 1259 OID 4909436)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 4909111)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 4909095)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 4909450)
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
-- TOC entry 204 (class 1259 OID 4909391)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 4909341)
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
-- TOC entry 230 (class 1259 OID 4909663)
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
-- TOC entry 229 (class 1259 OID 4909656)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 4909651)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 4909504)
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
-- TOC entry 231 (class 1259 OID 4909671)
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE strosekuprizoritve_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 183 (class 1259 OID 4909172)
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
-- TOC entry 199 (class 1259 OID 4909347)
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
-- TOC entry 220 (class 1259 OID 4909546)
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
-- TOC entry 188 (class 1259 OID 4909235)
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
-- TOC entry 175 (class 1259 OID 4909082)
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
-- TOC entry 225 (class 1259 OID 4909601)
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
-- TOC entry 193 (class 1259 OID 4909293)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 4909418)
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
-- TOC entry 215 (class 1259 OID 4909486)
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
-- TOC entry 195 (class 1259 OID 4909325)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 4909591)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 4909476)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2146 (class 2604 OID 4909076)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2700 (class 0 OID 4909128)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2747 (class 0 OID 4909638)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
\.


--
-- TOC entry 2746 (class 0 OID 4909621)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2739 (class 0 OID 4909532)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2714 (class 0 OID 4909302)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2717 (class 0 OID 4909336)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2709 (class 0 OID 4909249)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5563-314a-76be-979a72a8278e	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5563-314a-7c65-8230d63b6a27	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5563-314a-aec3-dadd8fcf8dab	AL	ALB	008	Albania 	Albanija	\N
00040000-5563-314a-bd98-b4233ef94043	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5563-314a-572f-bcc86ac5a648	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5563-314a-9711-04d834956f0a	AD	AND	020	Andorra 	Andora	\N
00040000-5563-314a-d70b-f306465900b3	AO	AGO	024	Angola 	Angola	\N
00040000-5563-314a-f3a3-96d78b59dd68	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5563-314a-574c-7ba7f64586db	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5563-314a-a8c9-e8dee29ede04	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5563-314a-f687-26f815c9ea5c	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5563-314a-4622-6f8288cb0e24	AM	ARM	051	Armenia 	Armenija	\N
00040000-5563-314a-f48d-1771bf5dbf14	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5563-314a-f6b8-40ef5112382c	AU	AUS	036	Australia 	Avstralija	\N
00040000-5563-314a-b023-a6e46252e9b1	AT	AUT	040	Austria 	Avstrija	\N
00040000-5563-314a-cd22-b66169d35c7c	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5563-314a-102e-10dc1521c366	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5563-314a-05d4-5c1f2b931157	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5563-314a-22fb-0b1ffda835c2	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5563-314a-92d4-130e7d64e0a8	BB	BRB	052	Barbados 	Barbados	\N
00040000-5563-314a-5d13-e981ca196f9e	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5563-314a-c461-39768c3fa74a	BE	BEL	056	Belgium 	Belgija	\N
00040000-5563-314a-3db8-c3614547ccf6	BZ	BLZ	084	Belize 	Belize	\N
00040000-5563-314a-6e14-00f2d381549f	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5563-314a-befd-7aa66cf90f90	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5563-314a-6332-94e3329d8f1e	BT	BTN	064	Bhutan 	Butan	\N
00040000-5563-314a-d1a1-302b4e76c09c	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5563-314a-ca0d-3584372e0096	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5563-314a-00fd-e03ff4fd98e4	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5563-314a-6a7e-d7d9ef37a5a2	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5563-314a-8ea7-77df14f1979f	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5563-314a-c2f3-636b3df3cb90	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5563-314a-8a7a-5d2a30742e9a	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5563-314a-4b2e-f6db7b1327ae	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5563-314a-7947-ce739a9eea49	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5563-314a-2eac-ccf9ee675aa9	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5563-314a-dbbd-a4d4a45b49d7	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5563-314a-0b8d-a50144986527	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5563-314a-62ad-ed0953d7a0be	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5563-314a-06a9-34305d64c05a	CA	CAN	124	Canada 	Kanada	\N
00040000-5563-314a-fcb4-793965fd552e	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5563-314a-49cc-33d40f084508	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5563-314a-4965-73c70c1e2122	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5563-314a-7ee3-6d5bfd2e98f4	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5563-314a-8a85-72f030fd5476	CL	CHL	152	Chile 	Čile	\N
00040000-5563-314a-cabf-35a6d98c37c8	CN	CHN	156	China 	Kitajska	\N
00040000-5563-314a-dfc9-e2a44dc5d97e	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5563-314a-b7c6-46c528f6bbfe	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5563-314a-e24f-10c8decdf866	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5563-314a-ad22-7a5ca2dddf0b	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5563-314a-6ee1-15729603c417	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5563-314a-97d1-1510602fd290	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5563-314a-5b09-e8c9bb7b37d3	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5563-314a-58bb-3ded2c12a0dc	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5563-314a-a9eb-438490502be5	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5563-314a-b4ae-b86007117d49	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5563-314a-6532-0263c73ef36e	CU	CUB	192	Cuba 	Kuba	\N
00040000-5563-314a-50dd-0ec11664b2cc	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5563-314a-c995-e2086d44d74e	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5563-314a-94b2-fc7406e24c30	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5563-314a-8d05-e3c4eb634ea3	DK	DNK	208	Denmark 	Danska	\N
00040000-5563-314a-3774-f17a78d1a532	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5563-314a-856a-cded937eb2cd	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5563-314a-2295-b99631fc1db6	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5563-314a-5d81-ad1ac1f8c5cc	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5563-314a-5c3e-f9a27db31202	EG	EGY	818	Egypt 	Egipt	\N
00040000-5563-314a-862a-ff255159669a	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5563-314a-b049-daea4e022c78	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5563-314a-7b2b-75c21972b78c	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5563-314a-703b-780be7b1ded3	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5563-314a-361c-2f08063d5d9e	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5563-314a-6cf5-1c01aaaf72ca	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5563-314a-0ef6-27b9762ace5a	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5563-314a-3055-cc482f687728	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5563-314a-d078-238dccb63a8b	FI	FIN	246	Finland 	Finska	\N
00040000-5563-314a-f743-3ec15889fbad	FR	FRA	250	France 	Francija	\N
00040000-5563-314a-3eff-852c5ee2a847	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5563-314a-0b29-b53eab5ccce8	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5563-314a-2ab0-15695f24b0b4	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5563-314a-5e09-8baee6301c6c	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5563-314a-a4cf-cd4a0d4c469f	GA	GAB	266	Gabon 	Gabon	\N
00040000-5563-314a-7a61-edb1604694d0	GM	GMB	270	Gambia 	Gambija	\N
00040000-5563-314a-5277-2bb931c46390	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5563-314a-d701-9342448cfcdf	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5563-314a-76d5-e2d0e97d932c	GH	GHA	288	Ghana 	Gana	\N
00040000-5563-314a-e8cb-3adebf45de16	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5563-314a-47ae-1bb0079a0bd2	GR	GRC	300	Greece 	Grčija	\N
00040000-5563-314a-ddc0-e302938d03ec	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5563-314a-969c-7363f205f877	GD	GRD	308	Grenada 	Grenada	\N
00040000-5563-314a-fa84-a7ab644adc65	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5563-314a-5b68-966c5d986330	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5563-314a-bf6d-e8f5b24a65fe	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5563-314a-6bdc-368810a15628	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5563-314a-17f6-c90b9cb891a9	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5563-314a-4b8a-3764a51f2939	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5563-314a-8e0a-828b4e69644f	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5563-314a-1ceb-33fefc618af1	HT	HTI	332	Haiti 	Haiti	\N
00040000-5563-314a-140c-f3fe4c61a196	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5563-314a-518d-0905a7135d83	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5563-314a-a7cf-d69194e6ab00	HN	HND	340	Honduras 	Honduras	\N
00040000-5563-314a-9394-1f40f093ec6a	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5563-314a-7bbf-5334a4acfe36	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5563-314a-e52d-240fd7c2c951	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5563-314a-d465-7f7a246d74d5	IN	IND	356	India 	Indija	\N
00040000-5563-314a-7b09-889eb7bb02b3	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5563-314a-9866-a5f6a6b535b5	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5563-314a-fc24-d4d2e423fb34	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5563-314a-1f4f-bb0bec5a0ef6	IE	IRL	372	Ireland 	Irska	\N
00040000-5563-314a-3608-b86b385ba9c0	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5563-314a-41ec-2060d4abc61b	IL	ISR	376	Israel 	Izrael	\N
00040000-5563-314a-cb83-a8d91883a977	IT	ITA	380	Italy 	Italija	\N
00040000-5563-314a-bfaa-17a7bb5ea190	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5563-314a-eeaa-53af0ad878fc	JP	JPN	392	Japan 	Japonska	\N
00040000-5563-314a-5d4d-e3a205e3745d	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5563-314a-df9d-d2d4eaab4b38	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5563-314a-8e92-159802006a90	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5563-314a-f0bc-329c43fe4278	KE	KEN	404	Kenya 	Kenija	\N
00040000-5563-314a-84fa-fd31d1a37e87	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5563-314a-73f6-c122272ea5d3	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5563-314a-a4ce-71df30de7a79	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5563-314a-38a5-78f5180fe422	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5563-314a-a61c-924e83a620c5	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5563-314a-3c14-941666847fa4	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5563-314a-f0a1-78ad437c8a22	LV	LVA	428	Latvia 	Latvija	\N
00040000-5563-314a-847c-27773a44221e	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5563-314a-24e1-b023def30b91	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5563-314a-577d-5b84cffe10db	LR	LBR	430	Liberia 	Liberija	\N
00040000-5563-314a-12dd-8001b7475554	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5563-314a-0f42-10100fd2a48b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5563-314a-2a3d-9e73a7ea27ad	LT	LTU	440	Lithuania 	Litva	\N
00040000-5563-314a-bf44-e1046ec8ca48	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5563-314a-feeb-52ceff0c077a	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5563-314a-a7a4-1f211129ed20	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5563-314a-88f7-a1d561a69843	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5563-314a-437f-a5445201f594	MW	MWI	454	Malawi 	Malavi	\N
00040000-5563-314a-c826-a30586d9a17a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5563-314a-667a-a6133c56e8c7	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5563-314a-d1a4-a61b35ac6369	ML	MLI	466	Mali 	Mali	\N
00040000-5563-314a-3490-7bd2329f484e	MT	MLT	470	Malta 	Malta	\N
00040000-5563-314a-1720-85a7a85a3064	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5563-314a-547a-3395585b4aff	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5563-314a-66d7-5fefc7f30c79	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5563-314a-55d1-f78afd0564c5	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5563-314a-997d-a5dfcc9b3fd3	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5563-314a-7cef-bb1d672a5201	MX	MEX	484	Mexico 	Mehika	\N
00040000-5563-314a-6d80-148ca76ef35e	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5563-314a-489f-2ca22fe0185e	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5563-314a-4184-9786cd954be2	MC	MCO	492	Monaco 	Monako	\N
00040000-5563-314a-57fb-e27c9148e520	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5563-314a-acbc-31f98e9d0fe7	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5563-314a-83d9-7f5a31da11dc	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5563-314a-afdb-22ad646efa0a	MA	MAR	504	Morocco 	Maroko	\N
00040000-5563-314a-224e-3afa009fbf4f	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5563-314a-1d44-d30dda476f9c	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5563-314a-d0ab-4a108076004f	NA	NAM	516	Namibia 	Namibija	\N
00040000-5563-314a-7bf7-d2875a745107	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5563-314a-9ed7-24e7b7970616	NP	NPL	524	Nepal 	Nepal	\N
00040000-5563-314a-f65c-aa2e65fea10e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5563-314a-a742-839c3f51eebb	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5563-314a-7c5f-9a65d0d86082	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5563-314a-8a66-3472e9fec28e	NE	NER	562	Niger 	Niger 	\N
00040000-5563-314a-5268-525b5fe4d784	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5563-314a-dc01-e203f8870701	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5563-314a-b2ac-f75fa051fdb6	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5563-314a-e252-d0f82a388f6f	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5563-314a-9627-97851c32ce58	NO	NOR	578	Norway 	Norveška	\N
00040000-5563-314a-8f14-06b4d4313f94	OM	OMN	512	Oman 	Oman	\N
00040000-5563-314a-2660-d8109a2ee35b	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5563-314a-7f02-08fa4c646c35	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5563-314a-503a-11f8cfc36464	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5563-314a-25b5-10d358627b68	PA	PAN	591	Panama 	Panama	\N
00040000-5563-314a-dfed-0c705d7ef06f	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5563-314a-4368-206b9bf1072e	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5563-314a-0f71-4edf9d87e196	PE	PER	604	Peru 	Peru	\N
00040000-5563-314a-ad50-7c5657f7cf52	PH	PHL	608	Philippines 	Filipini	\N
00040000-5563-314a-9961-cdc7f039c9de	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5563-314a-15c5-85d281944c65	PL	POL	616	Poland 	Poljska	\N
00040000-5563-314a-71d8-e5d826320c61	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5563-314a-d7bb-af3e5d57faee	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5563-314a-17cd-ddc052442cf6	QA	QAT	634	Qatar 	Katar	\N
00040000-5563-314a-2410-999b95ebc831	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5563-314a-bb5e-70a5c9aa07b3	RO	ROU	642	Romania 	Romunija	\N
00040000-5563-314a-b586-51c854e64d1d	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5563-314a-82f0-473c7d20d48e	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5563-314a-b31b-693e3738b20c	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5563-314a-0a70-22b45e9d8b4d	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5563-314a-d67e-9dbe272ba369	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5563-314a-49c4-9fc8cb978221	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5563-314a-c2f9-279321f12cc7	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5563-314a-3d1b-60cf104bc2b1	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5563-314a-06d8-b73e331dddfd	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5563-314a-be8a-c06db47256e7	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5563-314a-ff34-355ea3bf4c06	SM	SMR	674	San Marino 	San Marino	\N
00040000-5563-314a-18b0-77d09736d8f5	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5563-314a-7227-91f6fc39e1f2	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5563-314a-3b9f-6997325e266c	SN	SEN	686	Senegal 	Senegal	\N
00040000-5563-314a-9d80-83a9c263719e	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5563-314a-52be-c9ad6f7597c3	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5563-314a-32ba-594a0901576a	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5563-314a-8cf4-5d8b349eafc0	SG	SGP	702	Singapore 	Singapur	\N
00040000-5563-314a-5f85-eb5b0aa4bd03	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5563-314a-38c3-aa544ef70452	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5563-314a-934f-a347a151a68b	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5563-314a-7d1a-f2cb04403d7c	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5563-314a-c9ae-a8e535bb46fa	SO	SOM	706	Somalia 	Somalija	\N
00040000-5563-314a-c969-b957295c3e92	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5563-314a-2959-56c7a9bb9be5	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5563-314a-5f9d-e26c8ebfb686	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5563-314a-34d2-5fe0d108307c	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5563-314a-517e-3679dd9ec4fd	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5563-314a-7d87-ea69d851f0b3	SD	SDN	729	Sudan 	Sudan	\N
00040000-5563-314a-dadd-9499ebcfb50a	SR	SUR	740	Suriname 	Surinam	\N
00040000-5563-314a-d323-004dcca9aa46	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5563-314a-0c54-4ac1a8d0ce3f	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5563-314a-c86c-fdf75490d528	SE	SWE	752	Sweden 	Švedska	\N
00040000-5563-314a-24c6-1b8caee6dc49	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5563-314a-9d00-b68529af5ac6	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5563-314a-984e-622fdb561ebc	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5563-314a-b6c8-c8dc45099994	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5563-314a-437b-5c53a3a84cfd	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5563-314a-9913-2077fa502246	TH	THA	764	Thailand 	Tajska	\N
00040000-5563-314a-6e59-4935eb69269f	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5563-314a-2acb-5d67ad844d70	TG	TGO	768	Togo 	Togo	\N
00040000-5563-314a-ca37-55e7921bd134	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5563-314a-1c05-eab4ecca9f26	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5563-314a-8fb7-b7bf314d41a7	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5563-314a-dcc0-5cb191643f94	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5563-314a-88af-bd0d0aca04f1	TR	TUR	792	Turkey 	Turčija	\N
00040000-5563-314a-a9e1-852e81d954ae	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5563-314a-c7db-748b17a2c375	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5563-314a-e197-34d6a13e9436	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5563-314a-4a2e-2f03e5463032	UG	UGA	800	Uganda 	Uganda	\N
00040000-5563-314a-c342-31127266b311	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5563-314a-7130-cb89b2b3b384	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5563-314a-7192-ef3583a79b78	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5563-314a-8efe-782004a90da5	US	USA	840	United States 	Združene države Amerike	\N
00040000-5563-314a-864a-dd98366342e3	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5563-314a-aba6-32705198ba46	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5563-314a-1a47-eb6b62e48eb1	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5563-314a-ce2c-416c49135fac	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5563-314a-ac29-2856b4eaf311	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5563-314a-039c-149b6826d006	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5563-314a-7887-a800b42d6ec8	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5563-314a-514e-6974b88128ff	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5563-314a-646b-a3c786404810	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5563-314a-bb34-cbc14e3f0a7b	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5563-314a-bcf2-edb5a7eaf1a5	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5563-314a-df58-18af8c8dc10a	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5563-314a-b1e1-b218a3f2e486	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2733 (class 0 OID 4909462)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj) FROM stdin;
\.


--
-- TOC entry 2712 (class 0 OID 4909286)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2716 (class 0 OID 4909330)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2710 (class 0 OID 4909266)
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
-- TOC entry 2722 (class 0 OID 4909379)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2726 (class 0 OID 4909404)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2707 (class 0 OID 4909223)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5563-314a-9835-159f008e4fd1	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5563-314a-511f-c8122eba8ffc	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5563-314a-4f36-fd85914cfff2	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5563-314a-e5d3-aa9a33c402c9	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5563-314a-14d8-fd651aef138a	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5563-314a-29ad-90187d5bac94	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5563-314a-e4d9-aa4edeefe502	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5563-314a-74c0-8c8183ed0c3b	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5563-314a-88b4-98545275c5e9	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5563-314a-bcb9-9b9e9d654c63	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5563-314a-d6c3-8d305c2debcf	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5563-314a-8c21-31650586eda4	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5563-314a-7e85-98dff14c19b1	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5563-314a-36be-4aa14f773d08	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5563-314a-bbc1-807ff10da352	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2701 (class 0 OID 4909137)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5563-314a-d4f2-1536952ccbaa	00000000-5563-314a-14d8-fd651aef138a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5563-314a-3a25-69f279a0089e	00000000-5563-314a-14d8-fd651aef138a	00010000-5563-314a-77c6-23f697ad0f30	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5563-314a-8770-46f1035875bc	00000000-5563-314a-29ad-90187d5bac94	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2702 (class 0 OID 4909148)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5563-314b-cd0c-3214c6da14a8	\N	\N	0001	g.	123456789	Novak	a	Peter	Jani	jani.novak@xxx.xx	1958-01-06	\N	0601958000000	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5563-314b-0e7e-4ae91bb61d68	\N	\N	0002	dr.	234567890	Horvat	b			anton.horvat@xxx.xx	1968-02-12	\N	1202968111111	M		Slovenija	Slovenija	Maribor
00090000-5563-314b-211e-932470ee8317	\N	\N	0003		345678901	Kovačič	c			ivan.kovacic@xxx.xx	1975-03-26	\N	2603976222222	M		Slovenija	Slovenija	Celje
00090000-5563-314b-a89a-597e12ccc98c	\N	\N	0004	prof.	456789012	Krajnc	d		Joža	jozef.krajnc@xxx.xx	1971-04-30	\N	3004971333333	M		Slovenija	Slovenija	Kranj
00090000-5563-314b-085a-3107aef3c522	\N	\N	0005		567890123	Zupančič	e			marko.zupancic@xxx.xx	1984-05-07	\N	0705984444444	M		Slovenija	Slovenija	Koper
00090000-5563-314b-54af-06d967ee8e8e	\N	\N	0006	ga.	678901234	Kovač	f			marija.kovac@xxx.xx	1962-06-19	\N	1906962444444	Z		Slovenija	Slovenija	Murska Sobota
00090000-5563-314b-7178-53087c15e8a8	\N	\N	0007	ga.	789012345	Potočnik	g			ana.potocnik@xxx.xx	1975-07-24	\N	2407975555555	Z		Slovenija	Slovenija	Novo Mesto
00090000-5563-314b-be55-bd643aab3628	\N	\N	0008	ga.	890123456	Mlakar	h			maja.mlakar@xxx.xx	1986-08-02	\N	0208986666666	Z		Slovenija	Slovenija	Nova Gorica
00090000-5563-314b-80b2-da48d3f223d5	\N	\N	0009		901234567	Kos	i			irena.kos@xxx.xx	1967-09-14	\N	1409967777777	Z		Slovenija	Slovenija	Ptuj
00090000-5563-314b-af22-7faec94dbcf0	\N	\N	0010		901234567	Vidmar	J			mojca.vidmar@xxx.xx	1967-09-14	\N	1409967777777	Z		Slovenija	Slovenija	Idrija
\.


--
-- TOC entry 2692 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2697 (class 0 OID 4909102)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5563-314a-03a8-58be484640c2	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5563-314a-f4f4-e1e6a7652267	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5563-314a-b1c9-e887f76c7c8b	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5563-314a-d030-b435f2e877d1	Abonma-read	Abonma - branje	f
00030000-5563-314a-81ae-cdd2ad535fed	Abonma-write	Abonma - spreminjanje	f
00030000-5563-314a-3ed9-27f6699fcdd7	Alternacija-read	Alternacija - branje	f
00030000-5563-314a-e367-bc16a9079f86	Alternacija-write	Alternacija - spreminjanje	f
00030000-5563-314a-dfd1-1eec431668c0	Arhivalija-read	Arhivalija - branje	f
00030000-5563-314a-430f-36d4f7d7346c	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5563-314a-906d-c8e4c805f5fd	Besedilo-read	Besedilo - branje	f
00030000-5563-314a-2c8c-373d6fb28fcb	Besedilo-write	Besedilo - spreminjanje	f
00030000-5563-314a-4687-62cc5d85cfb4	DogodekIzven-read	DogodekIzven - branje	f
00030000-5563-314a-3522-8dc45aba2eaa	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5563-314a-3e31-c851767b2cbf	Dogodek-read	Dogodek - branje	f
00030000-5563-314a-0a08-782a47abcb2f	Dogodek-write	Dogodek - spreminjanje	f
00030000-5563-314a-3d7c-1aebd77b73ce	Drzava-read	Drzava - branje	f
00030000-5563-314a-9b7e-60f6047cdf30	Drzava-write	Drzava - spreminjanje	f
00030000-5563-314a-de9e-e3970ebacebe	Funkcija-read	Funkcija - branje	f
00030000-5563-314a-9dc4-cc66a3b46b70	Funkcija-write	Funkcija - spreminjanje	f
00030000-5563-314a-132d-1336081ee5ea	Gostovanje-read	Gostovanje - branje	f
00030000-5563-314a-368e-38c67e2d369b	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5563-314a-d884-9bfa8c1b32e8	Gostujoca-read	Gostujoca - branje	f
00030000-5563-314a-86b4-e5bf84e449ac	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5563-314a-11e3-8052fdcf19bc	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5563-314a-6315-c0aa99c45a3d	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5563-314a-557e-40d10747b7fb	Kupec-read	Kupec - branje	f
00030000-5563-314a-6f23-a26022f49b47	Kupec-write	Kupec - spreminjanje	f
00030000-5563-314a-7ce2-733bd1187c8c	NacinPlacina-read	NacinPlacina - branje	f
00030000-5563-314a-4f01-9f10bc60e730	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5563-314a-17d5-b6102361fdef	Option-read	Option - branje	f
00030000-5563-314a-e027-c35c97459f6f	Option-write	Option - spreminjanje	f
00030000-5563-314a-b81e-9ca713c8a7ee	OptionValue-read	OptionValue - branje	f
00030000-5563-314a-40fe-20a378476384	OptionValue-write	OptionValue - spreminjanje	f
00030000-5563-314a-20cf-f03dc96c5e70	Oseba-read	Oseba - branje	f
00030000-5563-314a-8f32-e743fd36f7d1	Oseba-write	Oseba - spreminjanje	f
00030000-5563-314a-c5f2-d24e406fd0b0	Permission-read	Permission - branje	f
00030000-5563-314a-7d21-2f48df561434	Permission-write	Permission - spreminjanje	f
00030000-5563-314a-b5df-a7594ec15baf	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5563-314a-9106-539eaf4c1b19	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5563-314a-9e0a-5a9c845cc577	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5563-314a-dc94-ae9a479ea18f	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5563-314a-99b4-0127f977eabc	Pogodba-read	Pogodba - branje	f
00030000-5563-314a-6bd7-05b856ad5f9d	Pogodba-write	Pogodba - spreminjanje	f
00030000-5563-314a-17e9-009d4bfa11b2	Popa-read	Popa - branje	f
00030000-5563-314a-c745-aec836876016	Popa-write	Popa - spreminjanje	f
00030000-5563-314a-335b-411d2f252ed8	Posta-read	Posta - branje	f
00030000-5563-314a-442c-97b090d5bff9	Posta-write	Posta - spreminjanje	f
00030000-5563-314a-54f9-4b00761a6d71	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5563-314a-43d1-282c4bd9e57b	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5563-314a-0dc0-a530477f4467	PostniNaslov-read	PostniNaslov - branje	f
00030000-5563-314a-b548-8579e9c60957	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5563-314a-679a-03adabbebced	Predstava-read	Predstava - branje	f
00030000-5563-314a-0733-a220fd37435b	Predstava-write	Predstava - spreminjanje	f
00030000-5563-314a-2850-89c7e0c0bc78	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5563-314a-720a-0104f3c6ced2	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5563-314a-480a-6cb48d6d6213	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5563-314a-55f2-b5c0bbcace99	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5563-314a-7755-3fbd3a6208bc	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5563-314a-f146-478c65ae49da	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5563-314a-b2be-d5a32d26b63c	Prostor-read	Prostor - branje	f
00030000-5563-314a-a2ba-d0e4b5794ee3	Prostor-write	Prostor - spreminjanje	f
00030000-5563-314a-da48-82fe22b42b37	Racun-read	Racun - branje	f
00030000-5563-314a-bde6-4562d4ac3f69	Racun-write	Racun - spreminjanje	f
00030000-5563-314a-6dd8-9a06901e4337	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5563-314a-3613-67cdfad40122	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5563-314a-a573-61fcd384a43b	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5563-314a-4451-07b05ddd1fe9	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5563-314a-712d-c5f494e8bb5c	Rekvizit-read	Rekvizit - branje	f
00030000-5563-314a-d6ff-9f6527d80859	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5563-314a-ffa6-46368e13a186	Revizija-read	Revizija - branje	f
00030000-5563-314a-e5ef-010642aeb8e8	Revizija-write	Revizija - spreminjanje	f
00030000-5563-314a-4c4d-3bee52ddb800	Rezervacija-read	Rezervacija - branje	f
00030000-5563-314a-8a27-ff788b3746ae	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5563-314a-2202-b6e3edc4ced5	Role-read	Role - branje	f
00030000-5563-314a-f127-aacce1690ae9	Role-write	Role - spreminjanje	f
00030000-5563-314a-b636-a9dc40778d02	SedezniRed-read	SedezniRed - branje	f
00030000-5563-314a-f7fc-59a32173a312	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5563-314a-f6ab-7e309991d6a4	Sedez-read	Sedez - branje	f
00030000-5563-314a-24b2-01a471bc19f4	Sedez-write	Sedez - spreminjanje	f
00030000-5563-314a-0296-39918cbca3bd	Sezona-read	Sezona - branje	f
00030000-5563-314a-21ab-a80d3a1ef74c	Sezona-write	Sezona - spreminjanje	f
00030000-5563-314a-8f77-268a37dd5040	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5563-314a-ecc4-9d292978661c	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5563-314a-71c0-367ce21f0faa	Stevilcenje-read	Stevilcenje - branje	f
00030000-5563-314a-88be-1fe288040de5	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5563-314a-bd91-abb2582fad3c	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5563-314a-c885-d7bb6e794220	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5563-314a-30c0-65e8a2f81bb4	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5563-314a-dcb4-1da129eda1b8	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5563-314a-147e-217e00245c14	Telefonska-read	Telefonska - branje	f
00030000-5563-314a-9f65-9835c0d10940	Telefonska-write	Telefonska - spreminjanje	f
00030000-5563-314a-04f6-0df6fb5ce134	TerminStoritve-read	TerminStoritve - branje	f
00030000-5563-314a-fe9c-812eda8ffb62	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5563-314a-7577-581f8b640752	TipFunkcije-read	TipFunkcije - branje	f
00030000-5563-314a-8fc9-e27c53f81a28	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5563-314a-850e-8859f57330a0	Trr-read	Trr - branje	f
00030000-5563-314a-85d2-ac5d1a85bf21	Trr-write	Trr - spreminjanje	f
00030000-5563-314a-f4a4-085bdf57f6fb	Uprizoritev-read	Uprizoritev - branje	f
00030000-5563-314a-2e31-2028cb0c5bc5	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5563-314a-8115-9d10cb392db0	User-read	User - branje	f
00030000-5563-314a-452e-2f981c84061f	User-write	User - spreminjanje	f
00030000-5563-314a-78f5-0c2a3d85dd54	Vaja-read	Vaja - branje	f
00030000-5563-314a-4da4-39e54af7fdd3	Vaja-write	Vaja - spreminjanje	f
00030000-5563-314a-ac81-07ca0b211152	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5563-314a-6048-1a608079dcae	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5563-314a-0f9a-9af5d7efa4a4	Zaposlitev-read	Zaposlitev - branje	f
00030000-5563-314a-204e-bdfde1520a38	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5563-314a-a379-c631fa34637d	Zasedenost-read	Zasedenost - branje	f
00030000-5563-314a-8fc5-72f293485638	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5563-314a-e269-7e9a35b3c7d1	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5563-314a-71be-771c629ac4a7	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5563-314a-dab6-e755bf277728	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5563-314a-ebb2-352122b7e984	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2699 (class 0 OID 4909121)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5563-314a-db4b-96556ad6d206	00030000-5563-314a-3d7c-1aebd77b73ce
00020000-5563-314a-85e1-658d2ec27674	00030000-5563-314a-9b7e-60f6047cdf30
00020000-5563-314a-85e1-658d2ec27674	00030000-5563-314a-3d7c-1aebd77b73ce
\.


--
-- TOC entry 2727 (class 0 OID 4909411)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2731 (class 0 OID 4909442)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2743 (class 0 OID 4909575)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2704 (class 0 OID 4909180)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5563-314b-e153-ace9e55ad52f	00040000-5563-314a-76be-979a72a8278e	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5563-314b-5872-45cf6ac3a21e	00040000-5563-314a-76be-979a72a8278e	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2706 (class 0 OID 4909215)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5563-3149-6dab-39c6e871a30e	8341	Adlešiči
00050000-5563-3149-8520-0a399e0ab90e	5270	Ajdovščina
00050000-5563-3149-5d28-b5606427207b	6280	Ankaran/Ancarano
00050000-5563-3149-5c46-16a593b4f2aa	9253	Apače
00050000-5563-3149-fe2c-a1ac6210be35	8253	Artiče
00050000-5563-3149-fc76-6381752365bc	4275	Begunje na Gorenjskem
00050000-5563-3149-eefd-59925abcb5ae	1382	Begunje pri Cerknici
00050000-5563-3149-066b-1a2fe2a01ecd	9231	Beltinci
00050000-5563-3149-4c5b-0308d31608f6	2234	Benedikt
00050000-5563-3149-ef9f-270e27299640	2345	Bistrica ob Dravi
00050000-5563-3149-13ee-e6fd74214b06	3256	Bistrica ob Sotli
00050000-5563-3149-f8c4-3c9beeaf120c	8259	Bizeljsko
00050000-5563-3149-6b84-f172255cd3b9	1223	Blagovica
00050000-5563-3149-237a-32440a5a2e4a	8283	Blanca
00050000-5563-3149-4d8f-4378ed3ecbc0	4260	Bled
00050000-5563-3149-f15d-9221003941c4	4273	Blejska Dobrava
00050000-5563-3149-893d-dc1ca40f08d4	9265	Bodonci
00050000-5563-3149-61f1-9d7b04afa28d	9222	Bogojina
00050000-5563-3149-37df-773e860de785	4263	Bohinjska Bela
00050000-5563-3149-615a-81c172cd9fb9	4264	Bohinjska Bistrica
00050000-5563-3149-dedf-d34fcf1c04e8	4265	Bohinjsko jezero
00050000-5563-3149-847e-c359911f9149	1353	Borovnica
00050000-5563-3149-866b-e8d1c5b88e38	8294	Boštanj
00050000-5563-3149-fcca-f6e331f3d252	5230	Bovec
00050000-5563-3149-dd4c-f5c884e6fddf	5295	Branik
00050000-5563-3149-edad-002c955c6db7	3314	Braslovče
00050000-5563-3149-2554-4dbfbaafda4f	5223	Breginj
00050000-5563-3149-70ea-b3c5dcf5e744	8280	Brestanica
00050000-5563-3149-0968-0dc9d9073439	2354	Bresternica
00050000-5563-3149-18bd-b1bc1b8bd64f	4243	Brezje
00050000-5563-3149-fe23-f50e047f4040	1351	Brezovica pri Ljubljani
00050000-5563-3149-4add-fbd5a77c87f8	8250	Brežice
00050000-5563-3149-0769-f2818fa7d70a	4210	Brnik - Aerodrom
00050000-5563-3149-a629-83be0b44708c	8321	Brusnice
00050000-5563-3149-3998-795e4c78de03	3255	Buče
00050000-5563-3149-7ea7-a905b94e4b1c	8276	Bučka 
00050000-5563-3149-2121-86cce3b9ed72	9261	Cankova
00050000-5563-3149-7c0f-9f14954273fc	3000	Celje 
00050000-5563-3149-c845-5ff4bcc50d3a	3001	Celje - poštni predali
00050000-5563-3149-03d9-5cddcb6c904a	4207	Cerklje na Gorenjskem
00050000-5563-3149-0e2a-e44cd38e5582	8263	Cerklje ob Krki
00050000-5563-3149-3e50-69cfc3fb11cc	1380	Cerknica
00050000-5563-3149-f2bb-99e91c3d988e	5282	Cerkno
00050000-5563-3149-e6ad-3bd377e031d6	2236	Cerkvenjak
00050000-5563-3149-2074-c0d332546134	2215	Ceršak
00050000-5563-3149-bd2d-6b78cb69189a	2326	Cirkovce
00050000-5563-3149-39b9-baf3222d4a4d	2282	Cirkulane
00050000-5563-3149-4185-fe2d0480f767	5273	Col
00050000-5563-3149-fbda-36273f073ef9	8251	Čatež ob Savi
00050000-5563-3149-07ff-90e1a6ffe925	1413	Čemšenik
00050000-5563-3149-4fe2-06987304ed28	5253	Čepovan
00050000-5563-3149-faaa-b802d615bf7a	9232	Črenšovci
00050000-5563-3149-e4bc-1db5cac050ce	2393	Črna na Koroškem
00050000-5563-3149-388a-bd4a64829674	6275	Črni Kal
00050000-5563-3149-7044-49d285d27a82	5274	Črni Vrh nad Idrijo
00050000-5563-3149-1eea-c61002a83a80	5262	Črniče
00050000-5563-3149-b490-f14957d60827	8340	Črnomelj
00050000-5563-3149-0e52-959a990f51c0	6271	Dekani
00050000-5563-3149-6098-ce069d81aa59	5210	Deskle
00050000-5563-3149-c835-63d3c35802d5	2253	Destrnik
00050000-5563-3149-1655-66817972bade	6215	Divača
00050000-5563-3149-9aa9-9a550761bdf2	1233	Dob
00050000-5563-3149-c964-fc9575afc930	3224	Dobje pri Planini
00050000-5563-3149-1421-c093395c037d	8257	Dobova
00050000-5563-3149-784c-48b7c340bef8	1423	Dobovec
00050000-5563-3149-3046-cf9432d69cb7	5263	Dobravlje
00050000-5563-3149-26c4-7f5f5510a73c	3204	Dobrna
00050000-5563-3149-58c6-86c77fb4e0fd	8211	Dobrnič
00050000-5563-3149-5d34-4b32d3d50a52	1356	Dobrova
00050000-5563-3149-29c3-b8815ece2810	9223	Dobrovnik/Dobronak 
00050000-5563-3149-c04f-86c86c042bdb	5212	Dobrovo v Brdih
00050000-5563-3149-55c8-6b8809853ec2	1431	Dol pri Hrastniku
00050000-5563-3149-aae1-92e9a3120801	1262	Dol pri Ljubljani
00050000-5563-3149-6696-205c29e3263e	1273	Dole pri Litiji
00050000-5563-3149-87e0-ef2fda1e86a2	1331	Dolenja vas
00050000-5563-3149-d4c8-de2fc8d6a097	8350	Dolenjske Toplice
00050000-5563-3149-6a03-49c55f00615f	1230	Domžale
00050000-5563-3149-c43a-7cb061f38781	2252	Dornava
00050000-5563-3149-ae8c-1389614e0799	5294	Dornberk
00050000-5563-3149-ad56-317171e7372c	1319	Draga
00050000-5563-3149-6024-71e55c3ab415	8343	Dragatuš
00050000-5563-3149-a9ce-67fc8cc7a4ff	3222	Dramlje
00050000-5563-3149-f5c3-28a8559d7e88	2370	Dravograd
00050000-5563-3149-1b2b-3510ba91a973	4203	Duplje
00050000-5563-3149-871d-428ab9d99591	6221	Dutovlje
00050000-5563-3149-bf82-500e36c61ce0	8361	Dvor
00050000-5563-3149-be25-902f897ae3c8	2343	Fala
00050000-5563-3149-62a1-debc8b7f6bf2	9208	Fokovci
00050000-5563-3149-9e9a-aeaaae691bfb	2313	Fram
00050000-5563-3149-255c-0eb9d5154f65	3213	Frankolovo
00050000-5563-3149-ac46-a3e6ddc73af7	1274	Gabrovka
00050000-5563-3149-3fca-45af42337e47	8254	Globoko
00050000-5563-3149-c3c4-240fbb23c97f	5275	Godovič
00050000-5563-3149-2c6b-0e1c5d899986	4204	Golnik
00050000-5563-3149-d9ee-9fe73c5a47df	3303	Gomilsko
00050000-5563-3149-bed0-a6ada35e5345	4224	Gorenja vas
00050000-5563-3149-4cef-481ddd651139	3263	Gorica pri Slivnici
00050000-5563-3149-e72f-2e5e6920ca34	2272	Gorišnica
00050000-5563-3149-774b-5c47f8aa178c	9250	Gornja Radgona
00050000-5563-3149-1758-2fe1db154e17	3342	Gornji Grad
00050000-5563-3149-d450-b0ec54c66571	4282	Gozd Martuljek
00050000-5563-3149-1559-a2ddba83b70d	6272	Gračišče
00050000-5563-3149-c1a2-5a3cd76cce7c	9264	Grad
00050000-5563-3149-4aa3-9ab21e3da4e5	8332	Gradac
00050000-5563-3149-f793-79c1eb486270	1384	Grahovo
00050000-5563-3149-bbdb-755e8fe8f1cd	5242	Grahovo ob Bači
00050000-5563-3149-42e9-cf9a093e6758	5251	Grgar
00050000-5563-3149-b110-2e776ef7bd3c	3302	Griže
00050000-5563-3149-d3a5-3cfea2c71d97	3231	Grobelno
00050000-5563-3149-316f-03414943b3eb	1290	Grosuplje
00050000-5563-3149-36f0-fd4fe9c0a5c5	2288	Hajdina
00050000-5563-3149-0dea-6588afa57b07	8362	Hinje
00050000-5563-3149-1e4f-924fbd1a9def	2311	Hoče
00050000-5563-3149-44e6-912875fb0d27	9205	Hodoš/Hodos
00050000-5563-3149-6f83-9e2a16514fa2	1354	Horjul
00050000-5563-3149-b127-8912a6f73edf	1372	Hotedršica
00050000-5563-3149-34cb-bbd0330d0a3f	1430	Hrastnik
00050000-5563-3149-fb94-4e0eaa234c44	6225	Hruševje
00050000-5563-3149-dd8b-a570c130b775	4276	Hrušica
00050000-5563-3149-d3cb-a965e718fb83	5280	Idrija
00050000-5563-3149-a5c1-6efd2f47b7c6	1292	Ig
00050000-5563-3149-91f7-19dac10aa2b4	6250	Ilirska Bistrica
00050000-5563-3149-09e5-e5a802bcb252	6251	Ilirska Bistrica-Trnovo
00050000-5563-3149-1a86-e6ff11076dc9	1295	Ivančna Gorica
00050000-5563-3149-029d-7a3b58d282eb	2259	Ivanjkovci
00050000-5563-3149-0f3e-4e0cbf371e30	1411	Izlake
00050000-5563-3149-977d-b3bdfd38107b	6310	Izola/Isola
00050000-5563-3149-1970-2ed8176d77a2	2222	Jakobski Dol
00050000-5563-3149-a3b5-8e1a0cc91193	2221	Jarenina
00050000-5563-3149-1f2a-bce1a4747266	6254	Jelšane
00050000-5563-3149-7de8-cda3f776c199	4270	Jesenice
00050000-5563-3149-80d7-35adc70dd41f	8261	Jesenice na Dolenjskem
00050000-5563-3149-5968-7c6a5e31626d	3273	Jurklošter
00050000-5563-3149-8a9e-19ce6f37f70a	2223	Jurovski Dol
00050000-5563-3149-f03d-ab68489e712e	2256	Juršinci
00050000-5563-3149-46bb-993b0841ad09	5214	Kal nad Kanalom
00050000-5563-3149-3e15-30f9048931ca	3233	Kalobje
00050000-5563-3149-650d-ca5a5d157cb9	4246	Kamna Gorica
00050000-5563-3149-1a96-9fa181419c76	2351	Kamnica
00050000-5563-3149-e553-49bc091fd29c	1241	Kamnik
00050000-5563-3149-cb63-273b9fd004c8	5213	Kanal
00050000-5563-3149-6afe-a35f48853e2f	8258	Kapele
00050000-5563-3149-be34-fbdd29258dce	2362	Kapla
00050000-5563-3149-bc63-32794047037d	2325	Kidričevo
00050000-5563-3149-5931-51786ac071ce	1412	Kisovec
00050000-5563-3149-978e-81bdc26ab375	6253	Knežak
00050000-5563-3149-dd73-df58fface5d0	5222	Kobarid
00050000-5563-3149-f7d7-086a035c71d9	9227	Kobilje
00050000-5563-3149-b645-d0912340525c	1330	Kočevje
00050000-5563-3149-1f34-a0ee6df5be44	1338	Kočevska Reka
00050000-5563-3149-3a79-f7160fb51ab7	2276	Kog
00050000-5563-3149-9ee5-551f790199d6	5211	Kojsko
00050000-5563-3149-6273-6ceacb866b22	6223	Komen
00050000-5563-3149-82ea-47d69995ad32	1218	Komenda
00050000-5563-3149-90e9-821616d973b2	6000	Koper/Capodistria 
00050000-5563-3149-03a8-e02e56a8d62d	6001	Koper/Capodistria - poštni predali
00050000-5563-3149-e675-4b411290e783	8282	Koprivnica
00050000-5563-3149-f55d-76985cfce55b	5296	Kostanjevica na Krasu
00050000-5563-3149-1f12-8c0a2b688042	8311	Kostanjevica na Krki
00050000-5563-3149-fc46-dd210a8d852b	1336	Kostel
00050000-5563-3149-380f-4fe5e19ffeba	6256	Košana
00050000-5563-3149-57d6-c0303426e1b2	2394	Kotlje
00050000-5563-3149-169d-ba7313967981	6240	Kozina
00050000-5563-3149-66f4-24c8c822ea7d	3260	Kozje
00050000-5563-3149-e7c6-d8a6f146320e	4000	Kranj 
00050000-5563-3149-56eb-6adb6920514b	4001	Kranj - poštni predali
00050000-5563-3149-db42-172d63646347	4280	Kranjska Gora
00050000-5563-3149-b059-e534994c5d6a	1281	Kresnice
00050000-5563-3149-ed10-fedd58c91eec	4294	Križe
00050000-5563-3149-61a8-f7e096e57f2d	9206	Križevci
00050000-5563-3149-60aa-628e952c3f16	9242	Križevci pri Ljutomeru
00050000-5563-3149-5636-36f21435267e	1301	Krka
00050000-5563-3149-7a85-1c10f584fe47	8296	Krmelj
00050000-5563-3149-2569-91f13069e24d	4245	Kropa
00050000-5563-3149-4103-545fe0c2eff7	8262	Krška vas
00050000-5563-3149-3651-5ba31d9ea00e	8270	Krško
00050000-5563-3149-1994-f1c0f8b8756d	9263	Kuzma
00050000-5563-3149-51c6-80c015c2f5da	2318	Laporje
00050000-5563-3149-7ac6-f3cfb9c56208	3270	Laško
00050000-5563-3149-dd7a-98ae666c7c16	1219	Laze v Tuhinju
00050000-5563-3149-e9d0-edb3d4958701	2230	Lenart v Slovenskih goricah
00050000-5563-3149-7561-2079f0255092	9220	Lendava/Lendva
00050000-5563-3149-833c-b3048f543819	4248	Lesce
00050000-5563-3149-9ae3-968a6024105d	3261	Lesično
00050000-5563-3149-a010-0b0a8330f4ac	8273	Leskovec pri Krškem
00050000-5563-3149-119b-cf0ad284cce0	2372	Libeliče
00050000-5563-3149-20be-e31d390df37e	2341	Limbuš
00050000-5563-3149-09ca-b6d318ae45ca	1270	Litija
00050000-5563-3149-fc45-ec3df37a0216	3202	Ljubečna
00050000-5563-3149-e816-22f476c93bd6	1000	Ljubljana 
00050000-5563-3149-941c-28eac86ea769	1001	Ljubljana - poštni predali
00050000-5563-3149-cb5f-8183b1b20312	1231	Ljubljana - Črnuče
00050000-5563-3149-bb29-c114304e8b6b	1261	Ljubljana - Dobrunje
00050000-5563-3149-e760-9846dc6efe84	1260	Ljubljana - Polje
00050000-5563-3149-8d52-ae17b9ff17ee	1210	Ljubljana - Šentvid
00050000-5563-3149-b467-c2f8066a334e	1211	Ljubljana - Šmartno
00050000-5563-3149-d4af-90e09210cda3	3333	Ljubno ob Savinji
00050000-5563-3149-e2b6-90b5fd861411	9240	Ljutomer
00050000-5563-3149-6980-d8d4f7b791e1	3215	Loče
00050000-5563-3149-0063-9600c6aaca02	5231	Log pod Mangartom
00050000-5563-3149-6d19-3b2326cc36eb	1358	Log pri Brezovici
00050000-5563-3149-6292-28688c395787	1370	Logatec
00050000-5563-3149-c310-f62a542ef327	1371	Logatec
00050000-5563-3149-a368-b0e9d27cea6b	1434	Loka pri Zidanem Mostu
00050000-5563-3149-7103-95a365201b5e	3223	Loka pri Žusmu
00050000-5563-3149-979a-c4f38042f7fa	6219	Lokev
00050000-5563-3149-03d4-9f06a88303ff	1318	Loški Potok
00050000-5563-3149-a983-cd174a995d69	2324	Lovrenc na Dravskem polju
00050000-5563-3149-39e8-bad15063a179	2344	Lovrenc na Pohorju
00050000-5563-3149-3d55-56884ecc34ca	3334	Luče
00050000-5563-3149-5a9d-533f14bc8abb	1225	Lukovica
00050000-5563-3149-976c-c2c89f502a6c	9202	Mačkovci
00050000-5563-3149-73b3-9473d4d2c5de	2322	Majšperk
00050000-5563-3149-3704-b184ddd0476e	2321	Makole
00050000-5563-3149-6e5e-3f7b5f2ba038	9243	Mala Nedelja
00050000-5563-3149-aadd-7ec4686991dd	2229	Malečnik
00050000-5563-3149-85e9-2da54ba26abe	6273	Marezige
00050000-5563-3149-3de3-a5735db6ba1b	2000	Maribor 
00050000-5563-3149-eca5-5678fee31cc7	2001	Maribor - poštni predali
00050000-5563-3149-a7f7-ad9373539ac2	2206	Marjeta na Dravskem polju
00050000-5563-3149-4ac5-60d71fae60da	2281	Markovci
00050000-5563-3149-e165-cfaeeaf1d1e1	9221	Martjanci
00050000-5563-3149-5dc8-080ac936a2be	6242	Materija
00050000-5563-3149-844c-8a49eb2c5c2c	4211	Mavčiče
00050000-5563-3149-8c90-23f891078381	1215	Medvode
00050000-5563-3149-73eb-9bf6a8852959	1234	Mengeš
00050000-5563-3149-70f2-996c21977480	8330	Metlika
00050000-5563-3149-da9c-9f4924267c6d	2392	Mežica
00050000-5563-3149-b49b-548b42da49a3	2204	Miklavž na Dravskem polju
00050000-5563-3149-7b15-2565d5ff7946	2275	Miklavž pri Ormožu
00050000-5563-3149-9075-27b99710b71e	5291	Miren
00050000-5563-3149-a74f-50dd9f785866	8233	Mirna
00050000-5563-3149-cebd-9f5be5f46563	8216	Mirna Peč
00050000-5563-3149-2118-ae76fdbdaac7	2382	Mislinja
00050000-5563-3149-8431-47e6feb6b213	4281	Mojstrana
00050000-5563-3149-e6c0-1b15a9b38c87	8230	Mokronog
00050000-5563-3149-1916-430d3d8968e8	1251	Moravče
00050000-5563-3149-65fa-ae112c4aaa3a	9226	Moravske Toplice
00050000-5563-3149-6ef7-7a3df3185791	5216	Most na Soči
00050000-5563-3149-31f9-062a51f3f9d8	1221	Motnik
00050000-5563-3149-5d14-4d07ef9f73a6	3330	Mozirje
00050000-5563-3149-f1d2-f36acc45dab2	9000	Murska Sobota 
00050000-5563-3149-5cca-76499b604d6b	9001	Murska Sobota - poštni predali
00050000-5563-3149-a4ba-b168d780420a	2366	Muta
00050000-5563-3149-a819-8e779084ebcd	4202	Naklo
00050000-5563-3149-e23e-0599e8e4bc1b	3331	Nazarje
00050000-5563-3149-ad5f-829a57dbe2ce	1357	Notranje Gorice
00050000-5563-3149-83fe-58db7dc6559a	3203	Nova Cerkev
00050000-5563-3149-e7e5-dc1ec3ff2f34	5000	Nova Gorica 
00050000-5563-3149-17eb-ccff92422ccd	5001	Nova Gorica - poštni predali
00050000-5563-3149-4d15-ef6c23f8d502	1385	Nova vas
00050000-5563-3149-1b3c-f7ea474eba98	8000	Novo mesto
00050000-5563-3149-895f-d6340fa3b9bb	8001	Novo mesto - poštni predali
00050000-5563-3149-84a9-4538bb74f094	6243	Obrov
00050000-5563-3149-8741-687730eea737	9233	Odranci
00050000-5563-3149-0c1e-8d88266c5266	2317	Oplotnica
00050000-5563-3149-760a-17a308bc4f36	2312	Orehova vas
00050000-5563-3149-65fb-e13d13b84886	2270	Ormož
00050000-5563-3149-8381-f6604f46a3d5	1316	Ortnek
00050000-5563-3149-5d32-7890515c34c7	1337	Osilnica
00050000-5563-3149-bec0-97c5ecba4538	8222	Otočec
00050000-5563-3149-e3f9-837c574dd3a5	2361	Ožbalt
00050000-5563-3149-49f8-1057039182c4	2231	Pernica
00050000-5563-3149-4294-d49b6663590e	2211	Pesnica pri Mariboru
00050000-5563-3149-f7b2-edf1e5cd76e0	9203	Petrovci
00050000-5563-3149-6dd1-be9d129a28a5	3301	Petrovče
00050000-5563-3149-a8da-5a9b3d36e671	6330	Piran/Pirano
00050000-5563-3149-d90b-f05c97bc37a0	8255	Pišece
00050000-5563-3149-f5a2-770977aac52b	6257	Pivka
00050000-5563-3149-c6d3-03d3529d5304	6232	Planina
00050000-5563-3149-7055-47d1549b38f9	3225	Planina pri Sevnici
00050000-5563-3149-59b2-6f439e88cbb3	6276	Pobegi
00050000-5563-3149-cefe-b4ce8e591fc3	8312	Podbočje
00050000-5563-3149-34cd-fe5765ab2658	5243	Podbrdo
00050000-5563-3149-2549-cf4cd04f5364	3254	Podčetrtek
00050000-5563-3149-8441-1c11950ff46e	2273	Podgorci
00050000-5563-3149-4eb0-7c305cbcf668	6216	Podgorje
00050000-5563-3149-f6ff-ac2b918fa4dd	2381	Podgorje pri Slovenj Gradcu
00050000-5563-3149-b693-c5449bf50961	6244	Podgrad
00050000-5563-3149-c0d1-3ff42082bc43	1414	Podkum
00050000-5563-3149-2434-adc9149253f2	2286	Podlehnik
00050000-5563-3149-894f-e59bfb9450bb	5272	Podnanos
00050000-5563-3149-42eb-72af80d18a17	4244	Podnart
00050000-5563-3149-c3ad-14940ab7e6db	3241	Podplat
00050000-5563-3149-3786-1fb91b278324	3257	Podsreda
00050000-5563-3149-df0c-389fbeab0ed8	2363	Podvelka
00050000-5563-3149-0722-6acbe99d8395	2208	Pohorje
00050000-5563-3149-0e53-40f0a22ec220	2257	Polenšak
00050000-5563-3149-7b05-96a51c471945	1355	Polhov Gradec
00050000-5563-3149-4524-77bba64fdc5d	4223	Poljane nad Škofjo Loko
00050000-5563-3149-e835-bfa4b7b05af5	2319	Poljčane
00050000-5563-3149-142a-b1ae2e95bb79	1272	Polšnik
00050000-5563-3149-04cd-77b965158dc4	3313	Polzela
00050000-5563-3149-c252-baac530015bd	3232	Ponikva
00050000-5563-3149-df46-a52acace68e3	6320	Portorož/Portorose
00050000-5563-3149-7d75-e5e045c70f4f	6230	Postojna
00050000-5563-3149-c709-a6a050b09cea	2331	Pragersko
00050000-5563-3149-b95b-56ce3d0fbadb	3312	Prebold
00050000-5563-3149-89e3-eb1ff63f2fb3	4205	Preddvor
00050000-5563-3149-e350-3b0d147a2cc8	6255	Prem
00050000-5563-3149-160d-f936b6d892cb	1352	Preserje
00050000-5563-3149-8bbb-271b423c19b6	6258	Prestranek
00050000-5563-3149-e31b-e0f44b8f2feb	2391	Prevalje
00050000-5563-3149-1fe3-2c7663cb4ac4	3262	Prevorje
00050000-5563-3149-1983-abbf70904133	1276	Primskovo 
00050000-5563-3149-5c6a-c7fbb85a385c	3253	Pristava pri Mestinju
00050000-5563-3149-3678-581270379c0e	9207	Prosenjakovci/Partosfalva
00050000-5563-3149-6cba-45d3fd01a52f	5297	Prvačina
00050000-5563-3149-ced5-f24146fe6bfd	2250	Ptuj
00050000-5563-3149-b930-7efa6f47e586	2323	Ptujska Gora
00050000-5563-3149-92f5-662f116ab854	9201	Puconci
00050000-5563-3149-8832-74dea22f6b20	2327	Rače
00050000-5563-3149-c420-8fe657c153ed	1433	Radeče
00050000-5563-3149-0106-262d0fda6583	9252	Radenci
00050000-5563-3149-67b0-6496113ddf46	2360	Radlje ob Dravi
00050000-5563-3149-d303-845179b908ab	1235	Radomlje
00050000-5563-3149-b018-ae05ca82a967	4240	Radovljica
00050000-5563-3149-bb9d-a325a3f57995	8274	Raka
00050000-5563-3149-f441-13debb038ee2	1381	Rakek
00050000-5563-3149-0be4-b9c67a00e80d	4283	Rateče - Planica
00050000-5563-3149-5a84-0f42fb1baea9	2390	Ravne na Koroškem
00050000-5563-3149-cbe7-d197ab2ac43a	9246	Razkrižje
00050000-5563-3149-d0fb-105a221d3b86	3332	Rečica ob Savinji
00050000-5563-3149-19ff-edbeda47b7c5	5292	Renče
00050000-5563-3149-20e5-d0ed8273ffa3	1310	Ribnica
00050000-5563-3149-eadb-a87dc5bb3da0	2364	Ribnica na Pohorju
00050000-5563-3149-0d7f-59c95f8b88b9	3272	Rimske Toplice
00050000-5563-3149-489e-28f6c1632627	1314	Rob
00050000-5563-3149-2c74-2ac891b3d86e	5215	Ročinj
00050000-5563-3149-015d-63edcb6a3e15	3250	Rogaška Slatina
00050000-5563-3149-d2b7-a0faafb50b62	9262	Rogašovci
00050000-5563-3149-16db-8ebead61bb4c	3252	Rogatec
00050000-5563-3149-5c09-7cae08ed7eb4	1373	Rovte
00050000-5563-3149-abce-980e19006bdb	2342	Ruše
00050000-5563-3149-d886-28024413c225	1282	Sava
00050000-5563-3149-cc2f-94c68f80d10e	6333	Sečovlje/Sicciole
00050000-5563-3149-8520-69fa4130d5d1	4227	Selca
00050000-5563-3149-359a-44e1d65d5984	2352	Selnica ob Dravi
00050000-5563-3149-d6db-7d1cd9ca841c	8333	Semič
00050000-5563-3149-0f06-05d734f10da7	8281	Senovo
00050000-5563-3149-2880-a498cb5b0665	6224	Senožeče
00050000-5563-3149-05a2-d134fb9b192d	8290	Sevnica
00050000-5563-3149-2036-1b4fa520c3da	6210	Sežana
00050000-5563-3149-7269-927db9c25b10	2214	Sladki Vrh
00050000-5563-3149-dce0-ac0d827356b0	5283	Slap ob Idrijci
00050000-5563-3149-6c59-22e0b771fe23	2380	Slovenj Gradec
00050000-5563-3149-e804-f54dd3add778	2310	Slovenska Bistrica
00050000-5563-3149-d334-50357898db73	3210	Slovenske Konjice
00050000-5563-3149-6a88-e4a779e6e40e	1216	Smlednik
00050000-5563-3149-d934-b0e0095722cc	5232	Soča
00050000-5563-3149-9427-af2028a8218a	1317	Sodražica
00050000-5563-3149-a7f8-062d5db794d1	3335	Solčava
00050000-5563-3149-a71d-49499262f215	5250	Solkan
00050000-5563-3149-cf41-51883940c51e	4229	Sorica
00050000-5563-3149-5166-dc13ac1f2215	4225	Sovodenj
00050000-5563-3149-0263-73deec33866c	5281	Spodnja Idrija
00050000-5563-3149-8e59-23e626e70032	2241	Spodnji Duplek
00050000-5563-3149-64cf-324b87973b20	9245	Spodnji Ivanjci
00050000-5563-3149-2d8d-a4bb4b6d2d39	2277	Središče ob Dravi
00050000-5563-3149-fa82-38e22b011b5d	4267	Srednja vas v Bohinju
00050000-5563-3149-3ff4-de8839c8b080	8256	Sromlje 
00050000-5563-3149-e129-90c6cb94d081	5224	Srpenica
00050000-5563-3149-6dff-649c43547d2a	1242	Stahovica
00050000-5563-3149-a9d6-8f9de69d43de	1332	Stara Cerkev
00050000-5563-3149-bd6f-2f58301a1a67	8342	Stari trg ob Kolpi
00050000-5563-3149-b750-8a3cc15178a6	1386	Stari trg pri Ložu
00050000-5563-3149-2452-f29778927091	2205	Starše
00050000-5563-3149-308a-da14f9cf58ec	2289	Stoperce
00050000-5563-3149-b5ed-b0d1b7ed0809	8322	Stopiče
00050000-5563-3149-88bb-e442ede0f383	3206	Stranice
00050000-5563-3149-728d-e23187577c3c	8351	Straža
00050000-5563-3149-9fc3-be673a51035e	1313	Struge
00050000-5563-3149-c502-002570eb7388	8293	Studenec
00050000-5563-3149-9ba0-5a8d4d49ef82	8331	Suhor
00050000-5563-3149-057a-119640da6a4e	2233	Sv. Ana v Slovenskih goricah
00050000-5563-3149-277a-d6c15f68239f	2235	Sv. Trojica v Slovenskih goricah
00050000-5563-3149-1e88-de8ffd99cda5	2353	Sveti Duh na Ostrem Vrhu
00050000-5563-3149-d860-7b43b00189c5	9244	Sveti Jurij ob Ščavnici
00050000-5563-3149-ee9b-877558fbf748	3264	Sveti Štefan
00050000-5563-3149-e0ae-a345c0c551c9	2258	Sveti Tomaž
00050000-5563-3149-a8fe-bb2547243f51	9204	Šalovci
00050000-5563-3149-827e-bbce4265e329	5261	Šempas
00050000-5563-3149-a84a-7e66549bd83f	5290	Šempeter pri Gorici
00050000-5563-3149-d982-4e2ac2a6641d	3311	Šempeter v Savinjski dolini
00050000-5563-3149-c34f-11632b8f0b3b	4208	Šenčur
00050000-5563-3149-0602-c390e4c74b0d	2212	Šentilj v Slovenskih goricah
00050000-5563-3149-b564-119f91a58669	8297	Šentjanž
00050000-5563-3149-d442-6b3762bbac24	2373	Šentjanž pri Dravogradu
00050000-5563-3149-4e76-a6b73b93cb8d	8310	Šentjernej
00050000-5563-3149-a47f-3935bc64ffb2	3230	Šentjur
00050000-5563-3149-865d-bb3ecef4f188	3271	Šentrupert
00050000-5563-3149-135b-bcdd5f7f5736	8232	Šentrupert
00050000-5563-3149-0dbc-0f1f172ce9ea	1296	Šentvid pri Stični
00050000-5563-3149-1839-662b991dbb72	8275	Škocjan
00050000-5563-3149-d2ff-7348337b0504	6281	Škofije
00050000-5563-3149-d694-68f754e2c022	4220	Škofja Loka
00050000-5563-3149-b762-abfd41d83b09	3211	Škofja vas
00050000-5563-3149-9731-3b0fcae51a12	1291	Škofljica
00050000-5563-3149-631e-207d3ad1a9de	6274	Šmarje
00050000-5563-3149-8e8e-8730778a92e1	1293	Šmarje - Sap
00050000-5563-3149-e962-ad460096303d	3240	Šmarje pri Jelšah
00050000-5563-3149-799a-1f5affd50a86	8220	Šmarješke Toplice
00050000-5563-3149-e55e-c0293becaa6a	2315	Šmartno na Pohorju
00050000-5563-3149-1385-3e8c9d361e35	3341	Šmartno ob Dreti
00050000-5563-3149-b6e6-c2e4c9ceac76	3327	Šmartno ob Paki
00050000-5563-3149-9c9f-3f5ff6438638	1275	Šmartno pri Litiji
00050000-5563-3149-7121-90bd7b755ed6	2383	Šmartno pri Slovenj Gradcu
00050000-5563-3149-9903-1de8c63d1fff	3201	Šmartno v Rožni dolini
00050000-5563-3149-fa8e-6ee7061839a6	3325	Šoštanj
00050000-5563-3149-3735-8a8d61574ab2	6222	Štanjel
00050000-5563-3149-e1ee-517d76cab392	3220	Štore
00050000-5563-3149-f0b9-0e3715146697	3304	Tabor
00050000-5563-3149-696a-d177b0d57007	3221	Teharje
00050000-5563-3149-86a0-f8dbb1ec08fd	9251	Tišina
00050000-5563-3149-8ecc-e02a766d9790	5220	Tolmin
00050000-5563-3149-afaa-62d1052e62cb	3326	Topolšica
00050000-5563-3149-d023-970640c9f035	2371	Trbonje
00050000-5563-3149-b600-19fee7f5c3a9	1420	Trbovlje
00050000-5563-3149-ac8c-6126beb28add	8231	Trebelno 
00050000-5563-3149-67d7-bb2811f2dfc9	8210	Trebnje
00050000-5563-3149-6480-3ee2e3da0ba7	5252	Trnovo pri Gorici
00050000-5563-3149-ec69-ce8b4be5b4bd	2254	Trnovska vas
00050000-5563-3149-f3ec-45b558fcbfa3	1222	Trojane
00050000-5563-3149-0c30-d4119de24b3c	1236	Trzin
00050000-5563-3149-4fc7-c5892b914590	4290	Tržič
00050000-5563-3149-a211-f29a8de0b7bf	8295	Tržišče
00050000-5563-3149-0cb0-1974ea268206	1311	Turjak
00050000-5563-3149-9a6b-e73da815085e	9224	Turnišče
00050000-5563-3149-7303-057bcfc5feee	8323	Uršna sela
00050000-5563-3149-2cea-b4ddfe28bb55	1252	Vače
00050000-5563-3149-5ee7-61a85085b112	3320	Velenje 
00050000-5563-3149-33af-ade7edcc7386	3322	Velenje - poštni predali
00050000-5563-3149-6023-fc9074d9c4bc	8212	Velika Loka
00050000-5563-3149-e411-ffd99acee6ec	2274	Velika Nedelja
00050000-5563-3149-c5cc-ab34c98eb76c	9225	Velika Polana
00050000-5563-3149-ed6a-e5c472124834	1315	Velike Lašče
00050000-5563-3149-c5d4-1b0feb3058f9	8213	Veliki Gaber
00050000-5563-3149-cc92-793178bb6678	9241	Veržej
00050000-5563-3149-8815-72b151667c0d	1312	Videm - Dobrepolje
00050000-5563-3149-bf2b-0101ac40b2b5	2284	Videm pri Ptuju
00050000-5563-3149-90ff-6ed6c1243ea2	8344	Vinica
00050000-5563-3149-a190-d43b7d4412d7	5271	Vipava
00050000-5563-3149-1f7b-6d4d9fce7f86	4212	Visoko
00050000-5563-3149-bd29-a487e4b7466b	1294	Višnja Gora
00050000-5563-3149-9dfd-b22371fa540c	3205	Vitanje
00050000-5563-3149-836f-c02b3ef42720	2255	Vitomarci
00050000-5563-3149-b5b2-e6915e606e63	1217	Vodice
00050000-5563-3149-813c-1eae31611d13	3212	Vojnik\t
00050000-5563-3149-8c8b-6375de768620	5293	Volčja Draga
00050000-5563-3149-4d8b-019a726ba14a	2232	Voličina
00050000-5563-3149-a1d8-6f601bde412f	3305	Vransko
00050000-5563-3149-eda1-371fe535673e	6217	Vremski Britof
00050000-5563-3149-6e48-e887fd9dfd15	1360	Vrhnika
00050000-5563-3149-b4b7-b549795cf18b	2365	Vuhred
00050000-5563-3149-2792-4bf9e4f17ed0	2367	Vuzenica
00050000-5563-3149-aafe-169cf8e32dcd	8292	Zabukovje 
00050000-5563-3149-301d-3e376422e0b8	1410	Zagorje ob Savi
00050000-5563-3149-d19c-9198f90ce0d4	1303	Zagradec
00050000-5563-3149-1429-a0498cae1930	2283	Zavrč
00050000-5563-3149-4b4c-f2008d3abd7f	8272	Zdole 
00050000-5563-3149-a7bb-1c605fc90a9b	4201	Zgornja Besnica
00050000-5563-3149-08ef-5be82ad790b8	2242	Zgornja Korena
00050000-5563-3149-4235-e20c4cf96127	2201	Zgornja Kungota
00050000-5563-3149-f57f-f8d7a05e46c5	2316	Zgornja Ložnica
00050000-5563-3149-b790-54d4ae6398d9	2314	Zgornja Polskava
00050000-5563-3149-cb90-e080af6cae8f	2213	Zgornja Velka
00050000-5563-3149-22a7-d97847d6075e	4247	Zgornje Gorje
00050000-5563-3149-7947-d9807b4e3040	4206	Zgornje Jezersko
00050000-5563-3149-f89d-dcbd6bcbd609	2285	Zgornji Leskovec
00050000-5563-3149-7856-d5334702fcb2	1432	Zidani Most
00050000-5563-3149-c21f-eee88e297d75	3214	Zreče
00050000-5563-3149-09c9-8e4cc6688bc0	4209	Žabnica
00050000-5563-3149-38fe-4841d09f6ae6	3310	Žalec
00050000-5563-3149-19db-a2f11a7ebf57	4228	Železniki
00050000-5563-3149-41f7-ef489ca62e25	2287	Žetale
00050000-5563-3149-4c57-5e26d4d77b4f	4226	Žiri
00050000-5563-3149-954a-895c4f365317	4274	Žirovnica
00050000-5563-3149-144c-70150b62840b	8360	Žužemberk
\.


--
-- TOC entry 2723 (class 0 OID 4909385)
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
-- TOC entry 2705 (class 0 OID 4909200)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2711 (class 0 OID 4909278)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2725 (class 0 OID 4909397)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2738 (class 0 OID 4909517)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2742 (class 0 OID 4909568)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2729 (class 0 OID 4909426)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2721 (class 0 OID 4909370)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2720 (class 0 OID 4909360)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2741 (class 0 OID 4909557)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2736 (class 0 OID 4909494)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2694 (class 0 OID 4909073)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5563-314a-77c6-23f697ad0f30	00010000-5563-314a-2b6f-a00c41c385e0	2015-05-25 16:27:23	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROzJKBK2EKI4/DunjYtbBSNg6qnTlVnci";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2760 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2730 (class 0 OID 4909436)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2698 (class 0 OID 4909111)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5563-314a-df23-6e793fd151c3	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5563-314a-35c5-5bbe753eeac4	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5563-314a-db4b-96556ad6d206	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5563-314a-7550-d5824efcf117	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5563-314a-050e-be9a92993b42	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5563-314a-85e1-658d2ec27674	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2696 (class 0 OID 4909095)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5563-314a-77c6-23f697ad0f30	00020000-5563-314a-7550-d5824efcf117
00010000-5563-314a-2b6f-a00c41c385e0	00020000-5563-314a-7550-d5824efcf117
\.


--
-- TOC entry 2732 (class 0 OID 4909450)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2724 (class 0 OID 4909391)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2718 (class 0 OID 4909341)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2750 (class 0 OID 4909663)
-- Dependencies: 230
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5563-314a-c8c3-cae35aa2a722	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5563-314a-ef59-3f8621f33e37	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5563-314a-3e60-c1242bbe8c90	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5563-314a-3b29-cf342c4b6763	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5563-314a-0f1a-365748ada7bd	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2749 (class 0 OID 4909656)
-- Dependencies: 229
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5563-314a-363f-7e33c2ece3ad	00000000-5563-314a-3b29-cf342c4b6763	popa
00000000-5563-314a-e5d7-301a4fd74e73	00000000-5563-314a-3b29-cf342c4b6763	oseba
00000000-5563-314a-9dfe-0488a3f704eb	00000000-5563-314a-ef59-3f8621f33e37	prostor
00000000-5563-314a-f55a-9224f6db894f	00000000-5563-314a-3b29-cf342c4b6763	besedilo
00000000-5563-314a-678c-5788f48b1d79	00000000-5563-314a-3b29-cf342c4b6763	uprizoritev
00000000-5563-314a-0efe-c6949700b034	00000000-5563-314a-3b29-cf342c4b6763	funkcija
00000000-5563-314a-a087-6332085f1206	00000000-5563-314a-3b29-cf342c4b6763	tipfunkcije
\.


--
-- TOC entry 2748 (class 0 OID 4909651)
-- Dependencies: 228
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2737 (class 0 OID 4909504)
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
-- TOC entry 2703 (class 0 OID 4909172)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2719 (class 0 OID 4909347)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2740 (class 0 OID 4909546)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5563-314a-b0b3-c12511b34823	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5563-314a-52f2-0e32379a5dbb	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5563-314a-0740-fcd8129e363e	Baletnik ali plesalec	Baletniki in plesalci	\N	Baletnica ali plesalka	igralec
000f0000-5563-314a-429a-8a9cf3636d51	Avtor	Avtorji	\N	Avtorka	umetnik
000f0000-5563-314a-58fa-42b01f26a98f	Režiser	Režiserji	\N	Režiserka	umetnik
000f0000-5563-314a-5358-4dbee2c42e84	Scenograf	Scenografi	\N	Scenografka	tehnik
000f0000-5563-314a-0735-e21eb8295097	Kostumograf	Kostumografi	\N	Kostumografinja	tehnik
000f0000-5563-314a-6cf6-1ae25c2868e9	Oblikovalec maske	Oblikovalci maske	\N	Oblikovalka maske	tehnik
000f0000-5563-314a-e3c9-7673e97f728c	Avtor glasbe	Avtorji glasbe	\N	Avtorica glasbe	umetnik
000f0000-5563-314a-11cb-f43a6633ff16	Oblikovalec svetlobe	Oblikovalci svetlobe	\N	Oblikovalka svetlobe	tehnik
000f0000-5563-314a-f21a-70ada31c9eaa	Koreograf	Koreografi	\N	Koreografinja	umetnik
000f0000-5563-314a-f363-0ff8db9050c8	Dramaturg	Dramaturgi	\N	Dramaturginja	umetnik
000f0000-5563-314a-8cbd-97692a4ecbd7	Lektorj	Lektorji	\N	Lektorica	umetnik
000f0000-5563-314a-e561-ba1ee1e26040	Prevajalec	Prevajalci	\N	Prevajalka	umetnik
000f0000-5563-314a-65f8-a5a92adc4bbf	Oblikovalec videa	Oblikovalci videa	\N	Oblikovalka videa	umetnik
000f0000-5563-314a-f603-9cf44d57d051	Intermedijski ustvarjalec	Intermedijski ustvarjalci	\N	Intermedijska ustvarjalka	umetnik
\.


--
-- TOC entry 2708 (class 0 OID 4909235)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2695 (class 0 OID 4909082)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5563-314a-2b6f-a00c41c385e0	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROhu/nLEcDX2AAHbpa4EE24SLNRzTKsJC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5563-314a-77c6-23f697ad0f30	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2745 (class 0 OID 4909601)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
\.


--
-- TOC entry 2713 (class 0 OID 4909293)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2728 (class 0 OID 4909418)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2735 (class 0 OID 4909486)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2715 (class 0 OID 4909325)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2744 (class 0 OID 4909591)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-5563-314a-ca5e-2f9802dc9bbd	Drama	drama (SURS 01)
00140000-5563-314a-f1cb-ee0f47fff991	Opera	opera (SURS 02)
00140000-5563-314a-eb32-2ae13e7a13bd	Balet	balet (SURS 03)
00140000-5563-314a-c4bb-2070e2bf35b5	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5563-314a-e4be-613300d64050	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5563-314a-479d-f5f3321e9498	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5563-314a-52c1-b612f9b3d90a	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2734 (class 0 OID 4909476)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-5563-314a-3afe-54a6e1eb5e43	Opera	opera
00150000-5563-314a-449a-c378a4862af5	Opereta	opereta
00150000-5563-314a-d76d-5849df0e3f46	Balet	balet
00150000-5563-314a-7b01-8ebfdc8364ce	Plesne prireditve	plesne prireditve
00150000-5563-314a-c4a6-10836abcc8ac	Lutkovno gledališče	lutkovno gledališče
00150000-5563-314a-d3b6-49adb55aee6c	Raziskovalno gledališče	raziskovalno gledališče
00150000-5563-314a-fcb3-bf241520fc4a	Biografska drama	biografska drama
00150000-5563-314a-584e-8e16cfdaa488	Komedija	komedija
00150000-5563-314a-a03b-733b1069c737	Črna komedija	črna komedija
00150000-5563-314a-c174-216aee63bb58	E-igra	E-igra
00150000-5563-314a-8bbd-d2e8dc8d1d70	Kriminalka	kriminalka
00150000-5563-314a-5410-3ff1df9aea93	Musical	musical
\.


--
-- TOC entry 2315 (class 2606 OID 4909136)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 4909645)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 4909635)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 4909545)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 4909315)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 4909340)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 4909261)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 4909472)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 4909291)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 4909334)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 4909275)
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
-- TOC entry 2407 (class 2606 OID 4909383)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 4909410)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 4909233)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 4909145)
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
-- TOC entry 2322 (class 2606 OID 4909168)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2313 (class 2606 OID 4909125)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2306 (class 2606 OID 4909110)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 4909416)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 4909449)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 4909586)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2331 (class 2606 OID 4909197)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 4909221)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 4909389)
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
-- TOC entry 2337 (class 2606 OID 4909211)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 4909282)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 4909401)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 4909529)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 4909573)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 4909433)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 4909374)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 4909365)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 4909567)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 4909501)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 4909081)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 4909440)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 4909099)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2308 (class 2606 OID 4909119)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 4909458)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 4909396)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 4909346)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 4909669)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 4909660)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 4909655)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 4909514)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 4909177)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 4909356)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 4909556)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 4909246)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 4909094)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 4909616)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 4909300)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 4909424)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 4909492)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 4909329)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 4909600)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 4909485)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 1259 OID 4909322)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2454 (class 1259 OID 4909515)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2455 (class 1259 OID 4909516)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2329 (class 1259 OID 4909199)
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
-- TOC entry 2420 (class 1259 OID 4909417)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2414 (class 1259 OID 4909403)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2415 (class 1259 OID 4909402)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2366 (class 1259 OID 4909301)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2442 (class 1259 OID 4909475)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2443 (class 1259 OID 4909473)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2444 (class 1259 OID 4909474)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2354 (class 1259 OID 4909277)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2355 (class 1259 OID 4909276)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2471 (class 1259 OID 4909588)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2472 (class 1259 OID 4909589)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2473 (class 1259 OID 4909590)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2479 (class 1259 OID 4909620)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2480 (class 1259 OID 4909617)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2481 (class 1259 OID 4909619)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2482 (class 1259 OID 4909618)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2344 (class 1259 OID 4909248)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2345 (class 1259 OID 4909247)
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
-- TOC entry 2320 (class 1259 OID 4909171)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2430 (class 1259 OID 4909441)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2384 (class 1259 OID 4909335)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2310 (class 1259 OID 4909126)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2311 (class 1259 OID 4909127)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2435 (class 1259 OID 4909461)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2436 (class 1259 OID 4909460)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2437 (class 1259 OID 4909459)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2358 (class 1259 OID 4909283)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2359 (class 1259 OID 4909285)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2360 (class 1259 OID 4909284)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2498 (class 1259 OID 4909662)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2394 (class 1259 OID 4909369)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2395 (class 1259 OID 4909367)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2396 (class 1259 OID 4909366)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2397 (class 1259 OID 4909368)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2301 (class 1259 OID 4909100)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 4909101)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2423 (class 1259 OID 4909425)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2409 (class 1259 OID 4909390)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2450 (class 1259 OID 4909502)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2451 (class 1259 OID 4909503)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2333 (class 1259 OID 4909213)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2334 (class 1259 OID 4909212)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2335 (class 1259 OID 4909214)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2458 (class 1259 OID 4909530)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2459 (class 1259 OID 4909531)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2491 (class 1259 OID 4909648)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2492 (class 1259 OID 4909647)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2493 (class 1259 OID 4909650)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2494 (class 1259 OID 4909646)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2495 (class 1259 OID 4909649)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2447 (class 1259 OID 4909493)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2400 (class 1259 OID 4909378)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2401 (class 1259 OID 4909377)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2402 (class 1259 OID 4909375)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2403 (class 1259 OID 4909376)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2284 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2487 (class 1259 OID 4909637)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2488 (class 1259 OID 4909636)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2365 (class 1259 OID 4909292)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2316 (class 1259 OID 4909147)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2317 (class 1259 OID 4909146)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2325 (class 1259 OID 4909178)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2326 (class 1259 OID 4909179)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2389 (class 1259 OID 4909359)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2390 (class 1259 OID 4909358)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2391 (class 1259 OID 4909357)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2372 (class 1259 OID 4909324)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2373 (class 1259 OID 4909320)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2374 (class 1259 OID 4909317)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2375 (class 1259 OID 4909318)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2376 (class 1259 OID 4909316)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2377 (class 1259 OID 4909321)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2378 (class 1259 OID 4909319)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2332 (class 1259 OID 4909198)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2350 (class 1259 OID 4909262)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2351 (class 1259 OID 4909264)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2352 (class 1259 OID 4909263)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2353 (class 1259 OID 4909265)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2408 (class 1259 OID 4909384)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2476 (class 1259 OID 4909587)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2323 (class 1259 OID 4909169)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2324 (class 1259 OID 4909170)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2504 (class 1259 OID 4909670)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2343 (class 1259 OID 4909234)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2501 (class 1259 OID 4909661)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2428 (class 1259 OID 4909435)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2429 (class 1259 OID 4909434)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2287 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2340 (class 1259 OID 4909222)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 4909574)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2309 (class 1259 OID 4909120)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2379 (class 1259 OID 4909323)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2532 (class 2606 OID 4909808)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2529 (class 2606 OID 4909793)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2530 (class 2606 OID 4909798)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2534 (class 2606 OID 4909818)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2528 (class 2606 OID 4909788)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2533 (class 2606 OID 4909813)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2531 (class 2606 OID 4909803)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2563 (class 2606 OID 4909963)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2564 (class 2606 OID 4909968)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2515 (class 2606 OID 4909723)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2551 (class 2606 OID 4909903)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2550 (class 2606 OID 4909898)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2549 (class 2606 OID 4909893)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2527 (class 2606 OID 4909783)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2559 (class 2606 OID 4909943)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2557 (class 2606 OID 4909933)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2558 (class 2606 OID 4909938)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2522 (class 2606 OID 4909758)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2521 (class 2606 OID 4909753)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2547 (class 2606 OID 4909883)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2568 (class 2606 OID 4909988)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2569 (class 2606 OID 4909993)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2570 (class 2606 OID 4909998)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2574 (class 2606 OID 4910018)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2571 (class 2606 OID 4910003)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2573 (class 2606 OID 4910013)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2572 (class 2606 OID 4910008)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2520 (class 2606 OID 4909748)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2519 (class 2606 OID 4909743)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2512 (class 2606 OID 4909708)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2511 (class 2606 OID 4909703)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2553 (class 2606 OID 4909913)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2535 (class 2606 OID 4909823)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2507 (class 2606 OID 4909683)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2508 (class 2606 OID 4909688)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2556 (class 2606 OID 4909928)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2555 (class 2606 OID 4909923)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2554 (class 2606 OID 4909918)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2523 (class 2606 OID 4909763)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2525 (class 2606 OID 4909773)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2524 (class 2606 OID 4909768)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2582 (class 2606 OID 4910058)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2542 (class 2606 OID 4909858)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2540 (class 2606 OID 4909848)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2539 (class 2606 OID 4909843)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2541 (class 2606 OID 4909853)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2505 (class 2606 OID 4909673)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2506 (class 2606 OID 4909678)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2552 (class 2606 OID 4909908)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2548 (class 2606 OID 4909888)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2561 (class 2606 OID 4909953)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2562 (class 2606 OID 4909958)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2517 (class 2606 OID 4909733)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2516 (class 2606 OID 4909728)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2518 (class 2606 OID 4909738)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2565 (class 2606 OID 4909973)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2566 (class 2606 OID 4909978)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2579 (class 2606 OID 4910043)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2578 (class 2606 OID 4910038)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2581 (class 2606 OID 4910053)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2577 (class 2606 OID 4910033)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2580 (class 2606 OID 4910048)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2560 (class 2606 OID 4909948)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2546 (class 2606 OID 4909878)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2545 (class 2606 OID 4909873)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2543 (class 2606 OID 4909863)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2544 (class 2606 OID 4909868)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2576 (class 2606 OID 4910028)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2575 (class 2606 OID 4910023)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2526 (class 2606 OID 4909778)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2567 (class 2606 OID 4909983)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2510 (class 2606 OID 4909698)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2509 (class 2606 OID 4909693)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2513 (class 2606 OID 4909713)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2514 (class 2606 OID 4909718)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2538 (class 2606 OID 4909838)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2537 (class 2606 OID 4909833)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2536 (class 2606 OID 4909828)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-25 16:27:23 CEST

--
-- PostgreSQL database dump complete
--

