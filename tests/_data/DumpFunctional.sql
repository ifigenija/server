--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-04 13:31:39 CEST

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
-- TOC entry 2850 (class 0 OID 0)
-- Dependencies: 239
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 6241670)
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
-- TOC entry 227 (class 1259 OID 6242192)
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
-- TOC entry 226 (class 1259 OID 6242175)
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
-- TOC entry 219 (class 1259 OID 6242079)
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
    internacionalninaslov character varying(255) DEFAULT NULL::character varying,
    datumprejema date,
    moskevloge integer,
    zenskevloge integer,
    prevajalec character varying(255) DEFAULT NULL::character varying,
    povzetekvsebine text,
    letoizida character varying(4) DEFAULT NULL::character varying,
    krajizida character varying(255) DEFAULT NULL::character varying,
    zaloznik character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 6241849)
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
-- TOC entry 197 (class 1259 OID 6241883)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6241792)
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
-- TOC entry 228 (class 1259 OID 6242206)
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
-- TOC entry 213 (class 1259 OID 6242009)
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
-- TOC entry 192 (class 1259 OID 6241829)
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
-- TOC entry 196 (class 1259 OID 6241877)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6241809)
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
-- TOC entry 202 (class 1259 OID 6241926)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6241951)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6241766)
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
-- TOC entry 181 (class 1259 OID 6241679)
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
-- TOC entry 182 (class 1259 OID 6241690)
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
-- TOC entry 177 (class 1259 OID 6241644)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6241663)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6241958)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6241989)
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
-- TOC entry 223 (class 1259 OID 6242127)
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
-- TOC entry 184 (class 1259 OID 6241723)
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
-- TOC entry 186 (class 1259 OID 6241758)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6241932)
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
-- TOC entry 185 (class 1259 OID 6241743)
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
-- TOC entry 191 (class 1259 OID 6241821)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6241944)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6242064)
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
-- TOC entry 222 (class 1259 OID 6242119)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6242232)
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
-- TOC entry 232 (class 1259 OID 6242260)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id integer NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 238 (class 1259 OID 6242294)
-- Name: programfestival_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programfestival_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 230 (class 1259 OID 6242241)
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
-- TOC entry 236 (class 1259 OID 6242290)
-- Name: programgostovanje_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programgostovanje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 209 (class 1259 OID 6241973)
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
-- TOC entry 201 (class 1259 OID 6241917)
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
-- TOC entry 200 (class 1259 OID 6241907)
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
-- TOC entry 221 (class 1259 OID 6242108)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6242041)
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
-- TOC entry 174 (class 1259 OID 6241615)
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
-- TOC entry 173 (class 1259 OID 6241613)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2851 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 6241983)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6241653)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6241637)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6241997)
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
-- TOC entry 204 (class 1259 OID 6241938)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6241888)
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
-- TOC entry 235 (class 1259 OID 6242279)
-- Name: stevilcenje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenje (
    id uuid NOT NULL,
    sifra character varying(8) DEFAULT NULL::character varying,
    naziv character varying(100) DEFAULT NULL::character varying,
    prefix character varying(5) DEFAULT NULL::character varying,
    suffix character varying(5) DEFAULT NULL::character varying,
    zacetek integer,
    dolzina integer,
    format character varying(20) DEFAULT NULL::character varying,
    globalno boolean,
    poletih boolean
);


--
-- TOC entry 234 (class 1259 OID 6242271)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 6242266)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6242051)
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
-- TOC entry 183 (class 1259 OID 6241715)
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
-- TOC entry 199 (class 1259 OID 6241894)
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
-- TOC entry 220 (class 1259 OID 6242097)
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
-- TOC entry 231 (class 1259 OID 6242249)
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
-- TOC entry 237 (class 1259 OID 6242292)
-- Name: tipprogramskeenote_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipprogramskeenote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 188 (class 1259 OID 6241778)
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
-- TOC entry 175 (class 1259 OID 6241624)
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
-- TOC entry 225 (class 1259 OID 6242153)
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
    internacionalninaslov character varying(255) DEFAULT NULL::character varying,
    datumzacstudija date,
    stevilovaj integer,
    planiranostevilovaj integer,
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
-- TOC entry 193 (class 1259 OID 6241840)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6241965)
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
-- TOC entry 215 (class 1259 OID 6242034)
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
-- TOC entry 195 (class 1259 OID 6241872)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6242143)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 6242024)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2174 (class 2604 OID 6241618)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2785 (class 0 OID 6241670)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2832 (class 0 OID 6242192)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
000c0000-5570-371b-4af2-0e0c8f1e8ea1	000d0000-5570-371b-b1ec-b0488d99edc3	\N	00090000-5570-371b-a4bb-c24db3d7f29f	\N	\N	0001	f	\N	\N	\N	\N	\N	\N
000c0000-5570-371b-3944-ad0b52291bfa	000d0000-5570-371b-49e4-b27d89099060	\N	00090000-5570-371b-e626-af7fa50085bb	\N	\N	0002	f	\N	\N	\N	\N	\N	\N
000c0000-5570-371b-b809-f7c759e98b82	000d0000-5570-371b-2f39-4d60e76f83f7	\N	00090000-5570-371b-6183-b41e836e8993	\N	\N	0003	f	\N	\N	\N	\N	\N	\N
000c0000-5570-371b-b17f-ba6206f947b3	000d0000-5570-371b-e66a-3813f1e5c9bb	\N	00090000-5570-371b-a9fc-7c63bd7c8fc9	\N	\N	0004	f	\N	\N	\N	\N	\N	\N
000c0000-5570-371b-7d71-a3ffe22684a1	000d0000-5570-371b-2536-61dc5d09cba0	\N	00090000-5570-371b-ff6f-793acf13570b	\N	\N	0005	f	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2831 (class 0 OID 6242175)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2824 (class 0 OID 6242079)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5570-371b-389e-8b5279091f7d	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	5	Milan Jesih	\N	\N	\N
00160000-5570-371b-8295-0acdfb7febce	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	1	Vladimir Levstik	\N	\N	\N
00160000-5570-371b-a03b-03c0df2efcc8	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8	8		\N	\N	\N
\.


--
-- TOC entry 2799 (class 0 OID 6241849)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5570-371b-c060-19986d5c162b	\N	\N	00200000-5570-371b-a661-c13bc9bd2a11	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5570-371b-df06-0ca6ce377e50	\N	\N	00200000-5570-371b-8a15-02c044f51813	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5570-371b-6291-aae023c078a3	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5570-371b-0ed0-4c1821862507	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5570-371b-634e-a82e0e6703bf	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2802 (class 0 OID 6241883)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2794 (class 0 OID 6241792)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5570-371a-f231-54e749b35204	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5570-371a-7cf7-8fe6be9fdd57	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5570-371a-2303-14b50a9117ac	AL	ALB	008	Albania 	Albanija	\N
00040000-5570-371a-34d1-7696d8ed2783	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5570-371a-4e70-eda737132b17	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5570-371a-2c2b-778ab7c2e475	AD	AND	020	Andorra 	Andora	\N
00040000-5570-371a-fca9-be542b2d1a4c	AO	AGO	024	Angola 	Angola	\N
00040000-5570-371a-50ea-7c1ed9ac1aa3	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5570-371a-4d78-f143c36c3a74	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5570-371a-ca77-f580215c30b4	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5570-371a-2802-fe903fa43c1b	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5570-371a-0a6a-318be63e0d48	AM	ARM	051	Armenia 	Armenija	\N
00040000-5570-371a-ad8a-e39f1ea2f7b9	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5570-371a-863e-1308b5702dba	AU	AUS	036	Australia 	Avstralija	\N
00040000-5570-371a-127b-9260bfb8a6f2	AT	AUT	040	Austria 	Avstrija	\N
00040000-5570-371a-ac85-8904b0dc66d9	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5570-371a-4f57-8034b82d8eee	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5570-371a-cdd6-6e710d826011	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5570-371a-6993-1aa28e28c80a	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5570-371a-0172-2777b7b5f7bf	BB	BRB	052	Barbados 	Barbados	\N
00040000-5570-371a-8fe4-8eba1b1b2e7f	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5570-371a-2708-1490a1900cfc	BE	BEL	056	Belgium 	Belgija	\N
00040000-5570-371a-eef2-3e5b7cae1e6b	BZ	BLZ	084	Belize 	Belize	\N
00040000-5570-371a-6524-98bc1e40d67f	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5570-371a-670d-99cce14722cb	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5570-371a-e56d-e245ca23787e	BT	BTN	064	Bhutan 	Butan	\N
00040000-5570-371a-1813-1801adae6c2a	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5570-371a-1a79-69b33fe69cbc	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5570-371a-d9ee-508ec9425ca8	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5570-371a-f040-bca370877777	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5570-371a-dda2-667d64e96de1	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5570-371a-bb11-d10d6ea6833b	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5570-371a-78d8-5e0d7a6514a5	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5570-371a-0ae8-83676daee0ec	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5570-371a-d9c2-b1f078c802d9	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5570-371a-1e12-8b836633ae9e	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5570-371a-dd62-871d11b9faee	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5570-371a-2e82-3ec3cba4743c	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5570-371a-4269-d66f8091654e	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5570-371a-1939-7ddb68ef384f	CA	CAN	124	Canada 	Kanada	\N
00040000-5570-371a-cd58-ef2769886e2d	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5570-371a-1164-b9590e17723e	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5570-371a-4ebb-a54ebfde29c4	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5570-371a-a4d9-0064538ebd8b	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5570-371a-cd44-52f6ac9c77d8	CL	CHL	152	Chile 	Čile	\N
00040000-5570-371a-b3de-0a16705cd43b	CN	CHN	156	China 	Kitajska	\N
00040000-5570-371a-3de7-cf24798375b0	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5570-371a-8896-a3c3ef4bbd89	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5570-371a-a892-98283fb618c8	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5570-371a-0054-95677f550671	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5570-371a-999a-635674592abe	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5570-371a-39af-0bc1d3ca17cd	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5570-371a-6826-63a27d08dce4	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5570-371a-6e89-074ea7b989b9	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5570-371a-74f6-a3d6402f003b	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5570-371a-743f-85988eaf3a10	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5570-371a-132e-f14b49cdde49	CU	CUB	192	Cuba 	Kuba	\N
00040000-5570-371a-37d2-0af182f00de3	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5570-371a-10a1-0258ef7188dc	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5570-371a-89c0-0e7a06071c77	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5570-371a-7e63-38c4a3c2c4c8	DK	DNK	208	Denmark 	Danska	\N
00040000-5570-371a-7412-7a8d8d80d8f7	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5570-371a-d033-0ed0e993e3ca	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5570-371a-6285-38a4f6a73eb5	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5570-371a-4ef1-8e5bf81e2bfb	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5570-371a-1f8b-0e336f1a8265	EG	EGY	818	Egypt 	Egipt	\N
00040000-5570-371a-724b-d6f403d84b27	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5570-371a-dd28-1b4e5b4923b4	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5570-371a-3e22-8d0a8f18e335	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5570-371a-4c77-481a48bd1d27	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5570-371a-623c-c5262f269700	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5570-371a-b0db-96b915c56204	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5570-371a-69f8-a7097ede747d	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5570-371a-479b-e9e23f7c1eab	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5570-371a-67a8-0bcc8bbb3f05	FI	FIN	246	Finland 	Finska	\N
00040000-5570-371a-7031-5ded692c4154	FR	FRA	250	France 	Francija	\N
00040000-5570-371a-ee56-8576600014b2	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5570-371a-3435-d3f4d694e715	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5570-371a-42ac-cc425711e231	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5570-371a-1bc9-3036dab97409	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5570-371a-4bd7-d9b62c398db4	GA	GAB	266	Gabon 	Gabon	\N
00040000-5570-371a-8866-4431fb44646e	GM	GMB	270	Gambia 	Gambija	\N
00040000-5570-371a-bc08-935790f971ba	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5570-371a-c31b-acdc1a381555	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5570-371a-4a01-89fc70d096c5	GH	GHA	288	Ghana 	Gana	\N
00040000-5570-371a-9a3c-09b49efd02df	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5570-371a-0347-95fd4ca9f9c1	GR	GRC	300	Greece 	Grčija	\N
00040000-5570-371a-b796-f910551c400b	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5570-371a-ac01-5200aad12b94	GD	GRD	308	Grenada 	Grenada	\N
00040000-5570-371a-f7b6-6daa8340c9d6	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5570-371a-9dca-eff4f84c4d75	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5570-371a-43a7-e4e2ffe5936c	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5570-371a-4182-a25b0b6a55b8	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5570-371a-682d-a93782cabb19	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5570-371a-e0db-b0525276ef5d	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5570-371a-32ae-1be1d48951af	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5570-371a-9be4-44fc94ceced9	HT	HTI	332	Haiti 	Haiti	\N
00040000-5570-371a-e232-51d7573a5474	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5570-371a-29b4-8160ba388373	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5570-371a-38d8-809a6ddc83e7	HN	HND	340	Honduras 	Honduras	\N
00040000-5570-371a-efa2-bac41452f1b1	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5570-371a-783e-6d381a544357	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5570-371a-4a76-1e0bed827c32	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5570-371a-9858-869fdec489fb	IN	IND	356	India 	Indija	\N
00040000-5570-371a-0456-6adb1988a135	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5570-371a-8a1e-1c72ba055193	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5570-371a-18b5-fbe3d2ffd034	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5570-371a-2b3e-5512abb842f5	IE	IRL	372	Ireland 	Irska	\N
00040000-5570-371a-a09e-a044c957708d	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5570-371a-ed54-85f3ec773cff	IL	ISR	376	Israel 	Izrael	\N
00040000-5570-371a-99e7-48f35e30f3af	IT	ITA	380	Italy 	Italija	\N
00040000-5570-371a-633d-ec2552abbc39	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5570-371a-ea18-e920bdc382cf	JP	JPN	392	Japan 	Japonska	\N
00040000-5570-371a-fb73-8b5757101618	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5570-371a-c669-4517c935fd83	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5570-371a-f7b0-21fa386151ff	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5570-371a-a47e-cf10a2c3a3ab	KE	KEN	404	Kenya 	Kenija	\N
00040000-5570-371a-cc56-8b69128d6198	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5570-371a-3a4d-1a8828090ef4	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5570-371a-8c9b-2eda5a712bf8	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5570-371a-ad09-92975882cff9	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5570-371a-b5bb-b3d70f15f43c	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5570-371a-7cb2-0d3011b187ca	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5570-371a-417d-cb15f488b091	LV	LVA	428	Latvia 	Latvija	\N
00040000-5570-371a-897d-d60bb3309023	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5570-371a-c5bf-1f343b2c44bf	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5570-371a-b6ab-57f9a4d5effc	LR	LBR	430	Liberia 	Liberija	\N
00040000-5570-371a-b78c-72305c18b15a	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5570-371a-1f5a-3aac5df42196	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5570-371a-cbc8-3c06aea69f41	LT	LTU	440	Lithuania 	Litva	\N
00040000-5570-371a-550b-8d332a51f74c	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5570-371a-4d02-817539c75a99	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5570-371a-9145-bd8be6d0c481	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5570-371a-7acf-777981566ccb	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5570-371a-d053-43818a76ac55	MW	MWI	454	Malawi 	Malavi	\N
00040000-5570-371a-c9e8-17f40130dd43	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5570-371a-0119-a72f92990515	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5570-371a-0957-e555919b9fa6	ML	MLI	466	Mali 	Mali	\N
00040000-5570-371a-f629-c18611395885	MT	MLT	470	Malta 	Malta	\N
00040000-5570-371a-b4e5-e89bb466251e	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5570-371a-7fdd-1319ebbac854	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5570-371a-d78a-6cd69a163b18	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5570-371a-49d0-55aa547eed72	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5570-371a-c775-f6255e441146	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5570-371a-c544-90e3790c4d82	MX	MEX	484	Mexico 	Mehika	\N
00040000-5570-371a-1af4-53c7fd5e4803	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5570-371a-c8d3-1aaf0576d248	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5570-371a-1ec7-1f9aa60c7b77	MC	MCO	492	Monaco 	Monako	\N
00040000-5570-371a-3cec-504c4101339e	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5570-371a-bde9-9b9819ccba7e	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5570-371a-641f-eaf3e8c96c16	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5570-371a-88ca-f05dd98ed297	MA	MAR	504	Morocco 	Maroko	\N
00040000-5570-371a-57f4-29220b6ede4a	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5570-371a-b193-95553f489d68	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5570-371a-ae77-31d22dca2326	NA	NAM	516	Namibia 	Namibija	\N
00040000-5570-371a-f15b-fe571cd070cc	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5570-371a-20c2-1ab25556dea8	NP	NPL	524	Nepal 	Nepal	\N
00040000-5570-371a-a59c-70eebd037396	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5570-371a-042a-6a71c51d7799	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5570-371a-8ae0-549ee16acb84	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5570-371a-e32e-af25b237db3f	NE	NER	562	Niger 	Niger 	\N
00040000-5570-371a-58be-adc9443450a9	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5570-371a-7cab-9a423d1b9dd7	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5570-371a-0164-327d4c5fefc2	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5570-371a-23d6-86a512b4c6d9	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5570-371a-9dc0-9f213711c978	NO	NOR	578	Norway 	Norveška	\N
00040000-5570-371a-1f31-f6f33ef22e85	OM	OMN	512	Oman 	Oman	\N
00040000-5570-371a-dcf4-a8cfb52d11d1	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5570-371a-18f6-c9146eb1f878	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5570-371a-8aad-ce11af0703a3	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5570-371a-5046-50cae5eafaba	PA	PAN	591	Panama 	Panama	\N
00040000-5570-371a-68ac-ab191b6a47c2	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5570-371a-7f9c-ea415a260ce8	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5570-371a-40e9-520eebb9484e	PE	PER	604	Peru 	Peru	\N
00040000-5570-371a-f7f0-9301f045b55b	PH	PHL	608	Philippines 	Filipini	\N
00040000-5570-371a-434f-a23c964ce802	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5570-371a-489f-01fe98727df0	PL	POL	616	Poland 	Poljska	\N
00040000-5570-371a-1c7a-b3b7808204ff	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5570-371a-3b85-a36e41b20f78	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5570-371a-491a-2aadbf2de74d	QA	QAT	634	Qatar 	Katar	\N
00040000-5570-371a-aa69-3fb21a25d079	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5570-371a-b83c-f66911746975	RO	ROU	642	Romania 	Romunija	\N
00040000-5570-371a-2137-a1a6fc2c7e60	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5570-371a-2138-a096cd36c141	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5570-371a-df41-76cc5a619100	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5570-371a-5771-e156ddf2b077	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5570-371a-1734-324e8ba4b28a	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5570-371a-9d9c-7e9a75002201	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5570-371a-68a9-aa87ea2cb554	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5570-371a-3927-242804e8fab7	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5570-371a-5a0c-456e4618f714	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5570-371a-7539-bba9eb863213	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5570-371a-305a-68dbabbde0ba	SM	SMR	674	San Marino 	San Marino	\N
00040000-5570-371a-3896-532b7f371519	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5570-371a-b85b-ddae7da52f34	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5570-371a-5b75-ec19c486b19a	SN	SEN	686	Senegal 	Senegal	\N
00040000-5570-371a-965f-0b5113ff6834	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5570-371a-6e35-8a2e22bfd2c2	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5570-371a-056c-81ef8ea714f8	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5570-371a-c424-16a9f9e46304	SG	SGP	702	Singapore 	Singapur	\N
00040000-5570-371a-eddc-cb387ef07cf2	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5570-371a-bb64-489d94cd79c6	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5570-371a-a9da-52b964c81a20	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5570-371a-d87c-1323af2f3910	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5570-371a-e2f2-15a619f44d91	SO	SOM	706	Somalia 	Somalija	\N
00040000-5570-371a-8450-0da8cb2550f4	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5570-371a-e91c-6868e7eb1a28	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5570-371a-7936-44ac2ef4a0ab	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5570-371a-ac97-a915899e3045	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5570-371a-5e61-a80c57b2638f	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5570-371a-dd95-4f46a0f95a8a	SD	SDN	729	Sudan 	Sudan	\N
00040000-5570-371a-64ee-3a8a18d82d0a	SR	SUR	740	Suriname 	Surinam	\N
00040000-5570-371a-fb0a-d5da41d6999b	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5570-371a-ffcd-c56ea9a891ff	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5570-371a-9ff3-4bcd04fb5e85	SE	SWE	752	Sweden 	Švedska	\N
00040000-5570-371a-a96b-7485abfa735b	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5570-371a-0a8d-d75526e8ee0a	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5570-371a-4c5d-fd63c13ebd0d	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5570-371a-dcb3-c354faa151db	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5570-371a-93a8-6cb0b5b85ed4	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5570-371a-e4ae-904774dc59d5	TH	THA	764	Thailand 	Tajska	\N
00040000-5570-371a-3e0f-3ab80dc9a3ff	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5570-371a-96ef-b111eae14be0	TG	TGO	768	Togo 	Togo	\N
00040000-5570-371a-2d8e-df56afbd0369	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5570-371a-102c-e09653e4ecbc	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5570-371a-59e0-576f99e0f569	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5570-371a-a3a7-ed55e0b7b942	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5570-371a-99e3-6c9d6dd78671	TR	TUR	792	Turkey 	Turčija	\N
00040000-5570-371a-8617-21e3199f6743	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5570-371a-02a4-2f440244deb8	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5570-371a-9688-68781d7854db	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5570-371a-e513-6fa782582108	UG	UGA	800	Uganda 	Uganda	\N
00040000-5570-371a-c5ed-d1f5637ce3bc	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5570-371a-411a-69b4f33eb538	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5570-371a-7644-3fe334dfee2b	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5570-371a-bec3-b9f9a2e7eedd	US	USA	840	United States 	Združene države Amerike	\N
00040000-5570-371a-e424-9d15e6d19a72	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5570-371a-85d6-31b4343ef482	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5570-371a-8dd0-8400c45ee748	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5570-371a-38a5-5d09a2a7c555	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5570-371a-b1de-a7de17228824	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5570-371a-d5b5-0747c93d75ad	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5570-371a-07f1-9679802852ec	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5570-371a-4c51-e46bfb04745c	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5570-371a-923f-0abe5a753650	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5570-371a-0ac1-352a0205cfc8	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5570-371a-bcd2-e507451aee34	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5570-371a-a9a6-578377f1bb64	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5570-371a-89ae-588b35f5f170	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2833 (class 0 OID 6242206)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, tip_programske_enote_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tip) FROM stdin;
\.


--
-- TOC entry 2818 (class 0 OID 6242009)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5570-371b-9d24-51df3a133ce8	000e0000-5570-371b-eb92-27498c0068d8	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5570-371a-77ac-d5b88da32e6b
000d0000-5570-371b-b1ec-b0488d99edc3	000e0000-5570-371b-eb92-27498c0068d8	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5570-371a-77ac-d5b88da32e6b
000d0000-5570-371b-49e4-b27d89099060	000e0000-5570-371b-eb92-27498c0068d8	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5570-371a-dca8-f26074a91be6
000d0000-5570-371b-2f39-4d60e76f83f7	000e0000-5570-371b-eb92-27498c0068d8	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5570-371a-61f8-f4de8f1fcd93
000d0000-5570-371b-e66a-3813f1e5c9bb	000e0000-5570-371b-eb92-27498c0068d8	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5570-371a-61f8-f4de8f1fcd93
000d0000-5570-371b-2536-61dc5d09cba0	000e0000-5570-371b-eb92-27498c0068d8	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5570-371a-61f8-f4de8f1fcd93
\.


--
-- TOC entry 2797 (class 0 OID 6241829)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2801 (class 0 OID 6241877)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2795 (class 0 OID 6241809)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
\.


--
-- TOC entry 2775 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2807 (class 0 OID 6241926)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2811 (class 0 OID 6241951)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2792 (class 0 OID 6241766)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5570-371a-515f-e535368837e8	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5570-371a-1eb4-3f0684d16516	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5570-371a-954b-172d3782f194	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5570-371a-563a-57929085f7cb	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5570-371a-c0f9-0110d6633d5d	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5570-371a-dd30-be31f5482ba4	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5570-371a-6ad3-d39e7ec7f6f8	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5570-371a-4bff-dfacc667c1fd	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5570-371a-b161-b20e467dc53e	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5570-371a-df33-3c49c18ed332	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5570-371a-ecda-d5e6141709e7	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5570-371a-310b-64d7b32ed687	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5570-371a-e3cf-821d7eaa4499	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5570-371a-07ca-9f78a220db3e	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5570-371a-b956-700f9524c133	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5570-371a-2578-62ff61749d13	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2786 (class 0 OID 6241679)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5570-371a-ba5d-ae26668756a4	00000000-5570-371a-c0f9-0110d6633d5d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5570-371a-5e2d-6b421c1f5cec	00000000-5570-371a-c0f9-0110d6633d5d	00010000-5570-371a-3d10-b0a89bd43025	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5570-371a-cc51-380b64f45631	00000000-5570-371a-dd30-be31f5482ba4	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2787 (class 0 OID 6241690)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5570-371b-12b3-031e60dfeb80	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5570-371b-a9fc-7c63bd7c8fc9	00010000-5570-371b-c86e-61b3169ffa66	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5570-371b-6183-b41e836e8993	00010000-5570-371b-a43f-7df23247c30a	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5570-371b-c226-59f629ed5607	00010000-5570-371b-118e-cb1ba5dcc6e7	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5570-371b-4f06-9225f944ec22	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5570-371b-ad67-5691af781926	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5570-371b-62bb-9d8ae966ed87	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5570-371b-d5aa-b1a8405e18d1	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5570-371b-a4bb-c24db3d7f29f	00010000-5570-371b-356e-43a021ee6f85	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5570-371b-e626-af7fa50085bb	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5570-371b-d272-7c86165ff94b	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5570-371b-ff6f-793acf13570b	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5570-371b-65d6-3ec30aab10b6	00010000-5570-371b-12b6-36eec6deab56	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2777 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2782 (class 0 OID 6241644)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5570-371a-ec9f-d5aa549df7ce	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5570-371a-ff0c-4ba260df9ec8	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5570-371a-1a74-854cc6969994	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5570-371a-e482-8f5a44976e90	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5570-371a-6be4-c46a708e7a40	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5570-371a-900f-6b34d1d2d369	Abonma-read	Abonma - branje	f
00030000-5570-371a-52e4-5c23726f3d3d	Abonma-write	Abonma - spreminjanje	f
00030000-5570-371a-e69a-82f805eb0ecb	Alternacija-read	Alternacija - branje	f
00030000-5570-371a-5f50-82b6a14b0fb7	Alternacija-write	Alternacija - spreminjanje	f
00030000-5570-371a-c0e3-9fd24c5cfeb6	Arhivalija-read	Arhivalija - branje	f
00030000-5570-371a-4eb2-e97ca7e4acdb	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5570-371a-a1a5-a1270f8a2be7	Besedilo-read	Besedilo - branje	f
00030000-5570-371a-2302-e0da9ebaa1ce	Besedilo-write	Besedilo - spreminjanje	f
00030000-5570-371a-9f31-d186c116b9d7	DogodekIzven-read	DogodekIzven - branje	f
00030000-5570-371a-e670-861e14182f97	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5570-371a-0de7-139789448fa6	Dogodek-read	Dogodek - branje	f
00030000-5570-371a-f420-7fda3c8e5d7e	Dogodek-write	Dogodek - spreminjanje	f
00030000-5570-371a-e0b7-a97950c41fbf	Drzava-read	Drzava - branje	f
00030000-5570-371a-d9b7-3e980ca21090	Drzava-write	Drzava - spreminjanje	f
00030000-5570-371a-569c-ea2db6f17857	Funkcija-read	Funkcija - branje	f
00030000-5570-371a-17f0-89625ed06362	Funkcija-write	Funkcija - spreminjanje	f
00030000-5570-371a-b0ce-3df1bc2d84c6	Gostovanje-read	Gostovanje - branje	f
00030000-5570-371a-dbe2-41c98b8c463e	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5570-371a-c8e8-131016695861	Gostujoca-read	Gostujoca - branje	f
00030000-5570-371a-cc1a-3170045480d8	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5570-371a-b7d1-7092c03083c2	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5570-371a-3d61-59421b79b9de	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5570-371a-fc53-70d26c92162f	Kupec-read	Kupec - branje	f
00030000-5570-371a-115c-d11d1b0821e0	Kupec-write	Kupec - spreminjanje	f
00030000-5570-371a-b3c8-1063a59bff2f	NacinPlacina-read	NacinPlacina - branje	f
00030000-5570-371a-3555-c674f292ec5b	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5570-371a-67b4-b1df9fb44f6f	Option-read	Option - branje	f
00030000-5570-371a-df82-8a6d8cc32b57	Option-write	Option - spreminjanje	f
00030000-5570-371a-1955-28ef0e0ea51c	OptionValue-read	OptionValue - branje	f
00030000-5570-371a-8089-5cde366b42a6	OptionValue-write	OptionValue - spreminjanje	f
00030000-5570-371a-7d02-09c8d02c6e8b	Oseba-read	Oseba - branje	f
00030000-5570-371a-3ce7-932008c2e800	Oseba-write	Oseba - spreminjanje	f
00030000-5570-371a-8cce-9fef9f9e1a62	Permission-read	Permission - branje	f
00030000-5570-371a-45b8-7a72c746afd0	Permission-write	Permission - spreminjanje	f
00030000-5570-371a-40ec-04af5fc60769	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5570-371a-d042-52fc8547fc3d	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5570-371a-4d1d-4f76c7d194e4	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5570-371a-3f92-9766d58b00ed	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5570-371a-7022-21e61dfd94b8	Pogodba-read	Pogodba - branje	f
00030000-5570-371a-adae-275dbc8f6296	Pogodba-write	Pogodba - spreminjanje	f
00030000-5570-371a-69b9-c2ecb034fd8a	Popa-read	Popa - branje	f
00030000-5570-371a-f713-b3e73debd9f8	Popa-write	Popa - spreminjanje	f
00030000-5570-371a-6624-30a96d2ebe94	Posta-read	Posta - branje	f
00030000-5570-371a-5c0f-988335e859c2	Posta-write	Posta - spreminjanje	f
00030000-5570-371a-e9e5-61c04e0d76fe	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5570-371a-c1af-8b5f990d64d6	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5570-371a-6988-965f03e6788b	PostniNaslov-read	PostniNaslov - branje	f
00030000-5570-371a-ff40-533c24909ab1	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5570-371a-640f-d3044618fb8a	Predstava-read	Predstava - branje	f
00030000-5570-371a-c3cf-435729f5d4ff	Predstava-write	Predstava - spreminjanje	f
00030000-5570-371a-5ba2-765ecfda7322	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5570-371a-7eea-40add837ace1	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5570-371a-c88d-041c214d08d7	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5570-371a-db23-864784c4e03a	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5570-371a-ef4a-8bb10eb718f0	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5570-371a-8815-73e4c95befdf	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5570-371a-276d-676fc6a72091	Prostor-read	Prostor - branje	f
00030000-5570-371a-9be9-3502ff48fc93	Prostor-write	Prostor - spreminjanje	f
00030000-5570-371a-a7dd-6ba1b94c1e5c	Racun-read	Racun - branje	f
00030000-5570-371a-214d-35e3c90de87c	Racun-write	Racun - spreminjanje	f
00030000-5570-371a-0eb3-59f15a1b6a43	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5570-371a-e36f-7a73f8ffec1b	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5570-371a-c2d0-ca5e70151cee	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5570-371a-ffd6-0b427b57dea5	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5570-371a-bd4e-cd76f53a240f	Rekvizit-read	Rekvizit - branje	f
00030000-5570-371a-e5b4-30f83e7352a5	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5570-371a-aa9d-30c4a8dcbd2f	Revizija-read	Revizija - branje	f
00030000-5570-371a-609e-639945dc7e87	Revizija-write	Revizija - spreminjanje	f
00030000-5570-371a-1e0d-2b2077766d39	Rezervacija-read	Rezervacija - branje	f
00030000-5570-371a-a8b2-b041431d350b	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5570-371a-1a2a-5544a83c73d2	Role-read	Role - branje	f
00030000-5570-371a-01d5-c68e3aa54f81	Role-write	Role - spreminjanje	f
00030000-5570-371a-566f-a47620c628b9	SedezniRed-read	SedezniRed - branje	f
00030000-5570-371a-e603-c68b530eca6b	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5570-371a-e74a-e153c33f6f87	Sedez-read	Sedez - branje	f
00030000-5570-371a-f6c2-2b92460b135b	Sedez-write	Sedez - spreminjanje	f
00030000-5570-371a-704c-4bcf2c36eff0	Sezona-read	Sezona - branje	f
00030000-5570-371a-818f-4adedf90e1f7	Sezona-write	Sezona - spreminjanje	f
00030000-5570-371a-aa49-21a74b2ed268	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5570-371a-6f74-a1c83a4b679d	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5570-371a-a320-c7e97cb9b64e	Stevilcenje-read	Stevilcenje - branje	f
00030000-5570-371a-db88-52f0929b72dc	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5570-371a-9628-7dfde0c9e3f4	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5570-371a-82e7-f09f110fa196	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5570-371a-65d7-7a0561590b8c	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5570-371a-bf3e-e2e8d029a1a0	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5570-371a-de64-80bd59dca47e	Telefonska-read	Telefonska - branje	f
00030000-5570-371a-5feb-2b7a0e6790bd	Telefonska-write	Telefonska - spreminjanje	f
00030000-5570-371a-e075-a69aba664250	TerminStoritve-read	TerminStoritve - branje	f
00030000-5570-371a-ec8d-1fb8c23718fd	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5570-371a-4aa1-6a217e6068c3	TipFunkcije-read	TipFunkcije - branje	f
00030000-5570-371a-dfb4-2677c68a10c3	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5570-371a-3a78-b9cbd92b7815	Trr-read	Trr - branje	f
00030000-5570-371a-e85f-6069238a4456	Trr-write	Trr - spreminjanje	f
00030000-5570-371a-e73c-6b9f828262bf	Uprizoritev-read	Uprizoritev - branje	f
00030000-5570-371a-04ac-bc8247019668	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5570-371a-4393-943ebeea98f4	User-read	User - branje	f
00030000-5570-371a-2adf-ed8c1af694d5	User-write	User - spreminjanje	f
00030000-5570-371a-a3ee-739607555e3c	Vaja-read	Vaja - branje	f
00030000-5570-371a-8381-05a215f73c96	Vaja-write	Vaja - spreminjanje	f
00030000-5570-371a-e11e-412c9a71f5a2	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5570-371a-a529-e1d164b8d39b	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5570-371a-3ba7-f889dc09e609	Zaposlitev-read	Zaposlitev - branje	f
00030000-5570-371a-6ad7-755d448026a0	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5570-371a-715b-c124f3358c69	Zasedenost-read	Zasedenost - branje	f
00030000-5570-371a-4fac-618fcd6bf3ac	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5570-371a-a72b-1dbae901e66f	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5570-371a-7d38-082612b873a4	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5570-371a-a3aa-c58215d37fb7	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5570-371a-ef42-49ff8edd30a4	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2784 (class 0 OID 6241663)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5570-371a-b7c8-7042d3193a4c	00030000-5570-371a-e0b7-a97950c41fbf
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-900f-6b34d1d2d369
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-52e4-5c23726f3d3d
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-e69a-82f805eb0ecb
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-5f50-82b6a14b0fb7
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-c0e3-9fd24c5cfeb6
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-0de7-139789448fa6
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-e482-8f5a44976e90
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-f420-7fda3c8e5d7e
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-e0b7-a97950c41fbf
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-d9b7-3e980ca21090
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-569c-ea2db6f17857
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-17f0-89625ed06362
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-b0ce-3df1bc2d84c6
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-dbe2-41c98b8c463e
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-c8e8-131016695861
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-cc1a-3170045480d8
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-b7d1-7092c03083c2
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-3d61-59421b79b9de
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-67b4-b1df9fb44f6f
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-1955-28ef0e0ea51c
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-7d02-09c8d02c6e8b
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-3ce7-932008c2e800
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-69b9-c2ecb034fd8a
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-f713-b3e73debd9f8
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-6624-30a96d2ebe94
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-5c0f-988335e859c2
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-6988-965f03e6788b
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-ff40-533c24909ab1
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-640f-d3044618fb8a
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-c3cf-435729f5d4ff
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-ef4a-8bb10eb718f0
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-8815-73e4c95befdf
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-276d-676fc6a72091
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-9be9-3502ff48fc93
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-c2d0-ca5e70151cee
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-ffd6-0b427b57dea5
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-bd4e-cd76f53a240f
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-e5b4-30f83e7352a5
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-704c-4bcf2c36eff0
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-818f-4adedf90e1f7
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-4aa1-6a217e6068c3
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-e73c-6b9f828262bf
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-04ac-bc8247019668
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-a3ee-739607555e3c
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-8381-05a215f73c96
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-715b-c124f3358c69
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-4fac-618fcd6bf3ac
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-a72b-1dbae901e66f
00020000-5570-371a-23ba-f87da23436d1	00030000-5570-371a-a3aa-c58215d37fb7
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-900f-6b34d1d2d369
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-c0e3-9fd24c5cfeb6
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-0de7-139789448fa6
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-e0b7-a97950c41fbf
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-b0ce-3df1bc2d84c6
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-c8e8-131016695861
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-b7d1-7092c03083c2
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-3d61-59421b79b9de
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-67b4-b1df9fb44f6f
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-1955-28ef0e0ea51c
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-7d02-09c8d02c6e8b
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-3ce7-932008c2e800
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-69b9-c2ecb034fd8a
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-6624-30a96d2ebe94
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-6988-965f03e6788b
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-ff40-533c24909ab1
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-640f-d3044618fb8a
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-276d-676fc6a72091
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-c2d0-ca5e70151cee
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-bd4e-cd76f53a240f
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-704c-4bcf2c36eff0
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-de64-80bd59dca47e
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-5feb-2b7a0e6790bd
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-3a78-b9cbd92b7815
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-e85f-6069238a4456
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-3ba7-f889dc09e609
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-6ad7-755d448026a0
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-a72b-1dbae901e66f
00020000-5570-371a-a6c3-2f3c90f9741e	00030000-5570-371a-a3aa-c58215d37fb7
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-900f-6b34d1d2d369
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-e69a-82f805eb0ecb
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-c0e3-9fd24c5cfeb6
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-4eb2-e97ca7e4acdb
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-a1a5-a1270f8a2be7
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-9f31-d186c116b9d7
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-0de7-139789448fa6
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-e0b7-a97950c41fbf
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-569c-ea2db6f17857
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-b0ce-3df1bc2d84c6
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-c8e8-131016695861
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-b7d1-7092c03083c2
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-67b4-b1df9fb44f6f
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-1955-28ef0e0ea51c
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-7d02-09c8d02c6e8b
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-69b9-c2ecb034fd8a
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-6624-30a96d2ebe94
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-640f-d3044618fb8a
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-ef4a-8bb10eb718f0
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-276d-676fc6a72091
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-c2d0-ca5e70151cee
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-bd4e-cd76f53a240f
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-704c-4bcf2c36eff0
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-4aa1-6a217e6068c3
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-a3ee-739607555e3c
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-715b-c124f3358c69
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-a72b-1dbae901e66f
00020000-5570-371a-df85-e61cbcf60eaf	00030000-5570-371a-a3aa-c58215d37fb7
00020000-5570-371a-50c5-4a5c4b859ba3	00030000-5570-371a-900f-6b34d1d2d369
00020000-5570-371a-50c5-4a5c4b859ba3	00030000-5570-371a-52e4-5c23726f3d3d
00020000-5570-371a-50c5-4a5c4b859ba3	00030000-5570-371a-5f50-82b6a14b0fb7
00020000-5570-371a-50c5-4a5c4b859ba3	00030000-5570-371a-c0e3-9fd24c5cfeb6
00020000-5570-371a-50c5-4a5c4b859ba3	00030000-5570-371a-0de7-139789448fa6
00020000-5570-371a-50c5-4a5c4b859ba3	00030000-5570-371a-e0b7-a97950c41fbf
00020000-5570-371a-50c5-4a5c4b859ba3	00030000-5570-371a-b0ce-3df1bc2d84c6
00020000-5570-371a-50c5-4a5c4b859ba3	00030000-5570-371a-c8e8-131016695861
00020000-5570-371a-50c5-4a5c4b859ba3	00030000-5570-371a-67b4-b1df9fb44f6f
00020000-5570-371a-50c5-4a5c4b859ba3	00030000-5570-371a-1955-28ef0e0ea51c
00020000-5570-371a-50c5-4a5c4b859ba3	00030000-5570-371a-69b9-c2ecb034fd8a
00020000-5570-371a-50c5-4a5c4b859ba3	00030000-5570-371a-6624-30a96d2ebe94
00020000-5570-371a-50c5-4a5c4b859ba3	00030000-5570-371a-640f-d3044618fb8a
00020000-5570-371a-50c5-4a5c4b859ba3	00030000-5570-371a-276d-676fc6a72091
00020000-5570-371a-50c5-4a5c4b859ba3	00030000-5570-371a-c2d0-ca5e70151cee
00020000-5570-371a-50c5-4a5c4b859ba3	00030000-5570-371a-bd4e-cd76f53a240f
00020000-5570-371a-50c5-4a5c4b859ba3	00030000-5570-371a-704c-4bcf2c36eff0
00020000-5570-371a-50c5-4a5c4b859ba3	00030000-5570-371a-4aa1-6a217e6068c3
00020000-5570-371a-50c5-4a5c4b859ba3	00030000-5570-371a-a72b-1dbae901e66f
00020000-5570-371a-50c5-4a5c4b859ba3	00030000-5570-371a-a3aa-c58215d37fb7
00020000-5570-371a-f35c-b582be83c861	00030000-5570-371a-900f-6b34d1d2d369
00020000-5570-371a-f35c-b582be83c861	00030000-5570-371a-c0e3-9fd24c5cfeb6
00020000-5570-371a-f35c-b582be83c861	00030000-5570-371a-0de7-139789448fa6
00020000-5570-371a-f35c-b582be83c861	00030000-5570-371a-e0b7-a97950c41fbf
00020000-5570-371a-f35c-b582be83c861	00030000-5570-371a-b0ce-3df1bc2d84c6
00020000-5570-371a-f35c-b582be83c861	00030000-5570-371a-c8e8-131016695861
00020000-5570-371a-f35c-b582be83c861	00030000-5570-371a-67b4-b1df9fb44f6f
00020000-5570-371a-f35c-b582be83c861	00030000-5570-371a-1955-28ef0e0ea51c
00020000-5570-371a-f35c-b582be83c861	00030000-5570-371a-69b9-c2ecb034fd8a
00020000-5570-371a-f35c-b582be83c861	00030000-5570-371a-6624-30a96d2ebe94
00020000-5570-371a-f35c-b582be83c861	00030000-5570-371a-640f-d3044618fb8a
00020000-5570-371a-f35c-b582be83c861	00030000-5570-371a-276d-676fc6a72091
00020000-5570-371a-f35c-b582be83c861	00030000-5570-371a-c2d0-ca5e70151cee
00020000-5570-371a-f35c-b582be83c861	00030000-5570-371a-bd4e-cd76f53a240f
00020000-5570-371a-f35c-b582be83c861	00030000-5570-371a-704c-4bcf2c36eff0
00020000-5570-371a-f35c-b582be83c861	00030000-5570-371a-e075-a69aba664250
00020000-5570-371a-f35c-b582be83c861	00030000-5570-371a-1a74-854cc6969994
00020000-5570-371a-f35c-b582be83c861	00030000-5570-371a-4aa1-6a217e6068c3
00020000-5570-371a-f35c-b582be83c861	00030000-5570-371a-a72b-1dbae901e66f
00020000-5570-371a-f35c-b582be83c861	00030000-5570-371a-a3aa-c58215d37fb7
\.


--
-- TOC entry 2812 (class 0 OID 6241958)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2816 (class 0 OID 6241989)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 6242127)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2789 (class 0 OID 6241723)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5570-371b-9642-38fe22ddf374	00040000-5570-371a-f231-54e749b35204	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5570-371b-c56f-c4cb76c74c19	00040000-5570-371a-f231-54e749b35204	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5570-371b-89c7-3c2748a0def2	00040000-5570-371a-f231-54e749b35204	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5570-371b-89e2-4e578e4b2d90	00040000-5570-371a-f231-54e749b35204	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2791 (class 0 OID 6241758)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5570-3719-b9fb-8347292480b6	8341	Adlešiči
00050000-5570-3719-45f1-737f4ac333fe	5270	Ajdovščina
00050000-5570-3719-8bc0-5149ec1c07d4	6280	Ankaran/Ancarano
00050000-5570-3719-853f-9f46503429ce	9253	Apače
00050000-5570-3719-82d3-d60711232789	8253	Artiče
00050000-5570-3719-d462-fb5c254fe74c	4275	Begunje na Gorenjskem
00050000-5570-3719-aabe-eb7294080c99	1382	Begunje pri Cerknici
00050000-5570-3719-9a1d-f81806f42b32	9231	Beltinci
00050000-5570-3719-f3e0-3292fea16a44	2234	Benedikt
00050000-5570-3719-3b2e-c423de4ca35d	2345	Bistrica ob Dravi
00050000-5570-3719-994e-be536bcc04df	3256	Bistrica ob Sotli
00050000-5570-3719-0cae-ca3006d65770	8259	Bizeljsko
00050000-5570-3719-8374-efb0f6ccff1d	1223	Blagovica
00050000-5570-3719-bba1-a6c8dc6deb27	8283	Blanca
00050000-5570-3719-4380-3def289b4e98	4260	Bled
00050000-5570-3719-4c56-fe0b28ab01d3	4273	Blejska Dobrava
00050000-5570-3719-502f-4d557ee15dc5	9265	Bodonci
00050000-5570-3719-1272-a860a87dfce9	9222	Bogojina
00050000-5570-3719-6fa5-410ad18b0997	4263	Bohinjska Bela
00050000-5570-3719-f055-b3e7ab6d645e	4264	Bohinjska Bistrica
00050000-5570-3719-c454-df84bf42294e	4265	Bohinjsko jezero
00050000-5570-3719-9e96-0973a077b121	1353	Borovnica
00050000-5570-3719-328c-3763afc1f4a2	8294	Boštanj
00050000-5570-3719-5269-91b403c36861	5230	Bovec
00050000-5570-3719-7537-40bf11613b6d	5295	Branik
00050000-5570-3719-ef93-dcd4bb8c86e5	3314	Braslovče
00050000-5570-3719-b156-ed65fd23bfb5	5223	Breginj
00050000-5570-3719-17f2-202f3a40c835	8280	Brestanica
00050000-5570-3719-4b54-50f62f28ed05	2354	Bresternica
00050000-5570-3719-6e29-45b1c2ea6bf5	4243	Brezje
00050000-5570-3719-6552-8755407c7c35	1351	Brezovica pri Ljubljani
00050000-5570-3719-01de-6ec6f94a9619	8250	Brežice
00050000-5570-3719-e3c1-b952814227d5	4210	Brnik - Aerodrom
00050000-5570-3719-3e46-e46f5f4d8620	8321	Brusnice
00050000-5570-3719-488e-25f7f916953e	3255	Buče
00050000-5570-3719-c675-b844958c413a	8276	Bučka 
00050000-5570-3719-186e-3750b78ba470	9261	Cankova
00050000-5570-3719-fd45-42a984e041f7	3000	Celje 
00050000-5570-3719-5f70-12fff0ae7e16	3001	Celje - poštni predali
00050000-5570-3719-fbe7-0757cc0a2a94	4207	Cerklje na Gorenjskem
00050000-5570-3719-68dc-d4ab9889e0d2	8263	Cerklje ob Krki
00050000-5570-3719-f2a7-9ca8ea4b67ec	1380	Cerknica
00050000-5570-3719-34aa-2b6600cd57d1	5282	Cerkno
00050000-5570-3719-bb8f-aed51eedf8d0	2236	Cerkvenjak
00050000-5570-3719-f873-809780120e85	2215	Ceršak
00050000-5570-3719-50af-26e71ad2c001	2326	Cirkovce
00050000-5570-3719-326f-e536df556d33	2282	Cirkulane
00050000-5570-3719-8970-10d1059cebaf	5273	Col
00050000-5570-3719-820f-2a8e845a9e6a	8251	Čatež ob Savi
00050000-5570-3719-904e-290c440f227a	1413	Čemšenik
00050000-5570-3719-9a39-c1134ea0ce6b	5253	Čepovan
00050000-5570-3719-fa41-f60f2f3e5cb6	9232	Črenšovci
00050000-5570-3719-a51c-cef0a85952f5	2393	Črna na Koroškem
00050000-5570-3719-ff8c-dcafac58ac44	6275	Črni Kal
00050000-5570-3719-c010-7a573208c52a	5274	Črni Vrh nad Idrijo
00050000-5570-3719-95ea-4a7c70c8ee7b	5262	Črniče
00050000-5570-3719-2c27-3d35270d63e9	8340	Črnomelj
00050000-5570-3719-cecc-c136250c4261	6271	Dekani
00050000-5570-3719-6d04-aeaf5b0b0fac	5210	Deskle
00050000-5570-3719-6d54-7036a1fc4934	2253	Destrnik
00050000-5570-3719-05bb-8c96169d49bf	6215	Divača
00050000-5570-3719-9645-4001e6d06e80	1233	Dob
00050000-5570-3719-0514-8d42f8e4c8e4	3224	Dobje pri Planini
00050000-5570-3719-53bb-e934ed15c3ca	8257	Dobova
00050000-5570-3719-45a2-5e1d22e30450	1423	Dobovec
00050000-5570-3719-c2b1-4fc50c6b6b03	5263	Dobravlje
00050000-5570-3719-01d5-ca0a40b1aaac	3204	Dobrna
00050000-5570-3719-2948-e08c3e434b4d	8211	Dobrnič
00050000-5570-3719-1ba5-82e836a88086	1356	Dobrova
00050000-5570-3719-21ef-11ac4970772b	9223	Dobrovnik/Dobronak 
00050000-5570-3719-ff7c-438b44707015	5212	Dobrovo v Brdih
00050000-5570-3719-9f45-21d9c4dfbb43	1431	Dol pri Hrastniku
00050000-5570-3719-9f09-a1148f1fe55b	1262	Dol pri Ljubljani
00050000-5570-3719-078f-4566eaa6b829	1273	Dole pri Litiji
00050000-5570-3719-7a73-fc0bff9541d8	1331	Dolenja vas
00050000-5570-3719-8737-41c592be941f	8350	Dolenjske Toplice
00050000-5570-3719-2059-a08ef8b4ef20	1230	Domžale
00050000-5570-3719-a230-39320bd56d3c	2252	Dornava
00050000-5570-3719-2844-dfef24658b43	5294	Dornberk
00050000-5570-3719-f0f6-9698654b7d5f	1319	Draga
00050000-5570-3719-a2e5-e8a6440c6321	8343	Dragatuš
00050000-5570-3719-3ad0-a1d6cffdef53	3222	Dramlje
00050000-5570-3719-2d96-6d9ce41f33f3	2370	Dravograd
00050000-5570-3719-544d-fc157b8bc803	4203	Duplje
00050000-5570-3719-8e84-fa366245eba3	6221	Dutovlje
00050000-5570-3719-0d45-aa212cab6b98	8361	Dvor
00050000-5570-3719-eddb-965d42dff8d3	2343	Fala
00050000-5570-3719-653a-3ecaf8e094d1	9208	Fokovci
00050000-5570-3719-d094-4d8862e1a603	2313	Fram
00050000-5570-3719-1be4-5e63aae9bc73	3213	Frankolovo
00050000-5570-3719-ed22-ea05c835cea0	1274	Gabrovka
00050000-5570-3719-ea01-4cbbe2e0cac6	8254	Globoko
00050000-5570-3719-62f0-1c77ff5df069	5275	Godovič
00050000-5570-3719-4360-46b9c7bd2019	4204	Golnik
00050000-5570-3719-9cdc-716860e6ebd9	3303	Gomilsko
00050000-5570-3719-04db-0aa76f1b6d6d	4224	Gorenja vas
00050000-5570-3719-270a-798e39ddfda1	3263	Gorica pri Slivnici
00050000-5570-3719-236e-b71396f08163	2272	Gorišnica
00050000-5570-3719-0fbf-04a687ded9a4	9250	Gornja Radgona
00050000-5570-3719-c35b-34848b0d7690	3342	Gornji Grad
00050000-5570-3719-4151-0a4907a72779	4282	Gozd Martuljek
00050000-5570-3719-e93d-b8da33372ad3	6272	Gračišče
00050000-5570-3719-0c28-034d46ee6bb4	9264	Grad
00050000-5570-3719-d5fe-544497437593	8332	Gradac
00050000-5570-3719-fdc7-e732f9fe8bbd	1384	Grahovo
00050000-5570-3719-0c45-43d5ba376c7e	5242	Grahovo ob Bači
00050000-5570-3719-fa3c-107c1d58b542	5251	Grgar
00050000-5570-3719-26e3-001d6013eea4	3302	Griže
00050000-5570-3719-0224-a5e0dce97113	3231	Grobelno
00050000-5570-3719-d808-fac18dbe5b62	1290	Grosuplje
00050000-5570-3719-9cfb-d315fce1fa00	2288	Hajdina
00050000-5570-3719-40d7-9b44323148fd	8362	Hinje
00050000-5570-3719-2270-5025e4343ea9	2311	Hoče
00050000-5570-3719-cf15-2c08835cc941	9205	Hodoš/Hodos
00050000-5570-3719-3049-d458a5a33c6e	1354	Horjul
00050000-5570-3719-626b-e1cd3e6048c7	1372	Hotedršica
00050000-5570-3719-6bcd-cb1ea0b1bc61	1430	Hrastnik
00050000-5570-3719-df37-c76716f11c0d	6225	Hruševje
00050000-5570-3719-acda-d11c42cb3841	4276	Hrušica
00050000-5570-3719-2189-7e68092a37a6	5280	Idrija
00050000-5570-3719-02fb-9a661fd5d774	1292	Ig
00050000-5570-3719-96cc-239aea7c9077	6250	Ilirska Bistrica
00050000-5570-3719-cc6a-94553b1163e5	6251	Ilirska Bistrica-Trnovo
00050000-5570-3719-7e54-735982d79b71	1295	Ivančna Gorica
00050000-5570-3719-47c5-15f1d2b86376	2259	Ivanjkovci
00050000-5570-3719-ec42-5c8b91b79a35	1411	Izlake
00050000-5570-3719-357a-8b89919bef68	6310	Izola/Isola
00050000-5570-3719-650a-2de163c8cccd	2222	Jakobski Dol
00050000-5570-3719-5c2e-931fc88d4f6b	2221	Jarenina
00050000-5570-3719-096a-6fb556aa8e43	6254	Jelšane
00050000-5570-3719-d68a-f056f10b3a79	4270	Jesenice
00050000-5570-3719-41e2-07a454ddc21c	8261	Jesenice na Dolenjskem
00050000-5570-3719-583e-38511aaf1d9d	3273	Jurklošter
00050000-5570-3719-c278-b15529fc8cf6	2223	Jurovski Dol
00050000-5570-3719-fbcf-55dc1cc0ec66	2256	Juršinci
00050000-5570-3719-3a59-04c646ec51c7	5214	Kal nad Kanalom
00050000-5570-3719-37ff-ec6fc1eb0020	3233	Kalobje
00050000-5570-3719-8e3e-e027218c1222	4246	Kamna Gorica
00050000-5570-3719-171c-cdb3e1e90c48	2351	Kamnica
00050000-5570-3719-6892-251668dbdb00	1241	Kamnik
00050000-5570-3719-08bc-e455d3e2192e	5213	Kanal
00050000-5570-3719-1fd0-e15736e5fb16	8258	Kapele
00050000-5570-3719-3ee2-13a987c4fda8	2362	Kapla
00050000-5570-3719-1d43-735fbc0db1e0	2325	Kidričevo
00050000-5570-3719-520b-bdebcbc293e5	1412	Kisovec
00050000-5570-3719-989e-300118cdbb74	6253	Knežak
00050000-5570-3719-c04f-a67b1d6dc4ce	5222	Kobarid
00050000-5570-3719-0711-ede5669cc326	9227	Kobilje
00050000-5570-3719-e6e9-5a8bbd019d98	1330	Kočevje
00050000-5570-3719-4673-c0f4157b2307	1338	Kočevska Reka
00050000-5570-3719-14d9-df9e61d88e3c	2276	Kog
00050000-5570-3719-aac4-87e76ef98aa7	5211	Kojsko
00050000-5570-3719-c944-55b991a4c7d7	6223	Komen
00050000-5570-3719-fc1a-e6c726b6d3c6	1218	Komenda
00050000-5570-3719-615a-65b01f8842a9	6000	Koper/Capodistria 
00050000-5570-3719-b462-ede01f687028	6001	Koper/Capodistria - poštni predali
00050000-5570-3719-8201-892ca7ddd2a4	8282	Koprivnica
00050000-5570-3719-f5ae-3cac8008a29b	5296	Kostanjevica na Krasu
00050000-5570-3719-cb88-e810844c28e0	8311	Kostanjevica na Krki
00050000-5570-3719-971e-5983f15928e8	1336	Kostel
00050000-5570-3719-862e-8240660b04c1	6256	Košana
00050000-5570-3719-2d63-89977a3e06f7	2394	Kotlje
00050000-5570-3719-e94e-2345522c7776	6240	Kozina
00050000-5570-3719-8c46-2cc55e6ad1d5	3260	Kozje
00050000-5570-3719-51a0-638838714f5b	4000	Kranj 
00050000-5570-3719-f05f-742b04e8fefa	4001	Kranj - poštni predali
00050000-5570-3719-f137-7fda1b8af8f0	4280	Kranjska Gora
00050000-5570-3719-8579-0ec96f9c5d54	1281	Kresnice
00050000-5570-3719-e184-c3f6482b19b3	4294	Križe
00050000-5570-3719-a00a-5584adf7c440	9206	Križevci
00050000-5570-3719-c8b8-4116f1b38ecf	9242	Križevci pri Ljutomeru
00050000-5570-3719-3d76-929858a3b950	1301	Krka
00050000-5570-3719-8287-0273a8e3c60a	8296	Krmelj
00050000-5570-3719-c522-f5797455471e	4245	Kropa
00050000-5570-3719-c404-a156b756655d	8262	Krška vas
00050000-5570-3719-1276-075bab26b531	8270	Krško
00050000-5570-3719-c01e-29093007aee3	9263	Kuzma
00050000-5570-3719-30c4-041af5c20d48	2318	Laporje
00050000-5570-3719-8402-4e1fcaf2909f	3270	Laško
00050000-5570-3719-4b0a-276bf677b9c1	1219	Laze v Tuhinju
00050000-5570-3719-3f13-d0496979a3a1	2230	Lenart v Slovenskih goricah
00050000-5570-3719-d993-0a262d622c6e	9220	Lendava/Lendva
00050000-5570-3719-4c35-cbea9a3586e8	4248	Lesce
00050000-5570-3719-315b-80ddd526effb	3261	Lesično
00050000-5570-3719-ed89-b10d4c73309a	8273	Leskovec pri Krškem
00050000-5570-3719-4924-5eb62d345844	2372	Libeliče
00050000-5570-3719-3bf3-3e376212b274	2341	Limbuš
00050000-5570-3719-865a-d0b969bccf60	1270	Litija
00050000-5570-3719-d366-63473aba42e4	3202	Ljubečna
00050000-5570-3719-5985-e719e8a0d28e	1000	Ljubljana 
00050000-5570-3719-bead-f50aa1b1ce0e	1001	Ljubljana - poštni predali
00050000-5570-3719-b70b-63c868e81f1d	1231	Ljubljana - Črnuče
00050000-5570-3719-209d-94756de00107	1261	Ljubljana - Dobrunje
00050000-5570-3719-3aab-34e0ae94f11c	1260	Ljubljana - Polje
00050000-5570-3719-49be-82aa5f2dfdb2	1210	Ljubljana - Šentvid
00050000-5570-3719-e5d5-997b6e78d94e	1211	Ljubljana - Šmartno
00050000-5570-3719-c607-7a4422a719ed	3333	Ljubno ob Savinji
00050000-5570-3719-4a51-c222c3a08a5f	9240	Ljutomer
00050000-5570-3719-d399-931bee5a9cf6	3215	Loče
00050000-5570-3719-a02a-145c3637dd4f	5231	Log pod Mangartom
00050000-5570-3719-321f-9fd4322f7d7e	1358	Log pri Brezovici
00050000-5570-3719-7c9d-891f91f7ad6a	1370	Logatec
00050000-5570-3719-85d3-c18ffb2e4cb8	1371	Logatec
00050000-5570-3719-8ffe-59c20f31e3aa	1434	Loka pri Zidanem Mostu
00050000-5570-3719-0b48-2e5432a34889	3223	Loka pri Žusmu
00050000-5570-3719-fba9-487d5956454d	6219	Lokev
00050000-5570-3719-3bf0-8f63244aac13	1318	Loški Potok
00050000-5570-3719-c432-3200bb253fb2	2324	Lovrenc na Dravskem polju
00050000-5570-3719-32f6-c6eb12025859	2344	Lovrenc na Pohorju
00050000-5570-3719-484a-b006d6a6e20e	3334	Luče
00050000-5570-3719-6a41-4e793497b46e	1225	Lukovica
00050000-5570-3719-00f1-9bca1c1c038f	9202	Mačkovci
00050000-5570-3719-cd6c-eda213cf03dd	2322	Majšperk
00050000-5570-3719-69c8-baa836685edd	2321	Makole
00050000-5570-3719-6424-b3ea959bb8c5	9243	Mala Nedelja
00050000-5570-3719-6a12-05608779be73	2229	Malečnik
00050000-5570-3719-4471-36b89956fa23	6273	Marezige
00050000-5570-3719-9dde-8f681e6f3ee7	2000	Maribor 
00050000-5570-3719-2b36-ba7811af78d5	2001	Maribor - poštni predali
00050000-5570-3719-0fb8-cdab698d37a6	2206	Marjeta na Dravskem polju
00050000-5570-3719-db8a-3846ef275722	2281	Markovci
00050000-5570-3719-8a6e-0c632b060842	9221	Martjanci
00050000-5570-3719-831c-9d6cda7e897a	6242	Materija
00050000-5570-3719-d47d-ca20d896d390	4211	Mavčiče
00050000-5570-3719-6a4b-ef47f6b64f54	1215	Medvode
00050000-5570-3719-c72d-a39209ddea34	1234	Mengeš
00050000-5570-3719-b5f5-102a36aa8802	8330	Metlika
00050000-5570-3719-35d4-be62e15ad662	2392	Mežica
00050000-5570-3719-5cf9-0fdc68e8d825	2204	Miklavž na Dravskem polju
00050000-5570-3719-29d6-eb5de6ff0ca3	2275	Miklavž pri Ormožu
00050000-5570-3719-cfb6-fcec8b884bf2	5291	Miren
00050000-5570-3719-ab37-213429910fd4	8233	Mirna
00050000-5570-3719-a009-551fd718f6ce	8216	Mirna Peč
00050000-5570-3719-fedc-6d529d286d69	2382	Mislinja
00050000-5570-3719-5512-5cf4cbd7edb5	4281	Mojstrana
00050000-5570-3719-7cf0-e3b1db634326	8230	Mokronog
00050000-5570-3719-9a5c-9423b64f85f3	1251	Moravče
00050000-5570-3719-37c0-3137b47ab9e4	9226	Moravske Toplice
00050000-5570-3719-11c3-34baad591319	5216	Most na Soči
00050000-5570-3719-0ab6-c7ada8987d3b	1221	Motnik
00050000-5570-3719-bdc0-5797ec4f3085	3330	Mozirje
00050000-5570-3719-4a73-55e72b49f164	9000	Murska Sobota 
00050000-5570-3719-0a28-888ffc128795	9001	Murska Sobota - poštni predali
00050000-5570-3719-ff7f-6ba4d0f6d342	2366	Muta
00050000-5570-3719-5a82-8064746866f1	4202	Naklo
00050000-5570-3719-660d-c8580ac729e1	3331	Nazarje
00050000-5570-3719-af0e-eef9e92a833b	1357	Notranje Gorice
00050000-5570-3719-2fe6-eea986006ce2	3203	Nova Cerkev
00050000-5570-3719-f059-685229ec0685	5000	Nova Gorica 
00050000-5570-3719-f060-1b8a98e0cb67	5001	Nova Gorica - poštni predali
00050000-5570-3719-8a2c-21508f639056	1385	Nova vas
00050000-5570-3719-c87c-de594b959a1a	8000	Novo mesto
00050000-5570-3719-0595-2610e586fa38	8001	Novo mesto - poštni predali
00050000-5570-3719-905e-a24de834a317	6243	Obrov
00050000-5570-3719-a892-fc4fff7436ee	9233	Odranci
00050000-5570-3719-3d68-65389392d785	2317	Oplotnica
00050000-5570-3719-2744-ac64ad16eb16	2312	Orehova vas
00050000-5570-3719-2319-91ee36b6e62b	2270	Ormož
00050000-5570-3719-0ff1-da1c09e29b91	1316	Ortnek
00050000-5570-3719-65ba-9ac0991c4820	1337	Osilnica
00050000-5570-3719-29f4-e97761d9c1f8	8222	Otočec
00050000-5570-3719-e9b1-322041158b1d	2361	Ožbalt
00050000-5570-3719-183f-5556953503ab	2231	Pernica
00050000-5570-3719-9a75-f559a370e591	2211	Pesnica pri Mariboru
00050000-5570-3719-26cd-9ecb95483077	9203	Petrovci
00050000-5570-3719-afa3-312e9bd7d416	3301	Petrovče
00050000-5570-3719-6f31-503a1274c907	6330	Piran/Pirano
00050000-5570-3719-bed8-77f517a0990a	8255	Pišece
00050000-5570-3719-6bbc-da7062c34348	6257	Pivka
00050000-5570-3719-e09e-576991e84df8	6232	Planina
00050000-5570-3719-eebd-ed713c8fa396	3225	Planina pri Sevnici
00050000-5570-3719-45fc-a850fd4cbcf0	6276	Pobegi
00050000-5570-3719-adac-62cb74740162	8312	Podbočje
00050000-5570-3719-5eab-efbe3fab0179	5243	Podbrdo
00050000-5570-3719-541b-e21f53fc3c2a	3254	Podčetrtek
00050000-5570-3719-1126-e99c63df936e	2273	Podgorci
00050000-5570-3719-f81c-e6a0eba50c54	6216	Podgorje
00050000-5570-3719-6dc8-4ba909a2c064	2381	Podgorje pri Slovenj Gradcu
00050000-5570-3719-2a62-5c84cd9b8f2f	6244	Podgrad
00050000-5570-3719-df3e-d0576cc72a19	1414	Podkum
00050000-5570-3719-23f8-ba15abb7a30f	2286	Podlehnik
00050000-5570-3719-d558-c4dff3d95498	5272	Podnanos
00050000-5570-3719-a8f0-416bcb51739f	4244	Podnart
00050000-5570-3719-b8c1-e7789acd497d	3241	Podplat
00050000-5570-3719-bd7e-5c818eccf8fb	3257	Podsreda
00050000-5570-3719-e90d-9a26dd38888f	2363	Podvelka
00050000-5570-3719-ea87-4e58b966778e	2208	Pohorje
00050000-5570-3719-11ba-8ae6c6fa4d2e	2257	Polenšak
00050000-5570-3719-cb20-428c72a90f33	1355	Polhov Gradec
00050000-5570-3719-682e-46c2f618fcb9	4223	Poljane nad Škofjo Loko
00050000-5570-3719-26d8-f6e1b690e967	2319	Poljčane
00050000-5570-3719-e03f-50113c68e08e	1272	Polšnik
00050000-5570-3719-318b-cf88ff1b85a4	3313	Polzela
00050000-5570-3719-e126-61d9e6bbec3b	3232	Ponikva
00050000-5570-3719-d7cd-399208f89464	6320	Portorož/Portorose
00050000-5570-3719-6663-d8709c7dfabc	6230	Postojna
00050000-5570-3719-ea09-b89bc48860e8	2331	Pragersko
00050000-5570-3719-1f8d-be3b8e213df7	3312	Prebold
00050000-5570-3719-45c3-e7017b106dc7	4205	Preddvor
00050000-5570-3719-33b5-94462c12a005	6255	Prem
00050000-5570-3719-3e4d-26d19c15eebf	1352	Preserje
00050000-5570-3719-adec-0cc9983c9076	6258	Prestranek
00050000-5570-3719-b414-6ac547cd5430	2391	Prevalje
00050000-5570-3719-c26d-94241d253f2b	3262	Prevorje
00050000-5570-3719-9b28-60c5690ee1a7	1276	Primskovo 
00050000-5570-3719-83ca-1bc10bb802fb	3253	Pristava pri Mestinju
00050000-5570-3719-0c31-ecc3270a1d77	9207	Prosenjakovci/Partosfalva
00050000-5570-3719-d946-6e2b0880b276	5297	Prvačina
00050000-5570-3719-90ef-d7262632a2d7	2250	Ptuj
00050000-5570-3719-abc5-e32ed4d6bc88	2323	Ptujska Gora
00050000-5570-3719-692a-571d50b4da1e	9201	Puconci
00050000-5570-3719-1e9d-f59896a2309a	2327	Rače
00050000-5570-3719-02da-c1851a9b14e4	1433	Radeče
00050000-5570-3719-faef-804a57fea2a2	9252	Radenci
00050000-5570-3719-2f46-87ef46c2cc13	2360	Radlje ob Dravi
00050000-5570-3719-e218-f34d286d8407	1235	Radomlje
00050000-5570-3719-e31b-54780bf05cf8	4240	Radovljica
00050000-5570-3719-ddac-f92b5c741c49	8274	Raka
00050000-5570-3719-002b-d4397a89b75a	1381	Rakek
00050000-5570-3719-f50a-4b2c8a8f008b	4283	Rateče - Planica
00050000-5570-3719-b1b0-69eee622da5f	2390	Ravne na Koroškem
00050000-5570-3719-4734-8cae1d01d844	9246	Razkrižje
00050000-5570-3719-a070-d8d09a857935	3332	Rečica ob Savinji
00050000-5570-3719-75a6-fe7beece6710	5292	Renče
00050000-5570-3719-9363-87364edf248e	1310	Ribnica
00050000-5570-3719-7025-8e4ab4fbbfd5	2364	Ribnica na Pohorju
00050000-5570-3719-fe40-e7732554fb1c	3272	Rimske Toplice
00050000-5570-3719-211e-d1e027e1d686	1314	Rob
00050000-5570-3719-78df-5c054566f8ed	5215	Ročinj
00050000-5570-3719-1ad5-33d2ddd82393	3250	Rogaška Slatina
00050000-5570-3719-bfd7-fe0824197b3e	9262	Rogašovci
00050000-5570-3719-3183-4993328e4480	3252	Rogatec
00050000-5570-3719-1e04-2b438421b96c	1373	Rovte
00050000-5570-3719-e6ea-5ceb15aef583	2342	Ruše
00050000-5570-3719-3a1a-b1f56a2255d6	1282	Sava
00050000-5570-3719-a94c-c8dd630b5ecd	6333	Sečovlje/Sicciole
00050000-5570-3719-1b9c-863090220d25	4227	Selca
00050000-5570-3719-80f4-390eb388b30e	2352	Selnica ob Dravi
00050000-5570-3719-7a39-849d6eff0483	8333	Semič
00050000-5570-3719-dc4a-ff9abf457cb0	8281	Senovo
00050000-5570-3719-01bf-0ed0487d89c3	6224	Senožeče
00050000-5570-3719-161b-73f46411c3ad	8290	Sevnica
00050000-5570-3719-082e-a3c02b134be6	6210	Sežana
00050000-5570-3719-e320-bb4e375d602d	2214	Sladki Vrh
00050000-5570-3719-a965-29097e21de18	5283	Slap ob Idrijci
00050000-5570-3719-cc70-d72a640a2854	2380	Slovenj Gradec
00050000-5570-3719-c462-bf7e19375ea9	2310	Slovenska Bistrica
00050000-5570-3719-ede0-451b2fa689cd	3210	Slovenske Konjice
00050000-5570-3719-bd4c-fb478903051c	1216	Smlednik
00050000-5570-3719-c634-c46dd30dafd7	5232	Soča
00050000-5570-3719-60f2-018c26916bec	1317	Sodražica
00050000-5570-3719-beec-db741177807a	3335	Solčava
00050000-5570-3719-af92-b46438cc18b9	5250	Solkan
00050000-5570-3719-3b0c-64f2f8bffc7d	4229	Sorica
00050000-5570-3719-2c63-10e984184e01	4225	Sovodenj
00050000-5570-3719-0b4b-fc2e35aaee07	5281	Spodnja Idrija
00050000-5570-3719-146a-3f4763a97124	2241	Spodnji Duplek
00050000-5570-3719-9f0a-0d57ee1ed1b9	9245	Spodnji Ivanjci
00050000-5570-3719-1d37-55a4d502bfb8	2277	Središče ob Dravi
00050000-5570-3719-357d-f3ca92d3ee29	4267	Srednja vas v Bohinju
00050000-5570-3719-8dab-d4d544527746	8256	Sromlje 
00050000-5570-3719-0939-fcf4f867c7a1	5224	Srpenica
00050000-5570-3719-3ee5-2fdb5c4f9c95	1242	Stahovica
00050000-5570-371a-3c39-04129bf5da21	1332	Stara Cerkev
00050000-5570-371a-7064-99a95fe322ad	8342	Stari trg ob Kolpi
00050000-5570-371a-2d24-bdc506b7cd12	1386	Stari trg pri Ložu
00050000-5570-371a-9172-b02acb26cb91	2205	Starše
00050000-5570-371a-1337-c24ac65f0286	2289	Stoperce
00050000-5570-371a-bd26-72f0586c3279	8322	Stopiče
00050000-5570-371a-be18-6836245890e0	3206	Stranice
00050000-5570-371a-e0e6-21c7d5066f49	8351	Straža
00050000-5570-371a-5442-902f1edd632b	1313	Struge
00050000-5570-371a-e737-a1422f665555	8293	Studenec
00050000-5570-371a-dce1-72a07729e4c1	8331	Suhor
00050000-5570-371a-58de-89e0481fe5b7	2233	Sv. Ana v Slovenskih goricah
00050000-5570-371a-9504-fe9b9f581ea9	2235	Sv. Trojica v Slovenskih goricah
00050000-5570-371a-200b-8a9160c70317	2353	Sveti Duh na Ostrem Vrhu
00050000-5570-371a-7f68-c2a871e89094	9244	Sveti Jurij ob Ščavnici
00050000-5570-371a-f2e8-7267b99ac7d3	3264	Sveti Štefan
00050000-5570-371a-7ced-9861c936dda6	2258	Sveti Tomaž
00050000-5570-371a-5c15-851cd92418c6	9204	Šalovci
00050000-5570-371a-91ac-42467e40eb7d	5261	Šempas
00050000-5570-371a-de9a-5b603775861a	5290	Šempeter pri Gorici
00050000-5570-371a-e309-3a6feff7ff6a	3311	Šempeter v Savinjski dolini
00050000-5570-371a-b5b7-89548920bcd4	4208	Šenčur
00050000-5570-371a-6cdd-3c2e43ebdfac	2212	Šentilj v Slovenskih goricah
00050000-5570-371a-2147-93a278c2ff95	8297	Šentjanž
00050000-5570-371a-2a8a-c25301a82705	2373	Šentjanž pri Dravogradu
00050000-5570-371a-b109-b9b55f00ae89	8310	Šentjernej
00050000-5570-371a-80d1-2f6fd15b4ad1	3230	Šentjur
00050000-5570-371a-fbbe-85616ab94aee	3271	Šentrupert
00050000-5570-371a-6b1e-55b025e0f16f	8232	Šentrupert
00050000-5570-371a-6604-226515bfac5a	1296	Šentvid pri Stični
00050000-5570-371a-9535-33149f726b84	8275	Škocjan
00050000-5570-371a-dfa7-2a84a25e4c58	6281	Škofije
00050000-5570-371a-442c-5824cfdb30b6	4220	Škofja Loka
00050000-5570-371a-b988-306890b8306e	3211	Škofja vas
00050000-5570-371a-0546-907fefafeb27	1291	Škofljica
00050000-5570-371a-0590-f96e3adbea12	6274	Šmarje
00050000-5570-371a-3e28-e7326699464a	1293	Šmarje - Sap
00050000-5570-371a-3b74-5880543d05f9	3240	Šmarje pri Jelšah
00050000-5570-371a-4fdf-264ae7e5f3da	8220	Šmarješke Toplice
00050000-5570-371a-12e7-f709e1847971	2315	Šmartno na Pohorju
00050000-5570-371a-8811-e32d840fb583	3341	Šmartno ob Dreti
00050000-5570-371a-8e57-a818a47d11d5	3327	Šmartno ob Paki
00050000-5570-371a-9aa0-0c65400533ca	1275	Šmartno pri Litiji
00050000-5570-371a-0417-6922793ef652	2383	Šmartno pri Slovenj Gradcu
00050000-5570-371a-39fe-17961c6399cc	3201	Šmartno v Rožni dolini
00050000-5570-371a-8f22-19a1b2da43b1	3325	Šoštanj
00050000-5570-371a-4d50-6628977b8993	6222	Štanjel
00050000-5570-371a-fd1e-004fa5b17bef	3220	Štore
00050000-5570-371a-9552-6b6be463e893	3304	Tabor
00050000-5570-371a-2a99-e14a6cb2629d	3221	Teharje
00050000-5570-371a-980a-9e0c25d4b0bd	9251	Tišina
00050000-5570-371a-22ca-dec287306c8b	5220	Tolmin
00050000-5570-371a-a87f-ce9ca4eb6681	3326	Topolšica
00050000-5570-371a-cb23-5b29a140138e	2371	Trbonje
00050000-5570-371a-f1cc-168079b359d2	1420	Trbovlje
00050000-5570-371a-27de-5e6ac2343f6b	8231	Trebelno 
00050000-5570-371a-b77f-6f3878589266	8210	Trebnje
00050000-5570-371a-e287-851fd63900a3	5252	Trnovo pri Gorici
00050000-5570-371a-5fce-39090b7f0abe	2254	Trnovska vas
00050000-5570-371a-8a90-f04ac6502380	1222	Trojane
00050000-5570-371a-306b-888225e8543e	1236	Trzin
00050000-5570-371a-d688-37331ad90a13	4290	Tržič
00050000-5570-371a-2463-a90a2d516060	8295	Tržišče
00050000-5570-371a-8191-225d23ed1889	1311	Turjak
00050000-5570-371a-fc99-6ed85e36412c	9224	Turnišče
00050000-5570-371a-10f6-98607d8526e2	8323	Uršna sela
00050000-5570-371a-c9c6-76a98c76b35a	1252	Vače
00050000-5570-371a-b46b-a4320ffd9a3f	3320	Velenje 
00050000-5570-371a-3bdc-47a60ab20b41	3322	Velenje - poštni predali
00050000-5570-371a-8e08-c67f0837b955	8212	Velika Loka
00050000-5570-371a-bc9c-a02afd8e8431	2274	Velika Nedelja
00050000-5570-371a-38e7-3ee7bad3936c	9225	Velika Polana
00050000-5570-371a-6dcc-8353a4343b37	1315	Velike Lašče
00050000-5570-371a-2be8-b0379193edb2	8213	Veliki Gaber
00050000-5570-371a-067b-40dba0f392fe	9241	Veržej
00050000-5570-371a-b812-c59a565a71e0	1312	Videm - Dobrepolje
00050000-5570-371a-5728-64243e810316	2284	Videm pri Ptuju
00050000-5570-371a-7610-7a599079e67a	8344	Vinica
00050000-5570-371a-5cdf-2461c8309628	5271	Vipava
00050000-5570-371a-b9c3-12afac36bf8d	4212	Visoko
00050000-5570-371a-22e3-0033a40b7995	1294	Višnja Gora
00050000-5570-371a-b071-8007ce91ed84	3205	Vitanje
00050000-5570-371a-a968-12ad16a4b902	2255	Vitomarci
00050000-5570-371a-0d76-228d0aaffbaa	1217	Vodice
00050000-5570-371a-7224-96ac0f4e7dfb	3212	Vojnik\t
00050000-5570-371a-bd00-cca605d4e7b2	5293	Volčja Draga
00050000-5570-371a-c5f7-da62cf17596e	2232	Voličina
00050000-5570-371a-1b40-82968b32460b	3305	Vransko
00050000-5570-371a-78c7-e8f183adc4a8	6217	Vremski Britof
00050000-5570-371a-626a-91284b2677d1	1360	Vrhnika
00050000-5570-371a-71cf-45f6572bba9c	2365	Vuhred
00050000-5570-371a-d380-4a92e694e209	2367	Vuzenica
00050000-5570-371a-3d90-b2b24fae7bc5	8292	Zabukovje 
00050000-5570-371a-1cb8-16fda1ea4bd6	1410	Zagorje ob Savi
00050000-5570-371a-caa3-879de492e60f	1303	Zagradec
00050000-5570-371a-b8e6-bb31c4ae8178	2283	Zavrč
00050000-5570-371a-4b2c-8dbfcf8f04a6	8272	Zdole 
00050000-5570-371a-5f27-01dd057dcba5	4201	Zgornja Besnica
00050000-5570-371a-4a25-d46d953a11dd	2242	Zgornja Korena
00050000-5570-371a-6029-047f3852e486	2201	Zgornja Kungota
00050000-5570-371a-9904-985efe2580ef	2316	Zgornja Ložnica
00050000-5570-371a-5e29-58af506f1d09	2314	Zgornja Polskava
00050000-5570-371a-9e5a-398cbfc8b274	2213	Zgornja Velka
00050000-5570-371a-f8c2-636999bf530a	4247	Zgornje Gorje
00050000-5570-371a-3561-fc61b056291d	4206	Zgornje Jezersko
00050000-5570-371a-2d1b-5d8603a3f2cf	2285	Zgornji Leskovec
00050000-5570-371a-f917-2fb56f7e45c7	1432	Zidani Most
00050000-5570-371a-11c5-fdeac5530c98	3214	Zreče
00050000-5570-371a-623b-df37b8d56b56	4209	Žabnica
00050000-5570-371a-a099-c620893d65ec	3310	Žalec
00050000-5570-371a-cb72-e0b72a7b02c8	4228	Železniki
00050000-5570-371a-90f2-598d07c5745d	2287	Žetale
00050000-5570-371a-0a0f-f6caff2742da	4226	Žiri
00050000-5570-371a-fdf4-1c9c1d025959	4274	Žirovnica
00050000-5570-371a-8adb-f18115d58260	8360	Žužemberk
\.


--
-- TOC entry 2808 (class 0 OID 6241932)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2776 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2790 (class 0 OID 6241743)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2796 (class 0 OID 6241821)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2810 (class 0 OID 6241944)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 6242064)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2827 (class 0 OID 6242119)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5570-371b-aab8-a56963d7e68e	00080000-5570-371b-89c7-3c2748a0def2	0987	A
00190000-5570-371b-39b2-5e68294722e0	00080000-5570-371b-c56f-c4cb76c74c19	0989	A
\.


--
-- TOC entry 2834 (class 0 OID 6242232)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram) FROM stdin;
\.


--
-- TOC entry 2837 (class 0 OID 6242260)
-- Dependencies: 232
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id) FROM stdin;
\.


--
-- TOC entry 2852 (class 0 OID 0)
-- Dependencies: 238
-- Name: programfestival_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('programfestival_id_seq', 1, false);


--
-- TOC entry 2835 (class 0 OID 6242241)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, program_dela_id, gostitelj_id, transportnistroski, odkup) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 0)
-- Dependencies: 236
-- Name: programgostovanje_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('programgostovanje_id_seq', 1, false);


--
-- TOC entry 2814 (class 0 OID 6241973)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5570-371b-88b0-de4a08a90091	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5570-371b-cb5c-664a8392bab8	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5570-371b-10cd-d4ddccb5473c	0003	Kazinska	t	84	Kazinska dvorana
00220000-5570-371b-1d37-c1ad5e98b81e	0004	Mali oder	t	24	Mali oder 
00220000-5570-371b-6bc9-38bac2be7336	0005	Komorni oder	t	15	Komorni oder
00220000-5570-371b-902d-d4f4ee1d0899	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5570-371b-d21f-362fac08f0c5	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2806 (class 0 OID 6241917)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2805 (class 0 OID 6241907)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2826 (class 0 OID 6242108)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 6242041)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2779 (class 0 OID 6241615)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5570-371a-3d10-b0a89bd43025	00010000-5570-371a-e1ea-5c134511b875	2015-06-04 13:31:39	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROzYiFFS3sWpmVY/QEziYAlp2aWqM/hjm";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2854 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2815 (class 0 OID 6241983)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2783 (class 0 OID 6241653)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5570-371a-e246-1acb0fccf480	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5570-371a-b7c8-7042d3193a4c	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5570-371a-aa2a-94efcb9e60c9	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5570-371a-da32-3f7d81c2e84b	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5570-371a-23ba-f87da23436d1	planer	Planer dogodkov v koledarju	t
00020000-5570-371a-a6c3-2f3c90f9741e	kadrovska	Kadrovska služba	t
00020000-5570-371a-df85-e61cbcf60eaf	arhivar	Ažuriranje arhivalij	t
00020000-5570-371a-50c5-4a5c4b859ba3	igralec	Igralec	t
00020000-5570-371a-f35c-b582be83c861	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2781 (class 0 OID 6241637)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5570-371a-3d10-b0a89bd43025	00020000-5570-371a-aa2a-94efcb9e60c9
00010000-5570-371a-e1ea-5c134511b875	00020000-5570-371a-aa2a-94efcb9e60c9
\.


--
-- TOC entry 2817 (class 0 OID 6241997)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2809 (class 0 OID 6241938)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2803 (class 0 OID 6241888)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2840 (class 0 OID 6242279)
-- Dependencies: 235
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5570-371a-829e-3318dcbd01f0	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5570-371a-e058-74b9c050e89b	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5570-371a-be3a-418c300207d5	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5570-371a-09b0-5ec9d256b30b	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5570-371a-008d-7c35305922d9	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2839 (class 0 OID 6242271)
-- Dependencies: 234
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5570-371a-3f15-baaa9ab0490c	00000000-5570-371a-09b0-5ec9d256b30b	popa
00000000-5570-371a-1a2c-c5712ed5ba22	00000000-5570-371a-09b0-5ec9d256b30b	oseba
00000000-5570-371a-90d8-76d267cdece0	00000000-5570-371a-e058-74b9c050e89b	prostor
00000000-5570-371a-e95f-22fd42269607	00000000-5570-371a-09b0-5ec9d256b30b	besedilo
00000000-5570-371a-5f73-0cdb120cb1d5	00000000-5570-371a-09b0-5ec9d256b30b	uprizoritev
00000000-5570-371a-9114-6c319ac9b789	00000000-5570-371a-09b0-5ec9d256b30b	funkcija
00000000-5570-371a-4467-754c307ca85d	00000000-5570-371a-09b0-5ec9d256b30b	tipfunkcije
00000000-5570-371a-060d-af7aea0dfa72	00000000-5570-371a-09b0-5ec9d256b30b	alternacija
00000000-5570-371a-d451-e63e07643255	00000000-5570-371a-829e-3318dcbd01f0	pogodba
00000000-5570-371a-bb70-72be1cf6c729	00000000-5570-371a-09b0-5ec9d256b30b	zaposlitev
\.


--
-- TOC entry 2838 (class 0 OID 6242266)
-- Dependencies: 233
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 6242051)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2788 (class 0 OID 6241715)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2804 (class 0 OID 6241894)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5570-371b-7ad8-9a1b06c973d7	00180000-5570-371b-c060-19986d5c162b	000c0000-5570-371b-4af2-0e0c8f1e8ea1	00090000-5570-371b-a4bb-c24db3d7f29f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5570-371b-85a4-2c92b9ed0169	00180000-5570-371b-c060-19986d5c162b	000c0000-5570-371b-3944-ad0b52291bfa	00090000-5570-371b-e626-af7fa50085bb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5570-371b-3792-c13dab7e4b98	00180000-5570-371b-c060-19986d5c162b	000c0000-5570-371b-b809-f7c759e98b82	00090000-5570-371b-6183-b41e836e8993	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5570-371b-5f4f-0a279d37dc02	00180000-5570-371b-c060-19986d5c162b	000c0000-5570-371b-b17f-ba6206f947b3	00090000-5570-371b-a9fc-7c63bd7c8fc9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5570-371b-17ba-a813c6dd14e8	00180000-5570-371b-c060-19986d5c162b	000c0000-5570-371b-7d71-a3ffe22684a1	00090000-5570-371b-ff6f-793acf13570b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5570-371b-c5e3-fe3048b1f165	00180000-5570-371b-6291-aae023c078a3	\N	00090000-5570-371b-ff6f-793acf13570b	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2825 (class 0 OID 6242097)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5570-371a-77ac-d5b88da32e6b	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5570-371a-6d68-7ffd43d77b39	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5570-371a-6fab-edfe4de6e495	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5570-371a-dca8-f26074a91be6	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5570-371a-ca21-cd0b24bfa583	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5570-371a-1fcf-1f8f82363d79	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5570-371a-e33a-3325e409cd65	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5570-371a-149e-9dc7e1c54c64	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5570-371a-e72b-0b6f00a5a928	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5570-371a-0433-e41f3adddd0e	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5570-371a-1f13-446c3c6e7b9d	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5570-371a-b947-bafe05198dc0	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5570-371a-7ad3-d983c8d6846b	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5570-371a-ca3d-b46b36192fb2	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5570-371a-30b5-cb6641ff710e	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5570-371a-61f8-f4de8f1fcd93	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2836 (class 0 OID 6242249)
-- Dependencies: 231
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
\.


--
-- TOC entry 2855 (class 0 OID 0)
-- Dependencies: 237
-- Name: tipprogramskeenote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tipprogramskeenote_id_seq', 1, false);


--
-- TOC entry 2793 (class 0 OID 6241778)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2780 (class 0 OID 6241624)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5570-371a-e1ea-5c134511b875	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROddTBrba3.v5Fs/vLWRRkx.y7vuClXBK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5570-371b-a43f-7df23247c30a	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5570-371b-c86e-61b3169ffa66	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5570-371b-356e-43a021ee6f85	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5570-371b-12b6-36eec6deab56	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5570-371b-118e-cb1ba5dcc6e7	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5570-371b-4f61-103a8189b9d0	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5570-371a-3d10-b0a89bd43025	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2830 (class 0 OID 6242153)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5570-371b-b6d5-ceb687e293f1	00160000-5570-371b-389e-8b5279091f7d	00150000-5570-371a-f4d1-19d19eac99c5	00140000-5570-371a-3827-fe5b424fb217	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5570-371b-6bc9-38bac2be7336
000e0000-5570-371b-eb92-27498c0068d8	00160000-5570-371b-a03b-03c0df2efcc8	00150000-5570-371a-613b-f16dc5bd168b	00140000-5570-371a-628e-97a8e765129d	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5570-371b-902d-d4f4ee1d0899
\.


--
-- TOC entry 2798 (class 0 OID 6241840)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5570-371b-a661-c13bc9bd2a11	000e0000-5570-371b-eb92-27498c0068d8	1	
00200000-5570-371b-8a15-02c044f51813	000e0000-5570-371b-eb92-27498c0068d8	2	
\.


--
-- TOC entry 2813 (class 0 OID 6241965)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2820 (class 0 OID 6242034)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2800 (class 0 OID 6241872)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2829 (class 0 OID 6242143)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5570-371a-3827-fe5b424fb217	01	Drama	drama (SURS 01)
00140000-5570-371a-b0ec-768c33af99d5	02	Opera	opera (SURS 02)
00140000-5570-371a-0aee-048ef1266298	03	Balet	balet (SURS 03)
00140000-5570-371a-1acb-cd0e087191a0	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5570-371a-0794-95890e49b795	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5570-371a-628e-97a8e765129d	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5570-371a-907a-800051854879	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2819 (class 0 OID 6242024)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5570-371a-2dc1-5272e65510f9	01	Opera	opera
00150000-5570-371a-458a-589b5724a3c6	02	Opereta	opereta
00150000-5570-371a-cb25-360b9cbe8cf0	03	Balet	balet
00150000-5570-371a-5f78-8bdab475eae6	04	Plesne prireditve	plesne prireditve
00150000-5570-371a-02e7-a3d10901b448	05	Lutkovno gledališče	lutkovno gledališče
00150000-5570-371a-c710-b96928fd9e32	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5570-371a-d179-a253adfde153	07	Biografska drama	biografska drama
00150000-5570-371a-f4d1-19d19eac99c5	08	Komedija	komedija
00150000-5570-371a-baf6-6d3c73127fda	09	Črna komedija	črna komedija
00150000-5570-371a-0e29-003a0c782e37	10	E-igra	E-igra
00150000-5570-371a-613b-f16dc5bd168b	11	Kriminalka	kriminalka
00150000-5570-371a-f331-94fec9dc16eb	12	Musical	musical
\.


--
-- TOC entry 2371 (class 2606 OID 6241678)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 6242199)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 6242189)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2520 (class 2606 OID 6242096)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 2606 OID 6241862)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 6241887)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2405 (class 2606 OID 6241804)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 6242228)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 6242020)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 2606 OID 6241838)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2439 (class 2606 OID 6241881)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 6241818)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2342 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2463 (class 2606 OID 6241930)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 6241957)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 6241776)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2375 (class 2606 OID 6241687)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2352 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2378 (class 2606 OID 6241711)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2369 (class 2606 OID 6241667)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2362 (class 2606 OID 6241652)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 6241963)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 6241996)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 6242138)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2387 (class 2606 OID 6241740)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2395 (class 2606 OID 6241764)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 6241936)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2348 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2393 (class 2606 OID 6241754)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2418 (class 2606 OID 6241825)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 6241948)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 6242076)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 6242124)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 6242239)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 6242264)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 6242246)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 6241980)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2461 (class 2606 OID 6241921)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2455 (class 2606 OID 6241912)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 6242118)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 6242048)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2354 (class 2606 OID 6241623)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 6241987)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2360 (class 2606 OID 6241641)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2364 (class 2606 OID 6241661)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 6242005)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 6241943)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2444 (class 2606 OID 6241893)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 6242288)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2578 (class 2606 OID 6242276)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 6242270)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 6242061)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2384 (class 2606 OID 6241720)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2449 (class 2606 OID 6241903)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 6242107)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 6242259)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2403 (class 2606 OID 6241789)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2356 (class 2606 OID 6241636)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 6242169)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2424 (class 2606 OID 6241847)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 6241971)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 6242039)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 6241876)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 6242151)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 6242032)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 1259 OID 6241869)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2511 (class 1259 OID 6242062)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2512 (class 1259 OID 6242063)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2385 (class 1259 OID 6241742)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2344 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2345 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2346 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2476 (class 1259 OID 6241964)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2470 (class 1259 OID 6241950)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2471 (class 1259 OID 6241949)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2422 (class 1259 OID 6241848)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2498 (class 1259 OID 6242021)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2499 (class 1259 OID 6242023)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2500 (class 1259 OID 6242022)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2410 (class 1259 OID 6241820)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2411 (class 1259 OID 6241819)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2529 (class 1259 OID 6242140)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2530 (class 1259 OID 6242141)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2531 (class 1259 OID 6242142)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2538 (class 1259 OID 6242174)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2539 (class 1259 OID 6242171)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2540 (class 1259 OID 6242173)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2541 (class 1259 OID 6242172)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2400 (class 1259 OID 6241791)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2401 (class 1259 OID 6241790)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2349 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2350 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2376 (class 1259 OID 6241714)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2486 (class 1259 OID 6241988)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2440 (class 1259 OID 6241882)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2366 (class 1259 OID 6241668)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2367 (class 1259 OID 6241669)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2491 (class 1259 OID 6242008)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2492 (class 1259 OID 6242007)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2493 (class 1259 OID 6242006)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2414 (class 1259 OID 6241826)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2415 (class 1259 OID 6241828)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2416 (class 1259 OID 6241827)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2576 (class 1259 OID 6242278)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2450 (class 1259 OID 6241916)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2451 (class 1259 OID 6241914)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2452 (class 1259 OID 6241913)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2453 (class 1259 OID 6241915)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2357 (class 1259 OID 6241642)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2358 (class 1259 OID 6241643)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2479 (class 1259 OID 6241972)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2465 (class 1259 OID 6241937)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2507 (class 1259 OID 6242049)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2508 (class 1259 OID 6242050)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2559 (class 1259 OID 6242229)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2560 (class 1259 OID 6242231)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2561 (class 1259 OID 6242230)
-- Name: idx_8787a0e5b3836ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5b3836ea9 ON enotaprograma USING btree (tip_programske_enote_id);


--
-- TOC entry 2389 (class 1259 OID 6241756)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2390 (class 1259 OID 6241755)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2391 (class 1259 OID 6241757)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2571 (class 1259 OID 6242265)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2515 (class 1259 OID 6242077)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2516 (class 1259 OID 6242078)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2551 (class 1259 OID 6242203)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2552 (class 1259 OID 6242202)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2553 (class 1259 OID 6242205)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2554 (class 1259 OID 6242201)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2555 (class 1259 OID 6242204)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2504 (class 1259 OID 6242040)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2456 (class 1259 OID 6241925)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2457 (class 1259 OID 6241924)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2458 (class 1259 OID 6241922)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2459 (class 1259 OID 6241923)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2340 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2547 (class 1259 OID 6242191)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2548 (class 1259 OID 6242190)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2562 (class 1259 OID 6242240)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2421 (class 1259 OID 6241839)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2372 (class 1259 OID 6241689)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2373 (class 1259 OID 6241688)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2381 (class 1259 OID 6241721)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2382 (class 1259 OID 6241722)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2445 (class 1259 OID 6241906)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2446 (class 1259 OID 6241905)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2447 (class 1259 OID 6241904)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2565 (class 1259 OID 6242248)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2566 (class 1259 OID 6242247)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2428 (class 1259 OID 6241871)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2429 (class 1259 OID 6241867)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2430 (class 1259 OID 6241864)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2431 (class 1259 OID 6241865)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2432 (class 1259 OID 6241863)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2433 (class 1259 OID 6241868)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2434 (class 1259 OID 6241866)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2388 (class 1259 OID 6241741)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2406 (class 1259 OID 6241805)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2407 (class 1259 OID 6241807)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2408 (class 1259 OID 6241806)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2409 (class 1259 OID 6241808)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2464 (class 1259 OID 6241931)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2534 (class 1259 OID 6242139)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2542 (class 1259 OID 6242170)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2379 (class 1259 OID 6241712)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2380 (class 1259 OID 6241713)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2501 (class 1259 OID 6242033)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2582 (class 1259 OID 6242289)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2399 (class 1259 OID 6241777)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2579 (class 1259 OID 6242277)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2484 (class 1259 OID 6241982)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2485 (class 1259 OID 6241981)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2556 (class 1259 OID 6242200)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2343 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2396 (class 1259 OID 6241765)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2535 (class 1259 OID 6242152)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2527 (class 1259 OID 6242125)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2528 (class 1259 OID 6242126)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2365 (class 1259 OID 6241662)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2435 (class 1259 OID 6241870)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2608 (class 2606 OID 6242431)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2611 (class 2606 OID 6242416)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2610 (class 2606 OID 6242421)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2606 (class 2606 OID 6242441)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2612 (class 2606 OID 6242411)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2607 (class 2606 OID 6242436)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2609 (class 2606 OID 6242426)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2642 (class 2606 OID 6242586)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2641 (class 2606 OID 6242591)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2593 (class 2606 OID 6242346)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2629 (class 2606 OID 6242526)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2627 (class 2606 OID 6242521)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2628 (class 2606 OID 6242516)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2605 (class 2606 OID 6242406)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2637 (class 2606 OID 6242556)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2635 (class 2606 OID 6242566)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2636 (class 2606 OID 6242561)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2599 (class 2606 OID 6242381)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2600 (class 2606 OID 6242376)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2625 (class 2606 OID 6242506)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2648 (class 2606 OID 6242611)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2647 (class 2606 OID 6242616)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2646 (class 2606 OID 6242621)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2649 (class 2606 OID 6242641)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2652 (class 2606 OID 6242626)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2650 (class 2606 OID 6242636)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2651 (class 2606 OID 6242631)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2597 (class 2606 OID 6242371)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2598 (class 2606 OID 6242366)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2589 (class 2606 OID 6242331)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2590 (class 2606 OID 6242326)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2631 (class 2606 OID 6242536)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2613 (class 2606 OID 6242446)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2586 (class 2606 OID 6242306)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2585 (class 2606 OID 6242311)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2632 (class 2606 OID 6242551)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2633 (class 2606 OID 6242546)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2634 (class 2606 OID 6242541)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2603 (class 2606 OID 6242386)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2601 (class 2606 OID 6242396)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2602 (class 2606 OID 6242391)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2667 (class 2606 OID 6242716)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2617 (class 2606 OID 6242481)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2619 (class 2606 OID 6242471)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2620 (class 2606 OID 6242466)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2618 (class 2606 OID 6242476)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2584 (class 2606 OID 6242296)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2583 (class 2606 OID 6242301)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2630 (class 2606 OID 6242531)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2626 (class 2606 OID 6242511)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2640 (class 2606 OID 6242576)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2639 (class 2606 OID 6242581)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2662 (class 2606 OID 6242681)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2660 (class 2606 OID 6242691)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2661 (class 2606 OID 6242686)
-- Name: fk_8787a0e5b3836ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5b3836ea9 FOREIGN KEY (tip_programske_enote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2595 (class 2606 OID 6242356)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2596 (class 2606 OID 6242351)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2594 (class 2606 OID 6242361)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2666 (class 2606 OID 6242711)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2644 (class 2606 OID 6242596)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2643 (class 2606 OID 6242601)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2657 (class 2606 OID 6242666)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2658 (class 2606 OID 6242661)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2655 (class 2606 OID 6242676)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2659 (class 2606 OID 6242656)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2656 (class 2606 OID 6242671)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2638 (class 2606 OID 6242571)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2621 (class 2606 OID 6242501)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2622 (class 2606 OID 6242496)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2624 (class 2606 OID 6242486)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2623 (class 2606 OID 6242491)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2653 (class 2606 OID 6242651)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2654 (class 2606 OID 6242646)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2663 (class 2606 OID 6242696)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2604 (class 2606 OID 6242401)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2645 (class 2606 OID 6242606)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2587 (class 2606 OID 6242321)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2588 (class 2606 OID 6242316)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2592 (class 2606 OID 6242336)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2591 (class 2606 OID 6242341)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2614 (class 2606 OID 6242461)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2615 (class 2606 OID 6242456)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2616 (class 2606 OID 6242451)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2664 (class 2606 OID 6242706)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2665 (class 2606 OID 6242701)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-04 13:31:40 CEST

--
-- PostgreSQL database dump complete
--

