--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-08 12:41:00 CEST

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
-- TOC entry 180 (class 1259 OID 6544752)
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
-- TOC entry 227 (class 1259 OID 6545275)
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
-- TOC entry 226 (class 1259 OID 6545258)
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
-- TOC entry 219 (class 1259 OID 6545161)
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
-- TOC entry 194 (class 1259 OID 6544931)
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
-- TOC entry 197 (class 1259 OID 6544965)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6544874)
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
-- TOC entry 228 (class 1259 OID 6545289)
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
-- TOC entry 213 (class 1259 OID 6545091)
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
-- TOC entry 192 (class 1259 OID 6544911)
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
-- TOC entry 196 (class 1259 OID 6544959)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6544891)
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
-- TOC entry 202 (class 1259 OID 6545008)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6545033)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6544848)
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
-- TOC entry 181 (class 1259 OID 6544761)
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
-- TOC entry 182 (class 1259 OID 6544772)
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
-- TOC entry 177 (class 1259 OID 6544726)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6544745)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6545040)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6545071)
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
-- TOC entry 223 (class 1259 OID 6545209)
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
-- TOC entry 184 (class 1259 OID 6544805)
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
-- TOC entry 186 (class 1259 OID 6544840)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6545014)
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
-- TOC entry 185 (class 1259 OID 6544825)
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
-- TOC entry 191 (class 1259 OID 6544903)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6545026)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6545146)
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
-- TOC entry 222 (class 1259 OID 6545201)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6545315)
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
-- TOC entry 232 (class 1259 OID 6545343)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id integer NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 237 (class 1259 OID 6545375)
-- Name: programfestival_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programfestival_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 230 (class 1259 OID 6545324)
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
-- TOC entry 236 (class 1259 OID 6545373)
-- Name: programgostovanje_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programgostovanje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 209 (class 1259 OID 6545055)
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
-- TOC entry 201 (class 1259 OID 6544999)
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
-- TOC entry 200 (class 1259 OID 6544989)
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
-- TOC entry 221 (class 1259 OID 6545190)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6545123)
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
-- TOC entry 174 (class 1259 OID 6544697)
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
-- TOC entry 173 (class 1259 OID 6544695)
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
-- TOC entry 210 (class 1259 OID 6545065)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6544735)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6544719)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6545079)
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
-- TOC entry 204 (class 1259 OID 6545020)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6544970)
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
-- TOC entry 235 (class 1259 OID 6545362)
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
-- TOC entry 234 (class 1259 OID 6545354)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 6545349)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6545133)
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
-- TOC entry 183 (class 1259 OID 6544797)
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
-- TOC entry 199 (class 1259 OID 6544976)
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
-- TOC entry 220 (class 1259 OID 6545179)
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
-- TOC entry 231 (class 1259 OID 6545332)
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
-- TOC entry 188 (class 1259 OID 6544860)
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
-- TOC entry 175 (class 1259 OID 6544706)
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
-- TOC entry 225 (class 1259 OID 6545236)
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
-- TOC entry 193 (class 1259 OID 6544922)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6545047)
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
-- TOC entry 215 (class 1259 OID 6545116)
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
-- TOC entry 195 (class 1259 OID 6544954)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6545226)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 6545106)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2172 (class 2604 OID 6544700)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2784 (class 0 OID 6544752)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 6545275)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5575-713b-47d8-93c787a89943	000d0000-5575-713b-3592-2c78b974626d	\N	00090000-5575-713b-5d72-2b4967303ac8	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-713b-8ab2-6ab827cb3ef4	000d0000-5575-713b-48f2-7e3700955cbe	\N	00090000-5575-713b-8cba-e6ecc8731c23	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-713b-2f79-dd5255cf6900	000d0000-5575-713b-25a6-0faca5f28186	\N	00090000-5575-713b-9efb-6f168a07a0d1	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-713b-9e4f-194d95ebdd63	000d0000-5575-713b-3cd0-aed3da187152	\N	00090000-5575-713b-30fd-881e4314b553	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-713b-9f38-f3beb0cd7be8	000d0000-5575-713b-9226-49a1e207cb59	\N	00090000-5575-713b-3438-e88de9c431a0	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5575-713b-b5b5-09a4fd8b66be	000d0000-5575-713b-ba16-44a482add861	\N	00090000-5575-713b-8cba-e6ecc8731c23	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2830 (class 0 OID 6545258)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 6545161)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5575-713b-3711-e83668c026a8	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	5	Milan Jesih	\N	\N	\N
00160000-5575-713b-3fae-127d517a138b	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	1	Vladimir Levstik	\N	\N	\N
00160000-5575-713b-113f-7cc441bda410	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8	8		\N	\N	\N
\.


--
-- TOC entry 2798 (class 0 OID 6544931)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5575-713b-5a14-9c97e2d1c04e	\N	\N	00200000-5575-713b-70d9-2e604e945ede	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5575-713b-a203-4ef431b23292	\N	\N	00200000-5575-713b-e599-cd291b9e56a8	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5575-713b-c37d-922d568acda7	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5575-713b-b8b6-0bf8afabc24f	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5575-713b-fbcf-fa42b7bee018	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2801 (class 0 OID 6544965)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2793 (class 0 OID 6544874)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5575-713a-58f8-1ee8d1684efc	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5575-713a-40a7-6536a1fd2b90	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5575-713a-3783-345cf7ecadcc	AL	ALB	008	Albania 	Albanija	\N
00040000-5575-713a-8c7f-6292c0092653	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5575-713a-ca01-777ea1c170c3	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5575-713a-47d2-12588f50c7bb	AD	AND	020	Andorra 	Andora	\N
00040000-5575-713a-8b9f-b4060c5de6a0	AO	AGO	024	Angola 	Angola	\N
00040000-5575-713a-89bc-a79f14f4343a	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5575-713a-5a0e-bbcb3a7d450b	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5575-713a-c750-1059ece8e0a2	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5575-713a-2955-f513628610a6	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5575-713a-1fba-cd5947f1793c	AM	ARM	051	Armenia 	Armenija	\N
00040000-5575-713a-0ab0-c113b01d1b97	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5575-713a-3a74-77f50b3af9c1	AU	AUS	036	Australia 	Avstralija	\N
00040000-5575-713a-4e30-4d4fd2bd4f04	AT	AUT	040	Austria 	Avstrija	\N
00040000-5575-713a-7a02-0832d033c7d6	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5575-713a-d6b8-83a2addd091a	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5575-713a-8829-e494eed56e3d	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5575-713a-608a-488aaab52a55	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5575-713a-3dcd-7023317ee0ec	BB	BRB	052	Barbados 	Barbados	\N
00040000-5575-713a-e667-b8a6101f4b4f	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5575-713a-4ac4-c27a5aa984de	BE	BEL	056	Belgium 	Belgija	\N
00040000-5575-713a-60eb-233d6268674c	BZ	BLZ	084	Belize 	Belize	\N
00040000-5575-713a-e804-840848a72a32	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5575-713a-fd6e-bb7dc391e851	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5575-713a-021c-de83ecc103cb	BT	BTN	064	Bhutan 	Butan	\N
00040000-5575-713a-0cf1-48a5a4d56029	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5575-713a-5857-d668365840fa	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5575-713a-6af4-4b72854fda87	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5575-713a-70c8-f9ce2e8c2e34	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5575-713a-58b5-f5ef8f7fd3f0	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5575-713a-c52a-10c8f4983ee5	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5575-713a-e951-d363340feaf1	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5575-713a-24dd-807e2de122f7	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5575-713a-3f2a-7cc22c4a7169	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5575-713a-91c7-12d933a8d0c0	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5575-713a-5427-02e2436c7b4c	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5575-713a-5b9c-c7f60bacf541	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5575-713a-1216-5a16e9b0fac2	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5575-713a-0c03-3af627131c8b	CA	CAN	124	Canada 	Kanada	\N
00040000-5575-713a-fd36-57de50ff8151	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5575-713a-2d8e-59c1bcbfbd89	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5575-713a-eef4-227ab59f6d89	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5575-713a-b442-9a76e5f122f1	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5575-713a-f436-498fa1fcd6c1	CL	CHL	152	Chile 	Čile	\N
00040000-5575-713a-8325-caa500078953	CN	CHN	156	China 	Kitajska	\N
00040000-5575-713a-7942-8b51ebeaa217	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5575-713a-a971-54acd8908e63	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5575-713a-89a9-fefe450852c2	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5575-713a-b173-9085ccd60a1d	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5575-713a-f654-399df829492c	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5575-713a-38f0-013ce8d1305b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5575-713a-025f-dd53058f7895	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5575-713a-76f0-5514b8e5883e	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5575-713a-9e09-193ab7edfdc5	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5575-713a-476c-6620192d63a4	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5575-713a-061b-12909aa90d73	CU	CUB	192	Cuba 	Kuba	\N
00040000-5575-713a-b0bb-677eaddaac7b	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5575-713a-3fe9-b2dea686cdf9	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5575-713a-0925-3a2fb24416cb	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5575-713a-efd6-dfeb06df5ac1	DK	DNK	208	Denmark 	Danska	\N
00040000-5575-713a-7883-8690aee27557	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5575-713a-73e8-4a2ae40d4619	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5575-713a-c7cb-fbcf24f1d620	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5575-713a-e2c8-ec8033c6d81d	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5575-713a-9bcb-69ca83ecc4eb	EG	EGY	818	Egypt 	Egipt	\N
00040000-5575-713a-bcd3-e65ee703037e	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5575-713a-2cac-d12250c36a83	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5575-713a-feba-9d443c859973	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5575-713a-ea9c-bf61371fc700	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5575-713a-6876-730cbdb93f9e	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5575-713a-ac7a-f0b3be8e631b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5575-713a-cfab-4d428a91be2d	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5575-713a-3f0d-a5e319d2e88b	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5575-713a-7fa0-caf3e89ea36b	FI	FIN	246	Finland 	Finska	\N
00040000-5575-713a-2e5e-85982575b5c3	FR	FRA	250	France 	Francija	\N
00040000-5575-713a-48c4-cefb8f7aae12	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5575-713a-32dd-f0baa90e1adb	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5575-713a-9638-b623a8c3a6d9	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5575-713a-0bba-d750cb1ad880	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5575-713a-1474-06298d4569cd	GA	GAB	266	Gabon 	Gabon	\N
00040000-5575-713a-7cc8-ab04ff001ff4	GM	GMB	270	Gambia 	Gambija	\N
00040000-5575-713a-83b1-92499aaf1571	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5575-713a-651d-6458c31c5f32	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5575-713a-3dd0-86d601d8ad00	GH	GHA	288	Ghana 	Gana	\N
00040000-5575-713a-e0e8-d57703cf6f42	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5575-713a-c2a5-a73a0028845e	GR	GRC	300	Greece 	Grčija	\N
00040000-5575-713a-c848-6e56baed7fb7	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5575-713a-c00c-3727321fac94	GD	GRD	308	Grenada 	Grenada	\N
00040000-5575-713a-a72c-c80dfa83bb87	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5575-713a-7b57-be83373942c8	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5575-713a-81a1-66bd268dae29	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5575-713a-b2ae-c5927c229ed4	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5575-713a-17a2-b29a731ae352	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5575-713a-a8e8-2fc9322dda87	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5575-713a-9b70-cba09848c3a1	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5575-713a-ad5c-588484c6d4db	HT	HTI	332	Haiti 	Haiti	\N
00040000-5575-713a-4bb8-5d9dfcf708aa	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5575-713a-7d43-a67a05aa5703	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5575-713a-73d9-0815969425e1	HN	HND	340	Honduras 	Honduras	\N
00040000-5575-713a-dcfb-8bf89e518bb3	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5575-713a-0f86-b4681c287f68	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5575-713a-c843-6960487674b7	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5575-713a-48c4-241d045ba5d9	IN	IND	356	India 	Indija	\N
00040000-5575-713a-27f6-f4d49e43e908	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5575-713a-b6ba-1c02e43baaa8	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5575-713a-56a1-92aa2cb95af9	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5575-713a-0877-3ac000fc81d4	IE	IRL	372	Ireland 	Irska	\N
00040000-5575-713a-fca2-047033a66464	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5575-713a-0998-3518c6507318	IL	ISR	376	Israel 	Izrael	\N
00040000-5575-713a-4d85-29ff4204c642	IT	ITA	380	Italy 	Italija	\N
00040000-5575-713a-2369-3b3a93673f56	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5575-713a-4e04-be8f7dcd7d9e	JP	JPN	392	Japan 	Japonska	\N
00040000-5575-713a-8686-1b469cf2ddbf	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5575-713a-3860-796046c78905	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5575-713a-6cdd-4121dcb9640f	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5575-713a-814f-05dadf68b97b	KE	KEN	404	Kenya 	Kenija	\N
00040000-5575-713a-3b5b-4f7d7e87e200	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5575-713a-ce50-97e48e5b9439	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5575-713a-35c0-bd6651b03a66	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5575-713a-67a0-690bd8bc4318	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5575-713a-cb36-e9f916f2145f	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5575-713a-507f-a2c9b85ba993	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5575-713a-d006-643a165ae72b	LV	LVA	428	Latvia 	Latvija	\N
00040000-5575-713a-4ced-69c7b566c58f	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5575-713a-8c0a-b2d7f97e4be6	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5575-713a-8184-f8739187f84d	LR	LBR	430	Liberia 	Liberija	\N
00040000-5575-713a-5cf4-433986d3c272	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5575-713a-9287-ee9528653027	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5575-713a-f174-33a944ef68a1	LT	LTU	440	Lithuania 	Litva	\N
00040000-5575-713a-bb77-04c69f8636ec	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5575-713a-6a05-88080a830446	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5575-713a-951c-b4d75e58762c	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5575-713a-c3a2-c1a1cf52e6a4	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5575-713a-0a8e-b49b9358456b	MW	MWI	454	Malawi 	Malavi	\N
00040000-5575-713a-757a-838db8affa15	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5575-713a-a565-39a79eb4b826	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5575-713a-ad68-d8e695639ff3	ML	MLI	466	Mali 	Mali	\N
00040000-5575-713a-de11-77a9f59b6651	MT	MLT	470	Malta 	Malta	\N
00040000-5575-713a-47b4-b2d6662dfaab	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5575-713a-999a-898a6d1c9cf1	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5575-713a-4c02-37edb8cc14a6	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5575-713a-0335-6c1383729a50	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5575-713a-ec8d-290061b578a6	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5575-713a-41ac-4336490b81c7	MX	MEX	484	Mexico 	Mehika	\N
00040000-5575-713a-374c-2f88b35e3b39	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5575-713a-3db8-68cdbe344869	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5575-713a-3123-e6846a2c92fb	MC	MCO	492	Monaco 	Monako	\N
00040000-5575-713a-7514-6d385cbc2e92	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5575-713a-c4c8-e8537518dfa3	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5575-713a-bc08-130c262e5acb	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5575-713a-453d-ffa328c917cd	MA	MAR	504	Morocco 	Maroko	\N
00040000-5575-713a-2e84-460c536c0e41	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5575-713a-d69d-7abff285badc	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5575-713a-ff01-bcd35f34d1c7	NA	NAM	516	Namibia 	Namibija	\N
00040000-5575-713a-3a5a-067bc6f9acdf	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5575-713a-1001-7f4db0b0f1ea	NP	NPL	524	Nepal 	Nepal	\N
00040000-5575-713a-1c64-0f928d1ff59c	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5575-713a-3081-3c7fe7004ade	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5575-713a-02e6-1e949d379b25	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5575-713a-6050-0eacfd45454d	NE	NER	562	Niger 	Niger 	\N
00040000-5575-713a-1cd2-97c17080e532	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5575-713a-65b7-2218f9e6536f	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5575-713a-0b45-7ccb3ea76ea8	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5575-713a-7bfb-6c218594be40	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5575-713a-8d62-d33cbd609deb	NO	NOR	578	Norway 	Norveška	\N
00040000-5575-713a-094c-ff9a1b193a84	OM	OMN	512	Oman 	Oman	\N
00040000-5575-713a-77fa-5d27ef1da64d	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5575-713a-0b60-4fb11da5d1bb	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5575-713a-12eb-26369db9013f	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5575-713a-6286-35748ab3f67c	PA	PAN	591	Panama 	Panama	\N
00040000-5575-713a-cc6b-984b04892eb8	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5575-713a-0b97-79c54e43530a	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5575-713a-b891-3c4c44b5e4e7	PE	PER	604	Peru 	Peru	\N
00040000-5575-713a-8ff6-3d78c6795bd2	PH	PHL	608	Philippines 	Filipini	\N
00040000-5575-713a-4ac3-c9a6596da95f	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5575-713a-7118-faee661fdbfa	PL	POL	616	Poland 	Poljska	\N
00040000-5575-713a-e430-b15908da6c41	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5575-713a-db6b-c7be9971068d	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5575-713a-3c29-715973a4fe5a	QA	QAT	634	Qatar 	Katar	\N
00040000-5575-713a-ed28-ce62a588c13a	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5575-713a-d45e-d920546459b3	RO	ROU	642	Romania 	Romunija	\N
00040000-5575-713a-372b-f21047ea872e	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5575-713a-2d5e-8f9235fb1344	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5575-713a-3bf5-265e621adb60	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5575-713a-0080-e019d4dc9fbf	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5575-713a-c00e-4b0477bb153c	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5575-713a-bbd2-b904326160c0	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5575-713a-ae3c-5f5c36d1453d	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5575-713a-5d49-6b2053b34881	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5575-713a-e310-8f6a442a8e43	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5575-713a-8cb7-25950e6f037a	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5575-713a-29d1-98ef19d15c01	SM	SMR	674	San Marino 	San Marino	\N
00040000-5575-713a-5581-e114df67f957	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5575-713a-8e57-85b2095f6e94	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5575-713a-e201-b5d4c11923b5	SN	SEN	686	Senegal 	Senegal	\N
00040000-5575-713a-fd5a-170bbf1d5888	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5575-713a-8f21-7e74f734fcd7	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5575-713a-b82e-ae5445c0d109	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5575-713a-c7b1-2151ed405115	SG	SGP	702	Singapore 	Singapur	\N
00040000-5575-713a-9cda-552c38f0f0b1	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5575-713a-83b4-fae14521a47d	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5575-713a-6131-5998a2f501c6	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5575-713a-b033-3bf8d28fd094	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5575-713a-86c6-b110ad328661	SO	SOM	706	Somalia 	Somalija	\N
00040000-5575-713a-fc39-efba817597fb	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5575-713a-4e62-b839ca7023dc	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5575-713a-329a-cbec64aab002	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5575-713a-3378-14da85c6a803	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5575-713a-42ec-6cba0a8423a9	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5575-713a-795f-8619ffbbd8e9	SD	SDN	729	Sudan 	Sudan	\N
00040000-5575-713a-3033-5ca057c9d4db	SR	SUR	740	Suriname 	Surinam	\N
00040000-5575-713a-c422-b71bdacbce57	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5575-713a-e365-ec7aae0c59d8	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5575-713a-e372-cfc678636496	SE	SWE	752	Sweden 	Švedska	\N
00040000-5575-713a-3ac3-f1b01563a662	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5575-713a-f524-b9db66c3f3f6	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5575-713a-a8da-42b32ea3e6cf	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5575-713a-08bc-47fecb6af7f6	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5575-713a-1146-048c7d26d0d2	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5575-713a-4fd2-aec15b3e5321	TH	THA	764	Thailand 	Tajska	\N
00040000-5575-713a-f9b3-b4191ae8796c	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5575-713a-5421-5b080560d6f4	TG	TGO	768	Togo 	Togo	\N
00040000-5575-713a-36c7-f118bf99d935	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5575-713a-89ff-f37573f7e6eb	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5575-713a-67d4-793b6b425cf4	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5575-713a-0ded-9707cfa033ee	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5575-713a-2d33-805080710372	TR	TUR	792	Turkey 	Turčija	\N
00040000-5575-713a-512e-108401d4898e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5575-713a-b104-2b52717bc31d	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5575-713a-5d38-55b3da89dafc	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5575-713a-a634-ef93403b5c8b	UG	UGA	800	Uganda 	Uganda	\N
00040000-5575-713a-752f-f388238ff834	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5575-713a-74da-41d4b2d0a16e	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5575-713a-4b9d-4d495224c304	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5575-713a-83af-fc5483f8a253	US	USA	840	United States 	Združene države Amerike	\N
00040000-5575-713a-61d5-ddfb380f00b4	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5575-713a-2479-1deffc5c062d	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5575-713a-031d-cb7fb2ce84e7	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5575-713a-c064-41e6241df39b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5575-713a-0898-3a6cf1c305e4	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5575-713a-653b-a5acaf9879a0	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5575-713a-96ed-801889264e3e	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5575-713a-838c-85351d22cb34	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5575-713a-a526-61b5bd0a65d0	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5575-713a-5060-1ffd771300e0	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5575-713a-47db-dd4f0ede2e6c	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5575-713a-749f-3b4df95f9df4	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5575-713a-f351-17297da2f3fe	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2832 (class 0 OID 6545289)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tipprogramskeenote_id, tip) FROM stdin;
\.


--
-- TOC entry 2817 (class 0 OID 6545091)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5575-713b-ba55-b0e55ba2f7cf	000e0000-5575-713b-bb5e-332648062ce1	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5575-713a-70d4-b58c99b399e9
000d0000-5575-713b-3592-2c78b974626d	000e0000-5575-713b-bb5e-332648062ce1	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5575-713a-70d4-b58c99b399e9
000d0000-5575-713b-48f2-7e3700955cbe	000e0000-5575-713b-bb5e-332648062ce1	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5575-713a-3e90-fcc1e477b5c9
000d0000-5575-713b-25a6-0faca5f28186	000e0000-5575-713b-bb5e-332648062ce1	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5575-713a-544c-96c8e415e2f8
000d0000-5575-713b-3cd0-aed3da187152	000e0000-5575-713b-bb5e-332648062ce1	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5575-713a-544c-96c8e415e2f8
000d0000-5575-713b-9226-49a1e207cb59	000e0000-5575-713b-bb5e-332648062ce1	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5575-713a-544c-96c8e415e2f8
000d0000-5575-713b-ba16-44a482add861	000e0000-5575-713b-bb5e-332648062ce1	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5575-713a-70d4-b58c99b399e9
\.


--
-- TOC entry 2796 (class 0 OID 6544911)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2800 (class 0 OID 6544959)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2794 (class 0 OID 6544891)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5575-713b-9bf6-153ac9f1885d	00080000-5575-713b-fbd2-b3733cd3b110	00090000-5575-713b-5d72-2b4967303ac8	AK		
\.


--
-- TOC entry 2774 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2806 (class 0 OID 6545008)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2810 (class 0 OID 6545033)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2791 (class 0 OID 6544848)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5575-713b-bcbf-442f6064954a	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5575-713b-710d-a50bb0a7aa56	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5575-713b-9974-899aed6a913a	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5575-713b-2431-260d81e8f3fb	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5575-713b-dc38-1c042cd6ec8a	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5575-713b-77c7-5db7c0b3be40	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5575-713b-48bb-a247cbe8fcc6	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5575-713b-392a-d0c733f8e9d7	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5575-713b-bcd2-540beb35d385	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5575-713b-46e6-a1a4cda667b0	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5575-713b-732c-58c05a470fdd	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5575-713b-202e-97d16fe173d2	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5575-713b-7e9d-8602259047d8	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5575-713b-8db5-69f13ba67d2b	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5575-713b-c027-d61a35ac87fd	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5575-713b-54e3-3abf3a8621d1	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2785 (class 0 OID 6544761)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5575-713b-182a-ce7ad1fca7c2	00000000-5575-713b-dc38-1c042cd6ec8a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5575-713b-7640-52a01ed2b23e	00000000-5575-713b-dc38-1c042cd6ec8a	00010000-5575-713b-069b-1aae1488abc3	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5575-713b-78e3-3ca031e6b9ca	00000000-5575-713b-77c7-5db7c0b3be40	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2786 (class 0 OID 6544772)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5575-713b-cf97-8b2a9b8cc268	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5575-713b-30fd-881e4314b553	00010000-5575-713b-a5d6-cd8f410ea591	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5575-713b-9efb-6f168a07a0d1	00010000-5575-713b-f63d-c28237c5d3c6	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5575-713b-2291-ab5cde1f605b	00010000-5575-713b-331b-208b2cfd95f9	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5575-713b-d247-cb35e6720faf	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5575-713b-30a6-9b53503977b8	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5575-713b-56f8-c26eaffe34fb	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5575-713b-50e4-721d41442990	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5575-713b-5d72-2b4967303ac8	00010000-5575-713b-a0d9-32963cdd44c3	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5575-713b-8cba-e6ecc8731c23	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5575-713b-2402-163011a0d94a	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5575-713b-3438-e88de9c431a0	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5575-713b-f7f0-1173f831ff8d	00010000-5575-713b-f5f0-70f4512df31d	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2776 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2781 (class 0 OID 6544726)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5575-713a-6de0-9dc69c32ccea	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5575-713a-d276-a450b3e7ba80	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5575-713a-c3ec-54e7940ecf75	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5575-713a-2237-57747b641a94	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5575-713a-19ec-563595ced3d3	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5575-713a-be00-61c5d42dd3ea	Abonma-read	Abonma - branje	f
00030000-5575-713a-d176-3b7f37b71580	Abonma-write	Abonma - spreminjanje	f
00030000-5575-713a-06d9-a51421cde373	Alternacija-read	Alternacija - branje	f
00030000-5575-713a-f3f1-175b79b95188	Alternacija-write	Alternacija - spreminjanje	f
00030000-5575-713a-4708-c918c4856caf	Arhivalija-read	Arhivalija - branje	f
00030000-5575-713a-621c-8fc14a36f5fa	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5575-713a-255f-f56dc8f34a0c	Besedilo-read	Besedilo - branje	f
00030000-5575-713a-2f27-96c35c8e343b	Besedilo-write	Besedilo - spreminjanje	f
00030000-5575-713a-6efb-8ff4d15d70c1	DogodekIzven-read	DogodekIzven - branje	f
00030000-5575-713a-537e-d4443f0b5394	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5575-713a-3770-5658037954d1	Dogodek-read	Dogodek - branje	f
00030000-5575-713a-256f-08d3887ad179	Dogodek-write	Dogodek - spreminjanje	f
00030000-5575-713a-26e1-de29b94355e0	Drzava-read	Drzava - branje	f
00030000-5575-713a-ea1f-8c8801a609ff	Drzava-write	Drzava - spreminjanje	f
00030000-5575-713a-9d1e-e6b399522c4b	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5575-713a-5993-bb0007275f5a	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5575-713a-86d9-19ee51b7994b	Funkcija-read	Funkcija - branje	f
00030000-5575-713a-c224-8625a0cc308a	Funkcija-write	Funkcija - spreminjanje	f
00030000-5575-713a-0dd6-0b2dc1a921b5	Gostovanje-read	Gostovanje - branje	f
00030000-5575-713a-e63c-5076ac767264	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5575-713a-2493-f3e9587ac1fc	Gostujoca-read	Gostujoca - branje	f
00030000-5575-713a-772f-1d8d1b0d6ecd	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5575-713a-8d8f-b49e53814a10	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5575-713a-fa76-75c48daf31ee	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5575-713a-96b9-4c8334d7aa71	Kupec-read	Kupec - branje	f
00030000-5575-713a-2852-3500c073367f	Kupec-write	Kupec - spreminjanje	f
00030000-5575-713a-3e05-2cbf59622689	NacinPlacina-read	NacinPlacina - branje	f
00030000-5575-713a-a996-f1ebbc57e713	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5575-713a-0ea4-ca1f4f998f87	Option-read	Option - branje	f
00030000-5575-713a-ea77-975d3d7acfb0	Option-write	Option - spreminjanje	f
00030000-5575-713a-3078-bd3b3629af2d	OptionValue-read	OptionValue - branje	f
00030000-5575-713a-b645-ce9558207e35	OptionValue-write	OptionValue - spreminjanje	f
00030000-5575-713a-bd2d-631edd1fe43b	Oseba-read	Oseba - branje	f
00030000-5575-713a-dab0-f94beb046488	Oseba-write	Oseba - spreminjanje	f
00030000-5575-713a-c24b-e0e0aecbee42	Permission-read	Permission - branje	f
00030000-5575-713a-581e-1cec7eb3f828	Permission-write	Permission - spreminjanje	f
00030000-5575-713a-d8d8-87e93c4c4a82	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5575-713a-e10a-1bf54f58e0a0	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5575-713a-4d6a-51233ab9aaf7	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5575-713a-9293-d8136741e5a3	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5575-713a-f15b-e79d8b411133	Pogodba-read	Pogodba - branje	f
00030000-5575-713a-8ab4-b01c08f58b87	Pogodba-write	Pogodba - spreminjanje	f
00030000-5575-713a-dc14-5ae28dfdbd67	Popa-read	Popa - branje	f
00030000-5575-713a-c29a-e693bd7d0c13	Popa-write	Popa - spreminjanje	f
00030000-5575-713a-421c-d5877db62ed2	Posta-read	Posta - branje	f
00030000-5575-713a-734b-0664d22bcf86	Posta-write	Posta - spreminjanje	f
00030000-5575-713a-c598-1d907afbd713	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5575-713a-bddf-8ad39998da23	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5575-713a-c7b2-44f52d7cbeb7	PostniNaslov-read	PostniNaslov - branje	f
00030000-5575-713a-4545-336749a2d1c8	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5575-713a-880f-62b12e1d09dd	Predstava-read	Predstava - branje	f
00030000-5575-713a-8347-e60461dabf6a	Predstava-write	Predstava - spreminjanje	f
00030000-5575-713a-bddd-b82971b56df1	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5575-713a-b2d6-0d87aa647bb1	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5575-713a-7a2c-9e339ba1ff11	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5575-713a-143c-45b20a6a7bc0	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5575-713a-2d22-4d8c4a780617	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5575-713a-ec3f-5bc85b48c58e	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5575-713a-7add-346180d2bd94	ProgramDela-read	ProgramDela - branje	f
00030000-5575-713a-420b-c20080f5dbe2	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5575-713a-a4d6-191b6d8e440a	ProgramFestival-read	ProgramFestival - branje	f
00030000-5575-713a-0df6-76e63fc1f86d	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5575-713a-69fa-f0b3e88d74e4	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5575-713a-4d74-6ae90d72bdfc	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5575-713a-354f-361503408e86	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5575-713a-f134-0b14a1dc0712	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5575-713a-5617-5336d94616fb	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5575-713a-d335-10191c16ab75	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5575-713a-9279-8aec91c87663	ProgramPonovitev-read	ProgramPonovitev - branje	f
00030000-5575-713a-f77f-be08d91a4929	ProgramPonovitev-write	ProgramPonovitev - spreminjanje	f
00030000-5575-713a-b1b1-305c136a2a1e	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5575-713a-ad34-bb36c8706ec8	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5575-713a-271f-5ebca116e066	Prostor-read	Prostor - branje	f
00030000-5575-713a-861f-532ae01742f1	Prostor-write	Prostor - spreminjanje	f
00030000-5575-713a-c7c0-c175d19fe700	Racun-read	Racun - branje	f
00030000-5575-713a-1c8b-2716135d9a5a	Racun-write	Racun - spreminjanje	f
00030000-5575-713a-1c26-43c5b23b0dd3	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5575-713a-187f-c92316f6d384	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5575-713a-88e1-1f494cd165eb	Readme-read	Readme - branje	f
00030000-5575-713a-a67d-bd2bfb4fbb16	Readme-write	Readme - spreminjanje	f
00030000-5575-713a-6572-c17d3b4490d3	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5575-713a-b235-162a553f3d3a	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5575-713a-36a3-d30cfbd09659	Rekvizit-read	Rekvizit - branje	f
00030000-5575-713a-ad0f-a6e16fbe41de	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5575-713a-4f10-62993bcb5e75	Revizija-read	Revizija - branje	f
00030000-5575-713a-8584-bf1fbf33dff7	Revizija-write	Revizija - spreminjanje	f
00030000-5575-713a-a310-448c039ec7e7	Rezervacija-read	Rezervacija - branje	f
00030000-5575-713a-c974-8f15e1238274	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5575-713a-b3b1-4c08ef123a50	Role-read	Role - branje	f
00030000-5575-713a-3080-836f5ccdb539	Role-write	Role - spreminjanje	f
00030000-5575-713a-79b4-c39cd76e5e14	SedezniRed-read	SedezniRed - branje	f
00030000-5575-713a-0d53-3d79e2beee4a	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5575-713a-cb8b-3f27e471c6d6	Sedez-read	Sedez - branje	f
00030000-5575-713a-752a-69d2f1e35e6a	Sedez-write	Sedez - spreminjanje	f
00030000-5575-713a-c786-179ffe1ab8d5	Sezona-read	Sezona - branje	f
00030000-5575-713a-6174-b08aa47100e7	Sezona-write	Sezona - spreminjanje	f
00030000-5575-713a-6832-c78fefe7200a	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5575-713a-37fd-b6839102838e	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5575-713a-1c19-432856977c3d	Stevilcenje-read	Stevilcenje - branje	f
00030000-5575-713a-a811-fdfe5b224ebb	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5575-713a-cc2f-5982bb1fbf54	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5575-713a-21f2-66a9298f16fa	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5575-713a-8b97-a4e76a32f0bb	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5575-713a-8ec0-a1e1fa8676de	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5575-713a-13e1-06cb5fef2cb3	Telefonska-read	Telefonska - branje	f
00030000-5575-713a-369f-b855e6bdbef0	Telefonska-write	Telefonska - spreminjanje	f
00030000-5575-713a-8f19-aeea9ab49d46	TerminStoritve-read	TerminStoritve - branje	f
00030000-5575-713a-be58-77c5aa9b09e6	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5575-713a-6b74-fac14328c4d5	TipFunkcije-read	TipFunkcije - branje	f
00030000-5575-713a-19e9-2ebc94dda0b7	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5575-713a-6024-d16d43db95ef	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5575-713a-bbc8-ce5878094537	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5575-713a-2464-e8c981794b3c	Trr-read	Trr - branje	f
00030000-5575-713a-9876-b6a458abae93	Trr-write	Trr - spreminjanje	f
00030000-5575-713a-1b72-08fc1c5d1ec1	Uprizoritev-read	Uprizoritev - branje	f
00030000-5575-713a-38db-12d909132601	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5575-713a-e4b8-44db005c0ffb	User-read	User - branje	f
00030000-5575-713a-f1bf-2ed31de9abd9	User-write	User - spreminjanje	f
00030000-5575-713a-abbe-6baa352747d3	Vaja-read	Vaja - branje	f
00030000-5575-713a-12bd-b1092569578e	Vaja-write	Vaja - spreminjanje	f
00030000-5575-713a-b9ca-c03d21911885	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5575-713a-a122-bbe5f82b429a	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5575-713a-dcbc-d0e566113f0c	Zaposlitev-read	Zaposlitev - branje	f
00030000-5575-713a-651c-df8ed5448b36	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5575-713a-4e14-c5da5bcb3566	Zasedenost-read	Zasedenost - branje	f
00030000-5575-713a-bebe-9c1793105d6f	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5575-713a-3245-4d9c4f66aa9e	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5575-713a-f67c-ee750272012e	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5575-713a-a88e-9f7ceb82acf5	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5575-713a-6b4d-fbeed471adce	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2783 (class 0 OID 6544745)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5575-713a-1851-b94a63366823	00030000-5575-713a-26e1-de29b94355e0
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-be00-61c5d42dd3ea
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-d176-3b7f37b71580
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-06d9-a51421cde373
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-f3f1-175b79b95188
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-4708-c918c4856caf
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-3770-5658037954d1
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-2237-57747b641a94
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-256f-08d3887ad179
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-26e1-de29b94355e0
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-ea1f-8c8801a609ff
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-86d9-19ee51b7994b
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-c224-8625a0cc308a
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-0dd6-0b2dc1a921b5
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-e63c-5076ac767264
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-2493-f3e9587ac1fc
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-772f-1d8d1b0d6ecd
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-8d8f-b49e53814a10
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-fa76-75c48daf31ee
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-0ea4-ca1f4f998f87
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-3078-bd3b3629af2d
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-bd2d-631edd1fe43b
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-dab0-f94beb046488
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-dc14-5ae28dfdbd67
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-c29a-e693bd7d0c13
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-421c-d5877db62ed2
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-734b-0664d22bcf86
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-c7b2-44f52d7cbeb7
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-4545-336749a2d1c8
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-880f-62b12e1d09dd
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-8347-e60461dabf6a
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-2d22-4d8c4a780617
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-ec3f-5bc85b48c58e
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-271f-5ebca116e066
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-861f-532ae01742f1
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-6572-c17d3b4490d3
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-b235-162a553f3d3a
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-36a3-d30cfbd09659
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-ad0f-a6e16fbe41de
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-c786-179ffe1ab8d5
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-6174-b08aa47100e7
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-6b74-fac14328c4d5
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-1b72-08fc1c5d1ec1
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-38db-12d909132601
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-abbe-6baa352747d3
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-12bd-b1092569578e
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-4e14-c5da5bcb3566
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-bebe-9c1793105d6f
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-3245-4d9c4f66aa9e
00020000-5575-713a-efd1-7666be36b5a1	00030000-5575-713a-a88e-9f7ceb82acf5
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-be00-61c5d42dd3ea
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-4708-c918c4856caf
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-3770-5658037954d1
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-26e1-de29b94355e0
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-0dd6-0b2dc1a921b5
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-2493-f3e9587ac1fc
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-8d8f-b49e53814a10
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-fa76-75c48daf31ee
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-0ea4-ca1f4f998f87
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-3078-bd3b3629af2d
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-bd2d-631edd1fe43b
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-dab0-f94beb046488
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-dc14-5ae28dfdbd67
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-421c-d5877db62ed2
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-c7b2-44f52d7cbeb7
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-4545-336749a2d1c8
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-880f-62b12e1d09dd
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-271f-5ebca116e066
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-6572-c17d3b4490d3
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-36a3-d30cfbd09659
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-c786-179ffe1ab8d5
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-13e1-06cb5fef2cb3
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-369f-b855e6bdbef0
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-2464-e8c981794b3c
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-9876-b6a458abae93
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-dcbc-d0e566113f0c
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-651c-df8ed5448b36
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-3245-4d9c4f66aa9e
00020000-5575-713a-53e1-966805f31acb	00030000-5575-713a-a88e-9f7ceb82acf5
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-be00-61c5d42dd3ea
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-06d9-a51421cde373
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-4708-c918c4856caf
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-621c-8fc14a36f5fa
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-255f-f56dc8f34a0c
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-6efb-8ff4d15d70c1
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-3770-5658037954d1
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-26e1-de29b94355e0
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-86d9-19ee51b7994b
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-0dd6-0b2dc1a921b5
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-2493-f3e9587ac1fc
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-8d8f-b49e53814a10
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-0ea4-ca1f4f998f87
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-3078-bd3b3629af2d
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-bd2d-631edd1fe43b
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-dc14-5ae28dfdbd67
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-421c-d5877db62ed2
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-880f-62b12e1d09dd
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-2d22-4d8c4a780617
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-271f-5ebca116e066
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-6572-c17d3b4490d3
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-36a3-d30cfbd09659
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-c786-179ffe1ab8d5
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-6b74-fac14328c4d5
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-abbe-6baa352747d3
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-4e14-c5da5bcb3566
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-3245-4d9c4f66aa9e
00020000-5575-713b-3eb4-9ffdca3ff728	00030000-5575-713a-a88e-9f7ceb82acf5
00020000-5575-713b-85ba-e9c5beb2e7c6	00030000-5575-713a-be00-61c5d42dd3ea
00020000-5575-713b-85ba-e9c5beb2e7c6	00030000-5575-713a-d176-3b7f37b71580
00020000-5575-713b-85ba-e9c5beb2e7c6	00030000-5575-713a-f3f1-175b79b95188
00020000-5575-713b-85ba-e9c5beb2e7c6	00030000-5575-713a-4708-c918c4856caf
00020000-5575-713b-85ba-e9c5beb2e7c6	00030000-5575-713a-3770-5658037954d1
00020000-5575-713b-85ba-e9c5beb2e7c6	00030000-5575-713a-26e1-de29b94355e0
00020000-5575-713b-85ba-e9c5beb2e7c6	00030000-5575-713a-0dd6-0b2dc1a921b5
00020000-5575-713b-85ba-e9c5beb2e7c6	00030000-5575-713a-2493-f3e9587ac1fc
00020000-5575-713b-85ba-e9c5beb2e7c6	00030000-5575-713a-0ea4-ca1f4f998f87
00020000-5575-713b-85ba-e9c5beb2e7c6	00030000-5575-713a-3078-bd3b3629af2d
00020000-5575-713b-85ba-e9c5beb2e7c6	00030000-5575-713a-dc14-5ae28dfdbd67
00020000-5575-713b-85ba-e9c5beb2e7c6	00030000-5575-713a-421c-d5877db62ed2
00020000-5575-713b-85ba-e9c5beb2e7c6	00030000-5575-713a-880f-62b12e1d09dd
00020000-5575-713b-85ba-e9c5beb2e7c6	00030000-5575-713a-271f-5ebca116e066
00020000-5575-713b-85ba-e9c5beb2e7c6	00030000-5575-713a-6572-c17d3b4490d3
00020000-5575-713b-85ba-e9c5beb2e7c6	00030000-5575-713a-36a3-d30cfbd09659
00020000-5575-713b-85ba-e9c5beb2e7c6	00030000-5575-713a-c786-179ffe1ab8d5
00020000-5575-713b-85ba-e9c5beb2e7c6	00030000-5575-713a-6b74-fac14328c4d5
00020000-5575-713b-85ba-e9c5beb2e7c6	00030000-5575-713a-3245-4d9c4f66aa9e
00020000-5575-713b-85ba-e9c5beb2e7c6	00030000-5575-713a-a88e-9f7ceb82acf5
00020000-5575-713b-bcd4-9645efb244c7	00030000-5575-713a-be00-61c5d42dd3ea
00020000-5575-713b-bcd4-9645efb244c7	00030000-5575-713a-4708-c918c4856caf
00020000-5575-713b-bcd4-9645efb244c7	00030000-5575-713a-3770-5658037954d1
00020000-5575-713b-bcd4-9645efb244c7	00030000-5575-713a-26e1-de29b94355e0
00020000-5575-713b-bcd4-9645efb244c7	00030000-5575-713a-0dd6-0b2dc1a921b5
00020000-5575-713b-bcd4-9645efb244c7	00030000-5575-713a-2493-f3e9587ac1fc
00020000-5575-713b-bcd4-9645efb244c7	00030000-5575-713a-0ea4-ca1f4f998f87
00020000-5575-713b-bcd4-9645efb244c7	00030000-5575-713a-3078-bd3b3629af2d
00020000-5575-713b-bcd4-9645efb244c7	00030000-5575-713a-dc14-5ae28dfdbd67
00020000-5575-713b-bcd4-9645efb244c7	00030000-5575-713a-421c-d5877db62ed2
00020000-5575-713b-bcd4-9645efb244c7	00030000-5575-713a-880f-62b12e1d09dd
00020000-5575-713b-bcd4-9645efb244c7	00030000-5575-713a-271f-5ebca116e066
00020000-5575-713b-bcd4-9645efb244c7	00030000-5575-713a-6572-c17d3b4490d3
00020000-5575-713b-bcd4-9645efb244c7	00030000-5575-713a-36a3-d30cfbd09659
00020000-5575-713b-bcd4-9645efb244c7	00030000-5575-713a-c786-179ffe1ab8d5
00020000-5575-713b-bcd4-9645efb244c7	00030000-5575-713a-8f19-aeea9ab49d46
00020000-5575-713b-bcd4-9645efb244c7	00030000-5575-713a-c3ec-54e7940ecf75
00020000-5575-713b-bcd4-9645efb244c7	00030000-5575-713a-6b74-fac14328c4d5
00020000-5575-713b-bcd4-9645efb244c7	00030000-5575-713a-3245-4d9c4f66aa9e
00020000-5575-713b-bcd4-9645efb244c7	00030000-5575-713a-a88e-9f7ceb82acf5
\.


--
-- TOC entry 2811 (class 0 OID 6545040)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2815 (class 0 OID 6545071)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2827 (class 0 OID 6545209)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2788 (class 0 OID 6544805)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5575-713b-fbd2-b3733cd3b110	00040000-5575-713a-58f8-1ee8d1684efc	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5575-713b-0fd4-a871ebb87530	00040000-5575-713a-58f8-1ee8d1684efc	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5575-713b-34fc-2743fdd74876	00040000-5575-713a-58f8-1ee8d1684efc	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5575-713b-8255-d4c41adb049d	00040000-5575-713a-58f8-1ee8d1684efc	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2790 (class 0 OID 6544840)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5575-713a-cacc-a0eff768569e	8341	Adlešiči
00050000-5575-713a-16c1-678e421ea67d	5270	Ajdovščina
00050000-5575-713a-626f-19e724e6ed49	6280	Ankaran/Ancarano
00050000-5575-713a-9ac8-e795e7f744a2	9253	Apače
00050000-5575-713a-bf84-72f10c8d149e	8253	Artiče
00050000-5575-713a-14b8-e607cd15c1e6	4275	Begunje na Gorenjskem
00050000-5575-713a-32c3-95b8c507e290	1382	Begunje pri Cerknici
00050000-5575-713a-d4b5-b075d63de309	9231	Beltinci
00050000-5575-713a-c192-62cf7bd651ef	2234	Benedikt
00050000-5575-713a-cdfa-d902812f6c4c	2345	Bistrica ob Dravi
00050000-5575-713a-fb56-71534e6d6bda	3256	Bistrica ob Sotli
00050000-5575-713a-9551-5c6052df6f1e	8259	Bizeljsko
00050000-5575-713a-f10d-a0dacdc8fb1f	1223	Blagovica
00050000-5575-713a-fc45-e9e6fc42bf67	8283	Blanca
00050000-5575-713a-1083-4a97740c9ab9	4260	Bled
00050000-5575-713a-979e-d2ee484c8c3d	4273	Blejska Dobrava
00050000-5575-713a-5f9a-16ccb9b6db4e	9265	Bodonci
00050000-5575-713a-5d60-6e56dfb9983f	9222	Bogojina
00050000-5575-713a-2ed3-66ea67edaeb4	4263	Bohinjska Bela
00050000-5575-713a-99c8-7f8847cf0839	4264	Bohinjska Bistrica
00050000-5575-713a-b447-234d7bf459b0	4265	Bohinjsko jezero
00050000-5575-713a-5ede-ddad07583d4e	1353	Borovnica
00050000-5575-713a-0e7a-3448779ec17b	8294	Boštanj
00050000-5575-713a-f579-33d183890eef	5230	Bovec
00050000-5575-713a-6e8f-dab39d34d769	5295	Branik
00050000-5575-713a-0066-43ee38759d78	3314	Braslovče
00050000-5575-713a-583f-89d4aa8ab416	5223	Breginj
00050000-5575-713a-2556-d846fec1b377	8280	Brestanica
00050000-5575-713a-33df-93f07b2c6536	2354	Bresternica
00050000-5575-713a-6135-162d6e26907f	4243	Brezje
00050000-5575-713a-e8c2-541292db941f	1351	Brezovica pri Ljubljani
00050000-5575-713a-a3c6-117622d9139d	8250	Brežice
00050000-5575-713a-7104-d79469bc47b7	4210	Brnik - Aerodrom
00050000-5575-713a-9b31-25abc0c6823c	8321	Brusnice
00050000-5575-713a-3619-4ecc39ab3539	3255	Buče
00050000-5575-713a-84da-79b666eba3d4	8276	Bučka 
00050000-5575-713a-af52-a1000a2e0fa2	9261	Cankova
00050000-5575-713a-2a01-7b89034e3ca1	3000	Celje 
00050000-5575-713a-670d-0cdea703f03a	3001	Celje - poštni predali
00050000-5575-713a-b61d-e55845e17837	4207	Cerklje na Gorenjskem
00050000-5575-713a-25e6-46d01400aac2	8263	Cerklje ob Krki
00050000-5575-713a-665d-b6b57b0a2214	1380	Cerknica
00050000-5575-713a-d8e1-18a404d2e14a	5282	Cerkno
00050000-5575-713a-50d3-ef34f2040eef	2236	Cerkvenjak
00050000-5575-713a-59ff-bcf1a8911fce	2215	Ceršak
00050000-5575-713a-2e32-088cf11f4a00	2326	Cirkovce
00050000-5575-713a-49a2-c40c28a7de98	2282	Cirkulane
00050000-5575-713a-550a-71435abab24c	5273	Col
00050000-5575-713a-f288-e6ac618240c8	8251	Čatež ob Savi
00050000-5575-713a-14ac-f24072d751e4	1413	Čemšenik
00050000-5575-713a-5c05-bdc840d39667	5253	Čepovan
00050000-5575-713a-19ab-1d050bac00b1	9232	Črenšovci
00050000-5575-713a-e04f-eb29794d0610	2393	Črna na Koroškem
00050000-5575-713a-2a3a-6ec441fa5ac5	6275	Črni Kal
00050000-5575-713a-8927-f0c1d2a6a63d	5274	Črni Vrh nad Idrijo
00050000-5575-713a-4b15-5c0ae49bfe7d	5262	Črniče
00050000-5575-713a-6696-7dc307fedc3e	8340	Črnomelj
00050000-5575-713a-065d-ee6c70278798	6271	Dekani
00050000-5575-713a-8848-ff9e2f5bcf4c	5210	Deskle
00050000-5575-713a-cd55-d7e903ac9d5f	2253	Destrnik
00050000-5575-713a-de3f-58116d0e66be	6215	Divača
00050000-5575-713a-f544-e59218738d4e	1233	Dob
00050000-5575-713a-a5bc-52d66272e902	3224	Dobje pri Planini
00050000-5575-713a-c67a-83a70e83d0e0	8257	Dobova
00050000-5575-713a-2314-01cf19a0fb69	1423	Dobovec
00050000-5575-713a-4532-11ada4bc52dc	5263	Dobravlje
00050000-5575-713a-4954-9fa8db88c6ae	3204	Dobrna
00050000-5575-713a-9b32-53223a737ac7	8211	Dobrnič
00050000-5575-713a-cd9d-844737857209	1356	Dobrova
00050000-5575-713a-33d0-5c2f17be93d3	9223	Dobrovnik/Dobronak 
00050000-5575-713a-a702-e2c6e557e060	5212	Dobrovo v Brdih
00050000-5575-713a-e45f-0cc507b8d708	1431	Dol pri Hrastniku
00050000-5575-713a-c5b0-024166093bd2	1262	Dol pri Ljubljani
00050000-5575-713a-e794-0f3854bc8473	1273	Dole pri Litiji
00050000-5575-713a-9f63-13021d0afe49	1331	Dolenja vas
00050000-5575-713a-f937-c81cbdf17fd8	8350	Dolenjske Toplice
00050000-5575-713a-6941-977361703a28	1230	Domžale
00050000-5575-713a-921d-7ce93da67000	2252	Dornava
00050000-5575-713a-9c93-f1ba08843a6b	5294	Dornberk
00050000-5575-713a-af59-96048066cd3e	1319	Draga
00050000-5575-713a-11a2-f85fd21a3d84	8343	Dragatuš
00050000-5575-713a-9f6b-76efea382388	3222	Dramlje
00050000-5575-713a-f1ba-0df5cba1c6aa	2370	Dravograd
00050000-5575-713a-80bf-6d95673a961b	4203	Duplje
00050000-5575-713a-6a22-ef0fee164567	6221	Dutovlje
00050000-5575-713a-3025-c4216cf43ed9	8361	Dvor
00050000-5575-713a-8aed-ec750cbfc042	2343	Fala
00050000-5575-713a-0b41-1fca4a4d9037	9208	Fokovci
00050000-5575-713a-d48e-e6abdf630059	2313	Fram
00050000-5575-713a-4116-a237a93fd893	3213	Frankolovo
00050000-5575-713a-6ab6-4014ff45a066	1274	Gabrovka
00050000-5575-713a-cad7-deabf16f5476	8254	Globoko
00050000-5575-713a-a783-4d10a7cd126c	5275	Godovič
00050000-5575-713a-adf7-700d7c845aed	4204	Golnik
00050000-5575-713a-57d6-e0f2cf286513	3303	Gomilsko
00050000-5575-713a-9e35-1617e128e4f7	4224	Gorenja vas
00050000-5575-713a-fad3-52b7f4958c48	3263	Gorica pri Slivnici
00050000-5575-713a-4f4d-4b57b1dfddf9	2272	Gorišnica
00050000-5575-713a-a291-869cf623bb05	9250	Gornja Radgona
00050000-5575-713a-9b4c-70f2ba0bece2	3342	Gornji Grad
00050000-5575-713a-a8a7-1ab85802bba8	4282	Gozd Martuljek
00050000-5575-713a-b40f-324b1d9768be	6272	Gračišče
00050000-5575-713a-abfa-cf6120937eb2	9264	Grad
00050000-5575-713a-8887-ba4f91058933	8332	Gradac
00050000-5575-713a-f8aa-2537309600c7	1384	Grahovo
00050000-5575-713a-e3f4-c99cbabc1d50	5242	Grahovo ob Bači
00050000-5575-713a-850f-bdc71e4bc373	5251	Grgar
00050000-5575-713a-6b55-924ee7b7d879	3302	Griže
00050000-5575-713a-1b9f-963c610a8b6e	3231	Grobelno
00050000-5575-713a-2f23-c0579513d75e	1290	Grosuplje
00050000-5575-713a-5061-5283a4ee2c79	2288	Hajdina
00050000-5575-713a-3270-09124490b8bc	8362	Hinje
00050000-5575-713a-51d6-0cd43c060d7a	2311	Hoče
00050000-5575-713a-18e0-760781baec62	9205	Hodoš/Hodos
00050000-5575-713a-14dd-5aebe371fe21	1354	Horjul
00050000-5575-713a-fa13-eafa8df7af39	1372	Hotedršica
00050000-5575-713a-6e8d-da068c154ae7	1430	Hrastnik
00050000-5575-713a-1ee6-133a826a77df	6225	Hruševje
00050000-5575-713a-aacf-da48fe5d1c22	4276	Hrušica
00050000-5575-713a-bc05-5a6d461a264b	5280	Idrija
00050000-5575-713a-cbe6-4fa5aab76e8d	1292	Ig
00050000-5575-713a-2c78-382c1ef84fb9	6250	Ilirska Bistrica
00050000-5575-713a-47a6-aa1c05d30e69	6251	Ilirska Bistrica-Trnovo
00050000-5575-713a-f70b-e39bfde5bd1f	1295	Ivančna Gorica
00050000-5575-713a-dbc5-0550add0273c	2259	Ivanjkovci
00050000-5575-713a-0ca7-40e883df886a	1411	Izlake
00050000-5575-713a-0f5e-074667c3977e	6310	Izola/Isola
00050000-5575-713a-8519-3da2ad46942b	2222	Jakobski Dol
00050000-5575-713a-f735-49ba5f086a2c	2221	Jarenina
00050000-5575-713a-1722-7606dfa9f691	6254	Jelšane
00050000-5575-713a-6359-b8947ff76773	4270	Jesenice
00050000-5575-713a-018d-b9c4eff1e016	8261	Jesenice na Dolenjskem
00050000-5575-713a-e67c-6a946e036302	3273	Jurklošter
00050000-5575-713a-1f3e-195ddf5f06c0	2223	Jurovski Dol
00050000-5575-713a-8bb2-40f2a0280e4a	2256	Juršinci
00050000-5575-713a-d818-f1782129ae16	5214	Kal nad Kanalom
00050000-5575-713a-35e3-5b632e1e4e35	3233	Kalobje
00050000-5575-713a-154d-9ec00aee068e	4246	Kamna Gorica
00050000-5575-713a-985c-4d245fbb8bb6	2351	Kamnica
00050000-5575-713a-9348-1f9458f13cce	1241	Kamnik
00050000-5575-713a-a669-30203721a4ff	5213	Kanal
00050000-5575-713a-db5d-f2af82f17de5	8258	Kapele
00050000-5575-713a-3dbc-741772a4f074	2362	Kapla
00050000-5575-713a-51f2-e36146865e01	2325	Kidričevo
00050000-5575-713a-da3b-09133cd603ae	1412	Kisovec
00050000-5575-713a-7d28-d79346d7f312	6253	Knežak
00050000-5575-713a-8c6d-4e4a9e60ad18	5222	Kobarid
00050000-5575-713a-76c2-a55d004f2f0a	9227	Kobilje
00050000-5575-713a-1d47-aee472959d55	1330	Kočevje
00050000-5575-713a-08b9-0e4689bf9335	1338	Kočevska Reka
00050000-5575-713a-8395-15edd80ee950	2276	Kog
00050000-5575-713a-9cd1-bf7334ffb614	5211	Kojsko
00050000-5575-713a-cf8a-d70ee4188bb2	6223	Komen
00050000-5575-713a-0b63-dd48ca0892ef	1218	Komenda
00050000-5575-713a-ff73-72eb91df6087	6000	Koper/Capodistria 
00050000-5575-713a-4c51-e5eeb9abb882	6001	Koper/Capodistria - poštni predali
00050000-5575-713a-9a22-827ce22073fc	8282	Koprivnica
00050000-5575-713a-3826-51e42e5747a7	5296	Kostanjevica na Krasu
00050000-5575-713a-54b2-7a9b8d95a8c7	8311	Kostanjevica na Krki
00050000-5575-713a-5998-b35ef7b93373	1336	Kostel
00050000-5575-713a-c743-d795565840f2	6256	Košana
00050000-5575-713a-ef5d-aa19182d1139	2394	Kotlje
00050000-5575-713a-97e3-57eaf9063367	6240	Kozina
00050000-5575-713a-9cdd-5aa2da526cae	3260	Kozje
00050000-5575-713a-3814-511bfce73754	4000	Kranj 
00050000-5575-713a-c5a9-f045ba87a38b	4001	Kranj - poštni predali
00050000-5575-713a-3541-fc2d9ed6f89c	4280	Kranjska Gora
00050000-5575-713a-c16c-357ecabcae35	1281	Kresnice
00050000-5575-713a-86dd-8682ee1decc3	4294	Križe
00050000-5575-713a-0baf-b685c59c0658	9206	Križevci
00050000-5575-713a-032f-6ccca6b034d1	9242	Križevci pri Ljutomeru
00050000-5575-713a-440a-1f656eb213f8	1301	Krka
00050000-5575-713a-e432-08cadf8ae61e	8296	Krmelj
00050000-5575-713a-9113-55ac831ee398	4245	Kropa
00050000-5575-713a-7da4-2f19a2502f4e	8262	Krška vas
00050000-5575-713a-9d19-8cedd831095d	8270	Krško
00050000-5575-713a-4e87-db3171d296a9	9263	Kuzma
00050000-5575-713a-201a-0e235fccd97f	2318	Laporje
00050000-5575-713a-2f0d-c24832000140	3270	Laško
00050000-5575-713a-c427-51188c7a49e2	1219	Laze v Tuhinju
00050000-5575-713a-1c6c-7f109d745fc9	2230	Lenart v Slovenskih goricah
00050000-5575-713a-7f6c-2d6946301862	9220	Lendava/Lendva
00050000-5575-713a-65a3-8132bf7d0769	4248	Lesce
00050000-5575-713a-dd61-540499e599e2	3261	Lesično
00050000-5575-713a-c9cc-76befc435f6a	8273	Leskovec pri Krškem
00050000-5575-713a-2a54-4459cb2c7f13	2372	Libeliče
00050000-5575-713a-f0e2-b55fb2fab122	2341	Limbuš
00050000-5575-713a-605a-3ec74fb0b868	1270	Litija
00050000-5575-713a-87da-f5e24926c329	3202	Ljubečna
00050000-5575-713a-a936-67972c06bb30	1000	Ljubljana 
00050000-5575-713a-51bf-694f1dac638b	1001	Ljubljana - poštni predali
00050000-5575-713a-d1e4-18c1f096666c	1231	Ljubljana - Črnuče
00050000-5575-713a-0dcd-4fe676c16d8f	1261	Ljubljana - Dobrunje
00050000-5575-713a-d7cf-a5386c641781	1260	Ljubljana - Polje
00050000-5575-713a-29a2-2ca517035002	1210	Ljubljana - Šentvid
00050000-5575-713a-3eb0-4874b84b0712	1211	Ljubljana - Šmartno
00050000-5575-713a-32cc-0016d1553c55	3333	Ljubno ob Savinji
00050000-5575-713a-4438-28b496d9dde3	9240	Ljutomer
00050000-5575-713a-869d-78644ebb877c	3215	Loče
00050000-5575-713a-d2e3-347977ff30bd	5231	Log pod Mangartom
00050000-5575-713a-71de-6af50501dbff	1358	Log pri Brezovici
00050000-5575-713a-84eb-e2b9b60a9fcf	1370	Logatec
00050000-5575-713a-8b3a-7c9048d7c5e8	1371	Logatec
00050000-5575-713a-04ea-7c4e504728a6	1434	Loka pri Zidanem Mostu
00050000-5575-713a-9df5-494321a6668e	3223	Loka pri Žusmu
00050000-5575-713a-ff5f-df57de26785b	6219	Lokev
00050000-5575-713a-7a12-ed4c56ebf035	1318	Loški Potok
00050000-5575-713a-3585-88aee8506bf8	2324	Lovrenc na Dravskem polju
00050000-5575-713a-63da-769ca3be6eb1	2344	Lovrenc na Pohorju
00050000-5575-713a-78b2-62a94018e1b4	3334	Luče
00050000-5575-713a-934e-6f113e8dd44c	1225	Lukovica
00050000-5575-713a-1a28-61eb723e749b	9202	Mačkovci
00050000-5575-713a-99cc-74f472c55b4c	2322	Majšperk
00050000-5575-713a-ccda-18f74a1ccad2	2321	Makole
00050000-5575-713a-f0d7-25df4523ae32	9243	Mala Nedelja
00050000-5575-713a-279f-dff198876035	2229	Malečnik
00050000-5575-713a-f3c9-2c8c821eb3c2	6273	Marezige
00050000-5575-713a-dcae-008cf959aecd	2000	Maribor 
00050000-5575-713a-9f39-bedbb2b81983	2001	Maribor - poštni predali
00050000-5575-713a-af0e-a7fd20714b8b	2206	Marjeta na Dravskem polju
00050000-5575-713a-59ef-1b5c55959b26	2281	Markovci
00050000-5575-713a-ee1b-c1b0487274db	9221	Martjanci
00050000-5575-713a-d05f-a637b5284038	6242	Materija
00050000-5575-713a-a0d2-824faab57391	4211	Mavčiče
00050000-5575-713a-9b3f-2c205a32bfab	1215	Medvode
00050000-5575-713a-8579-e4428da24223	1234	Mengeš
00050000-5575-713a-e4fc-7152ca823018	8330	Metlika
00050000-5575-713a-755f-6d50bfb5ef20	2392	Mežica
00050000-5575-713a-c8ba-61849c1a43cf	2204	Miklavž na Dravskem polju
00050000-5575-713a-f5f8-e3fd94f4cae8	2275	Miklavž pri Ormožu
00050000-5575-713a-5e70-e66e301fd7a0	5291	Miren
00050000-5575-713a-890b-3a4a9860ca74	8233	Mirna
00050000-5575-713a-d99c-67d6ce4d2c7e	8216	Mirna Peč
00050000-5575-713a-28de-ddc6f4d5d07f	2382	Mislinja
00050000-5575-713a-3406-83ba8c076db0	4281	Mojstrana
00050000-5575-713a-c007-09184fd3c5d9	8230	Mokronog
00050000-5575-713a-abb2-6bc02a14bb5d	1251	Moravče
00050000-5575-713a-5743-0fbbc99f55bb	9226	Moravske Toplice
00050000-5575-713a-de8f-c525abb8f186	5216	Most na Soči
00050000-5575-713a-3ce0-6cc7924f3758	1221	Motnik
00050000-5575-713a-474c-bc662f9a30da	3330	Mozirje
00050000-5575-713a-a55a-ee00fee54fac	9000	Murska Sobota 
00050000-5575-713a-ee7e-354edc3d09d2	9001	Murska Sobota - poštni predali
00050000-5575-713a-c102-5962d501214c	2366	Muta
00050000-5575-713a-6d4d-33b26070109c	4202	Naklo
00050000-5575-713a-09bf-5a40b171a0fb	3331	Nazarje
00050000-5575-713a-b05e-8507c2d6303c	1357	Notranje Gorice
00050000-5575-713a-ff03-1d6b0f38fb39	3203	Nova Cerkev
00050000-5575-713a-b4df-9e087e82fbd3	5000	Nova Gorica 
00050000-5575-713a-4a31-0d820cb8de8f	5001	Nova Gorica - poštni predali
00050000-5575-713a-f1c9-3c9becd09601	1385	Nova vas
00050000-5575-713a-7f04-abaed750cca1	8000	Novo mesto
00050000-5575-713a-26f1-5d1cb6cd2f1f	8001	Novo mesto - poštni predali
00050000-5575-713a-09f5-b7d5491940ea	6243	Obrov
00050000-5575-713a-1727-a9dbe92d17dd	9233	Odranci
00050000-5575-713a-832f-3469457375cd	2317	Oplotnica
00050000-5575-713a-cdbe-08e3e54dee9e	2312	Orehova vas
00050000-5575-713a-5fcb-e12eba2a2f83	2270	Ormož
00050000-5575-713a-705a-528aa31a1219	1316	Ortnek
00050000-5575-713a-dea5-848bcae98a95	1337	Osilnica
00050000-5575-713a-00ed-48ad7c200c87	8222	Otočec
00050000-5575-713a-9ef3-9cf183a4f925	2361	Ožbalt
00050000-5575-713a-7cd7-071de08d4ceb	2231	Pernica
00050000-5575-713a-ca76-3d173e495d86	2211	Pesnica pri Mariboru
00050000-5575-713a-e2f0-72f17ddc7789	9203	Petrovci
00050000-5575-713a-90f7-9576945a2ce4	3301	Petrovče
00050000-5575-713a-c34d-a86bba20ddc8	6330	Piran/Pirano
00050000-5575-713a-f11f-f83528046bfd	8255	Pišece
00050000-5575-713a-9945-d20a567da675	6257	Pivka
00050000-5575-713a-f526-42afe7dde7a4	6232	Planina
00050000-5575-713a-e84b-2b0e5a06ec96	3225	Planina pri Sevnici
00050000-5575-713a-6136-02543b0332d9	6276	Pobegi
00050000-5575-713a-452b-893789cf1824	8312	Podbočje
00050000-5575-713a-2413-0ef9f898dd5a	5243	Podbrdo
00050000-5575-713a-9849-9c92656016a7	3254	Podčetrtek
00050000-5575-713a-1a46-3ef930c18f64	2273	Podgorci
00050000-5575-713a-583f-bddbad49a62a	6216	Podgorje
00050000-5575-713a-0dbd-47bc26c16065	2381	Podgorje pri Slovenj Gradcu
00050000-5575-713a-1beb-25975bf2f4f7	6244	Podgrad
00050000-5575-713a-8489-27a74144ccd7	1414	Podkum
00050000-5575-713a-f72e-f9d5e32c7525	2286	Podlehnik
00050000-5575-713a-a47c-12a56bc45b95	5272	Podnanos
00050000-5575-713a-3618-49dcfb28ab8c	4244	Podnart
00050000-5575-713a-eea1-87d3864c159a	3241	Podplat
00050000-5575-713a-e834-734109fc2179	3257	Podsreda
00050000-5575-713a-8e64-c5d2c10c36b7	2363	Podvelka
00050000-5575-713a-52d2-2f14608733c7	2208	Pohorje
00050000-5575-713a-3b1b-b661a02ac0bc	2257	Polenšak
00050000-5575-713a-9d31-b59cd49628bf	1355	Polhov Gradec
00050000-5575-713a-202b-8113feadd378	4223	Poljane nad Škofjo Loko
00050000-5575-713a-2e83-26b11b226b9f	2319	Poljčane
00050000-5575-713a-7677-fb4976fa3d6e	1272	Polšnik
00050000-5575-713a-8a48-d288bff8ea9b	3313	Polzela
00050000-5575-713a-ff03-a0f43063e9fe	3232	Ponikva
00050000-5575-713a-5b82-836be9fa09fa	6320	Portorož/Portorose
00050000-5575-713a-51a2-c7c5992f9481	6230	Postojna
00050000-5575-713a-d661-f03d166065b8	2331	Pragersko
00050000-5575-713a-634d-bed16a3b3f4d	3312	Prebold
00050000-5575-713a-2804-636d3c82257e	4205	Preddvor
00050000-5575-713a-8728-d3f36a247c26	6255	Prem
00050000-5575-713a-884a-eee189923b70	1352	Preserje
00050000-5575-713a-c894-903e6687d4e3	6258	Prestranek
00050000-5575-713a-83e7-a7782d98da8c	2391	Prevalje
00050000-5575-713a-1ed3-2de52648dc52	3262	Prevorje
00050000-5575-713a-c593-440b3934aa8e	1276	Primskovo 
00050000-5575-713a-8067-f4176bb18d33	3253	Pristava pri Mestinju
00050000-5575-713a-eb0a-89dd1671481b	9207	Prosenjakovci/Partosfalva
00050000-5575-713a-8c39-f2623acd499c	5297	Prvačina
00050000-5575-713a-3076-f564c7819593	2250	Ptuj
00050000-5575-713a-3006-fa7645a6ec14	2323	Ptujska Gora
00050000-5575-713a-ad05-e2f3c6b7cfc0	9201	Puconci
00050000-5575-713a-3a3f-6b0050b66fd5	2327	Rače
00050000-5575-713a-d1b6-8f66bfb3eb1a	1433	Radeče
00050000-5575-713a-e350-a54542ebf24d	9252	Radenci
00050000-5575-713a-a716-65d1f892158c	2360	Radlje ob Dravi
00050000-5575-713a-60b7-7c0e51f6319b	1235	Radomlje
00050000-5575-713a-1041-77841c7f8f59	4240	Radovljica
00050000-5575-713a-54cf-386b309a06fe	8274	Raka
00050000-5575-713a-69dd-2facd04787dd	1381	Rakek
00050000-5575-713a-e2fb-2f45168fd645	4283	Rateče - Planica
00050000-5575-713a-3b85-98e4c3a50710	2390	Ravne na Koroškem
00050000-5575-713a-aef2-b53e2fb64f76	9246	Razkrižje
00050000-5575-713a-5a03-db601c3b38d5	3332	Rečica ob Savinji
00050000-5575-713a-f533-d2270b470fed	5292	Renče
00050000-5575-713a-7ecf-07d59cd70fe4	1310	Ribnica
00050000-5575-713a-e749-a4e69b4132f2	2364	Ribnica na Pohorju
00050000-5575-713a-a3da-a055b785872b	3272	Rimske Toplice
00050000-5575-713a-1a9f-d8be327b5de7	1314	Rob
00050000-5575-713a-0a01-27259c293b00	5215	Ročinj
00050000-5575-713a-0035-91d8257de129	3250	Rogaška Slatina
00050000-5575-713a-9482-1fa1cf074a0d	9262	Rogašovci
00050000-5575-713a-8101-af2db2bb39a5	3252	Rogatec
00050000-5575-713a-2836-f397d25db0f8	1373	Rovte
00050000-5575-713a-6981-73ab5a077d06	2342	Ruše
00050000-5575-713a-ebd3-90968dcbed95	1282	Sava
00050000-5575-713a-c1eb-4c80d60689ea	6333	Sečovlje/Sicciole
00050000-5575-713a-9bb3-ac86d1d788bb	4227	Selca
00050000-5575-713a-7ec8-8e63c1e826b3	2352	Selnica ob Dravi
00050000-5575-713a-745d-af581ff3a3a1	8333	Semič
00050000-5575-713a-c97c-788501e77015	8281	Senovo
00050000-5575-713a-d3e7-61c5a2e2a041	6224	Senožeče
00050000-5575-713a-42d7-30b4384417a8	8290	Sevnica
00050000-5575-713a-d42a-9d38e1437434	6210	Sežana
00050000-5575-713a-6368-8d4d97f5708a	2214	Sladki Vrh
00050000-5575-713a-ff1b-20669215bc9d	5283	Slap ob Idrijci
00050000-5575-713a-71fd-ecfafa0bafc7	2380	Slovenj Gradec
00050000-5575-713a-47ac-1b86b685a487	2310	Slovenska Bistrica
00050000-5575-713a-889a-e728bc63ac19	3210	Slovenske Konjice
00050000-5575-713a-deec-b70a41bd9f69	1216	Smlednik
00050000-5575-713a-e385-12a51ee72943	5232	Soča
00050000-5575-713a-b799-6da0dce0eeed	1317	Sodražica
00050000-5575-713a-4321-fad325e2de97	3335	Solčava
00050000-5575-713a-d36b-855d656667e8	5250	Solkan
00050000-5575-713a-68ec-1a7436640861	4229	Sorica
00050000-5575-713a-8b59-b089ddcbfa59	4225	Sovodenj
00050000-5575-713a-a387-59ec3267f597	5281	Spodnja Idrija
00050000-5575-713a-8252-a32251980c41	2241	Spodnji Duplek
00050000-5575-713a-ad08-8edd1479ed4a	9245	Spodnji Ivanjci
00050000-5575-713a-6387-9961bc15489c	2277	Središče ob Dravi
00050000-5575-713a-6dc3-9c937ade313d	4267	Srednja vas v Bohinju
00050000-5575-713a-658c-982f0d449506	8256	Sromlje 
00050000-5575-713a-a3b7-4db425f7dd57	5224	Srpenica
00050000-5575-713a-d45e-a16a1748dec9	1242	Stahovica
00050000-5575-713a-0d5a-4806903bfd0d	1332	Stara Cerkev
00050000-5575-713a-7dc4-af99bcf69f90	8342	Stari trg ob Kolpi
00050000-5575-713a-22d4-029e3d6680b6	1386	Stari trg pri Ložu
00050000-5575-713a-98b7-798ca241851b	2205	Starše
00050000-5575-713a-7a0a-70be061f121d	2289	Stoperce
00050000-5575-713a-6094-38a32a96e152	8322	Stopiče
00050000-5575-713a-7c91-1d98810aacdd	3206	Stranice
00050000-5575-713a-1b2f-29f36eabd8d1	8351	Straža
00050000-5575-713a-94df-bd4a4b271b5b	1313	Struge
00050000-5575-713a-24a7-e1e29d388909	8293	Studenec
00050000-5575-713a-2940-1a34c21e309f	8331	Suhor
00050000-5575-713a-33a3-8082a2445d91	2233	Sv. Ana v Slovenskih goricah
00050000-5575-713a-c6ee-32b999075511	2235	Sv. Trojica v Slovenskih goricah
00050000-5575-713a-bd76-b549093708fd	2353	Sveti Duh na Ostrem Vrhu
00050000-5575-713a-b10a-d7b04ea07ea4	9244	Sveti Jurij ob Ščavnici
00050000-5575-713a-3e95-6dd72ec868ce	3264	Sveti Štefan
00050000-5575-713a-c2a8-ce92f241f13a	2258	Sveti Tomaž
00050000-5575-713a-ce59-a52924cd94e7	9204	Šalovci
00050000-5575-713a-7fa9-195d3d965250	5261	Šempas
00050000-5575-713a-5e15-b857ee4a1f76	5290	Šempeter pri Gorici
00050000-5575-713a-7baa-9cd6d1bca271	3311	Šempeter v Savinjski dolini
00050000-5575-713a-f99d-d0f5ff9e2e2b	4208	Šenčur
00050000-5575-713a-34f5-f3d63e16226b	2212	Šentilj v Slovenskih goricah
00050000-5575-713a-35b3-81e2e5613b7b	8297	Šentjanž
00050000-5575-713a-afc4-4aa4e950ab34	2373	Šentjanž pri Dravogradu
00050000-5575-713a-367b-e7ba93936b2e	8310	Šentjernej
00050000-5575-713a-5e87-60e542cf3fed	3230	Šentjur
00050000-5575-713a-36f9-2987f61365fa	3271	Šentrupert
00050000-5575-713a-9e7f-74c414185029	8232	Šentrupert
00050000-5575-713a-2267-b425389281fa	1296	Šentvid pri Stični
00050000-5575-713a-fda2-203d0b0af727	8275	Škocjan
00050000-5575-713a-4600-5386a8a6217d	6281	Škofije
00050000-5575-713a-f9bd-6229285a6197	4220	Škofja Loka
00050000-5575-713a-9a7e-6c67312b1b4b	3211	Škofja vas
00050000-5575-713a-f90f-f4e96d125ba5	1291	Škofljica
00050000-5575-713a-d3c6-7073f8adbc4a	6274	Šmarje
00050000-5575-713a-5ebb-e2f56d4b09a7	1293	Šmarje - Sap
00050000-5575-713a-a9fb-566498787d2d	3240	Šmarje pri Jelšah
00050000-5575-713a-26da-9638a0f199ed	8220	Šmarješke Toplice
00050000-5575-713a-85ae-bf0d9af8823b	2315	Šmartno na Pohorju
00050000-5575-713a-1cbb-2e2d083080f9	3341	Šmartno ob Dreti
00050000-5575-713a-76cf-cf131a931b1d	3327	Šmartno ob Paki
00050000-5575-713a-a704-8da5c3197a43	1275	Šmartno pri Litiji
00050000-5575-713a-cc57-b53ae8c9698b	2383	Šmartno pri Slovenj Gradcu
00050000-5575-713a-7c6b-3c457bdc5abb	3201	Šmartno v Rožni dolini
00050000-5575-713a-bfa9-881bd3ac4147	3325	Šoštanj
00050000-5575-713a-7e54-79577e6a18e7	6222	Štanjel
00050000-5575-713a-9dc2-2265b60ffa24	3220	Štore
00050000-5575-713a-29a4-0f17e32611ab	3304	Tabor
00050000-5575-713a-198b-d28a7d0fd169	3221	Teharje
00050000-5575-713a-de8e-ca588d94e7ff	9251	Tišina
00050000-5575-713a-bfa6-b59cfc532e70	5220	Tolmin
00050000-5575-713a-d56d-f44027bb98ff	3326	Topolšica
00050000-5575-713a-4734-a98bfe09503a	2371	Trbonje
00050000-5575-713a-5610-2bb3917f3968	1420	Trbovlje
00050000-5575-713a-c5c8-83d9d2dfe530	8231	Trebelno 
00050000-5575-713a-b964-65258eab58f7	8210	Trebnje
00050000-5575-713a-9dd5-9a5cc7921c91	5252	Trnovo pri Gorici
00050000-5575-713a-c190-e304b3718267	2254	Trnovska vas
00050000-5575-713a-2b4a-0eb0890327a8	1222	Trojane
00050000-5575-713a-f2a7-47937ea10278	1236	Trzin
00050000-5575-713a-5a1b-78a6da7a260e	4290	Tržič
00050000-5575-713a-85fd-088b1c00ffec	8295	Tržišče
00050000-5575-713a-f35d-911843089414	1311	Turjak
00050000-5575-713a-a6e2-02f622af7f62	9224	Turnišče
00050000-5575-713a-23a7-a50f6ce8f015	8323	Uršna sela
00050000-5575-713a-a3b4-13eb82d581e4	1252	Vače
00050000-5575-713a-5293-1d9c907e1a0f	3320	Velenje 
00050000-5575-713a-d863-946665ab5677	3322	Velenje - poštni predali
00050000-5575-713a-26dc-214d318c6681	8212	Velika Loka
00050000-5575-713a-aafa-1f5b65df8fb0	2274	Velika Nedelja
00050000-5575-713a-8507-39c070138167	9225	Velika Polana
00050000-5575-713a-3116-72955794965d	1315	Velike Lašče
00050000-5575-713a-bb44-dd417e8e58b0	8213	Veliki Gaber
00050000-5575-713a-3750-73bb9f837a0c	9241	Veržej
00050000-5575-713a-eea3-ddce79b9c155	1312	Videm - Dobrepolje
00050000-5575-713a-7649-b7fbdb7ee61f	2284	Videm pri Ptuju
00050000-5575-713a-da75-0921593b6ba1	8344	Vinica
00050000-5575-713a-4616-6c90100e067c	5271	Vipava
00050000-5575-713a-b1e4-ef36f010566c	4212	Visoko
00050000-5575-713a-5d99-7da11d6a595c	1294	Višnja Gora
00050000-5575-713a-79b1-3c78dfb4439a	3205	Vitanje
00050000-5575-713a-f178-06d62ff29ae2	2255	Vitomarci
00050000-5575-713a-f4cc-b9aae47ff13a	1217	Vodice
00050000-5575-713a-f649-9c1face3e8cf	3212	Vojnik\t
00050000-5575-713a-af1b-48f42149b5fd	5293	Volčja Draga
00050000-5575-713a-9525-24db714bd536	2232	Voličina
00050000-5575-713a-b8a3-562dba4b5c4f	3305	Vransko
00050000-5575-713a-28b0-44e11c16cc60	6217	Vremski Britof
00050000-5575-713a-3ca4-49070d13df7d	1360	Vrhnika
00050000-5575-713a-93a7-c5aa3a4e615b	2365	Vuhred
00050000-5575-713a-7677-b5d16c08295a	2367	Vuzenica
00050000-5575-713a-8acf-5b1a989faf56	8292	Zabukovje 
00050000-5575-713a-64d2-c4f82ace4711	1410	Zagorje ob Savi
00050000-5575-713a-43f0-10921a371183	1303	Zagradec
00050000-5575-713a-2bcb-688b98549d8c	2283	Zavrč
00050000-5575-713a-375d-cc9ab42d3cb8	8272	Zdole 
00050000-5575-713a-04fb-68b2674f25ec	4201	Zgornja Besnica
00050000-5575-713a-8470-4ef9de2489f9	2242	Zgornja Korena
00050000-5575-713a-f9ce-00022c30b5f4	2201	Zgornja Kungota
00050000-5575-713a-7063-876545f1bd4d	2316	Zgornja Ložnica
00050000-5575-713a-37e8-888083ec9e16	2314	Zgornja Polskava
00050000-5575-713a-608d-0973aac4587a	2213	Zgornja Velka
00050000-5575-713a-2483-0c047037e7b0	4247	Zgornje Gorje
00050000-5575-713a-5ae5-ee17e9f8f6e0	4206	Zgornje Jezersko
00050000-5575-713a-aa3b-221474b1d350	2285	Zgornji Leskovec
00050000-5575-713a-f5d6-a313e2fe2214	1432	Zidani Most
00050000-5575-713a-6881-381013f244fe	3214	Zreče
00050000-5575-713a-6107-5a7d416ccc01	4209	Žabnica
00050000-5575-713a-0540-b0858e941d26	3310	Žalec
00050000-5575-713a-47a5-8da3499bb5d1	4228	Železniki
00050000-5575-713a-9304-a55a2392840b	2287	Žetale
00050000-5575-713a-8555-00d936010ebd	4226	Žiri
00050000-5575-713a-911c-6fda418d3cd2	4274	Žirovnica
00050000-5575-713a-f839-6f1ff6e64840	8360	Žužemberk
\.


--
-- TOC entry 2807 (class 0 OID 6545014)
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
-- TOC entry 2789 (class 0 OID 6544825)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2795 (class 0 OID 6544903)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2809 (class 0 OID 6545026)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 6545146)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2826 (class 0 OID 6545201)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5575-713b-89d3-9cfc33a8125c	00080000-5575-713b-34fc-2743fdd74876	0987	A
00190000-5575-713b-8d67-e18799686c44	00080000-5575-713b-0fd4-a871ebb87530	0989	A
\.


--
-- TOC entry 2833 (class 0 OID 6545315)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram) FROM stdin;
\.


--
-- TOC entry 2836 (class 0 OID 6545343)
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
-- TOC entry 2834 (class 0 OID 6545324)
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
-- TOC entry 2813 (class 0 OID 6545055)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5575-713b-8b5c-362ead46cc9b	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5575-713b-0eb6-bce0815e59bb	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5575-713b-b715-ffcaf9de22d2	0003	Kazinska	t	84	Kazinska dvorana
00220000-5575-713b-c11c-87e4861d2efb	0004	Mali oder	t	24	Mali oder 
00220000-5575-713b-e1af-40a60d1078a7	0005	Komorni oder	t	15	Komorni oder
00220000-5575-713b-98c9-7433c186f44d	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5575-713b-b635-034067eebe45	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2805 (class 0 OID 6544999)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2804 (class 0 OID 6544989)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 6545190)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2820 (class 0 OID 6545123)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2778 (class 0 OID 6544697)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5575-713b-069b-1aae1488abc3	00010000-5575-713b-1255-020d21530978	2015-06-08 12:41:00	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROH4c4DBx1Cx/mbbPJ1DRLlZCaQUzalm6";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2852 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2814 (class 0 OID 6545065)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2782 (class 0 OID 6544735)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5575-713a-38e2-68547a83ab22	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5575-713a-1851-b94a63366823	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5575-713a-11b1-ed72622be909	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5575-713a-6735-f573b41e4d31	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5575-713a-efd1-7666be36b5a1	planer	Planer dogodkov v koledarju	t
00020000-5575-713a-53e1-966805f31acb	kadrovska	Kadrovska služba	t
00020000-5575-713b-3eb4-9ffdca3ff728	arhivar	Ažuriranje arhivalij	t
00020000-5575-713b-85ba-e9c5beb2e7c6	igralec	Igralec	t
00020000-5575-713b-bcd4-9645efb244c7	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2780 (class 0 OID 6544719)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5575-713b-069b-1aae1488abc3	00020000-5575-713a-11b1-ed72622be909
00010000-5575-713b-1255-020d21530978	00020000-5575-713a-11b1-ed72622be909
\.


--
-- TOC entry 2816 (class 0 OID 6545079)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2808 (class 0 OID 6545020)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2802 (class 0 OID 6544970)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2839 (class 0 OID 6545362)
-- Dependencies: 235
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5575-713a-edb1-40f23f771c81	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5575-713a-c0ec-c6cb0ae6e006	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5575-713a-68e4-2527ff7f14df	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5575-713a-39d2-ff6f374142eb	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00230000-5575-713a-758a-ea253865825e	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2838 (class 0 OID 6545354)
-- Dependencies: 234
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5575-713a-0a44-defdc7f6f082	00230000-5575-713a-39d2-ff6f374142eb	popa
00240000-5575-713a-ce40-c41b9cff2381	00230000-5575-713a-39d2-ff6f374142eb	oseba
00240000-5575-713a-9681-b71bcb11a11f	00230000-5575-713a-c0ec-c6cb0ae6e006	prostor
00240000-5575-713a-4d77-2e4490317243	00230000-5575-713a-39d2-ff6f374142eb	besedilo
00240000-5575-713a-9a02-e76c71cf0f8a	00230000-5575-713a-39d2-ff6f374142eb	uprizoritev
00240000-5575-713a-c376-9728c7362053	00230000-5575-713a-39d2-ff6f374142eb	funkcija
00240000-5575-713a-81a0-8bbcd8e11f8f	00230000-5575-713a-39d2-ff6f374142eb	tipfunkcije
00240000-5575-713a-0a72-e5d390b01dce	00230000-5575-713a-39d2-ff6f374142eb	alternacija
00240000-5575-713a-e468-7b1f7038f4a8	00230000-5575-713a-edb1-40f23f771c81	pogodba
00240000-5575-713a-0a3d-f0856144c369	00230000-5575-713a-39d2-ff6f374142eb	zaposlitev
\.


--
-- TOC entry 2837 (class 0 OID 6545349)
-- Dependencies: 233
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 6545133)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2787 (class 0 OID 6544797)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2803 (class 0 OID 6544976)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5575-713b-5003-aa8f347e5176	00180000-5575-713b-5a14-9c97e2d1c04e	000c0000-5575-713b-47d8-93c787a89943	00090000-5575-713b-5d72-2b4967303ac8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-713b-0132-ab734def904b	00180000-5575-713b-5a14-9c97e2d1c04e	000c0000-5575-713b-8ab2-6ab827cb3ef4	00090000-5575-713b-8cba-e6ecc8731c23	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-713b-4428-ab8e7d70795b	00180000-5575-713b-5a14-9c97e2d1c04e	000c0000-5575-713b-2f79-dd5255cf6900	00090000-5575-713b-9efb-6f168a07a0d1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-713b-7d35-7ac9cacf519f	00180000-5575-713b-5a14-9c97e2d1c04e	000c0000-5575-713b-9e4f-194d95ebdd63	00090000-5575-713b-30fd-881e4314b553	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-713b-f172-755869f011eb	00180000-5575-713b-5a14-9c97e2d1c04e	000c0000-5575-713b-9f38-f3beb0cd7be8	00090000-5575-713b-3438-e88de9c431a0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5575-713b-98fb-9294a7dccf50	00180000-5575-713b-c37d-922d568acda7	\N	00090000-5575-713b-3438-e88de9c431a0	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2824 (class 0 OID 6545179)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5575-713a-70d4-b58c99b399e9	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5575-713a-16b4-221410c24591	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5575-713a-c7bf-0caac53c73b9	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5575-713a-3e90-fcc1e477b5c9	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5575-713a-b739-b50d0ea99c7a	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5575-713a-0601-38cabad07dca	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5575-713a-0f30-39be646cbff4	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5575-713a-9279-f87806979890	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5575-713a-39ae-216e84e8af53	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5575-713a-01e3-0dc39195d0b1	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5575-713a-1c9e-2cf7322c7d9f	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5575-713a-29e0-4a6784915125	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5575-713a-7712-63a39fc0b488	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5575-713a-5c6a-524c3ba33730	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5575-713a-b7ac-05e2bed19b6a	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5575-713a-544c-96c8e415e2f8	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2835 (class 0 OID 6545332)
-- Dependencies: 231
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
\.


--
-- TOC entry 2792 (class 0 OID 6544860)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2779 (class 0 OID 6544706)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5575-713b-1255-020d21530978	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROeMdDqnPyNU9rqp./KxS73ZSTLW/.oEm	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5575-713b-f63d-c28237c5d3c6	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5575-713b-a5d6-cd8f410ea591	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5575-713b-a0d9-32963cdd44c3	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5575-713b-f5f0-70f4512df31d	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5575-713b-331b-208b2cfd95f9	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5575-713b-8b49-65ec12f8cf24	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5575-713b-069b-1aae1488abc3	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2829 (class 0 OID 6545236)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5575-713b-6d6e-c31c72723c18	00160000-5575-713b-3711-e83668c026a8	00150000-5575-713a-d5ba-027d3d62f15a	00140000-5575-713a-59b1-398736d973b5	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5575-713b-e1af-40a60d1078a7
000e0000-5575-713b-bb5e-332648062ce1	00160000-5575-713b-113f-7cc441bda410	00150000-5575-713a-9d03-814fde89e394	00140000-5575-713a-68e2-71f6ff38589c	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5575-713b-98c9-7433c186f44d
\.


--
-- TOC entry 2797 (class 0 OID 6544922)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5575-713b-70d9-2e604e945ede	000e0000-5575-713b-bb5e-332648062ce1	1	
00200000-5575-713b-e599-cd291b9e56a8	000e0000-5575-713b-bb5e-332648062ce1	2	
\.


--
-- TOC entry 2812 (class 0 OID 6545047)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 6545116)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2799 (class 0 OID 6544954)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 6545226)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5575-713a-59b1-398736d973b5	01	Drama	drama (SURS 01)
00140000-5575-713a-379c-1837926a986a	02	Opera	opera (SURS 02)
00140000-5575-713a-6938-f91b0213b672	03	Balet	balet (SURS 03)
00140000-5575-713a-2756-f396788a00ef	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5575-713a-3af5-e30ec0e30ae9	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5575-713a-68e2-71f6ff38589c	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5575-713a-e70d-f7a363682978	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2818 (class 0 OID 6545106)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5575-713a-f344-a77d6b0372c2	01	Opera	opera
00150000-5575-713a-d98b-9ed9a08ca035	02	Opereta	opereta
00150000-5575-713a-8c27-94804908a747	03	Balet	balet
00150000-5575-713a-9e28-31bf8ee8e5cf	04	Plesne prireditve	plesne prireditve
00150000-5575-713a-67bc-ee180e926c9d	05	Lutkovno gledališče	lutkovno gledališče
00150000-5575-713a-9417-087586e27786	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5575-713a-0d60-305330debd00	07	Biografska drama	biografska drama
00150000-5575-713a-d5ba-027d3d62f15a	08	Komedija	komedija
00150000-5575-713a-f151-620c84352462	09	Črna komedija	črna komedija
00150000-5575-713a-1dcb-b4da84ef238a	10	E-igra	E-igra
00150000-5575-713a-9d03-814fde89e394	11	Kriminalka	kriminalka
00150000-5575-713a-5fca-b13d3572d188	12	Musical	musical
\.


--
-- TOC entry 2370 (class 2606 OID 6544760)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 6545282)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 6545272)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 6545178)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 6544944)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2441 (class 2606 OID 6544969)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 6544886)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2557 (class 2606 OID 6545311)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 6545102)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 6544920)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 6544963)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2412 (class 2606 OID 6544900)
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
-- TOC entry 2462 (class 2606 OID 6545012)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 6545039)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2397 (class 2606 OID 6544858)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2374 (class 2606 OID 6544769)
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
-- TOC entry 2377 (class 2606 OID 6544793)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 6544749)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2361 (class 2606 OID 6544734)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 6545045)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 6545078)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2532 (class 2606 OID 6545221)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2386 (class 2606 OID 6544822)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2394 (class 2606 OID 6544846)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 6545018)
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
-- TOC entry 2392 (class 2606 OID 6544836)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 6544907)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 6545030)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 6545158)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 6545206)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 6545322)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 6545347)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 6545329)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 6545062)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 6545003)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 6544994)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 6545200)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2509 (class 2606 OID 6545130)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2353 (class 2606 OID 6544705)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2487 (class 2606 OID 6545069)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2359 (class 2606 OID 6544723)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2363 (class 2606 OID 6544743)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2494 (class 2606 OID 6545087)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 6545025)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 6544975)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 6545371)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 6545359)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 6545353)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 6545143)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2383 (class 2606 OID 6544802)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 6544985)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 6545189)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 6545342)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2402 (class 2606 OID 6544871)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2355 (class 2606 OID 6544718)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2543 (class 2606 OID 6545252)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2423 (class 2606 OID 6544929)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 6545053)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2505 (class 2606 OID 6545121)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2436 (class 2606 OID 6544958)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2536 (class 2606 OID 6545234)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 6545114)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2426 (class 1259 OID 6544951)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2510 (class 1259 OID 6545144)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2511 (class 1259 OID 6545145)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2384 (class 1259 OID 6544824)
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
-- TOC entry 2475 (class 1259 OID 6545046)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2469 (class 1259 OID 6545032)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2470 (class 1259 OID 6545031)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2421 (class 1259 OID 6544930)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2497 (class 1259 OID 6545103)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2498 (class 1259 OID 6545105)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2499 (class 1259 OID 6545104)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2409 (class 1259 OID 6544902)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2410 (class 1259 OID 6544901)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2528 (class 1259 OID 6545223)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2529 (class 1259 OID 6545224)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2530 (class 1259 OID 6545225)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2537 (class 1259 OID 6545257)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2538 (class 1259 OID 6545254)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2539 (class 1259 OID 6545256)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2540 (class 1259 OID 6545255)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2399 (class 1259 OID 6544873)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2400 (class 1259 OID 6544872)
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
-- TOC entry 2375 (class 1259 OID 6544796)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2485 (class 1259 OID 6545070)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2439 (class 1259 OID 6544964)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2365 (class 1259 OID 6544750)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2366 (class 1259 OID 6544751)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2490 (class 1259 OID 6545090)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2491 (class 1259 OID 6545089)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2492 (class 1259 OID 6545088)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2413 (class 1259 OID 6544908)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2414 (class 1259 OID 6544910)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2415 (class 1259 OID 6544909)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2575 (class 1259 OID 6545361)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2449 (class 1259 OID 6544998)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2450 (class 1259 OID 6544996)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2451 (class 1259 OID 6544995)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2452 (class 1259 OID 6544997)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2356 (class 1259 OID 6544724)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2357 (class 1259 OID 6544725)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2478 (class 1259 OID 6545054)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2464 (class 1259 OID 6545019)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2506 (class 1259 OID 6545131)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2507 (class 1259 OID 6545132)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2558 (class 1259 OID 6545312)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2559 (class 1259 OID 6545313)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2560 (class 1259 OID 6545314)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2388 (class 1259 OID 6544838)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2389 (class 1259 OID 6544837)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2390 (class 1259 OID 6544839)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2570 (class 1259 OID 6545348)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2514 (class 1259 OID 6545159)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2515 (class 1259 OID 6545160)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2550 (class 1259 OID 6545286)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2551 (class 1259 OID 6545288)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2552 (class 1259 OID 6545284)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2553 (class 1259 OID 6545287)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2554 (class 1259 OID 6545285)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2503 (class 1259 OID 6545122)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2455 (class 1259 OID 6545007)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2456 (class 1259 OID 6545006)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2457 (class 1259 OID 6545004)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2458 (class 1259 OID 6545005)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2339 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2546 (class 1259 OID 6545274)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2547 (class 1259 OID 6545273)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2561 (class 1259 OID 6545323)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2420 (class 1259 OID 6544921)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2371 (class 1259 OID 6544771)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2372 (class 1259 OID 6544770)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2380 (class 1259 OID 6544803)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2381 (class 1259 OID 6544804)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2444 (class 1259 OID 6544988)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2445 (class 1259 OID 6544987)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2446 (class 1259 OID 6544986)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2564 (class 1259 OID 6545331)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2565 (class 1259 OID 6545330)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2427 (class 1259 OID 6544953)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2428 (class 1259 OID 6544949)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2429 (class 1259 OID 6544946)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2430 (class 1259 OID 6544947)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2431 (class 1259 OID 6544945)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2432 (class 1259 OID 6544950)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2433 (class 1259 OID 6544948)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2387 (class 1259 OID 6544823)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2405 (class 1259 OID 6544887)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2406 (class 1259 OID 6544889)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2407 (class 1259 OID 6544888)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2408 (class 1259 OID 6544890)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2463 (class 1259 OID 6545013)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2533 (class 1259 OID 6545222)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2541 (class 1259 OID 6545253)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2378 (class 1259 OID 6544794)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2379 (class 1259 OID 6544795)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2500 (class 1259 OID 6545115)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2581 (class 1259 OID 6545372)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2398 (class 1259 OID 6544859)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2578 (class 1259 OID 6545360)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2483 (class 1259 OID 6545064)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2484 (class 1259 OID 6545063)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2555 (class 1259 OID 6545283)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2342 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2395 (class 1259 OID 6544847)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2534 (class 1259 OID 6545235)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2526 (class 1259 OID 6545207)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2527 (class 1259 OID 6545208)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2364 (class 1259 OID 6544744)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2434 (class 1259 OID 6544952)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2607 (class 2606 OID 6545512)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2610 (class 2606 OID 6545497)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2609 (class 2606 OID 6545502)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2605 (class 2606 OID 6545522)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2611 (class 2606 OID 6545492)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2606 (class 2606 OID 6545517)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2608 (class 2606 OID 6545507)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2641 (class 2606 OID 6545667)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2640 (class 2606 OID 6545672)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2592 (class 2606 OID 6545427)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2628 (class 2606 OID 6545607)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2626 (class 2606 OID 6545602)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2627 (class 2606 OID 6545597)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2604 (class 2606 OID 6545487)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2636 (class 2606 OID 6545637)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2634 (class 2606 OID 6545647)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2635 (class 2606 OID 6545642)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2598 (class 2606 OID 6545462)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2599 (class 2606 OID 6545457)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2624 (class 2606 OID 6545587)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2647 (class 2606 OID 6545692)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2646 (class 2606 OID 6545697)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2645 (class 2606 OID 6545702)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2648 (class 2606 OID 6545722)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2651 (class 2606 OID 6545707)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2649 (class 2606 OID 6545717)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2650 (class 2606 OID 6545712)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2596 (class 2606 OID 6545452)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2597 (class 2606 OID 6545447)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2588 (class 2606 OID 6545412)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2589 (class 2606 OID 6545407)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2630 (class 2606 OID 6545617)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2612 (class 2606 OID 6545527)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2585 (class 2606 OID 6545387)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2584 (class 2606 OID 6545392)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2631 (class 2606 OID 6545632)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2632 (class 2606 OID 6545627)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2633 (class 2606 OID 6545622)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2602 (class 2606 OID 6545467)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2600 (class 2606 OID 6545477)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2601 (class 2606 OID 6545472)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2666 (class 2606 OID 6545797)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2616 (class 2606 OID 6545562)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2618 (class 2606 OID 6545552)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2619 (class 2606 OID 6545547)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2617 (class 2606 OID 6545557)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2583 (class 2606 OID 6545377)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2582 (class 2606 OID 6545382)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2629 (class 2606 OID 6545612)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2625 (class 2606 OID 6545592)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2639 (class 2606 OID 6545657)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2638 (class 2606 OID 6545662)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2661 (class 2606 OID 6545762)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2660 (class 2606 OID 6545767)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2659 (class 2606 OID 6545772)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2594 (class 2606 OID 6545437)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2595 (class 2606 OID 6545432)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2593 (class 2606 OID 6545442)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2665 (class 2606 OID 6545792)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2643 (class 2606 OID 6545677)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2642 (class 2606 OID 6545682)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2656 (class 2606 OID 6545747)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2654 (class 2606 OID 6545757)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2658 (class 2606 OID 6545737)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2655 (class 2606 OID 6545752)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2657 (class 2606 OID 6545742)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2637 (class 2606 OID 6545652)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2620 (class 2606 OID 6545582)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2621 (class 2606 OID 6545577)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2623 (class 2606 OID 6545567)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2622 (class 2606 OID 6545572)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2652 (class 2606 OID 6545732)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 6545727)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2662 (class 2606 OID 6545777)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2603 (class 2606 OID 6545482)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2644 (class 2606 OID 6545687)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2586 (class 2606 OID 6545402)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2587 (class 2606 OID 6545397)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2591 (class 2606 OID 6545417)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2590 (class 2606 OID 6545422)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2613 (class 2606 OID 6545542)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2614 (class 2606 OID 6545537)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2615 (class 2606 OID 6545532)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2663 (class 2606 OID 6545787)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2664 (class 2606 OID 6545782)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-08 12:41:00 CEST

--
-- PostgreSQL database dump complete
--

