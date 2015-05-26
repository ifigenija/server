--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-26 11:01:10 CEST

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
-- TOC entry 180 (class 1259 OID 5037417)
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
-- TOC entry 227 (class 1259 OID 5037927)
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
-- TOC entry 226 (class 1259 OID 5037910)
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
-- TOC entry 219 (class 1259 OID 5037821)
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
-- TOC entry 194 (class 1259 OID 5037591)
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
-- TOC entry 197 (class 1259 OID 5037625)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 5037538)
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
-- TOC entry 213 (class 1259 OID 5037751)
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
-- TOC entry 192 (class 1259 OID 5037575)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 196 (class 1259 OID 5037619)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 5037555)
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
-- TOC entry 202 (class 1259 OID 5037668)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 5037693)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 5037512)
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
-- TOC entry 181 (class 1259 OID 5037426)
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
-- TOC entry 182 (class 1259 OID 5037437)
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
-- TOC entry 177 (class 1259 OID 5037391)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 5037410)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 5037700)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 5037731)
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
-- TOC entry 223 (class 1259 OID 5037864)
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
-- TOC entry 184 (class 1259 OID 5037469)
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
-- TOC entry 186 (class 1259 OID 5037504)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 5037674)
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
-- TOC entry 185 (class 1259 OID 5037489)
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
-- TOC entry 191 (class 1259 OID 5037567)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 5037686)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 5037806)
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
-- TOC entry 222 (class 1259 OID 5037857)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 5037715)
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
-- TOC entry 201 (class 1259 OID 5037659)
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
-- TOC entry 200 (class 1259 OID 5037649)
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
-- TOC entry 221 (class 1259 OID 5037846)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 5037783)
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
-- TOC entry 174 (class 1259 OID 5037362)
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
-- TOC entry 173 (class 1259 OID 5037360)
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
-- TOC entry 210 (class 1259 OID 5037725)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 5037400)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 5037384)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 5037739)
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
-- TOC entry 204 (class 1259 OID 5037680)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 5037630)
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
-- TOC entry 230 (class 1259 OID 5037952)
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
-- TOC entry 229 (class 1259 OID 5037945)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 5037940)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 5037793)
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
-- TOC entry 231 (class 1259 OID 5037960)
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE strosekuprizoritve_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 183 (class 1259 OID 5037461)
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
-- TOC entry 199 (class 1259 OID 5037636)
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
-- TOC entry 220 (class 1259 OID 5037835)
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
-- TOC entry 188 (class 1259 OID 5037524)
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
-- TOC entry 175 (class 1259 OID 5037371)
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
-- TOC entry 225 (class 1259 OID 5037890)
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
-- TOC entry 193 (class 1259 OID 5037582)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 5037707)
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
-- TOC entry 215 (class 1259 OID 5037775)
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
-- TOC entry 195 (class 1259 OID 5037614)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 5037880)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 5037765)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2146 (class 2604 OID 5037365)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2700 (class 0 OID 5037417)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2747 (class 0 OID 5037927)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
\.


--
-- TOC entry 2746 (class 0 OID 5037910)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2739 (class 0 OID 5037821)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-5564-3655-64ac-18f8cd04ae5c	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-5564-3655-6842-0fcb57c28b23	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-5564-3655-15ff-89e266f0625f	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 2714 (class 0 OID 5037591)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2717 (class 0 OID 5037625)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2709 (class 0 OID 5037538)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5564-3654-5180-86535db6e322	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5564-3654-b2a0-2364dd23b47e	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5564-3654-7042-03bce8294b01	AL	ALB	008	Albania 	Albanija	\N
00040000-5564-3654-786c-fde5afb77bf6	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5564-3654-b904-a10809a04270	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5564-3654-4876-e754e10a3c45	AD	AND	020	Andorra 	Andora	\N
00040000-5564-3654-31c2-8152860045a5	AO	AGO	024	Angola 	Angola	\N
00040000-5564-3654-13ce-389d8c8b4eaa	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5564-3654-742f-7f358db1be3f	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5564-3654-36e6-6aae3681139c	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5564-3654-708f-52f41716abaf	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5564-3654-96c1-11421d5a8684	AM	ARM	051	Armenia 	Armenija	\N
00040000-5564-3654-179f-9965bec62b16	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5564-3654-84fb-3c69fe260d4f	AU	AUS	036	Australia 	Avstralija	\N
00040000-5564-3654-fecc-85fcc9e672c8	AT	AUT	040	Austria 	Avstrija	\N
00040000-5564-3654-2916-44ebd24ad32e	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5564-3654-d7ce-e5b1cf43c26c	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5564-3654-9f45-d215986dc7cc	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5564-3654-0608-d7091228561b	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5564-3654-ebf8-40d4b3112adf	BB	BRB	052	Barbados 	Barbados	\N
00040000-5564-3654-894c-2e2e72591f9f	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5564-3654-5932-af7151326c35	BE	BEL	056	Belgium 	Belgija	\N
00040000-5564-3654-922b-b2c73f0940a4	BZ	BLZ	084	Belize 	Belize	\N
00040000-5564-3654-88a0-3f71b678170a	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5564-3654-8117-7c9711502711	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5564-3654-6837-d5861407ab1f	BT	BTN	064	Bhutan 	Butan	\N
00040000-5564-3654-3b8c-3dc2708480b4	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5564-3654-de94-008a83735e33	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5564-3654-1ffd-e3e1c0fc6983	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5564-3654-ce55-7e730685340d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5564-3654-957f-10f782360252	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5564-3654-d122-05015b0dc6c7	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5564-3654-6a39-c191ac61a211	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5564-3654-08b7-b85d0a002e76	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5564-3654-f41c-21bbb293642e	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5564-3654-7d74-57a8302131e5	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5564-3654-8568-4f1ba1b29766	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5564-3654-0987-2f2db17ff653	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5564-3654-e844-bb499d761fc7	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5564-3654-c5c5-70300b33958e	CA	CAN	124	Canada 	Kanada	\N
00040000-5564-3654-4e60-9e15863c9d90	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5564-3654-a165-7da45a833218	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5564-3654-688e-891d2eaa9afa	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5564-3654-dab8-4a13d4106ba1	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5564-3654-1f4f-14c1d54f2797	CL	CHL	152	Chile 	Čile	\N
00040000-5564-3654-82c3-f8c719202d5e	CN	CHN	156	China 	Kitajska	\N
00040000-5564-3654-09a4-77c5b5d3ee17	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5564-3654-f711-d8cb9064ede2	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5564-3654-ba2b-8a7424431db1	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5564-3654-29ae-475a360b54e5	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5564-3654-195c-ed7a729febfd	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5564-3654-778c-c3b61f883090	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5564-3654-4774-55de137d8f46	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5564-3654-5458-83d29e8cbfe9	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5564-3654-6425-095a1d8c2e70	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5564-3654-a9a4-2e5fb70990c2	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5564-3654-aad4-c59654ba7e08	CU	CUB	192	Cuba 	Kuba	\N
00040000-5564-3654-43bf-1f0e9f93042c	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5564-3654-4d8d-bf397491e2d8	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5564-3654-26fe-81594c26a4ac	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5564-3654-bdad-adeceee02827	DK	DNK	208	Denmark 	Danska	\N
00040000-5564-3654-e973-a14e44506b5e	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5564-3654-bdf2-7ae95e572d9e	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5564-3654-c6fa-c0c3b509683a	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5564-3654-e1d3-b3eb44def82d	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5564-3654-9318-fda4e0754303	EG	EGY	818	Egypt 	Egipt	\N
00040000-5564-3654-0262-a5a057cc899f	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5564-3654-48bd-91b4a348ca83	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5564-3654-f2d9-7c7fa12d7bf1	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5564-3654-51ff-6bf267b28d0b	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5564-3654-ee7e-ac321f82e9c1	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5564-3654-2270-3b1410d2aa53	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5564-3654-9655-5ae95d96cd02	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5564-3654-ccb6-465c3e59bfd2	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5564-3654-6d0f-212860c1a421	FI	FIN	246	Finland 	Finska	\N
00040000-5564-3654-208a-a78aac738ab7	FR	FRA	250	France 	Francija	\N
00040000-5564-3654-5a78-a8963cdb4289	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5564-3654-75d2-87e55c498d58	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5564-3654-6697-e0dfcf84b313	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5564-3654-b281-e93a660bc045	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5564-3654-59c0-38863a3aaac4	GA	GAB	266	Gabon 	Gabon	\N
00040000-5564-3654-547e-6e8166eb006f	GM	GMB	270	Gambia 	Gambija	\N
00040000-5564-3654-c0cb-4f7a9f0e6e4a	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5564-3654-bf4c-38fd678a097d	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5564-3654-6043-bb08d5eef639	GH	GHA	288	Ghana 	Gana	\N
00040000-5564-3654-826e-e6c5b6e06bc6	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5564-3654-5853-9126d0270820	GR	GRC	300	Greece 	Grčija	\N
00040000-5564-3654-0ba0-71fe214ad21c	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5564-3654-067e-e25305db0506	GD	GRD	308	Grenada 	Grenada	\N
00040000-5564-3654-11df-551443e31e35	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5564-3654-5f16-500f07457a0e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5564-3654-7b09-b541b23e56d8	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5564-3654-45b9-e5e0ef080736	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5564-3654-8e3d-bd0a6049163a	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5564-3654-351f-3466465c6cf3	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5564-3654-baaa-b0f66995fdc9	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5564-3654-a82f-1d511ebbbbc2	HT	HTI	332	Haiti 	Haiti	\N
00040000-5564-3654-c410-27c26d79f942	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5564-3654-766e-913267c67a25	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5564-3654-1980-bbb8c4a37e95	HN	HND	340	Honduras 	Honduras	\N
00040000-5564-3654-a94a-0848e34f0258	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5564-3654-ad98-c2024fd2a252	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5564-3654-c99f-1416a93d648c	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5564-3654-605b-ae79319342eb	IN	IND	356	India 	Indija	\N
00040000-5564-3654-22c2-6d5f3d9d91df	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5564-3654-bc96-6c1c5468f128	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5564-3654-227b-31fa0b54a2d8	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5564-3654-57e3-22e733b8c317	IE	IRL	372	Ireland 	Irska	\N
00040000-5564-3654-52b9-b80f6ee2cd08	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5564-3654-5e67-3d728c58cc5d	IL	ISR	376	Israel 	Izrael	\N
00040000-5564-3654-e8f5-366c1ac92827	IT	ITA	380	Italy 	Italija	\N
00040000-5564-3654-0a50-85a11bbe81e1	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5564-3654-6b96-d471120606b8	JP	JPN	392	Japan 	Japonska	\N
00040000-5564-3654-3104-68f7ab8c4480	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5564-3654-d924-16ac444ed070	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5564-3654-bc8e-137161c563e1	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5564-3654-a4a6-f5cc65615c68	KE	KEN	404	Kenya 	Kenija	\N
00040000-5564-3654-b991-ecd4c429db6d	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5564-3654-4d68-3ab605ee169c	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5564-3654-7c9d-5ed663afc4b3	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5564-3654-f732-47eb88fe211b	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5564-3654-febf-c3349246372c	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5564-3654-618f-b12464eb63da	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5564-3654-3877-66fc76fce4ab	LV	LVA	428	Latvia 	Latvija	\N
00040000-5564-3654-8092-c0aae25eecdc	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5564-3654-0161-d75253b0668c	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5564-3654-1b8b-62f8c3088705	LR	LBR	430	Liberia 	Liberija	\N
00040000-5564-3654-f9cf-f29068fba809	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5564-3654-f886-20a487bc5b7e	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5564-3654-ab93-dd6548b4dd93	LT	LTU	440	Lithuania 	Litva	\N
00040000-5564-3654-d913-76286a44e206	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5564-3654-38bd-552291bf9e9a	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5564-3654-3c3c-88d1305d841b	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5564-3654-8660-73d6b4a6b543	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5564-3654-4b93-810cb893b6e8	MW	MWI	454	Malawi 	Malavi	\N
00040000-5564-3654-8aa4-4fdde7e697d8	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5564-3654-e711-45b3f840ce3d	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5564-3654-3d0c-d955f9aced1c	ML	MLI	466	Mali 	Mali	\N
00040000-5564-3654-8a93-cf2fc5b4eece	MT	MLT	470	Malta 	Malta	\N
00040000-5564-3654-76c9-71a824665507	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5564-3654-de10-300f8663b1b5	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5564-3654-dada-aca65931b2dd	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5564-3654-8e00-ca1b227967af	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5564-3654-d545-1611e8bc61a6	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5564-3654-c833-745435ff2c8a	MX	MEX	484	Mexico 	Mehika	\N
00040000-5564-3654-0425-5b39291bf83b	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5564-3654-bb82-6b1284ca27b5	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5564-3654-060f-0c06b8d9b7b8	MC	MCO	492	Monaco 	Monako	\N
00040000-5564-3654-e4f0-a96029889f9f	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5564-3654-1b73-55ede529a9f4	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5564-3654-6e2d-bfae25d8d53b	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5564-3654-1b0e-2ed76c80994a	MA	MAR	504	Morocco 	Maroko	\N
00040000-5564-3654-7020-c70da0bd1873	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5564-3654-7467-e6b4b9d7b501	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5564-3654-5f24-39e8c8b7c84e	NA	NAM	516	Namibia 	Namibija	\N
00040000-5564-3654-a687-c135df40150f	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5564-3654-a9fc-15a83d821138	NP	NPL	524	Nepal 	Nepal	\N
00040000-5564-3654-0ffc-6b2d0527bb72	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5564-3654-e1a8-6caf1dbacd59	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5564-3654-2103-fc363479a76f	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5564-3654-92ac-9f721924e1b3	NE	NER	562	Niger 	Niger 	\N
00040000-5564-3654-6e6f-e85fc96f5096	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5564-3654-fd0f-43c8becc82f5	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5564-3654-631f-b2cd6722a24e	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5564-3654-2454-1d2617658356	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5564-3654-c303-ffac918fcc9a	NO	NOR	578	Norway 	Norveška	\N
00040000-5564-3654-2f4a-e6310642d90f	OM	OMN	512	Oman 	Oman	\N
00040000-5564-3654-466e-c5d417333c64	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5564-3654-d372-ecf217ae85f8	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5564-3654-e0fe-320c2f689dd8	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5564-3654-dac4-05708ae5b7bf	PA	PAN	591	Panama 	Panama	\N
00040000-5564-3654-5a83-b8c0a05f363b	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5564-3654-9c4c-30b3e9cbac11	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5564-3654-23b7-4dc941896477	PE	PER	604	Peru 	Peru	\N
00040000-5564-3654-33aa-edbe29357e96	PH	PHL	608	Philippines 	Filipini	\N
00040000-5564-3654-c269-f2107cb48848	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5564-3654-8b33-ea6c610c5659	PL	POL	616	Poland 	Poljska	\N
00040000-5564-3654-b909-14f8f1606ef6	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5564-3654-01a0-83731fce27f0	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5564-3654-9ef5-e7f5fb31c19c	QA	QAT	634	Qatar 	Katar	\N
00040000-5564-3654-0d22-71cc6be215d7	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5564-3654-7189-daa180558bfa	RO	ROU	642	Romania 	Romunija	\N
00040000-5564-3654-843c-4dc4fc719412	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5564-3654-ae7d-9f8d0b15bade	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5564-3654-cb83-da2043085d01	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5564-3654-5bff-2c2d2173f6c9	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5564-3654-c3c4-b2155a711758	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5564-3654-9405-7a94c96aa12e	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5564-3654-baa1-6da52f84a90c	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5564-3654-8509-01bc08e841b7	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5564-3654-41d8-49b640ebeb8e	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5564-3654-1490-ae629831bddf	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5564-3654-9f04-8357db542334	SM	SMR	674	San Marino 	San Marino	\N
00040000-5564-3654-928d-134027285813	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5564-3654-648f-659dcbcfa205	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5564-3654-a30c-d2c906949dca	SN	SEN	686	Senegal 	Senegal	\N
00040000-5564-3654-47be-6da5fb8445a1	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5564-3654-b05f-7011d99e85f4	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5564-3654-7338-8ada0a4af1cd	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5564-3654-ec09-cfb546b9ff00	SG	SGP	702	Singapore 	Singapur	\N
00040000-5564-3654-3a08-fbcd54b52a4e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5564-3654-58c6-709d1bd2695d	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5564-3654-675c-0cad91570bff	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5564-3654-9dde-e86136ddf11c	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5564-3654-a088-c6a21f8e2a61	SO	SOM	706	Somalia 	Somalija	\N
00040000-5564-3654-06b4-5cd1896a03b0	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5564-3654-36b0-3a7669baa31e	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5564-3654-91f1-7aa0ff11b413	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5564-3654-5237-ffe774a5712e	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5564-3654-4582-0da900b5dcf1	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5564-3654-298b-3b8926d2e232	SD	SDN	729	Sudan 	Sudan	\N
00040000-5564-3654-61be-a57be4acdc44	SR	SUR	740	Suriname 	Surinam	\N
00040000-5564-3654-8029-48e6afee384a	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5564-3654-1801-d42e43ea47cb	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5564-3654-2b87-16c8b66bc35d	SE	SWE	752	Sweden 	Švedska	\N
00040000-5564-3654-2992-1124e7d3c8f2	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5564-3654-a4af-9127951e2902	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5564-3654-c1bb-f8c3d0d77cce	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5564-3654-630f-34f5bc48b74e	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5564-3654-a848-46ffe9a3db66	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5564-3654-be12-7ec76461cc33	TH	THA	764	Thailand 	Tajska	\N
00040000-5564-3654-2526-ba988537ad2e	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5564-3654-c7de-66bb37826e7d	TG	TGO	768	Togo 	Togo	\N
00040000-5564-3654-f6e3-94f81a122d56	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5564-3654-ba37-f7429051de16	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5564-3654-3f24-0fd08f4bfca6	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5564-3654-722d-b419522c535a	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5564-3654-9221-0721068d4d6f	TR	TUR	792	Turkey 	Turčija	\N
00040000-5564-3654-10c2-d1ff38f45a73	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5564-3654-7337-11746cb53371	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5564-3654-3211-a23d0d2c848c	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5564-3654-2aca-b220896893eb	UG	UGA	800	Uganda 	Uganda	\N
00040000-5564-3654-aab1-511631d30969	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5564-3654-a5ff-ffe8030e50ce	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5564-3654-d939-ae3bdfc0c3e6	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5564-3654-dfac-0c1fea293c5f	US	USA	840	United States 	Združene države Amerike	\N
00040000-5564-3654-78ea-c2241ae03aac	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5564-3654-70ce-7fbc503c34e5	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5564-3654-f6d2-bc2241417c7c	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5564-3654-495d-1c7b6c01e7be	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5564-3654-23a2-109453421a93	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5564-3654-e05f-534e7cc3c0fd	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5564-3654-c524-c433f0b6f0e0	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5564-3654-404f-913a649498f6	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5564-3654-9049-a82e956c7dce	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5564-3654-aec5-ffcc46718783	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5564-3654-fe08-d3c44f360008	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5564-3654-0411-f14e5840bda9	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5564-3654-0ba7-5ce06c2d5413	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2733 (class 0 OID 5037751)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj) FROM stdin;
\.


--
-- TOC entry 2712 (class 0 OID 5037575)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2716 (class 0 OID 5037619)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2710 (class 0 OID 5037555)
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
-- TOC entry 2722 (class 0 OID 5037668)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2726 (class 0 OID 5037693)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2707 (class 0 OID 5037512)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5564-3654-c544-2f59e861caaa	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5564-3654-b72d-35433230aafd	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5564-3654-a82f-d63127e2dc07	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5564-3654-e20e-a7230ae007e1	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5564-3654-9277-6f1e05c8bc4f	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5564-3655-5c36-9ab72817ff8d	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5564-3655-3afb-0d716eb90f51	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5564-3655-da77-a0f36610bbb7	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5564-3655-ddaf-4d8c11c493fe	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5564-3655-66ce-6d0aac8091af	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5564-3655-1cd8-3e4902a29c80	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5564-3655-fb29-8a989ba8d88d	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5564-3655-7cb1-53e6b435fc5b	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5564-3655-5230-e8972cb81a0f	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5564-3655-67f4-0a5735f3ea0b	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2701 (class 0 OID 5037426)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5564-3654-93fe-9895d667c5e1	00000000-5564-3654-9277-6f1e05c8bc4f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5564-3655-882c-9e6b8b1593e9	00000000-5564-3654-9277-6f1e05c8bc4f	00010000-5564-3654-8d90-ea7a951afca6	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5564-3655-b357-6b6c11416fb2	00000000-5564-3655-5c36-9ab72817ff8d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2702 (class 0 OID 5037437)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5564-3655-cbed-465d06a2796a	\N	\N	0001	g.	Janez	Novak	a	Peter	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5564-3655-2bc8-045bea32c31a	\N	\N	0002	dr.	Anton	Horvat	b			anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5564-3655-0dc2-a20d7aefd631	\N	\N	0003		Ivan	Kovačič	c			ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5564-3655-83c5-6576755a497d	\N	\N	0004	prof.	Jožef	Krajnc	d		Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5564-3655-bba1-5280c3f6930a	\N	\N	0005		Marko	Zupančič	e			marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5564-3655-2d07-2316effaeb0f	\N	\N	0006	ga.	Marija	Kovač	f			marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5564-3655-b83d-b68c4d9a2a7f	\N	\N	0007	ga.	Ana	Potočnik	g			ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5564-3655-7941-243de8341f8e	\N	\N	0008	ga.	Maja	Mlakar	h			maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5564-3655-3c93-2e7ec5cfc093	\N	\N	0009		Irena	Kos	i			irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5564-3655-0193-372a5b90ef0a	\N	\N	0010		Mojca	Vidmar	J			mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
\.


--
-- TOC entry 2692 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2697 (class 0 OID 5037391)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5564-3654-9fde-12d742103f8f	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5564-3654-63bb-a46e82e61445	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5564-3654-3ede-93c5ef4f5fbe	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5564-3654-9759-bc328c7750a6	Abonma-read	Abonma - branje	f
00030000-5564-3654-1f37-03fa70c6ae7a	Abonma-write	Abonma - spreminjanje	f
00030000-5564-3654-0890-6f744e36df61	Alternacija-read	Alternacija - branje	f
00030000-5564-3654-caef-59ec3d892c99	Alternacija-write	Alternacija - spreminjanje	f
00030000-5564-3654-dbb9-167a6f673adf	Arhivalija-read	Arhivalija - branje	f
00030000-5564-3654-ee44-2f9282c62b0d	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5564-3654-3794-ea9d3d3851a0	Besedilo-read	Besedilo - branje	f
00030000-5564-3654-d88b-0daa98a4432b	Besedilo-write	Besedilo - spreminjanje	f
00030000-5564-3654-f02b-0352421baf40	DogodekIzven-read	DogodekIzven - branje	f
00030000-5564-3654-ece5-383ddc216e67	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5564-3654-0df7-59595dbcc454	Dogodek-read	Dogodek - branje	f
00030000-5564-3654-e19a-0b5b5da84171	Dogodek-write	Dogodek - spreminjanje	f
00030000-5564-3654-119e-eb097eec54ab	Drzava-read	Drzava - branje	f
00030000-5564-3654-eced-d1edf4ffb867	Drzava-write	Drzava - spreminjanje	f
00030000-5564-3654-53a8-15cf46da3e49	Funkcija-read	Funkcija - branje	f
00030000-5564-3654-7417-a16679eaf3e6	Funkcija-write	Funkcija - spreminjanje	f
00030000-5564-3654-ca16-4539d5148741	Gostovanje-read	Gostovanje - branje	f
00030000-5564-3654-24fb-220b95a32332	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5564-3654-32de-e060b7911f34	Gostujoca-read	Gostujoca - branje	f
00030000-5564-3654-ef9e-cbe6b6241a68	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5564-3654-b5b8-2412db399b38	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5564-3654-dd80-bc8680de3106	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5564-3654-052a-91662f70263d	Kupec-read	Kupec - branje	f
00030000-5564-3654-66f9-eccd38baa4d6	Kupec-write	Kupec - spreminjanje	f
00030000-5564-3654-37d8-ec667a2ae1de	NacinPlacina-read	NacinPlacina - branje	f
00030000-5564-3654-0350-384fac71bb7d	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5564-3654-a9d3-718e23158da8	Option-read	Option - branje	f
00030000-5564-3654-ae08-8dd19b1b9abc	Option-write	Option - spreminjanje	f
00030000-5564-3654-53f2-dbf3a28e21a1	OptionValue-read	OptionValue - branje	f
00030000-5564-3654-691e-0d13f85b6b8e	OptionValue-write	OptionValue - spreminjanje	f
00030000-5564-3654-8bea-7e0f9bd9977e	Oseba-read	Oseba - branje	f
00030000-5564-3654-02a3-c13ed67db2e0	Oseba-write	Oseba - spreminjanje	f
00030000-5564-3654-5390-9f397bdd347c	Permission-read	Permission - branje	f
00030000-5564-3654-ca9e-bbe4e002fa5d	Permission-write	Permission - spreminjanje	f
00030000-5564-3654-c4cd-89c6f00d674d	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5564-3654-a767-e556d0a6ecf2	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5564-3654-44f7-5ac92af64bd5	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5564-3654-3865-f8ebf08332db	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5564-3654-cfda-4fad5adb07b3	Pogodba-read	Pogodba - branje	f
00030000-5564-3654-4a0d-44a0e91baec7	Pogodba-write	Pogodba - spreminjanje	f
00030000-5564-3654-c88c-29d4dba8655e	Popa-read	Popa - branje	f
00030000-5564-3654-2343-3dab3f3c4eae	Popa-write	Popa - spreminjanje	f
00030000-5564-3654-df7c-226901546f42	Posta-read	Posta - branje	f
00030000-5564-3654-91c3-7525fbd359d6	Posta-write	Posta - spreminjanje	f
00030000-5564-3654-d6c9-39162fc148d3	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5564-3654-ed13-e907fbeb7b35	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5564-3654-00d1-66543ef66b15	PostniNaslov-read	PostniNaslov - branje	f
00030000-5564-3654-0752-bb0c55cebd87	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5564-3654-0d93-a0d2575406d5	Predstava-read	Predstava - branje	f
00030000-5564-3654-bbc1-284f771df7b0	Predstava-write	Predstava - spreminjanje	f
00030000-5564-3654-5106-39713718f239	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5564-3654-2d04-4008cc17117d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5564-3654-0cf0-f6e3ac8ceb04	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5564-3654-1e37-6a16ae6d5678	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5564-3654-28c0-743da81e8c0f	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5564-3654-3661-3b454a6c3a34	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5564-3654-8816-af9565e3c535	Prostor-read	Prostor - branje	f
00030000-5564-3654-7d28-9f0f7108560c	Prostor-write	Prostor - spreminjanje	f
00030000-5564-3654-48aa-8b2f4e1cbb50	Racun-read	Racun - branje	f
00030000-5564-3654-05b6-8bd14946bb57	Racun-write	Racun - spreminjanje	f
00030000-5564-3654-2ba5-3b6d48150ae1	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5564-3654-0806-9e77f1c13712	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5564-3654-efb9-87b4fd504ff1	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5564-3654-1f41-35bb22429f19	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5564-3654-a45e-6d13183ec7c9	Rekvizit-read	Rekvizit - branje	f
00030000-5564-3654-be55-f549f19b65ab	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5564-3654-7794-7216a84f03d6	Revizija-read	Revizija - branje	f
00030000-5564-3654-dc23-66550742217b	Revizija-write	Revizija - spreminjanje	f
00030000-5564-3654-6bdc-b4e128129745	Rezervacija-read	Rezervacija - branje	f
00030000-5564-3654-b7bc-81fcc46538e7	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5564-3654-47c7-0d8eadd660bf	Role-read	Role - branje	f
00030000-5564-3654-2eee-03c6a551eb2c	Role-write	Role - spreminjanje	f
00030000-5564-3654-be58-adf58c035305	SedezniRed-read	SedezniRed - branje	f
00030000-5564-3654-a981-ee84ff233a85	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5564-3654-e8ab-6c1c66099282	Sedez-read	Sedez - branje	f
00030000-5564-3654-e998-87ac4c0ce11f	Sedez-write	Sedez - spreminjanje	f
00030000-5564-3654-fbbb-888bd66c05e5	Sezona-read	Sezona - branje	f
00030000-5564-3654-beec-eb3c974e5a77	Sezona-write	Sezona - spreminjanje	f
00030000-5564-3654-3aa8-4fe288356f0e	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5564-3654-f7ef-66a994613875	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5564-3654-8bfa-f852b981c2eb	Stevilcenje-read	Stevilcenje - branje	f
00030000-5564-3654-0e40-e9f53d7e93ea	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5564-3654-7aa1-2b98a0cf2f8a	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5564-3654-13e5-e7f8a0b3a58b	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5564-3654-8dd1-1e8be9e45949	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5564-3654-f16f-e6dbdb8c779c	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5564-3654-bbd9-918177d3ed3b	Telefonska-read	Telefonska - branje	f
00030000-5564-3654-2805-fc0fecfee38d	Telefonska-write	Telefonska - spreminjanje	f
00030000-5564-3654-10ac-04a64912eea4	TerminStoritve-read	TerminStoritve - branje	f
00030000-5564-3654-ad7c-297028151e4a	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5564-3654-b42b-1708243253dd	TipFunkcije-read	TipFunkcije - branje	f
00030000-5564-3654-678e-ac4e1b1dfee9	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5564-3654-da9a-33d795fb26ff	Trr-read	Trr - branje	f
00030000-5564-3654-4354-0412ad85474b	Trr-write	Trr - spreminjanje	f
00030000-5564-3654-9a3a-3db844a980fa	Uprizoritev-read	Uprizoritev - branje	f
00030000-5564-3654-bc2d-02dac4e56bbb	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5564-3654-c8d7-e8ffe5fe6074	User-read	User - branje	f
00030000-5564-3654-2af5-ce473ad5adee	User-write	User - spreminjanje	f
00030000-5564-3654-c3de-d90a64ac4887	Vaja-read	Vaja - branje	f
00030000-5564-3654-873d-6a5e81f3b5fb	Vaja-write	Vaja - spreminjanje	f
00030000-5564-3654-44e3-0fd2417bb37d	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5564-3654-8803-5cd077b24594	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5564-3654-2f06-524b33f00b74	Zaposlitev-read	Zaposlitev - branje	f
00030000-5564-3654-a98d-03e2fb382aa4	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5564-3654-c472-54d0462af8d6	Zasedenost-read	Zasedenost - branje	f
00030000-5564-3654-e7dd-1ac187ef424b	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5564-3654-a3f6-8ef84b9436fe	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5564-3654-e678-9510e4a46b59	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5564-3654-74b9-c38c91c7556d	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5564-3654-d4c2-f7b1071e499f	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2699 (class 0 OID 5037410)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5564-3654-918d-6abb2425c200	00030000-5564-3654-119e-eb097eec54ab
00020000-5564-3654-3056-64a06292966d	00030000-5564-3654-eced-d1edf4ffb867
00020000-5564-3654-3056-64a06292966d	00030000-5564-3654-119e-eb097eec54ab
\.


--
-- TOC entry 2727 (class 0 OID 5037700)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2731 (class 0 OID 5037731)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2743 (class 0 OID 5037864)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2704 (class 0 OID 5037469)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5564-3655-5532-34b7a5d5ad37	00040000-5564-3654-5180-86535db6e322	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5564-3655-d4a2-6d9c431ecddb	00040000-5564-3654-5180-86535db6e322	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2706 (class 0 OID 5037504)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5564-3654-35f4-b5ad4d37eb20	8341	Adlešiči
00050000-5564-3654-20ad-7428c8529289	5270	Ajdovščina
00050000-5564-3654-8cdf-f114cf14e938	6280	Ankaran/Ancarano
00050000-5564-3654-a3ac-3bca077c67fd	9253	Apače
00050000-5564-3654-2d7f-43f47f2b11b2	8253	Artiče
00050000-5564-3654-3c91-1aab8b2cb451	4275	Begunje na Gorenjskem
00050000-5564-3654-229b-1cd959d64673	1382	Begunje pri Cerknici
00050000-5564-3654-0826-b56b6deea26e	9231	Beltinci
00050000-5564-3654-0e18-74a370854c3b	2234	Benedikt
00050000-5564-3654-124b-c722a5e160bf	2345	Bistrica ob Dravi
00050000-5564-3654-1ac2-823d3253384c	3256	Bistrica ob Sotli
00050000-5564-3654-c8f4-4e2ae87a641c	8259	Bizeljsko
00050000-5564-3654-0bdd-32479b1d087d	1223	Blagovica
00050000-5564-3654-7d96-c73f77dec206	8283	Blanca
00050000-5564-3654-0bb7-fe5b8ba5a260	4260	Bled
00050000-5564-3654-1ab8-15bdd3484802	4273	Blejska Dobrava
00050000-5564-3654-7e86-486bf9133ed6	9265	Bodonci
00050000-5564-3654-a11b-487e8ce17929	9222	Bogojina
00050000-5564-3654-000d-685748a6adf9	4263	Bohinjska Bela
00050000-5564-3654-bcf3-f495423e02ad	4264	Bohinjska Bistrica
00050000-5564-3654-09ba-c12dcb0725cc	4265	Bohinjsko jezero
00050000-5564-3654-b868-d20c26018810	1353	Borovnica
00050000-5564-3654-33c7-598f48be97f7	8294	Boštanj
00050000-5564-3654-0d69-43ada6d6e9ff	5230	Bovec
00050000-5564-3654-62fe-d74aeadedfea	5295	Branik
00050000-5564-3654-11bb-905e26224007	3314	Braslovče
00050000-5564-3654-5014-d98cd2332ed2	5223	Breginj
00050000-5564-3654-1a67-a4d46abc1b48	8280	Brestanica
00050000-5564-3654-0840-3e558e099c73	2354	Bresternica
00050000-5564-3654-92d4-de18e4b4c12a	4243	Brezje
00050000-5564-3654-5d0b-8568fed5a6aa	1351	Brezovica pri Ljubljani
00050000-5564-3654-d9ff-abf0571a9921	8250	Brežice
00050000-5564-3654-ab7c-a0b3ed4de8e9	4210	Brnik - Aerodrom
00050000-5564-3654-36ab-8ad502e24c1c	8321	Brusnice
00050000-5564-3654-0c60-04aad5cb26ad	3255	Buče
00050000-5564-3654-c6e6-6764c8925c82	8276	Bučka 
00050000-5564-3654-e34f-8d143baebfa7	9261	Cankova
00050000-5564-3654-dc55-ada557165e04	3000	Celje 
00050000-5564-3654-4deb-4f191d209f6d	3001	Celje - poštni predali
00050000-5564-3654-b0e2-7dc80af21b1f	4207	Cerklje na Gorenjskem
00050000-5564-3654-9011-efd66bfd3207	8263	Cerklje ob Krki
00050000-5564-3654-a82e-c05063a53aca	1380	Cerknica
00050000-5564-3654-eff9-10d63ad96720	5282	Cerkno
00050000-5564-3654-c46c-d35a4f3ff427	2236	Cerkvenjak
00050000-5564-3654-c83c-d9f3a1d31c33	2215	Ceršak
00050000-5564-3654-48e0-e84f6d87f7ef	2326	Cirkovce
00050000-5564-3654-611b-f3c22c8d403f	2282	Cirkulane
00050000-5564-3654-8fca-0387a18e10e4	5273	Col
00050000-5564-3654-097e-baeec069f224	8251	Čatež ob Savi
00050000-5564-3654-2870-8f8413b57fb0	1413	Čemšenik
00050000-5564-3654-aa47-bc55bcfd48bc	5253	Čepovan
00050000-5564-3654-27e4-b192e8f03375	9232	Črenšovci
00050000-5564-3654-debc-f333704d47e3	2393	Črna na Koroškem
00050000-5564-3654-93c0-4e84020ef765	6275	Črni Kal
00050000-5564-3654-7b1c-2bdaef7ac582	5274	Črni Vrh nad Idrijo
00050000-5564-3654-ccec-bec0aef729f1	5262	Črniče
00050000-5564-3654-68d9-b7be25b66e73	8340	Črnomelj
00050000-5564-3654-dce1-d0fd7fe1aa6b	6271	Dekani
00050000-5564-3654-5517-3a38f045fe40	5210	Deskle
00050000-5564-3654-caf4-520a3b27ab75	2253	Destrnik
00050000-5564-3654-f242-fc6e7d1405e5	6215	Divača
00050000-5564-3654-32cc-c98b73f52e72	1233	Dob
00050000-5564-3654-41cc-fd026c428eb7	3224	Dobje pri Planini
00050000-5564-3654-0b2d-ebd8db2b0326	8257	Dobova
00050000-5564-3654-d2e8-695e15cb2d59	1423	Dobovec
00050000-5564-3654-6bdc-4c9e2db2214c	5263	Dobravlje
00050000-5564-3654-0ed9-146c060fde43	3204	Dobrna
00050000-5564-3654-956a-7b5ad494cabe	8211	Dobrnič
00050000-5564-3654-3c5a-d9189ce05f17	1356	Dobrova
00050000-5564-3654-90c5-b46620945907	9223	Dobrovnik/Dobronak 
00050000-5564-3654-6e48-463dd25fa0cf	5212	Dobrovo v Brdih
00050000-5564-3654-8bb8-acb292857ecc	1431	Dol pri Hrastniku
00050000-5564-3654-aa69-bb7d2aebefb2	1262	Dol pri Ljubljani
00050000-5564-3654-0eb8-aed4776b6a01	1273	Dole pri Litiji
00050000-5564-3654-a648-9e69cdcba074	1331	Dolenja vas
00050000-5564-3654-ca45-d4a7a4f0c067	8350	Dolenjske Toplice
00050000-5564-3654-866f-e6ecb52f9436	1230	Domžale
00050000-5564-3654-9cca-b6abc40bd816	2252	Dornava
00050000-5564-3654-9e49-8c44121f4219	5294	Dornberk
00050000-5564-3654-b0f6-2cd7df9c6eb2	1319	Draga
00050000-5564-3654-4436-e1e2b1d01692	8343	Dragatuš
00050000-5564-3654-e555-603a8728f883	3222	Dramlje
00050000-5564-3654-b7f7-4dea02c3a51b	2370	Dravograd
00050000-5564-3654-f1ed-fff23951f2fb	4203	Duplje
00050000-5564-3654-850e-7380b1990977	6221	Dutovlje
00050000-5564-3654-c80b-bbb7c58d2304	8361	Dvor
00050000-5564-3654-c781-6086d8ffa6f2	2343	Fala
00050000-5564-3654-ba68-7b8edb975f41	9208	Fokovci
00050000-5564-3654-3245-619f431e3b31	2313	Fram
00050000-5564-3654-75d9-4e8d5fdc1076	3213	Frankolovo
00050000-5564-3654-65a6-c143ace9f19b	1274	Gabrovka
00050000-5564-3654-a3f6-c3fa9a40a1d7	8254	Globoko
00050000-5564-3654-1661-e47e5084338f	5275	Godovič
00050000-5564-3654-82ab-0988f7348192	4204	Golnik
00050000-5564-3654-11cb-6f0503bc22fc	3303	Gomilsko
00050000-5564-3654-99a6-3a26828f551a	4224	Gorenja vas
00050000-5564-3654-144f-ba956c55a5c2	3263	Gorica pri Slivnici
00050000-5564-3654-cfcc-ad1302ed912e	2272	Gorišnica
00050000-5564-3654-9ab6-81dfdcf13ed4	9250	Gornja Radgona
00050000-5564-3654-8805-6c1a4faf2835	3342	Gornji Grad
00050000-5564-3654-561f-95b7a88cc26d	4282	Gozd Martuljek
00050000-5564-3654-effb-cc8f620b0a66	6272	Gračišče
00050000-5564-3654-cf00-a537707d4bd0	9264	Grad
00050000-5564-3654-432f-0d08a795de61	8332	Gradac
00050000-5564-3654-0f25-6d3f84c735df	1384	Grahovo
00050000-5564-3654-2aa5-5771b75c6eb1	5242	Grahovo ob Bači
00050000-5564-3654-7178-d13d13baa216	5251	Grgar
00050000-5564-3654-b97a-ad0b30916056	3302	Griže
00050000-5564-3654-47b4-bf1396e62516	3231	Grobelno
00050000-5564-3654-4920-a82d1ee4d3d4	1290	Grosuplje
00050000-5564-3654-8664-ca955e23e5e9	2288	Hajdina
00050000-5564-3654-76cb-3dc023ad8fda	8362	Hinje
00050000-5564-3654-842d-33798786684e	2311	Hoče
00050000-5564-3654-4dab-5a6fdc822000	9205	Hodoš/Hodos
00050000-5564-3654-3b7b-82cab77bc457	1354	Horjul
00050000-5564-3654-c1e1-46ceb1dfd310	1372	Hotedršica
00050000-5564-3654-93a4-3cd26a14a920	1430	Hrastnik
00050000-5564-3654-80cc-e06b9b2c18ab	6225	Hruševje
00050000-5564-3654-3f03-110050497831	4276	Hrušica
00050000-5564-3654-14d2-8c7ed56ed777	5280	Idrija
00050000-5564-3654-65a1-14e3c9176245	1292	Ig
00050000-5564-3654-2349-45435c57ab9a	6250	Ilirska Bistrica
00050000-5564-3654-8075-b2a65fdd365d	6251	Ilirska Bistrica-Trnovo
00050000-5564-3654-8581-b7ed6aedb7ac	1295	Ivančna Gorica
00050000-5564-3654-f53c-f7f865a290f5	2259	Ivanjkovci
00050000-5564-3654-d5d9-dc2deafe0ac6	1411	Izlake
00050000-5564-3654-c0d1-095c1bca43c8	6310	Izola/Isola
00050000-5564-3654-75d4-ff84c1ab7b9d	2222	Jakobski Dol
00050000-5564-3654-3b2d-42f37fd92694	2221	Jarenina
00050000-5564-3654-32ba-862d3496da6f	6254	Jelšane
00050000-5564-3654-5650-afa72f097df4	4270	Jesenice
00050000-5564-3654-3176-6782307a540c	8261	Jesenice na Dolenjskem
00050000-5564-3654-e214-e05a1c3fc8f3	3273	Jurklošter
00050000-5564-3654-245f-36463733b82a	2223	Jurovski Dol
00050000-5564-3654-cb6d-ad78308b9cb8	2256	Juršinci
00050000-5564-3654-39ac-04e1bbed65bc	5214	Kal nad Kanalom
00050000-5564-3654-3ee2-fdc0d677d3c4	3233	Kalobje
00050000-5564-3654-0b90-657f9d9bd603	4246	Kamna Gorica
00050000-5564-3654-e9d1-23b87e64713d	2351	Kamnica
00050000-5564-3654-e167-8cb67ecac58c	1241	Kamnik
00050000-5564-3654-9b07-59e4da8d6b3a	5213	Kanal
00050000-5564-3654-9dda-972a5b8f8922	8258	Kapele
00050000-5564-3654-deb3-4ad51710c7f1	2362	Kapla
00050000-5564-3654-9dc5-e28f060438e8	2325	Kidričevo
00050000-5564-3654-6f1c-e7f38d13790c	1412	Kisovec
00050000-5564-3654-96e1-201793fe52f3	6253	Knežak
00050000-5564-3654-173e-d8fe3eba07c0	5222	Kobarid
00050000-5564-3654-e7ec-0b1dec43b077	9227	Kobilje
00050000-5564-3654-9720-20ed79d87925	1330	Kočevje
00050000-5564-3654-d50c-322cf8007cc9	1338	Kočevska Reka
00050000-5564-3654-fc49-6e348988b31d	2276	Kog
00050000-5564-3654-b1f4-6b2d0862de18	5211	Kojsko
00050000-5564-3654-04be-da1156e188ad	6223	Komen
00050000-5564-3654-19bc-b7e0a3a8f85f	1218	Komenda
00050000-5564-3654-428f-80e053301d14	6000	Koper/Capodistria 
00050000-5564-3654-3f29-6990624d76db	6001	Koper/Capodistria - poštni predali
00050000-5564-3654-3c7c-9ea530902361	8282	Koprivnica
00050000-5564-3654-a3c1-db3fb282abf0	5296	Kostanjevica na Krasu
00050000-5564-3654-ae06-274e224e381e	8311	Kostanjevica na Krki
00050000-5564-3654-b4dc-3d50883db430	1336	Kostel
00050000-5564-3654-1c75-d6a4ff4e5177	6256	Košana
00050000-5564-3654-4d06-0456d3285123	2394	Kotlje
00050000-5564-3654-1c4c-19c611411722	6240	Kozina
00050000-5564-3654-5a2d-f8973f4f2091	3260	Kozje
00050000-5564-3654-9817-309af42f7f9f	4000	Kranj 
00050000-5564-3654-ba27-a4b6b638c557	4001	Kranj - poštni predali
00050000-5564-3654-cf08-fb2e446bc552	4280	Kranjska Gora
00050000-5564-3654-ef45-3608cea064bc	1281	Kresnice
00050000-5564-3654-94e5-f1485dde0743	4294	Križe
00050000-5564-3654-46c7-24d9b6a22a55	9206	Križevci
00050000-5564-3654-a064-899908f303bb	9242	Križevci pri Ljutomeru
00050000-5564-3654-c48f-c80778f2700c	1301	Krka
00050000-5564-3654-c9cd-94f8f7153756	8296	Krmelj
00050000-5564-3654-232e-b8450be92e21	4245	Kropa
00050000-5564-3654-1b54-e378817144ff	8262	Krška vas
00050000-5564-3654-3c26-133614736255	8270	Krško
00050000-5564-3654-7c70-cbe193cd28e3	9263	Kuzma
00050000-5564-3654-5118-544a2d1f9d29	2318	Laporje
00050000-5564-3654-9ee4-d8cb8a01065f	3270	Laško
00050000-5564-3654-73cf-09d4b61cce72	1219	Laze v Tuhinju
00050000-5564-3654-f612-264601991b5b	2230	Lenart v Slovenskih goricah
00050000-5564-3654-e2c1-704920477528	9220	Lendava/Lendva
00050000-5564-3654-f788-1911eda8597e	4248	Lesce
00050000-5564-3654-2147-d06d5984d5a3	3261	Lesično
00050000-5564-3654-b2d4-52a5dc183909	8273	Leskovec pri Krškem
00050000-5564-3654-8ced-22409ca453c2	2372	Libeliče
00050000-5564-3654-f122-eeceba0ec90f	2341	Limbuš
00050000-5564-3654-f1d8-d05719532588	1270	Litija
00050000-5564-3654-df75-d2aed9d73dc2	3202	Ljubečna
00050000-5564-3654-b8aa-b1b2b816bccf	1000	Ljubljana 
00050000-5564-3654-bca8-fe335960e7f5	1001	Ljubljana - poštni predali
00050000-5564-3654-94d1-061acac1c4ee	1231	Ljubljana - Črnuče
00050000-5564-3654-17d8-54fcc3c0a8c0	1261	Ljubljana - Dobrunje
00050000-5564-3654-e882-2635bb7033c5	1260	Ljubljana - Polje
00050000-5564-3654-8557-c824650175de	1210	Ljubljana - Šentvid
00050000-5564-3654-6fbf-6039ea36958d	1211	Ljubljana - Šmartno
00050000-5564-3654-e0da-f3e188e0f1bd	3333	Ljubno ob Savinji
00050000-5564-3654-cbdb-3a1b8a693ab3	9240	Ljutomer
00050000-5564-3654-8970-36c4ac052cfe	3215	Loče
00050000-5564-3654-a8cb-63816f6d915c	5231	Log pod Mangartom
00050000-5564-3654-05c8-a44c65de4ed1	1358	Log pri Brezovici
00050000-5564-3654-1ca3-5750fbf65900	1370	Logatec
00050000-5564-3654-95b0-17c0dc428b3a	1371	Logatec
00050000-5564-3654-8f4a-be1edf0d81b9	1434	Loka pri Zidanem Mostu
00050000-5564-3654-1918-f7206562f16c	3223	Loka pri Žusmu
00050000-5564-3654-38e4-f2f39cf108e0	6219	Lokev
00050000-5564-3654-ce3c-ff0eb6df30af	1318	Loški Potok
00050000-5564-3654-9717-e1d5c65187f0	2324	Lovrenc na Dravskem polju
00050000-5564-3654-fe41-3e0153f05edc	2344	Lovrenc na Pohorju
00050000-5564-3654-9dac-56207087b5f2	3334	Luče
00050000-5564-3654-6ff4-256eeb581017	1225	Lukovica
00050000-5564-3654-bd95-ec7a329a021d	9202	Mačkovci
00050000-5564-3654-d0aa-b3d5e939df79	2322	Majšperk
00050000-5564-3654-73fd-725d4d8446a3	2321	Makole
00050000-5564-3654-27a5-d106f6456d8f	9243	Mala Nedelja
00050000-5564-3654-f6a4-5b425f10a818	2229	Malečnik
00050000-5564-3654-d048-2ece33b42be1	6273	Marezige
00050000-5564-3654-99c4-24eddcf371c5	2000	Maribor 
00050000-5564-3654-9ad2-f3be2642d63d	2001	Maribor - poštni predali
00050000-5564-3654-0aa3-5d52d96bd1d6	2206	Marjeta na Dravskem polju
00050000-5564-3654-8f4a-b0cf9347eb9e	2281	Markovci
00050000-5564-3654-aede-3951681dcf28	9221	Martjanci
00050000-5564-3654-4ab9-d8988f82ebd9	6242	Materija
00050000-5564-3654-f7d8-cef9e7559141	4211	Mavčiče
00050000-5564-3654-8d01-b2bcf3d9be02	1215	Medvode
00050000-5564-3654-0a16-a80f1d021fc8	1234	Mengeš
00050000-5564-3654-a80c-61944844dbd7	8330	Metlika
00050000-5564-3654-841e-69c3fdc591c9	2392	Mežica
00050000-5564-3654-0e23-be9060b52fe4	2204	Miklavž na Dravskem polju
00050000-5564-3654-b94c-a546b8edfeae	2275	Miklavž pri Ormožu
00050000-5564-3654-d25a-fb0ea7259998	5291	Miren
00050000-5564-3654-23c4-15bb618c4331	8233	Mirna
00050000-5564-3654-8c08-140d280860a0	8216	Mirna Peč
00050000-5564-3654-4340-0a66da4fadcf	2382	Mislinja
00050000-5564-3654-8ee4-3b2947eb1060	4281	Mojstrana
00050000-5564-3654-f352-f3d4866d3d59	8230	Mokronog
00050000-5564-3654-044d-8403ec11ae54	1251	Moravče
00050000-5564-3654-6dd6-834a5d134548	9226	Moravske Toplice
00050000-5564-3654-25ba-37b5710a930e	5216	Most na Soči
00050000-5564-3654-f421-a91ebb798c38	1221	Motnik
00050000-5564-3654-7df5-749e20b95495	3330	Mozirje
00050000-5564-3654-25e5-26e869ebb678	9000	Murska Sobota 
00050000-5564-3654-aafb-765ec83c9e35	9001	Murska Sobota - poštni predali
00050000-5564-3654-c79b-da5ac69f59fa	2366	Muta
00050000-5564-3654-3956-f1ee364dc26c	4202	Naklo
00050000-5564-3654-cf8d-d5af0f66d439	3331	Nazarje
00050000-5564-3654-fa64-89546d6f2a38	1357	Notranje Gorice
00050000-5564-3654-979f-8eba725c9efe	3203	Nova Cerkev
00050000-5564-3654-479b-9d977407e31e	5000	Nova Gorica 
00050000-5564-3654-3178-bf716dd73b61	5001	Nova Gorica - poštni predali
00050000-5564-3654-6fcb-920318dc91ab	1385	Nova vas
00050000-5564-3654-0d8d-76825d7a8c43	8000	Novo mesto
00050000-5564-3654-179c-c40ea67b205f	8001	Novo mesto - poštni predali
00050000-5564-3654-5e7a-2ca6c3f942d3	6243	Obrov
00050000-5564-3654-e5e3-672d81c29353	9233	Odranci
00050000-5564-3654-92b0-2a6249b70531	2317	Oplotnica
00050000-5564-3654-5798-368f58b8bc14	2312	Orehova vas
00050000-5564-3654-090d-4c8201b52f12	2270	Ormož
00050000-5564-3654-b76e-f7e7a3822ba8	1316	Ortnek
00050000-5564-3654-762b-96d7860ef3cf	1337	Osilnica
00050000-5564-3654-7c42-35510ec3c51e	8222	Otočec
00050000-5564-3654-4c44-16f34987dfe9	2361	Ožbalt
00050000-5564-3654-eca2-ee7cd404f4be	2231	Pernica
00050000-5564-3654-2e1c-c4709682943e	2211	Pesnica pri Mariboru
00050000-5564-3654-8682-335ead25c3d0	9203	Petrovci
00050000-5564-3654-aa7a-a6217e4bf44e	3301	Petrovče
00050000-5564-3654-5832-4743f3b8404e	6330	Piran/Pirano
00050000-5564-3654-a725-4c7b61413f55	8255	Pišece
00050000-5564-3654-93bd-c0157a6b11e7	6257	Pivka
00050000-5564-3654-46cd-d91f7b4a7119	6232	Planina
00050000-5564-3654-84ea-1bb52aff7f7e	3225	Planina pri Sevnici
00050000-5564-3654-7920-97813546a95f	6276	Pobegi
00050000-5564-3654-36ff-6f6ec50530cd	8312	Podbočje
00050000-5564-3654-cb25-d0281485aa46	5243	Podbrdo
00050000-5564-3654-ec92-e8dc02eb6e65	3254	Podčetrtek
00050000-5564-3654-4693-2508f1165661	2273	Podgorci
00050000-5564-3654-d843-5b938cfc4e4e	6216	Podgorje
00050000-5564-3654-3707-58bd42fddf0e	2381	Podgorje pri Slovenj Gradcu
00050000-5564-3654-1c65-6c09b30294c2	6244	Podgrad
00050000-5564-3654-3cf7-279bba566e52	1414	Podkum
00050000-5564-3654-b5fd-5eedf92f478e	2286	Podlehnik
00050000-5564-3654-da68-f2dc7793cfd5	5272	Podnanos
00050000-5564-3654-012f-c34fe8147f14	4244	Podnart
00050000-5564-3654-e1b2-7619153d852f	3241	Podplat
00050000-5564-3654-4cfb-83884f4dc63e	3257	Podsreda
00050000-5564-3654-ede3-9771923ada0b	2363	Podvelka
00050000-5564-3654-0e0e-60ce335ae67a	2208	Pohorje
00050000-5564-3654-ffea-d96402a55e98	2257	Polenšak
00050000-5564-3654-7393-b23b48e763d2	1355	Polhov Gradec
00050000-5564-3654-2471-b58e7a53232c	4223	Poljane nad Škofjo Loko
00050000-5564-3654-a936-335e1e11d215	2319	Poljčane
00050000-5564-3654-37c8-dd2e1d554a27	1272	Polšnik
00050000-5564-3654-3e31-a2e7edbaa542	3313	Polzela
00050000-5564-3654-7ce7-8a8a7fbb7d30	3232	Ponikva
00050000-5564-3654-d57a-387556b1398b	6320	Portorož/Portorose
00050000-5564-3654-bfdd-597e6217830c	6230	Postojna
00050000-5564-3654-2018-e631c04df92d	2331	Pragersko
00050000-5564-3654-c4b6-01608a4ef09b	3312	Prebold
00050000-5564-3654-cdb8-3aa87bb428f9	4205	Preddvor
00050000-5564-3654-6309-875aba28efcb	6255	Prem
00050000-5564-3654-9544-d27337e400a2	1352	Preserje
00050000-5564-3654-7856-4eb937790596	6258	Prestranek
00050000-5564-3654-79e3-e1e3cc2e582c	2391	Prevalje
00050000-5564-3654-73ec-b23974bb8304	3262	Prevorje
00050000-5564-3654-4cec-6c881c1100ce	1276	Primskovo 
00050000-5564-3654-0492-32e4c29680f2	3253	Pristava pri Mestinju
00050000-5564-3654-f537-e9a8f9d73e0c	9207	Prosenjakovci/Partosfalva
00050000-5564-3654-7b1c-2ec10d60fbe3	5297	Prvačina
00050000-5564-3654-405e-d9ae13b39deb	2250	Ptuj
00050000-5564-3654-3688-09b7e1d65fe2	2323	Ptujska Gora
00050000-5564-3654-5801-8b989241f6ed	9201	Puconci
00050000-5564-3654-0ec5-a8ab1d27f198	2327	Rače
00050000-5564-3654-97d1-6fc334e2ac8e	1433	Radeče
00050000-5564-3654-b33a-0f2b7f947cc1	9252	Radenci
00050000-5564-3654-f3fa-b790e0e092ee	2360	Radlje ob Dravi
00050000-5564-3654-a2e6-76a4162e404d	1235	Radomlje
00050000-5564-3654-a873-a2a08eda3bf5	4240	Radovljica
00050000-5564-3654-829b-476c95b57062	8274	Raka
00050000-5564-3654-3302-f44f5ccce485	1381	Rakek
00050000-5564-3654-5b48-abba10e0bf9c	4283	Rateče - Planica
00050000-5564-3654-8e37-3663dc48f3b4	2390	Ravne na Koroškem
00050000-5564-3654-b9bb-c5c6973e1cc7	9246	Razkrižje
00050000-5564-3654-3763-0c8e40bf022d	3332	Rečica ob Savinji
00050000-5564-3654-315a-b32ffdf1e234	5292	Renče
00050000-5564-3654-7f77-eaae15d00586	1310	Ribnica
00050000-5564-3654-85a2-0f2ed1c1bb39	2364	Ribnica na Pohorju
00050000-5564-3654-f328-fb8d26fd7158	3272	Rimske Toplice
00050000-5564-3654-994b-076ca3d078db	1314	Rob
00050000-5564-3654-437c-574a73fab7f5	5215	Ročinj
00050000-5564-3654-8858-11b1b81bb7a4	3250	Rogaška Slatina
00050000-5564-3654-7881-d3a63979c479	9262	Rogašovci
00050000-5564-3654-2688-3460f24969cc	3252	Rogatec
00050000-5564-3654-4f5b-d850672966a4	1373	Rovte
00050000-5564-3654-4991-8f460b3d3c7e	2342	Ruše
00050000-5564-3654-99d4-84a5702b2cf4	1282	Sava
00050000-5564-3654-db65-f60c19e7e328	6333	Sečovlje/Sicciole
00050000-5564-3654-a64b-626767f53529	4227	Selca
00050000-5564-3654-7a13-a9f16350c694	2352	Selnica ob Dravi
00050000-5564-3654-34b7-cc907ff53d5e	8333	Semič
00050000-5564-3654-e54d-ab05496732a5	8281	Senovo
00050000-5564-3654-6f64-d18d8339f072	6224	Senožeče
00050000-5564-3654-960b-ec9bf25763ac	8290	Sevnica
00050000-5564-3654-999c-5bbe4be8c0f8	6210	Sežana
00050000-5564-3654-2926-b926768398f2	2214	Sladki Vrh
00050000-5564-3654-5ac6-76f07ec41daf	5283	Slap ob Idrijci
00050000-5564-3654-26cb-b27619888b3e	2380	Slovenj Gradec
00050000-5564-3654-04fb-ec8eb8fc016f	2310	Slovenska Bistrica
00050000-5564-3654-f8aa-b809578c043a	3210	Slovenske Konjice
00050000-5564-3654-cc69-2a0d8051a209	1216	Smlednik
00050000-5564-3654-75a2-974f1b5b52e2	5232	Soča
00050000-5564-3654-9895-9409a2b0ea46	1317	Sodražica
00050000-5564-3654-1ef6-baf575b8efde	3335	Solčava
00050000-5564-3654-4aa0-182483975af8	5250	Solkan
00050000-5564-3654-6c27-0dee4d604ca2	4229	Sorica
00050000-5564-3654-0dd1-2c9e14a1902f	4225	Sovodenj
00050000-5564-3654-b5d5-0cd9ff9691de	5281	Spodnja Idrija
00050000-5564-3654-84dd-c08cd47fb1f4	2241	Spodnji Duplek
00050000-5564-3654-4123-c516aacc3e40	9245	Spodnji Ivanjci
00050000-5564-3654-8354-093640fa5c7c	2277	Središče ob Dravi
00050000-5564-3654-d70f-13dbf256473e	4267	Srednja vas v Bohinju
00050000-5564-3654-582c-a1538eb1ed98	8256	Sromlje 
00050000-5564-3654-1acc-b09fa6a81881	5224	Srpenica
00050000-5564-3654-511a-8907ff1023f7	1242	Stahovica
00050000-5564-3654-6238-30a84869cb4c	1332	Stara Cerkev
00050000-5564-3654-8fa9-84443be4fc5b	8342	Stari trg ob Kolpi
00050000-5564-3654-dc37-eb3e01c30473	1386	Stari trg pri Ložu
00050000-5564-3654-d914-f2d1f87770eb	2205	Starše
00050000-5564-3654-66c4-2fb4a3f13fe4	2289	Stoperce
00050000-5564-3654-ae2c-28d0747d737c	8322	Stopiče
00050000-5564-3654-5519-a9fdccef8733	3206	Stranice
00050000-5564-3654-f395-16fbf7591daa	8351	Straža
00050000-5564-3654-2669-025d00d483fa	1313	Struge
00050000-5564-3654-d499-e5f2b03b8fab	8293	Studenec
00050000-5564-3654-92b3-4755a1f2c9b7	8331	Suhor
00050000-5564-3654-4c59-98e37376aa7c	2233	Sv. Ana v Slovenskih goricah
00050000-5564-3654-d612-fd6539ed8471	2235	Sv. Trojica v Slovenskih goricah
00050000-5564-3654-ce5f-15e3213907f2	2353	Sveti Duh na Ostrem Vrhu
00050000-5564-3654-8076-dbfe85673825	9244	Sveti Jurij ob Ščavnici
00050000-5564-3654-9530-c716a8d6145a	3264	Sveti Štefan
00050000-5564-3654-7f41-262f890bc6cd	2258	Sveti Tomaž
00050000-5564-3654-eb29-524d2445984b	9204	Šalovci
00050000-5564-3654-b90a-3d5b9e5c55dc	5261	Šempas
00050000-5564-3654-a470-6a0ff3cf1d64	5290	Šempeter pri Gorici
00050000-5564-3654-ebee-b02f0ac693db	3311	Šempeter v Savinjski dolini
00050000-5564-3654-5579-da68ed657985	4208	Šenčur
00050000-5564-3654-db40-ff0cca741a2c	2212	Šentilj v Slovenskih goricah
00050000-5564-3654-0282-3dcb1aa4b00a	8297	Šentjanž
00050000-5564-3654-7da9-0232ab503dc8	2373	Šentjanž pri Dravogradu
00050000-5564-3654-1f01-46bba8ad6943	8310	Šentjernej
00050000-5564-3654-dbc6-cb739b81391e	3230	Šentjur
00050000-5564-3654-30c5-21d432b2b15c	3271	Šentrupert
00050000-5564-3654-7dcc-040366d18085	8232	Šentrupert
00050000-5564-3654-ce0e-d589e638f02c	1296	Šentvid pri Stični
00050000-5564-3654-dedb-26f270cf1278	8275	Škocjan
00050000-5564-3654-63b6-5d6c142711a5	6281	Škofije
00050000-5564-3654-8cf0-d798b814f3bf	4220	Škofja Loka
00050000-5564-3654-7770-69d260561afb	3211	Škofja vas
00050000-5564-3654-47fe-c379566911db	1291	Škofljica
00050000-5564-3654-bc40-6816af9dbf52	6274	Šmarje
00050000-5564-3654-177b-7dcb581c49c8	1293	Šmarje - Sap
00050000-5564-3654-5d4e-114f53cf5f0e	3240	Šmarje pri Jelšah
00050000-5564-3654-92e3-5f3de8bb39e2	8220	Šmarješke Toplice
00050000-5564-3654-a6c0-a6a114802df8	2315	Šmartno na Pohorju
00050000-5564-3654-f2cf-21b4a5c30322	3341	Šmartno ob Dreti
00050000-5564-3654-b702-1b354f798178	3327	Šmartno ob Paki
00050000-5564-3654-4e4a-5b85b1a464b9	1275	Šmartno pri Litiji
00050000-5564-3654-36a3-0e80579e2c5e	2383	Šmartno pri Slovenj Gradcu
00050000-5564-3654-2ef9-acf414f32f05	3201	Šmartno v Rožni dolini
00050000-5564-3654-fd1a-11cf6a51eaef	3325	Šoštanj
00050000-5564-3654-82b6-6df5a4b5adeb	6222	Štanjel
00050000-5564-3654-a4ce-626a3650dae0	3220	Štore
00050000-5564-3654-4f6c-6ad5738ae196	3304	Tabor
00050000-5564-3654-6490-0efff849f713	3221	Teharje
00050000-5564-3654-d281-084cec5f44a9	9251	Tišina
00050000-5564-3654-9a2f-42c293aa6a19	5220	Tolmin
00050000-5564-3654-abfb-719f6d6f2a28	3326	Topolšica
00050000-5564-3654-a698-50e696f25a47	2371	Trbonje
00050000-5564-3654-ce17-345d7e7afb8b	1420	Trbovlje
00050000-5564-3654-cc90-2554897de09f	8231	Trebelno 
00050000-5564-3654-ebf2-d93afea2ab37	8210	Trebnje
00050000-5564-3654-eb1b-6eb20f1eed39	5252	Trnovo pri Gorici
00050000-5564-3654-2438-1acdb3f24f82	2254	Trnovska vas
00050000-5564-3654-3d0b-0916d2905e06	1222	Trojane
00050000-5564-3654-0e76-82b8f03c4b09	1236	Trzin
00050000-5564-3654-7ed1-9074b9629312	4290	Tržič
00050000-5564-3654-6398-7d744528219f	8295	Tržišče
00050000-5564-3654-145c-8aadf90db69d	1311	Turjak
00050000-5564-3654-0178-186b2bc0f743	9224	Turnišče
00050000-5564-3654-17f6-c5560ebbdbc1	8323	Uršna sela
00050000-5564-3654-de57-9874fb2a45aa	1252	Vače
00050000-5564-3654-3626-ec4de84dd405	3320	Velenje 
00050000-5564-3654-ab43-b34e92fcf702	3322	Velenje - poštni predali
00050000-5564-3654-de04-661eb93e04e1	8212	Velika Loka
00050000-5564-3654-61e9-fe8cb0ab5be6	2274	Velika Nedelja
00050000-5564-3654-b926-63acf42eb6f7	9225	Velika Polana
00050000-5564-3654-046f-79fd390cb367	1315	Velike Lašče
00050000-5564-3654-4bde-0f1ea47d0c14	8213	Veliki Gaber
00050000-5564-3654-93b7-54d819170356	9241	Veržej
00050000-5564-3654-fd68-7bf7e8e5ab73	1312	Videm - Dobrepolje
00050000-5564-3654-b340-e8496216a11c	2284	Videm pri Ptuju
00050000-5564-3654-23e1-2360cdbcf18f	8344	Vinica
00050000-5564-3654-6fd2-9460913c78a2	5271	Vipava
00050000-5564-3654-9958-99b52630cb70	4212	Visoko
00050000-5564-3654-8f68-e0ca7f15d0b1	1294	Višnja Gora
00050000-5564-3654-ce9f-0bc5b88db056	3205	Vitanje
00050000-5564-3654-b43a-d60e412710b0	2255	Vitomarci
00050000-5564-3654-5ec5-7127b8221c8e	1217	Vodice
00050000-5564-3654-913a-bd63cd808e2e	3212	Vojnik\t
00050000-5564-3654-e780-0ef2b270357b	5293	Volčja Draga
00050000-5564-3654-6bcd-2df597bb1f8e	2232	Voličina
00050000-5564-3654-4b70-ac216498c649	3305	Vransko
00050000-5564-3654-b46e-a8a951ba295b	6217	Vremski Britof
00050000-5564-3654-2c5d-e17783add772	1360	Vrhnika
00050000-5564-3654-1ae2-dab503539103	2365	Vuhred
00050000-5564-3654-e82c-c01709dac4f6	2367	Vuzenica
00050000-5564-3654-7cc8-15f411daa5de	8292	Zabukovje 
00050000-5564-3654-f39b-d0a4f595e38f	1410	Zagorje ob Savi
00050000-5564-3654-68db-c9b43ec4e2d9	1303	Zagradec
00050000-5564-3654-4b95-fd0942bf0dae	2283	Zavrč
00050000-5564-3654-2788-fb4fbbe78a93	8272	Zdole 
00050000-5564-3654-da2d-46f1351ad64e	4201	Zgornja Besnica
00050000-5564-3654-c7fc-a423e0c4042f	2242	Zgornja Korena
00050000-5564-3654-9473-d8e6369be172	2201	Zgornja Kungota
00050000-5564-3654-c6af-389b81878bb4	2316	Zgornja Ložnica
00050000-5564-3654-0415-b9c4b24530b7	2314	Zgornja Polskava
00050000-5564-3654-f972-1e0bbd87877a	2213	Zgornja Velka
00050000-5564-3654-01b7-032295c91780	4247	Zgornje Gorje
00050000-5564-3654-da17-ad1187f3b566	4206	Zgornje Jezersko
00050000-5564-3654-6fab-703710a672cf	2285	Zgornji Leskovec
00050000-5564-3654-e7f8-ebb758f86868	1432	Zidani Most
00050000-5564-3654-340d-aa78c7b57898	3214	Zreče
00050000-5564-3654-986e-72ed3943cb99	4209	Žabnica
00050000-5564-3654-7db3-cbd9ebbc40f6	3310	Žalec
00050000-5564-3654-3a6a-a3b3d9051940	4228	Železniki
00050000-5564-3654-5e7c-850416921d1f	2287	Žetale
00050000-5564-3654-bb62-6b3d933cdff4	4226	Žiri
00050000-5564-3654-35f1-9604c121bac8	4274	Žirovnica
00050000-5564-3654-8e93-ef008ca4cdaf	8360	Žužemberk
\.


--
-- TOC entry 2723 (class 0 OID 5037674)
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
-- TOC entry 2705 (class 0 OID 5037489)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2711 (class 0 OID 5037567)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2725 (class 0 OID 5037686)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2738 (class 0 OID 5037806)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2742 (class 0 OID 5037857)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2729 (class 0 OID 5037715)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5564-3655-b054-42b7e4851744	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5564-3655-9d23-fdd7fb2b863a	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5564-3655-db2b-1f11fba94ee4	0003	Kazinska	t	84	Kazinska dvorana
00220000-5564-3655-489c-df1907efba33	0004	Mali oder	t	24	Mali oder 
00220000-5564-3655-b983-0816c67c2d94	0005	Komorni oder	t	15	Komorni oder
00220000-5564-3655-8260-df47e316fe9b	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5564-3655-9ad4-961ff272212c	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2721 (class 0 OID 5037659)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2720 (class 0 OID 5037649)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2741 (class 0 OID 5037846)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2736 (class 0 OID 5037783)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2694 (class 0 OID 5037362)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5564-3654-8d90-ea7a951afca6	00010000-5564-3654-bd02-f683c816300e	2015-05-26 11:01:10	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROxjR61hm8MLd/dBWbdYX0kan6PuOL8cW";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2760 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2730 (class 0 OID 5037725)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2698 (class 0 OID 5037400)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5564-3654-3c98-678d1faca332	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5564-3654-f474-11417a86c221	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5564-3654-918d-6abb2425c200	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5564-3654-865b-645029125329	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5564-3654-51a4-a09210179dbe	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5564-3654-3056-64a06292966d	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2696 (class 0 OID 5037384)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5564-3654-8d90-ea7a951afca6	00020000-5564-3654-865b-645029125329
00010000-5564-3654-bd02-f683c816300e	00020000-5564-3654-865b-645029125329
\.


--
-- TOC entry 2732 (class 0 OID 5037739)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2724 (class 0 OID 5037680)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2718 (class 0 OID 5037630)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2750 (class 0 OID 5037952)
-- Dependencies: 230
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5564-3654-b1ce-c6f8598c0f9e	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5564-3654-7b48-bee7aaf87e9d	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5564-3654-7ef9-ce09f3211726	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5564-3654-a365-f6cb40b6aa2b	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5564-3654-e9dc-ee6859b7644d	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2749 (class 0 OID 5037945)
-- Dependencies: 229
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5564-3654-51dc-2fc17f4fcbc1	00000000-5564-3654-a365-f6cb40b6aa2b	popa
00000000-5564-3654-1a67-254882def23a	00000000-5564-3654-a365-f6cb40b6aa2b	oseba
00000000-5564-3654-08ea-8213413c4b72	00000000-5564-3654-7b48-bee7aaf87e9d	prostor
00000000-5564-3654-6f99-2bca51c47097	00000000-5564-3654-a365-f6cb40b6aa2b	besedilo
00000000-5564-3654-41ac-449e2dbf72bd	00000000-5564-3654-a365-f6cb40b6aa2b	uprizoritev
00000000-5564-3654-3be1-d3da4946602d	00000000-5564-3654-a365-f6cb40b6aa2b	funkcija
00000000-5564-3654-2bf7-3227d3e9b860	00000000-5564-3654-a365-f6cb40b6aa2b	tipfunkcije
\.


--
-- TOC entry 2748 (class 0 OID 5037940)
-- Dependencies: 228
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2737 (class 0 OID 5037793)
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
-- TOC entry 2703 (class 0 OID 5037461)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2719 (class 0 OID 5037636)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2740 (class 0 OID 5037835)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5564-3654-4316-7033256ebe34	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5564-3654-ee6d-e4dac5cbac17	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5564-3654-7bd7-9073f4ea1c05	Baletnik ali plesalec	Baletniki in plesalci	\N	Baletnica ali plesalka	igralec
000f0000-5564-3654-60a7-7f07b8f92efe	Avtor	Avtorji	\N	Avtorka	umetnik
000f0000-5564-3654-0671-f90b691e34e1	Režiser	Režiserji	\N	Režiserka	umetnik
000f0000-5564-3654-ba5d-6458218517f7	Scenograf	Scenografi	\N	Scenografka	tehnik
000f0000-5564-3654-b56f-7f9bfd892c66	Kostumograf	Kostumografi	\N	Kostumografinja	tehnik
000f0000-5564-3654-c4d2-f9655a542939	Oblikovalec maske	Oblikovalci maske	\N	Oblikovalka maske	tehnik
000f0000-5564-3654-a162-c016b18acd8d	Avtor glasbe	Avtorji glasbe	\N	Avtorica glasbe	umetnik
000f0000-5564-3654-fb12-2c993b7f64d9	Oblikovalec svetlobe	Oblikovalci svetlobe	\N	Oblikovalka svetlobe	tehnik
000f0000-5564-3654-7ba4-3a48cbb69ad4	Koreograf	Koreografi	\N	Koreografinja	umetnik
000f0000-5564-3654-51b9-1b79b04478d7	Dramaturg	Dramaturgi	\N	Dramaturginja	umetnik
000f0000-5564-3654-5518-76abbca09a74	Lektorj	Lektorji	\N	Lektorica	umetnik
000f0000-5564-3654-9982-13428285d69b	Prevajalec	Prevajalci	\N	Prevajalka	umetnik
000f0000-5564-3654-a655-46e2b95e5474	Oblikovalec videa	Oblikovalci videa	\N	Oblikovalka videa	umetnik
000f0000-5564-3654-8bfa-5ca75806aa73	Intermedijski ustvarjalec	Intermedijski ustvarjalci	\N	Intermedijska ustvarjalka	umetnik
\.


--
-- TOC entry 2708 (class 0 OID 5037524)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2695 (class 0 OID 5037371)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5564-3654-bd02-f683c816300e	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROa1C2haQMW/jLYks9HAP2BD9u683z8la	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5564-3654-cf90-6390cb9e2fb5	Jani	$2y$05$NS4xMjkyMTcwMzExMjAxROQ4hcsYhlG3noUR96cXYypnN9XJm4C6C	t	\N	\N	\N	jani@ifigenija.si	\N	\N	\N
00010000-5564-3654-a2e3-d50777a06e24	Tona	$2y$05$NS4xMjkyMTcwMzExMjAxROILhp2eOIAfm3DuqsSElAgtEOPFlyjwS	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5564-3654-ed81-cd6c436ab4a5	Ivo	$2y$05$NS4xMjkyMTcwMzExMjAxRO.ixIvFk2dLVNK2AZ9BBdj1Zwn.ThBPW	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5564-3654-12fa-496411127cf0	Jože	$2y$05$NS4xMjkyMTcwMzExMjAxRO5IoMS1xYrWPWY31Dt8QeWvxc9kuVoRe	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5564-3654-89aa-481476b158b2	Marko	$2y$05$NS4xMjkyMTcwMzExMjAxROyRAndMDVNt71/ZuCaWH4QYSlCnPQYFy	t	\N	\N	\N	marko@ifigenija.si	\N	\N	\N
00010000-5564-3654-5a35-ba71f178cf42	Marija	$2y$05$NS4xMjkyMTcwMzExMjAxROmvo0jMq4.U2iSxLQ9z3ifoQD72MQRl6	t	\N	\N	\N	marija@ifigenija.si	\N	\N	\N
00010000-5564-3654-6667-268a71bd0aab	Ana	$2y$05$NS4xMjkyMTcwMzExMjAxRON9Sgk8qIFG6eFj5ffYehHjf3eLHn9O6	t	\N	\N	\N	ana	\N	\N	\N
00010000-5564-3654-38df-696a3e63e44d	Maja	$2y$05$NS4xMjkyMTcwMzExMjAxROwCrsJpAQ/oepnASSnWFxPMRGZG/3NeS	t	\N	\N	\N	maja@ifigenija.si	\N	\N	\N
00010000-5564-3654-f982-d7c72880db15	Irena	$2y$05$NS4xMjkyMTcwMzExMjAxROnkQDrpovmbWCb3/PyeXk2DeARePfRKK	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5564-3654-33ab-2513cea13f25	Mojca	$2y$05$NS4xMjkyMTcwMzExMjAxRO7TyziJluPC8FH/M9EF.6EJXFL4Ruceu	t	\N	\N	\N	mojca@ifigenija.si	\N	\N	\N
00010000-5564-3654-8d90-ea7a951afca6	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2745 (class 0 OID 5037890)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
\.


--
-- TOC entry 2713 (class 0 OID 5037582)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2728 (class 0 OID 5037707)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2735 (class 0 OID 5037775)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2715 (class 0 OID 5037614)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2744 (class 0 OID 5037880)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-5564-3654-d1b1-18531bad5bfd	Drama	drama (SURS 01)
00140000-5564-3654-c3e2-86b5331b0502	Opera	opera (SURS 02)
00140000-5564-3654-02d4-b9911f717b90	Balet	balet (SURS 03)
00140000-5564-3654-21af-fef87a2403d3	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5564-3654-94fd-23b745c702f8	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5564-3654-7cfe-f5d807a5fde5	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5564-3654-6269-af6e29753fe4	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2734 (class 0 OID 5037765)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-5564-3654-ee88-93485eab5353	Opera	opera
00150000-5564-3654-218a-4996d4c71c94	Opereta	opereta
00150000-5564-3654-d56f-12606b3cee6d	Balet	balet
00150000-5564-3654-3b32-7e59e913eaf8	Plesne prireditve	plesne prireditve
00150000-5564-3654-bb2e-d9a3db857cfc	Lutkovno gledališče	lutkovno gledališče
00150000-5564-3654-a486-b382cca84590	Raziskovalno gledališče	raziskovalno gledališče
00150000-5564-3654-67a2-f52111bab54e	Biografska drama	biografska drama
00150000-5564-3654-441a-dbd32233746c	Komedija	komedija
00150000-5564-3654-4a05-5e4c9955a29d	Črna komedija	črna komedija
00150000-5564-3654-28ad-882534106e6d	E-igra	E-igra
00150000-5564-3654-3b0b-b65fcc888b43	Kriminalka	kriminalka
00150000-5564-3654-2f12-2253d5ab9c94	Musical	musical
\.


--
-- TOC entry 2315 (class 2606 OID 5037425)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 5037934)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 5037924)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 5037834)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 5037604)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 5037629)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 5037550)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 5037761)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 5037580)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 5037623)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 5037564)
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
-- TOC entry 2407 (class 2606 OID 5037672)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 5037699)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 5037522)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 5037434)
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
-- TOC entry 2322 (class 2606 OID 5037457)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2313 (class 2606 OID 5037414)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2306 (class 2606 OID 5037399)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 5037705)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 5037738)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 5037875)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2331 (class 2606 OID 5037486)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 5037510)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 5037678)
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
-- TOC entry 2337 (class 2606 OID 5037500)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 5037571)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 5037690)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 5037818)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 5037862)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 5037722)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 5037663)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 5037654)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 5037856)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 5037790)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 5037370)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 5037729)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 5037388)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2308 (class 2606 OID 5037408)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 5037747)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 5037685)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 5037635)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 5037958)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 5037949)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 5037944)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 5037803)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 5037466)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 5037645)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 5037845)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 5037535)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 5037383)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 5037905)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 5037589)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 5037713)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 5037781)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 5037618)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 5037889)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 5037774)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 1259 OID 5037611)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2454 (class 1259 OID 5037804)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2455 (class 1259 OID 5037805)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2329 (class 1259 OID 5037488)
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
-- TOC entry 2420 (class 1259 OID 5037706)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2414 (class 1259 OID 5037692)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2415 (class 1259 OID 5037691)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2366 (class 1259 OID 5037590)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2442 (class 1259 OID 5037764)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2443 (class 1259 OID 5037762)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2444 (class 1259 OID 5037763)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2354 (class 1259 OID 5037566)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2355 (class 1259 OID 5037565)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2471 (class 1259 OID 5037877)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2472 (class 1259 OID 5037878)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2473 (class 1259 OID 5037879)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2479 (class 1259 OID 5037909)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2480 (class 1259 OID 5037906)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2481 (class 1259 OID 5037908)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2482 (class 1259 OID 5037907)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2344 (class 1259 OID 5037537)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2345 (class 1259 OID 5037536)
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
-- TOC entry 2320 (class 1259 OID 5037460)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2430 (class 1259 OID 5037730)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2384 (class 1259 OID 5037624)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2310 (class 1259 OID 5037415)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2311 (class 1259 OID 5037416)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2435 (class 1259 OID 5037750)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2436 (class 1259 OID 5037749)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2437 (class 1259 OID 5037748)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2358 (class 1259 OID 5037572)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2359 (class 1259 OID 5037574)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2360 (class 1259 OID 5037573)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2498 (class 1259 OID 5037951)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2394 (class 1259 OID 5037658)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2395 (class 1259 OID 5037656)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2396 (class 1259 OID 5037655)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2397 (class 1259 OID 5037657)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2301 (class 1259 OID 5037389)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 5037390)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2423 (class 1259 OID 5037714)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2409 (class 1259 OID 5037679)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2450 (class 1259 OID 5037791)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2451 (class 1259 OID 5037792)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2333 (class 1259 OID 5037502)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2334 (class 1259 OID 5037501)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2335 (class 1259 OID 5037503)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2458 (class 1259 OID 5037819)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2459 (class 1259 OID 5037820)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2491 (class 1259 OID 5037937)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2492 (class 1259 OID 5037936)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2493 (class 1259 OID 5037939)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2494 (class 1259 OID 5037935)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2495 (class 1259 OID 5037938)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2447 (class 1259 OID 5037782)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2400 (class 1259 OID 5037667)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2401 (class 1259 OID 5037666)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2402 (class 1259 OID 5037664)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2403 (class 1259 OID 5037665)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2284 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2487 (class 1259 OID 5037926)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2488 (class 1259 OID 5037925)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2365 (class 1259 OID 5037581)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2316 (class 1259 OID 5037436)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2317 (class 1259 OID 5037435)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2325 (class 1259 OID 5037467)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2326 (class 1259 OID 5037468)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2389 (class 1259 OID 5037648)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2390 (class 1259 OID 5037647)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2391 (class 1259 OID 5037646)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2372 (class 1259 OID 5037613)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2373 (class 1259 OID 5037609)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2374 (class 1259 OID 5037606)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2375 (class 1259 OID 5037607)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2376 (class 1259 OID 5037605)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2377 (class 1259 OID 5037610)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2378 (class 1259 OID 5037608)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2332 (class 1259 OID 5037487)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2350 (class 1259 OID 5037551)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2351 (class 1259 OID 5037553)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2352 (class 1259 OID 5037552)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2353 (class 1259 OID 5037554)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2408 (class 1259 OID 5037673)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2476 (class 1259 OID 5037876)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2323 (class 1259 OID 5037458)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2324 (class 1259 OID 5037459)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2504 (class 1259 OID 5037959)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2343 (class 1259 OID 5037523)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2501 (class 1259 OID 5037950)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2428 (class 1259 OID 5037724)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2429 (class 1259 OID 5037723)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2287 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2340 (class 1259 OID 5037511)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 5037863)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2309 (class 1259 OID 5037409)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2379 (class 1259 OID 5037612)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2530 (class 2606 OID 5038097)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2533 (class 2606 OID 5038082)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2532 (class 2606 OID 5038087)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2528 (class 2606 OID 5038107)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2534 (class 2606 OID 5038077)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2529 (class 2606 OID 5038102)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2531 (class 2606 OID 5038092)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2564 (class 2606 OID 5038252)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2563 (class 2606 OID 5038257)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2515 (class 2606 OID 5038012)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2551 (class 2606 OID 5038192)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2549 (class 2606 OID 5038187)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2550 (class 2606 OID 5038182)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2527 (class 2606 OID 5038072)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2557 (class 2606 OID 5038232)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2559 (class 2606 OID 5038222)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2558 (class 2606 OID 5038227)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2521 (class 2606 OID 5038047)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2522 (class 2606 OID 5038042)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2547 (class 2606 OID 5038172)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2570 (class 2606 OID 5038277)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2569 (class 2606 OID 5038282)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2568 (class 2606 OID 5038287)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2571 (class 2606 OID 5038307)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2574 (class 2606 OID 5038292)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2572 (class 2606 OID 5038302)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2573 (class 2606 OID 5038297)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2519 (class 2606 OID 5038037)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2520 (class 2606 OID 5038032)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2511 (class 2606 OID 5037997)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2512 (class 2606 OID 5037992)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2553 (class 2606 OID 5038202)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2535 (class 2606 OID 5038112)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2508 (class 2606 OID 5037972)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2507 (class 2606 OID 5037977)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2554 (class 2606 OID 5038217)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2555 (class 2606 OID 5038212)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2556 (class 2606 OID 5038207)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2525 (class 2606 OID 5038052)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2523 (class 2606 OID 5038062)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2524 (class 2606 OID 5038057)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2582 (class 2606 OID 5038347)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2539 (class 2606 OID 5038147)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2541 (class 2606 OID 5038137)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2542 (class 2606 OID 5038132)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2540 (class 2606 OID 5038142)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2506 (class 2606 OID 5037962)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2505 (class 2606 OID 5037967)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2552 (class 2606 OID 5038197)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2548 (class 2606 OID 5038177)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2562 (class 2606 OID 5038242)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2561 (class 2606 OID 5038247)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2517 (class 2606 OID 5038022)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 5038017)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2516 (class 2606 OID 5038027)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2566 (class 2606 OID 5038262)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2565 (class 2606 OID 5038267)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2579 (class 2606 OID 5038332)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2580 (class 2606 OID 5038327)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2577 (class 2606 OID 5038342)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2581 (class 2606 OID 5038322)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2578 (class 2606 OID 5038337)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2560 (class 2606 OID 5038237)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2543 (class 2606 OID 5038167)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2544 (class 2606 OID 5038162)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2546 (class 2606 OID 5038152)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2545 (class 2606 OID 5038157)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2575 (class 2606 OID 5038317)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2576 (class 2606 OID 5038312)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2526 (class 2606 OID 5038067)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2567 (class 2606 OID 5038272)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 5037987)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2510 (class 2606 OID 5037982)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2514 (class 2606 OID 5038002)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2513 (class 2606 OID 5038007)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2536 (class 2606 OID 5038127)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2537 (class 2606 OID 5038122)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2538 (class 2606 OID 5038117)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-26 11:01:10 CEST

--
-- PostgreSQL database dump complete
--

