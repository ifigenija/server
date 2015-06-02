--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-06-02 12:38:37 CEST

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
-- TOC entry 180 (class 1259 OID 6008795)
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
-- TOC entry 227 (class 1259 OID 6009312)
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
-- TOC entry 226 (class 1259 OID 6009295)
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
-- TOC entry 219 (class 1259 OID 6009204)
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
-- TOC entry 194 (class 1259 OID 6008974)
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
-- TOC entry 197 (class 1259 OID 6009008)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6008917)
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
-- TOC entry 228 (class 1259 OID 6009326)
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
-- TOC entry 213 (class 1259 OID 6009134)
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
    maxprekirvanj integer,
    tipfunkcije_id uuid
);


--
-- TOC entry 192 (class 1259 OID 6008954)
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
-- TOC entry 196 (class 1259 OID 6009002)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6008934)
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
-- TOC entry 202 (class 1259 OID 6009051)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6009076)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6008891)
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
-- TOC entry 181 (class 1259 OID 6008804)
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
-- TOC entry 182 (class 1259 OID 6008815)
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
-- TOC entry 177 (class 1259 OID 6008769)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6008788)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6009083)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6009114)
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
-- TOC entry 223 (class 1259 OID 6009248)
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
-- TOC entry 184 (class 1259 OID 6008848)
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
-- TOC entry 186 (class 1259 OID 6008883)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6009057)
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
-- TOC entry 185 (class 1259 OID 6008868)
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
-- TOC entry 191 (class 1259 OID 6008946)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6009069)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6009189)
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
-- TOC entry 222 (class 1259 OID 6009240)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6009352)
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
-- TOC entry 232 (class 1259 OID 6009380)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id integer NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 238 (class 1259 OID 6009410)
-- Name: programfestival_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programfestival_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 230 (class 1259 OID 6009361)
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
-- TOC entry 236 (class 1259 OID 6009406)
-- Name: programgostovanje_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programgostovanje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 209 (class 1259 OID 6009098)
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
-- TOC entry 201 (class 1259 OID 6009042)
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
-- TOC entry 200 (class 1259 OID 6009032)
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
-- TOC entry 221 (class 1259 OID 6009229)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6009166)
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
-- TOC entry 174 (class 1259 OID 6008740)
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
-- TOC entry 173 (class 1259 OID 6008738)
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
-- TOC entry 210 (class 1259 OID 6009108)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6008778)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6008762)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6009122)
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
-- TOC entry 204 (class 1259 OID 6009063)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6009013)
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
-- TOC entry 235 (class 1259 OID 6009398)
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
-- TOC entry 234 (class 1259 OID 6009391)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 6009386)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 6009176)
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
-- TOC entry 183 (class 1259 OID 6008840)
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
-- TOC entry 199 (class 1259 OID 6009019)
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
-- TOC entry 220 (class 1259 OID 6009218)
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
-- TOC entry 231 (class 1259 OID 6009369)
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
-- TOC entry 237 (class 1259 OID 6009408)
-- Name: tipprogramskeenote_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipprogramskeenote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 188 (class 1259 OID 6008903)
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
-- TOC entry 175 (class 1259 OID 6008749)
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
-- TOC entry 225 (class 1259 OID 6009274)
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
-- TOC entry 193 (class 1259 OID 6008965)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6009090)
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
-- TOC entry 215 (class 1259 OID 6009159)
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
-- TOC entry 195 (class 1259 OID 6008997)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6009264)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 6009149)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2174 (class 2604 OID 6008743)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2776 (class 0 OID 6008795)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 6009312)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
000c0000-556d-87ac-3857-ecff89d53c5a	000d0000-556d-87ac-7bfc-50b0cab83dd8	\N	00090000-556d-87ac-7b81-d21047eb7e64	\N	\N	0001	f	\N	\N	\N	\N	\N	\N
000c0000-556d-87ac-5b27-00c2af0f176d	000d0000-556d-87ac-9bca-07c07c6c07ef	\N	00090000-556d-87ac-7181-e90cb417ae5e	\N	\N	0002	f	\N	\N	\N	\N	\N	\N
000c0000-556d-87ac-4d37-006c7017227c	000d0000-556d-87ac-ad32-dfbab3ca5293	\N	00090000-556d-87ac-6073-8c000c59b463	\N	\N	0003	f	\N	\N	\N	\N	\N	\N
000c0000-556d-87ac-75c4-3c650e065235	000d0000-556d-87ac-4054-0a7dd3761572	\N	00090000-556d-87ac-e631-d2de2d36faa0	\N	\N	0004	f	\N	\N	\N	\N	\N	\N
000c0000-556d-87ac-12a8-8cdc30fa78fa	000d0000-556d-87ac-9e00-7af7bb73f578	\N	00090000-556d-87ac-7392-6529bb3ac213	\N	\N	0005	f	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2822 (class 0 OID 6009295)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2815 (class 0 OID 6009204)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-556d-87ac-c675-d2dc63d2fa5b	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-556d-87ac-aba2-460851fedbe5	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-556d-87ac-17a1-3fc3e15e43a7	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 2790 (class 0 OID 6008974)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-556d-87ac-e878-d06ebd904c1a	\N	\N	00200000-556d-87ac-ee99-0bd8643b6631	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	4			
00180000-556d-87ac-6f9c-2cee04e9a079	\N	\N	00200000-556d-87ac-8186-6f9d2dcce2eb	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-556d-87ac-d2c2-fcbf46623dd1	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
\.


--
-- TOC entry 2793 (class 0 OID 6009008)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2785 (class 0 OID 6008917)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-556d-87ab-9343-5a111bbf478b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-556d-87ab-da8f-3c7f943ec3c1	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-556d-87ab-90d3-562a30d64cb9	AL	ALB	008	Albania 	Albanija	\N
00040000-556d-87ab-0476-cf5e2f32ffae	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-556d-87ab-8731-4fcd2875e83d	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-556d-87ab-1b09-2931923f7725	AD	AND	020	Andorra 	Andora	\N
00040000-556d-87ab-3de1-323281af8ff3	AO	AGO	024	Angola 	Angola	\N
00040000-556d-87ab-e1f6-6a582daf3abc	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-556d-87ab-2dff-0714e2cf2228	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-556d-87ab-c6a8-a69e20ede31f	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-556d-87ab-9325-1b63c502b2f6	AR	ARG	032	Argentina 	Argenitna	\N
00040000-556d-87ab-5e85-48f5cb048f70	AM	ARM	051	Armenia 	Armenija	\N
00040000-556d-87ab-a069-d54898782feb	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-556d-87ab-7b4f-817b7b532944	AU	AUS	036	Australia 	Avstralija	\N
00040000-556d-87ab-65af-aebbfdd1c961	AT	AUT	040	Austria 	Avstrija	\N
00040000-556d-87ab-7f09-d8d5701a0dca	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-556d-87ab-88c4-ebb8317240ce	BS	BHS	044	Bahamas 	Bahami	\N
00040000-556d-87ab-6025-4f6ad023cba7	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-556d-87ab-b12e-82f1d8eb419d	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-556d-87ab-97e0-6b0247ae6f9c	BB	BRB	052	Barbados 	Barbados	\N
00040000-556d-87ab-ef2d-a8e847cd3785	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-556d-87ab-fa1c-da9e02ddbfa4	BE	BEL	056	Belgium 	Belgija	\N
00040000-556d-87ab-184d-f12ee53148b9	BZ	BLZ	084	Belize 	Belize	\N
00040000-556d-87ab-be66-bb02eebc4063	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-556d-87ab-df8a-06aba457a420	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-556d-87ab-7963-e6cdb2b3a54c	BT	BTN	064	Bhutan 	Butan	\N
00040000-556d-87ab-40ca-cb8c8e74eb23	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-556d-87ab-bbc9-3790c732db6e	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-556d-87ab-a008-c471aa445345	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-556d-87ab-f913-0969ca38c612	BW	BWA	072	Botswana 	Bocvana	\N
00040000-556d-87ab-53e5-d2391b7c383d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-556d-87ab-74ff-e829084d0341	BR	BRA	076	Brazil 	Brazilija	\N
00040000-556d-87ab-9d55-6a1a8d9a0e6f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-556d-87ab-7e95-c7b66ae9c87d	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-556d-87ab-124a-01103d27e32b	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-556d-87ab-f628-c64fd094b8c6	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-556d-87ab-9583-9ed67a17ba09	BI	BDI	108	Burundi 	Burundi 	\N
00040000-556d-87ab-5328-a9a60b780b4f	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-556d-87ab-ca38-5ac61c489cf2	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-556d-87ab-68fa-5e6a80c6db6e	CA	CAN	124	Canada 	Kanada	\N
00040000-556d-87ab-6af3-366dc8923b67	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-556d-87ab-adb8-b6fe6677b59b	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-556d-87ab-1456-630cccfa4290	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-556d-87ab-33c8-46803bf4e14a	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-556d-87ab-ad2f-f9d8dec54eff	CL	CHL	152	Chile 	Čile	\N
00040000-556d-87ab-f14f-a7c3ad3b00cf	CN	CHN	156	China 	Kitajska	\N
00040000-556d-87ab-e913-a1526bbdff2a	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-556d-87ab-2afb-b229dfddaaf5	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-556d-87ab-c6cd-d810ddad50a3	CO	COL	170	Colombia 	Kolumbija	\N
00040000-556d-87ab-192d-e423cb774e27	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-556d-87ab-faba-3793a7180cef	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-556d-87ab-5108-1fe5c4ea4294	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-556d-87ab-67ef-2ab17bbc63e8	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-556d-87ab-0824-7717f05f8761	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-556d-87ab-846e-72068b579de6	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-556d-87ab-86b2-9a9c19716923	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-556d-87ab-b4da-163d7e5fef6e	CU	CUB	192	Cuba 	Kuba	\N
00040000-556d-87ab-1bd2-bb500436f009	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-556d-87ab-d93d-9634fb62f477	CY	CYP	196	Cyprus 	Ciper	\N
00040000-556d-87ab-f0c6-62f2c58f4a73	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-556d-87ab-d8fb-08f76cb43dca	DK	DNK	208	Denmark 	Danska	\N
00040000-556d-87ab-b69d-9f228eee5864	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-556d-87ab-e06c-b7e156c3fb8e	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-556d-87ab-7df8-0d3c04b8bdb6	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-556d-87ab-716e-127c1fc30fc7	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-556d-87ab-1fd3-9612a0835efa	EG	EGY	818	Egypt 	Egipt	\N
00040000-556d-87ab-5780-463469c2ee1c	SV	SLV	222	El Salvador 	Salvador	\N
00040000-556d-87ab-82d5-777a1cdd801d	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-556d-87ab-9b76-a0f04726c0d2	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-556d-87ab-2a64-1445d6f1d571	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-556d-87ab-2456-24849739927f	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-556d-87ab-9f7b-8973af732509	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-556d-87ab-2bb5-8a2396422e8b	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-556d-87ab-d230-55c2745d7728	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-556d-87ab-2507-9787d0acbd92	FI	FIN	246	Finland 	Finska	\N
00040000-556d-87ab-0852-8be2b6193e0f	FR	FRA	250	France 	Francija	\N
00040000-556d-87ab-085f-a300c4e669a5	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-556d-87ab-60b9-36bd6e59a736	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-556d-87ab-4cbf-f159e53ff5c0	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-556d-87ab-c3a6-bd49673c4c45	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-556d-87ab-f6b5-b766573097db	GA	GAB	266	Gabon 	Gabon	\N
00040000-556d-87ab-afcc-d5bb7b2ae568	GM	GMB	270	Gambia 	Gambija	\N
00040000-556d-87ab-48fa-20ff74650aa2	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-556d-87ab-39a5-da22f879aaaa	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-556d-87ab-786e-2c959d8c1faa	GH	GHA	288	Ghana 	Gana	\N
00040000-556d-87ab-bdf2-b5c0bb76ab4e	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-556d-87ab-22f4-bc6a1373d806	GR	GRC	300	Greece 	Grčija	\N
00040000-556d-87ab-99eb-57e56a3048c0	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-556d-87ab-0f08-dbbb12faf9b6	GD	GRD	308	Grenada 	Grenada	\N
00040000-556d-87ab-214b-bdc301d78b79	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-556d-87ab-b1f3-32c731796866	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-556d-87ab-c701-435e204f55ca	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-556d-87ab-d2a9-cf816319a9fa	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-556d-87ab-6c65-61975cf5e305	GN	GIN	324	Guinea 	Gvineja	\N
00040000-556d-87ab-6180-7be79ed93379	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-556d-87ab-73d0-df3528dea5d0	GY	GUY	328	Guyana 	Gvajana	\N
00040000-556d-87ab-2840-b749f668a657	HT	HTI	332	Haiti 	Haiti	\N
00040000-556d-87ab-ae63-ec5a63524a67	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-556d-87ab-3de5-2d382bf88bd8	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-556d-87ab-3483-bf72ec16a4d2	HN	HND	340	Honduras 	Honduras	\N
00040000-556d-87ab-5888-71c64cd4454c	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-556d-87ab-c0b1-f7f36e3a4541	HU	HUN	348	Hungary 	Madžarska	\N
00040000-556d-87ab-bff8-58d82b2295de	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-556d-87ab-018c-262c3966d86f	IN	IND	356	India 	Indija	\N
00040000-556d-87ab-c5d0-3937d018f7b4	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-556d-87ab-fc84-0e6699d93569	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-556d-87ab-a48a-add49c7988b5	IQ	IRQ	368	Iraq 	Irak	\N
00040000-556d-87ab-c99c-3eb4f759cf5e	IE	IRL	372	Ireland 	Irska	\N
00040000-556d-87ab-cead-5f9d7a8d8c5b	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-556d-87ab-fc0e-2b19379d071d	IL	ISR	376	Israel 	Izrael	\N
00040000-556d-87ab-9aa0-046e602bdec5	IT	ITA	380	Italy 	Italija	\N
00040000-556d-87ab-40c7-f1b1becd3d4e	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-556d-87ab-7317-427b17b8ac8d	JP	JPN	392	Japan 	Japonska	\N
00040000-556d-87ab-9b2f-760763a9220a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-556d-87ab-77ec-ed850b4c99df	JO	JOR	400	Jordan 	Jordanija	\N
00040000-556d-87ab-9e60-f68b98342383	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-556d-87ab-eb7d-be0e030f13cc	KE	KEN	404	Kenya 	Kenija	\N
00040000-556d-87ab-f959-5d1c5f27a82e	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-556d-87ab-2f10-216c0ea5e461	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-556d-87ab-3462-c4db73c8be49	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-556d-87ab-9cdc-c3c09af2d900	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-556d-87ab-9143-b769215fa170	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-556d-87ab-1b04-df68b233d704	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-556d-87ab-4725-c20d3e60cbc9	LV	LVA	428	Latvia 	Latvija	\N
00040000-556d-87ab-6980-63d313fd872f	LB	LBN	422	Lebanon 	Libanon	\N
00040000-556d-87ab-5f15-bf860e71099f	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-556d-87ab-de05-fe1e9ad3df9f	LR	LBR	430	Liberia 	Liberija	\N
00040000-556d-87ab-c926-3da13cb35700	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-556d-87ab-67fd-76525b746a59	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-556d-87ab-9852-5722b5ad5d0a	LT	LTU	440	Lithuania 	Litva	\N
00040000-556d-87ab-2eb9-35d960c641ec	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-556d-87ab-fcca-2ddbf9856bc7	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-556d-87ab-0688-0c749e4cb78c	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-556d-87ab-20b4-39f70515fce4	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-556d-87ab-f1cf-90b63d2b573e	MW	MWI	454	Malawi 	Malavi	\N
00040000-556d-87ab-11c9-9f6ffa9938a9	MY	MYS	458	Malaysia 	Malezija	\N
00040000-556d-87ab-2571-84cae624a59f	MV	MDV	462	Maldives 	Maldivi	\N
00040000-556d-87ab-0eb5-d33564804225	ML	MLI	466	Mali 	Mali	\N
00040000-556d-87ab-55d2-2937b7942750	MT	MLT	470	Malta 	Malta	\N
00040000-556d-87ab-d58f-712371964b11	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-556d-87ab-0bfc-c57744b85c1f	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-556d-87ab-a2f7-53887de00da7	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-556d-87ab-a9d6-0b08c33230b2	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-556d-87ab-5750-549f6666c67d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-556d-87ab-2efa-bfb2337e3db7	MX	MEX	484	Mexico 	Mehika	\N
00040000-556d-87ab-76c8-0467a4a0a0a5	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-556d-87ab-e81e-1d5cde63ff5d	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-556d-87ab-70df-b9d83751100c	MC	MCO	492	Monaco 	Monako	\N
00040000-556d-87ab-3b1b-28afb1e983b0	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-556d-87ab-2e79-0d77a4a7d6dc	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-556d-87ab-116f-ea435cecc686	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-556d-87ab-5d85-ae6b4ff35495	MA	MAR	504	Morocco 	Maroko	\N
00040000-556d-87ab-fb9e-d9f6ce00d0c3	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-556d-87ab-2ffe-c25d19961400	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-556d-87ab-b517-904555f79954	NA	NAM	516	Namibia 	Namibija	\N
00040000-556d-87ab-30ad-43828221a5cc	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-556d-87ab-0271-b17f6bccaadd	NP	NPL	524	Nepal 	Nepal	\N
00040000-556d-87ab-40ba-1e2e11c5a88d	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-556d-87ab-7216-1a4b61c479e9	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-556d-87ab-4044-1886f0d20e46	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-556d-87ab-ddea-aef611b62a70	NE	NER	562	Niger 	Niger 	\N
00040000-556d-87ab-6872-c3ba86c3ddb6	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-556d-87ab-af5f-a366d0cd353a	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-556d-87ab-d0cd-389faaa4f107	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-556d-87ab-6e15-b5d20409f763	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-556d-87ab-2317-f3f45bc2a30a	NO	NOR	578	Norway 	Norveška	\N
00040000-556d-87ab-4d60-1ef745685234	OM	OMN	512	Oman 	Oman	\N
00040000-556d-87ab-08c0-a5a970ff8c9c	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-556d-87ab-9c27-df1eff0c9b24	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-556d-87ab-195f-77a8b75323b1	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-556d-87ab-fd38-90b0a1135548	PA	PAN	591	Panama 	Panama	\N
00040000-556d-87ab-5a7a-01e629cb8cf3	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-556d-87ab-0681-76fcecf953e4	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-556d-87ab-fbca-efc4affea551	PE	PER	604	Peru 	Peru	\N
00040000-556d-87ab-2665-99fa7794c785	PH	PHL	608	Philippines 	Filipini	\N
00040000-556d-87ab-189f-3dcdca9f7371	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-556d-87ab-6d38-6b0d9971e703	PL	POL	616	Poland 	Poljska	\N
00040000-556d-87ab-1c4e-13d3675a1fe4	PT	PRT	620	Portugal 	Portugalska	\N
00040000-556d-87ab-1fc2-1192f006e9e8	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-556d-87ab-b03f-bf86d91fbae1	QA	QAT	634	Qatar 	Katar	\N
00040000-556d-87ab-1fbc-3f7742d81708	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-556d-87ab-940d-e7254eadf54e	RO	ROU	642	Romania 	Romunija	\N
00040000-556d-87ab-7d01-a712a427e3e1	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-556d-87ab-ee67-6d4e969831a8	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-556d-87ab-5f0e-302463a6b122	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-556d-87ab-cdc3-2779b8cab114	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-556d-87ab-3139-f11af9176ca5	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-556d-87ab-fc0e-402fd3ef6243	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-556d-87ab-dfdc-72edbfd3bc20	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-556d-87ab-56fb-98706e3b46af	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-556d-87ab-b7de-c6bf7d47a84a	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-556d-87ab-dbf6-373f04f39e30	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-556d-87ab-a99f-9fa66d0917ae	SM	SMR	674	San Marino 	San Marino	\N
00040000-556d-87ab-d435-31ea3afd6f1e	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-556d-87ab-7b80-c2a32bcd73e4	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-556d-87ab-2fff-2fc785b42f61	SN	SEN	686	Senegal 	Senegal	\N
00040000-556d-87ab-906c-a0429f977277	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-556d-87ab-6bde-a6d45ba898a8	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-556d-87ab-2332-9eedc5d42ec9	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-556d-87ab-ab81-583b6f445561	SG	SGP	702	Singapore 	Singapur	\N
00040000-556d-87ab-f709-f8ddef3d4e26	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-556d-87ab-0ad5-1ce5c35d3156	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-556d-87ab-0b07-ce95562e8e06	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-556d-87ab-941e-dfe1ba8a8e03	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-556d-87ab-0a93-dd1e9adfb3fa	SO	SOM	706	Somalia 	Somalija	\N
00040000-556d-87ab-9567-0a1b2f104000	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-556d-87ab-15ae-5077d435be96	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-556d-87ab-b3c1-bbf4983a096d	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-556d-87ab-fe0c-209969ee3cc9	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-556d-87ab-9919-f7a291d3e7a7	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-556d-87ab-7787-d53696dbff4f	SD	SDN	729	Sudan 	Sudan	\N
00040000-556d-87ab-d7b6-2981c0a68605	SR	SUR	740	Suriname 	Surinam	\N
00040000-556d-87ab-1f3a-e59e9b2d3a7c	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-556d-87ab-57f2-d19768eff997	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-556d-87ab-f7b5-f828a7106b6b	SE	SWE	752	Sweden 	Švedska	\N
00040000-556d-87ab-e279-775cf42d414a	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-556d-87ab-40c5-977423f81f45	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-556d-87ab-1a5d-559dcb17bdd0	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-556d-87ab-ace1-37c4a522ef73	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-556d-87ab-1f10-206a860711cd	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-556d-87ab-a011-aaf2fc76ea2e	TH	THA	764	Thailand 	Tajska	\N
00040000-556d-87ab-172b-53242089cef5	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-556d-87ab-fdc6-0470a290b1b3	TG	TGO	768	Togo 	Togo	\N
00040000-556d-87ab-08bd-33913e25214b	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-556d-87ab-ad6d-7f118d6576f5	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-556d-87ab-a7d9-cdd48b2c5b53	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-556d-87ab-8936-a33819e66510	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-556d-87ab-6355-229eb26a7fe2	TR	TUR	792	Turkey 	Turčija	\N
00040000-556d-87ab-382c-1882a3166674	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-556d-87ab-7809-01572f7b4a2c	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-556d-87ab-532b-eed5b3a681b2	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-556d-87ab-8820-717a7a49d584	UG	UGA	800	Uganda 	Uganda	\N
00040000-556d-87ab-3bef-ae11e55b12b3	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-556d-87ab-a276-da74e4e57a2f	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-556d-87ab-8517-cd832cda1764	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-556d-87ab-0117-11cd2487efbc	US	USA	840	United States 	Združene države Amerike	\N
00040000-556d-87ab-eb4c-1dbfdab59965	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-556d-87ab-2eec-26211268c82b	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-556d-87ab-24fc-1c05a20ddabd	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-556d-87ab-3833-b1d1b1d0748c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-556d-87ab-22df-f8694a2faacc	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-556d-87ab-de0b-00f3d6c940ac	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-556d-87ab-cdb7-9563445ba3b9	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-556d-87ab-583e-99c5501e1e75	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-556d-87ab-ce01-9439f3f565ee	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-556d-87ab-aebc-9bd2e8ba6335	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-556d-87ab-57d0-9100c71ccf82	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-556d-87ab-a169-98878eb5748d	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-556d-87ab-f3b2-f0f60c8c5d0c	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2824 (class 0 OID 6009326)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, tip_programske_enote_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tip) FROM stdin;
\.


--
-- TOC entry 2809 (class 0 OID 6009134)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj, tipfunkcije_id) FROM stdin;
000d0000-556d-87ac-48a0-07db6663fe98	000e0000-556d-87ac-adcc-e6d545b744a0	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-556d-87ab-4137-a6ecc8c0c4de
000d0000-556d-87ac-7bfc-50b0cab83dd8	000e0000-556d-87ac-adcc-e6d545b744a0	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-556d-87ab-4137-a6ecc8c0c4de
000d0000-556d-87ac-9bca-07c07c6c07ef	000e0000-556d-87ac-adcc-e6d545b744a0	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-556d-87ab-e5e5-95f07a43e574
000d0000-556d-87ac-ad32-dfbab3ca5293	000e0000-556d-87ac-adcc-e6d545b744a0	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-556d-87ab-2b7e-6968033e1a03
000d0000-556d-87ac-4054-0a7dd3761572	000e0000-556d-87ac-adcc-e6d545b744a0	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-556d-87ab-2b7e-6968033e1a03
000d0000-556d-87ac-9e00-7af7bb73f578	000e0000-556d-87ac-adcc-e6d545b744a0	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-556d-87ab-2b7e-6968033e1a03
\.


--
-- TOC entry 2788 (class 0 OID 6008954)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2792 (class 0 OID 6009002)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2786 (class 0 OID 6008934)
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
-- TOC entry 2798 (class 0 OID 6009051)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2802 (class 0 OID 6009076)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2783 (class 0 OID 6008891)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-556d-87ac-c2b3-31c6c3a12d90	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-556d-87ac-0656-6e6649324e14	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-556d-87ac-fe52-8f8c5aa8ab5f	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-556d-87ac-2444-76d48356d075	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-556d-87ac-1fd8-277894c3a51c	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-556d-87ac-ed55-948fb2637665	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-556d-87ac-bab7-32af85b4652d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-556d-87ac-8fcd-2460b10d904e	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-556d-87ac-798b-a5cc5e952820	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-556d-87ac-c206-052322731a50	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-556d-87ac-c847-ac7a71efdecd	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-556d-87ac-350f-675ce25ac510	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-556d-87ac-1d3a-da7c70b3d4e2	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-556d-87ac-4b9a-99fc27948b88	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-556d-87ac-eafa-237ae2d11864	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-556d-87ac-a1c1-b1fc540380ac	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2777 (class 0 OID 6008804)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-556d-87ac-ad47-c0cabf03964e	00000000-556d-87ac-1fd8-277894c3a51c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-556d-87ac-361d-2f14b886aea1	00000000-556d-87ac-1fd8-277894c3a51c	00010000-556d-87ac-6539-c3c18d685524	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-556d-87ac-8a0e-3c453331b05b	00000000-556d-87ac-ed55-948fb2637665	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2778 (class 0 OID 6008815)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-556d-87ac-d11b-b38c17576db9	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-556d-87ac-e631-d2de2d36faa0	00010000-556d-87ac-46bb-72b11ec886f8	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-556d-87ac-6073-8c000c59b463	00010000-556d-87ac-4ce5-80456b2ae3dc	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-556d-87ac-612c-2fa529c34ebf	00010000-556d-87ac-d799-b672064af455	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-556d-87ac-dd62-d7f98649cfef	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-556d-87ac-470b-942c5768e1f8	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-556d-87ac-f272-74374e9bfb95	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-556d-87ac-fb7d-1b6cce2cdde8	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-556d-87ac-7b81-d21047eb7e64	00010000-556d-87ac-6871-1b8b89633afa	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-556d-87ac-7181-e90cb417ae5e	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-556d-87ac-2795-9066d8a7927a	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-556d-87ac-7392-6529bb3ac213	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-556d-87ac-a878-bc3c48c1cb89	00010000-556d-87ac-1b1a-1869bcf1c300	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2768 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2773 (class 0 OID 6008769)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-556d-87ab-0bcc-388662bfb85b	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-556d-87ab-d234-99282f8e25a8	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-556d-87ab-930a-fa06c3f612d9	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-556d-87ab-ad79-670a2f280cc4	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-556d-87ab-fc70-911ba8f120d6	Abonma-read	Abonma - branje	f
00030000-556d-87ab-5bcf-382ed0b6eb08	Abonma-write	Abonma - spreminjanje	f
00030000-556d-87ab-1ea8-f146519be094	Alternacija-read	Alternacija - branje	f
00030000-556d-87ab-7b4b-88d047189c23	Alternacija-write	Alternacija - spreminjanje	f
00030000-556d-87ab-d214-83cf06da12c5	Arhivalija-read	Arhivalija - branje	f
00030000-556d-87ab-050e-314514e1dfbb	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-556d-87ab-947d-bb35d0a44e4a	Besedilo-read	Besedilo - branje	f
00030000-556d-87ab-5784-74f90c1b0cbc	Besedilo-write	Besedilo - spreminjanje	f
00030000-556d-87ab-3892-63119c1fdd7a	DogodekIzven-read	DogodekIzven - branje	f
00030000-556d-87ab-013a-cd03990fe5cf	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-556d-87ab-c690-0bb8f3cbcf10	Dogodek-read	Dogodek - branje	f
00030000-556d-87ab-31f4-a11cb59068a0	Dogodek-write	Dogodek - spreminjanje	f
00030000-556d-87ab-248f-1880727b331d	Drzava-read	Drzava - branje	f
00030000-556d-87ab-a98b-bdf9ded652e5	Drzava-write	Drzava - spreminjanje	f
00030000-556d-87ab-ab1a-3f71fccd91a4	Funkcija-read	Funkcija - branje	f
00030000-556d-87ab-5714-2e44e33d9f1e	Funkcija-write	Funkcija - spreminjanje	f
00030000-556d-87ab-2ef6-1f29c2b79fec	Gostovanje-read	Gostovanje - branje	f
00030000-556d-87ab-3000-72cf91b4c901	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-556d-87ab-d830-cec408a67edb	Gostujoca-read	Gostujoca - branje	f
00030000-556d-87ab-fa1c-c5ba387fe05a	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-556d-87ab-65dc-4e9b62b56672	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-556d-87ab-56f4-5f52e8db9d91	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-556d-87ab-7a80-eb70125081a9	Kupec-read	Kupec - branje	f
00030000-556d-87ab-5abb-33d8003e31ee	Kupec-write	Kupec - spreminjanje	f
00030000-556d-87ab-8c7d-815ff5234b8c	NacinPlacina-read	NacinPlacina - branje	f
00030000-556d-87ab-b32b-bc550335b54b	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-556d-87ab-0b73-411a3a9f474c	Option-read	Option - branje	f
00030000-556d-87ab-f334-3c13c3841580	Option-write	Option - spreminjanje	f
00030000-556d-87ab-800a-cf00bb235426	OptionValue-read	OptionValue - branje	f
00030000-556d-87ab-a77b-040b8cac34fb	OptionValue-write	OptionValue - spreminjanje	f
00030000-556d-87ab-485e-7f58da915b24	Oseba-read	Oseba - branje	f
00030000-556d-87ab-995c-02e862623fb2	Oseba-write	Oseba - spreminjanje	f
00030000-556d-87ab-2476-5b542aa07437	Permission-read	Permission - branje	f
00030000-556d-87ab-4500-ed98a3581c89	Permission-write	Permission - spreminjanje	f
00030000-556d-87ab-1661-f884036ac742	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-556d-87ab-648d-e60e213bf1e8	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-556d-87ab-69d6-0a474376b090	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-556d-87ab-e12b-7f68efc7ea26	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-556d-87ab-42b4-958179b2bada	Pogodba-read	Pogodba - branje	f
00030000-556d-87ab-3ac0-efcbd6746b02	Pogodba-write	Pogodba - spreminjanje	f
00030000-556d-87ac-c205-b31f32083c02	Popa-read	Popa - branje	f
00030000-556d-87ac-0f50-4dcf5e5e44aa	Popa-write	Popa - spreminjanje	f
00030000-556d-87ac-d09e-bd49fc924431	Posta-read	Posta - branje	f
00030000-556d-87ac-9c60-bf8ebbd8b2d5	Posta-write	Posta - spreminjanje	f
00030000-556d-87ac-f859-38cebeff687d	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-556d-87ac-fd19-c3dbe7fdfbad	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-556d-87ac-1bfa-cb0749e27d58	PostniNaslov-read	PostniNaslov - branje	f
00030000-556d-87ac-d9de-b77016d36ad9	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-556d-87ac-66a6-3eb29805aa2a	Predstava-read	Predstava - branje	f
00030000-556d-87ac-038f-dc82b6972f71	Predstava-write	Predstava - spreminjanje	f
00030000-556d-87ac-209d-b7a09feede50	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-556d-87ac-bd22-7920dad12d8a	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-556d-87ac-73f9-7d5215f18873	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-556d-87ac-7cba-385b812f6a8e	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-556d-87ac-97f2-134180900bc7	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-556d-87ac-6d8b-e9b56bf6fe41	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-556d-87ac-5f24-6e51aa995059	Prostor-read	Prostor - branje	f
00030000-556d-87ac-c3f6-82e7112d30ff	Prostor-write	Prostor - spreminjanje	f
00030000-556d-87ac-9074-6470ea25f7b9	Racun-read	Racun - branje	f
00030000-556d-87ac-527c-2dca8b442ce3	Racun-write	Racun - spreminjanje	f
00030000-556d-87ac-b073-e68b24cbcfdb	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-556d-87ac-bde9-12b0be3960b8	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-556d-87ac-2021-dcf3d1777301	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-556d-87ac-8d26-f7a460fe1429	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-556d-87ac-dbeb-63670479b55a	Rekvizit-read	Rekvizit - branje	f
00030000-556d-87ac-3c77-f436069a79c3	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-556d-87ac-0058-9111c1de651a	Revizija-read	Revizija - branje	f
00030000-556d-87ac-3c56-73178c9eeac5	Revizija-write	Revizija - spreminjanje	f
00030000-556d-87ac-ad6e-0d7e60dbdd66	Rezervacija-read	Rezervacija - branje	f
00030000-556d-87ac-ab2c-b72fd6e9c363	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-556d-87ac-f4b7-f625d84a184b	Role-read	Role - branje	f
00030000-556d-87ac-b0d9-1749fc3b58c9	Role-write	Role - spreminjanje	f
00030000-556d-87ac-f630-2216449b2cd5	SedezniRed-read	SedezniRed - branje	f
00030000-556d-87ac-17cc-538341238b4d	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-556d-87ac-7951-eff7be20120e	Sedez-read	Sedez - branje	f
00030000-556d-87ac-03af-cf815f1ea888	Sedez-write	Sedez - spreminjanje	f
00030000-556d-87ac-50c9-9d322b4459aa	Sezona-read	Sezona - branje	f
00030000-556d-87ac-3b01-a5fece55a06b	Sezona-write	Sezona - spreminjanje	f
00030000-556d-87ac-e48d-2c2739deda4c	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-556d-87ac-4ebf-6ce2621bc40d	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-556d-87ac-483d-b0bae33c8590	Stevilcenje-read	Stevilcenje - branje	f
00030000-556d-87ac-0940-cb2197d51b44	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-556d-87ac-0592-33679b42619e	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-556d-87ac-c10e-41e9613a6bd4	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-556d-87ac-dd94-2f809c07e50e	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-556d-87ac-d215-6a95cbf153b0	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-556d-87ac-7197-10a2c3ff7710	Telefonska-read	Telefonska - branje	f
00030000-556d-87ac-ddd7-6a833527af27	Telefonska-write	Telefonska - spreminjanje	f
00030000-556d-87ac-8640-2c6ce592c51d	TerminStoritve-read	TerminStoritve - branje	f
00030000-556d-87ac-43d6-bbb967ee9b93	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-556d-87ac-82e0-5ce3802615f4	TipFunkcije-read	TipFunkcije - branje	f
00030000-556d-87ac-57a1-2a44868d690d	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-556d-87ac-f222-ffd84a442668	Trr-read	Trr - branje	f
00030000-556d-87ac-510c-bb94f22da4a8	Trr-write	Trr - spreminjanje	f
00030000-556d-87ac-f3e1-3cb6a4beb940	Uprizoritev-read	Uprizoritev - branje	f
00030000-556d-87ac-6ce2-31d4f6b511b9	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-556d-87ac-df5d-d267975a58f7	User-read	User - branje	f
00030000-556d-87ac-4745-9798df177d10	User-write	User - spreminjanje	f
00030000-556d-87ac-ac9c-4e09d32a16ec	Vaja-read	Vaja - branje	f
00030000-556d-87ac-d42e-26d51ec2ccd8	Vaja-write	Vaja - spreminjanje	f
00030000-556d-87ac-6741-6b00f27a99b1	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-556d-87ac-4778-bde8378f7a44	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-556d-87ac-6940-4d253bab7a6c	Zaposlitev-read	Zaposlitev - branje	f
00030000-556d-87ac-69a9-a98f86585819	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-556d-87ac-550c-33c29857c2af	Zasedenost-read	Zasedenost - branje	f
00030000-556d-87ac-7b1c-f57747d3c94c	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-556d-87ac-c262-040cedc95285	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-556d-87ac-8886-e47940cb8188	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-556d-87ac-e3c7-062ff56c38d8	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-556d-87ac-4084-fd4352de8553	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2775 (class 0 OID 6008788)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-556d-87ac-3f52-97ff2561ff08	00030000-556d-87ab-248f-1880727b331d
00020000-556d-87ac-aab1-b1cf9b8206fc	00030000-556d-87ab-a98b-bdf9ded652e5
00020000-556d-87ac-aab1-b1cf9b8206fc	00030000-556d-87ab-248f-1880727b331d
\.


--
-- TOC entry 2803 (class 0 OID 6009083)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2807 (class 0 OID 6009114)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 6009248)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2780 (class 0 OID 6008848)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-556d-87ac-042f-adac174e6b56	00040000-556d-87ab-9343-5a111bbf478b	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-556d-87ac-539c-8aabfa25d1dd	00040000-556d-87ab-9343-5a111bbf478b	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-556d-87ac-af79-f291cd0843d1	00040000-556d-87ab-9343-5a111bbf478b	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-556d-87ac-3583-b72911b42116	00040000-556d-87ab-9343-5a111bbf478b	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2782 (class 0 OID 6008883)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-556d-87ab-e495-79e94d461923	8341	Adlešiči
00050000-556d-87ab-df45-b4fc5b587c86	5270	Ajdovščina
00050000-556d-87ab-6cb5-d1c65c6012e9	6280	Ankaran/Ancarano
00050000-556d-87ab-09eb-26fd160ca70f	9253	Apače
00050000-556d-87ab-8f9e-de8b12129965	8253	Artiče
00050000-556d-87ab-54c2-954f28f189c4	4275	Begunje na Gorenjskem
00050000-556d-87ab-ad74-7f48310154f6	1382	Begunje pri Cerknici
00050000-556d-87ab-f9a2-3d895f1b190a	9231	Beltinci
00050000-556d-87ab-b63f-07298ec4f558	2234	Benedikt
00050000-556d-87ab-0168-1e96a8ab31a9	2345	Bistrica ob Dravi
00050000-556d-87ab-6700-fc2a5e968d10	3256	Bistrica ob Sotli
00050000-556d-87ab-3c8e-98f1729fbece	8259	Bizeljsko
00050000-556d-87ab-6b17-9201791e7c69	1223	Blagovica
00050000-556d-87ab-55ab-230a0e9a98eb	8283	Blanca
00050000-556d-87ab-719e-71b404b0e0a1	4260	Bled
00050000-556d-87ab-169f-5cd34f104a46	4273	Blejska Dobrava
00050000-556d-87ab-e942-723755637e78	9265	Bodonci
00050000-556d-87ab-8c5e-cde5aa0f48aa	9222	Bogojina
00050000-556d-87ab-31ce-755600fc560a	4263	Bohinjska Bela
00050000-556d-87ab-0b45-baff325dc0e5	4264	Bohinjska Bistrica
00050000-556d-87ab-0eed-9bff4f0c9eed	4265	Bohinjsko jezero
00050000-556d-87ab-c3a1-90666b43022a	1353	Borovnica
00050000-556d-87ab-70b4-3ddecce65732	8294	Boštanj
00050000-556d-87ab-9d38-e0ed64ad1b2c	5230	Bovec
00050000-556d-87ab-eece-94668bb16e5b	5295	Branik
00050000-556d-87ab-e437-cf9ee2dd1f8c	3314	Braslovče
00050000-556d-87ab-87d7-b2a0a5e5238e	5223	Breginj
00050000-556d-87ab-49c6-5a13ba6b88a5	8280	Brestanica
00050000-556d-87ab-7a8c-9d6763158fc4	2354	Bresternica
00050000-556d-87ab-ff6d-adab4bf56ade	4243	Brezje
00050000-556d-87ab-c9d6-4f61063b2f7b	1351	Brezovica pri Ljubljani
00050000-556d-87ab-6359-d68bb7a62a5a	8250	Brežice
00050000-556d-87ab-4736-936f97e69d20	4210	Brnik - Aerodrom
00050000-556d-87ab-228c-594d4b469026	8321	Brusnice
00050000-556d-87ab-f118-8bb8923213d2	3255	Buče
00050000-556d-87ab-bd3c-be288340463a	8276	Bučka 
00050000-556d-87ab-bbe2-a907b462a2ce	9261	Cankova
00050000-556d-87ab-ba21-c19fef4c1a94	3000	Celje 
00050000-556d-87ab-efb6-00c284efd233	3001	Celje - poštni predali
00050000-556d-87ab-691b-3f959d967a39	4207	Cerklje na Gorenjskem
00050000-556d-87ab-717e-0615a2437633	8263	Cerklje ob Krki
00050000-556d-87ab-e02b-51d99948dcb5	1380	Cerknica
00050000-556d-87ab-f577-db4c94d85484	5282	Cerkno
00050000-556d-87ab-46b7-187928da4c07	2236	Cerkvenjak
00050000-556d-87ab-1c68-13780cde90e5	2215	Ceršak
00050000-556d-87ab-8546-148509ced69b	2326	Cirkovce
00050000-556d-87ab-f194-d34296b95240	2282	Cirkulane
00050000-556d-87ab-fc84-789d662fbc29	5273	Col
00050000-556d-87ab-f706-dc0ff56b20a7	8251	Čatež ob Savi
00050000-556d-87ab-40db-f9edce43a139	1413	Čemšenik
00050000-556d-87ab-338e-f974b3643bc5	5253	Čepovan
00050000-556d-87ab-0caf-6b4eb90ce73f	9232	Črenšovci
00050000-556d-87ab-b5a7-58e08ba21fff	2393	Črna na Koroškem
00050000-556d-87ab-4514-5cc7aab32e03	6275	Črni Kal
00050000-556d-87ab-e9a8-146f659d983c	5274	Črni Vrh nad Idrijo
00050000-556d-87ab-3bad-2ca9ab0d8d2e	5262	Črniče
00050000-556d-87ab-f6cc-bd7167d4d4f1	8340	Črnomelj
00050000-556d-87ab-20fa-776e4030ae17	6271	Dekani
00050000-556d-87ab-e645-71f54a37eb3d	5210	Deskle
00050000-556d-87ab-cf28-792aa432f19b	2253	Destrnik
00050000-556d-87ab-ab9b-4dd5637ae948	6215	Divača
00050000-556d-87ab-0d41-adf6beb51cb1	1233	Dob
00050000-556d-87ab-ab2e-cd7ed9eb6e49	3224	Dobje pri Planini
00050000-556d-87ab-b1ff-9544c1ad0cc9	8257	Dobova
00050000-556d-87ab-e15e-ea431a9490cd	1423	Dobovec
00050000-556d-87ab-6e5c-3a2b3c2d0f95	5263	Dobravlje
00050000-556d-87ab-4d32-9de70b13748d	3204	Dobrna
00050000-556d-87ab-c6e5-2a816496a387	8211	Dobrnič
00050000-556d-87ab-ff96-a8d6e34a822b	1356	Dobrova
00050000-556d-87ab-dcfe-47218fa7e0ee	9223	Dobrovnik/Dobronak 
00050000-556d-87ab-d36b-f901b9ddcf95	5212	Dobrovo v Brdih
00050000-556d-87ab-88a1-3550bd398d13	1431	Dol pri Hrastniku
00050000-556d-87ab-dccc-6b64fd0d4244	1262	Dol pri Ljubljani
00050000-556d-87ab-7b5f-a41f60e25800	1273	Dole pri Litiji
00050000-556d-87ab-3b73-0ec7531d83fc	1331	Dolenja vas
00050000-556d-87ab-4e2a-3845de76cb8b	8350	Dolenjske Toplice
00050000-556d-87ab-b5ab-49a079e02095	1230	Domžale
00050000-556d-87ab-e50f-7780cfc68e4d	2252	Dornava
00050000-556d-87ab-41b3-31657946f938	5294	Dornberk
00050000-556d-87ab-fff8-340b9933c976	1319	Draga
00050000-556d-87ab-1772-5a0fab60ab9b	8343	Dragatuš
00050000-556d-87ab-72b0-212363aaa543	3222	Dramlje
00050000-556d-87ab-553d-9fcda67a2dd3	2370	Dravograd
00050000-556d-87ab-b1fd-ecae8bb3b109	4203	Duplje
00050000-556d-87ab-7269-86d83fb214c2	6221	Dutovlje
00050000-556d-87ab-2524-75e3c7015cdd	8361	Dvor
00050000-556d-87ab-4a6c-5cffaa56d74b	2343	Fala
00050000-556d-87ab-6536-6e35a6933ccd	9208	Fokovci
00050000-556d-87ab-95b8-0c0d2e96b513	2313	Fram
00050000-556d-87ab-2d8f-82e460b2b3b2	3213	Frankolovo
00050000-556d-87ab-1788-39172e2f37b9	1274	Gabrovka
00050000-556d-87ab-4441-d159450425cd	8254	Globoko
00050000-556d-87ab-ede8-632bf9a668d1	5275	Godovič
00050000-556d-87ab-d21a-b0a8038fff61	4204	Golnik
00050000-556d-87ab-6a89-0962182d66eb	3303	Gomilsko
00050000-556d-87ab-cb38-712e5d6a9d06	4224	Gorenja vas
00050000-556d-87ab-d5fd-52c46288ed8c	3263	Gorica pri Slivnici
00050000-556d-87ab-480b-45849168c1ff	2272	Gorišnica
00050000-556d-87ab-297b-2263acc880b4	9250	Gornja Radgona
00050000-556d-87ab-54fe-d26bb31ed776	3342	Gornji Grad
00050000-556d-87ab-c890-8df71aac239a	4282	Gozd Martuljek
00050000-556d-87ab-01f6-0dddf85e34a8	6272	Gračišče
00050000-556d-87ab-bceb-e53bf0ce6ba4	9264	Grad
00050000-556d-87ab-5f10-a1132253c596	8332	Gradac
00050000-556d-87ab-a89e-50a0734979de	1384	Grahovo
00050000-556d-87ab-0b4e-ea6e7b7c5db1	5242	Grahovo ob Bači
00050000-556d-87ab-a580-47472c66b188	5251	Grgar
00050000-556d-87ab-5b7a-ef4182a7ceba	3302	Griže
00050000-556d-87ab-95db-e141bf7c54e0	3231	Grobelno
00050000-556d-87ab-ab58-3c96e63667e5	1290	Grosuplje
00050000-556d-87ab-04d5-48b6faeaff61	2288	Hajdina
00050000-556d-87ab-9245-46c81fb1f4c1	8362	Hinje
00050000-556d-87ab-e716-15fcd60b83f7	2311	Hoče
00050000-556d-87ab-efbf-d586590474f5	9205	Hodoš/Hodos
00050000-556d-87ab-f19a-795be3ec5c69	1354	Horjul
00050000-556d-87ab-45e5-80304a299777	1372	Hotedršica
00050000-556d-87ab-f181-3adea21f504b	1430	Hrastnik
00050000-556d-87ab-9431-9681996cc229	6225	Hruševje
00050000-556d-87ab-7442-2c3a2be86b65	4276	Hrušica
00050000-556d-87ab-a753-cc0f5d7c86ce	5280	Idrija
00050000-556d-87ab-47d2-fc679bf099c7	1292	Ig
00050000-556d-87ab-d0ae-08950253455d	6250	Ilirska Bistrica
00050000-556d-87ab-37c0-69f4554d4fb8	6251	Ilirska Bistrica-Trnovo
00050000-556d-87ab-321d-1bb4d729709a	1295	Ivančna Gorica
00050000-556d-87ab-4868-fd60e9c6bcaa	2259	Ivanjkovci
00050000-556d-87ab-171f-61468d6b3327	1411	Izlake
00050000-556d-87ab-bebd-c5691552d25c	6310	Izola/Isola
00050000-556d-87ab-1f6b-3e58d9ccdbe5	2222	Jakobski Dol
00050000-556d-87ab-d1e1-0f7de3158d50	2221	Jarenina
00050000-556d-87ab-08e1-53ae04444010	6254	Jelšane
00050000-556d-87ab-c1e0-590d7100f848	4270	Jesenice
00050000-556d-87ab-27d9-bf7fc932fd96	8261	Jesenice na Dolenjskem
00050000-556d-87ab-72df-8a16f3f8b4a2	3273	Jurklošter
00050000-556d-87ab-e8e7-dcffe5e0515e	2223	Jurovski Dol
00050000-556d-87ab-fb5b-e9e5340a22da	2256	Juršinci
00050000-556d-87ab-3d4c-4aa76ecc722f	5214	Kal nad Kanalom
00050000-556d-87ab-d057-28c773a7ceab	3233	Kalobje
00050000-556d-87ab-4fa1-42f9ad87991e	4246	Kamna Gorica
00050000-556d-87ab-0040-5ac90365a532	2351	Kamnica
00050000-556d-87ab-0890-fcd9a6566826	1241	Kamnik
00050000-556d-87ab-c4cf-11b6be26ff1d	5213	Kanal
00050000-556d-87ab-367b-7550c6b7a2ee	8258	Kapele
00050000-556d-87ab-f452-199802e797f3	2362	Kapla
00050000-556d-87ab-b096-3f253c453986	2325	Kidričevo
00050000-556d-87ab-c255-b6dc385e2e97	1412	Kisovec
00050000-556d-87ab-0718-474edcb32415	6253	Knežak
00050000-556d-87ab-fb67-21a7b5e997e2	5222	Kobarid
00050000-556d-87ab-b9ec-bb0df08b0953	9227	Kobilje
00050000-556d-87ab-7831-362b51d98671	1330	Kočevje
00050000-556d-87ab-70ad-828ead575be7	1338	Kočevska Reka
00050000-556d-87ab-59b4-66865590c056	2276	Kog
00050000-556d-87ab-8717-8ee41e933b9e	5211	Kojsko
00050000-556d-87ab-ee04-7cf7ccc496b8	6223	Komen
00050000-556d-87ab-6c0c-7fbe4da44dd3	1218	Komenda
00050000-556d-87ab-4d75-b428569e843e	6000	Koper/Capodistria 
00050000-556d-87ab-4146-a58721a81cc1	6001	Koper/Capodistria - poštni predali
00050000-556d-87ab-5d0b-89d1c31ed0f9	8282	Koprivnica
00050000-556d-87ab-689f-e1c9d82675c3	5296	Kostanjevica na Krasu
00050000-556d-87ab-d25b-549418c22c02	8311	Kostanjevica na Krki
00050000-556d-87ab-d961-3e835844d54a	1336	Kostel
00050000-556d-87ab-757e-f409af4e2d60	6256	Košana
00050000-556d-87ab-802a-883d1df4bde5	2394	Kotlje
00050000-556d-87ab-9fd0-f1473d65411e	6240	Kozina
00050000-556d-87ab-c848-83b5fc12bad7	3260	Kozje
00050000-556d-87ab-8400-ea7cea84f06e	4000	Kranj 
00050000-556d-87ab-9bce-abfe3b51161f	4001	Kranj - poštni predali
00050000-556d-87ab-4276-8ae05189c2c1	4280	Kranjska Gora
00050000-556d-87ab-06d2-d4fa98219a91	1281	Kresnice
00050000-556d-87ab-6da8-1e14537456b3	4294	Križe
00050000-556d-87ab-8410-aba9ddd83199	9206	Križevci
00050000-556d-87ab-35f1-f3f9cf55f15e	9242	Križevci pri Ljutomeru
00050000-556d-87ab-ce8a-b4ee08957dfd	1301	Krka
00050000-556d-87ab-a686-aadcd5e0ff90	8296	Krmelj
00050000-556d-87ab-02f1-b9aa745064ba	4245	Kropa
00050000-556d-87ab-eb22-64cefe138ce9	8262	Krška vas
00050000-556d-87ab-5f7d-ff344607e5f8	8270	Krško
00050000-556d-87ab-be5c-efe743234539	9263	Kuzma
00050000-556d-87ab-1cd3-fc39b8f2ef09	2318	Laporje
00050000-556d-87ab-eba6-decfa6fe1129	3270	Laško
00050000-556d-87ab-3510-538f5e991e6d	1219	Laze v Tuhinju
00050000-556d-87ab-7c0a-2b7d0289f976	2230	Lenart v Slovenskih goricah
00050000-556d-87ab-8f27-2c918fde56ed	9220	Lendava/Lendva
00050000-556d-87ab-a9f4-571755de6cbb	4248	Lesce
00050000-556d-87ab-94ce-94ab896a6a01	3261	Lesično
00050000-556d-87ab-6dce-1e8cb7cc5afc	8273	Leskovec pri Krškem
00050000-556d-87ab-b4b5-c390f0a0332c	2372	Libeliče
00050000-556d-87ab-99d6-a4a81763d8a1	2341	Limbuš
00050000-556d-87ab-84e4-4a7dba02d21c	1270	Litija
00050000-556d-87ab-6e2d-9b9a2743709a	3202	Ljubečna
00050000-556d-87ab-5e9c-56e2522a1ebf	1000	Ljubljana 
00050000-556d-87ab-56a6-337c6a9f2e7a	1001	Ljubljana - poštni predali
00050000-556d-87ab-fd5e-fbcbd824b8f6	1231	Ljubljana - Črnuče
00050000-556d-87ab-1b3c-96f584d3ae6d	1261	Ljubljana - Dobrunje
00050000-556d-87ab-d0e5-2a25a79563d8	1260	Ljubljana - Polje
00050000-556d-87ab-2dbf-6afa5be7d2cc	1210	Ljubljana - Šentvid
00050000-556d-87ab-4b95-c7267ec39858	1211	Ljubljana - Šmartno
00050000-556d-87ab-9b79-6c8c94bd15ce	3333	Ljubno ob Savinji
00050000-556d-87ab-f001-ead20efb7d12	9240	Ljutomer
00050000-556d-87ab-f739-015b00c199cd	3215	Loče
00050000-556d-87ab-1892-d6b6b0691ca5	5231	Log pod Mangartom
00050000-556d-87ab-7508-305549e76436	1358	Log pri Brezovici
00050000-556d-87ab-f0c4-140ee9ca23ed	1370	Logatec
00050000-556d-87ab-c936-dd92375415d6	1371	Logatec
00050000-556d-87ab-f911-742f5f91a69d	1434	Loka pri Zidanem Mostu
00050000-556d-87ab-f939-9ea42a0a4f4c	3223	Loka pri Žusmu
00050000-556d-87ab-2e90-cb088cf82864	6219	Lokev
00050000-556d-87ab-6077-160fdd7139be	1318	Loški Potok
00050000-556d-87ab-56d3-77538d39f5df	2324	Lovrenc na Dravskem polju
00050000-556d-87ab-b23b-54ecbcd11489	2344	Lovrenc na Pohorju
00050000-556d-87ab-3381-e0c4b898e51e	3334	Luče
00050000-556d-87ab-45dc-147d398e24f8	1225	Lukovica
00050000-556d-87ab-af77-6d9b3c4ab1e1	9202	Mačkovci
00050000-556d-87ab-bdda-4ef1ab8f21e3	2322	Majšperk
00050000-556d-87ab-ee08-4f8d609c0068	2321	Makole
00050000-556d-87ab-59e3-64fcd46a1332	9243	Mala Nedelja
00050000-556d-87ab-af37-fef654a0e69d	2229	Malečnik
00050000-556d-87ab-3ace-ebbfb6453127	6273	Marezige
00050000-556d-87ab-0ce5-ba2e234ffc73	2000	Maribor 
00050000-556d-87ab-7953-dbeb566eb54b	2001	Maribor - poštni predali
00050000-556d-87ab-c775-393883f84934	2206	Marjeta na Dravskem polju
00050000-556d-87ab-1b6c-79b3459e4a74	2281	Markovci
00050000-556d-87ab-66e0-aa3c7edb8c1a	9221	Martjanci
00050000-556d-87ab-b0b5-42fa6c0935d5	6242	Materija
00050000-556d-87ab-271a-d54b5c51e400	4211	Mavčiče
00050000-556d-87ab-e6d8-a892c4f404e0	1215	Medvode
00050000-556d-87ab-9b98-2f4fdc16741b	1234	Mengeš
00050000-556d-87ab-67d8-977c195d474e	8330	Metlika
00050000-556d-87ab-88fb-8fd391ff468b	2392	Mežica
00050000-556d-87ab-5f48-02848f5681a8	2204	Miklavž na Dravskem polju
00050000-556d-87ab-acb7-0e97a5313720	2275	Miklavž pri Ormožu
00050000-556d-87ab-3f2c-c1e4318a2767	5291	Miren
00050000-556d-87ab-59a6-becf73afcbd9	8233	Mirna
00050000-556d-87ab-c3d5-cb36263f628a	8216	Mirna Peč
00050000-556d-87ab-0d6e-41d958ed3d83	2382	Mislinja
00050000-556d-87ab-ed9b-75b1dc82c6a0	4281	Mojstrana
00050000-556d-87ab-2648-e9ca36f168b1	8230	Mokronog
00050000-556d-87ab-f2ef-3152bd1ee06a	1251	Moravče
00050000-556d-87ab-cf95-98700aa4319e	9226	Moravske Toplice
00050000-556d-87ab-6ec6-58a21ee8b818	5216	Most na Soči
00050000-556d-87ab-7821-500ac0257b22	1221	Motnik
00050000-556d-87ab-c5ca-b7661ffbec8e	3330	Mozirje
00050000-556d-87ab-08c6-7cbad6336ced	9000	Murska Sobota 
00050000-556d-87ab-7ec9-3b847bcf6c63	9001	Murska Sobota - poštni predali
00050000-556d-87ab-431f-bc94e7ececc8	2366	Muta
00050000-556d-87ab-d94a-496b04daee73	4202	Naklo
00050000-556d-87ab-6e57-1f95a529f8d0	3331	Nazarje
00050000-556d-87ab-0497-0e2244927abd	1357	Notranje Gorice
00050000-556d-87ab-a800-a6e099c45b64	3203	Nova Cerkev
00050000-556d-87ab-fb5f-2d27a6f3818e	5000	Nova Gorica 
00050000-556d-87ab-3f24-756ba303478e	5001	Nova Gorica - poštni predali
00050000-556d-87ab-4541-eeaa2cfb7bff	1385	Nova vas
00050000-556d-87ab-1bd2-22e23c7e9ca6	8000	Novo mesto
00050000-556d-87ab-a1cd-536b22dea13e	8001	Novo mesto - poštni predali
00050000-556d-87ab-94e4-7ec8dafe892b	6243	Obrov
00050000-556d-87ab-23b4-a3cb8938fdeb	9233	Odranci
00050000-556d-87ab-6300-9d85d3ebab9c	2317	Oplotnica
00050000-556d-87ab-370a-4b4a4360d877	2312	Orehova vas
00050000-556d-87ab-941c-5033963b2a8c	2270	Ormož
00050000-556d-87ab-e70e-9cefac7670e6	1316	Ortnek
00050000-556d-87ab-3839-18fde994e1cf	1337	Osilnica
00050000-556d-87ab-f0e3-f8a5429961ae	8222	Otočec
00050000-556d-87ab-8eeb-405cd6ffb643	2361	Ožbalt
00050000-556d-87ab-406d-d651dc929016	2231	Pernica
00050000-556d-87ab-0d64-645a15b3dc20	2211	Pesnica pri Mariboru
00050000-556d-87ab-ed6c-fc1cca679b8d	9203	Petrovci
00050000-556d-87ab-572c-c4d4dd44a1c5	3301	Petrovče
00050000-556d-87ab-63f8-45e4011394d5	6330	Piran/Pirano
00050000-556d-87ab-a4a0-195c199faa68	8255	Pišece
00050000-556d-87ab-51a3-639a051a86aa	6257	Pivka
00050000-556d-87ab-dd60-c1387906c491	6232	Planina
00050000-556d-87ab-5893-442370bddd60	3225	Planina pri Sevnici
00050000-556d-87ab-6df6-3f3049356038	6276	Pobegi
00050000-556d-87ab-3caf-ce5c662cefaf	8312	Podbočje
00050000-556d-87ab-871d-80989af6ef18	5243	Podbrdo
00050000-556d-87ab-a000-55a33b1cc3ef	3254	Podčetrtek
00050000-556d-87ab-e829-7a419206e087	2273	Podgorci
00050000-556d-87ab-8791-a1d2fcd6c6c4	6216	Podgorje
00050000-556d-87ab-4fce-8a153559e0ef	2381	Podgorje pri Slovenj Gradcu
00050000-556d-87ab-a8c9-3f3d779bc511	6244	Podgrad
00050000-556d-87ab-cb83-43f744bac4e6	1414	Podkum
00050000-556d-87ab-b6bc-5778b0282f0e	2286	Podlehnik
00050000-556d-87ab-47c0-2f93bcad8093	5272	Podnanos
00050000-556d-87ab-7963-8dfba7b46e82	4244	Podnart
00050000-556d-87ab-e1a8-0b49e75c3035	3241	Podplat
00050000-556d-87ab-eabc-526e05b62974	3257	Podsreda
00050000-556d-87ab-67aa-dcf6948753c6	2363	Podvelka
00050000-556d-87ab-4abd-106628f6a178	2208	Pohorje
00050000-556d-87ab-68bc-27afdf89110f	2257	Polenšak
00050000-556d-87ab-e536-22103770095c	1355	Polhov Gradec
00050000-556d-87ab-b3fe-ac1c6b720942	4223	Poljane nad Škofjo Loko
00050000-556d-87ab-af27-698d2518395f	2319	Poljčane
00050000-556d-87ab-cc2e-a2f87f9949e8	1272	Polšnik
00050000-556d-87ab-dbd4-65c7f8e0348a	3313	Polzela
00050000-556d-87ab-63c7-27da0cfd5ef9	3232	Ponikva
00050000-556d-87ab-e07c-2a008d44b4ba	6320	Portorož/Portorose
00050000-556d-87ab-e018-d83f57f6f64f	6230	Postojna
00050000-556d-87ab-eb24-012fac4261fa	2331	Pragersko
00050000-556d-87ab-601e-f507bdaa79b6	3312	Prebold
00050000-556d-87ab-17c9-676c16a61aa7	4205	Preddvor
00050000-556d-87ab-ef30-3f037f06d107	6255	Prem
00050000-556d-87ab-0551-02352197ee01	1352	Preserje
00050000-556d-87ab-fae5-b70dc96991f0	6258	Prestranek
00050000-556d-87ab-ad6a-14b1fa4380d3	2391	Prevalje
00050000-556d-87ab-b376-79d60c5edfee	3262	Prevorje
00050000-556d-87ab-41ee-a9f4727fc3b2	1276	Primskovo 
00050000-556d-87ab-8964-68364776a1b2	3253	Pristava pri Mestinju
00050000-556d-87ab-3b18-3f6b3a440e7f	9207	Prosenjakovci/Partosfalva
00050000-556d-87ab-049f-b19dab154372	5297	Prvačina
00050000-556d-87ab-bc2e-cec26452c644	2250	Ptuj
00050000-556d-87ab-085a-2e29e521dc76	2323	Ptujska Gora
00050000-556d-87ab-79a7-cd1fe4f461f8	9201	Puconci
00050000-556d-87ab-99cf-484105cf7c36	2327	Rače
00050000-556d-87ab-e4cb-f3bd8107eeb6	1433	Radeče
00050000-556d-87ab-8269-b89fd7d5b113	9252	Radenci
00050000-556d-87ab-70f3-959303cdbc2a	2360	Radlje ob Dravi
00050000-556d-87ab-f218-9b2819dbcc73	1235	Radomlje
00050000-556d-87ab-c5da-43948381f8d8	4240	Radovljica
00050000-556d-87ab-78a1-a05cae0eef71	8274	Raka
00050000-556d-87ab-66ad-ebedebee9a97	1381	Rakek
00050000-556d-87ab-f642-19abcfb5b401	4283	Rateče - Planica
00050000-556d-87ab-4abb-04f6ea668b82	2390	Ravne na Koroškem
00050000-556d-87ab-b2b5-2c74da38f86b	9246	Razkrižje
00050000-556d-87ab-62e5-c66ba63b6341	3332	Rečica ob Savinji
00050000-556d-87ab-651d-d914b8901270	5292	Renče
00050000-556d-87ab-abbd-3f1cf4623d42	1310	Ribnica
00050000-556d-87ab-5450-fb3a4f0067df	2364	Ribnica na Pohorju
00050000-556d-87ab-89ca-97f67f84f4df	3272	Rimske Toplice
00050000-556d-87ab-977a-29d6bd30cf53	1314	Rob
00050000-556d-87ab-3c51-4c51036e5875	5215	Ročinj
00050000-556d-87ab-525e-ad60bf579232	3250	Rogaška Slatina
00050000-556d-87ab-37c6-1f3a6cef9cd2	9262	Rogašovci
00050000-556d-87ab-7963-10666d1c7e4c	3252	Rogatec
00050000-556d-87ab-626c-4680b945da97	1373	Rovte
00050000-556d-87ab-4d5b-7dd1940efdae	2342	Ruše
00050000-556d-87ab-8903-fffe42c02e01	1282	Sava
00050000-556d-87ab-e8e9-b78b668b86db	6333	Sečovlje/Sicciole
00050000-556d-87ab-6175-dfbe552cc8f2	4227	Selca
00050000-556d-87ab-0631-25464f04f432	2352	Selnica ob Dravi
00050000-556d-87ab-38b1-29ea16c58498	8333	Semič
00050000-556d-87ab-23fa-1597e4ecdf83	8281	Senovo
00050000-556d-87ab-b905-bad38f6e5133	6224	Senožeče
00050000-556d-87ab-28ea-85bcc8699f57	8290	Sevnica
00050000-556d-87ab-5445-4590ada5926d	6210	Sežana
00050000-556d-87ab-a32a-e8213dafc603	2214	Sladki Vrh
00050000-556d-87ab-4261-197781c5e39c	5283	Slap ob Idrijci
00050000-556d-87ab-bf78-e7e7f0865600	2380	Slovenj Gradec
00050000-556d-87ab-e53c-94095b7b118c	2310	Slovenska Bistrica
00050000-556d-87ab-3ae4-861e4fe2f389	3210	Slovenske Konjice
00050000-556d-87ab-e5e5-22bf94d7621e	1216	Smlednik
00050000-556d-87ab-a487-c1a593d02454	5232	Soča
00050000-556d-87ab-10ce-ce398d41323c	1317	Sodražica
00050000-556d-87ab-d989-7855d3202f2f	3335	Solčava
00050000-556d-87ab-28d0-e3f7fb7ea480	5250	Solkan
00050000-556d-87ab-28f2-673cbcccd044	4229	Sorica
00050000-556d-87ab-92c0-f862301fdd97	4225	Sovodenj
00050000-556d-87ab-0742-dd432033798a	5281	Spodnja Idrija
00050000-556d-87ab-3fe4-2294baabad94	2241	Spodnji Duplek
00050000-556d-87ab-c0a8-0f2920e15d0c	9245	Spodnji Ivanjci
00050000-556d-87ab-2493-cc16c3b16738	2277	Središče ob Dravi
00050000-556d-87ab-c82b-863e45273537	4267	Srednja vas v Bohinju
00050000-556d-87ab-7122-78c0545dcfc7	8256	Sromlje 
00050000-556d-87ab-3c06-2c5ee8ecdbb2	5224	Srpenica
00050000-556d-87ab-b608-84d2ad8f7376	1242	Stahovica
00050000-556d-87ab-e4b5-fe077c28f94b	1332	Stara Cerkev
00050000-556d-87ab-1748-5064f1c64e55	8342	Stari trg ob Kolpi
00050000-556d-87ab-1acd-2129b41edd79	1386	Stari trg pri Ložu
00050000-556d-87ab-b875-8fc1bccf8585	2205	Starše
00050000-556d-87ab-907d-88cad64223fc	2289	Stoperce
00050000-556d-87ab-7416-617de41c691c	8322	Stopiče
00050000-556d-87ab-8389-f15537f0e308	3206	Stranice
00050000-556d-87ab-afd5-4b4c4aa3b5a6	8351	Straža
00050000-556d-87ab-0e99-795513f59cc0	1313	Struge
00050000-556d-87ab-1771-c6fc2f1650be	8293	Studenec
00050000-556d-87ab-0416-2503e94965fa	8331	Suhor
00050000-556d-87ab-f2b4-6d48914cada1	2233	Sv. Ana v Slovenskih goricah
00050000-556d-87ab-9459-23491a84fe97	2235	Sv. Trojica v Slovenskih goricah
00050000-556d-87ab-2873-89e96ed230e0	2353	Sveti Duh na Ostrem Vrhu
00050000-556d-87ab-f91b-1aae8717358a	9244	Sveti Jurij ob Ščavnici
00050000-556d-87ab-d8e1-889674e60efd	3264	Sveti Štefan
00050000-556d-87ab-a6ca-f710c4836be8	2258	Sveti Tomaž
00050000-556d-87ab-a48f-b4b3ae95c58a	9204	Šalovci
00050000-556d-87ab-08b7-e222628d118b	5261	Šempas
00050000-556d-87ab-7540-02ede01cc8d3	5290	Šempeter pri Gorici
00050000-556d-87ab-6e73-8d864ed94b69	3311	Šempeter v Savinjski dolini
00050000-556d-87ab-b6ac-0f29671b6dc5	4208	Šenčur
00050000-556d-87ab-8ae4-fa43142e20c5	2212	Šentilj v Slovenskih goricah
00050000-556d-87ab-1e5b-1ec1147fce15	8297	Šentjanž
00050000-556d-87ab-3ad9-d54a63dc5f97	2373	Šentjanž pri Dravogradu
00050000-556d-87ab-3b07-ae266b75576c	8310	Šentjernej
00050000-556d-87ab-81c6-2b3cbbc7e32c	3230	Šentjur
00050000-556d-87ab-16f3-a7db14222bcf	3271	Šentrupert
00050000-556d-87ab-4631-6421b75a9607	8232	Šentrupert
00050000-556d-87ab-932a-fab49b1d5fba	1296	Šentvid pri Stični
00050000-556d-87ab-ddb8-d73d0c8c34fc	8275	Škocjan
00050000-556d-87ab-7fad-9304490d18ab	6281	Škofije
00050000-556d-87ab-9feb-5c5be1ccf582	4220	Škofja Loka
00050000-556d-87ab-17ed-479126f156a9	3211	Škofja vas
00050000-556d-87ab-431d-eb4d0d99beb4	1291	Škofljica
00050000-556d-87ab-f029-adfe3fabc493	6274	Šmarje
00050000-556d-87ab-e868-5aa09765c588	1293	Šmarje - Sap
00050000-556d-87ab-83b0-5f910f62b4e5	3240	Šmarje pri Jelšah
00050000-556d-87ab-4abe-d732ac6e7dbd	8220	Šmarješke Toplice
00050000-556d-87ab-77cd-cccbf8874c59	2315	Šmartno na Pohorju
00050000-556d-87ab-efd9-683b1dda91cd	3341	Šmartno ob Dreti
00050000-556d-87ab-9729-5829051ec724	3327	Šmartno ob Paki
00050000-556d-87ab-0264-c52848aa3cbf	1275	Šmartno pri Litiji
00050000-556d-87ab-169d-167070221488	2383	Šmartno pri Slovenj Gradcu
00050000-556d-87ab-ff76-d508accfec6d	3201	Šmartno v Rožni dolini
00050000-556d-87ab-60ed-63467c6cc7c3	3325	Šoštanj
00050000-556d-87ab-c7d1-95a84669ea81	6222	Štanjel
00050000-556d-87ab-eedd-7776880588f9	3220	Štore
00050000-556d-87ab-6f72-ef5b0afedf92	3304	Tabor
00050000-556d-87ab-c763-cc1406a6a9a7	3221	Teharje
00050000-556d-87ab-f128-e6dc33480643	9251	Tišina
00050000-556d-87ab-7567-b280f737d519	5220	Tolmin
00050000-556d-87ab-9934-8a0291cea9a8	3326	Topolšica
00050000-556d-87ab-d83b-4cbb877139a1	2371	Trbonje
00050000-556d-87ab-a21f-205abc487974	1420	Trbovlje
00050000-556d-87ab-ebb0-5f7612fad9a4	8231	Trebelno 
00050000-556d-87ab-6313-f65395855067	8210	Trebnje
00050000-556d-87ab-6564-8958ccf31028	5252	Trnovo pri Gorici
00050000-556d-87ab-83dc-5fd02a2ec358	2254	Trnovska vas
00050000-556d-87ab-e870-ec6288b2fb4b	1222	Trojane
00050000-556d-87ab-6641-faa2510631c3	1236	Trzin
00050000-556d-87ab-bc68-bf40610b5352	4290	Tržič
00050000-556d-87ab-d8d6-3e49c7f0f971	8295	Tržišče
00050000-556d-87ab-9f2d-4f5a6d5c9a92	1311	Turjak
00050000-556d-87ab-58ef-77bee3467e7e	9224	Turnišče
00050000-556d-87ab-dde2-93f9c3749a8e	8323	Uršna sela
00050000-556d-87ab-0ffd-918869177209	1252	Vače
00050000-556d-87ab-1f41-abc7bafd7671	3320	Velenje 
00050000-556d-87ab-2512-febcdb531a1e	3322	Velenje - poštni predali
00050000-556d-87ab-5334-44ef2bd30a4e	8212	Velika Loka
00050000-556d-87ab-91c3-a122bc844b77	2274	Velika Nedelja
00050000-556d-87ab-6331-f73e30249cd1	9225	Velika Polana
00050000-556d-87ab-45cb-8e1b14670eed	1315	Velike Lašče
00050000-556d-87ab-48b8-c57ecce547d8	8213	Veliki Gaber
00050000-556d-87ab-6789-35ea29628645	9241	Veržej
00050000-556d-87ab-f6e8-5daad0b1d61a	1312	Videm - Dobrepolje
00050000-556d-87ab-d7d8-6f8cd41edae9	2284	Videm pri Ptuju
00050000-556d-87ab-750e-2c4b1ecfe32d	8344	Vinica
00050000-556d-87ab-c223-402a58ffab98	5271	Vipava
00050000-556d-87ab-54f1-9e4f0502e9b6	4212	Visoko
00050000-556d-87ab-2cfa-d8525e28a97f	1294	Višnja Gora
00050000-556d-87ab-a2e3-f98c27092878	3205	Vitanje
00050000-556d-87ab-3491-4333be25655a	2255	Vitomarci
00050000-556d-87ab-4760-a7f9e2197c1e	1217	Vodice
00050000-556d-87ab-c828-7ad057bc26de	3212	Vojnik\t
00050000-556d-87ab-ed25-aee8b84a6f7e	5293	Volčja Draga
00050000-556d-87ab-6e45-a27630f879bb	2232	Voličina
00050000-556d-87ab-0af2-631d8198d352	3305	Vransko
00050000-556d-87ab-234e-672953831c2a	6217	Vremski Britof
00050000-556d-87ab-d759-8ad65df8666b	1360	Vrhnika
00050000-556d-87ab-b2e9-5f3e981c9fd9	2365	Vuhred
00050000-556d-87ab-d888-1411a76fa54c	2367	Vuzenica
00050000-556d-87ab-f64e-567b10c5a647	8292	Zabukovje 
00050000-556d-87ab-0c58-7a2efb903178	1410	Zagorje ob Savi
00050000-556d-87ab-c77d-c512e7dd2cc0	1303	Zagradec
00050000-556d-87ab-cd22-063051192d2a	2283	Zavrč
00050000-556d-87ab-f29d-5e9f42893b8f	8272	Zdole 
00050000-556d-87ab-9832-9aded6a993d6	4201	Zgornja Besnica
00050000-556d-87ab-efdf-19ff6eb081ec	2242	Zgornja Korena
00050000-556d-87ab-e798-6e845460716b	2201	Zgornja Kungota
00050000-556d-87ab-a3d7-832fa5771219	2316	Zgornja Ložnica
00050000-556d-87ab-d5f3-33bdef55c8c5	2314	Zgornja Polskava
00050000-556d-87ab-cf3d-6799eb9902ae	2213	Zgornja Velka
00050000-556d-87ab-3dbe-77ebad94eb58	4247	Zgornje Gorje
00050000-556d-87ab-c164-d8f9fb164d02	4206	Zgornje Jezersko
00050000-556d-87ab-3c41-324ca9680467	2285	Zgornji Leskovec
00050000-556d-87ab-7de3-026d671a2f28	1432	Zidani Most
00050000-556d-87ab-f804-a0f1d9f9d347	3214	Zreče
00050000-556d-87ab-7165-421c9e5da941	4209	Žabnica
00050000-556d-87ab-0743-1346377d661a	3310	Žalec
00050000-556d-87ab-67a8-606dd06404e3	4228	Železniki
00050000-556d-87ab-a70b-c96bdfa9406d	2287	Žetale
00050000-556d-87ab-8781-4fe80c78c588	4226	Žiri
00050000-556d-87ab-b647-256e64f8e721	4274	Žirovnica
00050000-556d-87ab-1225-72b54c1798b0	8360	Žužemberk
\.


--
-- TOC entry 2799 (class 0 OID 6009057)
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
-- TOC entry 2781 (class 0 OID 6008868)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2787 (class 0 OID 6008946)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2801 (class 0 OID 6009069)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2814 (class 0 OID 6009189)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2818 (class 0 OID 6009240)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-556d-87ac-c12c-32aa8428aa28	00080000-556d-87ac-af79-f291cd0843d1	0987	A
00190000-556d-87ac-748c-666fd959d234	00080000-556d-87ac-539c-8aabfa25d1dd	0989	A
\.


--
-- TOC entry 2825 (class 0 OID 6009352)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 6009380)
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
-- TOC entry 2826 (class 0 OID 6009361)
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
-- TOC entry 2805 (class 0 OID 6009098)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-556d-87ac-0e83-5d9d6b385a30	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-556d-87ac-5c55-7ff8faa42d6d	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-556d-87ac-753e-8cce25eadcc1	0003	Kazinska	t	84	Kazinska dvorana
00220000-556d-87ac-bb1d-1c89f61d2571	0004	Mali oder	t	24	Mali oder 
00220000-556d-87ac-d743-ee2df072c98a	0005	Komorni oder	t	15	Komorni oder
00220000-556d-87ac-2703-22fd4fa63826	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-556d-87ac-120c-6a1ae9b31d74	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2797 (class 0 OID 6009042)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2796 (class 0 OID 6009032)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2817 (class 0 OID 6009229)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2812 (class 0 OID 6009166)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2770 (class 0 OID 6008740)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-556d-87ac-6539-c3c18d685524	00010000-556d-87ac-dc99-96e237c017fc	2015-06-02 12:38:37	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROGWQKko0Woi5AUwmoQrPpUEAKnXICXy6";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2845 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2806 (class 0 OID 6009108)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2774 (class 0 OID 6008778)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-556d-87ac-4dc3-8b9362a41788	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-556d-87ac-e02e-8b82e2ca54c2	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-556d-87ac-3f52-97ff2561ff08	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-556d-87ac-7f0c-4c6365c773b9	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-556d-87ac-52ad-0abfbe7b6de8	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-556d-87ac-aab1-b1cf9b8206fc	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2772 (class 0 OID 6008762)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-556d-87ac-6539-c3c18d685524	00020000-556d-87ac-7f0c-4c6365c773b9
00010000-556d-87ac-dc99-96e237c017fc	00020000-556d-87ac-7f0c-4c6365c773b9
\.


--
-- TOC entry 2808 (class 0 OID 6009122)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2800 (class 0 OID 6009063)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2794 (class 0 OID 6009013)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 6009398)
-- Dependencies: 235
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-556d-87ab-e46b-8e3519d6343f	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-556d-87ab-1347-97555f8ea4ff	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-556d-87ab-ade8-f808e8fa0b20	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-556d-87ab-c8d1-15fd5b84c59b	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-556d-87ab-c279-37a7e6ba6b6c	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2830 (class 0 OID 6009391)
-- Dependencies: 234
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-556d-87ab-196b-8a1214d1bc88	00000000-556d-87ab-c8d1-15fd5b84c59b	popa
00000000-556d-87ab-e1df-54816b9a67fc	00000000-556d-87ab-c8d1-15fd5b84c59b	oseba
00000000-556d-87ab-7b05-94db733a27cd	00000000-556d-87ab-1347-97555f8ea4ff	prostor
00000000-556d-87ab-a56d-5d5a88eef933	00000000-556d-87ab-c8d1-15fd5b84c59b	besedilo
00000000-556d-87ab-c86c-44b5b059c07e	00000000-556d-87ab-c8d1-15fd5b84c59b	uprizoritev
00000000-556d-87ab-58b9-3e7d403b474f	00000000-556d-87ab-c8d1-15fd5b84c59b	funkcija
00000000-556d-87ab-45a6-0ee69ca74599	00000000-556d-87ab-c8d1-15fd5b84c59b	tipfunkcije
00000000-556d-87ab-2f4c-371c4a510771	00000000-556d-87ab-c8d1-15fd5b84c59b	alternacija
00000000-556d-87ab-9a8e-93373005819a	00000000-556d-87ab-e46b-8e3519d6343f	pogodba
00000000-556d-87ab-55df-b5a94bcc8a47	00000000-556d-87ab-c8d1-15fd5b84c59b	zaposlitev
\.


--
-- TOC entry 2829 (class 0 OID 6009386)
-- Dependencies: 233
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2813 (class 0 OID 6009176)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2779 (class 0 OID 6008840)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2795 (class 0 OID 6009019)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-556d-87ac-1c2b-0bca820058ba	00180000-556d-87ac-e878-d06ebd904c1a	000c0000-556d-87ac-3857-ecff89d53c5a	00090000-556d-87ac-7b81-d21047eb7e64	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556d-87ac-565a-cb1045c17744	00180000-556d-87ac-e878-d06ebd904c1a	000c0000-556d-87ac-5b27-00c2af0f176d	00090000-556d-87ac-7181-e90cb417ae5e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556d-87ac-cbc1-21c0ad0745a8	00180000-556d-87ac-e878-d06ebd904c1a	000c0000-556d-87ac-4d37-006c7017227c	00090000-556d-87ac-6073-8c000c59b463	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556d-87ac-0f1e-6362de64e0d0	00180000-556d-87ac-e878-d06ebd904c1a	000c0000-556d-87ac-75c4-3c650e065235	00090000-556d-87ac-e631-d2de2d36faa0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556d-87ac-4167-7bc3ee3ee560	00180000-556d-87ac-e878-d06ebd904c1a	000c0000-556d-87ac-12a8-8cdc30fa78fa	00090000-556d-87ac-7392-6529bb3ac213	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556d-87ac-1584-77b2f0c16ffe	00180000-556d-87ac-d2c2-fcbf46623dd1	\N	00090000-556d-87ac-7392-6529bb3ac213	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2816 (class 0 OID 6009218)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-556d-87ab-4137-a6ecc8c0c4de	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-556d-87ab-d338-2f9764c897d6	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-556d-87ab-e464-8e85540fd044	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-556d-87ab-e5e5-95f07a43e574	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-556d-87ab-9b15-cc23c66f48dc	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-556d-87ab-1fb8-2a0c33f4a5e8	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-556d-87ab-7bbd-95adb41f72f9	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-556d-87ab-f655-5d57b3a5f14d	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-556d-87ab-81be-1b0f0fcfaee1	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-556d-87ab-257c-f621e33c2c0b	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-556d-87ab-9e10-919dae595e5a	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-556d-87ab-99ae-c7a949ae5f78	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-556d-87ab-7a2a-c73c9d4b1c86	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-556d-87ab-ce4b-1a66084e9390	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-556d-87ab-58b3-10a9f6395412	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-556d-87ab-2b7e-6968033e1a03	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2827 (class 0 OID 6009369)
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
-- TOC entry 2784 (class 0 OID 6008903)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2771 (class 0 OID 6008749)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-556d-87ac-dc99-96e237c017fc	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROF5XV7mYmfLRbE2egU5J..rMxs.GLlB2	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-556d-87ac-4ce5-80456b2ae3dc	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-556d-87ac-46bb-72b11ec886f8	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-556d-87ac-6871-1b8b89633afa	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-556d-87ac-1b1a-1869bcf1c300	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-556d-87ac-d799-b672064af455	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-556d-87ac-6539-c3c18d685524	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2821 (class 0 OID 6009274)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-556d-87ac-3349-343ec1e4f861	00160000-556d-87ac-c675-d2dc63d2fa5b	00150000-556d-87ab-9d50-ec5daadee3c8	00140000-556d-87ab-59ba-0c3ad46c0462	0001	produkcija	Sen kresne noči		Sanje	2016-02-01	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-556d-87ac-d743-ee2df072c98a
000e0000-556d-87ac-adcc-e6d545b744a0	00160000-556d-87ac-17a1-3fc3e15e43a7	00150000-556d-87ab-da17-6be6d2d88b2a	00140000-556d-87ab-dedc-3b48e59eb142	0002	predprodukcija-ideja	Smoletov vrt			2017-01-01	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-556d-87ac-2703-22fd4fa63826
\.


--
-- TOC entry 2789 (class 0 OID 6008965)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-556d-87ac-ee99-0bd8643b6631	000e0000-556d-87ac-adcc-e6d545b744a0	1	
00200000-556d-87ac-8186-6f9d2dcce2eb	000e0000-556d-87ac-adcc-e6d545b744a0	2	
\.


--
-- TOC entry 2804 (class 0 OID 6009090)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2811 (class 0 OID 6009159)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2791 (class 0 OID 6008997)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2820 (class 0 OID 6009264)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-556d-87ab-59ba-0c3ad46c0462	Drama	drama (SURS 01)
00140000-556d-87ab-f32f-af072e1219cb	Opera	opera (SURS 02)
00140000-556d-87ab-3f49-ec712a4d4d2a	Balet	balet (SURS 03)
00140000-556d-87ab-4566-beaa8c058811	Plesne prireditve	plesne prireditve (SURS 04)
00140000-556d-87ab-d946-050811eea88a	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-556d-87ab-dedc-3b48e59eb142	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-556d-87ab-00ee-851a1a68913e	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2810 (class 0 OID 6009149)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-556d-87ab-01e4-41edbda211c0	Opera	opera
00150000-556d-87ab-efe6-668b509e9c22	Opereta	opereta
00150000-556d-87ab-b65c-e0aa6195812f	Balet	balet
00150000-556d-87ab-30a0-ecb5aebef284	Plesne prireditve	plesne prireditve
00150000-556d-87ab-796d-490c30af1b32	Lutkovno gledališče	lutkovno gledališče
00150000-556d-87ab-692a-01d0b39c82ae	Raziskovalno gledališče	raziskovalno gledališče
00150000-556d-87ab-7a6d-55db642926b1	Biografska drama	biografska drama
00150000-556d-87ab-9d50-ec5daadee3c8	Komedija	komedija
00150000-556d-87ab-c39c-9fe254f13c48	Črna komedija	črna komedija
00150000-556d-87ab-5c68-19d9d1668363	E-igra	E-igra
00150000-556d-87ab-da17-6be6d2d88b2a	Kriminalka	kriminalka
00150000-556d-87ab-5567-52d98a0c32dc	Musical	musical
\.


--
-- TOC entry 2364 (class 2606 OID 6008803)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 6009319)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 6009309)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 6009217)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 6008987)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 6009012)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 6008929)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 6009348)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 6009145)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 6008963)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 6009006)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 6008943)
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
-- TOC entry 2456 (class 2606 OID 6009055)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 6009082)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 6008901)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 6008812)
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
-- TOC entry 2371 (class 2606 OID 6008836)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 6008792)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2355 (class 2606 OID 6008777)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 6009088)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 6009121)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 6009259)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 6008865)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 6008889)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 6009061)
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
-- TOC entry 2386 (class 2606 OID 6008879)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 6008950)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 6009073)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 6009201)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 6009245)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 6009359)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 6009384)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 6009366)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 6009105)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 6009046)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 6009037)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 6009239)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 6009173)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 6008748)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 6009112)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2353 (class 2606 OID 6008766)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2357 (class 2606 OID 6008786)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 6009130)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 6009068)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 6009018)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 6009404)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 6009395)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 6009390)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 6009186)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 6008845)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 6009028)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 6009228)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 6009379)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 6008914)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 6008761)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 6009289)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 6008972)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 6009096)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 6009164)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 6009001)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 6009273)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 6009158)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 1259 OID 6008994)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2503 (class 1259 OID 6009187)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2504 (class 1259 OID 6009188)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2378 (class 1259 OID 6008867)
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
-- TOC entry 2469 (class 1259 OID 6009089)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2463 (class 1259 OID 6009075)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2464 (class 1259 OID 6009074)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2415 (class 1259 OID 6008973)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2491 (class 1259 OID 6009146)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2492 (class 1259 OID 6009148)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2493 (class 1259 OID 6009147)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2403 (class 1259 OID 6008945)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2404 (class 1259 OID 6008944)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2521 (class 1259 OID 6009261)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2522 (class 1259 OID 6009262)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2523 (class 1259 OID 6009263)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2529 (class 1259 OID 6009294)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2530 (class 1259 OID 6009291)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2531 (class 1259 OID 6009293)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2532 (class 1259 OID 6009292)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2393 (class 1259 OID 6008916)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2394 (class 1259 OID 6008915)
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
-- TOC entry 2369 (class 1259 OID 6008839)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2479 (class 1259 OID 6009113)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2433 (class 1259 OID 6009007)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2359 (class 1259 OID 6008793)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2360 (class 1259 OID 6008794)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2484 (class 1259 OID 6009133)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2485 (class 1259 OID 6009132)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2486 (class 1259 OID 6009131)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2407 (class 1259 OID 6008951)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2408 (class 1259 OID 6008953)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2409 (class 1259 OID 6008952)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2567 (class 1259 OID 6009397)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2443 (class 1259 OID 6009041)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2444 (class 1259 OID 6009039)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2445 (class 1259 OID 6009038)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2446 (class 1259 OID 6009040)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2350 (class 1259 OID 6008767)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2351 (class 1259 OID 6008768)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2472 (class 1259 OID 6009097)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2458 (class 1259 OID 6009062)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2499 (class 1259 OID 6009174)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2500 (class 1259 OID 6009175)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2550 (class 1259 OID 6009349)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2551 (class 1259 OID 6009351)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2552 (class 1259 OID 6009350)
-- Name: idx_8787a0e5b3836ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5b3836ea9 ON enotaprograma USING btree (tip_programske_enote_id);


--
-- TOC entry 2382 (class 1259 OID 6008881)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2383 (class 1259 OID 6008880)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2384 (class 1259 OID 6008882)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2562 (class 1259 OID 6009385)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2507 (class 1259 OID 6009202)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2508 (class 1259 OID 6009203)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2542 (class 1259 OID 6009323)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2543 (class 1259 OID 6009322)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2544 (class 1259 OID 6009325)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2545 (class 1259 OID 6009321)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2546 (class 1259 OID 6009324)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2496 (class 1259 OID 6009165)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2449 (class 1259 OID 6009050)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2450 (class 1259 OID 6009049)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2451 (class 1259 OID 6009047)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2452 (class 1259 OID 6009048)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2333 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2538 (class 1259 OID 6009311)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2539 (class 1259 OID 6009310)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2553 (class 1259 OID 6009360)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2414 (class 1259 OID 6008964)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2365 (class 1259 OID 6008814)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2366 (class 1259 OID 6008813)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2374 (class 1259 OID 6008846)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2375 (class 1259 OID 6008847)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2438 (class 1259 OID 6009031)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2439 (class 1259 OID 6009030)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2440 (class 1259 OID 6009029)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2556 (class 1259 OID 6009368)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2557 (class 1259 OID 6009367)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2421 (class 1259 OID 6008996)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2422 (class 1259 OID 6008992)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2423 (class 1259 OID 6008989)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2424 (class 1259 OID 6008990)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2425 (class 1259 OID 6008988)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2426 (class 1259 OID 6008993)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2427 (class 1259 OID 6008991)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2381 (class 1259 OID 6008866)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2399 (class 1259 OID 6008930)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2400 (class 1259 OID 6008932)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2401 (class 1259 OID 6008931)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2402 (class 1259 OID 6008933)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2457 (class 1259 OID 6009056)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2526 (class 1259 OID 6009260)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2533 (class 1259 OID 6009290)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2372 (class 1259 OID 6008837)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2373 (class 1259 OID 6008838)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2573 (class 1259 OID 6009405)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2392 (class 1259 OID 6008902)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2570 (class 1259 OID 6009396)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2477 (class 1259 OID 6009107)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2478 (class 1259 OID 6009106)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2547 (class 1259 OID 6009320)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2336 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2389 (class 1259 OID 6008890)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2519 (class 1259 OID 6009246)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 6009247)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2358 (class 1259 OID 6008787)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2428 (class 1259 OID 6008995)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2599 (class 2606 OID 6009547)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2602 (class 2606 OID 6009532)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2601 (class 2606 OID 6009537)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2597 (class 2606 OID 6009557)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2603 (class 2606 OID 6009527)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2598 (class 2606 OID 6009552)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2600 (class 2606 OID 6009542)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2633 (class 2606 OID 6009702)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2632 (class 2606 OID 6009707)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2584 (class 2606 OID 6009462)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2620 (class 2606 OID 6009642)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2618 (class 2606 OID 6009637)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2619 (class 2606 OID 6009632)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2596 (class 2606 OID 6009522)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2628 (class 2606 OID 6009672)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2626 (class 2606 OID 6009682)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2627 (class 2606 OID 6009677)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2590 (class 2606 OID 6009497)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2591 (class 2606 OID 6009492)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2616 (class 2606 OID 6009622)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2639 (class 2606 OID 6009727)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2638 (class 2606 OID 6009732)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2637 (class 2606 OID 6009737)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2640 (class 2606 OID 6009757)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2643 (class 2606 OID 6009742)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2641 (class 2606 OID 6009752)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2642 (class 2606 OID 6009747)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2588 (class 2606 OID 6009487)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2589 (class 2606 OID 6009482)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2580 (class 2606 OID 6009447)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2581 (class 2606 OID 6009442)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2622 (class 2606 OID 6009652)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2604 (class 2606 OID 6009562)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2577 (class 2606 OID 6009422)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2576 (class 2606 OID 6009427)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2623 (class 2606 OID 6009667)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2624 (class 2606 OID 6009662)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2625 (class 2606 OID 6009657)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2594 (class 2606 OID 6009502)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2592 (class 2606 OID 6009512)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2593 (class 2606 OID 6009507)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2658 (class 2606 OID 6009832)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2608 (class 2606 OID 6009597)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2610 (class 2606 OID 6009587)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2611 (class 2606 OID 6009582)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2609 (class 2606 OID 6009592)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2575 (class 2606 OID 6009412)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2574 (class 2606 OID 6009417)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2621 (class 2606 OID 6009647)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2617 (class 2606 OID 6009627)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2631 (class 2606 OID 6009692)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2630 (class 2606 OID 6009697)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 6009797)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2651 (class 2606 OID 6009807)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2652 (class 2606 OID 6009802)
-- Name: fk_8787a0e5b3836ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5b3836ea9 FOREIGN KEY (tip_programske_enote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2586 (class 2606 OID 6009472)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2587 (class 2606 OID 6009467)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2585 (class 2606 OID 6009477)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2657 (class 2606 OID 6009827)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2635 (class 2606 OID 6009712)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2634 (class 2606 OID 6009717)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2648 (class 2606 OID 6009782)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2649 (class 2606 OID 6009777)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2646 (class 2606 OID 6009792)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2650 (class 2606 OID 6009772)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2647 (class 2606 OID 6009787)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2629 (class 2606 OID 6009687)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2612 (class 2606 OID 6009617)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2613 (class 2606 OID 6009612)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2615 (class 2606 OID 6009602)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2614 (class 2606 OID 6009607)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2644 (class 2606 OID 6009767)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2645 (class 2606 OID 6009762)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2654 (class 2606 OID 6009812)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2595 (class 2606 OID 6009517)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2636 (class 2606 OID 6009722)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2578 (class 2606 OID 6009437)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2579 (class 2606 OID 6009432)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2583 (class 2606 OID 6009452)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2582 (class 2606 OID 6009457)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2605 (class 2606 OID 6009577)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2606 (class 2606 OID 6009572)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2607 (class 2606 OID 6009567)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2655 (class 2606 OID 6009822)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 6009817)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-02 12:38:37 CEST

--
-- PostgreSQL database dump complete
--

