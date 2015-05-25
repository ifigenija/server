--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-25 10:19:40 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 233 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2760 (class 0 OID 0)
-- Dependencies: 233
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 4824735)
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
-- TOC entry 227 (class 1259 OID 4825244)
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
-- TOC entry 226 (class 1259 OID 4825227)
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
-- TOC entry 219 (class 1259 OID 4825138)
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
-- TOC entry 194 (class 1259 OID 4824908)
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
-- TOC entry 197 (class 1259 OID 4824942)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 4824855)
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
-- TOC entry 213 (class 1259 OID 4825068)
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
-- TOC entry 192 (class 1259 OID 4824892)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 196 (class 1259 OID 4824936)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 4824872)
-- Name: kontaktnaoseba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kontaktnaoseba (
    id integer NOT NULL,
    popa_id uuid,
    oseba_id uuid,
    status character varying(20) DEFAULT NULL::character varying,
    funkcija character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 231 (class 1259 OID 4825277)
-- Name: kontaktnaoseba_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE kontaktnaoseba_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


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
-- TOC entry 202 (class 1259 OID 4824985)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 4825010)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 4824829)
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
-- TOC entry 181 (class 1259 OID 4824744)
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
-- TOC entry 182 (class 1259 OID 4824755)
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
-- TOC entry 172 (class 1259 OID 4729417)
-- Name: oseba2popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oseba2popa (
    popa_id uuid NOT NULL,
    oseba_id uuid NOT NULL
);


--
-- TOC entry 177 (class 1259 OID 4824709)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 4824728)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 4825017)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 4825048)
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
-- TOC entry 223 (class 1259 OID 4825181)
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
-- TOC entry 184 (class 1259 OID 4824786)
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
-- TOC entry 186 (class 1259 OID 4824821)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 4824991)
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
-- TOC entry 185 (class 1259 OID 4824806)
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
-- TOC entry 191 (class 1259 OID 4824884)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 4825003)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 4825123)
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
-- TOC entry 222 (class 1259 OID 4825174)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 4825032)
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
-- TOC entry 201 (class 1259 OID 4824976)
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
-- TOC entry 200 (class 1259 OID 4824966)
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
-- TOC entry 221 (class 1259 OID 4825163)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 4825100)
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
-- TOC entry 174 (class 1259 OID 4824680)
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
-- TOC entry 173 (class 1259 OID 4824678)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2761 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 4825042)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 4824718)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 4824702)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 4825056)
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
-- TOC entry 204 (class 1259 OID 4824997)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 4824947)
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
-- TOC entry 230 (class 1259 OID 4825269)
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
-- TOC entry 229 (class 1259 OID 4825262)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 4825257)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 4825110)
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
-- TOC entry 232 (class 1259 OID 4825279)
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE strosekuprizoritve_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 183 (class 1259 OID 4824778)
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
-- TOC entry 199 (class 1259 OID 4824953)
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
-- TOC entry 220 (class 1259 OID 4825152)
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
-- TOC entry 188 (class 1259 OID 4824841)
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
-- TOC entry 175 (class 1259 OID 4824689)
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
-- TOC entry 225 (class 1259 OID 4825207)
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
-- TOC entry 193 (class 1259 OID 4824899)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 4825024)
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
-- TOC entry 215 (class 1259 OID 4825092)
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
-- TOC entry 195 (class 1259 OID 4824931)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 4825197)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 4825082)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2148 (class 2604 OID 4824683)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2701 (class 0 OID 4824735)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2748 (class 0 OID 4825244)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
\.


--
-- TOC entry 2747 (class 0 OID 4825227)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2740 (class 0 OID 4825138)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2715 (class 0 OID 4824908)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2718 (class 0 OID 4824942)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2710 (class 0 OID 4824855)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5562-db1b-7661-fd190c75b7f3	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5562-db1b-21c2-de98fef41140	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5562-db1b-5ad3-dc250b6bdc4c	AL	ALB	008	Albania 	Albanija	\N
00040000-5562-db1b-40de-40430431d636	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5562-db1b-ef8c-2cef3d4cd6bc	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5562-db1b-5aaa-93fdd3ad87bf	AD	AND	020	Andorra 	Andora	\N
00040000-5562-db1b-fbd2-58eecc8a5f3c	AO	AGO	024	Angola 	Angola	\N
00040000-5562-db1b-623c-dfef834837a8	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5562-db1b-aa29-86dedcc167ab	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5562-db1b-9887-1bbeb146ff1f	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5562-db1b-6569-b02e79e60812	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5562-db1b-5d3d-5eef8432736a	AM	ARM	051	Armenia 	Armenija	\N
00040000-5562-db1b-4ccf-344d1925b398	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5562-db1b-2342-7157bbb7fc98	AU	AUS	036	Australia 	Avstralija	\N
00040000-5562-db1b-d1c5-3f583bfd607c	AT	AUT	040	Austria 	Avstrija	\N
00040000-5562-db1b-19df-655a6e382e49	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5562-db1b-68f7-f8105d4d83d0	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5562-db1b-401c-a7ed628910df	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5562-db1b-7aa4-76ea46ead408	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5562-db1b-5747-29c337bb0230	BB	BRB	052	Barbados 	Barbados	\N
00040000-5562-db1b-2ec2-1a1fe91e3e74	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5562-db1b-6f28-3d6c283b2d17	BE	BEL	056	Belgium 	Belgija	\N
00040000-5562-db1b-7cf4-e1b4f57bed87	BZ	BLZ	084	Belize 	Belize	\N
00040000-5562-db1b-7764-dfed4fc0e849	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5562-db1b-23c9-2cf752ca9a4b	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5562-db1b-a0c3-00de2db29170	BT	BTN	064	Bhutan 	Butan	\N
00040000-5562-db1b-31ab-6478f2d33569	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5562-db1b-bd92-bf8f5483bbc2	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5562-db1b-f11a-132007a00761	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5562-db1b-5feb-263afb22cca5	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5562-db1b-3b16-d701c4d3c06d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5562-db1b-18c0-c81a74c67d13	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5562-db1b-0e6f-aeda0c540ca0	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5562-db1b-9b60-70f3a1b84973	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5562-db1b-84f5-2f1d0088f353	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5562-db1b-7da4-41569f5016b4	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5562-db1b-04e5-9bd2a83d9373	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5562-db1b-3cb2-557bdb090aef	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5562-db1b-0b8c-c0d346ebea56	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5562-db1b-6889-f7d02e361dab	CA	CAN	124	Canada 	Kanada	\N
00040000-5562-db1b-a6b9-f7fb5730c1c3	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5562-db1b-be7d-44f5be1daf5e	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5562-db1b-1030-2b715d8f8ff2	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5562-db1b-ac95-ba51a7d2e0fc	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5562-db1b-4d7a-606d4a2f2629	CL	CHL	152	Chile 	Čile	\N
00040000-5562-db1b-c6cf-241954634f9b	CN	CHN	156	China 	Kitajska	\N
00040000-5562-db1b-0a73-b9b530fec41a	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5562-db1b-315c-420d1a065d32	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5562-db1b-5a22-fb1c46f3fdfa	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5562-db1b-b66d-52292555da10	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5562-db1b-cb32-d20e5ea243b7	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5562-db1b-8610-17956c7ae3b8	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5562-db1b-4b71-514a720a4238	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5562-db1b-8922-8373f036bbe4	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5562-db1b-9df9-cd1412fad111	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5562-db1b-b38b-24219d522f79	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5562-db1b-a7f5-710e692a23f5	CU	CUB	192	Cuba 	Kuba	\N
00040000-5562-db1b-b3fe-be8c2e699b1e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5562-db1b-1939-e93fc1d638f0	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5562-db1b-4af5-6ed5c747c936	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5562-db1b-5758-e3edf1fddb39	DK	DNK	208	Denmark 	Danska	\N
00040000-5562-db1b-da51-dbeb3ae7a818	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5562-db1b-9f4c-b8e41b35afc8	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5562-db1b-e36e-22554f969cba	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5562-db1b-aa02-3a964ab89176	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5562-db1b-ca0c-3c14c1234776	EG	EGY	818	Egypt 	Egipt	\N
00040000-5562-db1b-1fc8-6681789ee456	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5562-db1b-588b-96beff115adb	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5562-db1b-abe6-717231a76b7b	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5562-db1b-e9e5-911a56adfecd	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5562-db1b-f346-33861f7ee916	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5562-db1b-c10e-8ef8d9c806b5	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5562-db1b-71c7-73e60c35bc29	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5562-db1b-1349-780bb3efd218	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5562-db1b-1405-6565c1a79cf6	FI	FIN	246	Finland 	Finska	\N
00040000-5562-db1b-4f66-16bea2c0278e	FR	FRA	250	France 	Francija	\N
00040000-5562-db1b-d813-a74a4aba0fef	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5562-db1b-3943-678f28fad4c9	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5562-db1b-7531-0a273a24d206	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5562-db1b-0721-4f7894be2dcf	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5562-db1b-d9de-6f29f0e1db77	GA	GAB	266	Gabon 	Gabon	\N
00040000-5562-db1b-2650-dfd3f30d8c76	GM	GMB	270	Gambia 	Gambija	\N
00040000-5562-db1b-60fc-166380c9e204	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5562-db1b-0182-a6da4352a2cd	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5562-db1b-df0c-6e8964c66d80	GH	GHA	288	Ghana 	Gana	\N
00040000-5562-db1b-a4a9-c33a22305396	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5562-db1b-5f62-276ed8ed2dfe	GR	GRC	300	Greece 	Grčija	\N
00040000-5562-db1b-0190-a57962a0cf04	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5562-db1b-9429-fa0d7b7cd9f4	GD	GRD	308	Grenada 	Grenada	\N
00040000-5562-db1b-1eae-05b2731156a9	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5562-db1b-fe74-3826a5c56794	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5562-db1b-52a9-74a47c5d6ef2	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5562-db1b-d0e2-bc509a235142	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5562-db1b-2a3e-9475ddf5f235	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5562-db1b-e3a0-d733ded87888	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5562-db1b-99dd-6d4df9cbce4c	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5562-db1b-4d2f-a0f0ab2b3a6c	HT	HTI	332	Haiti 	Haiti	\N
00040000-5562-db1b-90a4-32d9762b0c04	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5562-db1b-1de3-b5e77184c4d6	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5562-db1b-6a5d-1d2660001fda	HN	HND	340	Honduras 	Honduras	\N
00040000-5562-db1b-c5df-08be4ed7d4bc	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5562-db1b-1efc-07c40ab1485f	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5562-db1b-d53a-e5155da905d1	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5562-db1b-717f-e304b228e509	IN	IND	356	India 	Indija	\N
00040000-5562-db1b-12d7-aaf9127a6efe	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5562-db1b-104a-42e5341b6121	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5562-db1b-b712-350d22058c6a	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5562-db1b-a5a1-3dba2a572229	IE	IRL	372	Ireland 	Irska	\N
00040000-5562-db1b-2312-1c6b83dda241	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5562-db1b-8329-c18798f2b46a	IL	ISR	376	Israel 	Izrael	\N
00040000-5562-db1b-a37e-6cca2007020f	IT	ITA	380	Italy 	Italija	\N
00040000-5562-db1b-945e-a2e1f6495e2a	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5562-db1b-4308-45a26b9a1f66	JP	JPN	392	Japan 	Japonska	\N
00040000-5562-db1b-7e10-df68f9e9dd78	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5562-db1b-f698-544f1abd2b3d	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5562-db1b-52ba-18f8d288227a	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5562-db1b-6527-dd3263df9f57	KE	KEN	404	Kenya 	Kenija	\N
00040000-5562-db1b-1d2f-e886bb765756	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5562-db1b-17ae-65e5b38eab5c	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5562-db1b-3e1b-af99f345e74b	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5562-db1b-c8cf-7d6a9fc52f69	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5562-db1b-62a1-686993710241	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5562-db1b-64b7-a4ec5b4e123e	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5562-db1b-e104-14921d8f544e	LV	LVA	428	Latvia 	Latvija	\N
00040000-5562-db1b-eafa-cb96fa73f0a6	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5562-db1b-441d-290d4e3c4d1a	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5562-db1b-e139-61dee01dcae5	LR	LBR	430	Liberia 	Liberija	\N
00040000-5562-db1b-a5c1-00bf408dc8c4	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5562-db1b-374a-5a651a5b147a	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5562-db1b-ded7-0499110342dd	LT	LTU	440	Lithuania 	Litva	\N
00040000-5562-db1b-cc83-94b0a9727539	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5562-db1b-6090-fc439e9bcdd8	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5562-db1b-d0db-6d3dcf53156c	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5562-db1b-b825-f987f2e1cd4f	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5562-db1b-c5d4-0304fdb6a9ee	MW	MWI	454	Malawi 	Malavi	\N
00040000-5562-db1b-d18a-cf881be1472a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5562-db1b-9ad6-55c72f4068a2	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5562-db1b-a43a-a1fe78751bf8	ML	MLI	466	Mali 	Mali	\N
00040000-5562-db1b-c11a-95304ff3d45f	MT	MLT	470	Malta 	Malta	\N
00040000-5562-db1b-9828-d0c9aafca37a	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5562-db1b-cb5c-1a2ee0b12a60	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5562-db1b-4b41-0122bb048911	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5562-db1b-d366-9d958953cbf8	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5562-db1b-fd0d-e1342b7502a3	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5562-db1b-c1df-bc5b6fbd9471	MX	MEX	484	Mexico 	Mehika	\N
00040000-5562-db1b-4245-44f54a659193	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5562-db1b-889a-0fe870914d6b	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5562-db1b-29ea-616a20c58b43	MC	MCO	492	Monaco 	Monako	\N
00040000-5562-db1b-2737-3ddfa6f2c2c9	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5562-db1b-03b6-5b36f6172989	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5562-db1b-c0f6-41e7ad8672f0	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5562-db1b-6b27-20cee70ba460	MA	MAR	504	Morocco 	Maroko	\N
00040000-5562-db1b-eb51-1bee01051ba7	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5562-db1b-a80a-6b2e705d2963	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5562-db1b-9dbb-9843bb849662	NA	NAM	516	Namibia 	Namibija	\N
00040000-5562-db1b-8661-203f49e0f24a	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5562-db1b-98b3-add2c199da25	NP	NPL	524	Nepal 	Nepal	\N
00040000-5562-db1b-2d27-54c32f015a7d	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5562-db1b-f820-42225d26612e	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5562-db1b-55d9-31f25f419f2e	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5562-db1b-49f7-02cda87331c5	NE	NER	562	Niger 	Niger 	\N
00040000-5562-db1b-8b28-b7ae7629a266	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5562-db1b-d033-1202cf01af8c	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5562-db1b-96d0-19a1bc35056c	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5562-db1b-521a-5a92c83da196	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5562-db1b-1ad0-98f84a00691c	NO	NOR	578	Norway 	Norveška	\N
00040000-5562-db1b-a022-480243149425	OM	OMN	512	Oman 	Oman	\N
00040000-5562-db1b-8cf1-bd19dbeec248	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5562-db1b-1416-92551ec8973f	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5562-db1b-da3b-c993365a1a24	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5562-db1b-2ae5-3825c611bf2c	PA	PAN	591	Panama 	Panama	\N
00040000-5562-db1b-3c1d-6097e5cc7b8a	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5562-db1b-0418-7d1cde1c98c0	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5562-db1b-7a13-f61dd6c68e87	PE	PER	604	Peru 	Peru	\N
00040000-5562-db1b-85a9-fbe9faadd2e9	PH	PHL	608	Philippines 	Filipini	\N
00040000-5562-db1b-a436-72b633c25b5c	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5562-db1b-a63a-ca92c6b752b5	PL	POL	616	Poland 	Poljska	\N
00040000-5562-db1b-eb19-de035ce77dc4	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5562-db1b-edf9-879e074c6f72	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5562-db1b-74a9-2151a8eab33a	QA	QAT	634	Qatar 	Katar	\N
00040000-5562-db1b-0b8b-35024b79f6ad	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5562-db1b-b34f-b2a35d6cd805	RO	ROU	642	Romania 	Romunija	\N
00040000-5562-db1b-ae58-5a6c9b0d2e6b	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5562-db1b-cb0a-44207e7c3aaa	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5562-db1b-c9d6-0730e482abc3	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5562-db1b-4b4b-0d3eeaf84c66	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5562-db1b-2242-cdd33a1aaf50	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5562-db1b-00d8-000504149a28	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5562-db1b-5297-ca48dfe77791	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5562-db1b-0ee9-f2d5ea4fef72	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5562-db1b-c747-bcd25d5152a9	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5562-db1b-cf5d-3cdd55d55874	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5562-db1b-fefc-970ac15c91b8	SM	SMR	674	San Marino 	San Marino	\N
00040000-5562-db1b-1126-6f5b26fbf2f4	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5562-db1b-6656-3f84d99f95a4	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5562-db1b-7228-1c2103ad9992	SN	SEN	686	Senegal 	Senegal	\N
00040000-5562-db1b-3528-95ecb0e57b66	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5562-db1b-6905-5408041e48da	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5562-db1b-02ee-ee5664ca0885	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5562-db1b-2465-f2c882fad010	SG	SGP	702	Singapore 	Singapur	\N
00040000-5562-db1b-d122-208892212c2c	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5562-db1b-8a6b-cb9605665263	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5562-db1b-6c14-a00a73aed470	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5562-db1b-d7c0-e746550e01ec	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5562-db1b-6230-784a50f7344c	SO	SOM	706	Somalia 	Somalija	\N
00040000-5562-db1b-048c-7c8e39b18d55	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5562-db1b-69a8-3f6e98b85224	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5562-db1b-4021-674e613d8ffb	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5562-db1b-29cf-272cfebaacb6	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5562-db1b-d689-de52d3ef155b	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5562-db1b-6636-e53c40161ff4	SD	SDN	729	Sudan 	Sudan	\N
00040000-5562-db1b-01d8-e07798941b73	SR	SUR	740	Suriname 	Surinam	\N
00040000-5562-db1b-5573-b6440101233a	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5562-db1b-9bf2-0cbac3430dc5	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5562-db1b-25ec-b5c7cf7af721	SE	SWE	752	Sweden 	Švedska	\N
00040000-5562-db1b-a518-b159abae2dcf	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5562-db1b-c398-68ab4ad34c56	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5562-db1b-1015-f6e569a84a56	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5562-db1b-e888-f4388c3ac072	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5562-db1b-eba3-34abfac2f928	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5562-db1b-28b3-92ce10ab20c5	TH	THA	764	Thailand 	Tajska	\N
00040000-5562-db1b-c361-b5a7310732e0	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5562-db1b-e939-520d053478b1	TG	TGO	768	Togo 	Togo	\N
00040000-5562-db1b-3f10-cfb09bd79fde	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5562-db1b-7e52-7cc5cc207010	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5562-db1b-0d58-7c81984d76b1	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5562-db1b-3828-de0545bb94db	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5562-db1b-9a7a-b1a3ad5c2839	TR	TUR	792	Turkey 	Turčija	\N
00040000-5562-db1b-0a21-f5d8c50bedff	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5562-db1b-d1b0-a3f7fdc61a4d	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5562-db1b-6f56-bf27a78ce9a2	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5562-db1b-f59a-0116e3d70d3b	UG	UGA	800	Uganda 	Uganda	\N
00040000-5562-db1b-67a1-bec9b5e810d8	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5562-db1b-5f13-afb663928e9b	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5562-db1b-5ee4-b907e7c1eb71	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5562-db1b-ec23-7591be0e18da	US	USA	840	United States 	Združene države Amerike	\N
00040000-5562-db1b-3311-98dc74e5c3b7	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5562-db1b-3417-492ae18f221d	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5562-db1b-9782-634cb70d08cf	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5562-db1b-d302-f8e0d0b54136	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5562-db1b-7bbc-bdedfb031d70	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5562-db1b-0bcd-76854f8c4fdd	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5562-db1b-2dfc-9d56792d6abe	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5562-db1b-0f63-1ede5621f52c	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5562-db1b-3fce-87c949bd0976	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5562-db1b-3959-14a4000364d7	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5562-db1b-d365-46988b4ea203	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5562-db1b-06db-31b9c7d7e647	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5562-db1b-a313-5a37c83b9483	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2734 (class 0 OID 4825068)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj) FROM stdin;
\.


--
-- TOC entry 2713 (class 0 OID 4824892)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2717 (class 0 OID 4824936)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2711 (class 0 OID 4824872)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
\.


--
-- TOC entry 2762 (class 0 OID 0)
-- Dependencies: 231
-- Name: kontaktnaoseba_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('kontaktnaoseba_id_seq', 1, false);


--
-- TOC entry 2691 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2723 (class 0 OID 4824985)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2727 (class 0 OID 4825010)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2708 (class 0 OID 4824829)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5562-db1b-b705-ef63a456d0bd	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5562-db1b-ed31-1424c02289de	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5562-db1b-609a-eabbe8fc5a6d	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5562-db1b-53a8-549d40c630b3	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5562-db1b-e575-580cb5b0bfe4	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5562-db1b-5cde-fa68e329beba	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5562-db1b-ccff-4a769dad1c7c	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5562-db1b-af3a-16cc76cd05ae	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5562-db1b-ff4b-69675b0b5c6a	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5562-db1b-bf06-e62782157dee	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5562-db1b-1d3f-c180b4808406	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5562-db1b-9404-3ff30cac9656	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5562-db1b-632c-821e8565d40e	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5562-db1b-b276-3008c78890a9	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2702 (class 0 OID 4824744)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5562-db1b-a5e1-c68d0badbe26	00000000-5562-db1b-e575-580cb5b0bfe4	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5562-db1b-8a45-e2263a2c5b91	00000000-5562-db1b-e575-580cb5b0bfe4	00010000-5562-db1b-8bb0-f588bab75603	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5562-db1b-a867-694c02c2ecae	00000000-5562-db1b-5cde-fa68e329beba	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2703 (class 0 OID 4824755)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2693 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2698 (class 0 OID 4824709)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5562-db1b-81af-4f1dbe3467e2	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5562-db1b-d969-257cb8d71660	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5562-db1b-ffcf-947c0ee896d3	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5562-db1b-f64d-74076f37e623	Abonma-read	Abonma - branje	f
00030000-5562-db1b-3c31-c893e302bd5c	Abonma-write	Abonma - spreminjanje	f
00030000-5562-db1b-582e-6f8c9cf0115c	Alternacija-read	Alternacija - branje	f
00030000-5562-db1b-c8ab-ebee67d4a0c7	Alternacija-write	Alternacija - spreminjanje	f
00030000-5562-db1b-d179-3df874f54060	Arhivalija-read	Arhivalija - branje	f
00030000-5562-db1b-6c9c-00b3ece6f6b6	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5562-db1b-807b-5962490d3713	Besedilo-read	Besedilo - branje	f
00030000-5562-db1b-8899-c1c32f9680cf	Besedilo-write	Besedilo - spreminjanje	f
00030000-5562-db1b-0192-bc0cc342724a	DogodekIzven-read	DogodekIzven - branje	f
00030000-5562-db1b-23d1-fae32f5541de	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5562-db1b-b153-3a8da7832bc2	Dogodek-read	Dogodek - branje	f
00030000-5562-db1b-41f7-ecc889452cf8	Dogodek-write	Dogodek - spreminjanje	f
00030000-5562-db1b-46f5-ca2b86844184	Drzava-read	Drzava - branje	f
00030000-5562-db1b-7648-d65d3b24478c	Drzava-write	Drzava - spreminjanje	f
00030000-5562-db1b-ed87-3c15ca017360	Funkcija-read	Funkcija - branje	f
00030000-5562-db1b-4f9a-0b1996537033	Funkcija-write	Funkcija - spreminjanje	f
00030000-5562-db1b-fb7f-439ada602332	Gostovanje-read	Gostovanje - branje	f
00030000-5562-db1b-b182-5a9bb0a4fe16	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5562-db1b-a8c9-e20201027cfb	Gostujoca-read	Gostujoca - branje	f
00030000-5562-db1b-9fde-099f00dd7366	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5562-db1b-489b-b155e17b42fc	Kupec-read	Kupec - branje	f
00030000-5562-db1b-a756-885cac636a2a	Kupec-write	Kupec - spreminjanje	f
00030000-5562-db1b-2f0f-d909c862bdf9	NacinPlacina-read	NacinPlacina - branje	f
00030000-5562-db1b-e2a5-e345cdeffa13	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5562-db1b-d121-b08fea205bba	Option-read	Option - branje	f
00030000-5562-db1b-18e9-51ded9253af1	Option-write	Option - spreminjanje	f
00030000-5562-db1b-cdbc-86dc032820e1	OptionValue-read	OptionValue - branje	f
00030000-5562-db1b-37b0-10c87a094d5a	OptionValue-write	OptionValue - spreminjanje	f
00030000-5562-db1b-7f5e-5a6ca1a0b9be	Oseba-read	Oseba - branje	f
00030000-5562-db1b-e224-7cf8943a21fd	Oseba-write	Oseba - spreminjanje	f
00030000-5562-db1b-fe40-b1dbe345731c	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5562-db1b-5669-197bec4c0e17	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5562-db1b-cf8b-21056742dfb2	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5562-db1b-36a2-074e7dd62d24	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5562-db1b-581b-986b09726237	Pogodba-read	Pogodba - branje	f
00030000-5562-db1b-cbfa-57bd63d6696e	Pogodba-write	Pogodba - spreminjanje	f
00030000-5562-db1b-73c0-ca6cc25d6134	Popa-read	Popa - branje	f
00030000-5562-db1b-9fb8-08ee28fedb7b	Popa-write	Popa - spreminjanje	f
00030000-5562-db1b-587f-6fc906b80e85	Posta-read	Posta - branje	f
00030000-5562-db1b-6e26-1be5aec60daa	Posta-write	Posta - spreminjanje	f
00030000-5562-db1b-d715-8bf9c643d356	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5562-db1b-0250-59db8b85fd89	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5562-db1b-ce44-6d3ea0dd7e54	PostniNaslov-read	PostniNaslov - branje	f
00030000-5562-db1b-ad6b-396269f562b1	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5562-db1b-1959-a12a40707d38	Predstava-read	Predstava - branje	f
00030000-5562-db1b-5d7f-b20b82407de6	Predstava-write	Predstava - spreminjanje	f
00030000-5562-db1b-cb07-44bed4607a78	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5562-db1b-8509-8015b4091d63	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5562-db1b-a859-511f730b447f	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5562-db1b-299b-53e7cf19240c	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5562-db1b-bab1-4b6f6ddfe972	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5562-db1b-3ba9-e2157ed8f12d	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5562-db1b-b2c2-ba1e5d9a15c6	Prostor-read	Prostor - branje	f
00030000-5562-db1b-3b07-1b0cdf3dcd62	Prostor-write	Prostor - spreminjanje	f
00030000-5562-db1b-16d7-f21947a659e9	Racun-read	Racun - branje	f
00030000-5562-db1b-ba5e-dd079aecc927	Racun-write	Racun - spreminjanje	f
00030000-5562-db1b-ad36-ba589ba238d6	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5562-db1b-756b-8b5d35233596	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5562-db1b-8d40-314c85af9035	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5562-db1b-c17b-98c973ff7fed	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5562-db1b-afd2-60e96d479228	Rekvizit-read	Rekvizit - branje	f
00030000-5562-db1b-35e8-e9664859ae5f	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5562-db1b-bb9d-cd44b136def8	Rezervacija-read	Rezervacija - branje	f
00030000-5562-db1b-54cd-4bf0bc0945b5	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5562-db1b-5030-2b2c71a0f349	SedezniRed-read	SedezniRed - branje	f
00030000-5562-db1b-09b4-71a7d3e018e1	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5562-db1b-1d8f-1469a6ff9455	Sedez-read	Sedez - branje	f
00030000-5562-db1b-fb50-bc2941ac690e	Sedez-write	Sedez - spreminjanje	f
00030000-5562-db1b-c854-737d0bd375e3	Sezona-read	Sezona - branje	f
00030000-5562-db1b-b76e-1f0a6785623c	Sezona-write	Sezona - spreminjanje	f
00030000-5562-db1b-7315-2265760e52c1	Telefonska-read	Telefonska - branje	f
00030000-5562-db1b-a46f-8f395a0f7601	Telefonska-write	Telefonska - spreminjanje	f
00030000-5562-db1b-7717-4b03aa7b3262	TerminStoritve-read	TerminStoritve - branje	f
00030000-5562-db1b-247d-075278276436	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5562-db1b-caed-31a3f5012ba5	TipFunkcije-read	TipFunkcije - branje	f
00030000-5562-db1b-8411-e0676e0d6f61	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5562-db1b-6b79-1104c5f3f6cb	Trr-read	Trr - branje	f
00030000-5562-db1b-3c5d-a25a11403706	Trr-write	Trr - spreminjanje	f
00030000-5562-db1b-9992-48bc1b6cf5fb	Uprizoritev-read	Uprizoritev - branje	f
00030000-5562-db1b-77af-c402f3e0459b	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5562-db1b-0017-96ce04e1467b	Vaja-read	Vaja - branje	f
00030000-5562-db1b-ed71-73465b6387d1	Vaja-write	Vaja - spreminjanje	f
00030000-5562-db1b-eee8-3139911e69b2	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5562-db1b-116b-d256ce62f8c1	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5562-db1b-08eb-906cbf22cc13	Zaposlitev-read	Zaposlitev - branje	f
00030000-5562-db1b-bb40-268c9ea3e3ed	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5562-db1b-da7e-30e3b03c4708	Zasedenost-read	Zasedenost - branje	f
00030000-5562-db1b-daa0-a26473c4d213	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5562-db1b-6a07-759c47233bab	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5562-db1b-0ce2-4267db310821	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5562-db1b-74ca-fa37f3128a2f	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5562-db1b-f952-228fc1a3d9b4	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2700 (class 0 OID 4824728)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5562-db1b-6951-f76c9a845a1c	00030000-5562-db1b-46f5-ca2b86844184
00020000-5562-db1b-f845-51281bc887ca	00030000-5562-db1b-7648-d65d3b24478c
00020000-5562-db1b-f845-51281bc887ca	00030000-5562-db1b-46f5-ca2b86844184
\.


--
-- TOC entry 2728 (class 0 OID 4825017)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2732 (class 0 OID 4825048)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2744 (class 0 OID 4825181)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2705 (class 0 OID 4824786)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5562-db1b-dcd2-1cd904b69252	00040000-5562-db1b-7661-fd190c75b7f3	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5562-db1b-d50a-880639d93ff5	00040000-5562-db1b-7661-fd190c75b7f3	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2707 (class 0 OID 4824821)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5562-db1a-dc70-a44e775fd900	8341	Adlešiči
00050000-5562-db1a-e82e-f103b856653c	5270	Ajdovščina
00050000-5562-db1a-3aff-202e6030fbd8	6280	Ankaran/Ancarano
00050000-5562-db1a-68b2-9051ab9072ea	9253	Apače
00050000-5562-db1a-215a-9c9c223c1b39	8253	Artiče
00050000-5562-db1a-7ef6-72abc2792c13	4275	Begunje na Gorenjskem
00050000-5562-db1a-28e3-5fd779f312a6	1382	Begunje pri Cerknici
00050000-5562-db1a-229b-84610740e171	9231	Beltinci
00050000-5562-db1a-5f1c-f156887cfd8d	2234	Benedikt
00050000-5562-db1a-b671-96e18e654d63	2345	Bistrica ob Dravi
00050000-5562-db1a-43e1-029a2ce2efd0	3256	Bistrica ob Sotli
00050000-5562-db1a-29b4-983fbf7ea9ac	8259	Bizeljsko
00050000-5562-db1a-0b6e-6ec89141e3da	1223	Blagovica
00050000-5562-db1a-9055-71dd3b3258db	8283	Blanca
00050000-5562-db1a-a361-0ef0de6ed561	4260	Bled
00050000-5562-db1a-e97d-f5480dbc888f	4273	Blejska Dobrava
00050000-5562-db1a-937e-1f87e7528bb2	9265	Bodonci
00050000-5562-db1a-5609-50ed04e0e9a8	9222	Bogojina
00050000-5562-db1a-6fdb-b08cc6cd8138	4263	Bohinjska Bela
00050000-5562-db1a-5ce3-e5712e51bf9d	4264	Bohinjska Bistrica
00050000-5562-db1a-5bb9-7c1c7279f245	4265	Bohinjsko jezero
00050000-5562-db1a-83e9-f6aef70e7f8d	1353	Borovnica
00050000-5562-db1a-442f-31c16734df9a	8294	Boštanj
00050000-5562-db1a-33b8-6a9abc2bbf61	5230	Bovec
00050000-5562-db1a-16a0-f2eef9f5c2a1	5295	Branik
00050000-5562-db1a-4538-41e36db91f0e	3314	Braslovče
00050000-5562-db1a-533d-a5f8156e566d	5223	Breginj
00050000-5562-db1a-23a8-bf0df58b4dfe	8280	Brestanica
00050000-5562-db1a-0446-6651e6be101f	2354	Bresternica
00050000-5562-db1a-cb44-1d7adb9d9ab4	4243	Brezje
00050000-5562-db1a-0e59-426a182419d1	1351	Brezovica pri Ljubljani
00050000-5562-db1a-5182-ba5e474630c7	8250	Brežice
00050000-5562-db1a-b19c-634fd739c709	4210	Brnik - Aerodrom
00050000-5562-db1a-a1a9-6a221adbcf28	8321	Brusnice
00050000-5562-db1a-a03f-d2312ea89717	3255	Buče
00050000-5562-db1a-72f3-9c2d9a41cadc	8276	Bučka 
00050000-5562-db1a-ea87-5b115e181b3b	9261	Cankova
00050000-5562-db1a-e788-223348b10586	3000	Celje 
00050000-5562-db1a-58f8-1e69b2c556fa	3001	Celje - poštni predali
00050000-5562-db1a-24be-52bdeb6e2cce	4207	Cerklje na Gorenjskem
00050000-5562-db1a-00c5-4dff625b7a5c	8263	Cerklje ob Krki
00050000-5562-db1a-3bc4-d3eb7daa06ef	1380	Cerknica
00050000-5562-db1a-a6f2-244d652558be	5282	Cerkno
00050000-5562-db1a-a2cd-15c5ad06231c	2236	Cerkvenjak
00050000-5562-db1a-80e3-eb56ea92a2d5	2215	Ceršak
00050000-5562-db1a-7594-b5ed92f20a8b	2326	Cirkovce
00050000-5562-db1a-1355-c38438099126	2282	Cirkulane
00050000-5562-db1a-34c3-8b438590137f	5273	Col
00050000-5562-db1a-5261-cd2fe62161d3	8251	Čatež ob Savi
00050000-5562-db1a-43a2-c01f784c3fdf	1413	Čemšenik
00050000-5562-db1a-a19f-4c2e1bd49fb9	5253	Čepovan
00050000-5562-db1a-bb4f-5d7e9ed39da5	9232	Črenšovci
00050000-5562-db1a-5277-7fcce5e30c10	2393	Črna na Koroškem
00050000-5562-db1a-c7b4-e318ca9727ba	6275	Črni Kal
00050000-5562-db1a-43e6-16faa7f104d9	5274	Črni Vrh nad Idrijo
00050000-5562-db1a-5909-4bc36d5c33d1	5262	Črniče
00050000-5562-db1a-7f1d-592a8aa205b8	8340	Črnomelj
00050000-5562-db1a-9093-81869326f097	6271	Dekani
00050000-5562-db1a-ddd5-fb2d20cddf42	5210	Deskle
00050000-5562-db1a-fef1-5eb50d082d2c	2253	Destrnik
00050000-5562-db1a-2cc1-5b54bf384f63	6215	Divača
00050000-5562-db1a-faad-b9c32e8a2d01	1233	Dob
00050000-5562-db1a-c9d1-d36af5ed0aba	3224	Dobje pri Planini
00050000-5562-db1a-5916-07465267900a	8257	Dobova
00050000-5562-db1a-6299-648a45cf6354	1423	Dobovec
00050000-5562-db1a-add4-84f6873bdf15	5263	Dobravlje
00050000-5562-db1a-a0a4-783ed80c9aa8	3204	Dobrna
00050000-5562-db1a-218f-891a87fc41c2	8211	Dobrnič
00050000-5562-db1a-2970-e2b0d74dee06	1356	Dobrova
00050000-5562-db1a-b000-b4f287fc02ec	9223	Dobrovnik/Dobronak 
00050000-5562-db1a-d493-9bd8ab0a3ec1	5212	Dobrovo v Brdih
00050000-5562-db1a-817e-dde401a3acb9	1431	Dol pri Hrastniku
00050000-5562-db1a-0ea2-beaf1db5ec17	1262	Dol pri Ljubljani
00050000-5562-db1a-a356-c509f3e7e7a4	1273	Dole pri Litiji
00050000-5562-db1a-0089-66844814982d	1331	Dolenja vas
00050000-5562-db1a-19cc-ad66e58f94de	8350	Dolenjske Toplice
00050000-5562-db1a-7951-2c13fe1bf561	1230	Domžale
00050000-5562-db1a-9188-fe2864f3dc7f	2252	Dornava
00050000-5562-db1a-a927-f60e41d6a9c4	5294	Dornberk
00050000-5562-db1a-6c86-1a68cf796e73	1319	Draga
00050000-5562-db1a-5f81-6bdf545a0215	8343	Dragatuš
00050000-5562-db1a-3149-a2bc40d1ed21	3222	Dramlje
00050000-5562-db1a-8d9b-efdc6276e540	2370	Dravograd
00050000-5562-db1a-511b-dd19b563b91b	4203	Duplje
00050000-5562-db1a-8ade-bb555fb0c7a9	6221	Dutovlje
00050000-5562-db1a-3548-132918d7b402	8361	Dvor
00050000-5562-db1a-86fa-6746548a9869	2343	Fala
00050000-5562-db1a-b08f-45695de6454f	9208	Fokovci
00050000-5562-db1a-2382-199e69286abf	2313	Fram
00050000-5562-db1a-6a47-3801c14a4897	3213	Frankolovo
00050000-5562-db1a-b3c2-c3192673aa26	1274	Gabrovka
00050000-5562-db1a-3734-ec835d08eaef	8254	Globoko
00050000-5562-db1a-7279-030e02d270c0	5275	Godovič
00050000-5562-db1a-a118-01e528aac519	4204	Golnik
00050000-5562-db1a-4966-6c4bc3874ea1	3303	Gomilsko
00050000-5562-db1a-5fe6-7deb171180e1	4224	Gorenja vas
00050000-5562-db1a-4877-b2d3826e550e	3263	Gorica pri Slivnici
00050000-5562-db1a-93ba-02833799eae2	2272	Gorišnica
00050000-5562-db1a-fb9e-52d22aa77534	9250	Gornja Radgona
00050000-5562-db1a-3a96-eeb85ef5f928	3342	Gornji Grad
00050000-5562-db1a-51e1-b454b2de9944	4282	Gozd Martuljek
00050000-5562-db1a-a8d8-24125c902bc8	6272	Gračišče
00050000-5562-db1a-6e2a-955be06383a0	9264	Grad
00050000-5562-db1a-4f85-badb3554feaf	8332	Gradac
00050000-5562-db1a-a18d-410bedbde946	1384	Grahovo
00050000-5562-db1a-efc6-ef853b0e248a	5242	Grahovo ob Bači
00050000-5562-db1a-2caf-bd7b9bc03e7c	5251	Grgar
00050000-5562-db1a-301d-c183ebb7e3e8	3302	Griže
00050000-5562-db1a-0e13-df86e65fc469	3231	Grobelno
00050000-5562-db1a-141a-18b3f07a0d00	1290	Grosuplje
00050000-5562-db1a-8261-00b8ae9cb632	2288	Hajdina
00050000-5562-db1a-f96a-76f54058725f	8362	Hinje
00050000-5562-db1a-f0fd-712a25b5a196	2311	Hoče
00050000-5562-db1a-f1b8-196c7f3056da	9205	Hodoš/Hodos
00050000-5562-db1a-06e6-30ec027055a5	1354	Horjul
00050000-5562-db1a-4250-0af3834e708b	1372	Hotedršica
00050000-5562-db1a-25a3-bba3c3540f8d	1430	Hrastnik
00050000-5562-db1a-7428-7aa7244a8c19	6225	Hruševje
00050000-5562-db1a-79dc-78121ee36286	4276	Hrušica
00050000-5562-db1a-94c9-4198d702fafc	5280	Idrija
00050000-5562-db1a-b9a8-add57db59d06	1292	Ig
00050000-5562-db1a-b63a-a07ee1c09303	6250	Ilirska Bistrica
00050000-5562-db1a-72c5-a80c1346ea26	6251	Ilirska Bistrica-Trnovo
00050000-5562-db1a-2cc6-092a9979e701	1295	Ivančna Gorica
00050000-5562-db1a-2f9f-f6eb656a63c9	2259	Ivanjkovci
00050000-5562-db1a-f8b5-3b16bf0921c4	1411	Izlake
00050000-5562-db1a-ba97-0a97af6dd7d1	6310	Izola/Isola
00050000-5562-db1a-d9b2-7dd8e2e1b31a	2222	Jakobski Dol
00050000-5562-db1a-713c-3dbcc8d6955c	2221	Jarenina
00050000-5562-db1a-c885-56633b49c249	6254	Jelšane
00050000-5562-db1a-60c9-215ee79270f0	4270	Jesenice
00050000-5562-db1a-2255-7ca1cfe92929	8261	Jesenice na Dolenjskem
00050000-5562-db1a-9b15-077e07b5be5b	3273	Jurklošter
00050000-5562-db1a-b53e-995e067d29c7	2223	Jurovski Dol
00050000-5562-db1a-b7b1-772fbec328a0	2256	Juršinci
00050000-5562-db1a-2a36-88c95c7cf0d2	5214	Kal nad Kanalom
00050000-5562-db1a-f184-636f36d2c945	3233	Kalobje
00050000-5562-db1a-2b8c-31b299f0966c	4246	Kamna Gorica
00050000-5562-db1a-67ca-babb206c4438	2351	Kamnica
00050000-5562-db1a-4369-08c6602953c4	1241	Kamnik
00050000-5562-db1a-b520-94952788c433	5213	Kanal
00050000-5562-db1a-1eae-85e463c5aa7d	8258	Kapele
00050000-5562-db1a-5946-425da05f3074	2362	Kapla
00050000-5562-db1a-4865-6e5f5528b907	2325	Kidričevo
00050000-5562-db1a-efe8-a496079fcefc	1412	Kisovec
00050000-5562-db1a-aa83-ffe03ddd3019	6253	Knežak
00050000-5562-db1a-4eee-9a14a3387a80	5222	Kobarid
00050000-5562-db1a-e6c9-c29770d132de	9227	Kobilje
00050000-5562-db1a-3639-1a33693c957e	1330	Kočevje
00050000-5562-db1a-adeb-3fad7f8ac576	1338	Kočevska Reka
00050000-5562-db1a-06e2-e3c543fb2aa7	2276	Kog
00050000-5562-db1a-0530-6d3c08bf021b	5211	Kojsko
00050000-5562-db1a-9d4e-b2bf5c4e56b3	6223	Komen
00050000-5562-db1a-381b-7c60f9a75c3f	1218	Komenda
00050000-5562-db1a-3e0b-4e6a57170081	6000	Koper/Capodistria 
00050000-5562-db1a-9ac3-fa04e75d472d	6001	Koper/Capodistria - poštni predali
00050000-5562-db1a-12d2-4321992af0d3	8282	Koprivnica
00050000-5562-db1a-52f9-fb7dcf64e621	5296	Kostanjevica na Krasu
00050000-5562-db1a-aba2-954bf84c70ee	8311	Kostanjevica na Krki
00050000-5562-db1a-9dc8-48786ed8d38e	1336	Kostel
00050000-5562-db1a-f6e9-030f99b0fe88	6256	Košana
00050000-5562-db1a-ff1d-a77362e26089	2394	Kotlje
00050000-5562-db1a-3887-34a2d3b10526	6240	Kozina
00050000-5562-db1a-61d6-b330366d72ad	3260	Kozje
00050000-5562-db1a-5690-8a7726b96266	4000	Kranj 
00050000-5562-db1a-deaa-33e69a405d2d	4001	Kranj - poštni predali
00050000-5562-db1a-6b59-86d1930ecace	4280	Kranjska Gora
00050000-5562-db1a-c21b-2a1f1f02037f	1281	Kresnice
00050000-5562-db1a-47fd-35a71586faf7	4294	Križe
00050000-5562-db1a-ab51-bd28b04b70cc	9206	Križevci
00050000-5562-db1a-4701-93abe76ddfe8	9242	Križevci pri Ljutomeru
00050000-5562-db1a-884a-0f940fba4316	1301	Krka
00050000-5562-db1a-f79b-1985550f2c57	8296	Krmelj
00050000-5562-db1a-b05c-199942337147	4245	Kropa
00050000-5562-db1a-6219-4c4cdcedc2d9	8262	Krška vas
00050000-5562-db1a-9d9e-94652cf67949	8270	Krško
00050000-5562-db1a-8ba9-0b5bc9026171	9263	Kuzma
00050000-5562-db1a-34ea-4b8fdff28d83	2318	Laporje
00050000-5562-db1a-512a-c276d0848a46	3270	Laško
00050000-5562-db1a-0b44-88d9115ee7e0	1219	Laze v Tuhinju
00050000-5562-db1a-009b-833d08364af9	2230	Lenart v Slovenskih goricah
00050000-5562-db1a-ff50-a1a95da5c5cd	9220	Lendava/Lendva
00050000-5562-db1a-9021-0a9a3f5925c7	4248	Lesce
00050000-5562-db1a-64b0-6956e831332f	3261	Lesično
00050000-5562-db1a-94cb-f626760cb36d	8273	Leskovec pri Krškem
00050000-5562-db1a-3a6f-e33106c92f4a	2372	Libeliče
00050000-5562-db1a-4e3e-f9a743b5e011	2341	Limbuš
00050000-5562-db1a-6bd3-a901d55de7bc	1270	Litija
00050000-5562-db1a-fe5b-4d33170d4e64	3202	Ljubečna
00050000-5562-db1a-606a-e2fad475bcf9	1000	Ljubljana 
00050000-5562-db1a-4f15-2df3dc31f3bf	1001	Ljubljana - poštni predali
00050000-5562-db1a-fced-4571a614e969	1231	Ljubljana - Črnuče
00050000-5562-db1a-13f4-606cb096257c	1261	Ljubljana - Dobrunje
00050000-5562-db1a-26cc-45c3014dce8e	1260	Ljubljana - Polje
00050000-5562-db1a-db32-a21bb20e32c1	1210	Ljubljana - Šentvid
00050000-5562-db1a-ba53-c928286967ed	1211	Ljubljana - Šmartno
00050000-5562-db1a-6a91-b70e7b3c6826	3333	Ljubno ob Savinji
00050000-5562-db1a-d008-fa9165012e5d	9240	Ljutomer
00050000-5562-db1a-a264-ccd5522150a7	3215	Loče
00050000-5562-db1a-ea13-0bf019dd56d0	5231	Log pod Mangartom
00050000-5562-db1a-73ab-b1fabf9ea880	1358	Log pri Brezovici
00050000-5562-db1a-7b02-2f137038fa7f	1370	Logatec
00050000-5562-db1a-beab-42598dd0ad23	1371	Logatec
00050000-5562-db1a-f90d-2271ec885e43	1434	Loka pri Zidanem Mostu
00050000-5562-db1a-0e33-6955b4d9e675	3223	Loka pri Žusmu
00050000-5562-db1a-b34d-8edda299bd97	6219	Lokev
00050000-5562-db1a-7a76-2aba54dc4b2c	1318	Loški Potok
00050000-5562-db1a-8563-6d1f51940223	2324	Lovrenc na Dravskem polju
00050000-5562-db1a-8ff8-4f8c5951d2f8	2344	Lovrenc na Pohorju
00050000-5562-db1a-da32-c04f5587a6e6	3334	Luče
00050000-5562-db1a-e9eb-ed1472f41489	1225	Lukovica
00050000-5562-db1a-266d-c01e8db2b770	9202	Mačkovci
00050000-5562-db1a-eb28-6913f3fa601e	2322	Majšperk
00050000-5562-db1a-9e05-2664856d06cb	2321	Makole
00050000-5562-db1a-7d73-00c2f4f83625	9243	Mala Nedelja
00050000-5562-db1a-0ded-f2f5ebc2fe6f	2229	Malečnik
00050000-5562-db1a-975c-067d883a77a3	6273	Marezige
00050000-5562-db1a-60c0-ed533022b0c2	2000	Maribor 
00050000-5562-db1a-2df4-2ddb35511f25	2001	Maribor - poštni predali
00050000-5562-db1a-22f8-ebb9866a9e21	2206	Marjeta na Dravskem polju
00050000-5562-db1a-5e7a-cc5cf381fc10	2281	Markovci
00050000-5562-db1a-31d6-1a8f79c35fff	9221	Martjanci
00050000-5562-db1a-e2a8-0988d2033d3f	6242	Materija
00050000-5562-db1a-4475-1e61b43b41f8	4211	Mavčiče
00050000-5562-db1a-ff1b-cda16628044a	1215	Medvode
00050000-5562-db1a-45a5-9a74464d1410	1234	Mengeš
00050000-5562-db1a-e681-eacf140d6d65	8330	Metlika
00050000-5562-db1a-ee52-0f20dde1c63b	2392	Mežica
00050000-5562-db1a-510b-36e79d8a53b4	2204	Miklavž na Dravskem polju
00050000-5562-db1a-244f-89bd79278b32	2275	Miklavž pri Ormožu
00050000-5562-db1a-c21d-3781aa7cdf9f	5291	Miren
00050000-5562-db1a-f61b-d44bcd0a6de4	8233	Mirna
00050000-5562-db1a-acab-d6025aaf7951	8216	Mirna Peč
00050000-5562-db1a-ee59-61889f217407	2382	Mislinja
00050000-5562-db1a-00a0-280cf6dc28f8	4281	Mojstrana
00050000-5562-db1a-9fa8-eb9d96d09cde	8230	Mokronog
00050000-5562-db1a-39f7-2569e525413e	1251	Moravče
00050000-5562-db1a-68c6-03c99385fa90	9226	Moravske Toplice
00050000-5562-db1a-7fc5-02ce55b7433b	5216	Most na Soči
00050000-5562-db1a-7d14-8abe819f93df	1221	Motnik
00050000-5562-db1a-e06e-d456619906ae	3330	Mozirje
00050000-5562-db1a-d75d-cfc467c28a73	9000	Murska Sobota 
00050000-5562-db1a-f686-7f7963c35159	9001	Murska Sobota - poštni predali
00050000-5562-db1a-c93a-03e4ba282dcb	2366	Muta
00050000-5562-db1a-afa8-83d6d4d4f0b7	4202	Naklo
00050000-5562-db1a-3be6-9bbbe698b2a1	3331	Nazarje
00050000-5562-db1a-4c1b-31e7448a6679	1357	Notranje Gorice
00050000-5562-db1a-13db-bbe4d8929e74	3203	Nova Cerkev
00050000-5562-db1a-f62b-6ca21537daf4	5000	Nova Gorica 
00050000-5562-db1a-265f-608b097f2f41	5001	Nova Gorica - poštni predali
00050000-5562-db1a-2a55-c01e581e8328	1385	Nova vas
00050000-5562-db1a-ffc1-6e0d2a9c82dd	8000	Novo mesto
00050000-5562-db1a-ec8b-fdf1968cbb74	8001	Novo mesto - poštni predali
00050000-5562-db1a-1130-5ad13e1e1ddd	6243	Obrov
00050000-5562-db1a-046a-eda00c47b036	9233	Odranci
00050000-5562-db1a-9e25-f21cf60247ea	2317	Oplotnica
00050000-5562-db1a-9a98-9125d9797547	2312	Orehova vas
00050000-5562-db1a-414e-d0350b76a359	2270	Ormož
00050000-5562-db1a-93f8-af14a67ece74	1316	Ortnek
00050000-5562-db1a-3453-e16f329e9a54	1337	Osilnica
00050000-5562-db1a-3a74-a7c229e7e276	8222	Otočec
00050000-5562-db1a-63d2-89af0f65a6a1	2361	Ožbalt
00050000-5562-db1a-d272-99157ece8710	2231	Pernica
00050000-5562-db1a-0f5a-29da4b169e25	2211	Pesnica pri Mariboru
00050000-5562-db1a-8e0d-befe7cf16716	9203	Petrovci
00050000-5562-db1a-9c15-455f6dd5d49e	3301	Petrovče
00050000-5562-db1a-2729-38a4182ccb48	6330	Piran/Pirano
00050000-5562-db1a-0d8d-bbe2b6f77291	8255	Pišece
00050000-5562-db1a-2488-2f1b587d17ff	6257	Pivka
00050000-5562-db1a-19bf-9b2a6401b6a4	6232	Planina
00050000-5562-db1a-5e84-c4aba5dc5305	3225	Planina pri Sevnici
00050000-5562-db1a-9aca-b2212370a7ee	6276	Pobegi
00050000-5562-db1a-a8d8-1330778b28a2	8312	Podbočje
00050000-5562-db1a-72e0-c28d7fea52d1	5243	Podbrdo
00050000-5562-db1a-9204-708c2f7830fb	3254	Podčetrtek
00050000-5562-db1a-2c0e-2fac20d7b068	2273	Podgorci
00050000-5562-db1a-bae6-e178920dac04	6216	Podgorje
00050000-5562-db1a-ae48-14914fd9f020	2381	Podgorje pri Slovenj Gradcu
00050000-5562-db1a-e3c8-8641834a3563	6244	Podgrad
00050000-5562-db1a-7e59-eefab983168f	1414	Podkum
00050000-5562-db1a-cf4f-116db22798d6	2286	Podlehnik
00050000-5562-db1a-fc23-21053d559159	5272	Podnanos
00050000-5562-db1a-378a-756cf0863135	4244	Podnart
00050000-5562-db1a-faf0-ccc8f5c08e78	3241	Podplat
00050000-5562-db1a-8651-cd59cea8ab58	3257	Podsreda
00050000-5562-db1a-01a5-bd374cf89139	2363	Podvelka
00050000-5562-db1a-d4bb-5a5fb78d6791	2208	Pohorje
00050000-5562-db1a-8083-5be3b36f2a48	2257	Polenšak
00050000-5562-db1a-8c49-58de10784a13	1355	Polhov Gradec
00050000-5562-db1a-0f16-c7e8fd31c4b9	4223	Poljane nad Škofjo Loko
00050000-5562-db1a-dbf7-ad300365668c	2319	Poljčane
00050000-5562-db1a-4918-0cd6cc565bf3	1272	Polšnik
00050000-5562-db1a-b83c-ed9e19dd5605	3313	Polzela
00050000-5562-db1a-8a18-5057ec3be27a	3232	Ponikva
00050000-5562-db1a-b4ea-9a4cffe099d0	6320	Portorož/Portorose
00050000-5562-db1a-3cac-5dfc4bedb201	6230	Postojna
00050000-5562-db1a-8edb-1f4df12b9352	2331	Pragersko
00050000-5562-db1a-fe41-71c107087854	3312	Prebold
00050000-5562-db1a-08be-d221fe891151	4205	Preddvor
00050000-5562-db1a-55f5-0e389d7391ea	6255	Prem
00050000-5562-db1a-c73f-9b19be0997e1	1352	Preserje
00050000-5562-db1a-9b7e-b67a19095b07	6258	Prestranek
00050000-5562-db1a-b060-fdfb2155184f	2391	Prevalje
00050000-5562-db1a-fa72-0cca0a724ec0	3262	Prevorje
00050000-5562-db1a-a7f1-32add95d1f77	1276	Primskovo 
00050000-5562-db1a-be92-00a6cbc4b198	3253	Pristava pri Mestinju
00050000-5562-db1a-363b-3771bada1018	9207	Prosenjakovci/Partosfalva
00050000-5562-db1a-edcd-fd62e3f5600b	5297	Prvačina
00050000-5562-db1a-89d7-5c247d016f7f	2250	Ptuj
00050000-5562-db1a-5979-e98b4c6b86fb	2323	Ptujska Gora
00050000-5562-db1a-2f13-6bacd20b1480	9201	Puconci
00050000-5562-db1a-3420-e7f175a1f2fd	2327	Rače
00050000-5562-db1a-6b6d-ae7aad0336df	1433	Radeče
00050000-5562-db1a-b984-e0a9bc6b9065	9252	Radenci
00050000-5562-db1a-2775-485ab89fe1e2	2360	Radlje ob Dravi
00050000-5562-db1a-50a0-f15d6bb0deef	1235	Radomlje
00050000-5562-db1a-94b8-0babb34fe6e7	4240	Radovljica
00050000-5562-db1a-1a0a-82ea87fe5aba	8274	Raka
00050000-5562-db1a-cfb4-98a11ca1b021	1381	Rakek
00050000-5562-db1a-5fe2-2119d488a61a	4283	Rateče - Planica
00050000-5562-db1a-cd60-e58671b7d581	2390	Ravne na Koroškem
00050000-5562-db1a-927b-4bb41852b882	9246	Razkrižje
00050000-5562-db1a-d80a-3cbf53964b32	3332	Rečica ob Savinji
00050000-5562-db1a-cb8e-8fa1bd4f8531	5292	Renče
00050000-5562-db1a-5572-b5bdc4c3412a	1310	Ribnica
00050000-5562-db1a-7231-dd0aa046f566	2364	Ribnica na Pohorju
00050000-5562-db1a-b925-5aa23a5defae	3272	Rimske Toplice
00050000-5562-db1a-9c92-028f1b33af30	1314	Rob
00050000-5562-db1a-f1cf-fbf45472fe87	5215	Ročinj
00050000-5562-db1a-cfa7-b42a5e7a1ad8	3250	Rogaška Slatina
00050000-5562-db1a-af32-45ef96084d27	9262	Rogašovci
00050000-5562-db1a-1096-361d0ab7c9ab	3252	Rogatec
00050000-5562-db1a-848f-3e16f17e7071	1373	Rovte
00050000-5562-db1a-8c24-0d50dc10cdac	2342	Ruše
00050000-5562-db1a-6756-47828647ddbf	1282	Sava
00050000-5562-db1a-f6a2-3aa5068cbad7	6333	Sečovlje/Sicciole
00050000-5562-db1a-a5ff-8879733fe8c6	4227	Selca
00050000-5562-db1a-6a1e-241a1265a022	2352	Selnica ob Dravi
00050000-5562-db1a-420e-ad1a2846a5fc	8333	Semič
00050000-5562-db1a-cee1-f67b946e35ad	8281	Senovo
00050000-5562-db1a-1151-e351bafbfda3	6224	Senožeče
00050000-5562-db1a-af68-d94754425c14	8290	Sevnica
00050000-5562-db1a-009e-d4fa240e25f2	6210	Sežana
00050000-5562-db1a-1493-d05c31a860d0	2214	Sladki Vrh
00050000-5562-db1a-322a-f2eb3108794f	5283	Slap ob Idrijci
00050000-5562-db1a-5967-7ca3fc5914cd	2380	Slovenj Gradec
00050000-5562-db1a-a325-8f1a21f9afbc	2310	Slovenska Bistrica
00050000-5562-db1a-13bd-9c19d15c1193	3210	Slovenske Konjice
00050000-5562-db1a-5c40-6a16affff376	1216	Smlednik
00050000-5562-db1a-ee0b-ef3f46498765	5232	Soča
00050000-5562-db1a-8bcd-651f5eb0126a	1317	Sodražica
00050000-5562-db1a-5155-80d7cc6ba74e	3335	Solčava
00050000-5562-db1a-3bf4-40a454fad00d	5250	Solkan
00050000-5562-db1a-a30c-33f0e3bd3a51	4229	Sorica
00050000-5562-db1a-72ee-f68bf280f9ac	4225	Sovodenj
00050000-5562-db1a-f9ea-81db514f529c	5281	Spodnja Idrija
00050000-5562-db1a-f1f9-4588d471da21	2241	Spodnji Duplek
00050000-5562-db1a-67b6-33fc00dde3d3	9245	Spodnji Ivanjci
00050000-5562-db1a-9e5a-0e80970bafba	2277	Središče ob Dravi
00050000-5562-db1a-3d2a-cdd69620f2a4	4267	Srednja vas v Bohinju
00050000-5562-db1a-629e-1b50c415cf43	8256	Sromlje 
00050000-5562-db1a-db4c-375de6f036d9	5224	Srpenica
00050000-5562-db1a-6751-9ab6c6ad895a	1242	Stahovica
00050000-5562-db1a-23c1-aaea46851767	1332	Stara Cerkev
00050000-5562-db1a-8d27-fcbe071a900c	8342	Stari trg ob Kolpi
00050000-5562-db1a-887f-93ae6316eb97	1386	Stari trg pri Ložu
00050000-5562-db1a-1b80-ab12deca5bd7	2205	Starše
00050000-5562-db1a-9c2d-61578c44bdca	2289	Stoperce
00050000-5562-db1a-37f9-ed27a51777fd	8322	Stopiče
00050000-5562-db1a-39ff-7cef49fcebe3	3206	Stranice
00050000-5562-db1a-7be4-7e7f75396210	8351	Straža
00050000-5562-db1a-e3ed-0c955f136eff	1313	Struge
00050000-5562-db1a-cdde-2a3ad3639a49	8293	Studenec
00050000-5562-db1a-b041-5b274f574b7c	8331	Suhor
00050000-5562-db1a-cbd4-e945b11736f1	2233	Sv. Ana v Slovenskih goricah
00050000-5562-db1a-f5de-f22b02aa87bc	2235	Sv. Trojica v Slovenskih goricah
00050000-5562-db1a-d6d2-88f55e062480	2353	Sveti Duh na Ostrem Vrhu
00050000-5562-db1a-924e-94326ff43ec6	9244	Sveti Jurij ob Ščavnici
00050000-5562-db1a-c9dc-ffa70cc33b8f	3264	Sveti Štefan
00050000-5562-db1a-5ef6-2f2245bdbb3c	2258	Sveti Tomaž
00050000-5562-db1a-d4bd-ff98c2446465	9204	Šalovci
00050000-5562-db1a-d097-ad8ee9d3ec32	5261	Šempas
00050000-5562-db1a-b8ac-b085b95ef491	5290	Šempeter pri Gorici
00050000-5562-db1a-9d39-0c6f35f83de9	3311	Šempeter v Savinjski dolini
00050000-5562-db1a-b7f5-9f09d56f3e52	4208	Šenčur
00050000-5562-db1a-a38c-a0beba7483a5	2212	Šentilj v Slovenskih goricah
00050000-5562-db1a-bf97-87d12a36b821	8297	Šentjanž
00050000-5562-db1a-b89a-063fd076ce85	2373	Šentjanž pri Dravogradu
00050000-5562-db1a-1a49-3c923d48f721	8310	Šentjernej
00050000-5562-db1a-6dde-d6c253407401	3230	Šentjur
00050000-5562-db1a-4d73-f58965639e88	3271	Šentrupert
00050000-5562-db1a-7768-18a3362b6096	8232	Šentrupert
00050000-5562-db1a-aa1a-260d20776336	1296	Šentvid pri Stični
00050000-5562-db1a-6c6a-784daf81cc25	8275	Škocjan
00050000-5562-db1a-c6d3-8bae59ebac70	6281	Škofije
00050000-5562-db1a-1bcc-5401f7c99985	4220	Škofja Loka
00050000-5562-db1a-7024-36572be1ddcd	3211	Škofja vas
00050000-5562-db1a-8d79-d6ba155ba7f5	1291	Škofljica
00050000-5562-db1a-5884-82a225fb7286	6274	Šmarje
00050000-5562-db1a-bff2-9fae2e5f71eb	1293	Šmarje - Sap
00050000-5562-db1a-dea8-f20afb8c0cb4	3240	Šmarje pri Jelšah
00050000-5562-db1a-5786-635458fffff5	8220	Šmarješke Toplice
00050000-5562-db1a-af76-b4ff49e130f5	2315	Šmartno na Pohorju
00050000-5562-db1a-eabc-ae726c8126cd	3341	Šmartno ob Dreti
00050000-5562-db1a-c241-4b286ac88441	3327	Šmartno ob Paki
00050000-5562-db1a-18a4-9bdbf10b12b7	1275	Šmartno pri Litiji
00050000-5562-db1a-976a-712dbb5cda3d	2383	Šmartno pri Slovenj Gradcu
00050000-5562-db1a-3d16-ada91d52a6af	3201	Šmartno v Rožni dolini
00050000-5562-db1a-1cef-61474e010046	3325	Šoštanj
00050000-5562-db1a-aad0-b41b06525331	6222	Štanjel
00050000-5562-db1a-9b66-248baeffb5d5	3220	Štore
00050000-5562-db1a-b34f-925ac4231331	3304	Tabor
00050000-5562-db1a-71ac-01550b513e81	3221	Teharje
00050000-5562-db1a-a684-f7b421c16b15	9251	Tišina
00050000-5562-db1a-ad1c-f54685e14d5f	5220	Tolmin
00050000-5562-db1a-abb3-ee7cedc20764	3326	Topolšica
00050000-5562-db1a-8d3d-5b954c4914ec	2371	Trbonje
00050000-5562-db1a-0412-b4c5d4660595	1420	Trbovlje
00050000-5562-db1a-ba93-113cd21046e1	8231	Trebelno 
00050000-5562-db1a-f817-eed30491d41d	8210	Trebnje
00050000-5562-db1a-a0ff-0a2ecce0adad	5252	Trnovo pri Gorici
00050000-5562-db1a-9bdf-eeb754e58e23	2254	Trnovska vas
00050000-5562-db1a-bd57-ccc2a6f20c5e	1222	Trojane
00050000-5562-db1a-d4d1-844d0fa561ee	1236	Trzin
00050000-5562-db1a-0ba8-8194180b4599	4290	Tržič
00050000-5562-db1a-ccee-b13fa0b9bb67	8295	Tržišče
00050000-5562-db1a-e616-9ecb049c2620	1311	Turjak
00050000-5562-db1a-6be2-1c89e85661d2	9224	Turnišče
00050000-5562-db1a-264e-bcb3133f620c	8323	Uršna sela
00050000-5562-db1a-ece7-d80a518fc062	1252	Vače
00050000-5562-db1a-b34b-76f1575d506f	3320	Velenje 
00050000-5562-db1a-9949-ed0ea8c62e30	3322	Velenje - poštni predali
00050000-5562-db1a-bb76-c66fd85a8db9	8212	Velika Loka
00050000-5562-db1a-6ee5-c012eada9968	2274	Velika Nedelja
00050000-5562-db1a-3757-52f0c91a5289	9225	Velika Polana
00050000-5562-db1a-67c1-bcd1a6493b0f	1315	Velike Lašče
00050000-5562-db1a-e856-fda750c33d5f	8213	Veliki Gaber
00050000-5562-db1a-d461-7ebab87b209d	9241	Veržej
00050000-5562-db1a-e0dd-7972ffeb8202	1312	Videm - Dobrepolje
00050000-5562-db1a-73b5-81f99877da14	2284	Videm pri Ptuju
00050000-5562-db1a-fe55-d3bb98d31bb2	8344	Vinica
00050000-5562-db1a-53bd-0bb2f1da49a5	5271	Vipava
00050000-5562-db1a-2d15-6bf95ab95b2f	4212	Visoko
00050000-5562-db1a-8160-95946786e1ab	1294	Višnja Gora
00050000-5562-db1a-7a55-b6266c78ac47	3205	Vitanje
00050000-5562-db1a-ab5e-a56c61714baf	2255	Vitomarci
00050000-5562-db1a-920a-6cf14b99316e	1217	Vodice
00050000-5562-db1a-d088-f608f540f611	3212	Vojnik\t
00050000-5562-db1a-7c4e-9120537bbab9	5293	Volčja Draga
00050000-5562-db1a-dc53-2f357a3c211a	2232	Voličina
00050000-5562-db1a-d6eb-78e2ecb3da85	3305	Vransko
00050000-5562-db1a-d922-8df3441549d7	6217	Vremski Britof
00050000-5562-db1a-ee34-4553c968deea	1360	Vrhnika
00050000-5562-db1a-e416-5d8c79492ac0	2365	Vuhred
00050000-5562-db1a-2f2d-df1a280ec2e9	2367	Vuzenica
00050000-5562-db1a-76ca-5ae402c1718f	8292	Zabukovje 
00050000-5562-db1a-6abc-3def96ef1f1f	1410	Zagorje ob Savi
00050000-5562-db1a-b05c-7ed0844d0e9c	1303	Zagradec
00050000-5562-db1a-4498-06c0a448ab41	2283	Zavrč
00050000-5562-db1a-00fe-731957d018f1	8272	Zdole 
00050000-5562-db1a-47ed-a1298042ba41	4201	Zgornja Besnica
00050000-5562-db1a-7fd7-7a60ac2cde65	2242	Zgornja Korena
00050000-5562-db1a-2d34-952ab03629ab	2201	Zgornja Kungota
00050000-5562-db1a-66e1-ebbbfb0eecbe	2316	Zgornja Ložnica
00050000-5562-db1a-2627-08f671e2514f	2314	Zgornja Polskava
00050000-5562-db1a-bdfb-c226731f9429	2213	Zgornja Velka
00050000-5562-db1a-57b9-8d173f1673c6	4247	Zgornje Gorje
00050000-5562-db1a-ce52-81cc166cb202	4206	Zgornje Jezersko
00050000-5562-db1a-39d4-fd79a3376cf2	2285	Zgornji Leskovec
00050000-5562-db1a-da91-ca16c542d549	1432	Zidani Most
00050000-5562-db1a-52c6-00adf573a1f9	3214	Zreče
00050000-5562-db1a-9085-b1b5f35af41e	4209	Žabnica
00050000-5562-db1a-4818-99c08b3ec21d	3310	Žalec
00050000-5562-db1a-4944-973c14220aa1	4228	Železniki
00050000-5562-db1a-b7f7-e23ff36974c2	2287	Žetale
00050000-5562-db1a-dd1e-df7e20fb1a3b	4226	Žiri
00050000-5562-db1a-8216-8bcb56ce4bf6	4274	Žirovnica
00050000-5562-db1a-497b-b08bb58eecff	8360	Žužemberk
\.


--
-- TOC entry 2724 (class 0 OID 4824991)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2692 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2706 (class 0 OID 4824806)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2712 (class 0 OID 4824884)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2726 (class 0 OID 4825003)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2739 (class 0 OID 4825123)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2743 (class 0 OID 4825174)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2730 (class 0 OID 4825032)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2722 (class 0 OID 4824976)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2721 (class 0 OID 4824966)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2742 (class 0 OID 4825163)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2737 (class 0 OID 4825100)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2695 (class 0 OID 4824680)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5562-db1b-8bb0-f588bab75603	00010000-5562-db1b-6775-37356012301c	2015-05-25 10:19:40	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROfsW4TgrB9Yj7SN9Jxh80OI/lWTVJulK";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2763 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2731 (class 0 OID 4825042)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2699 (class 0 OID 4824718)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5562-db1b-804c-6ccca6583608	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5562-db1b-4725-9f5b9b9f8667	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5562-db1b-6951-f76c9a845a1c	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5562-db1b-cdec-046bb775b519	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5562-db1b-7a4d-c42867a7f3fa	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5562-db1b-f845-51281bc887ca	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2697 (class 0 OID 4824702)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5562-db1b-8bb0-f588bab75603	00020000-5562-db1b-cdec-046bb775b519
00010000-5562-db1b-6775-37356012301c	00020000-5562-db1b-cdec-046bb775b519
\.


--
-- TOC entry 2733 (class 0 OID 4825056)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2725 (class 0 OID 4824997)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2719 (class 0 OID 4824947)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2751 (class 0 OID 4825269)
-- Dependencies: 230
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5562-db1b-c7fe-b6d9848c3e9b	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5562-db1b-e094-7132e1783d67	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5562-db1b-fd2e-378768a490c2	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5562-db1b-fe26-ff95019cf581	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5562-db1b-0b9f-4fac0d8b495f	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2750 (class 0 OID 4825262)
-- Dependencies: 229
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5562-db1b-1646-1b2acdea2673	00000000-5562-db1b-fe26-ff95019cf581	popa
00000000-5562-db1b-d3cc-a39d90924b78	00000000-5562-db1b-fe26-ff95019cf581	oseba
00000000-5562-db1b-490e-3e31e359c0bd	00000000-5562-db1b-e094-7132e1783d67	prostor
00000000-5562-db1b-04b8-c4fd5d8398fe	00000000-5562-db1b-fe26-ff95019cf581	besedilo
00000000-5562-db1b-3353-f7fa9fdad130	00000000-5562-db1b-fe26-ff95019cf581	uprizoritev
00000000-5562-db1b-1f6c-ab7cedc73e80	00000000-5562-db1b-fe26-ff95019cf581	funkcija
00000000-5562-db1b-6ff1-a5131bbe6fa8	00000000-5562-db1b-fe26-ff95019cf581	tipfunkcije
\.


--
-- TOC entry 2749 (class 0 OID 4825257)
-- Dependencies: 228
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2738 (class 0 OID 4825110)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2764 (class 0 OID 0)
-- Dependencies: 232
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('strosekuprizoritve_id_seq', 1, false);


--
-- TOC entry 2704 (class 0 OID 4824778)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2720 (class 0 OID 4824953)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2741 (class 0 OID 4825152)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5562-db1b-48c9-e9180f93eea1	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5562-db1b-519b-3b93de6874f8	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5562-db1b-6d20-bdce5465158a	Baletnik ali plesalec	Baletniki in plesalci	\N	Baletnica ali plesalka	igralec
000f0000-5562-db1b-5ebf-942044510d88	Avtor	Avtorji	\N	Avtorka	umetnik
000f0000-5562-db1b-b729-11f66c58b756	Režiser	Režiserji	\N	Režiserka	umetnik
000f0000-5562-db1b-0b7f-d8064db3a520	Scenograf	Scenografi	\N	Scenografka	tehnik
000f0000-5562-db1b-22fd-dc1a292b1a92	Kostumograf	Kostumografi	\N	Kostumografinja	tehnik
000f0000-5562-db1b-734a-429c9ae3c16c	Oblikovalec maske	Oblikovalci maske	\N	Oblikovalka maske	tehnik
000f0000-5562-db1b-e837-1faa287c4ead	Avtor glasbe	Avtorji glasbe	\N	Avtorica glasbe	umetnik
000f0000-5562-db1b-8fa9-5b841ff73453	Oblikovalec svetlobe	Oblikovalci svetlobe	\N	Oblikovalka svetlobe	tehnik
000f0000-5562-db1b-5b20-3322f02a8a78	Koreograf	Koreografi	\N	Koreografinja	umetnik
000f0000-5562-db1b-7626-c35d188f5934	Dramaturg	Dramaturgi	\N	Dramaturginja	umetnik
000f0000-5562-db1b-d055-d3623df0adcb	Lektorj	Lektorji	\N	Lektorica	umetnik
000f0000-5562-db1b-c1c8-40655f586b8b	Prevajalec	Prevajalci	\N	Prevajalka	umetnik
000f0000-5562-db1b-cce6-9a06fb6e5a18	Oblikovalec videa	Oblikovalci videa	\N	Oblikovalka videa	umetnik
000f0000-5562-db1b-311f-9b90565616cf	Intermedijski ustvarjalec	Intermedijski ustvarjalci	\N	Intermedijska ustvarjalka	umetnik
\.


--
-- TOC entry 2709 (class 0 OID 4824841)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2696 (class 0 OID 4824689)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5562-db1b-6775-37356012301c	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROc9yZVOCiqVdctXOnbcZ772vts9VHRJW	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5562-db1b-8bb0-f588bab75603	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2746 (class 0 OID 4825207)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
\.


--
-- TOC entry 2714 (class 0 OID 4824899)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2729 (class 0 OID 4825024)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2736 (class 0 OID 4825092)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2716 (class 0 OID 4824931)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2745 (class 0 OID 4825197)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2735 (class 0 OID 4825082)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2317 (class 2606 OID 4824743)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 4825251)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 4825241)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 4825151)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 2606 OID 4824921)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2387 (class 2606 OID 4824946)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2350 (class 2606 OID 4824867)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 4825078)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2365 (class 2606 OID 4824897)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 4824940)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2358 (class 2606 OID 4824881)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2288 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2408 (class 2606 OID 4824989)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 4825016)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2343 (class 2606 OID 4824839)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2321 (class 2606 OID 4824752)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2324 (class 2606 OID 4824775)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2315 (class 2606 OID 4824732)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2308 (class 2606 OID 4824717)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 4825022)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 4825055)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 4825192)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2332 (class 2606 OID 4824803)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 4824827)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2412 (class 2606 OID 4824995)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 4824817)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 4824888)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 4825007)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 4825135)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 4825179)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 2606 OID 4825039)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 4824980)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2400 (class 2606 OID 4824971)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 4825173)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 4825107)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 4824688)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 4825046)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2306 (class 2606 OID 4824706)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2310 (class 2606 OID 4824726)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 4825064)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 4825002)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2389 (class 2606 OID 4824952)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 2606 OID 4825275)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 4825266)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 4825261)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 4825120)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 2606 OID 4824783)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2394 (class 2606 OID 4824962)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 4825162)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2348 (class 2606 OID 4824852)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2302 (class 2606 OID 4824701)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 4825222)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 4824906)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 4825030)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 4825098)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 4824935)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 4825206)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2447 (class 2606 OID 4825091)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2372 (class 1259 OID 4824928)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2455 (class 1259 OID 4825121)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2456 (class 1259 OID 4825122)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2330 (class 1259 OID 4824805)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2290 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2291 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2292 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2421 (class 1259 OID 4825023)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2415 (class 1259 OID 4825009)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2416 (class 1259 OID 4825008)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2367 (class 1259 OID 4824907)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2443 (class 1259 OID 4825081)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2444 (class 1259 OID 4825079)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2445 (class 1259 OID 4825080)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2355 (class 1259 OID 4824883)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2356 (class 1259 OID 4824882)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2472 (class 1259 OID 4825194)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2473 (class 1259 OID 4825195)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2474 (class 1259 OID 4825196)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2480 (class 1259 OID 4825226)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2481 (class 1259 OID 4825223)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2482 (class 1259 OID 4825225)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2483 (class 1259 OID 4825224)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2345 (class 1259 OID 4824854)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2346 (class 1259 OID 4824853)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2295 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2296 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2322 (class 1259 OID 4824777)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2431 (class 1259 OID 4825047)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2385 (class 1259 OID 4824941)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2312 (class 1259 OID 4824733)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2313 (class 1259 OID 4824734)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2436 (class 1259 OID 4825067)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2437 (class 1259 OID 4825066)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2438 (class 1259 OID 4825065)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2359 (class 1259 OID 4824889)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2360 (class 1259 OID 4824891)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2361 (class 1259 OID 4824890)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2499 (class 1259 OID 4825268)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2395 (class 1259 OID 4824975)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2396 (class 1259 OID 4824973)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2397 (class 1259 OID 4824972)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2398 (class 1259 OID 4824974)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2303 (class 1259 OID 4824707)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2304 (class 1259 OID 4824708)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2424 (class 1259 OID 4825031)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2410 (class 1259 OID 4824996)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2451 (class 1259 OID 4825108)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2452 (class 1259 OID 4825109)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2334 (class 1259 OID 4824819)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2335 (class 1259 OID 4824818)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2336 (class 1259 OID 4824820)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2459 (class 1259 OID 4825136)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2460 (class 1259 OID 4825137)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2492 (class 1259 OID 4825254)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2493 (class 1259 OID 4825253)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2494 (class 1259 OID 4825256)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2495 (class 1259 OID 4825252)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2496 (class 1259 OID 4825255)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2448 (class 1259 OID 4825099)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2401 (class 1259 OID 4824984)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2402 (class 1259 OID 4824983)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2403 (class 1259 OID 4824981)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2404 (class 1259 OID 4824982)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2286 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2488 (class 1259 OID 4825243)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2489 (class 1259 OID 4825242)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2366 (class 1259 OID 4824898)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2318 (class 1259 OID 4824754)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2319 (class 1259 OID 4824753)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2326 (class 1259 OID 4824784)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2327 (class 1259 OID 4824785)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2390 (class 1259 OID 4824965)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2391 (class 1259 OID 4824964)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2392 (class 1259 OID 4824963)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2373 (class 1259 OID 4824930)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2374 (class 1259 OID 4824926)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2375 (class 1259 OID 4824923)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2376 (class 1259 OID 4824924)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2377 (class 1259 OID 4824922)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2378 (class 1259 OID 4824927)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2379 (class 1259 OID 4824925)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2333 (class 1259 OID 4824804)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2351 (class 1259 OID 4824868)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2352 (class 1259 OID 4824870)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2353 (class 1259 OID 4824869)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2354 (class 1259 OID 4824871)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2409 (class 1259 OID 4824990)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2477 (class 1259 OID 4825193)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2325 (class 1259 OID 4824776)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2505 (class 1259 OID 4825276)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2344 (class 1259 OID 4824840)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2502 (class 1259 OID 4825267)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2429 (class 1259 OID 4825041)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2430 (class 1259 OID 4825040)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2289 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2341 (class 1259 OID 4824828)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2471 (class 1259 OID 4825180)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2311 (class 1259 OID 4824727)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2380 (class 1259 OID 4824929)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2531 (class 2606 OID 4825416)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2534 (class 2606 OID 4825401)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2533 (class 2606 OID 4825406)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2529 (class 2606 OID 4825426)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2535 (class 2606 OID 4825396)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2530 (class 2606 OID 4825421)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2532 (class 2606 OID 4825411)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2565 (class 2606 OID 4825571)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2564 (class 2606 OID 4825576)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2516 (class 2606 OID 4825331)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2552 (class 2606 OID 4825511)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2550 (class 2606 OID 4825506)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2551 (class 2606 OID 4825501)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2528 (class 2606 OID 4825391)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2558 (class 2606 OID 4825551)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2560 (class 2606 OID 4825541)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2559 (class 2606 OID 4825546)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2522 (class 2606 OID 4825366)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2523 (class 2606 OID 4825361)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2548 (class 2606 OID 4825491)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2571 (class 2606 OID 4825596)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2570 (class 2606 OID 4825601)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2569 (class 2606 OID 4825606)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2572 (class 2606 OID 4825626)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2575 (class 2606 OID 4825611)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2573 (class 2606 OID 4825621)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2574 (class 2606 OID 4825616)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2520 (class 2606 OID 4825356)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2521 (class 2606 OID 4825351)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2512 (class 2606 OID 4825316)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2513 (class 2606 OID 4825311)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2554 (class 2606 OID 4825521)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2536 (class 2606 OID 4825431)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2509 (class 2606 OID 4825291)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2508 (class 2606 OID 4825296)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2555 (class 2606 OID 4825536)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2556 (class 2606 OID 4825531)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2557 (class 2606 OID 4825526)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2526 (class 2606 OID 4825371)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2524 (class 2606 OID 4825381)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2525 (class 2606 OID 4825376)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2583 (class 2606 OID 4825666)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2540 (class 2606 OID 4825466)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2542 (class 2606 OID 4825456)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2543 (class 2606 OID 4825451)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2541 (class 2606 OID 4825461)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2507 (class 2606 OID 4825281)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2506 (class 2606 OID 4825286)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2553 (class 2606 OID 4825516)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2549 (class 2606 OID 4825496)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2563 (class 2606 OID 4825561)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2562 (class 2606 OID 4825566)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2518 (class 2606 OID 4825341)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2519 (class 2606 OID 4825336)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2517 (class 2606 OID 4825346)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2567 (class 2606 OID 4825581)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2566 (class 2606 OID 4825586)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2580 (class 2606 OID 4825651)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2581 (class 2606 OID 4825646)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2578 (class 2606 OID 4825661)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2582 (class 2606 OID 4825641)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2579 (class 2606 OID 4825656)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2561 (class 2606 OID 4825556)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2544 (class 2606 OID 4825486)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2545 (class 2606 OID 4825481)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2547 (class 2606 OID 4825471)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2546 (class 2606 OID 4825476)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2576 (class 2606 OID 4825636)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2577 (class 2606 OID 4825631)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2527 (class 2606 OID 4825386)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2568 (class 2606 OID 4825591)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2510 (class 2606 OID 4825306)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2511 (class 2606 OID 4825301)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2515 (class 2606 OID 4825321)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2514 (class 2606 OID 4825326)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2537 (class 2606 OID 4825446)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2538 (class 2606 OID 4825441)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2539 (class 2606 OID 4825436)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-25 10:19:40 CEST

--
-- PostgreSQL database dump complete
--

