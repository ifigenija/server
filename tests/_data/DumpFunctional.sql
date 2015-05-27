--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-27 17:00:42 CEST

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
-- TOC entry 2755 (class 0 OID 0)
-- Dependencies: 231
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 5369978)
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
-- TOC entry 227 (class 1259 OID 5370488)
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
-- TOC entry 226 (class 1259 OID 5370471)
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
-- TOC entry 219 (class 1259 OID 5370381)
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
-- TOC entry 194 (class 1259 OID 5370151)
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
-- TOC entry 197 (class 1259 OID 5370185)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 5370098)
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
-- TOC entry 213 (class 1259 OID 5370311)
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
-- TOC entry 192 (class 1259 OID 5370135)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 196 (class 1259 OID 5370179)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 5370115)
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
-- TOC entry 202 (class 1259 OID 5370228)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 5370253)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 5370072)
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
-- TOC entry 181 (class 1259 OID 5369987)
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
-- TOC entry 182 (class 1259 OID 5369998)
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
-- TOC entry 177 (class 1259 OID 5369952)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 5369971)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 5370260)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 5370291)
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
-- TOC entry 223 (class 1259 OID 5370424)
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
-- TOC entry 184 (class 1259 OID 5370029)
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
-- TOC entry 186 (class 1259 OID 5370064)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 5370234)
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
-- TOC entry 185 (class 1259 OID 5370049)
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
-- TOC entry 191 (class 1259 OID 5370127)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 5370246)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 5370366)
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
-- TOC entry 222 (class 1259 OID 5370417)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 5370275)
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
-- TOC entry 201 (class 1259 OID 5370219)
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
-- TOC entry 200 (class 1259 OID 5370209)
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
-- TOC entry 221 (class 1259 OID 5370406)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 5370343)
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
-- TOC entry 174 (class 1259 OID 5369923)
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
-- TOC entry 173 (class 1259 OID 5369921)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2756 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 5370285)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 5369961)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 5369945)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 5370299)
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
-- TOC entry 204 (class 1259 OID 5370240)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 5370190)
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
-- TOC entry 230 (class 1259 OID 5370514)
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
-- TOC entry 229 (class 1259 OID 5370507)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 5370502)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 5370353)
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
-- TOC entry 183 (class 1259 OID 5370021)
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
-- TOC entry 199 (class 1259 OID 5370196)
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
-- TOC entry 220 (class 1259 OID 5370395)
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
-- TOC entry 188 (class 1259 OID 5370084)
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
-- TOC entry 175 (class 1259 OID 5369932)
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
-- TOC entry 225 (class 1259 OID 5370450)
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
-- TOC entry 193 (class 1259 OID 5370142)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 5370267)
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
-- TOC entry 215 (class 1259 OID 5370335)
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
-- TOC entry 195 (class 1259 OID 5370174)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 5370440)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 5370325)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2144 (class 2604 OID 5369926)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2698 (class 0 OID 5369978)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2745 (class 0 OID 5370488)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
000c0000-5565-dc1a-8951-9b575b890411	000d0000-5565-dc1a-8606-ad76e10c972d	\N	00090000-5565-dc19-8cb3-824f45902afb	\N	\N	0001	f	\N	\N	\N	\N	\N	\N
000c0000-5565-dc1a-481c-cca5136a74a1	000d0000-5565-dc1a-1e91-8b13074b23b8	\N	00090000-5565-dc19-a325-6e715b89ff72	\N	\N	0002	f	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2744 (class 0 OID 5370471)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2737 (class 0 OID 5370381)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-5565-dc19-f1fb-0d81bf0e5abc	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-5565-dc19-5e42-708f613e457f	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-5565-dc19-e8d0-6b8aac1a9206	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 2712 (class 0 OID 5370151)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2715 (class 0 OID 5370185)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2707 (class 0 OID 5370098)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5565-dc18-219b-c51367c62c3d	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5565-dc18-7153-9100184f5f93	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5565-dc18-96a9-61e76141b5e2	AL	ALB	008	Albania 	Albanija	\N
00040000-5565-dc18-a8d8-b502bfb2ba85	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5565-dc18-97a9-d4dc707a3e3d	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5565-dc18-2b4f-931e27584845	AD	AND	020	Andorra 	Andora	\N
00040000-5565-dc18-942a-a7df5a2c696a	AO	AGO	024	Angola 	Angola	\N
00040000-5565-dc18-813c-9537a3f2c768	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5565-dc18-ff8f-635aef2ac4b8	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5565-dc18-1da6-216bc0da9556	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5565-dc18-9219-58c1a5d03787	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5565-dc18-06ba-e499d9364ace	AM	ARM	051	Armenia 	Armenija	\N
00040000-5565-dc18-5546-ba2da996f3b6	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5565-dc18-56ca-a7d7794a4fb1	AU	AUS	036	Australia 	Avstralija	\N
00040000-5565-dc18-eecd-90142e750748	AT	AUT	040	Austria 	Avstrija	\N
00040000-5565-dc18-a743-d61ec3135ce8	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5565-dc18-f436-3292cda61642	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5565-dc18-513f-8ad1d5e9f0e6	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5565-dc18-fb14-ac1110c20b81	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5565-dc18-7de5-e1e53dd5187c	BB	BRB	052	Barbados 	Barbados	\N
00040000-5565-dc18-b58b-f8407496f20a	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5565-dc18-c0fd-041ab3d6b79b	BE	BEL	056	Belgium 	Belgija	\N
00040000-5565-dc18-2e36-dd43af9b2094	BZ	BLZ	084	Belize 	Belize	\N
00040000-5565-dc18-7afc-0c53c73ecf3d	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5565-dc18-9a5e-870aa024acb7	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5565-dc18-a282-70b1cfc5f804	BT	BTN	064	Bhutan 	Butan	\N
00040000-5565-dc18-e5b5-a2a9e9a4d02a	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5565-dc18-4e37-5c3327fd4e6d	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5565-dc18-fdbc-682debc2893f	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5565-dc18-79ea-417d9a176e91	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5565-dc18-34e7-801a16a78730	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5565-dc18-aa8d-a5ecf94c0d38	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5565-dc18-0bbf-5e56e0a01797	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5565-dc18-8d2e-8781ece80469	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5565-dc18-247c-d1c0f21cfda3	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5565-dc18-f9f9-30f22bf3e484	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5565-dc18-1334-1e7182db243c	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5565-dc18-f990-5c0b5f1597b0	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5565-dc18-4c94-33ae30b81437	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5565-dc18-9ee0-4bab78392417	CA	CAN	124	Canada 	Kanada	\N
00040000-5565-dc18-a3ec-1464a785201e	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5565-dc18-f5a2-c01b5490ace4	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5565-dc18-97fc-99ce06b1a17f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5565-dc18-a057-8b72d548c7f8	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5565-dc18-e843-dfdf1bab0335	CL	CHL	152	Chile 	Čile	\N
00040000-5565-dc18-c26c-8a06ae7e6bcf	CN	CHN	156	China 	Kitajska	\N
00040000-5565-dc18-7177-f466250a7aa2	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5565-dc18-01b6-28dd9d79188a	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5565-dc18-bc86-2a140c852440	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5565-dc18-2cd6-5cff4b72b8f0	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5565-dc18-ba3c-4f962203ea3c	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5565-dc18-072f-4d3acde1b069	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5565-dc18-9844-143575671667	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5565-dc18-4b84-95cec4583e51	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5565-dc18-d720-a9b56b5ce180	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5565-dc18-4c1d-39bf3117b507	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5565-dc18-59c0-7ad364ee65f5	CU	CUB	192	Cuba 	Kuba	\N
00040000-5565-dc18-0f25-578981d1acc4	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5565-dc18-5cae-0a468e2d9b72	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5565-dc18-f088-4852966059a2	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5565-dc18-989c-6e1fc5f74ee2	DK	DNK	208	Denmark 	Danska	\N
00040000-5565-dc18-4de2-a71bc5e19b7b	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5565-dc18-94d6-d1d5018d19d8	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5565-dc18-76d4-a39fb9618ab1	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5565-dc18-b218-1a26a60c4fb4	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5565-dc18-6353-ccf870455953	EG	EGY	818	Egypt 	Egipt	\N
00040000-5565-dc18-66c0-550d0dc7a86e	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5565-dc18-c41e-a2e3f508c0a7	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5565-dc18-55f5-6af4aad28925	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5565-dc18-0025-3820cb091c23	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5565-dc18-d570-fef7aac79eb5	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5565-dc18-7ac3-fb89c433e099	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5565-dc18-2e00-d82a82eb8dbd	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5565-dc18-b923-1daaaac55935	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5565-dc18-f9c6-12732b9eaf40	FI	FIN	246	Finland 	Finska	\N
00040000-5565-dc18-f988-ecff70efd1b9	FR	FRA	250	France 	Francija	\N
00040000-5565-dc18-e9a8-b4221903330c	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5565-dc18-8451-81c1e21352b7	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5565-dc18-dceb-18b06238fae5	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5565-dc18-4129-ffce2390255f	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5565-dc18-4276-eb833571fa7e	GA	GAB	266	Gabon 	Gabon	\N
00040000-5565-dc18-9ca8-a9bf3d89cb52	GM	GMB	270	Gambia 	Gambija	\N
00040000-5565-dc18-98d8-d7b98fd67a80	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5565-dc18-900e-3791161644e4	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5565-dc18-c3f2-d033fa036ea3	GH	GHA	288	Ghana 	Gana	\N
00040000-5565-dc18-683a-44f1515144f0	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5565-dc18-3ab0-64f03c978146	GR	GRC	300	Greece 	Grčija	\N
00040000-5565-dc18-bb9d-a4fb0704ea87	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5565-dc18-a0b2-5a8c4674f4d9	GD	GRD	308	Grenada 	Grenada	\N
00040000-5565-dc18-c300-5370bbe1696a	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5565-dc18-a965-4560c8fecc75	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5565-dc18-0d80-621c425a5abd	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5565-dc18-b53f-46b9777ac3aa	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5565-dc18-97ab-63bb76096ca3	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5565-dc18-2def-8051fe522aa9	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5565-dc18-c457-4719e4eaf8f7	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5565-dc18-3f7a-2b5ce2d3a294	HT	HTI	332	Haiti 	Haiti	\N
00040000-5565-dc18-93b4-d1bdf45840a8	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5565-dc18-989a-aaa50cbd2f56	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5565-dc18-481f-943c5ed3438a	HN	HND	340	Honduras 	Honduras	\N
00040000-5565-dc18-1ce0-5a2db7262fec	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5565-dc18-9eda-a4848f80c672	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5565-dc18-0aef-31ba95c0aab6	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5565-dc18-80f5-be1aa02e7b1d	IN	IND	356	India 	Indija	\N
00040000-5565-dc18-3e80-69e19820672a	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5565-dc18-ee1e-0c52969b29fa	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5565-dc18-b9dc-cccfc44c1212	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5565-dc18-a9bb-57894ab997df	IE	IRL	372	Ireland 	Irska	\N
00040000-5565-dc18-8172-9f9e4781936d	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5565-dc18-ba24-b3d3a55338e5	IL	ISR	376	Israel 	Izrael	\N
00040000-5565-dc18-6473-6ef6edc6c27f	IT	ITA	380	Italy 	Italija	\N
00040000-5565-dc18-93af-115e4ee56a76	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5565-dc18-c343-f2467e1baab4	JP	JPN	392	Japan 	Japonska	\N
00040000-5565-dc18-1c0a-df144b95fda3	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5565-dc18-9fe6-fc34de7f68fb	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5565-dc18-19ad-73a11c82da7b	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5565-dc18-4f1a-ceb8352ac022	KE	KEN	404	Kenya 	Kenija	\N
00040000-5565-dc18-08a9-49d027c5a1dd	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5565-dc18-4613-a5e61add5042	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5565-dc18-8779-e6b4acf11e8a	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5565-dc18-5561-823539ec9267	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5565-dc18-0508-f43b49f2b4dd	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5565-dc18-d5a5-43b1e9babc00	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5565-dc18-6512-dc8f2606d27b	LV	LVA	428	Latvia 	Latvija	\N
00040000-5565-dc18-68ec-62174e53ca37	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5565-dc18-ccec-4e96f7317b79	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5565-dc18-2c19-06071141ed43	LR	LBR	430	Liberia 	Liberija	\N
00040000-5565-dc18-2b14-5c73d66bdc0a	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5565-dc18-7f6b-974d772c9716	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5565-dc18-4b80-b364ac2732a7	LT	LTU	440	Lithuania 	Litva	\N
00040000-5565-dc18-2d2f-f40091761c4d	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5565-dc18-6e01-e2078ae91b77	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5565-dc18-ba9a-dde128c31bef	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5565-dc18-fb41-2772fe331889	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5565-dc18-72d7-3149edddf1c7	MW	MWI	454	Malawi 	Malavi	\N
00040000-5565-dc18-f474-128be2eb9c37	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5565-dc18-088d-c9ee5bf69143	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5565-dc18-2a5c-a7e26ce80040	ML	MLI	466	Mali 	Mali	\N
00040000-5565-dc18-1969-354456964d7e	MT	MLT	470	Malta 	Malta	\N
00040000-5565-dc18-73ae-fc64cb90fb94	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5565-dc18-68e5-dc34df46c98c	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5565-dc18-e1fe-2d54050aa239	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5565-dc18-49da-e25b93ca21ea	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5565-dc18-8294-17afec572947	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5565-dc18-9eda-66893b6c3761	MX	MEX	484	Mexico 	Mehika	\N
00040000-5565-dc18-29e0-d9f631629aa2	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5565-dc18-6ed7-95786533c423	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5565-dc18-1096-193dd35cdf10	MC	MCO	492	Monaco 	Monako	\N
00040000-5565-dc18-4e95-7098eec8b07c	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5565-dc18-bed3-244a09274f6a	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5565-dc18-1717-a473990c7e6c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5565-dc18-4bfb-59247cf757be	MA	MAR	504	Morocco 	Maroko	\N
00040000-5565-dc18-8bce-5da99d01237c	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5565-dc18-921f-24a0037f98c1	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5565-dc18-ae54-c8db4845fd52	NA	NAM	516	Namibia 	Namibija	\N
00040000-5565-dc18-a403-ab449fb10384	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5565-dc18-e1f5-5ae47665858a	NP	NPL	524	Nepal 	Nepal	\N
00040000-5565-dc18-aa96-cbcb482cc3f8	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5565-dc18-7080-b99ee0a23933	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5565-dc18-5f2a-171675393461	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5565-dc18-ce65-e173884bc42c	NE	NER	562	Niger 	Niger 	\N
00040000-5565-dc18-842c-51afebc57e09	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5565-dc18-41b5-2fbacf9809fe	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5565-dc18-c42f-81ff9b5fd3e0	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5565-dc18-072d-985836667efa	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5565-dc18-d4d5-83dfbe8b1fbc	NO	NOR	578	Norway 	Norveška	\N
00040000-5565-dc18-7182-a71a3df3a89b	OM	OMN	512	Oman 	Oman	\N
00040000-5565-dc18-d51d-44cb5b8917ea	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5565-dc18-e2b7-cd2a0a251f8f	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5565-dc18-9e3a-7be1b34f3f40	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5565-dc18-8449-4785bc705260	PA	PAN	591	Panama 	Panama	\N
00040000-5565-dc18-a39e-007ea3a67321	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5565-dc18-8a49-0229d77c3850	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5565-dc18-cbc3-41930d18d4e9	PE	PER	604	Peru 	Peru	\N
00040000-5565-dc18-8431-d624bc50431a	PH	PHL	608	Philippines 	Filipini	\N
00040000-5565-dc18-39cf-393d79dd3d25	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5565-dc18-b51d-16c2b1995d57	PL	POL	616	Poland 	Poljska	\N
00040000-5565-dc18-ee05-477e89e1c521	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5565-dc18-792d-fb5e1ee97a6a	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5565-dc18-1f76-ff245a651da3	QA	QAT	634	Qatar 	Katar	\N
00040000-5565-dc18-6f78-eb717dfca856	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5565-dc18-4ec9-0f79fb35249a	RO	ROU	642	Romania 	Romunija	\N
00040000-5565-dc18-2257-2876ad466f1f	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5565-dc18-a654-4573e18e9ce8	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5565-dc18-eace-17fc70fdfcc2	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5565-dc18-df41-f643f7c0c402	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5565-dc18-c3a2-7a31a6ce68c6	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5565-dc18-db12-39dbdcab6317	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5565-dc18-3c04-e5dcbde218c6	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5565-dc18-a658-ad9406b3e285	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5565-dc18-694d-41d56fb748d6	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5565-dc18-e534-6d3ae158a0e8	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5565-dc18-5217-0637af6bd288	SM	SMR	674	San Marino 	San Marino	\N
00040000-5565-dc18-1b55-6b926ccd07ac	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5565-dc18-117c-2a3c584f2999	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5565-dc18-62af-852ee865a787	SN	SEN	686	Senegal 	Senegal	\N
00040000-5565-dc18-c2a4-b03ccaae0a3c	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5565-dc18-ec14-7cffe3e3a6e1	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5565-dc18-fef7-1523add9902f	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5565-dc18-57ae-4dceb00bd62a	SG	SGP	702	Singapore 	Singapur	\N
00040000-5565-dc18-2b02-b682dbdb9365	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5565-dc18-704f-449b7bf035cc	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5565-dc18-ea7d-f36dfd3ca10d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5565-dc18-f6b0-b9d21df54d7a	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5565-dc18-52c3-36ee3c3ebe42	SO	SOM	706	Somalia 	Somalija	\N
00040000-5565-dc18-d508-7e676b7c2b4f	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5565-dc18-2a2e-9eaa611560fb	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5565-dc18-ca3f-dadecce1ad4a	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5565-dc18-ed00-ff49511cba9c	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5565-dc18-3489-fa87b4f4aa23	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5565-dc18-2b51-60252d3dc59f	SD	SDN	729	Sudan 	Sudan	\N
00040000-5565-dc18-21bb-422060da4f86	SR	SUR	740	Suriname 	Surinam	\N
00040000-5565-dc18-f9a1-76711f9d47dd	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5565-dc18-773f-acf3d27ac6e6	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5565-dc18-241b-0cde6c910b8a	SE	SWE	752	Sweden 	Švedska	\N
00040000-5565-dc18-6348-357febd4de49	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5565-dc18-e71a-65a18adb6fd4	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5565-dc18-dac5-f7dfe904cc73	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5565-dc18-186e-b379c467c6f8	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5565-dc18-265e-7fef0837ea37	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5565-dc18-045a-ea5c073a0c21	TH	THA	764	Thailand 	Tajska	\N
00040000-5565-dc18-9cb6-a54b2a6a167f	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5565-dc18-5d52-99087a3382ef	TG	TGO	768	Togo 	Togo	\N
00040000-5565-dc18-8ed9-71daa635a269	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5565-dc18-d751-276795cc4803	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5565-dc18-f86e-d3fa2122974f	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5565-dc18-2a32-db2d3ded63ae	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5565-dc18-c18d-4a2cca8fb0c4	TR	TUR	792	Turkey 	Turčija	\N
00040000-5565-dc18-b7cc-a6e29e3cdf8c	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5565-dc18-43ca-8eb30d9a972b	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5565-dc18-6397-bce0e34d9138	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5565-dc18-b858-51f665ec0dae	UG	UGA	800	Uganda 	Uganda	\N
00040000-5565-dc18-e860-ef4621630efb	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5565-dc18-266f-511e11d15db7	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5565-dc18-d1b7-332178601d9c	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5565-dc18-52bf-1a1bc674c3d7	US	USA	840	United States 	Združene države Amerike	\N
00040000-5565-dc18-dcc3-4111283ea32e	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5565-dc18-f2a4-4938a29a45f5	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5565-dc18-953e-35dd32cc8980	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5565-dc18-7475-0b74bc91b547	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5565-dc18-1517-a22cd7c2cc28	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5565-dc18-eeed-f68e250d6e35	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5565-dc18-6ecf-40a196f01455	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5565-dc18-b238-d80ce14b623a	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5565-dc18-0101-d26ce9f9d396	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5565-dc18-1a59-5e94b0e18bea	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5565-dc18-1d5a-29ec80f4f729	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5565-dc18-cc82-f1e730821731	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5565-dc18-11a9-fe23896e5481	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2731 (class 0 OID 5370311)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj) FROM stdin;
000d0000-5565-dc1a-ff06-7ad6e6a03c0a	000e0000-5565-dc1a-0995-35cb8ea29d09	\N	000f0000-5565-dc18-5933-61e1a5993a09	igralec	Hipolita	glavna vloga	velika	t	6	t	t	\N
000d0000-5565-dc1a-8606-ad76e10c972d	000e0000-5565-dc1a-0995-35cb8ea29d09	\N	000f0000-5565-dc18-5933-61e1a5993a09	igralec	Tezej	glavna vloga	velika	t	5	t	t	\N
000d0000-5565-dc1a-1e91-8b13074b23b8	000e0000-5565-dc1a-0995-35cb8ea29d09	\N	000f0000-5565-dc18-3559-b4bb781e7e47	umetnik	Režija		velika	t	8	t	t	\N
\.


--
-- TOC entry 2710 (class 0 OID 5370135)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2714 (class 0 OID 5370179)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2708 (class 0 OID 5370115)
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
-- TOC entry 2720 (class 0 OID 5370228)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2724 (class 0 OID 5370253)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2705 (class 0 OID 5370072)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5565-dc19-6813-4d73f1e80fd0	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5565-dc19-2256-04fc72064ba7	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5565-dc19-1839-58a1f19b60bd	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5565-dc19-d4b8-cd6958c4e0cf	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5565-dc19-f75d-bb27f18d3def	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5565-dc19-d6e4-42e6ee6da7cc	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5565-dc19-e3c0-170f1ca90e17	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5565-dc19-d732-75e4f03ecca5	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5565-dc19-8d8b-2d42d1658fe9	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5565-dc19-5f04-64a96bb01272	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5565-dc19-a61b-fa96d020aa11	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5565-dc19-1841-7b98b54b8629	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5565-dc19-302a-0f6f686b2caa	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5565-dc19-82aa-db2b74d1467d	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5565-dc19-e0a6-5d9835bbea22	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2699 (class 0 OID 5369987)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5565-dc19-a414-f50cf5a24387	00000000-5565-dc19-f75d-bb27f18d3def	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5565-dc19-91a2-5bac6646b254	00000000-5565-dc19-f75d-bb27f18d3def	00010000-5565-dc19-7a61-e2fdd4fa154a	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5565-dc19-97c8-bea610c673b9	00000000-5565-dc19-d6e4-42e6ee6da7cc	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2700 (class 0 OID 5369998)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, sifra, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5565-dc19-7392-875ff46307d0	\N	0001	g.	Janez	Novak	a	Peter	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5565-dc19-f5c8-ce2e021316d4	\N	0002	dr.	Anton	Horvat	b			anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5565-dc19-387a-1b1062c29b57	\N	0003		Ivan	Kovačič	c			ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5565-dc19-6417-a3436b1c3886	\N	0004	prof.	Jožef	Krajnc	d		Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5565-dc19-d580-0cb79f1300f1	\N	0005		Marko	Zupančič	e			marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5565-dc19-d44d-c7145669b782	\N	0006	ga.	Marija	Kovač	f			marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5565-dc19-7894-e902b5880ece	\N	0007	ga.	Ana	Potočnik	g			ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5565-dc19-11e8-58d1b2aec97c	\N	0008	ga.	Maja	Mlakar	h			maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5565-dc19-8cb3-824f45902afb	\N	0009		Irena	Kos	i			irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5565-dc19-a325-6e715b89ff72	\N	0010		Mojca	Vidmar	J			mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5565-dc19-db37-457dd6743060	\N	0011		xx	write protected12345	\N			xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2690 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2695 (class 0 OID 5369952)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5565-dc18-d7c5-c92dfc1fa6bf	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5565-dc18-33bf-4b51cd5daba6	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5565-dc18-b7c0-cc36415533c3	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5565-dc18-07c1-da3ccf7c33e9	Abonma-read	Abonma - branje	f
00030000-5565-dc18-19e7-e11803341fa3	Abonma-write	Abonma - spreminjanje	f
00030000-5565-dc18-6dc6-0c1a55e536cf	Alternacija-read	Alternacija - branje	f
00030000-5565-dc18-361a-420c39e97307	Alternacija-write	Alternacija - spreminjanje	f
00030000-5565-dc18-6f74-4b7df0d6d3ac	Arhivalija-read	Arhivalija - branje	f
00030000-5565-dc18-b854-4e4e61c3600c	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5565-dc18-86b6-c01510380c51	Besedilo-read	Besedilo - branje	f
00030000-5565-dc18-fb74-365ae756af51	Besedilo-write	Besedilo - spreminjanje	f
00030000-5565-dc18-81fa-dc92ef85f983	DogodekIzven-read	DogodekIzven - branje	f
00030000-5565-dc18-40ef-80eba565f4ca	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5565-dc18-bd15-326c1c98232c	Dogodek-read	Dogodek - branje	f
00030000-5565-dc18-e80c-8b0f24b6e122	Dogodek-write	Dogodek - spreminjanje	f
00030000-5565-dc18-e128-346c69dafba3	Drzava-read	Drzava - branje	f
00030000-5565-dc18-1372-b33bdcfff8f2	Drzava-write	Drzava - spreminjanje	f
00030000-5565-dc18-c7c5-0fb5898aa81f	Funkcija-read	Funkcija - branje	f
00030000-5565-dc18-24ef-b2f626d58037	Funkcija-write	Funkcija - spreminjanje	f
00030000-5565-dc18-14ac-72c5480a70f5	Gostovanje-read	Gostovanje - branje	f
00030000-5565-dc18-b446-295cae897380	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5565-dc18-ed5b-01432d47b695	Gostujoca-read	Gostujoca - branje	f
00030000-5565-dc18-08aa-8bc90f59397d	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5565-dc18-b174-80851eec3140	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5565-dc18-2dc6-25c612f5aebf	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5565-dc18-e7c3-459943e0a0e9	Kupec-read	Kupec - branje	f
00030000-5565-dc18-dbd3-92f0d510823c	Kupec-write	Kupec - spreminjanje	f
00030000-5565-dc18-61da-a694997d55f4	NacinPlacina-read	NacinPlacina - branje	f
00030000-5565-dc18-54f0-82208cfa9dde	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5565-dc18-9d95-595c18d8c120	Option-read	Option - branje	f
00030000-5565-dc18-799f-41d80a4d2d88	Option-write	Option - spreminjanje	f
00030000-5565-dc18-30ae-a099d75ca997	OptionValue-read	OptionValue - branje	f
00030000-5565-dc18-bcf3-d26b141337cc	OptionValue-write	OptionValue - spreminjanje	f
00030000-5565-dc18-3105-f69814ed5826	Oseba-read	Oseba - branje	f
00030000-5565-dc18-83c8-e99ae7f49207	Oseba-write	Oseba - spreminjanje	f
00030000-5565-dc18-c546-53a38143714b	Permission-read	Permission - branje	f
00030000-5565-dc18-2aad-4b15f79aed79	Permission-write	Permission - spreminjanje	f
00030000-5565-dc18-c5ed-6ba7cdfff5e3	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5565-dc18-cdd5-29e28c653441	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5565-dc18-08eb-737dc81b23ee	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5565-dc18-6de9-d13fb679237e	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5565-dc18-526e-b1c4023435f1	Pogodba-read	Pogodba - branje	f
00030000-5565-dc18-d810-3cb2427a8765	Pogodba-write	Pogodba - spreminjanje	f
00030000-5565-dc18-64f3-63cc29a283a7	Popa-read	Popa - branje	f
00030000-5565-dc18-255a-6b0a5c29565a	Popa-write	Popa - spreminjanje	f
00030000-5565-dc18-1e3c-6f31be96269c	Posta-read	Posta - branje	f
00030000-5565-dc18-18e8-813c5d438a74	Posta-write	Posta - spreminjanje	f
00030000-5565-dc18-d4a7-84d681974629	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5565-dc18-4c98-dc3c116ddf48	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5565-dc18-cd8f-7e3f8775fa95	PostniNaslov-read	PostniNaslov - branje	f
00030000-5565-dc18-2096-2277cd141428	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5565-dc18-1711-2f11ca11b9bd	Predstava-read	Predstava - branje	f
00030000-5565-dc18-b4be-be15c9200dfe	Predstava-write	Predstava - spreminjanje	f
00030000-5565-dc18-c2b9-6a6828c7fd20	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5565-dc18-87c5-090f1b7470b4	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5565-dc18-aed2-4bca01bde57a	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5565-dc18-7475-f86a75ef761d	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5565-dc18-e86c-e3c339b3770c	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5565-dc18-ae4d-a33999e71577	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5565-dc18-31d3-5804b2dab394	Prostor-read	Prostor - branje	f
00030000-5565-dc18-1fe1-826b077dd05b	Prostor-write	Prostor - spreminjanje	f
00030000-5565-dc18-be15-c59ec9b3a3dc	Racun-read	Racun - branje	f
00030000-5565-dc18-abed-3a6b0daee5e0	Racun-write	Racun - spreminjanje	f
00030000-5565-dc18-83fe-39490e25a79a	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5565-dc18-f975-5c5438cf22ff	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5565-dc18-34bd-f315aac877e3	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5565-dc18-e238-e4582e749a5e	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5565-dc18-b4ff-ef4e41630f17	Rekvizit-read	Rekvizit - branje	f
00030000-5565-dc18-b234-8423e999b8a8	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5565-dc18-aa35-a7a18dbe5a80	Revizija-read	Revizija - branje	f
00030000-5565-dc18-4a8d-e9a39cded785	Revizija-write	Revizija - spreminjanje	f
00030000-5565-dc18-bd33-de88ae53f80e	Rezervacija-read	Rezervacija - branje	f
00030000-5565-dc18-a844-bf8e935324f2	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5565-dc18-4b78-3a69f308c069	Role-read	Role - branje	f
00030000-5565-dc18-6799-22d4f266cb45	Role-write	Role - spreminjanje	f
00030000-5565-dc18-5731-83a78863e866	SedezniRed-read	SedezniRed - branje	f
00030000-5565-dc18-6e9e-efeb90a07119	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5565-dc18-cc21-e756d10d2f19	Sedez-read	Sedez - branje	f
00030000-5565-dc18-4ba1-8b93d95b7820	Sedez-write	Sedez - spreminjanje	f
00030000-5565-dc18-cd3b-9f8b4c7d7b27	Sezona-read	Sezona - branje	f
00030000-5565-dc18-3c9e-d72dfbf95370	Sezona-write	Sezona - spreminjanje	f
00030000-5565-dc18-b6a3-a3a707e5116e	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5565-dc18-ef5c-5e9b2d1cbdfa	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5565-dc18-b0d0-6c719631bae9	Stevilcenje-read	Stevilcenje - branje	f
00030000-5565-dc18-9dce-adc94ed2d029	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5565-dc18-a4e1-3e7eaba70e39	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5565-dc18-5e83-87b1bbbcce85	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5565-dc18-088d-2d058a48c8b1	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5565-dc18-6be0-e945766c0e4a	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5565-dc18-fae0-9ae555bc5b0f	Telefonska-read	Telefonska - branje	f
00030000-5565-dc18-3174-6cfcbe07ac55	Telefonska-write	Telefonska - spreminjanje	f
00030000-5565-dc18-ff91-0c3f507da415	TerminStoritve-read	TerminStoritve - branje	f
00030000-5565-dc18-4d26-7a2d6332274e	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5565-dc18-ce55-b2baeb8f6da2	TipFunkcije-read	TipFunkcije - branje	f
00030000-5565-dc18-3057-1469a31a66b9	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5565-dc18-e093-f31dc36098ad	Trr-read	Trr - branje	f
00030000-5565-dc18-003f-e11a66ea7213	Trr-write	Trr - spreminjanje	f
00030000-5565-dc18-fe6e-a19327b71241	Uprizoritev-read	Uprizoritev - branje	f
00030000-5565-dc18-1fdd-7dccf8085443	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5565-dc18-153b-4d273d5cd9fd	User-read	User - branje	f
00030000-5565-dc18-4731-c1d4da057ad7	User-write	User - spreminjanje	f
00030000-5565-dc18-d924-464f0ad2cc11	Vaja-read	Vaja - branje	f
00030000-5565-dc18-0c9e-3c9f4ed67ccc	Vaja-write	Vaja - spreminjanje	f
00030000-5565-dc18-fba1-5e9a4f92826b	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5565-dc18-ba7f-a0f62b0696c6	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5565-dc18-1a15-891b340bc810	Zaposlitev-read	Zaposlitev - branje	f
00030000-5565-dc18-499e-b76d14c79896	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5565-dc18-58a1-ce8090f57ee0	Zasedenost-read	Zasedenost - branje	f
00030000-5565-dc18-7336-0ff9b1999ea4	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5565-dc18-62b2-b0eb6ade18ed	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5565-dc18-23a2-498831bc710f	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5565-dc18-e4f5-66bf0df03f7a	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5565-dc18-dc54-26a9b4948a22	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2697 (class 0 OID 5369971)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5565-dc19-ac2d-dc29116dac10	00030000-5565-dc18-e128-346c69dafba3
00020000-5565-dc19-df1f-dffac9e215d5	00030000-5565-dc18-1372-b33bdcfff8f2
00020000-5565-dc19-df1f-dffac9e215d5	00030000-5565-dc18-e128-346c69dafba3
\.


--
-- TOC entry 2725 (class 0 OID 5370260)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2729 (class 0 OID 5370291)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2741 (class 0 OID 5370424)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2702 (class 0 OID 5370029)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5565-dc1a-1e80-a763dc386626	00040000-5565-dc18-219b-c51367c62c3d	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5565-dc1a-774f-3f77b8d21476	00040000-5565-dc18-219b-c51367c62c3d	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2704 (class 0 OID 5370064)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5565-dc18-40ed-17ba2a4b4fc1	8341	Adlešiči
00050000-5565-dc18-8614-36ff489fcd19	5270	Ajdovščina
00050000-5565-dc18-d112-891af6c7da30	6280	Ankaran/Ancarano
00050000-5565-dc18-a4c3-9ff68ae26fbf	9253	Apače
00050000-5565-dc18-ccd0-48447b931932	8253	Artiče
00050000-5565-dc18-2f0b-7a3ed4fd969f	4275	Begunje na Gorenjskem
00050000-5565-dc18-451e-ad8bcde5593f	1382	Begunje pri Cerknici
00050000-5565-dc18-da1a-e4009aa663f2	9231	Beltinci
00050000-5565-dc18-b79a-c161f4fff11d	2234	Benedikt
00050000-5565-dc18-88c3-23977bc6a311	2345	Bistrica ob Dravi
00050000-5565-dc18-2760-7d493f36c3fb	3256	Bistrica ob Sotli
00050000-5565-dc18-4626-f0c81d856f1b	8259	Bizeljsko
00050000-5565-dc18-17f7-8a34d8a11282	1223	Blagovica
00050000-5565-dc18-690e-decc665a1b40	8283	Blanca
00050000-5565-dc18-1dbd-6228fbcc8b0f	4260	Bled
00050000-5565-dc18-7385-591b9f55296d	4273	Blejska Dobrava
00050000-5565-dc18-2685-9667e14bff4d	9265	Bodonci
00050000-5565-dc18-a3ad-a2de9b9c4de0	9222	Bogojina
00050000-5565-dc18-1686-c5308b1c2c7c	4263	Bohinjska Bela
00050000-5565-dc18-28b2-a517d360f303	4264	Bohinjska Bistrica
00050000-5565-dc18-0f3a-6b232740b2de	4265	Bohinjsko jezero
00050000-5565-dc18-c486-a9a1c2fd9be5	1353	Borovnica
00050000-5565-dc18-4cee-5b6cb51da2c9	8294	Boštanj
00050000-5565-dc18-4c90-d354277d7277	5230	Bovec
00050000-5565-dc18-ec75-d1f86d51d32d	5295	Branik
00050000-5565-dc18-5bfc-468a2efbe45d	3314	Braslovče
00050000-5565-dc18-8e99-0d3b7381b792	5223	Breginj
00050000-5565-dc18-ca38-38afa4cba148	8280	Brestanica
00050000-5565-dc18-ced3-47496eaf7e13	2354	Bresternica
00050000-5565-dc18-a277-d9553b642710	4243	Brezje
00050000-5565-dc18-b7a5-a0ff885b192f	1351	Brezovica pri Ljubljani
00050000-5565-dc18-e943-d7308dce4e0d	8250	Brežice
00050000-5565-dc18-b178-8cfc06e2d245	4210	Brnik - Aerodrom
00050000-5565-dc18-e239-ad634c0aeaed	8321	Brusnice
00050000-5565-dc18-c059-5f3d5ff3aa59	3255	Buče
00050000-5565-dc18-c7aa-8b79357190a3	8276	Bučka 
00050000-5565-dc18-4f87-1f0674a72402	9261	Cankova
00050000-5565-dc18-d154-c99c660695a3	3000	Celje 
00050000-5565-dc18-4af9-c9ed3e91886b	3001	Celje - poštni predali
00050000-5565-dc18-687b-3159a9c924a6	4207	Cerklje na Gorenjskem
00050000-5565-dc18-903e-db7360e75be0	8263	Cerklje ob Krki
00050000-5565-dc18-0e0e-5ab2a234231c	1380	Cerknica
00050000-5565-dc18-92bd-7c29337776d0	5282	Cerkno
00050000-5565-dc18-cf69-96a7af540a64	2236	Cerkvenjak
00050000-5565-dc18-5d74-ec6718d7c455	2215	Ceršak
00050000-5565-dc18-b449-62dab78de02c	2326	Cirkovce
00050000-5565-dc18-8f26-1c1c721e7a8a	2282	Cirkulane
00050000-5565-dc18-469e-973f4e436438	5273	Col
00050000-5565-dc18-6411-3f0bc9b31ee1	8251	Čatež ob Savi
00050000-5565-dc18-05a5-ccb31ddb5121	1413	Čemšenik
00050000-5565-dc18-5df7-4aa313d0f0b9	5253	Čepovan
00050000-5565-dc18-063d-7c0ab86918d8	9232	Črenšovci
00050000-5565-dc18-157d-06c3d0863108	2393	Črna na Koroškem
00050000-5565-dc18-0241-a60b8af1f8df	6275	Črni Kal
00050000-5565-dc18-7135-a3a3c33c7c4e	5274	Črni Vrh nad Idrijo
00050000-5565-dc18-d010-91524b5a334c	5262	Črniče
00050000-5565-dc18-66d6-94d2924dd63c	8340	Črnomelj
00050000-5565-dc18-640d-11f2c4190854	6271	Dekani
00050000-5565-dc18-601f-290ffbce3f41	5210	Deskle
00050000-5565-dc18-2766-43245fa6515e	2253	Destrnik
00050000-5565-dc18-12a1-9b4a3295c119	6215	Divača
00050000-5565-dc18-6acf-99100f541171	1233	Dob
00050000-5565-dc18-305d-6c61880c0909	3224	Dobje pri Planini
00050000-5565-dc18-338a-cfb86c4756a8	8257	Dobova
00050000-5565-dc18-e18e-bd40813ff715	1423	Dobovec
00050000-5565-dc18-16b7-4a144b8ef5f0	5263	Dobravlje
00050000-5565-dc18-60af-ce7654ebd8dc	3204	Dobrna
00050000-5565-dc18-09d7-1ce645e5639f	8211	Dobrnič
00050000-5565-dc18-f645-56093acd7735	1356	Dobrova
00050000-5565-dc18-955d-6b15b34fb634	9223	Dobrovnik/Dobronak 
00050000-5565-dc18-1663-6424005316fa	5212	Dobrovo v Brdih
00050000-5565-dc18-15b4-ae92747c3955	1431	Dol pri Hrastniku
00050000-5565-dc18-5525-cb7656e41587	1262	Dol pri Ljubljani
00050000-5565-dc18-3193-bb7c288e893c	1273	Dole pri Litiji
00050000-5565-dc18-9f9c-d53a24afe1c3	1331	Dolenja vas
00050000-5565-dc18-cab1-037873eff8cb	8350	Dolenjske Toplice
00050000-5565-dc18-d691-08c377f3d08e	1230	Domžale
00050000-5565-dc18-0d0e-c57c663491d4	2252	Dornava
00050000-5565-dc18-4395-4ba897c76637	5294	Dornberk
00050000-5565-dc18-acce-f4de84b7e9fb	1319	Draga
00050000-5565-dc18-be7a-d6b4bd120612	8343	Dragatuš
00050000-5565-dc18-32a9-082de4f3b20d	3222	Dramlje
00050000-5565-dc18-80fe-cc45eedff26e	2370	Dravograd
00050000-5565-dc18-dd46-07831ec3068c	4203	Duplje
00050000-5565-dc18-887a-a09ec6f15f0a	6221	Dutovlje
00050000-5565-dc18-93cc-b6724984fff2	8361	Dvor
00050000-5565-dc18-eb1e-3e94222f06fc	2343	Fala
00050000-5565-dc18-04ab-0eb0d858c612	9208	Fokovci
00050000-5565-dc18-a09a-0215596486b0	2313	Fram
00050000-5565-dc18-0e3d-1c303692c79c	3213	Frankolovo
00050000-5565-dc18-24e7-b9ef58f1d743	1274	Gabrovka
00050000-5565-dc18-986e-b82be86fb82a	8254	Globoko
00050000-5565-dc18-0ec8-80858a8bc967	5275	Godovič
00050000-5565-dc18-7268-7fcceba88bf6	4204	Golnik
00050000-5565-dc18-b677-562d078cdf99	3303	Gomilsko
00050000-5565-dc18-a27b-828bdf23f723	4224	Gorenja vas
00050000-5565-dc18-ee6a-d4f55ce9a029	3263	Gorica pri Slivnici
00050000-5565-dc18-7c08-4f4535d6401d	2272	Gorišnica
00050000-5565-dc18-a72d-08b1b8a8b5e5	9250	Gornja Radgona
00050000-5565-dc18-3546-744482f33965	3342	Gornji Grad
00050000-5565-dc18-a3b9-19cb8837e36c	4282	Gozd Martuljek
00050000-5565-dc18-ec1c-2fa4f14daa52	6272	Gračišče
00050000-5565-dc18-32ae-bbca7ccb380f	9264	Grad
00050000-5565-dc18-c213-2fe64c3edefc	8332	Gradac
00050000-5565-dc18-c7e4-c3d527f0bece	1384	Grahovo
00050000-5565-dc18-1cda-22016e9d4fb7	5242	Grahovo ob Bači
00050000-5565-dc18-c362-d1ecccaa5b3d	5251	Grgar
00050000-5565-dc18-52d0-21ddc4421ae4	3302	Griže
00050000-5565-dc18-092e-e7bde639478c	3231	Grobelno
00050000-5565-dc18-0c29-de82c1c315d8	1290	Grosuplje
00050000-5565-dc18-b524-fd3b0c3d963a	2288	Hajdina
00050000-5565-dc18-76c0-3a26839ba17d	8362	Hinje
00050000-5565-dc18-5693-10d9d9d2e6f6	2311	Hoče
00050000-5565-dc18-d8c1-e0d380ac0e42	9205	Hodoš/Hodos
00050000-5565-dc18-0eaf-72d6749fcf1a	1354	Horjul
00050000-5565-dc18-7e72-297522382d26	1372	Hotedršica
00050000-5565-dc18-06b0-4e80f2ffe42b	1430	Hrastnik
00050000-5565-dc18-1b36-cc177c89a50f	6225	Hruševje
00050000-5565-dc18-7285-e60510984c52	4276	Hrušica
00050000-5565-dc18-fba1-b64276e97171	5280	Idrija
00050000-5565-dc18-51aa-5dbb4af629f8	1292	Ig
00050000-5565-dc18-b11a-70cf1be950c3	6250	Ilirska Bistrica
00050000-5565-dc18-b643-e7c23c460907	6251	Ilirska Bistrica-Trnovo
00050000-5565-dc18-3ac2-356e703d8e4c	1295	Ivančna Gorica
00050000-5565-dc18-ff12-09788efe08d8	2259	Ivanjkovci
00050000-5565-dc18-cafa-ad1000a12561	1411	Izlake
00050000-5565-dc18-5c96-a46c0ad7951e	6310	Izola/Isola
00050000-5565-dc18-452d-47bb98961be0	2222	Jakobski Dol
00050000-5565-dc18-42f6-b0a88dfd75c4	2221	Jarenina
00050000-5565-dc18-f03d-6760aafc1a5b	6254	Jelšane
00050000-5565-dc18-f337-177fba21f8e8	4270	Jesenice
00050000-5565-dc18-726f-bdee98fb4934	8261	Jesenice na Dolenjskem
00050000-5565-dc18-27da-2bd534049de6	3273	Jurklošter
00050000-5565-dc18-95c3-0cf856b9280d	2223	Jurovski Dol
00050000-5565-dc18-39f0-5a32770654d3	2256	Juršinci
00050000-5565-dc18-1a43-da48202773a3	5214	Kal nad Kanalom
00050000-5565-dc18-b6a5-fdfd06472301	3233	Kalobje
00050000-5565-dc18-1fa5-c018d8702150	4246	Kamna Gorica
00050000-5565-dc18-480a-3fd8479f4c05	2351	Kamnica
00050000-5565-dc18-cf42-53dd4d52f0d5	1241	Kamnik
00050000-5565-dc18-175e-9142276e92e9	5213	Kanal
00050000-5565-dc18-821a-6609921315dd	8258	Kapele
00050000-5565-dc18-40e6-37738daba814	2362	Kapla
00050000-5565-dc18-c2b8-69a4fc5aa3cb	2325	Kidričevo
00050000-5565-dc18-1507-43ac8a98f30e	1412	Kisovec
00050000-5565-dc18-54a7-bbfef127466e	6253	Knežak
00050000-5565-dc18-83e0-953187235936	5222	Kobarid
00050000-5565-dc18-bbf7-0c7e7b566b85	9227	Kobilje
00050000-5565-dc18-a9d0-2ac62b62eff0	1330	Kočevje
00050000-5565-dc18-50b3-488a163d2c32	1338	Kočevska Reka
00050000-5565-dc18-5a9a-fd964bbd40af	2276	Kog
00050000-5565-dc18-aa2b-532fc78531df	5211	Kojsko
00050000-5565-dc18-5a00-e21975aac413	6223	Komen
00050000-5565-dc18-2377-ec624551eb4e	1218	Komenda
00050000-5565-dc18-5bc9-0c33b4f63f2f	6000	Koper/Capodistria 
00050000-5565-dc18-1103-4157c27becfd	6001	Koper/Capodistria - poštni predali
00050000-5565-dc18-0978-2feda0522db2	8282	Koprivnica
00050000-5565-dc18-6751-002d9f837394	5296	Kostanjevica na Krasu
00050000-5565-dc18-c3b9-3f20628a1495	8311	Kostanjevica na Krki
00050000-5565-dc18-a651-e212e625460c	1336	Kostel
00050000-5565-dc18-26a8-b9fa2a7f13d2	6256	Košana
00050000-5565-dc18-246a-17eb01c73e43	2394	Kotlje
00050000-5565-dc18-baee-42173b8f9f71	6240	Kozina
00050000-5565-dc18-83f9-0e18bfd3884c	3260	Kozje
00050000-5565-dc18-db2a-7f7a66726266	4000	Kranj 
00050000-5565-dc18-249a-43bc735b9e91	4001	Kranj - poštni predali
00050000-5565-dc18-815e-ab7cb1cb51b1	4280	Kranjska Gora
00050000-5565-dc18-73d1-67bbe05ce799	1281	Kresnice
00050000-5565-dc18-642a-cb99e181c14c	4294	Križe
00050000-5565-dc18-9be4-ec8c56220e8d	9206	Križevci
00050000-5565-dc18-18b5-eb080471b923	9242	Križevci pri Ljutomeru
00050000-5565-dc18-d5c3-7898e50b0ba8	1301	Krka
00050000-5565-dc18-bdf9-899c540f756f	8296	Krmelj
00050000-5565-dc18-126a-9ff4ec9a01f2	4245	Kropa
00050000-5565-dc18-4739-fbdf987b8bf9	8262	Krška vas
00050000-5565-dc18-d821-6a51c93bd005	8270	Krško
00050000-5565-dc18-d49d-58190aaf3d34	9263	Kuzma
00050000-5565-dc18-e5c3-898c9914188d	2318	Laporje
00050000-5565-dc18-e3cc-c0bc2c3a2b55	3270	Laško
00050000-5565-dc18-0748-1bdf95c9ca74	1219	Laze v Tuhinju
00050000-5565-dc18-7f99-083f58702834	2230	Lenart v Slovenskih goricah
00050000-5565-dc18-3adc-a9a2a7cf94bc	9220	Lendava/Lendva
00050000-5565-dc18-4a0c-b4b08c85dd7c	4248	Lesce
00050000-5565-dc18-51d8-355d645c975f	3261	Lesično
00050000-5565-dc18-dd3e-a7dfc61d21e5	8273	Leskovec pri Krškem
00050000-5565-dc18-6b2e-2854bb18284d	2372	Libeliče
00050000-5565-dc18-8778-87d2ddaa9d61	2341	Limbuš
00050000-5565-dc18-808f-b5b49cfdd11a	1270	Litija
00050000-5565-dc18-256c-f55152e75ff2	3202	Ljubečna
00050000-5565-dc18-dcef-fe370482606d	1000	Ljubljana 
00050000-5565-dc18-4a50-d6e13e2806d4	1001	Ljubljana - poštni predali
00050000-5565-dc18-5075-b21343d13710	1231	Ljubljana - Črnuče
00050000-5565-dc18-de66-3e95de110cf6	1261	Ljubljana - Dobrunje
00050000-5565-dc18-67ed-e102a1f43cbb	1260	Ljubljana - Polje
00050000-5565-dc18-a698-0439af596902	1210	Ljubljana - Šentvid
00050000-5565-dc18-ce6b-2c984ef209eb	1211	Ljubljana - Šmartno
00050000-5565-dc18-5025-1c4c4f0b29e2	3333	Ljubno ob Savinji
00050000-5565-dc18-6c4b-fd73339ad0ee	9240	Ljutomer
00050000-5565-dc18-de83-4e9ccf1e344e	3215	Loče
00050000-5565-dc18-67a2-e8fcfb24f9e7	5231	Log pod Mangartom
00050000-5565-dc18-fb42-a86ff52bcb98	1358	Log pri Brezovici
00050000-5565-dc18-dc22-42e7e1abd297	1370	Logatec
00050000-5565-dc18-2342-5326838498cd	1371	Logatec
00050000-5565-dc18-0400-62184ec9d2b7	1434	Loka pri Zidanem Mostu
00050000-5565-dc18-a79f-36d06887f020	3223	Loka pri Žusmu
00050000-5565-dc18-cc27-ed6548c70e0a	6219	Lokev
00050000-5565-dc18-1fdc-50fbc5786c5e	1318	Loški Potok
00050000-5565-dc18-b8e7-b890e7fff6c0	2324	Lovrenc na Dravskem polju
00050000-5565-dc18-cb5a-d5ff169ba3b9	2344	Lovrenc na Pohorju
00050000-5565-dc18-3c3f-02015d760e83	3334	Luče
00050000-5565-dc18-fad5-76c835fecf5d	1225	Lukovica
00050000-5565-dc18-ebf8-081455cac958	9202	Mačkovci
00050000-5565-dc18-f80a-316b49359409	2322	Majšperk
00050000-5565-dc18-2983-5b1e7c4c3f3f	2321	Makole
00050000-5565-dc18-5ec0-290625b0d2b5	9243	Mala Nedelja
00050000-5565-dc18-635c-72c6e9a5d80a	2229	Malečnik
00050000-5565-dc18-2bb0-d8657842f759	6273	Marezige
00050000-5565-dc18-aa04-d11acb3642a1	2000	Maribor 
00050000-5565-dc18-fc7c-d3caf8d5be55	2001	Maribor - poštni predali
00050000-5565-dc18-fe0f-61e7f8255b4f	2206	Marjeta na Dravskem polju
00050000-5565-dc18-40e2-7c83af477362	2281	Markovci
00050000-5565-dc18-8111-710bd6f754ce	9221	Martjanci
00050000-5565-dc18-77fc-f4324b744712	6242	Materija
00050000-5565-dc18-5855-19bd5ce21b53	4211	Mavčiče
00050000-5565-dc18-1460-5358e0b5021f	1215	Medvode
00050000-5565-dc18-9b4e-01fc364569a1	1234	Mengeš
00050000-5565-dc18-4ea5-2edf6f04eb63	8330	Metlika
00050000-5565-dc18-719e-b491b55f187c	2392	Mežica
00050000-5565-dc18-0dde-26f6be83626f	2204	Miklavž na Dravskem polju
00050000-5565-dc18-54d7-c05d2723b116	2275	Miklavž pri Ormožu
00050000-5565-dc18-dc7e-4d183bddb5bc	5291	Miren
00050000-5565-dc18-14c1-ff497ca21315	8233	Mirna
00050000-5565-dc18-b32c-5c101eb15ac7	8216	Mirna Peč
00050000-5565-dc18-9d8c-48d490825214	2382	Mislinja
00050000-5565-dc18-37b7-61de8a015f14	4281	Mojstrana
00050000-5565-dc18-546d-61a44550f774	8230	Mokronog
00050000-5565-dc18-bd60-dc6463e42629	1251	Moravče
00050000-5565-dc18-9ad7-b67f261339ca	9226	Moravske Toplice
00050000-5565-dc18-aaae-b9049c51b502	5216	Most na Soči
00050000-5565-dc18-853b-a34bb99c4c6e	1221	Motnik
00050000-5565-dc18-4e00-7350c628889d	3330	Mozirje
00050000-5565-dc18-0013-74fae13b26e9	9000	Murska Sobota 
00050000-5565-dc18-a31d-8c029a6cf9a5	9001	Murska Sobota - poštni predali
00050000-5565-dc18-55b1-20f4d423ba63	2366	Muta
00050000-5565-dc18-ad15-96ffc1d3287e	4202	Naklo
00050000-5565-dc18-44ab-0a5e613da40e	3331	Nazarje
00050000-5565-dc18-914d-5b8b56dcbb10	1357	Notranje Gorice
00050000-5565-dc18-dd4e-6f12e60ce182	3203	Nova Cerkev
00050000-5565-dc18-20a8-ac6b508b2c62	5000	Nova Gorica 
00050000-5565-dc18-83dd-3b94ef0ceb31	5001	Nova Gorica - poštni predali
00050000-5565-dc18-3b82-bb09acedff8d	1385	Nova vas
00050000-5565-dc18-7c8f-6f612f88a349	8000	Novo mesto
00050000-5565-dc18-543b-a3cb80fce469	8001	Novo mesto - poštni predali
00050000-5565-dc18-ff68-61052e276fc3	6243	Obrov
00050000-5565-dc18-4c29-f103e8e07f25	9233	Odranci
00050000-5565-dc18-b6f7-a57305a34f30	2317	Oplotnica
00050000-5565-dc18-a5e9-29cdbdbb654a	2312	Orehova vas
00050000-5565-dc18-33bc-8c349b2c99ac	2270	Ormož
00050000-5565-dc18-dc8d-65b238911a06	1316	Ortnek
00050000-5565-dc18-2d73-7b94d7a211bb	1337	Osilnica
00050000-5565-dc18-b0b8-ee73e71c868d	8222	Otočec
00050000-5565-dc18-bacb-1b5796b2ef49	2361	Ožbalt
00050000-5565-dc18-1985-9d2a5cf0b14e	2231	Pernica
00050000-5565-dc18-0a0c-93331be0d0c4	2211	Pesnica pri Mariboru
00050000-5565-dc18-8dc8-dc993a196d1f	9203	Petrovci
00050000-5565-dc18-eff2-d81e65efa691	3301	Petrovče
00050000-5565-dc18-e058-143c5c88413a	6330	Piran/Pirano
00050000-5565-dc18-6c57-cdb0dea488d4	8255	Pišece
00050000-5565-dc18-3d95-a9e9f0bb90ec	6257	Pivka
00050000-5565-dc18-ebb6-b3ffbce05b3e	6232	Planina
00050000-5565-dc18-e712-1a98cacfd88b	3225	Planina pri Sevnici
00050000-5565-dc18-f9d3-c5a50ac5c3d3	6276	Pobegi
00050000-5565-dc18-44fd-f4fabfa1c631	8312	Podbočje
00050000-5565-dc18-5860-7694b7a48778	5243	Podbrdo
00050000-5565-dc18-ac62-e01e845b61e9	3254	Podčetrtek
00050000-5565-dc18-4f3e-d013bae23155	2273	Podgorci
00050000-5565-dc18-9bd5-c2b92b8c6666	6216	Podgorje
00050000-5565-dc18-ec03-3d92ec12df15	2381	Podgorje pri Slovenj Gradcu
00050000-5565-dc18-a1e7-5235497fe7d9	6244	Podgrad
00050000-5565-dc18-5605-eb4b4094a502	1414	Podkum
00050000-5565-dc18-0586-44c21e9e89bf	2286	Podlehnik
00050000-5565-dc18-4a09-30217d0b7212	5272	Podnanos
00050000-5565-dc18-4792-4177517cb194	4244	Podnart
00050000-5565-dc18-0727-6c7de6aa227e	3241	Podplat
00050000-5565-dc18-713b-aa4932ce7467	3257	Podsreda
00050000-5565-dc18-b4b2-54f8fea0461d	2363	Podvelka
00050000-5565-dc18-7def-00350be21d61	2208	Pohorje
00050000-5565-dc18-03ab-e6e14a9b7886	2257	Polenšak
00050000-5565-dc18-d49d-9d43609ef55a	1355	Polhov Gradec
00050000-5565-dc18-1310-ddd988f2cfe7	4223	Poljane nad Škofjo Loko
00050000-5565-dc18-5b94-94bf01b273cd	2319	Poljčane
00050000-5565-dc18-71e8-06794be03b79	1272	Polšnik
00050000-5565-dc18-e0f1-7e4d6de65f0b	3313	Polzela
00050000-5565-dc18-f6df-6f000b56a38b	3232	Ponikva
00050000-5565-dc18-3934-af5595556f67	6320	Portorož/Portorose
00050000-5565-dc18-19dc-bb451e995759	6230	Postojna
00050000-5565-dc18-d264-92b8955fa15e	2331	Pragersko
00050000-5565-dc18-58c2-522ed11596e2	3312	Prebold
00050000-5565-dc18-7b86-dc4e7710bb43	4205	Preddvor
00050000-5565-dc18-2413-d50e62ed1668	6255	Prem
00050000-5565-dc18-2497-ed234e0d631d	1352	Preserje
00050000-5565-dc18-3c6d-089f1a2d9642	6258	Prestranek
00050000-5565-dc18-0d12-43a97d94081b	2391	Prevalje
00050000-5565-dc18-82b8-3e836199c9c3	3262	Prevorje
00050000-5565-dc18-3d3a-7a03ad03a3ce	1276	Primskovo 
00050000-5565-dc18-3aaf-16944980adb5	3253	Pristava pri Mestinju
00050000-5565-dc18-31de-e70934d3b2b6	9207	Prosenjakovci/Partosfalva
00050000-5565-dc18-04f6-78a46c4255d5	5297	Prvačina
00050000-5565-dc18-c66e-72bfecccea0f	2250	Ptuj
00050000-5565-dc18-c988-044336b4f0b5	2323	Ptujska Gora
00050000-5565-dc18-c04c-499da660e2fe	9201	Puconci
00050000-5565-dc18-694a-d1d56d6cc7cd	2327	Rače
00050000-5565-dc18-9f88-1a75befc4655	1433	Radeče
00050000-5565-dc18-a416-beca33339c43	9252	Radenci
00050000-5565-dc18-915b-c52bf1cba147	2360	Radlje ob Dravi
00050000-5565-dc18-0d5b-426ab5038e94	1235	Radomlje
00050000-5565-dc18-c0d2-1c6881789646	4240	Radovljica
00050000-5565-dc18-9413-dec1fb05a95b	8274	Raka
00050000-5565-dc18-f1d2-13cb39c7278a	1381	Rakek
00050000-5565-dc18-727c-7b7174b42bce	4283	Rateče - Planica
00050000-5565-dc18-2d77-16b674d26909	2390	Ravne na Koroškem
00050000-5565-dc18-b85a-b7de1090e62a	9246	Razkrižje
00050000-5565-dc18-10a4-003ccc709f82	3332	Rečica ob Savinji
00050000-5565-dc18-418c-bf76354b6bd3	5292	Renče
00050000-5565-dc18-a756-10ef91de0bd8	1310	Ribnica
00050000-5565-dc18-dac9-60a623d47dea	2364	Ribnica na Pohorju
00050000-5565-dc18-4fc3-7fbe66c62fb9	3272	Rimske Toplice
00050000-5565-dc18-34fa-ac2807ef2fa6	1314	Rob
00050000-5565-dc18-3952-f00e31e95d63	5215	Ročinj
00050000-5565-dc18-da23-198b2385da0d	3250	Rogaška Slatina
00050000-5565-dc18-8c09-587dbf9cddd1	9262	Rogašovci
00050000-5565-dc18-8329-3a217185e478	3252	Rogatec
00050000-5565-dc18-573b-30535ea9779a	1373	Rovte
00050000-5565-dc18-a317-12b5791e13b8	2342	Ruše
00050000-5565-dc18-30eb-661a6d0e0149	1282	Sava
00050000-5565-dc18-346f-9dc035c0eaa0	6333	Sečovlje/Sicciole
00050000-5565-dc18-e697-59c752851282	4227	Selca
00050000-5565-dc18-27c8-e2bd5f765a85	2352	Selnica ob Dravi
00050000-5565-dc18-20a1-f4c0c27f4749	8333	Semič
00050000-5565-dc18-0670-3a56871d37c2	8281	Senovo
00050000-5565-dc18-89dd-893e83c571de	6224	Senožeče
00050000-5565-dc18-8560-54ba088045c3	8290	Sevnica
00050000-5565-dc18-3018-45cdab3d8922	6210	Sežana
00050000-5565-dc18-e083-64fe86d0adbb	2214	Sladki Vrh
00050000-5565-dc18-104c-41fb9d634814	5283	Slap ob Idrijci
00050000-5565-dc18-5cc0-03265b9bf6c6	2380	Slovenj Gradec
00050000-5565-dc18-6d5d-e42734705efd	2310	Slovenska Bistrica
00050000-5565-dc18-74b3-b612f23e571d	3210	Slovenske Konjice
00050000-5565-dc18-03a9-aca08efa9cfb	1216	Smlednik
00050000-5565-dc18-e999-fb65dd66473e	5232	Soča
00050000-5565-dc18-5824-714209e43d72	1317	Sodražica
00050000-5565-dc18-26a2-d7a941f0df48	3335	Solčava
00050000-5565-dc18-2fe2-4a74dc89ebb6	5250	Solkan
00050000-5565-dc18-96db-b34b9c02e764	4229	Sorica
00050000-5565-dc18-071f-e1d65a64c736	4225	Sovodenj
00050000-5565-dc18-0918-706fa196ca96	5281	Spodnja Idrija
00050000-5565-dc18-15be-7c2b4c589c7d	2241	Spodnji Duplek
00050000-5565-dc18-f336-548780c70be8	9245	Spodnji Ivanjci
00050000-5565-dc18-f68d-a1f52f7a24ec	2277	Središče ob Dravi
00050000-5565-dc18-70d9-f1f9b471391e	4267	Srednja vas v Bohinju
00050000-5565-dc18-afa8-d400fc85a24a	8256	Sromlje 
00050000-5565-dc18-510b-562b2999adcb	5224	Srpenica
00050000-5565-dc18-0360-7df8e252f7fd	1242	Stahovica
00050000-5565-dc18-3f58-942533bff75b	1332	Stara Cerkev
00050000-5565-dc18-86f1-71e07456444e	8342	Stari trg ob Kolpi
00050000-5565-dc18-d178-83b5795dda41	1386	Stari trg pri Ložu
00050000-5565-dc18-337e-a4de96dae72f	2205	Starše
00050000-5565-dc18-017c-1d7b83ef395a	2289	Stoperce
00050000-5565-dc18-257e-41ba0e3cc41e	8322	Stopiče
00050000-5565-dc18-c891-7220cb60c561	3206	Stranice
00050000-5565-dc18-f902-ab2285ed3148	8351	Straža
00050000-5565-dc18-8fec-3e6d04768070	1313	Struge
00050000-5565-dc18-d2ba-fe66e4186ed7	8293	Studenec
00050000-5565-dc18-dd94-3c48ff7f1e84	8331	Suhor
00050000-5565-dc18-1fc5-987b7b7f5725	2233	Sv. Ana v Slovenskih goricah
00050000-5565-dc18-1b38-12f90544e6e2	2235	Sv. Trojica v Slovenskih goricah
00050000-5565-dc18-858c-667b453a557f	2353	Sveti Duh na Ostrem Vrhu
00050000-5565-dc18-c476-4179d342b99b	9244	Sveti Jurij ob Ščavnici
00050000-5565-dc18-8efd-59d3dc3bc545	3264	Sveti Štefan
00050000-5565-dc18-5bbb-db3a4dfe6ec2	2258	Sveti Tomaž
00050000-5565-dc18-d4a5-2d745f5afc2d	9204	Šalovci
00050000-5565-dc18-6c32-11bb034a462a	5261	Šempas
00050000-5565-dc18-2feb-88b575eb6dd9	5290	Šempeter pri Gorici
00050000-5565-dc18-646c-2a47f7157543	3311	Šempeter v Savinjski dolini
00050000-5565-dc18-2612-b337d69578a0	4208	Šenčur
00050000-5565-dc18-27eb-5517dfa34419	2212	Šentilj v Slovenskih goricah
00050000-5565-dc18-2d15-23a7892e08e3	8297	Šentjanž
00050000-5565-dc18-2c61-06a9eece97da	2373	Šentjanž pri Dravogradu
00050000-5565-dc18-1769-41eb8b79692b	8310	Šentjernej
00050000-5565-dc18-238c-0614e4c35b84	3230	Šentjur
00050000-5565-dc18-38e1-d2f0fa158153	3271	Šentrupert
00050000-5565-dc18-008e-331f00dd2a42	8232	Šentrupert
00050000-5565-dc18-9f66-b077ef8c1478	1296	Šentvid pri Stični
00050000-5565-dc18-c641-637a03a8264b	8275	Škocjan
00050000-5565-dc18-fa6f-f5d63acf2781	6281	Škofije
00050000-5565-dc18-a733-0c87e9045936	4220	Škofja Loka
00050000-5565-dc18-3fcc-7ea2e6076ac5	3211	Škofja vas
00050000-5565-dc18-6b9b-683749165526	1291	Škofljica
00050000-5565-dc18-f946-662693597792	6274	Šmarje
00050000-5565-dc18-0826-d13a45666255	1293	Šmarje - Sap
00050000-5565-dc18-f901-a213db991548	3240	Šmarje pri Jelšah
00050000-5565-dc18-2377-dda035e7d8bb	8220	Šmarješke Toplice
00050000-5565-dc18-cae6-986aeca443ba	2315	Šmartno na Pohorju
00050000-5565-dc18-87fe-ee50bcd33c64	3341	Šmartno ob Dreti
00050000-5565-dc18-101f-15e7cf6c248a	3327	Šmartno ob Paki
00050000-5565-dc18-7954-41a5d445b0d2	1275	Šmartno pri Litiji
00050000-5565-dc18-325c-62fdc83edd2e	2383	Šmartno pri Slovenj Gradcu
00050000-5565-dc18-8409-2653bda05201	3201	Šmartno v Rožni dolini
00050000-5565-dc18-4111-dd9dc059cb27	3325	Šoštanj
00050000-5565-dc18-b2d6-a59f0290ae85	6222	Štanjel
00050000-5565-dc18-e620-a72ee62ba177	3220	Štore
00050000-5565-dc18-0a6f-21732efcf458	3304	Tabor
00050000-5565-dc18-d9ed-a72f2eb8eca1	3221	Teharje
00050000-5565-dc18-4c4a-b1f2c62c2043	9251	Tišina
00050000-5565-dc18-987a-b58225533a8a	5220	Tolmin
00050000-5565-dc18-fca5-ed95b68fddda	3326	Topolšica
00050000-5565-dc18-5e4b-f65932ba366a	2371	Trbonje
00050000-5565-dc18-fd18-5a84e06891f8	1420	Trbovlje
00050000-5565-dc18-b05f-3201729e5a99	8231	Trebelno 
00050000-5565-dc18-fae2-d6a26ce92755	8210	Trebnje
00050000-5565-dc18-5ff3-46b529294c47	5252	Trnovo pri Gorici
00050000-5565-dc18-8bea-ccab82bae810	2254	Trnovska vas
00050000-5565-dc18-1270-80d379f5ab80	1222	Trojane
00050000-5565-dc18-3055-cd9f3c5e9cf6	1236	Trzin
00050000-5565-dc18-d04b-818072dfd6ab	4290	Tržič
00050000-5565-dc18-40f7-8221aa629945	8295	Tržišče
00050000-5565-dc18-2f67-d69621e2b3ea	1311	Turjak
00050000-5565-dc18-f54a-070d7f85a851	9224	Turnišče
00050000-5565-dc18-bfa6-57b1cdf6b4a6	8323	Uršna sela
00050000-5565-dc18-3c2d-d9285fd9b1ca	1252	Vače
00050000-5565-dc18-32fb-bff26fbfdad6	3320	Velenje 
00050000-5565-dc18-2408-7058dc8d7d90	3322	Velenje - poštni predali
00050000-5565-dc18-24f8-4a06d81ffcce	8212	Velika Loka
00050000-5565-dc18-c038-ddef37dc906b	2274	Velika Nedelja
00050000-5565-dc18-0748-17b9a736e4ed	9225	Velika Polana
00050000-5565-dc18-5e7c-abb8ca298732	1315	Velike Lašče
00050000-5565-dc18-1c52-c1f9f1cc8473	8213	Veliki Gaber
00050000-5565-dc18-e85e-45906bec17f8	9241	Veržej
00050000-5565-dc18-2de9-b0e3ca6d8261	1312	Videm - Dobrepolje
00050000-5565-dc18-8f2e-6f4aabca2015	2284	Videm pri Ptuju
00050000-5565-dc18-3f92-0cc2d302485c	8344	Vinica
00050000-5565-dc18-44bb-91d01f88e4ce	5271	Vipava
00050000-5565-dc18-d2fb-15cf3cf1072a	4212	Visoko
00050000-5565-dc18-d701-a9889f96c98f	1294	Višnja Gora
00050000-5565-dc18-e27a-1442a1668a8c	3205	Vitanje
00050000-5565-dc18-6f39-a60e1780f8e4	2255	Vitomarci
00050000-5565-dc18-2405-8f28a5b3869f	1217	Vodice
00050000-5565-dc18-d533-ac5f3ec837a0	3212	Vojnik\t
00050000-5565-dc18-f1d3-f5b2b1442a0b	5293	Volčja Draga
00050000-5565-dc18-2e72-ab1bfa8cf1ee	2232	Voličina
00050000-5565-dc18-c36c-cc713067c373	3305	Vransko
00050000-5565-dc18-2d30-fe5408ffd766	6217	Vremski Britof
00050000-5565-dc18-cb97-ba910457ee6b	1360	Vrhnika
00050000-5565-dc18-48a5-238a2b106941	2365	Vuhred
00050000-5565-dc18-546a-010a31667400	2367	Vuzenica
00050000-5565-dc18-60a8-3c0de1b8aade	8292	Zabukovje 
00050000-5565-dc18-76a5-c764c1ae5bbf	1410	Zagorje ob Savi
00050000-5565-dc18-4f11-abf0caf8cf07	1303	Zagradec
00050000-5565-dc18-7927-bc747b175b78	2283	Zavrč
00050000-5565-dc18-8091-10f5b479bc86	8272	Zdole 
00050000-5565-dc18-7d76-59655f8d5808	4201	Zgornja Besnica
00050000-5565-dc18-91d3-84a164085568	2242	Zgornja Korena
00050000-5565-dc18-f2c2-61cc05b7adc1	2201	Zgornja Kungota
00050000-5565-dc18-06db-b3a354bf75b1	2316	Zgornja Ložnica
00050000-5565-dc18-8668-212415f95ee3	2314	Zgornja Polskava
00050000-5565-dc18-ade9-fbfda5588fbe	2213	Zgornja Velka
00050000-5565-dc18-610f-ff0ed5d31143	4247	Zgornje Gorje
00050000-5565-dc18-f6fb-8197927799f4	4206	Zgornje Jezersko
00050000-5565-dc18-5563-216f67f4e780	2285	Zgornji Leskovec
00050000-5565-dc18-d889-f613fd2bccb3	1432	Zidani Most
00050000-5565-dc18-1e05-c8144021245d	3214	Zreče
00050000-5565-dc18-3fac-c4b76553ab35	4209	Žabnica
00050000-5565-dc18-2254-424cfffe9b07	3310	Žalec
00050000-5565-dc18-79c1-a017300661e0	4228	Železniki
00050000-5565-dc18-8b15-40204126c580	2287	Žetale
00050000-5565-dc18-2eab-1450a2a2e23a	4226	Žiri
00050000-5565-dc18-c469-826d7391291b	4274	Žirovnica
00050000-5565-dc18-2b3d-39a78faecaa6	8360	Žužemberk
\.


--
-- TOC entry 2721 (class 0 OID 5370234)
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
-- TOC entry 2703 (class 0 OID 5370049)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2709 (class 0 OID 5370127)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2723 (class 0 OID 5370246)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2736 (class 0 OID 5370366)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2740 (class 0 OID 5370417)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2727 (class 0 OID 5370275)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5565-dc1a-f505-e4de184343b4	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5565-dc1a-3672-cc517c28d983	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5565-dc1a-0024-0f1e554a28c4	0003	Kazinska	t	84	Kazinska dvorana
00220000-5565-dc1a-ac53-2ae82f0f056a	0004	Mali oder	t	24	Mali oder 
00220000-5565-dc1a-b5f1-36e21b112916	0005	Komorni oder	t	15	Komorni oder
00220000-5565-dc1a-1937-f149a0dcbe50	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5565-dc1a-188a-4825f847ce87	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2719 (class 0 OID 5370219)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2718 (class 0 OID 5370209)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2739 (class 0 OID 5370406)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2734 (class 0 OID 5370343)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2692 (class 0 OID 5369923)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5565-dc19-7a61-e2fdd4fa154a	00010000-5565-dc19-9bab-2174d7c03dd7	2015-05-27 17:00:42	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRORSuXQnNbt3MtNmf/lrmjuTKGsg2xWKu";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2757 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2728 (class 0 OID 5370285)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2696 (class 0 OID 5369961)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5565-dc19-eadb-917b9d9e6f83	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5565-dc19-f995-12c84e0b2685	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5565-dc19-ac2d-dc29116dac10	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5565-dc19-a944-3f8819f8aa4b	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5565-dc19-4e28-e8e386da458b	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5565-dc19-df1f-dffac9e215d5	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2694 (class 0 OID 5369945)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5565-dc19-7a61-e2fdd4fa154a	00020000-5565-dc19-a944-3f8819f8aa4b
00010000-5565-dc19-9bab-2174d7c03dd7	00020000-5565-dc19-a944-3f8819f8aa4b
\.


--
-- TOC entry 2730 (class 0 OID 5370299)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2722 (class 0 OID 5370240)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2716 (class 0 OID 5370190)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2748 (class 0 OID 5370514)
-- Dependencies: 230
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5565-dc18-ded8-87e2174c7a10	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5565-dc18-3d3a-ae77cdeb088e	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5565-dc18-a1d5-7173410cd109	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5565-dc18-21c0-b70dedc4c4f7	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5565-dc18-8285-1b5bfae16ea1	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2747 (class 0 OID 5370507)
-- Dependencies: 229
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5565-dc18-c0be-fe054a583902	00000000-5565-dc18-21c0-b70dedc4c4f7	popa
00000000-5565-dc18-ae90-405fcfa4a840	00000000-5565-dc18-21c0-b70dedc4c4f7	oseba
00000000-5565-dc18-4a02-845fb0a23057	00000000-5565-dc18-3d3a-ae77cdeb088e	prostor
00000000-5565-dc18-1ddc-406e75d6aa3e	00000000-5565-dc18-21c0-b70dedc4c4f7	besedilo
00000000-5565-dc18-d684-5e37c70c3700	00000000-5565-dc18-21c0-b70dedc4c4f7	uprizoritev
00000000-5565-dc18-58f2-e6a7047201b0	00000000-5565-dc18-21c0-b70dedc4c4f7	funkcija
00000000-5565-dc18-464d-753b65f2eb52	00000000-5565-dc18-21c0-b70dedc4c4f7	tipfunkcije
00000000-5565-dc18-bba4-05f3590ca75a	00000000-5565-dc18-21c0-b70dedc4c4f7	alternacija
\.


--
-- TOC entry 2746 (class 0 OID 5370502)
-- Dependencies: 228
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2735 (class 0 OID 5370353)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2701 (class 0 OID 5370021)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2717 (class 0 OID 5370196)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2738 (class 0 OID 5370395)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5565-dc18-5933-61e1a5993a09	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5565-dc18-c853-41e077fe456a	Baletnik ali plesalec	Baletniki in plesalci	\N	Baletnica ali plesalka	igralec
000f0000-5565-dc18-9c56-082bdd824965	Avtor	Avtorji	\N	Avtorka	umetnik
000f0000-5565-dc18-3559-b4bb781e7e47	Režiser	Režiserji	\N	Režiserka	umetnik
000f0000-5565-dc18-2687-513e852d728b	Scenograf	Scenografi	\N	Scenografka	tehnik
000f0000-5565-dc18-0fc4-1c3a7c6f04d9	Kostumograf	Kostumografi	\N	Kostumografinja	tehnik
000f0000-5565-dc18-0e52-337bf4d7583f	Oblikovalec maske	Oblikovalci maske	\N	Oblikovalka maske	tehnik
000f0000-5565-dc18-cb77-579a4a22aeea	Avtor glasbe	Avtorji glasbe	\N	Avtorica glasbe	umetnik
000f0000-5565-dc18-23b7-d37a83870d5e	Oblikovalec svetlobe	Oblikovalci svetlobe	\N	Oblikovalka svetlobe	tehnik
000f0000-5565-dc18-b88d-a7bfe570d718	Koreograf	Koreografi	\N	Koreografinja	umetnik
000f0000-5565-dc18-5b06-4ec7e0946be3	Dramaturg	Dramaturgi	\N	Dramaturginja	umetnik
000f0000-5565-dc18-ff4f-a0264e7429fd	Lektorj	Lektorji	\N	Lektorica	umetnik
000f0000-5565-dc18-180f-5f62314d0914	Prevajalec	Prevajalci	\N	Prevajalka	umetnik
000f0000-5565-dc18-3209-460166b85b77	Oblikovalec videa	Oblikovalci videa	\N	Oblikovalka videa	umetnik
000f0000-5565-dc18-0fbd-be8b3c401466	Intermedijski ustvarjalec	Intermedijski ustvarjalci	\N	Intermedijska ustvarjalka	umetnik
000f0000-5565-dc18-826b-0d9c2db91575	Nerazvrščeno	Nerazvrščeno	\N	Nerazvrščeno	\N
\.


--
-- TOC entry 2706 (class 0 OID 5370084)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2693 (class 0 OID 5369932)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5565-dc19-9bab-2174d7c03dd7	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO7cVvHjMLDNswXHoFNLI14ptl1kzxJsy	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5565-dc19-10fb-570e77f4296b	Jani	$2y$05$NS4xMjkyMTcwMzExMjAxROjMDiK9Bwp4jCOlglaZ/2nFfw1HWQal6	t	\N	\N	\N	jani@ifigenija.si	\N	\N	\N
00010000-5565-dc19-910c-0d189fcf2bb0	Tona	$2y$05$NS4xMjkyMTcwMzExMjAxRO3sKjXYp0kstaST/9euhKkLOqhQ8Z2iW	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5565-dc19-f75b-dbf004caab90	Ivo	$2y$05$NS4xMjkyMTcwMzExMjAxRO17U.3uWTBsn4qvEsnIVf5Xs3st19ky.	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5565-dc19-0797-c81ea19e34ac	Jože	$2y$05$NS4xMjkyMTcwMzExMjAxROqIB8yBQLxM7iZ6ORDnmiqyjjZugUaym	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5565-dc19-6fc5-07d7da27c0b9	Marko	$2y$05$NS4xMjkyMTcwMzExMjAxROcUWIlHzCs0qvjLqP9Map20hbcfcxJTG	t	\N	\N	\N	marko@ifigenija.si	\N	\N	\N
00010000-5565-dc19-bee4-2e98b8a961a0	Marija	$2y$05$NS4xMjkyMTcwMzExMjAxROud2UC6ZthobFSTlPBK5XMHtvrBjer5C	t	\N	\N	\N	marija@ifigenija.si	\N	\N	\N
00010000-5565-dc19-1a6d-8af3054dc413	Ana	$2y$05$NS4xMjkyMTcwMzExMjAxROb145UZuF/tCrWtTq/QbBDM/NW.lkqW2	t	\N	\N	\N	ana@ifigenija.si	\N	\N	\N
00010000-5565-dc19-2169-33e4c637f7e3	Maja	$2y$05$NS4xMjkyMTcwMzExMjAxROjkK66S7WWkqjCXWS5aAhQaBFeeC01/6	t	\N	\N	\N	maja@ifigenija.si	\N	\N	\N
00010000-5565-dc19-1efa-bb55fca6034f	Irena	$2y$05$NS4xMjkyMTcwMzExMjAxROIH43uvJfRgGgURmSioeRelRokyeARfG	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5565-dc19-30dc-b950038ac3b2	Mojca	$2y$05$NS4xMjkyMTcwMzExMjAxROp3bUGtUHFoCfhC63ttwALnzBpi6r2UK	t	\N	\N	\N	mojca@ifigenija.si	\N	\N	\N
00010000-5565-dc19-7a61-e2fdd4fa154a	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2743 (class 0 OID 5370450)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5565-dc1a-10f3-fcc0cfb52be8	00160000-5565-dc19-f1fb-0d81bf0e5abc	00150000-5565-dc18-a8d3-dba0c9ae9cfb	00140000-5565-dc18-9d0c-6b9bdacb79ed	0001	produkcija	Sen kresne noči		Sanje	2016-02-01	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5565-dc1a-b5f1-36e21b112916
000e0000-5565-dc1a-0995-35cb8ea29d09	00160000-5565-dc19-e8d0-6b8aac1a9206	00150000-5565-dc18-0020-a15bb539623f	00140000-5565-dc18-f14c-dd816121e519	0002	predprodukcija-ideja	Smoletov vrt			2017-01-01	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5565-dc1a-1937-f149a0dcbe50
\.


--
-- TOC entry 2711 (class 0 OID 5370142)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2726 (class 0 OID 5370267)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2733 (class 0 OID 5370335)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2713 (class 0 OID 5370174)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2742 (class 0 OID 5370440)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-5565-dc18-9d0c-6b9bdacb79ed	Drama	drama (SURS 01)
00140000-5565-dc18-ea38-4895caa78718	Opera	opera (SURS 02)
00140000-5565-dc18-0031-97878f79bee2	Balet	balet (SURS 03)
00140000-5565-dc18-0c36-7c001ff525d6	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5565-dc18-e03a-eb05011d443c	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5565-dc18-f14c-dd816121e519	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5565-dc18-cdc3-69faab8fe37e	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2732 (class 0 OID 5370325)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-5565-dc18-b562-ea5cdb3e395a	Opera	opera
00150000-5565-dc18-3b43-0ad85edb141d	Opereta	opereta
00150000-5565-dc18-24ea-48d0f0f963d6	Balet	balet
00150000-5565-dc18-f385-0d7572f3216d	Plesne prireditve	plesne prireditve
00150000-5565-dc18-ae9e-5ad2412e939e	Lutkovno gledališče	lutkovno gledališče
00150000-5565-dc18-96c5-17829a909fae	Raziskovalno gledališče	raziskovalno gledališče
00150000-5565-dc18-138e-df2337f039e3	Biografska drama	biografska drama
00150000-5565-dc18-a8d3-dba0c9ae9cfb	Komedija	komedija
00150000-5565-dc18-49cb-042d697f9122	Črna komedija	črna komedija
00150000-5565-dc18-5e91-2f80c2530dfc	E-igra	E-igra
00150000-5565-dc18-0020-a15bb539623f	Kriminalka	kriminalka
00150000-5565-dc18-51e0-47eafcaa5f21	Musical	musical
\.


--
-- TOC entry 2313 (class 2606 OID 5369986)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 5370495)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 5370485)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 5370394)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2367 (class 2606 OID 5370164)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 5370189)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 5370110)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 5370321)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2361 (class 2606 OID 5370140)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 5370183)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2354 (class 2606 OID 5370124)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2284 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 5370232)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 5370259)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 5370082)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2317 (class 2606 OID 5369995)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2294 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2319 (class 2606 OID 5370018)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2311 (class 2606 OID 5369975)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2304 (class 2606 OID 5369960)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 5370265)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 5370298)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 5370435)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 5370046)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2336 (class 2606 OID 5370070)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2408 (class 2606 OID 5370238)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2290 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2334 (class 2606 OID 5370060)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2359 (class 2606 OID 5370131)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 5370250)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2458 (class 2606 OID 5370378)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 5370422)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 5370282)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 5370223)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 5370214)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 5370416)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 5370350)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2296 (class 2606 OID 5369931)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2429 (class 2606 OID 5370289)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2302 (class 2606 OID 5369949)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2306 (class 2606 OID 5369969)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2436 (class 2606 OID 5370307)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 5370245)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 5370195)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 5370520)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 5370511)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 5370506)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 5370363)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 5370026)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2390 (class 2606 OID 5370205)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 5370405)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2344 (class 2606 OID 5370095)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 5369944)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 5370465)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2365 (class 2606 OID 5370149)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 5370273)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 5370341)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2378 (class 2606 OID 5370178)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 5370449)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 5370334)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 1259 OID 5370171)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2451 (class 1259 OID 5370364)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2452 (class 1259 OID 5370365)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2326 (class 1259 OID 5370048)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2286 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2287 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2288 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2417 (class 1259 OID 5370266)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2411 (class 1259 OID 5370252)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2412 (class 1259 OID 5370251)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2363 (class 1259 OID 5370150)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2439 (class 1259 OID 5370324)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2440 (class 1259 OID 5370322)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2441 (class 1259 OID 5370323)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2351 (class 1259 OID 5370126)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2352 (class 1259 OID 5370125)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2468 (class 1259 OID 5370437)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2469 (class 1259 OID 5370438)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2470 (class 1259 OID 5370439)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2476 (class 1259 OID 5370470)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2477 (class 1259 OID 5370467)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2478 (class 1259 OID 5370469)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2479 (class 1259 OID 5370468)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2341 (class 1259 OID 5370097)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2342 (class 1259 OID 5370096)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2291 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2292 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2427 (class 1259 OID 5370290)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2381 (class 1259 OID 5370184)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2308 (class 1259 OID 5369976)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2309 (class 1259 OID 5369977)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2432 (class 1259 OID 5370310)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2433 (class 1259 OID 5370309)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2434 (class 1259 OID 5370308)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2355 (class 1259 OID 5370132)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2356 (class 1259 OID 5370134)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2357 (class 1259 OID 5370133)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2497 (class 1259 OID 5370513)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2391 (class 1259 OID 5370218)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2392 (class 1259 OID 5370216)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2393 (class 1259 OID 5370215)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2394 (class 1259 OID 5370217)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2299 (class 1259 OID 5369950)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2300 (class 1259 OID 5369951)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2420 (class 1259 OID 5370274)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2406 (class 1259 OID 5370239)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2447 (class 1259 OID 5370351)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2448 (class 1259 OID 5370352)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2330 (class 1259 OID 5370062)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2331 (class 1259 OID 5370061)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2332 (class 1259 OID 5370063)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2455 (class 1259 OID 5370379)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2456 (class 1259 OID 5370380)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2489 (class 1259 OID 5370499)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2490 (class 1259 OID 5370498)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2491 (class 1259 OID 5370501)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2492 (class 1259 OID 5370497)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2493 (class 1259 OID 5370500)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2444 (class 1259 OID 5370342)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2397 (class 1259 OID 5370227)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2398 (class 1259 OID 5370226)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2399 (class 1259 OID 5370224)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2400 (class 1259 OID 5370225)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2282 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2485 (class 1259 OID 5370487)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2486 (class 1259 OID 5370486)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2362 (class 1259 OID 5370141)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2314 (class 1259 OID 5369997)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2315 (class 1259 OID 5369996)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2322 (class 1259 OID 5370027)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2323 (class 1259 OID 5370028)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2386 (class 1259 OID 5370208)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2387 (class 1259 OID 5370207)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2388 (class 1259 OID 5370206)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2369 (class 1259 OID 5370173)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2370 (class 1259 OID 5370169)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2371 (class 1259 OID 5370166)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2372 (class 1259 OID 5370167)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2373 (class 1259 OID 5370165)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2374 (class 1259 OID 5370170)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2375 (class 1259 OID 5370168)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2329 (class 1259 OID 5370047)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2347 (class 1259 OID 5370111)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2348 (class 1259 OID 5370113)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2349 (class 1259 OID 5370112)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2350 (class 1259 OID 5370114)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2405 (class 1259 OID 5370233)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2473 (class 1259 OID 5370436)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2480 (class 1259 OID 5370466)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2320 (class 1259 OID 5370019)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2321 (class 1259 OID 5370020)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2503 (class 1259 OID 5370521)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2340 (class 1259 OID 5370083)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2500 (class 1259 OID 5370512)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2425 (class 1259 OID 5370284)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2426 (class 1259 OID 5370283)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2494 (class 1259 OID 5370496)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2285 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2337 (class 1259 OID 5370071)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2467 (class 1259 OID 5370423)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2307 (class 1259 OID 5369970)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2376 (class 1259 OID 5370172)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2528 (class 2606 OID 5370652)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2531 (class 2606 OID 5370637)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2530 (class 2606 OID 5370642)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2526 (class 2606 OID 5370662)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2532 (class 2606 OID 5370632)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2527 (class 2606 OID 5370657)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2529 (class 2606 OID 5370647)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2562 (class 2606 OID 5370807)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2561 (class 2606 OID 5370812)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2513 (class 2606 OID 5370567)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2549 (class 2606 OID 5370747)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2547 (class 2606 OID 5370742)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2548 (class 2606 OID 5370737)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2525 (class 2606 OID 5370627)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2555 (class 2606 OID 5370787)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2557 (class 2606 OID 5370777)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2556 (class 2606 OID 5370782)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2519 (class 2606 OID 5370602)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2520 (class 2606 OID 5370597)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2545 (class 2606 OID 5370727)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2568 (class 2606 OID 5370832)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2567 (class 2606 OID 5370837)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2566 (class 2606 OID 5370842)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2569 (class 2606 OID 5370862)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2572 (class 2606 OID 5370847)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2570 (class 2606 OID 5370857)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2571 (class 2606 OID 5370852)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2517 (class 2606 OID 5370592)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 5370587)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2510 (class 2606 OID 5370552)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2551 (class 2606 OID 5370757)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2533 (class 2606 OID 5370667)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2507 (class 2606 OID 5370532)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2506 (class 2606 OID 5370537)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2552 (class 2606 OID 5370772)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2553 (class 2606 OID 5370767)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2554 (class 2606 OID 5370762)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2523 (class 2606 OID 5370607)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2521 (class 2606 OID 5370617)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2522 (class 2606 OID 5370612)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2580 (class 2606 OID 5370902)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2537 (class 2606 OID 5370702)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2539 (class 2606 OID 5370692)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2540 (class 2606 OID 5370687)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2538 (class 2606 OID 5370697)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2505 (class 2606 OID 5370522)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2504 (class 2606 OID 5370527)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2550 (class 2606 OID 5370752)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2546 (class 2606 OID 5370732)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2560 (class 2606 OID 5370797)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2559 (class 2606 OID 5370802)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2515 (class 2606 OID 5370577)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2516 (class 2606 OID 5370572)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2514 (class 2606 OID 5370582)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2564 (class 2606 OID 5370817)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2563 (class 2606 OID 5370822)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2577 (class 2606 OID 5370887)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2578 (class 2606 OID 5370882)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2575 (class 2606 OID 5370897)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2579 (class 2606 OID 5370877)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2576 (class 2606 OID 5370892)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2558 (class 2606 OID 5370792)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2541 (class 2606 OID 5370722)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2542 (class 2606 OID 5370717)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2544 (class 2606 OID 5370707)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2543 (class 2606 OID 5370712)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2573 (class 2606 OID 5370872)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2574 (class 2606 OID 5370867)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2524 (class 2606 OID 5370622)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2565 (class 2606 OID 5370827)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2508 (class 2606 OID 5370547)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2509 (class 2606 OID 5370542)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2512 (class 2606 OID 5370557)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2511 (class 2606 OID 5370562)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2534 (class 2606 OID 5370682)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2535 (class 2606 OID 5370677)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2536 (class 2606 OID 5370672)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-27 17:00:43 CEST

--
-- PostgreSQL database dump complete
--

