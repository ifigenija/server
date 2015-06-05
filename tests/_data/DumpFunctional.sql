--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-05 12:51:06 CEST

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
-- TOC entry 2851 (class 0 OID 0)
-- Dependencies: 239
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 180 (class 1259 OID 6380247)
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
-- TOC entry 227 (class 1259 OID 6380770)
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
-- TOC entry 226 (class 1259 OID 6380753)
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
-- TOC entry 219 (class 1259 OID 6380656)
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
-- TOC entry 194 (class 1259 OID 6380426)
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
-- TOC entry 197 (class 1259 OID 6380460)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6380369)
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
-- TOC entry 228 (class 1259 OID 6380784)
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
-- TOC entry 213 (class 1259 OID 6380586)
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
-- TOC entry 192 (class 1259 OID 6380406)
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
-- TOC entry 196 (class 1259 OID 6380454)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6380386)
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
-- TOC entry 202 (class 1259 OID 6380503)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6380528)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6380343)
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
-- TOC entry 181 (class 1259 OID 6380256)
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
-- TOC entry 182 (class 1259 OID 6380267)
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
-- TOC entry 177 (class 1259 OID 6380221)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6380240)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6380535)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6380566)
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
-- TOC entry 223 (class 1259 OID 6380704)
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
-- TOC entry 184 (class 1259 OID 6380300)
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
-- TOC entry 186 (class 1259 OID 6380335)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6380509)
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
-- TOC entry 185 (class 1259 OID 6380320)
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
-- TOC entry 191 (class 1259 OID 6380398)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6380521)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6380641)
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
-- TOC entry 222 (class 1259 OID 6380696)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6380810)
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
-- TOC entry 232 (class 1259 OID 6380838)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id integer NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 238 (class 1259 OID 6380872)
-- Name: programfestival_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programfestival_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 230 (class 1259 OID 6380819)
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
-- TOC entry 236 (class 1259 OID 6380868)
-- Name: programgostovanje_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programgostovanje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 209 (class 1259 OID 6380550)
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
-- TOC entry 201 (class 1259 OID 6380494)
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
-- TOC entry 200 (class 1259 OID 6380484)
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
-- TOC entry 221 (class 1259 OID 6380685)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6380618)
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
-- TOC entry 174 (class 1259 OID 6380192)
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
-- TOC entry 173 (class 1259 OID 6380190)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2852 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 210 (class 1259 OID 6380560)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6380230)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6380214)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6380574)
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
-- TOC entry 204 (class 1259 OID 6380515)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6380465)
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
-- TOC entry 235 (class 1259 OID 6380857)
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
-- TOC entry 234 (class 1259 OID 6380849)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 6380844)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6380628)
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
-- TOC entry 183 (class 1259 OID 6380292)
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
-- TOC entry 199 (class 1259 OID 6380471)
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
-- TOC entry 220 (class 1259 OID 6380674)
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
-- TOC entry 231 (class 1259 OID 6380827)
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
-- TOC entry 237 (class 1259 OID 6380870)
-- Name: tipprogramskeenote_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipprogramskeenote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 188 (class 1259 OID 6380355)
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
-- TOC entry 175 (class 1259 OID 6380201)
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
-- TOC entry 225 (class 1259 OID 6380731)
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
-- TOC entry 193 (class 1259 OID 6380417)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6380542)
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
-- TOC entry 215 (class 1259 OID 6380611)
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
-- TOC entry 195 (class 1259 OID 6380449)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6380721)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 6380601)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2174 (class 2604 OID 6380195)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2786 (class 0 OID 6380247)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2833 (class 0 OID 6380770)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5571-7f19-cc7a-5b4fc13315dd	000d0000-5571-7f19-6278-c7efb034f729	\N	00090000-5571-7f19-847a-9030de63585b	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5571-7f19-2b31-ebceee91753c	000d0000-5571-7f19-3b04-594aa63c3c6c	\N	00090000-5571-7f19-155a-e065a183d3cc	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5571-7f19-b1d9-9ebe607421f0	000d0000-5571-7f19-a84a-79792c5d5dbd	\N	00090000-5571-7f19-7e37-7df107d41b2b	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5571-7f19-2b31-058fddbe9469	000d0000-5571-7f19-17aa-99bb1aff38a9	\N	00090000-5571-7f19-6398-5a500839d885	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5571-7f19-b821-4253b278ac96	000d0000-5571-7f19-495f-aa407d09e09c	\N	00090000-5571-7f19-2ce1-6ea13122679e	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5571-7f19-fc53-feab58ba3082	000d0000-5571-7f19-fd7d-ab25d0052b4d	\N	00090000-5571-7f19-155a-e065a183d3cc	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2832 (class 0 OID 6380753)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 6380656)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5571-7f19-cd41-ff8687bd1fdd	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	5	Milan Jesih	\N	\N	\N
00160000-5571-7f19-a40f-89928b3ec1dd	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	1	Vladimir Levstik	\N	\N	\N
00160000-5571-7f19-0b22-b57cd72897dc	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8	8		\N	\N	\N
\.


--
-- TOC entry 2800 (class 0 OID 6380426)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5571-7f19-c00f-83c518ec2cdf	\N	\N	00200000-5571-7f19-6039-3c1a94795d52	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5571-7f19-55e6-8ba559f2a661	\N	\N	00200000-5571-7f19-9ae0-03351be2e0b8	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5571-7f19-d225-075dce210b36	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5571-7f19-d793-24fefaf44775	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5571-7f19-2de6-1dc2e4a0e684	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2803 (class 0 OID 6380460)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2795 (class 0 OID 6380369)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5571-7f18-86d0-501cefb5653a	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5571-7f18-16c0-47c361411a49	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5571-7f18-ca6b-ec71b20fa730	AL	ALB	008	Albania 	Albanija	\N
00040000-5571-7f18-8691-b6a0b807299a	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5571-7f18-a833-7f651eb8e2f6	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5571-7f18-4f2a-e69478bc9ea9	AD	AND	020	Andorra 	Andora	\N
00040000-5571-7f18-cefd-3dfd089199c6	AO	AGO	024	Angola 	Angola	\N
00040000-5571-7f18-074e-4b0d514b6852	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5571-7f18-4283-a08ac3fc6585	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5571-7f18-3fcc-2e84bcd5e5fc	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5571-7f18-8e15-ab59b0e9f06d	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5571-7f18-81df-fdcff219ceff	AM	ARM	051	Armenia 	Armenija	\N
00040000-5571-7f18-9bb8-0c560a350c52	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5571-7f18-0f50-e0d14dc0af13	AU	AUS	036	Australia 	Avstralija	\N
00040000-5571-7f18-0eb8-70cbce749783	AT	AUT	040	Austria 	Avstrija	\N
00040000-5571-7f18-afac-b3294cdad14b	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5571-7f18-b53e-a2e8f49161cf	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5571-7f18-ca8c-535ea027caf4	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5571-7f18-4a3e-30e7c91f2c34	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5571-7f18-f39e-2422ea789da1	BB	BRB	052	Barbados 	Barbados	\N
00040000-5571-7f18-d279-fd48288fb76a	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5571-7f18-85ca-6764238f926a	BE	BEL	056	Belgium 	Belgija	\N
00040000-5571-7f18-c03e-022b09dc1931	BZ	BLZ	084	Belize 	Belize	\N
00040000-5571-7f18-5de8-833140c008b1	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5571-7f18-c2ca-dadaf737b875	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5571-7f18-c8b2-2981a13538cb	BT	BTN	064	Bhutan 	Butan	\N
00040000-5571-7f18-4926-2072e935b1f4	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5571-7f18-4639-1865ad1e6378	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5571-7f18-fd9b-003d962a83fb	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5571-7f18-5a00-7582719ffc7c	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5571-7f18-fa66-d906153f5d3d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5571-7f18-cdf0-2a6890629ca2	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5571-7f18-c3a0-fc62de4ce48b	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5571-7f18-2f9a-4437923437aa	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5571-7f18-dae3-b1dca4becab6	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5571-7f18-e382-8452a9e5bd19	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5571-7f18-d591-f4b5810db8c8	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5571-7f18-e2c7-fcf2231ec279	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5571-7f18-912a-ed8905eb4b4e	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5571-7f18-6c1d-e123eae62da7	CA	CAN	124	Canada 	Kanada	\N
00040000-5571-7f18-e324-5a04fa784d62	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5571-7f18-fc55-a05e59f41643	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5571-7f18-2412-0b69335d7f46	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5571-7f18-0fd3-d7483bb2b562	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5571-7f18-c5ce-1a130fe1b5f5	CL	CHL	152	Chile 	Čile	\N
00040000-5571-7f18-6148-3417791b5348	CN	CHN	156	China 	Kitajska	\N
00040000-5571-7f18-2438-30726386e69b	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5571-7f18-e87b-51c22cc055c0	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5571-7f18-5f2a-26c55885a3e2	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5571-7f18-a740-259c2921175e	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5571-7f18-d807-edb38db8d323	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5571-7f18-2d45-b4acd00aed33	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5571-7f18-7791-341a54d7860a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5571-7f18-dd88-c8428a9dd7f8	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5571-7f18-7dcc-809054f28c5e	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5571-7f18-967f-07cd30ccb8f0	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5571-7f18-01cd-57ff421ae19f	CU	CUB	192	Cuba 	Kuba	\N
00040000-5571-7f18-286e-48a9d0e071c6	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5571-7f18-1692-d0431d5d72f8	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5571-7f18-11da-341cf5416203	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5571-7f18-f868-e1788a08956a	DK	DNK	208	Denmark 	Danska	\N
00040000-5571-7f18-a751-b562f88a0462	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5571-7f18-b483-0f28171e2a8e	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5571-7f18-0d97-2e2c6d23d513	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5571-7f18-79f9-8b6e5fe17ae4	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5571-7f18-92b9-2809d90d4ce7	EG	EGY	818	Egypt 	Egipt	\N
00040000-5571-7f18-7ee7-f39553dd21eb	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5571-7f18-7079-26288d46db9d	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5571-7f18-6e46-9128d0bce958	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5571-7f18-834e-7aa11ee91448	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5571-7f18-b3e2-826b3f695961	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5571-7f18-db6b-b70aaa7d93f7	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5571-7f18-bd31-fb3c5d723352	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5571-7f18-cb66-93ee3b3b9ab7	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5571-7f18-2922-1bbfc046db21	FI	FIN	246	Finland 	Finska	\N
00040000-5571-7f18-90a6-db3f16085932	FR	FRA	250	France 	Francija	\N
00040000-5571-7f18-b9dc-4459d4a246a8	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5571-7f18-c135-a1789a81f436	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5571-7f18-97a5-970e5f2186c7	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5571-7f18-4041-2f41d58a21bd	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5571-7f18-ad24-ede6006a785f	GA	GAB	266	Gabon 	Gabon	\N
00040000-5571-7f18-58d7-4bbb8aca1a1e	GM	GMB	270	Gambia 	Gambija	\N
00040000-5571-7f18-d16f-4dce7d2ffd4a	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5571-7f18-02da-2cd7aa03a16e	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5571-7f18-208e-e0fc9402f669	GH	GHA	288	Ghana 	Gana	\N
00040000-5571-7f18-fb57-8034ffd273c2	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5571-7f18-8ce5-a7113463c824	GR	GRC	300	Greece 	Grčija	\N
00040000-5571-7f18-18d4-76fef7e3534a	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5571-7f18-b033-19518fe990bd	GD	GRD	308	Grenada 	Grenada	\N
00040000-5571-7f18-d60a-761d3e35b626	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5571-7f18-51ab-0e7bae335335	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5571-7f18-f74c-e91e5ca392ce	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5571-7f18-1e19-6ed95132cf53	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5571-7f18-ad75-2f710ccae49f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5571-7f18-1b70-b72cf57c3802	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5571-7f18-640e-f3075c1237ff	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5571-7f18-0d9b-7a397ee59b4a	HT	HTI	332	Haiti 	Haiti	\N
00040000-5571-7f18-06c0-c135063c5416	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5571-7f18-c027-9f865c9a57fc	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5571-7f18-fde0-ba496fe68c5e	HN	HND	340	Honduras 	Honduras	\N
00040000-5571-7f18-1e2c-f2264b0c9440	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5571-7f18-d53e-ba093fcb1ce2	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5571-7f18-64c6-779df602cfc7	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5571-7f18-bc52-971371a8a1c7	IN	IND	356	India 	Indija	\N
00040000-5571-7f18-f4a6-f10918915a3a	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5571-7f18-300a-b5cc7b06261a	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5571-7f18-8c3e-755717e2e7ba	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5571-7f18-c399-5554322c3224	IE	IRL	372	Ireland 	Irska	\N
00040000-5571-7f18-5700-95689c243128	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5571-7f18-192c-a77ac223c023	IL	ISR	376	Israel 	Izrael	\N
00040000-5571-7f18-3107-b326218c80b4	IT	ITA	380	Italy 	Italija	\N
00040000-5571-7f18-f3a1-f6b0880c4e51	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5571-7f18-bd8e-623e4059c645	JP	JPN	392	Japan 	Japonska	\N
00040000-5571-7f18-3ef8-98d661c8ba68	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5571-7f18-e6a2-689ccaa5fc6c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5571-7f18-bec4-b464c4571371	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5571-7f18-2ba4-a3d8897b782e	KE	KEN	404	Kenya 	Kenija	\N
00040000-5571-7f18-4ec9-179c78147324	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5571-7f18-32d3-76118a47a714	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5571-7f18-808d-3e8f0443fec4	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5571-7f18-4339-7d303572d19f	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5571-7f18-8f2a-2782082bedb8	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5571-7f18-0fb5-a6299e8476cb	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5571-7f18-d74e-b351c5ef8b65	LV	LVA	428	Latvia 	Latvija	\N
00040000-5571-7f18-7403-6d2f550a405a	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5571-7f18-c6a0-03fb0470d071	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5571-7f18-7961-cd21d35ae5dc	LR	LBR	430	Liberia 	Liberija	\N
00040000-5571-7f18-fd35-ad2336e17dc1	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5571-7f18-b553-cb7f193e8aec	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5571-7f18-f672-b417378d2df4	LT	LTU	440	Lithuania 	Litva	\N
00040000-5571-7f18-0723-95bb97d493fc	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5571-7f18-bdaf-7a3bc002e02f	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5571-7f18-0cbf-19d2ed72d705	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5571-7f18-1cf4-693110780c3e	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5571-7f18-450a-8128792fc6c5	MW	MWI	454	Malawi 	Malavi	\N
00040000-5571-7f18-8b0e-dd65ba7f80f8	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5571-7f18-806a-ab6acdf5cd2a	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5571-7f18-7a6d-afd0c2760b22	ML	MLI	466	Mali 	Mali	\N
00040000-5571-7f18-2b35-24c53aadcf07	MT	MLT	470	Malta 	Malta	\N
00040000-5571-7f18-dee2-5b875032c51b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5571-7f18-1eb4-1378bba86392	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5571-7f18-dee5-b6ec78964b09	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5571-7f18-474a-03e6b7ae964b	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5571-7f18-d6e8-ff640c8585bb	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5571-7f18-ff63-4f2ab66760ff	MX	MEX	484	Mexico 	Mehika	\N
00040000-5571-7f18-5033-085e4415c54a	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5571-7f18-cc83-38a5db5159fd	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5571-7f18-473e-c7d0ba9beb10	MC	MCO	492	Monaco 	Monako	\N
00040000-5571-7f18-0330-9ab3d1c93598	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5571-7f18-a7e9-f4f52c65b19f	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5571-7f18-c883-309d271dc388	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5571-7f18-678b-6c07f064031b	MA	MAR	504	Morocco 	Maroko	\N
00040000-5571-7f18-4c87-3f8ac2b51f71	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5571-7f18-a749-e55d5a0f2782	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5571-7f18-874b-109e5644f41d	NA	NAM	516	Namibia 	Namibija	\N
00040000-5571-7f18-5e3a-bea162dc5c67	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5571-7f18-73b8-ea9cef16ea93	NP	NPL	524	Nepal 	Nepal	\N
00040000-5571-7f18-cddb-959cb6e9acca	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5571-7f18-ee49-53bb389921b4	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5571-7f18-d05f-9f9423d55d1d	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5571-7f18-d284-d5bad10b54b7	NE	NER	562	Niger 	Niger 	\N
00040000-5571-7f18-fe11-879e620794a1	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5571-7f18-10e4-8b785bfaac7f	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5571-7f18-be6b-c486cc30a84b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5571-7f18-1e53-4dcddcf21110	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5571-7f18-8c06-f1296a34bfa0	NO	NOR	578	Norway 	Norveška	\N
00040000-5571-7f18-39f7-b46ce9584dec	OM	OMN	512	Oman 	Oman	\N
00040000-5571-7f18-2d55-68502b9a6cdf	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5571-7f18-0d27-b4fa2727eed8	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5571-7f18-bd9b-350eddb12e98	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5571-7f18-84d7-e6dc37b63928	PA	PAN	591	Panama 	Panama	\N
00040000-5571-7f18-08e6-0300eed86ac4	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5571-7f18-187e-40d76630f78d	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5571-7f18-6bda-cd4b5ab18a34	PE	PER	604	Peru 	Peru	\N
00040000-5571-7f18-9d00-15389aa64785	PH	PHL	608	Philippines 	Filipini	\N
00040000-5571-7f18-3065-4d5562331ad7	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5571-7f18-8bfd-5885d3f568f6	PL	POL	616	Poland 	Poljska	\N
00040000-5571-7f18-9049-0873ad53be7b	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5571-7f18-4056-b72873c0371e	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5571-7f18-6337-0a70a30d454a	QA	QAT	634	Qatar 	Katar	\N
00040000-5571-7f18-9703-e8b5100378a5	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5571-7f18-81cc-55818fd34a51	RO	ROU	642	Romania 	Romunija	\N
00040000-5571-7f18-4ff7-a35183ead727	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5571-7f18-413b-dd8d5056b18c	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5571-7f18-4ba4-b54c047ed4fc	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5571-7f18-bfd6-3ab053e932ea	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5571-7f18-24e5-1a9be43f8b69	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5571-7f18-e7c1-8bde3552ac17	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5571-7f18-0b62-e19c395078b3	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5571-7f18-6a07-8709803f0238	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5571-7f18-7dee-920de25ef421	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5571-7f18-8d5d-5ea3333b5958	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5571-7f18-467b-46aa3abdcc49	SM	SMR	674	San Marino 	San Marino	\N
00040000-5571-7f18-a73a-772d325953bb	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5571-7f18-d60a-88a467008dd7	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5571-7f18-764f-3cb1b99553b9	SN	SEN	686	Senegal 	Senegal	\N
00040000-5571-7f18-6b09-4e91c628922f	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5571-7f18-f55e-56933b23cd79	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5571-7f18-dda4-42c48b6b7795	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5571-7f18-39d9-23960afb72bd	SG	SGP	702	Singapore 	Singapur	\N
00040000-5571-7f18-7b2b-59ae965b2588	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5571-7f18-3fbb-e2fb16b04d8b	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5571-7f18-fe57-dd23a462a1bb	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5571-7f18-457d-c7069856cce0	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5571-7f18-2bf4-e67e17514320	SO	SOM	706	Somalia 	Somalija	\N
00040000-5571-7f18-2a80-f10e9d7eef36	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5571-7f18-30ea-f0fab5b67717	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5571-7f18-1f7e-dd8ec0e33513	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5571-7f18-962e-413dcdb629b2	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5571-7f18-0821-bf4daaa8b7bf	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5571-7f18-f6c1-54445daa5237	SD	SDN	729	Sudan 	Sudan	\N
00040000-5571-7f18-5632-8c2e923c2605	SR	SUR	740	Suriname 	Surinam	\N
00040000-5571-7f18-0bcf-8d5766b0fb6c	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5571-7f18-36d0-9cab9706f8d9	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5571-7f18-5c01-0c869f638b28	SE	SWE	752	Sweden 	Švedska	\N
00040000-5571-7f18-3b19-153c613a82db	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5571-7f18-134d-e29bd942ee1a	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5571-7f18-386f-5274865a24b6	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5571-7f18-a549-ed1dff8d044f	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5571-7f18-5fb1-83f4975693b0	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5571-7f18-e727-87bfbb8ce088	TH	THA	764	Thailand 	Tajska	\N
00040000-5571-7f18-c8f1-84dd6ee8a1a0	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5571-7f18-5fc2-66f45f8684e3	TG	TGO	768	Togo 	Togo	\N
00040000-5571-7f18-ff86-968a3977a15c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5571-7f18-dc82-4e1e8c0093ad	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5571-7f18-19c6-2cf2f55bc572	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5571-7f18-4422-b676ee9c60ff	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5571-7f18-4bd5-ac7fd5928943	TR	TUR	792	Turkey 	Turčija	\N
00040000-5571-7f18-e109-c7214f023909	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5571-7f18-06b4-162bda03adbe	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5571-7f18-eb87-8fe139506ac7	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5571-7f18-043b-6a06e40c954a	UG	UGA	800	Uganda 	Uganda	\N
00040000-5571-7f18-c38b-c017abd9a7f0	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5571-7f18-487c-7d5930463e1e	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5571-7f18-a421-5eb8b203512b	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5571-7f18-8015-1fe03d0bd854	US	USA	840	United States 	Združene države Amerike	\N
00040000-5571-7f18-9930-382a5658555e	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5571-7f18-335d-b7d73c323af9	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5571-7f18-7a96-eda448f01419	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5571-7f18-5a86-25c0dcf8ecad	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5571-7f18-6b44-dfab338c23d8	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5571-7f18-71c4-688950d30300	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5571-7f18-0470-0cf31806ab29	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5571-7f18-be8d-b5fb6ab6752f	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5571-7f18-aa30-51744fb8765a	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5571-7f18-9463-f4e1931684b6	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5571-7f18-c911-1c77736dfc61	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5571-7f18-b0fc-8949106203c1	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5571-7f18-5c4d-f63df2a6187b	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2834 (class 0 OID 6380784)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, tip_programske_enote_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tip) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 6380586)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5571-7f19-cb57-a90c8e95a07c	000e0000-5571-7f19-abab-4ec5213599cf	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5571-7f18-8c9b-41f9efa7dae0
000d0000-5571-7f19-6278-c7efb034f729	000e0000-5571-7f19-abab-4ec5213599cf	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5571-7f18-8c9b-41f9efa7dae0
000d0000-5571-7f19-3b04-594aa63c3c6c	000e0000-5571-7f19-abab-4ec5213599cf	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5571-7f18-a8b1-e26c384d691a
000d0000-5571-7f19-a84a-79792c5d5dbd	000e0000-5571-7f19-abab-4ec5213599cf	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5571-7f18-59da-a7aa612384ce
000d0000-5571-7f19-17aa-99bb1aff38a9	000e0000-5571-7f19-abab-4ec5213599cf	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5571-7f18-59da-a7aa612384ce
000d0000-5571-7f19-495f-aa407d09e09c	000e0000-5571-7f19-abab-4ec5213599cf	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5571-7f18-59da-a7aa612384ce
000d0000-5571-7f19-fd7d-ab25d0052b4d	000e0000-5571-7f19-abab-4ec5213599cf	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5571-7f18-8c9b-41f9efa7dae0
\.


--
-- TOC entry 2798 (class 0 OID 6380406)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2802 (class 0 OID 6380454)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2796 (class 0 OID 6380386)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00000000-5571-7f19-c505-d5e603a19f53	00080000-5571-7f19-47d0-077b0526821a	00090000-5571-7f19-847a-9030de63585b	AK		
\.


--
-- TOC entry 2776 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2808 (class 0 OID 6380503)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2812 (class 0 OID 6380528)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2793 (class 0 OID 6380343)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5571-7f18-d123-c7afe4e77eb0	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5571-7f18-24be-b4c2117f19e0	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5571-7f18-3edc-9eef292d25a4	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5571-7f18-d19d-354d7e771a36	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5571-7f18-8a19-174012dc212c	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5571-7f18-9745-e4fe17509fb0	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5571-7f18-c82c-9497e94b04ae	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5571-7f18-056d-945675151000	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5571-7f18-4832-23d4fbce12d9	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5571-7f18-397e-21bee1a9d963	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5571-7f18-d9f0-27fcb56c6202	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5571-7f18-0cc9-1edd7da71119	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5571-7f18-a203-e22b4bb98135	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5571-7f18-bcf0-6602c27b2721	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5571-7f18-2082-9572a5596261	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5571-7f18-3582-c3b1a66993e1	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2787 (class 0 OID 6380256)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5571-7f18-48c3-4c2d962f0f5a	00000000-5571-7f18-8a19-174012dc212c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5571-7f18-70c7-1fefc672b6ae	00000000-5571-7f18-8a19-174012dc212c	00010000-5571-7f18-8edb-056b7cfcf8bd	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5571-7f18-9533-28a3a72213fd	00000000-5571-7f18-9745-e4fe17509fb0	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2788 (class 0 OID 6380267)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5571-7f19-9c7e-6b42d4b78d5b	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5571-7f19-6398-5a500839d885	00010000-5571-7f19-7d7c-f6f71f0ce4cb	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5571-7f19-7e37-7df107d41b2b	00010000-5571-7f19-9c4c-eed9cbf90205	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5571-7f19-46a0-98a4647c51dd	00010000-5571-7f19-4442-d39514655ec9	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5571-7f19-490e-03010ef330f0	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5571-7f19-55b1-4ddefd23d1c3	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5571-7f19-8af9-34759ed53b73	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5571-7f19-76fc-02dc71550623	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5571-7f19-847a-9030de63585b	00010000-5571-7f19-5209-4a8513231798	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5571-7f19-155a-e065a183d3cc	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5571-7f19-504c-7b18a16307e5	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5571-7f19-2ce1-6ea13122679e	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5571-7f19-dbf1-c73c0b07c5da	00010000-5571-7f19-855f-a51cb58c6a68	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2778 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2783 (class 0 OID 6380221)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5571-7f18-2867-d9c1726d7852	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5571-7f18-bd8f-2ff3dbc3a7e0	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5571-7f18-afe6-a2ed87786516	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5571-7f18-f11c-126839d38628	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5571-7f18-a440-5ee99733868a	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5571-7f18-4477-98cea7668e99	Abonma-read	Abonma - branje	f
00030000-5571-7f18-2f5b-32762a10d999	Abonma-write	Abonma - spreminjanje	f
00030000-5571-7f18-4bd3-c1d88524da2b	Alternacija-read	Alternacija - branje	f
00030000-5571-7f18-4dc7-2d2d96f10ed0	Alternacija-write	Alternacija - spreminjanje	f
00030000-5571-7f18-7b59-b9eeabdea4bd	Arhivalija-read	Arhivalija - branje	f
00030000-5571-7f18-42b7-0c461095093b	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5571-7f18-a82c-ed9790f1cd0b	Besedilo-read	Besedilo - branje	f
00030000-5571-7f18-4db8-eecfbfe5468d	Besedilo-write	Besedilo - spreminjanje	f
00030000-5571-7f18-09ea-5788b69afb89	DogodekIzven-read	DogodekIzven - branje	f
00030000-5571-7f18-3a89-25caa6ca517e	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5571-7f18-71a0-633746fc89a1	Dogodek-read	Dogodek - branje	f
00030000-5571-7f18-c0de-70b813e22ad9	Dogodek-write	Dogodek - spreminjanje	f
00030000-5571-7f18-49ba-68d8467f3622	Drzava-read	Drzava - branje	f
00030000-5571-7f18-3bf9-0a4d758d33b7	Drzava-write	Drzava - spreminjanje	f
00030000-5571-7f18-4e76-c22b90559134	Funkcija-read	Funkcija - branje	f
00030000-5571-7f18-7035-671250c8ca47	Funkcija-write	Funkcija - spreminjanje	f
00030000-5571-7f18-7906-62e7bf2dfffa	Gostovanje-read	Gostovanje - branje	f
00030000-5571-7f18-8ccc-c505e4f0f7fd	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5571-7f18-524b-7afd1c9a4c23	Gostujoca-read	Gostujoca - branje	f
00030000-5571-7f18-841e-cfc1efdb3928	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5571-7f18-b332-b2fa4346184d	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5571-7f18-4146-389fd6b8c54d	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5571-7f18-76d2-c44878bc47fd	Kupec-read	Kupec - branje	f
00030000-5571-7f18-1bac-5d17f34ea4de	Kupec-write	Kupec - spreminjanje	f
00030000-5571-7f18-24b2-6ed79466dc6d	NacinPlacina-read	NacinPlacina - branje	f
00030000-5571-7f18-67d8-6cb5fe665c1a	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5571-7f18-c625-e90e247fdaee	Option-read	Option - branje	f
00030000-5571-7f18-fb1d-db126e9e969d	Option-write	Option - spreminjanje	f
00030000-5571-7f18-107b-2bfb39df0d2c	OptionValue-read	OptionValue - branje	f
00030000-5571-7f18-46e0-d7d1aed442c2	OptionValue-write	OptionValue - spreminjanje	f
00030000-5571-7f18-b886-d9d6da2ca5cc	Oseba-read	Oseba - branje	f
00030000-5571-7f18-983a-3259851d03af	Oseba-write	Oseba - spreminjanje	f
00030000-5571-7f18-c8a8-2ce0969cd0c6	Permission-read	Permission - branje	f
00030000-5571-7f18-ba01-fe9742eb6bf6	Permission-write	Permission - spreminjanje	f
00030000-5571-7f18-fb2d-ed542f9ab3f4	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5571-7f18-426b-dd193d778faa	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5571-7f18-df36-6a5c4222fa1a	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5571-7f18-e548-c3a999fe151f	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5571-7f18-3bc1-f7898a4c37d5	Pogodba-read	Pogodba - branje	f
00030000-5571-7f18-0ce0-86bfd3566d16	Pogodba-write	Pogodba - spreminjanje	f
00030000-5571-7f18-bba7-c91c65f1ed14	Popa-read	Popa - branje	f
00030000-5571-7f18-0315-1c3fe784c756	Popa-write	Popa - spreminjanje	f
00030000-5571-7f18-50af-57da91be0b82	Posta-read	Posta - branje	f
00030000-5571-7f18-5f1d-a10f8356c5f7	Posta-write	Posta - spreminjanje	f
00030000-5571-7f18-a4fb-63f22953d20e	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5571-7f18-117b-9e3cfc247926	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5571-7f18-012c-af15864686a0	PostniNaslov-read	PostniNaslov - branje	f
00030000-5571-7f18-8c4e-c2428ee57217	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5571-7f18-15e0-4b0e3d23394a	Predstava-read	Predstava - branje	f
00030000-5571-7f18-13d1-c7df5a10adea	Predstava-write	Predstava - spreminjanje	f
00030000-5571-7f18-6ba3-0c9078b36aee	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5571-7f18-a09a-71f6bfec6933	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5571-7f18-d04b-37403aff6d1c	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5571-7f18-a527-da058c645e89	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5571-7f18-fb02-076367ebccb4	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5571-7f18-2cf1-cda2bc7a8c98	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5571-7f18-9741-73de08ac8f13	Prostor-read	Prostor - branje	f
00030000-5571-7f18-1bc6-04722772170c	Prostor-write	Prostor - spreminjanje	f
00030000-5571-7f18-79b4-51a0585316d3	Racun-read	Racun - branje	f
00030000-5571-7f18-65d7-83f1c9230528	Racun-write	Racun - spreminjanje	f
00030000-5571-7f18-bf97-49628f3378dc	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5571-7f18-a9b7-56e64889d91c	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5571-7f18-068b-3df7d67f71df	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5571-7f18-3fe0-63b7d20a3cda	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5571-7f18-97d0-a16887f5a5a6	Rekvizit-read	Rekvizit - branje	f
00030000-5571-7f18-7485-5caa00a5e990	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5571-7f18-68a1-e640180c3b12	Revizija-read	Revizija - branje	f
00030000-5571-7f18-1355-302df4411281	Revizija-write	Revizija - spreminjanje	f
00030000-5571-7f18-d43a-b3952e0b7cf9	Rezervacija-read	Rezervacija - branje	f
00030000-5571-7f18-ae12-6fe12f78332f	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5571-7f18-17fd-dd8a75fb5d70	Role-read	Role - branje	f
00030000-5571-7f18-a0fe-d794cf6c2e01	Role-write	Role - spreminjanje	f
00030000-5571-7f18-8174-e639bfb73d72	SedezniRed-read	SedezniRed - branje	f
00030000-5571-7f18-b0c1-2bf2a2c23c99	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5571-7f18-1b5e-8951432ebbed	Sedez-read	Sedez - branje	f
00030000-5571-7f18-0872-71b9710b1e75	Sedez-write	Sedez - spreminjanje	f
00030000-5571-7f18-f55d-6b24e7a153e8	Sezona-read	Sezona - branje	f
00030000-5571-7f18-ccf1-7a2ce5c7b092	Sezona-write	Sezona - spreminjanje	f
00030000-5571-7f18-05ec-da058cf2e067	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5571-7f18-ec94-80feb7a95775	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5571-7f18-d755-94a006867b2d	Stevilcenje-read	Stevilcenje - branje	f
00030000-5571-7f18-4ba2-0b17ae27d84d	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5571-7f18-fdb1-1097707a2901	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5571-7f18-3bc6-70c8a0da3b07	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5571-7f18-062e-e07a89e49afa	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5571-7f18-8629-c5e94f060593	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5571-7f18-fcbd-d9aeeadca5f3	Telefonska-read	Telefonska - branje	f
00030000-5571-7f18-c72b-d00bdd422ef3	Telefonska-write	Telefonska - spreminjanje	f
00030000-5571-7f18-b43d-37b740df0132	TerminStoritve-read	TerminStoritve - branje	f
00030000-5571-7f18-c517-01c3dd6534c9	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5571-7f18-7c75-ef9e31a4d41a	TipFunkcije-read	TipFunkcije - branje	f
00030000-5571-7f18-d2ca-f5713323aadf	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5571-7f18-c352-f986915a7e5a	Trr-read	Trr - branje	f
00030000-5571-7f18-b9a1-988c9343696f	Trr-write	Trr - spreminjanje	f
00030000-5571-7f18-00a6-0de22b98d662	Uprizoritev-read	Uprizoritev - branje	f
00030000-5571-7f18-24a8-9f3cc74e0fb6	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5571-7f18-2e60-615c081f272f	User-read	User - branje	f
00030000-5571-7f18-4c44-9806b9a0f7f9	User-write	User - spreminjanje	f
00030000-5571-7f18-5bab-0353c58a005c	Vaja-read	Vaja - branje	f
00030000-5571-7f18-cb50-81375899a84d	Vaja-write	Vaja - spreminjanje	f
00030000-5571-7f18-ecc5-dc36a1661dac	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5571-7f18-18d9-0ac97ba5a8bf	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5571-7f18-4535-0d514b9cfb3a	Zaposlitev-read	Zaposlitev - branje	f
00030000-5571-7f18-b4d6-5ad27a2ca979	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5571-7f18-477f-438f6c0d99f6	Zasedenost-read	Zasedenost - branje	f
00030000-5571-7f18-774b-125da7e0b419	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5571-7f18-902f-c463eb542cfb	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5571-7f18-3a42-736ca1319a93	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5571-7f18-0b9b-1d941e159d18	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5571-7f18-d768-8b0d4b55b844	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2785 (class 0 OID 6380240)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5571-7f18-5a44-575d3666172d	00030000-5571-7f18-49ba-68d8467f3622
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-4477-98cea7668e99
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-2f5b-32762a10d999
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-4bd3-c1d88524da2b
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-4dc7-2d2d96f10ed0
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-7b59-b9eeabdea4bd
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-71a0-633746fc89a1
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-f11c-126839d38628
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-c0de-70b813e22ad9
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-49ba-68d8467f3622
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-3bf9-0a4d758d33b7
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-4e76-c22b90559134
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-7035-671250c8ca47
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-7906-62e7bf2dfffa
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-8ccc-c505e4f0f7fd
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-524b-7afd1c9a4c23
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-841e-cfc1efdb3928
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-b332-b2fa4346184d
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-4146-389fd6b8c54d
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-c625-e90e247fdaee
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-107b-2bfb39df0d2c
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-b886-d9d6da2ca5cc
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-983a-3259851d03af
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-bba7-c91c65f1ed14
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-0315-1c3fe784c756
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-50af-57da91be0b82
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-5f1d-a10f8356c5f7
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-012c-af15864686a0
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-8c4e-c2428ee57217
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-15e0-4b0e3d23394a
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-13d1-c7df5a10adea
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-fb02-076367ebccb4
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-2cf1-cda2bc7a8c98
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-9741-73de08ac8f13
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-1bc6-04722772170c
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-068b-3df7d67f71df
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-3fe0-63b7d20a3cda
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-97d0-a16887f5a5a6
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-7485-5caa00a5e990
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-f55d-6b24e7a153e8
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-ccf1-7a2ce5c7b092
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-7c75-ef9e31a4d41a
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-00a6-0de22b98d662
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-24a8-9f3cc74e0fb6
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-5bab-0353c58a005c
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-cb50-81375899a84d
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-477f-438f6c0d99f6
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-774b-125da7e0b419
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-902f-c463eb542cfb
00020000-5571-7f18-7c34-25351aa70753	00030000-5571-7f18-0b9b-1d941e159d18
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-4477-98cea7668e99
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-7b59-b9eeabdea4bd
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-71a0-633746fc89a1
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-49ba-68d8467f3622
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-7906-62e7bf2dfffa
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-524b-7afd1c9a4c23
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-b332-b2fa4346184d
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-4146-389fd6b8c54d
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-c625-e90e247fdaee
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-107b-2bfb39df0d2c
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-b886-d9d6da2ca5cc
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-983a-3259851d03af
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-bba7-c91c65f1ed14
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-50af-57da91be0b82
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-012c-af15864686a0
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-8c4e-c2428ee57217
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-15e0-4b0e3d23394a
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-9741-73de08ac8f13
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-068b-3df7d67f71df
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-97d0-a16887f5a5a6
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-f55d-6b24e7a153e8
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-fcbd-d9aeeadca5f3
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-c72b-d00bdd422ef3
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-c352-f986915a7e5a
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-b9a1-988c9343696f
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-4535-0d514b9cfb3a
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-b4d6-5ad27a2ca979
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-902f-c463eb542cfb
00020000-5571-7f18-7286-5d6a3a53dc05	00030000-5571-7f18-0b9b-1d941e159d18
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-4477-98cea7668e99
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-4bd3-c1d88524da2b
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-7b59-b9eeabdea4bd
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-42b7-0c461095093b
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-a82c-ed9790f1cd0b
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-09ea-5788b69afb89
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-71a0-633746fc89a1
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-49ba-68d8467f3622
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-4e76-c22b90559134
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-7906-62e7bf2dfffa
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-524b-7afd1c9a4c23
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-b332-b2fa4346184d
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-c625-e90e247fdaee
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-107b-2bfb39df0d2c
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-b886-d9d6da2ca5cc
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-bba7-c91c65f1ed14
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-50af-57da91be0b82
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-15e0-4b0e3d23394a
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-fb02-076367ebccb4
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-9741-73de08ac8f13
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-068b-3df7d67f71df
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-97d0-a16887f5a5a6
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-f55d-6b24e7a153e8
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-7c75-ef9e31a4d41a
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-5bab-0353c58a005c
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-477f-438f6c0d99f6
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-902f-c463eb542cfb
00020000-5571-7f18-54a5-374f80d9938e	00030000-5571-7f18-0b9b-1d941e159d18
00020000-5571-7f18-ba5a-bb45dd62ec5d	00030000-5571-7f18-4477-98cea7668e99
00020000-5571-7f18-ba5a-bb45dd62ec5d	00030000-5571-7f18-2f5b-32762a10d999
00020000-5571-7f18-ba5a-bb45dd62ec5d	00030000-5571-7f18-4dc7-2d2d96f10ed0
00020000-5571-7f18-ba5a-bb45dd62ec5d	00030000-5571-7f18-7b59-b9eeabdea4bd
00020000-5571-7f18-ba5a-bb45dd62ec5d	00030000-5571-7f18-71a0-633746fc89a1
00020000-5571-7f18-ba5a-bb45dd62ec5d	00030000-5571-7f18-49ba-68d8467f3622
00020000-5571-7f18-ba5a-bb45dd62ec5d	00030000-5571-7f18-7906-62e7bf2dfffa
00020000-5571-7f18-ba5a-bb45dd62ec5d	00030000-5571-7f18-524b-7afd1c9a4c23
00020000-5571-7f18-ba5a-bb45dd62ec5d	00030000-5571-7f18-c625-e90e247fdaee
00020000-5571-7f18-ba5a-bb45dd62ec5d	00030000-5571-7f18-107b-2bfb39df0d2c
00020000-5571-7f18-ba5a-bb45dd62ec5d	00030000-5571-7f18-bba7-c91c65f1ed14
00020000-5571-7f18-ba5a-bb45dd62ec5d	00030000-5571-7f18-50af-57da91be0b82
00020000-5571-7f18-ba5a-bb45dd62ec5d	00030000-5571-7f18-15e0-4b0e3d23394a
00020000-5571-7f18-ba5a-bb45dd62ec5d	00030000-5571-7f18-9741-73de08ac8f13
00020000-5571-7f18-ba5a-bb45dd62ec5d	00030000-5571-7f18-068b-3df7d67f71df
00020000-5571-7f18-ba5a-bb45dd62ec5d	00030000-5571-7f18-97d0-a16887f5a5a6
00020000-5571-7f18-ba5a-bb45dd62ec5d	00030000-5571-7f18-f55d-6b24e7a153e8
00020000-5571-7f18-ba5a-bb45dd62ec5d	00030000-5571-7f18-7c75-ef9e31a4d41a
00020000-5571-7f18-ba5a-bb45dd62ec5d	00030000-5571-7f18-902f-c463eb542cfb
00020000-5571-7f18-ba5a-bb45dd62ec5d	00030000-5571-7f18-0b9b-1d941e159d18
00020000-5571-7f18-31ca-613302e7ba7f	00030000-5571-7f18-4477-98cea7668e99
00020000-5571-7f18-31ca-613302e7ba7f	00030000-5571-7f18-7b59-b9eeabdea4bd
00020000-5571-7f18-31ca-613302e7ba7f	00030000-5571-7f18-71a0-633746fc89a1
00020000-5571-7f18-31ca-613302e7ba7f	00030000-5571-7f18-49ba-68d8467f3622
00020000-5571-7f18-31ca-613302e7ba7f	00030000-5571-7f18-7906-62e7bf2dfffa
00020000-5571-7f18-31ca-613302e7ba7f	00030000-5571-7f18-524b-7afd1c9a4c23
00020000-5571-7f18-31ca-613302e7ba7f	00030000-5571-7f18-c625-e90e247fdaee
00020000-5571-7f18-31ca-613302e7ba7f	00030000-5571-7f18-107b-2bfb39df0d2c
00020000-5571-7f18-31ca-613302e7ba7f	00030000-5571-7f18-bba7-c91c65f1ed14
00020000-5571-7f18-31ca-613302e7ba7f	00030000-5571-7f18-50af-57da91be0b82
00020000-5571-7f18-31ca-613302e7ba7f	00030000-5571-7f18-15e0-4b0e3d23394a
00020000-5571-7f18-31ca-613302e7ba7f	00030000-5571-7f18-9741-73de08ac8f13
00020000-5571-7f18-31ca-613302e7ba7f	00030000-5571-7f18-068b-3df7d67f71df
00020000-5571-7f18-31ca-613302e7ba7f	00030000-5571-7f18-97d0-a16887f5a5a6
00020000-5571-7f18-31ca-613302e7ba7f	00030000-5571-7f18-f55d-6b24e7a153e8
00020000-5571-7f18-31ca-613302e7ba7f	00030000-5571-7f18-b43d-37b740df0132
00020000-5571-7f18-31ca-613302e7ba7f	00030000-5571-7f18-afe6-a2ed87786516
00020000-5571-7f18-31ca-613302e7ba7f	00030000-5571-7f18-7c75-ef9e31a4d41a
00020000-5571-7f18-31ca-613302e7ba7f	00030000-5571-7f18-902f-c463eb542cfb
00020000-5571-7f18-31ca-613302e7ba7f	00030000-5571-7f18-0b9b-1d941e159d18
\.


--
-- TOC entry 2813 (class 0 OID 6380535)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2817 (class 0 OID 6380566)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2829 (class 0 OID 6380704)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2790 (class 0 OID 6380300)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5571-7f19-47d0-077b0526821a	00040000-5571-7f18-86d0-501cefb5653a	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5571-7f19-9669-3f358c358ac3	00040000-5571-7f18-86d0-501cefb5653a	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5571-7f19-fb24-18fed2909a39	00040000-5571-7f18-86d0-501cefb5653a	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5571-7f19-aec3-05ff12fd9cf0	00040000-5571-7f18-86d0-501cefb5653a	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2792 (class 0 OID 6380335)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5571-7f17-86e7-592ab77ca43a	8341	Adlešiči
00050000-5571-7f17-f00c-a42e9ae0a9fc	5270	Ajdovščina
00050000-5571-7f17-05a4-be503bf264c4	6280	Ankaran/Ancarano
00050000-5571-7f17-82bd-4c2ff8df7757	9253	Apače
00050000-5571-7f17-f20d-62cef02be2a8	8253	Artiče
00050000-5571-7f17-9570-250d2af37a76	4275	Begunje na Gorenjskem
00050000-5571-7f17-5591-45d01a4b8d28	1382	Begunje pri Cerknici
00050000-5571-7f17-8f01-0bb1f532ad4a	9231	Beltinci
00050000-5571-7f17-df85-7f4934128b6e	2234	Benedikt
00050000-5571-7f17-b6c4-72664b7d29c2	2345	Bistrica ob Dravi
00050000-5571-7f17-f73e-ab7f22776694	3256	Bistrica ob Sotli
00050000-5571-7f17-b42e-2204fb3dda71	8259	Bizeljsko
00050000-5571-7f17-faf0-b4098e71ef7e	1223	Blagovica
00050000-5571-7f17-6717-9a0905f9b1ae	8283	Blanca
00050000-5571-7f17-5206-543fdfbe3009	4260	Bled
00050000-5571-7f17-1a00-18eea426839d	4273	Blejska Dobrava
00050000-5571-7f17-175a-ddfa5aef483b	9265	Bodonci
00050000-5571-7f17-743d-73b6d80fc1d6	9222	Bogojina
00050000-5571-7f17-2e1c-9a452ab6c5fb	4263	Bohinjska Bela
00050000-5571-7f17-55b4-a5493bf12729	4264	Bohinjska Bistrica
00050000-5571-7f17-9e27-fd7ab039f872	4265	Bohinjsko jezero
00050000-5571-7f17-48a0-d839a1cdae3c	1353	Borovnica
00050000-5571-7f17-44b4-b090d9cab328	8294	Boštanj
00050000-5571-7f17-8d16-4d8897a99c32	5230	Bovec
00050000-5571-7f17-9cb3-c992b13cf17d	5295	Branik
00050000-5571-7f17-74bd-88c2cb0cc77a	3314	Braslovče
00050000-5571-7f17-bd3a-f6467d1728e1	5223	Breginj
00050000-5571-7f17-d169-6b5f001b06c2	8280	Brestanica
00050000-5571-7f17-5d20-d10f8fcde609	2354	Bresternica
00050000-5571-7f17-eba8-9a860e763219	4243	Brezje
00050000-5571-7f17-ce07-58da3ec0887f	1351	Brezovica pri Ljubljani
00050000-5571-7f17-1e9a-f59b6008d769	8250	Brežice
00050000-5571-7f17-99d9-70578a1e2ebe	4210	Brnik - Aerodrom
00050000-5571-7f17-6477-385807311b07	8321	Brusnice
00050000-5571-7f17-c699-30763853980f	3255	Buče
00050000-5571-7f17-c7ee-91618973d960	8276	Bučka 
00050000-5571-7f17-9f11-1c375738dc2f	9261	Cankova
00050000-5571-7f17-c1f2-5dd535d310dd	3000	Celje 
00050000-5571-7f17-e7e9-04c5906c50fd	3001	Celje - poštni predali
00050000-5571-7f17-dbdc-e95bccda0170	4207	Cerklje na Gorenjskem
00050000-5571-7f17-a132-46e07a048969	8263	Cerklje ob Krki
00050000-5571-7f17-1864-cb966c7b0560	1380	Cerknica
00050000-5571-7f17-e600-c6d5156e463e	5282	Cerkno
00050000-5571-7f17-0f30-5ff50a65b580	2236	Cerkvenjak
00050000-5571-7f17-18fc-e0424e18f7c2	2215	Ceršak
00050000-5571-7f17-1316-fe433207de83	2326	Cirkovce
00050000-5571-7f17-ab16-d9f7235eec88	2282	Cirkulane
00050000-5571-7f17-2caf-0e67248f977b	5273	Col
00050000-5571-7f17-5f34-13cd3734ffd7	8251	Čatež ob Savi
00050000-5571-7f17-a1fd-7fc3b78dbcae	1413	Čemšenik
00050000-5571-7f17-ddfb-67eaf7fb8ab0	5253	Čepovan
00050000-5571-7f17-0c82-5db385238808	9232	Črenšovci
00050000-5571-7f17-89ec-c80d5154dc33	2393	Črna na Koroškem
00050000-5571-7f17-5d77-c8305ad0ff24	6275	Črni Kal
00050000-5571-7f17-5946-64e670bfd87b	5274	Črni Vrh nad Idrijo
00050000-5571-7f17-0a5e-2b543c068a1f	5262	Črniče
00050000-5571-7f17-68e7-fa5bcd9b938d	8340	Črnomelj
00050000-5571-7f17-16ae-76fc651aa3f8	6271	Dekani
00050000-5571-7f17-8865-6b959b6f3b44	5210	Deskle
00050000-5571-7f17-b733-c1c73a6b0b0c	2253	Destrnik
00050000-5571-7f17-3db2-2d56f8efb1b3	6215	Divača
00050000-5571-7f17-8b81-a371b4635778	1233	Dob
00050000-5571-7f17-4185-442a004e8c27	3224	Dobje pri Planini
00050000-5571-7f17-bcaf-29582fc89f48	8257	Dobova
00050000-5571-7f17-9d12-ca2f38f6ce42	1423	Dobovec
00050000-5571-7f17-ff34-0cbc94c05d71	5263	Dobravlje
00050000-5571-7f17-c624-99fd83a383d5	3204	Dobrna
00050000-5571-7f17-f7e8-681c76017f03	8211	Dobrnič
00050000-5571-7f17-2cd9-2365f99ff14a	1356	Dobrova
00050000-5571-7f17-10cd-00c2bd109273	9223	Dobrovnik/Dobronak 
00050000-5571-7f17-9750-b214a0d019a4	5212	Dobrovo v Brdih
00050000-5571-7f17-7d18-e2e266ec9b42	1431	Dol pri Hrastniku
00050000-5571-7f17-378b-26dbf965b3a1	1262	Dol pri Ljubljani
00050000-5571-7f17-7aa4-df2a1843ab2e	1273	Dole pri Litiji
00050000-5571-7f17-304a-45563b2d5eda	1331	Dolenja vas
00050000-5571-7f17-8235-7fe89e033bfc	8350	Dolenjske Toplice
00050000-5571-7f17-e7a8-c58cfd7ffd0f	1230	Domžale
00050000-5571-7f17-bb7e-4b5b6cbda215	2252	Dornava
00050000-5571-7f17-1c7b-6471f9107302	5294	Dornberk
00050000-5571-7f17-b09d-7449b0dc4d5f	1319	Draga
00050000-5571-7f17-6f5b-69c5b97f8c22	8343	Dragatuš
00050000-5571-7f17-5ddb-52fd5467f2c6	3222	Dramlje
00050000-5571-7f17-9e36-aca75b281600	2370	Dravograd
00050000-5571-7f17-3a71-8aa1bb403395	4203	Duplje
00050000-5571-7f17-d67a-7f5c58150288	6221	Dutovlje
00050000-5571-7f17-427e-611c2ea71bd6	8361	Dvor
00050000-5571-7f17-513d-db2f7e605ab7	2343	Fala
00050000-5571-7f17-698d-ac26d75dc84b	9208	Fokovci
00050000-5571-7f17-cd1f-98472eead2bf	2313	Fram
00050000-5571-7f17-02c8-e4ecd0e67b8b	3213	Frankolovo
00050000-5571-7f17-1073-e5703e3d61f1	1274	Gabrovka
00050000-5571-7f17-6ff1-ed93f634287b	8254	Globoko
00050000-5571-7f17-06e4-9abdd3d6eb61	5275	Godovič
00050000-5571-7f17-00f9-192d823b4daf	4204	Golnik
00050000-5571-7f17-ed2d-b8b396fa5c66	3303	Gomilsko
00050000-5571-7f17-3351-37a96cc43009	4224	Gorenja vas
00050000-5571-7f17-7e67-a072419532c7	3263	Gorica pri Slivnici
00050000-5571-7f17-d244-9d56cd658ca0	2272	Gorišnica
00050000-5571-7f17-5fba-ddc963f85da2	9250	Gornja Radgona
00050000-5571-7f17-96f4-d0f6ac097a04	3342	Gornji Grad
00050000-5571-7f17-e8e9-616f7b41f064	4282	Gozd Martuljek
00050000-5571-7f17-60c7-a37a4bc15397	6272	Gračišče
00050000-5571-7f17-6967-5feb989f3679	9264	Grad
00050000-5571-7f17-aeee-2347259d9486	8332	Gradac
00050000-5571-7f17-73d6-9b18496e7cac	1384	Grahovo
00050000-5571-7f17-4d55-00adcdc42d27	5242	Grahovo ob Bači
00050000-5571-7f17-00f8-e38f2be86c27	5251	Grgar
00050000-5571-7f17-6320-36c0c592bac9	3302	Griže
00050000-5571-7f17-24ab-28b9ba0e2fd5	3231	Grobelno
00050000-5571-7f17-5bb3-e8a1198a2353	1290	Grosuplje
00050000-5571-7f17-51a5-9ef5d0e61a4f	2288	Hajdina
00050000-5571-7f17-6239-46328eea7460	8362	Hinje
00050000-5571-7f17-8343-f27596d05fab	2311	Hoče
00050000-5571-7f17-6f1e-034a95d2ae01	9205	Hodoš/Hodos
00050000-5571-7f17-fac2-b9241110edac	1354	Horjul
00050000-5571-7f17-1c72-fb2af74a3fa0	1372	Hotedršica
00050000-5571-7f17-2e85-809ead04f2bb	1430	Hrastnik
00050000-5571-7f17-a12d-5e1b1bd96b20	6225	Hruševje
00050000-5571-7f17-d52a-76cc934c3ac5	4276	Hrušica
00050000-5571-7f17-4a4b-7ed18ecbdf2e	5280	Idrija
00050000-5571-7f17-7c6a-698ca307b110	1292	Ig
00050000-5571-7f17-afcb-a5e964c33f36	6250	Ilirska Bistrica
00050000-5571-7f17-89ac-2311b9c6dcd0	6251	Ilirska Bistrica-Trnovo
00050000-5571-7f17-c49f-0d8a8d07e4b3	1295	Ivančna Gorica
00050000-5571-7f17-19b5-76c29d3db75e	2259	Ivanjkovci
00050000-5571-7f17-4943-a4100b34e767	1411	Izlake
00050000-5571-7f17-2e67-5f4e4d61aba8	6310	Izola/Isola
00050000-5571-7f17-dd22-db8c5f0d192d	2222	Jakobski Dol
00050000-5571-7f17-70d6-1f57b0fde654	2221	Jarenina
00050000-5571-7f17-1a33-858ece9e935a	6254	Jelšane
00050000-5571-7f17-c021-50489167335b	4270	Jesenice
00050000-5571-7f17-535a-e8b1e19e993a	8261	Jesenice na Dolenjskem
00050000-5571-7f17-344b-3468fbb4cc27	3273	Jurklošter
00050000-5571-7f17-88c5-0f95df3daed4	2223	Jurovski Dol
00050000-5571-7f17-1568-f6cf51f85092	2256	Juršinci
00050000-5571-7f17-cb4d-550f06718724	5214	Kal nad Kanalom
00050000-5571-7f17-ecc9-04738f28a556	3233	Kalobje
00050000-5571-7f17-254f-9f1f22581731	4246	Kamna Gorica
00050000-5571-7f17-edda-af8d96cf06be	2351	Kamnica
00050000-5571-7f17-380b-b69bffbc2b6f	1241	Kamnik
00050000-5571-7f17-6803-3948204bdab2	5213	Kanal
00050000-5571-7f17-3e68-02b13fc46c71	8258	Kapele
00050000-5571-7f17-1923-992c0f99ff55	2362	Kapla
00050000-5571-7f17-9974-f74c835b4cc4	2325	Kidričevo
00050000-5571-7f17-4743-7f75149c8e3e	1412	Kisovec
00050000-5571-7f17-d3c8-324dc4ec41c9	6253	Knežak
00050000-5571-7f17-9d90-8e58dce8c689	5222	Kobarid
00050000-5571-7f17-88a9-c3a8d509594c	9227	Kobilje
00050000-5571-7f17-485e-e4ee6d358a1c	1330	Kočevje
00050000-5571-7f17-4725-8745fb3f47d9	1338	Kočevska Reka
00050000-5571-7f17-7fb7-4120c0ee8a53	2276	Kog
00050000-5571-7f17-b3f7-32de49f0289e	5211	Kojsko
00050000-5571-7f17-80f9-4525945054a0	6223	Komen
00050000-5571-7f17-7ff1-02d273f0d879	1218	Komenda
00050000-5571-7f17-1630-c7d51a425794	6000	Koper/Capodistria 
00050000-5571-7f17-a423-e6627a04c6ab	6001	Koper/Capodistria - poštni predali
00050000-5571-7f17-3073-e9eb58df4182	8282	Koprivnica
00050000-5571-7f17-8d32-0876ad9dea5f	5296	Kostanjevica na Krasu
00050000-5571-7f17-2c10-f11b049174dd	8311	Kostanjevica na Krki
00050000-5571-7f17-4087-35c443b151c2	1336	Kostel
00050000-5571-7f17-3fe7-38d4b0c8b47f	6256	Košana
00050000-5571-7f17-ce2c-f0106b78e12a	2394	Kotlje
00050000-5571-7f17-3afc-dd702bb33e4a	6240	Kozina
00050000-5571-7f17-e634-94c931d2b1d0	3260	Kozje
00050000-5571-7f17-d312-95712909de96	4000	Kranj 
00050000-5571-7f17-b543-8a4f43652d69	4001	Kranj - poštni predali
00050000-5571-7f17-a453-7631fe7fbf08	4280	Kranjska Gora
00050000-5571-7f17-8f83-12ff80b92d03	1281	Kresnice
00050000-5571-7f17-01de-03f9cc6c5795	4294	Križe
00050000-5571-7f17-4a40-55cc9158957a	9206	Križevci
00050000-5571-7f17-cede-f0582ea3a27e	9242	Križevci pri Ljutomeru
00050000-5571-7f17-1132-d6af0733341b	1301	Krka
00050000-5571-7f17-799d-476c6114ee97	8296	Krmelj
00050000-5571-7f17-9f77-afbcaa9194bb	4245	Kropa
00050000-5571-7f17-e895-87ead9118caf	8262	Krška vas
00050000-5571-7f17-3c5b-11d00c6b5b7b	8270	Krško
00050000-5571-7f17-b860-e349ed06742a	9263	Kuzma
00050000-5571-7f17-edae-acccc1b4f012	2318	Laporje
00050000-5571-7f17-68ab-832c2c28b3fc	3270	Laško
00050000-5571-7f17-6b56-0038a5f19fed	1219	Laze v Tuhinju
00050000-5571-7f17-0a39-a751d1e4a3fb	2230	Lenart v Slovenskih goricah
00050000-5571-7f17-ae7f-0e36f969a153	9220	Lendava/Lendva
00050000-5571-7f17-352c-c86afc1061b0	4248	Lesce
00050000-5571-7f17-2d90-0e7b820d1e3f	3261	Lesično
00050000-5571-7f17-ec07-289e66efc58c	8273	Leskovec pri Krškem
00050000-5571-7f17-e557-4fd8a5d29cd5	2372	Libeliče
00050000-5571-7f17-91d8-071da3ce79a0	2341	Limbuš
00050000-5571-7f17-98fe-f6045a99e356	1270	Litija
00050000-5571-7f17-6cf1-90b015d505ac	3202	Ljubečna
00050000-5571-7f17-460b-c9a2aa0c858a	1000	Ljubljana 
00050000-5571-7f17-f41a-d437eec06780	1001	Ljubljana - poštni predali
00050000-5571-7f17-3c27-742fb2ca74e9	1231	Ljubljana - Črnuče
00050000-5571-7f17-27cd-6c21bad7aae7	1261	Ljubljana - Dobrunje
00050000-5571-7f17-856e-ae1ede4f4275	1260	Ljubljana - Polje
00050000-5571-7f17-63c0-c19a1c82bcd0	1210	Ljubljana - Šentvid
00050000-5571-7f17-3318-73cca12d8c96	1211	Ljubljana - Šmartno
00050000-5571-7f17-160a-82393bc2ed18	3333	Ljubno ob Savinji
00050000-5571-7f17-a94f-859c0e33c45a	9240	Ljutomer
00050000-5571-7f17-f24e-e0dc7c426193	3215	Loče
00050000-5571-7f17-a993-edd871f7f631	5231	Log pod Mangartom
00050000-5571-7f17-f19b-ac304a38aa1f	1358	Log pri Brezovici
00050000-5571-7f17-19b2-1f78e00df4c1	1370	Logatec
00050000-5571-7f17-6a7e-921b0e49dea2	1371	Logatec
00050000-5571-7f17-43d5-8bc5d4f4fac0	1434	Loka pri Zidanem Mostu
00050000-5571-7f17-d883-e4305e76f596	3223	Loka pri Žusmu
00050000-5571-7f17-b9f9-98f9a3ea1aa6	6219	Lokev
00050000-5571-7f17-a6ba-abc3718d9e2a	1318	Loški Potok
00050000-5571-7f17-e362-654bff51df54	2324	Lovrenc na Dravskem polju
00050000-5571-7f17-73a6-f07cd3b5db58	2344	Lovrenc na Pohorju
00050000-5571-7f17-4f5b-eb39e2df51a6	3334	Luče
00050000-5571-7f17-4338-8326db67c301	1225	Lukovica
00050000-5571-7f17-e9ac-404c86e6d905	9202	Mačkovci
00050000-5571-7f17-fe9b-bb2185810cb7	2322	Majšperk
00050000-5571-7f17-01eb-00a8665e4860	2321	Makole
00050000-5571-7f17-9212-83a510519577	9243	Mala Nedelja
00050000-5571-7f17-75a8-c45607524816	2229	Malečnik
00050000-5571-7f17-761e-c7bf989bb80f	6273	Marezige
00050000-5571-7f17-2f4e-3314a8e9a3b2	2000	Maribor 
00050000-5571-7f17-a010-aa1fa39972df	2001	Maribor - poštni predali
00050000-5571-7f17-3818-b51e2bfaa07f	2206	Marjeta na Dravskem polju
00050000-5571-7f17-dd10-e14ad95e8f66	2281	Markovci
00050000-5571-7f17-b092-8bc55d8538bc	9221	Martjanci
00050000-5571-7f17-2006-27424098893d	6242	Materija
00050000-5571-7f17-e156-f6cacf7fc4da	4211	Mavčiče
00050000-5571-7f17-ba64-6860e4b71bd4	1215	Medvode
00050000-5571-7f17-3a96-b309800e9e31	1234	Mengeš
00050000-5571-7f17-54a5-b2a5c0ffbe27	8330	Metlika
00050000-5571-7f17-1102-80fed764d927	2392	Mežica
00050000-5571-7f17-8d65-0dd2f49b73d8	2204	Miklavž na Dravskem polju
00050000-5571-7f17-ca2d-9b7208d5c3f3	2275	Miklavž pri Ormožu
00050000-5571-7f18-100a-3a9c9033205f	5291	Miren
00050000-5571-7f18-30f8-a60e27d5ea34	8233	Mirna
00050000-5571-7f18-acd2-ecf6fbdef6e8	8216	Mirna Peč
00050000-5571-7f18-dd2e-f0630cb32cef	2382	Mislinja
00050000-5571-7f18-bb58-a77ec62c3a1c	4281	Mojstrana
00050000-5571-7f18-92b2-7d029e36c587	8230	Mokronog
00050000-5571-7f18-9913-4d36e12d52fc	1251	Moravče
00050000-5571-7f18-9592-2238ce9c9362	9226	Moravske Toplice
00050000-5571-7f18-ffd0-944e63abff13	5216	Most na Soči
00050000-5571-7f18-4a93-89dda0200f65	1221	Motnik
00050000-5571-7f18-0e49-af1a97d05c7a	3330	Mozirje
00050000-5571-7f18-e45a-3d13a76dc384	9000	Murska Sobota 
00050000-5571-7f18-52a2-0dc77e01c988	9001	Murska Sobota - poštni predali
00050000-5571-7f18-e04e-e0cdd7bb02e3	2366	Muta
00050000-5571-7f18-296e-1f27b0114050	4202	Naklo
00050000-5571-7f18-2843-8a73adf34f4b	3331	Nazarje
00050000-5571-7f18-f2b3-dcc174803782	1357	Notranje Gorice
00050000-5571-7f18-0ded-ce9f51d50206	3203	Nova Cerkev
00050000-5571-7f18-5a75-44a43a237362	5000	Nova Gorica 
00050000-5571-7f18-317e-3ae7ad7fe138	5001	Nova Gorica - poštni predali
00050000-5571-7f18-c212-c93c753623c7	1385	Nova vas
00050000-5571-7f18-93c7-9934f5de2f13	8000	Novo mesto
00050000-5571-7f18-6b9d-1fb7d566b9c1	8001	Novo mesto - poštni predali
00050000-5571-7f18-7fd4-c6a8a3d653d1	6243	Obrov
00050000-5571-7f18-87cd-c9c7b266669a	9233	Odranci
00050000-5571-7f18-f0b6-8eb8a51107bd	2317	Oplotnica
00050000-5571-7f18-c533-ba111b31c176	2312	Orehova vas
00050000-5571-7f18-ad00-68d5cc6ba33a	2270	Ormož
00050000-5571-7f18-eca1-391c17a27c91	1316	Ortnek
00050000-5571-7f18-f528-5e30e9da4579	1337	Osilnica
00050000-5571-7f18-ccb2-f84171ea8e35	8222	Otočec
00050000-5571-7f18-6213-d347387cd59b	2361	Ožbalt
00050000-5571-7f18-dbff-0f88e58945b4	2231	Pernica
00050000-5571-7f18-6c92-13006e74d4b5	2211	Pesnica pri Mariboru
00050000-5571-7f18-42ca-660d370e383c	9203	Petrovci
00050000-5571-7f18-df93-2b2e87035389	3301	Petrovče
00050000-5571-7f18-85e1-ff9706331697	6330	Piran/Pirano
00050000-5571-7f18-c81b-98aa80e95904	8255	Pišece
00050000-5571-7f18-0f9a-982229712813	6257	Pivka
00050000-5571-7f18-1636-91d3a6371a5a	6232	Planina
00050000-5571-7f18-75f3-b3b1fd06d760	3225	Planina pri Sevnici
00050000-5571-7f18-58e2-bd21333d75eb	6276	Pobegi
00050000-5571-7f18-5d3c-5a16426ccced	8312	Podbočje
00050000-5571-7f18-369a-1081d3ce077f	5243	Podbrdo
00050000-5571-7f18-6383-aa271249986f	3254	Podčetrtek
00050000-5571-7f18-1799-62ec7694dcc5	2273	Podgorci
00050000-5571-7f18-e269-4a55d5a95df3	6216	Podgorje
00050000-5571-7f18-c149-92a7e7d51aab	2381	Podgorje pri Slovenj Gradcu
00050000-5571-7f18-b294-ec0e7a3715a2	6244	Podgrad
00050000-5571-7f18-d211-528457e65b59	1414	Podkum
00050000-5571-7f18-0cd8-89b67dfe5376	2286	Podlehnik
00050000-5571-7f18-efb3-7b9ecc1116cb	5272	Podnanos
00050000-5571-7f18-a3b7-08adb6ec0040	4244	Podnart
00050000-5571-7f18-13b8-4fd1700ed1b1	3241	Podplat
00050000-5571-7f18-bd13-1ace2a68096b	3257	Podsreda
00050000-5571-7f18-4fbb-53606b756646	2363	Podvelka
00050000-5571-7f18-015c-3cfa8179409f	2208	Pohorje
00050000-5571-7f18-d8de-1517f6dd3444	2257	Polenšak
00050000-5571-7f18-1a55-d95946f36f58	1355	Polhov Gradec
00050000-5571-7f18-c329-9f924603741d	4223	Poljane nad Škofjo Loko
00050000-5571-7f18-3909-9cee301d5016	2319	Poljčane
00050000-5571-7f18-c395-39e796af6a0b	1272	Polšnik
00050000-5571-7f18-9378-aa2ae9445b3a	3313	Polzela
00050000-5571-7f18-7fd0-558dccdc27f4	3232	Ponikva
00050000-5571-7f18-8c96-b5b454fb900e	6320	Portorož/Portorose
00050000-5571-7f18-4e6a-b8840aa235e3	6230	Postojna
00050000-5571-7f18-3a16-10251c91334f	2331	Pragersko
00050000-5571-7f18-f9d1-c68ad283cfbb	3312	Prebold
00050000-5571-7f18-1804-e40fc6a49570	4205	Preddvor
00050000-5571-7f18-4984-9e295c3a9896	6255	Prem
00050000-5571-7f18-7cfd-4566b0e06816	1352	Preserje
00050000-5571-7f18-2f9a-a05aeb5c0815	6258	Prestranek
00050000-5571-7f18-ea31-5ce80f44bd88	2391	Prevalje
00050000-5571-7f18-8a92-b3be66355538	3262	Prevorje
00050000-5571-7f18-81ad-9c78e5285efb	1276	Primskovo 
00050000-5571-7f18-3e6b-4ab044fec5e5	3253	Pristava pri Mestinju
00050000-5571-7f18-5afb-2baf94c2121e	9207	Prosenjakovci/Partosfalva
00050000-5571-7f18-eed0-9131de4cd031	5297	Prvačina
00050000-5571-7f18-058d-f5326d63dbe3	2250	Ptuj
00050000-5571-7f18-8878-09fb5e167187	2323	Ptujska Gora
00050000-5571-7f18-b1dd-0bbbdf5523cc	9201	Puconci
00050000-5571-7f18-e498-3753281f384e	2327	Rače
00050000-5571-7f18-6087-bb7fc0d6e234	1433	Radeče
00050000-5571-7f18-daa1-e50f2270b530	9252	Radenci
00050000-5571-7f18-3071-ac81b2afe4e8	2360	Radlje ob Dravi
00050000-5571-7f18-3bc6-fdad1ec4230e	1235	Radomlje
00050000-5571-7f18-a912-8a170c4c8623	4240	Radovljica
00050000-5571-7f18-a1c1-f1e59a00a98a	8274	Raka
00050000-5571-7f18-6ed8-ac4ddcbfba76	1381	Rakek
00050000-5571-7f18-c867-e9308350b1a5	4283	Rateče - Planica
00050000-5571-7f18-8a4f-35f1e33b5d63	2390	Ravne na Koroškem
00050000-5571-7f18-1a79-779e43f15b1b	9246	Razkrižje
00050000-5571-7f18-a764-c9cac4b0563d	3332	Rečica ob Savinji
00050000-5571-7f18-9bd5-10202b3eaa82	5292	Renče
00050000-5571-7f18-5e01-20d9f76efa11	1310	Ribnica
00050000-5571-7f18-993a-062197852231	2364	Ribnica na Pohorju
00050000-5571-7f18-d76d-bb8d62e38cbe	3272	Rimske Toplice
00050000-5571-7f18-c20b-ec400ea628bf	1314	Rob
00050000-5571-7f18-f2d1-83f225b182c9	5215	Ročinj
00050000-5571-7f18-2ecf-72c2b9bafaa6	3250	Rogaška Slatina
00050000-5571-7f18-c6f8-8a0fe1d1a027	9262	Rogašovci
00050000-5571-7f18-eb35-326f27bb5ca9	3252	Rogatec
00050000-5571-7f18-aa1e-685bac9f8496	1373	Rovte
00050000-5571-7f18-347a-9d559857a373	2342	Ruše
00050000-5571-7f18-e1ef-09b6c1fe4c42	1282	Sava
00050000-5571-7f18-b4f7-cd52f50669db	6333	Sečovlje/Sicciole
00050000-5571-7f18-b26b-231932c231aa	4227	Selca
00050000-5571-7f18-66cf-777f020a44c7	2352	Selnica ob Dravi
00050000-5571-7f18-f66d-8a083c1abbef	8333	Semič
00050000-5571-7f18-35a7-d46c589e178b	8281	Senovo
00050000-5571-7f18-1c44-f08188e0ac63	6224	Senožeče
00050000-5571-7f18-4385-9f1843fc77c4	8290	Sevnica
00050000-5571-7f18-a563-615f0eef2095	6210	Sežana
00050000-5571-7f18-df09-d799046fdc85	2214	Sladki Vrh
00050000-5571-7f18-c41e-a9bca004ad6b	5283	Slap ob Idrijci
00050000-5571-7f18-e79e-c8bf47a02f8d	2380	Slovenj Gradec
00050000-5571-7f18-857b-fe525bc9c282	2310	Slovenska Bistrica
00050000-5571-7f18-e9bf-303bc3840ee2	3210	Slovenske Konjice
00050000-5571-7f18-5874-def8157c4337	1216	Smlednik
00050000-5571-7f18-9ace-40e30d4ee1cd	5232	Soča
00050000-5571-7f18-000b-231d54dfe4a2	1317	Sodražica
00050000-5571-7f18-46e2-e3c614fd3d3c	3335	Solčava
00050000-5571-7f18-b2f5-2fb06e59c04c	5250	Solkan
00050000-5571-7f18-c55b-88ec414fcdd8	4229	Sorica
00050000-5571-7f18-2d86-3a941d2d6d9c	4225	Sovodenj
00050000-5571-7f18-6d32-14f3ae7dc421	5281	Spodnja Idrija
00050000-5571-7f18-9a41-8f5b69357caf	2241	Spodnji Duplek
00050000-5571-7f18-7209-07a415c0679b	9245	Spodnji Ivanjci
00050000-5571-7f18-0004-6c5f0cd08c91	2277	Središče ob Dravi
00050000-5571-7f18-5037-beed1faf3359	4267	Srednja vas v Bohinju
00050000-5571-7f18-31b4-c6fe448788ad	8256	Sromlje 
00050000-5571-7f18-3eb0-b90dba5bd597	5224	Srpenica
00050000-5571-7f18-1bd2-ae754fadf9a8	1242	Stahovica
00050000-5571-7f18-0766-e886cb09802a	1332	Stara Cerkev
00050000-5571-7f18-e6f7-102c2a53ae15	8342	Stari trg ob Kolpi
00050000-5571-7f18-3928-c98f5c13703b	1386	Stari trg pri Ložu
00050000-5571-7f18-1969-2dcf848a5e86	2205	Starše
00050000-5571-7f18-07c8-6c6f0e4e0a1d	2289	Stoperce
00050000-5571-7f18-6bd5-b55a53320493	8322	Stopiče
00050000-5571-7f18-a020-8d77671a5de0	3206	Stranice
00050000-5571-7f18-4062-4e9441810064	8351	Straža
00050000-5571-7f18-3c1d-5518670982d7	1313	Struge
00050000-5571-7f18-a794-fa008d79545a	8293	Studenec
00050000-5571-7f18-bbe4-7e861764b6f9	8331	Suhor
00050000-5571-7f18-d5a6-25c598dc4828	2233	Sv. Ana v Slovenskih goricah
00050000-5571-7f18-0b41-81da7cf88ac3	2235	Sv. Trojica v Slovenskih goricah
00050000-5571-7f18-59a1-ef23d8e80b56	2353	Sveti Duh na Ostrem Vrhu
00050000-5571-7f18-d8fe-bb26383ef72a	9244	Sveti Jurij ob Ščavnici
00050000-5571-7f18-7c3c-ca9c6ae8d5c2	3264	Sveti Štefan
00050000-5571-7f18-d355-27b19fa3e59d	2258	Sveti Tomaž
00050000-5571-7f18-b9b5-24e88585bf69	9204	Šalovci
00050000-5571-7f18-fac2-a5f1320f1efa	5261	Šempas
00050000-5571-7f18-3c24-83a220a70dfa	5290	Šempeter pri Gorici
00050000-5571-7f18-edd5-8c3a56672db1	3311	Šempeter v Savinjski dolini
00050000-5571-7f18-799b-b5be1fbd7f8f	4208	Šenčur
00050000-5571-7f18-7a29-8a088faf0ed5	2212	Šentilj v Slovenskih goricah
00050000-5571-7f18-9acf-66719c221473	8297	Šentjanž
00050000-5571-7f18-4d97-4a3c209418ca	2373	Šentjanž pri Dravogradu
00050000-5571-7f18-79ed-234452cf04c0	8310	Šentjernej
00050000-5571-7f18-ddf8-b6850c18b4d1	3230	Šentjur
00050000-5571-7f18-a963-6824079aeba9	3271	Šentrupert
00050000-5571-7f18-566b-02d922a894a1	8232	Šentrupert
00050000-5571-7f18-a821-2405b736c542	1296	Šentvid pri Stični
00050000-5571-7f18-2343-b23c302f2906	8275	Škocjan
00050000-5571-7f18-8bf3-e8e908c731c4	6281	Škofije
00050000-5571-7f18-6fa9-4a8cc4fa204f	4220	Škofja Loka
00050000-5571-7f18-a385-32a625f881b9	3211	Škofja vas
00050000-5571-7f18-2011-2da774229596	1291	Škofljica
00050000-5571-7f18-7427-0c60be496010	6274	Šmarje
00050000-5571-7f18-416c-3f3edac326c8	1293	Šmarje - Sap
00050000-5571-7f18-6a5f-82f0c5866363	3240	Šmarje pri Jelšah
00050000-5571-7f18-0bce-a4568cfd345a	8220	Šmarješke Toplice
00050000-5571-7f18-cfb3-cb8b02dd7477	2315	Šmartno na Pohorju
00050000-5571-7f18-8253-66c58848c7d6	3341	Šmartno ob Dreti
00050000-5571-7f18-5d6d-1c5aefcf4d44	3327	Šmartno ob Paki
00050000-5571-7f18-d58b-14ff3a188d9c	1275	Šmartno pri Litiji
00050000-5571-7f18-6735-9ef926fb861a	2383	Šmartno pri Slovenj Gradcu
00050000-5571-7f18-b6d6-8d5eadcfaff1	3201	Šmartno v Rožni dolini
00050000-5571-7f18-68a2-e61d6cae343a	3325	Šoštanj
00050000-5571-7f18-e5d4-d742ebf2d08f	6222	Štanjel
00050000-5571-7f18-f657-2123bd7c728c	3220	Štore
00050000-5571-7f18-0c0a-3113a00139a6	3304	Tabor
00050000-5571-7f18-ff69-a9fd10c405e5	3221	Teharje
00050000-5571-7f18-972d-6d56b011ad74	9251	Tišina
00050000-5571-7f18-efbb-e65660774c58	5220	Tolmin
00050000-5571-7f18-915f-d5898d6b8274	3326	Topolšica
00050000-5571-7f18-5bc2-8d1e7cd1f270	2371	Trbonje
00050000-5571-7f18-d334-864aee3d001e	1420	Trbovlje
00050000-5571-7f18-b073-d88f0dbbf758	8231	Trebelno 
00050000-5571-7f18-d058-69cf69052cd2	8210	Trebnje
00050000-5571-7f18-4a4f-f7e06c34a263	5252	Trnovo pri Gorici
00050000-5571-7f18-3756-1c1bcff6401a	2254	Trnovska vas
00050000-5571-7f18-15f3-c51d6631130e	1222	Trojane
00050000-5571-7f18-f1e2-603f65918a2f	1236	Trzin
00050000-5571-7f18-0569-f08b026f45f8	4290	Tržič
00050000-5571-7f18-83e9-134e0cce4d43	8295	Tržišče
00050000-5571-7f18-6bcf-554e7d24eb2d	1311	Turjak
00050000-5571-7f18-aab2-0ef8afbe83b5	9224	Turnišče
00050000-5571-7f18-8ae6-7dc9d0c34ecd	8323	Uršna sela
00050000-5571-7f18-db0c-b98c5508a156	1252	Vače
00050000-5571-7f18-b614-32d1932d89ee	3320	Velenje 
00050000-5571-7f18-b1df-4daed71514c8	3322	Velenje - poštni predali
00050000-5571-7f18-65b6-590fd462ed87	8212	Velika Loka
00050000-5571-7f18-aabd-541b355c2368	2274	Velika Nedelja
00050000-5571-7f18-6123-be2db761ad8d	9225	Velika Polana
00050000-5571-7f18-2712-fe64d2cbcef1	1315	Velike Lašče
00050000-5571-7f18-4494-03485323f770	8213	Veliki Gaber
00050000-5571-7f18-e93a-d48036c0e737	9241	Veržej
00050000-5571-7f18-826b-3418a586b488	1312	Videm - Dobrepolje
00050000-5571-7f18-aa5f-9d0223362d8d	2284	Videm pri Ptuju
00050000-5571-7f18-19e7-96f64bb78eef	8344	Vinica
00050000-5571-7f18-8451-283888a251d7	5271	Vipava
00050000-5571-7f18-3aae-a13f46740254	4212	Visoko
00050000-5571-7f18-8f6f-6f6d7951f6e1	1294	Višnja Gora
00050000-5571-7f18-1229-72cd33a4e8d4	3205	Vitanje
00050000-5571-7f18-dc46-17e0e4afb470	2255	Vitomarci
00050000-5571-7f18-4c1d-b889aa0df76d	1217	Vodice
00050000-5571-7f18-a306-1ac00fa880a4	3212	Vojnik\t
00050000-5571-7f18-1a8c-a56ad24cc086	5293	Volčja Draga
00050000-5571-7f18-6cad-e83cef833cfc	2232	Voličina
00050000-5571-7f18-b263-45c9f8cc487f	3305	Vransko
00050000-5571-7f18-598c-5b425250ad33	6217	Vremski Britof
00050000-5571-7f18-aac8-e6798e89d421	1360	Vrhnika
00050000-5571-7f18-37f1-9aca32d28c32	2365	Vuhred
00050000-5571-7f18-44bd-bb3f23c2dbaa	2367	Vuzenica
00050000-5571-7f18-fe22-0245581d281d	8292	Zabukovje 
00050000-5571-7f18-1596-8471f457cbd1	1410	Zagorje ob Savi
00050000-5571-7f18-b4a9-2ac488c55913	1303	Zagradec
00050000-5571-7f18-80ec-3e0b7e4653a6	2283	Zavrč
00050000-5571-7f18-646b-85b05d0b80dd	8272	Zdole 
00050000-5571-7f18-25cd-9c330ff7263d	4201	Zgornja Besnica
00050000-5571-7f18-4cab-e92a5f6dd93e	2242	Zgornja Korena
00050000-5571-7f18-3eed-3da43d9380f6	2201	Zgornja Kungota
00050000-5571-7f18-5ce7-2a0750827498	2316	Zgornja Ložnica
00050000-5571-7f18-f2dc-e721f23c962f	2314	Zgornja Polskava
00050000-5571-7f18-9563-e146efa317a6	2213	Zgornja Velka
00050000-5571-7f18-7d31-c8945683a4af	4247	Zgornje Gorje
00050000-5571-7f18-bc20-84a513aaba8d	4206	Zgornje Jezersko
00050000-5571-7f18-959a-d183c388a8cf	2285	Zgornji Leskovec
00050000-5571-7f18-c11b-301ee74b5b89	1432	Zidani Most
00050000-5571-7f18-928a-95c62cf7de4c	3214	Zreče
00050000-5571-7f18-80cd-42b5545eaecf	4209	Žabnica
00050000-5571-7f18-5016-bf637e479ad2	3310	Žalec
00050000-5571-7f18-e188-176dfc5b947a	4228	Železniki
00050000-5571-7f18-909e-832aad67f2d6	2287	Žetale
00050000-5571-7f18-a076-9af9b265604f	4226	Žiri
00050000-5571-7f18-9f95-fd8cac41829e	4274	Žirovnica
00050000-5571-7f18-51df-25301342dd24	8360	Žužemberk
\.


--
-- TOC entry 2809 (class 0 OID 6380509)
-- Dependencies: 203
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2777 (class 0 OID 692701)
-- Dependencies: 171
-- Data for Name: postninaslov; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslov (id, klient_id, oseba_id, drzava_id, naziv, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2791 (class 0 OID 6380320)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2797 (class 0 OID 6380398)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2811 (class 0 OID 6380521)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2824 (class 0 OID 6380641)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 6380696)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5571-7f19-2de9-f6d64370b2be	00080000-5571-7f19-fb24-18fed2909a39	0987	A
00190000-5571-7f19-8bd5-367539720825	00080000-5571-7f19-9669-3f358c358ac3	0989	A
\.


--
-- TOC entry 2835 (class 0 OID 6380810)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 6380838)
-- Dependencies: 232
-- Data for Name: programfestival; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programfestival (id, program_dela_id) FROM stdin;
\.


--
-- TOC entry 2853 (class 0 OID 0)
-- Dependencies: 238
-- Name: programfestival_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('programfestival_id_seq', 1, false);


--
-- TOC entry 2836 (class 0 OID 6380819)
-- Dependencies: 230
-- Data for Name: programgostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programgostovanje (id, program_dela_id, gostitelj_id, transportnistroski, odkup) FROM stdin;
\.


--
-- TOC entry 2854 (class 0 OID 0)
-- Dependencies: 236
-- Name: programgostovanje_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('programgostovanje_id_seq', 1, false);


--
-- TOC entry 2815 (class 0 OID 6380550)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5571-7f19-3c11-4b4bb7d58887	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5571-7f19-4730-0348c3f3e524	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5571-7f19-25d9-8363175a1758	0003	Kazinska	t	84	Kazinska dvorana
00220000-5571-7f19-bdd2-30e96d1ed606	0004	Mali oder	t	24	Mali oder 
00220000-5571-7f19-35c0-e65f2503816d	0005	Komorni oder	t	15	Komorni oder
00220000-5571-7f19-72dc-a1fb7662ac86	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5571-7f19-795e-0453b97afaa6	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2807 (class 0 OID 6380494)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2806 (class 0 OID 6380484)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2827 (class 0 OID 6380685)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 6380618)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2780 (class 0 OID 6380192)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5571-7f18-8edb-056b7cfcf8bd	00010000-5571-7f18-6826-e38cbeb4920a	2015-06-05 12:51:06	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO/tpcL7X2AcvP4GXHt9bHzPgEN0zkoPa";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2855 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2816 (class 0 OID 6380560)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2784 (class 0 OID 6380230)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5571-7f18-92f1-bcb27572ad7d	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5571-7f18-5a44-575d3666172d	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5571-7f18-a6ca-e1c00db96252	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5571-7f18-beb4-7cef20f6a453	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5571-7f18-7c34-25351aa70753	planer	Planer dogodkov v koledarju	t
00020000-5571-7f18-7286-5d6a3a53dc05	kadrovska	Kadrovska služba	t
00020000-5571-7f18-54a5-374f80d9938e	arhivar	Ažuriranje arhivalij	t
00020000-5571-7f18-ba5a-bb45dd62ec5d	igralec	Igralec	t
00020000-5571-7f18-31ca-613302e7ba7f	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2782 (class 0 OID 6380214)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5571-7f18-8edb-056b7cfcf8bd	00020000-5571-7f18-a6ca-e1c00db96252
00010000-5571-7f18-6826-e38cbeb4920a	00020000-5571-7f18-a6ca-e1c00db96252
\.


--
-- TOC entry 2818 (class 0 OID 6380574)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2810 (class 0 OID 6380515)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2804 (class 0 OID 6380465)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 6380857)
-- Dependencies: 235
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5571-7f18-94ff-041767b04a53	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5571-7f18-563e-d67b8ad28119	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5571-7f18-a283-f336b6ec277d	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5571-7f18-061f-b8d136d9f80d	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5571-7f18-6f3f-4a563a7e6aba	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2840 (class 0 OID 6380849)
-- Dependencies: 234
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5571-7f18-a903-cf7e70105562	00000000-5571-7f18-061f-b8d136d9f80d	popa
00000000-5571-7f18-cfa3-53c30b13ac90	00000000-5571-7f18-061f-b8d136d9f80d	oseba
00000000-5571-7f18-d8fb-58492da802fb	00000000-5571-7f18-563e-d67b8ad28119	prostor
00000000-5571-7f18-997d-2d38998d1554	00000000-5571-7f18-061f-b8d136d9f80d	besedilo
00000000-5571-7f18-d703-cd36a9f606a0	00000000-5571-7f18-061f-b8d136d9f80d	uprizoritev
00000000-5571-7f18-3595-366129142bf6	00000000-5571-7f18-061f-b8d136d9f80d	funkcija
00000000-5571-7f18-dafa-0f4804624889	00000000-5571-7f18-061f-b8d136d9f80d	tipfunkcije
00000000-5571-7f18-5cda-05db171efcdc	00000000-5571-7f18-061f-b8d136d9f80d	alternacija
00000000-5571-7f18-4a62-ff30cd54d4ff	00000000-5571-7f18-94ff-041767b04a53	pogodba
00000000-5571-7f18-2a0a-3557d63f488e	00000000-5571-7f18-061f-b8d136d9f80d	zaposlitev
\.


--
-- TOC entry 2839 (class 0 OID 6380844)
-- Dependencies: 233
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 6380628)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2789 (class 0 OID 6380292)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2805 (class 0 OID 6380471)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5571-7f19-7a4d-4b34439d081b	00180000-5571-7f19-c00f-83c518ec2cdf	000c0000-5571-7f19-cc7a-5b4fc13315dd	00090000-5571-7f19-847a-9030de63585b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5571-7f19-2ea4-380cd728cee9	00180000-5571-7f19-c00f-83c518ec2cdf	000c0000-5571-7f19-2b31-ebceee91753c	00090000-5571-7f19-155a-e065a183d3cc	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5571-7f19-9e31-c6fd3b87031d	00180000-5571-7f19-c00f-83c518ec2cdf	000c0000-5571-7f19-b1d9-9ebe607421f0	00090000-5571-7f19-7e37-7df107d41b2b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5571-7f19-a03c-89a65228cadb	00180000-5571-7f19-c00f-83c518ec2cdf	000c0000-5571-7f19-2b31-058fddbe9469	00090000-5571-7f19-6398-5a500839d885	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5571-7f19-f761-6a9498e44119	00180000-5571-7f19-c00f-83c518ec2cdf	000c0000-5571-7f19-b821-4253b278ac96	00090000-5571-7f19-2ce1-6ea13122679e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5571-7f19-ae07-a485463c9d72	00180000-5571-7f19-d225-075dce210b36	\N	00090000-5571-7f19-2ce1-6ea13122679e	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2826 (class 0 OID 6380674)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5571-7f18-8c9b-41f9efa7dae0	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5571-7f18-5419-5ada03a48690	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5571-7f18-a350-92ffedd5c8c3	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5571-7f18-a8b1-e26c384d691a	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5571-7f18-4ce5-8bd0efb1e5f6	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5571-7f18-7305-ff59b5603b4d	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5571-7f18-f94c-17ef4c8d12aa	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5571-7f18-6f2b-b3e70585cda5	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5571-7f18-2cc1-df34bfe05349	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5571-7f18-9802-a63e1f39761b	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5571-7f18-77b2-b29300ae2708	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5571-7f18-0818-421ed064481c	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5571-7f18-b9a8-2c2482b5bce8	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5571-7f18-68a0-266672ef99d1	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5571-7f18-ecd5-e4ce4bf9cd7d	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5571-7f18-59da-a7aa612384ce	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2837 (class 0 OID 6380827)
-- Dependencies: 231
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
\.


--
-- TOC entry 2856 (class 0 OID 0)
-- Dependencies: 237
-- Name: tipprogramskeenote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('tipprogramskeenote_id_seq', 1, false);


--
-- TOC entry 2794 (class 0 OID 6380355)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2781 (class 0 OID 6380201)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5571-7f18-6826-e38cbeb4920a	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROc5ME0/uyD6jvWiderEztonI2VKtbatW	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5571-7f19-9c4c-eed9cbf90205	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5571-7f19-7d7c-f6f71f0ce4cb	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5571-7f19-5209-4a8513231798	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5571-7f19-855f-a51cb58c6a68	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5571-7f19-4442-d39514655ec9	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5571-7f19-2daa-2f0ce58dcbfd	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5571-7f18-8edb-056b7cfcf8bd	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2831 (class 0 OID 6380731)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5571-7f19-27e7-950ae4f4850e	00160000-5571-7f19-cd41-ff8687bd1fdd	00150000-5571-7f18-0c2e-a9a1f6ac3a2d	00140000-5571-7f18-0d51-072f09a5f45e	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5571-7f19-35c0-e65f2503816d
000e0000-5571-7f19-abab-4ec5213599cf	00160000-5571-7f19-0b22-b57cd72897dc	00150000-5571-7f18-c279-c22c84e42206	00140000-5571-7f18-214a-5461921e3368	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5571-7f19-72dc-a1fb7662ac86
\.


--
-- TOC entry 2799 (class 0 OID 6380417)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5571-7f19-6039-3c1a94795d52	000e0000-5571-7f19-abab-4ec5213599cf	1	
00200000-5571-7f19-9ae0-03351be2e0b8	000e0000-5571-7f19-abab-4ec5213599cf	2	
\.


--
-- TOC entry 2814 (class 0 OID 6380542)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 6380611)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2801 (class 0 OID 6380449)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 6380721)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5571-7f18-0d51-072f09a5f45e	01	Drama	drama (SURS 01)
00140000-5571-7f18-5219-898380617eba	02	Opera	opera (SURS 02)
00140000-5571-7f18-76eb-d875a706484d	03	Balet	balet (SURS 03)
00140000-5571-7f18-3f7d-ccbbaee9c178	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5571-7f18-1c64-8a8f09ae8c5c	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5571-7f18-214a-5461921e3368	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5571-7f18-98a7-399f47ff3ee4	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2820 (class 0 OID 6380601)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5571-7f18-a49d-fc845be5a63f	01	Opera	opera
00150000-5571-7f18-d3c1-512e8e62125c	02	Opereta	opereta
00150000-5571-7f18-4003-87d5470290b5	03	Balet	balet
00150000-5571-7f18-c9a4-0bfade3fe3e1	04	Plesne prireditve	plesne prireditve
00150000-5571-7f18-5eb3-31692d1edffa	05	Lutkovno gledališče	lutkovno gledališče
00150000-5571-7f18-a3f3-ac505ae09e74	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5571-7f18-8611-91d2662ffd1b	07	Biografska drama	biografska drama
00150000-5571-7f18-0c2e-a9a1f6ac3a2d	08	Komedija	komedija
00150000-5571-7f18-ab7b-dbe69a51ba65	09	Črna komedija	črna komedija
00150000-5571-7f18-f8f7-b09d75b27e87	10	E-igra	E-igra
00150000-5571-7f18-c279-c22c84e42206	11	Kriminalka	kriminalka
00150000-5571-7f18-67a4-6ff1d22af453	12	Musical	musical
\.


--
-- TOC entry 2372 (class 2606 OID 6380255)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 6380777)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 6380767)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 6380673)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 6380439)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 6380464)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 6380381)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 6380806)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 6380597)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 6380415)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 6380458)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 6380395)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2343 (class 2606 OID 529291)
-- Name: kose_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kose
    ADD CONSTRAINT kose_pkey PRIMARY KEY (id);


--
-- TOC entry 2464 (class 2606 OID 6380507)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 6380534)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 6380353)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 6380264)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2353 (class 2606 OID 4729421)
-- Name: oseba2popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba2popa
    ADD CONSTRAINT oseba2popa_pkey PRIMARY KEY (popa_id, oseba_id);


--
-- TOC entry 2379 (class 2606 OID 6380288)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 6380244)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2363 (class 2606 OID 6380229)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 6380540)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 6380573)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 6380716)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 6380317)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 6380341)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 6380513)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 692711)
-- Name: postninaslov_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslov
    ADD CONSTRAINT postninaslov_pkey PRIMARY KEY (id);


--
-- TOC entry 2394 (class 2606 OID 6380331)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 6380402)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 6380525)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 6380653)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 6380701)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 6380817)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 6380842)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 6380824)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 6380557)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 6380498)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 6380489)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 6380695)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 6380625)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2355 (class 2606 OID 6380200)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 6380564)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2361 (class 2606 OID 6380218)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2365 (class 2606 OID 6380238)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 6380582)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 6380520)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 6380470)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 6380866)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 6380854)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 6380848)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 6380638)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 6380297)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 6380480)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 6380684)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 6380837)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 6380366)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 6380213)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 6380747)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 6380424)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 6380548)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 6380616)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 6380453)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 6380729)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 2606 OID 6380609)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 1259 OID 6380446)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2512 (class 1259 OID 6380639)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2513 (class 1259 OID 6380640)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2386 (class 1259 OID 6380319)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2345 (class 1259 OID 692713)
-- Name: idx_1db842d610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d610389148 ON postninaslov USING btree (oseba_id);


--
-- TOC entry 2346 (class 1259 OID 692712)
-- Name: idx_1db842d6a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6a233cb39 ON postninaslov USING btree (klient_id);


--
-- TOC entry 2347 (class 1259 OID 692714)
-- Name: idx_1db842d6ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1db842d6ee4b985a ON postninaslov USING btree (drzava_id);


--
-- TOC entry 2477 (class 1259 OID 6380541)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2471 (class 1259 OID 6380527)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2472 (class 1259 OID 6380526)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2423 (class 1259 OID 6380425)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2499 (class 1259 OID 6380598)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2500 (class 1259 OID 6380600)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2501 (class 1259 OID 6380599)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2411 (class 1259 OID 6380397)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2412 (class 1259 OID 6380396)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2530 (class 1259 OID 6380718)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2531 (class 1259 OID 6380719)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2532 (class 1259 OID 6380720)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2539 (class 1259 OID 6380752)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2540 (class 1259 OID 6380749)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2541 (class 1259 OID 6380751)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2542 (class 1259 OID 6380750)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2401 (class 1259 OID 6380368)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2402 (class 1259 OID 6380367)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2350 (class 1259 OID 4729423)
-- Name: idx_4472a4c610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c610389148 ON oseba2popa USING btree (oseba_id);


--
-- TOC entry 2351 (class 1259 OID 4729422)
-- Name: idx_4472a4c66beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4472a4c66beede51 ON oseba2popa USING btree (popa_id);


--
-- TOC entry 2377 (class 1259 OID 6380291)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2487 (class 1259 OID 6380565)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2441 (class 1259 OID 6380459)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2367 (class 1259 OID 6380245)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2368 (class 1259 OID 6380246)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2492 (class 1259 OID 6380585)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2493 (class 1259 OID 6380584)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2494 (class 1259 OID 6380583)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2415 (class 1259 OID 6380403)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2416 (class 1259 OID 6380405)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2417 (class 1259 OID 6380404)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2577 (class 1259 OID 6380856)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2451 (class 1259 OID 6380493)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2452 (class 1259 OID 6380491)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2453 (class 1259 OID 6380490)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2454 (class 1259 OID 6380492)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2358 (class 1259 OID 6380219)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2359 (class 1259 OID 6380220)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2480 (class 1259 OID 6380549)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2466 (class 1259 OID 6380514)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2508 (class 1259 OID 6380626)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2509 (class 1259 OID 6380627)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2560 (class 1259 OID 6380807)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2561 (class 1259 OID 6380809)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2562 (class 1259 OID 6380808)
-- Name: idx_8787a0e5b3836ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5b3836ea9 ON enotaprograma USING btree (tip_programske_enote_id);


--
-- TOC entry 2390 (class 1259 OID 6380333)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2391 (class 1259 OID 6380332)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2392 (class 1259 OID 6380334)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2572 (class 1259 OID 6380843)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2516 (class 1259 OID 6380654)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2517 (class 1259 OID 6380655)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2552 (class 1259 OID 6380781)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2553 (class 1259 OID 6380783)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2554 (class 1259 OID 6380779)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2555 (class 1259 OID 6380782)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2556 (class 1259 OID 6380780)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2505 (class 1259 OID 6380617)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2457 (class 1259 OID 6380502)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2458 (class 1259 OID 6380501)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2459 (class 1259 OID 6380499)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2460 (class 1259 OID 6380500)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2341 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2548 (class 1259 OID 6380769)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2549 (class 1259 OID 6380768)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2563 (class 1259 OID 6380818)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2422 (class 1259 OID 6380416)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2373 (class 1259 OID 6380266)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2374 (class 1259 OID 6380265)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2382 (class 1259 OID 6380298)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2383 (class 1259 OID 6380299)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2446 (class 1259 OID 6380483)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 6380482)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2448 (class 1259 OID 6380481)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2566 (class 1259 OID 6380826)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2567 (class 1259 OID 6380825)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2429 (class 1259 OID 6380448)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2430 (class 1259 OID 6380444)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2431 (class 1259 OID 6380441)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2432 (class 1259 OID 6380442)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2433 (class 1259 OID 6380440)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2434 (class 1259 OID 6380445)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2435 (class 1259 OID 6380443)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2389 (class 1259 OID 6380318)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2407 (class 1259 OID 6380382)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2408 (class 1259 OID 6380384)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2409 (class 1259 OID 6380383)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2410 (class 1259 OID 6380385)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2465 (class 1259 OID 6380508)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2535 (class 1259 OID 6380717)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2543 (class 1259 OID 6380748)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2380 (class 1259 OID 6380289)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2381 (class 1259 OID 6380290)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2502 (class 1259 OID 6380610)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2583 (class 1259 OID 6380867)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2400 (class 1259 OID 6380354)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2580 (class 1259 OID 6380855)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2485 (class 1259 OID 6380559)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2486 (class 1259 OID 6380558)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2557 (class 1259 OID 6380778)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2344 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2397 (class 1259 OID 6380342)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2536 (class 1259 OID 6380730)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2528 (class 1259 OID 6380702)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2529 (class 1259 OID 6380703)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2366 (class 1259 OID 6380239)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2436 (class 1259 OID 6380447)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2609 (class 2606 OID 6381009)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2612 (class 2606 OID 6380994)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2611 (class 2606 OID 6380999)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2607 (class 2606 OID 6381019)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2613 (class 2606 OID 6380989)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2608 (class 2606 OID 6381014)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2610 (class 2606 OID 6381004)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2643 (class 2606 OID 6381164)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2642 (class 2606 OID 6381169)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2594 (class 2606 OID 6380924)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2630 (class 2606 OID 6381104)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2628 (class 2606 OID 6381099)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2629 (class 2606 OID 6381094)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2606 (class 2606 OID 6380984)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2638 (class 2606 OID 6381134)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2636 (class 2606 OID 6381144)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2637 (class 2606 OID 6381139)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2600 (class 2606 OID 6380959)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2601 (class 2606 OID 6380954)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2626 (class 2606 OID 6381084)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2649 (class 2606 OID 6381189)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2648 (class 2606 OID 6381194)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2647 (class 2606 OID 6381199)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2650 (class 2606 OID 6381219)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2653 (class 2606 OID 6381204)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2651 (class 2606 OID 6381214)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2652 (class 2606 OID 6381209)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2598 (class 2606 OID 6380949)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2599 (class 2606 OID 6380944)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2590 (class 2606 OID 6380909)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2591 (class 2606 OID 6380904)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2632 (class 2606 OID 6381114)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2614 (class 2606 OID 6381024)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2587 (class 2606 OID 6380884)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2586 (class 2606 OID 6380889)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2633 (class 2606 OID 6381129)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2634 (class 2606 OID 6381124)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2635 (class 2606 OID 6381119)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2604 (class 2606 OID 6380964)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2602 (class 2606 OID 6380974)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2603 (class 2606 OID 6380969)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2668 (class 2606 OID 6381294)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2618 (class 2606 OID 6381059)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2620 (class 2606 OID 6381049)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2621 (class 2606 OID 6381044)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2619 (class 2606 OID 6381054)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2585 (class 2606 OID 6380874)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2584 (class 2606 OID 6380879)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2631 (class 2606 OID 6381109)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2627 (class 2606 OID 6381089)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2641 (class 2606 OID 6381154)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2640 (class 2606 OID 6381159)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2663 (class 2606 OID 6381259)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2661 (class 2606 OID 6381269)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2662 (class 2606 OID 6381264)
-- Name: fk_8787a0e5b3836ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5b3836ea9 FOREIGN KEY (tip_programske_enote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2596 (class 2606 OID 6380934)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2597 (class 2606 OID 6380929)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2595 (class 2606 OID 6380939)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2667 (class 2606 OID 6381289)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2645 (class 2606 OID 6381174)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2644 (class 2606 OID 6381179)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2658 (class 2606 OID 6381244)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2656 (class 2606 OID 6381254)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2660 (class 2606 OID 6381234)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2657 (class 2606 OID 6381249)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2659 (class 2606 OID 6381239)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2639 (class 2606 OID 6381149)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2622 (class 2606 OID 6381079)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2623 (class 2606 OID 6381074)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2625 (class 2606 OID 6381064)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2624 (class 2606 OID 6381069)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2654 (class 2606 OID 6381229)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2655 (class 2606 OID 6381224)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2664 (class 2606 OID 6381274)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2605 (class 2606 OID 6380979)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2646 (class 2606 OID 6381184)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2588 (class 2606 OID 6380899)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2589 (class 2606 OID 6380894)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2593 (class 2606 OID 6380914)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2592 (class 2606 OID 6380919)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2615 (class 2606 OID 6381039)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2616 (class 2606 OID 6381034)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2617 (class 2606 OID 6381029)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2665 (class 2606 OID 6381284)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2666 (class 2606 OID 6381279)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-05 12:51:06 CEST

--
-- PostgreSQL database dump complete
--

