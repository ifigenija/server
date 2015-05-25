--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-25 11:09:24 CEST

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
-- TOC entry 2757 (class 0 OID 0)
-- Dependencies: 232
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 4833002)
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
-- TOC entry 227 (class 1259 OID 4833511)
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
-- TOC entry 226 (class 1259 OID 4833494)
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
-- TOC entry 219 (class 1259 OID 4833405)
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
-- TOC entry 194 (class 1259 OID 4833175)
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
-- TOC entry 197 (class 1259 OID 4833209)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 4833122)
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
-- TOC entry 213 (class 1259 OID 4833335)
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
-- TOC entry 192 (class 1259 OID 4833159)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 196 (class 1259 OID 4833203)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 4833139)
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
-- TOC entry 202 (class 1259 OID 4833252)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 4833277)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 4833096)
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
-- TOC entry 181 (class 1259 OID 4833011)
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
-- TOC entry 182 (class 1259 OID 4833022)
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
-- TOC entry 177 (class 1259 OID 4832976)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 4832995)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 4833284)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 4833315)
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
-- TOC entry 223 (class 1259 OID 4833448)
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
-- TOC entry 184 (class 1259 OID 4833053)
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
-- TOC entry 186 (class 1259 OID 4833088)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 4833258)
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
-- TOC entry 185 (class 1259 OID 4833073)
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
-- TOC entry 191 (class 1259 OID 4833151)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 4833270)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 4833390)
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
-- TOC entry 222 (class 1259 OID 4833441)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 4833299)
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
-- TOC entry 201 (class 1259 OID 4833243)
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
-- TOC entry 200 (class 1259 OID 4833233)
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
-- TOC entry 221 (class 1259 OID 4833430)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 4833367)
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
-- TOC entry 174 (class 1259 OID 4832947)
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
-- TOC entry 173 (class 1259 OID 4832945)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2758 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 4833309)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 4832985)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 4832969)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 4833323)
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
-- TOC entry 204 (class 1259 OID 4833264)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 4833214)
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
-- TOC entry 230 (class 1259 OID 4833536)
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
-- TOC entry 229 (class 1259 OID 4833529)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 4833524)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 4833377)
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
-- TOC entry 231 (class 1259 OID 4833544)
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE strosekuprizoritve_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 183 (class 1259 OID 4833045)
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
-- TOC entry 199 (class 1259 OID 4833220)
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
-- TOC entry 220 (class 1259 OID 4833419)
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
-- TOC entry 188 (class 1259 OID 4833108)
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
-- TOC entry 175 (class 1259 OID 4832956)
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
-- TOC entry 225 (class 1259 OID 4833474)
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
-- TOC entry 193 (class 1259 OID 4833166)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 4833291)
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
-- TOC entry 215 (class 1259 OID 4833359)
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
-- TOC entry 195 (class 1259 OID 4833198)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 4833464)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 4833349)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2146 (class 2604 OID 4832950)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2699 (class 0 OID 4833002)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2746 (class 0 OID 4833511)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
\.


--
-- TOC entry 2745 (class 0 OID 4833494)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2738 (class 0 OID 4833405)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2713 (class 0 OID 4833175)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2716 (class 0 OID 4833209)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2708 (class 0 OID 4833122)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5562-e6c2-38f2-97686f8ee071	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5562-e6c2-18d9-ae2399688ff5	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5562-e6c2-127a-9640ade3c17a	AL	ALB	008	Albania 	Albanija	\N
00040000-5562-e6c2-a9c0-44a95ebd139f	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5562-e6c2-7c0e-4bc3e689808a	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5562-e6c2-fdd1-ae9138927548	AD	AND	020	Andorra 	Andora	\N
00040000-5562-e6c2-83b3-afb3775146e6	AO	AGO	024	Angola 	Angola	\N
00040000-5562-e6c2-7677-98da3da5eef7	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5562-e6c2-1d72-33819f5f7ad8	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5562-e6c2-9062-4bea82adf470	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5562-e6c2-287a-64070318f59b	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5562-e6c2-3b67-65d7017c5917	AM	ARM	051	Armenia 	Armenija	\N
00040000-5562-e6c2-0790-d0d6a7324cc5	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5562-e6c2-431f-0da096b5c2f9	AU	AUS	036	Australia 	Avstralija	\N
00040000-5562-e6c2-819f-ab7938c5d725	AT	AUT	040	Austria 	Avstrija	\N
00040000-5562-e6c2-c2a4-a0fcfc2624a7	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5562-e6c2-eb68-724e24fd7a33	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5562-e6c2-d61e-8e25c1b6e1ff	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5562-e6c2-c828-120207c6575c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5562-e6c2-e2d4-3f89e689b495	BB	BRB	052	Barbados 	Barbados	\N
00040000-5562-e6c2-de15-aa36be6d7222	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5562-e6c2-a242-27b359f08d6e	BE	BEL	056	Belgium 	Belgija	\N
00040000-5562-e6c2-4e95-e6af014a229e	BZ	BLZ	084	Belize 	Belize	\N
00040000-5562-e6c2-0975-fc3d67b6e12a	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5562-e6c2-665d-29e386a4a46f	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5562-e6c2-ed26-bcfe0d0f8b00	BT	BTN	064	Bhutan 	Butan	\N
00040000-5562-e6c2-1575-00bfd832b0fe	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5562-e6c2-592a-7b5ab2d7cdb6	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5562-e6c2-0420-77d56ff93bb0	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5562-e6c2-059d-a7893c30dc6c	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5562-e6c2-080d-d8865b4b5aeb	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5562-e6c2-6a8f-ab87e587032a	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5562-e6c2-3831-aa319f56e03f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5562-e6c2-2cb6-aea555c26b58	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5562-e6c2-033f-0b1db28ab0e7	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5562-e6c2-8b3e-446ec0d0ab96	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5562-e6c2-cd11-5a91a9bccdd7	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5562-e6c2-7ba3-9a9e21c522fc	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5562-e6c2-0eea-67c3fd67d178	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5562-e6c2-bc9c-92c3ba8c8796	CA	CAN	124	Canada 	Kanada	\N
00040000-5562-e6c2-8391-3d7587ccef43	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5562-e6c2-44bf-13365510623c	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5562-e6c2-c240-2868e7893a93	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5562-e6c2-0d89-16257be38455	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5562-e6c2-fd76-a1285fb09fcd	CL	CHL	152	Chile 	Čile	\N
00040000-5562-e6c2-aab5-ee25f7cf722b	CN	CHN	156	China 	Kitajska	\N
00040000-5562-e6c2-a168-e264e533cafb	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5562-e6c2-75a3-1b3d209e3ccd	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5562-e6c2-0527-3e63b42fb5f0	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5562-e6c2-f373-143ae8a033b0	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5562-e6c2-2da7-6cafb85e1ca0	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5562-e6c2-7a64-5ce8693ea966	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5562-e6c2-a662-f6dde55ce6ed	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5562-e6c2-22f6-328db8566351	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5562-e6c2-3912-43d92aa4995f	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5562-e6c2-a315-835372f774b4	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5562-e6c2-d88d-c1827d819d33	CU	CUB	192	Cuba 	Kuba	\N
00040000-5562-e6c2-b377-6c4c93ce1254	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5562-e6c2-c980-4ce77ab3fc72	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5562-e6c2-c3c1-5792d885771f	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5562-e6c2-6558-7006285cd476	DK	DNK	208	Denmark 	Danska	\N
00040000-5562-e6c2-9787-01c5c64f76f3	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5562-e6c2-0328-218c3fd6a347	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5562-e6c2-17cf-3450ba5201c3	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5562-e6c2-8745-7f9ca353d203	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5562-e6c2-ad08-2554a748711a	EG	EGY	818	Egypt 	Egipt	\N
00040000-5562-e6c2-55b5-fcd093300086	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5562-e6c2-32de-5be62b2f629d	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5562-e6c2-a507-a88045db0e50	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5562-e6c2-bb00-fb14006389d5	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5562-e6c2-867e-cc33db28f3b7	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5562-e6c2-eaf1-a4781ae065b9	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5562-e6c2-ae86-7575eb294f84	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5562-e6c2-41d2-eb207a0bf1a3	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5562-e6c2-b9a6-322bb12f474e	FI	FIN	246	Finland 	Finska	\N
00040000-5562-e6c2-0d3d-67b77434a30d	FR	FRA	250	France 	Francija	\N
00040000-5562-e6c2-86b5-fa3ce43988d9	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5562-e6c2-8bcb-666625fee81d	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5562-e6c2-4f1d-1f1898f749f5	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5562-e6c2-b96f-052a0a900332	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5562-e6c2-4b61-ba9c2214d8de	GA	GAB	266	Gabon 	Gabon	\N
00040000-5562-e6c2-0753-cde8bdeda4d2	GM	GMB	270	Gambia 	Gambija	\N
00040000-5562-e6c2-5b1b-b6ac8dc45228	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5562-e6c2-3a61-228835408fea	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5562-e6c2-75f0-34ecd2cd49ac	GH	GHA	288	Ghana 	Gana	\N
00040000-5562-e6c2-6438-8923841d6b2d	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5562-e6c2-66b0-7f16de655ad2	GR	GRC	300	Greece 	Grčija	\N
00040000-5562-e6c2-fd45-996fb72f8b7f	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5562-e6c2-66d9-9fc763913aef	GD	GRD	308	Grenada 	Grenada	\N
00040000-5562-e6c2-05b5-60a40fe6a3c8	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5562-e6c2-003b-40bed1605a42	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5562-e6c2-550c-7f3af146d691	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5562-e6c2-3f4f-dc027ccbfd80	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5562-e6c2-bfed-bae0d17ce976	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5562-e6c2-d1d0-ab80238f5259	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5562-e6c2-0a7c-01aab8da1fa5	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5562-e6c2-4f76-188abd6c62a9	HT	HTI	332	Haiti 	Haiti	\N
00040000-5562-e6c2-78a7-1d826374efad	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5562-e6c2-de45-03682a74d209	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5562-e6c2-cdde-51bebb043e51	HN	HND	340	Honduras 	Honduras	\N
00040000-5562-e6c2-4bb4-701d37845612	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5562-e6c2-c881-98a405f6aae5	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5562-e6c2-fa7e-6e9f50c2564e	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5562-e6c2-7fdc-a74b33829cd3	IN	IND	356	India 	Indija	\N
00040000-5562-e6c2-c03f-276fda22d2d9	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5562-e6c2-6628-2c5182beb6d8	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5562-e6c2-2424-24b1a7ca0362	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5562-e6c2-0958-de0ea4f3945b	IE	IRL	372	Ireland 	Irska	\N
00040000-5562-e6c2-5111-441417624936	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5562-e6c2-4e27-5eee7583d0dd	IL	ISR	376	Israel 	Izrael	\N
00040000-5562-e6c2-aeb5-67ebc98f03d5	IT	ITA	380	Italy 	Italija	\N
00040000-5562-e6c2-0647-2de833b2300f	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5562-e6c2-c9e9-64133ae874f1	JP	JPN	392	Japan 	Japonska	\N
00040000-5562-e6c2-4e9d-41c9ec53a92d	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5562-e6c2-66d6-9e56bc6a42d5	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5562-e6c2-44cf-71f4f6e28511	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5562-e6c2-8fab-339d4797e8ec	KE	KEN	404	Kenya 	Kenija	\N
00040000-5562-e6c2-31d8-f33794de6928	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5562-e6c2-8396-a0ee07c95213	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5562-e6c2-a5d3-63933c08153b	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5562-e6c2-c9fb-43532cc78b3a	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5562-e6c2-2efb-bc4717e98e78	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5562-e6c2-c9ea-925ef400066c	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5562-e6c2-be2b-a733f238bcaa	LV	LVA	428	Latvia 	Latvija	\N
00040000-5562-e6c2-602c-04feaab42a43	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5562-e6c2-2bc9-fe9ff07eab6a	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5562-e6c2-1abc-5cbe2686ddb6	LR	LBR	430	Liberia 	Liberija	\N
00040000-5562-e6c2-5c40-fd007e201d87	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5562-e6c2-60ec-9a80e37d5dc0	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5562-e6c2-1a81-8ea470766e10	LT	LTU	440	Lithuania 	Litva	\N
00040000-5562-e6c2-7665-90088ad8702f	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5562-e6c2-ea48-c78f67fa8993	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5562-e6c2-3053-a8a88347c09b	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5562-e6c2-114f-e0c08a404dfd	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5562-e6c2-1de3-6e9b70894a8c	MW	MWI	454	Malawi 	Malavi	\N
00040000-5562-e6c2-6011-6e31839a5013	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5562-e6c2-0efb-03e143fe7e2c	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5562-e6c2-f109-2b04b373898c	ML	MLI	466	Mali 	Mali	\N
00040000-5562-e6c2-59c9-74e7f21ad46c	MT	MLT	470	Malta 	Malta	\N
00040000-5562-e6c2-c48e-42ce4734a591	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5562-e6c2-88ee-b181882800cc	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5562-e6c2-24c9-e8f0f8e30214	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5562-e6c2-4ced-1c8ddcf7b3c6	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5562-e6c2-72a3-3318b0f8dd86	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5562-e6c2-0bac-e19dc7cf01c5	MX	MEX	484	Mexico 	Mehika	\N
00040000-5562-e6c2-0c65-0272ec03fb1a	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5562-e6c2-1470-7fe9c4408199	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5562-e6c2-37a2-acac300bbb36	MC	MCO	492	Monaco 	Monako	\N
00040000-5562-e6c2-dd65-2838c1b2bf71	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5562-e6c2-06e8-de36842f879c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5562-e6c2-9713-e8e920690e97	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5562-e6c2-0d82-a7caaba53d8f	MA	MAR	504	Morocco 	Maroko	\N
00040000-5562-e6c2-38dd-75d73d5a264a	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5562-e6c2-02a5-1d6803ddc740	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5562-e6c2-adeb-a4e987e7a07c	NA	NAM	516	Namibia 	Namibija	\N
00040000-5562-e6c2-91ba-909d0566b1a8	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5562-e6c2-65a8-8dbc8fc0ee78	NP	NPL	524	Nepal 	Nepal	\N
00040000-5562-e6c2-151f-c7f7037a1ed8	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5562-e6c2-4bb0-4c974362b2a1	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5562-e6c2-95fc-e8c34ae7c4da	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5562-e6c2-d889-8a8795f5b3fe	NE	NER	562	Niger 	Niger 	\N
00040000-5562-e6c2-b11b-c6839c363aac	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5562-e6c2-f393-f32d92ee29f8	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5562-e6c2-b443-4f66e64ebb3b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5562-e6c2-65d8-cc42808ba069	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5562-e6c2-17c1-d2ef4fe45311	NO	NOR	578	Norway 	Norveška	\N
00040000-5562-e6c2-5647-afd9a8d7bf20	OM	OMN	512	Oman 	Oman	\N
00040000-5562-e6c2-6932-02e669506d94	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5562-e6c2-624e-a4374a5c7dfe	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5562-e6c2-7694-020feef16951	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5562-e6c2-fd2c-20acb6999547	PA	PAN	591	Panama 	Panama	\N
00040000-5562-e6c2-40e7-9addcded5fbd	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5562-e6c2-d370-5e379adb7fd1	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5562-e6c2-a48d-e868c32f1448	PE	PER	604	Peru 	Peru	\N
00040000-5562-e6c2-ea73-4deacb0095a6	PH	PHL	608	Philippines 	Filipini	\N
00040000-5562-e6c2-7297-39414a57c15f	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5562-e6c2-04df-461e681d08b6	PL	POL	616	Poland 	Poljska	\N
00040000-5562-e6c2-5476-6f1b63ecb6f0	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5562-e6c2-ea59-680dfc5c5f67	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5562-e6c2-49c1-d68dcfbe53df	QA	QAT	634	Qatar 	Katar	\N
00040000-5562-e6c2-7a0d-afb5235c2a44	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5562-e6c2-da20-564d38c6c9af	RO	ROU	642	Romania 	Romunija	\N
00040000-5562-e6c2-734a-a23699f2e819	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5562-e6c2-a635-c58a2342c274	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5562-e6c2-008e-335156f7d426	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5562-e6c2-679e-bf434134b57c	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5562-e6c2-cfa1-409317145dcf	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5562-e6c2-a28b-d813490329ad	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5562-e6c2-5ea1-84e814073414	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5562-e6c2-4f65-c1e809f5afad	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5562-e6c2-25e7-f4111c331781	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5562-e6c2-98e0-f5d8b28b9269	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5562-e6c2-b47e-b76f4155a481	SM	SMR	674	San Marino 	San Marino	\N
00040000-5562-e6c2-100a-2946da51e09a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5562-e6c2-fea7-73e5b0515c1c	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5562-e6c2-2612-8292aa3cb6ff	SN	SEN	686	Senegal 	Senegal	\N
00040000-5562-e6c2-26ec-8bda4f55ecb5	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5562-e6c2-f09f-4f31217e319e	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5562-e6c2-c422-799c3aeb3269	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5562-e6c2-7f8d-c0a381e2aa1f	SG	SGP	702	Singapore 	Singapur	\N
00040000-5562-e6c2-3566-16fd76252406	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5562-e6c2-293f-105a62035a0b	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5562-e6c2-2427-5b3436b7f0c3	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5562-e6c2-b44e-8f5310b44e6e	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5562-e6c2-6d1b-a2be3c189796	SO	SOM	706	Somalia 	Somalija	\N
00040000-5562-e6c2-0d74-a55699eb2523	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5562-e6c2-dd5e-c72e15b6b102	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5562-e6c2-04ad-3486ad988902	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5562-e6c2-0c2b-e470d64e5a5b	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5562-e6c2-1e32-6b597e003e15	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5562-e6c2-1164-fd72024f4321	SD	SDN	729	Sudan 	Sudan	\N
00040000-5562-e6c2-b341-cd30bc7a6b24	SR	SUR	740	Suriname 	Surinam	\N
00040000-5562-e6c2-3776-e5659f4eea4b	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5562-e6c2-87fe-6802566b1e11	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5562-e6c2-7dc4-7f764f7cc503	SE	SWE	752	Sweden 	Švedska	\N
00040000-5562-e6c2-d088-3f1e71273358	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5562-e6c2-d491-5b93ad96ff50	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5562-e6c2-8894-2c6da69ccdbe	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5562-e6c2-7155-80e7ac28b721	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5562-e6c2-0b90-f5a05022c1f0	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5562-e6c2-da36-61d7cee61f42	TH	THA	764	Thailand 	Tajska	\N
00040000-5562-e6c2-8ebc-41d18189e8bf	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5562-e6c2-d966-4611d8075b13	TG	TGO	768	Togo 	Togo	\N
00040000-5562-e6c2-4be9-840ed6773f2e	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5562-e6c2-49e5-ee996616a985	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5562-e6c2-e6a9-b1980464a50d	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5562-e6c2-d1d7-b0eebf039347	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5562-e6c2-02d9-b504534e30e0	TR	TUR	792	Turkey 	Turčija	\N
00040000-5562-e6c2-56b5-f9f48b0ceb77	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5562-e6c2-db11-0c4bd7689324	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5562-e6c2-5d3e-c002d29394f2	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5562-e6c2-4e1d-9e5b09d27569	UG	UGA	800	Uganda 	Uganda	\N
00040000-5562-e6c2-c0d9-6d77f9bc5339	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5562-e6c2-1edc-a4c091092fa8	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5562-e6c2-0854-544b19371d4b	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5562-e6c2-1298-9aacdcaa4d42	US	USA	840	United States 	Združene države Amerike	\N
00040000-5562-e6c2-16f4-deee399aa5e8	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5562-e6c2-6935-10a9ae1182c2	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5562-e6c2-a04e-2be8211be15c	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5562-e6c2-6e60-63362413b400	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5562-e6c2-8977-b8efc7a9bd44	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5562-e6c2-3f87-f73317dab068	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5562-e6c2-1e98-1e32af2dcca4	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5562-e6c2-238c-d3b3e7cd1306	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5562-e6c2-40b7-9a2b17803615	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5562-e6c2-c106-5761161d0cdc	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5562-e6c2-8252-98a0253a4707	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5562-e6c2-0a77-acd730076db7	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5562-e6c2-b02b-75a5fb95358a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2732 (class 0 OID 4833335)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj) FROM stdin;
\.


--
-- TOC entry 2711 (class 0 OID 4833159)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2715 (class 0 OID 4833203)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2709 (class 0 OID 4833139)
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
-- TOC entry 2721 (class 0 OID 4833252)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2725 (class 0 OID 4833277)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2706 (class 0 OID 4833096)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5562-e6c2-4cf6-7c841558537d	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5562-e6c2-b098-be98304825a9	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5562-e6c2-07a7-f09cac41eebb	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5562-e6c2-c3b9-ac3ec418fb75	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5562-e6c2-70b9-bfeed84ca9ae	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5562-e6c2-2538-59e663f596b4	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5562-e6c2-f838-87bff77e5460	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5562-e6c2-4b83-90b7051a69d2	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5562-e6c2-42a3-1bcc7cdb4211	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5562-e6c2-36d6-4b2fe90a88b2	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5562-e6c2-fc05-32274646beb0	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5562-e6c2-5b65-bb360a78939d	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5562-e6c2-5854-08fc9581d219	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5562-e6c2-dee3-86d897180a0b	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5562-e6c2-785d-6f6809833897	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2700 (class 0 OID 4833011)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5562-e6c2-2595-f2e8d3b9ed75	00000000-5562-e6c2-70b9-bfeed84ca9ae	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5562-e6c2-1aca-61357974a015	00000000-5562-e6c2-70b9-bfeed84ca9ae	00010000-5562-e6c2-c37e-742a41057976	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5562-e6c2-b12f-347ee1308bfb	00000000-5562-e6c2-2538-59e663f596b4	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2701 (class 0 OID 4833022)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2691 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2696 (class 0 OID 4832976)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5562-e6c2-430c-00fc24044175	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5562-e6c2-476f-a9bed89dafc8	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5562-e6c2-dd49-db1df0cd7d53	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5562-e6c2-ccad-27974ae34a8b	Abonma-read	Abonma - branje	f
00030000-5562-e6c2-83e3-e6ff3b871493	Abonma-write	Abonma - spreminjanje	f
00030000-5562-e6c2-119b-ecaee16216e6	Alternacija-read	Alternacija - branje	f
00030000-5562-e6c2-315b-4d6f7da3034d	Alternacija-write	Alternacija - spreminjanje	f
00030000-5562-e6c2-8d04-13b235f6deb4	Arhivalija-read	Arhivalija - branje	f
00030000-5562-e6c2-177c-9dee590f01d9	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5562-e6c2-e710-d3bba1bd6e06	Besedilo-read	Besedilo - branje	f
00030000-5562-e6c2-677b-76205194cd86	Besedilo-write	Besedilo - spreminjanje	f
00030000-5562-e6c2-baae-f736058be680	DogodekIzven-read	DogodekIzven - branje	f
00030000-5562-e6c2-ac82-cd522e3d9e94	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5562-e6c2-f2b3-e1b65af22e4e	Dogodek-read	Dogodek - branje	f
00030000-5562-e6c2-e794-40421d7f1e3a	Dogodek-write	Dogodek - spreminjanje	f
00030000-5562-e6c2-6736-836ce42c8d48	Drzava-read	Drzava - branje	f
00030000-5562-e6c2-1789-e58e2f208df7	Drzava-write	Drzava - spreminjanje	f
00030000-5562-e6c2-7f1a-6c844ba4d9ae	Funkcija-read	Funkcija - branje	f
00030000-5562-e6c2-0b10-c03515afa7b9	Funkcija-write	Funkcija - spreminjanje	f
00030000-5562-e6c2-7c94-4398fc6ccb5f	Gostovanje-read	Gostovanje - branje	f
00030000-5562-e6c2-ef52-5bce596d3806	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5562-e6c2-821f-8f6492c6a029	Gostujoca-read	Gostujoca - branje	f
00030000-5562-e6c2-69dc-6667975b5ce1	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5562-e6c2-1f07-1e1cb8d74a6c	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5562-e6c2-2718-8eb531bd999f	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5562-e6c2-7f86-7516b5825e20	Kupec-read	Kupec - branje	f
00030000-5562-e6c2-6ab3-0adfe4a28062	Kupec-write	Kupec - spreminjanje	f
00030000-5562-e6c2-4afe-87fb47e3b84f	NacinPlacina-read	NacinPlacina - branje	f
00030000-5562-e6c2-d019-d295d642a8a8	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5562-e6c2-4124-d21df70bd874	Option-read	Option - branje	f
00030000-5562-e6c2-fd4d-2b4567f5d2ab	Option-write	Option - spreminjanje	f
00030000-5562-e6c2-948f-99227588bbbb	OptionValue-read	OptionValue - branje	f
00030000-5562-e6c2-9707-9b39d8d788b2	OptionValue-write	OptionValue - spreminjanje	f
00030000-5562-e6c2-f114-3d74f619244a	Oseba-read	Oseba - branje	f
00030000-5562-e6c2-5f0a-9d1751f5b4fe	Oseba-write	Oseba - spreminjanje	f
00030000-5562-e6c2-ddd3-f393ed588dc9	Permission-read	Permission - branje	f
00030000-5562-e6c2-fdf5-c7f3b938d86d	Permission-write	Permission - spreminjanje	f
00030000-5562-e6c2-fa7e-252b4f3dca01	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5562-e6c2-8d6d-b4bc3d7b17bf	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5562-e6c2-be7b-fd3c5c3bb960	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5562-e6c2-6a34-ba0d750a0bee	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5562-e6c2-0381-16bba4595b98	Pogodba-read	Pogodba - branje	f
00030000-5562-e6c2-31b5-6585127b6c09	Pogodba-write	Pogodba - spreminjanje	f
00030000-5562-e6c2-eccf-d64f4f9b766f	Popa-read	Popa - branje	f
00030000-5562-e6c2-a833-95801219e123	Popa-write	Popa - spreminjanje	f
00030000-5562-e6c2-318b-2a1afc2e3017	Posta-read	Posta - branje	f
00030000-5562-e6c2-6ca9-d118a2ce8094	Posta-write	Posta - spreminjanje	f
00030000-5562-e6c2-a0d4-92a5a9f48cc8	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5562-e6c2-8a64-bd30888030d3	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5562-e6c2-acd5-8536ca393208	PostniNaslov-read	PostniNaslov - branje	f
00030000-5562-e6c2-0689-4ceacb66c05a	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5562-e6c2-bc5b-f85b00fe98d9	Predstava-read	Predstava - branje	f
00030000-5562-e6c2-aa1b-0a4954bd5ffa	Predstava-write	Predstava - spreminjanje	f
00030000-5562-e6c2-02f9-3efc77e8e6bd	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5562-e6c2-736b-a67e517b3e53	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5562-e6c2-a0c5-22a45380ada8	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5562-e6c2-3a94-088471ebea49	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5562-e6c2-b4cf-dbdfa478a46a	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5562-e6c2-bc04-3cd54cc0c27b	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5562-e6c2-c80c-4f0683222f59	Prostor-read	Prostor - branje	f
00030000-5562-e6c2-e459-37a40e83f56d	Prostor-write	Prostor - spreminjanje	f
00030000-5562-e6c2-d686-1bb70416e8af	Racun-read	Racun - branje	f
00030000-5562-e6c2-4e11-9892d5bbb667	Racun-write	Racun - spreminjanje	f
00030000-5562-e6c2-7a3b-1758ed2367d1	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5562-e6c2-146a-c8bad548529b	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5562-e6c2-4eac-68786e8f0d8f	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5562-e6c2-1060-c05ce751c063	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5562-e6c2-514a-46ea54311251	Rekvizit-read	Rekvizit - branje	f
00030000-5562-e6c2-f5c5-dd3557453569	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5562-e6c2-c69f-871ce4dc8f86	Revizija-read	Revizija - branje	f
00030000-5562-e6c2-8f5a-617b7a39ac49	Revizija-write	Revizija - spreminjanje	f
00030000-5562-e6c2-5bc5-f5d7e50eae96	Rezervacija-read	Rezervacija - branje	f
00030000-5562-e6c2-bd36-caff5e156cd3	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5562-e6c2-4cb8-3412c92e8639	Role-read	Role - branje	f
00030000-5562-e6c2-c677-fd9f95e5662d	Role-write	Role - spreminjanje	f
00030000-5562-e6c2-00df-e56c4efc1fbc	SedezniRed-read	SedezniRed - branje	f
00030000-5562-e6c2-04c8-0b0831780436	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5562-e6c2-9640-123999e8bdd4	Sedez-read	Sedez - branje	f
00030000-5562-e6c2-7237-6e07a5af773f	Sedez-write	Sedez - spreminjanje	f
00030000-5562-e6c2-ede6-3a62fef01ebc	Sezona-read	Sezona - branje	f
00030000-5562-e6c2-b6c2-674d7aabe6cc	Sezona-write	Sezona - spreminjanje	f
00030000-5562-e6c2-ec37-297333fd3fba	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5562-e6c2-2262-1da8f553b3f6	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5562-e6c2-fa70-3272beea5297	Stevilcenje-read	Stevilcenje - branje	f
00030000-5562-e6c2-c4ca-0499ddb99c1d	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5562-e6c2-d6fe-ead77368dbf3	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5562-e6c2-ed2c-a868a3078a35	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5562-e6c2-8b66-5cead54b475b	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5562-e6c2-5674-f27f22d9202a	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5562-e6c2-6e2e-c52b4db997a9	Telefonska-read	Telefonska - branje	f
00030000-5562-e6c2-64d5-493034f29885	Telefonska-write	Telefonska - spreminjanje	f
00030000-5562-e6c2-4265-ece79d4147f0	TerminStoritve-read	TerminStoritve - branje	f
00030000-5562-e6c2-f39b-71eecbc5e1a0	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5562-e6c2-f49b-eebbafc83fbb	TipFunkcije-read	TipFunkcije - branje	f
00030000-5562-e6c2-22fc-38f7941ad841	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5562-e6c2-9296-80618b43d639	Trr-read	Trr - branje	f
00030000-5562-e6c2-440a-ca8270997184	Trr-write	Trr - spreminjanje	f
00030000-5562-e6c2-5a02-1af387270894	Uprizoritev-read	Uprizoritev - branje	f
00030000-5562-e6c2-6d3c-b3eaed9aa50c	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5562-e6c2-0827-0a49fef68820	User-read	User - branje	f
00030000-5562-e6c2-8722-67a5de204104	User-write	User - spreminjanje	f
00030000-5562-e6c2-5394-8bf95f0db307	Vaja-read	Vaja - branje	f
00030000-5562-e6c2-52b7-f6ec4cf30348	Vaja-write	Vaja - spreminjanje	f
00030000-5562-e6c2-5967-f85a43d070b3	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5562-e6c2-8f46-659d552790a5	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5562-e6c2-3131-048997de075d	Zaposlitev-read	Zaposlitev - branje	f
00030000-5562-e6c2-195b-5cdd0115dd21	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5562-e6c2-f8e1-2258df61114f	Zasedenost-read	Zasedenost - branje	f
00030000-5562-e6c2-0fce-eacf2fb7df1c	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5562-e6c2-d151-d099eca77e9c	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5562-e6c2-f708-147765f077cf	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5562-e6c2-0e3d-5ca7b3b0604c	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5562-e6c2-5075-e88a09c84c6d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2698 (class 0 OID 4832995)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5562-e6c2-6860-fedfeef4c21b	00030000-5562-e6c2-6736-836ce42c8d48
00020000-5562-e6c2-5423-1912b5335ec6	00030000-5562-e6c2-1789-e58e2f208df7
00020000-5562-e6c2-5423-1912b5335ec6	00030000-5562-e6c2-6736-836ce42c8d48
\.


--
-- TOC entry 2726 (class 0 OID 4833284)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2730 (class 0 OID 4833315)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2742 (class 0 OID 4833448)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2703 (class 0 OID 4833053)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5562-e6c3-b439-09701d2ce330	00040000-5562-e6c2-38f2-97686f8ee071	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5562-e6c3-b756-311f2958fb03	00040000-5562-e6c2-38f2-97686f8ee071	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2705 (class 0 OID 4833088)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5562-e6c1-6fc0-a228ddcea00f	8341	Adlešiči
00050000-5562-e6c1-7e92-bbbf44d7433c	5270	Ajdovščina
00050000-5562-e6c1-96e8-964e7a308a27	6280	Ankaran/Ancarano
00050000-5562-e6c1-d35f-aa6773ebdb09	9253	Apače
00050000-5562-e6c1-6baa-5900f6b1b82f	8253	Artiče
00050000-5562-e6c1-79ec-d27087e4b0a6	4275	Begunje na Gorenjskem
00050000-5562-e6c1-28cb-f2d4f9f03bc7	1382	Begunje pri Cerknici
00050000-5562-e6c1-51b9-8d348b4f0972	9231	Beltinci
00050000-5562-e6c1-d5c8-8f120a57aa7c	2234	Benedikt
00050000-5562-e6c1-79dd-12bb05a22af7	2345	Bistrica ob Dravi
00050000-5562-e6c1-adad-e6c13f59cc10	3256	Bistrica ob Sotli
00050000-5562-e6c1-d9f3-6bb738fd8e01	8259	Bizeljsko
00050000-5562-e6c1-59f7-1f0a27b3bfea	1223	Blagovica
00050000-5562-e6c1-1222-7a6fbcf0f427	8283	Blanca
00050000-5562-e6c1-cd7b-7cd8619a7a4c	4260	Bled
00050000-5562-e6c1-d3de-345620601a1e	4273	Blejska Dobrava
00050000-5562-e6c1-a2fa-4317bb7c3ea4	9265	Bodonci
00050000-5562-e6c1-01ec-50794b5fa758	9222	Bogojina
00050000-5562-e6c1-4c2c-d42e41f6cdd7	4263	Bohinjska Bela
00050000-5562-e6c1-7fd3-1ddd9d8b0892	4264	Bohinjska Bistrica
00050000-5562-e6c1-ac12-5bdb69961203	4265	Bohinjsko jezero
00050000-5562-e6c1-2fcb-0d7e29e4626d	1353	Borovnica
00050000-5562-e6c1-72e2-a267eb0a7167	8294	Boštanj
00050000-5562-e6c1-5a6c-349e13d23c69	5230	Bovec
00050000-5562-e6c1-cdc4-bcccde2380df	5295	Branik
00050000-5562-e6c1-7fd4-d038d0a6ec64	3314	Braslovče
00050000-5562-e6c1-1fdc-7fad0a4d50bc	5223	Breginj
00050000-5562-e6c1-2669-968d1c09fdd7	8280	Brestanica
00050000-5562-e6c1-9905-1d0b35ae537e	2354	Bresternica
00050000-5562-e6c1-b6ca-978133305286	4243	Brezje
00050000-5562-e6c1-3998-fb77243e507b	1351	Brezovica pri Ljubljani
00050000-5562-e6c1-6151-d86b208b044c	8250	Brežice
00050000-5562-e6c1-4968-ec7c31a55756	4210	Brnik - Aerodrom
00050000-5562-e6c1-5bd5-804e7326db2a	8321	Brusnice
00050000-5562-e6c1-beec-16d06d09656b	3255	Buče
00050000-5562-e6c1-3446-8706dafd91f9	8276	Bučka 
00050000-5562-e6c1-4371-00cb5626bb14	9261	Cankova
00050000-5562-e6c1-93e0-65698362eeda	3000	Celje 
00050000-5562-e6c1-4486-8e3fd9d3ebe2	3001	Celje - poštni predali
00050000-5562-e6c1-23bd-b6d3462c97cf	4207	Cerklje na Gorenjskem
00050000-5562-e6c1-b4e7-10d9c7d06d90	8263	Cerklje ob Krki
00050000-5562-e6c1-c0b6-5602028eb72b	1380	Cerknica
00050000-5562-e6c1-091c-0101f4e2b978	5282	Cerkno
00050000-5562-e6c1-bc96-fc1ddd507889	2236	Cerkvenjak
00050000-5562-e6c1-ea33-83590fffd495	2215	Ceršak
00050000-5562-e6c1-fe6f-e2c421cf20df	2326	Cirkovce
00050000-5562-e6c1-c1ab-726e653b8044	2282	Cirkulane
00050000-5562-e6c1-a450-3833a44e2e69	5273	Col
00050000-5562-e6c1-b72c-1bd812e873b9	8251	Čatež ob Savi
00050000-5562-e6c1-76e7-d450fb5f8bcc	1413	Čemšenik
00050000-5562-e6c1-b013-c82f562ab622	5253	Čepovan
00050000-5562-e6c1-f28a-edb83e8afa82	9232	Črenšovci
00050000-5562-e6c1-fb35-b1ac8df40dfa	2393	Črna na Koroškem
00050000-5562-e6c1-1f8c-7266728e58f0	6275	Črni Kal
00050000-5562-e6c1-bd91-869207336233	5274	Črni Vrh nad Idrijo
00050000-5562-e6c1-fb33-d3483af50848	5262	Črniče
00050000-5562-e6c1-f766-b46382d902b7	8340	Črnomelj
00050000-5562-e6c1-07d8-d1d5ded67cc7	6271	Dekani
00050000-5562-e6c1-de8a-76262c18766c	5210	Deskle
00050000-5562-e6c1-d803-a522e3564b11	2253	Destrnik
00050000-5562-e6c1-6203-fcc7c103ea6d	6215	Divača
00050000-5562-e6c1-88e2-b82fd554dcd5	1233	Dob
00050000-5562-e6c1-84bc-0533767fb122	3224	Dobje pri Planini
00050000-5562-e6c1-e620-ca62c5b21593	8257	Dobova
00050000-5562-e6c1-8988-bc577df64769	1423	Dobovec
00050000-5562-e6c1-16cb-531d351bd6ad	5263	Dobravlje
00050000-5562-e6c1-40e3-51e1cb08a229	3204	Dobrna
00050000-5562-e6c1-abb4-35e9e50f6eab	8211	Dobrnič
00050000-5562-e6c1-7bc7-22917241f2e5	1356	Dobrova
00050000-5562-e6c1-1479-cb55c21a299e	9223	Dobrovnik/Dobronak 
00050000-5562-e6c1-f743-6ae0f7ba53d5	5212	Dobrovo v Brdih
00050000-5562-e6c1-5c32-3505d5dc2ed3	1431	Dol pri Hrastniku
00050000-5562-e6c1-bb19-23d0f1d1f023	1262	Dol pri Ljubljani
00050000-5562-e6c1-3b4c-44acfa731bfa	1273	Dole pri Litiji
00050000-5562-e6c1-bf7c-668ec0150fb7	1331	Dolenja vas
00050000-5562-e6c1-9b52-f6ec4bd7eeb0	8350	Dolenjske Toplice
00050000-5562-e6c1-fb65-3f89bd97bfa4	1230	Domžale
00050000-5562-e6c1-470d-9ec574b7d49a	2252	Dornava
00050000-5562-e6c1-8c61-c6c882ad0d4a	5294	Dornberk
00050000-5562-e6c1-8921-0390052b0400	1319	Draga
00050000-5562-e6c1-6ad4-0a8b76a3a172	8343	Dragatuš
00050000-5562-e6c1-62bc-2e32c086e665	3222	Dramlje
00050000-5562-e6c1-4af2-5d3dfbd22b34	2370	Dravograd
00050000-5562-e6c1-6eb7-4a8081b3046d	4203	Duplje
00050000-5562-e6c1-f906-8023eccdc067	6221	Dutovlje
00050000-5562-e6c1-c2ad-30a652f8927e	8361	Dvor
00050000-5562-e6c1-60bc-0ee0f49ce143	2343	Fala
00050000-5562-e6c1-2e90-a36a0403ca20	9208	Fokovci
00050000-5562-e6c1-9070-edf04b89a162	2313	Fram
00050000-5562-e6c1-c185-2339662fa5d0	3213	Frankolovo
00050000-5562-e6c1-221a-838bf2be1ed7	1274	Gabrovka
00050000-5562-e6c1-9bee-cdf583d2a1ba	8254	Globoko
00050000-5562-e6c1-4543-c96cd4e47e09	5275	Godovič
00050000-5562-e6c1-a5e4-1d17661141fb	4204	Golnik
00050000-5562-e6c1-de2e-c39c45c4066f	3303	Gomilsko
00050000-5562-e6c1-92f7-911f4f4428a6	4224	Gorenja vas
00050000-5562-e6c1-8ee7-bd2295fff89e	3263	Gorica pri Slivnici
00050000-5562-e6c1-9c96-b19072b2e635	2272	Gorišnica
00050000-5562-e6c1-f5ac-a944003f9de3	9250	Gornja Radgona
00050000-5562-e6c1-4f7d-71a396030fa3	3342	Gornji Grad
00050000-5562-e6c1-383a-d72280a8e9a7	4282	Gozd Martuljek
00050000-5562-e6c1-ccbc-a73033dc0741	6272	Gračišče
00050000-5562-e6c1-b1b5-6cd58f84d84c	9264	Grad
00050000-5562-e6c1-eda9-cb61eb4f27ff	8332	Gradac
00050000-5562-e6c1-84ca-474df793b6ac	1384	Grahovo
00050000-5562-e6c1-2583-323b94abb1b5	5242	Grahovo ob Bači
00050000-5562-e6c1-59c7-d28a656bb202	5251	Grgar
00050000-5562-e6c1-ce13-db2f92734f35	3302	Griže
00050000-5562-e6c1-7bf9-2cf868dffcf7	3231	Grobelno
00050000-5562-e6c1-ab5c-91060f252e6a	1290	Grosuplje
00050000-5562-e6c1-814d-466b384bf94b	2288	Hajdina
00050000-5562-e6c1-f2ba-a3dbcd0807c6	8362	Hinje
00050000-5562-e6c1-ee6b-42d4c1112ede	2311	Hoče
00050000-5562-e6c1-c697-32d8718daf0e	9205	Hodoš/Hodos
00050000-5562-e6c1-e0e1-eb14a0ed81e6	1354	Horjul
00050000-5562-e6c1-4363-488386b988f1	1372	Hotedršica
00050000-5562-e6c1-f71a-78bcdde1dcd8	1430	Hrastnik
00050000-5562-e6c1-3a12-25594b9e043e	6225	Hruševje
00050000-5562-e6c1-c231-132ac20bf643	4276	Hrušica
00050000-5562-e6c1-4b4a-d9b9df9f41fa	5280	Idrija
00050000-5562-e6c1-a176-bf547ebe6f88	1292	Ig
00050000-5562-e6c1-4d03-de29bdd5cfdc	6250	Ilirska Bistrica
00050000-5562-e6c1-0b6f-35afe031ab2a	6251	Ilirska Bistrica-Trnovo
00050000-5562-e6c1-f599-0dad5da3a41f	1295	Ivančna Gorica
00050000-5562-e6c1-ac14-637cd5da9e5c	2259	Ivanjkovci
00050000-5562-e6c1-3836-eccfaf1f5eb7	1411	Izlake
00050000-5562-e6c1-4f01-77022d816339	6310	Izola/Isola
00050000-5562-e6c1-1bac-a75a3159599a	2222	Jakobski Dol
00050000-5562-e6c1-b53b-e26665c79d77	2221	Jarenina
00050000-5562-e6c1-cb04-03444d915919	6254	Jelšane
00050000-5562-e6c1-888c-bd90bc5f1fd8	4270	Jesenice
00050000-5562-e6c1-e75a-5522c9cdaafe	8261	Jesenice na Dolenjskem
00050000-5562-e6c1-596b-1cd6d2cb21cc	3273	Jurklošter
00050000-5562-e6c1-f83e-4ad09ac99983	2223	Jurovski Dol
00050000-5562-e6c1-8667-453d96442cf1	2256	Juršinci
00050000-5562-e6c1-b470-86fd1fecb6bf	5214	Kal nad Kanalom
00050000-5562-e6c1-f4a8-9af55d972a99	3233	Kalobje
00050000-5562-e6c1-7575-4078ea1bfc19	4246	Kamna Gorica
00050000-5562-e6c1-e1cb-b251a5cd6e49	2351	Kamnica
00050000-5562-e6c2-32a9-a2b7b3f90cd6	1241	Kamnik
00050000-5562-e6c2-58b1-f49fcfb632fc	5213	Kanal
00050000-5562-e6c2-7f01-7a74728c3c44	8258	Kapele
00050000-5562-e6c2-361d-b4f5f80b3d8f	2362	Kapla
00050000-5562-e6c2-8767-2750f75c6ced	2325	Kidričevo
00050000-5562-e6c2-a410-d25a4b7730d9	1412	Kisovec
00050000-5562-e6c2-5e13-79b9e10c5cda	6253	Knežak
00050000-5562-e6c2-423b-ea86cfbf5769	5222	Kobarid
00050000-5562-e6c2-e609-ad44da36cd40	9227	Kobilje
00050000-5562-e6c2-2daf-e1a875eddce2	1330	Kočevje
00050000-5562-e6c2-5a84-09e8e9ccef78	1338	Kočevska Reka
00050000-5562-e6c2-b466-8e4b11a3e1c2	2276	Kog
00050000-5562-e6c2-a0eb-38fd1183993d	5211	Kojsko
00050000-5562-e6c2-1809-8dac72e043bd	6223	Komen
00050000-5562-e6c2-05fe-8521ac01de40	1218	Komenda
00050000-5562-e6c2-3591-530a6d58baa1	6000	Koper/Capodistria 
00050000-5562-e6c2-f6a5-2ae5a8549cbe	6001	Koper/Capodistria - poštni predali
00050000-5562-e6c2-d37a-c76668fe9d93	8282	Koprivnica
00050000-5562-e6c2-0349-993ef674eeb4	5296	Kostanjevica na Krasu
00050000-5562-e6c2-170b-946403a73559	8311	Kostanjevica na Krki
00050000-5562-e6c2-d317-bc21c4ba3694	1336	Kostel
00050000-5562-e6c2-04c1-d76ff50bc49e	6256	Košana
00050000-5562-e6c2-e6f8-26300d307245	2394	Kotlje
00050000-5562-e6c2-51c1-966e9278dbd7	6240	Kozina
00050000-5562-e6c2-1241-db3238a5830b	3260	Kozje
00050000-5562-e6c2-26d0-54d0cead1a6e	4000	Kranj 
00050000-5562-e6c2-931e-769c816ab839	4001	Kranj - poštni predali
00050000-5562-e6c2-b64e-a05a4be5f17d	4280	Kranjska Gora
00050000-5562-e6c2-ecf4-b74462b07b15	1281	Kresnice
00050000-5562-e6c2-52d4-b285c82d132f	4294	Križe
00050000-5562-e6c2-500c-04b4d6f1edc4	9206	Križevci
00050000-5562-e6c2-04e0-acebce36709f	9242	Križevci pri Ljutomeru
00050000-5562-e6c2-8e3e-d66c0701c219	1301	Krka
00050000-5562-e6c2-445e-32c10e9c97d3	8296	Krmelj
00050000-5562-e6c2-0d76-3f61790965ec	4245	Kropa
00050000-5562-e6c2-bbf3-714f5b95c249	8262	Krška vas
00050000-5562-e6c2-4d2b-a2c17068892c	8270	Krško
00050000-5562-e6c2-c38d-97ceb101c76b	9263	Kuzma
00050000-5562-e6c2-0b10-af0e9a468447	2318	Laporje
00050000-5562-e6c2-14c0-397493598240	3270	Laško
00050000-5562-e6c2-0db8-0e7135b5f0fa	1219	Laze v Tuhinju
00050000-5562-e6c2-7908-e8ab97a127f6	2230	Lenart v Slovenskih goricah
00050000-5562-e6c2-53c5-12fc9ad7dce3	9220	Lendava/Lendva
00050000-5562-e6c2-66c8-392e662dbcae	4248	Lesce
00050000-5562-e6c2-0ae1-6856ed2933c6	3261	Lesično
00050000-5562-e6c2-aa50-a8504773a315	8273	Leskovec pri Krškem
00050000-5562-e6c2-4f4a-3ed153d7463d	2372	Libeliče
00050000-5562-e6c2-38ec-497d03ab8980	2341	Limbuš
00050000-5562-e6c2-50ba-96e438cd87db	1270	Litija
00050000-5562-e6c2-41bd-9ded550fdcb2	3202	Ljubečna
00050000-5562-e6c2-9eef-9c6cd66baf2f	1000	Ljubljana 
00050000-5562-e6c2-bf1d-96da87aa8175	1001	Ljubljana - poštni predali
00050000-5562-e6c2-e2b6-370f1fd9eb60	1231	Ljubljana - Črnuče
00050000-5562-e6c2-f64b-0a07a9bf0b84	1261	Ljubljana - Dobrunje
00050000-5562-e6c2-a623-af81c357ae9d	1260	Ljubljana - Polje
00050000-5562-e6c2-5760-ae46d6185a89	1210	Ljubljana - Šentvid
00050000-5562-e6c2-b9c9-19262b6b6f52	1211	Ljubljana - Šmartno
00050000-5562-e6c2-70e9-b5d1dd487aad	3333	Ljubno ob Savinji
00050000-5562-e6c2-0bbf-2e21272ae00b	9240	Ljutomer
00050000-5562-e6c2-da9e-9fdf73262676	3215	Loče
00050000-5562-e6c2-5572-8542d51a7a98	5231	Log pod Mangartom
00050000-5562-e6c2-fb17-902a85c35da0	1358	Log pri Brezovici
00050000-5562-e6c2-6e56-fa83a80fcb94	1370	Logatec
00050000-5562-e6c2-6523-a80513d47674	1371	Logatec
00050000-5562-e6c2-97da-e287a282f45b	1434	Loka pri Zidanem Mostu
00050000-5562-e6c2-0ecc-8ee71afcb9b3	3223	Loka pri Žusmu
00050000-5562-e6c2-52a6-260475ad9e69	6219	Lokev
00050000-5562-e6c2-3568-ece6f6e8445f	1318	Loški Potok
00050000-5562-e6c2-4439-3ce5dd281b2e	2324	Lovrenc na Dravskem polju
00050000-5562-e6c2-15d8-9651d8316586	2344	Lovrenc na Pohorju
00050000-5562-e6c2-ffbc-557b8b9b5717	3334	Luče
00050000-5562-e6c2-a67d-546aa92470c6	1225	Lukovica
00050000-5562-e6c2-360d-be7ca0a277c8	9202	Mačkovci
00050000-5562-e6c2-8f11-5e9966e53b57	2322	Majšperk
00050000-5562-e6c2-2440-a54f17326136	2321	Makole
00050000-5562-e6c2-b669-b1a9473780b0	9243	Mala Nedelja
00050000-5562-e6c2-ff91-9600e8abe39b	2229	Malečnik
00050000-5562-e6c2-fbab-3fe705bd98de	6273	Marezige
00050000-5562-e6c2-7b25-03791f721b47	2000	Maribor 
00050000-5562-e6c2-490e-0ccd4f441900	2001	Maribor - poštni predali
00050000-5562-e6c2-8a67-7d4cf4e00430	2206	Marjeta na Dravskem polju
00050000-5562-e6c2-6af2-63c8e0a62995	2281	Markovci
00050000-5562-e6c2-3126-97e69ed63085	9221	Martjanci
00050000-5562-e6c2-8b7e-efbe83557a6d	6242	Materija
00050000-5562-e6c2-bb45-fb84f89d22f2	4211	Mavčiče
00050000-5562-e6c2-f910-8283a8c754fc	1215	Medvode
00050000-5562-e6c2-58ba-2994a12f08f4	1234	Mengeš
00050000-5562-e6c2-6b33-165e87501192	8330	Metlika
00050000-5562-e6c2-1236-b81eeb5b0813	2392	Mežica
00050000-5562-e6c2-a736-7134117a4745	2204	Miklavž na Dravskem polju
00050000-5562-e6c2-5af3-c7881a9941cd	2275	Miklavž pri Ormožu
00050000-5562-e6c2-2985-80d628593d09	5291	Miren
00050000-5562-e6c2-30fa-b851e9fe0d67	8233	Mirna
00050000-5562-e6c2-041f-9acf66f74342	8216	Mirna Peč
00050000-5562-e6c2-fba0-7266dd2f8d6b	2382	Mislinja
00050000-5562-e6c2-9eac-986aa4573473	4281	Mojstrana
00050000-5562-e6c2-ec4d-d417e6e44aba	8230	Mokronog
00050000-5562-e6c2-820b-f8cf888b29c0	1251	Moravče
00050000-5562-e6c2-80ec-6b01be07e260	9226	Moravske Toplice
00050000-5562-e6c2-281f-7cea451ec57a	5216	Most na Soči
00050000-5562-e6c2-d2bb-fb12cb4fa72a	1221	Motnik
00050000-5562-e6c2-3cc4-1d613947d858	3330	Mozirje
00050000-5562-e6c2-4bcc-7904083e1810	9000	Murska Sobota 
00050000-5562-e6c2-474c-45b29bfc4719	9001	Murska Sobota - poštni predali
00050000-5562-e6c2-a46b-6d5cf4791048	2366	Muta
00050000-5562-e6c2-5a81-b5c7e0d5ee30	4202	Naklo
00050000-5562-e6c2-3a04-e24f1408bcec	3331	Nazarje
00050000-5562-e6c2-18bb-71922c3a1681	1357	Notranje Gorice
00050000-5562-e6c2-7607-7b21778d618b	3203	Nova Cerkev
00050000-5562-e6c2-8be5-e9da5cc9642a	5000	Nova Gorica 
00050000-5562-e6c2-dbf3-56d73cb08a32	5001	Nova Gorica - poštni predali
00050000-5562-e6c2-fe65-b855cb236c3c	1385	Nova vas
00050000-5562-e6c2-9ff3-8e9eb13879ab	8000	Novo mesto
00050000-5562-e6c2-658f-65b59c401d05	8001	Novo mesto - poštni predali
00050000-5562-e6c2-31f8-ac106632e00e	6243	Obrov
00050000-5562-e6c2-1aef-07f810104166	9233	Odranci
00050000-5562-e6c2-7357-744ce16a9678	2317	Oplotnica
00050000-5562-e6c2-6479-c576b9912b66	2312	Orehova vas
00050000-5562-e6c2-ea93-e294f00fb37f	2270	Ormož
00050000-5562-e6c2-f77c-ed1caeeaef4b	1316	Ortnek
00050000-5562-e6c2-ec27-c4c7cd97634d	1337	Osilnica
00050000-5562-e6c2-a158-6cc3e79dd9b2	8222	Otočec
00050000-5562-e6c2-3876-227e99dd72c1	2361	Ožbalt
00050000-5562-e6c2-d6c1-6883bfc58d34	2231	Pernica
00050000-5562-e6c2-f488-46c4aaab46e7	2211	Pesnica pri Mariboru
00050000-5562-e6c2-e940-e80a11795573	9203	Petrovci
00050000-5562-e6c2-e150-8038f47b6147	3301	Petrovče
00050000-5562-e6c2-66f8-a4cc5ce3ef05	6330	Piran/Pirano
00050000-5562-e6c2-671a-830d2e226bef	8255	Pišece
00050000-5562-e6c2-eb56-72def5825365	6257	Pivka
00050000-5562-e6c2-df69-e46695508a72	6232	Planina
00050000-5562-e6c2-1153-10313b7377ee	3225	Planina pri Sevnici
00050000-5562-e6c2-f49a-d48c166263c1	6276	Pobegi
00050000-5562-e6c2-a92e-89ef3946076a	8312	Podbočje
00050000-5562-e6c2-2cc1-ab342eed0d4d	5243	Podbrdo
00050000-5562-e6c2-1dc2-76ae6cbadfd3	3254	Podčetrtek
00050000-5562-e6c2-95cf-2a71040de530	2273	Podgorci
00050000-5562-e6c2-0b39-28fa0a2fd59a	6216	Podgorje
00050000-5562-e6c2-3d87-6fa3af9f2607	2381	Podgorje pri Slovenj Gradcu
00050000-5562-e6c2-e9af-a8f84140e1b9	6244	Podgrad
00050000-5562-e6c2-72ff-ea8abbf87a7d	1414	Podkum
00050000-5562-e6c2-aaaf-4e790757fadd	2286	Podlehnik
00050000-5562-e6c2-9cff-143f4aca4725	5272	Podnanos
00050000-5562-e6c2-bb03-3316bec619ce	4244	Podnart
00050000-5562-e6c2-beb0-75b94c3d51a9	3241	Podplat
00050000-5562-e6c2-fea6-0a02944a0072	3257	Podsreda
00050000-5562-e6c2-3ef4-e07580420ae3	2363	Podvelka
00050000-5562-e6c2-f681-72d313c72cfb	2208	Pohorje
00050000-5562-e6c2-d0ac-4efca2714adf	2257	Polenšak
00050000-5562-e6c2-a4ce-920816dbfd61	1355	Polhov Gradec
00050000-5562-e6c2-0b9a-d84f95be82d8	4223	Poljane nad Škofjo Loko
00050000-5562-e6c2-fe75-7b8c6d17c7c9	2319	Poljčane
00050000-5562-e6c2-6d29-7b83750de2ae	1272	Polšnik
00050000-5562-e6c2-d6f8-479b9459a922	3313	Polzela
00050000-5562-e6c2-777e-d35b40041690	3232	Ponikva
00050000-5562-e6c2-0e7c-d403e9774aaf	6320	Portorož/Portorose
00050000-5562-e6c2-f148-90a0603bed5b	6230	Postojna
00050000-5562-e6c2-1a62-bb656795a639	2331	Pragersko
00050000-5562-e6c2-4d79-fadebb8f78d0	3312	Prebold
00050000-5562-e6c2-9fb6-ecfcb2ff06dc	4205	Preddvor
00050000-5562-e6c2-752b-75bc8a284666	6255	Prem
00050000-5562-e6c2-40a3-c7f7ee462262	1352	Preserje
00050000-5562-e6c2-d88f-3244d935b8b5	6258	Prestranek
00050000-5562-e6c2-2952-644c0ff22921	2391	Prevalje
00050000-5562-e6c2-4c11-34611af47b1c	3262	Prevorje
00050000-5562-e6c2-a425-bbbb896afcc2	1276	Primskovo 
00050000-5562-e6c2-2f3f-ae5c3c2e482a	3253	Pristava pri Mestinju
00050000-5562-e6c2-e5ac-52c5fe94e9b8	9207	Prosenjakovci/Partosfalva
00050000-5562-e6c2-9d43-900188e767e6	5297	Prvačina
00050000-5562-e6c2-7afc-e6bdab3c5a51	2250	Ptuj
00050000-5562-e6c2-133d-92a0463ebdb6	2323	Ptujska Gora
00050000-5562-e6c2-c9ef-7417ca415de9	9201	Puconci
00050000-5562-e6c2-9a36-611dfd8272b5	2327	Rače
00050000-5562-e6c2-ae3e-ceb4748c2a4c	1433	Radeče
00050000-5562-e6c2-21ba-fb319999264f	9252	Radenci
00050000-5562-e6c2-5d40-d0927406e602	2360	Radlje ob Dravi
00050000-5562-e6c2-a603-814d553e6071	1235	Radomlje
00050000-5562-e6c2-94cf-96cdfb10abd5	4240	Radovljica
00050000-5562-e6c2-6523-1b535248de53	8274	Raka
00050000-5562-e6c2-07fa-7a0409d53b96	1381	Rakek
00050000-5562-e6c2-1aba-996171a6d8cd	4283	Rateče - Planica
00050000-5562-e6c2-e207-a741d420cc48	2390	Ravne na Koroškem
00050000-5562-e6c2-9494-9445f24443cd	9246	Razkrižje
00050000-5562-e6c2-5ba7-3f5b93e8a8f1	3332	Rečica ob Savinji
00050000-5562-e6c2-b7d8-286275dadb50	5292	Renče
00050000-5562-e6c2-310a-cee7152f13fc	1310	Ribnica
00050000-5562-e6c2-1acf-eb2b9b30982e	2364	Ribnica na Pohorju
00050000-5562-e6c2-70b0-ea448285e4fe	3272	Rimske Toplice
00050000-5562-e6c2-8341-69e96fc3fc36	1314	Rob
00050000-5562-e6c2-5cd4-b2c19a9d112c	5215	Ročinj
00050000-5562-e6c2-6b42-87a20214a9c4	3250	Rogaška Slatina
00050000-5562-e6c2-b515-b5e64cd905fb	9262	Rogašovci
00050000-5562-e6c2-718d-ed2f430450b2	3252	Rogatec
00050000-5562-e6c2-51c3-61d5dd52cc22	1373	Rovte
00050000-5562-e6c2-c61d-2c198377392c	2342	Ruše
00050000-5562-e6c2-9392-ea071b52ec21	1282	Sava
00050000-5562-e6c2-020a-b1ffdef3ba66	6333	Sečovlje/Sicciole
00050000-5562-e6c2-0675-eec1d08230d9	4227	Selca
00050000-5562-e6c2-158b-e786f81fd13f	2352	Selnica ob Dravi
00050000-5562-e6c2-a7bc-25d259eb91ef	8333	Semič
00050000-5562-e6c2-54c6-b71fbb75ec25	8281	Senovo
00050000-5562-e6c2-9d7c-a82b15098266	6224	Senožeče
00050000-5562-e6c2-ce8f-e81cfe9209d3	8290	Sevnica
00050000-5562-e6c2-08ff-0a58453710a8	6210	Sežana
00050000-5562-e6c2-9f63-ac3cc299e12d	2214	Sladki Vrh
00050000-5562-e6c2-0a8b-16947ec14106	5283	Slap ob Idrijci
00050000-5562-e6c2-9ecb-e5f382eb4c08	2380	Slovenj Gradec
00050000-5562-e6c2-7c7c-43522027cb5b	2310	Slovenska Bistrica
00050000-5562-e6c2-beec-c802507b6cc2	3210	Slovenske Konjice
00050000-5562-e6c2-e929-ee377319d766	1216	Smlednik
00050000-5562-e6c2-3188-251fe50d7076	5232	Soča
00050000-5562-e6c2-39a7-bd7865104e1a	1317	Sodražica
00050000-5562-e6c2-d6dd-1a3e07d35678	3335	Solčava
00050000-5562-e6c2-a8cd-dfb683132e9f	5250	Solkan
00050000-5562-e6c2-cb03-26553719273e	4229	Sorica
00050000-5562-e6c2-7c3d-b11a5223e87a	4225	Sovodenj
00050000-5562-e6c2-adb0-3e4d90bb3716	5281	Spodnja Idrija
00050000-5562-e6c2-528c-8f89aac526fa	2241	Spodnji Duplek
00050000-5562-e6c2-260e-a8433aa9c076	9245	Spodnji Ivanjci
00050000-5562-e6c2-70c9-77277cf2cfc7	2277	Središče ob Dravi
00050000-5562-e6c2-3231-bebf02fceecf	4267	Srednja vas v Bohinju
00050000-5562-e6c2-7142-1ae438aed3bf	8256	Sromlje 
00050000-5562-e6c2-649d-a915d20efaf2	5224	Srpenica
00050000-5562-e6c2-40f2-35b87414aa12	1242	Stahovica
00050000-5562-e6c2-fbab-e88bc14c2e4e	1332	Stara Cerkev
00050000-5562-e6c2-a656-0340d8f1c417	8342	Stari trg ob Kolpi
00050000-5562-e6c2-46c1-baa4949bada7	1386	Stari trg pri Ložu
00050000-5562-e6c2-4154-f83dfa7f8e96	2205	Starše
00050000-5562-e6c2-4d33-3bd8b8d21367	2289	Stoperce
00050000-5562-e6c2-6276-4b9016de4d95	8322	Stopiče
00050000-5562-e6c2-7cb0-dd187d0ed123	3206	Stranice
00050000-5562-e6c2-805d-a321a64f262c	8351	Straža
00050000-5562-e6c2-81b5-7f23ee5d08ae	1313	Struge
00050000-5562-e6c2-81de-fe36694df5d1	8293	Studenec
00050000-5562-e6c2-264a-d162f889e801	8331	Suhor
00050000-5562-e6c2-2447-251f1b8b4e89	2233	Sv. Ana v Slovenskih goricah
00050000-5562-e6c2-95af-c6639df6350c	2235	Sv. Trojica v Slovenskih goricah
00050000-5562-e6c2-31cf-8e1fefde38b8	2353	Sveti Duh na Ostrem Vrhu
00050000-5562-e6c2-648c-d2cd6d0306d4	9244	Sveti Jurij ob Ščavnici
00050000-5562-e6c2-e5bd-236e3dfc112c	3264	Sveti Štefan
00050000-5562-e6c2-3ed6-efed078cc55c	2258	Sveti Tomaž
00050000-5562-e6c2-d281-432ad3bd4abb	9204	Šalovci
00050000-5562-e6c2-95fa-c2ad6610132e	5261	Šempas
00050000-5562-e6c2-ce00-eebde6579aed	5290	Šempeter pri Gorici
00050000-5562-e6c2-c9a6-d6fa4561d26c	3311	Šempeter v Savinjski dolini
00050000-5562-e6c2-3478-ffa83502e6a9	4208	Šenčur
00050000-5562-e6c2-4d68-0eb12f32fa79	2212	Šentilj v Slovenskih goricah
00050000-5562-e6c2-a4b1-0ffdf01f2ee7	8297	Šentjanž
00050000-5562-e6c2-01b1-5bbb240167d4	2373	Šentjanž pri Dravogradu
00050000-5562-e6c2-fa8c-48c7544c3cd2	8310	Šentjernej
00050000-5562-e6c2-fe61-dcaade5af64a	3230	Šentjur
00050000-5562-e6c2-30bb-63f8db0ffb81	3271	Šentrupert
00050000-5562-e6c2-76ee-8a30f3263b7c	8232	Šentrupert
00050000-5562-e6c2-5ae0-110af9f7666c	1296	Šentvid pri Stični
00050000-5562-e6c2-53c0-8ba2d9c8d042	8275	Škocjan
00050000-5562-e6c2-38f3-bf4105f763d8	6281	Škofije
00050000-5562-e6c2-f5db-e97a310f0925	4220	Škofja Loka
00050000-5562-e6c2-b4c0-6590a7ab86a5	3211	Škofja vas
00050000-5562-e6c2-4441-e0451db13a4a	1291	Škofljica
00050000-5562-e6c2-6195-3a71123dde92	6274	Šmarje
00050000-5562-e6c2-7896-9aadee930c53	1293	Šmarje - Sap
00050000-5562-e6c2-54aa-ab0f73a81962	3240	Šmarje pri Jelšah
00050000-5562-e6c2-c85b-63b611bbae90	8220	Šmarješke Toplice
00050000-5562-e6c2-9529-21b43fdcc45d	2315	Šmartno na Pohorju
00050000-5562-e6c2-01bd-2f1cb46bc054	3341	Šmartno ob Dreti
00050000-5562-e6c2-5268-b92c681c65fa	3327	Šmartno ob Paki
00050000-5562-e6c2-6036-12e610b647d0	1275	Šmartno pri Litiji
00050000-5562-e6c2-43ba-c8200652c1d3	2383	Šmartno pri Slovenj Gradcu
00050000-5562-e6c2-26eb-0ad8b9f2d734	3201	Šmartno v Rožni dolini
00050000-5562-e6c2-36a6-b381df50f291	3325	Šoštanj
00050000-5562-e6c2-1a9a-111ed8501895	6222	Štanjel
00050000-5562-e6c2-0a8e-7987fdb1c697	3220	Štore
00050000-5562-e6c2-fea2-cc93782b8b79	3304	Tabor
00050000-5562-e6c2-6844-c4631165fc12	3221	Teharje
00050000-5562-e6c2-aab8-7e7cc4bcc38d	9251	Tišina
00050000-5562-e6c2-cd6d-06ece2e65084	5220	Tolmin
00050000-5562-e6c2-10b8-ca8c88987fdf	3326	Topolšica
00050000-5562-e6c2-ae44-a008205ccf2e	2371	Trbonje
00050000-5562-e6c2-3a5a-c8e1d12e67ca	1420	Trbovlje
00050000-5562-e6c2-a835-8bf1130d9a1e	8231	Trebelno 
00050000-5562-e6c2-d5b1-145f7d438f2b	8210	Trebnje
00050000-5562-e6c2-8f88-d94d7e5d7cb6	5252	Trnovo pri Gorici
00050000-5562-e6c2-dbcd-9ea7c9d92ac1	2254	Trnovska vas
00050000-5562-e6c2-457a-288becb8f15a	1222	Trojane
00050000-5562-e6c2-caa8-e9deabf99090	1236	Trzin
00050000-5562-e6c2-3795-b145ae9bbeb0	4290	Tržič
00050000-5562-e6c2-06ab-350096b0a173	8295	Tržišče
00050000-5562-e6c2-2f4c-3de19630e959	1311	Turjak
00050000-5562-e6c2-d14f-46c82b3f162e	9224	Turnišče
00050000-5562-e6c2-46c8-9ddcd8e90a2d	8323	Uršna sela
00050000-5562-e6c2-a693-8803306feb57	1252	Vače
00050000-5562-e6c2-4d3b-df210f15de33	3320	Velenje 
00050000-5562-e6c2-1955-30cec4c13a30	3322	Velenje - poštni predali
00050000-5562-e6c2-bbc4-901e6543843b	8212	Velika Loka
00050000-5562-e6c2-fba1-e292af36b5fa	2274	Velika Nedelja
00050000-5562-e6c2-439e-a6e17d9b4adf	9225	Velika Polana
00050000-5562-e6c2-4046-8aa546200ee1	1315	Velike Lašče
00050000-5562-e6c2-8a16-210a608cd1c4	8213	Veliki Gaber
00050000-5562-e6c2-7707-f5679306b647	9241	Veržej
00050000-5562-e6c2-b632-4c1a4a4bf4cd	1312	Videm - Dobrepolje
00050000-5562-e6c2-b03e-16bdd380f0e4	2284	Videm pri Ptuju
00050000-5562-e6c2-eb06-01d00086eba0	8344	Vinica
00050000-5562-e6c2-9fc5-4838d56f6f47	5271	Vipava
00050000-5562-e6c2-7616-8f57b02c3248	4212	Visoko
00050000-5562-e6c2-9295-0c7b2f235910	1294	Višnja Gora
00050000-5562-e6c2-58db-578bf5917ce3	3205	Vitanje
00050000-5562-e6c2-22a5-27f942c309c5	2255	Vitomarci
00050000-5562-e6c2-c8be-ca9398d208f4	1217	Vodice
00050000-5562-e6c2-4a08-3e37e9d067d5	3212	Vojnik\t
00050000-5562-e6c2-f5ce-73649dae1619	5293	Volčja Draga
00050000-5562-e6c2-b379-ed53348c2505	2232	Voličina
00050000-5562-e6c2-3770-278598a58986	3305	Vransko
00050000-5562-e6c2-4a43-7e6a39a9eb5c	6217	Vremski Britof
00050000-5562-e6c2-901c-8d840c4879b5	1360	Vrhnika
00050000-5562-e6c2-9431-424920773f96	2365	Vuhred
00050000-5562-e6c2-a826-8b40f9ebb1b4	2367	Vuzenica
00050000-5562-e6c2-f4d2-45b34e8fcc18	8292	Zabukovje 
00050000-5562-e6c2-4458-5a023c0789e4	1410	Zagorje ob Savi
00050000-5562-e6c2-a934-88d97b4bd953	1303	Zagradec
00050000-5562-e6c2-e111-86e81067a04b	2283	Zavrč
00050000-5562-e6c2-4e17-d237427f891b	8272	Zdole 
00050000-5562-e6c2-bf43-26aaf19e2a28	4201	Zgornja Besnica
00050000-5562-e6c2-c0ce-e9b8826bdef5	2242	Zgornja Korena
00050000-5562-e6c2-7a2f-c293cfcc77a5	2201	Zgornja Kungota
00050000-5562-e6c2-614e-5b6d77f33fb7	2316	Zgornja Ložnica
00050000-5562-e6c2-8a54-a62a07122df9	2314	Zgornja Polskava
00050000-5562-e6c2-7665-a393789d9128	2213	Zgornja Velka
00050000-5562-e6c2-2a3a-3d68ef3f9548	4247	Zgornje Gorje
00050000-5562-e6c2-aef4-92305f50e0ff	4206	Zgornje Jezersko
00050000-5562-e6c2-4618-2e9c5309de2c	2285	Zgornji Leskovec
00050000-5562-e6c2-a50c-65659ff22daa	1432	Zidani Most
00050000-5562-e6c2-f966-8c560fd13cbd	3214	Zreče
00050000-5562-e6c2-1353-40a4a2cc29ff	4209	Žabnica
00050000-5562-e6c2-68a3-14940561ed28	3310	Žalec
00050000-5562-e6c2-521e-5ad88adacb42	4228	Železniki
00050000-5562-e6c2-a1d2-c8e60dcd178d	2287	Žetale
00050000-5562-e6c2-9fa2-c5a9883ec25f	4226	Žiri
00050000-5562-e6c2-8637-6e5232dc89ba	4274	Žirovnica
00050000-5562-e6c2-0d99-1c96a5a0c907	8360	Žužemberk
\.


--
-- TOC entry 2722 (class 0 OID 4833258)
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
-- TOC entry 2704 (class 0 OID 4833073)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2710 (class 0 OID 4833151)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2724 (class 0 OID 4833270)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2737 (class 0 OID 4833390)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2741 (class 0 OID 4833441)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2728 (class 0 OID 4833299)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2720 (class 0 OID 4833243)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2719 (class 0 OID 4833233)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2740 (class 0 OID 4833430)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2735 (class 0 OID 4833367)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2693 (class 0 OID 4832947)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5562-e6c2-c37e-742a41057976	00010000-5562-e6c2-77d9-e0e6b6566ee0	2015-05-25 11:09:24	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO.QCXqIt0e7h2qjFiVg1GdDu6EtmTHQu";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2759 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2729 (class 0 OID 4833309)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2697 (class 0 OID 4832985)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5562-e6c2-abe3-0a7b69048b89	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5562-e6c2-e13f-b2e9d9823a29	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5562-e6c2-6860-fedfeef4c21b	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5562-e6c2-cded-6fa26364c39c	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5562-e6c2-cb3a-b596c9441faf	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5562-e6c2-5423-1912b5335ec6	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2695 (class 0 OID 4832969)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5562-e6c2-c37e-742a41057976	00020000-5562-e6c2-cded-6fa26364c39c
00010000-5562-e6c2-77d9-e0e6b6566ee0	00020000-5562-e6c2-cded-6fa26364c39c
\.


--
-- TOC entry 2731 (class 0 OID 4833323)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2723 (class 0 OID 4833264)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2717 (class 0 OID 4833214)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2749 (class 0 OID 4833536)
-- Dependencies: 230
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5562-e6c2-0b1d-d1172ec03a26	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5562-e6c2-289b-992f774a5fc4	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5562-e6c2-ca27-9c98efe4e2a4	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5562-e6c2-26a8-e040d0ac94d3	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5562-e6c2-38dd-afd9cc8011a5	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2748 (class 0 OID 4833529)
-- Dependencies: 229
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5562-e6c2-b848-520743386466	00000000-5562-e6c2-26a8-e040d0ac94d3	popa
00000000-5562-e6c2-bba7-bcc7631353e3	00000000-5562-e6c2-26a8-e040d0ac94d3	oseba
00000000-5562-e6c2-68b0-29917467b611	00000000-5562-e6c2-289b-992f774a5fc4	prostor
00000000-5562-e6c2-193c-3b54514862c3	00000000-5562-e6c2-26a8-e040d0ac94d3	besedilo
00000000-5562-e6c2-b7ed-72bb70edb3dc	00000000-5562-e6c2-26a8-e040d0ac94d3	uprizoritev
00000000-5562-e6c2-a8d7-c2369c474984	00000000-5562-e6c2-26a8-e040d0ac94d3	funkcija
00000000-5562-e6c2-dadd-f6bff31da5b4	00000000-5562-e6c2-26a8-e040d0ac94d3	tipfunkcije
\.


--
-- TOC entry 2747 (class 0 OID 4833524)
-- Dependencies: 228
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2736 (class 0 OID 4833377)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2760 (class 0 OID 0)
-- Dependencies: 231
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('strosekuprizoritve_id_seq', 1, false);


--
-- TOC entry 2702 (class 0 OID 4833045)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2718 (class 0 OID 4833220)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2739 (class 0 OID 4833419)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5562-e6c2-ce1e-6ab5279de4e2	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5562-e6c2-d468-3838e3f1f359	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5562-e6c2-e681-f3c042299c9e	Baletnik ali plesalec	Baletniki in plesalci	\N	Baletnica ali plesalka	igralec
000f0000-5562-e6c2-d7ae-dfef6e03ec0e	Avtor	Avtorji	\N	Avtorka	umetnik
000f0000-5562-e6c2-50d0-9dea7fdd8f37	Režiser	Režiserji	\N	Režiserka	umetnik
000f0000-5562-e6c2-e4ff-1f72177fc5b3	Scenograf	Scenografi	\N	Scenografka	tehnik
000f0000-5562-e6c2-200a-dcd28c4ba93e	Kostumograf	Kostumografi	\N	Kostumografinja	tehnik
000f0000-5562-e6c2-582f-5367244ee1b3	Oblikovalec maske	Oblikovalci maske	\N	Oblikovalka maske	tehnik
000f0000-5562-e6c2-b17e-994cac58b924	Avtor glasbe	Avtorji glasbe	\N	Avtorica glasbe	umetnik
000f0000-5562-e6c2-e6e6-ca85d4e6bbc5	Oblikovalec svetlobe	Oblikovalci svetlobe	\N	Oblikovalka svetlobe	tehnik
000f0000-5562-e6c2-1dd1-d276e5ac3b4c	Koreograf	Koreografi	\N	Koreografinja	umetnik
000f0000-5562-e6c2-8cdb-7ff7c42cd4bd	Dramaturg	Dramaturgi	\N	Dramaturginja	umetnik
000f0000-5562-e6c2-d2a1-d14cb3645f55	Lektorj	Lektorji	\N	Lektorica	umetnik
000f0000-5562-e6c2-ebb1-e76d6e913f21	Prevajalec	Prevajalci	\N	Prevajalka	umetnik
000f0000-5562-e6c2-7463-453f29bfa0da	Oblikovalec videa	Oblikovalci videa	\N	Oblikovalka videa	umetnik
000f0000-5562-e6c2-3ff5-f6f47e06129b	Intermedijski ustvarjalec	Intermedijski ustvarjalci	\N	Intermedijska ustvarjalka	umetnik
\.


--
-- TOC entry 2707 (class 0 OID 4833108)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2694 (class 0 OID 4832956)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5562-e6c2-77d9-e0e6b6566ee0	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROKArvtQX9RpeYhOL9Q/roTI4x9oBO//S	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5562-e6c2-c37e-742a41057976	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2744 (class 0 OID 4833474)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
\.


--
-- TOC entry 2712 (class 0 OID 4833166)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2727 (class 0 OID 4833291)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2734 (class 0 OID 4833359)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2714 (class 0 OID 4833198)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2743 (class 0 OID 4833464)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2733 (class 0 OID 4833349)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2315 (class 2606 OID 4833010)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 4833518)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2485 (class 2606 OID 4833508)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 4833418)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 4833188)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 4833213)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2348 (class 2606 OID 4833134)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 4833345)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 4833164)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 4833207)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 4833148)
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
-- TOC entry 2406 (class 2606 OID 4833256)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 4833283)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 4833106)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 4833019)
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
-- TOC entry 2322 (class 2606 OID 4833042)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2313 (class 2606 OID 4832999)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2306 (class 2606 OID 4832984)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 4833289)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 4833322)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 4833459)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2330 (class 2606 OID 4833070)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 4833094)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 4833262)
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
-- TOC entry 2336 (class 2606 OID 4833084)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2361 (class 2606 OID 4833155)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 4833274)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 4833402)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 4833446)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 4833306)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 4833247)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 4833238)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 4833440)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 4833374)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 4832955)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 4833313)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 4832973)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2308 (class 2606 OID 4832993)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 4833331)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2412 (class 2606 OID 4833269)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2387 (class 2606 OID 4833219)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 4833542)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 4833533)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 4833528)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 4833387)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 4833050)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 4833229)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 4833429)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 4833119)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 4832968)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 4833489)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2367 (class 2606 OID 4833173)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 4833297)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 4833365)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 4833202)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 4833473)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 4833358)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 1259 OID 4833195)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2453 (class 1259 OID 4833388)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2454 (class 1259 OID 4833389)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2328 (class 1259 OID 4833072)
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
-- TOC entry 2419 (class 1259 OID 4833290)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2413 (class 1259 OID 4833276)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2414 (class 1259 OID 4833275)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2365 (class 1259 OID 4833174)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2441 (class 1259 OID 4833348)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2442 (class 1259 OID 4833346)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2443 (class 1259 OID 4833347)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2353 (class 1259 OID 4833150)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2354 (class 1259 OID 4833149)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2470 (class 1259 OID 4833461)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2471 (class 1259 OID 4833462)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2472 (class 1259 OID 4833463)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2478 (class 1259 OID 4833493)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2479 (class 1259 OID 4833490)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2480 (class 1259 OID 4833492)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2481 (class 1259 OID 4833491)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2343 (class 1259 OID 4833121)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2344 (class 1259 OID 4833120)
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
-- TOC entry 2320 (class 1259 OID 4833044)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2429 (class 1259 OID 4833314)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2383 (class 1259 OID 4833208)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2310 (class 1259 OID 4833000)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2311 (class 1259 OID 4833001)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2434 (class 1259 OID 4833334)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2435 (class 1259 OID 4833333)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2436 (class 1259 OID 4833332)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2357 (class 1259 OID 4833156)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2358 (class 1259 OID 4833158)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2359 (class 1259 OID 4833157)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2497 (class 1259 OID 4833535)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2393 (class 1259 OID 4833242)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2394 (class 1259 OID 4833240)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2395 (class 1259 OID 4833239)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2396 (class 1259 OID 4833241)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2301 (class 1259 OID 4832974)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 4832975)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2422 (class 1259 OID 4833298)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2408 (class 1259 OID 4833263)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2449 (class 1259 OID 4833375)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2450 (class 1259 OID 4833376)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2332 (class 1259 OID 4833086)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2333 (class 1259 OID 4833085)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2334 (class 1259 OID 4833087)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2457 (class 1259 OID 4833403)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2458 (class 1259 OID 4833404)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2490 (class 1259 OID 4833521)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2491 (class 1259 OID 4833520)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2492 (class 1259 OID 4833523)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2493 (class 1259 OID 4833519)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2494 (class 1259 OID 4833522)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2446 (class 1259 OID 4833366)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2399 (class 1259 OID 4833251)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2400 (class 1259 OID 4833250)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2401 (class 1259 OID 4833248)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2402 (class 1259 OID 4833249)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2284 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2486 (class 1259 OID 4833510)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2487 (class 1259 OID 4833509)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2364 (class 1259 OID 4833165)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2316 (class 1259 OID 4833021)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2317 (class 1259 OID 4833020)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2324 (class 1259 OID 4833051)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2325 (class 1259 OID 4833052)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2388 (class 1259 OID 4833232)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2389 (class 1259 OID 4833231)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2390 (class 1259 OID 4833230)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2371 (class 1259 OID 4833197)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2372 (class 1259 OID 4833193)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2373 (class 1259 OID 4833190)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2374 (class 1259 OID 4833191)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2375 (class 1259 OID 4833189)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2376 (class 1259 OID 4833194)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2377 (class 1259 OID 4833192)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2331 (class 1259 OID 4833071)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2349 (class 1259 OID 4833135)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2350 (class 1259 OID 4833137)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2351 (class 1259 OID 4833136)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2352 (class 1259 OID 4833138)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2407 (class 1259 OID 4833257)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2475 (class 1259 OID 4833460)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2323 (class 1259 OID 4833043)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2503 (class 1259 OID 4833543)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2342 (class 1259 OID 4833107)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2500 (class 1259 OID 4833534)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2427 (class 1259 OID 4833308)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2428 (class 1259 OID 4833307)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2287 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2339 (class 1259 OID 4833095)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 4833447)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2309 (class 1259 OID 4832994)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2378 (class 1259 OID 4833196)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2529 (class 2606 OID 4833681)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2532 (class 2606 OID 4833666)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2531 (class 2606 OID 4833671)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2527 (class 2606 OID 4833691)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2533 (class 2606 OID 4833661)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2528 (class 2606 OID 4833686)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2530 (class 2606 OID 4833676)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2563 (class 2606 OID 4833836)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2562 (class 2606 OID 4833841)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2514 (class 2606 OID 4833596)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2550 (class 2606 OID 4833776)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2548 (class 2606 OID 4833771)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2549 (class 2606 OID 4833766)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2526 (class 2606 OID 4833656)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2556 (class 2606 OID 4833816)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2558 (class 2606 OID 4833806)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2557 (class 2606 OID 4833811)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2520 (class 2606 OID 4833631)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2521 (class 2606 OID 4833626)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2546 (class 2606 OID 4833756)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2569 (class 2606 OID 4833861)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2568 (class 2606 OID 4833866)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2567 (class 2606 OID 4833871)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2570 (class 2606 OID 4833891)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2573 (class 2606 OID 4833876)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2571 (class 2606 OID 4833886)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2572 (class 2606 OID 4833881)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2518 (class 2606 OID 4833621)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2519 (class 2606 OID 4833616)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2510 (class 2606 OID 4833581)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2511 (class 2606 OID 4833576)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2552 (class 2606 OID 4833786)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2534 (class 2606 OID 4833696)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2507 (class 2606 OID 4833556)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2506 (class 2606 OID 4833561)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2553 (class 2606 OID 4833801)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2554 (class 2606 OID 4833796)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2555 (class 2606 OID 4833791)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2524 (class 2606 OID 4833636)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2522 (class 2606 OID 4833646)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2523 (class 2606 OID 4833641)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2581 (class 2606 OID 4833931)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2538 (class 2606 OID 4833731)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2540 (class 2606 OID 4833721)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2541 (class 2606 OID 4833716)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2539 (class 2606 OID 4833726)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2505 (class 2606 OID 4833546)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2504 (class 2606 OID 4833551)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2551 (class 2606 OID 4833781)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2547 (class 2606 OID 4833761)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2561 (class 2606 OID 4833826)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2560 (class 2606 OID 4833831)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2516 (class 2606 OID 4833606)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2517 (class 2606 OID 4833601)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2515 (class 2606 OID 4833611)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2565 (class 2606 OID 4833846)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2564 (class 2606 OID 4833851)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2578 (class 2606 OID 4833916)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2579 (class 2606 OID 4833911)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2576 (class 2606 OID 4833926)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2580 (class 2606 OID 4833906)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2577 (class 2606 OID 4833921)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2559 (class 2606 OID 4833821)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2542 (class 2606 OID 4833751)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2543 (class 2606 OID 4833746)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2545 (class 2606 OID 4833736)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2544 (class 2606 OID 4833741)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2574 (class 2606 OID 4833901)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2575 (class 2606 OID 4833896)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2525 (class 2606 OID 4833651)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2566 (class 2606 OID 4833856)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2508 (class 2606 OID 4833571)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2509 (class 2606 OID 4833566)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2513 (class 2606 OID 4833586)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2512 (class 2606 OID 4833591)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2535 (class 2606 OID 4833711)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2536 (class 2606 OID 4833706)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2537 (class 2606 OID 4833701)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-25 11:09:24 CEST

--
-- PostgreSQL database dump complete
--

