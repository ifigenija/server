--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-06-01 09:13:20 CEST

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
-- TOC entry 180 (class 1259 OID 5583871)
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
-- TOC entry 227 (class 1259 OID 5584382)
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
-- TOC entry 226 (class 1259 OID 5584365)
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
-- TOC entry 219 (class 1259 OID 5584275)
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
-- TOC entry 194 (class 1259 OID 5584045)
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
-- TOC entry 197 (class 1259 OID 5584079)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 5583992)
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
-- TOC entry 213 (class 1259 OID 5584205)
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
-- TOC entry 192 (class 1259 OID 5584029)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 196 (class 1259 OID 5584073)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 5584009)
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
-- TOC entry 202 (class 1259 OID 5584122)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 5584147)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 5583966)
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
-- TOC entry 181 (class 1259 OID 5583880)
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
-- TOC entry 182 (class 1259 OID 5583891)
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
-- TOC entry 177 (class 1259 OID 5583845)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 5583864)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 5584154)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 5584185)
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
-- TOC entry 223 (class 1259 OID 5584318)
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
-- TOC entry 184 (class 1259 OID 5583923)
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
-- TOC entry 186 (class 1259 OID 5583958)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 5584128)
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
-- TOC entry 185 (class 1259 OID 5583943)
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
-- TOC entry 191 (class 1259 OID 5584021)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 5584140)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 5584260)
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
-- TOC entry 222 (class 1259 OID 5584311)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 5584169)
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
-- TOC entry 201 (class 1259 OID 5584113)
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
-- TOC entry 200 (class 1259 OID 5584103)
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
-- TOC entry 221 (class 1259 OID 5584300)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 5584237)
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
-- TOC entry 174 (class 1259 OID 5583816)
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
-- TOC entry 173 (class 1259 OID 5583814)
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
-- TOC entry 210 (class 1259 OID 5584179)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 5583854)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 5583838)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 5584193)
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
-- TOC entry 204 (class 1259 OID 5584134)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 5584084)
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
-- TOC entry 230 (class 1259 OID 5584408)
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
-- TOC entry 229 (class 1259 OID 5584401)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 5584396)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 5584247)
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
-- TOC entry 183 (class 1259 OID 5583915)
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
-- TOC entry 199 (class 1259 OID 5584090)
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
-- TOC entry 220 (class 1259 OID 5584289)
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
-- TOC entry 188 (class 1259 OID 5583978)
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
-- TOC entry 175 (class 1259 OID 5583825)
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
-- TOC entry 225 (class 1259 OID 5584344)
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
-- TOC entry 193 (class 1259 OID 5584036)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 5584161)
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
-- TOC entry 215 (class 1259 OID 5584229)
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
-- TOC entry 195 (class 1259 OID 5584068)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 5584334)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 5584219)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2144 (class 2604 OID 5583819)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2699 (class 0 OID 5583871)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2746 (class 0 OID 5584382)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
000c0000-556c-060f-3676-9833f44c896a	000d0000-556c-060f-217b-4516d7541ed7	\N	00090000-556c-060f-3e08-cb7cba3d4c71	\N	\N	0001	f	\N	\N	\N	\N	\N	\N
000c0000-556c-060f-9cd2-5c18ec49a730	000d0000-556c-060f-a3cb-811ba3ef6e03	\N	00090000-556c-060f-3c38-fa3a7ec60703	\N	\N	0002	f	\N	\N	\N	\N	\N	\N
000c0000-556c-060f-9a6e-ce65ef5a9227	000d0000-556c-060f-13ba-7b93a3917251	\N	00090000-556c-060f-5da0-b6172ff25a5d	\N	\N	0003	f	\N	\N	\N	\N	\N	\N
000c0000-556c-060f-8069-d4cca862c50f	000d0000-556c-060f-2b0f-6f19523f52f7	\N	00090000-556c-060f-77e8-123a8ec6b4e2	\N	\N	0004	f	\N	\N	\N	\N	\N	\N
000c0000-556c-060f-1d15-c13a76548e28	000d0000-556c-060f-6260-6254ae558d02	\N	00090000-556c-060f-ec72-4be0afcfd213	\N	\N	0005	f	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2745 (class 0 OID 5584365)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2738 (class 0 OID 5584275)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-556c-060f-9d3d-8703a1f65a11	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-556c-060f-8b72-66292f8416a6	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-556c-060f-a779-9b88c78525bb	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 2713 (class 0 OID 5584045)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-556c-060f-33e8-4614bfb9f4ed	\N	\N	00200000-556c-060f-46bf-38c3d420ae83	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	4			
00180000-556c-060f-8212-e513d60b4fc4	\N	\N	00200000-556c-060f-8c19-b5f19797fa4d	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
\.


--
-- TOC entry 2716 (class 0 OID 5584079)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2708 (class 0 OID 5583992)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-556c-060e-eb65-cc95192430dd	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-556c-060e-31c8-71e051183279	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-556c-060e-dfcb-c2fe2f115b24	AL	ALB	008	Albania 	Albanija	\N
00040000-556c-060e-0bd6-f5f68b12fe79	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-556c-060e-226e-adad1dd2e9c1	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-556c-060e-b847-305ba88f7b49	AD	AND	020	Andorra 	Andora	\N
00040000-556c-060e-769b-928ed6befb00	AO	AGO	024	Angola 	Angola	\N
00040000-556c-060e-0ed3-68bbb726424c	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-556c-060e-0912-569acdba2534	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-556c-060e-90c7-9aeb70d6f471	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-556c-060e-7fcc-0d93963a9f65	AR	ARG	032	Argentina 	Argenitna	\N
00040000-556c-060e-0be9-904f96d31089	AM	ARM	051	Armenia 	Armenija	\N
00040000-556c-060e-204a-af60847a48c2	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-556c-060e-56aa-ea2fb8de097c	AU	AUS	036	Australia 	Avstralija	\N
00040000-556c-060e-a867-6198692273c6	AT	AUT	040	Austria 	Avstrija	\N
00040000-556c-060e-b533-46fcba6b83c4	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-556c-060e-00d6-5bb39fc70ada	BS	BHS	044	Bahamas 	Bahami	\N
00040000-556c-060e-fbde-99f849f317ed	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-556c-060e-9567-b88c3b09e4ca	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-556c-060e-9baf-83db13df026a	BB	BRB	052	Barbados 	Barbados	\N
00040000-556c-060e-b550-f787210e14a4	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-556c-060e-8271-d52c068b8097	BE	BEL	056	Belgium 	Belgija	\N
00040000-556c-060e-c533-59cbfc56775a	BZ	BLZ	084	Belize 	Belize	\N
00040000-556c-060e-2459-65009e610f34	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-556c-060e-2b29-039cc5635d4e	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-556c-060e-831d-59e713afb690	BT	BTN	064	Bhutan 	Butan	\N
00040000-556c-060e-41a4-a3124e1bcbc6	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-556c-060e-96d3-32aca2e4c40a	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-556c-060e-d971-b157a385cb6e	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-556c-060e-b1ed-6bd3a44b874c	BW	BWA	072	Botswana 	Bocvana	\N
00040000-556c-060e-26bc-012c3412787f	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-556c-060e-f77e-ff15d222c484	BR	BRA	076	Brazil 	Brazilija	\N
00040000-556c-060e-8068-aee1cd1fe681	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-556c-060e-0961-56659c7470a1	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-556c-060e-24ea-499d5e9f8a06	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-556c-060e-278a-cf52a10cf384	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-556c-060e-19f0-530c6f986eb0	BI	BDI	108	Burundi 	Burundi 	\N
00040000-556c-060e-3748-3fda6101c957	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-556c-060e-374c-022f75bcc893	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-556c-060e-556e-219491156c5b	CA	CAN	124	Canada 	Kanada	\N
00040000-556c-060e-60a4-eba7d987fad6	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-556c-060e-1730-f189aa73d67a	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-556c-060e-5f2e-76f34a8c9de7	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-556c-060e-49c6-f4b9fc58b470	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-556c-060e-c791-323596a617c3	CL	CHL	152	Chile 	Čile	\N
00040000-556c-060e-a7b3-48943fac6d5d	CN	CHN	156	China 	Kitajska	\N
00040000-556c-060e-2f50-92beb3103924	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-556c-060e-6257-43fc9b787ea5	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-556c-060e-13dd-2036c88a7a81	CO	COL	170	Colombia 	Kolumbija	\N
00040000-556c-060e-d804-7834d78d35ce	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-556c-060e-d498-14b2f229a96c	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-556c-060e-b576-c510e097a00f	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-556c-060e-6439-03036daac1d3	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-556c-060e-52c2-52260772f03c	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-556c-060e-c826-20a96b839e83	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-556c-060e-13b4-3c43a383318a	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-556c-060e-39eb-4f716732022d	CU	CUB	192	Cuba 	Kuba	\N
00040000-556c-060e-236b-fe340ce6e21e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-556c-060e-5e23-e20bb424a2f4	CY	CYP	196	Cyprus 	Ciper	\N
00040000-556c-060e-67cd-b8ba06923730	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-556c-060e-776b-281056fde800	DK	DNK	208	Denmark 	Danska	\N
00040000-556c-060e-b522-75606b3ba37f	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-556c-060e-e9ba-1c7ec389be97	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-556c-060e-96b3-a25ecd28f641	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-556c-060e-872e-be0800f7afe6	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-556c-060e-7a4a-039cd3ab2bb6	EG	EGY	818	Egypt 	Egipt	\N
00040000-556c-060e-c478-9a6bb9bf5611	SV	SLV	222	El Salvador 	Salvador	\N
00040000-556c-060e-fc83-203bcd4deb16	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-556c-060e-864c-db94db8ab1a6	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-556c-060e-8d7d-3b1b7e662886	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-556c-060e-11bc-d0d34396eb7d	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-556c-060e-cb21-126899463bfd	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-556c-060e-96c2-d0dd1783d71b	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-556c-060e-2875-3b2431fec09c	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-556c-060e-1f9e-737b41b6e550	FI	FIN	246	Finland 	Finska	\N
00040000-556c-060e-70c4-ca23f816e1ac	FR	FRA	250	France 	Francija	\N
00040000-556c-060e-14a5-943d8288892c	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-556c-060e-2553-8e8e1d5714d2	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-556c-060e-e0c8-c3c4f8a046c1	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-556c-060e-3da7-6068ca6c8034	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-556c-060e-a8d9-9b19b5328904	GA	GAB	266	Gabon 	Gabon	\N
00040000-556c-060e-9f59-48339fc6b070	GM	GMB	270	Gambia 	Gambija	\N
00040000-556c-060e-8b91-9be4f90d664f	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-556c-060e-748b-59d65a6246e3	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-556c-060e-e74f-6c89bcb03301	GH	GHA	288	Ghana 	Gana	\N
00040000-556c-060e-ebec-5e6dd4b0df08	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-556c-060e-c7c8-96bc4acbf886	GR	GRC	300	Greece 	Grčija	\N
00040000-556c-060e-eb89-64c52f3d4c62	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-556c-060e-1c46-24d9405d551c	GD	GRD	308	Grenada 	Grenada	\N
00040000-556c-060e-d4ec-ff6714f67708	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-556c-060e-a627-8fc503dd6538	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-556c-060e-6834-d0bad3b02341	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-556c-060e-ac87-1e8097188a71	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-556c-060e-971c-6e3689bc09c0	GN	GIN	324	Guinea 	Gvineja	\N
00040000-556c-060e-0a40-bd04142e6cc5	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-556c-060e-09ee-12305ccabb50	GY	GUY	328	Guyana 	Gvajana	\N
00040000-556c-060e-d683-ae2fc30f3a02	HT	HTI	332	Haiti 	Haiti	\N
00040000-556c-060e-f5ed-c2e6efe2126b	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-556c-060e-57c6-57689e636e6a	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-556c-060e-0347-876b6256025b	HN	HND	340	Honduras 	Honduras	\N
00040000-556c-060e-03db-c1444d1dbf64	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-556c-060e-fde2-f015ea1472b7	HU	HUN	348	Hungary 	Madžarska	\N
00040000-556c-060e-7e8f-f7434796700e	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-556c-060e-1bde-fd3196106d12	IN	IND	356	India 	Indija	\N
00040000-556c-060e-8930-224d528cbe0a	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-556c-060e-6574-a6d5982e56a7	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-556c-060e-45c2-dfc4d22e4f89	IQ	IRQ	368	Iraq 	Irak	\N
00040000-556c-060e-8c79-1f53e99db387	IE	IRL	372	Ireland 	Irska	\N
00040000-556c-060e-0148-b98b370f9f79	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-556c-060e-493c-4cc1193334a1	IL	ISR	376	Israel 	Izrael	\N
00040000-556c-060e-66b3-62ff357aeeb4	IT	ITA	380	Italy 	Italija	\N
00040000-556c-060e-d3e8-b878cd137c79	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-556c-060e-f669-fe26a17d683c	JP	JPN	392	Japan 	Japonska	\N
00040000-556c-060e-a725-1170e6930194	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-556c-060e-89a6-273cb4e4c905	JO	JOR	400	Jordan 	Jordanija	\N
00040000-556c-060e-7f75-049d353d2e47	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-556c-060e-10f2-1ab59bf19f43	KE	KEN	404	Kenya 	Kenija	\N
00040000-556c-060e-fec3-f145842c7161	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-556c-060e-b7e3-9255248865ef	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-556c-060e-3ea4-f3224d461a60	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-556c-060e-e16c-28cdf0a6ca84	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-556c-060e-20dd-b6e7fb574e6b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-556c-060e-acf3-0ec0435c8179	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-556c-060e-a30d-5f724cefb19b	LV	LVA	428	Latvia 	Latvija	\N
00040000-556c-060e-4afa-435b40be6cc2	LB	LBN	422	Lebanon 	Libanon	\N
00040000-556c-060e-3786-b1422701e310	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-556c-060e-dd0c-34ee78367bb9	LR	LBR	430	Liberia 	Liberija	\N
00040000-556c-060e-8821-26234dadea07	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-556c-060e-9fe9-dd0e30e1d192	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-556c-060e-d394-8deec98fe5ff	LT	LTU	440	Lithuania 	Litva	\N
00040000-556c-060e-7172-f101854c56f3	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-556c-060e-5e41-d5d2c272a04d	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-556c-060e-c67f-df2989212d8d	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-556c-060e-b407-daf710cb3973	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-556c-060e-62d7-c2482c112aac	MW	MWI	454	Malawi 	Malavi	\N
00040000-556c-060e-51f4-b0e4bf97d7eb	MY	MYS	458	Malaysia 	Malezija	\N
00040000-556c-060e-6d13-5119b1e1e4d2	MV	MDV	462	Maldives 	Maldivi	\N
00040000-556c-060e-31a9-8a779f158a58	ML	MLI	466	Mali 	Mali	\N
00040000-556c-060e-0745-66b8c848eb4f	MT	MLT	470	Malta 	Malta	\N
00040000-556c-060e-de30-f6f56778f13c	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-556c-060e-24b5-262adc8b65c2	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-556c-060e-596f-b584a7e0127a	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-556c-060e-bc00-a4d79391a088	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-556c-060e-bd4c-258d6463f42b	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-556c-060e-2cc0-bc122d831f8f	MX	MEX	484	Mexico 	Mehika	\N
00040000-556c-060e-415d-1b3750a55b07	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-556c-060e-fd8b-a0f3b011577f	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-556c-060e-ae64-6503db389989	MC	MCO	492	Monaco 	Monako	\N
00040000-556c-060e-893c-d9b0631f13c4	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-556c-060e-d10b-d583a47ac5ad	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-556c-060e-bcdc-253194703730	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-556c-060e-e198-50868ae3ce78	MA	MAR	504	Morocco 	Maroko	\N
00040000-556c-060e-ec49-676777e6fd0a	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-556c-060e-de9c-ec69bbfe8040	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-556c-060e-5bd5-cb6bb38a9389	NA	NAM	516	Namibia 	Namibija	\N
00040000-556c-060e-7e84-5fb38816767c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-556c-060e-457f-d496271c3c28	NP	NPL	524	Nepal 	Nepal	\N
00040000-556c-060e-2f9e-e5c7fee48d79	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-556c-060e-2bec-b1d384c49969	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-556c-060e-a476-f6a963ebc178	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-556c-060e-3e3c-a67d881a18b6	NE	NER	562	Niger 	Niger 	\N
00040000-556c-060e-8dc8-65a338253350	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-556c-060e-af8b-bdc88f2b17da	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-556c-060e-51fe-cd2d378638af	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-556c-060e-aaca-7f6e14d9026c	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-556c-060e-c445-4163b9024e92	NO	NOR	578	Norway 	Norveška	\N
00040000-556c-060e-8251-ac9ec0f23866	OM	OMN	512	Oman 	Oman	\N
00040000-556c-060e-1226-816433b5dbb1	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-556c-060e-079a-ceb8b26cb1df	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-556c-060e-9fcf-617d11f794e7	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-556c-060e-faa8-8d6468457809	PA	PAN	591	Panama 	Panama	\N
00040000-556c-060e-3c51-bf925ec1c3c9	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-556c-060e-11a4-054a059d1fdf	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-556c-060e-ab22-1c349ef0abfd	PE	PER	604	Peru 	Peru	\N
00040000-556c-060e-eb47-e5ee7e63bd5f	PH	PHL	608	Philippines 	Filipini	\N
00040000-556c-060e-ceed-6fa97a61c158	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-556c-060e-f894-3cfcc27f3c7a	PL	POL	616	Poland 	Poljska	\N
00040000-556c-060e-26be-6247df3b16e4	PT	PRT	620	Portugal 	Portugalska	\N
00040000-556c-060e-5a3e-53fb4e46b143	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-556c-060e-76d8-e8a1542c5f99	QA	QAT	634	Qatar 	Katar	\N
00040000-556c-060e-08e2-1324eace9008	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-556c-060e-f503-b460cfe76bc1	RO	ROU	642	Romania 	Romunija	\N
00040000-556c-060e-23a7-14e3afa88291	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-556c-060e-d21c-4b5440afbc93	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-556c-060e-9e3c-9a6777d87e0d	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-556c-060e-e7d5-f49801d44df8	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-556c-060e-4270-5778b62fe858	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-556c-060e-68dc-8729f3580885	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-556c-060e-058a-9dd85fec0c93	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-556c-060e-a192-b657b5f53123	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-556c-060e-fa9d-ff32f1bad92d	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-556c-060e-588f-3779968615d8	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-556c-060e-75a7-c29c9807d3b1	SM	SMR	674	San Marino 	San Marino	\N
00040000-556c-060e-213e-c9a33bf6764c	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-556c-060e-3598-cca380a60d62	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-556c-060e-031e-b95ee7ac5d31	SN	SEN	686	Senegal 	Senegal	\N
00040000-556c-060e-6d62-87946e257935	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-556c-060e-ff96-110123ebb789	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-556c-060e-c0a6-ceae0858fe05	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-556c-060e-0a75-5ffaf3db4a24	SG	SGP	702	Singapore 	Singapur	\N
00040000-556c-060e-4699-ce5fd7aa52d0	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-556c-060e-86bc-51e9f8c2ceb2	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-556c-060e-0aa3-421376956d69	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-556c-060e-a7b9-e7fd466e21f7	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-556c-060e-3525-425c535c56df	SO	SOM	706	Somalia 	Somalija	\N
00040000-556c-060e-6fd7-4e3f74f0286e	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-556c-060e-d985-d6c2c77f50c7	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-556c-060e-2e91-823705e76e72	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-556c-060e-f115-e69b79f2c9c5	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-556c-060e-c786-d95da0f8c65a	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-556c-060e-ee19-1b5d78b89ee8	SD	SDN	729	Sudan 	Sudan	\N
00040000-556c-060e-9d8f-26c4a43658b1	SR	SUR	740	Suriname 	Surinam	\N
00040000-556c-060e-1f54-9892aafbf8e2	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-556c-060e-88c7-0afefffe7701	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-556c-060e-4c17-20c0434787e3	SE	SWE	752	Sweden 	Švedska	\N
00040000-556c-060e-1048-38d85d653b78	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-556c-060e-6459-abc0840bf23d	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-556c-060e-1260-51047e6d5aa1	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-556c-060e-440a-47356e36d7b8	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-556c-060e-067b-b4234ae646bd	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-556c-060e-5afc-837783703688	TH	THA	764	Thailand 	Tajska	\N
00040000-556c-060e-7b18-05bd026caea0	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-556c-060e-dfe6-31c5b219ee31	TG	TGO	768	Togo 	Togo	\N
00040000-556c-060e-796f-bdafee6f3f87	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-556c-060e-64cd-5afc60afcf81	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-556c-060e-daf4-94edd02629f2	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-556c-060e-f340-ddeaee0bc841	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-556c-060e-35eb-2a4ffa6bc026	TR	TUR	792	Turkey 	Turčija	\N
00040000-556c-060e-7e9c-bd92f22b85a4	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-556c-060e-7b67-8b1a56b303fe	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-556c-060e-4924-0518fa85a504	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-556c-060e-248f-785cec947df2	UG	UGA	800	Uganda 	Uganda	\N
00040000-556c-060e-5aaf-a0fd593a142d	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-556c-060e-60ff-eeaee7164b5e	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-556c-060e-5dad-5e00916123ff	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-556c-060e-7d10-84508d1a5dad	US	USA	840	United States 	Združene države Amerike	\N
00040000-556c-060e-6497-6166aa6af5d1	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-556c-060e-d7d9-a237ee7b1f32	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-556c-060e-90bc-d6da848e8b79	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-556c-060e-2d60-c0c8eb23500a	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-556c-060e-5f31-38c60ae4cdf2	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-556c-060e-639f-e21882d26807	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-556c-060e-4151-56a59d13f5fc	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-556c-060e-7208-3de642dc3632	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-556c-060e-0bb0-fd4f1a947461	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-556c-060e-70ed-525a7e0a9ec6	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-556c-060e-01cf-fa3730b5a6bd	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-556c-060e-3bfd-dd8c613a0594	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-556c-060e-61d5-5808f47a704a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2732 (class 0 OID 5584205)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj, tipfunkcije_id) FROM stdin;
000d0000-556c-060f-d1dd-6da764a6ec92	000e0000-556c-060f-7c8f-c699163bc0e8	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-556c-060e-e71a-3cd678eee8d7
000d0000-556c-060f-217b-4516d7541ed7	000e0000-556c-060f-7c8f-c699163bc0e8	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-556c-060e-e71a-3cd678eee8d7
000d0000-556c-060f-a3cb-811ba3ef6e03	000e0000-556c-060f-7c8f-c699163bc0e8	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-556c-060e-7e85-4e7a9b2bd747
000d0000-556c-060f-13ba-7b93a3917251	000e0000-556c-060f-7c8f-c699163bc0e8	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-556c-060e-7364-731223818af2
000d0000-556c-060f-2b0f-6f19523f52f7	000e0000-556c-060f-7c8f-c699163bc0e8	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-556c-060e-7364-731223818af2
000d0000-556c-060f-6260-6254ae558d02	000e0000-556c-060f-7c8f-c699163bc0e8	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-556c-060e-7364-731223818af2
\.


--
-- TOC entry 2711 (class 0 OID 5584029)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2715 (class 0 OID 5584073)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2709 (class 0 OID 5584009)
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
-- TOC entry 2721 (class 0 OID 5584122)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2725 (class 0 OID 5584147)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2706 (class 0 OID 5583966)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-556c-060f-4916-386f590c1eaf	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-556c-060f-81b6-d4e80318848b	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-556c-060f-7f09-8723870c48a1	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-556c-060f-cb51-301e1a197a5e	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-556c-060f-c2ef-a7ce8e247abd	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-556c-060f-1048-603fe02d3340	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-556c-060f-169e-e1af43c550aa	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-556c-060f-b244-29068c8cd4de	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-556c-060f-3d1f-2a703cf4a306	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-556c-060f-daa2-ae89ebd7a2fe	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-556c-060f-9560-2bc1da6fde58	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-556c-060f-bd30-97539bd6bc39	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-556c-060f-f159-1bc09ee87b89	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-556c-060f-2207-4a21b6962c37	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-556c-060f-b3ab-4a8fbcd8638e	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2700 (class 0 OID 5583880)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-556c-060f-30bc-e9a83cfb63d8	00000000-556c-060f-c2ef-a7ce8e247abd	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-556c-060f-b906-86617dd821bb	00000000-556c-060f-c2ef-a7ce8e247abd	00010000-556c-060f-5a2a-bbc78eda9fa9	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-556c-060f-88a0-c41350c31b5f	00000000-556c-060f-1048-603fe02d3340	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2701 (class 0 OID 5583891)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-556c-060f-6444-bf06fbf2116c	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-556c-060f-77e8-123a8ec6b4e2	00010000-556c-060f-d316-7186570daa3e	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-556c-060f-5da0-b6172ff25a5d	00010000-556c-060f-8b9c-0960dd946899	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-556c-060f-07c2-cf6924f73c28	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-556c-060f-5957-37f93b15017b	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-556c-060f-82f7-825d0f556894	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-556c-060f-f807-e06dcd6bbbb8	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-556c-060f-a13b-f464d64aa946	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-556c-060f-3e08-cb7cba3d4c71	00010000-556c-060f-4d18-68238ea8c8a5	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-556c-060f-3c38-fa3a7ec60703	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-556c-060f-3368-5f6bb0437f0c	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-556c-060f-ec72-4be0afcfd213	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 2691 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2696 (class 0 OID 5583845)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-556c-060f-e384-7213bca3454b	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-556c-060f-215a-8769ed924c4e	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-556c-060f-315d-b6c35be96b19	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-556c-060f-2b30-3b95f32fa00b	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-556c-060f-7467-d7690b9c7d78	Abonma-read	Abonma - branje	f
00030000-556c-060f-fa9f-26aaa8ee1051	Abonma-write	Abonma - spreminjanje	f
00030000-556c-060f-a779-c4eca5d7b954	Alternacija-read	Alternacija - branje	f
00030000-556c-060f-0c1d-f89e6ad8aa44	Alternacija-write	Alternacija - spreminjanje	f
00030000-556c-060f-6f19-77a7a18380aa	Arhivalija-read	Arhivalija - branje	f
00030000-556c-060f-144c-b6a8a755b699	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-556c-060f-7606-b617974d74bd	Besedilo-read	Besedilo - branje	f
00030000-556c-060f-e808-76d9da921286	Besedilo-write	Besedilo - spreminjanje	f
00030000-556c-060f-df7c-4d2078375b44	DogodekIzven-read	DogodekIzven - branje	f
00030000-556c-060f-2cab-faef7c4f8fb5	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-556c-060f-39c0-9130fde2649b	Dogodek-read	Dogodek - branje	f
00030000-556c-060f-b681-07dc5cc563d1	Dogodek-write	Dogodek - spreminjanje	f
00030000-556c-060f-71b1-34b1298596ab	Drzava-read	Drzava - branje	f
00030000-556c-060f-3830-93e3d13a8a63	Drzava-write	Drzava - spreminjanje	f
00030000-556c-060f-6dfd-4254690957c7	Funkcija-read	Funkcija - branje	f
00030000-556c-060f-ce87-1d2670859e0f	Funkcija-write	Funkcija - spreminjanje	f
00030000-556c-060f-9c58-fbfe186cf1c4	Gostovanje-read	Gostovanje - branje	f
00030000-556c-060f-730d-48c3c85025b2	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-556c-060f-364b-8176cd04f1de	Gostujoca-read	Gostujoca - branje	f
00030000-556c-060f-4c13-57f9a11016a9	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-556c-060f-e0a1-dfc733fcb5a3	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-556c-060f-6eeb-a32c4d1aa94a	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-556c-060f-f332-c3020abf9ebf	Kupec-read	Kupec - branje	f
00030000-556c-060f-d954-d87de2462363	Kupec-write	Kupec - spreminjanje	f
00030000-556c-060f-fd06-9290a6c356b6	NacinPlacina-read	NacinPlacina - branje	f
00030000-556c-060f-15d7-247193127914	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-556c-060f-ab4c-ea1eb56ca643	Option-read	Option - branje	f
00030000-556c-060f-65f4-a989e1b98075	Option-write	Option - spreminjanje	f
00030000-556c-060f-8dc1-4a9c800112a7	OptionValue-read	OptionValue - branje	f
00030000-556c-060f-ec2f-11e1ce4ab23d	OptionValue-write	OptionValue - spreminjanje	f
00030000-556c-060f-74f3-2555149575de	Oseba-read	Oseba - branje	f
00030000-556c-060f-a894-481a79447b73	Oseba-write	Oseba - spreminjanje	f
00030000-556c-060f-f0bf-7a2eed4dc21b	Permission-read	Permission - branje	f
00030000-556c-060f-c3f2-e90dbed12289	Permission-write	Permission - spreminjanje	f
00030000-556c-060f-1141-a861b0267743	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-556c-060f-4e89-edf5177c22ae	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-556c-060f-ce22-97e297c39bce	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-556c-060f-fbff-979be97306f8	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-556c-060f-a6bc-71a7fc2be77f	Pogodba-read	Pogodba - branje	f
00030000-556c-060f-e336-5ea1c3af51fe	Pogodba-write	Pogodba - spreminjanje	f
00030000-556c-060f-59bf-2d9531e09639	Popa-read	Popa - branje	f
00030000-556c-060f-55b0-510cf13f7775	Popa-write	Popa - spreminjanje	f
00030000-556c-060f-92e6-af8d4ea353f8	Posta-read	Posta - branje	f
00030000-556c-060f-a17e-6b4ff6f5631c	Posta-write	Posta - spreminjanje	f
00030000-556c-060f-16e6-22dd424f930b	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-556c-060f-ab35-b03c033c66ec	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-556c-060f-967d-58a2bf52c4a1	PostniNaslov-read	PostniNaslov - branje	f
00030000-556c-060f-c8f5-03f30b1062cf	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-556c-060f-03a5-0c56d5061612	Predstava-read	Predstava - branje	f
00030000-556c-060f-c0d7-1545d00349e9	Predstava-write	Predstava - spreminjanje	f
00030000-556c-060f-590e-4ffe7cc0ebb6	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-556c-060f-4763-824b13bab554	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-556c-060f-3d4f-f6f1e1b5122d	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-556c-060f-cdfb-8984a050ed0c	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-556c-060f-f2d7-66b805ddc485	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-556c-060f-6f3f-136e25a0b28b	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-556c-060f-9d65-5c927cdbe6de	Prostor-read	Prostor - branje	f
00030000-556c-060f-a71b-7b8e65614a1f	Prostor-write	Prostor - spreminjanje	f
00030000-556c-060f-61d4-d4dbc80f1678	Racun-read	Racun - branje	f
00030000-556c-060f-6e57-7f7403b5217a	Racun-write	Racun - spreminjanje	f
00030000-556c-060f-b4f8-7f5e875f489e	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-556c-060f-23be-4292b59953fe	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-556c-060f-10f6-9865f3a3ba93	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-556c-060f-6b8a-55a18327893f	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-556c-060f-aa04-0604f927b698	Rekvizit-read	Rekvizit - branje	f
00030000-556c-060f-62ff-483ac8109a45	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-556c-060f-8b19-9117f2320e98	Revizija-read	Revizija - branje	f
00030000-556c-060f-5b6d-359daa176c26	Revizija-write	Revizija - spreminjanje	f
00030000-556c-060f-4965-6534432f78e7	Rezervacija-read	Rezervacija - branje	f
00030000-556c-060f-c8f7-a98e5b73834d	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-556c-060f-2e22-405755338da7	Role-read	Role - branje	f
00030000-556c-060f-edd6-c27c239d441f	Role-write	Role - spreminjanje	f
00030000-556c-060f-6a92-7fbbdb239cc8	SedezniRed-read	SedezniRed - branje	f
00030000-556c-060f-0437-0c1ec8b901c4	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-556c-060f-9f8a-4ad41a7176e5	Sedez-read	Sedez - branje	f
00030000-556c-060f-30c7-574c7e2baaf0	Sedez-write	Sedez - spreminjanje	f
00030000-556c-060f-d396-05473a2484c5	Sezona-read	Sezona - branje	f
00030000-556c-060f-e8e9-abb0616fff39	Sezona-write	Sezona - spreminjanje	f
00030000-556c-060f-9a40-5bc140f6a089	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-556c-060f-0571-5cc0819f7a93	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-556c-060f-50fe-dea20edbd315	Stevilcenje-read	Stevilcenje - branje	f
00030000-556c-060f-dd1d-973f54b80cfe	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-556c-060f-5664-769e764870ec	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-556c-060f-ddc2-73cecf29a904	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-556c-060f-2be5-f141ddff4ee9	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-556c-060f-a9d8-431727625434	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-556c-060f-084c-71ee7f3e9f95	Telefonska-read	Telefonska - branje	f
00030000-556c-060f-a56b-a51dc056144b	Telefonska-write	Telefonska - spreminjanje	f
00030000-556c-060f-55ae-120b380aac30	TerminStoritve-read	TerminStoritve - branje	f
00030000-556c-060f-62b1-9b031d7e0779	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-556c-060f-e6d2-1333c8af86cc	TipFunkcije-read	TipFunkcije - branje	f
00030000-556c-060f-de8e-42de4d5080a0	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-556c-060f-6cb9-10572f1e44f9	Trr-read	Trr - branje	f
00030000-556c-060f-154f-99b570c5ef21	Trr-write	Trr - spreminjanje	f
00030000-556c-060f-fbd2-2ecb27befec1	Uprizoritev-read	Uprizoritev - branje	f
00030000-556c-060f-9e43-3b996fef724f	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-556c-060f-2ccc-925e92afa0c5	User-read	User - branje	f
00030000-556c-060f-fe7f-7f8153b04026	User-write	User - spreminjanje	f
00030000-556c-060f-ed98-4b2eef974abf	Vaja-read	Vaja - branje	f
00030000-556c-060f-893a-00bc129af7b0	Vaja-write	Vaja - spreminjanje	f
00030000-556c-060f-c764-4043730b7103	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-556c-060f-34bc-468d33978e17	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-556c-060f-d489-3b93519f186f	Zaposlitev-read	Zaposlitev - branje	f
00030000-556c-060f-6583-4f6824955f29	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-556c-060f-53ac-7108f21568ca	Zasedenost-read	Zasedenost - branje	f
00030000-556c-060f-2aed-a6148b2e771e	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-556c-060f-8a27-3e3cc4e59d4b	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-556c-060f-fbc5-96068ad0248e	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-556c-060f-6ead-2c1f5356ae0e	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-556c-060f-0367-62ff27349096	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2698 (class 0 OID 5583864)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-556c-060f-4ec6-d29b0c519eac	00030000-556c-060f-71b1-34b1298596ab
00020000-556c-060f-06a7-47300edc7599	00030000-556c-060f-3830-93e3d13a8a63
00020000-556c-060f-06a7-47300edc7599	00030000-556c-060f-71b1-34b1298596ab
\.


--
-- TOC entry 2726 (class 0 OID 5584154)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2730 (class 0 OID 5584185)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2742 (class 0 OID 5584318)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2703 (class 0 OID 5583923)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-556c-060f-1a7e-91121c3e6b24	00040000-556c-060e-eb65-cc95192430dd	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-556c-060f-7d90-26688d852e04	00040000-556c-060e-eb65-cc95192430dd	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2705 (class 0 OID 5583958)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-556c-060e-9dae-8e5dd44931a4	8341	Adlešiči
00050000-556c-060e-1bd0-ee74d0ed7379	5270	Ajdovščina
00050000-556c-060e-096b-89e1f40e0793	6280	Ankaran/Ancarano
00050000-556c-060e-cf72-0a288452957a	9253	Apače
00050000-556c-060e-9a41-2e254c634404	8253	Artiče
00050000-556c-060e-2294-c308295f2862	4275	Begunje na Gorenjskem
00050000-556c-060e-5276-32027d07faff	1382	Begunje pri Cerknici
00050000-556c-060e-85ca-9a2ae9838ecb	9231	Beltinci
00050000-556c-060e-2c19-55d4b03124af	2234	Benedikt
00050000-556c-060e-cc36-6e59269e8f4e	2345	Bistrica ob Dravi
00050000-556c-060e-0e8f-f5b4bce0c556	3256	Bistrica ob Sotli
00050000-556c-060e-f660-2ed1bca853e7	8259	Bizeljsko
00050000-556c-060e-58bb-6e26719c3fca	1223	Blagovica
00050000-556c-060e-8037-b8079174ea01	8283	Blanca
00050000-556c-060e-babc-05cb6a6f2583	4260	Bled
00050000-556c-060e-ea8e-d743f49b582e	4273	Blejska Dobrava
00050000-556c-060e-4929-94d9577d90b1	9265	Bodonci
00050000-556c-060e-a26f-867b79d739cb	9222	Bogojina
00050000-556c-060e-243d-9b66a43a6d2e	4263	Bohinjska Bela
00050000-556c-060e-9269-b280b8bd2f5d	4264	Bohinjska Bistrica
00050000-556c-060e-d636-bd5222aae5ac	4265	Bohinjsko jezero
00050000-556c-060e-07dc-4e00fad57a6c	1353	Borovnica
00050000-556c-060e-3872-2d553f0d2b6c	8294	Boštanj
00050000-556c-060e-6acf-ddcb603323a2	5230	Bovec
00050000-556c-060e-cddb-615a62ee4eec	5295	Branik
00050000-556c-060e-593e-05bf22299931	3314	Braslovče
00050000-556c-060e-b7e2-175f61d41e04	5223	Breginj
00050000-556c-060e-4240-b01c2c71da61	8280	Brestanica
00050000-556c-060e-6d65-e939681d7313	2354	Bresternica
00050000-556c-060e-ce16-435d7d9af57b	4243	Brezje
00050000-556c-060e-449f-ae892f344da2	1351	Brezovica pri Ljubljani
00050000-556c-060e-86f4-4491044178c4	8250	Brežice
00050000-556c-060e-50c8-700e33fbdd93	4210	Brnik - Aerodrom
00050000-556c-060e-9618-3c26437694f4	8321	Brusnice
00050000-556c-060e-7259-ce7508733d23	3255	Buče
00050000-556c-060e-aa35-d2369221ccc8	8276	Bučka 
00050000-556c-060e-5c0d-dc3633d24870	9261	Cankova
00050000-556c-060e-dc19-2124bc91ad6f	3000	Celje 
00050000-556c-060e-a377-e9857e99d4cf	3001	Celje - poštni predali
00050000-556c-060e-e451-0534b3b75c7e	4207	Cerklje na Gorenjskem
00050000-556c-060e-66c1-ea454b0211a3	8263	Cerklje ob Krki
00050000-556c-060e-848f-bddf95628cec	1380	Cerknica
00050000-556c-060e-54ba-3209c9b495de	5282	Cerkno
00050000-556c-060e-cc8f-99e2bd82f7a2	2236	Cerkvenjak
00050000-556c-060e-ed65-4e8deaea6886	2215	Ceršak
00050000-556c-060e-cb08-87bd12882901	2326	Cirkovce
00050000-556c-060e-fac8-5b0366c2b2a3	2282	Cirkulane
00050000-556c-060e-84a4-bb2bc3ef59fd	5273	Col
00050000-556c-060e-e8d0-1df769b22355	8251	Čatež ob Savi
00050000-556c-060e-88e2-4121424e8817	1413	Čemšenik
00050000-556c-060e-ea83-59878e819fc8	5253	Čepovan
00050000-556c-060e-c815-24f7ded84378	9232	Črenšovci
00050000-556c-060e-90b6-addb524a0a81	2393	Črna na Koroškem
00050000-556c-060e-ef3b-1ff9dec3e155	6275	Črni Kal
00050000-556c-060e-a860-fcfb9e450180	5274	Črni Vrh nad Idrijo
00050000-556c-060e-4648-b3019cbc42c6	5262	Črniče
00050000-556c-060e-adde-6bea9846f3c8	8340	Črnomelj
00050000-556c-060e-30b0-10a1a68d8c35	6271	Dekani
00050000-556c-060e-e1eb-881e4077decc	5210	Deskle
00050000-556c-060e-ae3d-d199f7f2dfc6	2253	Destrnik
00050000-556c-060e-6aa5-03116735aed6	6215	Divača
00050000-556c-060e-438a-e8bab06509fd	1233	Dob
00050000-556c-060e-4e71-5db51346527e	3224	Dobje pri Planini
00050000-556c-060e-19e4-6583a6f37978	8257	Dobova
00050000-556c-060e-f988-300f771a3310	1423	Dobovec
00050000-556c-060e-279c-a112c44e85ad	5263	Dobravlje
00050000-556c-060e-dfab-0361b7d5b6dc	3204	Dobrna
00050000-556c-060e-1c48-f691577fa81e	8211	Dobrnič
00050000-556c-060e-c9c3-9b8940c2189b	1356	Dobrova
00050000-556c-060e-38e1-b773538b7d6a	9223	Dobrovnik/Dobronak 
00050000-556c-060e-6e43-d4d17f03f73f	5212	Dobrovo v Brdih
00050000-556c-060e-7b16-dce305e09b3e	1431	Dol pri Hrastniku
00050000-556c-060e-53ee-8dcd661f9e42	1262	Dol pri Ljubljani
00050000-556c-060e-9bbe-cb02fcecf9a0	1273	Dole pri Litiji
00050000-556c-060e-8378-5dc751709d6d	1331	Dolenja vas
00050000-556c-060e-bbe1-828026daee98	8350	Dolenjske Toplice
00050000-556c-060e-e55a-132019f42cda	1230	Domžale
00050000-556c-060e-1a4d-cc8b44aebf6b	2252	Dornava
00050000-556c-060e-d960-0110014f725a	5294	Dornberk
00050000-556c-060e-4854-8d5841296fc6	1319	Draga
00050000-556c-060e-1b08-cd4425b4ffe9	8343	Dragatuš
00050000-556c-060e-4cc7-d9ac1cead5dc	3222	Dramlje
00050000-556c-060e-6470-7736fd7a3037	2370	Dravograd
00050000-556c-060e-874e-ac594b286761	4203	Duplje
00050000-556c-060e-8de2-2d6a4a44df35	6221	Dutovlje
00050000-556c-060e-62a7-61b4b823ea04	8361	Dvor
00050000-556c-060e-985a-53a6f37bd345	2343	Fala
00050000-556c-060e-8499-8108f40bf5f6	9208	Fokovci
00050000-556c-060e-4c2b-d59a1eac658d	2313	Fram
00050000-556c-060e-3489-7390492b8dd2	3213	Frankolovo
00050000-556c-060e-e4d1-03c0e18b5b1e	1274	Gabrovka
00050000-556c-060e-4e3a-5361b195f300	8254	Globoko
00050000-556c-060e-560c-ae6f8b07d37a	5275	Godovič
00050000-556c-060e-249e-3fd70d1217b4	4204	Golnik
00050000-556c-060e-c639-effd0da2390a	3303	Gomilsko
00050000-556c-060e-568f-7bd0b362da39	4224	Gorenja vas
00050000-556c-060e-2024-70e7edf262ec	3263	Gorica pri Slivnici
00050000-556c-060e-04c3-4439edc7de1a	2272	Gorišnica
00050000-556c-060e-9e70-c19231005fe7	9250	Gornja Radgona
00050000-556c-060e-53d8-33c485dcb48e	3342	Gornji Grad
00050000-556c-060e-fb6e-78695713f473	4282	Gozd Martuljek
00050000-556c-060e-8843-55243494132e	6272	Gračišče
00050000-556c-060e-b2f1-8725ed779b11	9264	Grad
00050000-556c-060e-242b-9e59118acc6b	8332	Gradac
00050000-556c-060e-6c9a-0dd2646ca13a	1384	Grahovo
00050000-556c-060e-891d-0c48ef6c3624	5242	Grahovo ob Bači
00050000-556c-060e-3f75-24b491ae93b5	5251	Grgar
00050000-556c-060e-ef04-1a671002cd8b	3302	Griže
00050000-556c-060e-6cb4-bc89ae2d7b5e	3231	Grobelno
00050000-556c-060e-96fd-be7542666c9c	1290	Grosuplje
00050000-556c-060e-09e6-1bb470e2cf5e	2288	Hajdina
00050000-556c-060e-ebfd-d21a0f9a745f	8362	Hinje
00050000-556c-060e-2293-1e64944ebf21	2311	Hoče
00050000-556c-060e-4bd9-31af41b87202	9205	Hodoš/Hodos
00050000-556c-060e-972e-e5a147b19b06	1354	Horjul
00050000-556c-060e-bf6c-9402cddb5b2e	1372	Hotedršica
00050000-556c-060e-3016-42a02c5b3cf4	1430	Hrastnik
00050000-556c-060e-a298-8aa6a1004027	6225	Hruševje
00050000-556c-060e-3f6c-9516d452a43e	4276	Hrušica
00050000-556c-060e-6478-6645df8836b6	5280	Idrija
00050000-556c-060e-7d53-a886decbd013	1292	Ig
00050000-556c-060e-7f59-755c6acd4adc	6250	Ilirska Bistrica
00050000-556c-060e-369a-8c0aba06e34b	6251	Ilirska Bistrica-Trnovo
00050000-556c-060e-f47c-b305be24ee02	1295	Ivančna Gorica
00050000-556c-060e-eb8c-a65ce3568c8c	2259	Ivanjkovci
00050000-556c-060e-3c03-a658ea83dc0e	1411	Izlake
00050000-556c-060e-faa0-04ac6d2b2dee	6310	Izola/Isola
00050000-556c-060e-32d0-eab7fa99bc4b	2222	Jakobski Dol
00050000-556c-060e-ffdf-2384be4fe49e	2221	Jarenina
00050000-556c-060e-db91-b330f702f940	6254	Jelšane
00050000-556c-060e-60ed-786cd81b89ce	4270	Jesenice
00050000-556c-060e-5050-317052e6a05d	8261	Jesenice na Dolenjskem
00050000-556c-060e-017e-860ca4f684f2	3273	Jurklošter
00050000-556c-060e-de44-842766e2abc4	2223	Jurovski Dol
00050000-556c-060e-c252-15d38ed4c5d5	2256	Juršinci
00050000-556c-060e-e38f-92c3b20275dd	5214	Kal nad Kanalom
00050000-556c-060e-a0b7-6b103b4931b1	3233	Kalobje
00050000-556c-060e-4554-6d0069af7f39	4246	Kamna Gorica
00050000-556c-060e-b6ec-e17fff6edb09	2351	Kamnica
00050000-556c-060e-c702-a01f76018fb2	1241	Kamnik
00050000-556c-060e-0533-8195c81b716f	5213	Kanal
00050000-556c-060e-cf29-7ed53e182625	8258	Kapele
00050000-556c-060e-51a7-cb77ab87bcf0	2362	Kapla
00050000-556c-060e-dbe9-8d68ce9e9c4b	2325	Kidričevo
00050000-556c-060e-eecb-0df58a876a65	1412	Kisovec
00050000-556c-060e-d703-54530f1c2c24	6253	Knežak
00050000-556c-060e-6136-bc2e5b9824de	5222	Kobarid
00050000-556c-060e-779c-19d26e443087	9227	Kobilje
00050000-556c-060e-e3c0-0da42d2d635e	1330	Kočevje
00050000-556c-060e-30e9-8fd868f9a6e3	1338	Kočevska Reka
00050000-556c-060e-9a2f-10364d205b22	2276	Kog
00050000-556c-060e-34f1-26bda8f65c3f	5211	Kojsko
00050000-556c-060e-fda1-241c60e7c0c1	6223	Komen
00050000-556c-060e-7163-be9a9ed764e2	1218	Komenda
00050000-556c-060e-8d27-72980b9ec1a4	6000	Koper/Capodistria 
00050000-556c-060e-cea5-afc6aafc7fb0	6001	Koper/Capodistria - poštni predali
00050000-556c-060e-02f8-9317ae41bfb0	8282	Koprivnica
00050000-556c-060e-8639-5e8fe43c8e15	5296	Kostanjevica na Krasu
00050000-556c-060e-0aad-aea810935c27	8311	Kostanjevica na Krki
00050000-556c-060e-f4db-3a8a8fafa2bd	1336	Kostel
00050000-556c-060e-cd9e-850155a2a88b	6256	Košana
00050000-556c-060e-7b8e-9957aa95b5db	2394	Kotlje
00050000-556c-060e-1b2c-bd95a886a206	6240	Kozina
00050000-556c-060e-be52-5ca63ce9666b	3260	Kozje
00050000-556c-060e-8f14-6342053097cf	4000	Kranj 
00050000-556c-060e-100b-3d82cd90b45a	4001	Kranj - poštni predali
00050000-556c-060e-b8a7-3d2c5ce5e69a	4280	Kranjska Gora
00050000-556c-060e-c9c1-8c719f12aa0f	1281	Kresnice
00050000-556c-060e-3141-11fd890432df	4294	Križe
00050000-556c-060e-cb2a-51ab21f3d58a	9206	Križevci
00050000-556c-060e-f938-45f00123a0c1	9242	Križevci pri Ljutomeru
00050000-556c-060e-a8b6-1a4aaf01a60c	1301	Krka
00050000-556c-060e-4b5a-f885c4a66964	8296	Krmelj
00050000-556c-060e-07e0-204a92ef39eb	4245	Kropa
00050000-556c-060e-8cc3-7cc13636dc52	8262	Krška vas
00050000-556c-060e-b4d5-e03d897da82c	8270	Krško
00050000-556c-060e-9010-67e11624014d	9263	Kuzma
00050000-556c-060e-f46a-786c43b64938	2318	Laporje
00050000-556c-060e-f19d-f0f66a95b178	3270	Laško
00050000-556c-060e-40cd-796fc2ee893a	1219	Laze v Tuhinju
00050000-556c-060e-a7d4-4182356b1ac8	2230	Lenart v Slovenskih goricah
00050000-556c-060e-9091-2f479fed50fd	9220	Lendava/Lendva
00050000-556c-060e-c5f2-f0b9d82f2185	4248	Lesce
00050000-556c-060e-fb47-d29951ed9ef2	3261	Lesično
00050000-556c-060e-b1d6-2720c2a3c42d	8273	Leskovec pri Krškem
00050000-556c-060e-4397-8c3296fd07d0	2372	Libeliče
00050000-556c-060e-afd8-fddbf1e4a7dd	2341	Limbuš
00050000-556c-060e-bbd8-a7f3c50e335b	1270	Litija
00050000-556c-060e-52d0-5d0d4e25626f	3202	Ljubečna
00050000-556c-060e-d4eb-ba28ff4be2d5	1000	Ljubljana 
00050000-556c-060e-3544-77dd21f1ad86	1001	Ljubljana - poštni predali
00050000-556c-060e-4af6-ff0f80a45b26	1231	Ljubljana - Črnuče
00050000-556c-060e-8463-9208d1235bb7	1261	Ljubljana - Dobrunje
00050000-556c-060e-1f38-015405f2e7ea	1260	Ljubljana - Polje
00050000-556c-060e-d7fd-1a19efaa5166	1210	Ljubljana - Šentvid
00050000-556c-060e-6a61-17a2f0a7f723	1211	Ljubljana - Šmartno
00050000-556c-060e-c83b-152e15a2fdca	3333	Ljubno ob Savinji
00050000-556c-060e-1692-5a17fcbfb192	9240	Ljutomer
00050000-556c-060e-ba7d-620a7c844ece	3215	Loče
00050000-556c-060e-b580-2fbfdf2df6dc	5231	Log pod Mangartom
00050000-556c-060e-a883-af85bddd544a	1358	Log pri Brezovici
00050000-556c-060e-436d-6c5235c893db	1370	Logatec
00050000-556c-060e-783c-a708efa0e57b	1371	Logatec
00050000-556c-060e-8161-b6aa1ba37d17	1434	Loka pri Zidanem Mostu
00050000-556c-060e-63b7-aea22d98f833	3223	Loka pri Žusmu
00050000-556c-060e-5780-1f22a0060d5d	6219	Lokev
00050000-556c-060e-db5f-e3612f3ed6d3	1318	Loški Potok
00050000-556c-060e-0ff8-3efbd92b83f1	2324	Lovrenc na Dravskem polju
00050000-556c-060e-2cf5-99a67943ee38	2344	Lovrenc na Pohorju
00050000-556c-060e-6ad0-78c9ff99e3d7	3334	Luče
00050000-556c-060e-0865-ec2a8d304ab2	1225	Lukovica
00050000-556c-060e-9c05-85731e53fe1f	9202	Mačkovci
00050000-556c-060e-a43f-8955115b3215	2322	Majšperk
00050000-556c-060e-057a-2fdc7b37b6e8	2321	Makole
00050000-556c-060e-c193-b3447e25d241	9243	Mala Nedelja
00050000-556c-060e-5e5a-21a4b3c55be5	2229	Malečnik
00050000-556c-060e-6a3f-8027d299eeba	6273	Marezige
00050000-556c-060e-f791-fcb8933bbf92	2000	Maribor 
00050000-556c-060e-0ad2-d111b35fea59	2001	Maribor - poštni predali
00050000-556c-060e-3d1c-0fd682a09cdb	2206	Marjeta na Dravskem polju
00050000-556c-060e-624a-63bea2b118fa	2281	Markovci
00050000-556c-060e-a4c5-294b7683a67f	9221	Martjanci
00050000-556c-060e-8386-9bd2c2711cc4	6242	Materija
00050000-556c-060e-beac-7c3a9c7642d0	4211	Mavčiče
00050000-556c-060e-e745-c004fc0e5f2e	1215	Medvode
00050000-556c-060e-7ec8-3d3cde2f65b7	1234	Mengeš
00050000-556c-060e-d770-6d503994e22e	8330	Metlika
00050000-556c-060e-2222-0882f4760a72	2392	Mežica
00050000-556c-060e-848e-bfa03689b73c	2204	Miklavž na Dravskem polju
00050000-556c-060e-9f95-f7d12aba6933	2275	Miklavž pri Ormožu
00050000-556c-060e-877a-2ccd8261b35e	5291	Miren
00050000-556c-060e-1682-f8a6992bf05b	8233	Mirna
00050000-556c-060e-e62b-290fe1b9e56e	8216	Mirna Peč
00050000-556c-060e-9941-e75e7f39a40d	2382	Mislinja
00050000-556c-060e-fab8-b6aef9f26330	4281	Mojstrana
00050000-556c-060e-90f1-5461b455d46a	8230	Mokronog
00050000-556c-060e-e6a4-a16acfc6ef34	1251	Moravče
00050000-556c-060e-65da-40f243262e3d	9226	Moravske Toplice
00050000-556c-060e-647d-50e364c2ee62	5216	Most na Soči
00050000-556c-060e-de32-b360a00e1780	1221	Motnik
00050000-556c-060e-8f9e-1ea9acba3817	3330	Mozirje
00050000-556c-060e-665f-d239087e3185	9000	Murska Sobota 
00050000-556c-060e-ba52-e5c127dc0c0d	9001	Murska Sobota - poštni predali
00050000-556c-060e-8482-d923db002039	2366	Muta
00050000-556c-060e-b225-cde14adfb9a6	4202	Naklo
00050000-556c-060e-92c9-71cae488f815	3331	Nazarje
00050000-556c-060e-0de4-a429590195f0	1357	Notranje Gorice
00050000-556c-060e-a7fa-3df8f4f5fb9b	3203	Nova Cerkev
00050000-556c-060e-4165-0eef528a676a	5000	Nova Gorica 
00050000-556c-060e-447d-4457ae7494dc	5001	Nova Gorica - poštni predali
00050000-556c-060e-4ba5-d541b9d1e715	1385	Nova vas
00050000-556c-060e-6932-cbc5e7915cc4	8000	Novo mesto
00050000-556c-060e-5ad5-510aae29cee2	8001	Novo mesto - poštni predali
00050000-556c-060e-e4a7-0ede0bb20cd1	6243	Obrov
00050000-556c-060e-4820-c7f753d3266f	9233	Odranci
00050000-556c-060e-5b56-15d3cc4ea347	2317	Oplotnica
00050000-556c-060e-a423-b14a3a3ad05b	2312	Orehova vas
00050000-556c-060e-3bd8-7637abe4de8f	2270	Ormož
00050000-556c-060e-5f64-2498e3440d0e	1316	Ortnek
00050000-556c-060e-bbdd-ed8c337c08b5	1337	Osilnica
00050000-556c-060e-6255-b1bfd0fa43da	8222	Otočec
00050000-556c-060e-f8ea-2128bb5d9d1c	2361	Ožbalt
00050000-556c-060e-2565-37244604f6ad	2231	Pernica
00050000-556c-060e-dc86-544119ade2ba	2211	Pesnica pri Mariboru
00050000-556c-060e-fd6b-a6ee56512f06	9203	Petrovci
00050000-556c-060e-0ecd-5fddd8b8d24f	3301	Petrovče
00050000-556c-060e-143c-a9faaac9abcb	6330	Piran/Pirano
00050000-556c-060e-bc70-7a6744c78512	8255	Pišece
00050000-556c-060e-726a-1304ead0b2bd	6257	Pivka
00050000-556c-060e-8925-92e72aaff10e	6232	Planina
00050000-556c-060e-0695-5ecc544cace6	3225	Planina pri Sevnici
00050000-556c-060e-b1bf-ca84c478e86d	6276	Pobegi
00050000-556c-060e-e67b-9ef3758dfc31	8312	Podbočje
00050000-556c-060e-e17d-6ee6bcf9c731	5243	Podbrdo
00050000-556c-060e-7059-71a368d941e7	3254	Podčetrtek
00050000-556c-060e-d65b-107fc0bae155	2273	Podgorci
00050000-556c-060e-cde3-5c478c1411c7	6216	Podgorje
00050000-556c-060e-00ff-cf2b3f0d93dc	2381	Podgorje pri Slovenj Gradcu
00050000-556c-060e-8859-1f3848ebe532	6244	Podgrad
00050000-556c-060e-d551-2ea28dda75ea	1414	Podkum
00050000-556c-060e-6c6c-80a41933b3e4	2286	Podlehnik
00050000-556c-060e-e6d1-7437ee3c9820	5272	Podnanos
00050000-556c-060e-e597-c2de4b865f66	4244	Podnart
00050000-556c-060e-d817-de7ac633ee4e	3241	Podplat
00050000-556c-060e-cfc9-b8a34f9bf811	3257	Podsreda
00050000-556c-060e-328d-ff476141c8ed	2363	Podvelka
00050000-556c-060e-0ad0-0e691052eeec	2208	Pohorje
00050000-556c-060e-5ec4-369a78568a72	2257	Polenšak
00050000-556c-060e-0d49-a46db77411d9	1355	Polhov Gradec
00050000-556c-060e-541c-f14cb3366a53	4223	Poljane nad Škofjo Loko
00050000-556c-060e-ed81-fc429bca2566	2319	Poljčane
00050000-556c-060e-38e4-91e4884b52bd	1272	Polšnik
00050000-556c-060e-ddcd-da608fa78d2a	3313	Polzela
00050000-556c-060e-0af2-201ea6158da2	3232	Ponikva
00050000-556c-060e-b7ac-94f3dcbc44a1	6320	Portorož/Portorose
00050000-556c-060e-59c8-6a47fb6b6a77	6230	Postojna
00050000-556c-060e-8612-b5b2b9118935	2331	Pragersko
00050000-556c-060e-c48c-c35c9e4c0463	3312	Prebold
00050000-556c-060e-9dbf-0e2b8557f1f7	4205	Preddvor
00050000-556c-060e-448d-578a01c0ea7c	6255	Prem
00050000-556c-060e-ef9c-2fd8da416880	1352	Preserje
00050000-556c-060e-f1a8-8adb3baba725	6258	Prestranek
00050000-556c-060e-7c82-a897e41f4d27	2391	Prevalje
00050000-556c-060e-4e26-3d147265a28c	3262	Prevorje
00050000-556c-060e-3346-2261391843ce	1276	Primskovo 
00050000-556c-060e-486d-202f252d178d	3253	Pristava pri Mestinju
00050000-556c-060e-9a95-2d3adf821f64	9207	Prosenjakovci/Partosfalva
00050000-556c-060e-0c95-cbd26f637350	5297	Prvačina
00050000-556c-060e-d54d-9eae519d2796	2250	Ptuj
00050000-556c-060e-57b8-04ee37c65ee1	2323	Ptujska Gora
00050000-556c-060e-6301-4e60c869d70d	9201	Puconci
00050000-556c-060e-659a-7cee16a8010b	2327	Rače
00050000-556c-060e-72d6-4f7ce6e2aea2	1433	Radeče
00050000-556c-060e-0112-e85834f22399	9252	Radenci
00050000-556c-060e-6e6f-5ad3dd3e0261	2360	Radlje ob Dravi
00050000-556c-060e-a301-08003786b969	1235	Radomlje
00050000-556c-060e-5476-a889419faafc	4240	Radovljica
00050000-556c-060e-e839-fccb743e8321	8274	Raka
00050000-556c-060e-c412-1194b7a791bd	1381	Rakek
00050000-556c-060e-e074-587f20b3caf0	4283	Rateče - Planica
00050000-556c-060e-b73a-c48ab83308c2	2390	Ravne na Koroškem
00050000-556c-060e-b4c4-4296c18b3e7e	9246	Razkrižje
00050000-556c-060e-ee5a-293a665cac9c	3332	Rečica ob Savinji
00050000-556c-060e-8156-36b257df3f73	5292	Renče
00050000-556c-060e-d53c-60b84dafc24b	1310	Ribnica
00050000-556c-060e-add2-5c89db5f74c6	2364	Ribnica na Pohorju
00050000-556c-060e-f24b-2fbc258bad5d	3272	Rimske Toplice
00050000-556c-060e-77d7-0ab640d441cd	1314	Rob
00050000-556c-060e-a7dd-6a5475f81580	5215	Ročinj
00050000-556c-060e-2fed-6ed4905235af	3250	Rogaška Slatina
00050000-556c-060e-7ad1-08a6eb8be67a	9262	Rogašovci
00050000-556c-060e-8fdb-ad020663f529	3252	Rogatec
00050000-556c-060e-0484-26bb685dab7b	1373	Rovte
00050000-556c-060e-0b6a-8e2838aa1007	2342	Ruše
00050000-556c-060e-7401-abced3ff307b	1282	Sava
00050000-556c-060e-5841-e979c6c9a274	6333	Sečovlje/Sicciole
00050000-556c-060e-3e57-da0c8a652f17	4227	Selca
00050000-556c-060e-6f84-027a37978a5d	2352	Selnica ob Dravi
00050000-556c-060e-c046-7071eda93ccd	8333	Semič
00050000-556c-060e-e1ac-b1d1d08b0255	8281	Senovo
00050000-556c-060e-4acb-7ac3df3aada5	6224	Senožeče
00050000-556c-060e-754e-c4de387e232d	8290	Sevnica
00050000-556c-060e-a79c-dbe01ab67965	6210	Sežana
00050000-556c-060e-5f32-873a8215c3cd	2214	Sladki Vrh
00050000-556c-060e-bbe9-7e0682e578fd	5283	Slap ob Idrijci
00050000-556c-060e-2ec1-4b8b2bc02c6d	2380	Slovenj Gradec
00050000-556c-060e-24d1-01ddee5d5ca9	2310	Slovenska Bistrica
00050000-556c-060e-3dff-bed24e580509	3210	Slovenske Konjice
00050000-556c-060e-2da4-b03a645cd418	1216	Smlednik
00050000-556c-060e-7aba-12f49feddce7	5232	Soča
00050000-556c-060e-2040-8149d6eeb6b2	1317	Sodražica
00050000-556c-060e-62d5-95af7fbd3945	3335	Solčava
00050000-556c-060e-4547-463c48d708e2	5250	Solkan
00050000-556c-060e-5ad1-53a9256e2b99	4229	Sorica
00050000-556c-060e-f46f-68bd74b771be	4225	Sovodenj
00050000-556c-060e-7f00-afab3ce4678a	5281	Spodnja Idrija
00050000-556c-060e-3cb9-6320b10235fd	2241	Spodnji Duplek
00050000-556c-060e-8f42-8386bd214a4c	9245	Spodnji Ivanjci
00050000-556c-060e-56fd-e024c2a75155	2277	Središče ob Dravi
00050000-556c-060e-ab53-208bfbb8281d	4267	Srednja vas v Bohinju
00050000-556c-060e-a24f-cc5afb0e1cb7	8256	Sromlje 
00050000-556c-060e-2aa8-37259eed0bc9	5224	Srpenica
00050000-556c-060e-b107-4cd483fb78d5	1242	Stahovica
00050000-556c-060e-7e15-dd699d27b119	1332	Stara Cerkev
00050000-556c-060e-e2c3-ee2af7385c07	8342	Stari trg ob Kolpi
00050000-556c-060e-6d27-50a935d650de	1386	Stari trg pri Ložu
00050000-556c-060e-c47d-68282d56afc1	2205	Starše
00050000-556c-060e-985c-299fe0e7e064	2289	Stoperce
00050000-556c-060e-0fab-7fcc941fd212	8322	Stopiče
00050000-556c-060e-e30e-2fb425328347	3206	Stranice
00050000-556c-060e-dcbc-c4f3d075c778	8351	Straža
00050000-556c-060e-3749-5deec6e177bd	1313	Struge
00050000-556c-060e-121f-678bb5a4e0a2	8293	Studenec
00050000-556c-060e-75e6-ffd95e4e1b81	8331	Suhor
00050000-556c-060e-551d-5b6af9e5ce84	2233	Sv. Ana v Slovenskih goricah
00050000-556c-060e-78ec-71d8acc4f9a1	2235	Sv. Trojica v Slovenskih goricah
00050000-556c-060e-0d20-1aef91610f47	2353	Sveti Duh na Ostrem Vrhu
00050000-556c-060e-8962-ab48aa2e3bb0	9244	Sveti Jurij ob Ščavnici
00050000-556c-060e-e70e-574caea812ff	3264	Sveti Štefan
00050000-556c-060e-8189-78e27e8b130d	2258	Sveti Tomaž
00050000-556c-060e-1550-5417dd0134ef	9204	Šalovci
00050000-556c-060e-6992-2749ec03b662	5261	Šempas
00050000-556c-060e-dd4a-514e9853eb79	5290	Šempeter pri Gorici
00050000-556c-060e-2d83-d3012864ef03	3311	Šempeter v Savinjski dolini
00050000-556c-060e-961b-cea50176bac5	4208	Šenčur
00050000-556c-060e-7996-f326b1d4f7a5	2212	Šentilj v Slovenskih goricah
00050000-556c-060e-5f56-ccf74c5468a2	8297	Šentjanž
00050000-556c-060e-e45b-13e3093de6e6	2373	Šentjanž pri Dravogradu
00050000-556c-060e-0c18-c41ccc4ffce8	8310	Šentjernej
00050000-556c-060e-e490-8a146ccdd98a	3230	Šentjur
00050000-556c-060e-e742-6cc1031b8c03	3271	Šentrupert
00050000-556c-060e-19e8-3bdd004f828e	8232	Šentrupert
00050000-556c-060e-5a36-ee5fb4f4c35c	1296	Šentvid pri Stični
00050000-556c-060e-558a-eabd6e71bd47	8275	Škocjan
00050000-556c-060e-76dd-682d3e283e79	6281	Škofije
00050000-556c-060e-0eb8-f3a5b31cd5cd	4220	Škofja Loka
00050000-556c-060e-f430-fe0ebe648176	3211	Škofja vas
00050000-556c-060e-ee14-38bb567a70d4	1291	Škofljica
00050000-556c-060e-e175-7971e7e63c6c	6274	Šmarje
00050000-556c-060e-c4bf-74415a92353b	1293	Šmarje - Sap
00050000-556c-060e-a3b0-65a0fff1d7cf	3240	Šmarje pri Jelšah
00050000-556c-060e-9268-e04c7bd63b30	8220	Šmarješke Toplice
00050000-556c-060e-ba13-cb89779830c4	2315	Šmartno na Pohorju
00050000-556c-060e-212b-fa6e705fa049	3341	Šmartno ob Dreti
00050000-556c-060e-a175-278b1e3c7b6a	3327	Šmartno ob Paki
00050000-556c-060e-b88c-f33084d72cd2	1275	Šmartno pri Litiji
00050000-556c-060e-6018-ec3378765429	2383	Šmartno pri Slovenj Gradcu
00050000-556c-060e-ed33-a7dfd4585304	3201	Šmartno v Rožni dolini
00050000-556c-060e-0e8d-9da54a0fce2a	3325	Šoštanj
00050000-556c-060e-4b11-18f0dd4088a3	6222	Štanjel
00050000-556c-060e-5370-d0a399db7c16	3220	Štore
00050000-556c-060e-ebc5-e05fc71548bd	3304	Tabor
00050000-556c-060e-657d-eb79768903a1	3221	Teharje
00050000-556c-060e-42f8-c08cf71aa10e	9251	Tišina
00050000-556c-060e-9782-679275b63fb5	5220	Tolmin
00050000-556c-060e-3d46-c8fc9d1de024	3326	Topolšica
00050000-556c-060e-6788-6d1800b8a58b	2371	Trbonje
00050000-556c-060e-2a8d-9e84073f8a2e	1420	Trbovlje
00050000-556c-060e-5ef4-dfd623236361	8231	Trebelno 
00050000-556c-060e-544f-d0e4f13983ba	8210	Trebnje
00050000-556c-060e-d443-ac1ee043a825	5252	Trnovo pri Gorici
00050000-556c-060e-007b-f7655ed80fab	2254	Trnovska vas
00050000-556c-060e-f7c5-bc6b1561b74a	1222	Trojane
00050000-556c-060e-12ca-cb378acfa713	1236	Trzin
00050000-556c-060e-fbac-a73db6fe55a2	4290	Tržič
00050000-556c-060e-caf0-e33d953aaee2	8295	Tržišče
00050000-556c-060e-75e4-81d06422e584	1311	Turjak
00050000-556c-060e-3672-f63d29983d13	9224	Turnišče
00050000-556c-060e-bc20-a5f219a23a09	8323	Uršna sela
00050000-556c-060e-2e2b-cf2d64824b8a	1252	Vače
00050000-556c-060e-ae87-54b40d4f69db	3320	Velenje 
00050000-556c-060e-4ecb-bce089143460	3322	Velenje - poštni predali
00050000-556c-060e-085a-0ceae343f078	8212	Velika Loka
00050000-556c-060e-1d3d-4a9f6b70e427	2274	Velika Nedelja
00050000-556c-060e-ae4b-e223cbc5b4ae	9225	Velika Polana
00050000-556c-060e-ece6-bec2de86fea5	1315	Velike Lašče
00050000-556c-060e-022f-1af478bf9b51	8213	Veliki Gaber
00050000-556c-060e-1720-a7ea4589f05b	9241	Veržej
00050000-556c-060e-252f-baccd0f44347	1312	Videm - Dobrepolje
00050000-556c-060e-9750-851a65b3c39b	2284	Videm pri Ptuju
00050000-556c-060e-0ae4-bd0d68c11fa8	8344	Vinica
00050000-556c-060e-c228-56f6ca7a531a	5271	Vipava
00050000-556c-060e-2418-3c96b4f92270	4212	Visoko
00050000-556c-060e-24b3-c49bbf1bfb4a	1294	Višnja Gora
00050000-556c-060e-958d-e80ebe55f2d3	3205	Vitanje
00050000-556c-060e-2a20-635b468b5aa5	2255	Vitomarci
00050000-556c-060e-e931-8bf99b194aa6	1217	Vodice
00050000-556c-060e-cd12-a21f61918cb5	3212	Vojnik\t
00050000-556c-060e-89fd-497f2887143b	5293	Volčja Draga
00050000-556c-060e-d903-16e7fe441ef0	2232	Voličina
00050000-556c-060e-134f-66ab8945eb95	3305	Vransko
00050000-556c-060e-afdf-9bffd4cbca05	6217	Vremski Britof
00050000-556c-060e-0530-d5e229ba1f33	1360	Vrhnika
00050000-556c-060e-f5ba-d917ff81579c	2365	Vuhred
00050000-556c-060e-1ea6-d6a9356b99a3	2367	Vuzenica
00050000-556c-060e-d5c0-6641e28a8f48	8292	Zabukovje 
00050000-556c-060e-0483-cb5a8722a455	1410	Zagorje ob Savi
00050000-556c-060e-f35f-6d89deb29c90	1303	Zagradec
00050000-556c-060e-8669-9652f6cd709e	2283	Zavrč
00050000-556c-060e-2b10-658eff139dae	8272	Zdole 
00050000-556c-060e-3ba2-7d989c2808bc	4201	Zgornja Besnica
00050000-556c-060e-8213-35d9da060aa4	2242	Zgornja Korena
00050000-556c-060e-4a20-eded31f1e567	2201	Zgornja Kungota
00050000-556c-060e-f9b9-b9645fa54754	2316	Zgornja Ložnica
00050000-556c-060e-ffae-dcc826e85f8d	2314	Zgornja Polskava
00050000-556c-060e-9b5c-d3680f977ede	2213	Zgornja Velka
00050000-556c-060e-adbe-2e257ebe35b8	4247	Zgornje Gorje
00050000-556c-060e-bb27-19a57c9359b8	4206	Zgornje Jezersko
00050000-556c-060e-b104-8500917c7da1	2285	Zgornji Leskovec
00050000-556c-060e-4644-16c897e89f88	1432	Zidani Most
00050000-556c-060e-5266-86389e3342ff	3214	Zreče
00050000-556c-060e-784a-abf53fa4a16b	4209	Žabnica
00050000-556c-060e-f0ac-50ca105bb364	3310	Žalec
00050000-556c-060e-1942-d96e73ea83bb	4228	Železniki
00050000-556c-060e-f144-aec7af9f522a	2287	Žetale
00050000-556c-060e-0839-48d269db78ce	4226	Žiri
00050000-556c-060e-59e5-78d943cc300e	4274	Žirovnica
00050000-556c-060e-eda1-6e79982bcb96	8360	Žužemberk
\.


--
-- TOC entry 2722 (class 0 OID 5584128)
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
-- TOC entry 2704 (class 0 OID 5583943)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2710 (class 0 OID 5584021)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2724 (class 0 OID 5584140)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2737 (class 0 OID 5584260)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2741 (class 0 OID 5584311)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2728 (class 0 OID 5584169)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-556c-060f-8cc9-ea700061024f	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-556c-060f-41ce-eb0207d3b562	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-556c-060f-5238-0dca71345431	0003	Kazinska	t	84	Kazinska dvorana
00220000-556c-060f-bc9c-7a8c84b58e47	0004	Mali oder	t	24	Mali oder 
00220000-556c-060f-af31-b95c2272bed3	0005	Komorni oder	t	15	Komorni oder
00220000-556c-060f-ee4d-1b813fe2f78f	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-556c-060f-45b6-1d1c14ef0f1b	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2720 (class 0 OID 5584113)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2719 (class 0 OID 5584103)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2740 (class 0 OID 5584300)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2735 (class 0 OID 5584237)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2693 (class 0 OID 5583816)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-556c-060f-5a2a-bbc78eda9fa9	00010000-556c-060f-2843-c36c8a8fc2f2	2015-06-01 09:13:20	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO/3FD0PknhvMuzOj6AiShoZIlrmVgpsu";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2758 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2729 (class 0 OID 5584179)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2697 (class 0 OID 5583854)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-556c-060f-2508-d3bffb96d50d	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-556c-060f-3a09-5a2fb1966d12	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-556c-060f-4ec6-d29b0c519eac	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-556c-060f-14bb-1ff64db47bc7	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-556c-060f-2de5-7a05f0d763ea	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-556c-060f-06a7-47300edc7599	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2695 (class 0 OID 5583838)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-556c-060f-5a2a-bbc78eda9fa9	00020000-556c-060f-14bb-1ff64db47bc7
00010000-556c-060f-2843-c36c8a8fc2f2	00020000-556c-060f-14bb-1ff64db47bc7
\.


--
-- TOC entry 2731 (class 0 OID 5584193)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2723 (class 0 OID 5584134)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2717 (class 0 OID 5584084)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2749 (class 0 OID 5584408)
-- Dependencies: 230
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-556c-060e-270c-c2b34292fe70	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-556c-060e-a21d-1b30c0328257	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-556c-060e-38a4-2c0c4d91c141	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-556c-060e-6b1c-235da8feddde	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-556c-060e-778a-24da4d80988d	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2748 (class 0 OID 5584401)
-- Dependencies: 229
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-556c-060e-cd03-ae969e1334db	00000000-556c-060e-6b1c-235da8feddde	popa
00000000-556c-060e-c51d-b948233a5358	00000000-556c-060e-6b1c-235da8feddde	oseba
00000000-556c-060e-c136-382d5b36f2f9	00000000-556c-060e-a21d-1b30c0328257	prostor
00000000-556c-060e-7de1-61b5ddfebf67	00000000-556c-060e-6b1c-235da8feddde	besedilo
00000000-556c-060e-589e-cd0e7e036267	00000000-556c-060e-6b1c-235da8feddde	uprizoritev
00000000-556c-060e-9892-7cc10e1ccfe7	00000000-556c-060e-6b1c-235da8feddde	funkcija
00000000-556c-060e-e100-80671f2d91dd	00000000-556c-060e-6b1c-235da8feddde	tipfunkcije
00000000-556c-060e-fc0c-53576cc8f661	00000000-556c-060e-6b1c-235da8feddde	alternacija
\.


--
-- TOC entry 2747 (class 0 OID 5584396)
-- Dependencies: 228
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2736 (class 0 OID 5584247)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2702 (class 0 OID 5583915)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2718 (class 0 OID 5584090)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-556c-060f-e7f1-7675a96b1624	00180000-556c-060f-33e8-4614bfb9f4ed	000c0000-556c-060f-3676-9833f44c896a	00090000-556c-060f-3e08-cb7cba3d4c71	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-060f-6acb-8b400d9eb1cc	00180000-556c-060f-33e8-4614bfb9f4ed	000c0000-556c-060f-9cd2-5c18ec49a730	00090000-556c-060f-3c38-fa3a7ec60703	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-060f-a9ac-602e728e091e	00180000-556c-060f-33e8-4614bfb9f4ed	000c0000-556c-060f-9a6e-ce65ef5a9227	00090000-556c-060f-5da0-b6172ff25a5d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-060f-556b-67a0c39b7c28	00180000-556c-060f-33e8-4614bfb9f4ed	000c0000-556c-060f-8069-d4cca862c50f	00090000-556c-060f-77e8-123a8ec6b4e2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556c-060f-0192-4afadf1eac98	00180000-556c-060f-33e8-4614bfb9f4ed	000c0000-556c-060f-1d15-c13a76548e28	00090000-556c-060f-ec72-4be0afcfd213	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
\.


--
-- TOC entry 2739 (class 0 OID 5584289)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-556c-060e-e71a-3cd678eee8d7	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-556c-060e-f195-768ab714c241	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-556c-060e-ad5b-04b4dd517322	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-556c-060e-7e85-4e7a9b2bd747	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-556c-060e-71dd-045699418c5b	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-556c-060e-2498-6c155bbc8c45	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-556c-060e-eed9-1041fc476549	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-556c-060e-813f-05b184667891	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-556c-060e-c3c7-96c23f8bf6bf	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-556c-060e-b921-8ca5558e7062	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-556c-060e-6dd2-a46f4dc039ed	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-556c-060e-3697-923a0fa8bd35	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-556c-060e-7462-989d443d019f	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-556c-060e-cecf-24579f9d65f0	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-556c-060e-4337-b29a3c6ef7ae	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-556c-060e-7364-731223818af2	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2707 (class 0 OID 5583978)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2694 (class 0 OID 5583825)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-556c-060f-2843-c36c8a8fc2f2	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROoBRWi3NEroo4WNZ8veb.8G73FtcU1US	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-556c-060f-8b9c-0960dd946899	testni uporabnik za inšpecienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-556c-060f-d316-7186570daa3e	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-556c-060f-4d18-68238ea8c8a5	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-556c-060f-5a2a-bbc78eda9fa9	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2744 (class 0 OID 5584344)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-556c-060f-a6de-cf0613009c5e	00160000-556c-060f-9d3d-8703a1f65a11	00150000-556c-060e-4322-6c1da5992969	00140000-556c-060e-ddc7-48d3bcba0c35	0001	produkcija	Sen kresne noči		Sanje	2016-02-01	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-556c-060f-af31-b95c2272bed3
000e0000-556c-060f-7c8f-c699163bc0e8	00160000-556c-060f-a779-9b88c78525bb	00150000-556c-060e-ee0b-b9e724ec9723	00140000-556c-060e-6306-9135123dac95	0002	predprodukcija-ideja	Smoletov vrt			2017-01-01	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-556c-060f-ee4d-1b813fe2f78f
\.


--
-- TOC entry 2712 (class 0 OID 5584036)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-556c-060f-46bf-38c3d420ae83	000e0000-556c-060f-7c8f-c699163bc0e8	1	
00200000-556c-060f-8c19-b5f19797fa4d	000e0000-556c-060f-7c8f-c699163bc0e8	2	
\.


--
-- TOC entry 2727 (class 0 OID 5584161)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2734 (class 0 OID 5584229)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2714 (class 0 OID 5584068)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2743 (class 0 OID 5584334)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-556c-060e-ddc7-48d3bcba0c35	Drama	drama (SURS 01)
00140000-556c-060e-6864-6c06afa0400d	Opera	opera (SURS 02)
00140000-556c-060e-4b30-57f8633129dc	Balet	balet (SURS 03)
00140000-556c-060e-4252-2354d8326e90	Plesne prireditve	plesne prireditve (SURS 04)
00140000-556c-060e-3fc5-848736cc4fb2	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-556c-060e-6306-9135123dac95	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-556c-060e-d0c2-82976a43661c	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2733 (class 0 OID 5584219)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-556c-060e-86b5-206af9e8f8b6	Opera	opera
00150000-556c-060e-deca-7ede6443198d	Opereta	opereta
00150000-556c-060e-646c-7b1b1dd60140	Balet	balet
00150000-556c-060e-b456-9e9182aa3335	Plesne prireditve	plesne prireditve
00150000-556c-060e-d432-1f57f51e9642	Lutkovno gledališče	lutkovno gledališče
00150000-556c-060e-244c-55777d7d74a5	Raziskovalno gledališče	raziskovalno gledališče
00150000-556c-060e-96db-b24a42454dda	Biografska drama	biografska drama
00150000-556c-060e-4322-6c1da5992969	Komedija	komedija
00150000-556c-060e-19c9-1d385ca14ce3	Črna komedija	črna komedija
00150000-556c-060e-1f63-5f989732c856	E-igra	E-igra
00150000-556c-060e-ee0b-b9e724ec9723	Kriminalka	kriminalka
00150000-556c-060e-7518-f7ba5e5c30c1	Musical	musical
\.


--
-- TOC entry 2314 (class 2606 OID 5583879)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 5584389)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 5584379)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 5584288)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 5584058)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 5584083)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 5584004)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 5584215)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 5584034)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 5584077)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2355 (class 2606 OID 5584018)
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
-- TOC entry 2405 (class 2606 OID 5584126)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 5584153)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2340 (class 2606 OID 5583976)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2318 (class 2606 OID 5583888)
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
-- TOC entry 2320 (class 2606 OID 5583912)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2312 (class 2606 OID 5583868)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2305 (class 2606 OID 5583853)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 5584159)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 5584192)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 5584329)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 2606 OID 5583940)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2337 (class 2606 OID 5583964)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2409 (class 2606 OID 5584132)
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
-- TOC entry 2335 (class 2606 OID 5583954)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2360 (class 2606 OID 5584025)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2415 (class 2606 OID 5584144)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2459 (class 2606 OID 5584272)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 5584316)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 5584176)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 5584117)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 5584108)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 5584310)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2451 (class 2606 OID 5584244)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2297 (class 2606 OID 5583824)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 5584183)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2303 (class 2606 OID 5583842)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2307 (class 2606 OID 5583862)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 5584201)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 5584139)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 5584089)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 5584414)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 5584405)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 5584400)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 5584257)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 2606 OID 5583920)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 5584099)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 5584299)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 5583989)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2299 (class 2606 OID 5583837)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 5584359)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2366 (class 2606 OID 5584043)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 5584167)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2447 (class 2606 OID 5584235)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2379 (class 2606 OID 5584072)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 5584343)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2444 (class 2606 OID 5584228)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 1259 OID 5584065)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2452 (class 1259 OID 5584258)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2453 (class 1259 OID 5584259)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2327 (class 1259 OID 5583942)
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
-- TOC entry 2418 (class 1259 OID 5584160)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2412 (class 1259 OID 5584146)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2413 (class 1259 OID 5584145)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2364 (class 1259 OID 5584044)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2440 (class 1259 OID 5584216)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2441 (class 1259 OID 5584218)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2442 (class 1259 OID 5584217)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2352 (class 1259 OID 5584020)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2353 (class 1259 OID 5584019)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2469 (class 1259 OID 5584331)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2470 (class 1259 OID 5584332)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2471 (class 1259 OID 5584333)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2477 (class 1259 OID 5584364)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2478 (class 1259 OID 5584361)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2479 (class 1259 OID 5584363)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2480 (class 1259 OID 5584362)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2342 (class 1259 OID 5583991)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2343 (class 1259 OID 5583990)
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
-- TOC entry 2428 (class 1259 OID 5584184)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2382 (class 1259 OID 5584078)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2309 (class 1259 OID 5583869)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2310 (class 1259 OID 5583870)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2433 (class 1259 OID 5584204)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2434 (class 1259 OID 5584203)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2435 (class 1259 OID 5584202)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2356 (class 1259 OID 5584026)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2357 (class 1259 OID 5584028)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2358 (class 1259 OID 5584027)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2498 (class 1259 OID 5584407)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2392 (class 1259 OID 5584112)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2393 (class 1259 OID 5584110)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2394 (class 1259 OID 5584109)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2395 (class 1259 OID 5584111)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2300 (class 1259 OID 5583843)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2301 (class 1259 OID 5583844)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2421 (class 1259 OID 5584168)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2407 (class 1259 OID 5584133)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2448 (class 1259 OID 5584245)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2449 (class 1259 OID 5584246)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2331 (class 1259 OID 5583956)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2332 (class 1259 OID 5583955)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2333 (class 1259 OID 5583957)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2456 (class 1259 OID 5584273)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2457 (class 1259 OID 5584274)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2490 (class 1259 OID 5584393)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2491 (class 1259 OID 5584392)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2492 (class 1259 OID 5584395)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2493 (class 1259 OID 5584391)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2494 (class 1259 OID 5584394)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2445 (class 1259 OID 5584236)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2398 (class 1259 OID 5584121)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2399 (class 1259 OID 5584120)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2400 (class 1259 OID 5584118)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2401 (class 1259 OID 5584119)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2283 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2486 (class 1259 OID 5584381)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2487 (class 1259 OID 5584380)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2363 (class 1259 OID 5584035)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2315 (class 1259 OID 5583890)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2316 (class 1259 OID 5583889)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2323 (class 1259 OID 5583921)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2324 (class 1259 OID 5583922)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2387 (class 1259 OID 5584102)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2388 (class 1259 OID 5584101)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2389 (class 1259 OID 5584100)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2370 (class 1259 OID 5584067)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2371 (class 1259 OID 5584063)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2372 (class 1259 OID 5584060)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2373 (class 1259 OID 5584061)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2374 (class 1259 OID 5584059)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2375 (class 1259 OID 5584064)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2376 (class 1259 OID 5584062)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2330 (class 1259 OID 5583941)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2348 (class 1259 OID 5584005)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2349 (class 1259 OID 5584007)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2350 (class 1259 OID 5584006)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2351 (class 1259 OID 5584008)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2406 (class 1259 OID 5584127)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2474 (class 1259 OID 5584330)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2481 (class 1259 OID 5584360)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2321 (class 1259 OID 5583913)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2322 (class 1259 OID 5583914)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2504 (class 1259 OID 5584415)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2341 (class 1259 OID 5583977)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2501 (class 1259 OID 5584406)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2426 (class 1259 OID 5584178)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2427 (class 1259 OID 5584177)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2495 (class 1259 OID 5584390)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2286 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2338 (class 1259 OID 5583965)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2468 (class 1259 OID 5584317)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2308 (class 1259 OID 5583863)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2377 (class 1259 OID 5584066)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2531 (class 2606 OID 5584546)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2528 (class 2606 OID 5584531)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2529 (class 2606 OID 5584536)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2533 (class 2606 OID 5584556)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2527 (class 2606 OID 5584526)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2532 (class 2606 OID 5584551)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2530 (class 2606 OID 5584541)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2562 (class 2606 OID 5584701)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2563 (class 2606 OID 5584706)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2514 (class 2606 OID 5584461)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2550 (class 2606 OID 5584641)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2549 (class 2606 OID 5584636)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2548 (class 2606 OID 5584631)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2526 (class 2606 OID 5584521)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2556 (class 2606 OID 5584671)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2558 (class 2606 OID 5584681)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2557 (class 2606 OID 5584676)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2521 (class 2606 OID 5584496)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2520 (class 2606 OID 5584491)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2546 (class 2606 OID 5584621)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2567 (class 2606 OID 5584726)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2568 (class 2606 OID 5584731)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2569 (class 2606 OID 5584736)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2573 (class 2606 OID 5584756)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2570 (class 2606 OID 5584741)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2572 (class 2606 OID 5584751)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2571 (class 2606 OID 5584746)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2519 (class 2606 OID 5584486)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 5584481)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2511 (class 2606 OID 5584446)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2552 (class 2606 OID 5584651)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2534 (class 2606 OID 5584561)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2507 (class 2606 OID 5584426)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2508 (class 2606 OID 5584431)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2555 (class 2606 OID 5584666)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2554 (class 2606 OID 5584661)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2553 (class 2606 OID 5584656)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2522 (class 2606 OID 5584501)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2524 (class 2606 OID 5584511)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2523 (class 2606 OID 5584506)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2581 (class 2606 OID 5584796)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2541 (class 2606 OID 5584596)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2539 (class 2606 OID 5584586)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2538 (class 2606 OID 5584581)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2540 (class 2606 OID 5584591)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2505 (class 2606 OID 5584416)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2506 (class 2606 OID 5584421)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2551 (class 2606 OID 5584646)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2547 (class 2606 OID 5584626)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2560 (class 2606 OID 5584691)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2561 (class 2606 OID 5584696)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2516 (class 2606 OID 5584471)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2515 (class 2606 OID 5584466)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2517 (class 2606 OID 5584476)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2564 (class 2606 OID 5584711)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2565 (class 2606 OID 5584716)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2578 (class 2606 OID 5584781)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2577 (class 2606 OID 5584776)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2580 (class 2606 OID 5584791)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2576 (class 2606 OID 5584771)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2579 (class 2606 OID 5584786)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2559 (class 2606 OID 5584686)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2545 (class 2606 OID 5584616)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2544 (class 2606 OID 5584611)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2542 (class 2606 OID 5584601)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2543 (class 2606 OID 5584606)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2575 (class 2606 OID 5584766)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2574 (class 2606 OID 5584761)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2525 (class 2606 OID 5584516)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2566 (class 2606 OID 5584721)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2510 (class 2606 OID 5584441)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2509 (class 2606 OID 5584436)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2512 (class 2606 OID 5584451)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2513 (class 2606 OID 5584456)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2537 (class 2606 OID 5584576)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2536 (class 2606 OID 5584571)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2535 (class 2606 OID 5584566)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-06-01 09:13:20 CEST

--
-- PostgreSQL database dump complete
--

