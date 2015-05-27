--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-27 14:56:31 CEST

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
-- TOC entry 180 (class 1259 OID 5328412)
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
-- TOC entry 227 (class 1259 OID 5328922)
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
-- TOC entry 226 (class 1259 OID 5328905)
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
-- TOC entry 219 (class 1259 OID 5328815)
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
-- TOC entry 194 (class 1259 OID 5328585)
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
-- TOC entry 197 (class 1259 OID 5328619)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 5328532)
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
-- TOC entry 213 (class 1259 OID 5328745)
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
-- TOC entry 192 (class 1259 OID 5328569)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 196 (class 1259 OID 5328613)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 5328549)
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
-- TOC entry 202 (class 1259 OID 5328662)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 5328687)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 5328506)
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
-- TOC entry 181 (class 1259 OID 5328421)
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
-- TOC entry 182 (class 1259 OID 5328432)
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
-- TOC entry 177 (class 1259 OID 5328386)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 5328405)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 5328694)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 5328725)
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
-- TOC entry 223 (class 1259 OID 5328858)
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
-- TOC entry 184 (class 1259 OID 5328463)
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
-- TOC entry 186 (class 1259 OID 5328498)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 5328668)
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
-- TOC entry 185 (class 1259 OID 5328483)
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
-- TOC entry 191 (class 1259 OID 5328561)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 5328680)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 5328800)
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
-- TOC entry 222 (class 1259 OID 5328851)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 5328709)
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
-- TOC entry 201 (class 1259 OID 5328653)
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
-- TOC entry 200 (class 1259 OID 5328643)
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
-- TOC entry 221 (class 1259 OID 5328840)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 5328777)
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
-- TOC entry 174 (class 1259 OID 5328357)
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
-- TOC entry 173 (class 1259 OID 5328355)
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
-- TOC entry 210 (class 1259 OID 5328719)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 5328395)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 5328379)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 5328733)
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
-- TOC entry 204 (class 1259 OID 5328674)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 5328624)
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
-- TOC entry 230 (class 1259 OID 5328948)
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
-- TOC entry 229 (class 1259 OID 5328941)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 5328936)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 5328787)
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
-- TOC entry 231 (class 1259 OID 5328956)
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE strosekuprizoritve_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 183 (class 1259 OID 5328455)
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
-- TOC entry 199 (class 1259 OID 5328630)
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
-- TOC entry 220 (class 1259 OID 5328829)
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
-- TOC entry 188 (class 1259 OID 5328518)
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
-- TOC entry 175 (class 1259 OID 5328366)
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
-- TOC entry 225 (class 1259 OID 5328884)
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
-- TOC entry 193 (class 1259 OID 5328576)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 5328701)
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
-- TOC entry 215 (class 1259 OID 5328769)
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
-- TOC entry 195 (class 1259 OID 5328608)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 5328874)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 5328759)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2146 (class 2604 OID 5328360)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2700 (class 0 OID 5328412)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2747 (class 0 OID 5328922)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
000c0000-5565-befe-f526-ae63ab8a9c9f	000d0000-5565-befe-ca3d-6f9483fb0ad7	\N	00090000-5565-befe-13e4-91ba2fe6ecad	\N	\N	0001	f	\N	\N	\N	\N	\N	\N
000c0000-5565-befe-a4fc-0d1d4d92a13f	000d0000-5565-befe-7306-e68fe097c266	\N	00090000-5565-befe-730d-0e32571fa287	\N	\N	0002	f	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2746 (class 0 OID 5328905)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2739 (class 0 OID 5328815)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-5565-befe-c1e3-70b8f2ee01fa	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-5565-befe-1e88-109a82cfc70a	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-5565-befe-56ef-2bb45706113b	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 2714 (class 0 OID 5328585)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2717 (class 0 OID 5328619)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2709 (class 0 OID 5328532)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5565-befd-53c8-b7340f9118ff	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5565-befd-2369-a0c5160cc866	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5565-befd-e586-e52a926fbc00	AL	ALB	008	Albania 	Albanija	\N
00040000-5565-befd-f905-203eebec4a7e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5565-befd-3ccb-81b3282a6a97	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5565-befd-87fd-f2cb7c07607b	AD	AND	020	Andorra 	Andora	\N
00040000-5565-befd-0343-5e0363356106	AO	AGO	024	Angola 	Angola	\N
00040000-5565-befd-cba2-23daff852ad3	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5565-befd-3866-9b201440ff65	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5565-befd-bcc4-e8b26330c1b3	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5565-befd-8c6c-e3633da62cfd	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5565-befd-d31b-3e63b0be4a58	AM	ARM	051	Armenia 	Armenija	\N
00040000-5565-befd-32b7-9774e25c6471	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5565-befd-f504-2501f35fe214	AU	AUS	036	Australia 	Avstralija	\N
00040000-5565-befd-605e-bc8de4fe49f7	AT	AUT	040	Austria 	Avstrija	\N
00040000-5565-befd-5768-b4ce7ecc3ff2	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5565-befd-c0d3-01ed897c6314	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5565-befd-3c71-8d83644eef1b	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5565-befd-19ea-1c63402766dc	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5565-befd-3f45-0d6d41d8a4ec	BB	BRB	052	Barbados 	Barbados	\N
00040000-5565-befd-b762-57f4d9aab944	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5565-befd-672f-9597d78d39a4	BE	BEL	056	Belgium 	Belgija	\N
00040000-5565-befd-c5ee-a6e25aefd33e	BZ	BLZ	084	Belize 	Belize	\N
00040000-5565-befd-8a2e-f5154c883368	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5565-befd-8c36-406edd789e44	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5565-befd-c2a5-65f5f853e527	BT	BTN	064	Bhutan 	Butan	\N
00040000-5565-befd-beb7-b5267ab007fc	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5565-befd-dbcc-72257cd1725e	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5565-befd-ac3c-e4e0439038e0	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5565-befd-1c9e-b430d49032fe	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5565-befd-7b49-05359d75b407	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5565-befd-1457-7be2f213c323	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5565-befd-9039-ea6bfba6fdee	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5565-befd-d2a0-5402f7323018	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5565-befd-29a8-b80cb7656b9f	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5565-befd-4674-a5c4a1faeba4	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5565-befd-4b27-c7592d1d8f33	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5565-befd-d467-f0cc7dbf8122	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5565-befd-8b47-0a1f11f37c1e	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5565-befd-0404-5095429bc31b	CA	CAN	124	Canada 	Kanada	\N
00040000-5565-befd-ec71-5313059631f0	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5565-befd-bf34-7d7f9660760d	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5565-befd-d7f5-cd03dc433405	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5565-befd-147d-8464fc065f68	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5565-befd-7e9e-29b1c81bb13e	CL	CHL	152	Chile 	Čile	\N
00040000-5565-befd-42c0-82fc0117fde7	CN	CHN	156	China 	Kitajska	\N
00040000-5565-befd-c657-71e8ada2f699	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5565-befd-2267-50d49ecfb5da	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5565-befd-f3e4-85ee56ad5b00	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5565-befd-9590-ec903ec0baba	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5565-befd-03bf-4d1804b19a57	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5565-befd-3a46-d7b596e411f0	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5565-befd-5179-8e5ab01845cf	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5565-befd-cb7c-5ca9716994c0	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5565-befd-125c-d49d3e761414	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5565-befd-aace-f8a5e16c8db6	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5565-befd-3155-210bc78e9f21	CU	CUB	192	Cuba 	Kuba	\N
00040000-5565-befd-9069-1de326288ae4	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5565-befd-017f-73a0db36a643	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5565-befd-2113-f8245c2b0c8f	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5565-befd-5c33-16d93f703446	DK	DNK	208	Denmark 	Danska	\N
00040000-5565-befd-3913-49b712e03dce	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5565-befd-3647-0b0a19bbdc2c	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5565-befd-642c-50009038d48a	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5565-befd-792b-31fe077ec6e6	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5565-befd-1c8f-4c787995dbb7	EG	EGY	818	Egypt 	Egipt	\N
00040000-5565-befd-36b9-976e2a261c9e	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5565-befd-8721-3aca0b023d57	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5565-befd-bc8f-b6a0daf0c696	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5565-befd-f4fa-9bc75618290f	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5565-befd-889f-9344c2548829	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5565-befd-d6f8-e05512dcee96	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5565-befd-25ee-415cf53bba3f	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5565-befd-e311-146e0e3aa6b6	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5565-befd-73f0-650cfc7990e4	FI	FIN	246	Finland 	Finska	\N
00040000-5565-befd-d53c-ee1cfe628df3	FR	FRA	250	France 	Francija	\N
00040000-5565-befd-8e2a-0fdeb8405a3d	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5565-befe-7055-f9ef2a2648a7	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5565-befd-8332-b6dabe3c2bf3	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5565-befd-3cdf-da5a915f5e10	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5565-befd-68f6-a47acf4ee0be	GA	GAB	266	Gabon 	Gabon	\N
00040000-5565-befe-2a39-abf77280d2d0	GM	GMB	270	Gambia 	Gambija	\N
00040000-5565-befe-6c72-9afc726d5fc2	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5565-befe-5164-ec45ab532be1	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5565-befe-3233-be2f95e933ed	GH	GHA	288	Ghana 	Gana	\N
00040000-5565-befe-987d-916d2473ad62	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5565-befe-2d06-dfde0266353a	GR	GRC	300	Greece 	Grčija	\N
00040000-5565-befe-6500-37193942bce5	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5565-befe-491d-16558084cb59	GD	GRD	308	Grenada 	Grenada	\N
00040000-5565-befe-25aa-94b0be2ad644	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5565-befe-42b7-729d3686de7c	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5565-befe-5f94-2109be910ac6	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5565-befe-ef93-a54eff89d155	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5565-befe-d1af-2887cdb6f8b4	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5565-befe-fca6-c2e359ca91b5	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5565-befe-3e6b-64625adb8c9c	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5565-befe-3d0b-513dbf8d9b14	HT	HTI	332	Haiti 	Haiti	\N
00040000-5565-befe-145e-fc57c619bc9b	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5565-befe-d824-11f0ab4f2163	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5565-befe-dd36-e66dd8b3370a	HN	HND	340	Honduras 	Honduras	\N
00040000-5565-befe-3c4a-1d4fc8d72d45	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5565-befe-a201-295a88482dc9	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5565-befe-d74d-cb59c5f4f65d	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5565-befe-344c-efe4a5eaf034	IN	IND	356	India 	Indija	\N
00040000-5565-befe-d94a-697eef279268	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5565-befe-100a-2fedf310f5f1	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5565-befe-96fd-cb1349642bd2	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5565-befe-e33b-a02b07238c9e	IE	IRL	372	Ireland 	Irska	\N
00040000-5565-befe-1611-6d25b9eae0ce	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5565-befe-9743-d9a004115093	IL	ISR	376	Israel 	Izrael	\N
00040000-5565-befe-49b3-dcad00f8913e	IT	ITA	380	Italy 	Italija	\N
00040000-5565-befe-6dd8-1cb9acd04aa9	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5565-befe-3a05-cd383cdc2fd9	JP	JPN	392	Japan 	Japonska	\N
00040000-5565-befe-38d1-946d1c667cdd	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5565-befe-ad45-3467fcbcd49f	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5565-befe-fe38-d4520c628882	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5565-befe-2ece-4bd9b879dcdc	KE	KEN	404	Kenya 	Kenija	\N
00040000-5565-befe-1c20-1dc72467e307	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5565-befe-0416-81e117bf04ae	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5565-befe-7b78-ba05fc0447c8	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5565-befe-21ea-e09ac26814c8	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5565-befe-fe58-39ed1c2ca085	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5565-befe-1011-31c86a64bbd8	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5565-befe-401e-a0137c72eb8e	LV	LVA	428	Latvia 	Latvija	\N
00040000-5565-befe-bb57-000fad76a6dd	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5565-befe-be61-9d5c078b9123	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5565-befe-c6c7-630ce6870e6a	LR	LBR	430	Liberia 	Liberija	\N
00040000-5565-befe-0514-3b47fda16df0	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5565-befe-8fb6-cbca53edf652	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5565-befe-dd61-a1392ce5b746	LT	LTU	440	Lithuania 	Litva	\N
00040000-5565-befe-59f1-aa48c08abac7	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5565-befe-d789-a9697b4368f9	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5565-befe-4f13-3eecbaee4bfa	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5565-befe-08e5-8256cb0dbe01	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5565-befe-5f98-145d631e0097	MW	MWI	454	Malawi 	Malavi	\N
00040000-5565-befe-b427-a38beca56fa6	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5565-befe-e889-fb690e938bbd	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5565-befe-ae9d-ec6cfa6b5088	ML	MLI	466	Mali 	Mali	\N
00040000-5565-befe-5d8a-1aa4c81f5d21	MT	MLT	470	Malta 	Malta	\N
00040000-5565-befe-b99b-8ef4d0627dbb	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5565-befe-a503-d20349bbd246	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5565-befe-cea4-9daf4a80e0a3	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5565-befe-987e-c484ce3daabf	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5565-befe-ebea-31c8c8ab6302	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5565-befe-e60f-7fb7064bc5ed	MX	MEX	484	Mexico 	Mehika	\N
00040000-5565-befe-5a09-af586d31db7f	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5565-befe-b75e-9f23ce75cfac	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5565-befe-dd0c-654e7e7bc0e6	MC	MCO	492	Monaco 	Monako	\N
00040000-5565-befe-7e63-94acfde30ac8	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5565-befe-4eb4-ae2a979e4da0	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5565-befe-d3d5-7910e8ec190d	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5565-befe-6a65-48d204e39261	MA	MAR	504	Morocco 	Maroko	\N
00040000-5565-befe-5c7f-03ee9cee5b04	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5565-befe-c7e5-8ee56310ae6c	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5565-befe-9ec4-f4fdaff67206	NA	NAM	516	Namibia 	Namibija	\N
00040000-5565-befe-6f0e-6b44ffab573f	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5565-befe-065a-7f9577ba57cb	NP	NPL	524	Nepal 	Nepal	\N
00040000-5565-befe-8474-55eebe824fbc	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5565-befe-0861-86bd808fb928	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5565-befe-b04e-a4c760224e75	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5565-befe-7102-61eb9708d787	NE	NER	562	Niger 	Niger 	\N
00040000-5565-befe-b3a9-afa2ea9939bb	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5565-befe-4f01-5d8e8a6e8b50	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5565-befe-e9e4-20926fa46d59	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5565-befe-0ea6-0d430cedf6b5	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5565-befe-b0ca-30aac47905fc	NO	NOR	578	Norway 	Norveška	\N
00040000-5565-befe-551a-081ae730befa	OM	OMN	512	Oman 	Oman	\N
00040000-5565-befe-66fa-bcfaea1a3e84	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5565-befe-a19b-fc0e5b1fa19f	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5565-befe-d5cb-2ae19b446123	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5565-befe-6ed6-c7e8f388d0ad	PA	PAN	591	Panama 	Panama	\N
00040000-5565-befe-2289-063b0d2a5592	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5565-befe-37cf-f15b252da4df	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5565-befe-3a2f-1a740cde5725	PE	PER	604	Peru 	Peru	\N
00040000-5565-befe-7361-ee2f73e81fb2	PH	PHL	608	Philippines 	Filipini	\N
00040000-5565-befe-c563-d884a63d8a59	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5565-befe-58af-1ff9e1cc348c	PL	POL	616	Poland 	Poljska	\N
00040000-5565-befe-654e-4c1fd3933a1f	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5565-befe-8dbf-40ef394d8e5f	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5565-befe-bc56-6bf7b12d54a3	QA	QAT	634	Qatar 	Katar	\N
00040000-5565-befe-2474-8d41d8a032e2	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5565-befe-e4bd-cd3c2e23e844	RO	ROU	642	Romania 	Romunija	\N
00040000-5565-befe-5cf2-317a7b9fc68b	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5565-befe-309b-442199590de9	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5565-befe-7f5a-13fd7a67071c	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5565-befe-e20a-5e9cfb413b38	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5565-befe-8b5b-3651c433a763	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5565-befe-5b86-46acc28acada	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5565-befe-5911-04cf685a36b2	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5565-befe-d398-84d789caaaed	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5565-befe-cf1a-8ad800563112	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5565-befe-e9b7-836ac9ad709f	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5565-befe-8cd5-d414ff01daf2	SM	SMR	674	San Marino 	San Marino	\N
00040000-5565-befe-c140-e8598f2ee54c	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5565-befe-141a-6d042d484310	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5565-befe-67c8-2c22a75e5b35	SN	SEN	686	Senegal 	Senegal	\N
00040000-5565-befe-76a2-e2e5caf30509	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5565-befe-06ce-54c467a64fef	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5565-befe-a518-abbef9fd6883	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5565-befe-3ac7-dafd20e68925	SG	SGP	702	Singapore 	Singapur	\N
00040000-5565-befe-ee1f-52940e639bb9	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5565-befe-4727-fd53bb2fb3d6	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5565-befe-030c-5b4043ec6880	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5565-befe-5e79-7098bd29307e	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5565-befe-77dd-5bcba910d8bd	SO	SOM	706	Somalia 	Somalija	\N
00040000-5565-befe-7582-f3124efb9eba	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5565-befe-c87b-a2b3212681ec	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5565-befe-6185-fa584686a635	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5565-befe-f724-d00ce7db0bb9	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5565-befe-1c3e-657d4967e43f	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5565-befe-af00-9eb7296e5891	SD	SDN	729	Sudan 	Sudan	\N
00040000-5565-befe-20ad-46c0fe4fc593	SR	SUR	740	Suriname 	Surinam	\N
00040000-5565-befe-3b73-befcaf613ab9	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5565-befe-d1c9-68ecc0fdaac2	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5565-befe-4902-af64e2f237da	SE	SWE	752	Sweden 	Švedska	\N
00040000-5565-befe-f217-2b68c6d0fcab	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5565-befe-9cad-06c14005c9f1	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5565-befe-9922-ac1f91b9a788	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5565-befe-3ea1-e50de4fc20b0	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5565-befe-aaa2-4d3037028549	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5565-befe-8e93-d6971c46a900	TH	THA	764	Thailand 	Tajska	\N
00040000-5565-befe-5afb-658f5bd20bba	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5565-befe-f54b-10ca308cdcc2	TG	TGO	768	Togo 	Togo	\N
00040000-5565-befe-141b-81e5b9ccecb6	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5565-befe-9a56-2176eddc5f61	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5565-befe-6eb6-a9da0204bf5c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5565-befe-e6d6-611617800b40	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5565-befe-3474-b60a3d55818a	TR	TUR	792	Turkey 	Turčija	\N
00040000-5565-befe-a97b-8e37ce0c42de	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5565-befe-4582-b1ec02289d8f	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5565-befe-085f-96b90fc1a31b	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5565-befe-741d-4c25f7f624f5	UG	UGA	800	Uganda 	Uganda	\N
00040000-5565-befe-a9d1-740c80c5c3bb	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5565-befe-b492-9910d2237961	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5565-befe-c7b3-c0eef750fac2	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5565-befe-6975-45dea6372f91	US	USA	840	United States 	Združene države Amerike	\N
00040000-5565-befe-9cd7-a97389828fd5	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5565-befe-670f-280561b6766b	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5565-befe-c429-342bdd792dd0	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5565-befe-149d-faeaecc954ef	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5565-befe-d457-816b93a69452	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5565-befe-d84b-e453a1c3a31f	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5565-befe-89c1-887c47044a7a	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5565-befe-475c-bc4780f02179	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5565-befe-5792-0c3358a6e2e1	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5565-befe-fb00-a026afe71e8c	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5565-befe-b694-bf3561f8c858	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5565-befe-1f4d-66879205d576	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5565-befe-2852-72f8f80eae5f	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2733 (class 0 OID 5328745)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj) FROM stdin;
000d0000-5565-befe-0c9f-e1329568a461	000e0000-5565-befe-90cd-877f06ad046f	\N	000f0000-5565-befd-1693-32f20093a2c1	igralec	Hipolita	glavna vloga	velika	t	6	t	t	\N
000d0000-5565-befe-ca3d-6f9483fb0ad7	000e0000-5565-befe-90cd-877f06ad046f	\N	000f0000-5565-befd-1693-32f20093a2c1	igralec	Tezej	glavna vloga	velika	t	5	t	t	\N
000d0000-5565-befe-7306-e68fe097c266	000e0000-5565-befe-90cd-877f06ad046f	\N	000f0000-5565-befd-032c-a6e80df6de9d	umetnik	Režija		velika	t	8	t	t	\N
\.


--
-- TOC entry 2712 (class 0 OID 5328569)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2716 (class 0 OID 5328613)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2710 (class 0 OID 5328549)
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
-- TOC entry 2722 (class 0 OID 5328662)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2726 (class 0 OID 5328687)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2707 (class 0 OID 5328506)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5565-befe-0cc3-4cbb542e4315	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5565-befe-7d83-6cfc75fdf478	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5565-befe-9e7c-a3612bd808e3	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5565-befe-fb1a-668bd8cf348b	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5565-befe-ac04-53a823008cb4	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5565-befe-674f-8f655f91bc0f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5565-befe-0c14-5236904c1ce9	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5565-befe-de00-bd01da452679	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5565-befe-cbde-04c68b2e1bf8	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5565-befe-294a-4e293a3fc773	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5565-befe-c5b7-4f1310dc2299	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5565-befe-3645-1d19aa5ea1a8	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5565-befe-41c2-b542acded98b	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5565-befe-f475-dcbc9acbd58f	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5565-befe-4d55-0d9028024aaa	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2701 (class 0 OID 5328421)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5565-befe-615f-fa55cf7c205c	00000000-5565-befe-ac04-53a823008cb4	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5565-befe-c3ab-73a8275dd2c5	00000000-5565-befe-ac04-53a823008cb4	00010000-5565-befe-6105-d2c6e7441836	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5565-befe-9084-1250c20dce02	00000000-5565-befe-674f-8f655f91bc0f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2702 (class 0 OID 5328432)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, sifra, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5565-befe-9439-e4ca64c12afe	\N	0001	g.	Janez	Novak	a	Peter	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5565-befe-0e94-693d6bc9961b	\N	0002	dr.	Anton	Horvat	b			anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5565-befe-d32e-72e07b11d86d	\N	0003		Ivan	Kovačič	c			ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5565-befe-1b6a-1bf3177bf141	\N	0004	prof.	Jožef	Krajnc	d		Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5565-befe-0ae8-7ebc115f6d62	\N	0005		Marko	Zupančič	e			marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5565-befe-77dc-41733bf06d28	\N	0006	ga.	Marija	Kovač	f			marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5565-befe-aad2-d68348e43e08	\N	0007	ga.	Ana	Potočnik	g			ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5565-befe-6129-7827c4e8c6a8	\N	0008	ga.	Maja	Mlakar	h			maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5565-befe-13e4-91ba2fe6ecad	\N	0009		Irena	Kos	i			irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5565-befe-730d-0e32571fa287	\N	0010		Mojca	Vidmar	J			mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5565-befe-916d-3889ba91ec24	\N	0011		xx	write protected12345	\N			xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2692 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2697 (class 0 OID 5328386)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5565-befe-9087-b71a2d669039	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5565-befe-cb47-21597507c5fe	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5565-befe-8a74-2e3dede185b4	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5565-befe-8cbb-e16314614ba8	Abonma-read	Abonma - branje	f
00030000-5565-befe-56cf-1db87eb6a56a	Abonma-write	Abonma - spreminjanje	f
00030000-5565-befe-67f0-4e6f304bf509	Alternacija-read	Alternacija - branje	f
00030000-5565-befe-5f7f-904366442f45	Alternacija-write	Alternacija - spreminjanje	f
00030000-5565-befe-ecff-d6ff64d7b491	Arhivalija-read	Arhivalija - branje	f
00030000-5565-befe-60b2-c2af9982b61c	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5565-befe-a288-c6411131312a	Besedilo-read	Besedilo - branje	f
00030000-5565-befe-502c-0bfaea80700b	Besedilo-write	Besedilo - spreminjanje	f
00030000-5565-befe-87ae-173a30ca8405	DogodekIzven-read	DogodekIzven - branje	f
00030000-5565-befe-2bcb-d7e3058c06d1	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5565-befe-5b53-c77f11d0912c	Dogodek-read	Dogodek - branje	f
00030000-5565-befe-0b0c-78269918c773	Dogodek-write	Dogodek - spreminjanje	f
00030000-5565-befe-3f6a-51f9b58c1e90	Drzava-read	Drzava - branje	f
00030000-5565-befe-f32c-8bf032426cc5	Drzava-write	Drzava - spreminjanje	f
00030000-5565-befe-76d0-045c51556b3e	Funkcija-read	Funkcija - branje	f
00030000-5565-befe-b29a-0fc49c48ffe2	Funkcija-write	Funkcija - spreminjanje	f
00030000-5565-befe-f513-737b12606cba	Gostovanje-read	Gostovanje - branje	f
00030000-5565-befe-f8ff-5b5d18378731	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5565-befe-34c2-f5ce9f91c792	Gostujoca-read	Gostujoca - branje	f
00030000-5565-befe-49a5-a0c6fb833c88	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5565-befe-af01-aa7a24fcb812	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5565-befe-e5be-ccefc3140f0f	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5565-befe-d4af-871e52d678c9	Kupec-read	Kupec - branje	f
00030000-5565-befe-7b5c-3c5759267b90	Kupec-write	Kupec - spreminjanje	f
00030000-5565-befe-5710-f057d63023f4	NacinPlacina-read	NacinPlacina - branje	f
00030000-5565-befe-abbf-06c9954c8964	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5565-befe-75ca-859d94cbf67e	Option-read	Option - branje	f
00030000-5565-befe-9571-fbe899dbdf5c	Option-write	Option - spreminjanje	f
00030000-5565-befe-efa5-c85ec4b53033	OptionValue-read	OptionValue - branje	f
00030000-5565-befe-4c4b-68698c5cb233	OptionValue-write	OptionValue - spreminjanje	f
00030000-5565-befe-ae59-23f107c2b4bb	Oseba-read	Oseba - branje	f
00030000-5565-befe-393e-be5d30472231	Oseba-write	Oseba - spreminjanje	f
00030000-5565-befe-ce3f-0f9057b17ca7	Permission-read	Permission - branje	f
00030000-5565-befe-514d-8fb65c3e9619	Permission-write	Permission - spreminjanje	f
00030000-5565-befe-cc98-ac4781b705a2	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5565-befe-1d42-abc2b2d2b721	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5565-befe-17d1-4c13f2a52f27	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5565-befe-551a-79e7b1b70fcb	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5565-befe-fde3-c322f65ff735	Pogodba-read	Pogodba - branje	f
00030000-5565-befe-77d6-552610d8fbeb	Pogodba-write	Pogodba - spreminjanje	f
00030000-5565-befe-e980-6276b2f1829e	Popa-read	Popa - branje	f
00030000-5565-befe-b3e6-cb469d8c6c9b	Popa-write	Popa - spreminjanje	f
00030000-5565-befe-6828-7b4405c71d7b	Posta-read	Posta - branje	f
00030000-5565-befe-f395-9ea9da1f3f06	Posta-write	Posta - spreminjanje	f
00030000-5565-befe-eec7-7d7385f18284	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5565-befe-b496-db02c43e5301	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5565-befe-6f8b-4dff75fe1a67	PostniNaslov-read	PostniNaslov - branje	f
00030000-5565-befe-9b24-e10830212167	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5565-befe-af4a-06d78abcb173	Predstava-read	Predstava - branje	f
00030000-5565-befe-02c5-aa2b40762514	Predstava-write	Predstava - spreminjanje	f
00030000-5565-befe-a104-a0e1fa5df848	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5565-befe-efe8-eeaa29678466	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5565-befe-dd48-5e4dfc2c4411	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5565-befe-29f7-2ce0e3c9c095	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5565-befe-fa9c-77437897dfa9	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5565-befe-3ea7-584c3c77ce93	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5565-befe-7c7c-056bf5a443ad	Prostor-read	Prostor - branje	f
00030000-5565-befe-acef-e1da2ebe5301	Prostor-write	Prostor - spreminjanje	f
00030000-5565-befe-fdc7-794199282c16	Racun-read	Racun - branje	f
00030000-5565-befe-32b7-dca0e4be4256	Racun-write	Racun - spreminjanje	f
00030000-5565-befe-9c12-c5d5f200255f	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5565-befe-19f1-8353b59754e6	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5565-befe-1d0b-f014b0fffcc7	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5565-befe-9b35-677298407e87	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5565-befe-f5f2-32a249f9022f	Rekvizit-read	Rekvizit - branje	f
00030000-5565-befe-3834-a7e460105059	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5565-befe-57d1-457d85a0e3a0	Revizija-read	Revizija - branje	f
00030000-5565-befe-5573-929902d95612	Revizija-write	Revizija - spreminjanje	f
00030000-5565-befe-7041-265eed08b67c	Rezervacija-read	Rezervacija - branje	f
00030000-5565-befe-9690-30dce8f67b82	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5565-befe-802c-c61d936892a5	Role-read	Role - branje	f
00030000-5565-befe-8ad6-75f78955610c	Role-write	Role - spreminjanje	f
00030000-5565-befe-2ade-0a22be44a2bb	SedezniRed-read	SedezniRed - branje	f
00030000-5565-befe-8cfd-f34c8b49fa22	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5565-befe-6cd5-87ae98d0fabf	Sedez-read	Sedez - branje	f
00030000-5565-befe-a6a8-af39780f0116	Sedez-write	Sedez - spreminjanje	f
00030000-5565-befe-9fa6-a146504f6c84	Sezona-read	Sezona - branje	f
00030000-5565-befe-ea19-c8125d09574a	Sezona-write	Sezona - spreminjanje	f
00030000-5565-befe-aa3f-7ac11ef145c0	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5565-befe-8c42-f2521f9481a8	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5565-befe-df68-31cf77e69c3c	Stevilcenje-read	Stevilcenje - branje	f
00030000-5565-befe-fd3f-661badf4f8da	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5565-befe-a395-99adb32a4790	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5565-befe-5c1e-2a290f750380	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5565-befe-4388-c6bb0a645ce1	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5565-befe-440e-abcccbaf4389	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5565-befe-369c-f4f780a0cec6	Telefonska-read	Telefonska - branje	f
00030000-5565-befe-fb8a-ce862b1a6429	Telefonska-write	Telefonska - spreminjanje	f
00030000-5565-befe-0b5b-66a79b82094b	TerminStoritve-read	TerminStoritve - branje	f
00030000-5565-befe-f625-95f5f0d77129	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5565-befe-5f88-ceda848320d1	TipFunkcije-read	TipFunkcije - branje	f
00030000-5565-befe-efc7-59207fb3e2c8	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5565-befe-3369-4f7071fe2e81	Trr-read	Trr - branje	f
00030000-5565-befe-ec9f-138fc5d684d0	Trr-write	Trr - spreminjanje	f
00030000-5565-befe-e218-168bbe64fbe6	Uprizoritev-read	Uprizoritev - branje	f
00030000-5565-befe-b6b6-7bd342f55b1e	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5565-befe-d877-2c0f2701fbf4	User-read	User - branje	f
00030000-5565-befe-6c58-e85cc70b3b5b	User-write	User - spreminjanje	f
00030000-5565-befe-f3bf-1515e6e6390b	Vaja-read	Vaja - branje	f
00030000-5565-befe-b031-8ef63499008c	Vaja-write	Vaja - spreminjanje	f
00030000-5565-befe-0324-047b2e9260e4	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5565-befe-74d0-3d2fa3ff7d1e	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5565-befe-80cd-43e04c25c29d	Zaposlitev-read	Zaposlitev - branje	f
00030000-5565-befe-41f5-92787f7358a9	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5565-befe-87c0-8aa72fc5ec05	Zasedenost-read	Zasedenost - branje	f
00030000-5565-befe-5493-4cb44c81d0ba	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5565-befe-5201-c0d6040b4f51	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5565-befe-4d22-9f1d9f967523	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5565-befe-55f5-5e9ee47c1b0b	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5565-befe-169c-9e920a56beea	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2699 (class 0 OID 5328405)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5565-befe-a011-32f62083564f	00030000-5565-befe-3f6a-51f9b58c1e90
00020000-5565-befe-a535-322a53c4de9e	00030000-5565-befe-f32c-8bf032426cc5
00020000-5565-befe-a535-322a53c4de9e	00030000-5565-befe-3f6a-51f9b58c1e90
\.


--
-- TOC entry 2727 (class 0 OID 5328694)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2731 (class 0 OID 5328725)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2743 (class 0 OID 5328858)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2704 (class 0 OID 5328463)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5565-befe-737d-015d6e9575cb	00040000-5565-befd-53c8-b7340f9118ff	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5565-befe-0e6a-8cc4acc6d28c	00040000-5565-befd-53c8-b7340f9118ff	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2706 (class 0 OID 5328498)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5565-befd-f838-c48897a40740	8341	Adlešiči
00050000-5565-befd-4b5e-7ca03678596c	5270	Ajdovščina
00050000-5565-befd-7773-464344d42d43	6280	Ankaran/Ancarano
00050000-5565-befd-15f4-2bb6ca19011a	9253	Apače
00050000-5565-befd-c656-445503a64c29	8253	Artiče
00050000-5565-befd-7b06-cdc6164c59c8	4275	Begunje na Gorenjskem
00050000-5565-befd-8ccb-d49d0610eda4	1382	Begunje pri Cerknici
00050000-5565-befd-0480-76d376b9a2f2	9231	Beltinci
00050000-5565-befd-4874-45cd1edb8d33	2234	Benedikt
00050000-5565-befd-42a5-ad14408f76f1	2345	Bistrica ob Dravi
00050000-5565-befd-f6ba-df4dfe8de7c0	3256	Bistrica ob Sotli
00050000-5565-befd-ecd2-50ac6c73f6ff	8259	Bizeljsko
00050000-5565-befd-8e9f-cab437dfd038	1223	Blagovica
00050000-5565-befd-7f98-4d78052a455f	8283	Blanca
00050000-5565-befd-972d-adeb8d718951	4260	Bled
00050000-5565-befd-6850-72c13a71c243	4273	Blejska Dobrava
00050000-5565-befd-69a9-30238e6cf9e9	9265	Bodonci
00050000-5565-befd-7b8c-5c9c74b182ea	9222	Bogojina
00050000-5565-befd-58a1-567c6cdced5e	4263	Bohinjska Bela
00050000-5565-befd-993b-54c29c0f2181	4264	Bohinjska Bistrica
00050000-5565-befd-f733-c146bc8fd2ae	4265	Bohinjsko jezero
00050000-5565-befd-409c-9ef81c71dc7c	1353	Borovnica
00050000-5565-befd-a7de-8c1c284baf52	8294	Boštanj
00050000-5565-befd-e463-95439d3966d6	5230	Bovec
00050000-5565-befd-91b6-f5203dc068d5	5295	Branik
00050000-5565-befd-44c3-1110108a9322	3314	Braslovče
00050000-5565-befd-e2fb-cffec9f3e946	5223	Breginj
00050000-5565-befd-8a53-fe507e1dcf25	8280	Brestanica
00050000-5565-befd-c69b-2004a17568df	2354	Bresternica
00050000-5565-befd-d162-17f238870b27	4243	Brezje
00050000-5565-befd-8f68-16248b0481b8	1351	Brezovica pri Ljubljani
00050000-5565-befd-0212-ccf5db04fc5e	8250	Brežice
00050000-5565-befd-c25c-527766441072	4210	Brnik - Aerodrom
00050000-5565-befd-99f5-3228d12c7fb1	8321	Brusnice
00050000-5565-befd-a15a-3e5b0bdf63a5	3255	Buče
00050000-5565-befd-9b67-b1570ff0f4be	8276	Bučka 
00050000-5565-befd-c086-bbf49a190fb2	9261	Cankova
00050000-5565-befd-c65c-59232823d02c	3000	Celje 
00050000-5565-befd-36c7-c059d3ffc539	3001	Celje - poštni predali
00050000-5565-befd-be4b-e5f5e19aaeaa	4207	Cerklje na Gorenjskem
00050000-5565-befd-7bc6-2936ca67abc3	8263	Cerklje ob Krki
00050000-5565-befd-8fa8-9ab4fe15038a	1380	Cerknica
00050000-5565-befd-48e6-71d648e2a6c6	5282	Cerkno
00050000-5565-befd-e993-4088cc3906d3	2236	Cerkvenjak
00050000-5565-befd-1e72-68fd43c28647	2215	Ceršak
00050000-5565-befd-33b2-19e7f1687897	2326	Cirkovce
00050000-5565-befd-a201-60e5b8ca3e11	2282	Cirkulane
00050000-5565-befd-db06-7820379a273e	5273	Col
00050000-5565-befd-7f96-ec33de2aae84	8251	Čatež ob Savi
00050000-5565-befd-dca6-105d85bacbc4	1413	Čemšenik
00050000-5565-befd-f473-3b31bc571d3f	5253	Čepovan
00050000-5565-befd-f0c8-aa605340c41a	9232	Črenšovci
00050000-5565-befd-d3c6-37420ab09d27	2393	Črna na Koroškem
00050000-5565-befd-dde4-c7a0bddf4dcb	6275	Črni Kal
00050000-5565-befd-308d-6f31185ac1ec	5274	Črni Vrh nad Idrijo
00050000-5565-befd-22a4-a5067b8a2b59	5262	Črniče
00050000-5565-befd-ec14-b47d8f1acc1c	8340	Črnomelj
00050000-5565-befd-cbca-0df84d4182b4	6271	Dekani
00050000-5565-befd-1019-12f9ef74a972	5210	Deskle
00050000-5565-befd-7edb-20127009926a	2253	Destrnik
00050000-5565-befd-6dce-58714a1b54b5	6215	Divača
00050000-5565-befd-3b7c-d6e02f854e30	1233	Dob
00050000-5565-befd-0b06-7d4bd4812dd0	3224	Dobje pri Planini
00050000-5565-befd-83be-13460efca958	8257	Dobova
00050000-5565-befd-26f2-598c2e134ff8	1423	Dobovec
00050000-5565-befd-1672-52909eb0c32c	5263	Dobravlje
00050000-5565-befd-02bb-e735b3442093	3204	Dobrna
00050000-5565-befd-f08f-8a8501244567	8211	Dobrnič
00050000-5565-befd-e167-dbb39b679542	1356	Dobrova
00050000-5565-befd-16c8-595a112edea1	9223	Dobrovnik/Dobronak 
00050000-5565-befd-7f39-0a2ae0a72a3a	5212	Dobrovo v Brdih
00050000-5565-befd-3c8f-1a9e2e59c061	1431	Dol pri Hrastniku
00050000-5565-befd-4604-a82180c685cd	1262	Dol pri Ljubljani
00050000-5565-befd-714b-63fbf591a57a	1273	Dole pri Litiji
00050000-5565-befd-0fcf-d09f3e709eca	1331	Dolenja vas
00050000-5565-befd-7cb7-add545ff1ba0	8350	Dolenjske Toplice
00050000-5565-befd-60aa-c94b5580747b	1230	Domžale
00050000-5565-befd-692b-98a38d235d71	2252	Dornava
00050000-5565-befd-a8f1-f6b90b72dc5e	5294	Dornberk
00050000-5565-befd-d87a-49892197da3b	1319	Draga
00050000-5565-befd-80e9-575efdca3454	8343	Dragatuš
00050000-5565-befd-0149-208a92368889	3222	Dramlje
00050000-5565-befd-605d-a746a85be055	2370	Dravograd
00050000-5565-befd-0284-ef1777da6dde	4203	Duplje
00050000-5565-befd-4315-a35cc3b50886	6221	Dutovlje
00050000-5565-befd-dd4a-100cd410d49e	8361	Dvor
00050000-5565-befd-9319-1f2bc18afaae	2343	Fala
00050000-5565-befd-f361-9e0eb4a7c569	9208	Fokovci
00050000-5565-befd-16d9-7e837dba0946	2313	Fram
00050000-5565-befd-3206-53a102c48ff4	3213	Frankolovo
00050000-5565-befd-256b-5c9f47a78e7d	1274	Gabrovka
00050000-5565-befd-d0ea-378064615a0a	8254	Globoko
00050000-5565-befd-7715-5bbc8cc28fb3	5275	Godovič
00050000-5565-befd-b423-694ec2871cc0	4204	Golnik
00050000-5565-befd-13b0-d06989203ecc	3303	Gomilsko
00050000-5565-befd-98e0-47ec1106c354	4224	Gorenja vas
00050000-5565-befd-4e27-7f2972957716	3263	Gorica pri Slivnici
00050000-5565-befd-6505-f2c6295d24f0	2272	Gorišnica
00050000-5565-befd-c56e-754f5b96c583	9250	Gornja Radgona
00050000-5565-befd-abbc-7c82f1f5254a	3342	Gornji Grad
00050000-5565-befd-3534-c1ed8383961e	4282	Gozd Martuljek
00050000-5565-befd-a5a3-d81cbbe1b492	6272	Gračišče
00050000-5565-befd-855f-ca7a30cd5b6a	9264	Grad
00050000-5565-befd-a335-325eb3d428ad	8332	Gradac
00050000-5565-befd-c8bd-7217cb5ff03f	1384	Grahovo
00050000-5565-befd-ed60-15cc79372eb7	5242	Grahovo ob Bači
00050000-5565-befd-d96b-9ca92bb83a32	5251	Grgar
00050000-5565-befd-2a58-baf6513a0665	3302	Griže
00050000-5565-befd-dca8-d96423a6535a	3231	Grobelno
00050000-5565-befd-7649-72970ef5e158	1290	Grosuplje
00050000-5565-befd-d45e-485d30719b34	2288	Hajdina
00050000-5565-befd-f7cd-970a8799c71b	8362	Hinje
00050000-5565-befd-b595-485abddfb4e7	2311	Hoče
00050000-5565-befd-795f-1f2a302e3a3d	9205	Hodoš/Hodos
00050000-5565-befd-332c-076f78a9fcb4	1354	Horjul
00050000-5565-befd-8173-0808710c3b14	1372	Hotedršica
00050000-5565-befd-f30a-05ac9fc2e15b	1430	Hrastnik
00050000-5565-befd-70f5-df53b0981d8e	6225	Hruševje
00050000-5565-befd-8fcd-1958fe25ede8	4276	Hrušica
00050000-5565-befd-b1da-162191d5e68d	5280	Idrija
00050000-5565-befd-cc90-591a0d4c61c2	1292	Ig
00050000-5565-befd-1f70-5dff283e8c3c	6250	Ilirska Bistrica
00050000-5565-befd-65b9-3b0730a7f87d	6251	Ilirska Bistrica-Trnovo
00050000-5565-befd-f057-919042eb53d5	1295	Ivančna Gorica
00050000-5565-befd-3242-ff628c462c50	2259	Ivanjkovci
00050000-5565-befd-646a-ac41daf26216	1411	Izlake
00050000-5565-befd-b6e3-3bc557e0c995	6310	Izola/Isola
00050000-5565-befd-e5dd-08e610d63417	2222	Jakobski Dol
00050000-5565-befd-d643-fc4d3f22ca2a	2221	Jarenina
00050000-5565-befd-99e0-a92e915b923f	6254	Jelšane
00050000-5565-befd-1368-6b71360bf97e	4270	Jesenice
00050000-5565-befd-8e93-d6d0801195ae	8261	Jesenice na Dolenjskem
00050000-5565-befd-afc7-7ff2d94dadad	3273	Jurklošter
00050000-5565-befd-fec9-33c1e410fc1e	2223	Jurovski Dol
00050000-5565-befd-2592-2f0a9995a0eb	2256	Juršinci
00050000-5565-befd-6023-f83ea033328b	5214	Kal nad Kanalom
00050000-5565-befd-203e-2d2c251a073a	3233	Kalobje
00050000-5565-befd-7217-0fe37c606d0c	4246	Kamna Gorica
00050000-5565-befd-d1f8-30e048ba0822	2351	Kamnica
00050000-5565-befd-3b44-f9b30c178116	1241	Kamnik
00050000-5565-befd-5220-7287f9cf9489	5213	Kanal
00050000-5565-befd-adec-d304c278bbcb	8258	Kapele
00050000-5565-befd-e27b-0c313a62e0b7	2362	Kapla
00050000-5565-befd-8536-cb22f7527326	2325	Kidričevo
00050000-5565-befd-c717-8e094e5051c4	1412	Kisovec
00050000-5565-befd-d349-faf28db45c89	6253	Knežak
00050000-5565-befd-f70f-927d85360967	5222	Kobarid
00050000-5565-befd-c25c-75b07ec78861	9227	Kobilje
00050000-5565-befd-eeb5-077a77a7566f	1330	Kočevje
00050000-5565-befd-2d0d-fd27f8844313	1338	Kočevska Reka
00050000-5565-befd-a2ca-22c2ab2b982b	2276	Kog
00050000-5565-befd-4f91-e478dae52588	5211	Kojsko
00050000-5565-befd-4f7c-c278eba66f51	6223	Komen
00050000-5565-befd-2445-6b24f2f1e6f9	1218	Komenda
00050000-5565-befd-7375-500ef4d05742	6000	Koper/Capodistria 
00050000-5565-befd-39d0-a7ff54231d8a	6001	Koper/Capodistria - poštni predali
00050000-5565-befd-bb08-a6ca295347c9	8282	Koprivnica
00050000-5565-befd-24a8-f833b99502f6	5296	Kostanjevica na Krasu
00050000-5565-befd-dc4e-55fe06e331ea	8311	Kostanjevica na Krki
00050000-5565-befd-809d-eab4d16be5c5	1336	Kostel
00050000-5565-befd-e6c7-83c9d9082301	6256	Košana
00050000-5565-befd-ac36-bd64f983734f	2394	Kotlje
00050000-5565-befd-56cc-0ba4a3bbe3f4	6240	Kozina
00050000-5565-befd-2a43-2541bb1bc8ed	3260	Kozje
00050000-5565-befd-3fc6-2ce0df1c8f52	4000	Kranj 
00050000-5565-befd-704b-5967d2cc2f8a	4001	Kranj - poštni predali
00050000-5565-befd-4ab6-5baa54aa46e0	4280	Kranjska Gora
00050000-5565-befd-cd36-cf3ac8f6b86d	1281	Kresnice
00050000-5565-befd-29d5-0c15ff4ed7ca	4294	Križe
00050000-5565-befd-4d04-449e90357dbf	9206	Križevci
00050000-5565-befd-7aae-940715baf179	9242	Križevci pri Ljutomeru
00050000-5565-befd-e078-f8061e9fcfe4	1301	Krka
00050000-5565-befd-f600-4681197663d9	8296	Krmelj
00050000-5565-befd-3629-c393ed9830d9	4245	Kropa
00050000-5565-befd-8fdc-c835bbe69651	8262	Krška vas
00050000-5565-befd-a91d-a049f9f83732	8270	Krško
00050000-5565-befd-84f8-26b7398b7a24	9263	Kuzma
00050000-5565-befd-800a-cf085789f870	2318	Laporje
00050000-5565-befd-b1d1-c5173a479023	3270	Laško
00050000-5565-befd-eb4d-24a42663ab15	1219	Laze v Tuhinju
00050000-5565-befd-6d83-7db05a43d279	2230	Lenart v Slovenskih goricah
00050000-5565-befd-ce86-f36650a705fd	9220	Lendava/Lendva
00050000-5565-befd-690c-8adb08ee483e	4248	Lesce
00050000-5565-befd-636d-74a0549d136e	3261	Lesično
00050000-5565-befd-87f8-af9e5ff7be60	8273	Leskovec pri Krškem
00050000-5565-befd-064d-59c588773733	2372	Libeliče
00050000-5565-befd-4ea2-3d13ac793098	2341	Limbuš
00050000-5565-befd-c826-42f1aef0a3f1	1270	Litija
00050000-5565-befd-3c79-c05aa4df51b9	3202	Ljubečna
00050000-5565-befd-e04a-24aba1d1e7be	1000	Ljubljana 
00050000-5565-befd-3127-90086c22b932	1001	Ljubljana - poštni predali
00050000-5565-befd-fa5d-f33ae31a6cd3	1231	Ljubljana - Črnuče
00050000-5565-befd-2d2f-49f33a0dd68c	1261	Ljubljana - Dobrunje
00050000-5565-befd-28ff-00ab64c5c3a2	1260	Ljubljana - Polje
00050000-5565-befd-4c1e-214ce7c77e1d	1210	Ljubljana - Šentvid
00050000-5565-befd-6b70-2e41c6440152	1211	Ljubljana - Šmartno
00050000-5565-befd-924a-07ad6395b652	3333	Ljubno ob Savinji
00050000-5565-befd-fd71-6e660df17984	9240	Ljutomer
00050000-5565-befd-0a99-bd4a75ae6b70	3215	Loče
00050000-5565-befd-21e6-27c11ba86ff2	5231	Log pod Mangartom
00050000-5565-befd-a5b8-3242eddb911b	1358	Log pri Brezovici
00050000-5565-befd-42f9-9a3d4e990256	1370	Logatec
00050000-5565-befd-ed01-38c2265ef172	1371	Logatec
00050000-5565-befd-a327-25628a7db1a0	1434	Loka pri Zidanem Mostu
00050000-5565-befd-cb72-67edb243e4f2	3223	Loka pri Žusmu
00050000-5565-befd-58da-e8bf505425b9	6219	Lokev
00050000-5565-befd-4326-cba1b6a1ea05	1318	Loški Potok
00050000-5565-befd-eab2-9bba19a95e49	2324	Lovrenc na Dravskem polju
00050000-5565-befd-4ef2-0bd5ca058321	2344	Lovrenc na Pohorju
00050000-5565-befd-c6a2-6fca61f79cc8	3334	Luče
00050000-5565-befd-3a0e-ccf5b7cae58e	1225	Lukovica
00050000-5565-befd-301d-5f74670bce3f	9202	Mačkovci
00050000-5565-befd-2e16-af6773dc4607	2322	Majšperk
00050000-5565-befd-04fc-1bdb0df35d9e	2321	Makole
00050000-5565-befd-84ea-3680c7688ddb	9243	Mala Nedelja
00050000-5565-befd-d397-1276983150e2	2229	Malečnik
00050000-5565-befd-87f7-60426b476b7a	6273	Marezige
00050000-5565-befd-d16f-5cddf35dcfc2	2000	Maribor 
00050000-5565-befd-4281-8b43b47945f9	2001	Maribor - poštni predali
00050000-5565-befd-8c91-e471a4561070	2206	Marjeta na Dravskem polju
00050000-5565-befd-e640-925e6dcc7efa	2281	Markovci
00050000-5565-befd-7b12-6ab10b01d244	9221	Martjanci
00050000-5565-befd-4d19-7193652c1d29	6242	Materija
00050000-5565-befd-bd84-40deab331488	4211	Mavčiče
00050000-5565-befd-2e78-9cf44ed52589	1215	Medvode
00050000-5565-befd-05be-4a7714d29143	1234	Mengeš
00050000-5565-befd-3722-cac8716226ef	8330	Metlika
00050000-5565-befd-b2cb-7377e2571517	2392	Mežica
00050000-5565-befd-19ce-3e8572ffe1ec	2204	Miklavž na Dravskem polju
00050000-5565-befd-50c4-eb5df3b64227	2275	Miklavž pri Ormožu
00050000-5565-befd-c651-1a9316dae1f5	5291	Miren
00050000-5565-befd-080e-4631aed89879	8233	Mirna
00050000-5565-befd-db38-261f9bddbc98	8216	Mirna Peč
00050000-5565-befd-04e1-d6abae8fed33	2382	Mislinja
00050000-5565-befd-312b-d4ba568bb31b	4281	Mojstrana
00050000-5565-befd-95d1-c49d23b93006	8230	Mokronog
00050000-5565-befd-aef8-7a66d5bbd6f2	1251	Moravče
00050000-5565-befd-1405-237c1e47e979	9226	Moravske Toplice
00050000-5565-befd-5735-d72a3ca8f5a4	5216	Most na Soči
00050000-5565-befd-bad3-5f7100bd997a	1221	Motnik
00050000-5565-befd-41dc-15833235da49	3330	Mozirje
00050000-5565-befd-5dcc-061b9b89bbf3	9000	Murska Sobota 
00050000-5565-befd-395b-d6d4a11de45d	9001	Murska Sobota - poštni predali
00050000-5565-befd-9416-d96d9f5baaf3	2366	Muta
00050000-5565-befd-83fc-a77c1ffb2790	4202	Naklo
00050000-5565-befd-a56f-13a206f82323	3331	Nazarje
00050000-5565-befd-7264-3bb3fac29011	1357	Notranje Gorice
00050000-5565-befd-37a5-e3a460af18ff	3203	Nova Cerkev
00050000-5565-befd-e1ef-ed53ec27b317	5000	Nova Gorica 
00050000-5565-befd-4a0d-cc978cc742dc	5001	Nova Gorica - poštni predali
00050000-5565-befd-6666-347638278455	1385	Nova vas
00050000-5565-befd-3fcd-3d40e703625b	8000	Novo mesto
00050000-5565-befd-b787-34908a0daa81	8001	Novo mesto - poštni predali
00050000-5565-befd-1201-05b3d71da60a	6243	Obrov
00050000-5565-befd-b519-1242f1917a85	9233	Odranci
00050000-5565-befd-70bf-ccb111aea8fb	2317	Oplotnica
00050000-5565-befd-25fc-c4ab6c5d0177	2312	Orehova vas
00050000-5565-befd-a91f-05e95f074119	2270	Ormož
00050000-5565-befd-f55e-2d75b8d24878	1316	Ortnek
00050000-5565-befd-3727-27b1f7b49f5e	1337	Osilnica
00050000-5565-befd-4074-612afc464aac	8222	Otočec
00050000-5565-befd-3aa4-758d391b9688	2361	Ožbalt
00050000-5565-befd-8d65-9c11522a5c63	2231	Pernica
00050000-5565-befd-20ee-263c83079d64	2211	Pesnica pri Mariboru
00050000-5565-befd-ab20-a845788aa6d0	9203	Petrovci
00050000-5565-befd-c737-8496c54c4757	3301	Petrovče
00050000-5565-befd-5e63-5b30c214d4a8	6330	Piran/Pirano
00050000-5565-befd-9dd2-8b3cc753d88a	8255	Pišece
00050000-5565-befd-bfab-47690daf09b5	6257	Pivka
00050000-5565-befd-6bf6-175af8e45b58	6232	Planina
00050000-5565-befd-f03d-746665fbb171	3225	Planina pri Sevnici
00050000-5565-befd-e3f6-eaf6ad2d1c47	6276	Pobegi
00050000-5565-befd-de29-af4ccd780d65	8312	Podbočje
00050000-5565-befd-d340-e62de2026b29	5243	Podbrdo
00050000-5565-befd-398e-f0a128f2ed4d	3254	Podčetrtek
00050000-5565-befd-5e96-9d8a6de4066d	2273	Podgorci
00050000-5565-befd-fbcd-575aefb2d8b2	6216	Podgorje
00050000-5565-befd-c8fc-c12ffcb350c8	2381	Podgorje pri Slovenj Gradcu
00050000-5565-befd-e2da-f3a83b340ed7	6244	Podgrad
00050000-5565-befd-73bd-62ef41c33dca	1414	Podkum
00050000-5565-befd-aeef-eb4a129af2ae	2286	Podlehnik
00050000-5565-befd-0702-f1fcc711dbf7	5272	Podnanos
00050000-5565-befd-28ca-cebb6cd9e464	4244	Podnart
00050000-5565-befd-986d-f439e62501af	3241	Podplat
00050000-5565-befd-c436-d37e6798f261	3257	Podsreda
00050000-5565-befd-0eda-78e2774f3659	2363	Podvelka
00050000-5565-befd-503a-d7026f900d43	2208	Pohorje
00050000-5565-befd-5d4c-2586f59aca95	2257	Polenšak
00050000-5565-befd-4ae3-598648e229ba	1355	Polhov Gradec
00050000-5565-befd-dfaa-4ff1408d7840	4223	Poljane nad Škofjo Loko
00050000-5565-befd-78be-e00f7755ab4c	2319	Poljčane
00050000-5565-befd-2f28-7b7f379a9cf9	1272	Polšnik
00050000-5565-befd-e8b7-bb4477d1431b	3313	Polzela
00050000-5565-befd-31d0-6d1dfb5b12e6	3232	Ponikva
00050000-5565-befd-67bc-996814078af2	6320	Portorož/Portorose
00050000-5565-befd-4ea9-e890dc4f97a5	6230	Postojna
00050000-5565-befd-45bd-20a90fa2eb5f	2331	Pragersko
00050000-5565-befd-1778-6bc6a791af48	3312	Prebold
00050000-5565-befd-23de-51e28d30874e	4205	Preddvor
00050000-5565-befd-1d02-32bdcde65253	6255	Prem
00050000-5565-befd-b6ab-7125859d3162	1352	Preserje
00050000-5565-befd-a149-797d1acb1c34	6258	Prestranek
00050000-5565-befd-170c-a8b4b51f725b	2391	Prevalje
00050000-5565-befd-0714-65f40fb6fa18	3262	Prevorje
00050000-5565-befd-d7ae-466a9844b142	1276	Primskovo 
00050000-5565-befd-bc95-95173ef11f26	3253	Pristava pri Mestinju
00050000-5565-befd-09c8-66f9c1a270d6	9207	Prosenjakovci/Partosfalva
00050000-5565-befd-c079-8041d5d21991	5297	Prvačina
00050000-5565-befd-a001-2df01f2500b0	2250	Ptuj
00050000-5565-befd-176a-0862677288d7	2323	Ptujska Gora
00050000-5565-befd-9b9e-755f91dd8ca0	9201	Puconci
00050000-5565-befd-061f-1b762213815e	2327	Rače
00050000-5565-befd-a308-00ed776befa1	1433	Radeče
00050000-5565-befd-ff92-02663d9727c4	9252	Radenci
00050000-5565-befd-15a4-808c30f7a110	2360	Radlje ob Dravi
00050000-5565-befd-0545-9fc784b3d791	1235	Radomlje
00050000-5565-befd-9b4f-069c58ec1a7a	4240	Radovljica
00050000-5565-befd-881f-f5e69cb3efd3	8274	Raka
00050000-5565-befd-b724-c8b736842f22	1381	Rakek
00050000-5565-befd-4cbb-074cd2653f4b	4283	Rateče - Planica
00050000-5565-befd-d68f-c13d66895d07	2390	Ravne na Koroškem
00050000-5565-befd-5a64-706292332360	9246	Razkrižje
00050000-5565-befd-13ec-025756320a87	3332	Rečica ob Savinji
00050000-5565-befd-ac9b-3c7f9a8a010b	5292	Renče
00050000-5565-befd-0294-2d59f1ad3206	1310	Ribnica
00050000-5565-befd-4fbc-8a5fe661289d	2364	Ribnica na Pohorju
00050000-5565-befd-a45c-570c8b19ce8d	3272	Rimske Toplice
00050000-5565-befd-e41b-0ff778cb7808	1314	Rob
00050000-5565-befd-c08d-5e08cc1eff82	5215	Ročinj
00050000-5565-befd-79c0-6788fa48afb8	3250	Rogaška Slatina
00050000-5565-befd-00af-8736a7001225	9262	Rogašovci
00050000-5565-befd-6ee7-bb9b0dc19f6c	3252	Rogatec
00050000-5565-befd-80c2-a1fe302d34d3	1373	Rovte
00050000-5565-befd-5aed-58a8ae03557f	2342	Ruše
00050000-5565-befd-d08f-35d0663935c0	1282	Sava
00050000-5565-befd-43be-fe4b076e800c	6333	Sečovlje/Sicciole
00050000-5565-befd-18a7-6815384bd9a0	4227	Selca
00050000-5565-befd-e836-bd3866bbaff9	2352	Selnica ob Dravi
00050000-5565-befd-2efd-fd4990f1c355	8333	Semič
00050000-5565-befd-f46a-f81f3dff5fdb	8281	Senovo
00050000-5565-befd-fbac-9de34e534c2a	6224	Senožeče
00050000-5565-befd-7b32-4a2cade09a2c	8290	Sevnica
00050000-5565-befd-2887-972b8e7ae997	6210	Sežana
00050000-5565-befd-7173-8d8179453e7f	2214	Sladki Vrh
00050000-5565-befd-3dba-ed8e49ed13a6	5283	Slap ob Idrijci
00050000-5565-befd-ac1e-a413dd25a3ae	2380	Slovenj Gradec
00050000-5565-befd-02a8-e7777e95dd82	2310	Slovenska Bistrica
00050000-5565-befd-c616-83fea93f3813	3210	Slovenske Konjice
00050000-5565-befd-b302-57fd7f49f29d	1216	Smlednik
00050000-5565-befd-a97c-82cf6885da27	5232	Soča
00050000-5565-befd-135f-147effc15a12	1317	Sodražica
00050000-5565-befd-1367-36dd84ca3390	3335	Solčava
00050000-5565-befd-103d-33124001f0c5	5250	Solkan
00050000-5565-befd-d7e3-be110942861b	4229	Sorica
00050000-5565-befd-cc03-1cb279f58ce8	4225	Sovodenj
00050000-5565-befd-07db-158ad56e29d8	5281	Spodnja Idrija
00050000-5565-befd-0b46-4eab0b7d6b24	2241	Spodnji Duplek
00050000-5565-befd-6de9-659eb2803d95	9245	Spodnji Ivanjci
00050000-5565-befd-b370-e9db6cd711bb	2277	Središče ob Dravi
00050000-5565-befd-732c-296fc2957a03	4267	Srednja vas v Bohinju
00050000-5565-befd-227e-d38897eb7e9d	8256	Sromlje 
00050000-5565-befd-4cdd-566d03f963da	5224	Srpenica
00050000-5565-befd-d4eb-db45c2c0e801	1242	Stahovica
00050000-5565-befd-9e41-e0fbc6a7f99e	1332	Stara Cerkev
00050000-5565-befd-8614-c2d921de5097	8342	Stari trg ob Kolpi
00050000-5565-befd-90d6-8f2917fad9d7	1386	Stari trg pri Ložu
00050000-5565-befd-4a26-6516ec602009	2205	Starše
00050000-5565-befd-65ea-9316095184b4	2289	Stoperce
00050000-5565-befd-186d-2982969b0fff	8322	Stopiče
00050000-5565-befd-e2c6-ae50fd6e93c7	3206	Stranice
00050000-5565-befd-c8ec-fc3756722d2d	8351	Straža
00050000-5565-befd-474e-70799ed87d1c	1313	Struge
00050000-5565-befd-afb0-8fd97134d1be	8293	Studenec
00050000-5565-befd-d12e-45e6f7936296	8331	Suhor
00050000-5565-befd-315f-d447e691a00b	2233	Sv. Ana v Slovenskih goricah
00050000-5565-befd-0526-3154b83a591c	2235	Sv. Trojica v Slovenskih goricah
00050000-5565-befd-c6f5-d8c024ea4c23	2353	Sveti Duh na Ostrem Vrhu
00050000-5565-befd-dd53-52571dc23c10	9244	Sveti Jurij ob Ščavnici
00050000-5565-befd-51a5-4d5a8744f1b2	3264	Sveti Štefan
00050000-5565-befd-1a92-da651327bf74	2258	Sveti Tomaž
00050000-5565-befd-9a6a-65cd8a7a8c9b	9204	Šalovci
00050000-5565-befd-bc65-a9a120a299df	5261	Šempas
00050000-5565-befd-2646-c5fc21b5d351	5290	Šempeter pri Gorici
00050000-5565-befd-a9b4-d4c8cae8247d	3311	Šempeter v Savinjski dolini
00050000-5565-befd-1176-47d88b3ce8c1	4208	Šenčur
00050000-5565-befd-c6a8-bbd1835d42fe	2212	Šentilj v Slovenskih goricah
00050000-5565-befd-9014-a5361c86e3b2	8297	Šentjanž
00050000-5565-befd-b383-0fab4bb16b1a	2373	Šentjanž pri Dravogradu
00050000-5565-befd-4cf7-fc300f69f4b6	8310	Šentjernej
00050000-5565-befd-1235-0d740320d300	3230	Šentjur
00050000-5565-befd-bbbc-62e1abd1b148	3271	Šentrupert
00050000-5565-befd-98c3-5b79690248d9	8232	Šentrupert
00050000-5565-befd-9ea5-f6f5e2371ca5	1296	Šentvid pri Stični
00050000-5565-befd-96aa-c7560a1e9466	8275	Škocjan
00050000-5565-befd-a4ea-0d4f0b36a893	6281	Škofije
00050000-5565-befd-6e93-77788b640846	4220	Škofja Loka
00050000-5565-befd-552f-6a3c9ec79987	3211	Škofja vas
00050000-5565-befd-3e10-af504276eca4	1291	Škofljica
00050000-5565-befd-0880-ace3fdea5986	6274	Šmarje
00050000-5565-befd-517a-dcebfdc99f6a	1293	Šmarje - Sap
00050000-5565-befd-64d5-a138ff19fc1b	3240	Šmarje pri Jelšah
00050000-5565-befd-82d7-972834c16ee1	8220	Šmarješke Toplice
00050000-5565-befd-b79c-981419058dee	2315	Šmartno na Pohorju
00050000-5565-befd-6491-7aac4b4f2c14	3341	Šmartno ob Dreti
00050000-5565-befd-8c20-2599389e1515	3327	Šmartno ob Paki
00050000-5565-befd-5315-158ad0aa0733	1275	Šmartno pri Litiji
00050000-5565-befd-23d6-20cebb24fb97	2383	Šmartno pri Slovenj Gradcu
00050000-5565-befd-6c5f-f99b60ff6a3e	3201	Šmartno v Rožni dolini
00050000-5565-befd-3315-5a4de99cdd04	3325	Šoštanj
00050000-5565-befd-7898-e775959445b8	6222	Štanjel
00050000-5565-befd-3922-7b71d5a77d19	3220	Štore
00050000-5565-befd-e089-242243cf59d1	3304	Tabor
00050000-5565-befd-47a9-b68d9f3ab652	3221	Teharje
00050000-5565-befd-ff1a-e6e92ad022e1	9251	Tišina
00050000-5565-befd-5127-4f3427dc5fa3	5220	Tolmin
00050000-5565-befd-3368-aaafc4cfc116	3326	Topolšica
00050000-5565-befd-fba6-16c177e8b946	2371	Trbonje
00050000-5565-befd-eae0-57de4c7036c3	1420	Trbovlje
00050000-5565-befd-f2e3-b13470570adb	8231	Trebelno 
00050000-5565-befd-08d4-5234a6f40c2d	8210	Trebnje
00050000-5565-befd-cc6b-b5df10c2f077	5252	Trnovo pri Gorici
00050000-5565-befd-ac0a-8faeb7eae404	2254	Trnovska vas
00050000-5565-befd-b4e6-65f3d03c03f7	1222	Trojane
00050000-5565-befd-5491-ebf731306318	1236	Trzin
00050000-5565-befd-0d3f-efbedf39cbf3	4290	Tržič
00050000-5565-befd-9834-7c943d4991a0	8295	Tržišče
00050000-5565-befd-2f28-3540470d96ec	1311	Turjak
00050000-5565-befd-85d6-e8a6d6d047ac	9224	Turnišče
00050000-5565-befd-f8ec-fcd30961d6bf	8323	Uršna sela
00050000-5565-befd-2b92-b3f588af4537	1252	Vače
00050000-5565-befd-b669-0e0df2d16505	3320	Velenje 
00050000-5565-befd-f40d-82949f3152ce	3322	Velenje - poštni predali
00050000-5565-befd-33ef-eb588d5e33a1	8212	Velika Loka
00050000-5565-befd-8512-fb070255d91f	2274	Velika Nedelja
00050000-5565-befd-6072-122d17e0e781	9225	Velika Polana
00050000-5565-befd-1b41-4702aa6c1542	1315	Velike Lašče
00050000-5565-befd-9175-670b39212a4b	8213	Veliki Gaber
00050000-5565-befd-1a69-0193895bf4f5	9241	Veržej
00050000-5565-befd-7e32-ca5f40d8cbbe	1312	Videm - Dobrepolje
00050000-5565-befd-3c11-bda48ced49e1	2284	Videm pri Ptuju
00050000-5565-befd-0230-00568b04abcc	8344	Vinica
00050000-5565-befd-607a-abe76a3579b0	5271	Vipava
00050000-5565-befd-c396-f919e25ae1c1	4212	Visoko
00050000-5565-befd-d754-f20689acd2e0	1294	Višnja Gora
00050000-5565-befd-3bf9-4a2492e42637	3205	Vitanje
00050000-5565-befd-8bf7-a8bc93d9bed7	2255	Vitomarci
00050000-5565-befd-206f-cadb35a985af	1217	Vodice
00050000-5565-befd-4709-d6ad6317cf33	3212	Vojnik\t
00050000-5565-befd-5526-d85649d69295	5293	Volčja Draga
00050000-5565-befd-877e-2a8325bea6bf	2232	Voličina
00050000-5565-befd-569a-e80399adf114	3305	Vransko
00050000-5565-befd-6517-db5253eddc7e	6217	Vremski Britof
00050000-5565-befd-02a1-05d71c69562f	1360	Vrhnika
00050000-5565-befd-9811-9c26b99fc13d	2365	Vuhred
00050000-5565-befd-dc81-faf8950ec553	2367	Vuzenica
00050000-5565-befd-5a1d-5cbe2e8e4ab9	8292	Zabukovje 
00050000-5565-befd-3460-48f1431b4cdf	1410	Zagorje ob Savi
00050000-5565-befd-df02-e428e1985332	1303	Zagradec
00050000-5565-befd-651e-464b5efbc6ad	2283	Zavrč
00050000-5565-befd-e300-a0cc025fd713	8272	Zdole 
00050000-5565-befd-0699-d5511d30bdb4	4201	Zgornja Besnica
00050000-5565-befd-ef86-274254f86680	2242	Zgornja Korena
00050000-5565-befd-8d9a-aa2036829f82	2201	Zgornja Kungota
00050000-5565-befd-4718-a3048e03b79a	2316	Zgornja Ložnica
00050000-5565-befd-b95f-d8ee45b9a483	2314	Zgornja Polskava
00050000-5565-befd-f335-4dfb01696f61	2213	Zgornja Velka
00050000-5565-befd-f53a-f6474b6e1f89	4247	Zgornje Gorje
00050000-5565-befd-0b2d-25fc47af5862	4206	Zgornje Jezersko
00050000-5565-befd-ef43-7e8f00246d60	2285	Zgornji Leskovec
00050000-5565-befd-9f46-5bdd49a299a5	1432	Zidani Most
00050000-5565-befd-6625-636cfde67db7	3214	Zreče
00050000-5565-befd-fa3b-60376970c12e	4209	Žabnica
00050000-5565-befd-8184-6dd58d26554a	3310	Žalec
00050000-5565-befd-c6ea-ac1b81bf2db3	4228	Železniki
00050000-5565-befd-5b85-85f99d80af83	2287	Žetale
00050000-5565-befd-791a-c960d0ddaa11	4226	Žiri
00050000-5565-befd-1a3c-063f6429dec9	4274	Žirovnica
00050000-5565-befd-8930-4b0451771d8f	8360	Žužemberk
\.


--
-- TOC entry 2723 (class 0 OID 5328668)
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
-- TOC entry 2705 (class 0 OID 5328483)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2711 (class 0 OID 5328561)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2725 (class 0 OID 5328680)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2738 (class 0 OID 5328800)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2742 (class 0 OID 5328851)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2729 (class 0 OID 5328709)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5565-befe-2192-55f0bc0ca196	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5565-befe-69e3-e60e2d31e4b1	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5565-befe-96df-29696da49019	0003	Kazinska	t	84	Kazinska dvorana
00220000-5565-befe-d0a3-6aa694a7143c	0004	Mali oder	t	24	Mali oder 
00220000-5565-befe-1516-9e9dcb5201c9	0005	Komorni oder	t	15	Komorni oder
00220000-5565-befe-aa78-ccabb6d7fa88	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5565-befe-1597-ab5c7b34fbb6	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2721 (class 0 OID 5328653)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2720 (class 0 OID 5328643)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2741 (class 0 OID 5328840)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2736 (class 0 OID 5328777)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2694 (class 0 OID 5328357)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5565-befe-6105-d2c6e7441836	00010000-5565-befe-845b-237384a3612d	2015-05-27 14:56:31	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvNnHf28OhB8YPHnDDFsFQiCkQJ.iVe.";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2760 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2730 (class 0 OID 5328719)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2698 (class 0 OID 5328395)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5565-befe-6eca-468f74fe6515	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5565-befe-ca21-511a74bcd1f2	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5565-befe-a011-32f62083564f	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5565-befe-65e2-1ce999dab40c	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5565-befe-4715-42b65a0a01d1	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5565-befe-a535-322a53c4de9e	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2696 (class 0 OID 5328379)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5565-befe-6105-d2c6e7441836	00020000-5565-befe-65e2-1ce999dab40c
00010000-5565-befe-845b-237384a3612d	00020000-5565-befe-65e2-1ce999dab40c
\.


--
-- TOC entry 2732 (class 0 OID 5328733)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2724 (class 0 OID 5328674)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2718 (class 0 OID 5328624)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2750 (class 0 OID 5328948)
-- Dependencies: 230
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5565-befd-b83c-b34083f27720	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5565-befd-ed1d-a4ab8b98e6fb	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5565-befd-0e26-2c8c15fea06d	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5565-befd-60d0-d7654c73c71b	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5565-befd-c465-5cbc65dc10d7	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2749 (class 0 OID 5328941)
-- Dependencies: 229
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5565-befd-8193-c5ede4cd8604	00000000-5565-befd-60d0-d7654c73c71b	popa
00000000-5565-befd-a04f-ad604984accb	00000000-5565-befd-60d0-d7654c73c71b	oseba
00000000-5565-befd-6516-ebebce97ca5f	00000000-5565-befd-ed1d-a4ab8b98e6fb	prostor
00000000-5565-befd-0da4-a419c9f2eaec	00000000-5565-befd-60d0-d7654c73c71b	besedilo
00000000-5565-befd-f9f4-bdbe00177eef	00000000-5565-befd-60d0-d7654c73c71b	uprizoritev
00000000-5565-befd-6e36-681e85f1ea5a	00000000-5565-befd-60d0-d7654c73c71b	funkcija
00000000-5565-befd-e3ba-cea813999e65	00000000-5565-befd-60d0-d7654c73c71b	tipfunkcije
00000000-5565-befd-72b2-1c9f9d76d641	00000000-5565-befd-60d0-d7654c73c71b	alternacija
\.


--
-- TOC entry 2748 (class 0 OID 5328936)
-- Dependencies: 228
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2737 (class 0 OID 5328787)
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
-- TOC entry 2703 (class 0 OID 5328455)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2719 (class 0 OID 5328630)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2740 (class 0 OID 5328829)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5565-befd-1693-32f20093a2c1	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5565-befd-8f3a-5e2f2631903b	Baletnik ali plesalec	Baletniki in plesalci	\N	Baletnica ali plesalka	igralec
000f0000-5565-befd-2efb-027bf66c1b97	Avtor	Avtorji	\N	Avtorka	umetnik
000f0000-5565-befd-032c-a6e80df6de9d	Režiser	Režiserji	\N	Režiserka	umetnik
000f0000-5565-befd-bbfe-022ec6c050c8	Scenograf	Scenografi	\N	Scenografka	tehnik
000f0000-5565-befd-818e-30ca7d324ede	Kostumograf	Kostumografi	\N	Kostumografinja	tehnik
000f0000-5565-befd-b777-81c4cc9fdb99	Oblikovalec maske	Oblikovalci maske	\N	Oblikovalka maske	tehnik
000f0000-5565-befd-1379-dbd0f7f59ffe	Avtor glasbe	Avtorji glasbe	\N	Avtorica glasbe	umetnik
000f0000-5565-befd-40b5-ab11c3e20b19	Oblikovalec svetlobe	Oblikovalci svetlobe	\N	Oblikovalka svetlobe	tehnik
000f0000-5565-befd-f600-0785b8556594	Koreograf	Koreografi	\N	Koreografinja	umetnik
000f0000-5565-befd-cf99-1050d1f8999f	Dramaturg	Dramaturgi	\N	Dramaturginja	umetnik
000f0000-5565-befd-1595-88a431b7a1e5	Lektorj	Lektorji	\N	Lektorica	umetnik
000f0000-5565-befd-62e7-732e200a0ce8	Prevajalec	Prevajalci	\N	Prevajalka	umetnik
000f0000-5565-befd-1e23-d6fd059dbbd9	Oblikovalec videa	Oblikovalci videa	\N	Oblikovalka videa	umetnik
000f0000-5565-befd-9b83-eb7ae544d4ed	Intermedijski ustvarjalec	Intermedijski ustvarjalci	\N	Intermedijska ustvarjalka	umetnik
000f0000-5565-befd-e38a-fdb29becdf16	Nerazvrščeno	Nerazvrščeno	\N	Nerazvrščeno	\N
\.


--
-- TOC entry 2708 (class 0 OID 5328518)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2695 (class 0 OID 5328366)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5565-befe-845b-237384a3612d	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROymLNWxamhAY067fErh875NNfPV3auv.	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5565-befe-1f2d-1a19febc982a	Jani	$2y$05$NS4xMjkyMTcwMzExMjAxROwCDArT65aiJOIga2jxnJHrCmFaCKg3y	t	\N	\N	\N	jani@ifigenija.si	\N	\N	\N
00010000-5565-befe-1ee3-98a96ed648f6	Tona	$2y$05$NS4xMjkyMTcwMzExMjAxROqs1d9za3Bfc891Y5I6pcqOqMeenkTSS	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5565-befe-1e1f-382f1636bbfb	Ivo	$2y$05$NS4xMjkyMTcwMzExMjAxROFOt7rngJmLsimTS0UJdY0oaMyxJqX8G	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5565-befe-a941-217c0c4bf6b1	Jože	$2y$05$NS4xMjkyMTcwMzExMjAxROwrI0oXjaJk1wuF/RyXxd68.SKXUeXTi	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5565-befe-0c10-1b724f170a78	Marko	$2y$05$NS4xMjkyMTcwMzExMjAxROgD511djxWTmKZAvR2wvpKGltMp4veui	t	\N	\N	\N	marko@ifigenija.si	\N	\N	\N
00010000-5565-befe-a387-f4f57966b6ee	Marija	$2y$05$NS4xMjkyMTcwMzExMjAxROgICxqCmvNixoHskzXMkMwc6pwD.aOxm	t	\N	\N	\N	marija@ifigenija.si	\N	\N	\N
00010000-5565-befe-cfea-79534431dc8a	Ana	$2y$05$NS4xMjkyMTcwMzExMjAxRO/PArmLwykGiET4mwDqt7Xvd0gAqGxPu	t	\N	\N	\N	ana@ifigenija.si	\N	\N	\N
00010000-5565-befe-8bc7-94f419d61176	Maja	$2y$05$NS4xMjkyMTcwMzExMjAxROl8gcEv/G.2gHfwv5AkJs8f/7CE8EqrK	t	\N	\N	\N	maja@ifigenija.si	\N	\N	\N
00010000-5565-befe-135d-be16544dd880	Irena	$2y$05$NS4xMjkyMTcwMzExMjAxROrLRohPk6S98OK8aJWk8HSFGZS4n6SG.	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5565-befe-9168-94a8a746f048	Mojca	$2y$05$NS4xMjkyMTcwMzExMjAxROOk0d/n3JMAKdVadxAnFmGfW7.FfICGu	t	\N	\N	\N	mojca@ifigenija.si	\N	\N	\N
00010000-5565-befe-6105-d2c6e7441836	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2745 (class 0 OID 5328884)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5565-befe-372b-0f47286c6756	00160000-5565-befe-c1e3-70b8f2ee01fa	00150000-5565-befd-3823-e17cd970d5e1	00140000-5565-befd-258d-b94eb13f9f5b	0001	produkcija	Sen kresne noči		Sanje	2016-02-01	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5565-befe-1516-9e9dcb5201c9
000e0000-5565-befe-90cd-877f06ad046f	00160000-5565-befe-56ef-2bb45706113b	00150000-5565-befd-a14d-26108930be6e	00140000-5565-befd-0a21-85cd7dd13589	0002	predprodukcija-ideja	Smoletov vrt			2017-01-01	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5565-befe-aa78-ccabb6d7fa88
\.


--
-- TOC entry 2713 (class 0 OID 5328576)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2728 (class 0 OID 5328701)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2735 (class 0 OID 5328769)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2715 (class 0 OID 5328608)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2744 (class 0 OID 5328874)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-5565-befd-258d-b94eb13f9f5b	Drama	drama (SURS 01)
00140000-5565-befd-c3f9-1a1b726f46fd	Opera	opera (SURS 02)
00140000-5565-befd-4787-640f0bd1f671	Balet	balet (SURS 03)
00140000-5565-befd-227a-b4a776d6adc5	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5565-befd-0b97-696e8260b05d	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5565-befd-0a21-85cd7dd13589	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5565-befd-26c0-5ed7b46d4731	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2734 (class 0 OID 5328759)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-5565-befd-bf05-2ac2aca92338	Opera	opera
00150000-5565-befd-9319-9e6168b1be23	Opereta	opereta
00150000-5565-befd-c83a-d52b8b5d82d3	Balet	balet
00150000-5565-befd-97ef-7d74272a2b0d	Plesne prireditve	plesne prireditve
00150000-5565-befd-4c4f-90fa81d55faa	Lutkovno gledališče	lutkovno gledališče
00150000-5565-befd-f2d5-d08578dd936d	Raziskovalno gledališče	raziskovalno gledališče
00150000-5565-befd-f15a-9c9e6719b313	Biografska drama	biografska drama
00150000-5565-befd-3823-e17cd970d5e1	Komedija	komedija
00150000-5565-befd-c877-1ac9feaa7550	Črna komedija	črna komedija
00150000-5565-befd-f08e-d66339ea23d0	E-igra	E-igra
00150000-5565-befd-a14d-26108930be6e	Kriminalka	kriminalka
00150000-5565-befd-eef8-c15f1a7bdb02	Musical	musical
\.


--
-- TOC entry 2315 (class 2606 OID 5328420)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 5328929)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 5328919)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 5328828)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 5328598)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 5328623)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2348 (class 2606 OID 5328544)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 5328755)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2363 (class 2606 OID 5328574)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2382 (class 2606 OID 5328617)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 5328558)
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
-- TOC entry 2406 (class 2606 OID 5328666)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 5328693)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 5328516)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 5328429)
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
-- TOC entry 2321 (class 2606 OID 5328452)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2313 (class 2606 OID 5328409)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2306 (class 2606 OID 5328394)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 5328699)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2433 (class 2606 OID 5328732)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 5328869)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2330 (class 2606 OID 5328480)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2338 (class 2606 OID 5328504)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2410 (class 2606 OID 5328672)
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
-- TOC entry 2336 (class 2606 OID 5328494)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2361 (class 2606 OID 5328565)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2416 (class 2606 OID 5328684)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 5328812)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 5328856)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 5328716)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 5328657)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 5328648)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 5328850)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2452 (class 2606 OID 5328784)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 5328365)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2431 (class 2606 OID 5328723)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 5328383)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2308 (class 2606 OID 5328403)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 5328741)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2412 (class 2606 OID 5328679)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2387 (class 2606 OID 5328629)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 2606 OID 5328954)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 5328945)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 5328940)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 5328797)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2327 (class 2606 OID 5328460)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 5328639)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 5328839)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2346 (class 2606 OID 5328529)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 5328378)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 5328899)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2367 (class 2606 OID 5328583)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 5328707)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 5328775)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 5328612)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 5328883)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 5328768)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 1259 OID 5328605)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2453 (class 1259 OID 5328798)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2454 (class 1259 OID 5328799)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2328 (class 1259 OID 5328482)
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
-- TOC entry 2419 (class 1259 OID 5328700)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2413 (class 1259 OID 5328686)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2414 (class 1259 OID 5328685)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2365 (class 1259 OID 5328584)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2441 (class 1259 OID 5328758)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2442 (class 1259 OID 5328756)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2443 (class 1259 OID 5328757)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2353 (class 1259 OID 5328560)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2354 (class 1259 OID 5328559)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2470 (class 1259 OID 5328871)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2471 (class 1259 OID 5328872)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2472 (class 1259 OID 5328873)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2478 (class 1259 OID 5328904)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2479 (class 1259 OID 5328901)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2480 (class 1259 OID 5328903)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2481 (class 1259 OID 5328902)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2343 (class 1259 OID 5328531)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2344 (class 1259 OID 5328530)
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
-- TOC entry 2429 (class 1259 OID 5328724)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2383 (class 1259 OID 5328618)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2310 (class 1259 OID 5328410)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2311 (class 1259 OID 5328411)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2434 (class 1259 OID 5328744)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2435 (class 1259 OID 5328743)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2436 (class 1259 OID 5328742)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2357 (class 1259 OID 5328566)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2358 (class 1259 OID 5328568)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2359 (class 1259 OID 5328567)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2499 (class 1259 OID 5328947)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2393 (class 1259 OID 5328652)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2394 (class 1259 OID 5328650)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2395 (class 1259 OID 5328649)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2396 (class 1259 OID 5328651)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2301 (class 1259 OID 5328384)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 5328385)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2422 (class 1259 OID 5328708)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2408 (class 1259 OID 5328673)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2449 (class 1259 OID 5328785)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2450 (class 1259 OID 5328786)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2332 (class 1259 OID 5328496)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2333 (class 1259 OID 5328495)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2334 (class 1259 OID 5328497)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2457 (class 1259 OID 5328813)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2458 (class 1259 OID 5328814)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2491 (class 1259 OID 5328933)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2492 (class 1259 OID 5328932)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2493 (class 1259 OID 5328935)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2494 (class 1259 OID 5328931)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2495 (class 1259 OID 5328934)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2446 (class 1259 OID 5328776)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2399 (class 1259 OID 5328661)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2400 (class 1259 OID 5328660)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2401 (class 1259 OID 5328658)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2402 (class 1259 OID 5328659)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2284 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2487 (class 1259 OID 5328921)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2488 (class 1259 OID 5328920)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2364 (class 1259 OID 5328575)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2316 (class 1259 OID 5328431)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2317 (class 1259 OID 5328430)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2324 (class 1259 OID 5328461)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2325 (class 1259 OID 5328462)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2388 (class 1259 OID 5328642)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2389 (class 1259 OID 5328641)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2390 (class 1259 OID 5328640)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2371 (class 1259 OID 5328607)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2372 (class 1259 OID 5328603)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2373 (class 1259 OID 5328600)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2374 (class 1259 OID 5328601)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2375 (class 1259 OID 5328599)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2376 (class 1259 OID 5328604)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2377 (class 1259 OID 5328602)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2331 (class 1259 OID 5328481)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2349 (class 1259 OID 5328545)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2350 (class 1259 OID 5328547)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2351 (class 1259 OID 5328546)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2352 (class 1259 OID 5328548)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2407 (class 1259 OID 5328667)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2475 (class 1259 OID 5328870)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2482 (class 1259 OID 5328900)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2322 (class 1259 OID 5328453)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2323 (class 1259 OID 5328454)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2505 (class 1259 OID 5328955)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2342 (class 1259 OID 5328517)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2502 (class 1259 OID 5328946)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2427 (class 1259 OID 5328718)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2428 (class 1259 OID 5328717)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2496 (class 1259 OID 5328930)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2287 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2339 (class 1259 OID 5328505)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2469 (class 1259 OID 5328857)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2309 (class 1259 OID 5328404)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2378 (class 1259 OID 5328606)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2530 (class 2606 OID 5329088)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2533 (class 2606 OID 5329073)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2532 (class 2606 OID 5329078)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2528 (class 2606 OID 5329098)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2534 (class 2606 OID 5329068)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2529 (class 2606 OID 5329093)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2531 (class 2606 OID 5329083)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2564 (class 2606 OID 5329243)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2563 (class 2606 OID 5329248)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2515 (class 2606 OID 5329003)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2551 (class 2606 OID 5329183)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2549 (class 2606 OID 5329178)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2550 (class 2606 OID 5329173)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2527 (class 2606 OID 5329063)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2557 (class 2606 OID 5329223)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2559 (class 2606 OID 5329213)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2558 (class 2606 OID 5329218)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2521 (class 2606 OID 5329038)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2522 (class 2606 OID 5329033)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2547 (class 2606 OID 5329163)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2570 (class 2606 OID 5329268)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2569 (class 2606 OID 5329273)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2568 (class 2606 OID 5329278)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2571 (class 2606 OID 5329298)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2574 (class 2606 OID 5329283)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2572 (class 2606 OID 5329293)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2573 (class 2606 OID 5329288)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2519 (class 2606 OID 5329028)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2520 (class 2606 OID 5329023)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2512 (class 2606 OID 5328988)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2553 (class 2606 OID 5329193)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2535 (class 2606 OID 5329103)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2509 (class 2606 OID 5328968)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2508 (class 2606 OID 5328973)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2554 (class 2606 OID 5329208)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2555 (class 2606 OID 5329203)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2556 (class 2606 OID 5329198)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2525 (class 2606 OID 5329043)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2523 (class 2606 OID 5329053)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2524 (class 2606 OID 5329048)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2582 (class 2606 OID 5329338)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2539 (class 2606 OID 5329138)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2541 (class 2606 OID 5329128)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2542 (class 2606 OID 5329123)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2540 (class 2606 OID 5329133)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2507 (class 2606 OID 5328958)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2506 (class 2606 OID 5328963)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2552 (class 2606 OID 5329188)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2548 (class 2606 OID 5329168)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2562 (class 2606 OID 5329233)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2561 (class 2606 OID 5329238)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2517 (class 2606 OID 5329013)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 5329008)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2516 (class 2606 OID 5329018)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2566 (class 2606 OID 5329253)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2565 (class 2606 OID 5329258)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2579 (class 2606 OID 5329323)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2580 (class 2606 OID 5329318)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2577 (class 2606 OID 5329333)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2581 (class 2606 OID 5329313)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2578 (class 2606 OID 5329328)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2560 (class 2606 OID 5329228)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2543 (class 2606 OID 5329158)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2544 (class 2606 OID 5329153)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2546 (class 2606 OID 5329143)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2545 (class 2606 OID 5329148)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2575 (class 2606 OID 5329308)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2576 (class 2606 OID 5329303)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2526 (class 2606 OID 5329058)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2567 (class 2606 OID 5329263)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2510 (class 2606 OID 5328983)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2511 (class 2606 OID 5328978)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2514 (class 2606 OID 5328993)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2513 (class 2606 OID 5328998)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2536 (class 2606 OID 5329118)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2537 (class 2606 OID 5329113)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2538 (class 2606 OID 5329108)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-27 14:56:31 CEST

--
-- PostgreSQL database dump complete
--

