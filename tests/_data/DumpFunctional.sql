--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-05 08:47:26 CEST

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
-- TOC entry 180 (class 1259 OID 6316580)
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
-- TOC entry 227 (class 1259 OID 6317103)
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
-- TOC entry 226 (class 1259 OID 6317086)
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
-- TOC entry 219 (class 1259 OID 6316989)
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
-- TOC entry 194 (class 1259 OID 6316759)
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
-- TOC entry 197 (class 1259 OID 6316793)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6316702)
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
-- TOC entry 228 (class 1259 OID 6317117)
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
-- TOC entry 213 (class 1259 OID 6316919)
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
-- TOC entry 192 (class 1259 OID 6316739)
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
-- TOC entry 196 (class 1259 OID 6316787)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6316719)
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
-- TOC entry 202 (class 1259 OID 6316836)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6316861)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6316676)
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
-- TOC entry 181 (class 1259 OID 6316589)
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
-- TOC entry 182 (class 1259 OID 6316600)
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
-- TOC entry 177 (class 1259 OID 6316554)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6316573)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6316868)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6316899)
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
-- TOC entry 223 (class 1259 OID 6317037)
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
-- TOC entry 184 (class 1259 OID 6316633)
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
-- TOC entry 186 (class 1259 OID 6316668)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6316842)
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
-- TOC entry 185 (class 1259 OID 6316653)
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
-- TOC entry 191 (class 1259 OID 6316731)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6316854)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6316974)
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
-- TOC entry 222 (class 1259 OID 6317029)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6317143)
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
-- TOC entry 232 (class 1259 OID 6317171)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id integer NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 238 (class 1259 OID 6317205)
-- Name: programfestival_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programfestival_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 230 (class 1259 OID 6317152)
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
-- TOC entry 236 (class 1259 OID 6317201)
-- Name: programgostovanje_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programgostovanje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 209 (class 1259 OID 6316883)
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
-- TOC entry 201 (class 1259 OID 6316827)
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
-- TOC entry 200 (class 1259 OID 6316817)
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
-- TOC entry 221 (class 1259 OID 6317018)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6316951)
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
-- TOC entry 174 (class 1259 OID 6316525)
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
-- TOC entry 173 (class 1259 OID 6316523)
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
-- TOC entry 210 (class 1259 OID 6316893)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6316563)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6316547)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6316907)
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
-- TOC entry 204 (class 1259 OID 6316848)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6316798)
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
-- TOC entry 235 (class 1259 OID 6317190)
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
-- TOC entry 234 (class 1259 OID 6317182)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 6317177)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6316961)
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
-- TOC entry 183 (class 1259 OID 6316625)
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
-- TOC entry 199 (class 1259 OID 6316804)
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
-- TOC entry 220 (class 1259 OID 6317007)
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
-- TOC entry 231 (class 1259 OID 6317160)
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
-- TOC entry 237 (class 1259 OID 6317203)
-- Name: tipprogramskeenote_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipprogramskeenote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 188 (class 1259 OID 6316688)
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
-- TOC entry 175 (class 1259 OID 6316534)
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
-- TOC entry 225 (class 1259 OID 6317064)
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
-- TOC entry 193 (class 1259 OID 6316750)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6316875)
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
-- TOC entry 215 (class 1259 OID 6316944)
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
-- TOC entry 195 (class 1259 OID 6316782)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6317054)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 6316934)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2174 (class 2604 OID 6316528)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2786 (class 0 OID 6316580)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2833 (class 0 OID 6317103)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5571-45fd-1bc0-3cae571dbcf0	000d0000-5571-45fd-0334-8b1cbe7a75ba	\N	00090000-5571-45fd-e02c-c78d6f862013	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5571-45fd-2573-830bf6fd67b7	000d0000-5571-45fd-2598-f780c0c56eec	\N	00090000-5571-45fd-5f3d-54471999d52f	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5571-45fd-90de-54c514d9934b	000d0000-5571-45fd-1929-daeb80423b80	\N	00090000-5571-45fd-2704-370c4bd182c5	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5571-45fd-3363-386794a0239d	000d0000-5571-45fd-32d1-354a4977a0fa	\N	00090000-5571-45fd-27f7-4c64affabc03	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5571-45fd-93d2-4f8fb7c5f280	000d0000-5571-45fd-58f4-d04f046483f9	\N	00090000-5571-45fd-a9d6-5c1d3ddc701c	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5571-45fd-b1a0-c659de730e1c	000d0000-5571-45fd-5f54-7aec95e0d986	\N	00090000-5571-45fd-5f3d-54471999d52f	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2832 (class 0 OID 6317086)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 6316989)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5571-45fd-cb8f-9dd3f4245796	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	5	Milan Jesih	\N	\N	\N
00160000-5571-45fd-9488-6be8934b169d	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	1	Vladimir Levstik	\N	\N	\N
00160000-5571-45fd-3c8c-f4229cf3b6bf	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8	8		\N	\N	\N
\.


--
-- TOC entry 2800 (class 0 OID 6316759)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5571-45fd-0c19-54adc98b4acb	\N	\N	00200000-5571-45fd-299d-8629f9cdbdab	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5571-45fd-f894-ce1d114e1930	\N	\N	00200000-5571-45fd-25e2-d1c22c249018	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5571-45fd-f086-e1b100c2c645	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5571-45fd-7875-ebd2e46b1555	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5571-45fd-68dd-9f048db28ec4	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2803 (class 0 OID 6316793)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2795 (class 0 OID 6316702)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5571-45fc-b759-07a136cc0003	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5571-45fc-3665-8d9ee3fee68d	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5571-45fc-a9c7-8ae95b5f87b8	AL	ALB	008	Albania 	Albanija	\N
00040000-5571-45fc-9760-6c376183ba3b	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5571-45fc-3b6d-6477518e066a	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5571-45fc-c8e5-d9246fb344e0	AD	AND	020	Andorra 	Andora	\N
00040000-5571-45fc-5920-065a346002c8	AO	AGO	024	Angola 	Angola	\N
00040000-5571-45fc-9fd6-71d85212081a	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5571-45fc-125c-7c82a034b040	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5571-45fc-6fc6-18f054eb05bd	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5571-45fc-35c9-7ba4f62aaf34	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5571-45fc-8a06-d4bc94864cbb	AM	ARM	051	Armenia 	Armenija	\N
00040000-5571-45fc-0ad6-09d6f8ff6419	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5571-45fc-ca0d-0c8b57af7179	AU	AUS	036	Australia 	Avstralija	\N
00040000-5571-45fc-d1ce-cc4313b07c18	AT	AUT	040	Austria 	Avstrija	\N
00040000-5571-45fc-cee0-861b0c01ff19	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5571-45fc-0270-f4c5d3befc03	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5571-45fc-354a-1d8f0b1adc04	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5571-45fc-4dac-3dc6238b7d8e	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5571-45fc-33e9-2e500f405f0b	BB	BRB	052	Barbados 	Barbados	\N
00040000-5571-45fc-0b51-a9290d24f6cf	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5571-45fc-e9ec-8f30665a2b94	BE	BEL	056	Belgium 	Belgija	\N
00040000-5571-45fc-b112-8149f672e324	BZ	BLZ	084	Belize 	Belize	\N
00040000-5571-45fc-faf4-b1defd0113b8	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5571-45fc-8e51-8fc894edc91c	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5571-45fc-35e5-e937286e393a	BT	BTN	064	Bhutan 	Butan	\N
00040000-5571-45fc-eb1d-6bc4f3071f54	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5571-45fc-e453-76bf1f78beb7	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5571-45fc-0c2c-a7684e55b7bb	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5571-45fc-d923-b440310b766a	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5571-45fc-36f5-d60c7c6f46d6	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5571-45fc-254c-2f3ffdec2a0a	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5571-45fc-813f-5634290f6934	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5571-45fc-6db9-262e9c798ea5	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5571-45fc-3a94-f8fd6d015538	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5571-45fc-42d2-083e433ff425	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5571-45fc-2125-97b6095274c7	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5571-45fc-0d1e-4bbdf7c313f6	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5571-45fc-63fd-1bcebcd3d3a6	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5571-45fc-777b-59f89910ace4	CA	CAN	124	Canada 	Kanada	\N
00040000-5571-45fc-67ee-9ae2b0aba71b	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5571-45fc-b522-dda0d9ee1d77	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5571-45fc-7b6f-738ec0b1faa6	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5571-45fc-da75-fba83cab4f47	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5571-45fc-7366-acad26553b01	CL	CHL	152	Chile 	Čile	\N
00040000-5571-45fc-d013-7e2e84bb1eca	CN	CHN	156	China 	Kitajska	\N
00040000-5571-45fc-57ea-f90ceb3fd96d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5571-45fc-9b4f-a90732fba1af	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5571-45fc-3b95-8925783c3380	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5571-45fc-9483-7d597cc9cef0	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5571-45fc-daf8-6f21c221393f	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5571-45fc-bdee-db6268f7ef37	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5571-45fc-99b1-a1a57cdd31a6	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5571-45fc-d3c8-1c109d248a3d	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5571-45fc-3d79-c139b575f374	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5571-45fc-8f33-0058dad92ea1	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5571-45fc-183b-fd6476cf31ec	CU	CUB	192	Cuba 	Kuba	\N
00040000-5571-45fc-9a97-2aef9b9a3b5e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5571-45fc-5ca7-bb155bebe2c3	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5571-45fc-7967-6cda81581816	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5571-45fc-252f-bed2b35ddcac	DK	DNK	208	Denmark 	Danska	\N
00040000-5571-45fc-69de-1bb40ba9199e	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5571-45fc-516e-80861ea1dbd5	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5571-45fc-e57b-e378033c6509	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5571-45fc-b655-94d7fc8e6b62	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5571-45fc-78e8-1906948e0363	EG	EGY	818	Egypt 	Egipt	\N
00040000-5571-45fc-2db9-a2aa63352f82	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5571-45fc-87db-f126c50eb0f6	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5571-45fc-309d-1567790362e2	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5571-45fc-62bb-1f9ebfd0c687	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5571-45fc-0889-2050b8abbaac	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5571-45fc-aac6-a838c29e6d0c	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5571-45fc-f0f1-0c6426f5448a	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5571-45fc-b443-d9f66de07da8	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5571-45fc-5bcc-6d16d6425458	FI	FIN	246	Finland 	Finska	\N
00040000-5571-45fc-63e0-0a414fd66cfd	FR	FRA	250	France 	Francija	\N
00040000-5571-45fc-590e-7b49646c4657	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5571-45fc-7a2b-9bdd117b2afa	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5571-45fc-b531-c8a690242847	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5571-45fc-8b53-b4f9cd96ed98	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5571-45fc-3878-d46e2c94504e	GA	GAB	266	Gabon 	Gabon	\N
00040000-5571-45fc-f99f-8143a6e7544b	GM	GMB	270	Gambia 	Gambija	\N
00040000-5571-45fc-fbbb-e3be970a94ef	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5571-45fc-6289-1e0d7196aa95	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5571-45fc-a237-110b09167521	GH	GHA	288	Ghana 	Gana	\N
00040000-5571-45fc-a48f-0f3edc03a943	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5571-45fc-d0f6-7bf135ab814b	GR	GRC	300	Greece 	Grčija	\N
00040000-5571-45fc-a22b-073e358adf6d	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5571-45fc-c39b-8d713961e595	GD	GRD	308	Grenada 	Grenada	\N
00040000-5571-45fc-47a8-976c18ecbb42	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5571-45fc-1835-1baaa429fc58	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5571-45fc-6adc-1c9ad7034808	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5571-45fc-2985-f638c6cd0b7b	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5571-45fc-f3aa-f8938fb6f620	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5571-45fc-e7f2-ccfa0bba9db2	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5571-45fc-66b5-83c6ae911e9c	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5571-45fc-639b-74ad97fb617e	HT	HTI	332	Haiti 	Haiti	\N
00040000-5571-45fc-7bb9-4b4a596dedf5	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5571-45fc-1675-c2f7de2a2678	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5571-45fc-b815-d7e97ee06fcb	HN	HND	340	Honduras 	Honduras	\N
00040000-5571-45fc-0fcc-a917427c8d4f	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5571-45fc-e3bd-fe4d688710a9	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5571-45fc-292a-88414ae20d55	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5571-45fc-9ae1-0e9df1b14564	IN	IND	356	India 	Indija	\N
00040000-5571-45fc-6141-1485e808e1e2	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5571-45fc-52bd-12ee3d4f103e	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5571-45fc-a0dc-1c91a6d7cdb1	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5571-45fc-3065-365ba49b504d	IE	IRL	372	Ireland 	Irska	\N
00040000-5571-45fc-3da9-b1c8dd04eac9	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5571-45fc-b75f-2a1467e3ea27	IL	ISR	376	Israel 	Izrael	\N
00040000-5571-45fc-3c68-a793e5bde467	IT	ITA	380	Italy 	Italija	\N
00040000-5571-45fc-b3c9-d046a0818195	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5571-45fc-c108-868154afbe2d	JP	JPN	392	Japan 	Japonska	\N
00040000-5571-45fc-998f-0b5544c5fb86	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5571-45fc-c40c-ed204ddd98d7	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5571-45fc-0423-7c0de6886c95	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5571-45fc-8793-50b3c0c9ed14	KE	KEN	404	Kenya 	Kenija	\N
00040000-5571-45fc-0fb3-8a3d35f162c5	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5571-45fc-bdf8-e8720c0c1d04	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5571-45fc-6599-4ecdea08eceb	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5571-45fc-6249-8ea21ae32920	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5571-45fc-4d6a-1227dc84fe63	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5571-45fc-ab40-b57e68a36d0c	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5571-45fc-ee73-f5f5f106537b	LV	LVA	428	Latvia 	Latvija	\N
00040000-5571-45fc-bece-c70c46b6f64c	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5571-45fc-df34-e2e057f90e19	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5571-45fc-9812-d640bb320f82	LR	LBR	430	Liberia 	Liberija	\N
00040000-5571-45fc-fd8f-afc473b0dbac	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5571-45fc-a5f9-3e38d8557d67	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5571-45fc-3788-23f41fd42523	LT	LTU	440	Lithuania 	Litva	\N
00040000-5571-45fc-acd7-b229437551cd	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5571-45fc-dfb3-0d6f06cab4f0	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5571-45fc-7acd-7c880fe10a98	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5571-45fc-fac8-3591caec736a	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5571-45fc-1b6c-25e92c3ef53e	MW	MWI	454	Malawi 	Malavi	\N
00040000-5571-45fc-7403-54d962da245e	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5571-45fc-8c1a-125943dfcbe4	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5571-45fc-970a-3236480594a9	ML	MLI	466	Mali 	Mali	\N
00040000-5571-45fc-225b-a6160995700a	MT	MLT	470	Malta 	Malta	\N
00040000-5571-45fc-76d9-2a04c8aba5e4	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5571-45fc-1ce9-9f511d848668	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5571-45fc-0037-116ce9c95a13	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5571-45fc-b5a1-0fe94de36d23	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5571-45fc-a26c-aaa84ceca002	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5571-45fc-ffed-cb9b8773fc57	MX	MEX	484	Mexico 	Mehika	\N
00040000-5571-45fc-ea5c-f95a6e67e83a	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5571-45fc-267f-2b9326408af8	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5571-45fc-b77d-8d4cb1bbd4b1	MC	MCO	492	Monaco 	Monako	\N
00040000-5571-45fc-9147-96063f892779	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5571-45fc-06e6-f0ac17190b25	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5571-45fc-77cb-774d325119f1	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5571-45fc-1377-3a99679ede3f	MA	MAR	504	Morocco 	Maroko	\N
00040000-5571-45fc-6f95-590ed118d04c	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5571-45fc-b462-9572d711c3f0	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5571-45fc-3059-b4fb74487019	NA	NAM	516	Namibia 	Namibija	\N
00040000-5571-45fc-d6ca-72f0b3e007eb	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5571-45fc-abcb-a99542b6ee73	NP	NPL	524	Nepal 	Nepal	\N
00040000-5571-45fc-6b2e-f9c1b23155be	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5571-45fc-ef9b-fc96eade81b8	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5571-45fc-3891-5a926ea4fdab	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5571-45fc-6d27-707d5388dd1e	NE	NER	562	Niger 	Niger 	\N
00040000-5571-45fc-606b-495308569d11	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5571-45fc-baef-1df07b3bebc6	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5571-45fc-9d98-af3a18040ab5	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5571-45fc-56a2-a737623e4110	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5571-45fc-a5a5-d4728b050ad7	NO	NOR	578	Norway 	Norveška	\N
00040000-5571-45fc-804e-d281db3efc6f	OM	OMN	512	Oman 	Oman	\N
00040000-5571-45fc-1a23-30d4b4f645c0	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5571-45fc-df6e-9c473cebbd2f	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5571-45fc-5c00-d6d49ecdc7a6	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5571-45fc-f137-5ffa5d8ca807	PA	PAN	591	Panama 	Panama	\N
00040000-5571-45fc-6cef-4583b0f568a2	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5571-45fc-df45-94d3f2a45ecc	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5571-45fc-344d-337e07e9af9c	PE	PER	604	Peru 	Peru	\N
00040000-5571-45fc-00c8-571dbed8dc62	PH	PHL	608	Philippines 	Filipini	\N
00040000-5571-45fc-a503-36a228e33411	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5571-45fc-5b70-b960e53df9ae	PL	POL	616	Poland 	Poljska	\N
00040000-5571-45fc-ff45-3f254933e495	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5571-45fc-8b18-f96f7b0b1255	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5571-45fc-6ca4-0fd2fac9f210	QA	QAT	634	Qatar 	Katar	\N
00040000-5571-45fc-0715-2d6e6b3141fb	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5571-45fc-e471-8824837b54b2	RO	ROU	642	Romania 	Romunija	\N
00040000-5571-45fc-6c58-48eb054a4bea	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5571-45fc-a09d-652485aa9712	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5571-45fc-9fa3-fc81216c1d3e	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5571-45fc-32a6-84a2619c61c1	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5571-45fc-4776-0e4ca447c816	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5571-45fc-e08e-cd71daaf8c6c	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5571-45fc-e639-004b815d0e51	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5571-45fc-bee3-ebb23d2a1ae5	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5571-45fc-742c-43b035ad409f	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5571-45fc-6ea1-f54ff20039b1	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5571-45fc-b9c4-1fb55aae8711	SM	SMR	674	San Marino 	San Marino	\N
00040000-5571-45fc-41ee-bb6f7a7747e6	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5571-45fc-e9c4-ebfaa81a5b5f	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5571-45fc-b1ad-3df55f8f2982	SN	SEN	686	Senegal 	Senegal	\N
00040000-5571-45fc-f1df-dae974336984	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5571-45fc-6fa0-339941ed2ab6	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5571-45fc-527d-541bb78da001	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5571-45fc-cf71-3d12f3d7b6ed	SG	SGP	702	Singapore 	Singapur	\N
00040000-5571-45fc-1b69-7c51a4ba1664	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5571-45fc-74fa-bb6980ece7a6	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5571-45fc-c191-7538d53f1277	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5571-45fc-435d-660ecaadfab9	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5571-45fc-58a8-0aab668a41d4	SO	SOM	706	Somalia 	Somalija	\N
00040000-5571-45fc-6552-4a2f7ee7ece9	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5571-45fc-076f-eea6d5202db4	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5571-45fc-4e41-87838142926f	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5571-45fc-88b5-73420e17e90f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5571-45fc-ae69-982aecabf6d2	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5571-45fc-7914-2b4f9ba4c22a	SD	SDN	729	Sudan 	Sudan	\N
00040000-5571-45fc-17f8-337033d8e925	SR	SUR	740	Suriname 	Surinam	\N
00040000-5571-45fc-522e-c58d07c42829	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5571-45fc-8336-5103e98d265c	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5571-45fc-fb43-7841149d8576	SE	SWE	752	Sweden 	Švedska	\N
00040000-5571-45fc-8bfa-5962840e77b3	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5571-45fc-ffc5-f6b49eba023b	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5571-45fc-866a-7e53bf3c91b7	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5571-45fc-edd0-f8fb15160d60	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5571-45fc-6605-043837ce5f96	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5571-45fc-8a6a-0743263caab8	TH	THA	764	Thailand 	Tajska	\N
00040000-5571-45fc-a607-155294a73f7a	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5571-45fc-b39a-590de380d6d3	TG	TGO	768	Togo 	Togo	\N
00040000-5571-45fc-40f5-d5fdacc0dfad	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5571-45fc-a822-0af88d0184bc	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5571-45fc-fe53-e1db42d669a4	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5571-45fc-75f8-64f204b6c1cd	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5571-45fc-a14d-1fd982dfb94c	TR	TUR	792	Turkey 	Turčija	\N
00040000-5571-45fc-537b-e9304cb8d88a	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5571-45fc-d958-980730e2a078	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5571-45fc-5463-cffd2232f0ee	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5571-45fc-589e-95b4d79e72be	UG	UGA	800	Uganda 	Uganda	\N
00040000-5571-45fc-7930-25a8649f8e76	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5571-45fc-2311-e6c8b218a16a	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5571-45fc-5366-9e6d01887978	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5571-45fc-0220-80a9f0ac7f5c	US	USA	840	United States 	Združene države Amerike	\N
00040000-5571-45fc-fc21-8bed5f9f4390	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5571-45fc-e1ac-88c479cd6fe7	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5571-45fc-4fe4-efe7b920eb87	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5571-45fc-c69a-33ed31e58562	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5571-45fc-1e8e-6dccff04a960	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5571-45fc-6a64-2c61a51183cb	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5571-45fc-9fb3-ed7da8567849	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5571-45fc-d525-79a01f688a7e	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5571-45fc-5241-f280faed10cb	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5571-45fc-8cb5-1e37006ed877	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5571-45fc-0aae-4437a87d3529	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5571-45fc-5fba-5473879889e6	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5571-45fc-99a5-956816b0dd35	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2834 (class 0 OID 6317117)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, tip_programske_enote_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tip) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 6316919)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5571-45fd-fa02-132a680a0039	000e0000-5571-45fd-5322-617d42417968	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5571-45fc-4f9c-ab53f7446914
000d0000-5571-45fd-0334-8b1cbe7a75ba	000e0000-5571-45fd-5322-617d42417968	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5571-45fc-4f9c-ab53f7446914
000d0000-5571-45fd-2598-f780c0c56eec	000e0000-5571-45fd-5322-617d42417968	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5571-45fc-6f81-e6d9c8f8f7b5
000d0000-5571-45fd-1929-daeb80423b80	000e0000-5571-45fd-5322-617d42417968	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5571-45fc-83bb-0e86440f2727
000d0000-5571-45fd-32d1-354a4977a0fa	000e0000-5571-45fd-5322-617d42417968	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5571-45fc-83bb-0e86440f2727
000d0000-5571-45fd-58f4-d04f046483f9	000e0000-5571-45fd-5322-617d42417968	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5571-45fc-83bb-0e86440f2727
000d0000-5571-45fd-5f54-7aec95e0d986	000e0000-5571-45fd-5322-617d42417968	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5571-45fc-4f9c-ab53f7446914
\.


--
-- TOC entry 2798 (class 0 OID 6316739)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2802 (class 0 OID 6316787)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2796 (class 0 OID 6316719)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00000000-5571-45fd-f296-6756995ab641	00080000-5571-45fd-ed08-025e2824c3c3	00090000-5571-45fd-e02c-c78d6f862013	AK		
\.


--
-- TOC entry 2776 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2808 (class 0 OID 6316836)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2812 (class 0 OID 6316861)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2793 (class 0 OID 6316676)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5571-45fd-fe79-3177dffdea28	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5571-45fd-9ed9-c49c33f8cdbc	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5571-45fd-a0a5-c4b4676cccd9	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5571-45fd-b710-c19282370e1d	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5571-45fd-638f-5a7c4a55ef32	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5571-45fd-ffe7-d06d57db143d	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5571-45fd-bd20-30ce184c13a7	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5571-45fd-0b64-dad599b80cc4	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5571-45fd-5bd9-4cb56131ddf6	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5571-45fd-1fa3-18c6fdc5318c	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5571-45fd-6685-49748edf9ddb	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5571-45fd-727a-6e533666dc21	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5571-45fd-973f-69d5c225aaca	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5571-45fd-210c-ddcb95f7884d	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5571-45fd-a69b-248c5802a4d4	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5571-45fd-047d-d5f1ce84dd8a	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2787 (class 0 OID 6316589)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5571-45fd-9eef-00907d2fe1ae	00000000-5571-45fd-638f-5a7c4a55ef32	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5571-45fd-c534-e81b495b0016	00000000-5571-45fd-638f-5a7c4a55ef32	00010000-5571-45fd-bbd2-bad5c96a6172	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5571-45fd-2787-6416fae83e89	00000000-5571-45fd-ffe7-d06d57db143d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2788 (class 0 OID 6316600)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5571-45fd-7a44-9749e1404512	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5571-45fd-27f7-4c64affabc03	00010000-5571-45fd-3e08-5e16a3711e5b	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5571-45fd-2704-370c4bd182c5	00010000-5571-45fd-2515-07ce4ad559b3	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5571-45fd-0d30-e1f83d9dea26	00010000-5571-45fd-f7cf-99a8f551a746	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5571-45fd-9b23-20c072c19d5c	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5571-45fd-3988-95cce3a5e9ca	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5571-45fd-c51f-cbf7744bb821	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5571-45fd-ad6e-a9e9c9378a1b	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5571-45fd-e02c-c78d6f862013	00010000-5571-45fd-8f03-860da9aa5907	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5571-45fd-5f3d-54471999d52f	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5571-45fd-4c9b-5f3275ef84f4	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5571-45fd-a9d6-5c1d3ddc701c	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5571-45fd-b210-189ae2cd3946	00010000-5571-45fd-b919-cadce7516d19	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2778 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2783 (class 0 OID 6316554)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5571-45fc-bccc-42af23508db1	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5571-45fc-1e69-46e56328eca6	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5571-45fc-010c-11f5b3dfb810	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5571-45fc-b8c5-4ae1ca961c4f	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5571-45fc-9183-c4bbacb85278	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5571-45fc-ebc3-dbb3dc997dd4	Abonma-read	Abonma - branje	f
00030000-5571-45fc-178f-1bbd2c899dd9	Abonma-write	Abonma - spreminjanje	f
00030000-5571-45fc-64ff-1268a3c3ddc9	Alternacija-read	Alternacija - branje	f
00030000-5571-45fc-3eb9-1db4d49adbb6	Alternacija-write	Alternacija - spreminjanje	f
00030000-5571-45fc-808e-c765af6f8e03	Arhivalija-read	Arhivalija - branje	f
00030000-5571-45fc-244c-12c27e719707	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5571-45fc-c9a2-59aae3daf9c3	Besedilo-read	Besedilo - branje	f
00030000-5571-45fc-5f27-ac9043c1f52c	Besedilo-write	Besedilo - spreminjanje	f
00030000-5571-45fc-2d40-3b096b02b00b	DogodekIzven-read	DogodekIzven - branje	f
00030000-5571-45fc-5858-c36905253f02	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5571-45fc-bc6b-c943ebddcf9c	Dogodek-read	Dogodek - branje	f
00030000-5571-45fc-c537-2dec0b3ec988	Dogodek-write	Dogodek - spreminjanje	f
00030000-5571-45fc-06d2-ed56a786c4cd	Drzava-read	Drzava - branje	f
00030000-5571-45fc-fe11-a268c4c30744	Drzava-write	Drzava - spreminjanje	f
00030000-5571-45fc-3568-f3ad4b9ff158	Funkcija-read	Funkcija - branje	f
00030000-5571-45fc-2fdd-70c2434eba5a	Funkcija-write	Funkcija - spreminjanje	f
00030000-5571-45fc-6607-9b0f5160a6e6	Gostovanje-read	Gostovanje - branje	f
00030000-5571-45fc-ceb6-cbbbf643cd28	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5571-45fc-4d33-344d956cd508	Gostujoca-read	Gostujoca - branje	f
00030000-5571-45fc-6a52-2d1e2dcc997a	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5571-45fc-85f8-245132fea970	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5571-45fc-ea22-8b98892f77fb	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5571-45fc-5fd1-92cbe5f972f4	Kupec-read	Kupec - branje	f
00030000-5571-45fc-b317-0d055410a216	Kupec-write	Kupec - spreminjanje	f
00030000-5571-45fc-8c15-c2d414abf760	NacinPlacina-read	NacinPlacina - branje	f
00030000-5571-45fc-942a-cf14adc06ac1	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5571-45fc-4028-cda423d04d1d	Option-read	Option - branje	f
00030000-5571-45fc-38d6-b61c75722b1e	Option-write	Option - spreminjanje	f
00030000-5571-45fc-31ad-f655e961cc3e	OptionValue-read	OptionValue - branje	f
00030000-5571-45fc-cfe6-a360de014700	OptionValue-write	OptionValue - spreminjanje	f
00030000-5571-45fc-467a-fb26e8821c6f	Oseba-read	Oseba - branje	f
00030000-5571-45fc-6dd9-9ee87a70c1cd	Oseba-write	Oseba - spreminjanje	f
00030000-5571-45fc-be10-ca96a606b50f	Permission-read	Permission - branje	f
00030000-5571-45fc-cbf3-dfe715a8e9ab	Permission-write	Permission - spreminjanje	f
00030000-5571-45fc-714a-6a76b76cd4e0	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5571-45fc-ebaf-078bb0d579e9	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5571-45fc-3dfa-a576a49aa4a2	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5571-45fc-e56c-d900db18a84f	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5571-45fc-4e45-8dd4cafa21c5	Pogodba-read	Pogodba - branje	f
00030000-5571-45fc-c852-b78c26cad76f	Pogodba-write	Pogodba - spreminjanje	f
00030000-5571-45fc-d5b2-92ec91120e1c	Popa-read	Popa - branje	f
00030000-5571-45fc-817b-bef8161ddd4f	Popa-write	Popa - spreminjanje	f
00030000-5571-45fc-8c5c-9c1643440ad3	Posta-read	Posta - branje	f
00030000-5571-45fc-cf47-c12730e83f21	Posta-write	Posta - spreminjanje	f
00030000-5571-45fc-c283-60a037d037d0	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5571-45fc-14d8-eeaae9cc6b2a	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5571-45fc-45f9-085d12b8323b	PostniNaslov-read	PostniNaslov - branje	f
00030000-5571-45fc-654f-9e8bf12ec1f0	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5571-45fc-7a0c-9fc22b2bbd7c	Predstava-read	Predstava - branje	f
00030000-5571-45fc-d4e6-76ba80f17e7b	Predstava-write	Predstava - spreminjanje	f
00030000-5571-45fc-47ce-b7f8eb8a525c	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5571-45fc-d748-31511d04ccad	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5571-45fc-24ab-e69d9e5cce5c	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5571-45fc-36f1-0c7f3dc681f8	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5571-45fc-6b63-758a3d225980	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5571-45fc-b104-09c3fb2e56a3	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5571-45fc-706b-ccc51365ca15	Prostor-read	Prostor - branje	f
00030000-5571-45fc-9e18-3feda16fa251	Prostor-write	Prostor - spreminjanje	f
00030000-5571-45fc-51f5-a3afa194bfb6	Racun-read	Racun - branje	f
00030000-5571-45fc-d58f-486e7c149762	Racun-write	Racun - spreminjanje	f
00030000-5571-45fc-9e46-32eb7fe095cb	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5571-45fc-e270-00bf20ef2484	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5571-45fc-cbac-fc4c492fc91c	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5571-45fc-c2e2-e7a7e9a69d0b	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5571-45fc-b478-6846c86b7d14	Rekvizit-read	Rekvizit - branje	f
00030000-5571-45fc-9415-05bcb3428705	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5571-45fc-9945-5861c4ecd76d	Revizija-read	Revizija - branje	f
00030000-5571-45fc-c704-b4018909a4f8	Revizija-write	Revizija - spreminjanje	f
00030000-5571-45fc-690d-1a39f963e372	Rezervacija-read	Rezervacija - branje	f
00030000-5571-45fc-6a4f-a80315299cec	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5571-45fc-ca94-ddaf22570cac	Role-read	Role - branje	f
00030000-5571-45fc-3be9-f89e65e7f746	Role-write	Role - spreminjanje	f
00030000-5571-45fc-cef5-9c526b8ec7a0	SedezniRed-read	SedezniRed - branje	f
00030000-5571-45fc-3ecc-c89da336e065	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5571-45fc-81db-7c70347a3195	Sedez-read	Sedez - branje	f
00030000-5571-45fc-548c-913cf09847ec	Sedez-write	Sedez - spreminjanje	f
00030000-5571-45fc-a734-6748875ad272	Sezona-read	Sezona - branje	f
00030000-5571-45fc-0e70-5173f9b62f8a	Sezona-write	Sezona - spreminjanje	f
00030000-5571-45fc-bca8-868556f2ad43	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5571-45fc-fb81-4755cb77ad1f	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5571-45fc-d08e-731201350874	Stevilcenje-read	Stevilcenje - branje	f
00030000-5571-45fc-6c40-2836c1bb81b0	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5571-45fc-69b7-d27bbef695e6	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5571-45fc-2203-a063f7e05219	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5571-45fc-6329-7de546b5532e	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5571-45fc-1b83-07afa59e7cd4	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5571-45fc-8090-9dc9e8314ac6	Telefonska-read	Telefonska - branje	f
00030000-5571-45fc-1ebc-022413e68062	Telefonska-write	Telefonska - spreminjanje	f
00030000-5571-45fc-58e5-9ba4e25e3a1f	TerminStoritve-read	TerminStoritve - branje	f
00030000-5571-45fc-7c60-8c19ff706c9d	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5571-45fc-17cf-3fce8c84432e	TipFunkcije-read	TipFunkcije - branje	f
00030000-5571-45fc-7c0e-fda34b422d4c	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5571-45fc-c461-2e5f24348d74	Trr-read	Trr - branje	f
00030000-5571-45fc-461c-177941f89673	Trr-write	Trr - spreminjanje	f
00030000-5571-45fc-f140-2ecd783ddff4	Uprizoritev-read	Uprizoritev - branje	f
00030000-5571-45fc-d1f8-160542a15619	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5571-45fc-d772-f1528c402947	User-read	User - branje	f
00030000-5571-45fc-d8a9-0eb4b7caec68	User-write	User - spreminjanje	f
00030000-5571-45fc-236d-338d87a07589	Vaja-read	Vaja - branje	f
00030000-5571-45fc-a2af-c38db0881f9a	Vaja-write	Vaja - spreminjanje	f
00030000-5571-45fc-2da0-7ef3f9a8dbd9	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5571-45fc-44a9-495ab1d49575	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5571-45fc-7b4e-c1ebff142706	Zaposlitev-read	Zaposlitev - branje	f
00030000-5571-45fc-1c66-cdf58ada47dc	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5571-45fc-e1a8-944303e59292	Zasedenost-read	Zasedenost - branje	f
00030000-5571-45fc-2823-d82937cc4bc9	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5571-45fc-9d60-d9092c3d1128	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5571-45fc-88bb-da4e40b7ae82	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5571-45fc-4de7-3e875cda80eb	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5571-45fc-c486-d7b2f493aeec	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2785 (class 0 OID 6316573)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5571-45fc-3254-a952aafe24fc	00030000-5571-45fc-06d2-ed56a786c4cd
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-ebc3-dbb3dc997dd4
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-178f-1bbd2c899dd9
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-64ff-1268a3c3ddc9
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-3eb9-1db4d49adbb6
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-808e-c765af6f8e03
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-bc6b-c943ebddcf9c
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-b8c5-4ae1ca961c4f
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-c537-2dec0b3ec988
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-06d2-ed56a786c4cd
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-fe11-a268c4c30744
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-3568-f3ad4b9ff158
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-2fdd-70c2434eba5a
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-6607-9b0f5160a6e6
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-ceb6-cbbbf643cd28
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-4d33-344d956cd508
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-6a52-2d1e2dcc997a
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-85f8-245132fea970
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-ea22-8b98892f77fb
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-4028-cda423d04d1d
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-31ad-f655e961cc3e
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-467a-fb26e8821c6f
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-6dd9-9ee87a70c1cd
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-d5b2-92ec91120e1c
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-817b-bef8161ddd4f
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-8c5c-9c1643440ad3
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-cf47-c12730e83f21
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-45f9-085d12b8323b
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-654f-9e8bf12ec1f0
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-7a0c-9fc22b2bbd7c
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-d4e6-76ba80f17e7b
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-6b63-758a3d225980
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-b104-09c3fb2e56a3
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-706b-ccc51365ca15
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-9e18-3feda16fa251
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-cbac-fc4c492fc91c
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-c2e2-e7a7e9a69d0b
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-b478-6846c86b7d14
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-9415-05bcb3428705
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-a734-6748875ad272
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-0e70-5173f9b62f8a
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-17cf-3fce8c84432e
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-f140-2ecd783ddff4
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-d1f8-160542a15619
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-236d-338d87a07589
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-a2af-c38db0881f9a
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-e1a8-944303e59292
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-2823-d82937cc4bc9
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-9d60-d9092c3d1128
00020000-5571-45fc-80f8-2352170dceeb	00030000-5571-45fc-4de7-3e875cda80eb
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-ebc3-dbb3dc997dd4
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-808e-c765af6f8e03
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-bc6b-c943ebddcf9c
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-06d2-ed56a786c4cd
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-6607-9b0f5160a6e6
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-4d33-344d956cd508
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-85f8-245132fea970
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-ea22-8b98892f77fb
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-4028-cda423d04d1d
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-31ad-f655e961cc3e
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-467a-fb26e8821c6f
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-6dd9-9ee87a70c1cd
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-d5b2-92ec91120e1c
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-8c5c-9c1643440ad3
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-45f9-085d12b8323b
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-654f-9e8bf12ec1f0
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-7a0c-9fc22b2bbd7c
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-706b-ccc51365ca15
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-cbac-fc4c492fc91c
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-b478-6846c86b7d14
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-a734-6748875ad272
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-8090-9dc9e8314ac6
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-1ebc-022413e68062
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-c461-2e5f24348d74
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-461c-177941f89673
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-7b4e-c1ebff142706
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-1c66-cdf58ada47dc
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-9d60-d9092c3d1128
00020000-5571-45fc-ef6f-bb4835569c04	00030000-5571-45fc-4de7-3e875cda80eb
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-ebc3-dbb3dc997dd4
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-64ff-1268a3c3ddc9
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-808e-c765af6f8e03
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-244c-12c27e719707
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-c9a2-59aae3daf9c3
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-2d40-3b096b02b00b
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-bc6b-c943ebddcf9c
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-06d2-ed56a786c4cd
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-3568-f3ad4b9ff158
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-6607-9b0f5160a6e6
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-4d33-344d956cd508
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-85f8-245132fea970
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-4028-cda423d04d1d
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-31ad-f655e961cc3e
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-467a-fb26e8821c6f
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-d5b2-92ec91120e1c
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-8c5c-9c1643440ad3
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-7a0c-9fc22b2bbd7c
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-6b63-758a3d225980
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-706b-ccc51365ca15
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-cbac-fc4c492fc91c
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-b478-6846c86b7d14
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-a734-6748875ad272
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-17cf-3fce8c84432e
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-236d-338d87a07589
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-e1a8-944303e59292
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-9d60-d9092c3d1128
00020000-5571-45fc-fe3f-e32b7b0d8e8b	00030000-5571-45fc-4de7-3e875cda80eb
00020000-5571-45fc-8a65-0c30da60bb26	00030000-5571-45fc-ebc3-dbb3dc997dd4
00020000-5571-45fc-8a65-0c30da60bb26	00030000-5571-45fc-178f-1bbd2c899dd9
00020000-5571-45fc-8a65-0c30da60bb26	00030000-5571-45fc-3eb9-1db4d49adbb6
00020000-5571-45fc-8a65-0c30da60bb26	00030000-5571-45fc-808e-c765af6f8e03
00020000-5571-45fc-8a65-0c30da60bb26	00030000-5571-45fc-bc6b-c943ebddcf9c
00020000-5571-45fc-8a65-0c30da60bb26	00030000-5571-45fc-06d2-ed56a786c4cd
00020000-5571-45fc-8a65-0c30da60bb26	00030000-5571-45fc-6607-9b0f5160a6e6
00020000-5571-45fc-8a65-0c30da60bb26	00030000-5571-45fc-4d33-344d956cd508
00020000-5571-45fc-8a65-0c30da60bb26	00030000-5571-45fc-4028-cda423d04d1d
00020000-5571-45fc-8a65-0c30da60bb26	00030000-5571-45fc-31ad-f655e961cc3e
00020000-5571-45fc-8a65-0c30da60bb26	00030000-5571-45fc-d5b2-92ec91120e1c
00020000-5571-45fc-8a65-0c30da60bb26	00030000-5571-45fc-8c5c-9c1643440ad3
00020000-5571-45fc-8a65-0c30da60bb26	00030000-5571-45fc-7a0c-9fc22b2bbd7c
00020000-5571-45fc-8a65-0c30da60bb26	00030000-5571-45fc-706b-ccc51365ca15
00020000-5571-45fc-8a65-0c30da60bb26	00030000-5571-45fc-cbac-fc4c492fc91c
00020000-5571-45fc-8a65-0c30da60bb26	00030000-5571-45fc-b478-6846c86b7d14
00020000-5571-45fc-8a65-0c30da60bb26	00030000-5571-45fc-a734-6748875ad272
00020000-5571-45fc-8a65-0c30da60bb26	00030000-5571-45fc-17cf-3fce8c84432e
00020000-5571-45fc-8a65-0c30da60bb26	00030000-5571-45fc-9d60-d9092c3d1128
00020000-5571-45fc-8a65-0c30da60bb26	00030000-5571-45fc-4de7-3e875cda80eb
00020000-5571-45fc-5407-b4f690bfc748	00030000-5571-45fc-ebc3-dbb3dc997dd4
00020000-5571-45fc-5407-b4f690bfc748	00030000-5571-45fc-808e-c765af6f8e03
00020000-5571-45fc-5407-b4f690bfc748	00030000-5571-45fc-bc6b-c943ebddcf9c
00020000-5571-45fc-5407-b4f690bfc748	00030000-5571-45fc-06d2-ed56a786c4cd
00020000-5571-45fc-5407-b4f690bfc748	00030000-5571-45fc-6607-9b0f5160a6e6
00020000-5571-45fc-5407-b4f690bfc748	00030000-5571-45fc-4d33-344d956cd508
00020000-5571-45fc-5407-b4f690bfc748	00030000-5571-45fc-4028-cda423d04d1d
00020000-5571-45fc-5407-b4f690bfc748	00030000-5571-45fc-31ad-f655e961cc3e
00020000-5571-45fc-5407-b4f690bfc748	00030000-5571-45fc-d5b2-92ec91120e1c
00020000-5571-45fc-5407-b4f690bfc748	00030000-5571-45fc-8c5c-9c1643440ad3
00020000-5571-45fc-5407-b4f690bfc748	00030000-5571-45fc-7a0c-9fc22b2bbd7c
00020000-5571-45fc-5407-b4f690bfc748	00030000-5571-45fc-706b-ccc51365ca15
00020000-5571-45fc-5407-b4f690bfc748	00030000-5571-45fc-cbac-fc4c492fc91c
00020000-5571-45fc-5407-b4f690bfc748	00030000-5571-45fc-b478-6846c86b7d14
00020000-5571-45fc-5407-b4f690bfc748	00030000-5571-45fc-a734-6748875ad272
00020000-5571-45fc-5407-b4f690bfc748	00030000-5571-45fc-58e5-9ba4e25e3a1f
00020000-5571-45fc-5407-b4f690bfc748	00030000-5571-45fc-010c-11f5b3dfb810
00020000-5571-45fc-5407-b4f690bfc748	00030000-5571-45fc-17cf-3fce8c84432e
00020000-5571-45fc-5407-b4f690bfc748	00030000-5571-45fc-9d60-d9092c3d1128
00020000-5571-45fc-5407-b4f690bfc748	00030000-5571-45fc-4de7-3e875cda80eb
\.


--
-- TOC entry 2813 (class 0 OID 6316868)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2817 (class 0 OID 6316899)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2829 (class 0 OID 6317037)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2790 (class 0 OID 6316633)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5571-45fd-ed08-025e2824c3c3	00040000-5571-45fc-b759-07a136cc0003	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5571-45fd-c09d-ff3539ded3ea	00040000-5571-45fc-b759-07a136cc0003	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5571-45fd-3df3-f04cd8b60441	00040000-5571-45fc-b759-07a136cc0003	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5571-45fd-d62a-68f48c49dfdc	00040000-5571-45fc-b759-07a136cc0003	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2792 (class 0 OID 6316668)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5571-45fc-f5a6-4773f10b4729	8341	Adlešiči
00050000-5571-45fc-fdd8-7936d95fe256	5270	Ajdovščina
00050000-5571-45fc-db7c-c8b99af3c826	6280	Ankaran/Ancarano
00050000-5571-45fc-c5e3-956751a72f5a	9253	Apače
00050000-5571-45fc-9397-ec29a2339545	8253	Artiče
00050000-5571-45fc-418d-8b9104e26d21	4275	Begunje na Gorenjskem
00050000-5571-45fc-bf3c-dbd29cd844d9	1382	Begunje pri Cerknici
00050000-5571-45fc-c7ec-be19d861c391	9231	Beltinci
00050000-5571-45fc-c5fe-d86fbeb9d4f4	2234	Benedikt
00050000-5571-45fc-04b2-22fea017f5ed	2345	Bistrica ob Dravi
00050000-5571-45fc-9f89-3912514a222a	3256	Bistrica ob Sotli
00050000-5571-45fc-9572-6bc8d0aa5ab8	8259	Bizeljsko
00050000-5571-45fc-3cba-49a1483e9146	1223	Blagovica
00050000-5571-45fc-7346-f7fd5d5c5ad3	8283	Blanca
00050000-5571-45fc-57ee-8600fb47872a	4260	Bled
00050000-5571-45fc-150c-64584e1ea385	4273	Blejska Dobrava
00050000-5571-45fc-396b-fe097940448b	9265	Bodonci
00050000-5571-45fc-a3a8-4f6020dd768e	9222	Bogojina
00050000-5571-45fc-dc5c-cc75c0dc1ed7	4263	Bohinjska Bela
00050000-5571-45fc-9591-7d89775bdb84	4264	Bohinjska Bistrica
00050000-5571-45fc-ee63-280c0d6cbf3f	4265	Bohinjsko jezero
00050000-5571-45fc-197c-f439e01aa580	1353	Borovnica
00050000-5571-45fc-7cc4-212d5cae865c	8294	Boštanj
00050000-5571-45fc-0551-9e997e55d2b1	5230	Bovec
00050000-5571-45fc-7d83-79da9a88145b	5295	Branik
00050000-5571-45fc-5090-30bdec26c3c3	3314	Braslovče
00050000-5571-45fc-bec7-217d116813ae	5223	Breginj
00050000-5571-45fc-1d42-c876c126d59c	8280	Brestanica
00050000-5571-45fc-b41d-90a13e5c616f	2354	Bresternica
00050000-5571-45fc-839a-d0b91e94ea6e	4243	Brezje
00050000-5571-45fc-e7cd-f5cd06cbd543	1351	Brezovica pri Ljubljani
00050000-5571-45fc-0253-6a4a9c042833	8250	Brežice
00050000-5571-45fc-41cb-6e042c1fce34	4210	Brnik - Aerodrom
00050000-5571-45fc-d971-c80d9e614483	8321	Brusnice
00050000-5571-45fc-e03b-fcd1503a11f0	3255	Buče
00050000-5571-45fc-a0cd-e8f3a5a254e6	8276	Bučka 
00050000-5571-45fc-dcf8-8d9cec2cc3cb	9261	Cankova
00050000-5571-45fc-d1b8-4141c51ed614	3000	Celje 
00050000-5571-45fc-3ee9-9dd08295db9c	3001	Celje - poštni predali
00050000-5571-45fc-0d90-f35f5ec05ba8	4207	Cerklje na Gorenjskem
00050000-5571-45fc-d890-daddf3b08032	8263	Cerklje ob Krki
00050000-5571-45fc-c09b-7874d186b85c	1380	Cerknica
00050000-5571-45fc-e724-4d959bfe9a36	5282	Cerkno
00050000-5571-45fc-f29f-4efe6d52978c	2236	Cerkvenjak
00050000-5571-45fc-2134-e56dfd0d30de	2215	Ceršak
00050000-5571-45fc-e96d-705de986ab73	2326	Cirkovce
00050000-5571-45fc-013e-1e074c7c3c91	2282	Cirkulane
00050000-5571-45fc-829c-773de04b1454	5273	Col
00050000-5571-45fc-aa26-d17ec70732ee	8251	Čatež ob Savi
00050000-5571-45fc-dae4-7b6cefe1ea16	1413	Čemšenik
00050000-5571-45fc-a317-32b2463293a2	5253	Čepovan
00050000-5571-45fc-45e9-2ad7bf0af3f6	9232	Črenšovci
00050000-5571-45fc-28ba-e28d109f99ed	2393	Črna na Koroškem
00050000-5571-45fc-4de2-d8e472cfb5ae	6275	Črni Kal
00050000-5571-45fc-b98b-b3eeda4dfde4	5274	Črni Vrh nad Idrijo
00050000-5571-45fc-2045-f69cc4120f78	5262	Črniče
00050000-5571-45fc-5cb4-175241722035	8340	Črnomelj
00050000-5571-45fc-4aa8-6cd61ab01c38	6271	Dekani
00050000-5571-45fc-a802-c6ea414146f8	5210	Deskle
00050000-5571-45fc-f1ec-6e7b9987bf46	2253	Destrnik
00050000-5571-45fc-ec93-3a126e05ef5d	6215	Divača
00050000-5571-45fc-36b4-e0cf933092eb	1233	Dob
00050000-5571-45fc-fb7f-815e679855d8	3224	Dobje pri Planini
00050000-5571-45fc-653d-5dcc4ce60a4c	8257	Dobova
00050000-5571-45fc-ed4c-c96b85893263	1423	Dobovec
00050000-5571-45fc-d034-e999d673967a	5263	Dobravlje
00050000-5571-45fc-3017-031e81d118f9	3204	Dobrna
00050000-5571-45fc-1866-11434da14432	8211	Dobrnič
00050000-5571-45fc-f5e1-5be577765f0d	1356	Dobrova
00050000-5571-45fc-3604-05d2c618273b	9223	Dobrovnik/Dobronak 
00050000-5571-45fc-0c30-795eec9d27f0	5212	Dobrovo v Brdih
00050000-5571-45fc-900b-8d44e1425ae3	1431	Dol pri Hrastniku
00050000-5571-45fc-f91d-ad3df2625498	1262	Dol pri Ljubljani
00050000-5571-45fc-62b1-9468805448fe	1273	Dole pri Litiji
00050000-5571-45fc-ccba-4aa75e37845e	1331	Dolenja vas
00050000-5571-45fc-bbac-c5285391c7d9	8350	Dolenjske Toplice
00050000-5571-45fc-bfc9-ca8570fd9ef2	1230	Domžale
00050000-5571-45fc-73ec-4b2b0baa9225	2252	Dornava
00050000-5571-45fc-005b-e35e4361bcff	5294	Dornberk
00050000-5571-45fc-34b3-17eade2575ce	1319	Draga
00050000-5571-45fc-4d55-6cf6f48b0901	8343	Dragatuš
00050000-5571-45fc-24fe-c97ea4008169	3222	Dramlje
00050000-5571-45fc-d244-5a4a83ab8e37	2370	Dravograd
00050000-5571-45fc-0733-e3a11d61e26e	4203	Duplje
00050000-5571-45fc-327f-253bcd5abb27	6221	Dutovlje
00050000-5571-45fc-63af-25264b463c86	8361	Dvor
00050000-5571-45fc-56e5-db731ab0cdfa	2343	Fala
00050000-5571-45fc-24be-800e16589ab9	9208	Fokovci
00050000-5571-45fc-5347-074f966eb94a	2313	Fram
00050000-5571-45fc-dce2-bfabaaf7956e	3213	Frankolovo
00050000-5571-45fc-b7aa-16de644d9367	1274	Gabrovka
00050000-5571-45fc-70bd-4df81f4f10be	8254	Globoko
00050000-5571-45fc-8740-bf8639e0911e	5275	Godovič
00050000-5571-45fc-6ad1-0ede812827ed	4204	Golnik
00050000-5571-45fc-0e8d-9e6e8c96053a	3303	Gomilsko
00050000-5571-45fc-95ff-6935a6b296c8	4224	Gorenja vas
00050000-5571-45fc-a274-ad0c921603bc	3263	Gorica pri Slivnici
00050000-5571-45fc-2783-b253e7204f9a	2272	Gorišnica
00050000-5571-45fc-8bf9-a4ed687e46f2	9250	Gornja Radgona
00050000-5571-45fc-9e52-d338d444f7bc	3342	Gornji Grad
00050000-5571-45fc-6878-68691f467b1a	4282	Gozd Martuljek
00050000-5571-45fc-9ba7-590b4aa965e9	6272	Gračišče
00050000-5571-45fc-6c63-b9614b0836ca	9264	Grad
00050000-5571-45fc-5316-8bca13da3978	8332	Gradac
00050000-5571-45fc-bc34-837ec24f05a2	1384	Grahovo
00050000-5571-45fc-2000-0a4aa99e5f4e	5242	Grahovo ob Bači
00050000-5571-45fc-236b-ad35f3723136	5251	Grgar
00050000-5571-45fc-0f25-10b639d165c8	3302	Griže
00050000-5571-45fc-4413-4c672f908077	3231	Grobelno
00050000-5571-45fc-30db-6abd6ea03ace	1290	Grosuplje
00050000-5571-45fc-6366-b9ed30d562d0	2288	Hajdina
00050000-5571-45fc-9a18-d60c135c484d	8362	Hinje
00050000-5571-45fc-90a8-83c1fc6a8117	2311	Hoče
00050000-5571-45fc-3f76-50d75348e143	9205	Hodoš/Hodos
00050000-5571-45fc-6297-0d28a7e07a56	1354	Horjul
00050000-5571-45fc-0003-92ed2534254a	1372	Hotedršica
00050000-5571-45fc-14cc-99aa7220d27f	1430	Hrastnik
00050000-5571-45fc-236e-725effadc2f9	6225	Hruševje
00050000-5571-45fc-68bf-3c0849f0c85d	4276	Hrušica
00050000-5571-45fc-8f7c-5118fc468781	5280	Idrija
00050000-5571-45fc-e3a4-d89f67075369	1292	Ig
00050000-5571-45fc-0c22-bbe04c13c08e	6250	Ilirska Bistrica
00050000-5571-45fc-31e4-528cb4ff6c2c	6251	Ilirska Bistrica-Trnovo
00050000-5571-45fc-0eaf-3ea41e428898	1295	Ivančna Gorica
00050000-5571-45fc-e470-eb7dde9787bb	2259	Ivanjkovci
00050000-5571-45fc-91c7-d18217f0c2b8	1411	Izlake
00050000-5571-45fc-745a-c56f7692d3bb	6310	Izola/Isola
00050000-5571-45fc-3d7c-64acc1e9fee0	2222	Jakobski Dol
00050000-5571-45fc-baa3-febb5befa59b	2221	Jarenina
00050000-5571-45fc-4ed8-175570d582c4	6254	Jelšane
00050000-5571-45fc-5667-50281f70bf00	4270	Jesenice
00050000-5571-45fc-e617-c8eab3deeb20	8261	Jesenice na Dolenjskem
00050000-5571-45fc-7a08-6987695a651b	3273	Jurklošter
00050000-5571-45fc-626a-6667fcf3f00d	2223	Jurovski Dol
00050000-5571-45fc-9952-6e0980d7b79a	2256	Juršinci
00050000-5571-45fc-ac04-ebd8d93c3b10	5214	Kal nad Kanalom
00050000-5571-45fc-0b38-7a53869800bc	3233	Kalobje
00050000-5571-45fc-e06f-b7c4c7ac7049	4246	Kamna Gorica
00050000-5571-45fc-c69b-ec1e0256c5b8	2351	Kamnica
00050000-5571-45fc-d751-3271ac1d2646	1241	Kamnik
00050000-5571-45fc-4eea-edf671e8c7b4	5213	Kanal
00050000-5571-45fc-f8d9-5254b6b5c726	8258	Kapele
00050000-5571-45fc-772a-21f0d78c596c	2362	Kapla
00050000-5571-45fc-9e58-bae5f59a134c	2325	Kidričevo
00050000-5571-45fc-2822-cd16c254b1ee	1412	Kisovec
00050000-5571-45fc-46c5-07a0cca8f364	6253	Knežak
00050000-5571-45fc-5188-22afd16c60d1	5222	Kobarid
00050000-5571-45fc-0606-892667343d1b	9227	Kobilje
00050000-5571-45fc-c801-e316ef05ed11	1330	Kočevje
00050000-5571-45fc-a47b-a51ef3b2ffff	1338	Kočevska Reka
00050000-5571-45fc-e7f7-b74015019a64	2276	Kog
00050000-5571-45fc-6439-1e7f8e825fff	5211	Kojsko
00050000-5571-45fc-fa36-e5d551af7971	6223	Komen
00050000-5571-45fc-fbca-3a1e696d0e88	1218	Komenda
00050000-5571-45fc-56e8-8653d7df9d03	6000	Koper/Capodistria 
00050000-5571-45fc-9115-71a1ef988940	6001	Koper/Capodistria - poštni predali
00050000-5571-45fc-62ff-e64eb8380acb	8282	Koprivnica
00050000-5571-45fc-51c9-534dc33c2ea6	5296	Kostanjevica na Krasu
00050000-5571-45fc-5ffb-a0df95740838	8311	Kostanjevica na Krki
00050000-5571-45fc-7e30-e8dda2e4403d	1336	Kostel
00050000-5571-45fc-672f-6f20489bed09	6256	Košana
00050000-5571-45fc-0496-3b1478cd9018	2394	Kotlje
00050000-5571-45fc-30da-e61a0cc54c25	6240	Kozina
00050000-5571-45fc-a2cf-d9014070b96f	3260	Kozje
00050000-5571-45fc-ad35-8fc1705f21c8	4000	Kranj 
00050000-5571-45fc-b8c2-41c69264dc58	4001	Kranj - poštni predali
00050000-5571-45fc-7994-b635e83496ac	4280	Kranjska Gora
00050000-5571-45fc-8973-af7b4b05b125	1281	Kresnice
00050000-5571-45fc-3af7-705d43dbcaf1	4294	Križe
00050000-5571-45fc-38c2-c6792bb31976	9206	Križevci
00050000-5571-45fc-1a2a-c767df855396	9242	Križevci pri Ljutomeru
00050000-5571-45fc-8f63-f1e3bb612e56	1301	Krka
00050000-5571-45fc-111c-74352b4dafbc	8296	Krmelj
00050000-5571-45fc-af90-8bd8cb867717	4245	Kropa
00050000-5571-45fc-1d59-25f03211241a	8262	Krška vas
00050000-5571-45fc-8e15-5e6e92df6898	8270	Krško
00050000-5571-45fc-82f3-049614c24517	9263	Kuzma
00050000-5571-45fc-aad3-dd01a8befcba	2318	Laporje
00050000-5571-45fc-2ecd-6746356ac446	3270	Laško
00050000-5571-45fc-24c0-602a8525cc16	1219	Laze v Tuhinju
00050000-5571-45fc-6fa6-301ff1e2c336	2230	Lenart v Slovenskih goricah
00050000-5571-45fc-22e5-15ff3712fa22	9220	Lendava/Lendva
00050000-5571-45fc-bde2-0070db71a45a	4248	Lesce
00050000-5571-45fc-7934-a43cd1a5557d	3261	Lesično
00050000-5571-45fc-1b97-2c64678b9da4	8273	Leskovec pri Krškem
00050000-5571-45fc-4b36-3deefaa26fc4	2372	Libeliče
00050000-5571-45fc-e61e-57648d781484	2341	Limbuš
00050000-5571-45fc-fc2f-51150be548cf	1270	Litija
00050000-5571-45fc-8760-ba3b980298e5	3202	Ljubečna
00050000-5571-45fc-9580-02d94e4b881e	1000	Ljubljana 
00050000-5571-45fc-ec01-f239826757e4	1001	Ljubljana - poštni predali
00050000-5571-45fc-d990-9fe6434fc711	1231	Ljubljana - Črnuče
00050000-5571-45fc-ef07-0120b1ca10c8	1261	Ljubljana - Dobrunje
00050000-5571-45fc-a434-51d151df9f32	1260	Ljubljana - Polje
00050000-5571-45fc-ee3f-c155c65ce3d7	1210	Ljubljana - Šentvid
00050000-5571-45fc-90dd-da2cecb2cf44	1211	Ljubljana - Šmartno
00050000-5571-45fc-6d4f-471d5f780bd1	3333	Ljubno ob Savinji
00050000-5571-45fc-6139-8ba23e862e28	9240	Ljutomer
00050000-5571-45fc-3b7a-ef764f2e698a	3215	Loče
00050000-5571-45fc-db28-648e19f20d3b	5231	Log pod Mangartom
00050000-5571-45fc-abbc-311d9395cd89	1358	Log pri Brezovici
00050000-5571-45fc-7d8e-ea29de4090c1	1370	Logatec
00050000-5571-45fc-c136-c826411fe68b	1371	Logatec
00050000-5571-45fc-31fe-b8406cad1d16	1434	Loka pri Zidanem Mostu
00050000-5571-45fc-46a5-6e70a894ae33	3223	Loka pri Žusmu
00050000-5571-45fc-9aee-c34808bf9dae	6219	Lokev
00050000-5571-45fc-1135-2230b3635683	1318	Loški Potok
00050000-5571-45fc-eedc-6d7721ffdfa9	2324	Lovrenc na Dravskem polju
00050000-5571-45fc-06d3-f0db81325762	2344	Lovrenc na Pohorju
00050000-5571-45fc-496b-a35bc4637530	3334	Luče
00050000-5571-45fc-8c4b-416a9d17b59e	1225	Lukovica
00050000-5571-45fc-322f-a7c915d78899	9202	Mačkovci
00050000-5571-45fc-d96b-c22684b67ea0	2322	Majšperk
00050000-5571-45fc-5352-67866620d756	2321	Makole
00050000-5571-45fc-866a-8e462fb55b46	9243	Mala Nedelja
00050000-5571-45fc-9c02-38f182c63f57	2229	Malečnik
00050000-5571-45fc-4b5d-6a72d8ef2034	6273	Marezige
00050000-5571-45fc-af53-c351992d6905	2000	Maribor 
00050000-5571-45fc-0af6-9ca303f1c932	2001	Maribor - poštni predali
00050000-5571-45fc-0b99-24eaaee3eb64	2206	Marjeta na Dravskem polju
00050000-5571-45fc-f9b5-78daa904ac5d	2281	Markovci
00050000-5571-45fc-8d5c-32ec0e250a2b	9221	Martjanci
00050000-5571-45fc-8e00-66527f2e1ef9	6242	Materija
00050000-5571-45fc-feef-0112668def38	4211	Mavčiče
00050000-5571-45fc-6a67-5a06118cf170	1215	Medvode
00050000-5571-45fc-0fbc-65454083e037	1234	Mengeš
00050000-5571-45fc-d3f9-56ead614f6ba	8330	Metlika
00050000-5571-45fc-678c-b89790bb1091	2392	Mežica
00050000-5571-45fc-24f8-1ad081ed323b	2204	Miklavž na Dravskem polju
00050000-5571-45fc-6d37-e7c31be1460e	2275	Miklavž pri Ormožu
00050000-5571-45fc-1938-4355dfc4a5b4	5291	Miren
00050000-5571-45fc-2468-44674c995e45	8233	Mirna
00050000-5571-45fc-02ae-7f280f2b241e	8216	Mirna Peč
00050000-5571-45fc-e940-e85d2fc8ade6	2382	Mislinja
00050000-5571-45fc-0948-4b6ab731641b	4281	Mojstrana
00050000-5571-45fc-ee04-ce7349344639	8230	Mokronog
00050000-5571-45fc-1123-b0e0d4a0d85b	1251	Moravče
00050000-5571-45fc-0b29-9903a7555de9	9226	Moravske Toplice
00050000-5571-45fc-1ad3-096273907de6	5216	Most na Soči
00050000-5571-45fc-75cc-464d79a54aa8	1221	Motnik
00050000-5571-45fc-f6da-595952ff4b15	3330	Mozirje
00050000-5571-45fc-e87e-f2b92b9dc9ff	9000	Murska Sobota 
00050000-5571-45fc-5f21-07eec5b2f454	9001	Murska Sobota - poštni predali
00050000-5571-45fc-1227-53fd82874653	2366	Muta
00050000-5571-45fc-5ba0-314df2e877be	4202	Naklo
00050000-5571-45fc-654c-553438190530	3331	Nazarje
00050000-5571-45fc-ac17-a5b1cd7481bd	1357	Notranje Gorice
00050000-5571-45fc-a9f8-98d72197036c	3203	Nova Cerkev
00050000-5571-45fc-7406-e3578afc53bc	5000	Nova Gorica 
00050000-5571-45fc-0be9-0a852ed230d8	5001	Nova Gorica - poštni predali
00050000-5571-45fc-93f8-2161a462c7da	1385	Nova vas
00050000-5571-45fc-b594-1a92011c6be6	8000	Novo mesto
00050000-5571-45fc-9268-9cae23745bee	8001	Novo mesto - poštni predali
00050000-5571-45fc-efdf-746ade1793ba	6243	Obrov
00050000-5571-45fc-f412-aa2fd386c8c8	9233	Odranci
00050000-5571-45fc-7631-9c4ec310f13d	2317	Oplotnica
00050000-5571-45fc-0b79-e273218149b4	2312	Orehova vas
00050000-5571-45fc-7ae4-d4f373ae969b	2270	Ormož
00050000-5571-45fc-6321-07848618ab59	1316	Ortnek
00050000-5571-45fc-b8fa-531703ffaa0e	1337	Osilnica
00050000-5571-45fc-ef2c-45798ec11b5b	8222	Otočec
00050000-5571-45fc-673a-03c54974bfef	2361	Ožbalt
00050000-5571-45fc-c179-25d7e4e82755	2231	Pernica
00050000-5571-45fc-d69d-779901757077	2211	Pesnica pri Mariboru
00050000-5571-45fc-0a7c-c65bfd894be8	9203	Petrovci
00050000-5571-45fc-650b-c0a467cfe5bb	3301	Petrovče
00050000-5571-45fc-5077-e3c01d5231dd	6330	Piran/Pirano
00050000-5571-45fc-746c-a06b24404b3e	8255	Pišece
00050000-5571-45fc-48ed-662b624fb624	6257	Pivka
00050000-5571-45fc-660c-50f696446346	6232	Planina
00050000-5571-45fc-7012-291e31232017	3225	Planina pri Sevnici
00050000-5571-45fc-b178-327e1c2ade25	6276	Pobegi
00050000-5571-45fc-ade1-649243721b56	8312	Podbočje
00050000-5571-45fc-8279-cafd3e968450	5243	Podbrdo
00050000-5571-45fc-c314-aaf54e7d9878	3254	Podčetrtek
00050000-5571-45fc-ea4f-66e589bd3bf8	2273	Podgorci
00050000-5571-45fc-3ef6-a48c21e4faf1	6216	Podgorje
00050000-5571-45fc-0dcc-5bbfa72b7976	2381	Podgorje pri Slovenj Gradcu
00050000-5571-45fc-b1d6-35860899568c	6244	Podgrad
00050000-5571-45fc-a04a-bf7bca14bc41	1414	Podkum
00050000-5571-45fc-fdfd-411c3f2c556e	2286	Podlehnik
00050000-5571-45fc-8dab-d444faf54f36	5272	Podnanos
00050000-5571-45fc-a6dc-3f55f3fd6155	4244	Podnart
00050000-5571-45fc-255f-9c8761a51eae	3241	Podplat
00050000-5571-45fc-e94a-79aa1f65982e	3257	Podsreda
00050000-5571-45fc-3d40-dc3e39ff684d	2363	Podvelka
00050000-5571-45fc-b304-a01dc189e32f	2208	Pohorje
00050000-5571-45fc-5cfb-284d252f1db6	2257	Polenšak
00050000-5571-45fc-752a-da354b898823	1355	Polhov Gradec
00050000-5571-45fc-aae8-c58c18b403e6	4223	Poljane nad Škofjo Loko
00050000-5571-45fc-b67d-ac54c073aec7	2319	Poljčane
00050000-5571-45fc-369b-ad7b671387d0	1272	Polšnik
00050000-5571-45fc-95e7-9bed28756220	3313	Polzela
00050000-5571-45fc-bc07-4d202c3c3658	3232	Ponikva
00050000-5571-45fc-3eda-74c37152c578	6320	Portorož/Portorose
00050000-5571-45fc-73f7-ee5c8e48366f	6230	Postojna
00050000-5571-45fc-eac1-2db5b9fe4e89	2331	Pragersko
00050000-5571-45fc-7443-ea29bc6cee0c	3312	Prebold
00050000-5571-45fc-286d-3b64f04b0163	4205	Preddvor
00050000-5571-45fc-cb2d-80ccb45233d9	6255	Prem
00050000-5571-45fc-86cc-ebdf0acbbb62	1352	Preserje
00050000-5571-45fc-d799-1a00498a6842	6258	Prestranek
00050000-5571-45fc-4dc0-cb4905d7c20c	2391	Prevalje
00050000-5571-45fc-cdf3-3251a0796e9e	3262	Prevorje
00050000-5571-45fc-ee15-650d5e95d8df	1276	Primskovo 
00050000-5571-45fc-3dff-42e8284c5764	3253	Pristava pri Mestinju
00050000-5571-45fc-7b8b-14f728a16d87	9207	Prosenjakovci/Partosfalva
00050000-5571-45fc-7d82-c02426002512	5297	Prvačina
00050000-5571-45fc-b2e4-25db7e2c3caa	2250	Ptuj
00050000-5571-45fc-f5f5-3ddb3927db63	2323	Ptujska Gora
00050000-5571-45fc-f2b7-25b0c09afd0f	9201	Puconci
00050000-5571-45fc-f61a-96e9e0b06bda	2327	Rače
00050000-5571-45fc-7043-0ac51b9c4052	1433	Radeče
00050000-5571-45fc-9c7a-f43874aa643e	9252	Radenci
00050000-5571-45fc-30b0-facd66931794	2360	Radlje ob Dravi
00050000-5571-45fc-7559-179d273071ca	1235	Radomlje
00050000-5571-45fc-e919-1f9cbbc9409a	4240	Radovljica
00050000-5571-45fc-25f3-59a36844260e	8274	Raka
00050000-5571-45fc-0fbb-6ad8b51c0f65	1381	Rakek
00050000-5571-45fc-ccde-b6ff4bc193de	4283	Rateče - Planica
00050000-5571-45fc-035a-d24e2f18edad	2390	Ravne na Koroškem
00050000-5571-45fc-0a78-d70c62ffb448	9246	Razkrižje
00050000-5571-45fc-0f84-0ae176152f35	3332	Rečica ob Savinji
00050000-5571-45fc-9efb-db4e818bf3ee	5292	Renče
00050000-5571-45fc-224e-a2579a042757	1310	Ribnica
00050000-5571-45fc-315e-4182dd060262	2364	Ribnica na Pohorju
00050000-5571-45fc-bb3b-c758317fe96a	3272	Rimske Toplice
00050000-5571-45fc-aed0-acdcdeebe087	1314	Rob
00050000-5571-45fc-8d0d-bc2cd1c52db6	5215	Ročinj
00050000-5571-45fc-696a-379de5a84488	3250	Rogaška Slatina
00050000-5571-45fc-703a-0d078bd22044	9262	Rogašovci
00050000-5571-45fc-18f3-07de005e6ff1	3252	Rogatec
00050000-5571-45fc-6d87-639d8cb4bfc2	1373	Rovte
00050000-5571-45fc-a064-db7984158aed	2342	Ruše
00050000-5571-45fc-d867-5ff6f60333cd	1282	Sava
00050000-5571-45fc-0cf0-0ceb4d35618c	6333	Sečovlje/Sicciole
00050000-5571-45fc-c7fa-94ef63535409	4227	Selca
00050000-5571-45fc-b539-5720d48fa7cc	2352	Selnica ob Dravi
00050000-5571-45fc-d44f-4e4eaa75ff1f	8333	Semič
00050000-5571-45fc-fbf3-f96dedb3be91	8281	Senovo
00050000-5571-45fc-3ff3-352c018a8cd8	6224	Senožeče
00050000-5571-45fc-cf61-21edd93706da	8290	Sevnica
00050000-5571-45fc-8915-7478e3c88d07	6210	Sežana
00050000-5571-45fc-4f2e-8f42f2e8bc78	2214	Sladki Vrh
00050000-5571-45fc-18bc-da2b6142ec14	5283	Slap ob Idrijci
00050000-5571-45fc-e953-e94a261e5107	2380	Slovenj Gradec
00050000-5571-45fc-4e06-d846eb5cd88e	2310	Slovenska Bistrica
00050000-5571-45fc-9cf6-d198aa26d84f	3210	Slovenske Konjice
00050000-5571-45fc-c288-bf6ef354d167	1216	Smlednik
00050000-5571-45fc-6f9d-094f184c3740	5232	Soča
00050000-5571-45fc-02e2-54657fe3b6ab	1317	Sodražica
00050000-5571-45fc-0659-ac07af9fad44	3335	Solčava
00050000-5571-45fc-17e8-7055e2a0213b	5250	Solkan
00050000-5571-45fc-7bcc-638dd1605d1b	4229	Sorica
00050000-5571-45fc-cbca-fd96bf41ee84	4225	Sovodenj
00050000-5571-45fc-6c4b-58180d3b877c	5281	Spodnja Idrija
00050000-5571-45fc-28bf-75a7a39d5cdc	2241	Spodnji Duplek
00050000-5571-45fc-9dab-e708db65b3e8	9245	Spodnji Ivanjci
00050000-5571-45fc-05c4-b4c5020a93ad	2277	Središče ob Dravi
00050000-5571-45fc-dca5-8da9741fd010	4267	Srednja vas v Bohinju
00050000-5571-45fc-95aa-ddd179d4719c	8256	Sromlje 
00050000-5571-45fc-a50e-14f3c1102f14	5224	Srpenica
00050000-5571-45fc-b34d-72d008a8b58e	1242	Stahovica
00050000-5571-45fc-e7b2-eaf79cf82155	1332	Stara Cerkev
00050000-5571-45fc-3309-2f4b6dec63a8	8342	Stari trg ob Kolpi
00050000-5571-45fc-1f90-a12e29ab10ad	1386	Stari trg pri Ložu
00050000-5571-45fc-e985-67607ecc5359	2205	Starše
00050000-5571-45fc-2607-56f9961b1752	2289	Stoperce
00050000-5571-45fc-de51-7d7f58e0e66f	8322	Stopiče
00050000-5571-45fc-1233-f9ce7e20173c	3206	Stranice
00050000-5571-45fc-9b5e-5bf68ef80998	8351	Straža
00050000-5571-45fc-4689-6047c75fdf2e	1313	Struge
00050000-5571-45fc-848a-1d019905aef6	8293	Studenec
00050000-5571-45fc-7dad-363642091211	8331	Suhor
00050000-5571-45fc-f93f-4741e9d165e6	2233	Sv. Ana v Slovenskih goricah
00050000-5571-45fc-7508-dd41e74633ba	2235	Sv. Trojica v Slovenskih goricah
00050000-5571-45fc-7685-4fbd7eab8bbf	2353	Sveti Duh na Ostrem Vrhu
00050000-5571-45fc-2c2b-6d0cbea98a8b	9244	Sveti Jurij ob Ščavnici
00050000-5571-45fc-58e7-a3db2af50c5d	3264	Sveti Štefan
00050000-5571-45fc-5b1e-f2f8b36546a2	2258	Sveti Tomaž
00050000-5571-45fc-3674-f7faceae7970	9204	Šalovci
00050000-5571-45fc-dbdc-d35c4e257944	5261	Šempas
00050000-5571-45fc-2807-915d5187d5d7	5290	Šempeter pri Gorici
00050000-5571-45fc-c884-f62e53ceb3b7	3311	Šempeter v Savinjski dolini
00050000-5571-45fc-fb60-7e63162e8e65	4208	Šenčur
00050000-5571-45fc-6d2c-94d3f0d2dead	2212	Šentilj v Slovenskih goricah
00050000-5571-45fc-782e-332326e70c91	8297	Šentjanž
00050000-5571-45fc-3950-c45833c1ccd9	2373	Šentjanž pri Dravogradu
00050000-5571-45fc-d82d-a93cd0e7260b	8310	Šentjernej
00050000-5571-45fc-bf39-ba3e20082fa1	3230	Šentjur
00050000-5571-45fc-081e-c03fb74457c5	3271	Šentrupert
00050000-5571-45fc-d4c3-6d212e6196fb	8232	Šentrupert
00050000-5571-45fc-7fc1-a7eba5147db3	1296	Šentvid pri Stični
00050000-5571-45fc-8f67-57570877e3bf	8275	Škocjan
00050000-5571-45fc-2ccc-9ad36d47519c	6281	Škofije
00050000-5571-45fc-1a9c-4f467ed5ce2f	4220	Škofja Loka
00050000-5571-45fc-b296-bf36962c17c6	3211	Škofja vas
00050000-5571-45fc-a956-af7caea9580c	1291	Škofljica
00050000-5571-45fc-0472-6f412bfd37e1	6274	Šmarje
00050000-5571-45fc-ec34-bb0970e09fae	1293	Šmarje - Sap
00050000-5571-45fc-7b3b-571a9cd29dd6	3240	Šmarje pri Jelšah
00050000-5571-45fc-b822-16423158632f	8220	Šmarješke Toplice
00050000-5571-45fc-0d3a-3ec042e3af9a	2315	Šmartno na Pohorju
00050000-5571-45fc-1ed4-0021bca3a791	3341	Šmartno ob Dreti
00050000-5571-45fc-9a32-6acc3a53a506	3327	Šmartno ob Paki
00050000-5571-45fc-61ba-6724387a473a	1275	Šmartno pri Litiji
00050000-5571-45fc-d8fb-0a5edfa9d104	2383	Šmartno pri Slovenj Gradcu
00050000-5571-45fc-7414-841bb4b8ef80	3201	Šmartno v Rožni dolini
00050000-5571-45fc-54fd-3e28bc5c4e42	3325	Šoštanj
00050000-5571-45fc-a301-ef30d7723909	6222	Štanjel
00050000-5571-45fc-4619-82346d77c693	3220	Štore
00050000-5571-45fc-8f46-78f1c837dd1e	3304	Tabor
00050000-5571-45fc-3161-0238115a674e	3221	Teharje
00050000-5571-45fc-14f7-6644f2bfefa8	9251	Tišina
00050000-5571-45fc-5033-9990d29d52d3	5220	Tolmin
00050000-5571-45fc-7c62-0a3d5ed7431c	3326	Topolšica
00050000-5571-45fc-6be0-a62420fb7d48	2371	Trbonje
00050000-5571-45fc-4b75-5f19139dcea3	1420	Trbovlje
00050000-5571-45fc-0841-192554204dbc	8231	Trebelno 
00050000-5571-45fc-a08c-18a6eecc9518	8210	Trebnje
00050000-5571-45fc-746d-479ce2ca9191	5252	Trnovo pri Gorici
00050000-5571-45fc-7013-d9d8a2bc29be	2254	Trnovska vas
00050000-5571-45fc-b2c5-66038f4368d1	1222	Trojane
00050000-5571-45fc-abc6-d3fc2de1dac4	1236	Trzin
00050000-5571-45fc-718c-dac8ca3a56eb	4290	Tržič
00050000-5571-45fc-b5dc-b2b3935f9393	8295	Tržišče
00050000-5571-45fc-6176-838b77a6241e	1311	Turjak
00050000-5571-45fc-5d22-79ffc9440fa7	9224	Turnišče
00050000-5571-45fc-fb9c-a37bbe5f785d	8323	Uršna sela
00050000-5571-45fc-edd0-fcff484bf255	1252	Vače
00050000-5571-45fc-41b1-5d29182e2572	3320	Velenje 
00050000-5571-45fc-0045-92856393f064	3322	Velenje - poštni predali
00050000-5571-45fc-ef12-68ad4242f5aa	8212	Velika Loka
00050000-5571-45fc-4a2d-bfcc778f55c3	2274	Velika Nedelja
00050000-5571-45fc-ed61-3d97bbf87035	9225	Velika Polana
00050000-5571-45fc-14bd-66a6f935a240	1315	Velike Lašče
00050000-5571-45fc-13d1-a46a5a5c0ecc	8213	Veliki Gaber
00050000-5571-45fc-14ee-1521b677cecf	9241	Veržej
00050000-5571-45fc-b6ab-803ca6a9886e	1312	Videm - Dobrepolje
00050000-5571-45fc-b633-c43a0906202d	2284	Videm pri Ptuju
00050000-5571-45fc-6ee3-f2aee76e2587	8344	Vinica
00050000-5571-45fc-ea1c-212c0e8dd25a	5271	Vipava
00050000-5571-45fc-4fb2-21357d1d131d	4212	Visoko
00050000-5571-45fc-fca8-723d1cb8868e	1294	Višnja Gora
00050000-5571-45fc-3fa5-190d288448d7	3205	Vitanje
00050000-5571-45fc-2e35-d654807c6707	2255	Vitomarci
00050000-5571-45fc-45a0-e045f49b5ac1	1217	Vodice
00050000-5571-45fc-6f6d-8cb5721090f7	3212	Vojnik\t
00050000-5571-45fc-d6e0-9348f98afad3	5293	Volčja Draga
00050000-5571-45fc-bb78-b5781929b436	2232	Voličina
00050000-5571-45fc-86d2-1eb338aa5eed	3305	Vransko
00050000-5571-45fc-73b6-29673603acb6	6217	Vremski Britof
00050000-5571-45fc-5b24-77e9ea2b09ea	1360	Vrhnika
00050000-5571-45fc-eb09-bb15f98d3652	2365	Vuhred
00050000-5571-45fc-270a-6896117731b6	2367	Vuzenica
00050000-5571-45fc-68ef-b21eb8a7e75c	8292	Zabukovje 
00050000-5571-45fc-7548-66e99aa05713	1410	Zagorje ob Savi
00050000-5571-45fc-9644-e53a7cf0922e	1303	Zagradec
00050000-5571-45fc-7c9c-efe9122c453d	2283	Zavrč
00050000-5571-45fc-d897-625a390dee94	8272	Zdole 
00050000-5571-45fc-2093-3d1d843fa14e	4201	Zgornja Besnica
00050000-5571-45fc-d567-7086ae2d0d92	2242	Zgornja Korena
00050000-5571-45fc-3dce-ff36c2f279a4	2201	Zgornja Kungota
00050000-5571-45fc-b6de-c3034f47c2b2	2316	Zgornja Ložnica
00050000-5571-45fc-b5f1-deee05ab397e	2314	Zgornja Polskava
00050000-5571-45fc-290d-a193cadeee2c	2213	Zgornja Velka
00050000-5571-45fc-3db1-ac418868003f	4247	Zgornje Gorje
00050000-5571-45fc-686f-176658bea8c0	4206	Zgornje Jezersko
00050000-5571-45fc-0381-7def1d697d36	2285	Zgornji Leskovec
00050000-5571-45fc-fc1c-e3e4aadcee4e	1432	Zidani Most
00050000-5571-45fc-3c8b-b5e81f76c357	3214	Zreče
00050000-5571-45fc-0817-7e3b211abe0d	4209	Žabnica
00050000-5571-45fc-f164-a0b656b40d5c	3310	Žalec
00050000-5571-45fc-39bf-fce4ed8d50fc	4228	Železniki
00050000-5571-45fc-3b78-d2596d008a4f	2287	Žetale
00050000-5571-45fc-42f2-67de167f517f	4226	Žiri
00050000-5571-45fc-3d79-31b40bfe54e4	4274	Žirovnica
00050000-5571-45fc-2305-ea8dc3196cfb	8360	Žužemberk
\.


--
-- TOC entry 2809 (class 0 OID 6316842)
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
-- TOC entry 2791 (class 0 OID 6316653)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2797 (class 0 OID 6316731)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2811 (class 0 OID 6316854)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2824 (class 0 OID 6316974)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 6317029)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5571-45fd-e174-1ba0b06ee4c0	00080000-5571-45fd-3df3-f04cd8b60441	0987	A
00190000-5571-45fd-0ea8-d8f728796278	00080000-5571-45fd-c09d-ff3539ded3ea	0989	A
\.


--
-- TOC entry 2835 (class 0 OID 6317143)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 6317171)
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
-- TOC entry 2836 (class 0 OID 6317152)
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
-- TOC entry 2815 (class 0 OID 6316883)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5571-45fd-a286-d892e47ffac3	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5571-45fd-f331-747bc214b732	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5571-45fd-f4cf-8b825cc3db31	0003	Kazinska	t	84	Kazinska dvorana
00220000-5571-45fd-7963-cac7d586b2d0	0004	Mali oder	t	24	Mali oder 
00220000-5571-45fd-b2f1-8c1c028c28c7	0005	Komorni oder	t	15	Komorni oder
00220000-5571-45fd-9ccd-e1b45b5bdd73	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5571-45fd-af59-3336064ba6dd	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2807 (class 0 OID 6316827)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2806 (class 0 OID 6316817)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2827 (class 0 OID 6317018)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 6316951)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2780 (class 0 OID 6316525)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5571-45fd-bbd2-bad5c96a6172	00010000-5571-45fd-7b27-1aecd407fc81	2015-06-05 08:47:26	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROOntWS7zXZUC37qyfX2yDW6koww.6h6C";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2855 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2816 (class 0 OID 6316893)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2784 (class 0 OID 6316563)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5571-45fc-77b8-f68f49997e0b	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5571-45fc-3254-a952aafe24fc	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5571-45fc-f639-4d5a08f9b716	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5571-45fc-4f1b-8f18fb6d4a29	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5571-45fc-80f8-2352170dceeb	planer	Planer dogodkov v koledarju	t
00020000-5571-45fc-ef6f-bb4835569c04	kadrovska	Kadrovska služba	t
00020000-5571-45fc-fe3f-e32b7b0d8e8b	arhivar	Ažuriranje arhivalij	t
00020000-5571-45fc-8a65-0c30da60bb26	igralec	Igralec	t
00020000-5571-45fc-5407-b4f690bfc748	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2782 (class 0 OID 6316547)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5571-45fd-bbd2-bad5c96a6172	00020000-5571-45fc-f639-4d5a08f9b716
00010000-5571-45fd-7b27-1aecd407fc81	00020000-5571-45fc-f639-4d5a08f9b716
\.


--
-- TOC entry 2818 (class 0 OID 6316907)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2810 (class 0 OID 6316848)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2804 (class 0 OID 6316798)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 6317190)
-- Dependencies: 235
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5571-45fc-b1d4-079272bc125e	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5571-45fc-c232-65325a5d87ae	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5571-45fc-105f-029605d7f3fa	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5571-45fc-3d21-1e7da9f5fe29	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5571-45fc-685f-73d8a0ea34bf	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2840 (class 0 OID 6317182)
-- Dependencies: 234
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5571-45fc-0e29-e476c95e364b	00000000-5571-45fc-3d21-1e7da9f5fe29	popa
00000000-5571-45fc-3465-1086127c77a5	00000000-5571-45fc-3d21-1e7da9f5fe29	oseba
00000000-5571-45fc-7120-9a42a123b236	00000000-5571-45fc-c232-65325a5d87ae	prostor
00000000-5571-45fc-6af7-01d64c974357	00000000-5571-45fc-3d21-1e7da9f5fe29	besedilo
00000000-5571-45fc-b879-aa9f86c2e102	00000000-5571-45fc-3d21-1e7da9f5fe29	uprizoritev
00000000-5571-45fc-c8ec-143c6fb50b16	00000000-5571-45fc-3d21-1e7da9f5fe29	funkcija
00000000-5571-45fc-aaa7-e630ea178935	00000000-5571-45fc-3d21-1e7da9f5fe29	tipfunkcije
00000000-5571-45fc-e335-edba5e782399	00000000-5571-45fc-3d21-1e7da9f5fe29	alternacija
00000000-5571-45fc-9aa4-46b6a8b79e0f	00000000-5571-45fc-b1d4-079272bc125e	pogodba
00000000-5571-45fc-e1bc-b7698ac1191b	00000000-5571-45fc-3d21-1e7da9f5fe29	zaposlitev
\.


--
-- TOC entry 2839 (class 0 OID 6317177)
-- Dependencies: 233
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 6316961)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2789 (class 0 OID 6316625)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2805 (class 0 OID 6316804)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5571-45fd-6e8c-4ad75a97f3ff	00180000-5571-45fd-0c19-54adc98b4acb	000c0000-5571-45fd-1bc0-3cae571dbcf0	00090000-5571-45fd-e02c-c78d6f862013	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5571-45fd-21bc-c8b1e5f19a4b	00180000-5571-45fd-0c19-54adc98b4acb	000c0000-5571-45fd-2573-830bf6fd67b7	00090000-5571-45fd-5f3d-54471999d52f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5571-45fd-3937-310234f5e6fb	00180000-5571-45fd-0c19-54adc98b4acb	000c0000-5571-45fd-90de-54c514d9934b	00090000-5571-45fd-2704-370c4bd182c5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5571-45fd-6f67-5609b42653a0	00180000-5571-45fd-0c19-54adc98b4acb	000c0000-5571-45fd-3363-386794a0239d	00090000-5571-45fd-27f7-4c64affabc03	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5571-45fd-423a-98e4b0ed8938	00180000-5571-45fd-0c19-54adc98b4acb	000c0000-5571-45fd-93d2-4f8fb7c5f280	00090000-5571-45fd-a9d6-5c1d3ddc701c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5571-45fd-0f21-feab8d2378ad	00180000-5571-45fd-f086-e1b100c2c645	\N	00090000-5571-45fd-a9d6-5c1d3ddc701c	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2826 (class 0 OID 6317007)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5571-45fc-4f9c-ab53f7446914	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5571-45fc-e35a-1f62342b9c93	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5571-45fc-90f9-34a852b3bf4d	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5571-45fc-6f81-e6d9c8f8f7b5	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5571-45fc-ae07-9316ad6ac0c3	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5571-45fc-0657-769e2d40056b	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5571-45fc-e336-bb275252d4bb	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5571-45fc-1de9-bab7a56c3b48	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5571-45fc-172d-f695a54a86fd	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5571-45fc-18c6-2cc8cf02467a	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5571-45fc-9d55-893313ad8e62	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5571-45fc-5934-622d20c2523f	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5571-45fc-3852-7163091c21e0	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5571-45fc-9d15-a4bedced7c08	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5571-45fc-1de3-43c413d4f5ff	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5571-45fc-83bb-0e86440f2727	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2837 (class 0 OID 6317160)
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
-- TOC entry 2794 (class 0 OID 6316688)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2781 (class 0 OID 6316534)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5571-45fd-7b27-1aecd407fc81	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROSmR20s49ABWEr8CUx9gtFl41ZosnmCS	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5571-45fd-2515-07ce4ad559b3	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5571-45fd-3e08-5e16a3711e5b	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5571-45fd-8f03-860da9aa5907	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5571-45fd-b919-cadce7516d19	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5571-45fd-f7cf-99a8f551a746	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5571-45fd-d3b6-15585b902db8	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5571-45fd-bbd2-bad5c96a6172	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2831 (class 0 OID 6317064)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5571-45fd-f7b2-589925fc4763	00160000-5571-45fd-cb8f-9dd3f4245796	00150000-5571-45fc-627c-21c6b0a20d1e	00140000-5571-45fc-db27-b6a50e673c4b	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5571-45fd-b2f1-8c1c028c28c7
000e0000-5571-45fd-5322-617d42417968	00160000-5571-45fd-3c8c-f4229cf3b6bf	00150000-5571-45fc-d24f-f18ccc8d7498	00140000-5571-45fc-132c-66073dce8f60	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5571-45fd-9ccd-e1b45b5bdd73
\.


--
-- TOC entry 2799 (class 0 OID 6316750)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5571-45fd-299d-8629f9cdbdab	000e0000-5571-45fd-5322-617d42417968	1	
00200000-5571-45fd-25e2-d1c22c249018	000e0000-5571-45fd-5322-617d42417968	2	
\.


--
-- TOC entry 2814 (class 0 OID 6316875)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 6316944)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2801 (class 0 OID 6316782)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 6317054)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5571-45fc-db27-b6a50e673c4b	01	Drama	drama (SURS 01)
00140000-5571-45fc-066f-a144319258a7	02	Opera	opera (SURS 02)
00140000-5571-45fc-ce65-fb29af63549a	03	Balet	balet (SURS 03)
00140000-5571-45fc-c18b-3b3c24319ea0	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5571-45fc-31b2-2448e2ef4c05	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5571-45fc-132c-66073dce8f60	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5571-45fc-390b-f08d449dfa60	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2820 (class 0 OID 6316934)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5571-45fc-5cf1-100211440ba3	01	Opera	opera
00150000-5571-45fc-3aed-1bebf300dba5	02	Opereta	opereta
00150000-5571-45fc-6ae8-31f24693b925	03	Balet	balet
00150000-5571-45fc-0d37-6f21c8fd3b59	04	Plesne prireditve	plesne prireditve
00150000-5571-45fc-1e0f-82e719cdecb4	05	Lutkovno gledališče	lutkovno gledališče
00150000-5571-45fc-6104-270993cc2c8f	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5571-45fc-c2bf-e57c50b8432c	07	Biografska drama	biografska drama
00150000-5571-45fc-627c-21c6b0a20d1e	08	Komedija	komedija
00150000-5571-45fc-ad55-c4fb743d35ba	09	Črna komedija	črna komedija
00150000-5571-45fc-23c6-a281e227aaf6	10	E-igra	E-igra
00150000-5571-45fc-d24f-f18ccc8d7498	11	Kriminalka	kriminalka
00150000-5571-45fc-498b-4c15bc457658	12	Musical	musical
\.


--
-- TOC entry 2372 (class 2606 OID 6316588)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 6317110)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 6317100)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 6317006)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 6316772)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 6316797)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 6316714)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 6317139)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 6316930)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 6316748)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 6316791)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 6316728)
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
-- TOC entry 2464 (class 2606 OID 6316840)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 6316867)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 6316686)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 6316597)
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
-- TOC entry 2379 (class 2606 OID 6316621)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 6316577)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2363 (class 2606 OID 6316562)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 6316873)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 6316906)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 6317049)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 6316650)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 6316674)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 6316846)
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
-- TOC entry 2394 (class 2606 OID 6316664)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 6316735)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 6316858)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 6316986)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 6317034)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 6317150)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 6317175)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 6317157)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 6316890)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 6316831)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 6316822)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 6317028)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 6316958)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2355 (class 2606 OID 6316533)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 6316897)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2361 (class 2606 OID 6316551)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2365 (class 2606 OID 6316571)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 6316915)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 6316853)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 6316803)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 6317199)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 6317187)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 6317181)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 6316971)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 6316630)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 6316813)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 6317017)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 6317170)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 6316699)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 6316546)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 6317080)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 6316757)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 6316881)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 6316949)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 6316786)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 6317062)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 2606 OID 6316942)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 1259 OID 6316779)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2512 (class 1259 OID 6316972)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2513 (class 1259 OID 6316973)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2386 (class 1259 OID 6316652)
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
-- TOC entry 2477 (class 1259 OID 6316874)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2471 (class 1259 OID 6316860)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2472 (class 1259 OID 6316859)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2423 (class 1259 OID 6316758)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2499 (class 1259 OID 6316931)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2500 (class 1259 OID 6316933)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2501 (class 1259 OID 6316932)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2411 (class 1259 OID 6316730)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2412 (class 1259 OID 6316729)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2530 (class 1259 OID 6317051)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2531 (class 1259 OID 6317052)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2532 (class 1259 OID 6317053)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2539 (class 1259 OID 6317085)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2540 (class 1259 OID 6317082)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2541 (class 1259 OID 6317084)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2542 (class 1259 OID 6317083)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2401 (class 1259 OID 6316701)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2402 (class 1259 OID 6316700)
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
-- TOC entry 2377 (class 1259 OID 6316624)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2487 (class 1259 OID 6316898)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2441 (class 1259 OID 6316792)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2367 (class 1259 OID 6316578)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2368 (class 1259 OID 6316579)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2492 (class 1259 OID 6316918)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2493 (class 1259 OID 6316917)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2494 (class 1259 OID 6316916)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2415 (class 1259 OID 6316736)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2416 (class 1259 OID 6316738)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2417 (class 1259 OID 6316737)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2577 (class 1259 OID 6317189)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2451 (class 1259 OID 6316826)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2452 (class 1259 OID 6316824)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2453 (class 1259 OID 6316823)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2454 (class 1259 OID 6316825)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2358 (class 1259 OID 6316552)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2359 (class 1259 OID 6316553)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2480 (class 1259 OID 6316882)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2466 (class 1259 OID 6316847)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2508 (class 1259 OID 6316959)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2509 (class 1259 OID 6316960)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2560 (class 1259 OID 6317140)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2561 (class 1259 OID 6317142)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2562 (class 1259 OID 6317141)
-- Name: idx_8787a0e5b3836ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5b3836ea9 ON enotaprograma USING btree (tip_programske_enote_id);


--
-- TOC entry 2390 (class 1259 OID 6316666)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2391 (class 1259 OID 6316665)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2392 (class 1259 OID 6316667)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2572 (class 1259 OID 6317176)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2516 (class 1259 OID 6316987)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2517 (class 1259 OID 6316988)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2552 (class 1259 OID 6317114)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2553 (class 1259 OID 6317116)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2554 (class 1259 OID 6317112)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2555 (class 1259 OID 6317115)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2556 (class 1259 OID 6317113)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2505 (class 1259 OID 6316950)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2457 (class 1259 OID 6316835)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2458 (class 1259 OID 6316834)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2459 (class 1259 OID 6316832)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2460 (class 1259 OID 6316833)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2341 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2548 (class 1259 OID 6317102)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2549 (class 1259 OID 6317101)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2563 (class 1259 OID 6317151)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2422 (class 1259 OID 6316749)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2373 (class 1259 OID 6316599)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2374 (class 1259 OID 6316598)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2382 (class 1259 OID 6316631)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2383 (class 1259 OID 6316632)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2446 (class 1259 OID 6316816)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 6316815)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2448 (class 1259 OID 6316814)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2566 (class 1259 OID 6317159)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2567 (class 1259 OID 6317158)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2429 (class 1259 OID 6316781)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2430 (class 1259 OID 6316777)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2431 (class 1259 OID 6316774)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2432 (class 1259 OID 6316775)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2433 (class 1259 OID 6316773)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2434 (class 1259 OID 6316778)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2435 (class 1259 OID 6316776)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2389 (class 1259 OID 6316651)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2407 (class 1259 OID 6316715)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2408 (class 1259 OID 6316717)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2409 (class 1259 OID 6316716)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2410 (class 1259 OID 6316718)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2465 (class 1259 OID 6316841)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2535 (class 1259 OID 6317050)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2543 (class 1259 OID 6317081)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2380 (class 1259 OID 6316622)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2381 (class 1259 OID 6316623)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2502 (class 1259 OID 6316943)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2583 (class 1259 OID 6317200)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2400 (class 1259 OID 6316687)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2580 (class 1259 OID 6317188)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2485 (class 1259 OID 6316892)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2486 (class 1259 OID 6316891)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2557 (class 1259 OID 6317111)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2344 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2397 (class 1259 OID 6316675)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2536 (class 1259 OID 6317063)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2528 (class 1259 OID 6317035)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2529 (class 1259 OID 6317036)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2366 (class 1259 OID 6316572)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2436 (class 1259 OID 6316780)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2611 (class 2606 OID 6317342)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2608 (class 2606 OID 6317327)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2609 (class 2606 OID 6317332)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2613 (class 2606 OID 6317352)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2607 (class 2606 OID 6317322)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2612 (class 2606 OID 6317347)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2610 (class 2606 OID 6317337)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2642 (class 2606 OID 6317497)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2643 (class 2606 OID 6317502)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2594 (class 2606 OID 6317257)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2630 (class 2606 OID 6317437)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2629 (class 2606 OID 6317432)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2628 (class 2606 OID 6317427)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2606 (class 2606 OID 6317317)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2636 (class 2606 OID 6317467)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2638 (class 2606 OID 6317477)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2637 (class 2606 OID 6317472)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2601 (class 2606 OID 6317292)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2600 (class 2606 OID 6317287)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2626 (class 2606 OID 6317417)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2647 (class 2606 OID 6317522)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2648 (class 2606 OID 6317527)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2649 (class 2606 OID 6317532)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2653 (class 2606 OID 6317552)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2650 (class 2606 OID 6317537)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2652 (class 2606 OID 6317547)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2651 (class 2606 OID 6317542)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2599 (class 2606 OID 6317282)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2598 (class 2606 OID 6317277)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2591 (class 2606 OID 6317242)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2590 (class 2606 OID 6317237)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2632 (class 2606 OID 6317447)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2614 (class 2606 OID 6317357)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2586 (class 2606 OID 6317217)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2587 (class 2606 OID 6317222)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2635 (class 2606 OID 6317462)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2634 (class 2606 OID 6317457)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2633 (class 2606 OID 6317452)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2602 (class 2606 OID 6317297)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2604 (class 2606 OID 6317307)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2603 (class 2606 OID 6317302)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2668 (class 2606 OID 6317627)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2621 (class 2606 OID 6317392)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2619 (class 2606 OID 6317382)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2618 (class 2606 OID 6317377)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2620 (class 2606 OID 6317387)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2584 (class 2606 OID 6317207)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2585 (class 2606 OID 6317212)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2631 (class 2606 OID 6317442)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2627 (class 2606 OID 6317422)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2640 (class 2606 OID 6317487)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2641 (class 2606 OID 6317492)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2661 (class 2606 OID 6317592)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2663 (class 2606 OID 6317602)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2662 (class 2606 OID 6317597)
-- Name: fk_8787a0e5b3836ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5b3836ea9 FOREIGN KEY (tip_programske_enote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2596 (class 2606 OID 6317267)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2595 (class 2606 OID 6317262)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2597 (class 2606 OID 6317272)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2667 (class 2606 OID 6317622)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2644 (class 2606 OID 6317507)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2645 (class 2606 OID 6317512)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2658 (class 2606 OID 6317577)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2660 (class 2606 OID 6317587)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2656 (class 2606 OID 6317567)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2659 (class 2606 OID 6317582)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2657 (class 2606 OID 6317572)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2639 (class 2606 OID 6317482)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2625 (class 2606 OID 6317412)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2624 (class 2606 OID 6317407)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2622 (class 2606 OID 6317397)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2623 (class 2606 OID 6317402)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2655 (class 2606 OID 6317562)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2654 (class 2606 OID 6317557)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2664 (class 2606 OID 6317607)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2605 (class 2606 OID 6317312)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2646 (class 2606 OID 6317517)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2589 (class 2606 OID 6317232)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2588 (class 2606 OID 6317227)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2592 (class 2606 OID 6317247)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2593 (class 2606 OID 6317252)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2617 (class 2606 OID 6317372)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2616 (class 2606 OID 6317367)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2615 (class 2606 OID 6317362)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2666 (class 2606 OID 6317617)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2665 (class 2606 OID 6317612)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-05 08:47:26 CEST

--
-- PostgreSQL database dump complete
--

