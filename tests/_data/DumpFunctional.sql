--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-06-01 13:09:31 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 231 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2756 (class 0 OID 0)
-- Dependencies: 231
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 5633085)
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
-- TOC entry 227 (class 1259 OID 5633596)
-- Name: alternacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE alternacija (
    id uuid NOT NULL,
    funkcija_id uuid,
    sodelovanje_id uuid,
    oseba_id uuid,
    koprodukcija_id uuid,
    pogodba_id uuid,
    sifra character varying(255) NOT NULL,
    zaposlen boolean,
    zacetek date,
    konec date,
    opomba text,
    sort integer,
    privzeti boolean,
    aktivna boolean
);


--
-- TOC entry 226 (class 1259 OID 5633579)
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
-- TOC entry 219 (class 1259 OID 5633489)
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
-- TOC entry 194 (class 1259 OID 5633259)
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
-- TOC entry 197 (class 1259 OID 5633293)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 5633206)
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
-- TOC entry 213 (class 1259 OID 5633419)
-- Name: funkcija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE funkcija (
    id uuid NOT NULL,
    uprizoritev_id uuid NOT NULL,
    alternacija_id uuid,
    podrocje character varying(20) DEFAULT NULL::character varying,
    vodjaekipe boolean,
    naziv character varying(255) NOT NULL,
    komentar character varying(255) DEFAULT NULL::character varying,
    velikost character varying(255) DEFAULT NULL::character varying,
    pomembna boolean NOT NULL,
    sort integer,
    seplanira boolean NOT NULL,
    dovoliprekrivanje boolean NOT NULL,
    maxprekirvanj integer,
    tipfunkcije_id uuid
);


--
-- TOC entry 192 (class 1259 OID 5633243)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 196 (class 1259 OID 5633287)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 5633223)
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
-- TOC entry 202 (class 1259 OID 5633336)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 5633361)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 5633180)
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
-- TOC entry 181 (class 1259 OID 5633094)
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
-- TOC entry 182 (class 1259 OID 5633105)
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
    polnoime character varying(255) DEFAULT NULL::character varying,
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
-- TOC entry 177 (class 1259 OID 5633059)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 5633078)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 5633368)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 5633399)
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
-- TOC entry 223 (class 1259 OID 5633532)
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
-- TOC entry 184 (class 1259 OID 5633137)
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
-- TOC entry 186 (class 1259 OID 5633172)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 5633342)
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
-- TOC entry 185 (class 1259 OID 5633157)
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
-- TOC entry 191 (class 1259 OID 5633235)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 5633354)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 5633474)
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
-- TOC entry 222 (class 1259 OID 5633525)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 5633383)
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
-- TOC entry 201 (class 1259 OID 5633327)
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
-- TOC entry 200 (class 1259 OID 5633317)
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
-- TOC entry 221 (class 1259 OID 5633514)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 5633451)
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
-- TOC entry 174 (class 1259 OID 5633030)
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
-- TOC entry 173 (class 1259 OID 5633028)
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
-- TOC entry 210 (class 1259 OID 5633393)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 5633068)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 5633052)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 5633407)
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
-- TOC entry 204 (class 1259 OID 5633348)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 5633298)
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
-- TOC entry 230 (class 1259 OID 5633622)
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
-- TOC entry 229 (class 1259 OID 5633615)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 5633610)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 5633461)
-- Name: strosekuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE strosekuprizoritve (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    popa_id uuid,
    naziv character varying(255) DEFAULT NULL::character varying,
    vrednostdo numeric(15,2) DEFAULT NULL::numeric,
    vrednostna numeric(15,2) DEFAULT NULL::numeric,
    opis text,
    sort integer
);


--
-- TOC entry 183 (class 1259 OID 5633129)
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
-- TOC entry 199 (class 1259 OID 5633304)
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
-- TOC entry 220 (class 1259 OID 5633503)
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
-- TOC entry 188 (class 1259 OID 5633192)
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
-- TOC entry 175 (class 1259 OID 5633039)
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
-- TOC entry 225 (class 1259 OID 5633558)
-- Name: uprizoritev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE uprizoritev (
    id uuid NOT NULL,
    besedilo_id uuid,
    zvrst_uprizoritve_id uuid,
    zvrst_surs_id uuid,
    sifra character varying(255) NOT NULL,
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
-- TOC entry 193 (class 1259 OID 5633250)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 5633375)
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
-- TOC entry 215 (class 1259 OID 5633443)
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
-- TOC entry 195 (class 1259 OID 5633282)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 5633548)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 5633433)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2144 (class 2604 OID 5633033)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2699 (class 0 OID 5633085)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2746 (class 0 OID 5633596)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
000c0000-556c-3d6a-9429-7295f11a34d7	000d0000-556c-3d6a-5b14-fc9502aed506	\N	00090000-556c-3d6a-5a4c-48a779ea8028	\N	\N	0001	f	\N	\N	\N	\N	\N	\N
000c0000-556c-3d6a-2b07-2802d715a2fb	000d0000-556c-3d6a-fd7b-750a95852a1b	\N	00090000-556c-3d6a-c3ab-cdc1c1949c93	\N	\N	0002	f	\N	\N	\N	\N	\N	\N
000c0000-556c-3d6a-f495-7a539f392eca	000d0000-556c-3d6a-f766-dac7c2092fed	\N	00090000-556c-3d6a-53cf-4f72d9956d8f	\N	\N	0003	f	\N	\N	\N	\N	\N	\N
000c0000-556c-3d6a-7b23-facf625a07cf	000d0000-556c-3d6a-d854-051308c941b7	\N	00090000-556c-3d6a-e8b7-637a82ebefb2	\N	\N	0004	f	\N	\N	\N	\N	\N	\N
000c0000-556c-3d6a-86d5-54f186468a89	000d0000-556c-3d6a-cfba-50c7d171325d	\N	00090000-556c-3d6a-eed4-51dc3612e33f	\N	\N	0005	f	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2745 (class 0 OID 5633579)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2738 (class 0 OID 5633489)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-556c-3d6a-8d3c-a78e34ce6af2	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-556c-3d6a-8a68-d0690f3ffa6f	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-556c-3d6a-276c-42a3a28131a2	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 2713 (class 0 OID 5633259)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-556c-3d6a-b002-03ea4a66688e	\N	\N	00200000-556c-3d6a-b6ed-1166dd5cf6d7	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	4			
00180000-556c-3d6a-848b-811f3916a04b	\N	\N	00200000-556c-3d6a-188f-f997d703a546	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-556c-3d6a-1c16-6dc49d08819b	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
\.


--
-- TOC entry 2716 (class 0 OID 5633293)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2708 (class 0 OID 5633206)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-556c-3d69-730b-1152d65b1d8a	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-556c-3d69-608e-c93d61a9285f	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-556c-3d69-6408-04053c8beb21	AL	ALB	008	Albania 	Albanija	\N
00040000-556c-3d69-7703-324d17d98e07	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-556c-3d69-fdb3-6abffb8475a3	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-556c-3d69-6d6b-f0c3cab58163	AD	AND	020	Andorra 	Andora	\N
00040000-556c-3d69-4437-d55e2b42cd83	AO	AGO	024	Angola 	Angola	\N
00040000-556c-3d69-d74f-66fc27f43119	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-556c-3d69-7dba-5b2326b37117	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-556c-3d69-bdd4-d5569958ba1a	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-556c-3d69-b4db-5417e3072de5	AR	ARG	032	Argentina 	Argenitna	\N
00040000-556c-3d69-f679-fcf0397bbb42	AM	ARM	051	Armenia 	Armenija	\N
00040000-556c-3d69-d4ee-aad287287107	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-556c-3d69-9185-4e4b0502fd12	AU	AUS	036	Australia 	Avstralija	\N
00040000-556c-3d69-e8a5-f49da2956b4e	AT	AUT	040	Austria 	Avstrija	\N
00040000-556c-3d69-b8e2-a325857abfa5	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-556c-3d69-e061-f9516ccbb1be	BS	BHS	044	Bahamas 	Bahami	\N
00040000-556c-3d69-3c29-63b48d0a4a8a	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-556c-3d69-8ce3-557e3df7e6fa	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-556c-3d69-9dbf-db3e040a693c	BB	BRB	052	Barbados 	Barbados	\N
00040000-556c-3d69-14ca-b25ec344c166	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-556c-3d69-815c-f902414ee71b	BE	BEL	056	Belgium 	Belgija	\N
00040000-556c-3d69-086c-5a6751cbec6b	BZ	BLZ	084	Belize 	Belize	\N
00040000-556c-3d69-cfd8-efe724d0f6c2	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-556c-3d69-1cda-c639acc6655a	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-556c-3d69-dd4e-b211b10a4aad	BT	BTN	064	Bhutan 	Butan	\N
00040000-556c-3d69-f5e2-86f3c87fda50	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-556c-3d69-cefc-fa38e7f44449	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-556c-3d69-eb36-03ca11069489	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-556c-3d69-16b7-044f943bd993	BW	BWA	072	Botswana 	Bocvana	\N
00040000-556c-3d69-6bfe-5252cdf8e2d8	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-556c-3d69-79f7-b811fc483a04	BR	BRA	076	Brazil 	Brazilija	\N
00040000-556c-3d69-976a-c7ee3d8a1ae6	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-556c-3d69-a2b0-1f7c5b1aa99a	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-556c-3d69-e72e-abfeb6bf0571	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-556c-3d69-f8d6-9f178270b7a4	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-556c-3d69-aef4-6d895f11916d	BI	BDI	108	Burundi 	Burundi 	\N
00040000-556c-3d69-c19f-646b2cdae422	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-556c-3d69-5ebd-a905978f0588	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-556c-3d69-2451-38e86833b774	CA	CAN	124	Canada 	Kanada	\N
00040000-556c-3d69-c017-20f824fcd2e6	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-556c-3d69-b8ff-2450282384f9	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-556c-3d69-4d52-a4345240a77a	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-556c-3d69-c58b-fd77bfc9a7c8	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-556c-3d69-8a93-b328a50c6924	CL	CHL	152	Chile 	Čile	\N
00040000-556c-3d69-d894-a728ae12623a	CN	CHN	156	China 	Kitajska	\N
00040000-556c-3d69-3dcf-ca883c203c4b	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-556c-3d69-2018-277f6befd114	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-556c-3d69-f4be-8f6901c54169	CO	COL	170	Colombia 	Kolumbija	\N
00040000-556c-3d69-af6a-8a371ff5e177	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-556c-3d69-0595-b633f423dab1	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-556c-3d69-7ef7-4ebc2075f3ca	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-556c-3d69-a7cc-59ce7c6f5082	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-556c-3d69-bd9e-664666b42d0d	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-556c-3d69-9e7f-5e4c1e7d8cdd	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-556c-3d69-d275-86bb6daf5aba	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-556c-3d69-de58-a6968456a34f	CU	CUB	192	Cuba 	Kuba	\N
00040000-556c-3d69-18f9-695e26c0a381	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-556c-3d69-cc91-7e3d10f28990	CY	CYP	196	Cyprus 	Ciper	\N
00040000-556c-3d69-9b66-bd9dfd0746d7	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-556c-3d69-24fb-0cded84e7ea1	DK	DNK	208	Denmark 	Danska	\N
00040000-556c-3d69-2716-2f6ff062b6ff	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-556c-3d69-ea8a-65cf2216fba5	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-556c-3d69-206a-add88bffb4b2	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-556c-3d69-75a6-ff107086e9da	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-556c-3d69-0dea-23db0d425a7f	EG	EGY	818	Egypt 	Egipt	\N
00040000-556c-3d69-28b6-74af5fb17b23	SV	SLV	222	El Salvador 	Salvador	\N
00040000-556c-3d69-22da-f44f178cef8c	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-556c-3d69-4af2-78c83d108290	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-556c-3d69-1aaf-fe0045313e89	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-556c-3d69-c72b-ce2b6c1fe18c	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-556c-3d69-3256-30accf7ab557	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-556c-3d69-4fb1-3cc335d48604	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-556c-3d69-fb7b-19cc8c08d86f	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-556c-3d69-29da-b127be33707e	FI	FIN	246	Finland 	Finska	\N
00040000-556c-3d69-ee42-c39430bc2fd7	FR	FRA	250	France 	Francija	\N
00040000-556c-3d69-48b6-96e52c3f8062	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-556c-3d69-ba64-8659675a05b6	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-556c-3d69-e9a8-a0f4e1308bff	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-556c-3d69-8e21-cddcece652a7	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-556c-3d69-361e-410620ff1737	GA	GAB	266	Gabon 	Gabon	\N
00040000-556c-3d69-7a91-5819825f5c48	GM	GMB	270	Gambia 	Gambija	\N
00040000-556c-3d69-c4a8-eb35e43d7029	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-556c-3d69-eaa8-30741c1df1c0	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-556c-3d69-b599-d49142a5f181	GH	GHA	288	Ghana 	Gana	\N
00040000-556c-3d69-c4fc-116bd4aed04a	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-556c-3d69-3f0a-0c849865d15f	GR	GRC	300	Greece 	Grčija	\N
00040000-556c-3d69-b066-bd94091c87ea	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-556c-3d69-b299-01d559d89358	GD	GRD	308	Grenada 	Grenada	\N
00040000-556c-3d69-aabb-7f98d402861f	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-556c-3d69-a971-2d0431b2802d	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-556c-3d69-752c-53af3c1569b6	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-556c-3d69-be96-a6c6f5ad4f7c	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-556c-3d69-899f-9404a99268ea	GN	GIN	324	Guinea 	Gvineja	\N
00040000-556c-3d69-21b4-d4702bb43c64	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-556c-3d69-9031-7ade9fddb7c1	GY	GUY	328	Guyana 	Gvajana	\N
00040000-556c-3d69-13e2-0fd39ef2d511	HT	HTI	332	Haiti 	Haiti	\N
00040000-556c-3d69-60f0-5f0c5a0c0b5a	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-556c-3d69-f449-d1301cb69a92	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-556c-3d69-2da7-7f2d8a890194	HN	HND	340	Honduras 	Honduras	\N
00040000-556c-3d69-13b5-7795b842d5be	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-556c-3d69-1bdb-2030ef061650	HU	HUN	348	Hungary 	Madžarska	\N
00040000-556c-3d69-f8b0-0112abb73ad9	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-556c-3d69-c793-9bf0115241c6	IN	IND	356	India 	Indija	\N
00040000-556c-3d69-0989-5f6b4ce9c579	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-556c-3d69-3acf-f5227e817518	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-556c-3d69-d602-4b7674fa6c35	IQ	IRQ	368	Iraq 	Irak	\N
00040000-556c-3d69-4d81-0ddd3c1f1bed	IE	IRL	372	Ireland 	Irska	\N
00040000-556c-3d69-744e-af217c4b5e34	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-556c-3d69-e385-4a40095bb987	IL	ISR	376	Israel 	Izrael	\N
00040000-556c-3d69-220b-821c37c67564	IT	ITA	380	Italy 	Italija	\N
00040000-556c-3d69-dfed-b123e8d7f8fd	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-556c-3d69-59fa-f7f3714e18b6	JP	JPN	392	Japan 	Japonska	\N
00040000-556c-3d69-f987-cb6a05cea156	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-556c-3d69-f303-ff03313f5842	JO	JOR	400	Jordan 	Jordanija	\N
00040000-556c-3d69-32e0-465ea0931c6f	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-556c-3d69-bcaa-e12bace6dc9b	KE	KEN	404	Kenya 	Kenija	\N
00040000-556c-3d69-afa1-ca1fed05fcfe	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-556c-3d69-7bbb-0817eeb1964d	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-556c-3d69-ba22-3d6dc1fccc32	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-556c-3d69-8e44-223baec59e54	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-556c-3d69-03e7-6cdb17b41d65	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-556c-3d69-d5de-5be0a8de00f9	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-556c-3d69-a59b-2a3d05871a8a	LV	LVA	428	Latvia 	Latvija	\N
00040000-556c-3d69-ec56-5147fcb9913e	LB	LBN	422	Lebanon 	Libanon	\N
00040000-556c-3d69-a084-2645a139b839	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-556c-3d69-fe68-262bc00fc49d	LR	LBR	430	Liberia 	Liberija	\N
00040000-556c-3d69-265c-a4d586e3fff7	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-556c-3d69-d499-fabc75415766	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-556c-3d69-e750-9550844e24a7	LT	LTU	440	Lithuania 	Litva	\N
00040000-556c-3d69-00d6-c234380f0053	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-556c-3d69-9522-fee9e2680b22	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-556c-3d69-e2ff-8f4e8bf718ef	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-556c-3d69-f19c-bc147ab93c42	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-556c-3d69-7f6f-a730df5ddc39	MW	MWI	454	Malawi 	Malavi	\N
00040000-556c-3d69-cae2-3a604a94304c	MY	MYS	458	Malaysia 	Malezija	\N
00040000-556c-3d69-1191-be8c5d8e67c3	MV	MDV	462	Maldives 	Maldivi	\N
00040000-556c-3d69-9a03-7c140948425f	ML	MLI	466	Mali 	Mali	\N
00040000-556c-3d69-783c-97ce62b36dfe	MT	MLT	470	Malta 	Malta	\N
00040000-556c-3d69-8935-8448cdbcef75	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-556c-3d69-f8c6-7967fef0e389	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-556c-3d69-c6a5-d681a8e1b350	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-556c-3d69-38c8-38691fe698f3	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-556c-3d69-1727-a6d8a9a72523	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-556c-3d69-1075-4d4e896cc755	MX	MEX	484	Mexico 	Mehika	\N
00040000-556c-3d69-6ccd-227d44fa74ff	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-556c-3d69-c601-4d4c814e02b9	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-556c-3d69-2f6c-ede06aff3bf7	MC	MCO	492	Monaco 	Monako	\N
00040000-556c-3d69-3b31-674b1441cebe	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-556c-3d69-b907-0e633754072a	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-556c-3d69-34eb-be2d4c2b1524	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-556c-3d69-5628-237d367f0b4e	MA	MAR	504	Morocco 	Maroko	\N
00040000-556c-3d69-3dde-ec72ff477f80	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-556c-3d69-0b83-cb7b27fcd6d8	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-556c-3d69-1fc0-09ada5e3fa29	NA	NAM	516	Namibia 	Namibija	\N
00040000-556c-3d69-4577-b0ddc69c4f63	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-556c-3d69-62ab-19d8fcdd27ce	NP	NPL	524	Nepal 	Nepal	\N
00040000-556c-3d69-c232-d262be2baab2	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-556c-3d69-fcc8-921716d28006	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-556c-3d69-714f-1ad902307f7a	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-556c-3d69-0ef8-774f32de5009	NE	NER	562	Niger 	Niger 	\N
00040000-556c-3d69-a894-bb4a2bdce015	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-556c-3d69-9181-f2a0beb7a5eb	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-556c-3d69-3e63-32260759d817	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-556c-3d69-ec6a-37ba97aed272	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-556c-3d69-1c68-864da4506138	NO	NOR	578	Norway 	Norveška	\N
00040000-556c-3d69-e13a-fb69b4603cce	OM	OMN	512	Oman 	Oman	\N
00040000-556c-3d69-e1c2-2c405ed31e2b	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-556c-3d69-9223-1aa23adcadcd	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-556c-3d69-beb2-800fe8031aeb	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-556c-3d69-5216-04459b96499d	PA	PAN	591	Panama 	Panama	\N
00040000-556c-3d69-3e22-131d356ab4c7	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-556c-3d69-ebbe-dd674954d9ea	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-556c-3d69-6fe6-86e62ea36bf3	PE	PER	604	Peru 	Peru	\N
00040000-556c-3d69-20b7-ba87c46b7ef9	PH	PHL	608	Philippines 	Filipini	\N
00040000-556c-3d69-7df3-5622b7139fcc	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-556c-3d69-75b8-6abc319e2dd7	PL	POL	616	Poland 	Poljska	\N
00040000-556c-3d69-194f-1e651de9c678	PT	PRT	620	Portugal 	Portugalska	\N
00040000-556c-3d69-3120-ff3696247527	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-556c-3d69-dd2e-e002025849e7	QA	QAT	634	Qatar 	Katar	\N
00040000-556c-3d69-2658-8598b07e5b70	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-556c-3d69-49aa-d1dc5116f567	RO	ROU	642	Romania 	Romunija	\N
00040000-556c-3d69-8a2d-0a04b36dd564	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-556c-3d69-908a-1fed08b5ccb7	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-556c-3d69-82b9-b0a6e3deaa48	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-556c-3d69-5a66-19c5afe6037c	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-556c-3d69-9579-8b396ec82f95	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-556c-3d69-e64e-03d4a1702c30	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-556c-3d69-4b87-eca26fb5ad4c	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-556c-3d69-9e02-b030a20e15ec	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-556c-3d69-f730-94fdfba0d664	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-556c-3d69-56ff-00c9c70bf134	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-556c-3d69-70ac-937506b13fa6	SM	SMR	674	San Marino 	San Marino	\N
00040000-556c-3d69-238a-7084fded8e4d	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-556c-3d69-7343-c455a2753f42	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-556c-3d69-9f2e-517afe21fd29	SN	SEN	686	Senegal 	Senegal	\N
00040000-556c-3d69-7f1d-24c575748d4c	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-556c-3d69-72d0-a4f6f3b69aff	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-556c-3d69-d529-1f99fe43f5db	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-556c-3d69-46a3-50313bbd403c	SG	SGP	702	Singapore 	Singapur	\N
00040000-556c-3d69-296d-1f2c6b94a6a6	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-556c-3d69-4196-e73decdbf45f	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-556c-3d69-caeb-ebeb5e3b3961	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-556c-3d69-f539-bc168052b61f	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-556c-3d69-22bd-592b5617bc74	SO	SOM	706	Somalia 	Somalija	\N
00040000-556c-3d69-9e0d-282942476c04	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-556c-3d69-6493-171da48f3023	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-556c-3d69-a70f-65de8a69d3df	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-556c-3d69-ae35-6d013af99a5c	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-556c-3d69-0f67-db30febe9f56	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-556c-3d69-fa67-5faba291e396	SD	SDN	729	Sudan 	Sudan	\N
00040000-556c-3d69-0a60-c389a53ab897	SR	SUR	740	Suriname 	Surinam	\N
00040000-556c-3d69-d460-b79f277b5be0	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-556c-3d69-c307-554d9001a75b	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-556c-3d69-f3ec-cb520f8ce6fb	SE	SWE	752	Sweden 	Švedska	\N
00040000-556c-3d69-2192-4b7ef8b41a9e	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-556c-3d69-53fb-80a1f87378f0	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-556c-3d69-e224-384344261bc3	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-556c-3d69-029d-dfc562c7f85a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-556c-3d69-30ea-2b2b81e9b6cb	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-556c-3d69-f5fc-2975a0404478	TH	THA	764	Thailand 	Tajska	\N
00040000-556c-3d69-dd74-aacdb57de18b	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-556c-3d69-01ac-2496b9bf48d5	TG	TGO	768	Togo 	Togo	\N
00040000-556c-3d69-e7a1-1939f243e1ab	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-556c-3d69-afad-fcfc1ae526ad	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-556c-3d69-19bb-a2a4f5bcb00e	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-556c-3d69-fad3-74b8a84c0811	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-556c-3d69-9261-567783832033	TR	TUR	792	Turkey 	Turčija	\N
00040000-556c-3d69-ef31-8134f54ec60d	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-556c-3d69-8ce0-191e30a8d280	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-556c-3d69-a7c3-bec856ee06ab	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-556c-3d69-be7d-df103fdbbf34	UG	UGA	800	Uganda 	Uganda	\N
00040000-556c-3d69-0ab0-4dd375c6ffef	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-556c-3d69-5d34-bbd809aeab4a	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-556c-3d69-b030-5b73de5f66be	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-556c-3d69-d2b4-6dad66676b81	US	USA	840	United States 	Združene države Amerike	\N
00040000-556c-3d69-93c5-9318e081a79d	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-556c-3d69-f43b-a11f8e8b4319	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-556c-3d69-3234-56878325c926	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-556c-3d69-806d-32ba4d274c5e	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-556c-3d69-e53b-005299e00d08	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-556c-3d69-0243-9b2f04a81dbb	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-556c-3d69-3f7c-6e26dc0ce636	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-556c-3d69-f2ee-2f21e0226968	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-556c-3d69-2d98-0f9e463dbc56	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-556c-3d69-92c1-92264cabede0	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-556c-3d69-178d-19798389db1f	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-556c-3d69-77e0-895bdefda2a9	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-556c-3d69-4b2a-5de7c1e487db	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2732 (class 0 OID 5633419)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj, tipfunkcije_id) FROM stdin;
000d0000-556c-3d6a-1790-014c8f908bfb	000e0000-556c-3d6a-69f3-751e49c79e0d	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-556c-3d69-3e8c-b0a44b41bd02
000d0000-556c-3d6a-5b14-fc9502aed506	000e0000-556c-3d6a-69f3-751e49c79e0d	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-556c-3d69-3e8c-b0a44b41bd02
000d0000-556c-3d6a-fd7b-750a95852a1b	000e0000-556c-3d6a-69f3-751e49c79e0d	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-556c-3d69-d78e-8fb7b596f9c0
000d0000-556c-3d6a-f766-dac7c2092fed	000e0000-556c-3d6a-69f3-751e49c79e0d	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-556c-3d69-4c55-cc5d303888dc
000d0000-556c-3d6a-d854-051308c941b7	000e0000-556c-3d6a-69f3-751e49c79e0d	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-556c-3d69-4c55-cc5d303888dc
000d0000-556c-3d6a-cfba-50c7d171325d	000e0000-556c-3d6a-69f3-751e49c79e0d	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-556c-3d69-4c55-cc5d303888dc
\.


--
-- TOC entry 2711 (class 0 OID 5633243)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2715 (class 0 OID 5633287)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2709 (class 0 OID 5633223)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
\.


--
-- TOC entry 2689 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2721 (class 0 OID 5633336)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2725 (class 0 OID 5633361)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2706 (class 0 OID 5633180)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-556c-3d69-6037-496938367ace	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-556c-3d69-7a2d-9502b0a4d168	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-556c-3d69-8e23-bdb1e30b842d	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-556c-3d69-8260-857bd3ad39ef	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-556c-3d69-8c03-4d86d6226e3b	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-556c-3d69-de0d-118024c35dfc	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-556c-3d69-65e4-750b14e7f4e6	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-556c-3d69-7b7c-030a1a543287	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-556c-3d69-4e51-fccaffb29776	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-556c-3d69-7717-1a11546b9120	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-556c-3d69-2ba2-355cf9aec4a5	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-556c-3d69-9360-e3453dc04cc8	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-556c-3d69-3fb0-4d31934a6f14	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-556c-3d69-e1a7-2168ef6eccb4	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-556c-3d69-ffb2-992306a812a3	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2700 (class 0 OID 5633094)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-556c-3d69-3198-abcdb713b684	00000000-556c-3d69-8c03-4d86d6226e3b	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-556c-3d69-2046-715aea661204	00000000-556c-3d69-8c03-4d86d6226e3b	00010000-556c-3d69-eb00-7c80a750022b	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-556c-3d69-78f6-90d3ffda540f	00000000-556c-3d69-de0d-118024c35dfc	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2701 (class 0 OID 5633105)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-556c-3d6a-1331-15257444c30c	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-556c-3d6a-e8b7-637a82ebefb2	00010000-556c-3d6a-3533-a7e8e2004a1e	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-556c-3d6a-53cf-4f72d9956d8f	00010000-556c-3d6a-b3e0-12bdd464b965	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-556c-3d6a-2fae-dff223ae41b8	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-556c-3d6a-21e5-fda5ad339332	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-556c-3d6a-b5c1-a6215602dcfb	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-556c-3d6a-e448-40f637e59fee	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-556c-3d6a-adf0-2d6e6340c9fb	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-556c-3d6a-5a4c-48a779ea8028	00010000-556c-3d6a-0d1d-5511d9a120b5	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-556c-3d6a-c3ab-cdc1c1949c93	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-556c-3d6a-54af-e56f73623964	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-556c-3d6a-eed4-51dc3612e33f	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-556c-3d6a-fe1c-0ca32c64139b	00010000-556c-3d6a-a2f5-efccb5b57023	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2691 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2696 (class 0 OID 5633059)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-556c-3d69-e909-5b0c7f5b88cf	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-556c-3d69-e3dc-160b1c99cf93	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-556c-3d69-953b-a31196ac5a55	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-556c-3d69-fb5b-ab8e07255df9	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-556c-3d69-c12d-4a1e273f698b	Abonma-read	Abonma - branje	f
00030000-556c-3d69-9f44-f79031b1dbef	Abonma-write	Abonma - spreminjanje	f
00030000-556c-3d69-c59b-1d6861421180	Alternacija-read	Alternacija - branje	f
00030000-556c-3d69-b010-0f041ff26529	Alternacija-write	Alternacija - spreminjanje	f
00030000-556c-3d69-239e-e34deef15c65	Arhivalija-read	Arhivalija - branje	f
00030000-556c-3d69-3058-4eec3bc04eee	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-556c-3d69-cd42-d5d5df5db8ec	Besedilo-read	Besedilo - branje	f
00030000-556c-3d69-d964-e7b46e8f391b	Besedilo-write	Besedilo - spreminjanje	f
00030000-556c-3d69-f453-a91aaa417482	DogodekIzven-read	DogodekIzven - branje	f
00030000-556c-3d69-0b61-275780af3f75	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-556c-3d69-89c9-0862036973b6	Dogodek-read	Dogodek - branje	f
00030000-556c-3d69-4a37-66f976f2f21c	Dogodek-write	Dogodek - spreminjanje	f
00030000-556c-3d69-a69b-b379eef6ed59	Drzava-read	Drzava - branje	f
00030000-556c-3d69-0f96-4ac1dd4992a7	Drzava-write	Drzava - spreminjanje	f
00030000-556c-3d69-d646-0716a6a0f7d2	Funkcija-read	Funkcija - branje	f
00030000-556c-3d69-2708-5db28a833c78	Funkcija-write	Funkcija - spreminjanje	f
00030000-556c-3d69-0474-c7408ba88e6a	Gostovanje-read	Gostovanje - branje	f
00030000-556c-3d69-f3c4-998c0bfe9c87	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-556c-3d69-1e18-76885365d879	Gostujoca-read	Gostujoca - branje	f
00030000-556c-3d69-bf1a-7bd2565a67f5	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-556c-3d69-83d1-4f5a2ec8082a	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-556c-3d69-6437-552ae131a19c	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-556c-3d69-082b-f4359214af6e	Kupec-read	Kupec - branje	f
00030000-556c-3d69-57c3-df86d1afe45d	Kupec-write	Kupec - spreminjanje	f
00030000-556c-3d69-88a6-a8483538c7e0	NacinPlacina-read	NacinPlacina - branje	f
00030000-556c-3d69-9967-2af7539a2dd0	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-556c-3d69-e6ad-bf776780e60c	Option-read	Option - branje	f
00030000-556c-3d69-d160-127cf215cd56	Option-write	Option - spreminjanje	f
00030000-556c-3d69-02d1-a98b5571f518	OptionValue-read	OptionValue - branje	f
00030000-556c-3d69-7365-20da9e2d4d23	OptionValue-write	OptionValue - spreminjanje	f
00030000-556c-3d69-facc-a5016ffcfc7c	Oseba-read	Oseba - branje	f
00030000-556c-3d69-80a6-43006576ae3c	Oseba-write	Oseba - spreminjanje	f
00030000-556c-3d69-a6b8-7c97e6c5892b	Permission-read	Permission - branje	f
00030000-556c-3d69-0a10-a07292c614a2	Permission-write	Permission - spreminjanje	f
00030000-556c-3d69-ce38-3e85d47abd02	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-556c-3d69-a3f1-c725d1dcb003	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-556c-3d69-cfbb-84e17d1adc27	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-556c-3d69-5691-5eef5fa0c337	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-556c-3d69-a663-bf8f86693c61	Pogodba-read	Pogodba - branje	f
00030000-556c-3d69-6860-4e2ba99103b7	Pogodba-write	Pogodba - spreminjanje	f
00030000-556c-3d69-b629-23dee899055a	Popa-read	Popa - branje	f
00030000-556c-3d69-c8ed-8edf69481753	Popa-write	Popa - spreminjanje	f
00030000-556c-3d69-9aff-667877392e9c	Posta-read	Posta - branje	f
00030000-556c-3d69-2b64-0eb0a73a6c03	Posta-write	Posta - spreminjanje	f
00030000-556c-3d69-3529-c94843d04c7d	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-556c-3d69-b068-070f27c898a3	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-556c-3d69-b19f-3ba99e639ff4	PostniNaslov-read	PostniNaslov - branje	f
00030000-556c-3d69-fdc1-2af933e80597	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-556c-3d69-ff36-85a470bb5c79	Predstava-read	Predstava - branje	f
00030000-556c-3d69-d4e4-c0a42fdf527b	Predstava-write	Predstava - spreminjanje	f
00030000-556c-3d69-7ce1-3ef09ea64f04	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-556c-3d69-e148-c291e7507bec	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-556c-3d69-93a9-d5bd06465bcc	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-556c-3d69-f90b-a6747ae6a185	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-556c-3d69-b790-393b67531edc	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-556c-3d69-6fef-db72e5907dfd	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-556c-3d69-3d58-32d00077cb1a	Prostor-read	Prostor - branje	f
00030000-556c-3d69-5c55-2d067221fe85	Prostor-write	Prostor - spreminjanje	f
00030000-556c-3d69-bf84-7b04209c238e	Racun-read	Racun - branje	f
00030000-556c-3d69-263c-2e82986b2dc6	Racun-write	Racun - spreminjanje	f
00030000-556c-3d69-31fa-d9f5e5c57cad	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-556c-3d69-d3b8-d41a591ffbf7	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-556c-3d69-8444-c27f8762ac18	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-556c-3d69-83de-7569785b513f	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-556c-3d69-f82b-ff68e6db0011	Rekvizit-read	Rekvizit - branje	f
00030000-556c-3d69-5e5b-a3812071bb10	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-556c-3d69-03f4-2e7c4e3a5517	Revizija-read	Revizija - branje	f
00030000-556c-3d69-91d4-6ce0619352be	Revizija-write	Revizija - spreminjanje	f
00030000-556c-3d69-c0bc-6383f4719b2d	Rezervacija-read	Rezervacija - branje	f
00030000-556c-3d69-f5f2-488ab917867f	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-556c-3d69-b888-323a503d4b3b	Role-read	Role - branje	f
00030000-556c-3d69-3f6d-95e72ea1ebb4	Role-write	Role - spreminjanje	f
00030000-556c-3d69-6ca8-8c28faec7ed7	SedezniRed-read	SedezniRed - branje	f
00030000-556c-3d69-395f-410370d5941d	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-556c-3d69-adf2-99fcac2f40d7	Sedez-read	Sedez - branje	f
00030000-556c-3d69-bfd8-d244bf56a9c6	Sedez-write	Sedez - spreminjanje	f
00030000-556c-3d69-6c13-38d02ce8f2e2	Sezona-read	Sezona - branje	f
00030000-556c-3d69-ca26-db6866a3d0b7	Sezona-write	Sezona - spreminjanje	f
00030000-556c-3d69-a52f-7e59aca14e10	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-556c-3d69-e460-981cdf957cf3	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-556c-3d69-d6c6-7595696dff56	Stevilcenje-read	Stevilcenje - branje	f
00030000-556c-3d69-29b6-29bb9eb4bf52	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-556c-3d69-f3af-5e878ff84fee	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-556c-3d69-14fa-0a0e74658672	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-556c-3d69-d27e-156c31275642	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-556c-3d69-d5b1-f626d10ffa6d	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-556c-3d69-43e3-02a401b988ad	Telefonska-read	Telefonska - branje	f
00030000-556c-3d69-ed4c-c83a69f6d5d8	Telefonska-write	Telefonska - spreminjanje	f
00030000-556c-3d69-e767-b61334fd96df	TerminStoritve-read	TerminStoritve - branje	f
00030000-556c-3d69-083a-077467e42ce7	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-556c-3d69-31b1-903fb0c83aca	TipFunkcije-read	TipFunkcije - branje	f
00030000-556c-3d69-9fe4-4a378ece7873	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-556c-3d69-b6e5-5b4a20bf88a2	Trr-read	Trr - branje	f
00030000-556c-3d69-c35a-b0721e27df5a	Trr-write	Trr - spreminjanje	f
00030000-556c-3d69-747a-11c4c2e1ff8d	Uprizoritev-read	Uprizoritev - branje	f
00030000-556c-3d69-ad51-4fe6f03c5e3f	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-556c-3d69-f3f0-fa9cc38c2a9b	User-read	User - branje	f
00030000-556c-3d69-f975-713306ebedb3	User-write	User - spreminjanje	f
00030000-556c-3d69-4584-bf51ffee1fae	Vaja-read	Vaja - branje	f
00030000-556c-3d69-e849-6eeacda66ddc	Vaja-write	Vaja - spreminjanje	f
00030000-556c-3d69-ec59-654aa734fd7e	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-556c-3d69-b692-69f33999b28d	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-556c-3d69-93de-5ac93dbb3505	Zaposlitev-read	Zaposlitev - branje	f
00030000-556c-3d69-dad6-9ab5e8bb218e	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-556c-3d69-0052-39d3fa60bf5a	Zasedenost-read	Zasedenost - branje	f
00030000-556c-3d69-badb-d6fcbe046c08	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-556c-3d69-738d-28e8b4970c98	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-556c-3d69-c95a-a898f37d88f7	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-556c-3d69-6e7c-1d284f2b99d9	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-556c-3d69-0f6b-1b8af4cd279b	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2698 (class 0 OID 5633078)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-556c-3d69-b61d-ff0d1af8b19b	00030000-556c-3d69-a69b-b379eef6ed59
00020000-556c-3d69-c032-2d50f7bced11	00030000-556c-3d69-0f96-4ac1dd4992a7
00020000-556c-3d69-c032-2d50f7bced11	00030000-556c-3d69-a69b-b379eef6ed59
\.


--
-- TOC entry 2726 (class 0 OID 5633368)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2730 (class 0 OID 5633399)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2742 (class 0 OID 5633532)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2703 (class 0 OID 5633137)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-556c-3d6a-b6b0-f4c742071785	00040000-556c-3d69-730b-1152d65b1d8a	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-556c-3d6a-2956-dd0b6cdbab4c	00040000-556c-3d69-730b-1152d65b1d8a	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2705 (class 0 OID 5633172)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-556c-3d68-8135-77b6d44250d8	8341	Adlešiči
00050000-556c-3d68-0e12-522750dbba34	5270	Ajdovščina
00050000-556c-3d68-e633-06bb10478354	6280	Ankaran/Ancarano
00050000-556c-3d68-0f4a-9026b2bd6266	9253	Apače
00050000-556c-3d68-ee7a-bee2143aaa93	8253	Artiče
00050000-556c-3d68-2774-59c70945a77c	4275	Begunje na Gorenjskem
00050000-556c-3d68-6b31-166fb9fae173	1382	Begunje pri Cerknici
00050000-556c-3d68-175a-e28981826129	9231	Beltinci
00050000-556c-3d68-6ab2-da0a80c84bf2	2234	Benedikt
00050000-556c-3d68-3d12-500afdebb1c0	2345	Bistrica ob Dravi
00050000-556c-3d68-8690-d012b0f487c7	3256	Bistrica ob Sotli
00050000-556c-3d68-8f5d-3d211e1e6c1b	8259	Bizeljsko
00050000-556c-3d68-886b-24c04053559b	1223	Blagovica
00050000-556c-3d68-23e2-0584f8c10888	8283	Blanca
00050000-556c-3d68-57b3-067d092cd712	4260	Bled
00050000-556c-3d68-81eb-690394bc12d2	4273	Blejska Dobrava
00050000-556c-3d68-a47e-b271d8d2e1ee	9265	Bodonci
00050000-556c-3d68-c223-a82affe6c9bf	9222	Bogojina
00050000-556c-3d68-b2d7-dca6bdf30363	4263	Bohinjska Bela
00050000-556c-3d68-770f-794a5861cc14	4264	Bohinjska Bistrica
00050000-556c-3d68-b400-31f9bd2ee0f9	4265	Bohinjsko jezero
00050000-556c-3d68-0a12-3da8ef000cd1	1353	Borovnica
00050000-556c-3d68-c4ae-b31440f1e0ff	8294	Boštanj
00050000-556c-3d68-8fa9-6f3f5f38949c	5230	Bovec
00050000-556c-3d68-cec3-245e7b69a072	5295	Branik
00050000-556c-3d68-f780-5b16baf4eff2	3314	Braslovče
00050000-556c-3d68-53e0-ac216cd406af	5223	Breginj
00050000-556c-3d68-d1b4-34d84b4322bd	8280	Brestanica
00050000-556c-3d68-8b7f-b1a7bb4b88b4	2354	Bresternica
00050000-556c-3d68-d44f-b01f37afcae1	4243	Brezje
00050000-556c-3d68-0237-251124b51c5b	1351	Brezovica pri Ljubljani
00050000-556c-3d68-8a78-a19d0b62ead1	8250	Brežice
00050000-556c-3d68-6763-6b1044c8dc31	4210	Brnik - Aerodrom
00050000-556c-3d68-45cc-78e52f5de770	8321	Brusnice
00050000-556c-3d68-fb90-1b1df117287d	3255	Buče
00050000-556c-3d68-79c1-17f89b5e5eaa	8276	Bučka 
00050000-556c-3d68-8526-9f5666680ad2	9261	Cankova
00050000-556c-3d68-8498-d4ee492fe296	3000	Celje 
00050000-556c-3d68-52ef-056ad41f4a6f	3001	Celje - poštni predali
00050000-556c-3d68-5f00-c8a99e85bb9b	4207	Cerklje na Gorenjskem
00050000-556c-3d68-cd9d-39ba2350d2f8	8263	Cerklje ob Krki
00050000-556c-3d68-4c3c-8148ff866a0a	1380	Cerknica
00050000-556c-3d68-4cf2-6a219db6ca20	5282	Cerkno
00050000-556c-3d68-8736-345bb8305c13	2236	Cerkvenjak
00050000-556c-3d68-504a-07e47e32f748	2215	Ceršak
00050000-556c-3d68-324b-0ef0bc84e843	2326	Cirkovce
00050000-556c-3d68-0988-14beab6bf085	2282	Cirkulane
00050000-556c-3d68-eb22-271c92d8a2c9	5273	Col
00050000-556c-3d68-1591-273a87273e37	8251	Čatež ob Savi
00050000-556c-3d68-0f49-62a22f37f9f6	1413	Čemšenik
00050000-556c-3d68-1389-a8154948b84e	5253	Čepovan
00050000-556c-3d68-e004-77f329833a6e	9232	Črenšovci
00050000-556c-3d68-c16b-ac40f3f24bb3	2393	Črna na Koroškem
00050000-556c-3d68-4406-3bc89383eaa2	6275	Črni Kal
00050000-556c-3d68-d456-63bdbcc64660	5274	Črni Vrh nad Idrijo
00050000-556c-3d68-631e-40670840e353	5262	Črniče
00050000-556c-3d68-34e2-661885675b41	8340	Črnomelj
00050000-556c-3d68-48aa-80c179c68d4f	6271	Dekani
00050000-556c-3d68-69b4-2eb2358aef7c	5210	Deskle
00050000-556c-3d68-f3af-23bbae859b2b	2253	Destrnik
00050000-556c-3d68-3324-0549379e6588	6215	Divača
00050000-556c-3d68-04fa-ae07b3665e83	1233	Dob
00050000-556c-3d68-4f50-19cd6ca1d4ee	3224	Dobje pri Planini
00050000-556c-3d68-bb78-157bd6db1248	8257	Dobova
00050000-556c-3d68-30a0-9f560106c264	1423	Dobovec
00050000-556c-3d68-bccb-469510271332	5263	Dobravlje
00050000-556c-3d68-3a0f-d17b344807f0	3204	Dobrna
00050000-556c-3d68-04b3-5b9c27cf6569	8211	Dobrnič
00050000-556c-3d68-99d5-db23f2090387	1356	Dobrova
00050000-556c-3d68-f2db-9061458f7da0	9223	Dobrovnik/Dobronak 
00050000-556c-3d68-8bf0-6f489a93919d	5212	Dobrovo v Brdih
00050000-556c-3d68-e1f2-a883bfa17d73	1431	Dol pri Hrastniku
00050000-556c-3d68-2a68-7a1f24388bff	1262	Dol pri Ljubljani
00050000-556c-3d68-9c9b-2f867f7734a8	1273	Dole pri Litiji
00050000-556c-3d68-1162-2b4986f4150b	1331	Dolenja vas
00050000-556c-3d68-fbea-57301ad4c58b	8350	Dolenjske Toplice
00050000-556c-3d68-e40e-09afb2524698	1230	Domžale
00050000-556c-3d68-de1d-1aaabd4e9639	2252	Dornava
00050000-556c-3d68-b083-f1787cf93cfe	5294	Dornberk
00050000-556c-3d68-0948-bba19aed5452	1319	Draga
00050000-556c-3d68-c654-3eb5c4a49ce3	8343	Dragatuš
00050000-556c-3d68-06af-bee47fb0c0f5	3222	Dramlje
00050000-556c-3d68-cf84-100857c3e3a2	2370	Dravograd
00050000-556c-3d68-d667-392b2d4d023a	4203	Duplje
00050000-556c-3d68-7cb8-fe11ae170eb7	6221	Dutovlje
00050000-556c-3d68-456a-806b7ac25e71	8361	Dvor
00050000-556c-3d68-705d-5a27f0b63c43	2343	Fala
00050000-556c-3d68-4903-3a371615c417	9208	Fokovci
00050000-556c-3d68-62f5-6633fcd771ef	2313	Fram
00050000-556c-3d68-4b18-6341a1d6d491	3213	Frankolovo
00050000-556c-3d68-8cec-2cecd19fd0ff	1274	Gabrovka
00050000-556c-3d68-2537-df747dedb1b0	8254	Globoko
00050000-556c-3d68-bc2b-a46c8fe1629f	5275	Godovič
00050000-556c-3d68-6b5c-60ad233e4b69	4204	Golnik
00050000-556c-3d68-055d-b85042ee434b	3303	Gomilsko
00050000-556c-3d68-981e-897c3c29e455	4224	Gorenja vas
00050000-556c-3d68-6b8c-d079211ff005	3263	Gorica pri Slivnici
00050000-556c-3d68-62a2-c153d211bfe4	2272	Gorišnica
00050000-556c-3d68-b49f-fecc9d21025b	9250	Gornja Radgona
00050000-556c-3d68-a2d9-3551b341c819	3342	Gornji Grad
00050000-556c-3d68-1e84-63dd9f1f84c4	4282	Gozd Martuljek
00050000-556c-3d68-bd70-eaf425ece589	6272	Gračišče
00050000-556c-3d68-e00c-a3fe6ff02193	9264	Grad
00050000-556c-3d68-4ce8-c39afdcf04cc	8332	Gradac
00050000-556c-3d68-30b1-842093afc34a	1384	Grahovo
00050000-556c-3d68-f591-12bea5d5e292	5242	Grahovo ob Bači
00050000-556c-3d68-bcd1-5fa0bd290a18	5251	Grgar
00050000-556c-3d68-0224-64b37aa9b309	3302	Griže
00050000-556c-3d68-eea9-c449859ab985	3231	Grobelno
00050000-556c-3d68-177d-fa688b7861b6	1290	Grosuplje
00050000-556c-3d68-098e-948a8f2e545a	2288	Hajdina
00050000-556c-3d68-d79c-14e62e3cca61	8362	Hinje
00050000-556c-3d68-c7bb-cf17e026bcdb	2311	Hoče
00050000-556c-3d68-4df8-8f18cf54a262	9205	Hodoš/Hodos
00050000-556c-3d68-8510-bfc1873e2719	1354	Horjul
00050000-556c-3d68-f34e-422b42425088	1372	Hotedršica
00050000-556c-3d68-2584-20758e970d76	1430	Hrastnik
00050000-556c-3d68-b955-aea57e73b037	6225	Hruševje
00050000-556c-3d68-179d-e5441dcba6be	4276	Hrušica
00050000-556c-3d68-9575-9d7e4e25fc4a	5280	Idrija
00050000-556c-3d68-9f29-3c39c049e256	1292	Ig
00050000-556c-3d68-2a94-09e0bbd89bb9	6250	Ilirska Bistrica
00050000-556c-3d68-14aa-5c849df76170	6251	Ilirska Bistrica-Trnovo
00050000-556c-3d68-0fc9-1b25f75fea03	1295	Ivančna Gorica
00050000-556c-3d68-b33e-65f3ed236052	2259	Ivanjkovci
00050000-556c-3d68-8d3d-695629bd5081	1411	Izlake
00050000-556c-3d68-70db-8aa86f795006	6310	Izola/Isola
00050000-556c-3d68-2232-d6fe63029dc9	2222	Jakobski Dol
00050000-556c-3d68-6c77-419a6aaa5f7c	2221	Jarenina
00050000-556c-3d68-e13d-105ae4f89d71	6254	Jelšane
00050000-556c-3d68-13e2-538243e61a38	4270	Jesenice
00050000-556c-3d68-fb72-846dbd76aefe	8261	Jesenice na Dolenjskem
00050000-556c-3d68-01a4-0f7706e2a7a8	3273	Jurklošter
00050000-556c-3d68-74b7-54e9031657cd	2223	Jurovski Dol
00050000-556c-3d68-74b4-b8f0fc604bc7	2256	Juršinci
00050000-556c-3d68-690c-8d133f164f04	5214	Kal nad Kanalom
00050000-556c-3d68-fa96-b4f7b28a1a72	3233	Kalobje
00050000-556c-3d68-6719-67c338c09e45	4246	Kamna Gorica
00050000-556c-3d68-e5ba-62cae037c057	2351	Kamnica
00050000-556c-3d68-783b-8aa45198c78d	1241	Kamnik
00050000-556c-3d68-5aa8-1a352f441a87	5213	Kanal
00050000-556c-3d68-5855-be5c68cd00e7	8258	Kapele
00050000-556c-3d68-684b-7b881257efe8	2362	Kapla
00050000-556c-3d68-6fa4-1543c45cde31	2325	Kidričevo
00050000-556c-3d68-9f3b-cef1d7fca201	1412	Kisovec
00050000-556c-3d68-31d8-7c68009ea1a4	6253	Knežak
00050000-556c-3d68-89b4-6d5062c026b4	5222	Kobarid
00050000-556c-3d68-7559-55e272ad8135	9227	Kobilje
00050000-556c-3d68-6077-86da1b360759	1330	Kočevje
00050000-556c-3d68-8dfb-22de75cc6ac0	1338	Kočevska Reka
00050000-556c-3d68-e07e-09c8d53fd645	2276	Kog
00050000-556c-3d68-0d7d-1a1f03cb26dc	5211	Kojsko
00050000-556c-3d68-ff3c-cab47baecba3	6223	Komen
00050000-556c-3d68-9cdc-859987300b33	1218	Komenda
00050000-556c-3d68-0231-0cc8696e17f4	6000	Koper/Capodistria 
00050000-556c-3d68-f7e0-2996f90433aa	6001	Koper/Capodistria - poštni predali
00050000-556c-3d68-ca5d-176b43e530e8	8282	Koprivnica
00050000-556c-3d68-2e61-1f856e5823fc	5296	Kostanjevica na Krasu
00050000-556c-3d68-3c7d-b4cecce1f5ba	8311	Kostanjevica na Krki
00050000-556c-3d68-2679-2cfa9bea212e	1336	Kostel
00050000-556c-3d68-a8db-5a459a32e89f	6256	Košana
00050000-556c-3d68-7661-33f5a76c512f	2394	Kotlje
00050000-556c-3d68-4f99-51a9bf7a5dc0	6240	Kozina
00050000-556c-3d68-20b3-ed4286f9aa94	3260	Kozje
00050000-556c-3d68-d7f2-5de9cd87da9e	4000	Kranj 
00050000-556c-3d68-5cc3-e46bf310499b	4001	Kranj - poštni predali
00050000-556c-3d68-7b8a-5df147e14a99	4280	Kranjska Gora
00050000-556c-3d68-4c42-8483929c14cc	1281	Kresnice
00050000-556c-3d68-18f6-67983fb29c20	4294	Križe
00050000-556c-3d68-4f23-c0b5c263a57c	9206	Križevci
00050000-556c-3d68-789e-6dfd8def206e	9242	Križevci pri Ljutomeru
00050000-556c-3d68-d128-4932c3c16d04	1301	Krka
00050000-556c-3d68-191d-6f17f2d7b5ff	8296	Krmelj
00050000-556c-3d68-086f-1b83490dbfb9	4245	Kropa
00050000-556c-3d68-b9f7-5c8c5e973d21	8262	Krška vas
00050000-556c-3d68-e7ff-5b444d385ccb	8270	Krško
00050000-556c-3d68-6dec-b252bd3fd4df	9263	Kuzma
00050000-556c-3d68-de2d-d8e2f27200f7	2318	Laporje
00050000-556c-3d68-023f-0fb56e924f31	3270	Laško
00050000-556c-3d68-432b-d089ac55cff5	1219	Laze v Tuhinju
00050000-556c-3d68-4156-12d6f9d6217e	2230	Lenart v Slovenskih goricah
00050000-556c-3d68-ba76-c76d6afc82c7	9220	Lendava/Lendva
00050000-556c-3d68-8619-4bd72ed47f99	4248	Lesce
00050000-556c-3d68-3e4b-4642a8499fb8	3261	Lesično
00050000-556c-3d68-17d4-28ca18f7f09b	8273	Leskovec pri Krškem
00050000-556c-3d68-9e89-80df14d7cd5c	2372	Libeliče
00050000-556c-3d68-ba26-3965ea7ce227	2341	Limbuš
00050000-556c-3d68-89ee-dc4187f75ec4	1270	Litija
00050000-556c-3d68-0ebf-cfd3be790d9e	3202	Ljubečna
00050000-556c-3d68-8962-1f91aef6ce55	1000	Ljubljana 
00050000-556c-3d68-e110-ef2f9c5464b3	1001	Ljubljana - poštni predali
00050000-556c-3d69-ffad-6c568a983991	1231	Ljubljana - Črnuče
00050000-556c-3d69-01c7-c4008f108eb8	1261	Ljubljana - Dobrunje
00050000-556c-3d69-2d9e-11bff19a5e14	1260	Ljubljana - Polje
00050000-556c-3d69-04c9-9cb44d33996d	1210	Ljubljana - Šentvid
00050000-556c-3d69-834c-3e38fad09bcb	1211	Ljubljana - Šmartno
00050000-556c-3d69-538c-67e3ba48fac0	3333	Ljubno ob Savinji
00050000-556c-3d69-1168-fa55892fdc24	9240	Ljutomer
00050000-556c-3d69-022c-9bd724a80a58	3215	Loče
00050000-556c-3d69-ac55-2b205cf91f0b	5231	Log pod Mangartom
00050000-556c-3d69-30cd-d74ad5d545a4	1358	Log pri Brezovici
00050000-556c-3d69-7ebf-38d3dbb50d93	1370	Logatec
00050000-556c-3d69-35a5-0b3151f11487	1371	Logatec
00050000-556c-3d69-6515-1264b1c33ccd	1434	Loka pri Zidanem Mostu
00050000-556c-3d69-c5ec-f5aacafc14ff	3223	Loka pri Žusmu
00050000-556c-3d69-1a89-d876fca75ad7	6219	Lokev
00050000-556c-3d69-9657-9a30f19fc3f6	1318	Loški Potok
00050000-556c-3d69-2b35-01e9b99a85ba	2324	Lovrenc na Dravskem polju
00050000-556c-3d69-98ef-c22bb77fe2a2	2344	Lovrenc na Pohorju
00050000-556c-3d69-dfcf-767bef2232eb	3334	Luče
00050000-556c-3d69-6f5f-ede1020aebfa	1225	Lukovica
00050000-556c-3d69-9564-b046bde5d595	9202	Mačkovci
00050000-556c-3d69-0a43-cc7dbf65916a	2322	Majšperk
00050000-556c-3d69-4f13-f3fd9be815ee	2321	Makole
00050000-556c-3d69-4896-82b7c478e144	9243	Mala Nedelja
00050000-556c-3d69-b555-2894b13b5a90	2229	Malečnik
00050000-556c-3d69-b8c8-99e9a7324f48	6273	Marezige
00050000-556c-3d69-2c87-9680d032815c	2000	Maribor 
00050000-556c-3d69-b0d5-f4cc38129b0a	2001	Maribor - poštni predali
00050000-556c-3d69-e084-32d32a375ccd	2206	Marjeta na Dravskem polju
00050000-556c-3d69-dbac-6186f40e46a2	2281	Markovci
00050000-556c-3d69-6f89-68ebf22ebb27	9221	Martjanci
00050000-556c-3d69-f562-41b95d292e13	6242	Materija
00050000-556c-3d69-92b3-e4976cce0af1	4211	Mavčiče
00050000-556c-3d69-6e1c-a3f50fdd4a97	1215	Medvode
00050000-556c-3d69-3b71-455900b5c541	1234	Mengeš
00050000-556c-3d69-ae7e-c834c4716129	8330	Metlika
00050000-556c-3d69-c169-cfad537c54f6	2392	Mežica
00050000-556c-3d69-1eac-0657d1e1f04b	2204	Miklavž na Dravskem polju
00050000-556c-3d69-01fa-3e2f29ba3bca	2275	Miklavž pri Ormožu
00050000-556c-3d69-e919-713f8b920a0b	5291	Miren
00050000-556c-3d69-ae75-2fc18d66e1fb	8233	Mirna
00050000-556c-3d69-3f5d-083efd63e32b	8216	Mirna Peč
00050000-556c-3d69-30b7-d8e86a133570	2382	Mislinja
00050000-556c-3d69-f0e5-c8b61d088c75	4281	Mojstrana
00050000-556c-3d69-aa7c-07905e489e0e	8230	Mokronog
00050000-556c-3d69-b21d-05da82f53c2a	1251	Moravče
00050000-556c-3d69-051a-c008348c4884	9226	Moravske Toplice
00050000-556c-3d69-6388-e831f2743e77	5216	Most na Soči
00050000-556c-3d69-438d-3a440585af5f	1221	Motnik
00050000-556c-3d69-00cf-b4dd359d4ae6	3330	Mozirje
00050000-556c-3d69-d490-18e81a99cde6	9000	Murska Sobota 
00050000-556c-3d69-42e9-41061c1b1b1e	9001	Murska Sobota - poštni predali
00050000-556c-3d69-5662-5ffe05edfabb	2366	Muta
00050000-556c-3d69-437f-2977e472abfd	4202	Naklo
00050000-556c-3d69-e52e-7999966e672c	3331	Nazarje
00050000-556c-3d69-fcb1-38525db4317c	1357	Notranje Gorice
00050000-556c-3d69-ed7b-8b57e9fba3d6	3203	Nova Cerkev
00050000-556c-3d69-62fd-1551c0f6adac	5000	Nova Gorica 
00050000-556c-3d69-a222-9e683b8a5a86	5001	Nova Gorica - poštni predali
00050000-556c-3d69-fd44-19a1f5f1e294	1385	Nova vas
00050000-556c-3d69-6bc8-1dc9128e885c	8000	Novo mesto
00050000-556c-3d69-676a-27176fcada28	8001	Novo mesto - poštni predali
00050000-556c-3d69-0b29-db8cc4caa6fa	6243	Obrov
00050000-556c-3d69-6b3c-b2194ac27fca	9233	Odranci
00050000-556c-3d69-9ea3-7b2fec7e04bc	2317	Oplotnica
00050000-556c-3d69-3903-910b6d68c173	2312	Orehova vas
00050000-556c-3d69-2c91-232d2b01da56	2270	Ormož
00050000-556c-3d69-0a04-71c7ad6c3c41	1316	Ortnek
00050000-556c-3d69-7ae5-d90341200b33	1337	Osilnica
00050000-556c-3d69-2b06-96129519f1f2	8222	Otočec
00050000-556c-3d69-bc74-2cf35064420d	2361	Ožbalt
00050000-556c-3d69-e112-0029eaf0b4db	2231	Pernica
00050000-556c-3d69-75dd-7048c09c959c	2211	Pesnica pri Mariboru
00050000-556c-3d69-1218-136340156432	9203	Petrovci
00050000-556c-3d69-6ac6-861e11632a4b	3301	Petrovče
00050000-556c-3d69-fa8e-0e395ddf2772	6330	Piran/Pirano
00050000-556c-3d69-a316-6c98920e50ba	8255	Pišece
00050000-556c-3d69-c6ed-521e50ede463	6257	Pivka
00050000-556c-3d69-f599-fd774ee45a77	6232	Planina
00050000-556c-3d69-48da-e42402d21ec7	3225	Planina pri Sevnici
00050000-556c-3d69-df65-2a84145e893c	6276	Pobegi
00050000-556c-3d69-e057-6e494cef89c4	8312	Podbočje
00050000-556c-3d69-9516-3c448e0a3302	5243	Podbrdo
00050000-556c-3d69-4afb-a5849cb041a8	3254	Podčetrtek
00050000-556c-3d69-d5db-0a687eb5336c	2273	Podgorci
00050000-556c-3d69-ecc4-89467e93e3c7	6216	Podgorje
00050000-556c-3d69-1bbb-5b9d209311f1	2381	Podgorje pri Slovenj Gradcu
00050000-556c-3d69-3314-7f8497d7266a	6244	Podgrad
00050000-556c-3d69-5b1c-9969dac04293	1414	Podkum
00050000-556c-3d69-dde2-032a85197084	2286	Podlehnik
00050000-556c-3d69-5a25-f35beefed656	5272	Podnanos
00050000-556c-3d69-e82b-ca3c1ca36fb2	4244	Podnart
00050000-556c-3d69-617d-c8413b1c2ffb	3241	Podplat
00050000-556c-3d69-5267-6ed56edc9475	3257	Podsreda
00050000-556c-3d69-5a4c-0362b056703e	2363	Podvelka
00050000-556c-3d69-1a09-fcb442c768c1	2208	Pohorje
00050000-556c-3d69-2720-7a2279797264	2257	Polenšak
00050000-556c-3d69-881b-c97cdb0642b7	1355	Polhov Gradec
00050000-556c-3d69-bacc-d1b90c0ebe2e	4223	Poljane nad Škofjo Loko
00050000-556c-3d69-f8d9-9fa6de9a4af4	2319	Poljčane
00050000-556c-3d69-ba03-89d86bffd79c	1272	Polšnik
00050000-556c-3d69-11cb-41f3dca56e09	3313	Polzela
00050000-556c-3d69-ce8a-80e72f2834c1	3232	Ponikva
00050000-556c-3d69-e405-6108de821509	6320	Portorož/Portorose
00050000-556c-3d69-ea16-62b4f44aae54	6230	Postojna
00050000-556c-3d69-c045-308943492fb4	2331	Pragersko
00050000-556c-3d69-79c0-042362c644c7	3312	Prebold
00050000-556c-3d69-8860-050830fe668d	4205	Preddvor
00050000-556c-3d69-ffc4-680752f87844	6255	Prem
00050000-556c-3d69-6991-9057c2c2349d	1352	Preserje
00050000-556c-3d69-7f0a-4c5598a5551d	6258	Prestranek
00050000-556c-3d69-3ba8-85e9a9128e1b	2391	Prevalje
00050000-556c-3d69-908a-a3848e2e1fb4	3262	Prevorje
00050000-556c-3d69-5a81-13a9901579c2	1276	Primskovo 
00050000-556c-3d69-db7b-a3aae80deb4a	3253	Pristava pri Mestinju
00050000-556c-3d69-891c-630f804a3f1c	9207	Prosenjakovci/Partosfalva
00050000-556c-3d69-dbb6-78e3c618f4b0	5297	Prvačina
00050000-556c-3d69-11b2-679e65da4539	2250	Ptuj
00050000-556c-3d69-89e7-90f97d5d888b	2323	Ptujska Gora
00050000-556c-3d69-c900-062a097cbed9	9201	Puconci
00050000-556c-3d69-3146-e5161e93b7b0	2327	Rače
00050000-556c-3d69-4bb8-a64564699c23	1433	Radeče
00050000-556c-3d69-4f59-f0a63c4f3d13	9252	Radenci
00050000-556c-3d69-55f5-934d85e42186	2360	Radlje ob Dravi
00050000-556c-3d69-2638-175ed0b32a6f	1235	Radomlje
00050000-556c-3d69-07d4-df83a958106a	4240	Radovljica
00050000-556c-3d69-9706-c32bce8e6e56	8274	Raka
00050000-556c-3d69-b2b8-58b4a8271534	1381	Rakek
00050000-556c-3d69-e694-79480e7ef9f7	4283	Rateče - Planica
00050000-556c-3d69-1410-349b279fe2ce	2390	Ravne na Koroškem
00050000-556c-3d69-3197-b894b65f9402	9246	Razkrižje
00050000-556c-3d69-fd14-a088c86dff9e	3332	Rečica ob Savinji
00050000-556c-3d69-82f2-dde82666a8df	5292	Renče
00050000-556c-3d69-ef18-05ecb9431eba	1310	Ribnica
00050000-556c-3d69-072c-b29a44152b78	2364	Ribnica na Pohorju
00050000-556c-3d69-2053-efffd9f5d349	3272	Rimske Toplice
00050000-556c-3d69-e8c8-55686e0fbf16	1314	Rob
00050000-556c-3d69-a988-51f22b0e5f25	5215	Ročinj
00050000-556c-3d69-356e-61afb7cb5c66	3250	Rogaška Slatina
00050000-556c-3d69-3383-c199cdfbe7b8	9262	Rogašovci
00050000-556c-3d69-7be5-9fc3a248bf28	3252	Rogatec
00050000-556c-3d69-8d2b-51e79701730d	1373	Rovte
00050000-556c-3d69-0d88-c0dbbf45b01b	2342	Ruše
00050000-556c-3d69-d9d1-31fae599b9f2	1282	Sava
00050000-556c-3d69-3749-9cc8c7408df3	6333	Sečovlje/Sicciole
00050000-556c-3d69-040a-c5dc45646928	4227	Selca
00050000-556c-3d69-5fde-0e290a5e1f3b	2352	Selnica ob Dravi
00050000-556c-3d69-70fa-45689bb4ad15	8333	Semič
00050000-556c-3d69-401e-0facf1a0e6f2	8281	Senovo
00050000-556c-3d69-c382-2008aefc30cb	6224	Senožeče
00050000-556c-3d69-08de-e01a2cec5c1a	8290	Sevnica
00050000-556c-3d69-b9a0-f5871d0f86e3	6210	Sežana
00050000-556c-3d69-742e-16a34bed99d0	2214	Sladki Vrh
00050000-556c-3d69-b460-fc4bb83d90a7	5283	Slap ob Idrijci
00050000-556c-3d69-bbd6-9b9cdfa651ae	2380	Slovenj Gradec
00050000-556c-3d69-3747-86d1e5897b4d	2310	Slovenska Bistrica
00050000-556c-3d69-9ede-30b8e4e23cf8	3210	Slovenske Konjice
00050000-556c-3d69-828b-6bd6bb7131dd	1216	Smlednik
00050000-556c-3d69-3e68-b8bc7ec08f2c	5232	Soča
00050000-556c-3d69-cb45-3caeb7913083	1317	Sodražica
00050000-556c-3d69-7cd6-4eb1e9d61b4f	3335	Solčava
00050000-556c-3d69-34c6-f6013b9b76d6	5250	Solkan
00050000-556c-3d69-649c-ace97580846b	4229	Sorica
00050000-556c-3d69-d257-67b8873d899e	4225	Sovodenj
00050000-556c-3d69-f3f4-6e85da3127cf	5281	Spodnja Idrija
00050000-556c-3d69-7ea1-c2f65802fb71	2241	Spodnji Duplek
00050000-556c-3d69-c3bc-cd0ad2792684	9245	Spodnji Ivanjci
00050000-556c-3d69-6cda-82b53b02dc0c	2277	Središče ob Dravi
00050000-556c-3d69-b2e1-777628f51799	4267	Srednja vas v Bohinju
00050000-556c-3d69-018c-ba1319bfc79b	8256	Sromlje 
00050000-556c-3d69-a01f-cc3b54b19d1c	5224	Srpenica
00050000-556c-3d69-44be-097d903bcefb	1242	Stahovica
00050000-556c-3d69-6c57-d8f431dd342b	1332	Stara Cerkev
00050000-556c-3d69-6db3-72b5c960a46b	8342	Stari trg ob Kolpi
00050000-556c-3d69-4d90-3a2909bf9747	1386	Stari trg pri Ložu
00050000-556c-3d69-fa1d-8fc6e42cd49e	2205	Starše
00050000-556c-3d69-524b-d8d9f9e6df53	2289	Stoperce
00050000-556c-3d69-7351-5ecc8a6efda4	8322	Stopiče
00050000-556c-3d69-a49d-127d2ebfe476	3206	Stranice
00050000-556c-3d69-dcf3-bcb7bbae8ea3	8351	Straža
00050000-556c-3d69-b16e-ad7a1a314934	1313	Struge
00050000-556c-3d69-e956-89147ca40001	8293	Studenec
00050000-556c-3d69-f5f8-197c43973f4b	8331	Suhor
00050000-556c-3d69-083a-369331f5f36c	2233	Sv. Ana v Slovenskih goricah
00050000-556c-3d69-4c15-2a7abc92524e	2235	Sv. Trojica v Slovenskih goricah
00050000-556c-3d69-b148-807503439f55	2353	Sveti Duh na Ostrem Vrhu
00050000-556c-3d69-ab83-817ba20174ee	9244	Sveti Jurij ob Ščavnici
00050000-556c-3d69-c2e7-e152679a65da	3264	Sveti Štefan
00050000-556c-3d69-1698-bd7542109300	2258	Sveti Tomaž
00050000-556c-3d69-f033-89679ef7ae7a	9204	Šalovci
00050000-556c-3d69-4814-283bac904c97	5261	Šempas
00050000-556c-3d69-cbbc-104c568d2a4f	5290	Šempeter pri Gorici
00050000-556c-3d69-e528-4591f2d70c2a	3311	Šempeter v Savinjski dolini
00050000-556c-3d69-e34f-1ae750dc0488	4208	Šenčur
00050000-556c-3d69-878f-4ac9ef6af305	2212	Šentilj v Slovenskih goricah
00050000-556c-3d69-df60-d1563ff9f9c6	8297	Šentjanž
00050000-556c-3d69-e989-34079159a6a0	2373	Šentjanž pri Dravogradu
00050000-556c-3d69-4532-5d900690d698	8310	Šentjernej
00050000-556c-3d69-7714-746c8fb923c7	3230	Šentjur
00050000-556c-3d69-4515-6ea44aff713d	3271	Šentrupert
00050000-556c-3d69-bbab-0884ff6d993b	8232	Šentrupert
00050000-556c-3d69-bfa5-e5ec442c53cc	1296	Šentvid pri Stični
00050000-556c-3d69-b2a2-3638921f8dd8	8275	Škocjan
00050000-556c-3d69-e7b6-baa72a83422c	6281	Škofije
00050000-556c-3d69-1e0f-0aebf72fc8eb	4220	Škofja Loka
00050000-556c-3d69-e89c-37ceb51ad5dc	3211	Škofja vas
00050000-556c-3d69-a8c4-e24e2824d14f	1291	Škofljica
00050000-556c-3d69-8e8e-720766324e29	6274	Šmarje
00050000-556c-3d69-09ca-271733448c2a	1293	Šmarje - Sap
00050000-556c-3d69-2bcb-d81a466d099e	3240	Šmarje pri Jelšah
00050000-556c-3d69-211c-39dc6b9f1172	8220	Šmarješke Toplice
00050000-556c-3d69-2be6-9fc762211b42	2315	Šmartno na Pohorju
00050000-556c-3d69-7cb9-8a5d10bdb763	3341	Šmartno ob Dreti
00050000-556c-3d69-4d1e-da26bb9f2ac9	3327	Šmartno ob Paki
00050000-556c-3d69-8ea4-26725303078d	1275	Šmartno pri Litiji
00050000-556c-3d69-e555-e2b630766811	2383	Šmartno pri Slovenj Gradcu
00050000-556c-3d69-5d9b-3b892fcaa20d	3201	Šmartno v Rožni dolini
00050000-556c-3d69-3cb6-b5757f8ac051	3325	Šoštanj
00050000-556c-3d69-ed70-e984ccebbccc	6222	Štanjel
00050000-556c-3d69-9782-dd1b0d72945e	3220	Štore
00050000-556c-3d69-157f-4461f7327c25	3304	Tabor
00050000-556c-3d69-d491-d3454fbb4afb	3221	Teharje
00050000-556c-3d69-8ebc-8544ea434c56	9251	Tišina
00050000-556c-3d69-1736-f9b7721b3eb8	5220	Tolmin
00050000-556c-3d69-7a5e-26f0fc1e5a55	3326	Topolšica
00050000-556c-3d69-9e3a-3045f651c9b0	2371	Trbonje
00050000-556c-3d69-cc9b-017d1405cd5e	1420	Trbovlje
00050000-556c-3d69-b144-ffa4e245fbec	8231	Trebelno 
00050000-556c-3d69-2664-d8b63b4cfbd7	8210	Trebnje
00050000-556c-3d69-8247-2801762e9abf	5252	Trnovo pri Gorici
00050000-556c-3d69-6bad-6e165f6e5ae4	2254	Trnovska vas
00050000-556c-3d69-5173-76b9407e6a8e	1222	Trojane
00050000-556c-3d69-cde5-81bd36773382	1236	Trzin
00050000-556c-3d69-253b-ba4b4933a4f8	4290	Tržič
00050000-556c-3d69-3767-8025716ed2fb	8295	Tržišče
00050000-556c-3d69-1b9c-a95da4f50b39	1311	Turjak
00050000-556c-3d69-994c-42a5a0e26f2f	9224	Turnišče
00050000-556c-3d69-966a-d385abfc358c	8323	Uršna sela
00050000-556c-3d69-e621-12ccf2db48b7	1252	Vače
00050000-556c-3d69-28b5-1d4b9b1f4a18	3320	Velenje 
00050000-556c-3d69-2fa0-ff82a050d3df	3322	Velenje - poštni predali
00050000-556c-3d69-af43-bab29cda0657	8212	Velika Loka
00050000-556c-3d69-41f7-1cdd6805a2d7	2274	Velika Nedelja
00050000-556c-3d69-305a-4a09f1d5b7a7	9225	Velika Polana
00050000-556c-3d69-0408-1470b8cafe03	1315	Velike Lašče
00050000-556c-3d69-b002-a531c01dd128	8213	Veliki Gaber
00050000-556c-3d69-8c05-e08f5fcb946b	9241	Veržej
00050000-556c-3d69-6d5e-4c1cb4b0c075	1312	Videm - Dobrepolje
00050000-556c-3d69-a46c-26ea1b7050af	2284	Videm pri Ptuju
00050000-556c-3d69-4615-67855bdadc3a	8344	Vinica
00050000-556c-3d69-f8de-edb2784d429c	5271	Vipava
00050000-556c-3d69-58c1-13dd3597d85f	4212	Visoko
00050000-556c-3d69-70b6-0c7797a21cc8	1294	Višnja Gora
00050000-556c-3d69-b44d-002a3a79275a	3205	Vitanje
00050000-556c-3d69-8223-9ea144ed8b24	2255	Vitomarci
00050000-556c-3d69-2b4c-a952a2830e45	1217	Vodice
00050000-556c-3d69-fa1b-4357657500a0	3212	Vojnik\t
00050000-556c-3d69-b260-b3ae5298a7a7	5293	Volčja Draga
00050000-556c-3d69-fde2-cc50e63041a4	2232	Voličina
00050000-556c-3d69-6866-66bb843b0b41	3305	Vransko
00050000-556c-3d69-9d1a-ee1fff0b0bbc	6217	Vremski Britof
00050000-556c-3d69-b557-202e4071de7e	1360	Vrhnika
00050000-556c-3d69-7fa4-e45083dc85d2	2365	Vuhred
00050000-556c-3d69-0e99-6ca3243b7b40	2367	Vuzenica
00050000-556c-3d69-c3f6-64015c61a14e	8292	Zabukovje 
00050000-556c-3d69-bf41-72b64f693358	1410	Zagorje ob Savi
00050000-556c-3d69-d3bf-5902766297e1	1303	Zagradec
00050000-556c-3d69-d3f5-9c85d7b1aef3	2283	Zavrč
00050000-556c-3d69-86a1-a973d232ef64	8272	Zdole 
00050000-556c-3d69-13e1-6bca5bd37589	4201	Zgornja Besnica
00050000-556c-3d69-e79d-223597b80528	2242	Zgornja Korena
00050000-556c-3d69-eaf1-a352349a72c1	2201	Zgornja Kungota
00050000-556c-3d69-2b8c-8c3ad937bc6f	2316	Zgornja Ložnica
00050000-556c-3d69-b879-3fda82897cd1	2314	Zgornja Polskava
00050000-556c-3d69-82eb-d84e16edefbf	2213	Zgornja Velka
00050000-556c-3d69-127f-ca018c1675ca	4247	Zgornje Gorje
00050000-556c-3d69-a8c0-ab601b271e22	4206	Zgornje Jezersko
00050000-556c-3d69-751c-adcf42e14941	2285	Zgornji Leskovec
00050000-556c-3d69-dd89-c90a1e97e879	1432	Zidani Most
00050000-556c-3d69-da0c-27becb3abafc	3214	Zreče
00050000-556c-3d69-e5b6-bf6d0d467177	4209	Žabnica
00050000-556c-3d69-afc1-4f58c25144ab	3310	Žalec
00050000-556c-3d69-3ea6-cb6aefffdd37	4228	Železniki
00050000-556c-3d69-bf6e-8472efbaee22	2287	Žetale
00050000-556c-3d69-f8a3-9052fdee9f32	4226	Žiri
00050000-556c-3d69-12b5-3b1dd44aaf4b	4274	Žirovnica
00050000-556c-3d69-cfd8-f40957d16576	8360	Žužemberk
\.


--
-- TOC entry 2722 (class 0 OID 5633342)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2690 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2704 (class 0 OID 5633157)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2710 (class 0 OID 5633235)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2724 (class 0 OID 5633354)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2737 (class 0 OID 5633474)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2741 (class 0 OID 5633525)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2728 (class 0 OID 5633383)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-556c-3d6a-c8ea-6f938bd47d8e	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-556c-3d6a-52b0-bbcbb675bb80	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-556c-3d6a-ac0b-d6bf268834d8	0003	Kazinska	t	84	Kazinska dvorana
00220000-556c-3d6a-4e56-a55fd1cd8272	0004	Mali oder	t	24	Mali oder 
00220000-556c-3d6a-8884-f603f1c82a8c	0005	Komorni oder	t	15	Komorni oder
00220000-556c-3d6a-b104-04ec19ef3d6c	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-556c-3d6a-f634-08dff9e7746d	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2720 (class 0 OID 5633327)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2719 (class 0 OID 5633317)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2740 (class 0 OID 5633514)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2735 (class 0 OID 5633451)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2693 (class 0 OID 5633030)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-556c-3d69-eb00-7c80a750022b	00010000-556c-3d69-9932-9c75351dd47f	2015-06-01 13:09:30	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROe36PKcUBybW9.o.RcIuaPv1Ewz3eGgS";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2758 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2729 (class 0 OID 5633393)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2697 (class 0 OID 5633068)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-556c-3d69-6b26-de509fd85e16	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-556c-3d69-a310-b9dc0001a5a8	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-556c-3d69-b61d-ff0d1af8b19b	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-556c-3d69-95a7-49faaddc456b	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-556c-3d69-4080-5e66f67d5836	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-556c-3d69-c032-2d50f7bced11	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2695 (class 0 OID 5633052)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-556c-3d69-eb00-7c80a750022b	00020000-556c-3d69-95a7-49faaddc456b
00010000-556c-3d69-9932-9c75351dd47f	00020000-556c-3d69-95a7-49faaddc456b
\.


--
-- TOC entry 2731 (class 0 OID 5633407)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2723 (class 0 OID 5633348)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2717 (class 0 OID 5633298)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2749 (class 0 OID 5633622)
-- Dependencies: 230
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-556c-3d69-0c7c-3c3a6e7f71a0	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-556c-3d69-6441-25eb2c8889d5	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-556c-3d69-6544-1579492ec7ae	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-556c-3d69-dcf1-06db25e1ac12	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-556c-3d69-5eb6-b25ce0eed3ba	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2748 (class 0 OID 5633615)
-- Dependencies: 229
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-556c-3d69-ecc8-5a1dc9d1ebf3	00000000-556c-3d69-dcf1-06db25e1ac12	popa
00000000-556c-3d69-80dd-4459bf7cef50	00000000-556c-3d69-dcf1-06db25e1ac12	oseba
00000000-556c-3d69-3fba-4acc950f1587	00000000-556c-3d69-6441-25eb2c8889d5	prostor
00000000-556c-3d69-c006-19774bf1d7e1	00000000-556c-3d69-dcf1-06db25e1ac12	besedilo
00000000-556c-3d69-46d9-404075750d34	00000000-556c-3d69-dcf1-06db25e1ac12	uprizoritev
00000000-556c-3d69-124c-bf0c17a13746	00000000-556c-3d69-dcf1-06db25e1ac12	funkcija
00000000-556c-3d69-b602-49bd35618b80	00000000-556c-3d69-dcf1-06db25e1ac12	tipfunkcije
00000000-556c-3d69-c2dd-9ee0eb9e653b	00000000-556c-3d69-dcf1-06db25e1ac12	alternacija
\.


--
-- TOC entry 2747 (class 0 OID 5633610)
-- Dependencies: 228
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2736 (class 0 OID 5633461)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2702 (class 0 OID 5633129)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2718 (class 0 OID 5633304)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-556c-3d6a-bad4-066e3501c774	00180000-556c-3d6a-b002-03ea4a66688e	000c0000-556c-3d6a-9429-7295f11a34d7	00090000-556c-3d6a-5a4c-48a779ea8028	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-3d6a-1d6c-b293c187c787	00180000-556c-3d6a-b002-03ea4a66688e	000c0000-556c-3d6a-2b07-2802d715a2fb	00090000-556c-3d6a-c3ab-cdc1c1949c93	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-3d6a-c6b6-e1c096758ed2	00180000-556c-3d6a-b002-03ea4a66688e	000c0000-556c-3d6a-f495-7a539f392eca	00090000-556c-3d6a-53cf-4f72d9956d8f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-3d6a-6d80-c78111fe87d8	00180000-556c-3d6a-b002-03ea4a66688e	000c0000-556c-3d6a-7b23-facf625a07cf	00090000-556c-3d6a-e8b7-637a82ebefb2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-3d6a-6a57-345e3f025d24	00180000-556c-3d6a-b002-03ea4a66688e	000c0000-556c-3d6a-86d5-54f186468a89	00090000-556c-3d6a-eed4-51dc3612e33f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-3d6a-c6e2-77530de5b61a	00180000-556c-3d6a-1c16-6dc49d08819b	\N	00090000-556c-3d6a-eed4-51dc3612e33f	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2739 (class 0 OID 5633503)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-556c-3d69-3e8c-b0a44b41bd02	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-556c-3d69-f0ff-af321fdbeb2f	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-556c-3d69-c4c6-e95330aab42a	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-556c-3d69-d78e-8fb7b596f9c0	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-556c-3d69-e2fa-fe041da0d587	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-556c-3d69-e07c-706fe18495bc	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-556c-3d69-6f17-00278204527e	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-556c-3d69-b84f-603c825622a2	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-556c-3d69-efb2-9869487a43d1	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-556c-3d69-0d2d-bb3631da40b3	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-556c-3d69-1fc3-cf618c471f7d	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-556c-3d69-f665-81e1ff703e60	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-556c-3d69-0a49-d8fd70e845da	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-556c-3d69-24a1-8230331df7d9	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-556c-3d69-affd-2ae8ce71213d	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-556c-3d69-4c55-cc5d303888dc	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2707 (class 0 OID 5633192)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2694 (class 0 OID 5633039)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-556c-3d69-9932-9c75351dd47f	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROKkHrHcp4MJwLcKcDq7COO9lW6akaDc2	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-556c-3d6a-b3e0-12bdd464b965	testni uporabnik za inšpecienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-556c-3d6a-3533-a7e8e2004a1e	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-556c-3d6a-0d1d-5511d9a120b5	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-556c-3d6a-a2f5-efccb5b57023	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-556c-3d69-eb00-7c80a750022b	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2744 (class 0 OID 5633558)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-556c-3d6a-4c3c-77db65bba1ed	00160000-556c-3d6a-8d3c-a78e34ce6af2	00150000-556c-3d69-a1c5-3613a1970cd3	00140000-556c-3d69-8fea-ff3f853595b8	0001	produkcija	Sen kresne noči		Sanje	2016-02-01	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-556c-3d6a-8884-f603f1c82a8c
000e0000-556c-3d6a-69f3-751e49c79e0d	00160000-556c-3d6a-276c-42a3a28131a2	00150000-556c-3d69-e9b0-342b044359fa	00140000-556c-3d69-a94b-0ead3f85819d	0002	predprodukcija-ideja	Smoletov vrt			2017-01-01	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-556c-3d6a-b104-04ec19ef3d6c
\.


--
-- TOC entry 2712 (class 0 OID 5633250)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-556c-3d6a-b6ed-1166dd5cf6d7	000e0000-556c-3d6a-69f3-751e49c79e0d	1	
00200000-556c-3d6a-188f-f997d703a546	000e0000-556c-3d6a-69f3-751e49c79e0d	2	
\.


--
-- TOC entry 2727 (class 0 OID 5633375)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2734 (class 0 OID 5633443)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2714 (class 0 OID 5633282)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2743 (class 0 OID 5633548)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-556c-3d69-8fea-ff3f853595b8	Drama	drama (SURS 01)
00140000-556c-3d69-0b70-c232d18fd029	Opera	opera (SURS 02)
00140000-556c-3d69-fe78-c298d67529b2	Balet	balet (SURS 03)
00140000-556c-3d69-2e69-b4ed4fb43dd5	Plesne prireditve	plesne prireditve (SURS 04)
00140000-556c-3d69-9cff-72f828dc824c	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-556c-3d69-a94b-0ead3f85819d	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-556c-3d69-3bef-cfe355fb7c31	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2733 (class 0 OID 5633433)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-556c-3d69-5c62-14e8e62697f7	Opera	opera
00150000-556c-3d69-f34e-646316e69502	Opereta	opereta
00150000-556c-3d69-27d2-85ff2a5b5af0	Balet	balet
00150000-556c-3d69-569f-6233de1b9db5	Plesne prireditve	plesne prireditve
00150000-556c-3d69-6ace-4cbf2335b710	Lutkovno gledališče	lutkovno gledališče
00150000-556c-3d69-b446-5b342d72547b	Raziskovalno gledališče	raziskovalno gledališče
00150000-556c-3d69-881a-885fe4e7c8f3	Biografska drama	biografska drama
00150000-556c-3d69-a1c5-3613a1970cd3	Komedija	komedija
00150000-556c-3d69-2f4b-319e3ff2c34e	Črna komedija	črna komedija
00150000-556c-3d69-b924-f1d294119247	E-igra	E-igra
00150000-556c-3d69-e9b0-342b044359fa	Kriminalka	kriminalka
00150000-556c-3d69-701f-1cde2ad6843d	Musical	musical
\.


--
-- TOC entry 2314 (class 2606 OID 5633093)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 5633603)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 5633593)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 5633502)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 5633272)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 5633297)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 5633218)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 5633429)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 5633248)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 5633291)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2355 (class 2606 OID 5633232)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2285 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 5633340)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 5633367)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 5633190)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2318 (class 2606 OID 5633102)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2295 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2320 (class 2606 OID 5633126)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 5633082)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2305 (class 2606 OID 5633067)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 5633373)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 5633406)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 5633543)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 2606 OID 5633154)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2337 (class 2606 OID 5633178)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 5633346)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2291 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2335 (class 2606 OID 5633168)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2360 (class 2606 OID 5633239)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 5633358)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 5633486)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 5633530)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 5633390)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 5633331)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 5633322)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 5633524)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2451 (class 2606 OID 5633458)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2297 (class 2606 OID 5633038)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 5633397)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2303 (class 2606 OID 5633056)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2307 (class 2606 OID 5633076)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 5633415)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 5633353)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 5633303)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 5633628)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 5633619)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 5633614)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 5633471)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 5633134)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 5633313)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 5633513)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 5633203)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 5633051)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 5633573)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 5633257)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 5633381)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2447 (class 2606 OID 5633449)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 5633286)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 5633557)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2444 (class 2606 OID 5633442)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 1259 OID 5633279)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2452 (class 1259 OID 5633472)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2453 (class 1259 OID 5633473)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2327 (class 1259 OID 5633156)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2287 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2288 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2289 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2418 (class 1259 OID 5633374)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2412 (class 1259 OID 5633360)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2413 (class 1259 OID 5633359)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2364 (class 1259 OID 5633258)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2440 (class 1259 OID 5633430)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2441 (class 1259 OID 5633432)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2442 (class 1259 OID 5633431)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2352 (class 1259 OID 5633234)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2353 (class 1259 OID 5633233)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2469 (class 1259 OID 5633545)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2470 (class 1259 OID 5633546)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2471 (class 1259 OID 5633547)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2477 (class 1259 OID 5633578)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2478 (class 1259 OID 5633575)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2479 (class 1259 OID 5633577)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2480 (class 1259 OID 5633576)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2342 (class 1259 OID 5633205)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2343 (class 1259 OID 5633204)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2292 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2293 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2428 (class 1259 OID 5633398)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2382 (class 1259 OID 5633292)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2309 (class 1259 OID 5633083)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2310 (class 1259 OID 5633084)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2433 (class 1259 OID 5633418)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2434 (class 1259 OID 5633417)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2435 (class 1259 OID 5633416)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2356 (class 1259 OID 5633240)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2357 (class 1259 OID 5633242)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2358 (class 1259 OID 5633241)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2498 (class 1259 OID 5633621)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2392 (class 1259 OID 5633326)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2393 (class 1259 OID 5633324)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2394 (class 1259 OID 5633323)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2395 (class 1259 OID 5633325)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2300 (class 1259 OID 5633057)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2301 (class 1259 OID 5633058)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2421 (class 1259 OID 5633382)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2407 (class 1259 OID 5633347)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2448 (class 1259 OID 5633459)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2449 (class 1259 OID 5633460)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2331 (class 1259 OID 5633170)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2332 (class 1259 OID 5633169)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2333 (class 1259 OID 5633171)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2456 (class 1259 OID 5633487)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2457 (class 1259 OID 5633488)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2490 (class 1259 OID 5633607)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2491 (class 1259 OID 5633606)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2492 (class 1259 OID 5633609)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2493 (class 1259 OID 5633605)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2494 (class 1259 OID 5633608)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2445 (class 1259 OID 5633450)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2398 (class 1259 OID 5633335)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2399 (class 1259 OID 5633334)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2400 (class 1259 OID 5633332)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2401 (class 1259 OID 5633333)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2283 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2486 (class 1259 OID 5633595)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2487 (class 1259 OID 5633594)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2363 (class 1259 OID 5633249)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2315 (class 1259 OID 5633104)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2316 (class 1259 OID 5633103)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2323 (class 1259 OID 5633135)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2324 (class 1259 OID 5633136)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 5633316)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2388 (class 1259 OID 5633315)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2389 (class 1259 OID 5633314)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2370 (class 1259 OID 5633281)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2371 (class 1259 OID 5633277)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2372 (class 1259 OID 5633274)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2373 (class 1259 OID 5633275)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2374 (class 1259 OID 5633273)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2375 (class 1259 OID 5633278)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2376 (class 1259 OID 5633276)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2330 (class 1259 OID 5633155)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2348 (class 1259 OID 5633219)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2349 (class 1259 OID 5633221)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2350 (class 1259 OID 5633220)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2351 (class 1259 OID 5633222)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2406 (class 1259 OID 5633341)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2474 (class 1259 OID 5633544)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 5633574)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2321 (class 1259 OID 5633127)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2322 (class 1259 OID 5633128)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2504 (class 1259 OID 5633629)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2341 (class 1259 OID 5633191)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2501 (class 1259 OID 5633620)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2426 (class 1259 OID 5633392)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2427 (class 1259 OID 5633391)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2495 (class 1259 OID 5633604)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2286 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2338 (class 1259 OID 5633179)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2468 (class 1259 OID 5633531)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2308 (class 1259 OID 5633077)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2377 (class 1259 OID 5633280)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2529 (class 2606 OID 5633760)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2532 (class 2606 OID 5633745)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2531 (class 2606 OID 5633750)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2527 (class 2606 OID 5633770)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2533 (class 2606 OID 5633740)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2528 (class 2606 OID 5633765)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2530 (class 2606 OID 5633755)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2563 (class 2606 OID 5633915)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2562 (class 2606 OID 5633920)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2514 (class 2606 OID 5633675)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2550 (class 2606 OID 5633855)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2548 (class 2606 OID 5633850)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2549 (class 2606 OID 5633845)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2526 (class 2606 OID 5633735)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2558 (class 2606 OID 5633885)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2556 (class 2606 OID 5633895)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2557 (class 2606 OID 5633890)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2520 (class 2606 OID 5633710)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2521 (class 2606 OID 5633705)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2546 (class 2606 OID 5633835)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2569 (class 2606 OID 5633940)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2568 (class 2606 OID 5633945)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2567 (class 2606 OID 5633950)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2570 (class 2606 OID 5633970)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2573 (class 2606 OID 5633955)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2571 (class 2606 OID 5633965)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2572 (class 2606 OID 5633960)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2518 (class 2606 OID 5633700)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2519 (class 2606 OID 5633695)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2511 (class 2606 OID 5633660)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2552 (class 2606 OID 5633865)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2534 (class 2606 OID 5633775)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2508 (class 2606 OID 5633640)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2507 (class 2606 OID 5633645)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2553 (class 2606 OID 5633880)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2554 (class 2606 OID 5633875)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2555 (class 2606 OID 5633870)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2524 (class 2606 OID 5633715)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2522 (class 2606 OID 5633725)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2523 (class 2606 OID 5633720)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2581 (class 2606 OID 5634010)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2538 (class 2606 OID 5633810)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2540 (class 2606 OID 5633800)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2541 (class 2606 OID 5633795)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2539 (class 2606 OID 5633805)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2506 (class 2606 OID 5633630)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2505 (class 2606 OID 5633635)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2551 (class 2606 OID 5633860)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2547 (class 2606 OID 5633840)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2561 (class 2606 OID 5633905)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2560 (class 2606 OID 5633910)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2516 (class 2606 OID 5633685)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2517 (class 2606 OID 5633680)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2515 (class 2606 OID 5633690)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2565 (class 2606 OID 5633925)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2564 (class 2606 OID 5633930)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2578 (class 2606 OID 5633995)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2579 (class 2606 OID 5633990)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2576 (class 2606 OID 5634005)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2580 (class 2606 OID 5633985)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2577 (class 2606 OID 5634000)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2559 (class 2606 OID 5633900)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2542 (class 2606 OID 5633830)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2543 (class 2606 OID 5633825)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2545 (class 2606 OID 5633815)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2544 (class 2606 OID 5633820)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2574 (class 2606 OID 5633980)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2575 (class 2606 OID 5633975)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2525 (class 2606 OID 5633730)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2566 (class 2606 OID 5633935)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 5633655)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2510 (class 2606 OID 5633650)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2513 (class 2606 OID 5633665)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2512 (class 2606 OID 5633670)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2535 (class 2606 OID 5633790)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2536 (class 2606 OID 5633785)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2537 (class 2606 OID 5633780)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-06-01 13:09:31 CEST

--
-- PostgreSQL database dump complete
--

