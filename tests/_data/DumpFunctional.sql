--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-26 12:37:41 CEST

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
-- TOC entry 180 (class 1259 OID 5096258)
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
-- TOC entry 227 (class 1259 OID 5096768)
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
-- TOC entry 226 (class 1259 OID 5096751)
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
-- TOC entry 219 (class 1259 OID 5096662)
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
-- TOC entry 194 (class 1259 OID 5096432)
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
-- TOC entry 197 (class 1259 OID 5096466)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 5096379)
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
-- TOC entry 213 (class 1259 OID 5096592)
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
-- TOC entry 192 (class 1259 OID 5096416)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 196 (class 1259 OID 5096460)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 5096396)
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
-- TOC entry 202 (class 1259 OID 5096509)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 5096534)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 5096353)
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
-- TOC entry 181 (class 1259 OID 5096267)
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
-- TOC entry 182 (class 1259 OID 5096278)
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
-- TOC entry 177 (class 1259 OID 5096232)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 5096251)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 5096541)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 5096572)
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
-- TOC entry 223 (class 1259 OID 5096705)
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
-- TOC entry 184 (class 1259 OID 5096310)
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
-- TOC entry 186 (class 1259 OID 5096345)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 5096515)
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
-- TOC entry 185 (class 1259 OID 5096330)
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
-- TOC entry 191 (class 1259 OID 5096408)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 5096527)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 5096647)
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
-- TOC entry 222 (class 1259 OID 5096698)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 5096556)
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
-- TOC entry 201 (class 1259 OID 5096500)
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
-- TOC entry 200 (class 1259 OID 5096490)
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
-- TOC entry 221 (class 1259 OID 5096687)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 5096624)
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
-- TOC entry 174 (class 1259 OID 5096203)
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
-- TOC entry 173 (class 1259 OID 5096201)
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
-- TOC entry 210 (class 1259 OID 5096566)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 5096241)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 5096225)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 5096580)
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
-- TOC entry 204 (class 1259 OID 5096521)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 5096471)
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
-- TOC entry 230 (class 1259 OID 5096793)
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
-- TOC entry 229 (class 1259 OID 5096786)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 5096781)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 5096634)
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
-- TOC entry 231 (class 1259 OID 5096801)
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE strosekuprizoritve_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 183 (class 1259 OID 5096302)
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
-- TOC entry 199 (class 1259 OID 5096477)
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
-- TOC entry 220 (class 1259 OID 5096676)
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
-- TOC entry 188 (class 1259 OID 5096365)
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
-- TOC entry 175 (class 1259 OID 5096212)
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
-- TOC entry 225 (class 1259 OID 5096731)
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
-- TOC entry 193 (class 1259 OID 5096423)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 5096548)
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
-- TOC entry 215 (class 1259 OID 5096616)
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
-- TOC entry 195 (class 1259 OID 5096455)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 5096721)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 5096606)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2146 (class 2604 OID 5096206)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2700 (class 0 OID 5096258)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2747 (class 0 OID 5096768)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
\.


--
-- TOC entry 2746 (class 0 OID 5096751)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2739 (class 0 OID 5096662)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-5564-4cf5-a366-9f3ee933bc75	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-5564-4cf5-5b65-45e95ee3af91	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-5564-4cf5-742a-d8d936f8c98b	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 2714 (class 0 OID 5096432)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2717 (class 0 OID 5096466)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2709 (class 0 OID 5096379)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5564-4cf4-7dca-22f74463a757	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5564-4cf4-9c58-5e6f60febe0d	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5564-4cf4-1a55-9a081d8328b3	AL	ALB	008	Albania 	Albanija	\N
00040000-5564-4cf4-af22-b5a76a056a2c	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5564-4cf4-444e-b4da041c5a93	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5564-4cf4-3d5c-b19d43e5e564	AD	AND	020	Andorra 	Andora	\N
00040000-5564-4cf4-c48e-9d09e9d2181d	AO	AGO	024	Angola 	Angola	\N
00040000-5564-4cf4-3cc8-c6f5c4e557e1	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5564-4cf4-f510-b5b2c2a89afd	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5564-4cf4-d903-264c4feb026d	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5564-4cf4-f1b4-72026bbd0d9d	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5564-4cf4-d23c-6379ca80f3eb	AM	ARM	051	Armenia 	Armenija	\N
00040000-5564-4cf4-248b-c2045b65f46b	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5564-4cf4-2cef-b1f09035b331	AU	AUS	036	Australia 	Avstralija	\N
00040000-5564-4cf4-b195-a28a3ba094e9	AT	AUT	040	Austria 	Avstrija	\N
00040000-5564-4cf4-0fb2-d6ccf1e03dc2	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5564-4cf4-d027-421eb8323777	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5564-4cf4-097a-3f9ba4b3a9fc	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5564-4cf4-c62b-f57041e3e560	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5564-4cf4-0be6-4ce9a97b89d0	BB	BRB	052	Barbados 	Barbados	\N
00040000-5564-4cf4-b96b-bf8e3e89a62d	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5564-4cf4-387b-898fc70ea593	BE	BEL	056	Belgium 	Belgija	\N
00040000-5564-4cf4-8865-c42f28e008fe	BZ	BLZ	084	Belize 	Belize	\N
00040000-5564-4cf4-87ab-62273f261998	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5564-4cf4-44ba-ab60cbcf0e07	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5564-4cf4-722b-35536026f75b	BT	BTN	064	Bhutan 	Butan	\N
00040000-5564-4cf4-a441-c9d3575f905f	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5564-4cf4-fda3-736a2fbc6aae	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5564-4cf4-ad9c-f777a76171a0	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5564-4cf4-a679-fb1a6c9b6c2b	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5564-4cf4-987f-46d3ab6efc47	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5564-4cf4-2904-70742da288d1	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5564-4cf4-0727-ae43e594c8f9	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5564-4cf4-9ee8-13f11d117b79	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5564-4cf4-60de-d5731d015705	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5564-4cf4-68bc-0e8e5178e111	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5564-4cf4-2ae4-f4fa7de019be	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5564-4cf4-63a3-30425642bd22	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5564-4cf4-ec09-d69c23887318	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5564-4cf4-6114-cfe9c8db0e7b	CA	CAN	124	Canada 	Kanada	\N
00040000-5564-4cf4-2a37-a5a0f31ea4f5	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5564-4cf4-e86f-837f1fd1f28b	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5564-4cf4-b95b-db4dfba87122	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5564-4cf4-57a0-6201f70fc4ff	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5564-4cf4-8f9a-7e0d3c130c73	CL	CHL	152	Chile 	Čile	\N
00040000-5564-4cf4-6f4c-d00610732039	CN	CHN	156	China 	Kitajska	\N
00040000-5564-4cf4-4db4-93b9bfa9cb98	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5564-4cf4-4331-6c83cf425f1e	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5564-4cf4-2641-cf99ce2a913c	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5564-4cf4-1b9e-0ea33d9d5751	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5564-4cf4-24fe-60d5d2410063	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5564-4cf4-2119-bf9098f587b2	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5564-4cf4-fefa-4e60890594b2	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5564-4cf4-aa29-420cc52793e2	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5564-4cf4-117c-46b42f80f353	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5564-4cf4-80b4-d15eb2ab589c	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5564-4cf4-445f-3c15725a9eb6	CU	CUB	192	Cuba 	Kuba	\N
00040000-5564-4cf4-8379-ebbbed36aa6d	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5564-4cf4-4ec3-5c228c77dbea	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5564-4cf4-3251-e00d47979c36	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5564-4cf4-d414-bec27b9b4fef	DK	DNK	208	Denmark 	Danska	\N
00040000-5564-4cf4-b185-571160e16671	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5564-4cf4-05dd-67a39dc4c506	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5564-4cf4-a679-4dd1d3b102f7	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5564-4cf4-cae2-a801ed0ad330	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5564-4cf4-903c-7e8640b173ee	EG	EGY	818	Egypt 	Egipt	\N
00040000-5564-4cf4-2445-d9628d5a2e6e	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5564-4cf4-27a2-a18e72ccb7a4	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5564-4cf4-d363-51a72a3ad151	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5564-4cf4-12cd-b330e9162773	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5564-4cf4-46f5-0eae62097a6b	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5564-4cf4-55e4-4820259c5538	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5564-4cf4-a89c-aee895d60d2d	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5564-4cf4-b153-23487845ae9a	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5564-4cf4-4f8a-6b051403ab67	FI	FIN	246	Finland 	Finska	\N
00040000-5564-4cf4-01e6-7d734a3bc3cf	FR	FRA	250	France 	Francija	\N
00040000-5564-4cf4-9fee-9f06fa5423f3	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5564-4cf4-a4b5-a410cd01fa23	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5564-4cf4-d68b-7ee2ff03338a	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5564-4cf4-5f6b-3c1b1741d24b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5564-4cf4-61dd-767815d5e622	GA	GAB	266	Gabon 	Gabon	\N
00040000-5564-4cf4-745f-975355c7d414	GM	GMB	270	Gambia 	Gambija	\N
00040000-5564-4cf4-6f28-7c46c94e18ae	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5564-4cf4-3585-ecd2bdfda7de	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5564-4cf4-0cf4-5e4b2d18503c	GH	GHA	288	Ghana 	Gana	\N
00040000-5564-4cf4-9ad5-b866ec5d191f	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5564-4cf4-654d-c854638db9b4	GR	GRC	300	Greece 	Grčija	\N
00040000-5564-4cf4-375b-2402130b695f	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5564-4cf4-4cd3-f67a65a97f57	GD	GRD	308	Grenada 	Grenada	\N
00040000-5564-4cf4-3b00-1f0ccee20516	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5564-4cf4-329f-b8b6adc0fc21	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5564-4cf4-0457-6ffb72e74808	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5564-4cf4-4cc9-3d89a2d87aed	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5564-4cf4-6412-c91797db14ea	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5564-4cf4-e8f5-849c02c911c6	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5564-4cf4-34b4-bedd17e892ce	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5564-4cf4-2001-7b1d6b3ffa6d	HT	HTI	332	Haiti 	Haiti	\N
00040000-5564-4cf4-6c49-ca3ec4d5cc8d	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5564-4cf4-2a4a-c6b02b1b89c2	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5564-4cf4-af6e-92d28a094cee	HN	HND	340	Honduras 	Honduras	\N
00040000-5564-4cf4-463d-2b7e76d08cb4	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5564-4cf4-e1b6-987d2ca79320	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5564-4cf4-c472-720f61e3aaf1	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5564-4cf4-3ce9-75bcae226c7f	IN	IND	356	India 	Indija	\N
00040000-5564-4cf4-087d-777dfa541148	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5564-4cf4-d747-ad9596a13612	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5564-4cf4-0bdd-0790ce57636c	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5564-4cf4-57e2-ebae11878b88	IE	IRL	372	Ireland 	Irska	\N
00040000-5564-4cf4-c039-66ced452c739	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5564-4cf4-7d40-b3b05038e29c	IL	ISR	376	Israel 	Izrael	\N
00040000-5564-4cf4-4c89-f9e01641aba0	IT	ITA	380	Italy 	Italija	\N
00040000-5564-4cf4-696e-25f44ee5d617	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5564-4cf4-77d9-d82ac18e1367	JP	JPN	392	Japan 	Japonska	\N
00040000-5564-4cf4-88aa-b2634ee45554	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5564-4cf4-14b2-3e60a7babce4	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5564-4cf4-cb8a-88689212f1cc	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5564-4cf4-d852-637b274e54e8	KE	KEN	404	Kenya 	Kenija	\N
00040000-5564-4cf4-944c-5f9dec05d8a1	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5564-4cf4-cbf4-cf2700d7940c	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5564-4cf4-3e49-a2bf57cf21b3	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5564-4cf4-2731-2fa6cf34d4d0	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5564-4cf4-7fe1-9eeb3c3e532f	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5564-4cf4-19d6-49dc784ac128	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5564-4cf4-d15e-6e91933e2a39	LV	LVA	428	Latvia 	Latvija	\N
00040000-5564-4cf4-1b38-24ec635795a9	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5564-4cf4-0cc1-cccf20665590	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5564-4cf4-a86b-aa9187848918	LR	LBR	430	Liberia 	Liberija	\N
00040000-5564-4cf4-35f0-9d19b5e80395	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5564-4cf4-49cc-2a36308ace02	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5564-4cf4-0ea4-079cc652888f	LT	LTU	440	Lithuania 	Litva	\N
00040000-5564-4cf4-af00-7f5653d012e5	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5564-4cf4-9233-9ea66e9ff71c	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5564-4cf4-c333-2edc2a4f6cf9	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5564-4cf4-08ea-07af0fe02e20	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5564-4cf4-7816-d0375e541c2f	MW	MWI	454	Malawi 	Malavi	\N
00040000-5564-4cf4-c64b-2adb90557ecd	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5564-4cf4-e7f5-585afb5ce7b4	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5564-4cf4-7323-9fb5fffa612f	ML	MLI	466	Mali 	Mali	\N
00040000-5564-4cf4-294a-0ada71cdcfb2	MT	MLT	470	Malta 	Malta	\N
00040000-5564-4cf4-7615-bc70c5e7aca0	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5564-4cf4-00d1-0918a5d2ddd3	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5564-4cf4-d36a-84c6653e1511	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5564-4cf4-707f-84357153c2cc	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5564-4cf4-34df-0c177b520e7d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5564-4cf4-2579-53d1a2c4900d	MX	MEX	484	Mexico 	Mehika	\N
00040000-5564-4cf4-8a9b-00bd4b2574fc	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5564-4cf4-18ef-80d7c068c64c	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5564-4cf4-9b79-58f94107a3bc	MC	MCO	492	Monaco 	Monako	\N
00040000-5564-4cf4-95ed-a02f01531644	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5564-4cf4-0ba4-46d78f17c858	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5564-4cf4-1b60-d88584c63415	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5564-4cf4-d7ab-08940f9732ee	MA	MAR	504	Morocco 	Maroko	\N
00040000-5564-4cf4-e076-e92bdd7e750f	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5564-4cf4-7df3-403f2efd8913	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5564-4cf4-0fd9-6f05b1ece895	NA	NAM	516	Namibia 	Namibija	\N
00040000-5564-4cf4-af38-706ee24cefd8	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5564-4cf4-57d2-edd90cedbe5f	NP	NPL	524	Nepal 	Nepal	\N
00040000-5564-4cf4-9b7b-35f43617050f	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5564-4cf4-e2a6-c81cf23758fd	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5564-4cf4-4e1e-25a48e5524fd	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5564-4cf4-33b2-61d92fffb51c	NE	NER	562	Niger 	Niger 	\N
00040000-5564-4cf4-d564-973e4e5456db	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5564-4cf4-52d1-5dbe6fbdea75	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5564-4cf4-8bd9-141426f20543	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5564-4cf4-422a-f2e2caaaa098	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5564-4cf4-c738-c7e5c16f2824	NO	NOR	578	Norway 	Norveška	\N
00040000-5564-4cf4-d993-a80d6912e816	OM	OMN	512	Oman 	Oman	\N
00040000-5564-4cf4-dd4c-30c193ea93cf	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5564-4cf4-b59c-26e635aaccd3	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5564-4cf4-6658-03c4e43f195a	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5564-4cf4-a653-3a3c299ac6fa	PA	PAN	591	Panama 	Panama	\N
00040000-5564-4cf4-4a4f-c1bc2e7319be	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5564-4cf4-5ee8-3b380a9e4b45	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5564-4cf4-4c4b-da39948d5fa3	PE	PER	604	Peru 	Peru	\N
00040000-5564-4cf4-6e95-7007eaac29af	PH	PHL	608	Philippines 	Filipini	\N
00040000-5564-4cf4-d630-71b5dc095228	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5564-4cf4-f8f5-7ce37af07218	PL	POL	616	Poland 	Poljska	\N
00040000-5564-4cf4-c850-365886297929	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5564-4cf4-febb-b8048a048239	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5564-4cf4-24cf-73fd9816a0cc	QA	QAT	634	Qatar 	Katar	\N
00040000-5564-4cf4-757b-2d9acf5b349b	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5564-4cf4-6233-e9defbbf4d9d	RO	ROU	642	Romania 	Romunija	\N
00040000-5564-4cf4-97bc-f55c4e8eeeec	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5564-4cf4-cf64-e2476933db8b	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5564-4cf4-ea46-4507c872c04a	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5564-4cf4-fa90-d797e6687f6c	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5564-4cf4-46eb-06e2699970ef	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5564-4cf4-5781-20aaa7bd2d39	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5564-4cf4-536e-48b929ce581d	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5564-4cf4-550a-b235a6df28f2	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5564-4cf4-049c-f30da5adbd57	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5564-4cf4-d2c2-6d6a9b38c8c4	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5564-4cf4-0646-c9647d0c6b08	SM	SMR	674	San Marino 	San Marino	\N
00040000-5564-4cf4-62a5-27f51edb228a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5564-4cf4-a08e-cdb1f4304387	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5564-4cf4-9c2e-2214e67a6373	SN	SEN	686	Senegal 	Senegal	\N
00040000-5564-4cf4-973e-fca5ff98e9bb	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5564-4cf4-8e7d-603eb5b2900e	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5564-4cf4-e8ab-9e3bffda0dd3	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5564-4cf4-42af-37e4153e22e4	SG	SGP	702	Singapore 	Singapur	\N
00040000-5564-4cf4-8842-db2eafb2cf8d	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5564-4cf4-d7ea-99b5343fd764	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5564-4cf4-9092-72f57376db7e	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5564-4cf4-5201-dac573ef0d5f	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5564-4cf4-71a1-39d618a122a9	SO	SOM	706	Somalia 	Somalija	\N
00040000-5564-4cf4-2f7f-79b9c614107d	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5564-4cf4-3005-870c36a4b2dc	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5564-4cf4-02bf-1080dcdb2ac6	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5564-4cf4-e62e-a3417c25eb20	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5564-4cf4-285d-4b58a76eaa16	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5564-4cf4-cb44-ef43f6df5860	SD	SDN	729	Sudan 	Sudan	\N
00040000-5564-4cf4-1c51-497a3cbd7dfe	SR	SUR	740	Suriname 	Surinam	\N
00040000-5564-4cf4-8688-fe960fbef103	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5564-4cf4-89bf-5d13fde0d85b	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5564-4cf4-2090-5d011edfcda0	SE	SWE	752	Sweden 	Švedska	\N
00040000-5564-4cf4-c943-175cb00c8f33	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5564-4cf4-be9e-d26da59fb061	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5564-4cf4-3965-58d3ab03885d	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5564-4cf4-a59f-648be501190b	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5564-4cf4-6b77-3dddd5d822a2	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5564-4cf4-5579-ca5e13936fdc	TH	THA	764	Thailand 	Tajska	\N
00040000-5564-4cf4-4074-d42c9c9faf9f	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5564-4cf4-e3f0-a204d3993ff6	TG	TGO	768	Togo 	Togo	\N
00040000-5564-4cf4-1d14-96cdce015d00	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5564-4cf4-2906-8d2dd2a222de	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5564-4cf4-930f-f93b024cf055	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5564-4cf4-db0d-25f25c30ef00	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5564-4cf4-fea7-9e02a39c2d65	TR	TUR	792	Turkey 	Turčija	\N
00040000-5564-4cf4-bef4-9fcfb51a846a	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5564-4cf4-fa52-c4e7f064a78d	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5564-4cf4-7e66-43852a630b41	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5564-4cf4-edd7-da5805adf172	UG	UGA	800	Uganda 	Uganda	\N
00040000-5564-4cf4-411e-2e616dc86145	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5564-4cf4-3a5c-6fbf46061a90	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5564-4cf4-d5db-a3fbc6b4ebb5	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5564-4cf4-7f9f-2ced025ab552	US	USA	840	United States 	Združene države Amerike	\N
00040000-5564-4cf4-04fb-7e1af755ab76	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5564-4cf4-3907-80a6d0f7e210	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5564-4cf4-d55d-90379a99de90	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5564-4cf4-2072-b5af5e5000bf	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5564-4cf4-7a6e-5489359305ef	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5564-4cf4-708e-e5a57ca872ca	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5564-4cf4-47c9-3b23fae7e3a9	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5564-4cf4-cb45-37b5f50adbcf	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5564-4cf4-ea0a-bd06f23b6fdd	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5564-4cf4-e6f4-d3c0a1634633	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5564-4cf4-5e33-47ce7143ce55	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5564-4cf4-0b02-3e16eb0f9927	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5564-4cf4-5fe4-a85146a192c5	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2733 (class 0 OID 5096592)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj) FROM stdin;
\.


--
-- TOC entry 2712 (class 0 OID 5096416)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2716 (class 0 OID 5096460)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2710 (class 0 OID 5096396)
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
-- TOC entry 2722 (class 0 OID 5096509)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2726 (class 0 OID 5096534)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2707 (class 0 OID 5096353)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5564-4cf4-05a0-50e2c593bb5e	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5564-4cf4-d201-c5f7ef169c04	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5564-4cf4-d594-d5c350fd6004	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5564-4cf4-afaa-189feb70e481	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5564-4cf4-a7bf-301d6e86ee56	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5564-4cf4-2573-444c862a04c2	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5564-4cf4-b829-df79f9ce6e5d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5564-4cf4-f9b6-3bdf2847eca8	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5564-4cf4-188c-5b9b2812da16	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5564-4cf4-43ec-b82b18927577	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5564-4cf4-dce3-9e565eb56030	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5564-4cf4-266c-fa0cc80bb8f2	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5564-4cf4-91fa-c20ac79f7ef5	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5564-4cf4-2e14-74f4f4a92ae2	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5564-4cf4-9eb5-615f7afede23	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2701 (class 0 OID 5096267)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5564-4cf4-dea2-d10864cb4cc9	00000000-5564-4cf4-a7bf-301d6e86ee56	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5564-4cf4-b635-56bcf5bb0507	00000000-5564-4cf4-a7bf-301d6e86ee56	00010000-5564-4cf4-56f6-fae8fc1fb9df	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5564-4cf4-86d5-d53379fd84a5	00000000-5564-4cf4-2573-444c862a04c2	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2702 (class 0 OID 5096278)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5564-4cf5-f941-bfddc49b500a	\N	\N	0001	g.	Janez	Novak	a	Peter	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5564-4cf5-9850-0af368dac7fb	\N	\N	0002	dr.	Anton	Horvat	b			anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5564-4cf5-c660-c5f51457c64d	\N	\N	0003		Ivan	Kovačič	c			ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5564-4cf5-aa3a-ece7d86bb95e	\N	\N	0004	prof.	Jožef	Krajnc	d		Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5564-4cf5-ee8b-3379b3bf0e41	\N	\N	0005		Marko	Zupančič	e			marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5564-4cf5-fd9d-b6bdce905dfc	\N	\N	0006	ga.	Marija	Kovač	f			marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5564-4cf5-dbed-69b72a196fcf	\N	\N	0007	ga.	Ana	Potočnik	g			ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5564-4cf5-12b9-403f3f5af59a	\N	\N	0008	ga.	Maja	Mlakar	h			maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5564-4cf5-9ce0-c3c6d62d4326	\N	\N	0009		Irena	Kos	i			irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5564-4cf5-38bd-b20791b865ac	\N	\N	0010		Mojca	Vidmar	J			mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5564-4cf5-e114-9857850f4b58	\N	\N	0011		xx	write protected12345	\N			xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2692 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2697 (class 0 OID 5096232)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5564-4cf4-7084-1592bf7f8e53	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5564-4cf4-e8ea-b1ca326c5ff7	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5564-4cf4-c900-470107ff6b15	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5564-4cf4-4325-945945875780	Abonma-read	Abonma - branje	f
00030000-5564-4cf4-4e07-f3a46c978b51	Abonma-write	Abonma - spreminjanje	f
00030000-5564-4cf4-2ac9-586a2934773e	Alternacija-read	Alternacija - branje	f
00030000-5564-4cf4-94e4-af417bc46fcb	Alternacija-write	Alternacija - spreminjanje	f
00030000-5564-4cf4-895a-3e88c3161bd3	Arhivalija-read	Arhivalija - branje	f
00030000-5564-4cf4-01d5-02992febeebb	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5564-4cf4-ea40-05f3d2d4ea28	Besedilo-read	Besedilo - branje	f
00030000-5564-4cf4-50a9-93ec77cc4465	Besedilo-write	Besedilo - spreminjanje	f
00030000-5564-4cf4-804a-cad3ae6dc99c	DogodekIzven-read	DogodekIzven - branje	f
00030000-5564-4cf4-52e8-d684407679d5	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5564-4cf4-9aa5-3021b457afc8	Dogodek-read	Dogodek - branje	f
00030000-5564-4cf4-4506-c7aa8bb6ed79	Dogodek-write	Dogodek - spreminjanje	f
00030000-5564-4cf4-bc09-c7cb1201711e	Drzava-read	Drzava - branje	f
00030000-5564-4cf4-3908-d8883a508041	Drzava-write	Drzava - spreminjanje	f
00030000-5564-4cf4-f1cc-794f6fe0e9f5	Funkcija-read	Funkcija - branje	f
00030000-5564-4cf4-4e0e-f5f6123025c4	Funkcija-write	Funkcija - spreminjanje	f
00030000-5564-4cf4-07e0-6a6f91456051	Gostovanje-read	Gostovanje - branje	f
00030000-5564-4cf4-e9eb-0c7227e4e956	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5564-4cf4-f0f8-d21d196d31d8	Gostujoca-read	Gostujoca - branje	f
00030000-5564-4cf4-8ef2-7988026f475a	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5564-4cf4-d525-4365db89846d	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5564-4cf4-207b-025223d1599d	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5564-4cf4-9c76-f76452ca67cc	Kupec-read	Kupec - branje	f
00030000-5564-4cf4-47c0-f678ee3bebac	Kupec-write	Kupec - spreminjanje	f
00030000-5564-4cf4-4b82-7614aa7731ae	NacinPlacina-read	NacinPlacina - branje	f
00030000-5564-4cf4-9a33-52c9cd231275	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5564-4cf4-c15e-8ed5dbbca948	Option-read	Option - branje	f
00030000-5564-4cf4-dd25-5b19dcc67857	Option-write	Option - spreminjanje	f
00030000-5564-4cf4-99ad-174df0163b7f	OptionValue-read	OptionValue - branje	f
00030000-5564-4cf4-b637-27e5f3c1ee9c	OptionValue-write	OptionValue - spreminjanje	f
00030000-5564-4cf4-9943-cca44a2e5b2d	Oseba-read	Oseba - branje	f
00030000-5564-4cf4-bc0c-4a2296bd4583	Oseba-write	Oseba - spreminjanje	f
00030000-5564-4cf4-ec09-deb454cc882a	Permission-read	Permission - branje	f
00030000-5564-4cf4-a1f1-24384f7ea01e	Permission-write	Permission - spreminjanje	f
00030000-5564-4cf4-35ba-dcd80f3f895f	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5564-4cf4-9903-0936af33686a	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5564-4cf4-d055-884c4fd659a7	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5564-4cf4-96b5-afb1ab2aac37	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5564-4cf4-dbc3-ff6743a03bc4	Pogodba-read	Pogodba - branje	f
00030000-5564-4cf4-8618-9ead90f075f2	Pogodba-write	Pogodba - spreminjanje	f
00030000-5564-4cf4-c5cb-315e604ead5c	Popa-read	Popa - branje	f
00030000-5564-4cf4-2881-6a0e7a1124e5	Popa-write	Popa - spreminjanje	f
00030000-5564-4cf4-6374-a2db02db2f51	Posta-read	Posta - branje	f
00030000-5564-4cf4-7e7b-2c564f54b203	Posta-write	Posta - spreminjanje	f
00030000-5564-4cf4-53f1-5563349cc039	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5564-4cf4-220c-99f543d9d445	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5564-4cf4-82a8-f88d0e02a6fe	PostniNaslov-read	PostniNaslov - branje	f
00030000-5564-4cf4-a022-e78850bd2966	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5564-4cf4-d0e1-61b2d376d0ca	Predstava-read	Predstava - branje	f
00030000-5564-4cf4-c3e8-2f3e23e7a928	Predstava-write	Predstava - spreminjanje	f
00030000-5564-4cf4-edce-57dee58a8c78	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5564-4cf4-3796-348491ea5bb3	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5564-4cf4-1a6d-17666b350332	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5564-4cf4-0c1b-04ba3b363d8f	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5564-4cf4-7bf3-b3f4dc6ebd2a	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5564-4cf4-85cd-ab9514bd4a7b	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5564-4cf4-0258-20e7889b7a4f	Prostor-read	Prostor - branje	f
00030000-5564-4cf4-49cf-5b9f9dd96af1	Prostor-write	Prostor - spreminjanje	f
00030000-5564-4cf4-2986-599968d6a3de	Racun-read	Racun - branje	f
00030000-5564-4cf4-5948-a5e7b2455865	Racun-write	Racun - spreminjanje	f
00030000-5564-4cf4-7ad6-63744b731e76	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5564-4cf4-3e7a-2daa0731847e	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5564-4cf4-318c-920dc985525e	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5564-4cf4-b1a7-c6747a075380	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5564-4cf4-4631-34263ea4e1e9	Rekvizit-read	Rekvizit - branje	f
00030000-5564-4cf4-a2c7-85907628cdff	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5564-4cf4-183b-ed57eea2b5ed	Revizija-read	Revizija - branje	f
00030000-5564-4cf4-c1f9-f53a477f97d8	Revizija-write	Revizija - spreminjanje	f
00030000-5564-4cf4-f782-d51ad073d8ae	Rezervacija-read	Rezervacija - branje	f
00030000-5564-4cf4-5f7a-e51203991d06	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5564-4cf4-66e0-6d6b07e15c21	Role-read	Role - branje	f
00030000-5564-4cf4-144d-d2bbf46cd8c9	Role-write	Role - spreminjanje	f
00030000-5564-4cf4-7eab-c5005e0ecbcf	SedezniRed-read	SedezniRed - branje	f
00030000-5564-4cf4-5208-9fe3d451e5f1	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5564-4cf4-50da-128b56c620c2	Sedez-read	Sedez - branje	f
00030000-5564-4cf4-d0ab-7cec0b8268c6	Sedez-write	Sedez - spreminjanje	f
00030000-5564-4cf4-3356-2f512cc8e08a	Sezona-read	Sezona - branje	f
00030000-5564-4cf4-fe29-53524ddbb92a	Sezona-write	Sezona - spreminjanje	f
00030000-5564-4cf4-5355-9ba2321a2d97	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5564-4cf4-5ed5-428b1c91c038	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5564-4cf4-78e3-9389f01d88dd	Stevilcenje-read	Stevilcenje - branje	f
00030000-5564-4cf4-5ea6-46769ea01dbd	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5564-4cf4-7427-df72417055b2	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5564-4cf4-3339-4d9352d2f118	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5564-4cf4-f738-504b523b1613	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5564-4cf4-4833-4c367783a0b0	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5564-4cf4-1641-9a660de2b904	Telefonska-read	Telefonska - branje	f
00030000-5564-4cf4-f370-2c7d2ab842a1	Telefonska-write	Telefonska - spreminjanje	f
00030000-5564-4cf4-4239-b5ccf784e6ce	TerminStoritve-read	TerminStoritve - branje	f
00030000-5564-4cf4-84e8-628922c93111	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5564-4cf4-0e52-9ece1928879e	TipFunkcije-read	TipFunkcije - branje	f
00030000-5564-4cf4-ba4c-114f37b70a04	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5564-4cf4-1087-77389a3dbfd8	Trr-read	Trr - branje	f
00030000-5564-4cf4-752e-95eb0999137d	Trr-write	Trr - spreminjanje	f
00030000-5564-4cf4-ee46-f6a8686481e9	Uprizoritev-read	Uprizoritev - branje	f
00030000-5564-4cf4-7402-efaa8f1110e2	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5564-4cf4-31c1-22c2b5b97eda	User-read	User - branje	f
00030000-5564-4cf4-5037-b12104e4a527	User-write	User - spreminjanje	f
00030000-5564-4cf4-7f15-b2bb79d58f78	Vaja-read	Vaja - branje	f
00030000-5564-4cf4-273b-c2b9bbd010ce	Vaja-write	Vaja - spreminjanje	f
00030000-5564-4cf4-4236-d3fbc7084e15	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5564-4cf4-e10c-43e58b7ade7c	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5564-4cf4-d8ff-f8ae3ef2adab	Zaposlitev-read	Zaposlitev - branje	f
00030000-5564-4cf4-b166-322dfa70fbf9	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5564-4cf4-516f-5977e8324058	Zasedenost-read	Zasedenost - branje	f
00030000-5564-4cf4-2f3c-7ab5059cbd89	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5564-4cf4-e50a-76ac4d6020f8	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5564-4cf4-9202-7e88a9026c33	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5564-4cf4-5c9b-9c5b290511ac	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5564-4cf4-4efb-13771683b0df	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2699 (class 0 OID 5096251)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5564-4cf4-65ef-d6462c751a98	00030000-5564-4cf4-bc09-c7cb1201711e
00020000-5564-4cf4-a23b-cd1d01f83b30	00030000-5564-4cf4-3908-d8883a508041
00020000-5564-4cf4-a23b-cd1d01f83b30	00030000-5564-4cf4-bc09-c7cb1201711e
\.


--
-- TOC entry 2727 (class 0 OID 5096541)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2731 (class 0 OID 5096572)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2743 (class 0 OID 5096705)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2704 (class 0 OID 5096310)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5564-4cf5-575b-c2f9e099538a	00040000-5564-4cf4-7dca-22f74463a757	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5564-4cf5-f2a2-fde6990f237f	00040000-5564-4cf4-7dca-22f74463a757	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2706 (class 0 OID 5096345)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5564-4cf3-1a91-77018530ab84	8341	Adlešiči
00050000-5564-4cf3-6cfe-ac4267c47764	5270	Ajdovščina
00050000-5564-4cf3-0988-b19723296774	6280	Ankaran/Ancarano
00050000-5564-4cf3-28e1-cddfca7ae8cb	9253	Apače
00050000-5564-4cf3-bd97-a80994bac147	8253	Artiče
00050000-5564-4cf3-3256-cb6e45fd6005	4275	Begunje na Gorenjskem
00050000-5564-4cf3-e3cc-694823835b5f	1382	Begunje pri Cerknici
00050000-5564-4cf3-b323-4da2644edb11	9231	Beltinci
00050000-5564-4cf3-245c-67ec743dd1bb	2234	Benedikt
00050000-5564-4cf3-ef3b-790ae7dba7e1	2345	Bistrica ob Dravi
00050000-5564-4cf3-5b03-b55bb15ee51e	3256	Bistrica ob Sotli
00050000-5564-4cf3-8b0f-58bd6288eb02	8259	Bizeljsko
00050000-5564-4cf3-ec67-0fc521d9fa8e	1223	Blagovica
00050000-5564-4cf3-9537-888ad8aae20b	8283	Blanca
00050000-5564-4cf3-fdf0-32d6677065e0	4260	Bled
00050000-5564-4cf3-a555-8cce04b9383c	4273	Blejska Dobrava
00050000-5564-4cf4-c794-14e800b814f3	9265	Bodonci
00050000-5564-4cf4-ef61-8accd8ecb0ed	9222	Bogojina
00050000-5564-4cf4-3460-891f980917d9	4263	Bohinjska Bela
00050000-5564-4cf4-d0dc-650b91402ea5	4264	Bohinjska Bistrica
00050000-5564-4cf4-0765-b6f60654ae40	4265	Bohinjsko jezero
00050000-5564-4cf4-d8b5-f926ef85c325	1353	Borovnica
00050000-5564-4cf4-9174-53143ab55529	8294	Boštanj
00050000-5564-4cf4-d114-71606c18122c	5230	Bovec
00050000-5564-4cf4-378e-5613c1e4ee36	5295	Branik
00050000-5564-4cf4-7090-5535db64debd	3314	Braslovče
00050000-5564-4cf4-20d7-4ef9615f78f9	5223	Breginj
00050000-5564-4cf4-a079-4e42ef55f8f9	8280	Brestanica
00050000-5564-4cf4-4e52-93b0723e03e1	2354	Bresternica
00050000-5564-4cf4-ab25-a7a1ac36d4d0	4243	Brezje
00050000-5564-4cf4-1d96-5e060c8525cc	1351	Brezovica pri Ljubljani
00050000-5564-4cf4-0169-e3a94d3e99ed	8250	Brežice
00050000-5564-4cf4-2a51-d0ec62377288	4210	Brnik - Aerodrom
00050000-5564-4cf4-1c2c-b654d0d7e136	8321	Brusnice
00050000-5564-4cf4-1c03-d7b5481fa0a3	3255	Buče
00050000-5564-4cf4-c635-4e5ab6678783	8276	Bučka 
00050000-5564-4cf4-6906-fae521425592	9261	Cankova
00050000-5564-4cf4-9d3e-06b81fba18ed	3000	Celje 
00050000-5564-4cf4-9740-07555575c58d	3001	Celje - poštni predali
00050000-5564-4cf4-4392-e2a4a7cf9947	4207	Cerklje na Gorenjskem
00050000-5564-4cf4-5836-72c2b3c0bf75	8263	Cerklje ob Krki
00050000-5564-4cf4-73ae-0375e216728f	1380	Cerknica
00050000-5564-4cf4-31f2-7a6d8c57ce15	5282	Cerkno
00050000-5564-4cf4-1e23-54577fff6bea	2236	Cerkvenjak
00050000-5564-4cf4-5a15-84e62e267a77	2215	Ceršak
00050000-5564-4cf4-9806-351fa30ff769	2326	Cirkovce
00050000-5564-4cf4-a62d-e1328ea28458	2282	Cirkulane
00050000-5564-4cf4-960e-ff5b579794dd	5273	Col
00050000-5564-4cf4-03b5-9067c763ff73	8251	Čatež ob Savi
00050000-5564-4cf4-49cd-fff2824e5dd5	1413	Čemšenik
00050000-5564-4cf4-29fd-cbd7616ebb32	5253	Čepovan
00050000-5564-4cf4-33e5-b84b103b27fc	9232	Črenšovci
00050000-5564-4cf4-4eb3-31de28a1b45a	2393	Črna na Koroškem
00050000-5564-4cf4-bb1a-df3167e7c5a7	6275	Črni Kal
00050000-5564-4cf4-07de-c8ff3489044c	5274	Črni Vrh nad Idrijo
00050000-5564-4cf4-ed64-ea39578da593	5262	Črniče
00050000-5564-4cf4-fe24-eafb51b00597	8340	Črnomelj
00050000-5564-4cf4-9eb6-cf4dd5aa343f	6271	Dekani
00050000-5564-4cf4-b3f4-3590f4e67fee	5210	Deskle
00050000-5564-4cf4-e377-1b63dabbadd2	2253	Destrnik
00050000-5564-4cf4-2296-e647b844f553	6215	Divača
00050000-5564-4cf4-1c32-1f7a2a5bc0d4	1233	Dob
00050000-5564-4cf4-fe4c-767528cd727c	3224	Dobje pri Planini
00050000-5564-4cf4-bd07-7bb41dfd1bb6	8257	Dobova
00050000-5564-4cf4-6e13-bf6730d767da	1423	Dobovec
00050000-5564-4cf4-aedb-df86150a15ca	5263	Dobravlje
00050000-5564-4cf4-1648-b315519782f9	3204	Dobrna
00050000-5564-4cf4-333d-779121c8d0d9	8211	Dobrnič
00050000-5564-4cf4-51a2-4e00965360db	1356	Dobrova
00050000-5564-4cf4-a70f-9866fd946251	9223	Dobrovnik/Dobronak 
00050000-5564-4cf4-4800-7772afcf43f9	5212	Dobrovo v Brdih
00050000-5564-4cf4-7bf0-0bdc8185f931	1431	Dol pri Hrastniku
00050000-5564-4cf4-75e4-9211ec12a4c4	1262	Dol pri Ljubljani
00050000-5564-4cf4-e8d1-e118beffd50f	1273	Dole pri Litiji
00050000-5564-4cf4-270f-c9c535a28245	1331	Dolenja vas
00050000-5564-4cf4-a8c7-6ef22e4cbe33	8350	Dolenjske Toplice
00050000-5564-4cf4-781f-1c6175a1aa50	1230	Domžale
00050000-5564-4cf4-92f1-5c04c144e4c0	2252	Dornava
00050000-5564-4cf4-b0fc-5d7c0621536c	5294	Dornberk
00050000-5564-4cf4-588a-af9b0ff082aa	1319	Draga
00050000-5564-4cf4-9598-4d8561c0badc	8343	Dragatuš
00050000-5564-4cf4-dc17-74580615614b	3222	Dramlje
00050000-5564-4cf4-56b4-2d75bf849b86	2370	Dravograd
00050000-5564-4cf4-423a-dc71682bc105	4203	Duplje
00050000-5564-4cf4-a018-f3922f66ddbd	6221	Dutovlje
00050000-5564-4cf4-cc05-5d4c11a3995b	8361	Dvor
00050000-5564-4cf4-195c-4426f5ae5353	2343	Fala
00050000-5564-4cf4-d4c0-e2b80ab2c16a	9208	Fokovci
00050000-5564-4cf4-df4a-2c7f5e742224	2313	Fram
00050000-5564-4cf4-4565-da81402b6f72	3213	Frankolovo
00050000-5564-4cf4-25a4-236ea04e085e	1274	Gabrovka
00050000-5564-4cf4-7004-d13904f9db93	8254	Globoko
00050000-5564-4cf4-93ce-772d146dd9c4	5275	Godovič
00050000-5564-4cf4-76fd-c2f96e4a7b1f	4204	Golnik
00050000-5564-4cf4-00b6-976c961b83c2	3303	Gomilsko
00050000-5564-4cf4-21b8-57c5cb19538c	4224	Gorenja vas
00050000-5564-4cf4-7c39-26a42ce233fc	3263	Gorica pri Slivnici
00050000-5564-4cf4-279b-f7ef9e29c7e2	2272	Gorišnica
00050000-5564-4cf4-ab3d-dea3d6552a44	9250	Gornja Radgona
00050000-5564-4cf4-da1e-bed083a89471	3342	Gornji Grad
00050000-5564-4cf4-4428-6a1decedaf34	4282	Gozd Martuljek
00050000-5564-4cf4-d23d-6d5f8f82f2d1	6272	Gračišče
00050000-5564-4cf4-8342-b929f8117af5	9264	Grad
00050000-5564-4cf4-ac6b-05b66069afad	8332	Gradac
00050000-5564-4cf4-85c7-09ac609dfa00	1384	Grahovo
00050000-5564-4cf4-e099-d11370141bb1	5242	Grahovo ob Bači
00050000-5564-4cf4-6d1d-9a2783b389ac	5251	Grgar
00050000-5564-4cf4-0295-3020076e452d	3302	Griže
00050000-5564-4cf4-1f8c-b857fc707f0e	3231	Grobelno
00050000-5564-4cf4-d537-f8507436fc06	1290	Grosuplje
00050000-5564-4cf4-a9a7-02bd5a539f76	2288	Hajdina
00050000-5564-4cf4-ec92-d0f5370753d9	8362	Hinje
00050000-5564-4cf4-7587-1e33858d008b	2311	Hoče
00050000-5564-4cf4-2717-f71660b18703	9205	Hodoš/Hodos
00050000-5564-4cf4-e79f-38dcfe9ce1f1	1354	Horjul
00050000-5564-4cf4-dff7-353eb1baa3fe	1372	Hotedršica
00050000-5564-4cf4-56b9-06d259f464ad	1430	Hrastnik
00050000-5564-4cf4-5949-d7fa42bb2ad7	6225	Hruševje
00050000-5564-4cf4-4253-e426195c6e46	4276	Hrušica
00050000-5564-4cf4-6162-5e732f5bff94	5280	Idrija
00050000-5564-4cf4-02ac-cfc048771f45	1292	Ig
00050000-5564-4cf4-55d8-92338730a115	6250	Ilirska Bistrica
00050000-5564-4cf4-dc13-c4e90c085dfc	6251	Ilirska Bistrica-Trnovo
00050000-5564-4cf4-4468-6cc82e0d2eac	1295	Ivančna Gorica
00050000-5564-4cf4-2a42-cd667a9cf0b5	2259	Ivanjkovci
00050000-5564-4cf4-8026-1f4085e05e9e	1411	Izlake
00050000-5564-4cf4-6fa1-9074b2bc989b	6310	Izola/Isola
00050000-5564-4cf4-4ae5-868d2efb5925	2222	Jakobski Dol
00050000-5564-4cf4-5b82-6767c5996fc7	2221	Jarenina
00050000-5564-4cf4-321b-41e59abc8daf	6254	Jelšane
00050000-5564-4cf4-ed0a-4dfcc5b4b35d	4270	Jesenice
00050000-5564-4cf4-ab5d-3bf09f524d3a	8261	Jesenice na Dolenjskem
00050000-5564-4cf4-2cb6-7048a7240336	3273	Jurklošter
00050000-5564-4cf4-489b-a3004ac8018f	2223	Jurovski Dol
00050000-5564-4cf4-c219-eb66cd9b2e0b	2256	Juršinci
00050000-5564-4cf4-42d9-eb304da5d565	5214	Kal nad Kanalom
00050000-5564-4cf4-9ac5-cd7309d21520	3233	Kalobje
00050000-5564-4cf4-e056-a8be55396598	4246	Kamna Gorica
00050000-5564-4cf4-f77f-4f361e6ccc0a	2351	Kamnica
00050000-5564-4cf4-3e56-cfba3f37bebe	1241	Kamnik
00050000-5564-4cf4-5e7d-c2477f2bac12	5213	Kanal
00050000-5564-4cf4-9569-12d0279df03b	8258	Kapele
00050000-5564-4cf4-0fad-841fb5e6bfce	2362	Kapla
00050000-5564-4cf4-f92c-1efba3b820eb	2325	Kidričevo
00050000-5564-4cf4-4a6d-20ceb737f696	1412	Kisovec
00050000-5564-4cf4-20a8-d45731c4eb27	6253	Knežak
00050000-5564-4cf4-6c86-547e6b9f7d37	5222	Kobarid
00050000-5564-4cf4-8f76-714bf22a3f71	9227	Kobilje
00050000-5564-4cf4-4b5a-a27263f3de9a	1330	Kočevje
00050000-5564-4cf4-39c5-b12db074caf8	1338	Kočevska Reka
00050000-5564-4cf4-ce09-afb7b4084cf4	2276	Kog
00050000-5564-4cf4-5071-0e2e524de560	5211	Kojsko
00050000-5564-4cf4-a800-df9e28f62902	6223	Komen
00050000-5564-4cf4-6d92-e756dc58b859	1218	Komenda
00050000-5564-4cf4-be10-793d8de86e7e	6000	Koper/Capodistria 
00050000-5564-4cf4-f424-c0b76121d016	6001	Koper/Capodistria - poštni predali
00050000-5564-4cf4-bf2c-ff50498eeacc	8282	Koprivnica
00050000-5564-4cf4-af92-40e561b0accd	5296	Kostanjevica na Krasu
00050000-5564-4cf4-3516-ba31d9af71d3	8311	Kostanjevica na Krki
00050000-5564-4cf4-98d1-1eba42bb1c6d	1336	Kostel
00050000-5564-4cf4-6b1d-e45cdb3e91c1	6256	Košana
00050000-5564-4cf4-618a-6ba4be44b940	2394	Kotlje
00050000-5564-4cf4-5e8e-46d66a335afb	6240	Kozina
00050000-5564-4cf4-2d56-6cbaee983b94	3260	Kozje
00050000-5564-4cf4-cf4f-32d33a67fd57	4000	Kranj 
00050000-5564-4cf4-e698-2169643a9596	4001	Kranj - poštni predali
00050000-5564-4cf4-7b00-1bfe82f33ca2	4280	Kranjska Gora
00050000-5564-4cf4-8c32-23856b6dc511	1281	Kresnice
00050000-5564-4cf4-8284-b6c4b22d90b1	4294	Križe
00050000-5564-4cf4-9b17-22692b6ea7bd	9206	Križevci
00050000-5564-4cf4-e4e2-28ba795c2f0f	9242	Križevci pri Ljutomeru
00050000-5564-4cf4-de39-e11bacf5c62b	1301	Krka
00050000-5564-4cf4-5d56-f4f8b2cbbd08	8296	Krmelj
00050000-5564-4cf4-fe66-985a2e15d368	4245	Kropa
00050000-5564-4cf4-a3ba-877300d48da8	8262	Krška vas
00050000-5564-4cf4-3a1e-aef78b194be3	8270	Krško
00050000-5564-4cf4-7d08-e3a49c6eb2a3	9263	Kuzma
00050000-5564-4cf4-782f-ac8835ebfe06	2318	Laporje
00050000-5564-4cf4-3327-935f2d0b2018	3270	Laško
00050000-5564-4cf4-26d7-aa2844e3b7d6	1219	Laze v Tuhinju
00050000-5564-4cf4-4fda-5dd60575c18a	2230	Lenart v Slovenskih goricah
00050000-5564-4cf4-ef10-68d13401bd81	9220	Lendava/Lendva
00050000-5564-4cf4-1e44-6c5efa3607e3	4248	Lesce
00050000-5564-4cf4-2346-eb1cbe52096a	3261	Lesično
00050000-5564-4cf4-f4e4-143c2c213047	8273	Leskovec pri Krškem
00050000-5564-4cf4-2b77-29a267ab00d6	2372	Libeliče
00050000-5564-4cf4-491c-362f8600ccd9	2341	Limbuš
00050000-5564-4cf4-a054-f4c813f7e55f	1270	Litija
00050000-5564-4cf4-31c8-c84ebc1c47c9	3202	Ljubečna
00050000-5564-4cf4-dc9d-0fb8233fff23	1000	Ljubljana 
00050000-5564-4cf4-3ffb-108e0d874e46	1001	Ljubljana - poštni predali
00050000-5564-4cf4-03d9-7f8e55130f45	1231	Ljubljana - Črnuče
00050000-5564-4cf4-f4a2-fad9bacf4479	1261	Ljubljana - Dobrunje
00050000-5564-4cf4-99b7-75257753a0d4	1260	Ljubljana - Polje
00050000-5564-4cf4-7651-7b4e668d46cd	1210	Ljubljana - Šentvid
00050000-5564-4cf4-5fca-2486b9496139	1211	Ljubljana - Šmartno
00050000-5564-4cf4-5ad0-ec7c4b3e83a1	3333	Ljubno ob Savinji
00050000-5564-4cf4-62db-65244c83cfef	9240	Ljutomer
00050000-5564-4cf4-efe4-f44b80611aac	3215	Loče
00050000-5564-4cf4-90cf-355a87f66355	5231	Log pod Mangartom
00050000-5564-4cf4-a9c2-ad37519e1618	1358	Log pri Brezovici
00050000-5564-4cf4-0735-63feb05bcded	1370	Logatec
00050000-5564-4cf4-3393-830d654fe93f	1371	Logatec
00050000-5564-4cf4-fc6a-7e34c07f319c	1434	Loka pri Zidanem Mostu
00050000-5564-4cf4-7ae7-26d930dabcdd	3223	Loka pri Žusmu
00050000-5564-4cf4-2b73-f391a87a9d62	6219	Lokev
00050000-5564-4cf4-6a4f-38ae47643005	1318	Loški Potok
00050000-5564-4cf4-1c87-b33d895cb92d	2324	Lovrenc na Dravskem polju
00050000-5564-4cf4-8fbe-fa3bd02c6933	2344	Lovrenc na Pohorju
00050000-5564-4cf4-710c-62bacf08fc74	3334	Luče
00050000-5564-4cf4-f230-954981c7b82a	1225	Lukovica
00050000-5564-4cf4-c296-724fac1c95fb	9202	Mačkovci
00050000-5564-4cf4-0e29-ea6204146b1c	2322	Majšperk
00050000-5564-4cf4-d227-7b8282cf544e	2321	Makole
00050000-5564-4cf4-e499-5160b6df6c83	9243	Mala Nedelja
00050000-5564-4cf4-7bce-7d8f42dfa260	2229	Malečnik
00050000-5564-4cf4-097f-c28dc1efaa95	6273	Marezige
00050000-5564-4cf4-a0f0-7d30599645b6	2000	Maribor 
00050000-5564-4cf4-b544-e67b95a46b88	2001	Maribor - poštni predali
00050000-5564-4cf4-4fd3-94594fd69142	2206	Marjeta na Dravskem polju
00050000-5564-4cf4-10e0-dd9224db542c	2281	Markovci
00050000-5564-4cf4-6dd4-aa5c0bdc7dbe	9221	Martjanci
00050000-5564-4cf4-4fcc-9966b2bd02aa	6242	Materija
00050000-5564-4cf4-4d7a-1f3318ad71fc	4211	Mavčiče
00050000-5564-4cf4-a066-e364fbc9abad	1215	Medvode
00050000-5564-4cf4-da16-4793cd32cb56	1234	Mengeš
00050000-5564-4cf4-8a4e-1cde077b28d4	8330	Metlika
00050000-5564-4cf4-3296-471fcc666120	2392	Mežica
00050000-5564-4cf4-a472-afc9cc6bfa2f	2204	Miklavž na Dravskem polju
00050000-5564-4cf4-5152-af4700d67abf	2275	Miklavž pri Ormožu
00050000-5564-4cf4-d9d8-2df5626dc7b9	5291	Miren
00050000-5564-4cf4-719d-5ab3d7ba94cd	8233	Mirna
00050000-5564-4cf4-4663-e3e2e080a25d	8216	Mirna Peč
00050000-5564-4cf4-246e-6e4be64fa921	2382	Mislinja
00050000-5564-4cf4-8ef2-b1f6f6cb9c3b	4281	Mojstrana
00050000-5564-4cf4-8cfb-4d6786bf4ee6	8230	Mokronog
00050000-5564-4cf4-b04c-55907538332e	1251	Moravče
00050000-5564-4cf4-5235-9bb93c409e6e	9226	Moravske Toplice
00050000-5564-4cf4-c44c-2b1ed4641835	5216	Most na Soči
00050000-5564-4cf4-d22b-ef8d82a4c52e	1221	Motnik
00050000-5564-4cf4-38c4-e7fc247a4890	3330	Mozirje
00050000-5564-4cf4-3fee-29c05e117169	9000	Murska Sobota 
00050000-5564-4cf4-2479-80fa509bb65f	9001	Murska Sobota - poštni predali
00050000-5564-4cf4-acfc-fa288bd712c8	2366	Muta
00050000-5564-4cf4-e385-e616ec44f5cb	4202	Naklo
00050000-5564-4cf4-919d-0dd06d3f4e0a	3331	Nazarje
00050000-5564-4cf4-a4e4-fb48361b84f4	1357	Notranje Gorice
00050000-5564-4cf4-d4cd-9fdaf84e4cf7	3203	Nova Cerkev
00050000-5564-4cf4-a9e4-a90a67124413	5000	Nova Gorica 
00050000-5564-4cf4-2678-771bb3942703	5001	Nova Gorica - poštni predali
00050000-5564-4cf4-b96f-2b390396b61e	1385	Nova vas
00050000-5564-4cf4-c61b-2e6470951d45	8000	Novo mesto
00050000-5564-4cf4-772a-6c93e69c8473	8001	Novo mesto - poštni predali
00050000-5564-4cf4-ca3b-797a50c30781	6243	Obrov
00050000-5564-4cf4-bf7d-fad5c9950e9f	9233	Odranci
00050000-5564-4cf4-5250-fb8ec905f4c5	2317	Oplotnica
00050000-5564-4cf4-d8bc-6158f64e93b9	2312	Orehova vas
00050000-5564-4cf4-97d4-f8e732bb1b5e	2270	Ormož
00050000-5564-4cf4-d457-60c620c45937	1316	Ortnek
00050000-5564-4cf4-fb6a-41969f4a7186	1337	Osilnica
00050000-5564-4cf4-bcfa-07204d00fb2b	8222	Otočec
00050000-5564-4cf4-5561-b142815131b6	2361	Ožbalt
00050000-5564-4cf4-543a-0f220bd1af0c	2231	Pernica
00050000-5564-4cf4-926c-b463c1941927	2211	Pesnica pri Mariboru
00050000-5564-4cf4-a66e-a400c78aba23	9203	Petrovci
00050000-5564-4cf4-13a5-ab3c55e17255	3301	Petrovče
00050000-5564-4cf4-fd18-7b69895197de	6330	Piran/Pirano
00050000-5564-4cf4-541b-898828b2212d	8255	Pišece
00050000-5564-4cf4-5da2-f4f3f4ee50d5	6257	Pivka
00050000-5564-4cf4-bbc2-983ae6443036	6232	Planina
00050000-5564-4cf4-5698-9a187815a760	3225	Planina pri Sevnici
00050000-5564-4cf4-8161-f3734103d1a4	6276	Pobegi
00050000-5564-4cf4-0d91-0b1e41816934	8312	Podbočje
00050000-5564-4cf4-4cfb-9ac2f710c586	5243	Podbrdo
00050000-5564-4cf4-f23c-8c3c64d4780a	3254	Podčetrtek
00050000-5564-4cf4-e776-ea285f681116	2273	Podgorci
00050000-5564-4cf4-4e09-765aa1046757	6216	Podgorje
00050000-5564-4cf4-d5f8-f4a3a1058a2c	2381	Podgorje pri Slovenj Gradcu
00050000-5564-4cf4-0ef8-82ed7d5abb38	6244	Podgrad
00050000-5564-4cf4-27d1-f27bb5e52375	1414	Podkum
00050000-5564-4cf4-8d4b-321e87b4d691	2286	Podlehnik
00050000-5564-4cf4-7361-d49fc0bbd563	5272	Podnanos
00050000-5564-4cf4-5585-123155c2fbe3	4244	Podnart
00050000-5564-4cf4-4ba9-365348ac191a	3241	Podplat
00050000-5564-4cf4-c5ed-e26376cbe8cb	3257	Podsreda
00050000-5564-4cf4-ffe9-e557fa385f38	2363	Podvelka
00050000-5564-4cf4-103f-eeeeadf1ed97	2208	Pohorje
00050000-5564-4cf4-05ba-e15b7d021b8f	2257	Polenšak
00050000-5564-4cf4-f151-84b1e15dbc83	1355	Polhov Gradec
00050000-5564-4cf4-bfed-b19713370fc4	4223	Poljane nad Škofjo Loko
00050000-5564-4cf4-e33e-b978c52fa242	2319	Poljčane
00050000-5564-4cf4-1fc8-20183d99818d	1272	Polšnik
00050000-5564-4cf4-4543-21a5248a2025	3313	Polzela
00050000-5564-4cf4-3913-8b7671721e54	3232	Ponikva
00050000-5564-4cf4-a296-8bcb322b6c97	6320	Portorož/Portorose
00050000-5564-4cf4-c6aa-272b1848ad8e	6230	Postojna
00050000-5564-4cf4-74fe-476bcb5d222b	2331	Pragersko
00050000-5564-4cf4-465a-69475c11555a	3312	Prebold
00050000-5564-4cf4-afe2-2b19e70f6065	4205	Preddvor
00050000-5564-4cf4-343b-00fad87988c1	6255	Prem
00050000-5564-4cf4-e0ab-06bc4cba8bcd	1352	Preserje
00050000-5564-4cf4-be93-7496b09c3a66	6258	Prestranek
00050000-5564-4cf4-f708-70f5a09ffed1	2391	Prevalje
00050000-5564-4cf4-853a-199c89e35cde	3262	Prevorje
00050000-5564-4cf4-3ae4-d1739f3fdf1b	1276	Primskovo 
00050000-5564-4cf4-6601-9bb554161ce2	3253	Pristava pri Mestinju
00050000-5564-4cf4-e2b1-6b041f40703d	9207	Prosenjakovci/Partosfalva
00050000-5564-4cf4-2b39-b8ccbe71d8c1	5297	Prvačina
00050000-5564-4cf4-0f98-d23a03d0f275	2250	Ptuj
00050000-5564-4cf4-125b-0c73a6cc03e4	2323	Ptujska Gora
00050000-5564-4cf4-601f-5b5e4e621d50	9201	Puconci
00050000-5564-4cf4-e62b-2611bfefb21a	2327	Rače
00050000-5564-4cf4-9b1b-170b89e3fb1d	1433	Radeče
00050000-5564-4cf4-ba90-f5a7be8491b0	9252	Radenci
00050000-5564-4cf4-c605-d2c6a542a334	2360	Radlje ob Dravi
00050000-5564-4cf4-9198-91ebc76d8259	1235	Radomlje
00050000-5564-4cf4-722c-d58683e25a72	4240	Radovljica
00050000-5564-4cf4-5450-a603e5e0487e	8274	Raka
00050000-5564-4cf4-6abb-a327ca20e430	1381	Rakek
00050000-5564-4cf4-063d-ec89e8b4d583	4283	Rateče - Planica
00050000-5564-4cf4-5c82-7742502f5301	2390	Ravne na Koroškem
00050000-5564-4cf4-2fe6-9df4eb31ce41	9246	Razkrižje
00050000-5564-4cf4-194d-90b9ebb040d6	3332	Rečica ob Savinji
00050000-5564-4cf4-d1a6-c6f9295f80ce	5292	Renče
00050000-5564-4cf4-dc49-e40ddccd2268	1310	Ribnica
00050000-5564-4cf4-3c3c-9f9a7d7441c0	2364	Ribnica na Pohorju
00050000-5564-4cf4-8129-cba93d49ea41	3272	Rimske Toplice
00050000-5564-4cf4-9f14-da4c34dcc16e	1314	Rob
00050000-5564-4cf4-e371-f8caec7a5f8f	5215	Ročinj
00050000-5564-4cf4-90df-7b6776b8cbd9	3250	Rogaška Slatina
00050000-5564-4cf4-d64b-62aef539c3ff	9262	Rogašovci
00050000-5564-4cf4-7f32-b7cc444df3a1	3252	Rogatec
00050000-5564-4cf4-936a-d226f603b5c0	1373	Rovte
00050000-5564-4cf4-8fca-d62ea38be647	2342	Ruše
00050000-5564-4cf4-f78d-fdf389de579f	1282	Sava
00050000-5564-4cf4-5bc4-3df2200ac25f	6333	Sečovlje/Sicciole
00050000-5564-4cf4-969e-4372b55f4dd2	4227	Selca
00050000-5564-4cf4-0f8b-04da7d8ceeda	2352	Selnica ob Dravi
00050000-5564-4cf4-a32a-9c3b9d824886	8333	Semič
00050000-5564-4cf4-0cec-9219123242c4	8281	Senovo
00050000-5564-4cf4-e32b-43ae8914f241	6224	Senožeče
00050000-5564-4cf4-2f12-a72a4c637e25	8290	Sevnica
00050000-5564-4cf4-611b-f7067ac8328f	6210	Sežana
00050000-5564-4cf4-2519-33c4b3fc4e78	2214	Sladki Vrh
00050000-5564-4cf4-d9e2-f916d4735656	5283	Slap ob Idrijci
00050000-5564-4cf4-a8a2-ac4265e6dade	2380	Slovenj Gradec
00050000-5564-4cf4-9680-d64c02ad2b8c	2310	Slovenska Bistrica
00050000-5564-4cf4-b213-50ddf7955bd1	3210	Slovenske Konjice
00050000-5564-4cf4-2730-034fedba70d2	1216	Smlednik
00050000-5564-4cf4-65be-61146f1c41b6	5232	Soča
00050000-5564-4cf4-1f81-928688485ead	1317	Sodražica
00050000-5564-4cf4-2a3f-34770522f317	3335	Solčava
00050000-5564-4cf4-c05f-c5f77ee2fe4f	5250	Solkan
00050000-5564-4cf4-6552-92f0b32b2d5c	4229	Sorica
00050000-5564-4cf4-46d8-e12374150c4d	4225	Sovodenj
00050000-5564-4cf4-bde8-e88bf03a9fa5	5281	Spodnja Idrija
00050000-5564-4cf4-38dd-1525b7a14420	2241	Spodnji Duplek
00050000-5564-4cf4-16ff-f94ee4dc51cc	9245	Spodnji Ivanjci
00050000-5564-4cf4-1192-dfdb1bcc6e24	2277	Središče ob Dravi
00050000-5564-4cf4-1e1c-b4b168981470	4267	Srednja vas v Bohinju
00050000-5564-4cf4-6b85-4b720c51c250	8256	Sromlje 
00050000-5564-4cf4-c5de-fb3c17cf3178	5224	Srpenica
00050000-5564-4cf4-046c-a5c2999d5206	1242	Stahovica
00050000-5564-4cf4-a962-51f1f7770252	1332	Stara Cerkev
00050000-5564-4cf4-4422-c72fe3078399	8342	Stari trg ob Kolpi
00050000-5564-4cf4-6cf8-621e44494220	1386	Stari trg pri Ložu
00050000-5564-4cf4-3cd4-e7d6db49229a	2205	Starše
00050000-5564-4cf4-0748-cec6aba5fce1	2289	Stoperce
00050000-5564-4cf4-e918-a3c6bde90a26	8322	Stopiče
00050000-5564-4cf4-eee2-f88d0b6af30b	3206	Stranice
00050000-5564-4cf4-3f6c-297016cedbc6	8351	Straža
00050000-5564-4cf4-77bf-ef870e108c06	1313	Struge
00050000-5564-4cf4-45d3-84f23eed3a4b	8293	Studenec
00050000-5564-4cf4-57c4-18dd557ea82c	8331	Suhor
00050000-5564-4cf4-7bdc-07a4373a3e4c	2233	Sv. Ana v Slovenskih goricah
00050000-5564-4cf4-c5b4-3012868bf0e5	2235	Sv. Trojica v Slovenskih goricah
00050000-5564-4cf4-cb64-a8148cae44e8	2353	Sveti Duh na Ostrem Vrhu
00050000-5564-4cf4-9112-373511e11190	9244	Sveti Jurij ob Ščavnici
00050000-5564-4cf4-82c8-755da4f9efce	3264	Sveti Štefan
00050000-5564-4cf4-5010-5616aef74014	2258	Sveti Tomaž
00050000-5564-4cf4-3e3f-0643389d8730	9204	Šalovci
00050000-5564-4cf4-34d5-e77c994d2668	5261	Šempas
00050000-5564-4cf4-7a0f-e8873e1a5040	5290	Šempeter pri Gorici
00050000-5564-4cf4-4efb-d607d72894e4	3311	Šempeter v Savinjski dolini
00050000-5564-4cf4-3232-e65c3b255c36	4208	Šenčur
00050000-5564-4cf4-f889-70c26b28f977	2212	Šentilj v Slovenskih goricah
00050000-5564-4cf4-baea-a26b0e0e00e0	8297	Šentjanž
00050000-5564-4cf4-acd5-5c2ed7c62e33	2373	Šentjanž pri Dravogradu
00050000-5564-4cf4-27c5-0c7c723f079f	8310	Šentjernej
00050000-5564-4cf4-d277-cd1dac3cbc00	3230	Šentjur
00050000-5564-4cf4-7bf4-237e25d90d6e	3271	Šentrupert
00050000-5564-4cf4-23c4-06fb2a785080	8232	Šentrupert
00050000-5564-4cf4-83d5-db86b9687a98	1296	Šentvid pri Stični
00050000-5564-4cf4-c7cd-f209b9eab487	8275	Škocjan
00050000-5564-4cf4-0f16-379b36840e68	6281	Škofije
00050000-5564-4cf4-1bf2-46e0e03c5a75	4220	Škofja Loka
00050000-5564-4cf4-6112-0b21ef006691	3211	Škofja vas
00050000-5564-4cf4-62b3-9347712a6704	1291	Škofljica
00050000-5564-4cf4-c0f5-755de41b481a	6274	Šmarje
00050000-5564-4cf4-dcbb-41ccf1f8b589	1293	Šmarje - Sap
00050000-5564-4cf4-2026-c1d774314332	3240	Šmarje pri Jelšah
00050000-5564-4cf4-95b7-2343cdf166c8	8220	Šmarješke Toplice
00050000-5564-4cf4-a998-590f1eb6fa0e	2315	Šmartno na Pohorju
00050000-5564-4cf4-8473-3393bdcb35b0	3341	Šmartno ob Dreti
00050000-5564-4cf4-d16d-75e3b58aedef	3327	Šmartno ob Paki
00050000-5564-4cf4-aca4-f92a50c2ebf8	1275	Šmartno pri Litiji
00050000-5564-4cf4-da30-5c7f353da3ed	2383	Šmartno pri Slovenj Gradcu
00050000-5564-4cf4-a6f8-372287476f7e	3201	Šmartno v Rožni dolini
00050000-5564-4cf4-939f-3a2d982a16be	3325	Šoštanj
00050000-5564-4cf4-2f45-6a41e5a7400f	6222	Štanjel
00050000-5564-4cf4-01e4-3cac931f1a19	3220	Štore
00050000-5564-4cf4-f688-32b2e770d1bb	3304	Tabor
00050000-5564-4cf4-149e-9be14d4f5c5b	3221	Teharje
00050000-5564-4cf4-1564-1c96ec3633a4	9251	Tišina
00050000-5564-4cf4-95fb-1309098b9e08	5220	Tolmin
00050000-5564-4cf4-59f5-77c1c5454094	3326	Topolšica
00050000-5564-4cf4-1c7b-cdc1a91195e1	2371	Trbonje
00050000-5564-4cf4-2ddc-43ad4ff0f5ba	1420	Trbovlje
00050000-5564-4cf4-19d1-7a36f2c6698d	8231	Trebelno 
00050000-5564-4cf4-03b5-ec493ac455e7	8210	Trebnje
00050000-5564-4cf4-8140-d12e770851c0	5252	Trnovo pri Gorici
00050000-5564-4cf4-af62-bf5fcd07c531	2254	Trnovska vas
00050000-5564-4cf4-753f-284050ef7cd9	1222	Trojane
00050000-5564-4cf4-f67b-ca16cf98478e	1236	Trzin
00050000-5564-4cf4-d177-0b338c43edfa	4290	Tržič
00050000-5564-4cf4-f04f-abeced0a3e0a	8295	Tržišče
00050000-5564-4cf4-a2a2-598c6db2c7b1	1311	Turjak
00050000-5564-4cf4-dafb-0cf65603a2c7	9224	Turnišče
00050000-5564-4cf4-6f50-f3e874b6b4ad	8323	Uršna sela
00050000-5564-4cf4-f705-7912a38a8d22	1252	Vače
00050000-5564-4cf4-eabf-7961a125885f	3320	Velenje 
00050000-5564-4cf4-f2ba-1515b2c13efc	3322	Velenje - poštni predali
00050000-5564-4cf4-0395-00718d0414b6	8212	Velika Loka
00050000-5564-4cf4-ed75-ef0be3b8b0ce	2274	Velika Nedelja
00050000-5564-4cf4-5ef0-0cd81ae9749e	9225	Velika Polana
00050000-5564-4cf4-ee08-bb928838394a	1315	Velike Lašče
00050000-5564-4cf4-1e46-f0479048b0fb	8213	Veliki Gaber
00050000-5564-4cf4-591b-93601c7b591c	9241	Veržej
00050000-5564-4cf4-bfb3-54ed47e5dc51	1312	Videm - Dobrepolje
00050000-5564-4cf4-f1df-afb50c55866d	2284	Videm pri Ptuju
00050000-5564-4cf4-ae40-8fff98695635	8344	Vinica
00050000-5564-4cf4-06df-96e46181e436	5271	Vipava
00050000-5564-4cf4-699c-b9f4ded40060	4212	Visoko
00050000-5564-4cf4-5867-c1c713def923	1294	Višnja Gora
00050000-5564-4cf4-7428-190ef0ab4e4c	3205	Vitanje
00050000-5564-4cf4-2c96-c2c020490b01	2255	Vitomarci
00050000-5564-4cf4-c9b1-be461651b7f8	1217	Vodice
00050000-5564-4cf4-283f-632cae1a6db9	3212	Vojnik\t
00050000-5564-4cf4-f70e-5be2332aac22	5293	Volčja Draga
00050000-5564-4cf4-c564-3506d60e41fb	2232	Voličina
00050000-5564-4cf4-ef26-881e48f7c7b2	3305	Vransko
00050000-5564-4cf4-4188-4d236c5cdaf7	6217	Vremski Britof
00050000-5564-4cf4-e406-414bffcf911c	1360	Vrhnika
00050000-5564-4cf4-adbd-f194aed1791b	2365	Vuhred
00050000-5564-4cf4-d8c3-dda0896fa74d	2367	Vuzenica
00050000-5564-4cf4-d1cc-f401b9ed4c67	8292	Zabukovje 
00050000-5564-4cf4-c761-0d0bc8196996	1410	Zagorje ob Savi
00050000-5564-4cf4-718b-43f77c109589	1303	Zagradec
00050000-5564-4cf4-8781-c2635a24c723	2283	Zavrč
00050000-5564-4cf4-39a8-a2f1332933f6	8272	Zdole 
00050000-5564-4cf4-9d29-fd8ff5a1adf7	4201	Zgornja Besnica
00050000-5564-4cf4-aef3-eb941984661c	2242	Zgornja Korena
00050000-5564-4cf4-eb22-97b35ba3cb0e	2201	Zgornja Kungota
00050000-5564-4cf4-c4a5-0d1d650a4f7d	2316	Zgornja Ložnica
00050000-5564-4cf4-6f19-df39b6309f33	2314	Zgornja Polskava
00050000-5564-4cf4-ca78-cbd81e970ff0	2213	Zgornja Velka
00050000-5564-4cf4-afc0-c0a24f9dd3db	4247	Zgornje Gorje
00050000-5564-4cf4-c847-03cccabd1bab	4206	Zgornje Jezersko
00050000-5564-4cf4-fac3-c8fab6eeeaaa	2285	Zgornji Leskovec
00050000-5564-4cf4-042e-3ad1441eb5bb	1432	Zidani Most
00050000-5564-4cf4-c322-6f66e69cb2d6	3214	Zreče
00050000-5564-4cf4-6699-f1ef0a3405d7	4209	Žabnica
00050000-5564-4cf4-cfae-0b4f5f6310e1	3310	Žalec
00050000-5564-4cf4-0967-9c7510d6ae3d	4228	Železniki
00050000-5564-4cf4-29eb-40d1f8388a62	2287	Žetale
00050000-5564-4cf4-85f4-e30939fec138	4226	Žiri
00050000-5564-4cf4-1a02-43d14a102b19	4274	Žirovnica
00050000-5564-4cf4-064d-0bae21514cb3	8360	Žužemberk
\.


--
-- TOC entry 2723 (class 0 OID 5096515)
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
-- TOC entry 2705 (class 0 OID 5096330)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2711 (class 0 OID 5096408)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2725 (class 0 OID 5096527)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2738 (class 0 OID 5096647)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2742 (class 0 OID 5096698)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2729 (class 0 OID 5096556)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5564-4cf5-9160-3fd78af0ac1b	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5564-4cf5-13ea-4ccf2195068b	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5564-4cf5-6e71-0f799bd6d939	0003	Kazinska	t	84	Kazinska dvorana
00220000-5564-4cf5-d320-3476a96d61c3	0004	Mali oder	t	24	Mali oder 
00220000-5564-4cf5-6fd1-5ecceeba3862	0005	Komorni oder	t	15	Komorni oder
00220000-5564-4cf5-12e6-931089a92873	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5564-4cf5-6e98-3f4346aa7213	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2721 (class 0 OID 5096500)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2720 (class 0 OID 5096490)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2741 (class 0 OID 5096687)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2736 (class 0 OID 5096624)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2694 (class 0 OID 5096203)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5564-4cf4-56f6-fae8fc1fb9df	00010000-5564-4cf4-f4a5-28b066e3a2b9	2015-05-26 12:37:41	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROEQj94RAsA8feHKcf6FYUYARkZiYhuMK";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2760 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2730 (class 0 OID 5096566)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2698 (class 0 OID 5096241)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5564-4cf4-0ebe-d830e8036ab9	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5564-4cf4-0a3c-785e44e331a1	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5564-4cf4-65ef-d6462c751a98	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5564-4cf4-35d6-c606b50c09a5	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5564-4cf4-3332-07d4121b57a7	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5564-4cf4-a23b-cd1d01f83b30	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2696 (class 0 OID 5096225)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5564-4cf4-56f6-fae8fc1fb9df	00020000-5564-4cf4-35d6-c606b50c09a5
00010000-5564-4cf4-f4a5-28b066e3a2b9	00020000-5564-4cf4-35d6-c606b50c09a5
\.


--
-- TOC entry 2732 (class 0 OID 5096580)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2724 (class 0 OID 5096521)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2718 (class 0 OID 5096471)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2750 (class 0 OID 5096793)
-- Dependencies: 230
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5564-4cf4-0a72-abb1316eb41d	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5564-4cf4-2389-c4b534600489	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5564-4cf4-4ab9-47bb4e0e07fd	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5564-4cf4-fec3-aa185f7f68df	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5564-4cf4-0d8e-e65acc4327d1	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2749 (class 0 OID 5096786)
-- Dependencies: 229
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5564-4cf4-5148-821f5d3c3b5c	00000000-5564-4cf4-fec3-aa185f7f68df	popa
00000000-5564-4cf4-2849-883d13243a41	00000000-5564-4cf4-fec3-aa185f7f68df	oseba
00000000-5564-4cf4-636d-25868f086512	00000000-5564-4cf4-2389-c4b534600489	prostor
00000000-5564-4cf4-710c-5e5a7e155c84	00000000-5564-4cf4-fec3-aa185f7f68df	besedilo
00000000-5564-4cf4-49f7-f1f3dfadf366	00000000-5564-4cf4-fec3-aa185f7f68df	uprizoritev
00000000-5564-4cf4-9b43-714edd3304ae	00000000-5564-4cf4-fec3-aa185f7f68df	funkcija
00000000-5564-4cf4-f026-0570a0358887	00000000-5564-4cf4-fec3-aa185f7f68df	tipfunkcije
\.


--
-- TOC entry 2748 (class 0 OID 5096781)
-- Dependencies: 228
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2737 (class 0 OID 5096634)
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
-- TOC entry 2703 (class 0 OID 5096302)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2719 (class 0 OID 5096477)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2740 (class 0 OID 5096676)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5564-4cf4-0749-e9612b5d4e76	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5564-4cf4-34cf-a2e013ab6962	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5564-4cf4-68ea-6e08a52737c6	Baletnik ali plesalec	Baletniki in plesalci	\N	Baletnica ali plesalka	igralec
000f0000-5564-4cf4-3059-beb43974490d	Avtor	Avtorji	\N	Avtorka	umetnik
000f0000-5564-4cf4-d633-94bd20c90b5f	Režiser	Režiserji	\N	Režiserka	umetnik
000f0000-5564-4cf4-e81d-9b57f2cc7e0c	Scenograf	Scenografi	\N	Scenografka	tehnik
000f0000-5564-4cf4-9133-f1f149aba631	Kostumograf	Kostumografi	\N	Kostumografinja	tehnik
000f0000-5564-4cf4-d514-9c7bec4421e5	Oblikovalec maske	Oblikovalci maske	\N	Oblikovalka maske	tehnik
000f0000-5564-4cf4-ada8-5cb4a6a2f59a	Avtor glasbe	Avtorji glasbe	\N	Avtorica glasbe	umetnik
000f0000-5564-4cf4-aeac-bfe3bb9de52b	Oblikovalec svetlobe	Oblikovalci svetlobe	\N	Oblikovalka svetlobe	tehnik
000f0000-5564-4cf4-bf1c-81042b137233	Koreograf	Koreografi	\N	Koreografinja	umetnik
000f0000-5564-4cf4-c1f6-363a5beb5c3a	Dramaturg	Dramaturgi	\N	Dramaturginja	umetnik
000f0000-5564-4cf4-2ba3-dc68d739871d	Lektorj	Lektorji	\N	Lektorica	umetnik
000f0000-5564-4cf4-af7e-e4bde8284ad0	Prevajalec	Prevajalci	\N	Prevajalka	umetnik
000f0000-5564-4cf4-0f7e-d290776cddfb	Oblikovalec videa	Oblikovalci videa	\N	Oblikovalka videa	umetnik
000f0000-5564-4cf4-6827-18ec3f34512a	Intermedijski ustvarjalec	Intermedijski ustvarjalci	\N	Intermedijska ustvarjalka	umetnik
\.


--
-- TOC entry 2708 (class 0 OID 5096365)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2695 (class 0 OID 5096212)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5564-4cf4-f4a5-28b066e3a2b9	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROeKhyPTXUQihRy7fZuShoLiDiFoyWuAC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5564-4cf4-1b06-6000385c344f	Jani	$2y$05$NS4xMjkyMTcwMzExMjAxROQChLcN5bCCuS/HhU3LTgg8e6bHeOFxO	t	\N	\N	\N	jani@ifigenija.si	\N	\N	\N
00010000-5564-4cf4-a67a-37c5e230c445	Tona	$2y$05$NS4xMjkyMTcwMzExMjAxROE1K.h9Hs/51f4/svARQBmxw9AHyunvK	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5564-4cf4-a7ad-96d1d639a5ab	Ivo	$2y$05$NS4xMjkyMTcwMzExMjAxROgr0ZfSC87Wr4vWrw7EuAAfbChUNx8Be	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5564-4cf4-30d4-16bc56c83940	Jože	$2y$05$NS4xMjkyMTcwMzExMjAxROhLy0x8NTjym4duTz5jizow8V0zchUNG	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5564-4cf4-94f1-124b525e950f	Marko	$2y$05$NS4xMjkyMTcwMzExMjAxROizjqJkrtEgIvs2sxMPHmktMEbNd8KHG	t	\N	\N	\N	marko@ifigenija.si	\N	\N	\N
00010000-5564-4cf4-b49f-28b09e4bf55f	Marija	$2y$05$NS4xMjkyMTcwMzExMjAxRO25XMfzLE/W/5Z/XQR8rKAoROUDa0ciO	t	\N	\N	\N	marija@ifigenija.si	\N	\N	\N
00010000-5564-4cf4-8b14-cdab35add390	Ana	$2y$05$NS4xMjkyMTcwMzExMjAxROqZ3VnxfwWQezJ4dl/cDybGFvJqEk/U6	t	\N	\N	\N	ana@ifigenija.si	\N	\N	\N
00010000-5564-4cf4-f28a-a75fa64db648	Maja	$2y$05$NS4xMjkyMTcwMzExMjAxROxEOtngxagv0d6hZF0LAhpW4aXv7gPPi	t	\N	\N	\N	maja@ifigenija.si	\N	\N	\N
00010000-5564-4cf4-8cb7-1ef6c501d38e	Irena	$2y$05$NS4xMjkyMTcwMzExMjAxROuAP9kCf.bASqagqIhYQ9aBJHijHaKX6	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5564-4cf4-38a4-e656a89ddae4	Mojca	$2y$05$NS4xMjkyMTcwMzExMjAxRObC/Qdq5gHS7yo3.FWG3Hm3bnIAuFJT.	t	\N	\N	\N	mojca@ifigenija.si	\N	\N	\N
00010000-5564-4cf4-56f6-fae8fc1fb9df	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2745 (class 0 OID 5096731)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
\.


--
-- TOC entry 2713 (class 0 OID 5096423)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2728 (class 0 OID 5096548)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2735 (class 0 OID 5096616)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2715 (class 0 OID 5096455)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2744 (class 0 OID 5096721)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-5564-4cf4-9d50-4a1942521543	Drama	drama (SURS 01)
00140000-5564-4cf4-1b5b-961576228a41	Opera	opera (SURS 02)
00140000-5564-4cf4-a134-8a835d528616	Balet	balet (SURS 03)
00140000-5564-4cf4-2c11-19e10bf5c3bb	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5564-4cf4-f6fc-54e686912856	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5564-4cf4-28a8-e72eb5c758d8	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5564-4cf4-0455-81bc49d6181b	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2734 (class 0 OID 5096606)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-5564-4cf4-3b19-4ff93e54b3ad	Opera	opera
00150000-5564-4cf4-df83-b100c5a46a39	Opereta	opereta
00150000-5564-4cf4-6fbd-3aadff1330a1	Balet	balet
00150000-5564-4cf4-fd53-864bcca12ea2	Plesne prireditve	plesne prireditve
00150000-5564-4cf4-a970-6914501b0e54	Lutkovno gledališče	lutkovno gledališče
00150000-5564-4cf4-7a12-7e97c7dad179	Raziskovalno gledališče	raziskovalno gledališče
00150000-5564-4cf4-e33e-d8b1ed137258	Biografska drama	biografska drama
00150000-5564-4cf4-8a80-ae63302e894b	Komedija	komedija
00150000-5564-4cf4-b352-575e6c2300f0	Črna komedija	črna komedija
00150000-5564-4cf4-1881-f53e8c6e23dd	E-igra	E-igra
00150000-5564-4cf4-1eaf-fd3c1cd00a90	Kriminalka	kriminalka
00150000-5564-4cf4-e6fe-a051ae7ba4ed	Musical	musical
\.


--
-- TOC entry 2315 (class 2606 OID 5096266)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 5096775)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 5096765)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 5096675)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 5096445)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 5096470)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 5096391)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 5096602)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 5096421)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 5096464)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 5096405)
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
-- TOC entry 2407 (class 2606 OID 5096513)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 5096540)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 5096363)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 5096275)
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
-- TOC entry 2322 (class 2606 OID 5096298)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2313 (class 2606 OID 5096255)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2306 (class 2606 OID 5096240)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 5096546)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 5096579)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 5096716)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2331 (class 2606 OID 5096327)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 5096351)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 5096519)
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
-- TOC entry 2337 (class 2606 OID 5096341)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 5096412)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 5096531)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 5096659)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 5096703)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 5096563)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 5096504)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 5096495)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 5096697)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 5096631)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 5096211)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 5096570)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 5096229)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2308 (class 2606 OID 5096249)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 5096588)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 5096526)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 5096476)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 5096799)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 5096790)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 5096785)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 5096644)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 5096307)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 5096486)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 5096686)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 5096376)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 5096224)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 5096746)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 5096430)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 5096554)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 5096622)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 5096459)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 5096730)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 5096615)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 1259 OID 5096452)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2454 (class 1259 OID 5096645)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2455 (class 1259 OID 5096646)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2329 (class 1259 OID 5096329)
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
-- TOC entry 2420 (class 1259 OID 5096547)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2414 (class 1259 OID 5096533)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2415 (class 1259 OID 5096532)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2366 (class 1259 OID 5096431)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2442 (class 1259 OID 5096605)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2443 (class 1259 OID 5096603)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2444 (class 1259 OID 5096604)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2354 (class 1259 OID 5096407)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2355 (class 1259 OID 5096406)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2471 (class 1259 OID 5096718)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2472 (class 1259 OID 5096719)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2473 (class 1259 OID 5096720)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2479 (class 1259 OID 5096750)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2480 (class 1259 OID 5096747)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2481 (class 1259 OID 5096749)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2482 (class 1259 OID 5096748)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2344 (class 1259 OID 5096378)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2345 (class 1259 OID 5096377)
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
-- TOC entry 2320 (class 1259 OID 5096301)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2430 (class 1259 OID 5096571)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2384 (class 1259 OID 5096465)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2310 (class 1259 OID 5096256)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2311 (class 1259 OID 5096257)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2435 (class 1259 OID 5096591)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2436 (class 1259 OID 5096590)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2437 (class 1259 OID 5096589)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2358 (class 1259 OID 5096413)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2359 (class 1259 OID 5096415)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2360 (class 1259 OID 5096414)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2498 (class 1259 OID 5096792)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2394 (class 1259 OID 5096499)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2395 (class 1259 OID 5096497)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2396 (class 1259 OID 5096496)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2397 (class 1259 OID 5096498)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2301 (class 1259 OID 5096230)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 5096231)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2423 (class 1259 OID 5096555)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2409 (class 1259 OID 5096520)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2450 (class 1259 OID 5096632)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2451 (class 1259 OID 5096633)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2333 (class 1259 OID 5096343)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2334 (class 1259 OID 5096342)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2335 (class 1259 OID 5096344)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2458 (class 1259 OID 5096660)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2459 (class 1259 OID 5096661)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2491 (class 1259 OID 5096778)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2492 (class 1259 OID 5096777)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2493 (class 1259 OID 5096780)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2494 (class 1259 OID 5096776)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2495 (class 1259 OID 5096779)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2447 (class 1259 OID 5096623)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2400 (class 1259 OID 5096508)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2401 (class 1259 OID 5096507)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2402 (class 1259 OID 5096505)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2403 (class 1259 OID 5096506)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2284 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2487 (class 1259 OID 5096767)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2488 (class 1259 OID 5096766)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2365 (class 1259 OID 5096422)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2316 (class 1259 OID 5096277)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2317 (class 1259 OID 5096276)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2325 (class 1259 OID 5096308)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2326 (class 1259 OID 5096309)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2389 (class 1259 OID 5096489)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2390 (class 1259 OID 5096488)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2391 (class 1259 OID 5096487)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2372 (class 1259 OID 5096454)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2373 (class 1259 OID 5096450)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2374 (class 1259 OID 5096447)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2375 (class 1259 OID 5096448)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2376 (class 1259 OID 5096446)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2377 (class 1259 OID 5096451)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2378 (class 1259 OID 5096449)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2332 (class 1259 OID 5096328)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2350 (class 1259 OID 5096392)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2351 (class 1259 OID 5096394)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2352 (class 1259 OID 5096393)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2353 (class 1259 OID 5096395)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2408 (class 1259 OID 5096514)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2476 (class 1259 OID 5096717)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2323 (class 1259 OID 5096299)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2324 (class 1259 OID 5096300)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2504 (class 1259 OID 5096800)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2343 (class 1259 OID 5096364)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2501 (class 1259 OID 5096791)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2428 (class 1259 OID 5096565)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2429 (class 1259 OID 5096564)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2287 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2340 (class 1259 OID 5096352)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 5096704)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2309 (class 1259 OID 5096250)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2379 (class 1259 OID 5096453)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2530 (class 2606 OID 5096938)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2533 (class 2606 OID 5096923)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2532 (class 2606 OID 5096928)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2528 (class 2606 OID 5096948)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2534 (class 2606 OID 5096918)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2529 (class 2606 OID 5096943)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2531 (class 2606 OID 5096933)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2564 (class 2606 OID 5097093)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2563 (class 2606 OID 5097098)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2515 (class 2606 OID 5096853)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2551 (class 2606 OID 5097033)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2549 (class 2606 OID 5097028)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2550 (class 2606 OID 5097023)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2527 (class 2606 OID 5096913)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2557 (class 2606 OID 5097073)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2559 (class 2606 OID 5097063)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2558 (class 2606 OID 5097068)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2521 (class 2606 OID 5096888)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2522 (class 2606 OID 5096883)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2547 (class 2606 OID 5097013)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2570 (class 2606 OID 5097118)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2569 (class 2606 OID 5097123)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2568 (class 2606 OID 5097128)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2571 (class 2606 OID 5097148)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2574 (class 2606 OID 5097133)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2572 (class 2606 OID 5097143)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2573 (class 2606 OID 5097138)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2519 (class 2606 OID 5096878)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2520 (class 2606 OID 5096873)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2511 (class 2606 OID 5096838)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2512 (class 2606 OID 5096833)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2553 (class 2606 OID 5097043)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2535 (class 2606 OID 5096953)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2508 (class 2606 OID 5096813)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2507 (class 2606 OID 5096818)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2554 (class 2606 OID 5097058)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2555 (class 2606 OID 5097053)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2556 (class 2606 OID 5097048)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2525 (class 2606 OID 5096893)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2523 (class 2606 OID 5096903)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2524 (class 2606 OID 5096898)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2582 (class 2606 OID 5097188)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2539 (class 2606 OID 5096988)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2541 (class 2606 OID 5096978)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2542 (class 2606 OID 5096973)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2540 (class 2606 OID 5096983)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2506 (class 2606 OID 5096803)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2505 (class 2606 OID 5096808)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2552 (class 2606 OID 5097038)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2548 (class 2606 OID 5097018)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2562 (class 2606 OID 5097083)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2561 (class 2606 OID 5097088)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2517 (class 2606 OID 5096863)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 5096858)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2516 (class 2606 OID 5096868)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2566 (class 2606 OID 5097103)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2565 (class 2606 OID 5097108)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2579 (class 2606 OID 5097173)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2580 (class 2606 OID 5097168)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2577 (class 2606 OID 5097183)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2581 (class 2606 OID 5097163)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2578 (class 2606 OID 5097178)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2560 (class 2606 OID 5097078)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2543 (class 2606 OID 5097008)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2544 (class 2606 OID 5097003)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2546 (class 2606 OID 5096993)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2545 (class 2606 OID 5096998)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2575 (class 2606 OID 5097158)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2576 (class 2606 OID 5097153)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2526 (class 2606 OID 5096908)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2567 (class 2606 OID 5097113)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 5096828)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2510 (class 2606 OID 5096823)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2514 (class 2606 OID 5096843)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2513 (class 2606 OID 5096848)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2536 (class 2606 OID 5096968)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2537 (class 2606 OID 5096963)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2538 (class 2606 OID 5096958)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-26 12:37:42 CEST

--
-- PostgreSQL database dump complete
--

