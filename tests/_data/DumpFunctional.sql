--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-27 12:01:24 CEST

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
-- TOC entry 180 (class 1259 OID 5255299)
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
-- TOC entry 227 (class 1259 OID 5255809)
-- Name: alternacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE alternacija (
    id uuid NOT NULL,
    funkcija_id uuid,
    sodelovanje_id uuid,
    oseba_id uuid,
    koprodukcija_delitev_id uuid,
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
-- TOC entry 226 (class 1259 OID 5255792)
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
-- TOC entry 219 (class 1259 OID 5255702)
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
-- TOC entry 194 (class 1259 OID 5255472)
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
-- TOC entry 197 (class 1259 OID 5255506)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 5255419)
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
-- TOC entry 213 (class 1259 OID 5255632)
-- Name: funkcija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE funkcija (
    id uuid NOT NULL,
    uprizoritev_id uuid NOT NULL,
    alternacija_id uuid,
    tip_vloge_id uuid,
    podrocje character varying(20) DEFAULT NULL::character varying,
    naziv character varying(255) NOT NULL,
    komentar character varying(255) DEFAULT NULL::character varying,
    velikost character varying(255) DEFAULT NULL::character varying,
    pomembna boolean NOT NULL,
    sort integer,
    seplanira boolean NOT NULL,
    dovoliprekrivanje boolean NOT NULL,
    maxprekirvanj integer
);


--
-- TOC entry 192 (class 1259 OID 5255456)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 196 (class 1259 OID 5255500)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 5255436)
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
-- TOC entry 202 (class 1259 OID 5255549)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 5255574)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 5255393)
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
-- TOC entry 181 (class 1259 OID 5255308)
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
-- TOC entry 182 (class 1259 OID 5255319)
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
-- TOC entry 177 (class 1259 OID 5255273)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 5255292)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 5255581)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 5255612)
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
-- TOC entry 223 (class 1259 OID 5255745)
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
-- TOC entry 184 (class 1259 OID 5255350)
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
-- TOC entry 186 (class 1259 OID 5255385)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 5255555)
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
-- TOC entry 185 (class 1259 OID 5255370)
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
-- TOC entry 191 (class 1259 OID 5255448)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 5255567)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 5255687)
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
-- TOC entry 222 (class 1259 OID 5255738)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 5255596)
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
-- TOC entry 201 (class 1259 OID 5255540)
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
-- TOC entry 200 (class 1259 OID 5255530)
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
-- TOC entry 221 (class 1259 OID 5255727)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 5255664)
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
-- TOC entry 174 (class 1259 OID 5255244)
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
-- TOC entry 173 (class 1259 OID 5255242)
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
-- TOC entry 210 (class 1259 OID 5255606)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 5255282)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 5255266)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 5255620)
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
-- TOC entry 204 (class 1259 OID 5255561)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 5255511)
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
-- TOC entry 230 (class 1259 OID 5255835)
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
-- TOC entry 229 (class 1259 OID 5255828)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 5255823)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 5255674)
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
-- TOC entry 231 (class 1259 OID 5255843)
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE strosekuprizoritve_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 183 (class 1259 OID 5255342)
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
-- TOC entry 199 (class 1259 OID 5255517)
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
-- TOC entry 220 (class 1259 OID 5255716)
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
-- TOC entry 188 (class 1259 OID 5255405)
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
-- TOC entry 175 (class 1259 OID 5255253)
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
-- TOC entry 225 (class 1259 OID 5255771)
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
-- TOC entry 193 (class 1259 OID 5255463)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 5255588)
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
-- TOC entry 215 (class 1259 OID 5255656)
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
-- TOC entry 195 (class 1259 OID 5255495)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 5255761)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 5255646)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2146 (class 2604 OID 5255247)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2700 (class 0 OID 5255299)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2747 (class 0 OID 5255809)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
000c0000-5565-95f3-75ec-c2c6d64ca253	000d0000-5565-95f3-d7d4-948d2892b58a	\N	00090000-5565-95f3-c598-43a97b2d157d	\N	\N	0001	f	\N	\N	\N	\N	\N	\N
000c0000-5565-95f3-5045-fc3ed497a252	000d0000-5565-95f3-9170-d6f420c1fa8b	\N	00090000-5565-95f3-0d87-88cf7e462af5	\N	\N	0002	f	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2746 (class 0 OID 5255792)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2739 (class 0 OID 5255702)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-5565-95f3-f601-fc0b67260e2c	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-5565-95f3-08c3-759623a420fa	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-5565-95f3-e266-f4c1beaae76c	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 2714 (class 0 OID 5255472)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2717 (class 0 OID 5255506)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2709 (class 0 OID 5255419)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5565-95f2-f270-ada915d74d1a	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5565-95f2-862f-f167e5d11e05	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5565-95f2-b39f-b06d40cc5096	AL	ALB	008	Albania 	Albanija	\N
00040000-5565-95f2-b909-50ac9a0680cc	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5565-95f2-a740-ec43711a8bbe	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5565-95f2-811b-354f73e5df90	AD	AND	020	Andorra 	Andora	\N
00040000-5565-95f2-164a-4753b68ec710	AO	AGO	024	Angola 	Angola	\N
00040000-5565-95f2-9972-a2308bd0a499	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5565-95f2-b702-e0e266db4f05	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5565-95f2-d678-1f3b18aef624	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5565-95f2-7b4e-57439a40c2ba	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5565-95f2-be5d-bf06b7de542b	AM	ARM	051	Armenia 	Armenija	\N
00040000-5565-95f2-137b-66ac5b95d8a0	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5565-95f2-5d35-4761e50fda57	AU	AUS	036	Australia 	Avstralija	\N
00040000-5565-95f2-b899-b7888bc0797b	AT	AUT	040	Austria 	Avstrija	\N
00040000-5565-95f2-c1a4-834c34565fce	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5565-95f2-2dbc-87593d82bb5d	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5565-95f2-b3b5-638b79c84647	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5565-95f2-c7ff-74fe12916887	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5565-95f2-31d0-28fc0ed1ba65	BB	BRB	052	Barbados 	Barbados	\N
00040000-5565-95f2-6948-4aca2f944220	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5565-95f2-e959-e948b3df59c2	BE	BEL	056	Belgium 	Belgija	\N
00040000-5565-95f2-5c36-bb9e6c581d7d	BZ	BLZ	084	Belize 	Belize	\N
00040000-5565-95f2-73c1-fc7b5db2ae07	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5565-95f2-9fdc-a2922af5e17a	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5565-95f2-2b36-687225c49fd2	BT	BTN	064	Bhutan 	Butan	\N
00040000-5565-95f2-07d7-75cfe7f7dcb6	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5565-95f2-58dc-b2edb33a0e95	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5565-95f2-5e37-c6ea8037a73a	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5565-95f2-0723-a87daa8543bb	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5565-95f2-ea6a-35e45c3b209d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5565-95f2-90b3-14a70578a415	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5565-95f2-9c0b-05d27d21a6c3	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5565-95f2-3171-7ec8be05443c	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5565-95f2-c271-fc9af3b959ee	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5565-95f2-9ee7-42855ffc6742	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5565-95f2-8daa-f10a08a335ef	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5565-95f2-490a-9978262e5e80	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5565-95f2-6dd4-172a399dbe40	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5565-95f2-dc76-392d5e2dc981	CA	CAN	124	Canada 	Kanada	\N
00040000-5565-95f2-98b0-aaff0d84bd8d	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5565-95f2-48af-9dab1e58ecb5	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5565-95f2-4493-e6eef66bbe1b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5565-95f2-1f00-9dca8168c4e5	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5565-95f2-3ac2-7fff74d4d45f	CL	CHL	152	Chile 	Čile	\N
00040000-5565-95f2-f13d-8c57a6e8f409	CN	CHN	156	China 	Kitajska	\N
00040000-5565-95f2-a112-b5d13e656d37	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5565-95f2-1f41-f6b50efaf02b	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5565-95f2-bff8-cb6b780ba0a2	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5565-95f2-9845-39efc2659862	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5565-95f2-7408-436c5cfde114	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5565-95f2-c9ed-7669c3856fa5	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5565-95f2-daae-0b61afb1360a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5565-95f2-4f7b-3c8420ae9b99	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5565-95f2-4a5a-6550877a8c8c	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5565-95f2-5b73-6dce37cededf	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5565-95f2-d190-205dd3d26ecd	CU	CUB	192	Cuba 	Kuba	\N
00040000-5565-95f2-cbdd-2816458984a1	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5565-95f2-8773-ab08294a29e9	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5565-95f2-7e27-2ab81ccee068	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5565-95f2-1c02-81c57c2bb2bc	DK	DNK	208	Denmark 	Danska	\N
00040000-5565-95f2-de12-5d51444ed555	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5565-95f2-ae0a-3907855b8634	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5565-95f2-792a-9f6a7e9ee204	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5565-95f2-e94c-7b96e44efc3c	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5565-95f2-7374-ee2041dc400a	EG	EGY	818	Egypt 	Egipt	\N
00040000-5565-95f2-569c-9994a24bc567	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5565-95f2-8b15-f5cdf070c77a	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5565-95f2-b421-21ce9c52189d	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5565-95f2-5769-f27099f10b94	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5565-95f2-6af3-1eb490dae499	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5565-95f2-d812-4a094673101f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5565-95f2-201a-c96acf421592	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5565-95f2-152e-46838bdf3b12	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5565-95f2-4bd0-bdcff707dc7a	FI	FIN	246	Finland 	Finska	\N
00040000-5565-95f2-0cab-4c7cb1745592	FR	FRA	250	France 	Francija	\N
00040000-5565-95f2-5307-61cbb0b88e4d	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5565-95f2-7128-cbcc4b234245	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5565-95f2-e48d-eb5f04477883	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5565-95f2-cd8f-c3b73ffc8cc8	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5565-95f2-92f7-24d4cd60bec0	GA	GAB	266	Gabon 	Gabon	\N
00040000-5565-95f2-df32-d41899d42fea	GM	GMB	270	Gambia 	Gambija	\N
00040000-5565-95f2-5264-368a52e34f44	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5565-95f2-8e60-db44854b7721	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5565-95f2-f5f1-f38f7e32d3dd	GH	GHA	288	Ghana 	Gana	\N
00040000-5565-95f2-8be0-83ee99b37f9c	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5565-95f2-dfe2-9574545ee51f	GR	GRC	300	Greece 	Grčija	\N
00040000-5565-95f2-f816-77d376ba1247	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5565-95f2-b3c7-ae2809c2e73c	GD	GRD	308	Grenada 	Grenada	\N
00040000-5565-95f2-343e-bfbb2264493e	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5565-95f2-2b3a-e9d886b30ad0	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5565-95f2-b960-ad74406b2ab3	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5565-95f2-197c-a1f4a5e08ebb	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5565-95f2-8984-32effe361cf1	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5565-95f2-65f5-9d56b5657632	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5565-95f2-c9c8-e0ad7c1428d4	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5565-95f2-2f50-a442ad3de9fd	HT	HTI	332	Haiti 	Haiti	\N
00040000-5565-95f2-7182-2f715362dfc5	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5565-95f2-bb30-b27c493aefdc	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5565-95f2-009f-7cea44f1bfe6	HN	HND	340	Honduras 	Honduras	\N
00040000-5565-95f2-353f-cedf30f5f937	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5565-95f2-2709-af1a40dab40e	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5565-95f2-5ec6-d52df726fde7	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5565-95f2-18f8-8afa8a161533	IN	IND	356	India 	Indija	\N
00040000-5565-95f2-5640-dda3727ed091	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5565-95f2-7b08-e682546edcb2	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5565-95f2-39f8-314d9872300d	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5565-95f2-4407-4cfefac2a426	IE	IRL	372	Ireland 	Irska	\N
00040000-5565-95f2-b64e-f2521b6e8d6b	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5565-95f2-95de-cc8f84b2f9d4	IL	ISR	376	Israel 	Izrael	\N
00040000-5565-95f2-6ebb-34436c6e30ed	IT	ITA	380	Italy 	Italija	\N
00040000-5565-95f2-3aba-72ff2a69741d	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5565-95f2-6491-143948fb5e1f	JP	JPN	392	Japan 	Japonska	\N
00040000-5565-95f2-54a9-7303e503abe8	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5565-95f2-4511-1cad8774993c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5565-95f2-fb14-02d5cb251a7c	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5565-95f2-3b2b-079f1cb2bb14	KE	KEN	404	Kenya 	Kenija	\N
00040000-5565-95f2-3314-4e6d315d487c	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5565-95f2-9230-10e4e446d665	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5565-95f2-ebe1-6a5002eb93e2	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5565-95f2-1661-15ea9edd8f13	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5565-95f2-002f-39a65aa679ed	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5565-95f2-3979-6f7aa9cb60c9	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5565-95f2-9678-509de9dc7bbd	LV	LVA	428	Latvia 	Latvija	\N
00040000-5565-95f2-2dee-fba3a77491f2	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5565-95f2-573a-e7feda0d7d38	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5565-95f2-5dc4-073756a85f78	LR	LBR	430	Liberia 	Liberija	\N
00040000-5565-95f2-c5d4-1ab44dbd0e73	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5565-95f2-dfda-78ec2e5dd330	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5565-95f2-3668-90567ab511da	LT	LTU	440	Lithuania 	Litva	\N
00040000-5565-95f2-c12b-62fdd2a60992	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5565-95f2-680f-0e5883c64f59	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5565-95f2-45a5-8ac59aa5dcc0	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5565-95f2-e3df-8aee89574b98	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5565-95f2-e3ed-7fef76f73515	MW	MWI	454	Malawi 	Malavi	\N
00040000-5565-95f2-79b9-8426fa3ddee9	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5565-95f2-5f34-715aac23136f	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5565-95f2-a54f-602ccb6381bb	ML	MLI	466	Mali 	Mali	\N
00040000-5565-95f2-5c0a-44801946638a	MT	MLT	470	Malta 	Malta	\N
00040000-5565-95f2-1f91-df9c25f3b3d6	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5565-95f2-70b4-3acb06985153	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5565-95f2-697d-569c01cbf417	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5565-95f2-599f-0eee87cb2732	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5565-95f2-48f1-ba66a64f9b37	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5565-95f2-4b64-fe4ce7323c26	MX	MEX	484	Mexico 	Mehika	\N
00040000-5565-95f2-0c90-42766fd28c54	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5565-95f2-ae95-a749e4582765	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5565-95f2-2f27-4f6f99efaeae	MC	MCO	492	Monaco 	Monako	\N
00040000-5565-95f2-a689-d3a40bd0e428	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5565-95f2-d3a5-90d02c533506	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5565-95f2-168e-cb4c536037b2	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5565-95f2-41cf-ca232d177e7d	MA	MAR	504	Morocco 	Maroko	\N
00040000-5565-95f2-4222-ec5fbbdac7c6	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5565-95f2-7330-84abb5f23151	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5565-95f2-4e88-ed2be3708c64	NA	NAM	516	Namibia 	Namibija	\N
00040000-5565-95f2-223b-87285bf3e383	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5565-95f2-d360-9ddd70d4e124	NP	NPL	524	Nepal 	Nepal	\N
00040000-5565-95f2-f51e-36521e8910fa	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5565-95f2-484d-17b2c7383cb3	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5565-95f2-f435-d97d83005aeb	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5565-95f2-7e98-bf8619b146a8	NE	NER	562	Niger 	Niger 	\N
00040000-5565-95f2-fd84-288e8533a099	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5565-95f2-3e0c-6db82677d5b2	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5565-95f2-6bfc-d6fb72d1d09b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5565-95f2-d5be-c12427cc79d8	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5565-95f2-7ba6-256763b59648	NO	NOR	578	Norway 	Norveška	\N
00040000-5565-95f2-8653-0b45df8b0731	OM	OMN	512	Oman 	Oman	\N
00040000-5565-95f2-af01-5d30051bd441	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5565-95f2-886d-81c439417e91	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5565-95f2-5c38-ec0e1b863562	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5565-95f2-68b5-285ceb54fde7	PA	PAN	591	Panama 	Panama	\N
00040000-5565-95f2-f2ab-98c076b5b3c2	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5565-95f2-160e-9defbc2ab8f1	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5565-95f2-ac03-7190033797e6	PE	PER	604	Peru 	Peru	\N
00040000-5565-95f2-f588-d28a84aea838	PH	PHL	608	Philippines 	Filipini	\N
00040000-5565-95f2-281e-f4e4a8e0b9b8	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5565-95f2-208e-051018424680	PL	POL	616	Poland 	Poljska	\N
00040000-5565-95f2-aecf-698a44ac5040	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5565-95f2-ea0e-ae54a7db05e5	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5565-95f2-3764-5af9c3257b29	QA	QAT	634	Qatar 	Katar	\N
00040000-5565-95f2-7721-7cf46db4ec5b	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5565-95f2-1247-d08ee65026eb	RO	ROU	642	Romania 	Romunija	\N
00040000-5565-95f2-6cba-6f7dd071c46e	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5565-95f2-c8f7-6bcc77e6f415	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5565-95f2-be7e-52204057a83b	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5565-95f2-6587-780e0ec261da	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5565-95f2-7344-c3086560cc54	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5565-95f2-9db9-0d5f89f6c289	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5565-95f2-2c3a-7d4a863c613e	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5565-95f2-7f06-9015e2bd1ea0	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5565-95f2-0a62-a93f42a484b2	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5565-95f2-0ea5-c1a88f526c7b	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5565-95f2-409e-492bdfd12e16	SM	SMR	674	San Marino 	San Marino	\N
00040000-5565-95f2-cbb0-b29b01f0739c	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5565-95f2-519a-6b41691d007d	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5565-95f2-7f78-7443cac5fb8a	SN	SEN	686	Senegal 	Senegal	\N
00040000-5565-95f2-5d73-d7dc26b4d0d5	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5565-95f2-3d6a-c96f0db97d54	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5565-95f2-2ab0-a2c9d6631da1	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5565-95f2-4759-8bb2928b7c9c	SG	SGP	702	Singapore 	Singapur	\N
00040000-5565-95f2-8125-4d7afa5b468d	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5565-95f2-0db6-6360cd167f20	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5565-95f2-d22c-089140dccf99	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5565-95f2-6c20-af5e02bcf0ce	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5565-95f2-e9bd-198cb3339fb4	SO	SOM	706	Somalia 	Somalija	\N
00040000-5565-95f2-b95d-61908dcc6a06	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5565-95f2-4f32-1c1a5acf5d1a	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5565-95f2-2448-3255fa43cf5c	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5565-95f2-b984-cd25df2e30bc	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5565-95f2-b001-4f3922354dbe	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5565-95f2-b18b-e7b813f0ad9c	SD	SDN	729	Sudan 	Sudan	\N
00040000-5565-95f2-36c9-a5d11da550f9	SR	SUR	740	Suriname 	Surinam	\N
00040000-5565-95f2-1508-7d9e230d10dd	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5565-95f2-d160-9fc9d9ab8b8c	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5565-95f2-92bc-3349c5304191	SE	SWE	752	Sweden 	Švedska	\N
00040000-5565-95f2-4375-d2d7ee9bf7a4	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5565-95f2-300f-c3fe738e1c93	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5565-95f2-b77f-d99368dc4121	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5565-95f2-6b50-d8c7ab073745	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5565-95f2-67d6-768be342c6d5	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5565-95f2-d7c9-6db713024870	TH	THA	764	Thailand 	Tajska	\N
00040000-5565-95f2-ace0-b57c70b5164d	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5565-95f2-5c8b-1dac1ec41ded	TG	TGO	768	Togo 	Togo	\N
00040000-5565-95f2-7205-530baac31ab6	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5565-95f2-b456-caa5337b42c7	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5565-95f2-d359-e1bb5648cdf2	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5565-95f2-96cf-69054220bf8a	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5565-95f2-79cf-a2c34e79f2f4	TR	TUR	792	Turkey 	Turčija	\N
00040000-5565-95f2-d54e-0d9ddfdd1ce1	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5565-95f2-c83a-b294eac0497e	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5565-95f2-bd9e-a86dc7dd0200	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5565-95f2-6ee6-b29ce5f301a1	UG	UGA	800	Uganda 	Uganda	\N
00040000-5565-95f2-bd08-3504e78a139b	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5565-95f2-aa7e-d1145b8530a8	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5565-95f2-6294-c06f764c0290	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5565-95f2-9109-e07ba31f557b	US	USA	840	United States 	Združene države Amerike	\N
00040000-5565-95f2-f905-7d508c41b85e	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5565-95f2-85c6-5cb00aa7157f	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5565-95f2-9532-ba3e9a8d2e54	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5565-95f2-adc1-1654c5efbae1	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5565-95f2-f869-9bf4f2d1e603	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5565-95f2-6b30-9250b58c0fea	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5565-95f2-6b3d-90d3912a05ce	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5565-95f2-2e97-ecb2349ad4e5	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5565-95f2-b372-d54a8070a51d	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5565-95f2-a3c7-ce431b340b0e	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5565-95f2-b6f6-bb6a051dd949	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5565-95f2-1fdb-d761378311c6	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5565-95f2-d3a4-e48e1dda8ee5	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2733 (class 0 OID 5255632)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj) FROM stdin;
000d0000-5565-95f3-c0c4-31dc08c48c21	000e0000-5565-95f3-645d-8af5bf24f5ac	\N	000f0000-5565-95f2-65a4-69f16459dbe6	igralec	Hipolita	glavna vloga	velika	t	6	t	t	\N
000d0000-5565-95f3-d7d4-948d2892b58a	000e0000-5565-95f3-645d-8af5bf24f5ac	\N	000f0000-5565-95f2-65a4-69f16459dbe6	igralec	Tezej	glavna vloga	velika	t	5	t	t	\N
000d0000-5565-95f3-9170-d6f420c1fa8b	000e0000-5565-95f3-645d-8af5bf24f5ac	\N	000f0000-5565-95f2-19b9-fc1730637a7c	umetnik	Režija		velika	t	8	t	t	\N
\.


--
-- TOC entry 2712 (class 0 OID 5255456)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2716 (class 0 OID 5255500)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2710 (class 0 OID 5255436)
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
-- TOC entry 2722 (class 0 OID 5255549)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2726 (class 0 OID 5255574)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2707 (class 0 OID 5255393)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5565-95f3-6ed1-6d4dc95f67f9	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5565-95f3-aacc-f46670da79b9	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5565-95f3-3c22-d473dddcc212	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5565-95f3-dcec-841b68aff093	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5565-95f3-c92d-4a53733f6dfa	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5565-95f3-4bdd-0e386731f053	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5565-95f3-1b1b-356163427c20	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5565-95f3-fdb5-3db7abdddcc4	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5565-95f3-2744-c39bc8a74ddf	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5565-95f3-6192-d89fce7a8507	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5565-95f3-66bc-3204b39531d9	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5565-95f3-4ebe-b46d8c8b4ea5	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5565-95f3-812e-c3825579c2bc	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5565-95f3-7c59-c24e11fd1fa4	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5565-95f3-d4fb-5f2ae38b1804	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2701 (class 0 OID 5255308)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5565-95f3-3489-afe7580844b9	00000000-5565-95f3-c92d-4a53733f6dfa	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5565-95f3-afa8-81de23ceeac4	00000000-5565-95f3-c92d-4a53733f6dfa	00010000-5565-95f3-8e3f-b31827aacb08	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5565-95f3-a32d-2775dafdbfb4	00000000-5565-95f3-4bdd-0e386731f053	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2702 (class 0 OID 5255319)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, sifra, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5565-95f3-8737-1488af4de532	\N	0001	g.	Janez	Novak	a	Peter	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5565-95f3-d414-1c010b2dfd9d	\N	0002	dr.	Anton	Horvat	b			anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5565-95f3-184f-9dd395dc0972	\N	0003		Ivan	Kovačič	c			ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5565-95f3-bbf5-e9be74b810f7	\N	0004	prof.	Jožef	Krajnc	d		Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5565-95f3-e0a7-fc86f498e8da	\N	0005		Marko	Zupančič	e			marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5565-95f3-53fc-a2838cfe85a7	\N	0006	ga.	Marija	Kovač	f			marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5565-95f3-badf-6df0bbd73b31	\N	0007	ga.	Ana	Potočnik	g			ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5565-95f3-0fb8-6cfcab3caadc	\N	0008	ga.	Maja	Mlakar	h			maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5565-95f3-c598-43a97b2d157d	\N	0009		Irena	Kos	i			irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5565-95f3-0d87-88cf7e462af5	\N	0010		Mojca	Vidmar	J			mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5565-95f3-7f23-db0b84a961b4	\N	0011		xx	write protected12345	\N			xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2692 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2697 (class 0 OID 5255273)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5565-95f2-53c3-f111534d33b3	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5565-95f2-67e2-7d61fb1c390b	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5565-95f2-fc80-ca45d9ffcf79	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5565-95f2-3403-0c4fcff970c6	Abonma-read	Abonma - branje	f
00030000-5565-95f2-bc81-e94c72b88e5d	Abonma-write	Abonma - spreminjanje	f
00030000-5565-95f2-e2fd-fa1d7c77e569	Alternacija-read	Alternacija - branje	f
00030000-5565-95f2-15a9-6a1a5f32b802	Alternacija-write	Alternacija - spreminjanje	f
00030000-5565-95f2-7c6f-a6d62d6e0c0c	Arhivalija-read	Arhivalija - branje	f
00030000-5565-95f2-5857-b6b359d5cd6a	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5565-95f2-8dc2-575c4778fbbd	Besedilo-read	Besedilo - branje	f
00030000-5565-95f2-8c00-91e772de7374	Besedilo-write	Besedilo - spreminjanje	f
00030000-5565-95f2-124a-ff34d4deb0d4	DogodekIzven-read	DogodekIzven - branje	f
00030000-5565-95f2-05ae-7bd7aec55c03	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5565-95f2-84e2-8a7253ca6d50	Dogodek-read	Dogodek - branje	f
00030000-5565-95f2-68d6-39791995a1a8	Dogodek-write	Dogodek - spreminjanje	f
00030000-5565-95f2-1b89-7c04417e434f	Drzava-read	Drzava - branje	f
00030000-5565-95f2-9944-67c29b9b3650	Drzava-write	Drzava - spreminjanje	f
00030000-5565-95f2-459b-7188b8571eed	Funkcija-read	Funkcija - branje	f
00030000-5565-95f2-f992-66048c8b4ef4	Funkcija-write	Funkcija - spreminjanje	f
00030000-5565-95f2-ecf6-8cf587fcfa76	Gostovanje-read	Gostovanje - branje	f
00030000-5565-95f2-5a3d-0fc8243d549b	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5565-95f2-50ed-a6f72ae514c1	Gostujoca-read	Gostujoca - branje	f
00030000-5565-95f2-6825-c104385f97ec	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5565-95f2-5f2e-1f732ad83ba6	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5565-95f2-c16b-a94913b51526	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5565-95f2-309b-d62c871eedc8	Kupec-read	Kupec - branje	f
00030000-5565-95f2-333c-f155f1aedc0e	Kupec-write	Kupec - spreminjanje	f
00030000-5565-95f2-dcfa-95dd639982a3	NacinPlacina-read	NacinPlacina - branje	f
00030000-5565-95f2-b460-aa11d22a8e9c	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5565-95f2-f826-9cd8fc8d825b	Option-read	Option - branje	f
00030000-5565-95f2-bb14-a900b33d92ca	Option-write	Option - spreminjanje	f
00030000-5565-95f2-380d-1e29fb5cee00	OptionValue-read	OptionValue - branje	f
00030000-5565-95f2-84ec-3444efc9e83e	OptionValue-write	OptionValue - spreminjanje	f
00030000-5565-95f2-8430-349880a9a19c	Oseba-read	Oseba - branje	f
00030000-5565-95f2-9571-205e6316ec30	Oseba-write	Oseba - spreminjanje	f
00030000-5565-95f2-b847-e9bb1d51bb60	Permission-read	Permission - branje	f
00030000-5565-95f2-f816-490ffdbde7c6	Permission-write	Permission - spreminjanje	f
00030000-5565-95f2-337b-d6becc274f3f	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5565-95f2-8cfe-c0e84f3c9e83	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5565-95f2-89ed-759834142269	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5565-95f2-60c0-cdc93a0982b4	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5565-95f2-3786-a353bb9dd78e	Pogodba-read	Pogodba - branje	f
00030000-5565-95f2-19c7-1f1cc87db5b4	Pogodba-write	Pogodba - spreminjanje	f
00030000-5565-95f2-07e3-948b82ab36a7	Popa-read	Popa - branje	f
00030000-5565-95f2-f694-5c94ad604597	Popa-write	Popa - spreminjanje	f
00030000-5565-95f2-f284-7704a18dd1c7	Posta-read	Posta - branje	f
00030000-5565-95f2-7f4c-fe59a357e201	Posta-write	Posta - spreminjanje	f
00030000-5565-95f2-1672-95ebdbbadc06	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5565-95f2-1dfe-7db7b1ce3c32	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5565-95f2-982e-d6c4d95153df	PostniNaslov-read	PostniNaslov - branje	f
00030000-5565-95f2-51d1-680a878ce438	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5565-95f2-f04d-9bee6c36dc53	Predstava-read	Predstava - branje	f
00030000-5565-95f2-c9d9-52cb2556a326	Predstava-write	Predstava - spreminjanje	f
00030000-5565-95f2-ef9d-3bf7e9ae593e	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5565-95f2-7e15-71ae6d3a5190	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5565-95f2-90ae-7e84bde5ef24	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5565-95f2-3f0e-f42eb6aaec31	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5565-95f2-2497-b63fdbb61c3f	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5565-95f2-39dc-cfa84aa6ab5c	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5565-95f2-5265-c32dd44978c6	Prostor-read	Prostor - branje	f
00030000-5565-95f2-319d-528048b49244	Prostor-write	Prostor - spreminjanje	f
00030000-5565-95f2-0ae7-afc8baef9515	Racun-read	Racun - branje	f
00030000-5565-95f2-ced4-da94fec6bb63	Racun-write	Racun - spreminjanje	f
00030000-5565-95f2-ff51-4a6600557ae0	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5565-95f2-e75c-a24c577ad4d3	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5565-95f2-94e9-83e4b8a0f787	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5565-95f2-b5ce-42de71382962	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5565-95f2-3724-92697fe424b4	Rekvizit-read	Rekvizit - branje	f
00030000-5565-95f2-fc72-5fdf156a8210	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5565-95f2-2321-fad7a0c9c125	Revizija-read	Revizija - branje	f
00030000-5565-95f2-4dcc-8b5cff0a1f2a	Revizija-write	Revizija - spreminjanje	f
00030000-5565-95f2-96e8-fbb7f14052dd	Rezervacija-read	Rezervacija - branje	f
00030000-5565-95f2-7a09-d4b2da107acb	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5565-95f2-815c-3697fecd8576	Role-read	Role - branje	f
00030000-5565-95f2-762a-5484eedf9ebb	Role-write	Role - spreminjanje	f
00030000-5565-95f2-e6d5-eebfe523a8e0	SedezniRed-read	SedezniRed - branje	f
00030000-5565-95f2-083e-a3da30f459cc	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5565-95f2-c5c2-59bf09fed1ba	Sedez-read	Sedez - branje	f
00030000-5565-95f2-25e1-41be828ac9ff	Sedez-write	Sedez - spreminjanje	f
00030000-5565-95f2-7914-1761f0e39483	Sezona-read	Sezona - branje	f
00030000-5565-95f2-721c-c0664b7ca858	Sezona-write	Sezona - spreminjanje	f
00030000-5565-95f2-5e37-827d2f5f7d2d	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5565-95f2-eaba-db2bb0d3c676	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5565-95f2-0fbf-efbbe5c347be	Stevilcenje-read	Stevilcenje - branje	f
00030000-5565-95f2-433f-e6f35c905bcc	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5565-95f2-ca62-bc14b54a8706	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5565-95f2-7a8b-f7d9292e3f1d	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5565-95f2-124f-25aa1aaf7945	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5565-95f2-5363-bf5624f12f31	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5565-95f2-d36f-3d9040d6a6ef	Telefonska-read	Telefonska - branje	f
00030000-5565-95f2-9963-678640286198	Telefonska-write	Telefonska - spreminjanje	f
00030000-5565-95f2-d3ee-5e19a072959c	TerminStoritve-read	TerminStoritve - branje	f
00030000-5565-95f2-48a3-67959e03bea1	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5565-95f2-1441-49d37edb2f41	TipFunkcije-read	TipFunkcije - branje	f
00030000-5565-95f2-525b-1f8f20a5f473	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5565-95f2-0f7f-aa01b0c81c3b	Trr-read	Trr - branje	f
00030000-5565-95f2-aad9-466a72f4dce7	Trr-write	Trr - spreminjanje	f
00030000-5565-95f2-f860-96b67f9ecdea	Uprizoritev-read	Uprizoritev - branje	f
00030000-5565-95f2-7e21-031ce591923c	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5565-95f2-9cfc-9dd40ab23613	User-read	User - branje	f
00030000-5565-95f2-4d32-e03fb3e3bf99	User-write	User - spreminjanje	f
00030000-5565-95f2-8a75-40150ff00c6b	Vaja-read	Vaja - branje	f
00030000-5565-95f2-f2bb-2773ec012390	Vaja-write	Vaja - spreminjanje	f
00030000-5565-95f2-207f-efeee4df8d28	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5565-95f2-c266-d6e75fa3225e	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5565-95f2-6061-a84bda7c815b	Zaposlitev-read	Zaposlitev - branje	f
00030000-5565-95f2-8fb2-5dc76b24aad8	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5565-95f2-449d-a40cf617ef98	Zasedenost-read	Zasedenost - branje	f
00030000-5565-95f2-56a3-da691e753d67	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5565-95f2-8f32-fa3e79187a9c	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5565-95f2-f76d-f8301f56345d	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5565-95f2-599d-512f4324a9c9	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5565-95f3-3fd6-df767fa7def9	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2699 (class 0 OID 5255292)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5565-95f3-4536-c38f6d4d9dde	00030000-5565-95f2-1b89-7c04417e434f
00020000-5565-95f3-aa75-4d5a0ee53c68	00030000-5565-95f2-9944-67c29b9b3650
00020000-5565-95f3-aa75-4d5a0ee53c68	00030000-5565-95f2-1b89-7c04417e434f
\.


--
-- TOC entry 2727 (class 0 OID 5255581)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2731 (class 0 OID 5255612)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2743 (class 0 OID 5255745)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2704 (class 0 OID 5255350)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5565-95f3-3456-126b344d6930	00040000-5565-95f2-f270-ada915d74d1a	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5565-95f3-a021-57e5d58b7345	00040000-5565-95f2-f270-ada915d74d1a	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2706 (class 0 OID 5255385)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5565-95f2-fb98-0545740ae4d7	8341	Adlešiči
00050000-5565-95f2-d24a-85e9522c0f45	5270	Ajdovščina
00050000-5565-95f2-e1d9-dca58f93b806	6280	Ankaran/Ancarano
00050000-5565-95f2-7b4d-14d67c27b5e7	9253	Apače
00050000-5565-95f2-33bb-15784750fd2d	8253	Artiče
00050000-5565-95f2-b46f-80fe213c8ec4	4275	Begunje na Gorenjskem
00050000-5565-95f2-2553-53dfa2395e11	1382	Begunje pri Cerknici
00050000-5565-95f2-11fb-471022fc18d4	9231	Beltinci
00050000-5565-95f2-a637-d2e2e9f4ca22	2234	Benedikt
00050000-5565-95f2-c3b5-ade0d913e845	2345	Bistrica ob Dravi
00050000-5565-95f2-8e52-a56bf339fca2	3256	Bistrica ob Sotli
00050000-5565-95f2-645c-80ff27bb9592	8259	Bizeljsko
00050000-5565-95f2-754b-591a86c490a6	1223	Blagovica
00050000-5565-95f2-0304-560bbb4ccac5	8283	Blanca
00050000-5565-95f2-6008-bf3b489acd1a	4260	Bled
00050000-5565-95f2-7e87-fdd9a49ef60b	4273	Blejska Dobrava
00050000-5565-95f2-6da2-51a349a67865	9265	Bodonci
00050000-5565-95f2-f163-88a93c776760	9222	Bogojina
00050000-5565-95f2-39dc-84cacdf04de5	4263	Bohinjska Bela
00050000-5565-95f2-8553-4e255d79ce72	4264	Bohinjska Bistrica
00050000-5565-95f2-dd1a-c2545b2a9554	4265	Bohinjsko jezero
00050000-5565-95f2-3230-a3598b1d1523	1353	Borovnica
00050000-5565-95f2-71f7-a09580222486	8294	Boštanj
00050000-5565-95f2-955c-570b4694bdbe	5230	Bovec
00050000-5565-95f2-270c-633fa9ca8eec	5295	Branik
00050000-5565-95f2-f273-5dfe4a6b45a6	3314	Braslovče
00050000-5565-95f2-0cf2-05e6522e2704	5223	Breginj
00050000-5565-95f2-9f0e-513759bc7078	8280	Brestanica
00050000-5565-95f2-ec6b-1fc70692680f	2354	Bresternica
00050000-5565-95f2-790e-a1d342b66268	4243	Brezje
00050000-5565-95f2-2e0e-6deb6d391281	1351	Brezovica pri Ljubljani
00050000-5565-95f2-a0c6-be0c459d1572	8250	Brežice
00050000-5565-95f2-8e65-a00536014a05	4210	Brnik - Aerodrom
00050000-5565-95f2-177e-b5303c90c800	8321	Brusnice
00050000-5565-95f2-0d5b-a9c859ef3e6b	3255	Buče
00050000-5565-95f2-d9d7-a0c7426ece9c	8276	Bučka 
00050000-5565-95f2-0138-799c56bfd104	9261	Cankova
00050000-5565-95f2-c476-301c704c1476	3000	Celje 
00050000-5565-95f2-9d55-63faad83ef21	3001	Celje - poštni predali
00050000-5565-95f2-222f-80f8d6429a97	4207	Cerklje na Gorenjskem
00050000-5565-95f2-8316-4b4b8870f296	8263	Cerklje ob Krki
00050000-5565-95f2-6cff-aaa5231e632f	1380	Cerknica
00050000-5565-95f2-3081-91426cc61c7e	5282	Cerkno
00050000-5565-95f2-bcca-9d059c47f1f8	2236	Cerkvenjak
00050000-5565-95f2-85f3-d3a7803ec11a	2215	Ceršak
00050000-5565-95f2-ca6c-4493a3dfd6a9	2326	Cirkovce
00050000-5565-95f2-bd10-4c739fdc0c3d	2282	Cirkulane
00050000-5565-95f2-daa3-e299d4fe3835	5273	Col
00050000-5565-95f2-a852-5f7abfe69699	8251	Čatež ob Savi
00050000-5565-95f2-f29f-a35c92583507	1413	Čemšenik
00050000-5565-95f2-34e3-f1c8e6cf6e93	5253	Čepovan
00050000-5565-95f2-f614-44c519564694	9232	Črenšovci
00050000-5565-95f2-6ab9-bc029e039cee	2393	Črna na Koroškem
00050000-5565-95f2-4084-bb76d81e943b	6275	Črni Kal
00050000-5565-95f2-c451-97ba48d55acb	5274	Črni Vrh nad Idrijo
00050000-5565-95f2-547e-5910d070fe54	5262	Črniče
00050000-5565-95f2-5dbb-c4c61d10c312	8340	Črnomelj
00050000-5565-95f2-46e1-449f2798f1cb	6271	Dekani
00050000-5565-95f2-88b4-16dbbd3ef759	5210	Deskle
00050000-5565-95f2-9328-e68c9927bd95	2253	Destrnik
00050000-5565-95f2-c6f1-f685e9e3f29e	6215	Divača
00050000-5565-95f2-c737-d68b45b0a8e8	1233	Dob
00050000-5565-95f2-7500-412510df2ce7	3224	Dobje pri Planini
00050000-5565-95f2-0359-69eb12105f8e	8257	Dobova
00050000-5565-95f2-4a97-f84781f3d689	1423	Dobovec
00050000-5565-95f2-6537-90a6605e5b05	5263	Dobravlje
00050000-5565-95f2-90d1-9e2ffa0cce1d	3204	Dobrna
00050000-5565-95f2-fb8c-bc50d77658cf	8211	Dobrnič
00050000-5565-95f2-45fd-1c5c6d6f6147	1356	Dobrova
00050000-5565-95f2-405a-dfad030e90da	9223	Dobrovnik/Dobronak 
00050000-5565-95f2-5d37-274bf8947a30	5212	Dobrovo v Brdih
00050000-5565-95f2-139d-fa54565fe115	1431	Dol pri Hrastniku
00050000-5565-95f2-8425-afe49c3762f9	1262	Dol pri Ljubljani
00050000-5565-95f2-e985-4a6599c8612e	1273	Dole pri Litiji
00050000-5565-95f2-7777-a19bba702060	1331	Dolenja vas
00050000-5565-95f2-9980-2d94248c4ace	8350	Dolenjske Toplice
00050000-5565-95f2-b3cd-ccb224a32e95	1230	Domžale
00050000-5565-95f2-f804-5e6fa09d7444	2252	Dornava
00050000-5565-95f2-03a4-9dda50e8e330	5294	Dornberk
00050000-5565-95f2-ea6d-b70d164fc39b	1319	Draga
00050000-5565-95f2-51c9-7661f2d1b438	8343	Dragatuš
00050000-5565-95f2-65a1-c6fe885f9416	3222	Dramlje
00050000-5565-95f2-17d6-2cbbe1fba2a3	2370	Dravograd
00050000-5565-95f2-2300-b78f27616bed	4203	Duplje
00050000-5565-95f2-c581-c9d83d1ea786	6221	Dutovlje
00050000-5565-95f2-c413-97bbe20d525e	8361	Dvor
00050000-5565-95f2-4413-cae5797544ff	2343	Fala
00050000-5565-95f2-dd9c-3c1783dc97d6	9208	Fokovci
00050000-5565-95f2-1114-51f57b7b3a80	2313	Fram
00050000-5565-95f2-39f4-6aaf6b5d9141	3213	Frankolovo
00050000-5565-95f2-83aa-00dc56c7ca77	1274	Gabrovka
00050000-5565-95f2-6d7c-ff7f76d58f9a	8254	Globoko
00050000-5565-95f2-ec17-1d3204f96660	5275	Godovič
00050000-5565-95f2-52f9-b381d819092e	4204	Golnik
00050000-5565-95f2-2c15-f292900d5438	3303	Gomilsko
00050000-5565-95f2-3a7d-fb39839c93e8	4224	Gorenja vas
00050000-5565-95f2-1ec0-7b94bd12718a	3263	Gorica pri Slivnici
00050000-5565-95f2-0ce3-cd5de758a157	2272	Gorišnica
00050000-5565-95f2-edb8-4701f9ab3424	9250	Gornja Radgona
00050000-5565-95f2-8c8d-b474e5591933	3342	Gornji Grad
00050000-5565-95f2-8a3c-e4ef9539cfe7	4282	Gozd Martuljek
00050000-5565-95f2-9fff-71a157d23075	6272	Gračišče
00050000-5565-95f2-4c0c-f6c81ae87ee8	9264	Grad
00050000-5565-95f2-8436-913ee504de09	8332	Gradac
00050000-5565-95f2-eb7e-ed033e44248e	1384	Grahovo
00050000-5565-95f2-4fed-433b2e70f783	5242	Grahovo ob Bači
00050000-5565-95f2-9fbf-33b0bc8cd6e0	5251	Grgar
00050000-5565-95f2-40b7-ae5833e1dffd	3302	Griže
00050000-5565-95f2-f4f6-d1a44bf9b36b	3231	Grobelno
00050000-5565-95f2-23c6-3f97f88cf2df	1290	Grosuplje
00050000-5565-95f2-26df-a2883e3dde59	2288	Hajdina
00050000-5565-95f2-1909-4831e30fb4ac	8362	Hinje
00050000-5565-95f2-b1dd-732a40826da1	2311	Hoče
00050000-5565-95f2-24d7-81134b971608	9205	Hodoš/Hodos
00050000-5565-95f2-0fc1-46a44cd70210	1354	Horjul
00050000-5565-95f2-3c47-d7463746a376	1372	Hotedršica
00050000-5565-95f2-cef4-7bd20c284148	1430	Hrastnik
00050000-5565-95f2-b794-50fe3439563d	6225	Hruševje
00050000-5565-95f2-4f70-17ba0b81b3e1	4276	Hrušica
00050000-5565-95f2-745b-b7ad2034ca52	5280	Idrija
00050000-5565-95f2-9b17-bf1d6de1e4b2	1292	Ig
00050000-5565-95f2-b13e-b0af4a38979d	6250	Ilirska Bistrica
00050000-5565-95f2-7d9c-08f94714bb5a	6251	Ilirska Bistrica-Trnovo
00050000-5565-95f2-2296-9a3e0ffeb17a	1295	Ivančna Gorica
00050000-5565-95f2-1f0d-e9a9075a5f9a	2259	Ivanjkovci
00050000-5565-95f2-0549-a1808dd367c6	1411	Izlake
00050000-5565-95f2-7020-4f2077fb4c25	6310	Izola/Isola
00050000-5565-95f2-5e11-20d1433103cf	2222	Jakobski Dol
00050000-5565-95f2-7c3c-11bb6e7d2576	2221	Jarenina
00050000-5565-95f2-307e-f070b1026f83	6254	Jelšane
00050000-5565-95f2-5a85-a0fea035bfdc	4270	Jesenice
00050000-5565-95f2-03f0-9a453df1f5fb	8261	Jesenice na Dolenjskem
00050000-5565-95f2-af21-955cf485f0c8	3273	Jurklošter
00050000-5565-95f2-f4a7-9117649b6956	2223	Jurovski Dol
00050000-5565-95f2-448b-5125687d6397	2256	Juršinci
00050000-5565-95f2-79a1-7645bc735a6c	5214	Kal nad Kanalom
00050000-5565-95f2-8733-9c794473c280	3233	Kalobje
00050000-5565-95f2-fb46-f828c8304ac6	4246	Kamna Gorica
00050000-5565-95f2-a067-c8aed8a2cca4	2351	Kamnica
00050000-5565-95f2-f5e8-553b0657a9e8	1241	Kamnik
00050000-5565-95f2-f73e-29bffbcce3ca	5213	Kanal
00050000-5565-95f2-8289-27a612a60121	8258	Kapele
00050000-5565-95f2-8d7e-5ea63eb0ca55	2362	Kapla
00050000-5565-95f2-55d6-8406c1860979	2325	Kidričevo
00050000-5565-95f2-d117-a42c9f96e326	1412	Kisovec
00050000-5565-95f2-8861-7f6f7050c19f	6253	Knežak
00050000-5565-95f2-05a1-d2f7832e3ccc	5222	Kobarid
00050000-5565-95f2-8d7a-c794e84aa929	9227	Kobilje
00050000-5565-95f2-a7e8-4fa22f0a2720	1330	Kočevje
00050000-5565-95f2-daf3-b13e69b49358	1338	Kočevska Reka
00050000-5565-95f2-2c19-177823048963	2276	Kog
00050000-5565-95f2-09e0-79750a070319	5211	Kojsko
00050000-5565-95f2-ddec-3c5435ac2259	6223	Komen
00050000-5565-95f2-e3f8-49db18dd149a	1218	Komenda
00050000-5565-95f2-12a6-d3ee66185865	6000	Koper/Capodistria 
00050000-5565-95f2-3f36-db413bffe63d	6001	Koper/Capodistria - poštni predali
00050000-5565-95f2-1c3b-3191de090309	8282	Koprivnica
00050000-5565-95f2-2b2e-f802b4f673bc	5296	Kostanjevica na Krasu
00050000-5565-95f2-1de8-cfd807af81de	8311	Kostanjevica na Krki
00050000-5565-95f2-9983-34a8e4a6ebd8	1336	Kostel
00050000-5565-95f2-3066-5ba116586601	6256	Košana
00050000-5565-95f2-6c51-5dc6cfb86315	2394	Kotlje
00050000-5565-95f2-e6dc-03676d40c6e3	6240	Kozina
00050000-5565-95f2-eefc-b44173fd0a37	3260	Kozje
00050000-5565-95f2-8069-709d8eb0d151	4000	Kranj 
00050000-5565-95f2-e153-9d4810adc173	4001	Kranj - poštni predali
00050000-5565-95f2-eaed-a1c8caeca915	4280	Kranjska Gora
00050000-5565-95f2-97d5-d2e9f3d2eb22	1281	Kresnice
00050000-5565-95f2-b12a-4a5a6030e333	4294	Križe
00050000-5565-95f2-ea48-b81655b50ebd	9206	Križevci
00050000-5565-95f2-7a2b-97366169385b	9242	Križevci pri Ljutomeru
00050000-5565-95f2-bae0-5362f1ffbca5	1301	Krka
00050000-5565-95f2-223b-18743b85c2c3	8296	Krmelj
00050000-5565-95f2-fd79-50b1bcc2e47b	4245	Kropa
00050000-5565-95f2-1d55-8490f6b9b866	8262	Krška vas
00050000-5565-95f2-0899-9cc7874ebe0b	8270	Krško
00050000-5565-95f2-f469-f00f3b116f85	9263	Kuzma
00050000-5565-95f2-5a74-394ef04d6323	2318	Laporje
00050000-5565-95f2-faa9-a1a004d728dc	3270	Laško
00050000-5565-95f2-9215-2cd99f33767f	1219	Laze v Tuhinju
00050000-5565-95f2-f2fd-711162f27ce0	2230	Lenart v Slovenskih goricah
00050000-5565-95f2-6ac3-de157af1f41b	9220	Lendava/Lendva
00050000-5565-95f2-886c-1effa100478d	4248	Lesce
00050000-5565-95f2-f2d8-de1c8450329a	3261	Lesično
00050000-5565-95f2-dc37-aeed1fc82cd3	8273	Leskovec pri Krškem
00050000-5565-95f2-62bd-ce1c67d49ef8	2372	Libeliče
00050000-5565-95f2-85ad-48d34415c585	2341	Limbuš
00050000-5565-95f2-af3c-ef3359f2bfb8	1270	Litija
00050000-5565-95f2-5c9f-1dd287aef95d	3202	Ljubečna
00050000-5565-95f2-8cdb-4ff23a32d0fd	1000	Ljubljana 
00050000-5565-95f2-5d4e-fba5bef202ea	1001	Ljubljana - poštni predali
00050000-5565-95f2-8a79-88b34bf15363	1231	Ljubljana - Črnuče
00050000-5565-95f2-d22f-430ef2e0aefd	1261	Ljubljana - Dobrunje
00050000-5565-95f2-3067-22c067f9c473	1260	Ljubljana - Polje
00050000-5565-95f2-c329-6f6f07c1e9c2	1210	Ljubljana - Šentvid
00050000-5565-95f2-0f40-e4ed2b7c9b03	1211	Ljubljana - Šmartno
00050000-5565-95f2-243f-4c69ae4b7edf	3333	Ljubno ob Savinji
00050000-5565-95f2-f2d5-0b088a226d8c	9240	Ljutomer
00050000-5565-95f2-22c2-4b4787879605	3215	Loče
00050000-5565-95f2-2977-1e57a05599f2	5231	Log pod Mangartom
00050000-5565-95f2-bca2-7123ee153574	1358	Log pri Brezovici
00050000-5565-95f2-0621-c7b52ce93629	1370	Logatec
00050000-5565-95f2-3458-de52b5af430e	1371	Logatec
00050000-5565-95f2-2592-1e310d69ac35	1434	Loka pri Zidanem Mostu
00050000-5565-95f2-ff70-ff74c6a53e9f	3223	Loka pri Žusmu
00050000-5565-95f2-67ca-4a562954f2ea	6219	Lokev
00050000-5565-95f2-d586-5652fc63d5ea	1318	Loški Potok
00050000-5565-95f2-1234-fcbeb5051399	2324	Lovrenc na Dravskem polju
00050000-5565-95f2-0832-0f8e3b735763	2344	Lovrenc na Pohorju
00050000-5565-95f2-8b3c-3adaa9e93d9b	3334	Luče
00050000-5565-95f2-1418-fd453d8715f0	1225	Lukovica
00050000-5565-95f2-de6f-dfb457863f07	9202	Mačkovci
00050000-5565-95f2-2579-e8db94455ac8	2322	Majšperk
00050000-5565-95f2-e042-f6a21f7ffbd0	2321	Makole
00050000-5565-95f2-5ec4-c1e706b23a00	9243	Mala Nedelja
00050000-5565-95f2-aa3a-1d6113f4dda0	2229	Malečnik
00050000-5565-95f2-936b-163171def782	6273	Marezige
00050000-5565-95f2-f4f7-3d83d6fb8fa5	2000	Maribor 
00050000-5565-95f2-9214-5f2aa814d2db	2001	Maribor - poštni predali
00050000-5565-95f2-062b-878535f9b3ba	2206	Marjeta na Dravskem polju
00050000-5565-95f2-3ff2-bd0c0ab6269c	2281	Markovci
00050000-5565-95f2-3afd-0a4b13d61546	9221	Martjanci
00050000-5565-95f2-84dd-01d930fd7d07	6242	Materija
00050000-5565-95f2-136e-9647ff9d7efd	4211	Mavčiče
00050000-5565-95f2-0ff4-5760f225b736	1215	Medvode
00050000-5565-95f2-1848-d2c8101dc7f0	1234	Mengeš
00050000-5565-95f2-9b26-8557a8287033	8330	Metlika
00050000-5565-95f2-e4b9-930af15629b8	2392	Mežica
00050000-5565-95f2-8849-0203c828ce5a	2204	Miklavž na Dravskem polju
00050000-5565-95f2-81f7-6bad917f71ee	2275	Miklavž pri Ormožu
00050000-5565-95f2-1fc2-107f28721d54	5291	Miren
00050000-5565-95f2-c4dd-102ba8e9227e	8233	Mirna
00050000-5565-95f2-6c6f-68d195515197	8216	Mirna Peč
00050000-5565-95f2-60f4-772295117f67	2382	Mislinja
00050000-5565-95f2-36cf-94d937fcdbdb	4281	Mojstrana
00050000-5565-95f2-614e-29c92e1ef1f7	8230	Mokronog
00050000-5565-95f2-c109-ed70bf1fd36f	1251	Moravče
00050000-5565-95f2-cabe-f69979c991f8	9226	Moravske Toplice
00050000-5565-95f2-b64f-77ca429d89a6	5216	Most na Soči
00050000-5565-95f2-da43-ba0d0481f462	1221	Motnik
00050000-5565-95f2-ce39-0fbc06f2064e	3330	Mozirje
00050000-5565-95f2-adcc-3f9a6c48e844	9000	Murska Sobota 
00050000-5565-95f2-779e-4d12035457f1	9001	Murska Sobota - poštni predali
00050000-5565-95f2-8c00-89b0b636f1fc	2366	Muta
00050000-5565-95f2-6a8a-33b8a23c05f2	4202	Naklo
00050000-5565-95f2-8ea0-f145694dd4d3	3331	Nazarje
00050000-5565-95f2-316a-a6ff7f388333	1357	Notranje Gorice
00050000-5565-95f2-f0c3-da31a3504f8e	3203	Nova Cerkev
00050000-5565-95f2-b2bd-2f6ffef31324	5000	Nova Gorica 
00050000-5565-95f2-e0d7-a4e2edab873e	5001	Nova Gorica - poštni predali
00050000-5565-95f2-0d9a-314e35215cb7	1385	Nova vas
00050000-5565-95f2-2f48-d85cda3bf3be	8000	Novo mesto
00050000-5565-95f2-e873-a121a2d85382	8001	Novo mesto - poštni predali
00050000-5565-95f2-cd98-0480fb85cd10	6243	Obrov
00050000-5565-95f2-f695-ddea26d1aff3	9233	Odranci
00050000-5565-95f2-bf70-c16f4758abe0	2317	Oplotnica
00050000-5565-95f2-f93a-e1c5c469f8d9	2312	Orehova vas
00050000-5565-95f2-5826-e6442fd1877c	2270	Ormož
00050000-5565-95f2-523c-abc09ce2a875	1316	Ortnek
00050000-5565-95f2-ae0c-2952d96ec2e9	1337	Osilnica
00050000-5565-95f2-bef5-0b1b3bc6d841	8222	Otočec
00050000-5565-95f2-bd5f-4e5ab7153dba	2361	Ožbalt
00050000-5565-95f2-4a13-95a43ab8fbf8	2231	Pernica
00050000-5565-95f2-5ee1-c2d33857281d	2211	Pesnica pri Mariboru
00050000-5565-95f2-31c0-79dea1bf98a0	9203	Petrovci
00050000-5565-95f2-1d22-1644c36d5264	3301	Petrovče
00050000-5565-95f2-1aee-be2c38029ec7	6330	Piran/Pirano
00050000-5565-95f2-59b5-9f927d296344	8255	Pišece
00050000-5565-95f2-61df-c2805aa81edb	6257	Pivka
00050000-5565-95f2-30c8-5c58c5cac223	6232	Planina
00050000-5565-95f2-ddd0-c9dc3ee9cb45	3225	Planina pri Sevnici
00050000-5565-95f2-6c4c-45a52e7338ee	6276	Pobegi
00050000-5565-95f2-fb3d-d4e367f57ab8	8312	Podbočje
00050000-5565-95f2-022c-a3d877e2a611	5243	Podbrdo
00050000-5565-95f2-0c9d-139bf84e57e2	3254	Podčetrtek
00050000-5565-95f2-12fb-3eb2c131adbd	2273	Podgorci
00050000-5565-95f2-d63b-c0dd79b2cb7a	6216	Podgorje
00050000-5565-95f2-4fcd-6fcdd6717492	2381	Podgorje pri Slovenj Gradcu
00050000-5565-95f2-05b4-1053ad38a4a8	6244	Podgrad
00050000-5565-95f2-b0b0-b1d204ff9c25	1414	Podkum
00050000-5565-95f2-5bf6-4db4f977382d	2286	Podlehnik
00050000-5565-95f2-bee9-2a9888e141d4	5272	Podnanos
00050000-5565-95f2-03a0-4ed3cf614cc4	4244	Podnart
00050000-5565-95f2-31d1-28840a3eb400	3241	Podplat
00050000-5565-95f2-2688-e502edde4eae	3257	Podsreda
00050000-5565-95f2-8153-49dec36d1a48	2363	Podvelka
00050000-5565-95f2-7bcf-5db15766f175	2208	Pohorje
00050000-5565-95f2-3c78-92ce1a66bd6c	2257	Polenšak
00050000-5565-95f2-028c-b8af64a74d2e	1355	Polhov Gradec
00050000-5565-95f2-6006-3448670776ec	4223	Poljane nad Škofjo Loko
00050000-5565-95f2-d7ae-bd7d68ce600e	2319	Poljčane
00050000-5565-95f2-5010-a081e5453976	1272	Polšnik
00050000-5565-95f2-0fb1-22d296afdccd	3313	Polzela
00050000-5565-95f2-dbd0-1b24ccaef502	3232	Ponikva
00050000-5565-95f2-84ce-3cebfbfd62c4	6320	Portorož/Portorose
00050000-5565-95f2-1aef-e8d891a8cc2d	6230	Postojna
00050000-5565-95f2-b155-a670fe252384	2331	Pragersko
00050000-5565-95f2-3d3b-42b8b3d643fb	3312	Prebold
00050000-5565-95f2-486d-b462ce5fadd3	4205	Preddvor
00050000-5565-95f2-a7fc-f4becd54f512	6255	Prem
00050000-5565-95f2-bf1a-ec69fa8700e1	1352	Preserje
00050000-5565-95f2-5b91-c1d2cc98cb96	6258	Prestranek
00050000-5565-95f2-b381-d981124cb3df	2391	Prevalje
00050000-5565-95f2-c774-69acc046184c	3262	Prevorje
00050000-5565-95f2-1a56-43ebedbfa0d6	1276	Primskovo 
00050000-5565-95f2-b28b-e2129afc4802	3253	Pristava pri Mestinju
00050000-5565-95f2-b43e-f317e8584522	9207	Prosenjakovci/Partosfalva
00050000-5565-95f2-5ed9-93048977858c	5297	Prvačina
00050000-5565-95f2-41d2-ac3a5d9897ad	2250	Ptuj
00050000-5565-95f2-e935-769c02e747ce	2323	Ptujska Gora
00050000-5565-95f2-bee2-58d561f152d4	9201	Puconci
00050000-5565-95f2-0baa-d9683d2e7557	2327	Rače
00050000-5565-95f2-73bd-6ba6eb19aed6	1433	Radeče
00050000-5565-95f2-879a-fa737db80cf6	9252	Radenci
00050000-5565-95f2-fbd2-c9d457f6a8e1	2360	Radlje ob Dravi
00050000-5565-95f2-63c8-ac6a222798b4	1235	Radomlje
00050000-5565-95f2-d521-c7967267a382	4240	Radovljica
00050000-5565-95f2-089d-a225fc2723ee	8274	Raka
00050000-5565-95f2-40f5-f74fad1fc4a5	1381	Rakek
00050000-5565-95f2-1b20-6b377eab2e2c	4283	Rateče - Planica
00050000-5565-95f2-4722-7a1b43b364b3	2390	Ravne na Koroškem
00050000-5565-95f2-7106-c0a752cc8ff1	9246	Razkrižje
00050000-5565-95f2-39ae-3a078f83102a	3332	Rečica ob Savinji
00050000-5565-95f2-940c-2a91bcb01450	5292	Renče
00050000-5565-95f2-6151-04d8b13b3930	1310	Ribnica
00050000-5565-95f2-eb6c-b8065668e017	2364	Ribnica na Pohorju
00050000-5565-95f2-9782-58ceb5d1cbe1	3272	Rimske Toplice
00050000-5565-95f2-6a05-6827e10b32e1	1314	Rob
00050000-5565-95f2-0cc9-ae5ab7baf2ba	5215	Ročinj
00050000-5565-95f2-6001-866d19cf08c1	3250	Rogaška Slatina
00050000-5565-95f2-e277-174fe6b6d2df	9262	Rogašovci
00050000-5565-95f2-8130-d1f19674d499	3252	Rogatec
00050000-5565-95f2-03a1-ef6a8a08da8b	1373	Rovte
00050000-5565-95f2-a154-15925a43400d	2342	Ruše
00050000-5565-95f2-0609-2fb80ab05713	1282	Sava
00050000-5565-95f2-7ba8-115486496a71	6333	Sečovlje/Sicciole
00050000-5565-95f2-e4e1-87b20098d08d	4227	Selca
00050000-5565-95f2-35c4-114906ea7125	2352	Selnica ob Dravi
00050000-5565-95f2-9686-a56c4fed983c	8333	Semič
00050000-5565-95f2-66bb-b99c074b6536	8281	Senovo
00050000-5565-95f2-6aa6-0af6f2043ae2	6224	Senožeče
00050000-5565-95f2-4da9-8299d3e4f98d	8290	Sevnica
00050000-5565-95f2-1608-7f79b3caf727	6210	Sežana
00050000-5565-95f2-1490-ab1e30dd4a5f	2214	Sladki Vrh
00050000-5565-95f2-05bd-72279117da20	5283	Slap ob Idrijci
00050000-5565-95f2-e8bc-c65ae2327d63	2380	Slovenj Gradec
00050000-5565-95f2-09a5-10a8c2558437	2310	Slovenska Bistrica
00050000-5565-95f2-bf07-cac043a6dfbf	3210	Slovenske Konjice
00050000-5565-95f2-d6ba-96878dd6d1ee	1216	Smlednik
00050000-5565-95f2-4fc9-18823302c2d6	5232	Soča
00050000-5565-95f2-2fad-53f388c98634	1317	Sodražica
00050000-5565-95f2-2794-37d1226efbb5	3335	Solčava
00050000-5565-95f2-2984-7ff412a8ea90	5250	Solkan
00050000-5565-95f2-36f1-7710a151f8fa	4229	Sorica
00050000-5565-95f2-4931-75452d3b6e90	4225	Sovodenj
00050000-5565-95f2-8e8a-f32b735fe85e	5281	Spodnja Idrija
00050000-5565-95f2-43b7-75322d4a1d76	2241	Spodnji Duplek
00050000-5565-95f2-472c-90915d7413f8	9245	Spodnji Ivanjci
00050000-5565-95f2-52f4-bb67cd4fcd00	2277	Središče ob Dravi
00050000-5565-95f2-7490-9380a416a92e	4267	Srednja vas v Bohinju
00050000-5565-95f2-cbcf-ee05d2bafbce	8256	Sromlje 
00050000-5565-95f2-d1f8-0979f7c2ea17	5224	Srpenica
00050000-5565-95f2-67f7-4671fb9c485d	1242	Stahovica
00050000-5565-95f2-e9e9-1712067225bf	1332	Stara Cerkev
00050000-5565-95f2-2adf-38bfec006a29	8342	Stari trg ob Kolpi
00050000-5565-95f2-248a-011b9fb7ff1e	1386	Stari trg pri Ložu
00050000-5565-95f2-ca44-414b602b62aa	2205	Starše
00050000-5565-95f2-2a8a-86fa4ea7d8cf	2289	Stoperce
00050000-5565-95f2-e61d-2f3b528cf304	8322	Stopiče
00050000-5565-95f2-674c-230092040668	3206	Stranice
00050000-5565-95f2-c255-4baa1dc4a8e0	8351	Straža
00050000-5565-95f2-5836-b83671db6a95	1313	Struge
00050000-5565-95f2-ddf6-e6fb965e9edc	8293	Studenec
00050000-5565-95f2-5a4f-0be372380f50	8331	Suhor
00050000-5565-95f2-76d1-178dbbd3b0bb	2233	Sv. Ana v Slovenskih goricah
00050000-5565-95f2-b6f0-63c2ef36717c	2235	Sv. Trojica v Slovenskih goricah
00050000-5565-95f2-f0a7-db96c4c08ae4	2353	Sveti Duh na Ostrem Vrhu
00050000-5565-95f2-9faf-cf9a10279a34	9244	Sveti Jurij ob Ščavnici
00050000-5565-95f2-230f-63146e787476	3264	Sveti Štefan
00050000-5565-95f2-60cb-814eb8247d60	2258	Sveti Tomaž
00050000-5565-95f2-9ef9-6d59eb92bbf5	9204	Šalovci
00050000-5565-95f2-eec0-47c9eaae54db	5261	Šempas
00050000-5565-95f2-b8ba-af895382b794	5290	Šempeter pri Gorici
00050000-5565-95f2-7326-bb2c0061f076	3311	Šempeter v Savinjski dolini
00050000-5565-95f2-427c-ef9e38d2b563	4208	Šenčur
00050000-5565-95f2-0789-e81c0338257f	2212	Šentilj v Slovenskih goricah
00050000-5565-95f2-028d-72f860098ff7	8297	Šentjanž
00050000-5565-95f2-cdec-ce4b503e26b5	2373	Šentjanž pri Dravogradu
00050000-5565-95f2-4eb4-c6d231eb2c75	8310	Šentjernej
00050000-5565-95f2-c872-1dac1cada6f2	3230	Šentjur
00050000-5565-95f2-0d97-a25c3e7208bd	3271	Šentrupert
00050000-5565-95f2-09e1-e9efb67c21ec	8232	Šentrupert
00050000-5565-95f2-27f7-9e23bdff9c29	1296	Šentvid pri Stični
00050000-5565-95f2-1f8d-617c366d939c	8275	Škocjan
00050000-5565-95f2-b0d1-eb11d02ed15d	6281	Škofije
00050000-5565-95f2-9444-cdb4a4cfe445	4220	Škofja Loka
00050000-5565-95f2-3ab9-118b14171614	3211	Škofja vas
00050000-5565-95f2-339f-2d720f5ff30f	1291	Škofljica
00050000-5565-95f2-8828-af867a81bea7	6274	Šmarje
00050000-5565-95f2-39dd-23dee3161f1c	1293	Šmarje - Sap
00050000-5565-95f2-880e-5ad4635bf5fd	3240	Šmarje pri Jelšah
00050000-5565-95f2-495e-8d0d4ffd17bc	8220	Šmarješke Toplice
00050000-5565-95f2-c8dc-bcc0cbac379b	2315	Šmartno na Pohorju
00050000-5565-95f2-4252-2eb7cfe50d91	3341	Šmartno ob Dreti
00050000-5565-95f2-fb61-ef0e81f7b2b4	3327	Šmartno ob Paki
00050000-5565-95f2-9e54-3b3930f324e5	1275	Šmartno pri Litiji
00050000-5565-95f2-2e54-36da7bef17a4	2383	Šmartno pri Slovenj Gradcu
00050000-5565-95f2-e610-bc9ce0cb4526	3201	Šmartno v Rožni dolini
00050000-5565-95f2-abe9-87f07299004b	3325	Šoštanj
00050000-5565-95f2-09ae-a4cf1a7b6ec6	6222	Štanjel
00050000-5565-95f2-55cf-d1d6dff86ad5	3220	Štore
00050000-5565-95f2-5701-22563ca701b2	3304	Tabor
00050000-5565-95f2-b4a8-087b877b9122	3221	Teharje
00050000-5565-95f2-bcd8-c0ea80e520aa	9251	Tišina
00050000-5565-95f2-c175-a49aa3418f22	5220	Tolmin
00050000-5565-95f2-4a29-6583e69b73e2	3326	Topolšica
00050000-5565-95f2-af42-a52dc37e423f	2371	Trbonje
00050000-5565-95f2-349c-13a04207d650	1420	Trbovlje
00050000-5565-95f2-9fa0-13d64b97ac5f	8231	Trebelno 
00050000-5565-95f2-2018-a198c743be43	8210	Trebnje
00050000-5565-95f2-876e-e9e90caecb48	5252	Trnovo pri Gorici
00050000-5565-95f2-d599-c9ab0b5d4823	2254	Trnovska vas
00050000-5565-95f2-0475-1b72f38ba032	1222	Trojane
00050000-5565-95f2-645f-3f854b5997d5	1236	Trzin
00050000-5565-95f2-fce5-d4c7089fd94f	4290	Tržič
00050000-5565-95f2-ec0f-e943109dbe86	8295	Tržišče
00050000-5565-95f2-d46a-1a91f06975e3	1311	Turjak
00050000-5565-95f2-b733-28e8214de63c	9224	Turnišče
00050000-5565-95f2-6a28-b6718a4590b4	8323	Uršna sela
00050000-5565-95f2-4983-f4283b5f825b	1252	Vače
00050000-5565-95f2-8221-5927cd0dc2bf	3320	Velenje 
00050000-5565-95f2-d7a8-77c49f2174b6	3322	Velenje - poštni predali
00050000-5565-95f2-a3d5-0ba496c238c6	8212	Velika Loka
00050000-5565-95f2-fd64-9f8ca2b308de	2274	Velika Nedelja
00050000-5565-95f2-079c-6c5678c50bd1	9225	Velika Polana
00050000-5565-95f2-4ffe-a8091797d321	1315	Velike Lašče
00050000-5565-95f2-8f25-6afcc202e614	8213	Veliki Gaber
00050000-5565-95f2-aa30-2c7d3cf1433b	9241	Veržej
00050000-5565-95f2-b85c-6cf08a65dfbb	1312	Videm - Dobrepolje
00050000-5565-95f2-1d39-24303d6aabaa	2284	Videm pri Ptuju
00050000-5565-95f2-0245-4d3f5248800f	8344	Vinica
00050000-5565-95f2-b2d8-18cf853d8b68	5271	Vipava
00050000-5565-95f2-8a9c-86e3e919172b	4212	Visoko
00050000-5565-95f2-3db7-1eb8576ee0cb	1294	Višnja Gora
00050000-5565-95f2-9897-a3887e717e4c	3205	Vitanje
00050000-5565-95f2-8cba-5e55a10f6499	2255	Vitomarci
00050000-5565-95f2-c0a3-802c3f728e57	1217	Vodice
00050000-5565-95f2-1020-3a9bcd7aed33	3212	Vojnik\t
00050000-5565-95f2-a8ba-f3b1444db0c0	5293	Volčja Draga
00050000-5565-95f2-c40a-24a72be9b3de	2232	Voličina
00050000-5565-95f2-901f-887eafcdd2e6	3305	Vransko
00050000-5565-95f2-44aa-61532fe46634	6217	Vremski Britof
00050000-5565-95f2-10ca-44bb1a4e190c	1360	Vrhnika
00050000-5565-95f2-c7eb-73706989648e	2365	Vuhred
00050000-5565-95f2-ffaf-b4927d2a44be	2367	Vuzenica
00050000-5565-95f2-2d11-75bf987d43d4	8292	Zabukovje 
00050000-5565-95f2-d9f0-131994dd87b2	1410	Zagorje ob Savi
00050000-5565-95f2-d148-efb191f30100	1303	Zagradec
00050000-5565-95f2-896b-974ab72a1be7	2283	Zavrč
00050000-5565-95f2-aa93-c95efeb510a4	8272	Zdole 
00050000-5565-95f2-20e7-8507f5726683	4201	Zgornja Besnica
00050000-5565-95f2-eba6-406b7d7e75c0	2242	Zgornja Korena
00050000-5565-95f2-4e02-ceb155b5f9b9	2201	Zgornja Kungota
00050000-5565-95f2-4044-c7bdf25273e1	2316	Zgornja Ložnica
00050000-5565-95f2-0cdc-aa3cf76ddd22	2314	Zgornja Polskava
00050000-5565-95f2-b26e-34470aa16890	2213	Zgornja Velka
00050000-5565-95f2-1438-c26af1419fc1	4247	Zgornje Gorje
00050000-5565-95f2-f261-7bae8a57d92c	4206	Zgornje Jezersko
00050000-5565-95f2-f81e-a12a7ed6be63	2285	Zgornji Leskovec
00050000-5565-95f2-4e5d-294895d1e070	1432	Zidani Most
00050000-5565-95f2-0ae0-9a93681368b3	3214	Zreče
00050000-5565-95f2-12d9-dcb9fc55ddeb	4209	Žabnica
00050000-5565-95f2-cdc0-df39ecdb31c4	3310	Žalec
00050000-5565-95f2-a410-544dcd939134	4228	Železniki
00050000-5565-95f2-1541-013a36e76940	2287	Žetale
00050000-5565-95f2-2b61-ba7e8535030a	4226	Žiri
00050000-5565-95f2-33a9-4f3a8ffc9550	4274	Žirovnica
00050000-5565-95f2-9fcf-f076c135a377	8360	Žužemberk
\.


--
-- TOC entry 2723 (class 0 OID 5255555)
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
-- TOC entry 2705 (class 0 OID 5255370)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2711 (class 0 OID 5255448)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2725 (class 0 OID 5255567)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2738 (class 0 OID 5255687)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2742 (class 0 OID 5255738)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2729 (class 0 OID 5255596)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5565-95f3-5d6e-c1f0411efe54	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5565-95f3-af35-f510db50e49a	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5565-95f3-77fc-a5ea470f04e7	0003	Kazinska	t	84	Kazinska dvorana
00220000-5565-95f3-1e89-4689a82d7969	0004	Mali oder	t	24	Mali oder 
00220000-5565-95f3-7fb4-35efb6138b6c	0005	Komorni oder	t	15	Komorni oder
00220000-5565-95f3-e311-9009acb5e672	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5565-95f3-0fd4-ff1a2c55a47f	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2721 (class 0 OID 5255540)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2720 (class 0 OID 5255530)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2741 (class 0 OID 5255727)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2736 (class 0 OID 5255664)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2694 (class 0 OID 5255244)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5565-95f3-8e3f-b31827aacb08	00010000-5565-95f3-63c0-4e89bbab2eb8	2015-05-27 12:01:24	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROWWPKfE8LxQ9NI53OGpI7Ey/GU4xWe72";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2760 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2730 (class 0 OID 5255606)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2698 (class 0 OID 5255282)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5565-95f3-2368-7165f9f75f7f	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5565-95f3-35a9-8bd2f36039c2	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5565-95f3-4536-c38f6d4d9dde	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5565-95f3-d43d-9d39aabf89b6	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5565-95f3-fdb7-ab7efb058161	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5565-95f3-aa75-4d5a0ee53c68	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2696 (class 0 OID 5255266)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5565-95f3-8e3f-b31827aacb08	00020000-5565-95f3-d43d-9d39aabf89b6
00010000-5565-95f3-63c0-4e89bbab2eb8	00020000-5565-95f3-d43d-9d39aabf89b6
\.


--
-- TOC entry 2732 (class 0 OID 5255620)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2724 (class 0 OID 5255561)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2718 (class 0 OID 5255511)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2750 (class 0 OID 5255835)
-- Dependencies: 230
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5565-95f2-7bf5-be112ec7d682	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5565-95f2-c4b6-13f7fad7f201	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5565-95f2-fb2a-aeb743b7cebd	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5565-95f2-5b12-19ca80de9d9f	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5565-95f2-298f-cb088a98d46b	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2749 (class 0 OID 5255828)
-- Dependencies: 229
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5565-95f2-84de-0cf75b19ef3d	00000000-5565-95f2-5b12-19ca80de9d9f	popa
00000000-5565-95f2-94a5-c36fdddc13d4	00000000-5565-95f2-5b12-19ca80de9d9f	oseba
00000000-5565-95f2-88b6-5ae70a50c2e5	00000000-5565-95f2-c4b6-13f7fad7f201	prostor
00000000-5565-95f2-4e7f-3e4010d46658	00000000-5565-95f2-5b12-19ca80de9d9f	besedilo
00000000-5565-95f2-d402-10c3c39f5fd7	00000000-5565-95f2-5b12-19ca80de9d9f	uprizoritev
00000000-5565-95f2-2cea-f899e2a5e0ca	00000000-5565-95f2-5b12-19ca80de9d9f	funkcija
00000000-5565-95f2-0a19-679d61bdbf67	00000000-5565-95f2-5b12-19ca80de9d9f	tipfunkcije
00000000-5565-95f2-77ad-fd4bc2228aa5	00000000-5565-95f2-5b12-19ca80de9d9f	alternacija
\.


--
-- TOC entry 2748 (class 0 OID 5255823)
-- Dependencies: 228
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2737 (class 0 OID 5255674)
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
-- TOC entry 2703 (class 0 OID 5255342)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2719 (class 0 OID 5255517)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2740 (class 0 OID 5255716)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5565-95f2-65a4-69f16459dbe6	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5565-95f2-7060-e84daee6b38b	Baletnik ali plesalec	Baletniki in plesalci	\N	Baletnica ali plesalka	igralec
000f0000-5565-95f2-a73c-d621bc2302e6	Avtor	Avtorji	\N	Avtorka	umetnik
000f0000-5565-95f2-19b9-fc1730637a7c	Režiser	Režiserji	\N	Režiserka	umetnik
000f0000-5565-95f2-0cac-ebd5c6c85955	Scenograf	Scenografi	\N	Scenografka	tehnik
000f0000-5565-95f2-bccf-b42668701d14	Kostumograf	Kostumografi	\N	Kostumografinja	tehnik
000f0000-5565-95f2-45e5-8381c210efee	Oblikovalec maske	Oblikovalci maske	\N	Oblikovalka maske	tehnik
000f0000-5565-95f2-dccf-80505f82feb9	Avtor glasbe	Avtorji glasbe	\N	Avtorica glasbe	umetnik
000f0000-5565-95f2-36e4-10247941b196	Oblikovalec svetlobe	Oblikovalci svetlobe	\N	Oblikovalka svetlobe	tehnik
000f0000-5565-95f2-1754-4f1239db2d42	Koreograf	Koreografi	\N	Koreografinja	umetnik
000f0000-5565-95f2-4281-acc15275a7d0	Dramaturg	Dramaturgi	\N	Dramaturginja	umetnik
000f0000-5565-95f2-8141-a43a25039d5e	Lektorj	Lektorji	\N	Lektorica	umetnik
000f0000-5565-95f2-d1b3-6528630eafac	Prevajalec	Prevajalci	\N	Prevajalka	umetnik
000f0000-5565-95f2-717b-4e057f52a55c	Oblikovalec videa	Oblikovalci videa	\N	Oblikovalka videa	umetnik
000f0000-5565-95f2-e4da-dc8f3406a324	Intermedijski ustvarjalec	Intermedijski ustvarjalci	\N	Intermedijska ustvarjalka	umetnik
000f0000-5565-95f2-33c7-378dafaa0c11	Nerazvrščeno	Nerazvrščeno	\N	Nerazvrščeno	\N
\.


--
-- TOC entry 2708 (class 0 OID 5255405)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2695 (class 0 OID 5255253)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5565-95f3-63c0-4e89bbab2eb8	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROJqlvgZFRtmaiU9ecp4BOV6J16yXF9Re	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5565-95f3-e409-cb5db05ee24f	Jani	$2y$05$NS4xMjkyMTcwMzExMjAxROvE7mpr5y4095hWJsmyJX3HkKCbIq4fe	t	\N	\N	\N	jani@ifigenija.si	\N	\N	\N
00010000-5565-95f3-dabe-2ad7ce03eb2c	Tona	$2y$05$NS4xMjkyMTcwMzExMjAxROkcA/IUo8doKZbMJ/w/h8xgxEKO2bEMy	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5565-95f3-b8fa-017593579cf9	Ivo	$2y$05$NS4xMjkyMTcwMzExMjAxROvUqQFX1hNn6BbAqF/GTjl7QxCGP3Txq	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5565-95f3-34fe-a51da1359ac5	Jože	$2y$05$NS4xMjkyMTcwMzExMjAxRORQYKAaB8o65oaQK0Uz3rNhOmqaCPId6	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5565-95f3-d1b3-0456f498f40a	Marko	$2y$05$NS4xMjkyMTcwMzExMjAxROnf/PIEZnrB5RF3HoTuuzAdKKjsqX3u2	t	\N	\N	\N	marko@ifigenija.si	\N	\N	\N
00010000-5565-95f3-9bd6-e4013b6efa2a	Marija	$2y$05$NS4xMjkyMTcwMzExMjAxROcFl3E.mM/UhxOoVW.Z87N.q3upX6mBm	t	\N	\N	\N	marija@ifigenija.si	\N	\N	\N
00010000-5565-95f3-9869-b33365317571	Ana	$2y$05$NS4xMjkyMTcwMzExMjAxROXh54bjDaFp978z63M8BHB3ynUkxHhPG	t	\N	\N	\N	ana@ifigenija.si	\N	\N	\N
00010000-5565-95f3-385c-614c5b65b5dd	Maja	$2y$05$NS4xMjkyMTcwMzExMjAxRODF4O1PQ6yJKSpYlYG1j8u0WEfUzpG7S	t	\N	\N	\N	maja@ifigenija.si	\N	\N	\N
00010000-5565-95f3-56ab-17082aa9fb04	Irena	$2y$05$NS4xMjkyMTcwMzExMjAxROndS42S/Bn1PXMhqyAMOTgjVbMK.Wymm	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5565-95f3-fdaa-9e80d9dd5356	Mojca	$2y$05$NS4xMjkyMTcwMzExMjAxROmszDPdGVsAOHqbmr.bDyJN/EChQm.6C	t	\N	\N	\N	mojca@ifigenija.si	\N	\N	\N
00010000-5565-95f3-8e3f-b31827aacb08	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2745 (class 0 OID 5255771)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5565-95f3-3e22-796b183009e9	00160000-5565-95f3-f601-fc0b67260e2c	00150000-5565-95f2-40c7-b5f951ca288d	00140000-5565-95f2-c720-7f3e636280d1	0001	produkcija	Sen kresne noči		Sanje	2016-02-01	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5565-95f3-7fb4-35efb6138b6c
000e0000-5565-95f3-645d-8af5bf24f5ac	00160000-5565-95f3-e266-f4c1beaae76c	00150000-5565-95f2-375d-f0a46c4f12f9	00140000-5565-95f2-9917-6325577dcd5a	0002	predprodukcija-ideja	Smoletov vrt			2017-01-01	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5565-95f3-e311-9009acb5e672
\.


--
-- TOC entry 2713 (class 0 OID 5255463)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2728 (class 0 OID 5255588)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2735 (class 0 OID 5255656)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2715 (class 0 OID 5255495)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2744 (class 0 OID 5255761)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-5565-95f2-c720-7f3e636280d1	Drama	drama (SURS 01)
00140000-5565-95f2-e9b9-ef53e332733e	Opera	opera (SURS 02)
00140000-5565-95f2-8757-65f0a7ba1c96	Balet	balet (SURS 03)
00140000-5565-95f2-5449-744d4137eef8	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5565-95f2-9f53-b1651e67e50c	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5565-95f2-9917-6325577dcd5a	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5565-95f2-061b-d3c0452c032c	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2734 (class 0 OID 5255646)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-5565-95f2-99ab-ed9b36cbac00	Opera	opera
00150000-5565-95f2-afa2-c889e44f5484	Opereta	opereta
00150000-5565-95f2-a6f7-a3ba5c7eb1c4	Balet	balet
00150000-5565-95f2-a2f8-4e86364b66e5	Plesne prireditve	plesne prireditve
00150000-5565-95f2-48cb-861fd3b4050c	Lutkovno gledališče	lutkovno gledališče
00150000-5565-95f2-60f3-4ccc7abdfa27	Raziskovalno gledališče	raziskovalno gledališče
00150000-5565-95f2-67c0-d15f6925e02c	Biografska drama	biografska drama
00150000-5565-95f2-40c7-b5f951ca288d	Komedija	komedija
00150000-5565-95f2-250c-390c155ed033	Črna komedija	črna komedija
00150000-5565-95f2-3b0f-22f9d24d42fd	E-igra	E-igra
00150000-5565-95f2-375d-f0a46c4f12f9	Kriminalka	kriminalka
00150000-5565-95f2-4499-11e41d8b4cc4	Musical	musical
\.


--
-- TOC entry 2315 (class 2606 OID 5255307)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 5255816)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 5255806)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 5255715)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 5255485)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 5255510)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2348 (class 2606 OID 5255431)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 5255642)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 5255461)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 5255504)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 5255445)
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
-- TOC entry 2406 (class 2606 OID 5255553)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 5255580)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 5255403)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 5255316)
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
-- TOC entry 2321 (class 2606 OID 5255339)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2313 (class 2606 OID 5255296)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2306 (class 2606 OID 5255281)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 5255586)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 5255619)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 5255756)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2330 (class 2606 OID 5255367)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 5255391)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 5255559)
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
-- TOC entry 2336 (class 2606 OID 5255381)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2361 (class 2606 OID 5255452)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 5255571)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 5255699)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 5255743)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 5255603)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 5255544)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 5255535)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 5255737)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 5255671)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 5255252)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 5255610)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 5255270)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2308 (class 2606 OID 5255290)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 5255628)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2412 (class 2606 OID 5255566)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2387 (class 2606 OID 5255516)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 2606 OID 5255841)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 5255832)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 5255827)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 5255684)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 5255347)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 5255526)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 5255726)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 5255416)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 5255265)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 5255786)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2367 (class 2606 OID 5255470)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 5255594)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 5255662)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 5255499)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 5255770)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 5255655)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 1259 OID 5255492)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2453 (class 1259 OID 5255685)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2454 (class 1259 OID 5255686)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2328 (class 1259 OID 5255369)
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
-- TOC entry 2419 (class 1259 OID 5255587)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2413 (class 1259 OID 5255573)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2414 (class 1259 OID 5255572)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2365 (class 1259 OID 5255471)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2441 (class 1259 OID 5255645)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2442 (class 1259 OID 5255643)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2443 (class 1259 OID 5255644)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2353 (class 1259 OID 5255447)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2354 (class 1259 OID 5255446)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2470 (class 1259 OID 5255758)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2471 (class 1259 OID 5255759)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2472 (class 1259 OID 5255760)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2478 (class 1259 OID 5255791)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2479 (class 1259 OID 5255788)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2480 (class 1259 OID 5255790)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2481 (class 1259 OID 5255789)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2343 (class 1259 OID 5255418)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2344 (class 1259 OID 5255417)
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
-- TOC entry 2429 (class 1259 OID 5255611)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2383 (class 1259 OID 5255505)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2310 (class 1259 OID 5255297)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2311 (class 1259 OID 5255298)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2434 (class 1259 OID 5255631)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2435 (class 1259 OID 5255630)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2436 (class 1259 OID 5255629)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2357 (class 1259 OID 5255453)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2358 (class 1259 OID 5255455)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2359 (class 1259 OID 5255454)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2499 (class 1259 OID 5255834)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2393 (class 1259 OID 5255539)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2394 (class 1259 OID 5255537)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2395 (class 1259 OID 5255536)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2396 (class 1259 OID 5255538)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2301 (class 1259 OID 5255271)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 5255272)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2422 (class 1259 OID 5255595)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2408 (class 1259 OID 5255560)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2449 (class 1259 OID 5255672)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2450 (class 1259 OID 5255673)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2332 (class 1259 OID 5255383)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2333 (class 1259 OID 5255382)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2334 (class 1259 OID 5255384)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2457 (class 1259 OID 5255700)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2458 (class 1259 OID 5255701)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2491 (class 1259 OID 5255820)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2492 (class 1259 OID 5255819)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2493 (class 1259 OID 5255822)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2494 (class 1259 OID 5255818)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2495 (class 1259 OID 5255821)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2446 (class 1259 OID 5255663)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2399 (class 1259 OID 5255548)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2400 (class 1259 OID 5255547)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2401 (class 1259 OID 5255545)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2402 (class 1259 OID 5255546)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2284 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2487 (class 1259 OID 5255808)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2488 (class 1259 OID 5255807)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2364 (class 1259 OID 5255462)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2316 (class 1259 OID 5255318)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2317 (class 1259 OID 5255317)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2324 (class 1259 OID 5255348)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2325 (class 1259 OID 5255349)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2388 (class 1259 OID 5255529)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2389 (class 1259 OID 5255528)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2390 (class 1259 OID 5255527)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2371 (class 1259 OID 5255494)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2372 (class 1259 OID 5255490)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2373 (class 1259 OID 5255487)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2374 (class 1259 OID 5255488)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2375 (class 1259 OID 5255486)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2376 (class 1259 OID 5255491)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2377 (class 1259 OID 5255489)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2331 (class 1259 OID 5255368)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2349 (class 1259 OID 5255432)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2350 (class 1259 OID 5255434)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2351 (class 1259 OID 5255433)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2352 (class 1259 OID 5255435)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2407 (class 1259 OID 5255554)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2475 (class 1259 OID 5255757)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 5255787)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2322 (class 1259 OID 5255340)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2323 (class 1259 OID 5255341)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2505 (class 1259 OID 5255842)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2342 (class 1259 OID 5255404)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2502 (class 1259 OID 5255833)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2427 (class 1259 OID 5255605)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2428 (class 1259 OID 5255604)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2496 (class 1259 OID 5255817)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2287 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2339 (class 1259 OID 5255392)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 5255744)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2309 (class 1259 OID 5255291)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2378 (class 1259 OID 5255493)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2530 (class 2606 OID 5255975)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2533 (class 2606 OID 5255960)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2532 (class 2606 OID 5255965)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2528 (class 2606 OID 5255985)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2534 (class 2606 OID 5255955)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2529 (class 2606 OID 5255980)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2531 (class 2606 OID 5255970)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2564 (class 2606 OID 5256130)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2563 (class 2606 OID 5256135)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2515 (class 2606 OID 5255890)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2551 (class 2606 OID 5256070)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2549 (class 2606 OID 5256065)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2550 (class 2606 OID 5256060)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2527 (class 2606 OID 5255950)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2557 (class 2606 OID 5256110)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2559 (class 2606 OID 5256100)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2558 (class 2606 OID 5256105)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2521 (class 2606 OID 5255925)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2522 (class 2606 OID 5255920)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2547 (class 2606 OID 5256050)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2570 (class 2606 OID 5256155)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2569 (class 2606 OID 5256160)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2568 (class 2606 OID 5256165)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2571 (class 2606 OID 5256185)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2574 (class 2606 OID 5256170)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2572 (class 2606 OID 5256180)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2573 (class 2606 OID 5256175)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2519 (class 2606 OID 5255915)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2520 (class 2606 OID 5255910)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2512 (class 2606 OID 5255875)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2553 (class 2606 OID 5256080)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2535 (class 2606 OID 5255990)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2509 (class 2606 OID 5255855)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2508 (class 2606 OID 5255860)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2554 (class 2606 OID 5256095)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2555 (class 2606 OID 5256090)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2556 (class 2606 OID 5256085)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2525 (class 2606 OID 5255930)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2523 (class 2606 OID 5255940)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2524 (class 2606 OID 5255935)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2582 (class 2606 OID 5256225)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2539 (class 2606 OID 5256025)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2541 (class 2606 OID 5256015)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2542 (class 2606 OID 5256010)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2540 (class 2606 OID 5256020)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2507 (class 2606 OID 5255845)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2506 (class 2606 OID 5255850)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2552 (class 2606 OID 5256075)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2548 (class 2606 OID 5256055)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2562 (class 2606 OID 5256120)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2561 (class 2606 OID 5256125)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2517 (class 2606 OID 5255900)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 5255895)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2516 (class 2606 OID 5255905)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2566 (class 2606 OID 5256140)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2565 (class 2606 OID 5256145)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2579 (class 2606 OID 5256210)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2580 (class 2606 OID 5256205)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2577 (class 2606 OID 5256220)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2581 (class 2606 OID 5256200)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2578 (class 2606 OID 5256215)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2560 (class 2606 OID 5256115)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2543 (class 2606 OID 5256045)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2544 (class 2606 OID 5256040)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2546 (class 2606 OID 5256030)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2545 (class 2606 OID 5256035)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2575 (class 2606 OID 5256195)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2576 (class 2606 OID 5256190)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2526 (class 2606 OID 5255945)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2567 (class 2606 OID 5256150)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2510 (class 2606 OID 5255870)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2511 (class 2606 OID 5255865)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2514 (class 2606 OID 5255880)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2513 (class 2606 OID 5255885)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2536 (class 2606 OID 5256005)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2537 (class 2606 OID 5256000)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2538 (class 2606 OID 5255995)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-27 12:01:24 CEST

--
-- PostgreSQL database dump complete
--

