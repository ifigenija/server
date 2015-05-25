--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-25 15:33:21 CEST

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
-- TOC entry 180 (class 1259 OID 4890075)
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
-- TOC entry 227 (class 1259 OID 4890585)
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
-- TOC entry 226 (class 1259 OID 4890568)
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
-- TOC entry 219 (class 1259 OID 4890479)
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
-- TOC entry 194 (class 1259 OID 4890249)
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
-- TOC entry 197 (class 1259 OID 4890283)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 4890196)
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
-- TOC entry 213 (class 1259 OID 4890409)
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
-- TOC entry 192 (class 1259 OID 4890233)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 196 (class 1259 OID 4890277)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 4890213)
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
-- TOC entry 202 (class 1259 OID 4890326)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 4890351)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 4890170)
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
-- TOC entry 181 (class 1259 OID 4890084)
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
-- TOC entry 182 (class 1259 OID 4890095)
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
-- TOC entry 177 (class 1259 OID 4890049)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 4890068)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 4890358)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 4890389)
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
-- TOC entry 223 (class 1259 OID 4890522)
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
-- TOC entry 184 (class 1259 OID 4890127)
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
-- TOC entry 186 (class 1259 OID 4890162)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 4890332)
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
-- TOC entry 185 (class 1259 OID 4890147)
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
-- TOC entry 191 (class 1259 OID 4890225)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 4890344)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 4890464)
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
-- TOC entry 222 (class 1259 OID 4890515)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 4890373)
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
-- TOC entry 201 (class 1259 OID 4890317)
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
-- TOC entry 200 (class 1259 OID 4890307)
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
-- TOC entry 221 (class 1259 OID 4890504)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 4890441)
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
-- TOC entry 174 (class 1259 OID 4890020)
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
-- TOC entry 173 (class 1259 OID 4890018)
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
-- TOC entry 210 (class 1259 OID 4890383)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 4890058)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 4890042)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 4890397)
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
-- TOC entry 204 (class 1259 OID 4890338)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 4890288)
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
-- TOC entry 230 (class 1259 OID 4890610)
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
-- TOC entry 229 (class 1259 OID 4890603)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 4890598)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 4890451)
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
-- TOC entry 231 (class 1259 OID 4890618)
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE strosekuprizoritve_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 183 (class 1259 OID 4890119)
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
-- TOC entry 199 (class 1259 OID 4890294)
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
-- TOC entry 220 (class 1259 OID 4890493)
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
-- TOC entry 188 (class 1259 OID 4890182)
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
-- TOC entry 175 (class 1259 OID 4890029)
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
-- TOC entry 225 (class 1259 OID 4890548)
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
-- TOC entry 193 (class 1259 OID 4890240)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 4890365)
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
-- TOC entry 215 (class 1259 OID 4890433)
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
-- TOC entry 195 (class 1259 OID 4890272)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 4890538)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 4890423)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2146 (class 2604 OID 4890023)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2700 (class 0 OID 4890075)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2747 (class 0 OID 4890585)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
\.


--
-- TOC entry 2746 (class 0 OID 4890568)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2739 (class 0 OID 4890479)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2714 (class 0 OID 4890249)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2717 (class 0 OID 4890283)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2709 (class 0 OID 4890196)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5563-24a0-5aa6-0b49c6ea1c74	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5563-24a0-8bce-065fedb45223	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5563-24a0-8b4a-e84c0feca15e	AL	ALB	008	Albania 	Albanija	\N
00040000-5563-24a0-e1eb-76565103de9c	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5563-24a0-276f-a78e5eb535ad	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5563-24a0-97f0-49acd2a74a72	AD	AND	020	Andorra 	Andora	\N
00040000-5563-24a0-a7f2-350a3ae0d7ec	AO	AGO	024	Angola 	Angola	\N
00040000-5563-24a0-d378-88e0c29d7ff0	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5563-24a0-bcd0-edf062f1673b	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5563-24a0-a936-fb93f68ed52a	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5563-24a0-756b-2744c4270e7f	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5563-24a0-4ea2-f1b760253208	AM	ARM	051	Armenia 	Armenija	\N
00040000-5563-24a0-6564-4b623631571e	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5563-24a0-7aeb-8178c7a9e4b9	AU	AUS	036	Australia 	Avstralija	\N
00040000-5563-24a0-1578-7a5c260385da	AT	AUT	040	Austria 	Avstrija	\N
00040000-5563-24a0-0ff0-d201e000fbd4	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5563-24a0-c0ba-7d41aa4af724	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5563-24a0-cce9-4df5a73da3d6	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5563-24a0-abde-ea39c93e826a	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5563-24a0-8b70-66b452656d4c	BB	BRB	052	Barbados 	Barbados	\N
00040000-5563-24a0-ad08-68f071285088	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5563-24a0-f2c1-dddd9ef1113b	BE	BEL	056	Belgium 	Belgija	\N
00040000-5563-24a0-26f0-ee4e237c6365	BZ	BLZ	084	Belize 	Belize	\N
00040000-5563-24a0-d981-e7fd10782468	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5563-24a0-b71e-596b8e668e9f	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5563-24a0-ef1e-0ed79e26c33f	BT	BTN	064	Bhutan 	Butan	\N
00040000-5563-24a0-6115-c9803391b97f	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5563-24a0-06bf-719bad27b303	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5563-24a0-84b5-36c9002fe1c8	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5563-24a0-3057-322d7f1509a5	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5563-24a0-5f31-d32b2aeab715	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5563-24a0-a68d-a6f04a2633e9	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5563-24a0-0560-ab10099274a4	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5563-24a0-87f7-8dcd0a1d3667	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5563-24a0-a88f-6c41fa3b4e31	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5563-24a0-54b9-c34964ec1e20	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5563-24a0-43f5-bd4a4702f1a3	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5563-24a0-308a-c6cb203df868	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5563-24a0-a9c4-3db2d042016d	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5563-24a0-0fc3-9dd964922664	CA	CAN	124	Canada 	Kanada	\N
00040000-5563-24a0-b70a-d7bb2e6d631e	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5563-24a0-bcf6-5a4e00e60e25	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5563-24a0-2ff7-588bb763d42c	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5563-24a0-524e-47501e3e47d5	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5563-24a0-df13-7df71cc9cfcc	CL	CHL	152	Chile 	Čile	\N
00040000-5563-24a0-09e6-3a4b4e3198d5	CN	CHN	156	China 	Kitajska	\N
00040000-5563-24a0-cf82-8172fb1a09e3	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5563-24a0-bd02-1586f71a0bd3	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5563-24a0-bc06-2cbb0322f502	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5563-24a0-f07d-8d9abe5606ea	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5563-24a0-cb4b-8553b12ba2dc	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5563-24a0-832f-b0f23b98490e	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5563-24a0-91f3-dd01c947aa87	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5563-24a0-abd6-2c538adf1a60	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5563-24a0-a729-27f396263a6f	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5563-24a0-792e-bc620ae0d8da	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5563-24a0-7b5f-cf24db0a9b83	CU	CUB	192	Cuba 	Kuba	\N
00040000-5563-24a0-b687-5c1b4991f426	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5563-24a0-f4cc-de056f95ae1b	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5563-24a0-55bd-367e16c4aae2	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5563-24a0-2c31-ec9aa95b2ecd	DK	DNK	208	Denmark 	Danska	\N
00040000-5563-24a0-bc83-79822fc527b9	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5563-24a0-cd94-fb1376f60d95	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5563-24a0-58d4-f4ee350b970b	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5563-24a0-8f10-d826ea42c526	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5563-24a0-69c1-797d819e9b35	EG	EGY	818	Egypt 	Egipt	\N
00040000-5563-24a0-9167-68526f5dc851	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5563-24a0-b64e-258e785a046b	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5563-24a0-db2f-deb1784c8d8a	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5563-24a0-7755-251d7710d92a	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5563-24a0-c601-94154bb1cd3a	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5563-24a0-bffc-f548c0fcfc0c	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5563-24a0-738e-15ce666f38bb	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5563-24a0-e175-996b2a3caca8	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5563-24a0-ad90-6f19774a6164	FI	FIN	246	Finland 	Finska	\N
00040000-5563-24a0-80c0-6a203e0bfb55	FR	FRA	250	France 	Francija	\N
00040000-5563-24a0-fde3-d4111f255973	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5563-24a0-0cfd-e1ee5387b522	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5563-24a0-7eec-5f72af45cc3e	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5563-24a0-c3e2-ef4059cd6f55	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5563-24a0-8784-cbfe211797da	GA	GAB	266	Gabon 	Gabon	\N
00040000-5563-24a0-785c-279be0c0d88b	GM	GMB	270	Gambia 	Gambija	\N
00040000-5563-24a0-93f5-e2d2ba155852	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5563-24a0-d59c-ddea36eb7380	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5563-24a0-4853-ed23612d464a	GH	GHA	288	Ghana 	Gana	\N
00040000-5563-24a0-b793-63842e806762	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5563-24a0-1381-2f5b4defc38e	GR	GRC	300	Greece 	Grčija	\N
00040000-5563-24a0-820b-d77992ca472d	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5563-24a0-cff9-65e7bfa394cf	GD	GRD	308	Grenada 	Grenada	\N
00040000-5563-24a0-8e7c-162154f1c3e1	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5563-24a0-25f1-5c3ba683c971	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5563-24a0-830a-28e69f1a0d80	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5563-24a0-e38c-5d75d209a7a7	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5563-24a0-bc11-9e7c3c5bcb77	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5563-24a0-2ad9-21145af9f392	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5563-24a0-79e6-0046282842df	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5563-24a0-2c1a-89aefd12fd7d	HT	HTI	332	Haiti 	Haiti	\N
00040000-5563-24a0-45b9-da02c70900a6	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5563-24a0-1abd-30e7590277f4	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5563-24a0-d063-6d6dfbc9d9a4	HN	HND	340	Honduras 	Honduras	\N
00040000-5563-24a0-bb2d-8354017da2b3	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5563-24a0-0d33-727f1f9d26c8	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5563-24a0-585f-56b2dafcfcaa	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5563-24a0-8964-2fce17007d51	IN	IND	356	India 	Indija	\N
00040000-5563-24a0-0a66-c912fe176fdb	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5563-24a0-6b71-f08916576e9a	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5563-24a0-b39d-7bf5abb952ef	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5563-24a0-36d7-cb5baf6c7ce8	IE	IRL	372	Ireland 	Irska	\N
00040000-5563-24a0-61d0-fb5a3beae802	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5563-24a0-82f9-b0c3c68115f4	IL	ISR	376	Israel 	Izrael	\N
00040000-5563-24a0-c77a-65315cd211c1	IT	ITA	380	Italy 	Italija	\N
00040000-5563-24a0-f938-37d99f25e621	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5563-24a0-1d38-f2ca7b525be8	JP	JPN	392	Japan 	Japonska	\N
00040000-5563-24a0-f3ac-2a2eebc90d20	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5563-24a0-95be-b233f850406a	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5563-24a0-71b4-0421a1f8d589	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5563-24a0-47d9-6a905601cea4	KE	KEN	404	Kenya 	Kenija	\N
00040000-5563-24a0-b651-5207d4c59693	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5563-24a0-c80c-c55128d73de1	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5563-24a0-b49e-ed4469f8e628	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5563-24a0-6110-836af3b71517	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5563-24a0-1913-d90202892b95	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5563-24a0-be2c-061196c7b59e	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5563-24a0-9ece-b71d0958f5fc	LV	LVA	428	Latvia 	Latvija	\N
00040000-5563-24a0-c166-c8047390d2ef	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5563-24a0-5b45-cec988ff3c62	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5563-24a0-3dcb-5dd9172dcbea	LR	LBR	430	Liberia 	Liberija	\N
00040000-5563-24a0-d3a7-2d2f16ccc072	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5563-24a0-4248-c4720b9fd1f9	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5563-24a0-53e8-9dde33ed35b2	LT	LTU	440	Lithuania 	Litva	\N
00040000-5563-24a0-f41c-393ac1ab1161	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5563-24a0-2dc5-ad8bb5e93432	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5563-24a0-0122-d961f27bb4bf	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5563-24a0-f604-bfb6d65fbb97	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5563-24a0-4c8b-17b295d25ebd	MW	MWI	454	Malawi 	Malavi	\N
00040000-5563-24a0-de54-b6921dd2ed75	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5563-24a0-aafe-3f9126a7df16	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5563-24a0-8435-1cab72383613	ML	MLI	466	Mali 	Mali	\N
00040000-5563-24a0-cf57-b38c811eeee2	MT	MLT	470	Malta 	Malta	\N
00040000-5563-24a0-f2c4-5ca74052400e	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5563-24a0-806b-d65ba2d091cb	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5563-24a0-e5d9-5f80a28cea3c	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5563-24a0-aaba-828d31b742a5	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5563-24a0-5aca-c952c71a66df	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5563-24a0-0214-fe104f204a22	MX	MEX	484	Mexico 	Mehika	\N
00040000-5563-24a0-f310-eeb05bfd5cb6	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5563-24a0-838a-06e7605b2efa	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5563-24a0-8daf-0b87a2ba1033	MC	MCO	492	Monaco 	Monako	\N
00040000-5563-24a0-7b33-f37cc45efa1d	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5563-24a0-03db-3281191c2899	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5563-24a0-4e46-4ba1d82d9e3c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5563-24a0-59cc-d0f5731a26f2	MA	MAR	504	Morocco 	Maroko	\N
00040000-5563-24a0-a57b-58167c27ed01	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5563-24a0-d89f-45a2f6148c21	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5563-24a0-fb91-884dddd731aa	NA	NAM	516	Namibia 	Namibija	\N
00040000-5563-24a0-c3d1-0b53ea54d083	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5563-24a0-ada2-5da5d1925c36	NP	NPL	524	Nepal 	Nepal	\N
00040000-5563-24a0-e97d-ab93f7656663	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5563-24a0-3be1-823233fb8a7f	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5563-24a0-3061-7ea7fac30381	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5563-24a0-d541-af0bd2fc2cba	NE	NER	562	Niger 	Niger 	\N
00040000-5563-24a0-b393-eab41dc7e414	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5563-24a0-70e7-4c5e382858ae	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5563-24a0-483d-8d10446faf1a	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5563-24a0-94a0-5d77fad1357e	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5563-24a0-4916-608b73c89756	NO	NOR	578	Norway 	Norveška	\N
00040000-5563-24a0-a973-7c4c37a62d22	OM	OMN	512	Oman 	Oman	\N
00040000-5563-24a0-6874-179c9d5ab181	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5563-24a0-788a-e3f5b2093b35	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5563-24a0-b454-5e06490beaf3	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5563-24a0-9422-d24a505b3c64	PA	PAN	591	Panama 	Panama	\N
00040000-5563-24a0-d010-d819330e472b	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5563-24a0-77ae-d754ded821f7	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5563-24a0-807d-733d5644d7fa	PE	PER	604	Peru 	Peru	\N
00040000-5563-24a0-0169-f403265947e5	PH	PHL	608	Philippines 	Filipini	\N
00040000-5563-24a0-0de5-038cc9ddb02b	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5563-24a0-d4b2-e48dfbf6239b	PL	POL	616	Poland 	Poljska	\N
00040000-5563-24a0-81a1-e5c29eae4eb2	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5563-24a0-03d8-5e42017cc73c	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5563-24a0-2953-d4aabed39fc1	QA	QAT	634	Qatar 	Katar	\N
00040000-5563-24a0-72ae-1ffbf19c8727	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5563-24a0-87cd-e3f81c2be44f	RO	ROU	642	Romania 	Romunija	\N
00040000-5563-24a0-5736-6f44e81c1d08	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5563-24a0-7064-6e3c49646dca	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5563-24a0-347e-5797daddc6b7	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5563-24a0-e12a-80f930cf6d84	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5563-24a0-9108-e599e1e62824	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5563-24a0-4018-d937b60fdb19	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5563-24a0-4466-09cca60cc258	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5563-24a0-fb38-f0b91e1a2c34	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5563-24a0-ef14-784c02af80c4	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5563-24a0-371a-42c6e2dbe1ac	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5563-24a0-f83b-2179931b6544	SM	SMR	674	San Marino 	San Marino	\N
00040000-5563-24a0-a868-1a91bc95f4ee	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5563-24a0-8513-e6d64ba6eb50	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5563-24a0-0626-6dc6ede034e2	SN	SEN	686	Senegal 	Senegal	\N
00040000-5563-24a0-b2b5-eaef252a43f4	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5563-24a0-88b7-d90819fc803f	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5563-24a0-80aa-2e724504655e	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5563-24a0-bebd-f0ef8f65ac8a	SG	SGP	702	Singapore 	Singapur	\N
00040000-5563-24a0-29b3-7979e7797541	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5563-24a0-bc9e-cb4ba9eafd8f	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5563-24a0-cdfb-38344c429b7e	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5563-24a0-7b9f-700e7c5595d9	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5563-24a0-cea4-5ec4b8235a9a	SO	SOM	706	Somalia 	Somalija	\N
00040000-5563-24a0-a4f8-c53e40615bd1	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5563-24a0-a907-f8b37eab3d89	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5563-24a0-85d3-04d1920dc454	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5563-24a0-9c1c-f390da56ce04	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5563-24a0-e338-0e8128c57300	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5563-24a0-2f79-3fffad83dcb0	SD	SDN	729	Sudan 	Sudan	\N
00040000-5563-24a0-7565-547cb633e36d	SR	SUR	740	Suriname 	Surinam	\N
00040000-5563-24a0-e5de-35c73c7d25ed	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5563-24a0-dec1-10e226e7a968	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5563-24a0-dee5-23fd4e3066d0	SE	SWE	752	Sweden 	Švedska	\N
00040000-5563-24a0-e02d-97fb6c9addae	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5563-24a0-5179-60f088638926	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5563-24a0-bac2-52bd45c5e87a	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5563-24a0-68d1-62e5a48f54ea	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5563-24a0-5447-130955107997	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5563-24a0-015a-8c744d782208	TH	THA	764	Thailand 	Tajska	\N
00040000-5563-24a0-fc8d-e793d1fdce93	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5563-24a0-1194-a377d7431820	TG	TGO	768	Togo 	Togo	\N
00040000-5563-24a0-1ac0-bc3d88b9d97a	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5563-24a0-ecd3-752f7bde3b0a	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5563-24a0-8086-d797785c778b	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5563-24a0-5efc-d2028795784b	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5563-24a0-0e5a-233d41fb2941	TR	TUR	792	Turkey 	Turčija	\N
00040000-5563-24a0-cfe3-2e9e48e4d9b1	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5563-24a0-9ebc-5a04c061b21b	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5563-24a0-0139-dcdfb8749b6e	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5563-24a0-fdbc-8e73919cceb1	UG	UGA	800	Uganda 	Uganda	\N
00040000-5563-24a0-dc25-721b35128dcc	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5563-24a0-1897-07e7fdd17252	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5563-24a0-1f09-873b74d9df8d	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5563-24a0-df51-e0f1526a44e5	US	USA	840	United States 	Združene države Amerike	\N
00040000-5563-24a0-3055-a43b89aa06fa	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5563-24a0-bc01-2f722d3ae2db	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5563-24a0-3bc1-e31569b90502	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5563-24a0-2536-e7b8e2f316fd	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5563-24a0-44ac-deb4c1962a23	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5563-24a0-ed31-3510ff22eb1c	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5563-24a0-1450-9b9efff220eb	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5563-24a0-6df8-eceb72272d33	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5563-24a0-3989-7ef86c36c890	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5563-24a0-7a64-ea97d0e92bbe	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5563-24a0-0297-c6578f9d7587	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5563-24a0-fc78-f49ccdda0d67	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5563-24a0-a1e5-f65438ab701a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2733 (class 0 OID 4890409)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj) FROM stdin;
\.


--
-- TOC entry 2712 (class 0 OID 4890233)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2716 (class 0 OID 4890277)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2710 (class 0 OID 4890213)
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
-- TOC entry 2722 (class 0 OID 4890326)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2726 (class 0 OID 4890351)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2707 (class 0 OID 4890170)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5563-24a0-31ee-9bde1cfaf8ed	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5563-24a0-369e-5785d18407b2	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5563-24a0-c433-72a1570f2f03	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5563-24a0-e482-575ec94a995d	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5563-24a0-5541-a2abe02624d7	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5563-24a0-2aff-e815d3124f99	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5563-24a0-9752-f813e3f4a140	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5563-24a0-0ee7-3be926562dc8	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5563-24a0-1273-e23e18421186	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5563-24a0-b476-d1ca1c73cfd8	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5563-24a0-b7d5-da9dfae8a780	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5563-24a0-b878-ea29267c2360	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5563-24a0-5f6f-ad659df3f49d	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5563-24a0-5008-b2355c7bb6f5	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5563-24a0-794d-eef8a05608c2	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2701 (class 0 OID 4890084)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5563-24a0-19e2-3cd882d4981f	00000000-5563-24a0-5541-a2abe02624d7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5563-24a0-fdc8-6ca392571f06	00000000-5563-24a0-5541-a2abe02624d7	00010000-5563-24a0-1d82-d69b293c8434	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5563-24a0-b916-3c3dce92f0af	00000000-5563-24a0-2aff-e815d3124f99	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2702 (class 0 OID 4890095)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5563-24a1-8352-9390e263d132	\N	\N	0001	g.	123456789	Novak	a	Peter	Jani	jani.novak@xxx.xx	1958-01-06	\N	0601958000000	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5563-24a1-b920-4ef7d477a88d	\N	\N	0002	dr.	234567890	Horvat	b			anton.horvat@xxx.xx	1968-02-12	\N	1202968111111	M		Slovenija	Slovenija	Maribor
00090000-5563-24a1-7d7b-4d97b2d910ff	\N	\N	0003		345678901	Kovačič	c			ivan.kovacic@xxx.xx	1975-03-26	\N	2603976222222	M		Slovenija	Slovenija	Celje
00090000-5563-24a1-5b14-54f20e50e2a6	\N	\N	0004	prof.	456789012	Krajnc	d		Joža	jozef.krajnc@xxx.xx	1971-04-30	\N	3004971333333	M		Slovenija	Slovenija	Kranj
00090000-5563-24a1-b5ba-a79a012e2765	\N	\N	0005		567890123	Zupančič	e			marko.zupancic@xxx.xx	1984-05-07	\N	0705984444444	M		Slovenija	Slovenija	Koper
00090000-5563-24a1-a286-39b4973d004b	\N	\N	0006	ga.	678901234	Kovač	f			marija.kovac@xxx.xx	1962-06-19	\N	1906962444444	Z		Slovenija	Slovenija	Murska Sobota
00090000-5563-24a1-f05b-c9121fe9f680	\N	\N	0007	ga.	789012345	Potočnik	g			ana.potocnik@xxx.xx	1975-07-24	\N	2407975555555	Z		Slovenija	Slovenija	Novo Mesto
00090000-5563-24a1-dae8-a24796305df3	\N	\N	0008	ga.	890123456	Mlakar	h			maja.mlakar@xxx.xx	1986-08-02	\N	0208986666666	Z		Slovenija	Slovenija	Nova Gorica
00090000-5563-24a1-b1c6-0a67cda45085	\N	\N	0009		901234567	Kos	i			irena.kos@xxx.xx	1967-09-14	\N	1409967777777	Z		Slovenija	Slovenija	Ptuj
00090000-5563-24a1-3185-657fb123e2bc	\N	\N	0010		901234567	Vidmar	J			mojca.vidmar@xxx.xx	1967-09-14	\N	1409967777777	Z		Slovenija	Slovenija	Idrija
\.


--
-- TOC entry 2692 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2697 (class 0 OID 4890049)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5563-24a0-3cf9-a8d58b76daf6	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5563-24a0-9206-f00734f86a18	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5563-24a0-1101-a6f540753ae7	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5563-24a0-797e-5fc0c0be32ce	Abonma-read	Abonma - branje	f
00030000-5563-24a0-8050-15d293dbeb1a	Abonma-write	Abonma - spreminjanje	f
00030000-5563-24a0-c2d5-b400939fb43a	Alternacija-read	Alternacija - branje	f
00030000-5563-24a0-ac8b-1158bdcc29c0	Alternacija-write	Alternacija - spreminjanje	f
00030000-5563-24a0-6feb-47beee0e6b08	Arhivalija-read	Arhivalija - branje	f
00030000-5563-24a0-70cb-cb1d53958cce	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5563-24a0-3dca-f68b1d91b233	Besedilo-read	Besedilo - branje	f
00030000-5563-24a0-ab47-7b18f79ce06d	Besedilo-write	Besedilo - spreminjanje	f
00030000-5563-24a0-4cc3-445ee6788f31	DogodekIzven-read	DogodekIzven - branje	f
00030000-5563-24a0-67c1-8a1bb56f7b38	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5563-24a0-7baa-b6a2db306fe4	Dogodek-read	Dogodek - branje	f
00030000-5563-24a0-ca96-e8fcfb1dc60b	Dogodek-write	Dogodek - spreminjanje	f
00030000-5563-24a0-403f-e2d5fa0a1bfa	Drzava-read	Drzava - branje	f
00030000-5563-24a0-26f1-4f659a3d0c58	Drzava-write	Drzava - spreminjanje	f
00030000-5563-24a0-f598-878bc0a3684d	Funkcija-read	Funkcija - branje	f
00030000-5563-24a0-2992-354b70291195	Funkcija-write	Funkcija - spreminjanje	f
00030000-5563-24a0-3690-94aa2cc58c9d	Gostovanje-read	Gostovanje - branje	f
00030000-5563-24a0-2eee-d530e1f2eb4c	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5563-24a0-eb50-c9732a693262	Gostujoca-read	Gostujoca - branje	f
00030000-5563-24a0-b740-4484d9fcf663	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5563-24a0-b3bd-6362aa2789f5	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5563-24a0-899d-dd9ca3c742f6	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5563-24a0-9830-9191fd9a40d9	Kupec-read	Kupec - branje	f
00030000-5563-24a0-ffd5-a80da7b345aa	Kupec-write	Kupec - spreminjanje	f
00030000-5563-24a0-be8b-8806f9d849b1	NacinPlacina-read	NacinPlacina - branje	f
00030000-5563-24a0-cbfb-c54c58894b39	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5563-24a0-a6de-6071b5713ef6	Option-read	Option - branje	f
00030000-5563-24a0-aea8-f03884918751	Option-write	Option - spreminjanje	f
00030000-5563-24a0-0fb6-854c932a267b	OptionValue-read	OptionValue - branje	f
00030000-5563-24a0-f235-c54171c5954f	OptionValue-write	OptionValue - spreminjanje	f
00030000-5563-24a0-74f4-3c54a1f68cc5	Oseba-read	Oseba - branje	f
00030000-5563-24a0-c7dd-15ee5451092e	Oseba-write	Oseba - spreminjanje	f
00030000-5563-24a0-09ba-297346541bc6	Permission-read	Permission - branje	f
00030000-5563-24a0-eba0-5ba2b06198d5	Permission-write	Permission - spreminjanje	f
00030000-5563-24a0-37cc-4d6c17568ba8	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5563-24a0-c1b0-7416a40c3c53	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5563-24a0-59fc-89e09d9269aa	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5563-24a0-2665-18d8b580b741	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5563-24a0-fdca-b66c6debf653	Pogodba-read	Pogodba - branje	f
00030000-5563-24a0-ee62-019413e85113	Pogodba-write	Pogodba - spreminjanje	f
00030000-5563-24a0-db60-c5cc9a088b84	Popa-read	Popa - branje	f
00030000-5563-24a0-640c-2da4faf85868	Popa-write	Popa - spreminjanje	f
00030000-5563-24a0-aaf6-bc12ec7d817f	Posta-read	Posta - branje	f
00030000-5563-24a0-c9e6-14e7470a8790	Posta-write	Posta - spreminjanje	f
00030000-5563-24a0-965d-0b3e2103fbfc	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5563-24a0-b4dd-fc9d6a81b236	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5563-24a0-9e1f-1a7e4130e8bb	PostniNaslov-read	PostniNaslov - branje	f
00030000-5563-24a0-0a73-3435dbf29c6e	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5563-24a0-205d-9e9e23371846	Predstava-read	Predstava - branje	f
00030000-5563-24a0-67b6-29ac02a2e1c7	Predstava-write	Predstava - spreminjanje	f
00030000-5563-24a0-ea76-afe308dd626a	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5563-24a0-7e42-df2964994081	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5563-24a0-59ae-5b224220d5aa	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5563-24a0-ba65-fd8b452f198e	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5563-24a0-59a9-510d43b67896	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5563-24a0-688b-28a30bb90ca4	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5563-24a0-7e2b-402158a50f39	Prostor-read	Prostor - branje	f
00030000-5563-24a0-7cd4-0599cbb467be	Prostor-write	Prostor - spreminjanje	f
00030000-5563-24a0-8dcc-2f1d594e67dd	Racun-read	Racun - branje	f
00030000-5563-24a0-b344-1458f44afb5b	Racun-write	Racun - spreminjanje	f
00030000-5563-24a0-7b78-2772bb3f1c59	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5563-24a0-7782-194e33c0e4bf	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5563-24a0-b615-e451fda5912f	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5563-24a0-64de-5b013e4be21c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5563-24a0-40f8-acc7b22c31c7	Rekvizit-read	Rekvizit - branje	f
00030000-5563-24a0-f480-0a818786168d	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5563-24a0-4b78-672f73f69e0d	Revizija-read	Revizija - branje	f
00030000-5563-24a0-28f5-4de9a0a2db41	Revizija-write	Revizija - spreminjanje	f
00030000-5563-24a0-7f76-1b1934e55fdf	Rezervacija-read	Rezervacija - branje	f
00030000-5563-24a0-4ea1-051063d588d1	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5563-24a0-36e4-bbc85a291123	Role-read	Role - branje	f
00030000-5563-24a0-6207-24fd24f4db17	Role-write	Role - spreminjanje	f
00030000-5563-24a0-99fa-ca3f76102924	SedezniRed-read	SedezniRed - branje	f
00030000-5563-24a0-0b25-77108272ce0b	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5563-24a0-6f6a-454429a8fcb7	Sedez-read	Sedez - branje	f
00030000-5563-24a0-1ca0-fe50d96db5ab	Sedez-write	Sedez - spreminjanje	f
00030000-5563-24a0-b67e-96a6330d7a0e	Sezona-read	Sezona - branje	f
00030000-5563-24a0-9e4e-8e1e9502e362	Sezona-write	Sezona - spreminjanje	f
00030000-5563-24a0-da89-3e270c6aa74c	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5563-24a0-fa71-e57ca6d7ece4	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5563-24a0-0b6a-5581284d6930	Stevilcenje-read	Stevilcenje - branje	f
00030000-5563-24a0-0c68-828a7d574419	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5563-24a0-dde6-5076047fec7f	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5563-24a0-cc6e-955584838a07	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5563-24a0-ba36-c2da7a3b422d	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5563-24a0-aedc-4a5ba59596a9	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5563-24a0-b1fa-5f58bf57d225	Telefonska-read	Telefonska - branje	f
00030000-5563-24a0-c317-c4709743c5be	Telefonska-write	Telefonska - spreminjanje	f
00030000-5563-24a0-543f-0081efa54729	TerminStoritve-read	TerminStoritve - branje	f
00030000-5563-24a0-5385-4052b6318b77	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5563-24a0-c76c-21bd18e8c543	TipFunkcije-read	TipFunkcije - branje	f
00030000-5563-24a0-8ff0-ca111cacf9c6	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5563-24a0-7bfd-e42cd95c99b5	Trr-read	Trr - branje	f
00030000-5563-24a0-b90e-d677404654ac	Trr-write	Trr - spreminjanje	f
00030000-5563-24a0-ed36-4ac41abe20ac	Uprizoritev-read	Uprizoritev - branje	f
00030000-5563-24a0-82db-f05b3fed2bf0	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5563-24a0-98a0-842a8e81643e	User-read	User - branje	f
00030000-5563-24a0-1133-fcc5704d78b2	User-write	User - spreminjanje	f
00030000-5563-24a0-f925-3e22845d3b7e	Vaja-read	Vaja - branje	f
00030000-5563-24a0-3f89-66e417efbcc7	Vaja-write	Vaja - spreminjanje	f
00030000-5563-24a0-30d9-c21277e461d3	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5563-24a0-61f7-d7f75c8cf44f	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5563-24a0-23a4-36d7472ceb04	Zaposlitev-read	Zaposlitev - branje	f
00030000-5563-24a0-9eca-3eddea23603d	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5563-24a0-0709-cadc47ce6249	Zasedenost-read	Zasedenost - branje	f
00030000-5563-24a0-aab5-160d3d2f3bb0	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5563-24a0-1097-a878c169f54a	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5563-24a0-fb8d-de536fb4f6e8	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5563-24a0-fdd0-4be80fa18ca8	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5563-24a0-9ecf-a7f38973209d	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2699 (class 0 OID 4890068)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5563-24a0-93f6-b7f425bb01ea	00030000-5563-24a0-403f-e2d5fa0a1bfa
00020000-5563-24a0-fdc8-e22860c02786	00030000-5563-24a0-26f1-4f659a3d0c58
00020000-5563-24a0-fdc8-e22860c02786	00030000-5563-24a0-403f-e2d5fa0a1bfa
\.


--
-- TOC entry 2727 (class 0 OID 4890358)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2731 (class 0 OID 4890389)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2743 (class 0 OID 4890522)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2704 (class 0 OID 4890127)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5563-24a1-3159-d65128a55c99	00040000-5563-24a0-5aa6-0b49c6ea1c74	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5563-24a1-1e0f-59c8e32a9694	00040000-5563-24a0-5aa6-0b49c6ea1c74	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2706 (class 0 OID 4890162)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5563-249f-ef9c-b82b55e66a96	8341	Adlešiči
00050000-5563-249f-3e1c-d5a6b1ceb74c	5270	Ajdovščina
00050000-5563-249f-cf76-927cef297aab	6280	Ankaran/Ancarano
00050000-5563-249f-101c-33b917cf1cd9	9253	Apače
00050000-5563-249f-181e-60cbb37e9ec9	8253	Artiče
00050000-5563-249f-4ccc-f9378a69706c	4275	Begunje na Gorenjskem
00050000-5563-249f-5f4e-a77d52ea9d77	1382	Begunje pri Cerknici
00050000-5563-249f-ad0d-03d93a24f9bc	9231	Beltinci
00050000-5563-249f-4592-dc46e941a83b	2234	Benedikt
00050000-5563-249f-497a-e85b735deeb7	2345	Bistrica ob Dravi
00050000-5563-249f-b318-f0d37c1da9c3	3256	Bistrica ob Sotli
00050000-5563-249f-1a28-78a34ed58d2e	8259	Bizeljsko
00050000-5563-249f-478f-b60a574824f4	1223	Blagovica
00050000-5563-249f-93cb-7338b9dec2bc	8283	Blanca
00050000-5563-249f-8c85-0d4e704b6af3	4260	Bled
00050000-5563-249f-3865-26354b76987a	4273	Blejska Dobrava
00050000-5563-249f-ba10-599c1c8d3441	9265	Bodonci
00050000-5563-249f-5df3-521319f10def	9222	Bogojina
00050000-5563-249f-2cce-2d740581dd6b	4263	Bohinjska Bela
00050000-5563-249f-1504-cbc67f08fc23	4264	Bohinjska Bistrica
00050000-5563-249f-57b9-0aa010af5e6e	4265	Bohinjsko jezero
00050000-5563-249f-063d-fd458aea8963	1353	Borovnica
00050000-5563-249f-553d-7a25afba7225	8294	Boštanj
00050000-5563-249f-5557-29f394b46724	5230	Bovec
00050000-5563-249f-dec0-f5b9027d6699	5295	Branik
00050000-5563-249f-c4b3-7bdf7f9ad514	3314	Braslovče
00050000-5563-249f-ae26-c060a80cecaf	5223	Breginj
00050000-5563-249f-5342-40dcf0784468	8280	Brestanica
00050000-5563-249f-ce73-db3bba3e3250	2354	Bresternica
00050000-5563-249f-645a-78b64ab077ca	4243	Brezje
00050000-5563-249f-0170-92af2386b3c1	1351	Brezovica pri Ljubljani
00050000-5563-249f-3955-8e12ec442226	8250	Brežice
00050000-5563-249f-93d7-ec6a3c780fba	4210	Brnik - Aerodrom
00050000-5563-249f-ded0-228ae6d57f91	8321	Brusnice
00050000-5563-249f-c04c-b49de26f1cb1	3255	Buče
00050000-5563-249f-0899-196d8cfb1a16	8276	Bučka 
00050000-5563-249f-379b-6ca5ce65f8a2	9261	Cankova
00050000-5563-249f-2df1-a938bf1a73ce	3000	Celje 
00050000-5563-249f-e2f7-390a6a76b7a5	3001	Celje - poštni predali
00050000-5563-249f-6904-c8f02e828fad	4207	Cerklje na Gorenjskem
00050000-5563-249f-2695-4dc7ec47fca4	8263	Cerklje ob Krki
00050000-5563-249f-19f2-ae7dc698cfa7	1380	Cerknica
00050000-5563-249f-653f-9c15075c0f58	5282	Cerkno
00050000-5563-249f-a770-8271bd8eee30	2236	Cerkvenjak
00050000-5563-249f-baa5-32c14b6d6a66	2215	Ceršak
00050000-5563-249f-9b36-56fcf52ebd57	2326	Cirkovce
00050000-5563-249f-fa51-c729b5592bf1	2282	Cirkulane
00050000-5563-249f-5c76-43cf4433a27a	5273	Col
00050000-5563-249f-c1f4-30760a32637e	8251	Čatež ob Savi
00050000-5563-249f-d07d-824c8a13a80e	1413	Čemšenik
00050000-5563-249f-11d7-e3ee90155f1f	5253	Čepovan
00050000-5563-249f-bfe6-e23081bd854a	9232	Črenšovci
00050000-5563-249f-be16-32652942bbc2	2393	Črna na Koroškem
00050000-5563-249f-1382-4ab25213b0f5	6275	Črni Kal
00050000-5563-249f-e661-67a512b175fa	5274	Črni Vrh nad Idrijo
00050000-5563-249f-bb03-c3b8572256a5	5262	Črniče
00050000-5563-249f-2da3-33bbd34cd8ba	8340	Črnomelj
00050000-5563-249f-2fc3-d56e85c80d23	6271	Dekani
00050000-5563-249f-e79f-6cfe21ad81f2	5210	Deskle
00050000-5563-249f-9362-e90af4b989ff	2253	Destrnik
00050000-5563-249f-ffc2-0fdbc0a530c7	6215	Divača
00050000-5563-249f-5acc-5053453ad3d0	1233	Dob
00050000-5563-249f-23c4-0282fa7bff9d	3224	Dobje pri Planini
00050000-5563-249f-9aed-fe9a4e0601f0	8257	Dobova
00050000-5563-249f-dd33-9219e8bbe154	1423	Dobovec
00050000-5563-249f-d72c-11bef618cd64	5263	Dobravlje
00050000-5563-249f-9919-65d91b8bdeba	3204	Dobrna
00050000-5563-249f-b803-ad35dd45e23e	8211	Dobrnič
00050000-5563-249f-0ebc-f309747ae580	1356	Dobrova
00050000-5563-249f-368d-743cdd37afb2	9223	Dobrovnik/Dobronak 
00050000-5563-249f-a214-dbe2dca82822	5212	Dobrovo v Brdih
00050000-5563-249f-0a72-738b62af0404	1431	Dol pri Hrastniku
00050000-5563-249f-234b-075742736968	1262	Dol pri Ljubljani
00050000-5563-249f-f6f0-d093b0bfbad2	1273	Dole pri Litiji
00050000-5563-249f-a89c-3945158da2e9	1331	Dolenja vas
00050000-5563-249f-54ad-77d005fb032c	8350	Dolenjske Toplice
00050000-5563-249f-97bf-89417c08e8dc	1230	Domžale
00050000-5563-249f-2f84-b356c229dcc5	2252	Dornava
00050000-5563-249f-f4fc-943bfdaf59b4	5294	Dornberk
00050000-5563-249f-e4a9-1f12f9b0c9df	1319	Draga
00050000-5563-249f-7337-0f91d91e01c7	8343	Dragatuš
00050000-5563-249f-17b5-28ca5e717ae5	3222	Dramlje
00050000-5563-249f-f177-1008a5e3ca2c	2370	Dravograd
00050000-5563-249f-db02-7636d1746eb7	4203	Duplje
00050000-5563-249f-e3bd-bfe639618f4b	6221	Dutovlje
00050000-5563-249f-e645-43cfacdc4450	8361	Dvor
00050000-5563-249f-6636-ef53e4575ce0	2343	Fala
00050000-5563-249f-5e80-963089091e51	9208	Fokovci
00050000-5563-249f-cada-15f90d13eb58	2313	Fram
00050000-5563-249f-5179-0435669222e7	3213	Frankolovo
00050000-5563-249f-413a-8a49de3bb508	1274	Gabrovka
00050000-5563-249f-6ddc-87421e3b2410	8254	Globoko
00050000-5563-249f-6da4-626477e25fbb	5275	Godovič
00050000-5563-249f-d81d-1e55beedc722	4204	Golnik
00050000-5563-249f-1b55-728894130bf6	3303	Gomilsko
00050000-5563-249f-efe2-7cd901432ae4	4224	Gorenja vas
00050000-5563-249f-1142-04a86f515497	3263	Gorica pri Slivnici
00050000-5563-249f-e632-8aaa7add0576	2272	Gorišnica
00050000-5563-249f-66cc-d924db20dacd	9250	Gornja Radgona
00050000-5563-249f-aa49-fd5a9d9eadb8	3342	Gornji Grad
00050000-5563-249f-c7ae-44a3bb436388	4282	Gozd Martuljek
00050000-5563-249f-6bc0-c69503fdf086	6272	Gračišče
00050000-5563-249f-0c0f-5e55d0b17765	9264	Grad
00050000-5563-249f-fd6c-4b2fa14f2b0e	8332	Gradac
00050000-5563-249f-453f-d3337ec0a123	1384	Grahovo
00050000-5563-249f-e20e-2a5b28d12d39	5242	Grahovo ob Bači
00050000-5563-249f-b75d-742e2cf9ed1e	5251	Grgar
00050000-5563-249f-581e-01490345c199	3302	Griže
00050000-5563-249f-0375-4ffc19c488d8	3231	Grobelno
00050000-5563-249f-dd59-a53ce07e6d17	1290	Grosuplje
00050000-5563-249f-73fd-26d61d1bb1ec	2288	Hajdina
00050000-5563-249f-034b-e32de6903891	8362	Hinje
00050000-5563-249f-e744-6ffbc78c866b	2311	Hoče
00050000-5563-249f-71a8-5e443bd5849a	9205	Hodoš/Hodos
00050000-5563-249f-d60a-f3b951b13080	1354	Horjul
00050000-5563-249f-225c-54508b2d8abf	1372	Hotedršica
00050000-5563-249f-0706-60d77f2cb799	1430	Hrastnik
00050000-5563-249f-874a-9b0cc4297653	6225	Hruševje
00050000-5563-249f-941d-1989bb888e0e	4276	Hrušica
00050000-5563-249f-9d08-6c3a71d38127	5280	Idrija
00050000-5563-249f-ceae-8b8f3069ba81	1292	Ig
00050000-5563-249f-0b98-ebbb6cf37c5b	6250	Ilirska Bistrica
00050000-5563-249f-673e-a3d0ea861814	6251	Ilirska Bistrica-Trnovo
00050000-5563-249f-7ec7-8f24165e7ddb	1295	Ivančna Gorica
00050000-5563-249f-1a96-0a41701ad3ff	2259	Ivanjkovci
00050000-5563-249f-fc6c-b78dd9d293d9	1411	Izlake
00050000-5563-249f-a56c-6b98410b0ef5	6310	Izola/Isola
00050000-5563-249f-7d34-7c54ec4bcab0	2222	Jakobski Dol
00050000-5563-249f-f217-e3a2db01be11	2221	Jarenina
00050000-5563-249f-0d9a-6c22bdf296c0	6254	Jelšane
00050000-5563-249f-5f51-46c2ad2093b3	4270	Jesenice
00050000-5563-249f-db44-46a840d08f31	8261	Jesenice na Dolenjskem
00050000-5563-249f-eff3-d325abae51e5	3273	Jurklošter
00050000-5563-249f-4d95-3f4a5c1fe522	2223	Jurovski Dol
00050000-5563-249f-8e45-2440421b52b2	2256	Juršinci
00050000-5563-249f-5152-f278f793dbe4	5214	Kal nad Kanalom
00050000-5563-249f-0044-1263b30910b0	3233	Kalobje
00050000-5563-249f-aad1-31a93eca7cbf	4246	Kamna Gorica
00050000-5563-249f-8c6a-93a2e96d6c59	2351	Kamnica
00050000-5563-249f-acf5-04acabc8888b	1241	Kamnik
00050000-5563-249f-d50a-215912036cb4	5213	Kanal
00050000-5563-249f-1ac9-611200da5b2e	8258	Kapele
00050000-5563-249f-412a-477a4654ead1	2362	Kapla
00050000-5563-249f-a4b1-d70dc3a1efeb	2325	Kidričevo
00050000-5563-249f-b41c-9c88d72b2fd7	1412	Kisovec
00050000-5563-249f-8083-6bc26a8dc978	6253	Knežak
00050000-5563-249f-23ff-631d0b711d8a	5222	Kobarid
00050000-5563-249f-90c3-02b7fef3f013	9227	Kobilje
00050000-5563-249f-9406-e804aa38277e	1330	Kočevje
00050000-5563-249f-1c91-59eca5b3334e	1338	Kočevska Reka
00050000-5563-249f-f455-a87ebc2f5a09	2276	Kog
00050000-5563-249f-7554-4f7e15d92f63	5211	Kojsko
00050000-5563-249f-71a4-224e33444419	6223	Komen
00050000-5563-249f-5b87-25135cf9f8b6	1218	Komenda
00050000-5563-249f-d683-b7ba5f83be38	6000	Koper/Capodistria 
00050000-5563-249f-0ae8-332fa259d665	6001	Koper/Capodistria - poštni predali
00050000-5563-249f-78bd-f018d68263e7	8282	Koprivnica
00050000-5563-249f-c46d-4af4a3f8ca1e	5296	Kostanjevica na Krasu
00050000-5563-249f-cc66-3951ba886f3a	8311	Kostanjevica na Krki
00050000-5563-249f-4fef-80cc5136c772	1336	Kostel
00050000-5563-249f-573d-1e4b7cb95ba4	6256	Košana
00050000-5563-249f-3ba7-9fe461c21d58	2394	Kotlje
00050000-5563-249f-53fb-8fd6362821dc	6240	Kozina
00050000-5563-249f-2567-4e2cf4e62227	3260	Kozje
00050000-5563-249f-83b2-81ca693c08b8	4000	Kranj 
00050000-5563-249f-c569-aecb1f8ff5dd	4001	Kranj - poštni predali
00050000-5563-249f-784d-24bc875d4ade	4280	Kranjska Gora
00050000-5563-249f-dcda-bf7352e099da	1281	Kresnice
00050000-5563-249f-b639-75a1e0c4a058	4294	Križe
00050000-5563-249f-7199-d1e90d7e7c2e	9206	Križevci
00050000-5563-249f-ac80-5bf03e81130f	9242	Križevci pri Ljutomeru
00050000-5563-249f-ff06-d7adebce405d	1301	Krka
00050000-5563-249f-ecec-e6e658a47695	8296	Krmelj
00050000-5563-249f-5966-5dee7058a9dd	4245	Kropa
00050000-5563-249f-c2b7-0f3fc776a2f2	8262	Krška vas
00050000-5563-249f-a907-9e09e548c474	8270	Krško
00050000-5563-249f-401a-2aee0963ef45	9263	Kuzma
00050000-5563-249f-a6cd-8ebb5a265a3f	2318	Laporje
00050000-5563-249f-e726-90299001164c	3270	Laško
00050000-5563-249f-c20d-0d7cf9b05b3c	1219	Laze v Tuhinju
00050000-5563-249f-f26f-346d5d890029	2230	Lenart v Slovenskih goricah
00050000-5563-249f-2af2-33bf24b31c3d	9220	Lendava/Lendva
00050000-5563-249f-acff-3422e41968f5	4248	Lesce
00050000-5563-249f-475c-b75586841b1e	3261	Lesično
00050000-5563-249f-1aec-9e7add6a1a11	8273	Leskovec pri Krškem
00050000-5563-249f-54c7-646e9d15b425	2372	Libeliče
00050000-5563-249f-d924-62f2d8e1dd2b	2341	Limbuš
00050000-5563-249f-b3a0-d1fc46815237	1270	Litija
00050000-5563-249f-a653-8fce559d87e9	3202	Ljubečna
00050000-5563-249f-a0e5-db54146130c2	1000	Ljubljana 
00050000-5563-249f-a2a1-5a54f916908c	1001	Ljubljana - poštni predali
00050000-5563-249f-a351-fb7c33a58437	1231	Ljubljana - Črnuče
00050000-5563-249f-cbad-06e608a4a299	1261	Ljubljana - Dobrunje
00050000-5563-249f-6d01-0f3dfe2692de	1260	Ljubljana - Polje
00050000-5563-249f-e6f2-17c20bcce3a3	1210	Ljubljana - Šentvid
00050000-5563-249f-1cd2-d327553b50e9	1211	Ljubljana - Šmartno
00050000-5563-249f-bae1-863cdfb46e36	3333	Ljubno ob Savinji
00050000-5563-249f-1949-0525221abc13	9240	Ljutomer
00050000-5563-249f-f357-55488f518187	3215	Loče
00050000-5563-249f-7096-dda050ff90fb	5231	Log pod Mangartom
00050000-5563-249f-9c86-0d5bc691f29d	1358	Log pri Brezovici
00050000-5563-249f-5bae-0389591c4380	1370	Logatec
00050000-5563-249f-db04-ab24f1b47e2e	1371	Logatec
00050000-5563-249f-29c3-3a5f444b4fc6	1434	Loka pri Zidanem Mostu
00050000-5563-249f-647a-893749b4a60a	3223	Loka pri Žusmu
00050000-5563-249f-e7af-79094de4e4c4	6219	Lokev
00050000-5563-249f-00dc-b0a6de98223a	1318	Loški Potok
00050000-5563-249f-7aad-31bdab1657d8	2324	Lovrenc na Dravskem polju
00050000-5563-249f-5a4a-8e154b1720dc	2344	Lovrenc na Pohorju
00050000-5563-249f-5de4-700f159e57a3	3334	Luče
00050000-5563-249f-ee51-986c5ef7efd0	1225	Lukovica
00050000-5563-249f-2390-b8d1e8c6b568	9202	Mačkovci
00050000-5563-249f-38a9-f7ddd7feeb98	2322	Majšperk
00050000-5563-249f-6a73-32fe2bfb73be	2321	Makole
00050000-5563-249f-d5bd-1afd12935b37	9243	Mala Nedelja
00050000-5563-249f-4470-6cac250e83cc	2229	Malečnik
00050000-5563-249f-20dd-18e5acc54f75	6273	Marezige
00050000-5563-249f-deea-ca51f9976927	2000	Maribor 
00050000-5563-249f-3142-abc2dc43516a	2001	Maribor - poštni predali
00050000-5563-249f-fe0e-d7e853eaee77	2206	Marjeta na Dravskem polju
00050000-5563-249f-d671-791e39f4596c	2281	Markovci
00050000-5563-249f-904b-5105129c5db1	9221	Martjanci
00050000-5563-249f-8c9b-9f3712d9985b	6242	Materija
00050000-5563-249f-93a0-4d9e594d3ff7	4211	Mavčiče
00050000-5563-249f-7e5b-27ba7af1f9c7	1215	Medvode
00050000-5563-249f-4f34-d12f958ee1d5	1234	Mengeš
00050000-5563-249f-d1a5-52abff1e70d6	8330	Metlika
00050000-5563-249f-6702-ea81bbf6f026	2392	Mežica
00050000-5563-249f-81a0-961b98227b35	2204	Miklavž na Dravskem polju
00050000-5563-249f-b3a2-8135effd6c2d	2275	Miklavž pri Ormožu
00050000-5563-249f-911d-f2c46af9f8ab	5291	Miren
00050000-5563-249f-a5bb-e87dc3e56a2d	8233	Mirna
00050000-5563-249f-a5f1-d5793bb92e76	8216	Mirna Peč
00050000-5563-249f-dc34-3e3523ef8e2b	2382	Mislinja
00050000-5563-249f-a66b-c213473120af	4281	Mojstrana
00050000-5563-249f-e553-1b828911ce4b	8230	Mokronog
00050000-5563-249f-1506-ffc89a54bc51	1251	Moravče
00050000-5563-249f-822a-9345ed8e6ee0	9226	Moravske Toplice
00050000-5563-249f-c17a-4fc384aeec29	5216	Most na Soči
00050000-5563-249f-6efb-a2b9984fbf10	1221	Motnik
00050000-5563-249f-a74b-ae5ecbea492b	3330	Mozirje
00050000-5563-249f-96b0-5ca598405ce1	9000	Murska Sobota 
00050000-5563-249f-d364-605a364dd889	9001	Murska Sobota - poštni predali
00050000-5563-249f-68b5-1acc079e76a7	2366	Muta
00050000-5563-249f-9266-fc307f583b0b	4202	Naklo
00050000-5563-249f-9bd3-203e552d7174	3331	Nazarje
00050000-5563-249f-d97f-f41fcac652bf	1357	Notranje Gorice
00050000-5563-249f-bc52-613bb48db27a	3203	Nova Cerkev
00050000-5563-249f-749f-9551c7a6c40b	5000	Nova Gorica 
00050000-5563-249f-8e4e-4e9793fa312a	5001	Nova Gorica - poštni predali
00050000-5563-249f-d05b-a2c05972fa45	1385	Nova vas
00050000-5563-249f-81ef-b3deffcae0dd	8000	Novo mesto
00050000-5563-249f-f464-5755639ebb12	8001	Novo mesto - poštni predali
00050000-5563-249f-d48a-bbf5101d8701	6243	Obrov
00050000-5563-249f-4992-05e3b93fdd1e	9233	Odranci
00050000-5563-249f-dfea-2507d404fc0b	2317	Oplotnica
00050000-5563-24a0-4685-545f72f378f4	2312	Orehova vas
00050000-5563-24a0-7df0-dbbaeff8a544	2270	Ormož
00050000-5563-24a0-7b27-82d73b06de55	1316	Ortnek
00050000-5563-24a0-6c02-b24330f00ebf	1337	Osilnica
00050000-5563-24a0-0e57-b6b03f5c4f37	8222	Otočec
00050000-5563-24a0-ceda-ea88bee5fbe6	2361	Ožbalt
00050000-5563-24a0-3c74-7da273faabeb	2231	Pernica
00050000-5563-24a0-7fe1-1f7a6816a10d	2211	Pesnica pri Mariboru
00050000-5563-24a0-0316-b241562931b4	9203	Petrovci
00050000-5563-24a0-fb32-bda64977827c	3301	Petrovče
00050000-5563-24a0-7a2d-2361cae41aa4	6330	Piran/Pirano
00050000-5563-24a0-08fb-566b419ecf9c	8255	Pišece
00050000-5563-24a0-5a69-122d38343fa2	6257	Pivka
00050000-5563-24a0-8702-03a05ff32201	6232	Planina
00050000-5563-24a0-69bb-07ee63d2bec5	3225	Planina pri Sevnici
00050000-5563-24a0-ba77-59116f01e81a	6276	Pobegi
00050000-5563-24a0-d51c-d2d3852f16b9	8312	Podbočje
00050000-5563-24a0-124e-4c796aa30505	5243	Podbrdo
00050000-5563-24a0-c4b6-d1d2ec61b41c	3254	Podčetrtek
00050000-5563-24a0-e54e-e6979f9176b8	2273	Podgorci
00050000-5563-24a0-6cc1-9c571bdb6967	6216	Podgorje
00050000-5563-24a0-4793-e677127af02f	2381	Podgorje pri Slovenj Gradcu
00050000-5563-24a0-f799-6e0ec692f170	6244	Podgrad
00050000-5563-24a0-3235-d791de56e7d6	1414	Podkum
00050000-5563-24a0-fc16-2411a0aad0a8	2286	Podlehnik
00050000-5563-24a0-a615-1c044779964d	5272	Podnanos
00050000-5563-24a0-2d54-3aabcffd0100	4244	Podnart
00050000-5563-24a0-dd44-0ab85ad7d260	3241	Podplat
00050000-5563-24a0-e681-18bfec2e5322	3257	Podsreda
00050000-5563-24a0-86f1-7c4760fff895	2363	Podvelka
00050000-5563-24a0-5921-98c57e0312ea	2208	Pohorje
00050000-5563-24a0-b37c-1be376df8a42	2257	Polenšak
00050000-5563-24a0-3ab0-c8fce1509ce4	1355	Polhov Gradec
00050000-5563-24a0-7844-9f26767c3810	4223	Poljane nad Škofjo Loko
00050000-5563-24a0-51af-6ca8ad268ec9	2319	Poljčane
00050000-5563-24a0-1d79-b1c4b0d7491f	1272	Polšnik
00050000-5563-24a0-10cc-69d2e0cef6da	3313	Polzela
00050000-5563-24a0-ff30-866e5a1ee82a	3232	Ponikva
00050000-5563-24a0-c0ee-26cb7dd6dffc	6320	Portorož/Portorose
00050000-5563-24a0-1ff9-20aaa7305b2e	6230	Postojna
00050000-5563-24a0-c3f9-2ec856e1aa5e	2331	Pragersko
00050000-5563-24a0-990c-c932fd0e5994	3312	Prebold
00050000-5563-24a0-d570-ab397fa56a1b	4205	Preddvor
00050000-5563-24a0-52c8-f2298adc2b70	6255	Prem
00050000-5563-24a0-a90c-04a010f7ad1c	1352	Preserje
00050000-5563-24a0-bda2-2ae916e7849c	6258	Prestranek
00050000-5563-24a0-2e7b-116eee4849f1	2391	Prevalje
00050000-5563-24a0-eef1-7d9795d269c3	3262	Prevorje
00050000-5563-24a0-8941-0990344ea9aa	1276	Primskovo 
00050000-5563-24a0-c78f-5a0dab8bf262	3253	Pristava pri Mestinju
00050000-5563-24a0-0949-39a3f942aa78	9207	Prosenjakovci/Partosfalva
00050000-5563-24a0-d51d-45b9f511de8d	5297	Prvačina
00050000-5563-24a0-2811-644ce0df4ec3	2250	Ptuj
00050000-5563-24a0-905f-ad557919c169	2323	Ptujska Gora
00050000-5563-24a0-65b8-5e809d2a6ed2	9201	Puconci
00050000-5563-24a0-c2ec-1b8264ae6b2d	2327	Rače
00050000-5563-24a0-9b3b-6da82a7abfe8	1433	Radeče
00050000-5563-24a0-f8f3-7cb160d1540a	9252	Radenci
00050000-5563-24a0-8df0-a6a423d2ee46	2360	Radlje ob Dravi
00050000-5563-24a0-3c1f-7df75ba7381a	1235	Radomlje
00050000-5563-24a0-55c1-f7fccd8d95bd	4240	Radovljica
00050000-5563-24a0-c448-3ebf8b26a3f9	8274	Raka
00050000-5563-24a0-3ddf-1bbf2d8fbe8c	1381	Rakek
00050000-5563-24a0-a001-1111f7fc4742	4283	Rateče - Planica
00050000-5563-24a0-090a-88f132139df7	2390	Ravne na Koroškem
00050000-5563-24a0-a3b6-47ad5eb054f5	9246	Razkrižje
00050000-5563-24a0-b39c-acb1c01bb597	3332	Rečica ob Savinji
00050000-5563-24a0-c097-22c9b6650364	5292	Renče
00050000-5563-24a0-7e5a-2f2151d1af2f	1310	Ribnica
00050000-5563-24a0-3a7b-3d35e4388ca0	2364	Ribnica na Pohorju
00050000-5563-24a0-3500-b1d907158687	3272	Rimske Toplice
00050000-5563-24a0-768c-25332b518a99	1314	Rob
00050000-5563-24a0-8272-8c48157ab4d3	5215	Ročinj
00050000-5563-24a0-05e0-1bd34d96e1ee	3250	Rogaška Slatina
00050000-5563-24a0-6a06-2e519a4e3f36	9262	Rogašovci
00050000-5563-24a0-998e-818866a559c7	3252	Rogatec
00050000-5563-24a0-d21e-1e5c705dfa01	1373	Rovte
00050000-5563-24a0-306d-476d79625cc1	2342	Ruše
00050000-5563-24a0-c536-634ac9bb2cad	1282	Sava
00050000-5563-24a0-b31b-317377e81d21	6333	Sečovlje/Sicciole
00050000-5563-24a0-890a-0ec86d581c0e	4227	Selca
00050000-5563-24a0-dcd4-7d3b69292d0e	2352	Selnica ob Dravi
00050000-5563-24a0-3fc2-af56c502e581	8333	Semič
00050000-5563-24a0-cb08-eb2ca68a87cd	8281	Senovo
00050000-5563-24a0-20ff-16cdb099fb73	6224	Senožeče
00050000-5563-24a0-c817-83519c1abe26	8290	Sevnica
00050000-5563-24a0-c4cc-fda4bdca501a	6210	Sežana
00050000-5563-24a0-6371-c2afb7155a89	2214	Sladki Vrh
00050000-5563-24a0-c3f0-2b4422972778	5283	Slap ob Idrijci
00050000-5563-24a0-aae4-aad38f27ab3f	2380	Slovenj Gradec
00050000-5563-24a0-867b-30e785670d93	2310	Slovenska Bistrica
00050000-5563-24a0-dc1a-2b42b1f5e64e	3210	Slovenske Konjice
00050000-5563-24a0-9f40-f4b60bf0e06b	1216	Smlednik
00050000-5563-24a0-9aed-342e36d21640	5232	Soča
00050000-5563-24a0-32d9-2d601ca193ca	1317	Sodražica
00050000-5563-24a0-9089-b093d5c26f40	3335	Solčava
00050000-5563-24a0-0e0d-dcf7df34c425	5250	Solkan
00050000-5563-24a0-835f-35eccdaaf4a5	4229	Sorica
00050000-5563-24a0-49a8-ea2a5224533e	4225	Sovodenj
00050000-5563-24a0-5fbc-1464875e0c1d	5281	Spodnja Idrija
00050000-5563-24a0-1f19-3c171e301f4b	2241	Spodnji Duplek
00050000-5563-24a0-9761-fb2a823cd1cf	9245	Spodnji Ivanjci
00050000-5563-24a0-fb6c-ecf504affe4f	2277	Središče ob Dravi
00050000-5563-24a0-870b-c6a05c76b1ea	4267	Srednja vas v Bohinju
00050000-5563-24a0-e77c-14a228f31c6c	8256	Sromlje 
00050000-5563-24a0-d2e1-334313bb420e	5224	Srpenica
00050000-5563-24a0-dad4-3bfbe268947d	1242	Stahovica
00050000-5563-24a0-3e28-600916e9a77c	1332	Stara Cerkev
00050000-5563-24a0-3823-678b7f9c7d67	8342	Stari trg ob Kolpi
00050000-5563-24a0-6f0e-291e76f400af	1386	Stari trg pri Ložu
00050000-5563-24a0-58ca-77b5cc092839	2205	Starše
00050000-5563-24a0-bfce-d52ef0f19137	2289	Stoperce
00050000-5563-24a0-45c7-344357edab3c	8322	Stopiče
00050000-5563-24a0-c953-26790490ba1c	3206	Stranice
00050000-5563-24a0-4e57-dfd507e5943f	8351	Straža
00050000-5563-24a0-5cc4-a50e0cb4dee0	1313	Struge
00050000-5563-24a0-e77e-7f2e1984e407	8293	Studenec
00050000-5563-24a0-dc2a-768628af5da4	8331	Suhor
00050000-5563-24a0-40d1-e31cd18cc4a5	2233	Sv. Ana v Slovenskih goricah
00050000-5563-24a0-2967-5c2983226550	2235	Sv. Trojica v Slovenskih goricah
00050000-5563-24a0-4643-c1cc809b0645	2353	Sveti Duh na Ostrem Vrhu
00050000-5563-24a0-665d-c5e3fe6a6a83	9244	Sveti Jurij ob Ščavnici
00050000-5563-24a0-e7e2-d8057238f166	3264	Sveti Štefan
00050000-5563-24a0-d2eb-e91233f596b4	2258	Sveti Tomaž
00050000-5563-24a0-de75-b788d5f6653a	9204	Šalovci
00050000-5563-24a0-2a2b-93dfad743974	5261	Šempas
00050000-5563-24a0-9d7b-93a39001ee6c	5290	Šempeter pri Gorici
00050000-5563-24a0-4c44-55edeec6a348	3311	Šempeter v Savinjski dolini
00050000-5563-24a0-72b9-746cf7353abd	4208	Šenčur
00050000-5563-24a0-2a53-d0bb06c69067	2212	Šentilj v Slovenskih goricah
00050000-5563-24a0-6ef8-7cb037463c8b	8297	Šentjanž
00050000-5563-24a0-f219-83af9ae6eb05	2373	Šentjanž pri Dravogradu
00050000-5563-24a0-dcb0-b26971914efa	8310	Šentjernej
00050000-5563-24a0-0d30-a39c0366b4c2	3230	Šentjur
00050000-5563-24a0-0a62-b2b8f767e59a	3271	Šentrupert
00050000-5563-24a0-08f6-0088c040a15f	8232	Šentrupert
00050000-5563-24a0-37fc-37367a6e17c9	1296	Šentvid pri Stični
00050000-5563-24a0-0e56-b60074551ee1	8275	Škocjan
00050000-5563-24a0-e15f-9f54977e51e6	6281	Škofije
00050000-5563-24a0-6903-13d2f59f785c	4220	Škofja Loka
00050000-5563-24a0-7535-ba72238a89d3	3211	Škofja vas
00050000-5563-24a0-cbad-938bd03f8354	1291	Škofljica
00050000-5563-24a0-824c-56a168229805	6274	Šmarje
00050000-5563-24a0-a6d8-40e93febf290	1293	Šmarje - Sap
00050000-5563-24a0-8f06-4c60fcac1d81	3240	Šmarje pri Jelšah
00050000-5563-24a0-b5ad-4ddeb78f1d90	8220	Šmarješke Toplice
00050000-5563-24a0-367d-ab1e39bfd7df	2315	Šmartno na Pohorju
00050000-5563-24a0-8b02-077ab6b1f8db	3341	Šmartno ob Dreti
00050000-5563-24a0-9bd1-ae6c87e0166d	3327	Šmartno ob Paki
00050000-5563-24a0-e481-8c11ec7c1dc8	1275	Šmartno pri Litiji
00050000-5563-24a0-ea78-a5b659a6e985	2383	Šmartno pri Slovenj Gradcu
00050000-5563-24a0-eeda-64c453cd7e96	3201	Šmartno v Rožni dolini
00050000-5563-24a0-4d02-9f37a09f7896	3325	Šoštanj
00050000-5563-24a0-5265-5a05056bdd64	6222	Štanjel
00050000-5563-24a0-b06b-08fa7e5bbb40	3220	Štore
00050000-5563-24a0-da41-633872fde14a	3304	Tabor
00050000-5563-24a0-95c9-8b61e6b79760	3221	Teharje
00050000-5563-24a0-ff5a-96bc11131006	9251	Tišina
00050000-5563-24a0-9691-177c47082638	5220	Tolmin
00050000-5563-24a0-bc42-1cd50f1d9b13	3326	Topolšica
00050000-5563-24a0-19b8-47b724b91bea	2371	Trbonje
00050000-5563-24a0-eaf6-52eaa9f01862	1420	Trbovlje
00050000-5563-24a0-c1fc-b4cbafddd233	8231	Trebelno 
00050000-5563-24a0-0570-a282853c1399	8210	Trebnje
00050000-5563-24a0-8672-a784eae3be97	5252	Trnovo pri Gorici
00050000-5563-24a0-98d0-dd3811707fec	2254	Trnovska vas
00050000-5563-24a0-cd42-38740457c753	1222	Trojane
00050000-5563-24a0-4b0b-ca44d5ea8ad4	1236	Trzin
00050000-5563-24a0-2983-b9fe2d692158	4290	Tržič
00050000-5563-24a0-f3f1-49e68106218c	8295	Tržišče
00050000-5563-24a0-856b-a8576b4539b1	1311	Turjak
00050000-5563-24a0-d920-2e31681f7ea2	9224	Turnišče
00050000-5563-24a0-404e-80c7e3ed6cf7	8323	Uršna sela
00050000-5563-24a0-880b-5e24cc36d576	1252	Vače
00050000-5563-24a0-f50a-3c2575851118	3320	Velenje 
00050000-5563-24a0-b465-c1ddde5c0a9a	3322	Velenje - poštni predali
00050000-5563-24a0-6561-5125ec5ad384	8212	Velika Loka
00050000-5563-24a0-6a99-18c57e5dc131	2274	Velika Nedelja
00050000-5563-24a0-7a31-d5a0026378d6	9225	Velika Polana
00050000-5563-24a0-342f-d5c9921810ab	1315	Velike Lašče
00050000-5563-24a0-f004-8735a64af554	8213	Veliki Gaber
00050000-5563-24a0-eb56-130c4c47be9d	9241	Veržej
00050000-5563-24a0-abe9-2612a4d233d6	1312	Videm - Dobrepolje
00050000-5563-24a0-5584-e8cfc9a6ab1b	2284	Videm pri Ptuju
00050000-5563-24a0-0731-53bc14eafa95	8344	Vinica
00050000-5563-24a0-2dcc-b3a8e4f8f056	5271	Vipava
00050000-5563-24a0-8c19-15974ad6b34c	4212	Visoko
00050000-5563-24a0-37af-6582df97cdd1	1294	Višnja Gora
00050000-5563-24a0-7df4-b00b2904b232	3205	Vitanje
00050000-5563-24a0-f5c4-d02d680d49eb	2255	Vitomarci
00050000-5563-24a0-a491-d1f2feb0bc4f	1217	Vodice
00050000-5563-24a0-75e5-2e818c0e2cf6	3212	Vojnik\t
00050000-5563-24a0-92b1-67f63023dc37	5293	Volčja Draga
00050000-5563-24a0-2bcd-7e73cf2bf868	2232	Voličina
00050000-5563-24a0-155d-e107cc4d430a	3305	Vransko
00050000-5563-24a0-0dfa-b6d060df221d	6217	Vremski Britof
00050000-5563-24a0-c8d9-6ae8fdc48bfc	1360	Vrhnika
00050000-5563-24a0-95ac-fdd0ce879bf1	2365	Vuhred
00050000-5563-24a0-9351-2862d4ff0fa0	2367	Vuzenica
00050000-5563-24a0-a976-7f94e59b0f2c	8292	Zabukovje 
00050000-5563-24a0-f49a-c56bff47d675	1410	Zagorje ob Savi
00050000-5563-24a0-6a7b-44df25ee0fd5	1303	Zagradec
00050000-5563-24a0-3637-ba065de7cbdf	2283	Zavrč
00050000-5563-24a0-9469-de669fa4c4f4	8272	Zdole 
00050000-5563-24a0-031c-8ace464aa59c	4201	Zgornja Besnica
00050000-5563-24a0-cafb-d132d16ec0ad	2242	Zgornja Korena
00050000-5563-24a0-273a-af72797815ab	2201	Zgornja Kungota
00050000-5563-24a0-1c48-20bc0e9363a9	2316	Zgornja Ložnica
00050000-5563-24a0-f360-b14c570b43ee	2314	Zgornja Polskava
00050000-5563-24a0-2d3f-db938f635d49	2213	Zgornja Velka
00050000-5563-24a0-3910-fce480d51b41	4247	Zgornje Gorje
00050000-5563-24a0-aff8-e385abfa1830	4206	Zgornje Jezersko
00050000-5563-24a0-da92-9b11f8d073cb	2285	Zgornji Leskovec
00050000-5563-24a0-322b-3061f81e18e4	1432	Zidani Most
00050000-5563-24a0-7888-9ab789d38cae	3214	Zreče
00050000-5563-24a0-469c-cc3bcba91efd	4209	Žabnica
00050000-5563-24a0-ff85-48047d4811e1	3310	Žalec
00050000-5563-24a0-3866-1df532fb5c96	4228	Železniki
00050000-5563-24a0-28c9-19dc839077a7	2287	Žetale
00050000-5563-24a0-8e5f-c57122c39c16	4226	Žiri
00050000-5563-24a0-aae0-205276348f4b	4274	Žirovnica
00050000-5563-24a0-4bb9-44a0d4cacfac	8360	Žužemberk
\.


--
-- TOC entry 2723 (class 0 OID 4890332)
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
-- TOC entry 2705 (class 0 OID 4890147)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2711 (class 0 OID 4890225)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2725 (class 0 OID 4890344)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2738 (class 0 OID 4890464)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2742 (class 0 OID 4890515)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2729 (class 0 OID 4890373)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2721 (class 0 OID 4890317)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2720 (class 0 OID 4890307)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2741 (class 0 OID 4890504)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2736 (class 0 OID 4890441)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2694 (class 0 OID 4890020)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5563-24a0-1d82-d69b293c8434	00010000-5563-24a0-cee5-0525483a1f0b	2015-05-25 15:33:21	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROyoCguKcVHVbITkf9WACLV/6AqKpIHYu";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2760 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2730 (class 0 OID 4890383)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2698 (class 0 OID 4890058)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5563-24a0-d46a-cad610ece96e	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5563-24a0-dcef-4ef405275fd0	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5563-24a0-93f6-b7f425bb01ea	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5563-24a0-c693-35db93da83af	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5563-24a0-5196-633983e36df8	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5563-24a0-fdc8-e22860c02786	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2696 (class 0 OID 4890042)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5563-24a0-1d82-d69b293c8434	00020000-5563-24a0-c693-35db93da83af
00010000-5563-24a0-cee5-0525483a1f0b	00020000-5563-24a0-c693-35db93da83af
\.


--
-- TOC entry 2732 (class 0 OID 4890397)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2724 (class 0 OID 4890338)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2718 (class 0 OID 4890288)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2750 (class 0 OID 4890610)
-- Dependencies: 230
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5563-24a0-c087-9855711cfcd9	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5563-24a0-dc36-a28cbe19e8d4	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5563-24a0-1060-ba2a4bec9754	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5563-24a0-1ec2-a07ebd252295	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5563-24a0-b94c-7db6ea6a225c	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2749 (class 0 OID 4890603)
-- Dependencies: 229
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5563-24a0-26c4-17039c2e3203	00000000-5563-24a0-1ec2-a07ebd252295	popa
00000000-5563-24a0-9bf6-d9a4c6858162	00000000-5563-24a0-1ec2-a07ebd252295	oseba
00000000-5563-24a0-d111-536ea8eeef99	00000000-5563-24a0-dc36-a28cbe19e8d4	prostor
00000000-5563-24a0-6bb5-c2a3c4d710ce	00000000-5563-24a0-1ec2-a07ebd252295	besedilo
00000000-5563-24a0-263c-38d5a865eaa9	00000000-5563-24a0-1ec2-a07ebd252295	uprizoritev
00000000-5563-24a0-2d1f-dddbfccbf185	00000000-5563-24a0-1ec2-a07ebd252295	funkcija
00000000-5563-24a0-a777-d8e8585f93b8	00000000-5563-24a0-1ec2-a07ebd252295	tipfunkcije
\.


--
-- TOC entry 2748 (class 0 OID 4890598)
-- Dependencies: 228
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2737 (class 0 OID 4890451)
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
-- TOC entry 2703 (class 0 OID 4890119)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2719 (class 0 OID 4890294)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2740 (class 0 OID 4890493)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5563-24a0-68da-2da12f036fc0	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5563-24a0-8516-332963abb835	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5563-24a0-1b71-a277470d1dfb	Baletnik ali plesalec	Baletniki in plesalci	\N	Baletnica ali plesalka	igralec
000f0000-5563-24a0-4c66-dd993c645830	Avtor	Avtorji	\N	Avtorka	umetnik
000f0000-5563-24a0-16db-c16f639778a5	Režiser	Režiserji	\N	Režiserka	umetnik
000f0000-5563-24a0-238e-320701f48013	Scenograf	Scenografi	\N	Scenografka	tehnik
000f0000-5563-24a0-a502-0fb923dc3f1f	Kostumograf	Kostumografi	\N	Kostumografinja	tehnik
000f0000-5563-24a0-7c04-e6ea89e8fc20	Oblikovalec maske	Oblikovalci maske	\N	Oblikovalka maske	tehnik
000f0000-5563-24a0-7ced-0ce716e4adb9	Avtor glasbe	Avtorji glasbe	\N	Avtorica glasbe	umetnik
000f0000-5563-24a0-a6af-3ecd111e0c51	Oblikovalec svetlobe	Oblikovalci svetlobe	\N	Oblikovalka svetlobe	tehnik
000f0000-5563-24a0-44a3-fea8fff04218	Koreograf	Koreografi	\N	Koreografinja	umetnik
000f0000-5563-24a0-d487-15188f270813	Dramaturg	Dramaturgi	\N	Dramaturginja	umetnik
000f0000-5563-24a0-e699-4161ec406afe	Lektorj	Lektorji	\N	Lektorica	umetnik
000f0000-5563-24a0-dedd-4fecd75de0e4	Prevajalec	Prevajalci	\N	Prevajalka	umetnik
000f0000-5563-24a0-85d2-1b5a0aeb35b5	Oblikovalec videa	Oblikovalci videa	\N	Oblikovalka videa	umetnik
000f0000-5563-24a0-6eb5-b0f94a21d7b9	Intermedijski ustvarjalec	Intermedijski ustvarjalci	\N	Intermedijska ustvarjalka	umetnik
\.


--
-- TOC entry 2708 (class 0 OID 4890182)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2695 (class 0 OID 4890029)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5563-24a0-cee5-0525483a1f0b	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROZPo9MWQh89NW2kU9IOcsg5aJAw7uWme	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5563-24a0-1d82-d69b293c8434	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2745 (class 0 OID 4890548)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
\.


--
-- TOC entry 2713 (class 0 OID 4890240)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2728 (class 0 OID 4890365)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2735 (class 0 OID 4890433)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2715 (class 0 OID 4890272)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2744 (class 0 OID 4890538)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
\.


--
-- TOC entry 2734 (class 0 OID 4890423)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
\.


--
-- TOC entry 2315 (class 2606 OID 4890083)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 4890592)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 4890582)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 4890492)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 4890262)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 4890287)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 4890208)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 4890419)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 4890238)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 4890281)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 4890222)
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
-- TOC entry 2407 (class 2606 OID 4890330)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 4890357)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 4890180)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 4890092)
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
-- TOC entry 2322 (class 2606 OID 4890115)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2313 (class 2606 OID 4890072)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2306 (class 2606 OID 4890057)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 4890363)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 4890396)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 4890533)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2331 (class 2606 OID 4890144)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 4890168)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 4890336)
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
-- TOC entry 2337 (class 2606 OID 4890158)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 4890229)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 4890348)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 4890476)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 4890520)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 4890380)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 4890321)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 4890312)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 4890514)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 4890448)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 4890028)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 4890387)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 4890046)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2308 (class 2606 OID 4890066)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 4890405)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 4890343)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 4890293)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 4890616)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 4890607)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 4890602)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 4890461)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 4890124)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 4890303)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 4890503)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 4890193)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 4890041)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 4890563)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 4890247)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 4890371)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 4890439)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 4890276)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 4890547)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 4890432)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 1259 OID 4890269)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2454 (class 1259 OID 4890462)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2455 (class 1259 OID 4890463)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2329 (class 1259 OID 4890146)
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
-- TOC entry 2420 (class 1259 OID 4890364)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2414 (class 1259 OID 4890350)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2415 (class 1259 OID 4890349)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2366 (class 1259 OID 4890248)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2442 (class 1259 OID 4890422)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2443 (class 1259 OID 4890420)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2444 (class 1259 OID 4890421)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2354 (class 1259 OID 4890224)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2355 (class 1259 OID 4890223)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2471 (class 1259 OID 4890535)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2472 (class 1259 OID 4890536)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2473 (class 1259 OID 4890537)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2479 (class 1259 OID 4890567)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2480 (class 1259 OID 4890564)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2481 (class 1259 OID 4890566)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2482 (class 1259 OID 4890565)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2344 (class 1259 OID 4890195)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2345 (class 1259 OID 4890194)
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
-- TOC entry 2320 (class 1259 OID 4890118)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2430 (class 1259 OID 4890388)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2384 (class 1259 OID 4890282)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2310 (class 1259 OID 4890073)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2311 (class 1259 OID 4890074)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2435 (class 1259 OID 4890408)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2436 (class 1259 OID 4890407)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2437 (class 1259 OID 4890406)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2358 (class 1259 OID 4890230)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2359 (class 1259 OID 4890232)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2360 (class 1259 OID 4890231)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2498 (class 1259 OID 4890609)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2394 (class 1259 OID 4890316)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2395 (class 1259 OID 4890314)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2396 (class 1259 OID 4890313)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2397 (class 1259 OID 4890315)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2301 (class 1259 OID 4890047)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 4890048)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2423 (class 1259 OID 4890372)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2409 (class 1259 OID 4890337)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2450 (class 1259 OID 4890449)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2451 (class 1259 OID 4890450)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2333 (class 1259 OID 4890160)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2334 (class 1259 OID 4890159)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2335 (class 1259 OID 4890161)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2458 (class 1259 OID 4890477)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2459 (class 1259 OID 4890478)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2491 (class 1259 OID 4890595)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2492 (class 1259 OID 4890594)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2493 (class 1259 OID 4890597)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2494 (class 1259 OID 4890593)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2495 (class 1259 OID 4890596)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2447 (class 1259 OID 4890440)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2400 (class 1259 OID 4890325)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2401 (class 1259 OID 4890324)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2402 (class 1259 OID 4890322)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2403 (class 1259 OID 4890323)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2284 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2487 (class 1259 OID 4890584)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2488 (class 1259 OID 4890583)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2365 (class 1259 OID 4890239)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2316 (class 1259 OID 4890094)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2317 (class 1259 OID 4890093)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2325 (class 1259 OID 4890125)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2326 (class 1259 OID 4890126)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2389 (class 1259 OID 4890306)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2390 (class 1259 OID 4890305)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2391 (class 1259 OID 4890304)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2372 (class 1259 OID 4890271)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2373 (class 1259 OID 4890267)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2374 (class 1259 OID 4890264)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2375 (class 1259 OID 4890265)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2376 (class 1259 OID 4890263)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2377 (class 1259 OID 4890268)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2378 (class 1259 OID 4890266)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2332 (class 1259 OID 4890145)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2350 (class 1259 OID 4890209)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2351 (class 1259 OID 4890211)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2352 (class 1259 OID 4890210)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2353 (class 1259 OID 4890212)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2408 (class 1259 OID 4890331)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2476 (class 1259 OID 4890534)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2323 (class 1259 OID 4890116)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2324 (class 1259 OID 4890117)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2504 (class 1259 OID 4890617)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2343 (class 1259 OID 4890181)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2501 (class 1259 OID 4890608)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2428 (class 1259 OID 4890382)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2429 (class 1259 OID 4890381)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2287 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2340 (class 1259 OID 4890169)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 4890521)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2309 (class 1259 OID 4890067)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2379 (class 1259 OID 4890270)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2530 (class 2606 OID 4890755)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2533 (class 2606 OID 4890740)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2532 (class 2606 OID 4890745)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2528 (class 2606 OID 4890765)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2534 (class 2606 OID 4890735)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2529 (class 2606 OID 4890760)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2531 (class 2606 OID 4890750)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2564 (class 2606 OID 4890910)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2563 (class 2606 OID 4890915)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2515 (class 2606 OID 4890670)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2551 (class 2606 OID 4890850)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2549 (class 2606 OID 4890845)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2550 (class 2606 OID 4890840)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2527 (class 2606 OID 4890730)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2557 (class 2606 OID 4890890)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2559 (class 2606 OID 4890880)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2558 (class 2606 OID 4890885)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2521 (class 2606 OID 4890705)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2522 (class 2606 OID 4890700)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2547 (class 2606 OID 4890830)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2570 (class 2606 OID 4890935)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2569 (class 2606 OID 4890940)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2568 (class 2606 OID 4890945)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2571 (class 2606 OID 4890965)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2574 (class 2606 OID 4890950)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2572 (class 2606 OID 4890960)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2573 (class 2606 OID 4890955)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2519 (class 2606 OID 4890695)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2520 (class 2606 OID 4890690)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2511 (class 2606 OID 4890655)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2512 (class 2606 OID 4890650)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2553 (class 2606 OID 4890860)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2535 (class 2606 OID 4890770)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2508 (class 2606 OID 4890630)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2507 (class 2606 OID 4890635)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2554 (class 2606 OID 4890875)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2555 (class 2606 OID 4890870)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2556 (class 2606 OID 4890865)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2525 (class 2606 OID 4890710)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2523 (class 2606 OID 4890720)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2524 (class 2606 OID 4890715)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2582 (class 2606 OID 4891005)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2539 (class 2606 OID 4890805)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2541 (class 2606 OID 4890795)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2542 (class 2606 OID 4890790)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2540 (class 2606 OID 4890800)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2506 (class 2606 OID 4890620)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2505 (class 2606 OID 4890625)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2552 (class 2606 OID 4890855)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2548 (class 2606 OID 4890835)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2562 (class 2606 OID 4890900)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2561 (class 2606 OID 4890905)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2517 (class 2606 OID 4890680)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 4890675)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2516 (class 2606 OID 4890685)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2566 (class 2606 OID 4890920)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2565 (class 2606 OID 4890925)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2579 (class 2606 OID 4890990)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2580 (class 2606 OID 4890985)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2577 (class 2606 OID 4891000)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2581 (class 2606 OID 4890980)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2578 (class 2606 OID 4890995)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2560 (class 2606 OID 4890895)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2543 (class 2606 OID 4890825)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2544 (class 2606 OID 4890820)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2546 (class 2606 OID 4890810)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2545 (class 2606 OID 4890815)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2575 (class 2606 OID 4890975)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2576 (class 2606 OID 4890970)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2526 (class 2606 OID 4890725)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2567 (class 2606 OID 4890930)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 4890645)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2510 (class 2606 OID 4890640)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2514 (class 2606 OID 4890660)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2513 (class 2606 OID 4890665)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2536 (class 2606 OID 4890785)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2537 (class 2606 OID 4890780)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2538 (class 2606 OID 4890775)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-25 15:33:22 CEST

--
-- PostgreSQL database dump complete
--

