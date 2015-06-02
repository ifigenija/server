--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-06-02 16:54:16 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 239 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2841 (class 0 OID 0)
-- Dependencies: 239
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 6140009)
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
-- TOC entry 227 (class 1259 OID 6140526)
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
-- TOC entry 226 (class 1259 OID 6140509)
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
-- TOC entry 219 (class 1259 OID 6140418)
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
-- TOC entry 194 (class 1259 OID 6140188)
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
-- TOC entry 197 (class 1259 OID 6140222)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6140131)
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
-- TOC entry 228 (class 1259 OID 6140540)
-- Name: enotaprograma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE enotaprograma (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    tip_programske_enote_id integer,
    program_dela_id uuid,
    celotnavrednost numeric(15,2) DEFAULT 0::numeric NOT NULL,
    zaproseno numeric(15,2) DEFAULT 0::numeric NOT NULL,
    lastnasredstva numeric(15,2) DEFAULT 0::numeric NOT NULL,
    avtorskihonorarji numeric(10,0) DEFAULT 0::numeric NOT NULL,
    tantieme numeric(15,2) DEFAULT 0::numeric NOT NULL,
    drugiviri numeric(10,0) DEFAULT 0::numeric NOT NULL,
    drugijavni numeric(10,0) DEFAULT 0::numeric NOT NULL,
    obiskdoma integer DEFAULT 0 NOT NULL,
    obiskgost integer DEFAULT 0 NOT NULL,
    obiskzamejo integer DEFAULT 0 NOT NULL,
    obiskint integer DEFAULT 0 NOT NULL,
    ponovidoma integer DEFAULT 0 NOT NULL,
    ponovizamejo integer DEFAULT 0 NOT NULL,
    ponovigost integer DEFAULT 0 NOT NULL,
    ponoviint integer DEFAULT 0 NOT NULL,
    utemeljitev text NOT NULL,
    tip character varying(15) NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 6140348)
-- Name: funkcija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE funkcija (
    id uuid NOT NULL,
    uprizoritev_id uuid NOT NULL,
    alternacija_id uuid,
    podrocje character varying(20) DEFAULT NULL::character varying,
    vodjaekipe boolean,
    naziv character varying(255) DEFAULT NULL::character varying,
    komentar character varying(255) DEFAULT NULL::character varying,
    velikost character varying(255) DEFAULT NULL::character varying,
    pomembna boolean NOT NULL,
    sort integer,
    seplanira boolean NOT NULL,
    dovoliprekrivanje boolean NOT NULL,
    maxprekrivanj integer,
    tipfunkcije_id uuid
);


--
-- TOC entry 192 (class 1259 OID 6140168)
-- Name: gostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostovanje (
    id uuid NOT NULL,
    drzava_id uuid NOT NULL,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zamejstvo boolean,
    kraj character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 196 (class 1259 OID 6140216)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6140148)
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
-- TOC entry 202 (class 1259 OID 6140265)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6140290)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6140105)
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
-- TOC entry 181 (class 1259 OID 6140018)
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
-- TOC entry 182 (class 1259 OID 6140029)
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
-- TOC entry 177 (class 1259 OID 6139983)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6140002)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6140297)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6140328)
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
-- TOC entry 223 (class 1259 OID 6140462)
-- Name: pogodba; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pogodba (
    id uuid NOT NULL,
    oseba_id uuid,
    popa_id uuid,
    trr_id uuid,
    sifra character varying(7) NOT NULL,
    vrednostdo numeric(12,2) DEFAULT NULL::numeric,
    zacetek date,
    konec date,
    vrednostvaje numeric(12,2) DEFAULT NULL::numeric,
    vrednostpredstave numeric(12,2) DEFAULT NULL::numeric,
    vrednosture numeric(12,2) DEFAULT NULL::numeric,
    aktivna boolean,
    opis text
);


--
-- TOC entry 184 (class 1259 OID 6140062)
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
-- TOC entry 186 (class 1259 OID 6140097)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6140271)
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
-- TOC entry 185 (class 1259 OID 6140082)
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
-- TOC entry 191 (class 1259 OID 6140160)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6140283)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6140403)
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
-- TOC entry 222 (class 1259 OID 6140454)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6140566)
-- Name: programdela; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programdela (
    id uuid NOT NULL,
    sezona_id uuid,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    zacetek date NOT NULL,
    konec date NOT NULL,
    potrjenprogram boolean NOT NULL
);


--
-- TOC entry 232 (class 1259 OID 6140594)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id integer NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 238 (class 1259 OID 6140624)
-- Name: programfestival_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programfestival_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 230 (class 1259 OID 6140575)
-- Name: programgostovanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programgostovanje (
    id integer NOT NULL,
    program_dela_id uuid,
    gostitelj_id uuid,
    transportnistroski numeric(15,2) NOT NULL,
    odkup numeric(15,2) DEFAULT NULL::numeric
);


--
-- TOC entry 236 (class 1259 OID 6140620)
-- Name: programgostovanje_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programgostovanje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 209 (class 1259 OID 6140312)
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
-- TOC entry 201 (class 1259 OID 6140256)
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
-- TOC entry 200 (class 1259 OID 6140246)
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
-- TOC entry 221 (class 1259 OID 6140443)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6140380)
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
-- TOC entry 174 (class 1259 OID 6139954)
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
-- TOC entry 173 (class 1259 OID 6139952)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 6140322)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6139992)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6139976)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6140336)
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
-- TOC entry 204 (class 1259 OID 6140277)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6140227)
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
-- TOC entry 235 (class 1259 OID 6140612)
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
-- TOC entry 234 (class 1259 OID 6140605)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 6140600)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 6140390)
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
-- TOC entry 183 (class 1259 OID 6140054)
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
-- TOC entry 199 (class 1259 OID 6140233)
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
-- TOC entry 220 (class 1259 OID 6140432)
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
-- TOC entry 231 (class 1259 OID 6140583)
-- Name: tipprogramskeenote; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipprogramskeenote (
    id integer NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    koprodukcija boolean DEFAULT false NOT NULL,
    maxfaktor numeric(10,0) DEFAULT 1::numeric NOT NULL,
    maxvsi numeric(10,0) DEFAULT 0::numeric NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 6140622)
-- Name: tipprogramskeenote_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipprogramskeenote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 188 (class 1259 OID 6140117)
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
-- TOC entry 175 (class 1259 OID 6139963)
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
-- TOC entry 225 (class 1259 OID 6140488)
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
-- TOC entry 193 (class 1259 OID 6140179)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6140304)
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
-- TOC entry 215 (class 1259 OID 6140373)
-- Name: zaposlitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zaposlitev (
    id uuid NOT NULL,
    oseba_id uuid,
    sifra character varying(10) NOT NULL,
    status character varying(10) NOT NULL,
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
-- TOC entry 195 (class 1259 OID 6140211)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6140478)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 6140363)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2174 (class 2604 OID 6139957)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2776 (class 0 OID 6140009)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 6140526)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
000c0000-556d-c397-7e1e-30aadb1068f6	000d0000-556d-c397-4ef5-3203348a0f66	\N	00090000-556d-c397-3a2e-297b9e227db3	\N	\N	0001	f	\N	\N	\N	\N	\N	\N
000c0000-556d-c397-2d42-51c0c48ea885	000d0000-556d-c397-8809-f548dbe5ebea	\N	00090000-556d-c397-e2a1-1eafe1e24632	\N	\N	0002	f	\N	\N	\N	\N	\N	\N
000c0000-556d-c397-e11b-8435c5df31ad	000d0000-556d-c397-cda5-47a574bffb3d	\N	00090000-556d-c397-9d4c-f52fa1c690bb	\N	\N	0003	f	\N	\N	\N	\N	\N	\N
000c0000-556d-c397-0eb7-0dfe2f226363	000d0000-556d-c397-9446-a8ed15530e58	\N	00090000-556d-c397-4fdf-8064cffc1dcf	\N	\N	0004	f	\N	\N	\N	\N	\N	\N
000c0000-556d-c397-d91e-73221cb0c280	000d0000-556d-c397-de79-52059ae26423	\N	00090000-556d-c397-8242-9267c1a21459	\N	\N	0005	f	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2822 (class 0 OID 6140509)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2815 (class 0 OID 6140418)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-556d-c397-efd0-6b8f348c3e77	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-556d-c397-bf60-6c681edb854d	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-556d-c397-1b61-d91b96c233da	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 2790 (class 0 OID 6140188)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-556d-c397-e75a-8de213776ca7	\N	\N	00200000-556d-c397-0700-281db5c8f4dc	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	4			
00180000-556d-c397-0448-77ee818318ce	\N	\N	00200000-556d-c397-00b1-1f4d98b5dd20	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-556d-c397-4399-35d85a2f4603	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
\.


--
-- TOC entry 2793 (class 0 OID 6140222)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2785 (class 0 OID 6140131)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-556d-c396-a1be-a549297ac801	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-556d-c396-f23d-4e8c4161d5f3	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-556d-c396-5082-d91b6e12bb58	AL	ALB	008	Albania 	Albanija	\N
00040000-556d-c396-59ba-850748d39dd1	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-556d-c396-141c-32bc5db2526c	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-556d-c396-1b89-ac07287659c2	AD	AND	020	Andorra 	Andora	\N
00040000-556d-c396-dcbb-0c53f683bc43	AO	AGO	024	Angola 	Angola	\N
00040000-556d-c396-466e-94eccd6ce477	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-556d-c396-fab0-fd8a4f581c43	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-556d-c396-b9c7-e5b9eada5874	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-556d-c396-4641-f044590c5be8	AR	ARG	032	Argentina 	Argenitna	\N
00040000-556d-c396-14a5-0ff8b2d7779e	AM	ARM	051	Armenia 	Armenija	\N
00040000-556d-c396-e7cb-a4729a7bb36c	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-556d-c396-2d84-28f04d64397f	AU	AUS	036	Australia 	Avstralija	\N
00040000-556d-c396-1b53-64df59f42f76	AT	AUT	040	Austria 	Avstrija	\N
00040000-556d-c396-3693-283a661f5f35	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-556d-c396-b41e-3d67126ed767	BS	BHS	044	Bahamas 	Bahami	\N
00040000-556d-c396-95a6-e24bb436127b	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-556d-c396-bb4e-6d33937b387f	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-556d-c396-537c-4f7615ff1df7	BB	BRB	052	Barbados 	Barbados	\N
00040000-556d-c396-27ff-13c540e10ad6	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-556d-c396-706a-4f8511420722	BE	BEL	056	Belgium 	Belgija	\N
00040000-556d-c396-b8b7-39e31927616d	BZ	BLZ	084	Belize 	Belize	\N
00040000-556d-c396-c198-32c3be54e4fd	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-556d-c396-bc6a-f154c93a5c9a	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-556d-c396-5e2b-fc7fafc6f028	BT	BTN	064	Bhutan 	Butan	\N
00040000-556d-c396-34fd-977c6c3003bb	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-556d-c396-b08b-59aa52e1e0b7	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-556d-c396-bf78-176d8bbe5155	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-556d-c396-8a82-759ca6d6ebf7	BW	BWA	072	Botswana 	Bocvana	\N
00040000-556d-c396-0486-f72a23a9d597	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-556d-c396-48de-24a2b69a7454	BR	BRA	076	Brazil 	Brazilija	\N
00040000-556d-c396-621d-e1d05a3a3920	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-556d-c396-0904-2e4379b9440e	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-556d-c396-ae1c-f7b3e490b86c	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-556d-c396-453f-a972baca54bd	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-556d-c396-5f24-efdaca157324	BI	BDI	108	Burundi 	Burundi 	\N
00040000-556d-c396-9c4f-84caf6e0a4fe	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-556d-c396-3498-ad2924213783	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-556d-c396-3181-a13558eb5e9e	CA	CAN	124	Canada 	Kanada	\N
00040000-556d-c396-06fa-1519215be9d4	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-556d-c396-7b7c-0d427dd0bf2c	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-556d-c396-1466-56068fd108ae	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-556d-c396-e0c4-1fcca9ea8e3b	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-556d-c396-ab75-45cd9808b564	CL	CHL	152	Chile 	Čile	\N
00040000-556d-c396-3ec1-46a5b6c3a839	CN	CHN	156	China 	Kitajska	\N
00040000-556d-c396-393e-fce6c87b0a93	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-556d-c396-c372-652477c19577	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-556d-c396-82f8-615431e099ae	CO	COL	170	Colombia 	Kolumbija	\N
00040000-556d-c396-d23b-95c96825cbcd	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-556d-c396-ff98-3aa48042bf6a	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-556d-c396-7261-3284f2dc0db8	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-556d-c396-40ea-36cbc5f64c55	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-556d-c396-fb0b-cc04387b98c6	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-556d-c396-f59f-1fd99c20e66d	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-556d-c396-c536-4cb4baaf2e2d	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-556d-c396-01e6-2144dd6ae4de	CU	CUB	192	Cuba 	Kuba	\N
00040000-556d-c396-d905-6d34cd630bad	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-556d-c396-78ae-7a4af2cabc55	CY	CYP	196	Cyprus 	Ciper	\N
00040000-556d-c396-0dc3-213766b7351a	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-556d-c396-8c61-592f0d87320f	DK	DNK	208	Denmark 	Danska	\N
00040000-556d-c396-4db9-4fc01138f789	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-556d-c396-4f3d-839c759d3094	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-556d-c396-220d-2ad86848795e	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-556d-c396-fae5-06a986a24467	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-556d-c396-0dd4-79dd7c4612b8	EG	EGY	818	Egypt 	Egipt	\N
00040000-556d-c396-ad7c-061cd24d4681	SV	SLV	222	El Salvador 	Salvador	\N
00040000-556d-c396-c6b8-f54d2db7b843	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-556d-c396-0494-c09b756581df	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-556d-c396-8017-966591b505ca	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-556d-c396-bb0b-faed51a3a867	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-556d-c396-dc9b-9f80d6021bbe	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-556d-c396-2e79-96f462a21935	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-556d-c396-a8f8-787848766dfa	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-556d-c396-32cb-b232ffa94fcc	FI	FIN	246	Finland 	Finska	\N
00040000-556d-c396-8518-57a13e02e746	FR	FRA	250	France 	Francija	\N
00040000-556d-c396-62c4-55d814630a0f	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-556d-c396-3ab3-49c853c561f4	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-556d-c396-29e4-737fcb0f880d	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-556d-c396-bddd-165bd96eb59e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-556d-c396-9755-5d334505cacf	GA	GAB	266	Gabon 	Gabon	\N
00040000-556d-c396-e012-bfdbacacf122	GM	GMB	270	Gambia 	Gambija	\N
00040000-556d-c396-1d6f-7a2c805e4b16	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-556d-c396-5b77-e620201d26a5	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-556d-c396-054b-536a7c8bf046	GH	GHA	288	Ghana 	Gana	\N
00040000-556d-c396-43dd-afd3dea1fb11	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-556d-c396-479c-a9217df89a7a	GR	GRC	300	Greece 	Grčija	\N
00040000-556d-c396-17d8-758c1d8c7ee2	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-556d-c396-5047-8f1c06bd3410	GD	GRD	308	Grenada 	Grenada	\N
00040000-556d-c396-3d36-1ebd249feb40	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-556d-c396-09bf-2d41c2dca1aa	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-556d-c396-c9cf-313c1b672c47	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-556d-c396-ae7d-027e799dec6f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-556d-c396-8b00-c74d47045783	GN	GIN	324	Guinea 	Gvineja	\N
00040000-556d-c396-ad9c-1ae599e5e4f4	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-556d-c396-0c1f-92239629ef92	GY	GUY	328	Guyana 	Gvajana	\N
00040000-556d-c396-2937-9e8a834bb8ba	HT	HTI	332	Haiti 	Haiti	\N
00040000-556d-c396-f91c-b0c4046d4cb0	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-556d-c396-80c1-a3fb000c9bc0	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-556d-c396-518f-b72c8166149d	HN	HND	340	Honduras 	Honduras	\N
00040000-556d-c396-9576-3a0b01418c63	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-556d-c396-33fa-7725ff3db89d	HU	HUN	348	Hungary 	Madžarska	\N
00040000-556d-c396-3c36-1fa6541cc215	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-556d-c396-5a36-8cbe4bc41497	IN	IND	356	India 	Indija	\N
00040000-556d-c396-1dd2-b5d18cecca7e	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-556d-c396-732c-85306476e805	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-556d-c396-dea4-5f4d5c3413b0	IQ	IRQ	368	Iraq 	Irak	\N
00040000-556d-c396-00fb-762723dd9aff	IE	IRL	372	Ireland 	Irska	\N
00040000-556d-c396-7e94-8d9c771abf6f	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-556d-c396-e6d8-9be0b11a3175	IL	ISR	376	Israel 	Izrael	\N
00040000-556d-c396-9397-fe96f29542c7	IT	ITA	380	Italy 	Italija	\N
00040000-556d-c396-a9dd-b74ec82a53df	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-556d-c396-c7ec-73239168999b	JP	JPN	392	Japan 	Japonska	\N
00040000-556d-c396-9591-ae856945e7f0	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-556d-c396-c313-49b2f8dab7d0	JO	JOR	400	Jordan 	Jordanija	\N
00040000-556d-c396-be29-96b14769f3bb	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-556d-c396-e79d-b88df80dfd9b	KE	KEN	404	Kenya 	Kenija	\N
00040000-556d-c396-1958-64dea01b5983	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-556d-c396-ae1c-c909f3d4d5a4	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-556d-c396-f4d0-e55b0518b70f	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-556d-c396-522b-6f96b9e8034b	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-556d-c396-3fbc-38a894c7ca6b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-556d-c396-bb6d-b806e3725ab4	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-556d-c396-627b-ccd416be49a4	LV	LVA	428	Latvia 	Latvija	\N
00040000-556d-c396-0855-cf6b295b92a4	LB	LBN	422	Lebanon 	Libanon	\N
00040000-556d-c396-bf0e-8b07b740f91f	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-556d-c396-8f77-35b44d4d4a32	LR	LBR	430	Liberia 	Liberija	\N
00040000-556d-c396-820d-4affac41e207	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-556d-c396-729c-4bf3c58439f9	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-556d-c396-2c5b-ad219b5aef41	LT	LTU	440	Lithuania 	Litva	\N
00040000-556d-c396-3dbe-e0b14cec3eae	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-556d-c396-4ef4-12820cdaf39f	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-556d-c396-f9ca-f149a753104a	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-556d-c396-7891-a97acfe5f45b	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-556d-c396-7930-d304eb729099	MW	MWI	454	Malawi 	Malavi	\N
00040000-556d-c396-f56d-f532742644ff	MY	MYS	458	Malaysia 	Malezija	\N
00040000-556d-c396-49c3-70f93f3089aa	MV	MDV	462	Maldives 	Maldivi	\N
00040000-556d-c396-49c1-31f24cd93e56	ML	MLI	466	Mali 	Mali	\N
00040000-556d-c396-8544-4880dd315ef9	MT	MLT	470	Malta 	Malta	\N
00040000-556d-c396-3b15-cecb5f8ddbc8	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-556d-c396-fdc1-951cf49c8f42	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-556d-c396-2ad7-c7bb19d6f2d8	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-556d-c396-e482-86d6b43c0cbe	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-556d-c396-64ef-fdbebc1e3f6a	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-556d-c396-0bce-28dda0e7ea77	MX	MEX	484	Mexico 	Mehika	\N
00040000-556d-c396-9197-d7ad4eb7bf3c	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-556d-c396-e68a-cc65e1a8a852	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-556d-c396-4d51-4c3c8c764b58	MC	MCO	492	Monaco 	Monako	\N
00040000-556d-c396-10d8-3127188c081f	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-556d-c396-9843-837193f10629	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-556d-c396-6612-1d464404f8b6	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-556d-c396-2549-2bf6ea8e4cb1	MA	MAR	504	Morocco 	Maroko	\N
00040000-556d-c396-ab0c-88d84f67cb70	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-556d-c396-c04f-1b5cdf2aec1b	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-556d-c396-dc22-404df595d6ff	NA	NAM	516	Namibia 	Namibija	\N
00040000-556d-c396-1dde-89f2418e7078	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-556d-c396-d714-bdb141963e8b	NP	NPL	524	Nepal 	Nepal	\N
00040000-556d-c396-2a39-0079f63ea156	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-556d-c396-42fa-bff6abd6d724	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-556d-c396-ebbc-6393bf46beaa	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-556d-c396-9d24-737fd66e9158	NE	NER	562	Niger 	Niger 	\N
00040000-556d-c396-71a6-5ab9a66ebd87	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-556d-c396-80d3-5991414b6add	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-556d-c396-1167-a416df86332c	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-556d-c396-27c2-bfa1326d16b2	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-556d-c396-2866-49fb87ab367d	NO	NOR	578	Norway 	Norveška	\N
00040000-556d-c396-e180-779ba949cd48	OM	OMN	512	Oman 	Oman	\N
00040000-556d-c396-4675-7847fde1390c	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-556d-c396-20a2-d2328c30cc50	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-556d-c396-0ffd-a5c2384700c2	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-556d-c396-4023-1301f8eacdf9	PA	PAN	591	Panama 	Panama	\N
00040000-556d-c396-bab4-495fc2e66ae7	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-556d-c396-afdc-d11cdf0a9569	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-556d-c396-1242-0f748eea456f	PE	PER	604	Peru 	Peru	\N
00040000-556d-c396-3ffc-1d4d77789af2	PH	PHL	608	Philippines 	Filipini	\N
00040000-556d-c396-4186-797dfe8b32ab	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-556d-c396-6810-54bcfeeffef1	PL	POL	616	Poland 	Poljska	\N
00040000-556d-c396-b92c-3450fdd35115	PT	PRT	620	Portugal 	Portugalska	\N
00040000-556d-c396-719e-1a6320af110c	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-556d-c396-72dc-a97b3e18b25e	QA	QAT	634	Qatar 	Katar	\N
00040000-556d-c396-fd1f-5209611b2c63	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-556d-c396-9b1b-939a965a02ee	RO	ROU	642	Romania 	Romunija	\N
00040000-556d-c396-a1b4-e4698912a381	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-556d-c396-241d-160f07b0a3bd	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-556d-c396-9ba1-250ee452c820	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-556d-c396-e0b7-2e22b7ed1834	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-556d-c396-033e-28b6d2d29bab	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-556d-c396-c933-5d42c0788259	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-556d-c396-0db5-5d3b117fde7e	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-556d-c396-c6b1-317a1aba6a42	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-556d-c396-7117-646bff92f3b4	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-556d-c396-f3fa-a69a28bd7e3b	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-556d-c396-fbda-6f145110a499	SM	SMR	674	San Marino 	San Marino	\N
00040000-556d-c396-2627-2012018c3802	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-556d-c396-48f4-211540a2a283	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-556d-c396-a72c-d6488303c553	SN	SEN	686	Senegal 	Senegal	\N
00040000-556d-c396-a2e6-b1ac5172331d	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-556d-c396-69c6-3205ccaf75ca	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-556d-c396-5a24-524818f1eb02	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-556d-c396-c225-aaf358507e2a	SG	SGP	702	Singapore 	Singapur	\N
00040000-556d-c396-f133-584d8a0d83b9	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-556d-c396-95fa-21e5d60211bb	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-556d-c396-cf97-5b057a305acd	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-556d-c396-8324-2e440b749701	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-556d-c396-d6de-16dcba96e16f	SO	SOM	706	Somalia 	Somalija	\N
00040000-556d-c396-e39e-fb54625ec452	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-556d-c396-7c54-42fab95bff3b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-556d-c396-49c7-3645abcd2374	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-556d-c396-2c26-1125d3d70443	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-556d-c396-bb74-e9c68adede6b	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-556d-c396-440d-701bb3649211	SD	SDN	729	Sudan 	Sudan	\N
00040000-556d-c396-d58e-f3fc23b764c9	SR	SUR	740	Suriname 	Surinam	\N
00040000-556d-c396-1651-b8f14427e684	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-556d-c396-4c04-37d365f0eaff	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-556d-c396-d1ed-ab0781356ca5	SE	SWE	752	Sweden 	Švedska	\N
00040000-556d-c396-4eb9-e74efe2b4da0	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-556d-c396-3799-1693dbeae22e	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-556d-c396-0a19-be52097dcc95	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-556d-c396-4c0c-3799412d384c	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-556d-c396-9f73-630b6e1d961c	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-556d-c396-4db5-3a1c2bf270e9	TH	THA	764	Thailand 	Tajska	\N
00040000-556d-c396-d39b-b837afb2bb7b	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-556d-c396-399c-2b24009fa654	TG	TGO	768	Togo 	Togo	\N
00040000-556d-c396-62bc-4687551815cf	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-556d-c396-b28d-bde000fa9de0	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-556d-c396-5e7c-962757952e1d	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-556d-c396-3def-48af131254c4	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-556d-c396-e6ed-1c6b5f66fd9d	TR	TUR	792	Turkey 	Turčija	\N
00040000-556d-c396-d1c9-7a4bb99d8627	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-556d-c396-8092-f71d1c85aeb8	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-556d-c396-a4d2-52ee98ae9dba	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-556d-c396-b976-39ccb3aca8ee	UG	UGA	800	Uganda 	Uganda	\N
00040000-556d-c396-435c-c5095bdd41b2	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-556d-c396-c91d-8a40a06d9887	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-556d-c396-92fe-de9b206b117b	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-556d-c396-972b-9a0306b86731	US	USA	840	United States 	Združene države Amerike	\N
00040000-556d-c396-fb6a-cc3556fef62f	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-556d-c396-3c07-b4c34c856cd9	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-556d-c396-96fb-d8992e84857a	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-556d-c396-0a55-85efbf149862	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-556d-c396-ac40-9178d4a812f9	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-556d-c396-6efe-baf2bd235a64	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-556d-c396-ed56-9f31d7ac1508	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-556d-c396-4ce9-07f44fb4cb65	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-556d-c396-8880-656277b522ef	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-556d-c396-877a-1876b79d24a0	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-556d-c396-9c3c-6200063a511b	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-556d-c396-cea0-0d2e897dd8a5	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-556d-c396-62dc-0673b0f9495c	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2824 (class 0 OID 6140540)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, tip_programske_enote_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tip) FROM stdin;
\.


--
-- TOC entry 2809 (class 0 OID 6140348)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-556d-c397-bcf1-7fe2264fcafc	000e0000-556d-c397-ab81-6c545e08e13f	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-556d-c396-a56f-94078fd68475
000d0000-556d-c397-4ef5-3203348a0f66	000e0000-556d-c397-ab81-6c545e08e13f	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-556d-c396-a56f-94078fd68475
000d0000-556d-c397-8809-f548dbe5ebea	000e0000-556d-c397-ab81-6c545e08e13f	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-556d-c396-eb88-415dff86f257
000d0000-556d-c397-cda5-47a574bffb3d	000e0000-556d-c397-ab81-6c545e08e13f	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-556d-c396-0844-cb7826bf76e5
000d0000-556d-c397-9446-a8ed15530e58	000e0000-556d-c397-ab81-6c545e08e13f	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-556d-c396-0844-cb7826bf76e5
000d0000-556d-c397-de79-52059ae26423	000e0000-556d-c397-ab81-6c545e08e13f	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-556d-c396-0844-cb7826bf76e5
\.


--
-- TOC entry 2788 (class 0 OID 6140168)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2792 (class 0 OID 6140216)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2786 (class 0 OID 6140148)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
\.


--
-- TOC entry 2766 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2798 (class 0 OID 6140265)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2802 (class 0 OID 6140290)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2783 (class 0 OID 6140105)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-556d-c396-d041-dc7a4dc2d463	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-556d-c396-d568-f7653bbcf85a	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-556d-c396-54cc-f4d62fbbc155	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-556d-c396-7230-fb6cba5274d2	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-556d-c396-f6e6-71529189ec04	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-556d-c396-95d6-216eb5c11d96	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-556d-c396-5b51-1ad2a3e9da17	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-556d-c396-5663-0cfbac8fd319	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-556d-c396-4054-37d7f8a6427e	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-556d-c396-b0b3-d5fa431cb2a2	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-556d-c396-3194-d98a063ca5ec	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-556d-c396-f877-0c168d5165fb	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-556d-c396-1ca6-ecdb5636d665	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-556d-c396-288c-ac3ae3519430	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-556d-c396-bfcf-6aa82546bec3	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-556d-c396-567f-cfbe66bd7760	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2777 (class 0 OID 6140018)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-556d-c396-3ad0-9c98c07e37b5	00000000-556d-c396-f6e6-71529189ec04	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-556d-c396-cfd5-efebd7024722	00000000-556d-c396-f6e6-71529189ec04	00010000-556d-c396-e45c-8d354b9e2049	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-556d-c396-620f-82cf24027387	00000000-556d-c396-95d6-216eb5c11d96	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2778 (class 0 OID 6140029)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-556d-c397-ae0d-ff51a1dec5f6	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-556d-c397-4fdf-8064cffc1dcf	00010000-556d-c397-1ab6-be02dcc8d082	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-556d-c397-9d4c-f52fa1c690bb	00010000-556d-c397-b064-3855f1427f6c	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-556d-c397-e6f0-8163c49a69a5	00010000-556d-c397-abaf-d24e3cf47501	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-556d-c397-72f1-77a3298500f5	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-556d-c397-2a75-fe1078cf4a1e	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-556d-c397-fe59-912d1a73d0ff	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-556d-c397-7146-5138af6bbaa4	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-556d-c397-3a2e-297b9e227db3	00010000-556d-c397-0bd8-09f9a97ff271	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-556d-c397-e2a1-1eafe1e24632	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-556d-c397-fa76-00787a092807	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-556d-c397-8242-9267c1a21459	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-556d-c397-fb61-5973a4f2f83a	00010000-556d-c397-04e2-17dd1bea4ddf	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2768 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2773 (class 0 OID 6139983)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-556d-c396-bfc9-7b14845c245a	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-556d-c396-0e59-f48446214de3	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-556d-c396-a10b-385c42197a3b	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-556d-c396-8a71-92a329bc95f5	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-556d-c396-6992-bc638cd7e6d1	Abonma-read	Abonma - branje	f
00030000-556d-c396-5193-138e4e57faa8	Abonma-write	Abonma - spreminjanje	f
00030000-556d-c396-5370-9515cea6936d	Alternacija-read	Alternacija - branje	f
00030000-556d-c396-cf8d-cc6ec47da719	Alternacija-write	Alternacija - spreminjanje	f
00030000-556d-c396-87c0-fe7d15fda759	Arhivalija-read	Arhivalija - branje	f
00030000-556d-c396-b94d-4fbfdd599eec	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-556d-c396-73e8-8621d83a6df8	Besedilo-read	Besedilo - branje	f
00030000-556d-c396-610b-81f9bd17f5e9	Besedilo-write	Besedilo - spreminjanje	f
00030000-556d-c396-d41d-2d7c95fc6837	DogodekIzven-read	DogodekIzven - branje	f
00030000-556d-c396-27ff-4aece3c20402	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-556d-c396-955a-c66c147c147f	Dogodek-read	Dogodek - branje	f
00030000-556d-c396-e809-1e5a6d221a71	Dogodek-write	Dogodek - spreminjanje	f
00030000-556d-c396-a8d7-561f64fc2671	Drzava-read	Drzava - branje	f
00030000-556d-c396-95ad-802d7ccde0ae	Drzava-write	Drzava - spreminjanje	f
00030000-556d-c396-bb72-82a0d76f2d53	Funkcija-read	Funkcija - branje	f
00030000-556d-c396-7342-fd78580d07e7	Funkcija-write	Funkcija - spreminjanje	f
00030000-556d-c396-3944-c8a87de44bc7	Gostovanje-read	Gostovanje - branje	f
00030000-556d-c396-7bfc-ac182cf51b63	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-556d-c396-976c-c1dc41a62f47	Gostujoca-read	Gostujoca - branje	f
00030000-556d-c396-4cec-cad56d5f24c6	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-556d-c396-9350-29700816d2ff	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-556d-c396-8162-109256de823a	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-556d-c396-2594-37c902504302	Kupec-read	Kupec - branje	f
00030000-556d-c396-7e96-f4e5679a6c64	Kupec-write	Kupec - spreminjanje	f
00030000-556d-c396-cdf6-7e44e462c23a	NacinPlacina-read	NacinPlacina - branje	f
00030000-556d-c396-a53b-46a5ba3fb22b	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-556d-c396-c782-9e9b3e44ef66	Option-read	Option - branje	f
00030000-556d-c396-5400-2c58af878a4f	Option-write	Option - spreminjanje	f
00030000-556d-c396-8b50-c745801d8fd9	OptionValue-read	OptionValue - branje	f
00030000-556d-c396-dc9c-30dea9f94eb7	OptionValue-write	OptionValue - spreminjanje	f
00030000-556d-c396-5700-d79448848047	Oseba-read	Oseba - branje	f
00030000-556d-c396-360b-834300abf28c	Oseba-write	Oseba - spreminjanje	f
00030000-556d-c396-2416-cf2457ccdf95	Permission-read	Permission - branje	f
00030000-556d-c396-6c81-14ed22428606	Permission-write	Permission - spreminjanje	f
00030000-556d-c396-5ed3-64ae03fba1bc	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-556d-c396-4aab-000c7649002c	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-556d-c396-c341-367d732b1ad0	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-556d-c396-dd83-09a50196a311	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-556d-c396-e282-5ca5fa4c3e7c	Pogodba-read	Pogodba - branje	f
00030000-556d-c396-d573-06327f4d823a	Pogodba-write	Pogodba - spreminjanje	f
00030000-556d-c396-eca5-d93b4442eae0	Popa-read	Popa - branje	f
00030000-556d-c396-e38b-6a8df0e4ae80	Popa-write	Popa - spreminjanje	f
00030000-556d-c396-2bb7-35c4b4b5033f	Posta-read	Posta - branje	f
00030000-556d-c396-e4a1-180eb681c3f0	Posta-write	Posta - spreminjanje	f
00030000-556d-c396-d51d-4c8384285a4d	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-556d-c396-1570-a8d70fad772f	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-556d-c396-22c2-223910389bb7	PostniNaslov-read	PostniNaslov - branje	f
00030000-556d-c396-8384-d7dedd5aa34c	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-556d-c396-18e6-4c9c968843f3	Predstava-read	Predstava - branje	f
00030000-556d-c396-0eae-8cb9c69683fd	Predstava-write	Predstava - spreminjanje	f
00030000-556d-c396-b4be-1bfff422fef9	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-556d-c396-9849-09fcac386b61	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-556d-c396-4ed6-7c97194120a5	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-556d-c396-86e1-ebe6edb57b6c	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-556d-c396-a8d5-412c218755d4	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-556d-c396-83ee-b3c8edd58274	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-556d-c396-8863-1f61fd801dbe	Prostor-read	Prostor - branje	f
00030000-556d-c396-8736-3d68f9d64471	Prostor-write	Prostor - spreminjanje	f
00030000-556d-c396-0639-845decb6ae22	Racun-read	Racun - branje	f
00030000-556d-c396-037f-b0186a21c3e2	Racun-write	Racun - spreminjanje	f
00030000-556d-c396-1f3d-af0cdb289c84	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-556d-c396-5d9a-181e1ca3f627	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-556d-c396-7950-3012f526354d	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-556d-c396-0993-bfec7fd5e8de	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-556d-c396-a809-cd97541556f5	Rekvizit-read	Rekvizit - branje	f
00030000-556d-c396-b4f3-441810915952	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-556d-c396-9867-b388fa42ef91	Revizija-read	Revizija - branje	f
00030000-556d-c396-6dfc-d00df5acb90c	Revizija-write	Revizija - spreminjanje	f
00030000-556d-c396-083f-fc6c1b8ec41e	Rezervacija-read	Rezervacija - branje	f
00030000-556d-c396-8730-6221d30b2b46	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-556d-c396-19a6-470112da9d5d	Role-read	Role - branje	f
00030000-556d-c396-1a5f-2b15923d4f71	Role-write	Role - spreminjanje	f
00030000-556d-c396-d90d-ca609aea021a	SedezniRed-read	SedezniRed - branje	f
00030000-556d-c396-381c-5bccc3a07fba	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-556d-c396-0e78-ee5c7d6438b6	Sedez-read	Sedez - branje	f
00030000-556d-c396-3e4b-2b06f78f39ee	Sedez-write	Sedez - spreminjanje	f
00030000-556d-c396-2047-90d01cb7b429	Sezona-read	Sezona - branje	f
00030000-556d-c396-78ec-be289dd7f8d3	Sezona-write	Sezona - spreminjanje	f
00030000-556d-c396-5cd8-544f8e7a7ac3	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-556d-c396-7cb4-29c8439feb72	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-556d-c396-cd3f-5fe9fb05365b	Stevilcenje-read	Stevilcenje - branje	f
00030000-556d-c396-0563-dfc1b732069a	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-556d-c396-035f-aa6851fe0afc	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-556d-c396-8f4f-77317fe64513	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-556d-c396-5045-ef8bbec0a921	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-556d-c396-b6ea-a63e0c4a2ddc	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-556d-c396-3616-8fc72ff7e2da	Telefonska-read	Telefonska - branje	f
00030000-556d-c396-66d6-004a62aefb34	Telefonska-write	Telefonska - spreminjanje	f
00030000-556d-c396-3266-da6a28d22f56	TerminStoritve-read	TerminStoritve - branje	f
00030000-556d-c396-82fa-ec7dba41246b	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-556d-c396-8223-927bafbd4f05	TipFunkcije-read	TipFunkcije - branje	f
00030000-556d-c396-09a4-923e644f5e98	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-556d-c396-e336-74bebddbf413	Trr-read	Trr - branje	f
00030000-556d-c396-0418-604e27047603	Trr-write	Trr - spreminjanje	f
00030000-556d-c396-ca42-0219b132d418	Uprizoritev-read	Uprizoritev - branje	f
00030000-556d-c396-4ffd-b186cf3a7179	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-556d-c396-6746-b120f06dc75e	User-read	User - branje	f
00030000-556d-c396-587b-d1395bd52159	User-write	User - spreminjanje	f
00030000-556d-c396-44ff-da99f2f3c2cc	Vaja-read	Vaja - branje	f
00030000-556d-c396-3161-993de335c3cb	Vaja-write	Vaja - spreminjanje	f
00030000-556d-c396-94b2-39593f4578c7	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-556d-c396-ae5b-ce8f7334b8fa	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-556d-c396-bd9f-54f64211dcd1	Zaposlitev-read	Zaposlitev - branje	f
00030000-556d-c396-e409-8a68d8f3159e	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-556d-c396-9016-8360fd3f4e6b	Zasedenost-read	Zasedenost - branje	f
00030000-556d-c396-b7df-966dd4991f05	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-556d-c396-b8d6-72c2ffd3d49b	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-556d-c396-aa51-fe0ca0155a03	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-556d-c396-ca04-a0bebeb48ef4	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-556d-c396-dbec-dc44bdd97dc4	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2775 (class 0 OID 6140002)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-556d-c396-1080-bd7948418ef1	00030000-556d-c396-a8d7-561f64fc2671
00020000-556d-c396-d7cf-070b567661e2	00030000-556d-c396-95ad-802d7ccde0ae
00020000-556d-c396-d7cf-070b567661e2	00030000-556d-c396-a8d7-561f64fc2671
\.


--
-- TOC entry 2803 (class 0 OID 6140297)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2807 (class 0 OID 6140328)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 6140462)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2780 (class 0 OID 6140062)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-556d-c397-d5d1-5933dea37abb	00040000-556d-c396-a1be-a549297ac801	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-556d-c397-9520-a06c61ca0dc9	00040000-556d-c396-a1be-a549297ac801	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-556d-c397-9b1e-8396891b8f47	00040000-556d-c396-a1be-a549297ac801	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-556d-c397-1b3e-e2c6913fa6d9	00040000-556d-c396-a1be-a549297ac801	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2782 (class 0 OID 6140097)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-556d-c395-00ab-4b9c0b6013f0	8341	Adlešiči
00050000-556d-c395-748d-88ebf8d70ce6	5270	Ajdovščina
00050000-556d-c395-d44b-6b1170619cba	6280	Ankaran/Ancarano
00050000-556d-c395-42b6-83687427da8d	9253	Apače
00050000-556d-c395-3681-ca8a51102820	8253	Artiče
00050000-556d-c395-d7cc-a103be445302	4275	Begunje na Gorenjskem
00050000-556d-c395-515b-9d3a6be3f296	1382	Begunje pri Cerknici
00050000-556d-c395-a7f2-19620793e139	9231	Beltinci
00050000-556d-c395-ab95-218ceb6aa1e5	2234	Benedikt
00050000-556d-c395-6831-faa6c0b06e54	2345	Bistrica ob Dravi
00050000-556d-c395-b84e-9a4ea1859759	3256	Bistrica ob Sotli
00050000-556d-c395-7084-b252b7181033	8259	Bizeljsko
00050000-556d-c395-1ea9-1560fb8fc0e2	1223	Blagovica
00050000-556d-c395-0a36-f7afadefb6e6	8283	Blanca
00050000-556d-c395-1697-2a771806fd6b	4260	Bled
00050000-556d-c395-a149-58cb22007fab	4273	Blejska Dobrava
00050000-556d-c395-839e-6357e520e27e	9265	Bodonci
00050000-556d-c395-d3d3-c87a5cf1ea1d	9222	Bogojina
00050000-556d-c395-5a2b-bd16fd24c928	4263	Bohinjska Bela
00050000-556d-c395-75cd-a63035970098	4264	Bohinjska Bistrica
00050000-556d-c395-9736-c6d80bafb85d	4265	Bohinjsko jezero
00050000-556d-c395-9e41-4ebe88373efa	1353	Borovnica
00050000-556d-c395-9563-8b7333fbb738	8294	Boštanj
00050000-556d-c395-1f56-7867737b5b49	5230	Bovec
00050000-556d-c395-c25e-4af397e71873	5295	Branik
00050000-556d-c395-e985-0a66809e2391	3314	Braslovče
00050000-556d-c395-3e47-c71718ddbc43	5223	Breginj
00050000-556d-c395-5298-c4cac58c0a06	8280	Brestanica
00050000-556d-c395-1f2c-acdde88a1caf	2354	Bresternica
00050000-556d-c395-07dc-5e213d6ee436	4243	Brezje
00050000-556d-c395-5e79-b24c4f83b219	1351	Brezovica pri Ljubljani
00050000-556d-c395-3719-49936845940b	8250	Brežice
00050000-556d-c395-0ee9-c6e9851a0da9	4210	Brnik - Aerodrom
00050000-556d-c395-a898-c0f80d200067	8321	Brusnice
00050000-556d-c395-c446-86c998ef4ea0	3255	Buče
00050000-556d-c395-518c-f87e3fc1566b	8276	Bučka 
00050000-556d-c395-c758-41ed089ddfc5	9261	Cankova
00050000-556d-c395-7299-0ff840624eca	3000	Celje 
00050000-556d-c395-2e1c-074a3e3c30bc	3001	Celje - poštni predali
00050000-556d-c395-d438-f984eb6750e6	4207	Cerklje na Gorenjskem
00050000-556d-c395-9f17-baf095d026c3	8263	Cerklje ob Krki
00050000-556d-c395-2675-fdf901a9044a	1380	Cerknica
00050000-556d-c395-4b69-14be2d726a56	5282	Cerkno
00050000-556d-c395-2fcd-9ab20d64162b	2236	Cerkvenjak
00050000-556d-c395-3398-ef7e05a95b08	2215	Ceršak
00050000-556d-c395-6df4-6e621c9189c4	2326	Cirkovce
00050000-556d-c395-6d4f-6f891e6a60cd	2282	Cirkulane
00050000-556d-c395-bec7-5552492d5571	5273	Col
00050000-556d-c395-88fd-bda7e0d3b998	8251	Čatež ob Savi
00050000-556d-c395-ccf9-5dcf8770b1b8	1413	Čemšenik
00050000-556d-c395-e9bf-8414314b944c	5253	Čepovan
00050000-556d-c395-d756-72f8ea030473	9232	Črenšovci
00050000-556d-c395-4af3-c78460a913f5	2393	Črna na Koroškem
00050000-556d-c395-996e-78d475340f87	6275	Črni Kal
00050000-556d-c395-59b4-9faf8c0551cf	5274	Črni Vrh nad Idrijo
00050000-556d-c395-3e48-41f5bfee407b	5262	Črniče
00050000-556d-c395-4924-5f42f367cf48	8340	Črnomelj
00050000-556d-c395-e2c9-8efe1af10003	6271	Dekani
00050000-556d-c395-f9c4-8c478a4feb3f	5210	Deskle
00050000-556d-c395-f4da-f4719bc3da52	2253	Destrnik
00050000-556d-c395-dbb4-4b8fe2f6168b	6215	Divača
00050000-556d-c395-c7ed-150df771e89b	1233	Dob
00050000-556d-c395-f859-5b0345509cbc	3224	Dobje pri Planini
00050000-556d-c395-37de-cb2519ce484f	8257	Dobova
00050000-556d-c395-db65-de5dd88d6b57	1423	Dobovec
00050000-556d-c395-fed8-ba039c36be1c	5263	Dobravlje
00050000-556d-c395-7c65-0a10b33bfcca	3204	Dobrna
00050000-556d-c395-ad54-89c10eede0d4	8211	Dobrnič
00050000-556d-c395-e7e4-5fc723105dfe	1356	Dobrova
00050000-556d-c395-30aa-4f8e2c6fbe04	9223	Dobrovnik/Dobronak 
00050000-556d-c395-6284-35d341189a12	5212	Dobrovo v Brdih
00050000-556d-c395-d85c-be6efa403e6d	1431	Dol pri Hrastniku
00050000-556d-c395-7ecb-da1cc35864d9	1262	Dol pri Ljubljani
00050000-556d-c395-dd96-c59d2c86b4f8	1273	Dole pri Litiji
00050000-556d-c395-fdef-c9feb4e31f6d	1331	Dolenja vas
00050000-556d-c395-68ae-152df8f64b1c	8350	Dolenjske Toplice
00050000-556d-c395-d90b-95338fbabaa7	1230	Domžale
00050000-556d-c395-3795-a91d35300e43	2252	Dornava
00050000-556d-c395-c987-cdfb53c96912	5294	Dornberk
00050000-556d-c395-a54f-ced854be9107	1319	Draga
00050000-556d-c395-0d7e-0d2b001b2463	8343	Dragatuš
00050000-556d-c395-abef-a58f74eb94a6	3222	Dramlje
00050000-556d-c395-4026-f27a69b46478	2370	Dravograd
00050000-556d-c395-d1a6-26acbe56dd31	4203	Duplje
00050000-556d-c395-05ab-ebe206762afd	6221	Dutovlje
00050000-556d-c395-d476-a63371d02bb8	8361	Dvor
00050000-556d-c395-5875-bfc7ccd862da	2343	Fala
00050000-556d-c395-07f8-e8d835ca6581	9208	Fokovci
00050000-556d-c395-c21f-b6f644e9b8bf	2313	Fram
00050000-556d-c395-4aeb-e7638e7f7fcb	3213	Frankolovo
00050000-556d-c395-c804-f37c28efe711	1274	Gabrovka
00050000-556d-c395-1851-3dcbbf762d3c	8254	Globoko
00050000-556d-c395-65c6-9bd867c52fa0	5275	Godovič
00050000-556d-c395-5235-feff09f74f5e	4204	Golnik
00050000-556d-c395-57c4-24873ef1e7be	3303	Gomilsko
00050000-556d-c395-4f64-d5a151ab425b	4224	Gorenja vas
00050000-556d-c395-0b65-219e09513817	3263	Gorica pri Slivnici
00050000-556d-c395-8e26-fce625640792	2272	Gorišnica
00050000-556d-c395-b7f2-c2a0115ea8c7	9250	Gornja Radgona
00050000-556d-c395-4309-abfb5bbcd2a0	3342	Gornji Grad
00050000-556d-c395-da7f-f057d20fa2fa	4282	Gozd Martuljek
00050000-556d-c395-c575-393d6359fde2	6272	Gračišče
00050000-556d-c395-3a38-c026c589e0f0	9264	Grad
00050000-556d-c395-260f-538562d78f06	8332	Gradac
00050000-556d-c395-da35-8c3bc9085e67	1384	Grahovo
00050000-556d-c395-1df3-0af724bdf8a8	5242	Grahovo ob Bači
00050000-556d-c395-5aa6-1285ee4b7128	5251	Grgar
00050000-556d-c395-4014-15ebafcfe8c0	3302	Griže
00050000-556d-c395-d87b-e8be6a9be267	3231	Grobelno
00050000-556d-c395-4e13-ce2cb5e607a3	1290	Grosuplje
00050000-556d-c395-7960-9cc6c8df9eb8	2288	Hajdina
00050000-556d-c395-76c5-7056a8420437	8362	Hinje
00050000-556d-c395-31e7-be2505c62388	2311	Hoče
00050000-556d-c395-fec9-e91546434019	9205	Hodoš/Hodos
00050000-556d-c395-70a2-272daa12bfdb	1354	Horjul
00050000-556d-c395-3497-1c66aee56a78	1372	Hotedršica
00050000-556d-c395-98c2-1f9fc1dfb524	1430	Hrastnik
00050000-556d-c395-3f56-a72cf1ea1ff7	6225	Hruševje
00050000-556d-c395-4d8e-c1cdc12a6699	4276	Hrušica
00050000-556d-c395-e1a0-21544ee777b4	5280	Idrija
00050000-556d-c395-325c-6cac1fc56c71	1292	Ig
00050000-556d-c395-ceab-a9c2f5ebf8ef	6250	Ilirska Bistrica
00050000-556d-c395-1b4b-c4207bd8390f	6251	Ilirska Bistrica-Trnovo
00050000-556d-c395-7de9-297edda8bfb7	1295	Ivančna Gorica
00050000-556d-c395-c1e1-7f5e52267669	2259	Ivanjkovci
00050000-556d-c395-137a-15eafc2ba7f5	1411	Izlake
00050000-556d-c395-3a1c-e78247cdbab8	6310	Izola/Isola
00050000-556d-c395-5435-377dafeddfe9	2222	Jakobski Dol
00050000-556d-c395-d16a-ce193e272b61	2221	Jarenina
00050000-556d-c395-837d-1b8480e457f1	6254	Jelšane
00050000-556d-c395-e0e2-0abd13ed299e	4270	Jesenice
00050000-556d-c395-d8d7-93cbe6a2ec5c	8261	Jesenice na Dolenjskem
00050000-556d-c395-73ba-d5a7ab51e15f	3273	Jurklošter
00050000-556d-c395-c207-97b9c34e941e	2223	Jurovski Dol
00050000-556d-c395-feba-7b5474ceb72b	2256	Juršinci
00050000-556d-c395-60e4-3d3d4b9776c7	5214	Kal nad Kanalom
00050000-556d-c395-f870-e72beb1d3a1e	3233	Kalobje
00050000-556d-c395-8f3f-c26314ab58cd	4246	Kamna Gorica
00050000-556d-c395-580b-69c99a25e66a	2351	Kamnica
00050000-556d-c395-85ad-33d87d147aeb	1241	Kamnik
00050000-556d-c395-b545-4081251158fa	5213	Kanal
00050000-556d-c395-59af-86eaccdf398c	8258	Kapele
00050000-556d-c395-3dbc-8609a8b747f0	2362	Kapla
00050000-556d-c395-f955-003c2b810dc0	2325	Kidričevo
00050000-556d-c395-bcf4-811c413747f6	1412	Kisovec
00050000-556d-c395-6550-e88dfe81ebfc	6253	Knežak
00050000-556d-c395-1e07-4ab62bcba092	5222	Kobarid
00050000-556d-c395-b8da-9c15119d86f1	9227	Kobilje
00050000-556d-c395-4aca-6b116308a42d	1330	Kočevje
00050000-556d-c395-ed55-7cfceef9aeac	1338	Kočevska Reka
00050000-556d-c395-88e5-17feaeb2b613	2276	Kog
00050000-556d-c395-6e32-600b9a2968a0	5211	Kojsko
00050000-556d-c395-f222-aaf5da1a7bec	6223	Komen
00050000-556d-c395-fb05-62fbfb0fab71	1218	Komenda
00050000-556d-c395-1bed-46dc169f7a64	6000	Koper/Capodistria 
00050000-556d-c395-cb97-589110413a94	6001	Koper/Capodistria - poštni predali
00050000-556d-c395-61f2-5440a9ee4d9d	8282	Koprivnica
00050000-556d-c395-7e6d-fa37fd229148	5296	Kostanjevica na Krasu
00050000-556d-c395-5d30-481f1c223a59	8311	Kostanjevica na Krki
00050000-556d-c395-fa29-1581c0aedb93	1336	Kostel
00050000-556d-c395-a2b6-690349146bc7	6256	Košana
00050000-556d-c395-69fb-a77f105afdeb	2394	Kotlje
00050000-556d-c395-65b8-479bb8c5e6b8	6240	Kozina
00050000-556d-c395-f869-0c28a85e6bc2	3260	Kozje
00050000-556d-c395-4c64-902b94755534	4000	Kranj 
00050000-556d-c395-4118-d0d2e971baf3	4001	Kranj - poštni predali
00050000-556d-c395-2bf3-3b168c3b718d	4280	Kranjska Gora
00050000-556d-c395-04f2-665b34a7b95b	1281	Kresnice
00050000-556d-c395-3ff5-fb0dc38e8b65	4294	Križe
00050000-556d-c395-be90-f659daffd393	9206	Križevci
00050000-556d-c395-06ac-e22cafcf1287	9242	Križevci pri Ljutomeru
00050000-556d-c395-7799-d7ea1c5db945	1301	Krka
00050000-556d-c395-e48d-2d570a9e3e44	8296	Krmelj
00050000-556d-c395-5dd8-a2eeb973614c	4245	Kropa
00050000-556d-c395-9772-3c0a2e676fef	8262	Krška vas
00050000-556d-c395-f109-804c6f7a0802	8270	Krško
00050000-556d-c395-84b1-461c77c2faf7	9263	Kuzma
00050000-556d-c395-3c93-e89b5c6e41ef	2318	Laporje
00050000-556d-c395-32b0-a762b7161e7f	3270	Laško
00050000-556d-c395-a076-c63c6d4810bd	1219	Laze v Tuhinju
00050000-556d-c395-d8cd-c7c416643dbf	2230	Lenart v Slovenskih goricah
00050000-556d-c395-c59d-60a32d5a4fbc	9220	Lendava/Lendva
00050000-556d-c395-1783-f8b576313aa0	4248	Lesce
00050000-556d-c395-df86-74ea7e87caf3	3261	Lesično
00050000-556d-c395-178d-e6d350a3c132	8273	Leskovec pri Krškem
00050000-556d-c395-7f3f-a05c57b71a13	2372	Libeliče
00050000-556d-c395-9b3d-e1d4c7dcb73a	2341	Limbuš
00050000-556d-c395-1fa5-7cf163f8ab55	1270	Litija
00050000-556d-c395-9989-c86a96d3094f	3202	Ljubečna
00050000-556d-c395-0418-8b330f47a55b	1000	Ljubljana 
00050000-556d-c395-de9a-4873b129e82e	1001	Ljubljana - poštni predali
00050000-556d-c395-2f28-d9e48b858d00	1231	Ljubljana - Črnuče
00050000-556d-c395-0a2c-6d2cc46d7115	1261	Ljubljana - Dobrunje
00050000-556d-c395-31f6-e4ba47d09a8e	1260	Ljubljana - Polje
00050000-556d-c395-a817-d2dbf3b4ffb3	1210	Ljubljana - Šentvid
00050000-556d-c395-f045-d79f758e17d2	1211	Ljubljana - Šmartno
00050000-556d-c395-27f8-190b14563ec4	3333	Ljubno ob Savinji
00050000-556d-c395-7bfe-175674384d9b	9240	Ljutomer
00050000-556d-c395-6a80-5700a34c93c4	3215	Loče
00050000-556d-c395-4f8b-ef3a25c708ca	5231	Log pod Mangartom
00050000-556d-c395-b78d-96cc2c314189	1358	Log pri Brezovici
00050000-556d-c395-945f-71bcab554b9a	1370	Logatec
00050000-556d-c395-f537-cc8094733f89	1371	Logatec
00050000-556d-c395-defa-0957b6296489	1434	Loka pri Zidanem Mostu
00050000-556d-c395-aaed-86c06e632ff7	3223	Loka pri Žusmu
00050000-556d-c395-729c-d3de7f8075c1	6219	Lokev
00050000-556d-c395-ecf7-1a22962d4686	1318	Loški Potok
00050000-556d-c395-65bd-b2749e49bea1	2324	Lovrenc na Dravskem polju
00050000-556d-c395-5106-bb60113d3ace	2344	Lovrenc na Pohorju
00050000-556d-c395-e52b-a97273fef925	3334	Luče
00050000-556d-c395-b00f-6c7438e97b54	1225	Lukovica
00050000-556d-c395-af33-e01935f2453d	9202	Mačkovci
00050000-556d-c395-ced5-6979a2426e97	2322	Majšperk
00050000-556d-c395-b9b5-af723ba4a4df	2321	Makole
00050000-556d-c395-bf24-8dc3122d4a8c	9243	Mala Nedelja
00050000-556d-c395-3dd1-7d769207e1a1	2229	Malečnik
00050000-556d-c395-6464-70601a8b180f	6273	Marezige
00050000-556d-c395-b179-71a3540e8711	2000	Maribor 
00050000-556d-c395-00d7-c22cab49c4b0	2001	Maribor - poštni predali
00050000-556d-c395-5684-5a314cd49a4a	2206	Marjeta na Dravskem polju
00050000-556d-c395-865f-cf0902b2b978	2281	Markovci
00050000-556d-c395-3574-694e79e1b763	9221	Martjanci
00050000-556d-c395-376f-6e6c09c0e5ae	6242	Materija
00050000-556d-c395-3e9e-26dfd0ac8a4f	4211	Mavčiče
00050000-556d-c395-a28e-20673e45aa1d	1215	Medvode
00050000-556d-c395-d81f-e4aa3e07da61	1234	Mengeš
00050000-556d-c395-ddc3-8ce8b93bdb6b	8330	Metlika
00050000-556d-c395-ccb2-7bc96daff728	2392	Mežica
00050000-556d-c395-49db-02595c175d12	2204	Miklavž na Dravskem polju
00050000-556d-c395-f651-9037512790d3	2275	Miklavž pri Ormožu
00050000-556d-c395-4c50-18ac9a9919a2	5291	Miren
00050000-556d-c395-a3ce-736a4c10043d	8233	Mirna
00050000-556d-c395-a4be-0e7ff4850271	8216	Mirna Peč
00050000-556d-c395-372b-ec9032170cb1	2382	Mislinja
00050000-556d-c395-eb07-ecf2583f0a60	4281	Mojstrana
00050000-556d-c395-7df6-f82f50df20b9	8230	Mokronog
00050000-556d-c395-1dcf-2f1fb0a87ab9	1251	Moravče
00050000-556d-c395-a495-846fc221328c	9226	Moravske Toplice
00050000-556d-c395-6284-ca5143358f83	5216	Most na Soči
00050000-556d-c395-c571-36f18e67a45f	1221	Motnik
00050000-556d-c395-ce41-d40bbb479ced	3330	Mozirje
00050000-556d-c395-3e76-ee86eb84a609	9000	Murska Sobota 
00050000-556d-c395-3b65-eeabf3ad6937	9001	Murska Sobota - poštni predali
00050000-556d-c395-a268-ae9b06322ee9	2366	Muta
00050000-556d-c395-03ac-08b14505745e	4202	Naklo
00050000-556d-c395-2fab-28b707481f39	3331	Nazarje
00050000-556d-c395-44fc-920436fc73e5	1357	Notranje Gorice
00050000-556d-c395-afaa-a197c6ff6e6f	3203	Nova Cerkev
00050000-556d-c395-9e8c-95035149c206	5000	Nova Gorica 
00050000-556d-c395-b5f9-2b591c8f7d62	5001	Nova Gorica - poštni predali
00050000-556d-c395-48bd-b6574e41309d	1385	Nova vas
00050000-556d-c395-6bc0-923c048cad31	8000	Novo mesto
00050000-556d-c395-9afe-607578c2673a	8001	Novo mesto - poštni predali
00050000-556d-c395-4d06-62a53b65aaf4	6243	Obrov
00050000-556d-c395-3d07-37fb41aa1f02	9233	Odranci
00050000-556d-c395-7bd7-ba879e998e11	2317	Oplotnica
00050000-556d-c395-0d14-2a940842c867	2312	Orehova vas
00050000-556d-c395-903f-4f12ec65d7cc	2270	Ormož
00050000-556d-c395-0232-5b0999d8d608	1316	Ortnek
00050000-556d-c395-a7c7-37b092ea4997	1337	Osilnica
00050000-556d-c395-3c43-ba03fea0b886	8222	Otočec
00050000-556d-c396-56bf-55997932d772	2361	Ožbalt
00050000-556d-c396-b720-45116a731f36	2231	Pernica
00050000-556d-c396-1407-ad6d6252be96	2211	Pesnica pri Mariboru
00050000-556d-c396-dcb5-759e71eb76f1	9203	Petrovci
00050000-556d-c396-c615-c44c7c98085c	3301	Petrovče
00050000-556d-c396-513f-e4d813a78814	6330	Piran/Pirano
00050000-556d-c396-a6b7-6b9fbca314d1	8255	Pišece
00050000-556d-c396-6ac6-a13b71a7e54f	6257	Pivka
00050000-556d-c396-400b-f3dbd3a93d97	6232	Planina
00050000-556d-c396-5063-0629fb19b306	3225	Planina pri Sevnici
00050000-556d-c396-9c0d-cd793769dca6	6276	Pobegi
00050000-556d-c396-47cd-30815ed33e85	8312	Podbočje
00050000-556d-c396-056e-0635c03e2d73	5243	Podbrdo
00050000-556d-c396-ab38-10f3d7d8cc67	3254	Podčetrtek
00050000-556d-c396-fa87-c6ce83a90fb9	2273	Podgorci
00050000-556d-c396-e2f8-3f693e16f021	6216	Podgorje
00050000-556d-c396-c90d-b1392f47e527	2381	Podgorje pri Slovenj Gradcu
00050000-556d-c396-9b24-a54ac6e14770	6244	Podgrad
00050000-556d-c396-daf6-a8962a664812	1414	Podkum
00050000-556d-c396-0288-6e23c45a2883	2286	Podlehnik
00050000-556d-c396-b9af-dfc8d9b291cf	5272	Podnanos
00050000-556d-c396-e340-e0b9349f0a45	4244	Podnart
00050000-556d-c396-39cc-2c87971a021e	3241	Podplat
00050000-556d-c396-410e-514b8257695b	3257	Podsreda
00050000-556d-c396-adc0-81ddb51b7ece	2363	Podvelka
00050000-556d-c396-ee95-469b95865f28	2208	Pohorje
00050000-556d-c396-c761-e258aecc1785	2257	Polenšak
00050000-556d-c396-b981-477d015a5b18	1355	Polhov Gradec
00050000-556d-c396-6cf4-2a50fc6a266b	4223	Poljane nad Škofjo Loko
00050000-556d-c396-6dc5-11fdb2807297	2319	Poljčane
00050000-556d-c396-f420-06d51d674eda	1272	Polšnik
00050000-556d-c396-b96b-4a418d968f39	3313	Polzela
00050000-556d-c396-5639-db4918e8a1c3	3232	Ponikva
00050000-556d-c396-a2e8-047c4f4f2c31	6320	Portorož/Portorose
00050000-556d-c396-d512-ce2fcdcd25d2	6230	Postojna
00050000-556d-c396-bd62-d9eb6665a761	2331	Pragersko
00050000-556d-c396-1063-c054a35a8465	3312	Prebold
00050000-556d-c396-645d-53f1d8f61b28	4205	Preddvor
00050000-556d-c396-93c4-cf6b1e85c403	6255	Prem
00050000-556d-c396-1fc7-2284c4a8a5d3	1352	Preserje
00050000-556d-c396-368c-e10c0994164e	6258	Prestranek
00050000-556d-c396-f710-2e2f3e32cfc6	2391	Prevalje
00050000-556d-c396-75f9-b74ba6bf5e83	3262	Prevorje
00050000-556d-c396-0362-abda1c22dee5	1276	Primskovo 
00050000-556d-c396-d13c-c1abd545fc13	3253	Pristava pri Mestinju
00050000-556d-c396-7c1d-1b04a5e7d806	9207	Prosenjakovci/Partosfalva
00050000-556d-c396-dcf6-acc73d5cee96	5297	Prvačina
00050000-556d-c396-984e-224011e3d6ce	2250	Ptuj
00050000-556d-c396-edb2-0358a7b07dbb	2323	Ptujska Gora
00050000-556d-c396-11fc-4ffa0cd69eca	9201	Puconci
00050000-556d-c396-7062-c7168e6d3606	2327	Rače
00050000-556d-c396-d08a-da1897a33cb9	1433	Radeče
00050000-556d-c396-2f49-fb6f104d4573	9252	Radenci
00050000-556d-c396-8b85-bf911c84f11e	2360	Radlje ob Dravi
00050000-556d-c396-b0d1-ad135184357e	1235	Radomlje
00050000-556d-c396-4f8c-1107900ba197	4240	Radovljica
00050000-556d-c396-04d0-7729e71a57e9	8274	Raka
00050000-556d-c396-13aa-e8a77ad82636	1381	Rakek
00050000-556d-c396-c82d-7b8d5b0efe17	4283	Rateče - Planica
00050000-556d-c396-ee61-813190e4d3cf	2390	Ravne na Koroškem
00050000-556d-c396-82b0-8e915e26e904	9246	Razkrižje
00050000-556d-c396-fffc-243abc6a24fd	3332	Rečica ob Savinji
00050000-556d-c396-d204-22fa09991ff2	5292	Renče
00050000-556d-c396-e6cf-038b838cb933	1310	Ribnica
00050000-556d-c396-cc55-d56abdfa9f2c	2364	Ribnica na Pohorju
00050000-556d-c396-51a3-637419ae33c9	3272	Rimske Toplice
00050000-556d-c396-3f11-c38abacac9f8	1314	Rob
00050000-556d-c396-15df-1e960e136d95	5215	Ročinj
00050000-556d-c396-bbd6-1570956db49e	3250	Rogaška Slatina
00050000-556d-c396-3974-f5556168c116	9262	Rogašovci
00050000-556d-c396-3e41-92f6b533ddd3	3252	Rogatec
00050000-556d-c396-7a4e-468b11662d74	1373	Rovte
00050000-556d-c396-6f51-bb9c982dfb67	2342	Ruše
00050000-556d-c396-d5a8-617bff25e2e7	1282	Sava
00050000-556d-c396-0304-b9fb0b71e23c	6333	Sečovlje/Sicciole
00050000-556d-c396-298d-8df3855b0828	4227	Selca
00050000-556d-c396-546d-36cb0aa609f1	2352	Selnica ob Dravi
00050000-556d-c396-22d4-3a21a898b185	8333	Semič
00050000-556d-c396-073f-073e5885a0cb	8281	Senovo
00050000-556d-c396-05b0-017fcc5f05fb	6224	Senožeče
00050000-556d-c396-0b37-97313a56d70d	8290	Sevnica
00050000-556d-c396-37cd-79e41a32da41	6210	Sežana
00050000-556d-c396-8c03-8d668261929a	2214	Sladki Vrh
00050000-556d-c396-84e8-3a02579d793e	5283	Slap ob Idrijci
00050000-556d-c396-bbf3-bea9e4323225	2380	Slovenj Gradec
00050000-556d-c396-c0cc-0c03036d9e2e	2310	Slovenska Bistrica
00050000-556d-c396-07ef-6912c8c57bff	3210	Slovenske Konjice
00050000-556d-c396-8747-5da92f065391	1216	Smlednik
00050000-556d-c396-1da4-7908b78f94e1	5232	Soča
00050000-556d-c396-7232-e7f5d09a7fa2	1317	Sodražica
00050000-556d-c396-d07c-899cb2217a68	3335	Solčava
00050000-556d-c396-15b2-c97d9a9cbff5	5250	Solkan
00050000-556d-c396-bac0-c8e1929a0a98	4229	Sorica
00050000-556d-c396-65c0-6cd2d2953aa2	4225	Sovodenj
00050000-556d-c396-8d09-ad5289793622	5281	Spodnja Idrija
00050000-556d-c396-5a1b-cabb9051d37f	2241	Spodnji Duplek
00050000-556d-c396-555e-1c65cfce8458	9245	Spodnji Ivanjci
00050000-556d-c396-bb7d-9287c5857446	2277	Središče ob Dravi
00050000-556d-c396-2932-54a557b35fea	4267	Srednja vas v Bohinju
00050000-556d-c396-8506-023da0f2e231	8256	Sromlje 
00050000-556d-c396-d69f-04c432e596c9	5224	Srpenica
00050000-556d-c396-fe4b-e2699a4478a2	1242	Stahovica
00050000-556d-c396-b30a-386ea2cb0473	1332	Stara Cerkev
00050000-556d-c396-6380-a9a6d19d4326	8342	Stari trg ob Kolpi
00050000-556d-c396-c358-846954228b25	1386	Stari trg pri Ložu
00050000-556d-c396-77bb-984f53684db0	2205	Starše
00050000-556d-c396-1cb9-48f36d6eb19a	2289	Stoperce
00050000-556d-c396-17d1-38e193315359	8322	Stopiče
00050000-556d-c396-2787-264edfcac5e6	3206	Stranice
00050000-556d-c396-4d8c-88fda3aac538	8351	Straža
00050000-556d-c396-cd0a-88db76f4a59c	1313	Struge
00050000-556d-c396-ea69-768b49558f43	8293	Studenec
00050000-556d-c396-1c49-9840bdf46ce8	8331	Suhor
00050000-556d-c396-e2da-2aa41c719a84	2233	Sv. Ana v Slovenskih goricah
00050000-556d-c396-2369-81594305aa4f	2235	Sv. Trojica v Slovenskih goricah
00050000-556d-c396-eab7-4941fb22fe3c	2353	Sveti Duh na Ostrem Vrhu
00050000-556d-c396-31b3-b7fc5351feee	9244	Sveti Jurij ob Ščavnici
00050000-556d-c396-25de-048566083285	3264	Sveti Štefan
00050000-556d-c396-ffb0-d432393206fa	2258	Sveti Tomaž
00050000-556d-c396-f9ea-7bde970e976c	9204	Šalovci
00050000-556d-c396-1f3f-67ebc42184c4	5261	Šempas
00050000-556d-c396-999f-67e7a87f76ed	5290	Šempeter pri Gorici
00050000-556d-c396-580c-8b0ffc87534e	3311	Šempeter v Savinjski dolini
00050000-556d-c396-d16f-bb8ae82baa11	4208	Šenčur
00050000-556d-c396-2015-82ef3de2b46e	2212	Šentilj v Slovenskih goricah
00050000-556d-c396-eea0-511964f7794b	8297	Šentjanž
00050000-556d-c396-0df6-9169eb5e79ab	2373	Šentjanž pri Dravogradu
00050000-556d-c396-34dd-410d59d2fc49	8310	Šentjernej
00050000-556d-c396-58e9-3a15f4383a81	3230	Šentjur
00050000-556d-c396-da5b-ae42bd5236b6	3271	Šentrupert
00050000-556d-c396-2197-63cb70345dfd	8232	Šentrupert
00050000-556d-c396-2e9d-29b4e612c037	1296	Šentvid pri Stični
00050000-556d-c396-e68b-5680c6463a56	8275	Škocjan
00050000-556d-c396-22eb-6c776deba0c4	6281	Škofije
00050000-556d-c396-8cad-c165d16f6e1b	4220	Škofja Loka
00050000-556d-c396-9829-86ecda6c12e0	3211	Škofja vas
00050000-556d-c396-d83d-fad98a9006df	1291	Škofljica
00050000-556d-c396-1fe0-ef6b619f27c0	6274	Šmarje
00050000-556d-c396-6683-c30cd6abc44e	1293	Šmarje - Sap
00050000-556d-c396-d7c0-0484a3a237e5	3240	Šmarje pri Jelšah
00050000-556d-c396-bd4b-4eaf6f62ad53	8220	Šmarješke Toplice
00050000-556d-c396-5602-2797a9b11677	2315	Šmartno na Pohorju
00050000-556d-c396-b0a8-ba4f09d2201a	3341	Šmartno ob Dreti
00050000-556d-c396-6a69-9dbd3eb5a12d	3327	Šmartno ob Paki
00050000-556d-c396-109c-0c1a93b77021	1275	Šmartno pri Litiji
00050000-556d-c396-5376-de28b5daae47	2383	Šmartno pri Slovenj Gradcu
00050000-556d-c396-abaf-97a8c50d8fd1	3201	Šmartno v Rožni dolini
00050000-556d-c396-d9ed-7a203691a060	3325	Šoštanj
00050000-556d-c396-9efe-6a6184875f07	6222	Štanjel
00050000-556d-c396-ad73-213c7d1fbcf8	3220	Štore
00050000-556d-c396-eccd-75ad3bc696c1	3304	Tabor
00050000-556d-c396-c9bd-a28aacb94856	3221	Teharje
00050000-556d-c396-f9b2-686240071504	9251	Tišina
00050000-556d-c396-c9fb-05c2115ec813	5220	Tolmin
00050000-556d-c396-794d-5168d84d97b5	3326	Topolšica
00050000-556d-c396-bf58-aa0192fe1c14	2371	Trbonje
00050000-556d-c396-689f-f4c4d042aa7e	1420	Trbovlje
00050000-556d-c396-58dc-e38a2bee40af	8231	Trebelno 
00050000-556d-c396-9926-5f26654bae72	8210	Trebnje
00050000-556d-c396-eda5-ba9e82094f0d	5252	Trnovo pri Gorici
00050000-556d-c396-8a60-fe5b7f522c1f	2254	Trnovska vas
00050000-556d-c396-41cd-60cd9eea2b39	1222	Trojane
00050000-556d-c396-5225-29591d92339d	1236	Trzin
00050000-556d-c396-a9fd-6f1334f0076e	4290	Tržič
00050000-556d-c396-6d20-34278a84ac0a	8295	Tržišče
00050000-556d-c396-c8cc-31f850c27beb	1311	Turjak
00050000-556d-c396-4c42-19be10ddc1aa	9224	Turnišče
00050000-556d-c396-2cc8-8c7a3dd926f7	8323	Uršna sela
00050000-556d-c396-6fc2-28693fcd44a1	1252	Vače
00050000-556d-c396-d022-497a8a17fb0a	3320	Velenje 
00050000-556d-c396-e3d7-047077f1744b	3322	Velenje - poštni predali
00050000-556d-c396-e874-a6088d261cf7	8212	Velika Loka
00050000-556d-c396-3b16-60f4b75f423a	2274	Velika Nedelja
00050000-556d-c396-9be6-2218c3a05b60	9225	Velika Polana
00050000-556d-c396-ebc3-5a565839e5a9	1315	Velike Lašče
00050000-556d-c396-b336-69b0a81f0614	8213	Veliki Gaber
00050000-556d-c396-967a-5dcec35ab845	9241	Veržej
00050000-556d-c396-e265-31bd3e510ead	1312	Videm - Dobrepolje
00050000-556d-c396-90bb-f5164b53001f	2284	Videm pri Ptuju
00050000-556d-c396-ebbd-54d02ed3478b	8344	Vinica
00050000-556d-c396-22f2-b879d6888328	5271	Vipava
00050000-556d-c396-56c5-31340b745778	4212	Visoko
00050000-556d-c396-da8d-858bcac9c67f	1294	Višnja Gora
00050000-556d-c396-50d3-a188d9e0cc4b	3205	Vitanje
00050000-556d-c396-bb86-fb3a504ab9a1	2255	Vitomarci
00050000-556d-c396-37d8-27fe815ab1fd	1217	Vodice
00050000-556d-c396-b4db-2d993c2b6cb5	3212	Vojnik\t
00050000-556d-c396-f7e6-5c055ef0d0ca	5293	Volčja Draga
00050000-556d-c396-5d17-257a239d61fa	2232	Voličina
00050000-556d-c396-da20-92e53165237f	3305	Vransko
00050000-556d-c396-f3cc-db43334ee257	6217	Vremski Britof
00050000-556d-c396-5e61-e28dccea3714	1360	Vrhnika
00050000-556d-c396-ecc9-bec4a7aacf00	2365	Vuhred
00050000-556d-c396-1fad-e9c962161150	2367	Vuzenica
00050000-556d-c396-7730-9adb34964710	8292	Zabukovje 
00050000-556d-c396-0b50-a7f79001b728	1410	Zagorje ob Savi
00050000-556d-c396-7136-e5611cb95f48	1303	Zagradec
00050000-556d-c396-732e-dde91c4a68e6	2283	Zavrč
00050000-556d-c396-80b8-7fb81b3d9938	8272	Zdole 
00050000-556d-c396-857b-65e9307fa257	4201	Zgornja Besnica
00050000-556d-c396-8af8-9f0cd7ccd0de	2242	Zgornja Korena
00050000-556d-c396-6e7a-19f27c5f346e	2201	Zgornja Kungota
00050000-556d-c396-ef92-e4b2330355e1	2316	Zgornja Ložnica
00050000-556d-c396-c49d-8ad820afd57f	2314	Zgornja Polskava
00050000-556d-c396-43d5-ec1a7f8b2f9d	2213	Zgornja Velka
00050000-556d-c396-83e8-4fe989c40a88	4247	Zgornje Gorje
00050000-556d-c396-cfa5-9be0975c5c9a	4206	Zgornje Jezersko
00050000-556d-c396-7b3b-66d972e2a496	2285	Zgornji Leskovec
00050000-556d-c396-b963-d16432e9d667	1432	Zidani Most
00050000-556d-c396-1ac8-dedde7e42590	3214	Zreče
00050000-556d-c396-1236-473cd39dfb60	4209	Žabnica
00050000-556d-c396-6eb5-47b7f9c600b2	3310	Žalec
00050000-556d-c396-507a-6c12d2541880	4228	Železniki
00050000-556d-c396-8db1-72816609934b	2287	Žetale
00050000-556d-c396-8ee0-009c0bc0d6c7	4226	Žiri
00050000-556d-c396-8111-cb6b0ef7b9c3	4274	Žirovnica
00050000-556d-c396-66b9-918649ad8d51	8360	Žužemberk
\.


--
-- TOC entry 2799 (class 0 OID 6140271)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2767 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2781 (class 0 OID 6140082)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2787 (class 0 OID 6140160)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2801 (class 0 OID 6140283)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2814 (class 0 OID 6140403)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2818 (class 0 OID 6140454)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-556d-c397-837f-93c6ce61fbd3	00080000-556d-c397-9b1e-8396891b8f47	0987	A
00190000-556d-c397-eeb7-bd90bd4ad436	00080000-556d-c397-9520-a06c61ca0dc9	0989	A
\.


--
-- TOC entry 2825 (class 0 OID 6140566)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 6140594)
-- Dependencies: 232
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id) FROM stdin;
\.


--
-- TOC entry 2843 (class 0 OID 0)
-- Dependencies: 238
-- Name: programfestival_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('programfestival_id_seq', 1, false);


--
-- TOC entry 2826 (class 0 OID 6140575)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, program_dela_id, gostitelj_id, transportnistroski, odkup) FROM stdin;
\.


--
-- TOC entry 2844 (class 0 OID 0)
-- Dependencies: 236
-- Name: programgostovanje_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('programgostovanje_id_seq', 1, false);


--
-- TOC entry 2805 (class 0 OID 6140312)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-556d-c397-32f7-5e8d08181527	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-556d-c397-d0a3-0a639322de9c	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-556d-c397-47b3-8ff1d52c58ea	0003	Kazinska	t	84	Kazinska dvorana
00220000-556d-c397-5cf7-1319407c2d29	0004	Mali oder	t	24	Mali oder 
00220000-556d-c397-0cbb-db225b3dd5de	0005	Komorni oder	t	15	Komorni oder
00220000-556d-c397-cce1-846919b95b20	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-556d-c397-a04d-0f714236ad14	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2797 (class 0 OID 6140256)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2796 (class 0 OID 6140246)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2817 (class 0 OID 6140443)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2812 (class 0 OID 6140380)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2770 (class 0 OID 6139954)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-556d-c396-e45c-8d354b9e2049	00010000-556d-c396-21ac-744083e743f7	2015-06-02 16:54:16	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROYVzXpjlxDfjGpM7pfmQY41ao1.JDW9G";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2845 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2806 (class 0 OID 6140322)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2774 (class 0 OID 6139992)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-556d-c396-f388-659e01cf892f	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-556d-c396-d5e9-9130a9c1a34a	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-556d-c396-1080-bd7948418ef1	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-556d-c396-dfbe-3d9221213ae6	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-556d-c396-2779-9b336415c371	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-556d-c396-d7cf-070b567661e2	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2772 (class 0 OID 6139976)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-556d-c396-e45c-8d354b9e2049	00020000-556d-c396-dfbe-3d9221213ae6
00010000-556d-c396-21ac-744083e743f7	00020000-556d-c396-dfbe-3d9221213ae6
\.


--
-- TOC entry 2808 (class 0 OID 6140336)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2800 (class 0 OID 6140277)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2794 (class 0 OID 6140227)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 6140612)
-- Dependencies: 235
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-556d-c396-8322-e9b5569afcf7	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-556d-c396-92d7-493f90b646cd	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-556d-c396-82f5-705322a0bcde	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-556d-c396-80f5-28923ef3b4a1	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-556d-c396-4fbe-70003389cc2a	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2830 (class 0 OID 6140605)
-- Dependencies: 234
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-556d-c396-467a-df237a9acbcd	00000000-556d-c396-80f5-28923ef3b4a1	popa
00000000-556d-c396-5d35-222508bdb6f4	00000000-556d-c396-80f5-28923ef3b4a1	oseba
00000000-556d-c396-3b8e-a06959a99fdc	00000000-556d-c396-92d7-493f90b646cd	prostor
00000000-556d-c396-70ce-ade95ac5b597	00000000-556d-c396-80f5-28923ef3b4a1	besedilo
00000000-556d-c396-9abe-b82999e9e7d6	00000000-556d-c396-80f5-28923ef3b4a1	uprizoritev
00000000-556d-c396-4889-11cd7bc89a68	00000000-556d-c396-80f5-28923ef3b4a1	funkcija
00000000-556d-c396-8311-214d840fe184	00000000-556d-c396-80f5-28923ef3b4a1	tipfunkcije
00000000-556d-c396-c5ae-75c9032acd20	00000000-556d-c396-80f5-28923ef3b4a1	alternacija
00000000-556d-c396-4550-0cc6bccc793b	00000000-556d-c396-8322-e9b5569afcf7	pogodba
00000000-556d-c396-b8ad-0f976f7e3751	00000000-556d-c396-80f5-28923ef3b4a1	zaposlitev
\.


--
-- TOC entry 2829 (class 0 OID 6140600)
-- Dependencies: 233
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2813 (class 0 OID 6140390)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2779 (class 0 OID 6140054)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2795 (class 0 OID 6140233)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-556d-c397-1522-bc369a643383	00180000-556d-c397-e75a-8de213776ca7	000c0000-556d-c397-7e1e-30aadb1068f6	00090000-556d-c397-3a2e-297b9e227db3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556d-c397-cc79-6ce8bc13bd5d	00180000-556d-c397-e75a-8de213776ca7	000c0000-556d-c397-2d42-51c0c48ea885	00090000-556d-c397-e2a1-1eafe1e24632	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556d-c397-a8df-bb010ae967bf	00180000-556d-c397-e75a-8de213776ca7	000c0000-556d-c397-e11b-8435c5df31ad	00090000-556d-c397-9d4c-f52fa1c690bb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556d-c397-c97e-46019a80a910	00180000-556d-c397-e75a-8de213776ca7	000c0000-556d-c397-0eb7-0dfe2f226363	00090000-556d-c397-4fdf-8064cffc1dcf	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556d-c397-4964-d16ab46d97de	00180000-556d-c397-e75a-8de213776ca7	000c0000-556d-c397-d91e-73221cb0c280	00090000-556d-c397-8242-9267c1a21459	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556d-c397-80b2-63708db1eccc	00180000-556d-c397-4399-35d85a2f4603	\N	00090000-556d-c397-8242-9267c1a21459	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2816 (class 0 OID 6140432)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-556d-c396-a56f-94078fd68475	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-556d-c396-7d11-f1bab25ffb19	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-556d-c396-dafd-96165dd4972e	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-556d-c396-eb88-415dff86f257	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-556d-c396-1ee0-9c28bbbc7059	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-556d-c396-7966-90eb1a1f6da8	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-556d-c396-a508-d4cbf785ed11	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-556d-c396-986e-02ad6568a5e9	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-556d-c396-ad23-317bda6633d6	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-556d-c396-9420-50dbab2eb494	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-556d-c396-30f7-80bcea3148bd	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-556d-c396-5857-17e23e0f5423	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-556d-c396-98cb-2a5d144e80ce	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-556d-c396-1e62-dfe7740c1ab6	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-556d-c396-b4cd-cd5b93488e89	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-556d-c396-0844-cb7826bf76e5	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2827 (class 0 OID 6140583)
-- Dependencies: 231
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 0)
-- Dependencies: 237
-- Name: tipprogramskeenote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tipprogramskeenote_id_seq', 1, false);


--
-- TOC entry 2784 (class 0 OID 6140117)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2771 (class 0 OID 6139963)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-556d-c396-21ac-744083e743f7	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROVRUQyoACNdZO7kb76IEXCBWCEAVK0ZG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-556d-c397-b064-3855f1427f6c	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-556d-c397-1ab6-be02dcc8d082	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-556d-c397-0bd8-09f9a97ff271	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-556d-c397-04e2-17dd1bea4ddf	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-556d-c397-abaf-d24e3cf47501	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-556d-c396-e45c-8d354b9e2049	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2821 (class 0 OID 6140488)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-556d-c397-2180-e8b02f8da37c	00160000-556d-c397-efd0-6b8f348c3e77	00150000-556d-c396-1855-16c0d98606f4	00140000-556d-c396-acc7-92101d3bd978	0001	produkcija	Sen kresne noči		Sanje	2016-02-01	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-556d-c397-0cbb-db225b3dd5de
000e0000-556d-c397-ab81-6c545e08e13f	00160000-556d-c397-1b61-d91b96c233da	00150000-556d-c396-33b8-7b7fbbe8c2ef	00140000-556d-c396-6d9d-432cd1be4368	0002	predprodukcija-ideja	Smoletov vrt			2017-01-01	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-556d-c397-cce1-846919b95b20
\.


--
-- TOC entry 2789 (class 0 OID 6140179)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-556d-c397-0700-281db5c8f4dc	000e0000-556d-c397-ab81-6c545e08e13f	1	
00200000-556d-c397-00b1-1f4d98b5dd20	000e0000-556d-c397-ab81-6c545e08e13f	2	
\.


--
-- TOC entry 2804 (class 0 OID 6140304)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2811 (class 0 OID 6140373)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2791 (class 0 OID 6140211)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2820 (class 0 OID 6140478)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-556d-c396-acc7-92101d3bd978	Drama	drama (SURS 01)
00140000-556d-c396-a0e3-84fbae81c7a1	Opera	opera (SURS 02)
00140000-556d-c396-8c2a-dceac6476f3f	Balet	balet (SURS 03)
00140000-556d-c396-1eab-923cd4ce0596	Plesne prireditve	plesne prireditve (SURS 04)
00140000-556d-c396-c6c5-a6327b08d93f	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-556d-c396-6d9d-432cd1be4368	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-556d-c396-69ff-e173c793b9ed	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2810 (class 0 OID 6140363)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-556d-c396-813b-b5745ec87dcb	Opera	opera
00150000-556d-c396-b4d8-3389ad9fc382	Opereta	opereta
00150000-556d-c396-ba92-7c9cdec79fcd	Balet	balet
00150000-556d-c396-d7b4-daaeb6b1f369	Plesne prireditve	plesne prireditve
00150000-556d-c396-f407-6f25235c8eb0	Lutkovno gledališče	lutkovno gledališče
00150000-556d-c396-c59a-0a0f346e6412	Raziskovalno gledališče	raziskovalno gledališče
00150000-556d-c396-97e2-49fb43f0fa2b	Biografska drama	biografska drama
00150000-556d-c396-1855-16c0d98606f4	Komedija	komedija
00150000-556d-c396-6a06-576704aaf5fb	Črna komedija	črna komedija
00150000-556d-c396-5c86-8dcbe6f84a21	E-igra	E-igra
00150000-556d-c396-33b8-7b7fbbe8c2ef	Kriminalka	kriminalka
00150000-556d-c396-dbb5-361392bf62e8	Musical	musical
\.


--
-- TOC entry 2364 (class 2606 OID 6140017)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 6140533)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 6140523)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 6140431)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 6140201)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 6140226)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 6140143)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 6140562)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 6140359)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 6140177)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 6140220)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 6140157)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2335 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 6140269)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 6140296)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 6140115)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 6140026)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2345 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2371 (class 2606 OID 6140050)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 6140006)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2355 (class 2606 OID 6139991)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 6140302)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 6140335)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 6140473)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 6140079)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 6140103)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 6140275)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 6140093)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 6140164)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 6140287)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 6140415)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 6140459)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 6140573)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 6140598)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 6140580)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 6140319)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 6140260)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 6140251)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 6140453)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 6140387)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 6139962)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 6140326)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2353 (class 2606 OID 6139980)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2357 (class 2606 OID 6140000)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 6140344)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 6140282)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 6140232)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 6140618)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 6140609)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 6140604)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 6140400)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 6140059)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 6140242)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 6140442)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 6140593)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 6140128)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 6139975)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 6140503)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 6140186)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 6140310)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 6140378)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 6140215)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 6140487)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 6140372)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 1259 OID 6140208)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2503 (class 1259 OID 6140401)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2504 (class 1259 OID 6140402)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2378 (class 1259 OID 6140081)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2337 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2338 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2339 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2469 (class 1259 OID 6140303)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2463 (class 1259 OID 6140289)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2464 (class 1259 OID 6140288)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2415 (class 1259 OID 6140187)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2491 (class 1259 OID 6140360)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2492 (class 1259 OID 6140362)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2493 (class 1259 OID 6140361)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2403 (class 1259 OID 6140159)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2404 (class 1259 OID 6140158)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2521 (class 1259 OID 6140475)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2522 (class 1259 OID 6140476)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2523 (class 1259 OID 6140477)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2529 (class 1259 OID 6140508)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2530 (class 1259 OID 6140505)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2531 (class 1259 OID 6140507)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2532 (class 1259 OID 6140506)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2393 (class 1259 OID 6140130)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2394 (class 1259 OID 6140129)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2342 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2343 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2369 (class 1259 OID 6140053)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2479 (class 1259 OID 6140327)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2433 (class 1259 OID 6140221)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2359 (class 1259 OID 6140007)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2360 (class 1259 OID 6140008)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2484 (class 1259 OID 6140347)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2485 (class 1259 OID 6140346)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2486 (class 1259 OID 6140345)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2407 (class 1259 OID 6140165)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2408 (class 1259 OID 6140167)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2409 (class 1259 OID 6140166)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2567 (class 1259 OID 6140611)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2443 (class 1259 OID 6140255)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2444 (class 1259 OID 6140253)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2445 (class 1259 OID 6140252)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2446 (class 1259 OID 6140254)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2350 (class 1259 OID 6139981)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2351 (class 1259 OID 6139982)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2472 (class 1259 OID 6140311)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2458 (class 1259 OID 6140276)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2499 (class 1259 OID 6140388)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2500 (class 1259 OID 6140389)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2550 (class 1259 OID 6140563)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2551 (class 1259 OID 6140565)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2552 (class 1259 OID 6140564)
-- Name: idx_8787a0e5b3836ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5b3836ea9 ON enotaprograma USING btree (tip_programske_enote_id);


--
-- TOC entry 2382 (class 1259 OID 6140095)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2383 (class 1259 OID 6140094)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2384 (class 1259 OID 6140096)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2562 (class 1259 OID 6140599)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2507 (class 1259 OID 6140416)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2508 (class 1259 OID 6140417)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2542 (class 1259 OID 6140537)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2543 (class 1259 OID 6140536)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2544 (class 1259 OID 6140539)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2545 (class 1259 OID 6140535)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2546 (class 1259 OID 6140538)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2496 (class 1259 OID 6140379)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2449 (class 1259 OID 6140264)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2450 (class 1259 OID 6140263)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2451 (class 1259 OID 6140261)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2452 (class 1259 OID 6140262)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2333 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2538 (class 1259 OID 6140525)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2539 (class 1259 OID 6140524)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2553 (class 1259 OID 6140574)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2414 (class 1259 OID 6140178)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2365 (class 1259 OID 6140028)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2366 (class 1259 OID 6140027)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2374 (class 1259 OID 6140060)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2375 (class 1259 OID 6140061)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2438 (class 1259 OID 6140245)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2439 (class 1259 OID 6140244)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2440 (class 1259 OID 6140243)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2556 (class 1259 OID 6140582)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2557 (class 1259 OID 6140581)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2421 (class 1259 OID 6140210)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2422 (class 1259 OID 6140206)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2423 (class 1259 OID 6140203)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2424 (class 1259 OID 6140204)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2425 (class 1259 OID 6140202)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2426 (class 1259 OID 6140207)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2427 (class 1259 OID 6140205)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2381 (class 1259 OID 6140080)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2399 (class 1259 OID 6140144)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2400 (class 1259 OID 6140146)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2401 (class 1259 OID 6140145)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2402 (class 1259 OID 6140147)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2457 (class 1259 OID 6140270)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2526 (class 1259 OID 6140474)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2533 (class 1259 OID 6140504)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2372 (class 1259 OID 6140051)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2373 (class 1259 OID 6140052)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2573 (class 1259 OID 6140619)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2392 (class 1259 OID 6140116)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2570 (class 1259 OID 6140610)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2477 (class 1259 OID 6140321)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2478 (class 1259 OID 6140320)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2547 (class 1259 OID 6140534)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2336 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2389 (class 1259 OID 6140104)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2519 (class 1259 OID 6140460)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 6140461)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2358 (class 1259 OID 6140001)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2428 (class 1259 OID 6140209)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2599 (class 2606 OID 6140761)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2602 (class 2606 OID 6140746)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2601 (class 2606 OID 6140751)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2597 (class 2606 OID 6140771)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2603 (class 2606 OID 6140741)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2598 (class 2606 OID 6140766)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2600 (class 2606 OID 6140756)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2633 (class 2606 OID 6140916)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2632 (class 2606 OID 6140921)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2584 (class 2606 OID 6140676)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2620 (class 2606 OID 6140856)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2618 (class 2606 OID 6140851)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2619 (class 2606 OID 6140846)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2596 (class 2606 OID 6140736)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2628 (class 2606 OID 6140886)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2626 (class 2606 OID 6140896)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2627 (class 2606 OID 6140891)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2590 (class 2606 OID 6140711)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2591 (class 2606 OID 6140706)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2616 (class 2606 OID 6140836)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2639 (class 2606 OID 6140941)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2638 (class 2606 OID 6140946)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2637 (class 2606 OID 6140951)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2640 (class 2606 OID 6140971)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2643 (class 2606 OID 6140956)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2641 (class 2606 OID 6140966)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2642 (class 2606 OID 6140961)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2588 (class 2606 OID 6140701)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2589 (class 2606 OID 6140696)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2580 (class 2606 OID 6140661)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2581 (class 2606 OID 6140656)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2622 (class 2606 OID 6140866)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2604 (class 2606 OID 6140776)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2577 (class 2606 OID 6140636)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2576 (class 2606 OID 6140641)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2623 (class 2606 OID 6140881)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2624 (class 2606 OID 6140876)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2625 (class 2606 OID 6140871)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2594 (class 2606 OID 6140716)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2592 (class 2606 OID 6140726)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2593 (class 2606 OID 6140721)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2658 (class 2606 OID 6141046)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2608 (class 2606 OID 6140811)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2610 (class 2606 OID 6140801)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2611 (class 2606 OID 6140796)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2609 (class 2606 OID 6140806)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2575 (class 2606 OID 6140626)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2574 (class 2606 OID 6140631)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2621 (class 2606 OID 6140861)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2617 (class 2606 OID 6140841)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2631 (class 2606 OID 6140906)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2630 (class 2606 OID 6140911)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 6141011)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2651 (class 2606 OID 6141021)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2652 (class 2606 OID 6141016)
-- Name: fk_8787a0e5b3836ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5b3836ea9 FOREIGN KEY (tip_programske_enote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2586 (class 2606 OID 6140686)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2587 (class 2606 OID 6140681)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2585 (class 2606 OID 6140691)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2657 (class 2606 OID 6141041)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2635 (class 2606 OID 6140926)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2634 (class 2606 OID 6140931)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2648 (class 2606 OID 6140996)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2649 (class 2606 OID 6140991)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2646 (class 2606 OID 6141006)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2650 (class 2606 OID 6140986)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2647 (class 2606 OID 6141001)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2629 (class 2606 OID 6140901)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2612 (class 2606 OID 6140831)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2613 (class 2606 OID 6140826)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2615 (class 2606 OID 6140816)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2614 (class 2606 OID 6140821)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2644 (class 2606 OID 6140981)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2645 (class 2606 OID 6140976)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2654 (class 2606 OID 6141026)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2595 (class 2606 OID 6140731)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2636 (class 2606 OID 6140936)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2578 (class 2606 OID 6140651)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2579 (class 2606 OID 6140646)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2583 (class 2606 OID 6140666)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2582 (class 2606 OID 6140671)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2605 (class 2606 OID 6140791)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2606 (class 2606 OID 6140786)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2607 (class 2606 OID 6140781)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2655 (class 2606 OID 6141036)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 6141031)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-02 16:54:16 CEST

--
-- PostgreSQL database dump complete
--

