--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-05-26 08:17:29 CEST

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
-- TOC entry 180 (class 1259 OID 4984422)
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
-- TOC entry 227 (class 1259 OID 4984932)
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
-- TOC entry 226 (class 1259 OID 4984915)
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
-- TOC entry 219 (class 1259 OID 4984826)
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
-- TOC entry 194 (class 1259 OID 4984596)
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
-- TOC entry 197 (class 1259 OID 4984630)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 4984543)
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
-- TOC entry 213 (class 1259 OID 4984756)
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
-- TOC entry 192 (class 1259 OID 4984580)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean
);


--
-- TOC entry 196 (class 1259 OID 4984624)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 4984560)
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
-- TOC entry 202 (class 1259 OID 4984673)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 4984698)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 4984517)
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
-- TOC entry 181 (class 1259 OID 4984431)
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
-- TOC entry 182 (class 1259 OID 4984442)
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
-- TOC entry 177 (class 1259 OID 4984396)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 4984415)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 4984705)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 4984736)
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
-- TOC entry 223 (class 1259 OID 4984869)
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
-- TOC entry 184 (class 1259 OID 4984474)
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
-- TOC entry 186 (class 1259 OID 4984509)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 4984679)
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
-- TOC entry 185 (class 1259 OID 4984494)
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
-- TOC entry 191 (class 1259 OID 4984572)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 4984691)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 4984811)
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
-- TOC entry 222 (class 1259 OID 4984862)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 4984720)
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
-- TOC entry 201 (class 1259 OID 4984664)
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
-- TOC entry 200 (class 1259 OID 4984654)
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
-- TOC entry 221 (class 1259 OID 4984851)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 4984788)
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
-- TOC entry 174 (class 1259 OID 4984367)
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
-- TOC entry 173 (class 1259 OID 4984365)
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
-- TOC entry 210 (class 1259 OID 4984730)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 4984405)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 4984389)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 4984744)
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
-- TOC entry 204 (class 1259 OID 4984685)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 4984635)
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
-- TOC entry 230 (class 1259 OID 4984957)
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
-- TOC entry 229 (class 1259 OID 4984950)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 228 (class 1259 OID 4984945)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 4984798)
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
-- TOC entry 231 (class 1259 OID 4984965)
-- Name: strosekuprizoritve_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE strosekuprizoritve_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 183 (class 1259 OID 4984466)
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
-- TOC entry 199 (class 1259 OID 4984641)
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
-- TOC entry 220 (class 1259 OID 4984840)
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
-- TOC entry 188 (class 1259 OID 4984529)
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
-- TOC entry 175 (class 1259 OID 4984376)
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
-- TOC entry 225 (class 1259 OID 4984895)
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
-- TOC entry 193 (class 1259 OID 4984587)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 4984712)
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
-- TOC entry 215 (class 1259 OID 4984780)
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
-- TOC entry 195 (class 1259 OID 4984619)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 4984885)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 4984770)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2146 (class 2604 OID 4984370)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2700 (class 0 OID 4984422)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2747 (class 0 OID 4984932)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_delitev_id, pogodba_id, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
\.


--
-- TOC entry 2746 (class 0 OID 4984915)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2739 (class 0 OID 4984826)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
\.


--
-- TOC entry 2714 (class 0 OID 4984596)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
\.


--
-- TOC entry 2717 (class 0 OID 4984630)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2709 (class 0 OID 4984543)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5564-0ff7-b9c1-0824e3b2a2ee	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5564-0ff7-b27a-3fbc7beb1d7a	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5564-0ff7-3ab0-2f7b05a28bd5	AL	ALB	008	Albania 	Albanija	\N
00040000-5564-0ff7-5f6c-520219a39e6d	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5564-0ff7-b3b1-edae672e8c81	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5564-0ff7-9819-9e3517949250	AD	AND	020	Andorra 	Andora	\N
00040000-5564-0ff7-7747-1ab083cd9df0	AO	AGO	024	Angola 	Angola	\N
00040000-5564-0ff7-e0dc-a7aef6b8e6a7	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5564-0ff7-dd61-ab44c175d8f9	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5564-0ff7-2126-ff8b8bcfc046	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5564-0ff7-121d-57c136f147a8	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5564-0ff7-f7aa-151d4f6366d7	AM	ARM	051	Armenia 	Armenija	\N
00040000-5564-0ff7-ec44-ce3bb9f05a64	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5564-0ff7-e125-858263afbd51	AU	AUS	036	Australia 	Avstralija	\N
00040000-5564-0ff7-c4f9-43ba2fcee2bb	AT	AUT	040	Austria 	Avstrija	\N
00040000-5564-0ff7-4cde-c87059659aa9	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5564-0ff7-72d4-0d6f3c13853f	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5564-0ff7-4de9-041fc2820909	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5564-0ff7-78a8-dca0af1b8dfc	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5564-0ff7-748d-1cab56a7b9de	BB	BRB	052	Barbados 	Barbados	\N
00040000-5564-0ff7-c6a8-79a2f89512e9	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5564-0ff7-c426-32c92f6da1e2	BE	BEL	056	Belgium 	Belgija	\N
00040000-5564-0ff7-a088-a3ea322f71dd	BZ	BLZ	084	Belize 	Belize	\N
00040000-5564-0ff7-b78c-f33f8b932102	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5564-0ff7-4287-c568d79f85a4	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5564-0ff7-a784-fe9385d4ad8d	BT	BTN	064	Bhutan 	Butan	\N
00040000-5564-0ff7-39fd-f8136eff38ff	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5564-0ff7-0c42-b80be2f1c653	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5564-0ff7-e27d-1f868907aa14	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5564-0ff7-ad4f-23921d1a667e	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5564-0ff7-2ea8-8adfbb37ee02	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5564-0ff7-f0cb-08997340dd68	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5564-0ff7-fb26-42e7348f122c	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5564-0ff7-d367-a0e9520985db	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5564-0ff7-400e-94463a47fc56	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5564-0ff7-0813-14c668a31c4f	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5564-0ff7-e2f3-ffa41dd9dad9	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5564-0ff7-fa30-ce470539042a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5564-0ff7-11ec-b41a4296e543	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5564-0ff7-fcc0-fb365b24347b	CA	CAN	124	Canada 	Kanada	\N
00040000-5564-0ff7-7823-f8dd8ab90473	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5564-0ff7-9f6c-bed7ee26d8f2	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5564-0ff7-26ec-03bcc5c6f9b4	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5564-0ff7-717c-5be3cd066e5e	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5564-0ff7-0ff4-c5ae6fb6facd	CL	CHL	152	Chile 	Čile	\N
00040000-5564-0ff7-1c6d-363c5485b476	CN	CHN	156	China 	Kitajska	\N
00040000-5564-0ff7-5ba4-69eebd445ef6	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5564-0ff7-dc78-407bfd91a67c	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5564-0ff7-345b-021cfe474240	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5564-0ff7-8eab-188601b186f2	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5564-0ff7-94f7-0cd2047dce76	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5564-0ff7-7625-c19ede3d4c9a	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5564-0ff7-5304-d756df678053	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5564-0ff7-5ae2-c0bc4251f911	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5564-0ff7-0154-2ee71e345b01	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5564-0ff7-f933-cea2606caccf	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5564-0ff7-7b81-9603c45e8050	CU	CUB	192	Cuba 	Kuba	\N
00040000-5564-0ff7-e74b-7de4640fcb5e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5564-0ff7-3c0a-0986fe41caa3	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5564-0ff7-a990-2a53aa4af1e1	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5564-0ff7-992e-151b56429918	DK	DNK	208	Denmark 	Danska	\N
00040000-5564-0ff7-72bc-76217e6c5265	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5564-0ff7-3c85-d73b2b85354f	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5564-0ff7-5a83-a2e0af6eb833	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5564-0ff7-f48d-7ffec8f3a096	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5564-0ff7-71b9-61f07147b89b	EG	EGY	818	Egypt 	Egipt	\N
00040000-5564-0ff7-d26a-1a335e157268	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5564-0ff7-0ba9-e8a8e7b8e654	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5564-0ff7-9561-e6b18dea9128	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5564-0ff7-d800-b96392a9af1d	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5564-0ff7-47c7-45e3804f34a8	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5564-0ff7-71f3-8c03baa2bd49	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5564-0ff7-6e58-5b9e185c0a21	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5564-0ff7-1db9-90c08d9908a7	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5564-0ff7-712e-debe0fbfafa5	FI	FIN	246	Finland 	Finska	\N
00040000-5564-0ff7-0ac3-d6e614302e30	FR	FRA	250	France 	Francija	\N
00040000-5564-0ff7-5d19-162d650a62f9	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5564-0ff7-8458-99f520b1746a	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5564-0ff7-8d88-668866c9203f	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5564-0ff7-11e3-1d0ab1f190e1	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5564-0ff7-2320-bce5cbba3e1e	GA	GAB	266	Gabon 	Gabon	\N
00040000-5564-0ff7-14cf-1befc69f03db	GM	GMB	270	Gambia 	Gambija	\N
00040000-5564-0ff7-aad7-b819a81f29be	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5564-0ff7-6398-84c859001aa3	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5564-0ff7-0922-207ad4892a37	GH	GHA	288	Ghana 	Gana	\N
00040000-5564-0ff7-5909-51fc826748e4	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5564-0ff7-d27d-cfe2b987df63	GR	GRC	300	Greece 	Grčija	\N
00040000-5564-0ff7-5603-e09d802b9033	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5564-0ff7-2e8e-ecddd7586122	GD	GRD	308	Grenada 	Grenada	\N
00040000-5564-0ff7-c51a-590eebcca0ef	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5564-0ff7-2f72-93311fc0d9e4	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5564-0ff7-f4eb-b54f8856ddff	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5564-0ff7-2303-316411c125e7	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5564-0ff7-d26e-5b6bff7beb27	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5564-0ff7-a6bd-587c3ef7098e	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5564-0ff7-99be-6b8b23ad8f09	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5564-0ff7-72ad-3c71767a963f	HT	HTI	332	Haiti 	Haiti	\N
00040000-5564-0ff7-8f2a-44e4748344ff	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5564-0ff7-6593-7387f36ff5b1	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5564-0ff7-06f8-09a115550503	HN	HND	340	Honduras 	Honduras	\N
00040000-5564-0ff7-cf88-811d089c45ab	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5564-0ff7-24a7-7652e5081e9e	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5564-0ff7-36e1-c2f9c69abc01	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5564-0ff7-0345-85ad0f91760e	IN	IND	356	India 	Indija	\N
00040000-5564-0ff7-1485-f87ced97f2f4	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5564-0ff7-8052-757d0101804d	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5564-0ff7-ebb5-d06af7538215	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5564-0ff7-cda7-27590181b0c0	IE	IRL	372	Ireland 	Irska	\N
00040000-5564-0ff7-04d9-8eef1103ed5a	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5564-0ff7-ab7f-d14ab9db4a71	IL	ISR	376	Israel 	Izrael	\N
00040000-5564-0ff7-53df-22021d31c120	IT	ITA	380	Italy 	Italija	\N
00040000-5564-0ff7-5d5e-87590878ee0a	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5564-0ff7-9a3a-563ebb06dd6a	JP	JPN	392	Japan 	Japonska	\N
00040000-5564-0ff7-d1bb-9d5f2dd8622c	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5564-0ff7-c438-a5e590f1167a	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5564-0ff7-c198-d6eb5c342252	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5564-0ff7-08ad-6e3e5ac5614b	KE	KEN	404	Kenya 	Kenija	\N
00040000-5564-0ff7-2004-ee44728cff72	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5564-0ff7-43bd-186a4183d9cd	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5564-0ff7-411b-90a55fc562d5	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5564-0ff7-6f90-0e05f0709d81	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5564-0ff7-97ef-dd7b64e4e7e1	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5564-0ff7-d054-f31631bc3c20	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5564-0ff7-01ab-cd15e9ced1fd	LV	LVA	428	Latvia 	Latvija	\N
00040000-5564-0ff7-7595-4fb138606eba	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5564-0ff7-a358-789e46cc88de	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5564-0ff7-19d8-f67da4232997	LR	LBR	430	Liberia 	Liberija	\N
00040000-5564-0ff7-f476-c1cfed355b4b	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5564-0ff7-cf83-fc6f39688633	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5564-0ff7-89b2-a1d6ef471c19	LT	LTU	440	Lithuania 	Litva	\N
00040000-5564-0ff7-a3d7-8c3db3dcc4f5	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5564-0ff7-d0b3-f88b76cd27fe	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5564-0ff7-d9fc-5c5be886a9c7	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5564-0ff7-ade4-eb99e72ec539	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5564-0ff7-e500-fead556f2980	MW	MWI	454	Malawi 	Malavi	\N
00040000-5564-0ff7-7a7d-0b8a99f7c88e	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5564-0ff7-04e7-18840d807360	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5564-0ff7-1d2e-59f6251aad72	ML	MLI	466	Mali 	Mali	\N
00040000-5564-0ff7-b6b9-bbf80f70e01e	MT	MLT	470	Malta 	Malta	\N
00040000-5564-0ff7-dc0b-323136de9789	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5564-0ff7-10f9-c394f8ffff6a	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5564-0ff7-ebc8-c52a718a407f	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5564-0ff7-24f3-e0e4bbe00849	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5564-0ff7-cf5e-d832b2f6a50e	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5564-0ff7-0e23-65bafea83b58	MX	MEX	484	Mexico 	Mehika	\N
00040000-5564-0ff7-139f-2a666b71855c	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5564-0ff7-7a70-02c19a504c06	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5564-0ff7-5e04-9f1d84fc2363	MC	MCO	492	Monaco 	Monako	\N
00040000-5564-0ff7-193a-d7b4e5cfe490	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5564-0ff7-7d10-746e4992e341	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5564-0ff7-fd10-8a7d483e6119	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5564-0ff7-dd5f-ac29be7494eb	MA	MAR	504	Morocco 	Maroko	\N
00040000-5564-0ff7-b659-f088059020af	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5564-0ff7-d68b-58e8dced2275	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5564-0ff7-c76e-4e29345544f3	NA	NAM	516	Namibia 	Namibija	\N
00040000-5564-0ff7-99c1-025fbd86f3de	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5564-0ff7-422c-2f1bc0671a84	NP	NPL	524	Nepal 	Nepal	\N
00040000-5564-0ff7-45fb-d7c83827ea4c	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5564-0ff7-5174-44d15862eb7c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5564-0ff7-cd3f-c0df274c5874	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5564-0ff7-8ccb-ddeef25ae1f3	NE	NER	562	Niger 	Niger 	\N
00040000-5564-0ff7-7227-b78319c3908b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5564-0ff7-f5f2-2feb23a8c234	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5564-0ff7-408a-02f5088b0f34	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5564-0ff7-c358-b50ec39b7a12	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5564-0ff7-bca7-aa347dc9c647	NO	NOR	578	Norway 	Norveška	\N
00040000-5564-0ff7-0c05-9e4fde74c0c2	OM	OMN	512	Oman 	Oman	\N
00040000-5564-0ff7-b287-4bc323f24631	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5564-0ff7-ff36-ac30078e3322	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5564-0ff7-5f75-9c278b105c68	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5564-0ff7-a6be-ca9dae57c678	PA	PAN	591	Panama 	Panama	\N
00040000-5564-0ff7-6654-2c5375d631c9	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5564-0ff7-5de0-1319c61bd1de	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5564-0ff7-e594-1349974719cf	PE	PER	604	Peru 	Peru	\N
00040000-5564-0ff7-e5a1-de4f52821e63	PH	PHL	608	Philippines 	Filipini	\N
00040000-5564-0ff7-8bce-f607ea50d3de	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5564-0ff7-8bf0-7bb3a58d243d	PL	POL	616	Poland 	Poljska	\N
00040000-5564-0ff7-79c1-513169793c8b	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5564-0ff7-5752-9411b5589164	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5564-0ff7-9bb7-966e4ff6eb51	QA	QAT	634	Qatar 	Katar	\N
00040000-5564-0ff7-f39b-3cd92fb0c636	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5564-0ff7-5dc2-233c52a1a582	RO	ROU	642	Romania 	Romunija	\N
00040000-5564-0ff7-fe44-badddeb68850	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5564-0ff7-bb7d-243c153a6f4f	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5564-0ff7-f3f4-387635370c6e	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5564-0ff7-ba7c-ff0ab157358d	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5564-0ff7-642c-aaaf6437d864	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5564-0ff7-9e8e-c9d431a58dfb	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5564-0ff7-3197-55727c034d63	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5564-0ff7-3822-359ff69d8d6d	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5564-0ff7-42ef-8ec4b29f31b8	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5564-0ff7-43b9-1a73dc7d0113	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5564-0ff7-f269-abd6a014a7ee	SM	SMR	674	San Marino 	San Marino	\N
00040000-5564-0ff7-6a7f-6a89fe01582e	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5564-0ff7-1e5d-379281f93d4a	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5564-0ff7-47ab-333310df60a9	SN	SEN	686	Senegal 	Senegal	\N
00040000-5564-0ff7-d8d6-ea014b485bd6	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5564-0ff7-3615-4b065ca7552b	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5564-0ff7-8b2a-a81da5481fbd	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5564-0ff7-8a51-7e8b0f15ede4	SG	SGP	702	Singapore 	Singapur	\N
00040000-5564-0ff7-9584-0fd41709753c	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5564-0ff7-3f4c-35c7a0d3f26a	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5564-0ff7-7fe7-0ca2cc4b5a67	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5564-0ff7-8d08-acdaf184bf4a	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5564-0ff7-6c07-370fb290cc71	SO	SOM	706	Somalia 	Somalija	\N
00040000-5564-0ff7-dee3-818cbc5dc350	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5564-0ff7-0cde-3e02830f2fd6	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5564-0ff7-0cdd-6fb18ac66096	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5564-0ff7-0f4b-9bed1a2b0842	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5564-0ff7-07fe-88df3a258cce	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5564-0ff7-3d4f-aea43dea0815	SD	SDN	729	Sudan 	Sudan	\N
00040000-5564-0ff7-5450-84ec0cbc9e96	SR	SUR	740	Suriname 	Surinam	\N
00040000-5564-0ff7-4208-3afe96d1dd46	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5564-0ff7-349b-0d6c5802df2e	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5564-0ff7-0a26-746136684795	SE	SWE	752	Sweden 	Švedska	\N
00040000-5564-0ff7-edad-4e14ec4ca576	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5564-0ff7-8496-3b99e352c4eb	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5564-0ff7-16cc-cd28fb149d6d	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5564-0ff7-671e-e79cac6e3bad	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5564-0ff7-6411-dba695f285bd	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5564-0ff7-449d-0bdd8a03d459	TH	THA	764	Thailand 	Tajska	\N
00040000-5564-0ff7-8f37-6ab499fa4b37	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5564-0ff7-51f5-2833f615bffa	TG	TGO	768	Togo 	Togo	\N
00040000-5564-0ff7-fe9d-49ace9e2ce2e	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5564-0ff7-3e03-a1088ba671b1	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5564-0ff7-2398-da4b22fc3d97	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5564-0ff7-c4ac-3411056f0c2e	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5564-0ff7-2f3d-e2218536ed46	TR	TUR	792	Turkey 	Turčija	\N
00040000-5564-0ff7-e5d5-dd252f4ec430	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5564-0ff7-a770-af1f2080e6ba	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5564-0ff7-3090-ffcb4bf1be07	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5564-0ff7-3058-b171a3fee3cf	UG	UGA	800	Uganda 	Uganda	\N
00040000-5564-0ff7-86ab-91632eb0e12b	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5564-0ff7-cf12-b0f8c12b5f7c	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5564-0ff7-741a-af8810db84c0	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5564-0ff7-dcda-a9659671dd61	US	USA	840	United States 	Združene države Amerike	\N
00040000-5564-0ff7-68ea-365970b45d3b	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5564-0ff7-7d13-b7c8b4049ee5	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5564-0ff7-35cf-b69fab58d364	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5564-0ff7-deb3-0b8c8d90c4b2	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5564-0ff7-b0fa-c5b8542bb7b1	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5564-0ff7-12e6-92a4c6b3bfee	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5564-0ff7-8eaa-8d7cd1cb92a7	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5564-0ff7-5f23-96808ec2cd6d	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5564-0ff7-d45b-6a567d010dd8	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5564-0ff7-27e1-4b8202ad5408	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5564-0ff7-cbc8-ceb6f21a51a4	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5564-0ff7-aa60-8b88f4fd5548	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5564-0ff7-71ba-9dcc7c3be6df	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2733 (class 0 OID 4984756)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, tip_vloge_id, podrocje, naziv, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj) FROM stdin;
\.


--
-- TOC entry 2712 (class 0 OID 4984580)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo) FROM stdin;
\.


--
-- TOC entry 2716 (class 0 OID 4984624)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2710 (class 0 OID 4984560)
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
-- TOC entry 2722 (class 0 OID 4984673)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2726 (class 0 OID 4984698)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2707 (class 0 OID 4984517)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5564-0ff8-a946-cffc0be40b75	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5564-0ff8-c7c9-8abc90265b8c	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5564-0ff8-d481-9c81d5efc8a9	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5564-0ff8-9399-b3ad2c9fd00a	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5564-0ff8-1737-70599cc3a96d	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5564-0ff8-ce2f-1384d9b9b542	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5564-0ff8-810c-8d2f5153f85c	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5564-0ff8-1250-fc5f520152f1	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5564-0ff8-74e0-37fa625a5aa4	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5564-0ff8-718f-d93acceb5c36	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5564-0ff8-5688-555084f209a8	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5564-0ff8-b1d6-00afc01bd658	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5564-0ff8-645a-822d1a5a642d	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5564-0ff8-50f0-5ac7d342cb79	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5564-0ff8-9d99-99386e7f1131	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
\.


--
-- TOC entry 2701 (class 0 OID 4984431)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5564-0ff8-205f-2ded0c959b9b	00000000-5564-0ff8-1737-70599cc3a96d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5564-0ff8-21bf-78054e43b93a	00000000-5564-0ff8-1737-70599cc3a96d	00010000-5564-0ff8-f6d0-50092330e722	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5564-0ff8-0344-a9abd5c43d01	00000000-5564-0ff8-ce2f-1384d9b9b542	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2702 (class 0 OID 4984442)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5564-0ff8-21bb-36940d0f00d9	\N	\N	0001	g.	Janez	Novak	a	Peter	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5564-0ff8-83af-d752a51673ba	\N	\N	0002	dr.	Anton	Horvat	b			anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5564-0ff8-7c59-94ccf80a22a4	\N	\N	0003		Ivan	Kovačič	c			ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5564-0ff8-5506-d03e3dcf76fe	\N	\N	0004	prof.	Jožef	Krajnc	d		Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5564-0ff8-edf3-418bd977018c	\N	\N	0005		Marko	Zupančič	e			marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5564-0ff8-6e2a-e1f47f983a17	\N	\N	0006	ga.	Marija	Kovač	f			marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5564-0ff8-2612-c73a859555da	\N	\N	0007	ga.	Ana	Potočnik	g			ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5564-0ff8-3474-ddb619c50f5e	\N	\N	0008	ga.	Maja	Mlakar	h			maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5564-0ff8-5547-b35276a1cb74	\N	\N	0009		Irena	Kos	i			irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5564-0ff8-2ce1-d47daed8db20	\N	\N	0010		Mojca	Vidmar	J			mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
\.


--
-- TOC entry 2692 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2697 (class 0 OID 4984396)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5564-0ff7-4fbf-d18c1791e134	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5564-0ff7-066d-157da429b584	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5564-0ff7-01df-c4254a3bd415	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5564-0ff7-6bfc-759350c1660e	Abonma-read	Abonma - branje	f
00030000-5564-0ff7-dd9a-14de21258c08	Abonma-write	Abonma - spreminjanje	f
00030000-5564-0ff7-63ae-48104498b74d	Alternacija-read	Alternacija - branje	f
00030000-5564-0ff7-aa72-33dfb2f48bca	Alternacija-write	Alternacija - spreminjanje	f
00030000-5564-0ff7-5f9a-f50c67c9e0c4	Arhivalija-read	Arhivalija - branje	f
00030000-5564-0ff7-9bde-8ee4cbc410dd	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5564-0ff7-8302-9dae94e214f3	Besedilo-read	Besedilo - branje	f
00030000-5564-0ff7-d86d-3326630688f4	Besedilo-write	Besedilo - spreminjanje	f
00030000-5564-0ff7-47b6-3f106e1ecd56	DogodekIzven-read	DogodekIzven - branje	f
00030000-5564-0ff7-9f2d-f54affb8da51	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5564-0ff7-3b61-555500914769	Dogodek-read	Dogodek - branje	f
00030000-5564-0ff7-2362-171919914ca4	Dogodek-write	Dogodek - spreminjanje	f
00030000-5564-0ff7-16a4-870fc4c4aab9	Drzava-read	Drzava - branje	f
00030000-5564-0ff7-616d-1eb8215b3abd	Drzava-write	Drzava - spreminjanje	f
00030000-5564-0ff7-caca-dfc7f8a502cd	Funkcija-read	Funkcija - branje	f
00030000-5564-0ff7-6765-fe90b2a67a90	Funkcija-write	Funkcija - spreminjanje	f
00030000-5564-0ff7-8519-01945041fc4d	Gostovanje-read	Gostovanje - branje	f
00030000-5564-0ff7-4eb4-7d3aed20ae38	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5564-0ff7-54ce-d37a003b334d	Gostujoca-read	Gostujoca - branje	f
00030000-5564-0ff7-88c8-9a0cf1b82b9a	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5564-0ff7-b8aa-7a56bf094280	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5564-0ff7-cadb-0781c87e15db	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5564-0ff7-34c3-baa489e16d56	Kupec-read	Kupec - branje	f
00030000-5564-0ff8-5f83-be889f5032b1	Kupec-write	Kupec - spreminjanje	f
00030000-5564-0ff8-32d5-3cda336fef4a	NacinPlacina-read	NacinPlacina - branje	f
00030000-5564-0ff8-6487-cc1410db2c26	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5564-0ff8-a53a-49166f9a7eb1	Option-read	Option - branje	f
00030000-5564-0ff8-70fd-a5c086cca0c1	Option-write	Option - spreminjanje	f
00030000-5564-0ff8-4836-f151417288ee	OptionValue-read	OptionValue - branje	f
00030000-5564-0ff8-871a-94cbdaf356f1	OptionValue-write	OptionValue - spreminjanje	f
00030000-5564-0ff8-1b8b-28a3cd01657f	Oseba-read	Oseba - branje	f
00030000-5564-0ff8-3143-22cc5d5d6524	Oseba-write	Oseba - spreminjanje	f
00030000-5564-0ff8-6718-ad6e95c82dee	Permission-read	Permission - branje	f
00030000-5564-0ff8-5c1b-a87d04a82272	Permission-write	Permission - spreminjanje	f
00030000-5564-0ff8-88a5-3eeb82c3c36b	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5564-0ff8-89d3-d0969bfe0cbb	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5564-0ff8-089a-2c03436f7105	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5564-0ff8-0a6d-e4823e9b866a	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5564-0ff8-c1f4-f558dc5e4f98	Pogodba-read	Pogodba - branje	f
00030000-5564-0ff8-3242-b9cdec50d1b0	Pogodba-write	Pogodba - spreminjanje	f
00030000-5564-0ff8-04be-d442576ce964	Popa-read	Popa - branje	f
00030000-5564-0ff8-ae67-f30a51642450	Popa-write	Popa - spreminjanje	f
00030000-5564-0ff8-e805-43d192261f79	Posta-read	Posta - branje	f
00030000-5564-0ff8-e7a8-d66a04dd0c74	Posta-write	Posta - spreminjanje	f
00030000-5564-0ff8-9f26-505bd39e3cce	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5564-0ff8-9794-e9d952be9868	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5564-0ff8-3e0b-7180dd35a3ee	PostniNaslov-read	PostniNaslov - branje	f
00030000-5564-0ff8-6847-e2ea4841687c	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5564-0ff8-0f09-f008960d5991	Predstava-read	Predstava - branje	f
00030000-5564-0ff8-0711-24ae2d17ced2	Predstava-write	Predstava - spreminjanje	f
00030000-5564-0ff8-ba81-c4168bf5fb8f	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5564-0ff8-eaea-e1da17da6e8d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5564-0ff8-b113-bf9787ddb684	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5564-0ff8-4726-7cee0233dfa5	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5564-0ff8-b8a1-05b448e04b3e	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5564-0ff8-3363-a6601e7c4e43	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5564-0ff8-ab3d-f5b3d5697795	Prostor-read	Prostor - branje	f
00030000-5564-0ff8-d827-57670368d07e	Prostor-write	Prostor - spreminjanje	f
00030000-5564-0ff8-22b5-4403d9689e3f	Racun-read	Racun - branje	f
00030000-5564-0ff8-8081-5960a4eed14b	Racun-write	Racun - spreminjanje	f
00030000-5564-0ff8-cfc4-bea4da879a13	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5564-0ff8-4acc-c1d16a6374f6	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5564-0ff8-c42e-731bb55e8ffd	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5564-0ff8-4d0b-b2c3b5ea818a	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5564-0ff8-444c-50f4a0d0976d	Rekvizit-read	Rekvizit - branje	f
00030000-5564-0ff8-08d2-52d8e2e8e105	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5564-0ff8-8d4a-bcfef322bd8d	Revizija-read	Revizija - branje	f
00030000-5564-0ff8-53dd-c4099a5f3f91	Revizija-write	Revizija - spreminjanje	f
00030000-5564-0ff8-26a5-d8128d483826	Rezervacija-read	Rezervacija - branje	f
00030000-5564-0ff8-de4e-469afe699771	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5564-0ff8-2eb8-b19b8cbe9d13	Role-read	Role - branje	f
00030000-5564-0ff8-413c-b9f7883a121f	Role-write	Role - spreminjanje	f
00030000-5564-0ff8-ba1f-532768727b9b	SedezniRed-read	SedezniRed - branje	f
00030000-5564-0ff8-64b1-c6586ab92b73	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5564-0ff8-db33-170e969164b1	Sedez-read	Sedez - branje	f
00030000-5564-0ff8-0d24-01bd4d9e6b3d	Sedez-write	Sedez - spreminjanje	f
00030000-5564-0ff8-8450-b3db77f268b5	Sezona-read	Sezona - branje	f
00030000-5564-0ff8-cb2b-d7776b14ae74	Sezona-write	Sezona - spreminjanje	f
00030000-5564-0ff8-3abf-fddb42759b60	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5564-0ff8-6481-5148dc2e7a93	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5564-0ff8-5a97-3d0b75189081	Stevilcenje-read	Stevilcenje - branje	f
00030000-5564-0ff8-ccf7-0dd602c7251b	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5564-0ff8-b858-73a92e8c27f9	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5564-0ff8-5d11-7fa9865518f8	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5564-0ff8-baac-6688d055ad33	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5564-0ff8-44ba-d328dff29551	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5564-0ff8-1894-dadc5537ef52	Telefonska-read	Telefonska - branje	f
00030000-5564-0ff8-7c14-a0448e88b338	Telefonska-write	Telefonska - spreminjanje	f
00030000-5564-0ff8-5a12-4f1fca4c66d9	TerminStoritve-read	TerminStoritve - branje	f
00030000-5564-0ff8-5eaf-1cda65e3f6d2	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5564-0ff8-c9f9-05245f94a9fe	TipFunkcije-read	TipFunkcije - branje	f
00030000-5564-0ff8-3690-8e8c2725e657	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5564-0ff8-4a42-169a11fc76a4	Trr-read	Trr - branje	f
00030000-5564-0ff8-f823-80230af6ecdc	Trr-write	Trr - spreminjanje	f
00030000-5564-0ff8-4a49-ffcc76ed079c	Uprizoritev-read	Uprizoritev - branje	f
00030000-5564-0ff8-c01b-4f19fbb62f32	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5564-0ff8-213e-bafdf4d08699	User-read	User - branje	f
00030000-5564-0ff8-f05c-81390aef1b39	User-write	User - spreminjanje	f
00030000-5564-0ff8-1c86-5b8a147f8391	Vaja-read	Vaja - branje	f
00030000-5564-0ff8-9bb0-e74e47fe9123	Vaja-write	Vaja - spreminjanje	f
00030000-5564-0ff8-e541-fa741955c162	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5564-0ff8-d791-36399065dd69	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5564-0ff8-20ab-55828942700f	Zaposlitev-read	Zaposlitev - branje	f
00030000-5564-0ff8-5612-572aaeae5e15	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5564-0ff8-d131-9b61cb6d9611	Zasedenost-read	Zasedenost - branje	f
00030000-5564-0ff8-58e0-f30a90106ea4	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5564-0ff8-2042-33051303435a	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5564-0ff8-b0f1-7fcc89d5e1cd	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5564-0ff8-1d13-6d97709bf651	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5564-0ff8-15b7-ed7ac01cbc24	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2699 (class 0 OID 4984415)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5564-0ff8-74ab-5c11951730a9	00030000-5564-0ff7-16a4-870fc4c4aab9
00020000-5564-0ff8-5434-dcbf31576bd4	00030000-5564-0ff7-616d-1eb8215b3abd
00020000-5564-0ff8-5434-dcbf31576bd4	00030000-5564-0ff7-16a4-870fc4c4aab9
\.


--
-- TOC entry 2727 (class 0 OID 4984705)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2731 (class 0 OID 4984736)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2743 (class 0 OID 4984869)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2704 (class 0 OID 4984474)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5564-0ff8-a087-0c86a0c16e84	00040000-5564-0ff7-b9c1-0824e3b2a2ee	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5564-0ff8-5501-8e40d73c12f8	00040000-5564-0ff7-b9c1-0824e3b2a2ee	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2706 (class 0 OID 4984509)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5564-0ff7-177f-092bae47b780	8341	Adlešiči
00050000-5564-0ff7-a295-8cfc8e5f9f35	5270	Ajdovščina
00050000-5564-0ff7-46da-0c6b590d3cd7	6280	Ankaran/Ancarano
00050000-5564-0ff7-517f-e1c4e7ddf9dc	9253	Apače
00050000-5564-0ff7-7e20-89aa9ee3436d	8253	Artiče
00050000-5564-0ff7-571a-5ef70117a22f	4275	Begunje na Gorenjskem
00050000-5564-0ff7-a3bd-46f8584d9dab	1382	Begunje pri Cerknici
00050000-5564-0ff7-7502-c824cb8e9f9d	9231	Beltinci
00050000-5564-0ff7-0670-9de9052db33e	2234	Benedikt
00050000-5564-0ff7-3da3-66756d6c2e0e	2345	Bistrica ob Dravi
00050000-5564-0ff7-7d3b-401cbd15a365	3256	Bistrica ob Sotli
00050000-5564-0ff7-2d96-f8571af3b2eb	8259	Bizeljsko
00050000-5564-0ff7-9ae2-14535d4ceed6	1223	Blagovica
00050000-5564-0ff7-a00f-bfdbbf43d9d2	8283	Blanca
00050000-5564-0ff7-3a27-071cb91ebbf5	4260	Bled
00050000-5564-0ff7-2974-2963d2fb6054	4273	Blejska Dobrava
00050000-5564-0ff7-7665-4c88babfc780	9265	Bodonci
00050000-5564-0ff7-2fc8-f03942176e7d	9222	Bogojina
00050000-5564-0ff7-3621-413c2f39f59e	4263	Bohinjska Bela
00050000-5564-0ff7-cf87-f187a22eed44	4264	Bohinjska Bistrica
00050000-5564-0ff7-eb9d-89f4ebf408f2	4265	Bohinjsko jezero
00050000-5564-0ff7-3f8f-e81e78ba6303	1353	Borovnica
00050000-5564-0ff7-a859-3886ea8ef1b0	8294	Boštanj
00050000-5564-0ff7-c7b4-9c282c9a7031	5230	Bovec
00050000-5564-0ff7-1286-0b1553f7f883	5295	Branik
00050000-5564-0ff7-07b7-e0cbc389fa12	3314	Braslovče
00050000-5564-0ff7-7db1-c813a4ffc4ea	5223	Breginj
00050000-5564-0ff7-e4f3-1be0e1e21a9b	8280	Brestanica
00050000-5564-0ff7-d72c-2f6cd8bbbd60	2354	Bresternica
00050000-5564-0ff7-3922-d6488aa9bd15	4243	Brezje
00050000-5564-0ff7-c0f9-d814cbee2953	1351	Brezovica pri Ljubljani
00050000-5564-0ff7-9228-d8ca8b71787c	8250	Brežice
00050000-5564-0ff7-20a0-b6df79525014	4210	Brnik - Aerodrom
00050000-5564-0ff7-7c2e-e432a202a0a5	8321	Brusnice
00050000-5564-0ff7-cd9a-4a54082ba91f	3255	Buče
00050000-5564-0ff7-9a9b-8ab482f7c7d0	8276	Bučka 
00050000-5564-0ff7-0c1d-ae2ba645b3a6	9261	Cankova
00050000-5564-0ff7-3500-bd1bc9ef6ad6	3000	Celje 
00050000-5564-0ff7-221f-f083b0e5b6db	3001	Celje - poštni predali
00050000-5564-0ff7-567e-e1d4713f1b52	4207	Cerklje na Gorenjskem
00050000-5564-0ff7-afa1-eff5feb8cdb1	8263	Cerklje ob Krki
00050000-5564-0ff7-6fe3-8509716d3894	1380	Cerknica
00050000-5564-0ff7-d1fc-b746efba315e	5282	Cerkno
00050000-5564-0ff7-51cc-b4473cdb65e8	2236	Cerkvenjak
00050000-5564-0ff7-41d5-dede3f8c6eb2	2215	Ceršak
00050000-5564-0ff7-48c1-efc0feead088	2326	Cirkovce
00050000-5564-0ff7-108c-889ab6f86367	2282	Cirkulane
00050000-5564-0ff7-dd6f-87219e2a5641	5273	Col
00050000-5564-0ff7-a108-7811619d8f0f	8251	Čatež ob Savi
00050000-5564-0ff7-d4ba-d41f4be29746	1413	Čemšenik
00050000-5564-0ff7-4978-f14e1282a9c8	5253	Čepovan
00050000-5564-0ff7-3c8c-e1f3479dbcb8	9232	Črenšovci
00050000-5564-0ff7-1bf1-6367dcaf507a	2393	Črna na Koroškem
00050000-5564-0ff7-10cf-f3115a05ce10	6275	Črni Kal
00050000-5564-0ff7-d745-2227d26be301	5274	Črni Vrh nad Idrijo
00050000-5564-0ff7-87f9-374a830ea5c9	5262	Črniče
00050000-5564-0ff7-521a-986ec1b6873d	8340	Črnomelj
00050000-5564-0ff7-f9fe-79c6261424ca	6271	Dekani
00050000-5564-0ff7-de88-80d5fee15a77	5210	Deskle
00050000-5564-0ff7-034e-64e7c4635194	2253	Destrnik
00050000-5564-0ff7-bb45-ddcd06c0aef4	6215	Divača
00050000-5564-0ff7-dd7d-67041b0e0ebf	1233	Dob
00050000-5564-0ff7-59c9-2d0aa4ea4bef	3224	Dobje pri Planini
00050000-5564-0ff7-b2cd-9e9069345e64	8257	Dobova
00050000-5564-0ff7-1611-6b117684721e	1423	Dobovec
00050000-5564-0ff7-6d46-c9c905fe350d	5263	Dobravlje
00050000-5564-0ff7-d392-499bf81b6c04	3204	Dobrna
00050000-5564-0ff7-6cde-07ead4cd4f0a	8211	Dobrnič
00050000-5564-0ff7-7594-541824fb9b17	1356	Dobrova
00050000-5564-0ff7-1c42-2e19b3a1bcb9	9223	Dobrovnik/Dobronak 
00050000-5564-0ff7-e33f-25a7ba67c54a	5212	Dobrovo v Brdih
00050000-5564-0ff7-2e09-d5f5bc448d88	1431	Dol pri Hrastniku
00050000-5564-0ff7-c34a-99e610ee5373	1262	Dol pri Ljubljani
00050000-5564-0ff7-bfdc-bed5df092107	1273	Dole pri Litiji
00050000-5564-0ff7-5223-27fc0516da7f	1331	Dolenja vas
00050000-5564-0ff7-1914-c5d6df17669a	8350	Dolenjske Toplice
00050000-5564-0ff7-5928-1931bd89b4b7	1230	Domžale
00050000-5564-0ff7-6e47-37ec31f0d2c4	2252	Dornava
00050000-5564-0ff7-0431-ae4271d7d804	5294	Dornberk
00050000-5564-0ff7-8185-9c147889c19e	1319	Draga
00050000-5564-0ff7-4cd0-115030ebe815	8343	Dragatuš
00050000-5564-0ff7-3ad9-5b95202bebb2	3222	Dramlje
00050000-5564-0ff7-223a-4a351326c806	2370	Dravograd
00050000-5564-0ff7-252d-d9d094171df4	4203	Duplje
00050000-5564-0ff7-8a2d-6e36d2c627bf	6221	Dutovlje
00050000-5564-0ff7-e3d7-9a6194e6e25e	8361	Dvor
00050000-5564-0ff7-6d24-b9f9fedd9101	2343	Fala
00050000-5564-0ff7-569f-34119922fe95	9208	Fokovci
00050000-5564-0ff7-47dd-a8e88546dfb8	2313	Fram
00050000-5564-0ff7-3e06-4fb17700b37e	3213	Frankolovo
00050000-5564-0ff7-3449-78182e889b46	1274	Gabrovka
00050000-5564-0ff7-cde4-fd0f7bf60f97	8254	Globoko
00050000-5564-0ff7-416b-fb30cb31f177	5275	Godovič
00050000-5564-0ff7-bc0a-9c224feb0361	4204	Golnik
00050000-5564-0ff7-f96c-8abe77ccd50a	3303	Gomilsko
00050000-5564-0ff7-0a77-e43dcec81421	4224	Gorenja vas
00050000-5564-0ff7-198f-df0499de95ab	3263	Gorica pri Slivnici
00050000-5564-0ff7-642c-837fac792c5e	2272	Gorišnica
00050000-5564-0ff7-5113-753138c16ecf	9250	Gornja Radgona
00050000-5564-0ff7-0dd3-77136e9e8133	3342	Gornji Grad
00050000-5564-0ff7-546e-720034a4b281	4282	Gozd Martuljek
00050000-5564-0ff7-fb6f-760e28d95742	6272	Gračišče
00050000-5564-0ff7-ddc1-e6c178531058	9264	Grad
00050000-5564-0ff7-a345-4fd458207aa1	8332	Gradac
00050000-5564-0ff7-e68f-e5d068ae7c2d	1384	Grahovo
00050000-5564-0ff7-f24f-fbc40c8100c4	5242	Grahovo ob Bači
00050000-5564-0ff7-6473-dcdc4d28bb7d	5251	Grgar
00050000-5564-0ff7-97f9-7eea5a72f234	3302	Griže
00050000-5564-0ff7-a179-d6f7d632f738	3231	Grobelno
00050000-5564-0ff7-3974-42c6eef672d7	1290	Grosuplje
00050000-5564-0ff7-8f60-5bf787a3ac6f	2288	Hajdina
00050000-5564-0ff7-8db3-2d30d5a7e32e	8362	Hinje
00050000-5564-0ff7-b27c-ee74baf57ece	2311	Hoče
00050000-5564-0ff7-60b5-288afac8831a	9205	Hodoš/Hodos
00050000-5564-0ff7-dfa8-3488b24d9f26	1354	Horjul
00050000-5564-0ff7-e75a-6c9b584c6fa3	1372	Hotedršica
00050000-5564-0ff7-6435-98b8f1565592	1430	Hrastnik
00050000-5564-0ff7-22a8-c118f9a5e143	6225	Hruševje
00050000-5564-0ff7-a05e-f1631edaade3	4276	Hrušica
00050000-5564-0ff7-e31e-4635db89f83c	5280	Idrija
00050000-5564-0ff7-ef8e-6371196354f4	1292	Ig
00050000-5564-0ff7-e184-a059461ab49f	6250	Ilirska Bistrica
00050000-5564-0ff7-08d8-a47339d4354d	6251	Ilirska Bistrica-Trnovo
00050000-5564-0ff7-89b4-a015f0aa726a	1295	Ivančna Gorica
00050000-5564-0ff7-18fc-abe00e602742	2259	Ivanjkovci
00050000-5564-0ff7-52b4-fe0897dd7567	1411	Izlake
00050000-5564-0ff7-9173-84aee9d8d44c	6310	Izola/Isola
00050000-5564-0ff7-b88a-67b3726021ec	2222	Jakobski Dol
00050000-5564-0ff7-04a9-f2dcec808fe2	2221	Jarenina
00050000-5564-0ff7-0dec-e31ac2b7ae0e	6254	Jelšane
00050000-5564-0ff7-28af-0e14a244dc8b	4270	Jesenice
00050000-5564-0ff7-39c2-5503d3be12d2	8261	Jesenice na Dolenjskem
00050000-5564-0ff7-0953-201f407780c2	3273	Jurklošter
00050000-5564-0ff7-40e5-65444cb2559b	2223	Jurovski Dol
00050000-5564-0ff7-bd67-adf2cf186910	2256	Juršinci
00050000-5564-0ff7-59a5-dd41829a8ad3	5214	Kal nad Kanalom
00050000-5564-0ff7-af19-1479bead0f62	3233	Kalobje
00050000-5564-0ff7-cf3b-72df56a908f1	4246	Kamna Gorica
00050000-5564-0ff7-cf3d-1c1fdc04f93b	2351	Kamnica
00050000-5564-0ff7-dfaa-75c5e2885229	1241	Kamnik
00050000-5564-0ff7-9e8f-c00d0aef48c2	5213	Kanal
00050000-5564-0ff7-3356-5e5045dbf87a	8258	Kapele
00050000-5564-0ff7-03f4-e57ee02ab78b	2362	Kapla
00050000-5564-0ff7-3c67-694158155c70	2325	Kidričevo
00050000-5564-0ff7-15f7-69cf7b3fda58	1412	Kisovec
00050000-5564-0ff7-8569-7ba758a697b4	6253	Knežak
00050000-5564-0ff7-c87a-474f22244429	5222	Kobarid
00050000-5564-0ff7-7445-c10238b5ef5a	9227	Kobilje
00050000-5564-0ff7-e063-78f5276a2205	1330	Kočevje
00050000-5564-0ff7-d768-7b628611689e	1338	Kočevska Reka
00050000-5564-0ff7-cc56-da1ca2acb2bf	2276	Kog
00050000-5564-0ff7-3b9b-429619ee316d	5211	Kojsko
00050000-5564-0ff7-1a3b-04eaf5a38db9	6223	Komen
00050000-5564-0ff7-f3cb-9bfc4426b54a	1218	Komenda
00050000-5564-0ff7-82b6-00fa390932d2	6000	Koper/Capodistria 
00050000-5564-0ff7-cda2-572e8b3eaaeb	6001	Koper/Capodistria - poštni predali
00050000-5564-0ff7-bef2-c7c526433ee6	8282	Koprivnica
00050000-5564-0ff7-acdb-c05fea3c74bb	5296	Kostanjevica na Krasu
00050000-5564-0ff7-6066-24b449fbaf7a	8311	Kostanjevica na Krki
00050000-5564-0ff7-1126-4f124e5a1163	1336	Kostel
00050000-5564-0ff7-8706-e926bd03e5fd	6256	Košana
00050000-5564-0ff7-8a1c-34d7992abbd8	2394	Kotlje
00050000-5564-0ff7-08db-7692cfb7541a	6240	Kozina
00050000-5564-0ff7-d209-8499fcdea3e0	3260	Kozje
00050000-5564-0ff7-d8e4-229d86c5b10d	4000	Kranj 
00050000-5564-0ff7-991a-0654a4cda3a2	4001	Kranj - poštni predali
00050000-5564-0ff7-be20-498007066d55	4280	Kranjska Gora
00050000-5564-0ff7-26e3-ffc3c56207c3	1281	Kresnice
00050000-5564-0ff7-37c5-07ea148ee507	4294	Križe
00050000-5564-0ff7-946f-fc5998557ee0	9206	Križevci
00050000-5564-0ff7-0757-617fb377c86e	9242	Križevci pri Ljutomeru
00050000-5564-0ff7-f453-8d712e7e9a52	1301	Krka
00050000-5564-0ff7-813b-19365f931767	8296	Krmelj
00050000-5564-0ff7-7755-3d71be661657	4245	Kropa
00050000-5564-0ff7-1f45-142f61c6cced	8262	Krška vas
00050000-5564-0ff7-c4f6-f3869ea13c3b	8270	Krško
00050000-5564-0ff7-cdd3-d279fe323fad	9263	Kuzma
00050000-5564-0ff7-10a1-3d34496c5e76	2318	Laporje
00050000-5564-0ff7-1d0a-2d58ff8636b3	3270	Laško
00050000-5564-0ff7-33a6-1cfe7a2e8aca	1219	Laze v Tuhinju
00050000-5564-0ff7-a519-e8715450ffb7	2230	Lenart v Slovenskih goricah
00050000-5564-0ff7-8f64-a387c17492b8	9220	Lendava/Lendva
00050000-5564-0ff7-6c43-62abd353b85e	4248	Lesce
00050000-5564-0ff7-fede-1ab2c9268146	3261	Lesično
00050000-5564-0ff7-cf4a-1d3019882453	8273	Leskovec pri Krškem
00050000-5564-0ff7-bfd1-ca4134c4bce7	2372	Libeliče
00050000-5564-0ff7-f789-88e05de0b097	2341	Limbuš
00050000-5564-0ff7-a2a7-78aa609016c2	1270	Litija
00050000-5564-0ff7-9f4c-d00c8960c0e1	3202	Ljubečna
00050000-5564-0ff7-8403-d91b8d8799a9	1000	Ljubljana 
00050000-5564-0ff7-8712-52dd9f72082b	1001	Ljubljana - poštni predali
00050000-5564-0ff7-197e-bf99d0d3e6fd	1231	Ljubljana - Črnuče
00050000-5564-0ff7-d3aa-b792c686862c	1261	Ljubljana - Dobrunje
00050000-5564-0ff7-b324-024b7aaa3233	1260	Ljubljana - Polje
00050000-5564-0ff7-cab9-cbac88b7be83	1210	Ljubljana - Šentvid
00050000-5564-0ff7-a237-440031578e19	1211	Ljubljana - Šmartno
00050000-5564-0ff7-8b08-9eb36aef6769	3333	Ljubno ob Savinji
00050000-5564-0ff7-35c7-cb1a6610e5a6	9240	Ljutomer
00050000-5564-0ff7-f99d-1d27c3261173	3215	Loče
00050000-5564-0ff7-44d0-2002f8b5b12b	5231	Log pod Mangartom
00050000-5564-0ff7-27ee-fc0d7ef01dc2	1358	Log pri Brezovici
00050000-5564-0ff7-ac0a-bd768f311782	1370	Logatec
00050000-5564-0ff7-b192-b3ba62850c8e	1371	Logatec
00050000-5564-0ff7-fcf4-9c30b28c831e	1434	Loka pri Zidanem Mostu
00050000-5564-0ff7-81aa-19c293b46dd2	3223	Loka pri Žusmu
00050000-5564-0ff7-8a0b-74f49b8bc8e9	6219	Lokev
00050000-5564-0ff7-bfc0-871dfe159905	1318	Loški Potok
00050000-5564-0ff7-924c-bdd35bded187	2324	Lovrenc na Dravskem polju
00050000-5564-0ff7-c80c-0c60e97932aa	2344	Lovrenc na Pohorju
00050000-5564-0ff7-5e99-fda779bfce21	3334	Luče
00050000-5564-0ff7-3acf-794a1e4b649d	1225	Lukovica
00050000-5564-0ff7-702b-414e39f56c93	9202	Mačkovci
00050000-5564-0ff7-231e-1a7a882f69ce	2322	Majšperk
00050000-5564-0ff7-b40c-ed54e5534328	2321	Makole
00050000-5564-0ff7-ab9b-c71f8df620b8	9243	Mala Nedelja
00050000-5564-0ff7-24c9-6170e4d1a132	2229	Malečnik
00050000-5564-0ff7-def9-1e9727a0b10d	6273	Marezige
00050000-5564-0ff7-ed80-87bb23d9f269	2000	Maribor 
00050000-5564-0ff7-2ba3-823d6376ab87	2001	Maribor - poštni predali
00050000-5564-0ff7-1239-f261b3026fc4	2206	Marjeta na Dravskem polju
00050000-5564-0ff7-70f5-25cba4062979	2281	Markovci
00050000-5564-0ff7-8f1d-21bd0647257a	9221	Martjanci
00050000-5564-0ff7-938e-ddcdc7684cf3	6242	Materija
00050000-5564-0ff7-859b-9bd29427a282	4211	Mavčiče
00050000-5564-0ff7-0787-1255a35f461e	1215	Medvode
00050000-5564-0ff7-0820-9b250b367d33	1234	Mengeš
00050000-5564-0ff7-5790-86c6687eec54	8330	Metlika
00050000-5564-0ff7-36ef-fa26145adfee	2392	Mežica
00050000-5564-0ff7-82b0-7027759fb061	2204	Miklavž na Dravskem polju
00050000-5564-0ff7-75fb-bb195c27a037	2275	Miklavž pri Ormožu
00050000-5564-0ff7-435e-19982d1e0de2	5291	Miren
00050000-5564-0ff7-f8b2-ff6f9da8af82	8233	Mirna
00050000-5564-0ff7-df4e-7fbb67683431	8216	Mirna Peč
00050000-5564-0ff7-f67a-dfc3cb610381	2382	Mislinja
00050000-5564-0ff7-49e6-a66b03685a91	4281	Mojstrana
00050000-5564-0ff7-912a-48f1c80aa08d	8230	Mokronog
00050000-5564-0ff7-184c-e26c7be5f31c	1251	Moravče
00050000-5564-0ff7-ec2d-4d2a30d21ee6	9226	Moravske Toplice
00050000-5564-0ff7-c536-e82bcf33a0b3	5216	Most na Soči
00050000-5564-0ff7-0166-e6e037df9a15	1221	Motnik
00050000-5564-0ff7-4f1a-7115aa429dcd	3330	Mozirje
00050000-5564-0ff7-1e6b-c1e7beb99bdd	9000	Murska Sobota 
00050000-5564-0ff7-ad8d-fcb595b4ba7e	9001	Murska Sobota - poštni predali
00050000-5564-0ff7-edcf-ea373270fc72	2366	Muta
00050000-5564-0ff7-9cb4-796619b580d4	4202	Naklo
00050000-5564-0ff7-af2f-f9364e16809b	3331	Nazarje
00050000-5564-0ff7-7bcb-014e1858562a	1357	Notranje Gorice
00050000-5564-0ff7-08df-027bfb375d6a	3203	Nova Cerkev
00050000-5564-0ff7-76ea-c6cb3660df26	5000	Nova Gorica 
00050000-5564-0ff7-32fe-c09b33061459	5001	Nova Gorica - poštni predali
00050000-5564-0ff7-2e3b-3474fadb9ea4	1385	Nova vas
00050000-5564-0ff7-f438-727bc3f24bf5	8000	Novo mesto
00050000-5564-0ff7-15c0-d008eb8cdee0	8001	Novo mesto - poštni predali
00050000-5564-0ff7-a3c8-c49a3b5d218f	6243	Obrov
00050000-5564-0ff7-ceac-84f872f68fdc	9233	Odranci
00050000-5564-0ff7-8bb3-8e2280c8bee7	2317	Oplotnica
00050000-5564-0ff7-82a7-052a39240c68	2312	Orehova vas
00050000-5564-0ff7-0f8a-0cdba8a3c729	2270	Ormož
00050000-5564-0ff7-0000-691b058b4815	1316	Ortnek
00050000-5564-0ff7-0684-cb41013a1c11	1337	Osilnica
00050000-5564-0ff7-ec7f-c5a1b39a78d5	8222	Otočec
00050000-5564-0ff7-c2e5-50a74b6193ea	2361	Ožbalt
00050000-5564-0ff7-bc71-857d988ac8e3	2231	Pernica
00050000-5564-0ff7-cded-ad534402b149	2211	Pesnica pri Mariboru
00050000-5564-0ff7-2cff-c6fe03985e51	9203	Petrovci
00050000-5564-0ff7-9504-952f1571f2bd	3301	Petrovče
00050000-5564-0ff7-7d2d-3659daab5f5e	6330	Piran/Pirano
00050000-5564-0ff7-e9fd-2b3609005f8e	8255	Pišece
00050000-5564-0ff7-4e3e-542ec4da9584	6257	Pivka
00050000-5564-0ff7-c0ae-0f80153f9759	6232	Planina
00050000-5564-0ff7-32ee-fc3c89b50810	3225	Planina pri Sevnici
00050000-5564-0ff7-0b81-29a358936649	6276	Pobegi
00050000-5564-0ff7-183c-bcd3448fdd9c	8312	Podbočje
00050000-5564-0ff7-7376-be928432d4d7	5243	Podbrdo
00050000-5564-0ff7-97e2-35c0205edd76	3254	Podčetrtek
00050000-5564-0ff7-b7ad-067b45190d5d	2273	Podgorci
00050000-5564-0ff7-7f9d-b92928cdfa76	6216	Podgorje
00050000-5564-0ff7-8665-00d519f22cc6	2381	Podgorje pri Slovenj Gradcu
00050000-5564-0ff7-dd38-9b7ff00babf9	6244	Podgrad
00050000-5564-0ff7-baa2-a7677a2dbe13	1414	Podkum
00050000-5564-0ff7-3300-78732f68de76	2286	Podlehnik
00050000-5564-0ff7-22ae-1dac89806000	5272	Podnanos
00050000-5564-0ff7-e637-e06ef0827b1f	4244	Podnart
00050000-5564-0ff7-b564-8078396f3e83	3241	Podplat
00050000-5564-0ff7-1e98-0852adbf6cec	3257	Podsreda
00050000-5564-0ff7-dc25-f1599544e406	2363	Podvelka
00050000-5564-0ff7-7b33-15dc59b8fd7f	2208	Pohorje
00050000-5564-0ff7-1ab2-278b18806d3c	2257	Polenšak
00050000-5564-0ff7-b402-f66b8e812eca	1355	Polhov Gradec
00050000-5564-0ff7-3dab-91794f80806c	4223	Poljane nad Škofjo Loko
00050000-5564-0ff7-576f-194574157e59	2319	Poljčane
00050000-5564-0ff7-55c5-f4a89e655456	1272	Polšnik
00050000-5564-0ff7-c0c7-ee5ea7be5291	3313	Polzela
00050000-5564-0ff7-2667-3273363a23ea	3232	Ponikva
00050000-5564-0ff7-13ec-460fea19df68	6320	Portorož/Portorose
00050000-5564-0ff7-c47b-3d9e054f2ffc	6230	Postojna
00050000-5564-0ff7-7bd2-a81a5b346cfb	2331	Pragersko
00050000-5564-0ff7-f9e2-e8e3bac43db5	3312	Prebold
00050000-5564-0ff7-f301-6a329da101b8	4205	Preddvor
00050000-5564-0ff7-54c4-93a9f794af2e	6255	Prem
00050000-5564-0ff7-c11d-0eba9dc2852f	1352	Preserje
00050000-5564-0ff7-d256-39ea2120ea35	6258	Prestranek
00050000-5564-0ff7-8d60-d67472a224a0	2391	Prevalje
00050000-5564-0ff7-baba-6d7a41f17cb6	3262	Prevorje
00050000-5564-0ff7-7561-d158955eba1b	1276	Primskovo 
00050000-5564-0ff7-550c-34a096348607	3253	Pristava pri Mestinju
00050000-5564-0ff7-850f-80412152f9c2	9207	Prosenjakovci/Partosfalva
00050000-5564-0ff7-24b3-5e217d9dcf6b	5297	Prvačina
00050000-5564-0ff7-ca6d-1e6f2eca6793	2250	Ptuj
00050000-5564-0ff7-fd6d-7cbe4ec208fe	2323	Ptujska Gora
00050000-5564-0ff7-4465-6544a3f6c089	9201	Puconci
00050000-5564-0ff7-0548-3c71ddda9c0c	2327	Rače
00050000-5564-0ff7-0aea-262d9efe1cf3	1433	Radeče
00050000-5564-0ff7-1afd-9b97887a3ca3	9252	Radenci
00050000-5564-0ff7-026a-ca19e3b1faca	2360	Radlje ob Dravi
00050000-5564-0ff7-af27-a4dae30776d4	1235	Radomlje
00050000-5564-0ff7-d621-875f6e9420ac	4240	Radovljica
00050000-5564-0ff7-44a8-09d4a7be982d	8274	Raka
00050000-5564-0ff7-22d5-ed5c018ebb8f	1381	Rakek
00050000-5564-0ff7-b412-327674bb94f4	4283	Rateče - Planica
00050000-5564-0ff7-c783-4629401aad8d	2390	Ravne na Koroškem
00050000-5564-0ff7-f6be-d25fc9d5b86e	9246	Razkrižje
00050000-5564-0ff7-2d25-74bd829d6c13	3332	Rečica ob Savinji
00050000-5564-0ff7-7b18-cad068ed6b26	5292	Renče
00050000-5564-0ff7-496a-dbb299494de3	1310	Ribnica
00050000-5564-0ff7-4906-babfe6efef51	2364	Ribnica na Pohorju
00050000-5564-0ff7-22ae-e0ea9fccf17a	3272	Rimske Toplice
00050000-5564-0ff7-c153-05b5cca61f2a	1314	Rob
00050000-5564-0ff7-b274-3f4518035b96	5215	Ročinj
00050000-5564-0ff7-398e-c4875a2f30a0	3250	Rogaška Slatina
00050000-5564-0ff7-7fe2-5a0a888dc0a4	9262	Rogašovci
00050000-5564-0ff7-31ef-5ba6e99fbdcd	3252	Rogatec
00050000-5564-0ff7-3529-2e283cb20961	1373	Rovte
00050000-5564-0ff7-6feb-2f19cb785d04	2342	Ruše
00050000-5564-0ff7-e33d-1fef88b9f4fe	1282	Sava
00050000-5564-0ff7-d659-9f39602e4ea3	6333	Sečovlje/Sicciole
00050000-5564-0ff7-bb5f-0278c03893d6	4227	Selca
00050000-5564-0ff7-9eb0-8710cbe4dc09	2352	Selnica ob Dravi
00050000-5564-0ff7-8efa-bf2be065c573	8333	Semič
00050000-5564-0ff7-29c2-502264d1b27e	8281	Senovo
00050000-5564-0ff7-0767-3637f01afbc8	6224	Senožeče
00050000-5564-0ff7-01b3-c1253de518d2	8290	Sevnica
00050000-5564-0ff7-bd8f-953318eef4e9	6210	Sežana
00050000-5564-0ff7-4dcc-9b7c77c55658	2214	Sladki Vrh
00050000-5564-0ff7-e174-53dc82956d70	5283	Slap ob Idrijci
00050000-5564-0ff7-4c31-0a57769dd628	2380	Slovenj Gradec
00050000-5564-0ff7-c300-438d9ac7f050	2310	Slovenska Bistrica
00050000-5564-0ff7-c900-06204173e096	3210	Slovenske Konjice
00050000-5564-0ff7-407d-bfacf59cb3ff	1216	Smlednik
00050000-5564-0ff7-3054-5431f14a7172	5232	Soča
00050000-5564-0ff7-e624-220969ac5f5d	1317	Sodražica
00050000-5564-0ff7-0005-37b3162862a5	3335	Solčava
00050000-5564-0ff7-2bcc-5aead1bec83c	5250	Solkan
00050000-5564-0ff7-91c5-e41576cb5b33	4229	Sorica
00050000-5564-0ff7-b183-5f32ceed2f67	4225	Sovodenj
00050000-5564-0ff7-d82d-841e767503ef	5281	Spodnja Idrija
00050000-5564-0ff7-0bf2-f75f2eab0ca1	2241	Spodnji Duplek
00050000-5564-0ff7-dc3c-d9bbf143cd09	9245	Spodnji Ivanjci
00050000-5564-0ff7-d635-746c1070e022	2277	Središče ob Dravi
00050000-5564-0ff7-afbd-34f7a8768bc0	4267	Srednja vas v Bohinju
00050000-5564-0ff7-68c7-81e40e189dcf	8256	Sromlje 
00050000-5564-0ff7-406c-7b8229de4f2e	5224	Srpenica
00050000-5564-0ff7-114a-9e1bae1ee6e3	1242	Stahovica
00050000-5564-0ff7-fc37-ce1959d6ae35	1332	Stara Cerkev
00050000-5564-0ff7-11e8-6e0ad5505e7a	8342	Stari trg ob Kolpi
00050000-5564-0ff7-e678-ff7628b6b055	1386	Stari trg pri Ložu
00050000-5564-0ff7-59ae-6e5b67ef0e37	2205	Starše
00050000-5564-0ff7-5567-3a08bbe2d7dd	2289	Stoperce
00050000-5564-0ff7-43b4-e602e5ff9607	8322	Stopiče
00050000-5564-0ff7-8a80-1585be519003	3206	Stranice
00050000-5564-0ff7-9a76-b316df4210bc	8351	Straža
00050000-5564-0ff7-2155-63adab445324	1313	Struge
00050000-5564-0ff7-9b7a-ab42062593aa	8293	Studenec
00050000-5564-0ff7-f4db-ed1514e5be6c	8331	Suhor
00050000-5564-0ff7-7af6-54a6925f3565	2233	Sv. Ana v Slovenskih goricah
00050000-5564-0ff7-1624-bc7246a2e005	2235	Sv. Trojica v Slovenskih goricah
00050000-5564-0ff7-a444-8c52276fd68e	2353	Sveti Duh na Ostrem Vrhu
00050000-5564-0ff7-4edb-011dda92851d	9244	Sveti Jurij ob Ščavnici
00050000-5564-0ff7-6a34-31debde88307	3264	Sveti Štefan
00050000-5564-0ff7-72d1-b4f39e3e9fc4	2258	Sveti Tomaž
00050000-5564-0ff7-ff70-7c95e2827194	9204	Šalovci
00050000-5564-0ff7-c781-c1611255ad82	5261	Šempas
00050000-5564-0ff7-ce39-62e25ee25eee	5290	Šempeter pri Gorici
00050000-5564-0ff7-b87b-a03a8265628e	3311	Šempeter v Savinjski dolini
00050000-5564-0ff7-10c6-0bb72d594b5a	4208	Šenčur
00050000-5564-0ff7-966c-2c29002349c4	2212	Šentilj v Slovenskih goricah
00050000-5564-0ff7-aef7-bafc46f8d4a5	8297	Šentjanž
00050000-5564-0ff7-253a-018fd934bb13	2373	Šentjanž pri Dravogradu
00050000-5564-0ff7-a228-ee2602105ef5	8310	Šentjernej
00050000-5564-0ff7-e388-987d2c3c9e9e	3230	Šentjur
00050000-5564-0ff7-3959-fd57ca76fbe4	3271	Šentrupert
00050000-5564-0ff7-0532-3176bef6d72c	8232	Šentrupert
00050000-5564-0ff7-dd86-78071c760207	1296	Šentvid pri Stični
00050000-5564-0ff7-499e-4d02201c8819	8275	Škocjan
00050000-5564-0ff7-60df-da90c053c01f	6281	Škofije
00050000-5564-0ff7-9054-b5ad81ff05d8	4220	Škofja Loka
00050000-5564-0ff7-3466-30ff5ac26499	3211	Škofja vas
00050000-5564-0ff7-e984-3bbfea4058a5	1291	Škofljica
00050000-5564-0ff7-5dc8-ce6fe35b030e	6274	Šmarje
00050000-5564-0ff7-28f9-58ee128d45c7	1293	Šmarje - Sap
00050000-5564-0ff7-61ee-32e9b7bd7e92	3240	Šmarje pri Jelšah
00050000-5564-0ff7-d44a-992daaae45f7	8220	Šmarješke Toplice
00050000-5564-0ff7-9cfb-b05790fafbb5	2315	Šmartno na Pohorju
00050000-5564-0ff7-758b-e60b5723d16c	3341	Šmartno ob Dreti
00050000-5564-0ff7-1c43-794c3ecff622	3327	Šmartno ob Paki
00050000-5564-0ff7-57d3-c41fb8c2d1cd	1275	Šmartno pri Litiji
00050000-5564-0ff7-fe73-286151843f54	2383	Šmartno pri Slovenj Gradcu
00050000-5564-0ff7-a391-8629e20b85e1	3201	Šmartno v Rožni dolini
00050000-5564-0ff7-e89f-f051ce5e6409	3325	Šoštanj
00050000-5564-0ff7-d413-5868218a0a45	6222	Štanjel
00050000-5564-0ff7-0b80-7cc160da6ab3	3220	Štore
00050000-5564-0ff7-534b-e50266c031ff	3304	Tabor
00050000-5564-0ff7-bdf3-7ef6203c0ee5	3221	Teharje
00050000-5564-0ff7-d0e1-d6bc1e0d72b4	9251	Tišina
00050000-5564-0ff7-7bf2-78f6d1c58199	5220	Tolmin
00050000-5564-0ff7-5eb4-3190883b7240	3326	Topolšica
00050000-5564-0ff7-26d7-cb8782d77671	2371	Trbonje
00050000-5564-0ff7-143f-a465f2b6d69c	1420	Trbovlje
00050000-5564-0ff7-203d-0d2435aa1c26	8231	Trebelno 
00050000-5564-0ff7-1b0b-0d67d3910871	8210	Trebnje
00050000-5564-0ff7-bc62-5e769db0e92f	5252	Trnovo pri Gorici
00050000-5564-0ff7-ffa8-9bb6fc070418	2254	Trnovska vas
00050000-5564-0ff7-3c0c-b525ca40782c	1222	Trojane
00050000-5564-0ff7-825d-3ee0b805c677	1236	Trzin
00050000-5564-0ff7-df9f-42f3e7db3cc8	4290	Tržič
00050000-5564-0ff7-651a-75b7bd4f4615	8295	Tržišče
00050000-5564-0ff7-8696-52eb6e677e29	1311	Turjak
00050000-5564-0ff7-b8bd-5f3ce3f0d40f	9224	Turnišče
00050000-5564-0ff7-13c2-42fb07c121dc	8323	Uršna sela
00050000-5564-0ff7-bfec-216afec255cc	1252	Vače
00050000-5564-0ff7-aef0-9638543d10e4	3320	Velenje 
00050000-5564-0ff7-6ba4-8e397109a803	3322	Velenje - poštni predali
00050000-5564-0ff7-b5a3-aec592078874	8212	Velika Loka
00050000-5564-0ff7-1ce7-4202b2c11eec	2274	Velika Nedelja
00050000-5564-0ff7-9a7d-1d37533b8383	9225	Velika Polana
00050000-5564-0ff7-113c-866efa28066c	1315	Velike Lašče
00050000-5564-0ff7-90b6-dd40c9d96c0e	8213	Veliki Gaber
00050000-5564-0ff7-fe40-cf7e373a2d3f	9241	Veržej
00050000-5564-0ff7-78b3-c90ddfda89e6	1312	Videm - Dobrepolje
00050000-5564-0ff7-037a-48ee47acb0d9	2284	Videm pri Ptuju
00050000-5564-0ff7-3e51-ae63ee0a24eb	8344	Vinica
00050000-5564-0ff7-db0b-224a7e3292d2	5271	Vipava
00050000-5564-0ff7-8ad5-a24adb9855c2	4212	Visoko
00050000-5564-0ff7-5ea6-040a68093663	1294	Višnja Gora
00050000-5564-0ff7-786d-90e03ef8d85c	3205	Vitanje
00050000-5564-0ff7-9a79-07556bedaa53	2255	Vitomarci
00050000-5564-0ff7-59de-e8baa0f0116c	1217	Vodice
00050000-5564-0ff7-0e7d-9a86f2ce36da	3212	Vojnik\t
00050000-5564-0ff7-0394-6575a7554a42	5293	Volčja Draga
00050000-5564-0ff7-7b9a-692598d05d4f	2232	Voličina
00050000-5564-0ff7-1e6d-0f737161c4c4	3305	Vransko
00050000-5564-0ff7-e38e-b4b8504770b9	6217	Vremski Britof
00050000-5564-0ff7-502c-f530d1ea324f	1360	Vrhnika
00050000-5564-0ff7-6eec-e12fbab291ea	2365	Vuhred
00050000-5564-0ff7-f9fa-100a67ec259f	2367	Vuzenica
00050000-5564-0ff7-7e28-df7b541d8cfb	8292	Zabukovje 
00050000-5564-0ff7-f381-c3e3d5fb6335	1410	Zagorje ob Savi
00050000-5564-0ff7-46ab-009a684c60b4	1303	Zagradec
00050000-5564-0ff7-fc9b-cf9b31748785	2283	Zavrč
00050000-5564-0ff7-702f-c88ee771ed0d	8272	Zdole 
00050000-5564-0ff7-a9fd-abf263b81b88	4201	Zgornja Besnica
00050000-5564-0ff7-325f-6f1923b41719	2242	Zgornja Korena
00050000-5564-0ff7-59de-5086f34c43fc	2201	Zgornja Kungota
00050000-5564-0ff7-9404-70e467633109	2316	Zgornja Ložnica
00050000-5564-0ff7-bb9d-80ecf31def2e	2314	Zgornja Polskava
00050000-5564-0ff7-a99b-d8ecee403e8d	2213	Zgornja Velka
00050000-5564-0ff7-b28d-28c593c1dcee	4247	Zgornje Gorje
00050000-5564-0ff7-7a59-b1b51de3b4c6	4206	Zgornje Jezersko
00050000-5564-0ff7-c02f-96aa2d348651	2285	Zgornji Leskovec
00050000-5564-0ff7-b7ab-b7dfab2012a9	1432	Zidani Most
00050000-5564-0ff7-eb6c-ba5024cbf341	3214	Zreče
00050000-5564-0ff7-0d90-1d4adb429416	4209	Žabnica
00050000-5564-0ff7-5244-af2a3cfee1aa	3310	Žalec
00050000-5564-0ff7-2003-4ef305dd1654	4228	Železniki
00050000-5564-0ff7-c48a-fc69e6e068e9	2287	Žetale
00050000-5564-0ff7-08ea-d362278b7faa	4226	Žiri
00050000-5564-0ff7-7144-8fe3097a03a9	4274	Žirovnica
00050000-5564-0ff7-5617-1945daca027c	8360	Žužemberk
\.


--
-- TOC entry 2723 (class 0 OID 4984679)
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
-- TOC entry 2705 (class 0 OID 4984494)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2711 (class 0 OID 4984572)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2725 (class 0 OID 4984691)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2738 (class 0 OID 4984811)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2742 (class 0 OID 4984862)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, status) FROM stdin;
\.


--
-- TOC entry 2729 (class 0 OID 4984720)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
\.


--
-- TOC entry 2721 (class 0 OID 4984664)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2720 (class 0 OID 4984654)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2741 (class 0 OID 4984851)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2736 (class 0 OID 4984788)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2694 (class 0 OID 4984367)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5564-0ff8-f6d0-50092330e722	00010000-5564-0ff8-499c-d4184e49e26c	2015-05-26 08:17:29	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROBZPAJjXpDLYgHp1K69D./VTNw/Pq8qq";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2760 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2730 (class 0 OID 4984730)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2698 (class 0 OID 4984405)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5564-0ff8-7f33-5e433c4833e1	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-5564-0ff8-ba42-547d87c2ca68	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5564-0ff8-74ab-5c11951730a9	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5564-0ff8-ba39-16c78127a12d	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5564-0ff8-2b16-9a30a05ae889	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5564-0ff8-5434-dcbf31576bd4	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2696 (class 0 OID 4984389)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5564-0ff8-f6d0-50092330e722	00020000-5564-0ff8-ba39-16c78127a12d
00010000-5564-0ff8-499c-d4184e49e26c	00020000-5564-0ff8-ba39-16c78127a12d
\.


--
-- TOC entry 2732 (class 0 OID 4984744)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2724 (class 0 OID 4984685)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2718 (class 0 OID 4984635)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2750 (class 0 OID 4984957)
-- Dependencies: 230
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5564-0ff7-ce30-749b77ff48a2	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5564-0ff7-74eb-68b7ee28430c	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5564-0ff7-3422-2a749ebfcb33	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5564-0ff7-0a33-10843fe32710	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5564-0ff7-f39b-125a1195f258	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2749 (class 0 OID 4984950)
-- Dependencies: 229
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5564-0ff7-09b7-742355e824ad	00000000-5564-0ff7-0a33-10843fe32710	popa
00000000-5564-0ff7-5002-ff33cf624423	00000000-5564-0ff7-0a33-10843fe32710	oseba
00000000-5564-0ff7-7128-2d9806ddaa61	00000000-5564-0ff7-74eb-68b7ee28430c	prostor
00000000-5564-0ff7-ee15-cf50e3fa40d7	00000000-5564-0ff7-0a33-10843fe32710	besedilo
00000000-5564-0ff7-ec56-29a451aac7f3	00000000-5564-0ff7-0a33-10843fe32710	uprizoritev
00000000-5564-0ff7-f159-d1dfd1855094	00000000-5564-0ff7-0a33-10843fe32710	funkcija
00000000-5564-0ff7-a7c2-cb9adfbbbf06	00000000-5564-0ff7-0a33-10843fe32710	tipfunkcije
\.


--
-- TOC entry 2748 (class 0 OID 4984945)
-- Dependencies: 228
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2737 (class 0 OID 4984798)
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
-- TOC entry 2703 (class 0 OID 4984466)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2719 (class 0 OID 4984641)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
\.


--
-- TOC entry 2740 (class 0 OID 4984840)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5564-0ff7-5d6a-1c64b39a0aac	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5564-0ff7-8591-6de442b055ca	Igralec ali animator	Igralci in animatorji	\N	Igralka ali animatorka	igralec
000f0000-5564-0ff7-ad29-180d443ad441	Baletnik ali plesalec	Baletniki in plesalci	\N	Baletnica ali plesalka	igralec
000f0000-5564-0ff7-b6e8-3a664988b23d	Avtor	Avtorji	\N	Avtorka	umetnik
000f0000-5564-0ff7-6c38-1b5a9a2820c1	Režiser	Režiserji	\N	Režiserka	umetnik
000f0000-5564-0ff7-5e8b-60d8f6c6f06d	Scenograf	Scenografi	\N	Scenografka	tehnik
000f0000-5564-0ff7-639b-d5829d886074	Kostumograf	Kostumografi	\N	Kostumografinja	tehnik
000f0000-5564-0ff7-e3fe-494ce7fe0c1e	Oblikovalec maske	Oblikovalci maske	\N	Oblikovalka maske	tehnik
000f0000-5564-0ff7-23ce-ad662e628320	Avtor glasbe	Avtorji glasbe	\N	Avtorica glasbe	umetnik
000f0000-5564-0ff7-b5bb-907d9834420b	Oblikovalec svetlobe	Oblikovalci svetlobe	\N	Oblikovalka svetlobe	tehnik
000f0000-5564-0ff7-a92a-0af49e83d461	Koreograf	Koreografi	\N	Koreografinja	umetnik
000f0000-5564-0ff7-47e7-e301810513de	Dramaturg	Dramaturgi	\N	Dramaturginja	umetnik
000f0000-5564-0ff7-bc8c-950b7d34afe8	Lektorj	Lektorji	\N	Lektorica	umetnik
000f0000-5564-0ff7-d5e4-c49a60615dc6	Prevajalec	Prevajalci	\N	Prevajalka	umetnik
000f0000-5564-0ff7-6f9c-63db9b5240d8	Oblikovalec videa	Oblikovalci videa	\N	Oblikovalka videa	umetnik
000f0000-5564-0ff7-6e03-8d66d7fb5c0c	Intermedijski ustvarjalec	Intermedijski ustvarjalci	\N	Intermedijska ustvarjalka	umetnik
\.


--
-- TOC entry 2708 (class 0 OID 4984529)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2695 (class 0 OID 4984376)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5564-0ff8-499c-d4184e49e26c	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROLPnFNR0TMUuD6LKi48/b3gWWTvUY..q	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5564-0ff8-f6d0-50092330e722	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2745 (class 0 OID 4984895)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
\.


--
-- TOC entry 2713 (class 0 OID 4984587)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2728 (class 0 OID 4984712)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2735 (class 0 OID 4984780)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2715 (class 0 OID 4984619)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2744 (class 0 OID 4984885)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-5564-0ff7-989f-cab0c5ff84e1	Drama	drama (SURS 01)
00140000-5564-0ff7-e5f4-ec9d9643f922	Opera	opera (SURS 02)
00140000-5564-0ff7-3f04-b82974f9aa24	Balet	balet (SURS 03)
00140000-5564-0ff7-dae3-9725ef0a978c	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5564-0ff7-9819-0ec855880773	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5564-0ff7-0cc3-df15530dd033	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5564-0ff7-4b45-fb0024972b8f	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2734 (class 0 OID 4984770)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-5564-0ff7-a9af-831578fcc4dc	Opera	opera
00150000-5564-0ff7-238f-33f782a48d91	Opereta	opereta
00150000-5564-0ff7-a5c8-76b62e153a9b	Balet	balet
00150000-5564-0ff7-66b4-a8b1d332d6f4	Plesne prireditve	plesne prireditve
00150000-5564-0ff7-4cf5-eef40001e18b	Lutkovno gledališče	lutkovno gledališče
00150000-5564-0ff7-5e47-9f193b583e04	Raziskovalno gledališče	raziskovalno gledališče
00150000-5564-0ff7-c98c-5d6d8601c594	Biografska drama	biografska drama
00150000-5564-0ff7-12c5-3edb810a0fec	Komedija	komedija
00150000-5564-0ff7-727b-3d148c441a0f	Črna komedija	črna komedija
00150000-5564-0ff7-b748-0e3a3915c388	E-igra	E-igra
00150000-5564-0ff7-6f92-0a47170b6da6	Kriminalka	kriminalka
00150000-5564-0ff7-26ca-440a2ed9fe20	Musical	musical
\.


--
-- TOC entry 2315 (class 2606 OID 4984430)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 4984939)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 4984929)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 4984839)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 4984609)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 4984634)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 4984555)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 4984766)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2364 (class 2606 OID 4984585)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 4984628)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 4984569)
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
-- TOC entry 2407 (class 2606 OID 4984677)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 4984704)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 4984527)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 4984439)
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
-- TOC entry 2322 (class 2606 OID 4984462)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2313 (class 2606 OID 4984419)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2306 (class 2606 OID 4984404)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2422 (class 2606 OID 4984710)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2434 (class 2606 OID 4984743)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 4984880)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2331 (class 2606 OID 4984491)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 4984515)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 4984683)
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
-- TOC entry 2337 (class 2606 OID 4984505)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 4984576)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 4984695)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 4984823)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 4984867)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 4984727)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 4984668)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 4984659)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 4984861)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2453 (class 2606 OID 4984795)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2298 (class 2606 OID 4984375)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 4984734)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2304 (class 2606 OID 4984393)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2308 (class 2606 OID 4984413)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 4984752)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 4984690)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 4984640)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 4984963)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2500 (class 2606 OID 4984954)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 4984949)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2457 (class 2606 OID 4984808)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2328 (class 2606 OID 4984471)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 4984650)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2465 (class 2606 OID 4984850)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 4984540)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 4984388)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 4984910)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 4984594)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 4984718)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 4984786)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2381 (class 2606 OID 4984623)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 4984894)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2446 (class 2606 OID 4984779)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2371 (class 1259 OID 4984616)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2454 (class 1259 OID 4984809)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2455 (class 1259 OID 4984810)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2329 (class 1259 OID 4984493)
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
-- TOC entry 2420 (class 1259 OID 4984711)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2414 (class 1259 OID 4984697)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2415 (class 1259 OID 4984696)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2366 (class 1259 OID 4984595)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2442 (class 1259 OID 4984769)
-- Name: idx_23aeb9584dc36c21; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9584dc36c21 ON funkcija USING btree (tip_vloge_id);


--
-- TOC entry 2443 (class 1259 OID 4984767)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2444 (class 1259 OID 4984768)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2354 (class 1259 OID 4984571)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2355 (class 1259 OID 4984570)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2471 (class 1259 OID 4984882)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2472 (class 1259 OID 4984883)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2473 (class 1259 OID 4984884)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2479 (class 1259 OID 4984914)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2480 (class 1259 OID 4984911)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2481 (class 1259 OID 4984913)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2482 (class 1259 OID 4984912)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2344 (class 1259 OID 4984542)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2345 (class 1259 OID 4984541)
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
-- TOC entry 2320 (class 1259 OID 4984465)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2430 (class 1259 OID 4984735)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2384 (class 1259 OID 4984629)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2310 (class 1259 OID 4984420)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2311 (class 1259 OID 4984421)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2435 (class 1259 OID 4984755)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2436 (class 1259 OID 4984754)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2437 (class 1259 OID 4984753)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2358 (class 1259 OID 4984577)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2359 (class 1259 OID 4984579)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2360 (class 1259 OID 4984578)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2498 (class 1259 OID 4984956)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2394 (class 1259 OID 4984663)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2395 (class 1259 OID 4984661)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2396 (class 1259 OID 4984660)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2397 (class 1259 OID 4984662)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2301 (class 1259 OID 4984394)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2302 (class 1259 OID 4984395)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2423 (class 1259 OID 4984719)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2409 (class 1259 OID 4984684)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2450 (class 1259 OID 4984796)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2451 (class 1259 OID 4984797)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2333 (class 1259 OID 4984507)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2334 (class 1259 OID 4984506)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2335 (class 1259 OID 4984508)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2458 (class 1259 OID 4984824)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2459 (class 1259 OID 4984825)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2491 (class 1259 OID 4984942)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2492 (class 1259 OID 4984941)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2493 (class 1259 OID 4984944)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2494 (class 1259 OID 4984940)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2495 (class 1259 OID 4984943)
-- Name: idx_a4b7244fdbdb4006; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fdbdb4006 ON alternacija USING btree (koprodukcija_delitev_id);


--
-- TOC entry 2447 (class 1259 OID 4984787)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2400 (class 1259 OID 4984672)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2401 (class 1259 OID 4984671)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2402 (class 1259 OID 4984669)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2403 (class 1259 OID 4984670)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2284 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2487 (class 1259 OID 4984931)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2488 (class 1259 OID 4984930)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2365 (class 1259 OID 4984586)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2316 (class 1259 OID 4984441)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2317 (class 1259 OID 4984440)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2325 (class 1259 OID 4984472)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2326 (class 1259 OID 4984473)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2389 (class 1259 OID 4984653)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2390 (class 1259 OID 4984652)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2391 (class 1259 OID 4984651)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2372 (class 1259 OID 4984618)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2373 (class 1259 OID 4984614)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2374 (class 1259 OID 4984611)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2375 (class 1259 OID 4984612)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2376 (class 1259 OID 4984610)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2377 (class 1259 OID 4984615)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2378 (class 1259 OID 4984613)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2332 (class 1259 OID 4984492)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2350 (class 1259 OID 4984556)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2351 (class 1259 OID 4984558)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2352 (class 1259 OID 4984557)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2353 (class 1259 OID 4984559)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2408 (class 1259 OID 4984678)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2476 (class 1259 OID 4984881)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2323 (class 1259 OID 4984463)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2324 (class 1259 OID 4984464)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2504 (class 1259 OID 4984964)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2343 (class 1259 OID 4984528)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2501 (class 1259 OID 4984955)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2428 (class 1259 OID 4984729)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2429 (class 1259 OID 4984728)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2287 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2340 (class 1259 OID 4984516)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2470 (class 1259 OID 4984868)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2309 (class 1259 OID 4984414)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2379 (class 1259 OID 4984617)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2530 (class 2606 OID 4985102)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2533 (class 2606 OID 4985087)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2532 (class 2606 OID 4985092)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2528 (class 2606 OID 4985112)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2534 (class 2606 OID 4985082)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2529 (class 2606 OID 4985107)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2531 (class 2606 OID 4985097)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2564 (class 2606 OID 4985257)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2563 (class 2606 OID 4985262)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2515 (class 2606 OID 4985017)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2551 (class 2606 OID 4985197)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2549 (class 2606 OID 4985192)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2550 (class 2606 OID 4985187)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2527 (class 2606 OID 4985077)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2557 (class 2606 OID 4985237)
-- Name: fk_23aeb9584dc36c21; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9584dc36c21 FOREIGN KEY (tip_vloge_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2559 (class 2606 OID 4985227)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2558 (class 2606 OID 4985232)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2521 (class 2606 OID 4985052)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2522 (class 2606 OID 4985047)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2547 (class 2606 OID 4985177)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2570 (class 2606 OID 4985282)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2569 (class 2606 OID 4985287)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2568 (class 2606 OID 4985292)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2571 (class 2606 OID 4985312)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2574 (class 2606 OID 4985297)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2572 (class 2606 OID 4985307)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2573 (class 2606 OID 4985302)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2519 (class 2606 OID 4985042)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2520 (class 2606 OID 4985037)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2511 (class 2606 OID 4985002)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2512 (class 2606 OID 4984997)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2553 (class 2606 OID 4985207)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2535 (class 2606 OID 4985117)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2508 (class 2606 OID 4984977)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2507 (class 2606 OID 4984982)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2554 (class 2606 OID 4985222)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2555 (class 2606 OID 4985217)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2556 (class 2606 OID 4985212)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2525 (class 2606 OID 4985057)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2523 (class 2606 OID 4985067)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2524 (class 2606 OID 4985062)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2582 (class 2606 OID 4985352)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2539 (class 2606 OID 4985152)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2541 (class 2606 OID 4985142)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2542 (class 2606 OID 4985137)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2540 (class 2606 OID 4985147)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2506 (class 2606 OID 4984967)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2505 (class 2606 OID 4984972)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2552 (class 2606 OID 4985202)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2548 (class 2606 OID 4985182)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2562 (class 2606 OID 4985247)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2561 (class 2606 OID 4985252)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2517 (class 2606 OID 4985027)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2518 (class 2606 OID 4985022)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2516 (class 2606 OID 4985032)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2566 (class 2606 OID 4985267)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2565 (class 2606 OID 4985272)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2579 (class 2606 OID 4985337)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2580 (class 2606 OID 4985332)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2577 (class 2606 OID 4985347)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2581 (class 2606 OID 4985327)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2578 (class 2606 OID 4985342)
-- Name: fk_a4b7244fdbdb4006; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fdbdb4006 FOREIGN KEY (koprodukcija_delitev_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2560 (class 2606 OID 4985242)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2543 (class 2606 OID 4985172)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2544 (class 2606 OID 4985167)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2546 (class 2606 OID 4985157)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2545 (class 2606 OID 4985162)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2575 (class 2606 OID 4985322)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2576 (class 2606 OID 4985317)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2526 (class 2606 OID 4985072)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2567 (class 2606 OID 4985277)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2509 (class 2606 OID 4984992)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2510 (class 2606 OID 4984987)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2514 (class 2606 OID 4985007)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2513 (class 2606 OID 4985012)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2536 (class 2606 OID 4985132)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2537 (class 2606 OID 4985127)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2538 (class 2606 OID 4985122)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-05-26 08:17:29 CEST

--
-- PostgreSQL database dump complete
--

