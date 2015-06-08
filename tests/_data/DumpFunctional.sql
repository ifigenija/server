--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-08 12:17:23 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 238 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2848 (class 0 OID 0)
-- Dependencies: 238
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 6527108)
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
-- TOC entry 227 (class 1259 OID 6527631)
-- Name: alternacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE alternacija (
    id uuid NOT NULL,
    funkcija_id uuid,
    zaposlitev_id uuid,
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
    aktivna boolean,
    imapogodbo boolean
);


--
-- TOC entry 226 (class 1259 OID 6527614)
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
-- TOC entry 219 (class 1259 OID 6527517)
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
-- TOC entry 194 (class 1259 OID 6527287)
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
-- TOC entry 197 (class 1259 OID 6527321)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6527230)
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
-- TOC entry 228 (class 1259 OID 6527645)
-- Name: enotaprograma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE enotaprograma (
    id uuid NOT NULL,
    uprizoritev_id uuid,
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
    tipprogramskeenote_id uuid,
    tip character varying(15) NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 6527447)
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
-- TOC entry 192 (class 1259 OID 6527267)
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
-- TOC entry 196 (class 1259 OID 6527315)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6527247)
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
-- TOC entry 202 (class 1259 OID 6527364)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6527389)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6527204)
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
-- TOC entry 181 (class 1259 OID 6527117)
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
-- TOC entry 182 (class 1259 OID 6527128)
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
-- TOC entry 177 (class 1259 OID 6527082)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6527101)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6527396)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6527427)
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
-- TOC entry 223 (class 1259 OID 6527565)
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
    vrednostdopremiere numeric(12,2) DEFAULT NULL::numeric,
    aktivna boolean,
    zaposlenvdrjz boolean,
    opis text
);


--
-- TOC entry 184 (class 1259 OID 6527161)
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
-- TOC entry 186 (class 1259 OID 6527196)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6527370)
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
-- TOC entry 185 (class 1259 OID 6527181)
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
-- TOC entry 191 (class 1259 OID 6527259)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6527382)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6527502)
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
-- TOC entry 222 (class 1259 OID 6527557)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6527671)
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
-- TOC entry 232 (class 1259 OID 6527699)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id integer NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 237 (class 1259 OID 6527731)
-- Name: programfestival_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programfestival_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 230 (class 1259 OID 6527680)
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
-- TOC entry 236 (class 1259 OID 6527729)
-- Name: programgostovanje_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programgostovanje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 209 (class 1259 OID 6527411)
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
-- TOC entry 201 (class 1259 OID 6527355)
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
-- TOC entry 200 (class 1259 OID 6527345)
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
-- TOC entry 221 (class 1259 OID 6527546)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6527479)
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
-- TOC entry 174 (class 1259 OID 6527053)
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
-- TOC entry 173 (class 1259 OID 6527051)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2849 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 6527421)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6527091)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6527075)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6527435)
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
-- TOC entry 204 (class 1259 OID 6527376)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6527326)
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
-- TOC entry 235 (class 1259 OID 6527718)
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
-- TOC entry 234 (class 1259 OID 6527710)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 6527705)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6527489)
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
-- TOC entry 183 (class 1259 OID 6527153)
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
-- TOC entry 199 (class 1259 OID 6527332)
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
-- TOC entry 220 (class 1259 OID 6527535)
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
-- TOC entry 231 (class 1259 OID 6527688)
-- Name: tipprogramskeenote; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipprogramskeenote (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) NOT NULL,
    koprodukcija boolean DEFAULT false NOT NULL,
    maxfaktor numeric(10,0) DEFAULT 1::numeric NOT NULL,
    maxvsi numeric(10,0) DEFAULT 0::numeric NOT NULL
);


--
-- TOC entry 188 (class 1259 OID 6527216)
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
-- TOC entry 175 (class 1259 OID 6527062)
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
-- TOC entry 225 (class 1259 OID 6527592)
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
-- TOC entry 193 (class 1259 OID 6527278)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6527403)
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
-- TOC entry 215 (class 1259 OID 6527472)
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
-- TOC entry 195 (class 1259 OID 6527310)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6527582)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 6527462)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2172 (class 2604 OID 6527056)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2784 (class 0 OID 6527108)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 6527631)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5575-6bb2-e747-00cb14e5c40d	000d0000-5575-6bb2-027c-8cb50cddd5db	\N	00090000-5575-6bb2-737c-64113af60652	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-6bb2-ae14-3cfe0d0454c8	000d0000-5575-6bb2-9223-44a2ec612387	\N	00090000-5575-6bb2-c8d3-e19c4fc1cde0	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-6bb2-5cd0-2b05df4e3259	000d0000-5575-6bb2-d492-16904de15daf	\N	00090000-5575-6bb2-6578-4d58f569614e	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-6bb2-97c0-817c940b189d	000d0000-5575-6bb2-46dd-90778bb0c731	\N	00090000-5575-6bb2-0f49-8359783acbe9	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-6bb2-2160-dd2e9b2094f7	000d0000-5575-6bb2-fd97-207c2c77d728	\N	00090000-5575-6bb2-13aa-1f8a6cefc001	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-6bb2-4a80-795556fa2822	000d0000-5575-6bb2-8e91-19183eabe49e	\N	00090000-5575-6bb2-c8d3-e19c4fc1cde0	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2830 (class 0 OID 6527614)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 6527517)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5575-6bb2-c5d1-524ee1289cc3	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	5	Milan Jesih	\N	\N	\N
00160000-5575-6bb2-44d0-d05c6d090336	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	1	Vladimir Levstik	\N	\N	\N
00160000-5575-6bb2-13b1-a10d8009898b	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8	8		\N	\N	\N
\.


--
-- TOC entry 2798 (class 0 OID 6527287)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5575-6bb2-719c-ebd8b7787e25	\N	\N	00200000-5575-6bb2-316b-b52574900458	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5575-6bb2-b6f8-86ea1bd42c50	\N	\N	00200000-5575-6bb2-17d5-8db0f8b42ce8	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5575-6bb2-198c-3e76f8469589	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5575-6bb2-70f9-3b583076c855	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5575-6bb2-95f3-425be4ae3a68	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2801 (class 0 OID 6527321)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2793 (class 0 OID 6527230)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5575-6bb1-901b-0806c71dc732	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5575-6bb1-69a2-eb3b6fbfe440	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5575-6bb1-fc59-b38f66af6389	AL	ALB	008	Albania 	Albanija	\N
00040000-5575-6bb1-32e1-a3d528de790e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5575-6bb1-bb03-b1db2f01758f	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5575-6bb1-d3e4-3df80bec6f9d	AD	AND	020	Andorra 	Andora	\N
00040000-5575-6bb1-d780-1d0e03708f5c	AO	AGO	024	Angola 	Angola	\N
00040000-5575-6bb1-e580-302a5e9508b7	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5575-6bb1-7be9-3ffaaa123e39	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5575-6bb1-9520-08f08a99c6f7	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5575-6bb1-1daf-a146f243a436	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5575-6bb1-66f1-2bc88aa71de0	AM	ARM	051	Armenia 	Armenija	\N
00040000-5575-6bb1-e6e2-bbe4feba3695	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5575-6bb1-aa69-a7beec95c676	AU	AUS	036	Australia 	Avstralija	\N
00040000-5575-6bb1-6fc4-90fbc4730530	AT	AUT	040	Austria 	Avstrija	\N
00040000-5575-6bb1-3975-f62ed47bb7f8	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5575-6bb1-bfb4-50d3b47c77b3	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5575-6bb1-1787-fe8b1a4a7778	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5575-6bb1-207e-532ced76aa3a	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5575-6bb1-8c83-c57b4a18ca2f	BB	BRB	052	Barbados 	Barbados	\N
00040000-5575-6bb1-8633-2b0621d6c0c8	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5575-6bb1-4615-adf6df3023a1	BE	BEL	056	Belgium 	Belgija	\N
00040000-5575-6bb1-b3e7-b7b6e55d5010	BZ	BLZ	084	Belize 	Belize	\N
00040000-5575-6bb1-5a32-59ead22ae878	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5575-6bb1-e9e5-ccd7e94d2b09	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5575-6bb1-35d1-1dc046173ce7	BT	BTN	064	Bhutan 	Butan	\N
00040000-5575-6bb1-2b52-0bbe57cb6259	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5575-6bb1-ac49-314b3ecd5320	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5575-6bb1-64c4-45fcc9b1a8ff	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5575-6bb1-3d82-29094a967c30	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5575-6bb1-82f4-6b64a0901cb6	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5575-6bb1-14db-30b1bf670a3a	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5575-6bb1-51ab-35bcf282a4b6	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5575-6bb1-a970-af316025aa1a	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5575-6bb1-4186-d76b2ae5f99b	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5575-6bb1-da11-f4d11db5b1bb	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5575-6bb1-5fef-747a3aa53043	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5575-6bb1-1f6c-caddadf8b890	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5575-6bb1-3c83-bfba67475f1f	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5575-6bb1-a4e2-a23c3303fed1	CA	CAN	124	Canada 	Kanada	\N
00040000-5575-6bb1-16ff-ab9d49d571fe	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5575-6bb1-ac9d-27bb615483cc	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5575-6bb1-f5e6-49b0562e95b0	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5575-6bb1-4f3d-c5b94ae69126	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5575-6bb1-9e8d-fd2be9b082a6	CL	CHL	152	Chile 	Čile	\N
00040000-5575-6bb1-a405-b13d9f3e032c	CN	CHN	156	China 	Kitajska	\N
00040000-5575-6bb1-4535-fcd92603cd2a	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5575-6bb1-1e6a-a13c403e8537	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5575-6bb1-ef36-2385fca2fefe	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5575-6bb1-882e-14904fe08e37	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5575-6bb1-da13-934edea01fb1	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5575-6bb1-18c9-8311ac8ab8a5	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5575-6bb1-9b04-eef181492fdb	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5575-6bb1-e4b8-c6ef51751f98	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5575-6bb1-c210-6d19549edf16	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5575-6bb1-40bf-bde59579392f	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5575-6bb1-9c34-36e09d8b4c42	CU	CUB	192	Cuba 	Kuba	\N
00040000-5575-6bb1-859e-03de4402c954	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5575-6bb1-34da-654bd48cdbbd	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5575-6bb1-877c-0f3f375a0c04	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5575-6bb1-3b67-ee74bcace5ca	DK	DNK	208	Denmark 	Danska	\N
00040000-5575-6bb1-56b9-2f00be131262	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5575-6bb1-06b9-c5b77ad654a5	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5575-6bb1-08c7-9c396fae098d	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5575-6bb1-fb8c-b4d157111db9	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5575-6bb1-3e89-00ee1c7328a0	EG	EGY	818	Egypt 	Egipt	\N
00040000-5575-6bb1-9d9f-84ef1fd2c663	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5575-6bb1-07a3-7550e4eccbbc	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5575-6bb1-03ef-e6edef11a882	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5575-6bb1-61d9-217d3047fd70	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5575-6bb1-7866-09860bcc10c7	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5575-6bb1-0f73-cdf3f42dfe80	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5575-6bb1-9c8a-1412fd9ce13f	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5575-6bb1-de43-9dc3005851f5	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5575-6bb1-313d-3162e7861a25	FI	FIN	246	Finland 	Finska	\N
00040000-5575-6bb1-9dbf-11d4bdf8294d	FR	FRA	250	France 	Francija	\N
00040000-5575-6bb1-9e68-ed0ea591f254	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5575-6bb1-7b6d-3d3645799d9e	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5575-6bb1-029c-1315c2d95f06	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5575-6bb1-2c5f-ec764e305d94	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5575-6bb1-23c1-a23ae3a05d8b	GA	GAB	266	Gabon 	Gabon	\N
00040000-5575-6bb1-b1b3-c223cbce3f2a	GM	GMB	270	Gambia 	Gambija	\N
00040000-5575-6bb1-d0f6-ad3c19cccade	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5575-6bb1-338b-d7abad9026ea	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5575-6bb1-e324-813f602e3bec	GH	GHA	288	Ghana 	Gana	\N
00040000-5575-6bb1-254c-b6d29a4a8240	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5575-6bb1-5fb4-9a9ea5312c1c	GR	GRC	300	Greece 	Grčija	\N
00040000-5575-6bb1-d3fe-5a729062d133	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5575-6bb1-a31c-370dc1c94102	GD	GRD	308	Grenada 	Grenada	\N
00040000-5575-6bb1-032d-c2b6bcfb7ccd	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5575-6bb1-3fe7-401d7087cd9e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5575-6bb1-1799-1ee07a76e710	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5575-6bb1-ffa4-dd46f2d3e06d	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5575-6bb1-c905-6c4dbecef7c3	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5575-6bb1-b2eb-f348eb98cd62	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5575-6bb1-ad02-76f1d7b3f1b4	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5575-6bb1-79ad-d845b6d7c2da	HT	HTI	332	Haiti 	Haiti	\N
00040000-5575-6bb1-7508-65bb815fef7b	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5575-6bb1-f966-1d075fc13e1e	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5575-6bb1-cf34-ef9efbf877ad	HN	HND	340	Honduras 	Honduras	\N
00040000-5575-6bb1-f603-7b15dd5f1890	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5575-6bb1-23c7-7d9bcd308bf7	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5575-6bb1-72d4-3b6b55def368	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5575-6bb1-1bc4-3bb0b570e481	IN	IND	356	India 	Indija	\N
00040000-5575-6bb1-1bfd-944771348256	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5575-6bb1-977b-6c16cd650635	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5575-6bb1-a768-0adec63c0460	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5575-6bb1-9e88-0f24b785db8f	IE	IRL	372	Ireland 	Irska	\N
00040000-5575-6bb1-9f2a-45daf4676700	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5575-6bb1-b16a-3d6dfd65b9ef	IL	ISR	376	Israel 	Izrael	\N
00040000-5575-6bb1-3564-953e605c267f	IT	ITA	380	Italy 	Italija	\N
00040000-5575-6bb1-ad25-d5ed0e4fac47	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5575-6bb1-7c7c-c918cd0bedc6	JP	JPN	392	Japan 	Japonska	\N
00040000-5575-6bb1-282c-20efe5a3937e	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5575-6bb1-b596-76059e718326	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5575-6bb1-a952-1e0dd0397162	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5575-6bb1-da9c-dd565df3fe94	KE	KEN	404	Kenya 	Kenija	\N
00040000-5575-6bb1-6d05-716b0c0f2d59	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5575-6bb1-d17e-b459f4147ab7	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5575-6bb1-8138-05229d1c07d1	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5575-6bb1-8ca0-83fd5b98beee	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5575-6bb1-f7f6-c6c0d614ce0c	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5575-6bb1-4fc7-e41ddaca9224	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5575-6bb1-5d86-74cf84ed4918	LV	LVA	428	Latvia 	Latvija	\N
00040000-5575-6bb1-24d6-f71d6198dbb2	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5575-6bb1-a9dc-9c01babaac2e	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5575-6bb1-d28b-942e4a8bcc7c	LR	LBR	430	Liberia 	Liberija	\N
00040000-5575-6bb1-50fa-051e1c37064c	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5575-6bb1-2eb0-9f8fbaa4f508	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5575-6bb1-f5e7-985ea57f3292	LT	LTU	440	Lithuania 	Litva	\N
00040000-5575-6bb1-6ddf-8bc39a7c00aa	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5575-6bb1-6f4c-448fbfe32bb3	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5575-6bb1-5112-d5071aced8e8	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5575-6bb1-76ce-9053cbf6b143	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5575-6bb1-7e32-f1bf2a273085	MW	MWI	454	Malawi 	Malavi	\N
00040000-5575-6bb1-57da-24f0e98fbdb8	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5575-6bb1-a540-890dd6787160	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5575-6bb1-81e3-b35cf33162ed	ML	MLI	466	Mali 	Mali	\N
00040000-5575-6bb1-1e54-b9c3ab673314	MT	MLT	470	Malta 	Malta	\N
00040000-5575-6bb1-9787-3f82fde79e8e	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5575-6bb1-51ad-1383309f44e0	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5575-6bb1-a277-b97a9c688287	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5575-6bb1-b73a-bcfa5cc75c72	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5575-6bb1-553c-b556b507b388	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5575-6bb1-c4ce-fa8be790825d	MX	MEX	484	Mexico 	Mehika	\N
00040000-5575-6bb1-2c18-473a1e65b102	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5575-6bb1-fb8e-10265b28af3f	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5575-6bb1-b199-a57750d7e140	MC	MCO	492	Monaco 	Monako	\N
00040000-5575-6bb1-daff-6d974cc4ac65	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5575-6bb1-982f-67503702328c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5575-6bb1-d18a-1a21793161fb	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5575-6bb1-081d-7419c8897657	MA	MAR	504	Morocco 	Maroko	\N
00040000-5575-6bb1-c789-54a1bbd606cd	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5575-6bb1-0b3e-38699d46638b	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5575-6bb1-7286-f59f7eec2a22	NA	NAM	516	Namibia 	Namibija	\N
00040000-5575-6bb1-70c0-e0ede7ac37d6	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5575-6bb1-cd87-2b773d9e3d84	NP	NPL	524	Nepal 	Nepal	\N
00040000-5575-6bb1-c171-8cf9e7b0d0db	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5575-6bb1-1d74-4a4a5a4f0942	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5575-6bb1-d378-d6e40a5d07c6	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5575-6bb1-abd6-6721c1ea24d5	NE	NER	562	Niger 	Niger 	\N
00040000-5575-6bb1-a433-197beb5c2705	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5575-6bb1-c80c-1691641972bd	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5575-6bb1-4250-8399386f428d	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5575-6bb1-324b-cbaf950c5bf9	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5575-6bb1-917e-7d546f6a7e18	NO	NOR	578	Norway 	Norveška	\N
00040000-5575-6bb1-e6a9-a394609261e1	OM	OMN	512	Oman 	Oman	\N
00040000-5575-6bb1-c6c1-60cc43265456	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5575-6bb1-7984-e6e5b1157a98	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5575-6bb1-c0ba-989e86d56ffe	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5575-6bb1-5d16-b4215ea8b9f8	PA	PAN	591	Panama 	Panama	\N
00040000-5575-6bb1-d54e-8359d6255de2	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5575-6bb1-c09a-ee58285020d4	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5575-6bb1-1f33-3276d7ea432a	PE	PER	604	Peru 	Peru	\N
00040000-5575-6bb1-3864-4f1eaac79bc2	PH	PHL	608	Philippines 	Filipini	\N
00040000-5575-6bb1-3257-97ed37e6b466	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5575-6bb1-be06-82acd0804d51	PL	POL	616	Poland 	Poljska	\N
00040000-5575-6bb1-a758-232fc58ee761	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5575-6bb1-0882-8eb8a083ab78	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5575-6bb1-e9c3-552fa2bd2f7b	QA	QAT	634	Qatar 	Katar	\N
00040000-5575-6bb1-54f4-325fba591b68	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5575-6bb1-1429-3dd07a4f1e85	RO	ROU	642	Romania 	Romunija	\N
00040000-5575-6bb1-b4bc-b059c7df34d5	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5575-6bb1-018e-beac5d334fec	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5575-6bb1-b1f0-f89f74411418	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5575-6bb1-a5b3-53bd32790c90	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5575-6bb1-5e30-5377c885afd2	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5575-6bb1-b4bb-f0be27575885	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5575-6bb1-b6b1-ca7eef570fea	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5575-6bb1-6eed-7024d9a37a0b	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5575-6bb1-cf3c-ffcf92292773	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5575-6bb1-b286-5939f7db8664	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5575-6bb1-fbbc-47d88326a834	SM	SMR	674	San Marino 	San Marino	\N
00040000-5575-6bb1-b448-a24d33d531fd	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5575-6bb1-098d-6f3abe577742	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5575-6bb1-ef51-f275bc43730d	SN	SEN	686	Senegal 	Senegal	\N
00040000-5575-6bb1-6a71-ac48b00845a2	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5575-6bb1-ecee-890abecfea9e	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5575-6bb1-4850-db9b31c69e06	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5575-6bb1-ed32-86a0848bfc4b	SG	SGP	702	Singapore 	Singapur	\N
00040000-5575-6bb1-b5e4-fb2e2291402a	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5575-6bb1-e059-99a3022be53d	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5575-6bb1-48fb-4caf4bf2ab2e	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5575-6bb1-6459-dfa7800cff7b	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5575-6bb1-ba71-b760bc7fe804	SO	SOM	706	Somalia 	Somalija	\N
00040000-5575-6bb1-b735-a146d859f3da	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5575-6bb1-fe03-9570b47d1ba5	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5575-6bb1-9174-a31ba509e3a7	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5575-6bb1-81ad-f037a9bdddf7	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5575-6bb1-f858-0c598b04cb75	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5575-6bb1-0e41-f137efb2599a	SD	SDN	729	Sudan 	Sudan	\N
00040000-5575-6bb1-89eb-49424d85a4e5	SR	SUR	740	Suriname 	Surinam	\N
00040000-5575-6bb1-c3b8-4bf79d2e6b39	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5575-6bb1-fdf1-d75b473196ee	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5575-6bb1-8336-c3e841e51391	SE	SWE	752	Sweden 	Švedska	\N
00040000-5575-6bb1-7028-3d0b1fcb28d7	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5575-6bb1-c70c-d537d9023974	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5575-6bb1-42fd-a1c685da7139	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5575-6bb1-ad34-4ca89bf3a4d7	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5575-6bb1-c7ea-996dd43fbe0b	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5575-6bb1-af21-584461d1926e	TH	THA	764	Thailand 	Tajska	\N
00040000-5575-6bb1-794e-e441b2c4eadd	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5575-6bb1-20ff-72c78ac872de	TG	TGO	768	Togo 	Togo	\N
00040000-5575-6bb1-5219-87793445e40b	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5575-6bb1-c98d-3eefa4ae2c4b	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5575-6bb1-5d0c-36a65a54d4c9	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5575-6bb1-49d4-6a968eaaeafa	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5575-6bb1-dec8-6b45fc784433	TR	TUR	792	Turkey 	Turčija	\N
00040000-5575-6bb1-b9b9-3fa50814fe68	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5575-6bb1-93bc-6df31d3ca178	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5575-6bb1-85f2-9f4b88779d8c	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5575-6bb1-5c9f-3ddc08379423	UG	UGA	800	Uganda 	Uganda	\N
00040000-5575-6bb1-c318-5d3bfe6d5060	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5575-6bb1-a200-a2eda2f6dd50	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5575-6bb1-b62a-b4be8762b2f2	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5575-6bb1-8b50-e1652b8a6949	US	USA	840	United States 	Združene države Amerike	\N
00040000-5575-6bb1-e80e-0e273cd9b6a8	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5575-6bb1-6e2c-9443213b6f70	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5575-6bb1-f6f6-b8321574fdd8	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5575-6bb1-3502-c9fc9d258508	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5575-6bb1-ca73-bae7addbc4df	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5575-6bb1-79a0-6d7a704c3206	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5575-6bb1-1d7d-22df6a1dfdcd	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5575-6bb1-8e4e-55029aa04e96	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5575-6bb1-1d17-5c3bc78a9109	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5575-6bb1-233b-8f5d5fe00dc0	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5575-6bb1-a103-4278f8bb46a0	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5575-6bb1-13a3-c803ccb8103b	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5575-6bb1-8654-4584d9607df2	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2832 (class 0 OID 6527645)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2817 (class 0 OID 6527447)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5575-6bb2-fa39-66aa215d97d3	000e0000-5575-6bb2-a81b-44e1b828db2f	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5575-6bb0-e7eb-22821126947f
000d0000-5575-6bb2-027c-8cb50cddd5db	000e0000-5575-6bb2-a81b-44e1b828db2f	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5575-6bb0-e7eb-22821126947f
000d0000-5575-6bb2-9223-44a2ec612387	000e0000-5575-6bb2-a81b-44e1b828db2f	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5575-6bb0-ca0b-c9c9c4e772e4
000d0000-5575-6bb2-d492-16904de15daf	000e0000-5575-6bb2-a81b-44e1b828db2f	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5575-6bb0-9b0f-d6b9083fc35b
000d0000-5575-6bb2-46dd-90778bb0c731	000e0000-5575-6bb2-a81b-44e1b828db2f	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5575-6bb0-9b0f-d6b9083fc35b
000d0000-5575-6bb2-fd97-207c2c77d728	000e0000-5575-6bb2-a81b-44e1b828db2f	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5575-6bb0-9b0f-d6b9083fc35b
000d0000-5575-6bb2-8e91-19183eabe49e	000e0000-5575-6bb2-a81b-44e1b828db2f	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5575-6bb0-e7eb-22821126947f
\.


--
-- TOC entry 2796 (class 0 OID 6527267)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2800 (class 0 OID 6527315)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2794 (class 0 OID 6527247)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5575-6bb2-f1d5-4421617c51c4	00080000-5575-6bb2-e48d-a178813a90ce	00090000-5575-6bb2-737c-64113af60652	AK		
\.


--
-- TOC entry 2774 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2806 (class 0 OID 6527364)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2810 (class 0 OID 6527389)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2791 (class 0 OID 6527204)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5575-6bb1-9637-a4944ed5c077	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5575-6bb1-26e6-1cb547dbf059	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5575-6bb1-03d5-486bae8755ab	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5575-6bb1-3706-bbd589558883	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5575-6bb1-f925-7d2b389fab15	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5575-6bb1-5bbc-d1b7eb023db9	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5575-6bb1-6d9f-4e6fd67ccedd	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5575-6bb1-6f55-2fde9e18a9f1	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5575-6bb1-d4f0-4a2da8171384	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5575-6bb1-0566-63779d071ee3	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5575-6bb1-d8e8-f95576029cd2	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5575-6bb1-6f29-ae2a5eaf65be	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5575-6bb1-75bf-55bf346864a4	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5575-6bb1-bbde-beaca8ea4896	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5575-6bb1-cadb-ca42a3190259	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5575-6bb1-d742-fb455de614cd	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2785 (class 0 OID 6527117)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5575-6bb1-a1dd-8b1d9a31e3fb	00000000-5575-6bb1-f925-7d2b389fab15	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5575-6bb1-33fe-446cb9b994c5	00000000-5575-6bb1-f925-7d2b389fab15	00010000-5575-6bb1-3bc0-3e457e1ceb05	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5575-6bb1-0116-1cf40ae98662	00000000-5575-6bb1-5bbc-d1b7eb023db9	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2786 (class 0 OID 6527128)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5575-6bb2-a56c-9b149d8561b0	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5575-6bb2-0f49-8359783acbe9	00010000-5575-6bb2-5383-57d9dfda1341	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5575-6bb2-6578-4d58f569614e	00010000-5575-6bb2-d932-3b60631bb612	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5575-6bb2-12e6-34ee2528a8c0	00010000-5575-6bb2-60de-3bca5c3b2ecb	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5575-6bb2-a22c-eb6cc0a6b25f	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5575-6bb2-9f58-241663ccbab7	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5575-6bb2-15a3-bba8ee0e38de	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5575-6bb2-eabf-652eebc0889a	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5575-6bb2-737c-64113af60652	00010000-5575-6bb2-5fd6-9d3c999eb950	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5575-6bb2-c8d3-e19c4fc1cde0	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5575-6bb2-f3c4-0d270ca0a903	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5575-6bb2-13aa-1f8a6cefc001	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5575-6bb2-cfa2-2be598a5ab40	00010000-5575-6bb2-f4b3-2f6ab83a1a76	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2776 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2781 (class 0 OID 6527082)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5575-6bb1-f577-33364579b9ae	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5575-6bb1-4c5f-7715b3df5610	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5575-6bb1-0b19-8f9522a3efae	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5575-6bb1-c5be-b69252f614df	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5575-6bb1-9b84-e4cdf23a3dda	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5575-6bb1-b7e2-b8ef5f90b7b4	Abonma-read	Abonma - branje	f
00030000-5575-6bb1-116b-fbed984c3f31	Abonma-write	Abonma - spreminjanje	f
00030000-5575-6bb1-71a5-8a36faa2b914	Alternacija-read	Alternacija - branje	f
00030000-5575-6bb1-0e2f-1557d21e2b45	Alternacija-write	Alternacija - spreminjanje	f
00030000-5575-6bb1-efa0-c36d83fd51ef	Arhivalija-read	Arhivalija - branje	f
00030000-5575-6bb1-b43e-2bbc21265714	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5575-6bb1-37b6-eeb346446208	Besedilo-read	Besedilo - branje	f
00030000-5575-6bb1-9e48-2af4fafa2717	Besedilo-write	Besedilo - spreminjanje	f
00030000-5575-6bb1-3a59-0f828cdef1ac	DogodekIzven-read	DogodekIzven - branje	f
00030000-5575-6bb1-6d53-f948cdc86b96	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5575-6bb1-b826-89dec5214af3	Dogodek-read	Dogodek - branje	f
00030000-5575-6bb1-aa1c-0a931fe744be	Dogodek-write	Dogodek - spreminjanje	f
00030000-5575-6bb1-dd3b-5f40727027f4	Drzava-read	Drzava - branje	f
00030000-5575-6bb1-36e6-a618bac7a073	Drzava-write	Drzava - spreminjanje	f
00030000-5575-6bb1-bc25-a80ff323b1b6	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5575-6bb1-93d4-88fab0792fdb	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5575-6bb1-453b-b918528600b6	Funkcija-read	Funkcija - branje	f
00030000-5575-6bb1-edff-083663191e67	Funkcija-write	Funkcija - spreminjanje	f
00030000-5575-6bb1-ff05-16250793a3fe	Gostovanje-read	Gostovanje - branje	f
00030000-5575-6bb1-8de9-5ba49e0d7733	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5575-6bb1-5959-23f9e6a7a1dd	Gostujoca-read	Gostujoca - branje	f
00030000-5575-6bb1-6783-a809361f1f4e	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5575-6bb1-d9e7-6386d1f035df	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5575-6bb1-54fb-10583ed78985	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5575-6bb1-e6c8-2b3a6e9eabbb	Kupec-read	Kupec - branje	f
00030000-5575-6bb1-0f03-7ca34c0b8bab	Kupec-write	Kupec - spreminjanje	f
00030000-5575-6bb1-6ba2-28eaa91a701c	NacinPlacina-read	NacinPlacina - branje	f
00030000-5575-6bb1-0794-f6a53d5fc740	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5575-6bb1-4317-16a4b0445952	Option-read	Option - branje	f
00030000-5575-6bb1-7963-dc20d6646fd6	Option-write	Option - spreminjanje	f
00030000-5575-6bb1-dc0c-eb1be00d0669	OptionValue-read	OptionValue - branje	f
00030000-5575-6bb1-a3ff-f8342f8b596a	OptionValue-write	OptionValue - spreminjanje	f
00030000-5575-6bb1-3202-db72b4614ee3	Oseba-read	Oseba - branje	f
00030000-5575-6bb1-91d8-2b810b7fb0a6	Oseba-write	Oseba - spreminjanje	f
00030000-5575-6bb1-4608-b2a7afc63041	Permission-read	Permission - branje	f
00030000-5575-6bb1-2b5b-f9786123b596	Permission-write	Permission - spreminjanje	f
00030000-5575-6bb1-adc7-65b3f4d8c814	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5575-6bb1-46e2-80d172350549	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5575-6bb1-f6dd-bce76f8a5669	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5575-6bb1-0ea0-b7e716547e20	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5575-6bb1-64a1-44ef8d40dd62	Pogodba-read	Pogodba - branje	f
00030000-5575-6bb1-09c1-c20aa3950a9e	Pogodba-write	Pogodba - spreminjanje	f
00030000-5575-6bb1-80d7-ef516a7a28f8	Popa-read	Popa - branje	f
00030000-5575-6bb1-7cc4-c4f329d94c8d	Popa-write	Popa - spreminjanje	f
00030000-5575-6bb1-e879-ff807c70065c	Posta-read	Posta - branje	f
00030000-5575-6bb1-c105-a5cd3ab58f37	Posta-write	Posta - spreminjanje	f
00030000-5575-6bb1-5c8e-a84ba9f684e1	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5575-6bb1-17da-8bcb2cd6e8be	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5575-6bb1-ecae-a8a819fe4449	PostniNaslov-read	PostniNaslov - branje	f
00030000-5575-6bb1-9043-ac30f802fadf	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5575-6bb1-a569-f422333470ab	Predstava-read	Predstava - branje	f
00030000-5575-6bb1-5d67-ba4c9c99006c	Predstava-write	Predstava - spreminjanje	f
00030000-5575-6bb1-ebd5-1b4bdc2c94bf	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5575-6bb1-d5ac-310a98d8793d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5575-6bb1-6da6-11e7c5ef68e4	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5575-6bb1-bb64-ab481e9e5674	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5575-6bb1-380f-19e1d98c15ac	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5575-6bb1-588e-021950a07d9e	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5575-6bb1-656f-a1b181931b4c	ProgramDela-read	ProgramDela - branje	f
00030000-5575-6bb1-76bb-26022e836d1a	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5575-6bb1-c1ae-a82f5748ebda	ProgramFestival-read	ProgramFestival - branje	f
00030000-5575-6bb1-92b8-35edb4d5b70d	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5575-6bb1-c9ca-ac55313fbe9c	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5575-6bb1-46e8-2d678a7fc1ad	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5575-6bb1-51e9-dea5c5896dc2	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5575-6bb1-2442-4775eebccdfd	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5575-6bb1-9644-c42ff8c8bd40	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5575-6bb1-02cf-b5ca02640101	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5575-6bb1-bfa0-f928ee62d2b2	ProgramPonovitev-read	ProgramPonovitev - branje	f
00030000-5575-6bb1-8de7-88fd7bf7c0e1	ProgramPonovitev-write	ProgramPonovitev - spreminjanje	f
00030000-5575-6bb1-d69e-8a48e7c94645	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5575-6bb1-b542-f78f7cfc5c91	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5575-6bb1-7a0f-6bfdfd0daf32	Prostor-read	Prostor - branje	f
00030000-5575-6bb1-99a5-89ef25c0a851	Prostor-write	Prostor - spreminjanje	f
00030000-5575-6bb1-411a-3b760f34e303	Racun-read	Racun - branje	f
00030000-5575-6bb1-5636-e0d1f9032b80	Racun-write	Racun - spreminjanje	f
00030000-5575-6bb1-bc53-0868e7f220ec	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5575-6bb1-7cac-3d4a81201289	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5575-6bb1-480a-52f6f789022c	Readme-read	Readme - branje	f
00030000-5575-6bb1-7928-18da644a5ed6	Readme-write	Readme - spreminjanje	f
00030000-5575-6bb1-558d-e3263ccdb40f	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5575-6bb1-93e8-b2132b5c7995	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5575-6bb1-2648-39da7069880a	Rekvizit-read	Rekvizit - branje	f
00030000-5575-6bb1-09db-df4efad7d5b0	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5575-6bb1-2ef1-5993f6c24d40	Revizija-read	Revizija - branje	f
00030000-5575-6bb1-dca8-b369996b6fbc	Revizija-write	Revizija - spreminjanje	f
00030000-5575-6bb1-a619-673e8a55c1c8	Rezervacija-read	Rezervacija - branje	f
00030000-5575-6bb1-264c-89dce06aa30a	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5575-6bb1-4e65-0a877822f6db	Role-read	Role - branje	f
00030000-5575-6bb1-ef80-1571e5daf81a	Role-write	Role - spreminjanje	f
00030000-5575-6bb1-3862-a14259677119	SedezniRed-read	SedezniRed - branje	f
00030000-5575-6bb1-3c0d-e11a1f08e300	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5575-6bb1-18f8-7aac126c5451	Sedez-read	Sedez - branje	f
00030000-5575-6bb1-d09b-f459b9f60465	Sedez-write	Sedez - spreminjanje	f
00030000-5575-6bb1-3def-67698462f1c3	Sezona-read	Sezona - branje	f
00030000-5575-6bb1-68f7-6767afffdd7b	Sezona-write	Sezona - spreminjanje	f
00030000-5575-6bb1-d4de-76aa7cf5eb8f	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5575-6bb1-9fd7-15bfbcc3e7d5	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5575-6bb1-c4d0-30366a697ca8	Stevilcenje-read	Stevilcenje - branje	f
00030000-5575-6bb1-6f5d-685016b5b094	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5575-6bb1-9c76-749fa77afc9e	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5575-6bb1-5f3a-5e39720f7b5d	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5575-6bb1-8556-78c0414faa0c	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5575-6bb1-8962-ff35ae93d7db	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5575-6bb1-4fe2-08956e69df86	Telefonska-read	Telefonska - branje	f
00030000-5575-6bb1-e6d1-3984a9c80b32	Telefonska-write	Telefonska - spreminjanje	f
00030000-5575-6bb1-9881-88adbc52b0fe	TerminStoritve-read	TerminStoritve - branje	f
00030000-5575-6bb1-b467-fee95ce53c79	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5575-6bb1-fc88-4db85ae5423c	TipFunkcije-read	TipFunkcije - branje	f
00030000-5575-6bb1-c9f7-c0269d3c8bb3	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5575-6bb1-a0ff-6ef45d403ff7	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5575-6bb1-2db7-ce25e968b56c	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5575-6bb1-a4b7-a538c8804038	Trr-read	Trr - branje	f
00030000-5575-6bb1-7379-b8c7cc5e86a2	Trr-write	Trr - spreminjanje	f
00030000-5575-6bb1-71ac-1036589effca	Uprizoritev-read	Uprizoritev - branje	f
00030000-5575-6bb1-e5f1-d40c5457a9a5	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5575-6bb1-780f-ad79a13e919a	User-read	User - branje	f
00030000-5575-6bb1-51ea-8293f0a7d05d	User-write	User - spreminjanje	f
00030000-5575-6bb1-b74b-1e291c0d13d1	Vaja-read	Vaja - branje	f
00030000-5575-6bb1-2530-a8e65da0d6aa	Vaja-write	Vaja - spreminjanje	f
00030000-5575-6bb1-1961-18144233fa9b	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5575-6bb1-7900-c67679e9a62e	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5575-6bb1-8360-42cb34bfca81	Zaposlitev-read	Zaposlitev - branje	f
00030000-5575-6bb1-5791-70577c02530e	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5575-6bb1-d301-bbd06a93ae87	Zasedenost-read	Zasedenost - branje	f
00030000-5575-6bb1-d78f-5eed74c5a911	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5575-6bb1-0fd2-05e068c32b10	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5575-6bb1-0423-e6aa2c5f5e62	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5575-6bb1-4224-7c0e0596f76c	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5575-6bb1-7308-86d7eec19cb3	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2783 (class 0 OID 6527101)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5575-6bb1-dc45-50b252090554	00030000-5575-6bb1-dd3b-5f40727027f4
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-b7e2-b8ef5f90b7b4
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-116b-fbed984c3f31
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-71a5-8a36faa2b914
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-0e2f-1557d21e2b45
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-efa0-c36d83fd51ef
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-b826-89dec5214af3
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-c5be-b69252f614df
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-aa1c-0a931fe744be
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-dd3b-5f40727027f4
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-36e6-a618bac7a073
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-453b-b918528600b6
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-edff-083663191e67
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-ff05-16250793a3fe
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-8de9-5ba49e0d7733
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-5959-23f9e6a7a1dd
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-6783-a809361f1f4e
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-d9e7-6386d1f035df
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-54fb-10583ed78985
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-4317-16a4b0445952
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-dc0c-eb1be00d0669
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-3202-db72b4614ee3
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-91d8-2b810b7fb0a6
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-80d7-ef516a7a28f8
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-7cc4-c4f329d94c8d
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-e879-ff807c70065c
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-c105-a5cd3ab58f37
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-ecae-a8a819fe4449
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-9043-ac30f802fadf
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-a569-f422333470ab
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-5d67-ba4c9c99006c
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-380f-19e1d98c15ac
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-588e-021950a07d9e
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-7a0f-6bfdfd0daf32
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-99a5-89ef25c0a851
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-558d-e3263ccdb40f
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-93e8-b2132b5c7995
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-2648-39da7069880a
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-09db-df4efad7d5b0
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-3def-67698462f1c3
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-68f7-6767afffdd7b
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-fc88-4db85ae5423c
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-71ac-1036589effca
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-e5f1-d40c5457a9a5
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-b74b-1e291c0d13d1
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-2530-a8e65da0d6aa
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-d301-bbd06a93ae87
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-d78f-5eed74c5a911
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-0fd2-05e068c32b10
00020000-5575-6bb1-cc8f-31ad71043358	00030000-5575-6bb1-4224-7c0e0596f76c
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-b7e2-b8ef5f90b7b4
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-efa0-c36d83fd51ef
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-b826-89dec5214af3
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-dd3b-5f40727027f4
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-ff05-16250793a3fe
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-5959-23f9e6a7a1dd
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-d9e7-6386d1f035df
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-54fb-10583ed78985
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-4317-16a4b0445952
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-dc0c-eb1be00d0669
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-3202-db72b4614ee3
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-91d8-2b810b7fb0a6
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-80d7-ef516a7a28f8
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-e879-ff807c70065c
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-ecae-a8a819fe4449
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-9043-ac30f802fadf
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-a569-f422333470ab
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-7a0f-6bfdfd0daf32
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-558d-e3263ccdb40f
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-2648-39da7069880a
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-3def-67698462f1c3
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-4fe2-08956e69df86
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-e6d1-3984a9c80b32
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-a4b7-a538c8804038
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-7379-b8c7cc5e86a2
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-8360-42cb34bfca81
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-5791-70577c02530e
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-0fd2-05e068c32b10
00020000-5575-6bb1-5c48-93d8cb7d05f7	00030000-5575-6bb1-4224-7c0e0596f76c
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-b7e2-b8ef5f90b7b4
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-71a5-8a36faa2b914
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-efa0-c36d83fd51ef
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-b43e-2bbc21265714
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-37b6-eeb346446208
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-3a59-0f828cdef1ac
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-b826-89dec5214af3
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-dd3b-5f40727027f4
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-453b-b918528600b6
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-ff05-16250793a3fe
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-5959-23f9e6a7a1dd
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-d9e7-6386d1f035df
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-4317-16a4b0445952
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-dc0c-eb1be00d0669
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-3202-db72b4614ee3
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-80d7-ef516a7a28f8
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-e879-ff807c70065c
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-a569-f422333470ab
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-380f-19e1d98c15ac
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-7a0f-6bfdfd0daf32
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-558d-e3263ccdb40f
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-2648-39da7069880a
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-3def-67698462f1c3
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-fc88-4db85ae5423c
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-b74b-1e291c0d13d1
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-d301-bbd06a93ae87
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-0fd2-05e068c32b10
00020000-5575-6bb1-4ae5-baebde12154b	00030000-5575-6bb1-4224-7c0e0596f76c
00020000-5575-6bb1-ed0c-61f1ea8e1bdf	00030000-5575-6bb1-b7e2-b8ef5f90b7b4
00020000-5575-6bb1-ed0c-61f1ea8e1bdf	00030000-5575-6bb1-116b-fbed984c3f31
00020000-5575-6bb1-ed0c-61f1ea8e1bdf	00030000-5575-6bb1-0e2f-1557d21e2b45
00020000-5575-6bb1-ed0c-61f1ea8e1bdf	00030000-5575-6bb1-efa0-c36d83fd51ef
00020000-5575-6bb1-ed0c-61f1ea8e1bdf	00030000-5575-6bb1-b826-89dec5214af3
00020000-5575-6bb1-ed0c-61f1ea8e1bdf	00030000-5575-6bb1-dd3b-5f40727027f4
00020000-5575-6bb1-ed0c-61f1ea8e1bdf	00030000-5575-6bb1-ff05-16250793a3fe
00020000-5575-6bb1-ed0c-61f1ea8e1bdf	00030000-5575-6bb1-5959-23f9e6a7a1dd
00020000-5575-6bb1-ed0c-61f1ea8e1bdf	00030000-5575-6bb1-4317-16a4b0445952
00020000-5575-6bb1-ed0c-61f1ea8e1bdf	00030000-5575-6bb1-dc0c-eb1be00d0669
00020000-5575-6bb1-ed0c-61f1ea8e1bdf	00030000-5575-6bb1-80d7-ef516a7a28f8
00020000-5575-6bb1-ed0c-61f1ea8e1bdf	00030000-5575-6bb1-e879-ff807c70065c
00020000-5575-6bb1-ed0c-61f1ea8e1bdf	00030000-5575-6bb1-a569-f422333470ab
00020000-5575-6bb1-ed0c-61f1ea8e1bdf	00030000-5575-6bb1-7a0f-6bfdfd0daf32
00020000-5575-6bb1-ed0c-61f1ea8e1bdf	00030000-5575-6bb1-558d-e3263ccdb40f
00020000-5575-6bb1-ed0c-61f1ea8e1bdf	00030000-5575-6bb1-2648-39da7069880a
00020000-5575-6bb1-ed0c-61f1ea8e1bdf	00030000-5575-6bb1-3def-67698462f1c3
00020000-5575-6bb1-ed0c-61f1ea8e1bdf	00030000-5575-6bb1-fc88-4db85ae5423c
00020000-5575-6bb1-ed0c-61f1ea8e1bdf	00030000-5575-6bb1-0fd2-05e068c32b10
00020000-5575-6bb1-ed0c-61f1ea8e1bdf	00030000-5575-6bb1-4224-7c0e0596f76c
00020000-5575-6bb1-1d76-45fedc202eb7	00030000-5575-6bb1-b7e2-b8ef5f90b7b4
00020000-5575-6bb1-1d76-45fedc202eb7	00030000-5575-6bb1-efa0-c36d83fd51ef
00020000-5575-6bb1-1d76-45fedc202eb7	00030000-5575-6bb1-b826-89dec5214af3
00020000-5575-6bb1-1d76-45fedc202eb7	00030000-5575-6bb1-dd3b-5f40727027f4
00020000-5575-6bb1-1d76-45fedc202eb7	00030000-5575-6bb1-ff05-16250793a3fe
00020000-5575-6bb1-1d76-45fedc202eb7	00030000-5575-6bb1-5959-23f9e6a7a1dd
00020000-5575-6bb1-1d76-45fedc202eb7	00030000-5575-6bb1-4317-16a4b0445952
00020000-5575-6bb1-1d76-45fedc202eb7	00030000-5575-6bb1-dc0c-eb1be00d0669
00020000-5575-6bb1-1d76-45fedc202eb7	00030000-5575-6bb1-80d7-ef516a7a28f8
00020000-5575-6bb1-1d76-45fedc202eb7	00030000-5575-6bb1-e879-ff807c70065c
00020000-5575-6bb1-1d76-45fedc202eb7	00030000-5575-6bb1-a569-f422333470ab
00020000-5575-6bb1-1d76-45fedc202eb7	00030000-5575-6bb1-7a0f-6bfdfd0daf32
00020000-5575-6bb1-1d76-45fedc202eb7	00030000-5575-6bb1-558d-e3263ccdb40f
00020000-5575-6bb1-1d76-45fedc202eb7	00030000-5575-6bb1-2648-39da7069880a
00020000-5575-6bb1-1d76-45fedc202eb7	00030000-5575-6bb1-3def-67698462f1c3
00020000-5575-6bb1-1d76-45fedc202eb7	00030000-5575-6bb1-9881-88adbc52b0fe
00020000-5575-6bb1-1d76-45fedc202eb7	00030000-5575-6bb1-0b19-8f9522a3efae
00020000-5575-6bb1-1d76-45fedc202eb7	00030000-5575-6bb1-fc88-4db85ae5423c
00020000-5575-6bb1-1d76-45fedc202eb7	00030000-5575-6bb1-0fd2-05e068c32b10
00020000-5575-6bb1-1d76-45fedc202eb7	00030000-5575-6bb1-4224-7c0e0596f76c
\.


--
-- TOC entry 2811 (class 0 OID 6527396)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2815 (class 0 OID 6527427)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2827 (class 0 OID 6527565)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2788 (class 0 OID 6527161)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5575-6bb2-e48d-a178813a90ce	00040000-5575-6bb1-901b-0806c71dc732	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5575-6bb2-aecf-bee71bc31876	00040000-5575-6bb1-901b-0806c71dc732	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5575-6bb2-146f-b33059e61edb	00040000-5575-6bb1-901b-0806c71dc732	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5575-6bb2-9b6a-478711683365	00040000-5575-6bb1-901b-0806c71dc732	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2790 (class 0 OID 6527196)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5575-6bb0-09da-364b4577e2c6	8341	Adlešiči
00050000-5575-6bb0-b6e5-f03a461c55dc	5270	Ajdovščina
00050000-5575-6bb0-3a05-f368088d5656	6280	Ankaran/Ancarano
00050000-5575-6bb0-fa7a-a19cdff9d6a9	9253	Apače
00050000-5575-6bb0-b8ae-dfdc6fd87566	8253	Artiče
00050000-5575-6bb0-4286-2aeeb46dfec4	4275	Begunje na Gorenjskem
00050000-5575-6bb0-578e-e70c4677e2dc	1382	Begunje pri Cerknici
00050000-5575-6bb0-8d82-f6b6ea2d3544	9231	Beltinci
00050000-5575-6bb0-d51b-7f922d74bad6	2234	Benedikt
00050000-5575-6bb0-5fd3-ac8c41de1730	2345	Bistrica ob Dravi
00050000-5575-6bb0-14b6-0c36b41d108c	3256	Bistrica ob Sotli
00050000-5575-6bb0-e0eb-778bfe987725	8259	Bizeljsko
00050000-5575-6bb0-2ac8-5127390f616e	1223	Blagovica
00050000-5575-6bb0-48cd-6cb1a42e0398	8283	Blanca
00050000-5575-6bb0-68c7-1ca7e783ff38	4260	Bled
00050000-5575-6bb0-ba92-c52b804d46a6	4273	Blejska Dobrava
00050000-5575-6bb0-308a-5c3376500317	9265	Bodonci
00050000-5575-6bb0-001c-3f01109b789b	9222	Bogojina
00050000-5575-6bb0-c3e6-89b1114e8592	4263	Bohinjska Bela
00050000-5575-6bb0-addd-5846d9170111	4264	Bohinjska Bistrica
00050000-5575-6bb0-85e5-d18fab484121	4265	Bohinjsko jezero
00050000-5575-6bb0-745c-b02d32319a67	1353	Borovnica
00050000-5575-6bb0-4060-e07b53918ac7	8294	Boštanj
00050000-5575-6bb0-03f1-c3995906f8f2	5230	Bovec
00050000-5575-6bb0-6108-89adb4c1c680	5295	Branik
00050000-5575-6bb0-57ba-d77fa1cd7d9a	3314	Braslovče
00050000-5575-6bb0-0187-3fe6d02365a1	5223	Breginj
00050000-5575-6bb0-092b-f5dc0567e9d5	8280	Brestanica
00050000-5575-6bb0-c4dd-39ef12da7ea9	2354	Bresternica
00050000-5575-6bb0-8a6a-4d1c2f6235e7	4243	Brezje
00050000-5575-6bb0-3b4b-db5ccb279138	1351	Brezovica pri Ljubljani
00050000-5575-6bb0-e144-c8cac8a0a9b5	8250	Brežice
00050000-5575-6bb0-b64a-3d28b33ba08e	4210	Brnik - Aerodrom
00050000-5575-6bb0-1bce-8d679ff5c56d	8321	Brusnice
00050000-5575-6bb0-1a44-17cdf534aa38	3255	Buče
00050000-5575-6bb0-73cb-d18b3774a431	8276	Bučka 
00050000-5575-6bb0-4400-a9f689632ad5	9261	Cankova
00050000-5575-6bb0-7aa4-2982222456b0	3000	Celje 
00050000-5575-6bb0-e7e6-3efcc6aeead1	3001	Celje - poštni predali
00050000-5575-6bb0-767f-4ea93ce386fa	4207	Cerklje na Gorenjskem
00050000-5575-6bb0-18e2-57bcdf6eafaa	8263	Cerklje ob Krki
00050000-5575-6bb0-a5af-a9e55466bac7	1380	Cerknica
00050000-5575-6bb0-cd4a-f5efe679c81c	5282	Cerkno
00050000-5575-6bb0-f7c7-57d50247f2a9	2236	Cerkvenjak
00050000-5575-6bb0-717d-03ecfd2b31d3	2215	Ceršak
00050000-5575-6bb0-dd4e-b10886cba24b	2326	Cirkovce
00050000-5575-6bb0-62d5-1a7f63e665a3	2282	Cirkulane
00050000-5575-6bb0-eee3-0e7bd499ccf9	5273	Col
00050000-5575-6bb0-9eaf-15c2d106a125	8251	Čatež ob Savi
00050000-5575-6bb0-00e8-e0ae67b60565	1413	Čemšenik
00050000-5575-6bb0-f94a-b8175dc8e968	5253	Čepovan
00050000-5575-6bb0-57e3-45049977a9ad	9232	Črenšovci
00050000-5575-6bb0-9989-366df1631fb3	2393	Črna na Koroškem
00050000-5575-6bb0-2778-b1265768eb86	6275	Črni Kal
00050000-5575-6bb0-f9ee-c5a5253a04aa	5274	Črni Vrh nad Idrijo
00050000-5575-6bb0-f878-a4e333733488	5262	Črniče
00050000-5575-6bb0-cdac-902ed3f8fe70	8340	Črnomelj
00050000-5575-6bb0-6b2d-7714c2163c8c	6271	Dekani
00050000-5575-6bb0-d5d6-3cdfd103fd94	5210	Deskle
00050000-5575-6bb0-1183-6d8a43d533cf	2253	Destrnik
00050000-5575-6bb0-6b63-6be439b1452c	6215	Divača
00050000-5575-6bb0-2fe7-cb8bee4137b1	1233	Dob
00050000-5575-6bb0-63df-ca7239fefd13	3224	Dobje pri Planini
00050000-5575-6bb0-01bf-6fd48ff70280	8257	Dobova
00050000-5575-6bb0-a226-15abe787ea4e	1423	Dobovec
00050000-5575-6bb0-0dd6-649a65a2017b	5263	Dobravlje
00050000-5575-6bb0-98be-da00b1db2c3e	3204	Dobrna
00050000-5575-6bb0-2e9f-ab84b905b118	8211	Dobrnič
00050000-5575-6bb0-7d4d-6ead60a97f5a	1356	Dobrova
00050000-5575-6bb0-b90b-fc9e37de5589	9223	Dobrovnik/Dobronak 
00050000-5575-6bb0-83f6-977c6d4bfda7	5212	Dobrovo v Brdih
00050000-5575-6bb0-6890-b03297389e6f	1431	Dol pri Hrastniku
00050000-5575-6bb0-7f5b-45fa7886e329	1262	Dol pri Ljubljani
00050000-5575-6bb0-89f3-1e5a8c1a0198	1273	Dole pri Litiji
00050000-5575-6bb0-45ab-80f2cb6623f4	1331	Dolenja vas
00050000-5575-6bb0-5979-46c40f46d4f2	8350	Dolenjske Toplice
00050000-5575-6bb0-4724-ffba1c67940c	1230	Domžale
00050000-5575-6bb0-3ce7-755366f6a5b3	2252	Dornava
00050000-5575-6bb0-64b5-319e9ab191d7	5294	Dornberk
00050000-5575-6bb0-09df-b1a3c332b149	1319	Draga
00050000-5575-6bb0-4aea-646f931c3b11	8343	Dragatuš
00050000-5575-6bb0-83e7-9dc2878dc6e9	3222	Dramlje
00050000-5575-6bb0-127c-c35154da8eaa	2370	Dravograd
00050000-5575-6bb0-c116-7fbb5d4e2d7e	4203	Duplje
00050000-5575-6bb0-b50c-18a781c1b14c	6221	Dutovlje
00050000-5575-6bb0-45e4-d559e6910a8a	8361	Dvor
00050000-5575-6bb0-fc1b-88a32f098b64	2343	Fala
00050000-5575-6bb0-dbfe-f5710bc9c6a6	9208	Fokovci
00050000-5575-6bb0-8e80-d6190fbfefb8	2313	Fram
00050000-5575-6bb0-fbf2-bbc2448dea75	3213	Frankolovo
00050000-5575-6bb0-1a33-86e789ca0e59	1274	Gabrovka
00050000-5575-6bb0-335a-9ee019485a94	8254	Globoko
00050000-5575-6bb0-fcc9-8e86c0a96722	5275	Godovič
00050000-5575-6bb0-563e-b7ba55b4cb88	4204	Golnik
00050000-5575-6bb0-59a9-45bc1f6c6fab	3303	Gomilsko
00050000-5575-6bb0-0b57-577d604e0d1e	4224	Gorenja vas
00050000-5575-6bb0-d1f6-438d7be0c700	3263	Gorica pri Slivnici
00050000-5575-6bb0-c0fe-f9d7c339ed92	2272	Gorišnica
00050000-5575-6bb0-90a8-ba9330f5fee1	9250	Gornja Radgona
00050000-5575-6bb0-30fe-69e603fcd501	3342	Gornji Grad
00050000-5575-6bb0-bafc-e0e5e64ff93e	4282	Gozd Martuljek
00050000-5575-6bb0-a8e4-332d862014c4	6272	Gračišče
00050000-5575-6bb0-cd49-772e917d8acf	9264	Grad
00050000-5575-6bb0-b94e-6f0eb529fdc4	8332	Gradac
00050000-5575-6bb0-bd32-50434d3d54cf	1384	Grahovo
00050000-5575-6bb0-7d5c-3f3aa4ef079f	5242	Grahovo ob Bači
00050000-5575-6bb0-fafe-4fef45dca816	5251	Grgar
00050000-5575-6bb0-acce-05ddd23ae8e6	3302	Griže
00050000-5575-6bb0-b42b-38f1cdbe73f4	3231	Grobelno
00050000-5575-6bb0-b77a-bb97dc0a5748	1290	Grosuplje
00050000-5575-6bb0-3cce-8570c8e82bab	2288	Hajdina
00050000-5575-6bb0-8a69-218c6f1806cb	8362	Hinje
00050000-5575-6bb0-ccb3-6bacb9e76d8a	2311	Hoče
00050000-5575-6bb0-f8b3-5fa38eb5744f	9205	Hodoš/Hodos
00050000-5575-6bb0-4df7-287ff62df288	1354	Horjul
00050000-5575-6bb0-b5da-faa084cdee14	1372	Hotedršica
00050000-5575-6bb0-4c73-a1fd91289b7d	1430	Hrastnik
00050000-5575-6bb0-7bc6-212333fddfd7	6225	Hruševje
00050000-5575-6bb0-82d1-11c9f796f306	4276	Hrušica
00050000-5575-6bb0-2fa7-9355e69725b7	5280	Idrija
00050000-5575-6bb0-8af1-a5fd89d3882f	1292	Ig
00050000-5575-6bb0-8337-82ed30b50cd5	6250	Ilirska Bistrica
00050000-5575-6bb0-b8fd-0426867e9cb4	6251	Ilirska Bistrica-Trnovo
00050000-5575-6bb0-dc4f-f05749f472cb	1295	Ivančna Gorica
00050000-5575-6bb0-eb24-6c35aaeb8941	2259	Ivanjkovci
00050000-5575-6bb0-bb34-c19dfc52a709	1411	Izlake
00050000-5575-6bb0-fc24-fded38846a71	6310	Izola/Isola
00050000-5575-6bb0-2c72-5c7f60e22347	2222	Jakobski Dol
00050000-5575-6bb0-b116-62fcf2dab1ab	2221	Jarenina
00050000-5575-6bb0-62eb-0755246cdecc	6254	Jelšane
00050000-5575-6bb0-e1b3-db3814a853f2	4270	Jesenice
00050000-5575-6bb0-f258-827421d0504a	8261	Jesenice na Dolenjskem
00050000-5575-6bb0-bd1b-117434ad3778	3273	Jurklošter
00050000-5575-6bb0-c6bc-f6261be03f72	2223	Jurovski Dol
00050000-5575-6bb0-40c1-ef21ddbadfc6	2256	Juršinci
00050000-5575-6bb0-7538-8a5e89665221	5214	Kal nad Kanalom
00050000-5575-6bb0-3c77-54018d3f3c80	3233	Kalobje
00050000-5575-6bb0-7c6b-d9bdf7212212	4246	Kamna Gorica
00050000-5575-6bb0-1415-0751cce756fd	2351	Kamnica
00050000-5575-6bb0-34c5-f65c425607c0	1241	Kamnik
00050000-5575-6bb0-0df5-9e5185e36092	5213	Kanal
00050000-5575-6bb0-08dd-fadb12b13c4e	8258	Kapele
00050000-5575-6bb0-e880-0cd055aafa57	2362	Kapla
00050000-5575-6bb0-9583-180a1c83d8fc	2325	Kidričevo
00050000-5575-6bb0-dd6e-10bd4a63ea95	1412	Kisovec
00050000-5575-6bb0-9e99-c5d211b3f600	6253	Knežak
00050000-5575-6bb0-7f92-a26efd5e5b3e	5222	Kobarid
00050000-5575-6bb0-b5b1-018054fe7134	9227	Kobilje
00050000-5575-6bb0-b59b-36b245a055e2	1330	Kočevje
00050000-5575-6bb0-24a4-82b35076eb37	1338	Kočevska Reka
00050000-5575-6bb0-a6e0-27021de5475e	2276	Kog
00050000-5575-6bb0-9115-0fa0fe5987d0	5211	Kojsko
00050000-5575-6bb0-39ac-7fe1fb2852a0	6223	Komen
00050000-5575-6bb0-cd78-714b638cacab	1218	Komenda
00050000-5575-6bb0-28b6-893377de8d59	6000	Koper/Capodistria 
00050000-5575-6bb0-dada-a90ba39da421	6001	Koper/Capodistria - poštni predali
00050000-5575-6bb0-559d-dbfef75970a1	8282	Koprivnica
00050000-5575-6bb0-e386-c321dbc8ebc0	5296	Kostanjevica na Krasu
00050000-5575-6bb0-bab6-595d0335d668	8311	Kostanjevica na Krki
00050000-5575-6bb0-c901-110847b1490a	1336	Kostel
00050000-5575-6bb0-d63c-3072ecd090c8	6256	Košana
00050000-5575-6bb0-2f5f-a47c2cfe6383	2394	Kotlje
00050000-5575-6bb0-b44c-3d387db12ab6	6240	Kozina
00050000-5575-6bb0-c2a2-475f9c617604	3260	Kozje
00050000-5575-6bb0-fb8e-986969cf7766	4000	Kranj 
00050000-5575-6bb0-94f0-38c7f390ae65	4001	Kranj - poštni predali
00050000-5575-6bb0-c2c9-c6acc495e9a1	4280	Kranjska Gora
00050000-5575-6bb0-36ab-5c3c79aba1f6	1281	Kresnice
00050000-5575-6bb0-05b1-bf1c24fcfe59	4294	Križe
00050000-5575-6bb0-35fe-2cbfe7a618d9	9206	Križevci
00050000-5575-6bb0-5179-70a0b34b6320	9242	Križevci pri Ljutomeru
00050000-5575-6bb0-2723-06458346d8de	1301	Krka
00050000-5575-6bb0-3bed-3af5a4979ffb	8296	Krmelj
00050000-5575-6bb0-6959-4367e1e68a55	4245	Kropa
00050000-5575-6bb0-803c-89d765045bb9	8262	Krška vas
00050000-5575-6bb0-cefa-5de9f2e5f584	8270	Krško
00050000-5575-6bb0-880b-c43036fc1a6d	9263	Kuzma
00050000-5575-6bb0-1c7b-90bee56ad9dd	2318	Laporje
00050000-5575-6bb0-f8a1-5f102607719a	3270	Laško
00050000-5575-6bb0-2af2-832d804e5a24	1219	Laze v Tuhinju
00050000-5575-6bb0-069c-b7650bc20cc6	2230	Lenart v Slovenskih goricah
00050000-5575-6bb0-e9ab-33a0814df130	9220	Lendava/Lendva
00050000-5575-6bb0-a678-13b2b6968ca2	4248	Lesce
00050000-5575-6bb0-6d01-594c8bc32208	3261	Lesično
00050000-5575-6bb0-2eac-aff539a672fb	8273	Leskovec pri Krškem
00050000-5575-6bb0-37fa-f46afd788365	2372	Libeliče
00050000-5575-6bb0-e5a8-9f296eecd430	2341	Limbuš
00050000-5575-6bb0-3836-0700f91b4e61	1270	Litija
00050000-5575-6bb0-e6a2-97dd73c0c954	3202	Ljubečna
00050000-5575-6bb0-e926-e5aa5c33e11f	1000	Ljubljana 
00050000-5575-6bb0-e077-55b9428270af	1001	Ljubljana - poštni predali
00050000-5575-6bb0-1940-8b46fda9858e	1231	Ljubljana - Črnuče
00050000-5575-6bb0-c6cc-f889755ee2b1	1261	Ljubljana - Dobrunje
00050000-5575-6bb0-490c-d62b6b66ee8d	1260	Ljubljana - Polje
00050000-5575-6bb0-3cc9-b434129cb4be	1210	Ljubljana - Šentvid
00050000-5575-6bb0-c92f-fbef6680f614	1211	Ljubljana - Šmartno
00050000-5575-6bb0-2951-9ebb6d8ce1c5	3333	Ljubno ob Savinji
00050000-5575-6bb0-2219-cb769a8d0651	9240	Ljutomer
00050000-5575-6bb0-a887-64a8fb626aa0	3215	Loče
00050000-5575-6bb0-39fb-70487f7b85f2	5231	Log pod Mangartom
00050000-5575-6bb0-04f7-d8734d0d1f6e	1358	Log pri Brezovici
00050000-5575-6bb0-9995-88c7ba9ee399	1370	Logatec
00050000-5575-6bb0-d275-a715271838d6	1371	Logatec
00050000-5575-6bb0-b0fb-d3e5e396a5f5	1434	Loka pri Zidanem Mostu
00050000-5575-6bb0-eb42-67606d749503	3223	Loka pri Žusmu
00050000-5575-6bb0-3df9-39648fcade10	6219	Lokev
00050000-5575-6bb0-c2b5-b889b14ac42b	1318	Loški Potok
00050000-5575-6bb0-197e-a00100d49756	2324	Lovrenc na Dravskem polju
00050000-5575-6bb0-ef35-bae0b0e4d125	2344	Lovrenc na Pohorju
00050000-5575-6bb0-1970-167f83d6eb81	3334	Luče
00050000-5575-6bb0-f784-1fe33c3dddbf	1225	Lukovica
00050000-5575-6bb0-997f-aab8536ca9f2	9202	Mačkovci
00050000-5575-6bb0-c1b9-9a6e9e21b1fe	2322	Majšperk
00050000-5575-6bb0-62b9-b5f96f5013c4	2321	Makole
00050000-5575-6bb0-ca04-56029973bf73	9243	Mala Nedelja
00050000-5575-6bb0-a466-f93a7a0dd7ae	2229	Malečnik
00050000-5575-6bb0-e705-87eadfe99716	6273	Marezige
00050000-5575-6bb0-8deb-47ce68470dcb	2000	Maribor 
00050000-5575-6bb0-a25b-58b9162aaf33	2001	Maribor - poštni predali
00050000-5575-6bb0-e14c-e575b20fc542	2206	Marjeta na Dravskem polju
00050000-5575-6bb0-e27a-067177b2e73f	2281	Markovci
00050000-5575-6bb0-1103-68ae21c55253	9221	Martjanci
00050000-5575-6bb0-511c-a27b9a68216a	6242	Materija
00050000-5575-6bb0-7b7c-0e00d2658f49	4211	Mavčiče
00050000-5575-6bb0-d1a0-3a7c81f9279a	1215	Medvode
00050000-5575-6bb0-b7ed-741b3d6b482b	1234	Mengeš
00050000-5575-6bb0-85de-249c56fb7dea	8330	Metlika
00050000-5575-6bb0-fc8f-7cea1c7cd79b	2392	Mežica
00050000-5575-6bb0-a62a-fa1d3b39ae34	2204	Miklavž na Dravskem polju
00050000-5575-6bb0-c41d-3b984af97027	2275	Miklavž pri Ormožu
00050000-5575-6bb0-2fb6-b9cf1ecf2db0	5291	Miren
00050000-5575-6bb0-868b-4347157fa5f4	8233	Mirna
00050000-5575-6bb0-acb2-ecb5be862315	8216	Mirna Peč
00050000-5575-6bb0-37b9-2f9f1593b014	2382	Mislinja
00050000-5575-6bb0-bf3b-3691b555ab50	4281	Mojstrana
00050000-5575-6bb0-124b-0a9b30d45b41	8230	Mokronog
00050000-5575-6bb0-45d1-9960cabdfd9e	1251	Moravče
00050000-5575-6bb0-f65d-c2017f5eb2e6	9226	Moravske Toplice
00050000-5575-6bb0-1906-999dfc2baf50	5216	Most na Soči
00050000-5575-6bb0-3b37-a7125385b1d6	1221	Motnik
00050000-5575-6bb0-3873-5e4e6b415db1	3330	Mozirje
00050000-5575-6bb0-1ef1-f0c59215cc06	9000	Murska Sobota 
00050000-5575-6bb0-d5d1-3ac46087c4e0	9001	Murska Sobota - poštni predali
00050000-5575-6bb0-3fec-7e2a67bc01a9	2366	Muta
00050000-5575-6bb0-ffca-aa4dc6e1d075	4202	Naklo
00050000-5575-6bb0-b929-9a3de4f41fa2	3331	Nazarje
00050000-5575-6bb0-3cd4-3d2cc965b121	1357	Notranje Gorice
00050000-5575-6bb0-8d8c-6b99ddc6d0f3	3203	Nova Cerkev
00050000-5575-6bb0-1ed6-0af48b132a4a	5000	Nova Gorica 
00050000-5575-6bb0-f856-63b105936a42	5001	Nova Gorica - poštni predali
00050000-5575-6bb0-d369-ca7577184f8f	1385	Nova vas
00050000-5575-6bb0-d38e-11c600752717	8000	Novo mesto
00050000-5575-6bb0-1b6a-14517b0013a3	8001	Novo mesto - poštni predali
00050000-5575-6bb0-3321-f55d44361f0a	6243	Obrov
00050000-5575-6bb0-ca16-24a00764f62f	9233	Odranci
00050000-5575-6bb0-f52d-3a2b841271cf	2317	Oplotnica
00050000-5575-6bb0-b267-c5bc9bae1a53	2312	Orehova vas
00050000-5575-6bb0-ecce-b1565f2c32f5	2270	Ormož
00050000-5575-6bb0-6995-ee2a92cc6e6f	1316	Ortnek
00050000-5575-6bb0-77b9-974b3c1befe9	1337	Osilnica
00050000-5575-6bb0-c7dc-ce23ee368f0e	8222	Otočec
00050000-5575-6bb0-963f-e72cb2059380	2361	Ožbalt
00050000-5575-6bb0-4ebf-5b94d1c28ba1	2231	Pernica
00050000-5575-6bb0-9aca-56a7b3257ca5	2211	Pesnica pri Mariboru
00050000-5575-6bb0-06b0-44748e98a6e3	9203	Petrovci
00050000-5575-6bb0-02ad-c1e8cf446d25	3301	Petrovče
00050000-5575-6bb0-8245-1d4cedfcb556	6330	Piran/Pirano
00050000-5575-6bb0-3f28-2414ff70cea8	8255	Pišece
00050000-5575-6bb0-74fc-7ba33f8bed9d	6257	Pivka
00050000-5575-6bb0-f58e-e5e7618981fa	6232	Planina
00050000-5575-6bb0-ef64-b38e2ee3d153	3225	Planina pri Sevnici
00050000-5575-6bb0-adea-1dceefe40f31	6276	Pobegi
00050000-5575-6bb0-cea0-3fc4e5c0697c	8312	Podbočje
00050000-5575-6bb0-f964-856897ae033b	5243	Podbrdo
00050000-5575-6bb0-b1a4-033ffeee0a00	3254	Podčetrtek
00050000-5575-6bb0-2a51-1324bb850a9e	2273	Podgorci
00050000-5575-6bb0-2d9a-f0a966ffbe8d	6216	Podgorje
00050000-5575-6bb0-1d9c-0e71459ce624	2381	Podgorje pri Slovenj Gradcu
00050000-5575-6bb0-318b-1acb1823d6b9	6244	Podgrad
00050000-5575-6bb0-b1b2-1e427b7968b3	1414	Podkum
00050000-5575-6bb0-d152-b6e2221bb090	2286	Podlehnik
00050000-5575-6bb0-01b4-825627ed75ca	5272	Podnanos
00050000-5575-6bb0-462b-09b9b0b2eece	4244	Podnart
00050000-5575-6bb0-bb25-14cdda0468f5	3241	Podplat
00050000-5575-6bb0-c96c-3bd75247ef01	3257	Podsreda
00050000-5575-6bb0-9dd1-3325678fb711	2363	Podvelka
00050000-5575-6bb0-1d0e-9ec5eb0b670a	2208	Pohorje
00050000-5575-6bb0-3503-8af6787a6fe8	2257	Polenšak
00050000-5575-6bb0-2c8c-ab1f53693892	1355	Polhov Gradec
00050000-5575-6bb0-e911-fc6780cabd4b	4223	Poljane nad Škofjo Loko
00050000-5575-6bb0-b7c5-8670ea4c5283	2319	Poljčane
00050000-5575-6bb0-1bb7-7ff255d9bced	1272	Polšnik
00050000-5575-6bb0-0c64-31febecad04f	3313	Polzela
00050000-5575-6bb0-594a-d8ebc6e96948	3232	Ponikva
00050000-5575-6bb0-53ea-13e0e396a7f7	6320	Portorož/Portorose
00050000-5575-6bb0-b61a-a5a78a57701a	6230	Postojna
00050000-5575-6bb0-bda6-f432e954307c	2331	Pragersko
00050000-5575-6bb0-5680-6801db38d56c	3312	Prebold
00050000-5575-6bb0-b4d5-193cf52989cd	4205	Preddvor
00050000-5575-6bb0-ae65-c39fe500fb4d	6255	Prem
00050000-5575-6bb0-4e9e-462c5b037cd8	1352	Preserje
00050000-5575-6bb0-bc91-6c1afbb52a91	6258	Prestranek
00050000-5575-6bb0-7336-012d977586a6	2391	Prevalje
00050000-5575-6bb0-0f07-d10f76c3a2f6	3262	Prevorje
00050000-5575-6bb0-fa39-8886c5f7d874	1276	Primskovo 
00050000-5575-6bb0-0d42-1ffdcc0f658a	3253	Pristava pri Mestinju
00050000-5575-6bb0-fe3a-01d997375d77	9207	Prosenjakovci/Partosfalva
00050000-5575-6bb0-6496-cd646505d6c3	5297	Prvačina
00050000-5575-6bb0-4511-cbdd76ef960d	2250	Ptuj
00050000-5575-6bb0-66d4-a1a08f533e00	2323	Ptujska Gora
00050000-5575-6bb0-5847-97bb00bdc51f	9201	Puconci
00050000-5575-6bb0-8c35-25b8f6bdd866	2327	Rače
00050000-5575-6bb0-6233-ca9621ba1f22	1433	Radeče
00050000-5575-6bb0-c6e6-c8859b51894f	9252	Radenci
00050000-5575-6bb0-6d4d-ae09d07e224c	2360	Radlje ob Dravi
00050000-5575-6bb0-d12b-06bb687885f9	1235	Radomlje
00050000-5575-6bb0-c990-0ea27a4c0be9	4240	Radovljica
00050000-5575-6bb0-81c6-240554514c8a	8274	Raka
00050000-5575-6bb0-31a1-b7b40a9b4bbf	1381	Rakek
00050000-5575-6bb0-140c-66bb286c0934	4283	Rateče - Planica
00050000-5575-6bb0-9650-865511c610d0	2390	Ravne na Koroškem
00050000-5575-6bb0-cb65-539f0fd4c6d6	9246	Razkrižje
00050000-5575-6bb0-7b4d-b348c39750e5	3332	Rečica ob Savinji
00050000-5575-6bb0-885f-12c50b4cd840	5292	Renče
00050000-5575-6bb0-54de-f3b286e8d71c	1310	Ribnica
00050000-5575-6bb0-d7f2-df98b324b779	2364	Ribnica na Pohorju
00050000-5575-6bb0-88b3-ce945366b434	3272	Rimske Toplice
00050000-5575-6bb0-88d7-8bfeb40742c0	1314	Rob
00050000-5575-6bb0-ee6e-cdd1156b59c6	5215	Ročinj
00050000-5575-6bb0-20da-98e369bf12ce	3250	Rogaška Slatina
00050000-5575-6bb0-a613-f883752141a4	9262	Rogašovci
00050000-5575-6bb0-51fd-857d8d4108d2	3252	Rogatec
00050000-5575-6bb0-dc8d-99baf8e4d7e2	1373	Rovte
00050000-5575-6bb0-29eb-be9b784a0ad1	2342	Ruše
00050000-5575-6bb0-9aaf-fd88989916f5	1282	Sava
00050000-5575-6bb0-0163-e2cb80af635e	6333	Sečovlje/Sicciole
00050000-5575-6bb0-818e-da1707829bc0	4227	Selca
00050000-5575-6bb0-25fa-3084be75ece1	2352	Selnica ob Dravi
00050000-5575-6bb0-03dd-dbb5efb78341	8333	Semič
00050000-5575-6bb0-1ca5-52e5bf6e4723	8281	Senovo
00050000-5575-6bb0-9617-c38e52590b0f	6224	Senožeče
00050000-5575-6bb0-adaf-de1868676206	8290	Sevnica
00050000-5575-6bb0-3600-ffdaa68789ba	6210	Sežana
00050000-5575-6bb0-206f-6c059157422d	2214	Sladki Vrh
00050000-5575-6bb0-5cd0-6234600ab20a	5283	Slap ob Idrijci
00050000-5575-6bb0-33f3-25d4fc5eccbd	2380	Slovenj Gradec
00050000-5575-6bb0-5b34-e6a44f70668d	2310	Slovenska Bistrica
00050000-5575-6bb0-2bda-7edc493b7a70	3210	Slovenske Konjice
00050000-5575-6bb0-1e41-6cad9dc53532	1216	Smlednik
00050000-5575-6bb0-63cd-f55c5f929e71	5232	Soča
00050000-5575-6bb0-9360-3c061e39bb3b	1317	Sodražica
00050000-5575-6bb0-9e65-d3238f64e600	3335	Solčava
00050000-5575-6bb0-e71d-e015e5de1d7f	5250	Solkan
00050000-5575-6bb0-ebf1-6a301189232a	4229	Sorica
00050000-5575-6bb0-53ab-f50669035541	4225	Sovodenj
00050000-5575-6bb0-109e-d8baa6cc3ee1	5281	Spodnja Idrija
00050000-5575-6bb0-f2dc-98eb3b07ad79	2241	Spodnji Duplek
00050000-5575-6bb0-06b1-1eca11425a27	9245	Spodnji Ivanjci
00050000-5575-6bb0-731f-3586b38479db	2277	Središče ob Dravi
00050000-5575-6bb0-fca6-e3b59951b672	4267	Srednja vas v Bohinju
00050000-5575-6bb0-082b-4944ba0a3848	8256	Sromlje 
00050000-5575-6bb0-dd37-6b01c099d75d	5224	Srpenica
00050000-5575-6bb0-e62a-26e675c6517f	1242	Stahovica
00050000-5575-6bb0-e847-5782d66ddb23	1332	Stara Cerkev
00050000-5575-6bb0-bd9a-fde88da57ded	8342	Stari trg ob Kolpi
00050000-5575-6bb0-9d62-36cc0ed61ce1	1386	Stari trg pri Ložu
00050000-5575-6bb0-6a39-860d72f86146	2205	Starše
00050000-5575-6bb0-d9d1-f66a1669c104	2289	Stoperce
00050000-5575-6bb0-b2cb-0da18e8172a3	8322	Stopiče
00050000-5575-6bb0-a8ae-373b170ea46e	3206	Stranice
00050000-5575-6bb0-cbe6-a3fb955a3369	8351	Straža
00050000-5575-6bb0-4a29-0edcc098178b	1313	Struge
00050000-5575-6bb0-065d-a45c78f3a249	8293	Studenec
00050000-5575-6bb0-e237-e7c18309cfc5	8331	Suhor
00050000-5575-6bb0-0431-942b4aabbded	2233	Sv. Ana v Slovenskih goricah
00050000-5575-6bb0-7643-c16b2e2d962b	2235	Sv. Trojica v Slovenskih goricah
00050000-5575-6bb0-b230-4b164fed6a2e	2353	Sveti Duh na Ostrem Vrhu
00050000-5575-6bb0-fc25-5d89d9c17ca2	9244	Sveti Jurij ob Ščavnici
00050000-5575-6bb0-cb07-c903dc46b5bf	3264	Sveti Štefan
00050000-5575-6bb0-1872-53c28826b6e3	2258	Sveti Tomaž
00050000-5575-6bb0-a319-90c9f0ae6c52	9204	Šalovci
00050000-5575-6bb0-e655-645785feb797	5261	Šempas
00050000-5575-6bb0-9b55-80f6cfecee22	5290	Šempeter pri Gorici
00050000-5575-6bb0-899a-9a637589dabf	3311	Šempeter v Savinjski dolini
00050000-5575-6bb0-2a10-23e68fe11b64	4208	Šenčur
00050000-5575-6bb0-1aa0-2eda8fc76198	2212	Šentilj v Slovenskih goricah
00050000-5575-6bb0-b7ed-1116698df76f	8297	Šentjanž
00050000-5575-6bb0-068c-b5b34f7ef18e	2373	Šentjanž pri Dravogradu
00050000-5575-6bb0-edc7-288ab479009c	8310	Šentjernej
00050000-5575-6bb0-a4c6-b659ab48d4bc	3230	Šentjur
00050000-5575-6bb0-a82f-4ce0ce950e64	3271	Šentrupert
00050000-5575-6bb0-9847-44db3afb03c7	8232	Šentrupert
00050000-5575-6bb0-e0f5-bc132dcc99a5	1296	Šentvid pri Stični
00050000-5575-6bb0-69f8-442ad3946b92	8275	Škocjan
00050000-5575-6bb0-b41d-2c6889ce81cf	6281	Škofije
00050000-5575-6bb0-7407-925cf53aa856	4220	Škofja Loka
00050000-5575-6bb0-b92b-d1c96d0235a4	3211	Škofja vas
00050000-5575-6bb0-556a-9cf7064e51aa	1291	Škofljica
00050000-5575-6bb0-3730-b7fc7aba0f88	6274	Šmarje
00050000-5575-6bb0-97c9-17b98dcebeec	1293	Šmarje - Sap
00050000-5575-6bb0-225f-47514cad873f	3240	Šmarje pri Jelšah
00050000-5575-6bb0-5db4-71cae59bd993	8220	Šmarješke Toplice
00050000-5575-6bb0-97e7-a00185d68218	2315	Šmartno na Pohorju
00050000-5575-6bb0-47ea-f7348b2449ca	3341	Šmartno ob Dreti
00050000-5575-6bb0-5414-7038ec302c4c	3327	Šmartno ob Paki
00050000-5575-6bb0-91de-d90d20b1b53b	1275	Šmartno pri Litiji
00050000-5575-6bb0-de6a-c7fcf693da87	2383	Šmartno pri Slovenj Gradcu
00050000-5575-6bb0-63db-1374fb1bb162	3201	Šmartno v Rožni dolini
00050000-5575-6bb0-732e-1310033f3de3	3325	Šoštanj
00050000-5575-6bb0-8956-393804f33620	6222	Štanjel
00050000-5575-6bb0-94b1-2005073d610a	3220	Štore
00050000-5575-6bb0-fc99-4e13a0ecb651	3304	Tabor
00050000-5575-6bb0-6e4b-81a7154af78e	3221	Teharje
00050000-5575-6bb0-90eb-347cf87a5ced	9251	Tišina
00050000-5575-6bb0-ed6b-6cbaa5fa85fb	5220	Tolmin
00050000-5575-6bb0-0da5-f61cfe7b456c	3326	Topolšica
00050000-5575-6bb0-7455-72c7864092be	2371	Trbonje
00050000-5575-6bb0-dece-871daf43be83	1420	Trbovlje
00050000-5575-6bb0-5caf-886f06e00954	8231	Trebelno 
00050000-5575-6bb0-6ac9-1c277a693721	8210	Trebnje
00050000-5575-6bb0-ff60-be23054abede	5252	Trnovo pri Gorici
00050000-5575-6bb0-2400-52efc24a140a	2254	Trnovska vas
00050000-5575-6bb0-6bfb-9c0a97fd2c28	1222	Trojane
00050000-5575-6bb0-ff65-bbe9eaa9c362	1236	Trzin
00050000-5575-6bb0-bf18-3184213c00fa	4290	Tržič
00050000-5575-6bb0-780b-332a6336607f	8295	Tržišče
00050000-5575-6bb0-a420-bf5ec3507a3a	1311	Turjak
00050000-5575-6bb0-320e-a9b58fae797a	9224	Turnišče
00050000-5575-6bb0-b5f3-c815633049f7	8323	Uršna sela
00050000-5575-6bb0-a9ec-56188f9eeb4d	1252	Vače
00050000-5575-6bb0-e727-00ec72795cd5	3320	Velenje 
00050000-5575-6bb0-38f1-4cda7d9662a1	3322	Velenje - poštni predali
00050000-5575-6bb0-59df-c97cb127727c	8212	Velika Loka
00050000-5575-6bb0-748b-88dd4cb4a418	2274	Velika Nedelja
00050000-5575-6bb0-d6e7-6de4e2338548	9225	Velika Polana
00050000-5575-6bb0-c18a-35ab687fbe41	1315	Velike Lašče
00050000-5575-6bb0-916e-4ab168aa8f99	8213	Veliki Gaber
00050000-5575-6bb0-572d-b5e2acb959ff	9241	Veržej
00050000-5575-6bb0-c475-676c824635ce	1312	Videm - Dobrepolje
00050000-5575-6bb0-ec2c-08b1d67f123e	2284	Videm pri Ptuju
00050000-5575-6bb0-369b-de7b8da283a1	8344	Vinica
00050000-5575-6bb0-c79e-a89719b9610e	5271	Vipava
00050000-5575-6bb0-2855-5e084c7977f7	4212	Visoko
00050000-5575-6bb0-4f82-cbf36a10703f	1294	Višnja Gora
00050000-5575-6bb0-179a-0299efe2a5c7	3205	Vitanje
00050000-5575-6bb0-0de9-f8eb6ea500ff	2255	Vitomarci
00050000-5575-6bb0-3273-20ab0720683d	1217	Vodice
00050000-5575-6bb0-7bcd-16a72cbc0159	3212	Vojnik\t
00050000-5575-6bb0-3669-8f347674b5a5	5293	Volčja Draga
00050000-5575-6bb0-1ae8-3eb69f73ebb2	2232	Voličina
00050000-5575-6bb0-891c-996aaa1887dd	3305	Vransko
00050000-5575-6bb0-274e-9ce2f5dad91a	6217	Vremski Britof
00050000-5575-6bb0-0914-61d9aae2a8c3	1360	Vrhnika
00050000-5575-6bb0-ef67-ad6745c54837	2365	Vuhred
00050000-5575-6bb0-6c43-28fda7722958	2367	Vuzenica
00050000-5575-6bb0-67d7-4525f2a005eb	8292	Zabukovje 
00050000-5575-6bb0-d023-a90ccc737254	1410	Zagorje ob Savi
00050000-5575-6bb0-5177-4d27479e0dd2	1303	Zagradec
00050000-5575-6bb0-1213-02aebe95055f	2283	Zavrč
00050000-5575-6bb0-0edd-4c4da7d6cd0e	8272	Zdole 
00050000-5575-6bb0-083d-c8dd70f081ce	4201	Zgornja Besnica
00050000-5575-6bb0-e683-ddc854693721	2242	Zgornja Korena
00050000-5575-6bb0-3885-8aa88abd66d9	2201	Zgornja Kungota
00050000-5575-6bb0-56b7-21a0235ba2a1	2316	Zgornja Ložnica
00050000-5575-6bb0-39c7-97a687535b0c	2314	Zgornja Polskava
00050000-5575-6bb0-fa3f-741a9bf1b054	2213	Zgornja Velka
00050000-5575-6bb0-68dc-94466cb1782d	4247	Zgornje Gorje
00050000-5575-6bb0-fbe2-9a85a3263853	4206	Zgornje Jezersko
00050000-5575-6bb0-9cd1-98299fbdd4e1	2285	Zgornji Leskovec
00050000-5575-6bb0-f340-f0a8808b8bed	1432	Zidani Most
00050000-5575-6bb0-ca01-89b9203e39eb	3214	Zreče
00050000-5575-6bb0-bbf0-7889a791bdcb	4209	Žabnica
00050000-5575-6bb0-5ae1-f527030a0c7d	3310	Žalec
00050000-5575-6bb0-b9a0-374c416a06c7	4228	Železniki
00050000-5575-6bb0-ad36-502581a6435b	2287	Žetale
00050000-5575-6bb0-01db-1f9c00759c17	4226	Žiri
00050000-5575-6bb0-b21f-def24b6b47d3	4274	Žirovnica
00050000-5575-6bb0-03f7-516182e83880	8360	Žužemberk
\.


--
-- TOC entry 2807 (class 0 OID 6527370)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2775 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2789 (class 0 OID 6527181)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2795 (class 0 OID 6527259)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2809 (class 0 OID 6527382)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 6527502)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2826 (class 0 OID 6527557)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5575-6bb2-7030-ee4d61c5b8f5	00080000-5575-6bb2-146f-b33059e61edb	0987	A
00190000-5575-6bb2-dcb4-8f8b18039a27	00080000-5575-6bb2-aecf-bee71bc31876	0989	A
\.


--
-- TOC entry 2833 (class 0 OID 6527671)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 6527699)
-- Dependencies: 232
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id) FROM stdin;
\.


--
-- TOC entry 2850 (class 0 OID 0)
-- Dependencies: 237
-- Name: programfestival_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('programfestival_id_seq', 1, false);


--
-- TOC entry 2834 (class 0 OID 6527680)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, program_dela_id, gostitelj_id, transportnistroski, odkup) FROM stdin;
\.


--
-- TOC entry 2851 (class 0 OID 0)
-- Dependencies: 236
-- Name: programgostovanje_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('programgostovanje_id_seq', 1, false);


--
-- TOC entry 2813 (class 0 OID 6527411)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5575-6bb2-6cf2-dd7072c228f7	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5575-6bb2-fd6d-0fcddad822d5	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5575-6bb2-ba59-105103a07f68	0003	Kazinska	t	84	Kazinska dvorana
00220000-5575-6bb2-881f-ce05df2ff75f	0004	Mali oder	t	24	Mali oder 
00220000-5575-6bb2-1e7c-ffce48f58ad2	0005	Komorni oder	t	15	Komorni oder
00220000-5575-6bb2-d911-e6d0999b1671	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5575-6bb2-b38b-6085868109fe	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2805 (class 0 OID 6527355)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2804 (class 0 OID 6527345)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 6527546)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2820 (class 0 OID 6527479)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2778 (class 0 OID 6527053)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5575-6bb1-3bc0-3e457e1ceb05	00010000-5575-6bb1-e92f-44ecd4ea3703	2015-06-08 12:17:23	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO3cjLmQv9fvyQHxzYisragNBebC8N.RS";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2852 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2814 (class 0 OID 6527421)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2782 (class 0 OID 6527091)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5575-6bb1-c271-4879c8d1f443	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5575-6bb1-dc45-50b252090554	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5575-6bb1-dc1a-241ccf84379c	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5575-6bb1-34a2-f58880e72e59	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5575-6bb1-cc8f-31ad71043358	planer	Planer dogodkov v koledarju	t
00020000-5575-6bb1-5c48-93d8cb7d05f7	kadrovska	Kadrovska služba	t
00020000-5575-6bb1-4ae5-baebde12154b	arhivar	Ažuriranje arhivalij	t
00020000-5575-6bb1-ed0c-61f1ea8e1bdf	igralec	Igralec	t
00020000-5575-6bb1-1d76-45fedc202eb7	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2780 (class 0 OID 6527075)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5575-6bb1-3bc0-3e457e1ceb05	00020000-5575-6bb1-dc1a-241ccf84379c
00010000-5575-6bb1-e92f-44ecd4ea3703	00020000-5575-6bb1-dc1a-241ccf84379c
\.


--
-- TOC entry 2816 (class 0 OID 6527435)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2808 (class 0 OID 6527376)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2802 (class 0 OID 6527326)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2839 (class 0 OID 6527718)
-- Dependencies: 235
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5575-6bb1-3716-ab7172cd341c	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5575-6bb1-c7ea-c45c92636ce9	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5575-6bb1-972b-9ea1e5d4227b	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5575-6bb1-4d27-98165f121f62	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5575-6bb1-1ad5-d65dcd8269cf	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2838 (class 0 OID 6527710)
-- Dependencies: 234
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5575-6bb1-f4fe-a8bcc3b9ef84	00230000-5575-6bb1-4d27-98165f121f62	popa
00240000-5575-6bb1-9a16-294746ee7ced	00230000-5575-6bb1-4d27-98165f121f62	oseba
00240000-5575-6bb1-0ab9-6f3fade1c5e8	00230000-5575-6bb1-c7ea-c45c92636ce9	prostor
00240000-5575-6bb1-a4a6-2ad71571cf55	00230000-5575-6bb1-4d27-98165f121f62	besedilo
00240000-5575-6bb1-ffff-9115647310fe	00230000-5575-6bb1-4d27-98165f121f62	uprizoritev
00240000-5575-6bb1-db50-f8e89d6c2b32	00230000-5575-6bb1-4d27-98165f121f62	funkcija
00240000-5575-6bb1-30f0-b337c7f7d4cb	00230000-5575-6bb1-4d27-98165f121f62	tipfunkcije
00240000-5575-6bb1-2f8c-9bc821794819	00230000-5575-6bb1-4d27-98165f121f62	alternacija
00240000-5575-6bb1-33dc-8ce436c6b6e3	00230000-5575-6bb1-3716-ab7172cd341c	pogodba
00240000-5575-6bb1-2d75-27d582bbbe0e	00230000-5575-6bb1-4d27-98165f121f62	zaposlitev
\.


--
-- TOC entry 2837 (class 0 OID 6527705)
-- Dependencies: 233
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 6527489)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2787 (class 0 OID 6527153)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2803 (class 0 OID 6527332)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5575-6bb2-0b2c-788b6a34667c	00180000-5575-6bb2-719c-ebd8b7787e25	000c0000-5575-6bb2-e747-00cb14e5c40d	00090000-5575-6bb2-737c-64113af60652	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-6bb2-2ebe-1499ab6fbda2	00180000-5575-6bb2-719c-ebd8b7787e25	000c0000-5575-6bb2-ae14-3cfe0d0454c8	00090000-5575-6bb2-c8d3-e19c4fc1cde0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-6bb2-a1cd-159131b8d6d7	00180000-5575-6bb2-719c-ebd8b7787e25	000c0000-5575-6bb2-5cd0-2b05df4e3259	00090000-5575-6bb2-6578-4d58f569614e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-6bb2-c7cd-ba9771c93209	00180000-5575-6bb2-719c-ebd8b7787e25	000c0000-5575-6bb2-97c0-817c940b189d	00090000-5575-6bb2-0f49-8359783acbe9	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-6bb2-cfdc-b689a2203b88	00180000-5575-6bb2-719c-ebd8b7787e25	000c0000-5575-6bb2-2160-dd2e9b2094f7	00090000-5575-6bb2-13aa-1f8a6cefc001	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-6bb2-1822-288181fddd3d	00180000-5575-6bb2-198c-3e76f8469589	\N	00090000-5575-6bb2-13aa-1f8a6cefc001	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2824 (class 0 OID 6527535)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5575-6bb0-e7eb-22821126947f	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5575-6bb0-ba60-219a9aa439f7	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5575-6bb0-d316-94f80906a731	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5575-6bb0-ca0b-c9c9c4e772e4	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5575-6bb0-8fa4-98b08d1fd03c	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5575-6bb0-a251-02064cc67fb8	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5575-6bb0-bb17-9425db2374c9	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5575-6bb0-d03e-a3c87da66449	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5575-6bb0-acb2-955e812751a8	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5575-6bb0-f913-51721fc4b849	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5575-6bb0-c6c4-8300dbe41663	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5575-6bb0-4b1e-ad4ce0e5bc05	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5575-6bb0-1754-f7cc88993aa7	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5575-6bb0-97ad-dc48a1543d3b	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5575-6bb0-bd4a-d26f3a07601b	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5575-6bb0-9b0f-d6b9083fc35b	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2835 (class 0 OID 6527688)
-- Dependencies: 231
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
\.


--
-- TOC entry 2792 (class 0 OID 6527216)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2779 (class 0 OID 6527062)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5575-6bb1-e92f-44ecd4ea3703	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROFi/PrIX1Oyp/AAIbd/7B8.6I4uB2zAC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5575-6bb2-d932-3b60631bb612	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5575-6bb2-5383-57d9dfda1341	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5575-6bb2-5fd6-9d3c999eb950	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5575-6bb2-f4b3-2f6ab83a1a76	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5575-6bb2-60de-3bca5c3b2ecb	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5575-6bb2-6967-c11fec4d7e3e	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5575-6bb1-3bc0-3e457e1ceb05	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2829 (class 0 OID 6527592)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5575-6bb2-c32e-b67b042bbfb0	00160000-5575-6bb2-c5d1-524ee1289cc3	00150000-5575-6bb0-fa36-fb7b2becac63	00140000-5575-6bb1-fb3d-d3d71b0e6a02	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5575-6bb2-1e7c-ffce48f58ad2
000e0000-5575-6bb2-a81b-44e1b828db2f	00160000-5575-6bb2-13b1-a10d8009898b	00150000-5575-6bb0-aff9-027298ddba5b	00140000-5575-6bb1-d99b-013e3ce63fbb	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5575-6bb2-d911-e6d0999b1671
\.


--
-- TOC entry 2797 (class 0 OID 6527278)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5575-6bb2-316b-b52574900458	000e0000-5575-6bb2-a81b-44e1b828db2f	1	
00200000-5575-6bb2-17d5-8db0f8b42ce8	000e0000-5575-6bb2-a81b-44e1b828db2f	2	
\.


--
-- TOC entry 2812 (class 0 OID 6527403)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 6527472)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2799 (class 0 OID 6527310)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 6527582)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5575-6bb1-fb3d-d3d71b0e6a02	01	Drama	drama (SURS 01)
00140000-5575-6bb1-ca1c-f71fc244f610	02	Opera	opera (SURS 02)
00140000-5575-6bb1-707c-fdc83d8ee1c1	03	Balet	balet (SURS 03)
00140000-5575-6bb1-71bd-9ba16d2ec6f1	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5575-6bb1-5356-dda24ec66249	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5575-6bb1-d99b-013e3ce63fbb	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5575-6bb1-53f8-ad890c32bbd3	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2818 (class 0 OID 6527462)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5575-6bb0-313c-4323d7ec6eb7	01	Opera	opera
00150000-5575-6bb0-d559-6cb849d5c6f6	02	Opereta	opereta
00150000-5575-6bb0-26c0-315d098ef219	03	Balet	balet
00150000-5575-6bb0-455d-4ed45eda181c	04	Plesne prireditve	plesne prireditve
00150000-5575-6bb0-6e13-055ffbd5b86c	05	Lutkovno gledališče	lutkovno gledališče
00150000-5575-6bb0-62ae-88debc95d34c	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5575-6bb0-3b33-67ac24ec4f9e	07	Biografska drama	biografska drama
00150000-5575-6bb0-fa36-fb7b2becac63	08	Komedija	komedija
00150000-5575-6bb0-dee4-09184c82d7a6	09	Črna komedija	črna komedija
00150000-5575-6bb0-6756-a0cab7fbf7c7	10	E-igra	E-igra
00150000-5575-6bb0-aff9-027298ddba5b	11	Kriminalka	kriminalka
00150000-5575-6bb0-89dc-7a9d75cbeff1	12	Musical	musical
\.


--
-- TOC entry 2370 (class 2606 OID 6527116)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 6527638)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 6527628)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 6527534)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 6527300)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 6527325)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 6527242)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 6527667)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 6527458)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 6527276)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 6527319)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2412 (class 2606 OID 6527256)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 6527368)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 6527395)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 6527214)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 6527125)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2351 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2377 (class 2606 OID 6527149)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 6527105)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2361 (class 2606 OID 6527090)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 6527401)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 6527434)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 6527577)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 6527178)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2394 (class 2606 OID 6527202)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 6527374)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2392 (class 2606 OID 6527192)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 6527263)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 6527386)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 6527514)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 6527562)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 6527678)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 6527703)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 6527685)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 6527418)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 6527359)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 6527350)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 6527556)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 6527486)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2353 (class 2606 OID 6527061)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 6527425)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2359 (class 2606 OID 6527079)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2363 (class 2606 OID 6527099)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 6527443)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 6527381)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 6527331)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 6527727)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 6527715)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 6527709)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 6527499)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 6527158)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 6527341)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 6527545)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 6527698)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 6527227)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2355 (class 2606 OID 6527074)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 6527608)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 6527285)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 6527409)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 6527477)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2436 (class 2606 OID 6527314)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 6527590)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 6527470)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 1259 OID 6527307)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2510 (class 1259 OID 6527500)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2511 (class 1259 OID 6527501)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2384 (class 1259 OID 6527180)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2343 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2344 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2345 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2475 (class 1259 OID 6527402)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2469 (class 1259 OID 6527388)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2470 (class 1259 OID 6527387)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2421 (class 1259 OID 6527286)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2497 (class 1259 OID 6527459)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2498 (class 1259 OID 6527461)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2499 (class 1259 OID 6527460)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2409 (class 1259 OID 6527258)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2410 (class 1259 OID 6527257)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2528 (class 1259 OID 6527579)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2529 (class 1259 OID 6527580)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2530 (class 1259 OID 6527581)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2537 (class 1259 OID 6527613)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2538 (class 1259 OID 6527610)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2539 (class 1259 OID 6527612)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2540 (class 1259 OID 6527611)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2399 (class 1259 OID 6527229)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2400 (class 1259 OID 6527228)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2348 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2349 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2375 (class 1259 OID 6527152)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2485 (class 1259 OID 6527426)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2439 (class 1259 OID 6527320)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2365 (class 1259 OID 6527106)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2366 (class 1259 OID 6527107)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2490 (class 1259 OID 6527446)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2491 (class 1259 OID 6527445)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2492 (class 1259 OID 6527444)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2413 (class 1259 OID 6527264)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2414 (class 1259 OID 6527266)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2415 (class 1259 OID 6527265)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2575 (class 1259 OID 6527717)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2449 (class 1259 OID 6527354)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2450 (class 1259 OID 6527352)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2451 (class 1259 OID 6527351)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2452 (class 1259 OID 6527353)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2356 (class 1259 OID 6527080)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2357 (class 1259 OID 6527081)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2478 (class 1259 OID 6527410)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2464 (class 1259 OID 6527375)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2506 (class 1259 OID 6527487)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2507 (class 1259 OID 6527488)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2558 (class 1259 OID 6527668)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2559 (class 1259 OID 6527669)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2560 (class 1259 OID 6527670)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2388 (class 1259 OID 6527194)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2389 (class 1259 OID 6527193)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2390 (class 1259 OID 6527195)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2570 (class 1259 OID 6527704)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2514 (class 1259 OID 6527515)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2515 (class 1259 OID 6527516)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2550 (class 1259 OID 6527642)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2551 (class 1259 OID 6527644)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2552 (class 1259 OID 6527640)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2553 (class 1259 OID 6527643)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2554 (class 1259 OID 6527641)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2503 (class 1259 OID 6527478)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2455 (class 1259 OID 6527363)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2456 (class 1259 OID 6527362)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2457 (class 1259 OID 6527360)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2458 (class 1259 OID 6527361)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2339 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2546 (class 1259 OID 6527630)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2547 (class 1259 OID 6527629)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2561 (class 1259 OID 6527679)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2420 (class 1259 OID 6527277)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2371 (class 1259 OID 6527127)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2372 (class 1259 OID 6527126)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2380 (class 1259 OID 6527159)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2381 (class 1259 OID 6527160)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2444 (class 1259 OID 6527344)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2445 (class 1259 OID 6527343)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2446 (class 1259 OID 6527342)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2564 (class 1259 OID 6527687)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2565 (class 1259 OID 6527686)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2427 (class 1259 OID 6527309)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2428 (class 1259 OID 6527305)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2429 (class 1259 OID 6527302)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2430 (class 1259 OID 6527303)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2431 (class 1259 OID 6527301)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2432 (class 1259 OID 6527306)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2433 (class 1259 OID 6527304)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2387 (class 1259 OID 6527179)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2405 (class 1259 OID 6527243)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2406 (class 1259 OID 6527245)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2407 (class 1259 OID 6527244)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2408 (class 1259 OID 6527246)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2463 (class 1259 OID 6527369)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2533 (class 1259 OID 6527578)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2541 (class 1259 OID 6527609)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2378 (class 1259 OID 6527150)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2379 (class 1259 OID 6527151)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2500 (class 1259 OID 6527471)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2581 (class 1259 OID 6527728)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2398 (class 1259 OID 6527215)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2578 (class 1259 OID 6527716)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2483 (class 1259 OID 6527420)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2484 (class 1259 OID 6527419)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2555 (class 1259 OID 6527639)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2342 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2395 (class 1259 OID 6527203)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2534 (class 1259 OID 6527591)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2526 (class 1259 OID 6527563)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2527 (class 1259 OID 6527564)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2364 (class 1259 OID 6527100)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2434 (class 1259 OID 6527308)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2607 (class 2606 OID 6527868)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2610 (class 2606 OID 6527853)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2609 (class 2606 OID 6527858)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2605 (class 2606 OID 6527878)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2611 (class 2606 OID 6527848)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2606 (class 2606 OID 6527873)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2608 (class 2606 OID 6527863)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2641 (class 2606 OID 6528023)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2640 (class 2606 OID 6528028)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2592 (class 2606 OID 6527783)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2628 (class 2606 OID 6527963)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2626 (class 2606 OID 6527958)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2627 (class 2606 OID 6527953)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2604 (class 2606 OID 6527843)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2636 (class 2606 OID 6527993)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2634 (class 2606 OID 6528003)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2635 (class 2606 OID 6527998)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2598 (class 2606 OID 6527818)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2599 (class 2606 OID 6527813)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2624 (class 2606 OID 6527943)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2647 (class 2606 OID 6528048)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2646 (class 2606 OID 6528053)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2645 (class 2606 OID 6528058)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2648 (class 2606 OID 6528078)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2651 (class 2606 OID 6528063)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2649 (class 2606 OID 6528073)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2650 (class 2606 OID 6528068)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2596 (class 2606 OID 6527808)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2597 (class 2606 OID 6527803)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2588 (class 2606 OID 6527768)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2589 (class 2606 OID 6527763)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2630 (class 2606 OID 6527973)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2612 (class 2606 OID 6527883)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2585 (class 2606 OID 6527743)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2584 (class 2606 OID 6527748)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2631 (class 2606 OID 6527988)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2632 (class 2606 OID 6527983)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2633 (class 2606 OID 6527978)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2602 (class 2606 OID 6527823)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2600 (class 2606 OID 6527833)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2601 (class 2606 OID 6527828)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2666 (class 2606 OID 6528153)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2616 (class 2606 OID 6527918)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2618 (class 2606 OID 6527908)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2619 (class 2606 OID 6527903)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2617 (class 2606 OID 6527913)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2583 (class 2606 OID 6527733)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2582 (class 2606 OID 6527738)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2629 (class 2606 OID 6527968)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2625 (class 2606 OID 6527948)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2639 (class 2606 OID 6528013)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2638 (class 2606 OID 6528018)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2661 (class 2606 OID 6528118)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2660 (class 2606 OID 6528123)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2659 (class 2606 OID 6528128)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2594 (class 2606 OID 6527793)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2595 (class 2606 OID 6527788)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2593 (class 2606 OID 6527798)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2665 (class 2606 OID 6528148)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2643 (class 2606 OID 6528033)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2642 (class 2606 OID 6528038)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2656 (class 2606 OID 6528103)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2654 (class 2606 OID 6528113)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2658 (class 2606 OID 6528093)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2655 (class 2606 OID 6528108)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2657 (class 2606 OID 6528098)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2637 (class 2606 OID 6528008)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2620 (class 2606 OID 6527938)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2621 (class 2606 OID 6527933)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2623 (class 2606 OID 6527923)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2622 (class 2606 OID 6527928)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2652 (class 2606 OID 6528088)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 6528083)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2662 (class 2606 OID 6528133)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2603 (class 2606 OID 6527838)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2644 (class 2606 OID 6528043)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2586 (class 2606 OID 6527758)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2587 (class 2606 OID 6527753)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2591 (class 2606 OID 6527773)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2590 (class 2606 OID 6527778)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2613 (class 2606 OID 6527898)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2614 (class 2606 OID 6527893)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2615 (class 2606 OID 6527888)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2663 (class 2606 OID 6528143)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2664 (class 2606 OID 6528138)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-08 12:17:23 CEST

--
-- PostgreSQL database dump complete
--

