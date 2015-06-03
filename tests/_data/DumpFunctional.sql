--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-03 13:03:03 CEST

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
-- TOC entry 180 (class 1259 OID 6190102)
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
-- TOC entry 227 (class 1259 OID 6190619)
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
-- TOC entry 226 (class 1259 OID 6190602)
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
-- TOC entry 219 (class 1259 OID 6190511)
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
-- TOC entry 194 (class 1259 OID 6190281)
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
-- TOC entry 197 (class 1259 OID 6190315)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6190224)
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
-- TOC entry 228 (class 1259 OID 6190633)
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
-- TOC entry 213 (class 1259 OID 6190441)
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
-- TOC entry 192 (class 1259 OID 6190261)
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
-- TOC entry 196 (class 1259 OID 6190309)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6190241)
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
-- TOC entry 202 (class 1259 OID 6190358)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6190383)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6190198)
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
-- TOC entry 181 (class 1259 OID 6190111)
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
-- TOC entry 182 (class 1259 OID 6190122)
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
-- TOC entry 177 (class 1259 OID 6190076)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6190095)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6190390)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6190421)
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
-- TOC entry 223 (class 1259 OID 6190555)
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
-- TOC entry 184 (class 1259 OID 6190155)
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
-- TOC entry 186 (class 1259 OID 6190190)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6190364)
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
-- TOC entry 185 (class 1259 OID 6190175)
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
-- TOC entry 191 (class 1259 OID 6190253)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6190376)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6190496)
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
-- TOC entry 222 (class 1259 OID 6190547)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6190659)
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
-- TOC entry 232 (class 1259 OID 6190687)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id integer NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 238 (class 1259 OID 6190717)
-- Name: programfestival_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programfestival_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 230 (class 1259 OID 6190668)
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
-- TOC entry 236 (class 1259 OID 6190713)
-- Name: programgostovanje_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programgostovanje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 209 (class 1259 OID 6190405)
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
-- TOC entry 201 (class 1259 OID 6190349)
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
-- TOC entry 200 (class 1259 OID 6190339)
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
-- TOC entry 221 (class 1259 OID 6190536)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6190473)
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
-- TOC entry 174 (class 1259 OID 6190047)
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
-- TOC entry 173 (class 1259 OID 6190045)
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
-- TOC entry 210 (class 1259 OID 6190415)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6190085)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6190069)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6190429)
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
-- TOC entry 204 (class 1259 OID 6190370)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6190320)
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
-- TOC entry 235 (class 1259 OID 6190705)
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
-- TOC entry 234 (class 1259 OID 6190698)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 6190693)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 6190483)
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
-- TOC entry 183 (class 1259 OID 6190147)
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
-- TOC entry 199 (class 1259 OID 6190326)
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
-- TOC entry 220 (class 1259 OID 6190525)
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
-- TOC entry 231 (class 1259 OID 6190676)
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
-- TOC entry 237 (class 1259 OID 6190715)
-- Name: tipprogramskeenote_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipprogramskeenote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 188 (class 1259 OID 6190210)
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
-- TOC entry 175 (class 1259 OID 6190056)
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
-- TOC entry 225 (class 1259 OID 6190581)
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
-- TOC entry 193 (class 1259 OID 6190272)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6190397)
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
-- TOC entry 215 (class 1259 OID 6190466)
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
-- TOC entry 195 (class 1259 OID 6190304)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6190571)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 6190456)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2174 (class 2604 OID 6190050)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2776 (class 0 OID 6190102)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 6190619)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
000c0000-556e-dee7-5dd7-1d7540ed3c60	000d0000-556e-dee7-a3cf-55142acbe743	\N	00090000-556e-dee7-7e11-33faf2d13811	\N	\N	0001	f	\N	\N	\N	\N	\N	\N
000c0000-556e-dee7-d45d-e8b88bb8c9fa	000d0000-556e-dee7-6748-b27d71366a3c	\N	00090000-556e-dee7-ea71-fafdfee35208	\N	\N	0002	f	\N	\N	\N	\N	\N	\N
000c0000-556e-dee7-3f8d-a49adb16fe90	000d0000-556e-dee7-3c6d-59eed91d6ea3	\N	00090000-556e-dee7-12a9-7c05808700ff	\N	\N	0003	f	\N	\N	\N	\N	\N	\N
000c0000-556e-dee7-2a70-b4111371d9ab	000d0000-556e-dee7-8ee8-d20280536fcb	\N	00090000-556e-dee7-51d3-e7bc13f60761	\N	\N	0004	f	\N	\N	\N	\N	\N	\N
000c0000-556e-dee7-5cc8-60a2a2862489	000d0000-556e-dee7-539e-471257d34d92	\N	00090000-556e-dee7-8b09-2f9b93e6a3e0	\N	\N	0005	f	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2822 (class 0 OID 6190602)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2815 (class 0 OID 6190511)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-556e-dee7-d449-1b5fe979ece2	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-556e-dee7-bc09-2731cf0d52fa	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-556e-dee7-61b9-c56c903cff45	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 2790 (class 0 OID 6190281)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-556e-dee7-d2e3-32c1790349c4	\N	\N	00200000-556e-dee7-2194-0fd717923f4a	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-556e-dee7-834a-c25221546949	\N	\N	00200000-556e-dee7-8ae1-103ca356fe96	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-556e-dee7-7d26-22242f5cd49e	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-556e-dee7-6ffe-8dbde35eeb40	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-556e-dee7-433e-f8569de88e00	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2793 (class 0 OID 6190315)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2785 (class 0 OID 6190224)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-556e-dee6-2918-f67ea6899f24	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-556e-dee6-59ab-d77357c95183	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-556e-dee6-9572-df54cbd23e9c	AL	ALB	008	Albania 	Albanija	\N
00040000-556e-dee6-80ad-5774d015dc68	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-556e-dee6-f581-4f7dd95b13c5	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-556e-dee6-c753-80521192994d	AD	AND	020	Andorra 	Andora	\N
00040000-556e-dee6-a517-5382b4954dce	AO	AGO	024	Angola 	Angola	\N
00040000-556e-dee6-c220-c9575df362a1	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-556e-dee6-1a17-11aa014f5ef3	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-556e-dee6-9a77-a2d4b289c164	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-556e-dee6-d61e-4f8c5fee3b67	AR	ARG	032	Argentina 	Argenitna	\N
00040000-556e-dee6-a8f2-2a84461c3fcb	AM	ARM	051	Armenia 	Armenija	\N
00040000-556e-dee6-89ca-93970f5e3580	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-556e-dee6-6186-60e7fccc35b2	AU	AUS	036	Australia 	Avstralija	\N
00040000-556e-dee6-1b99-b95971204832	AT	AUT	040	Austria 	Avstrija	\N
00040000-556e-dee6-624b-40bb9f9ab70b	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-556e-dee6-bb97-04b7e8dc1572	BS	BHS	044	Bahamas 	Bahami	\N
00040000-556e-dee6-0a62-00b79ff452c7	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-556e-dee6-c6c9-e89e9cde643a	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-556e-dee6-5219-0316143e90c4	BB	BRB	052	Barbados 	Barbados	\N
00040000-556e-dee6-2cd9-ef9995125071	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-556e-dee6-02b1-9739f9125f6d	BE	BEL	056	Belgium 	Belgija	\N
00040000-556e-dee6-45d4-e8b8f36e3eeb	BZ	BLZ	084	Belize 	Belize	\N
00040000-556e-dee6-c9bd-9287bf60c6e1	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-556e-dee6-192c-96c1b70cecea	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-556e-dee6-517a-86d0a3be31d6	BT	BTN	064	Bhutan 	Butan	\N
00040000-556e-dee6-4ac7-8bda222e97c2	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-556e-dee6-b53c-de54ae22907c	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-556e-dee6-a45f-481a35da726a	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-556e-dee6-2df2-d276eefbd5a5	BW	BWA	072	Botswana 	Bocvana	\N
00040000-556e-dee6-a980-ecde205af6e9	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-556e-dee6-b41a-11403a990b67	BR	BRA	076	Brazil 	Brazilija	\N
00040000-556e-dee6-119c-d7e5a9f13e6e	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-556e-dee6-0eb1-76868c0972e0	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-556e-dee6-ad1e-27c1a3438088	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-556e-dee6-f316-14a6a68e8e80	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-556e-dee6-06da-96682442b794	BI	BDI	108	Burundi 	Burundi 	\N
00040000-556e-dee6-706c-f761bdfd0fd4	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-556e-dee6-8cdf-0440453a880a	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-556e-dee6-4f46-50a5c0505923	CA	CAN	124	Canada 	Kanada	\N
00040000-556e-dee6-703f-164e0a396421	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-556e-dee6-01a9-42ce97bc381d	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-556e-dee6-3d8a-9d754e49eb58	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-556e-dee6-bbc6-1861bd6657b9	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-556e-dee6-8e70-0058c3b95017	CL	CHL	152	Chile 	Čile	\N
00040000-556e-dee6-f38e-878b5404fec3	CN	CHN	156	China 	Kitajska	\N
00040000-556e-dee6-e4ee-ee35383d159e	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-556e-dee6-df7f-535b653a65d0	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-556e-dee6-63b6-10501ef2c5a1	CO	COL	170	Colombia 	Kolumbija	\N
00040000-556e-dee6-a364-f61857d498fc	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-556e-dee6-3d79-37a31360e717	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-556e-dee6-c0e6-6a3174dee09a	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-556e-dee6-8347-99f20c284acd	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-556e-dee6-a6dc-4afe34874320	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-556e-dee6-36e4-2c3abd7667e4	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-556e-dee6-b40b-722134405145	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-556e-dee6-8b0b-c5072031ef4c	CU	CUB	192	Cuba 	Kuba	\N
00040000-556e-dee6-437b-f8acc5d0e5e4	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-556e-dee6-3be0-c08ad9bea1d8	CY	CYP	196	Cyprus 	Ciper	\N
00040000-556e-dee6-afe0-6e45663365dc	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-556e-dee6-bd8d-920060a8f48f	DK	DNK	208	Denmark 	Danska	\N
00040000-556e-dee6-9277-3ac23ffdeee2	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-556e-dee6-4d13-a20636e65014	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-556e-dee6-da86-740c29e4d42b	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-556e-dee6-01cf-382b3bf25138	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-556e-dee6-3832-3f791090979b	EG	EGY	818	Egypt 	Egipt	\N
00040000-556e-dee6-d442-ba076427d039	SV	SLV	222	El Salvador 	Salvador	\N
00040000-556e-dee6-b723-a5ff037cf8bc	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-556e-dee6-41fe-b29ee081f239	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-556e-dee6-1c1c-d2b591f6d9fb	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-556e-dee6-4590-2471e4d5507f	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-556e-dee6-ae2b-fe56c80779a2	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-556e-dee6-56d8-56d8d4df7184	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-556e-dee6-8640-7bc18045a158	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-556e-dee6-0dd5-10269e0acf21	FI	FIN	246	Finland 	Finska	\N
00040000-556e-dee6-30a3-bfea1ec3763e	FR	FRA	250	France 	Francija	\N
00040000-556e-dee6-a3e1-2986cc5f87fb	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-556e-dee6-56c6-92fa7a928ad5	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-556e-dee6-9189-e13d8ae8d089	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-556e-dee6-580e-3a13a72adf1d	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-556e-dee6-0a78-0ca1e14a68d0	GA	GAB	266	Gabon 	Gabon	\N
00040000-556e-dee6-79e0-eb87218bccb3	GM	GMB	270	Gambia 	Gambija	\N
00040000-556e-dee6-5c4f-0298225cbbb8	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-556e-dee6-5fff-0d69844e14bf	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-556e-dee6-7765-bc56e756e0ab	GH	GHA	288	Ghana 	Gana	\N
00040000-556e-dee6-7294-d54ef040b4df	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-556e-dee6-45fd-23a0c844c5e0	GR	GRC	300	Greece 	Grčija	\N
00040000-556e-dee6-8a93-3779e50db1b6	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-556e-dee6-f606-10b1e0520826	GD	GRD	308	Grenada 	Grenada	\N
00040000-556e-dee6-a9b1-9e48d401f063	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-556e-dee6-3226-e333b6663cfb	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-556e-dee6-00e6-55b7baa22777	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-556e-dee6-b753-27d03918f0df	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-556e-dee6-4c23-647eef9ee19e	GN	GIN	324	Guinea 	Gvineja	\N
00040000-556e-dee6-1082-d6c96fc20644	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-556e-dee6-2ca2-c8e6991d7840	GY	GUY	328	Guyana 	Gvajana	\N
00040000-556e-dee6-d0f7-ccca46914fdd	HT	HTI	332	Haiti 	Haiti	\N
00040000-556e-dee6-4ce8-a81cc1314cd2	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-556e-dee6-f6f8-630e54b47df1	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-556e-dee6-0c55-58f84efaac8e	HN	HND	340	Honduras 	Honduras	\N
00040000-556e-dee6-098a-440d80f44a15	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-556e-dee6-b007-a899bc59f7c8	HU	HUN	348	Hungary 	Madžarska	\N
00040000-556e-dee6-ee2d-82f2ff27baf7	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-556e-dee6-7b31-f21ef5b0a3ea	IN	IND	356	India 	Indija	\N
00040000-556e-dee6-ee18-db805d537e13	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-556e-dee6-31c1-f00c5c0e9bad	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-556e-dee6-f247-54b30dd40f55	IQ	IRQ	368	Iraq 	Irak	\N
00040000-556e-dee6-2835-2cc6cd352a7e	IE	IRL	372	Ireland 	Irska	\N
00040000-556e-dee6-82da-e07cdf73f15e	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-556e-dee6-660d-3c3f683a90ef	IL	ISR	376	Israel 	Izrael	\N
00040000-556e-dee6-4a89-2fc4373ebe3e	IT	ITA	380	Italy 	Italija	\N
00040000-556e-dee6-683c-9d84d8fee7fe	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-556e-dee6-5308-c1cf78a15f33	JP	JPN	392	Japan 	Japonska	\N
00040000-556e-dee6-246d-002e497c42c7	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-556e-dee6-7bfe-e3748ea3c0a2	JO	JOR	400	Jordan 	Jordanija	\N
00040000-556e-dee6-b075-4cd2e729a783	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-556e-dee6-14ae-26fd78823441	KE	KEN	404	Kenya 	Kenija	\N
00040000-556e-dee6-7284-6522e83a3ded	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-556e-dee6-a486-0a4538a194fe	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-556e-dee6-ce5e-f5044ffb38e8	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-556e-dee6-c18f-cca1a82f8461	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-556e-dee6-b1a9-cc7d3fc2d8c9	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-556e-dee6-8981-7e04dd644c8f	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-556e-dee6-feac-891843fa0946	LV	LVA	428	Latvia 	Latvija	\N
00040000-556e-dee6-eec4-4662db3f5f21	LB	LBN	422	Lebanon 	Libanon	\N
00040000-556e-dee6-c2d8-01b05ca22b5e	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-556e-dee6-c36d-d64d18222919	LR	LBR	430	Liberia 	Liberija	\N
00040000-556e-dee6-4f2b-9436ee275cbc	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-556e-dee6-6ab8-c34e031c8571	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-556e-dee6-ccde-2b393def3b3a	LT	LTU	440	Lithuania 	Litva	\N
00040000-556e-dee6-e0c4-64d14223fab3	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-556e-dee6-8d28-077dcd2bc6e9	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-556e-dee6-03cf-b1b8cdbcd075	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-556e-dee6-f6fa-d636ed6f2d57	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-556e-dee6-0037-73ef1bb6defb	MW	MWI	454	Malawi 	Malavi	\N
00040000-556e-dee6-95ad-91197c8f571a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-556e-dee6-8dc2-f97c91db27dd	MV	MDV	462	Maldives 	Maldivi	\N
00040000-556e-dee6-7922-22281ed58d7a	ML	MLI	466	Mali 	Mali	\N
00040000-556e-dee6-caa1-447f0cd6864e	MT	MLT	470	Malta 	Malta	\N
00040000-556e-dee6-0731-490dae0d05af	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-556e-dee6-b07b-12e4912c5c51	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-556e-dee6-8586-74144bd76754	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-556e-dee6-d2b7-71338740d278	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-556e-dee6-bb4f-8fafe31e047b	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-556e-dee6-a7e0-1b1e16fa7313	MX	MEX	484	Mexico 	Mehika	\N
00040000-556e-dee6-7d76-847177e0319b	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-556e-dee6-800b-ec442ab9db36	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-556e-dee6-b461-676f7bed66d3	MC	MCO	492	Monaco 	Monako	\N
00040000-556e-dee6-0e4a-5c7374fafe96	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-556e-dee6-0660-c9426410b133	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-556e-dee6-7846-93bac4aef511	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-556e-dee6-1a4b-a0050f4e01f3	MA	MAR	504	Morocco 	Maroko	\N
00040000-556e-dee6-c17f-e4d4c309c380	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-556e-dee6-39dd-89cf15af0309	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-556e-dee6-9726-a61be12f273b	NA	NAM	516	Namibia 	Namibija	\N
00040000-556e-dee6-f873-6ddc3f80b847	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-556e-dee6-f550-0f21a335d360	NP	NPL	524	Nepal 	Nepal	\N
00040000-556e-dee6-3d88-38635c2805f6	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-556e-dee6-8d60-cf29808c04a6	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-556e-dee6-2d5b-4836fb25b25e	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-556e-dee6-fbf1-0f961c3e7e19	NE	NER	562	Niger 	Niger 	\N
00040000-556e-dee6-9250-c5e6c74c1faf	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-556e-dee6-b4ee-d6935b9af6ea	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-556e-dee6-a514-a0d6b7566cb1	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-556e-dee6-498c-8dd4942d7e45	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-556e-dee6-d499-46937c8094cf	NO	NOR	578	Norway 	Norveška	\N
00040000-556e-dee6-3113-4a276dc79666	OM	OMN	512	Oman 	Oman	\N
00040000-556e-dee6-c61e-778642e9b2b1	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-556e-dee6-6ca9-e3672d0f3e44	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-556e-dee6-b013-dfe77d28ad01	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-556e-dee6-c950-51fba854b119	PA	PAN	591	Panama 	Panama	\N
00040000-556e-dee6-7872-fc24452eefbd	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-556e-dee6-89eb-8ec5bb8a092e	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-556e-dee6-65dc-e0e5104e7362	PE	PER	604	Peru 	Peru	\N
00040000-556e-dee6-38bd-3bbb333d8ef2	PH	PHL	608	Philippines 	Filipini	\N
00040000-556e-dee6-7a68-b2b38a8a32d5	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-556e-dee6-001b-36f7db369267	PL	POL	616	Poland 	Poljska	\N
00040000-556e-dee6-b157-84812a523b13	PT	PRT	620	Portugal 	Portugalska	\N
00040000-556e-dee6-77ac-61b24e6a6484	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-556e-dee6-a54f-cfe20cf60471	QA	QAT	634	Qatar 	Katar	\N
00040000-556e-dee6-c0ff-4bc099d51955	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-556e-dee6-5db1-3559523b6295	RO	ROU	642	Romania 	Romunija	\N
00040000-556e-dee6-607d-3c7f26777dac	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-556e-dee6-ae88-11f2f02f1dd1	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-556e-dee6-2c8c-bf130c61411c	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-556e-dee6-fe91-4149a1d5d4df	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-556e-dee6-15cd-6a710b51d9e7	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-556e-dee6-3bd7-6371d0d020f3	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-556e-dee6-4cec-70cfe33b77cb	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-556e-dee6-f1f8-905c85c01cce	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-556e-dee6-7c49-3f14e8a2f7ea	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-556e-dee6-d75b-efd735c64c45	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-556e-dee6-bc33-8f225f8b0ae2	SM	SMR	674	San Marino 	San Marino	\N
00040000-556e-dee6-f392-f1e18659dd8b	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-556e-dee6-61af-5b4335a77db5	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-556e-dee6-c920-1a6822b579b0	SN	SEN	686	Senegal 	Senegal	\N
00040000-556e-dee6-131d-f2f3f3532a2c	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-556e-dee6-f812-5833e638723c	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-556e-dee6-02a6-0d7135a8d829	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-556e-dee6-cdae-a880f17c4041	SG	SGP	702	Singapore 	Singapur	\N
00040000-556e-dee6-ae8d-2c1e6aba23a2	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-556e-dee6-1fcb-1f2e47705ef0	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-556e-dee6-3ac7-eaffceb15272	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-556e-dee6-e3cb-2d2c428de2bb	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-556e-dee6-b011-e9a4967e3138	SO	SOM	706	Somalia 	Somalija	\N
00040000-556e-dee6-2d61-da4dd02aa9e9	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-556e-dee6-9ca8-1fe0e9f927bd	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-556e-dee6-b16e-0d7f9bd9d821	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-556e-dee6-05c8-a2f75b28d8f5	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-556e-dee6-e02c-280720bbb371	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-556e-dee6-4864-e7894cc794ae	SD	SDN	729	Sudan 	Sudan	\N
00040000-556e-dee6-3ef5-54f834d9ceba	SR	SUR	740	Suriname 	Surinam	\N
00040000-556e-dee6-5d0c-9276ceb59917	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-556e-dee6-adc9-42b0f93f7af0	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-556e-dee6-41e4-c80e2a421aad	SE	SWE	752	Sweden 	Švedska	\N
00040000-556e-dee6-c17a-c540d920faa7	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-556e-dee6-3dc9-f8eb2af40539	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-556e-dee6-4ce9-e0b12da387e2	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-556e-dee6-b4ab-c938aa0282e9	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-556e-dee6-0e33-76186a85464d	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-556e-dee6-e4eb-9b00ed40d7e7	TH	THA	764	Thailand 	Tajska	\N
00040000-556e-dee6-c017-44eb6c0210a9	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-556e-dee6-abc5-0ce583cbdf3f	TG	TGO	768	Togo 	Togo	\N
00040000-556e-dee6-2337-4fa0c1e62df9	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-556e-dee6-c2ba-0ae88f22a64f	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-556e-dee6-d0cd-357076fd95f7	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-556e-dee6-95aa-bdd8a9ddca93	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-556e-dee6-acff-c391e301a999	TR	TUR	792	Turkey 	Turčija	\N
00040000-556e-dee6-ada7-b476e172100c	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-556e-dee6-3dbe-513314ebcae3	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-556e-dee6-535a-36fecf5a74cd	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-556e-dee6-d396-dbbe672da2ab	UG	UGA	800	Uganda 	Uganda	\N
00040000-556e-dee6-aaf7-fe1f16c73cd4	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-556e-dee6-9d20-b8c7597708e1	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-556e-dee6-291b-f1d3737efc9d	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-556e-dee6-9595-23068b55ce4a	US	USA	840	United States 	Združene države Amerike	\N
00040000-556e-dee6-375e-3d416825fc48	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-556e-dee6-cd60-23a1eae4c404	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-556e-dee6-13e6-af769d9ed1d6	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-556e-dee6-7baa-ac002773c61b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-556e-dee6-1197-ace82d30cffb	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-556e-dee6-4016-b2e199be1a84	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-556e-dee6-28d3-9cce849515b4	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-556e-dee6-292f-6f6b85b255d5	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-556e-dee6-b014-3b57f92d821f	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-556e-dee6-5984-4990686a693f	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-556e-dee6-56db-d3528effcccd	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-556e-dee6-5309-0359585c3d6a	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-556e-dee6-99f4-d09ebef81d74	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2824 (class 0 OID 6190633)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, tip_programske_enote_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tip) FROM stdin;
\.


--
-- TOC entry 2809 (class 0 OID 6190441)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-556e-dee7-0593-b16a9510bfee	000e0000-556e-dee7-1d8f-cec0cbd2c38e	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-556e-dee6-14a7-6f569faaa0df
000d0000-556e-dee7-a3cf-55142acbe743	000e0000-556e-dee7-1d8f-cec0cbd2c38e	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-556e-dee6-14a7-6f569faaa0df
000d0000-556e-dee7-6748-b27d71366a3c	000e0000-556e-dee7-1d8f-cec0cbd2c38e	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-556e-dee6-487d-d34c467dc69d
000d0000-556e-dee7-3c6d-59eed91d6ea3	000e0000-556e-dee7-1d8f-cec0cbd2c38e	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-556e-dee6-ae59-35c7c5a8d381
000d0000-556e-dee7-8ee8-d20280536fcb	000e0000-556e-dee7-1d8f-cec0cbd2c38e	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-556e-dee6-ae59-35c7c5a8d381
000d0000-556e-dee7-539e-471257d34d92	000e0000-556e-dee7-1d8f-cec0cbd2c38e	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-556e-dee6-ae59-35c7c5a8d381
\.


--
-- TOC entry 2788 (class 0 OID 6190261)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2792 (class 0 OID 6190309)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2786 (class 0 OID 6190241)
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
-- TOC entry 2798 (class 0 OID 6190358)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2802 (class 0 OID 6190383)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2783 (class 0 OID 6190198)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-556e-dee6-f644-e89984641a08	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-556e-dee6-c0f0-3daba1bcbff4	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-556e-dee6-5ca3-f2ee4b9303ae	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-556e-dee6-3744-ad5e06f3d5a9	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-556e-dee6-84c7-8b206d28c3ff	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-556e-dee6-259a-e75982c496f6	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-556e-dee6-a19b-571c060f5437	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-556e-dee6-67c7-8c2b0fef3c9b	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-556e-dee6-310f-10cb20156fe0	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-556e-dee6-89ee-2b1652321fba	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-556e-dee6-c081-ffaff0bed865	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-556e-dee6-2f89-04b7fe0db2bb	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-556e-dee6-f54e-dc9e1414fa95	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-556e-dee6-0583-55761c0f32bb	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-556e-dee6-4f77-71a5c8f81327	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-556e-dee6-8307-388cb98bb7e7	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2777 (class 0 OID 6190111)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-556e-dee6-6796-222bac47e808	00000000-556e-dee6-84c7-8b206d28c3ff	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-556e-dee6-2af7-7f5c5e536992	00000000-556e-dee6-84c7-8b206d28c3ff	00010000-556e-dee6-a802-b4d1159e7591	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-556e-dee6-7027-702583a27675	00000000-556e-dee6-259a-e75982c496f6	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2778 (class 0 OID 6190122)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-556e-dee7-934d-ced3d7cab44f	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-556e-dee7-51d3-e7bc13f60761	00010000-556e-dee7-a2e5-cb1234827970	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-556e-dee7-12a9-7c05808700ff	00010000-556e-dee7-09bd-df5d632c0db9	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-556e-dee7-e782-cf117e45cdae	00010000-556e-dee7-284b-1308ab7fae47	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-556e-dee7-a183-7855089ec36a	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-556e-dee7-1880-8696f14ecf2e	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-556e-dee7-af6b-abd5a43706f4	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-556e-dee7-c52c-d044e823b1ab	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-556e-dee7-7e11-33faf2d13811	00010000-556e-dee7-6ff7-375cac6623b7	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-556e-dee7-ea71-fafdfee35208	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-556e-dee7-3223-d7ba866c84b8	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-556e-dee7-8b09-2f9b93e6a3e0	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-556e-dee7-1d97-fc3cb998959c	00010000-556e-dee7-29ad-9bc50eec20c5	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2768 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2773 (class 0 OID 6190076)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-556e-dee6-197a-3e7b40383d00	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-556e-dee6-ed27-3464c1d64893	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-556e-dee6-1158-3418460a660f	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-556e-dee6-50af-9e53591a516e	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-556e-dee6-58c8-f659d97110d4	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-556e-dee6-dab7-c6cfac03281a	Abonma-read	Abonma - branje	f
00030000-556e-dee6-85c5-9a49845362d1	Abonma-write	Abonma - spreminjanje	f
00030000-556e-dee6-7290-de5c765db206	Alternacija-read	Alternacija - branje	f
00030000-556e-dee6-91a1-024493ffabd5	Alternacija-write	Alternacija - spreminjanje	f
00030000-556e-dee6-0a50-f7cec0d10033	Arhivalija-read	Arhivalija - branje	f
00030000-556e-dee6-0a7f-07e8b3c4f020	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-556e-dee6-427d-8a09c2046122	Besedilo-read	Besedilo - branje	f
00030000-556e-dee6-1afe-4b81d9059206	Besedilo-write	Besedilo - spreminjanje	f
00030000-556e-dee6-2358-6553af813a0a	DogodekIzven-read	DogodekIzven - branje	f
00030000-556e-dee6-3df7-f7cd5827a9b6	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-556e-dee6-8d60-2305f017c348	Dogodek-read	Dogodek - branje	f
00030000-556e-dee6-088d-e37d77308adf	Dogodek-write	Dogodek - spreminjanje	f
00030000-556e-dee6-a4e6-9ef84c4ffdcb	Drzava-read	Drzava - branje	f
00030000-556e-dee6-462b-8c66c0bc8635	Drzava-write	Drzava - spreminjanje	f
00030000-556e-dee6-8a77-c4c8c0f090bc	Funkcija-read	Funkcija - branje	f
00030000-556e-dee6-1f10-d29b1af44802	Funkcija-write	Funkcija - spreminjanje	f
00030000-556e-dee6-6e46-ab2c67703298	Gostovanje-read	Gostovanje - branje	f
00030000-556e-dee6-0e61-f336d4ce7522	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-556e-dee6-088e-6512573f515e	Gostujoca-read	Gostujoca - branje	f
00030000-556e-dee6-789b-cf3b483a9fc4	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-556e-dee6-aa1a-0776f4e5f399	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-556e-dee6-dcaf-b603d22b6689	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-556e-dee6-4af9-75b039091d86	Kupec-read	Kupec - branje	f
00030000-556e-dee6-b05d-278e92bb0c4c	Kupec-write	Kupec - spreminjanje	f
00030000-556e-dee6-c5cc-88aa2075e419	NacinPlacina-read	NacinPlacina - branje	f
00030000-556e-dee6-4afe-1be151b45592	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-556e-dee6-9ad1-80333a666816	Option-read	Option - branje	f
00030000-556e-dee6-8c76-2dd8d441dbd7	Option-write	Option - spreminjanje	f
00030000-556e-dee6-2a83-5dde072ad4a4	OptionValue-read	OptionValue - branje	f
00030000-556e-dee6-797f-68d234adbf74	OptionValue-write	OptionValue - spreminjanje	f
00030000-556e-dee6-2e73-04fb3029f6f3	Oseba-read	Oseba - branje	f
00030000-556e-dee6-87ce-6f0670d6e9b8	Oseba-write	Oseba - spreminjanje	f
00030000-556e-dee6-bd1c-fcd91351c410	Permission-read	Permission - branje	f
00030000-556e-dee6-fec0-fa01c21d4c59	Permission-write	Permission - spreminjanje	f
00030000-556e-dee6-5acd-c6bb93c45d9a	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-556e-dee6-5e6f-4fe5bbf1d79f	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-556e-dee6-c584-c5cd06843174	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-556e-dee6-7dbe-dedc79c01315	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-556e-dee6-016d-2e154dc53628	Pogodba-read	Pogodba - branje	f
00030000-556e-dee6-aeed-680c6cb5a047	Pogodba-write	Pogodba - spreminjanje	f
00030000-556e-dee6-d2fe-8cdc391fd01d	Popa-read	Popa - branje	f
00030000-556e-dee6-5e13-02a73799efa5	Popa-write	Popa - spreminjanje	f
00030000-556e-dee6-1746-6de410b7af8a	Posta-read	Posta - branje	f
00030000-556e-dee6-ec6d-5022129d4d01	Posta-write	Posta - spreminjanje	f
00030000-556e-dee6-11b7-29d7df55b6ef	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-556e-dee6-c936-6d2a6834c935	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-556e-dee6-ce3d-f466e3f13a1e	PostniNaslov-read	PostniNaslov - branje	f
00030000-556e-dee6-a7ad-b0141e0a418a	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-556e-dee6-9e25-6775b206a402	Predstava-read	Predstava - branje	f
00030000-556e-dee6-4853-6a7d3cd04d82	Predstava-write	Predstava - spreminjanje	f
00030000-556e-dee6-eb3b-199449579c56	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-556e-dee6-a916-782850a2a4fd	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-556e-dee6-6363-1b37a068777b	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-556e-dee6-663d-1fb58c2724fc	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-556e-dee6-f7bf-df37ccab3391	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-556e-dee6-259d-952c36589783	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-556e-dee6-d335-bfc810a94bd3	Prostor-read	Prostor - branje	f
00030000-556e-dee6-e7eb-0a80c378e798	Prostor-write	Prostor - spreminjanje	f
00030000-556e-dee6-b439-680198e6b312	Racun-read	Racun - branje	f
00030000-556e-dee6-598a-008f15bde976	Racun-write	Racun - spreminjanje	f
00030000-556e-dee6-2ddc-25f053b55718	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-556e-dee6-c6df-33844e387ed9	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-556e-dee6-7aba-7758ce954e03	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-556e-dee6-b461-2b006d502e0a	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-556e-dee6-742f-76bb1c870e01	Rekvizit-read	Rekvizit - branje	f
00030000-556e-dee6-d52c-e14916fda0b3	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-556e-dee6-6d56-a6fee14a9864	Revizija-read	Revizija - branje	f
00030000-556e-dee6-2ea7-49a452604fed	Revizija-write	Revizija - spreminjanje	f
00030000-556e-dee6-e711-48c9bcaf1cbf	Rezervacija-read	Rezervacija - branje	f
00030000-556e-dee6-3ca0-bed0ed63f662	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-556e-dee6-0315-f8e736fb1db5	Role-read	Role - branje	f
00030000-556e-dee6-e487-063d0314f4a2	Role-write	Role - spreminjanje	f
00030000-556e-dee6-70d0-2200bd5c6b27	SedezniRed-read	SedezniRed - branje	f
00030000-556e-dee6-289b-d963edca4232	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-556e-dee6-82a8-33365dcf42c8	Sedez-read	Sedez - branje	f
00030000-556e-dee6-b19f-7074b07ce742	Sedez-write	Sedez - spreminjanje	f
00030000-556e-dee6-92c4-1b78086a377b	Sezona-read	Sezona - branje	f
00030000-556e-dee6-759a-89ff5a0d65db	Sezona-write	Sezona - spreminjanje	f
00030000-556e-dee6-2153-7b39b91c005b	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-556e-dee6-ce9a-b4e4670fa28c	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-556e-dee6-fb17-d8a649686917	Stevilcenje-read	Stevilcenje - branje	f
00030000-556e-dee6-69d3-bf99ade70a26	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-556e-dee6-dcc7-96b4af0e3e4c	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-556e-dee6-f07c-b270b6b96538	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-556e-dee6-df5a-bcb02f6181f4	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-556e-dee6-8e9a-90996de1f0c7	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-556e-dee6-5a4b-89a9031e3535	Telefonska-read	Telefonska - branje	f
00030000-556e-dee6-3c09-f125a9b52b5b	Telefonska-write	Telefonska - spreminjanje	f
00030000-556e-dee6-8adf-780b8a603350	TerminStoritve-read	TerminStoritve - branje	f
00030000-556e-dee6-ffcb-e25b0b0fa4be	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-556e-dee6-1ded-83f808c31519	TipFunkcije-read	TipFunkcije - branje	f
00030000-556e-dee6-a16a-6757607b3657	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-556e-dee6-d090-c70dbc30dfed	Trr-read	Trr - branje	f
00030000-556e-dee6-4b4d-207e64e62c8d	Trr-write	Trr - spreminjanje	f
00030000-556e-dee6-68b9-00dcdc13c254	Uprizoritev-read	Uprizoritev - branje	f
00030000-556e-dee6-1aa9-4377c752dcef	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-556e-dee6-8512-7fa315b3fc56	User-read	User - branje	f
00030000-556e-dee6-29a4-6a7f823cfbb4	User-write	User - spreminjanje	f
00030000-556e-dee6-ddd1-14e356d12884	Vaja-read	Vaja - branje	f
00030000-556e-dee6-5c87-c2aa77048479	Vaja-write	Vaja - spreminjanje	f
00030000-556e-dee6-ff75-34be5b546c9f	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-556e-dee6-f961-6f04bd32f921	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-556e-dee6-2841-a1f27bfa8732	Zaposlitev-read	Zaposlitev - branje	f
00030000-556e-dee6-5929-108b024b629f	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-556e-dee6-770a-6539ed25d3c0	Zasedenost-read	Zasedenost - branje	f
00030000-556e-dee6-4e5f-33d49e78f379	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-556e-dee6-8ed0-471847f64b11	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-556e-dee6-c8ff-b8af265cf1c6	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-556e-dee6-0fb3-8cad96ccfe23	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-556e-dee6-ba7d-1c1c145b35a9	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2775 (class 0 OID 6190095)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-556e-dee6-cb48-6b09018a1283	00030000-556e-dee6-a4e6-9ef84c4ffdcb
00020000-556e-dee6-fd23-f9370af8fe31	00030000-556e-dee6-462b-8c66c0bc8635
00020000-556e-dee6-fd23-f9370af8fe31	00030000-556e-dee6-a4e6-9ef84c4ffdcb
\.


--
-- TOC entry 2803 (class 0 OID 6190390)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2807 (class 0 OID 6190421)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 6190555)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2780 (class 0 OID 6190155)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-556e-dee7-737f-3e757abddf64	00040000-556e-dee6-2918-f67ea6899f24	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-556e-dee7-f99f-e46f3b549b7b	00040000-556e-dee6-2918-f67ea6899f24	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-556e-dee7-7863-0546e4e8d747	00040000-556e-dee6-2918-f67ea6899f24	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-556e-dee7-7fca-913675173795	00040000-556e-dee6-2918-f67ea6899f24	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2782 (class 0 OID 6190190)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-556e-dee5-d0f8-1ce4d455171e	8341	Adlešiči
00050000-556e-dee5-760e-c3f9632eb2b9	5270	Ajdovščina
00050000-556e-dee5-fa58-601f9bee5764	6280	Ankaran/Ancarano
00050000-556e-dee5-b5b6-fa6cfdd3da83	9253	Apače
00050000-556e-dee5-e7eb-823fbaa7bf47	8253	Artiče
00050000-556e-dee5-62f2-1c689b6e9ad0	4275	Begunje na Gorenjskem
00050000-556e-dee5-ab93-cdfa0aa2d557	1382	Begunje pri Cerknici
00050000-556e-dee5-73b8-b718197ed540	9231	Beltinci
00050000-556e-dee5-901a-41597be6d59c	2234	Benedikt
00050000-556e-dee5-9a96-3c4ff0a8a605	2345	Bistrica ob Dravi
00050000-556e-dee5-48c9-a145c56eef75	3256	Bistrica ob Sotli
00050000-556e-dee5-ab83-6ea814ea6175	8259	Bizeljsko
00050000-556e-dee5-2f7a-7382e0e97945	1223	Blagovica
00050000-556e-dee5-8a6f-d5abf535d011	8283	Blanca
00050000-556e-dee5-0ae7-24e0f4210a9a	4260	Bled
00050000-556e-dee5-b6dc-1304015e18be	4273	Blejska Dobrava
00050000-556e-dee5-0972-b4d722b4fd6b	9265	Bodonci
00050000-556e-dee5-3000-58e69f110770	9222	Bogojina
00050000-556e-dee5-70b5-8684c6c19b91	4263	Bohinjska Bela
00050000-556e-dee5-9769-953890822ce5	4264	Bohinjska Bistrica
00050000-556e-dee5-e45a-2161cb285525	4265	Bohinjsko jezero
00050000-556e-dee5-9d52-139aebafb575	1353	Borovnica
00050000-556e-dee5-b89d-c7ff750f0d4e	8294	Boštanj
00050000-556e-dee5-ac67-03a7bd86aea0	5230	Bovec
00050000-556e-dee5-7cf7-53e83e66d6c2	5295	Branik
00050000-556e-dee5-a1b0-a585123f4ca2	3314	Braslovče
00050000-556e-dee5-2575-82856a947ff0	5223	Breginj
00050000-556e-dee5-a687-7d8a5bb453e7	8280	Brestanica
00050000-556e-dee5-9664-5a14a980186f	2354	Bresternica
00050000-556e-dee5-56bf-9da68e696428	4243	Brezje
00050000-556e-dee5-4ae3-4cfb64e9727e	1351	Brezovica pri Ljubljani
00050000-556e-dee5-9325-5b27e1ad7412	8250	Brežice
00050000-556e-dee5-c254-c2b7c29e8854	4210	Brnik - Aerodrom
00050000-556e-dee5-98b1-b039d514c22c	8321	Brusnice
00050000-556e-dee5-9973-6acc8cb9b1b3	3255	Buče
00050000-556e-dee5-4d55-a228f402cdb2	8276	Bučka 
00050000-556e-dee5-b57b-35160462a153	9261	Cankova
00050000-556e-dee5-ffe9-4d3b14bc8211	3000	Celje 
00050000-556e-dee5-05e5-49f13b491181	3001	Celje - poštni predali
00050000-556e-dee5-3ac9-186ee6a105ad	4207	Cerklje na Gorenjskem
00050000-556e-dee5-4d50-e722fbfa1177	8263	Cerklje ob Krki
00050000-556e-dee5-f223-b169eff69f7f	1380	Cerknica
00050000-556e-dee5-1eff-87e5f225d691	5282	Cerkno
00050000-556e-dee5-212b-fbe482aa2ffc	2236	Cerkvenjak
00050000-556e-dee5-b3cc-f5ecc4012509	2215	Ceršak
00050000-556e-dee5-3d56-ef4595e8caac	2326	Cirkovce
00050000-556e-dee5-6a6a-62199c453c00	2282	Cirkulane
00050000-556e-dee5-5703-89afed45166c	5273	Col
00050000-556e-dee5-b259-8030a47bf86a	8251	Čatež ob Savi
00050000-556e-dee5-6f6f-3d11a303aec1	1413	Čemšenik
00050000-556e-dee5-6dac-942cd5479539	5253	Čepovan
00050000-556e-dee5-bec5-73098dcae63d	9232	Črenšovci
00050000-556e-dee5-76e5-350081e2bc48	2393	Črna na Koroškem
00050000-556e-dee5-c89f-7d5d14f4a4a0	6275	Črni Kal
00050000-556e-dee5-2476-2b4bd7298dea	5274	Črni Vrh nad Idrijo
00050000-556e-dee5-0539-7011ef5f027e	5262	Črniče
00050000-556e-dee5-1a6d-50956ce27104	8340	Črnomelj
00050000-556e-dee5-9c0e-bd6345330724	6271	Dekani
00050000-556e-dee5-776f-afd8c7c65842	5210	Deskle
00050000-556e-dee5-2cc1-e42696a22abe	2253	Destrnik
00050000-556e-dee5-5247-53a945d0f816	6215	Divača
00050000-556e-dee5-8643-0c6255de11e5	1233	Dob
00050000-556e-dee5-0eb2-6773f4395d85	3224	Dobje pri Planini
00050000-556e-dee5-1909-7d7085a98961	8257	Dobova
00050000-556e-dee5-75c1-76c0815f0dce	1423	Dobovec
00050000-556e-dee5-0b60-368db47c3fb2	5263	Dobravlje
00050000-556e-dee5-ed48-c9e86626f770	3204	Dobrna
00050000-556e-dee5-f516-cb47716313b8	8211	Dobrnič
00050000-556e-dee5-233e-bc1e0b079ea7	1356	Dobrova
00050000-556e-dee5-34e9-555cc17d95a7	9223	Dobrovnik/Dobronak 
00050000-556e-dee5-3834-678249f069cb	5212	Dobrovo v Brdih
00050000-556e-dee5-b239-13cfcc950742	1431	Dol pri Hrastniku
00050000-556e-dee5-c270-c4f1797d70ec	1262	Dol pri Ljubljani
00050000-556e-dee5-7e88-a3a9b8851c71	1273	Dole pri Litiji
00050000-556e-dee5-adb9-63997aebd67d	1331	Dolenja vas
00050000-556e-dee5-8284-99f4c4d46acb	8350	Dolenjske Toplice
00050000-556e-dee5-af79-992331b3399d	1230	Domžale
00050000-556e-dee5-598f-2acfd65b05e7	2252	Dornava
00050000-556e-dee5-a58f-01be07420315	5294	Dornberk
00050000-556e-dee5-3d57-08b682a49db2	1319	Draga
00050000-556e-dee5-cc00-cb979f34e542	8343	Dragatuš
00050000-556e-dee5-7d35-33cc2d8eaa39	3222	Dramlje
00050000-556e-dee5-cb60-d7a7161a83ae	2370	Dravograd
00050000-556e-dee5-ee45-9ed56e8e98ee	4203	Duplje
00050000-556e-dee5-0de2-8c3497e02eef	6221	Dutovlje
00050000-556e-dee5-23c0-9bcdcbc8be7f	8361	Dvor
00050000-556e-dee5-30c9-eb33b6a5aedd	2343	Fala
00050000-556e-dee5-91b0-bbed5ea47cb9	9208	Fokovci
00050000-556e-dee5-2b9a-46d582b370ff	2313	Fram
00050000-556e-dee5-c972-7e9dc0246d53	3213	Frankolovo
00050000-556e-dee5-5e21-240bd3423afe	1274	Gabrovka
00050000-556e-dee5-effa-a3b1d286b8ef	8254	Globoko
00050000-556e-dee5-363c-1db03ba43d7e	5275	Godovič
00050000-556e-dee5-749e-8df9116f6acc	4204	Golnik
00050000-556e-dee5-894c-56f8a52642d2	3303	Gomilsko
00050000-556e-dee5-3b33-360a94e6e834	4224	Gorenja vas
00050000-556e-dee5-9612-3fd36033f3d5	3263	Gorica pri Slivnici
00050000-556e-dee5-5a4a-28a921e6fd58	2272	Gorišnica
00050000-556e-dee5-869d-e947aa1ded8a	9250	Gornja Radgona
00050000-556e-dee5-fe74-8d3890d73b23	3342	Gornji Grad
00050000-556e-dee5-aad1-6ef5b3f7acf1	4282	Gozd Martuljek
00050000-556e-dee5-9b01-ef4d442b79ab	6272	Gračišče
00050000-556e-dee5-3155-99253b23392a	9264	Grad
00050000-556e-dee5-d03c-e25e3448e273	8332	Gradac
00050000-556e-dee5-45ff-481bb2361c81	1384	Grahovo
00050000-556e-dee5-b58c-969e506971c1	5242	Grahovo ob Bači
00050000-556e-dee5-bd69-b33498128368	5251	Grgar
00050000-556e-dee5-19b0-2caca729defe	3302	Griže
00050000-556e-dee5-067f-1ed32dbc0495	3231	Grobelno
00050000-556e-dee5-5c8d-223656b1168f	1290	Grosuplje
00050000-556e-dee5-91c3-222efebf1032	2288	Hajdina
00050000-556e-dee5-7202-c1acc9cf9d37	8362	Hinje
00050000-556e-dee5-9927-a4c2e12b1646	2311	Hoče
00050000-556e-dee5-4479-ce2bc9b6faea	9205	Hodoš/Hodos
00050000-556e-dee5-ca70-5b9eb2142425	1354	Horjul
00050000-556e-dee5-770e-ab2d33389b9f	1372	Hotedršica
00050000-556e-dee5-6912-cbc7e7204a59	1430	Hrastnik
00050000-556e-dee5-13b6-24ee873a0a75	6225	Hruševje
00050000-556e-dee5-5b13-0d1dc85834f9	4276	Hrušica
00050000-556e-dee5-5f65-c0c07e7691b0	5280	Idrija
00050000-556e-dee5-8be5-df109be570f0	1292	Ig
00050000-556e-dee5-ff00-2cccf8be4040	6250	Ilirska Bistrica
00050000-556e-dee5-35e8-e0c238ced89a	6251	Ilirska Bistrica-Trnovo
00050000-556e-dee5-3eac-357f06cd3e1f	1295	Ivančna Gorica
00050000-556e-dee5-abd6-add94b4d337c	2259	Ivanjkovci
00050000-556e-dee5-f721-dca47f23c7fb	1411	Izlake
00050000-556e-dee5-8e7e-9b173774703f	6310	Izola/Isola
00050000-556e-dee5-c054-2acab1ff3ef8	2222	Jakobski Dol
00050000-556e-dee5-54b2-3c463cb7a37d	2221	Jarenina
00050000-556e-dee5-b90e-c443efd0997e	6254	Jelšane
00050000-556e-dee5-c352-6c59221466e8	4270	Jesenice
00050000-556e-dee5-f52c-fdd108a05386	8261	Jesenice na Dolenjskem
00050000-556e-dee5-dd0c-86b6eff4e1c5	3273	Jurklošter
00050000-556e-dee5-963c-7dacec4c9135	2223	Jurovski Dol
00050000-556e-dee5-327f-ae186ac4a7a1	2256	Juršinci
00050000-556e-dee5-9236-22759ec3340a	5214	Kal nad Kanalom
00050000-556e-dee5-5917-79d81b45a436	3233	Kalobje
00050000-556e-dee5-9864-c648b0653ea8	4246	Kamna Gorica
00050000-556e-dee5-f769-cec2b90d636b	2351	Kamnica
00050000-556e-dee5-e218-f0f0b9141227	1241	Kamnik
00050000-556e-dee5-05d1-feadfb6881bf	5213	Kanal
00050000-556e-dee5-a059-734a1f6f08bb	8258	Kapele
00050000-556e-dee5-bd50-bf1193cdf89d	2362	Kapla
00050000-556e-dee5-b7b2-0b696abeff6a	2325	Kidričevo
00050000-556e-dee5-5230-262b0305e73f	1412	Kisovec
00050000-556e-dee5-e078-1eeb83179dcb	6253	Knežak
00050000-556e-dee5-ae31-319b1a3d694d	5222	Kobarid
00050000-556e-dee5-3a35-daaa2074370b	9227	Kobilje
00050000-556e-dee5-44f0-4625bcd7930c	1330	Kočevje
00050000-556e-dee5-a18a-27c6feaa7d32	1338	Kočevska Reka
00050000-556e-dee5-4354-832ae6262625	2276	Kog
00050000-556e-dee5-c71d-50a03a415bd4	5211	Kojsko
00050000-556e-dee5-a859-a5a57cf32efc	6223	Komen
00050000-556e-dee5-0db0-932be6d49422	1218	Komenda
00050000-556e-dee5-e68e-a58d06add784	6000	Koper/Capodistria 
00050000-556e-dee5-92e8-2e2d77f3e546	6001	Koper/Capodistria - poštni predali
00050000-556e-dee5-d2c1-3a977c49b64f	8282	Koprivnica
00050000-556e-dee5-9947-d38c7d7bd933	5296	Kostanjevica na Krasu
00050000-556e-dee5-1cd8-35609a1e1be4	8311	Kostanjevica na Krki
00050000-556e-dee5-c471-7769f17b1c46	1336	Kostel
00050000-556e-dee5-f600-670d434ec740	6256	Košana
00050000-556e-dee5-35c9-13a7f85539e4	2394	Kotlje
00050000-556e-dee5-b0db-9c1968acde51	6240	Kozina
00050000-556e-dee5-426f-c11923f053f2	3260	Kozje
00050000-556e-dee5-04da-05fab08bb026	4000	Kranj 
00050000-556e-dee5-5a66-801f69135dd5	4001	Kranj - poštni predali
00050000-556e-dee5-4c7f-21494238c541	4280	Kranjska Gora
00050000-556e-dee5-db8a-df8d250f5cfb	1281	Kresnice
00050000-556e-dee5-24a2-1dbcb965ac4d	4294	Križe
00050000-556e-dee5-7346-2d7fb915009b	9206	Križevci
00050000-556e-dee5-88de-3b4110d5b389	9242	Križevci pri Ljutomeru
00050000-556e-dee5-a087-335a9ce2a8a3	1301	Krka
00050000-556e-dee5-6ca7-48273aaccd31	8296	Krmelj
00050000-556e-dee5-df2e-a8138721be22	4245	Kropa
00050000-556e-dee5-9b8c-e52d7a92e4c1	8262	Krška vas
00050000-556e-dee5-617d-626d27fa2a6f	8270	Krško
00050000-556e-dee5-403c-085e64a9c7c5	9263	Kuzma
00050000-556e-dee5-dc44-0a5e452e564c	2318	Laporje
00050000-556e-dee5-1a4c-ed9672431931	3270	Laško
00050000-556e-dee5-8261-ef97d7cb9933	1219	Laze v Tuhinju
00050000-556e-dee5-fdc8-426d309d4e2c	2230	Lenart v Slovenskih goricah
00050000-556e-dee5-8132-c68f719a1529	9220	Lendava/Lendva
00050000-556e-dee5-7b27-f20cc0dd172f	4248	Lesce
00050000-556e-dee5-1837-0a9e8ce241d1	3261	Lesično
00050000-556e-dee5-38fb-e20c5a57677c	8273	Leskovec pri Krškem
00050000-556e-dee5-45c1-8c883dd92221	2372	Libeliče
00050000-556e-dee5-84f0-7591d0ca001a	2341	Limbuš
00050000-556e-dee5-d281-3ac594326eb3	1270	Litija
00050000-556e-dee5-86ef-fba808aa6ddc	3202	Ljubečna
00050000-556e-dee5-ac4a-baa69fcb95c3	1000	Ljubljana 
00050000-556e-dee5-8222-9b3082be165d	1001	Ljubljana - poštni predali
00050000-556e-dee5-2246-e39a1f29af1b	1231	Ljubljana - Črnuče
00050000-556e-dee5-3381-2360eb19e49a	1261	Ljubljana - Dobrunje
00050000-556e-dee5-28d3-b8e5ea550b44	1260	Ljubljana - Polje
00050000-556e-dee5-2270-686710da19e4	1210	Ljubljana - Šentvid
00050000-556e-dee5-39dd-e2f81ec3cd9e	1211	Ljubljana - Šmartno
00050000-556e-dee5-0b9d-7a6053ec636c	3333	Ljubno ob Savinji
00050000-556e-dee5-ae39-779c05c2a811	9240	Ljutomer
00050000-556e-dee5-0d2f-1cfef473befe	3215	Loče
00050000-556e-dee5-b7b4-5c5eafc88c6f	5231	Log pod Mangartom
00050000-556e-dee5-58dd-04706b761d04	1358	Log pri Brezovici
00050000-556e-dee5-4207-cec22036aa2c	1370	Logatec
00050000-556e-dee5-1a33-a5912aa3ef1b	1371	Logatec
00050000-556e-dee5-fa94-12d7c5986500	1434	Loka pri Zidanem Mostu
00050000-556e-dee5-4906-606a661c9f86	3223	Loka pri Žusmu
00050000-556e-dee5-515d-045d045ba16f	6219	Lokev
00050000-556e-dee5-ce34-2cdc8b70ff4a	1318	Loški Potok
00050000-556e-dee5-4067-d6c655a5e464	2324	Lovrenc na Dravskem polju
00050000-556e-dee5-8361-29181d63f097	2344	Lovrenc na Pohorju
00050000-556e-dee5-8781-0edad03cd194	3334	Luče
00050000-556e-dee5-3e13-35a5afa53d0c	1225	Lukovica
00050000-556e-dee5-f595-15367e7d71d2	9202	Mačkovci
00050000-556e-dee5-3d5e-2f5485bdf8a4	2322	Majšperk
00050000-556e-dee5-2508-c92dc332abd0	2321	Makole
00050000-556e-dee5-045c-a3d22153d388	9243	Mala Nedelja
00050000-556e-dee5-deb9-946bf912528f	2229	Malečnik
00050000-556e-dee5-ebb4-082a8fcff017	6273	Marezige
00050000-556e-dee5-3618-5243d602bfce	2000	Maribor 
00050000-556e-dee5-37aa-9062b0e4c154	2001	Maribor - poštni predali
00050000-556e-dee5-668d-6e656e54f4fc	2206	Marjeta na Dravskem polju
00050000-556e-dee5-eefd-27b900fe4cba	2281	Markovci
00050000-556e-dee5-6cfc-68983e1daf77	9221	Martjanci
00050000-556e-dee5-bc8a-43f3db69dc20	6242	Materija
00050000-556e-dee5-1f0e-f5792160fb5a	4211	Mavčiče
00050000-556e-dee5-1761-2ef10a3ba0f6	1215	Medvode
00050000-556e-dee5-bb92-c0e18018aea9	1234	Mengeš
00050000-556e-dee5-ab9e-ebbf148ccc0f	8330	Metlika
00050000-556e-dee5-053f-cc16a416ec76	2392	Mežica
00050000-556e-dee5-dd26-90894eaa5049	2204	Miklavž na Dravskem polju
00050000-556e-dee5-9260-88b2aeecf864	2275	Miklavž pri Ormožu
00050000-556e-dee5-25ae-acc207dd1dff	5291	Miren
00050000-556e-dee5-bbe1-e94a16bcca5d	8233	Mirna
00050000-556e-dee5-bb36-8328a100ed26	8216	Mirna Peč
00050000-556e-dee5-f16c-7535df7615ea	2382	Mislinja
00050000-556e-dee5-5429-23c78b04b001	4281	Mojstrana
00050000-556e-dee5-f31d-7856e52ea0a5	8230	Mokronog
00050000-556e-dee5-8b02-6cb057e5dd43	1251	Moravče
00050000-556e-dee5-b8f7-a55f3d285a97	9226	Moravske Toplice
00050000-556e-dee5-703e-ad73f26c5237	5216	Most na Soči
00050000-556e-dee5-1032-cf9c413a41f0	1221	Motnik
00050000-556e-dee5-24bf-43fd0c0e5510	3330	Mozirje
00050000-556e-dee5-65b6-a574ef5538d3	9000	Murska Sobota 
00050000-556e-dee5-3264-762533f7898c	9001	Murska Sobota - poštni predali
00050000-556e-dee5-0c3f-5297bbc5dfa7	2366	Muta
00050000-556e-dee5-ed63-96a6d512b926	4202	Naklo
00050000-556e-dee5-1b80-ea6efc6a0145	3331	Nazarje
00050000-556e-dee5-c5e0-36f53d4bb502	1357	Notranje Gorice
00050000-556e-dee5-b5de-6444c4d19ab3	3203	Nova Cerkev
00050000-556e-dee5-b14e-7e73de322bac	5000	Nova Gorica 
00050000-556e-dee5-739c-e7ef8f63ef19	5001	Nova Gorica - poštni predali
00050000-556e-dee6-8ae7-eab33f237481	1385	Nova vas
00050000-556e-dee6-3f27-15add942f89b	8000	Novo mesto
00050000-556e-dee6-3b96-88c085853b5f	8001	Novo mesto - poštni predali
00050000-556e-dee6-5ba9-2c2c35316f8a	6243	Obrov
00050000-556e-dee6-c6c6-238dd0ce54bf	9233	Odranci
00050000-556e-dee6-ab0b-bcf6eac60364	2317	Oplotnica
00050000-556e-dee6-58db-5c37234b74a0	2312	Orehova vas
00050000-556e-dee6-08d1-e8ee050ddeef	2270	Ormož
00050000-556e-dee6-35c2-bf671197d035	1316	Ortnek
00050000-556e-dee6-e28d-761b210a8cb7	1337	Osilnica
00050000-556e-dee6-c748-9e9205437580	8222	Otočec
00050000-556e-dee6-0f40-f62d8638069c	2361	Ožbalt
00050000-556e-dee6-7462-a2464187b14f	2231	Pernica
00050000-556e-dee6-d2f5-7090b3a44f41	2211	Pesnica pri Mariboru
00050000-556e-dee6-51f3-5a397753f17d	9203	Petrovci
00050000-556e-dee6-d670-101483877002	3301	Petrovče
00050000-556e-dee6-e686-445117a18877	6330	Piran/Pirano
00050000-556e-dee6-1b76-d08a1cdb9ffc	8255	Pišece
00050000-556e-dee6-f4d4-0b3a8660c1b2	6257	Pivka
00050000-556e-dee6-b631-a41cf7bf416b	6232	Planina
00050000-556e-dee6-7e23-e192c7502d14	3225	Planina pri Sevnici
00050000-556e-dee6-d477-20ef3cf8af74	6276	Pobegi
00050000-556e-dee6-6845-cc0d867f9d5a	8312	Podbočje
00050000-556e-dee6-861a-43f5f08f02b3	5243	Podbrdo
00050000-556e-dee6-cba4-7cdd8936c5a0	3254	Podčetrtek
00050000-556e-dee6-5f2a-b8b9d7cd4655	2273	Podgorci
00050000-556e-dee6-9ab9-4158ef28765e	6216	Podgorje
00050000-556e-dee6-5f48-d0a1fdb04765	2381	Podgorje pri Slovenj Gradcu
00050000-556e-dee6-7098-b30bfcc7738b	6244	Podgrad
00050000-556e-dee6-b67d-8d6b9b435b21	1414	Podkum
00050000-556e-dee6-182c-e99536fac438	2286	Podlehnik
00050000-556e-dee6-c79c-a510e69c429f	5272	Podnanos
00050000-556e-dee6-22e1-5fdde9372dc1	4244	Podnart
00050000-556e-dee6-eb1a-34ce34fa4011	3241	Podplat
00050000-556e-dee6-01f5-5888af98d71b	3257	Podsreda
00050000-556e-dee6-a768-78b5a78172c9	2363	Podvelka
00050000-556e-dee6-270a-93f97405990e	2208	Pohorje
00050000-556e-dee6-201c-6f9fd7666271	2257	Polenšak
00050000-556e-dee6-12be-b8d183ed899a	1355	Polhov Gradec
00050000-556e-dee6-142d-d1852cc2f568	4223	Poljane nad Škofjo Loko
00050000-556e-dee6-ca5f-cbb42161ac3b	2319	Poljčane
00050000-556e-dee6-16eb-5fcf92318db4	1272	Polšnik
00050000-556e-dee6-23eb-e7e2b9bc1f36	3313	Polzela
00050000-556e-dee6-c900-f92265f337b2	3232	Ponikva
00050000-556e-dee6-db12-282f4ead05f9	6320	Portorož/Portorose
00050000-556e-dee6-9062-59a7b05f14a0	6230	Postojna
00050000-556e-dee6-a1cb-c0fdf31d3af5	2331	Pragersko
00050000-556e-dee6-90c5-6ae99fb98424	3312	Prebold
00050000-556e-dee6-60b2-c7f0a440e1c4	4205	Preddvor
00050000-556e-dee6-91bf-76ed959b4cd4	6255	Prem
00050000-556e-dee6-6367-26df0c452b5b	1352	Preserje
00050000-556e-dee6-4ad4-58096d96e816	6258	Prestranek
00050000-556e-dee6-051a-1205758a9bdc	2391	Prevalje
00050000-556e-dee6-8a27-ab1fb7d30286	3262	Prevorje
00050000-556e-dee6-d387-0e8fe874f853	1276	Primskovo 
00050000-556e-dee6-a8f6-44de96c125d7	3253	Pristava pri Mestinju
00050000-556e-dee6-2cd5-ebd73a861dc8	9207	Prosenjakovci/Partosfalva
00050000-556e-dee6-b272-a6d32949600c	5297	Prvačina
00050000-556e-dee6-025e-e2a70d0e8712	2250	Ptuj
00050000-556e-dee6-2ae4-fb89b7341646	2323	Ptujska Gora
00050000-556e-dee6-64e7-ce6e846463ff	9201	Puconci
00050000-556e-dee6-1842-57b12e24eb12	2327	Rače
00050000-556e-dee6-7dcc-722df8900993	1433	Radeče
00050000-556e-dee6-1cd2-45e10176de97	9252	Radenci
00050000-556e-dee6-906e-e19ccf8dfef1	2360	Radlje ob Dravi
00050000-556e-dee6-4743-b6dff2d0f5be	1235	Radomlje
00050000-556e-dee6-b970-1b026fcc567a	4240	Radovljica
00050000-556e-dee6-3caa-d28f67c863c5	8274	Raka
00050000-556e-dee6-e824-f79a66a6ccf5	1381	Rakek
00050000-556e-dee6-c7d9-a839bb34e225	4283	Rateče - Planica
00050000-556e-dee6-b5d6-dc67f429af2f	2390	Ravne na Koroškem
00050000-556e-dee6-a0dd-086f364f590b	9246	Razkrižje
00050000-556e-dee6-9330-32876fc67d6d	3332	Rečica ob Savinji
00050000-556e-dee6-143e-4a3444b45cc9	5292	Renče
00050000-556e-dee6-20ce-0bf9e41774d6	1310	Ribnica
00050000-556e-dee6-382e-e3b987c7adae	2364	Ribnica na Pohorju
00050000-556e-dee6-014c-5c6ae9441311	3272	Rimske Toplice
00050000-556e-dee6-1d6f-d30c3b41dcdf	1314	Rob
00050000-556e-dee6-6a1d-ff24eccab4a4	5215	Ročinj
00050000-556e-dee6-9c33-2d582c241ba1	3250	Rogaška Slatina
00050000-556e-dee6-f71e-fb2178c7fc3c	9262	Rogašovci
00050000-556e-dee6-29da-620881b8ab85	3252	Rogatec
00050000-556e-dee6-03aa-0275d1440210	1373	Rovte
00050000-556e-dee6-53fa-4838fe48d372	2342	Ruše
00050000-556e-dee6-e021-3a1a4d25d6a1	1282	Sava
00050000-556e-dee6-a5b4-961cae50d9ed	6333	Sečovlje/Sicciole
00050000-556e-dee6-c066-9336fbd0b0cb	4227	Selca
00050000-556e-dee6-64cb-bf51e6bb7c1d	2352	Selnica ob Dravi
00050000-556e-dee6-a373-3cbf2e4d123c	8333	Semič
00050000-556e-dee6-76f7-9922bf5d43c4	8281	Senovo
00050000-556e-dee6-faaf-8ac79e278608	6224	Senožeče
00050000-556e-dee6-7942-a7dc76516afc	8290	Sevnica
00050000-556e-dee6-16c2-eae1a68f72c4	6210	Sežana
00050000-556e-dee6-abdc-dff0b04a2942	2214	Sladki Vrh
00050000-556e-dee6-ec62-b2e793d80b59	5283	Slap ob Idrijci
00050000-556e-dee6-fdc2-785dde18a794	2380	Slovenj Gradec
00050000-556e-dee6-d4a5-fdbb7e14df37	2310	Slovenska Bistrica
00050000-556e-dee6-5f44-789d192d6b82	3210	Slovenske Konjice
00050000-556e-dee6-50f4-623262009c59	1216	Smlednik
00050000-556e-dee6-dbb6-ecdd1eca10e1	5232	Soča
00050000-556e-dee6-8809-99ac7c0e59ae	1317	Sodražica
00050000-556e-dee6-c34e-4cf3607b2778	3335	Solčava
00050000-556e-dee6-42b2-b80b7bd6e7f0	5250	Solkan
00050000-556e-dee6-03e3-4cc3423263d9	4229	Sorica
00050000-556e-dee6-ee5a-9a0aadd40a75	4225	Sovodenj
00050000-556e-dee6-1a3f-b3f902fee3fc	5281	Spodnja Idrija
00050000-556e-dee6-ab46-d4e748e63262	2241	Spodnji Duplek
00050000-556e-dee6-b2f2-eaead749c9aa	9245	Spodnji Ivanjci
00050000-556e-dee6-b79f-f68b92d6a071	2277	Središče ob Dravi
00050000-556e-dee6-fbb8-86ac471a957f	4267	Srednja vas v Bohinju
00050000-556e-dee6-defc-b7726a9aaf23	8256	Sromlje 
00050000-556e-dee6-768a-e6785a40524d	5224	Srpenica
00050000-556e-dee6-7469-57f20523f9eb	1242	Stahovica
00050000-556e-dee6-6928-e33b8f335da1	1332	Stara Cerkev
00050000-556e-dee6-ad0b-03549518f65f	8342	Stari trg ob Kolpi
00050000-556e-dee6-0885-a7157591430c	1386	Stari trg pri Ložu
00050000-556e-dee6-278f-b04b21d82228	2205	Starše
00050000-556e-dee6-abb3-b6f9f9d861ee	2289	Stoperce
00050000-556e-dee6-5c87-dabc3ee94055	8322	Stopiče
00050000-556e-dee6-6aa2-895c757bc65c	3206	Stranice
00050000-556e-dee6-30c8-e02e95dbd3a4	8351	Straža
00050000-556e-dee6-37e2-be789c516b4a	1313	Struge
00050000-556e-dee6-18a6-58deaa7da65e	8293	Studenec
00050000-556e-dee6-3285-ea78012f4232	8331	Suhor
00050000-556e-dee6-f6b9-52621d4dd671	2233	Sv. Ana v Slovenskih goricah
00050000-556e-dee6-08a3-1f065deeb6f7	2235	Sv. Trojica v Slovenskih goricah
00050000-556e-dee6-66af-fc3d963afb39	2353	Sveti Duh na Ostrem Vrhu
00050000-556e-dee6-9bed-646b0365a28e	9244	Sveti Jurij ob Ščavnici
00050000-556e-dee6-38dd-918304c2e3b7	3264	Sveti Štefan
00050000-556e-dee6-1dab-2f1ecb65a14f	2258	Sveti Tomaž
00050000-556e-dee6-ee51-99f5e0ffbddc	9204	Šalovci
00050000-556e-dee6-94a9-214185881632	5261	Šempas
00050000-556e-dee6-e2a2-1b12cd590e60	5290	Šempeter pri Gorici
00050000-556e-dee6-8a48-0bf522d49792	3311	Šempeter v Savinjski dolini
00050000-556e-dee6-0edd-b86639524aee	4208	Šenčur
00050000-556e-dee6-adc5-a93beeb6e2a5	2212	Šentilj v Slovenskih goricah
00050000-556e-dee6-4525-f2216076ce8b	8297	Šentjanž
00050000-556e-dee6-ad98-0cf96df2bc7b	2373	Šentjanž pri Dravogradu
00050000-556e-dee6-ed48-d9aae6f00b88	8310	Šentjernej
00050000-556e-dee6-4ed0-cd499d64e7fa	3230	Šentjur
00050000-556e-dee6-788f-98a305c3ded8	3271	Šentrupert
00050000-556e-dee6-4e58-3bfbac0e0207	8232	Šentrupert
00050000-556e-dee6-af61-b3767148c22b	1296	Šentvid pri Stični
00050000-556e-dee6-ad31-9fb39111ce1e	8275	Škocjan
00050000-556e-dee6-1ca1-a4b6583ed332	6281	Škofije
00050000-556e-dee6-285d-58e8bcd3983a	4220	Škofja Loka
00050000-556e-dee6-cf9d-cc14f19d0b9c	3211	Škofja vas
00050000-556e-dee6-115a-2ef0364f2361	1291	Škofljica
00050000-556e-dee6-898a-9a14360f26d5	6274	Šmarje
00050000-556e-dee6-f5c8-5112d376635f	1293	Šmarje - Sap
00050000-556e-dee6-a706-e2c59a05af84	3240	Šmarje pri Jelšah
00050000-556e-dee6-88fe-70a8e25f35d5	8220	Šmarješke Toplice
00050000-556e-dee6-0026-da04f256d27e	2315	Šmartno na Pohorju
00050000-556e-dee6-0075-cb6691319bd4	3341	Šmartno ob Dreti
00050000-556e-dee6-3f28-2498cdacfc0a	3327	Šmartno ob Paki
00050000-556e-dee6-705f-3a4fdcb0d95f	1275	Šmartno pri Litiji
00050000-556e-dee6-1173-5a59e122a5af	2383	Šmartno pri Slovenj Gradcu
00050000-556e-dee6-b712-20848d1d86e2	3201	Šmartno v Rožni dolini
00050000-556e-dee6-eaf5-ab559d78f8dc	3325	Šoštanj
00050000-556e-dee6-748d-571aed13c403	6222	Štanjel
00050000-556e-dee6-5149-c5528be17358	3220	Štore
00050000-556e-dee6-326e-f8cedc966b92	3304	Tabor
00050000-556e-dee6-71f4-3d61e6bb0e61	3221	Teharje
00050000-556e-dee6-3116-717b3b805e82	9251	Tišina
00050000-556e-dee6-9ef7-70758872bc39	5220	Tolmin
00050000-556e-dee6-7b0a-30d70f8e7240	3326	Topolšica
00050000-556e-dee6-eb81-feb561666f99	2371	Trbonje
00050000-556e-dee6-d804-6960053e8bb4	1420	Trbovlje
00050000-556e-dee6-e91f-7bb570e80409	8231	Trebelno 
00050000-556e-dee6-5c8a-9c4c8bfc399d	8210	Trebnje
00050000-556e-dee6-1df0-011a4fe55eff	5252	Trnovo pri Gorici
00050000-556e-dee6-d1b8-ccb970f78a87	2254	Trnovska vas
00050000-556e-dee6-eafb-8455effa00b8	1222	Trojane
00050000-556e-dee6-d923-6e5c66e115ee	1236	Trzin
00050000-556e-dee6-26da-c6dbc9ee8ae1	4290	Tržič
00050000-556e-dee6-0e84-645161192cd8	8295	Tržišče
00050000-556e-dee6-42b6-e094401c0f6b	1311	Turjak
00050000-556e-dee6-d93d-89f23f6dae45	9224	Turnišče
00050000-556e-dee6-6505-83e9a0814afe	8323	Uršna sela
00050000-556e-dee6-2017-1b0595ccaa2d	1252	Vače
00050000-556e-dee6-cd88-dedc5b4ea204	3320	Velenje 
00050000-556e-dee6-4135-cdf310dadfc9	3322	Velenje - poštni predali
00050000-556e-dee6-37ce-d9e0dc76fa6a	8212	Velika Loka
00050000-556e-dee6-5576-54af614f32e5	2274	Velika Nedelja
00050000-556e-dee6-e092-94377e35bb35	9225	Velika Polana
00050000-556e-dee6-2041-316e581a35b2	1315	Velike Lašče
00050000-556e-dee6-65df-a026d5a7fcd7	8213	Veliki Gaber
00050000-556e-dee6-cd1b-7e20f9313d35	9241	Veržej
00050000-556e-dee6-328f-42cda55b2dd8	1312	Videm - Dobrepolje
00050000-556e-dee6-f6bc-7cf4cf5e3db2	2284	Videm pri Ptuju
00050000-556e-dee6-45ea-6ff8a5ee8af9	8344	Vinica
00050000-556e-dee6-a162-43aa3a92238c	5271	Vipava
00050000-556e-dee6-f726-e4fb4aeecf29	4212	Visoko
00050000-556e-dee6-92bc-e7b72de175b9	1294	Višnja Gora
00050000-556e-dee6-f26c-8cc17875ed88	3205	Vitanje
00050000-556e-dee6-36e3-6474219234ca	2255	Vitomarci
00050000-556e-dee6-5bc0-37a7f552c53b	1217	Vodice
00050000-556e-dee6-898b-ef57168dec06	3212	Vojnik\t
00050000-556e-dee6-88c1-57f80c27fc0c	5293	Volčja Draga
00050000-556e-dee6-4510-b7eb41f7ffc9	2232	Voličina
00050000-556e-dee6-5de8-ab89741d09a4	3305	Vransko
00050000-556e-dee6-9e9c-2a90923eb5f1	6217	Vremski Britof
00050000-556e-dee6-f871-aa84995d98d4	1360	Vrhnika
00050000-556e-dee6-d4c5-a405395ba6a1	2365	Vuhred
00050000-556e-dee6-0885-77fd78304c8a	2367	Vuzenica
00050000-556e-dee6-df58-a7d892a93a77	8292	Zabukovje 
00050000-556e-dee6-4879-1881ccee697e	1410	Zagorje ob Savi
00050000-556e-dee6-9662-8715def0ec08	1303	Zagradec
00050000-556e-dee6-cf07-6dedf8fdfff4	2283	Zavrč
00050000-556e-dee6-b791-9d377583e641	8272	Zdole 
00050000-556e-dee6-c80e-d78c9ff5d63a	4201	Zgornja Besnica
00050000-556e-dee6-b0ab-d99ae0d175f3	2242	Zgornja Korena
00050000-556e-dee6-0c88-643244abec98	2201	Zgornja Kungota
00050000-556e-dee6-6877-22aed56a2e36	2316	Zgornja Ložnica
00050000-556e-dee6-4640-9c71f99f8e3f	2314	Zgornja Polskava
00050000-556e-dee6-acdd-003077ec7c9d	2213	Zgornja Velka
00050000-556e-dee6-82ae-2d07f22b591d	4247	Zgornje Gorje
00050000-556e-dee6-1281-68df66237c9c	4206	Zgornje Jezersko
00050000-556e-dee6-bb0b-a57afa5d096f	2285	Zgornji Leskovec
00050000-556e-dee6-6080-1e88e6fee98d	1432	Zidani Most
00050000-556e-dee6-8197-de98c330b103	3214	Zreče
00050000-556e-dee6-10be-2fce0878401d	4209	Žabnica
00050000-556e-dee6-c399-13f7d965ac5c	3310	Žalec
00050000-556e-dee6-7a98-df1cf494f712	4228	Železniki
00050000-556e-dee6-61b2-f29c5cf06eca	2287	Žetale
00050000-556e-dee6-a38f-94c210e8821e	4226	Žiri
00050000-556e-dee6-8ac7-87c6dcac1bae	4274	Žirovnica
00050000-556e-dee6-22d0-48c1efcc77aa	8360	Žužemberk
\.


--
-- TOC entry 2799 (class 0 OID 6190364)
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
-- TOC entry 2781 (class 0 OID 6190175)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2787 (class 0 OID 6190253)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2801 (class 0 OID 6190376)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2814 (class 0 OID 6190496)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2818 (class 0 OID 6190547)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-556e-dee7-3e21-504199bd47f0	00080000-556e-dee7-7863-0546e4e8d747	0987	A
00190000-556e-dee7-34c2-35de42c68c84	00080000-556e-dee7-f99f-e46f3b549b7b	0989	A
\.


--
-- TOC entry 2825 (class 0 OID 6190659)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 6190687)
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
-- TOC entry 2826 (class 0 OID 6190668)
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
-- TOC entry 2805 (class 0 OID 6190405)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-556e-dee7-8d3e-8c672e433fac	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-556e-dee7-bb69-356714ac1082	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-556e-dee7-4228-05e5b633720f	0003	Kazinska	t	84	Kazinska dvorana
00220000-556e-dee7-6702-0baa6285773c	0004	Mali oder	t	24	Mali oder 
00220000-556e-dee7-8cf4-ac4934de14ae	0005	Komorni oder	t	15	Komorni oder
00220000-556e-dee7-f97f-f0bbc34bcc7f	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-556e-dee7-535d-ececf64669aa	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2797 (class 0 OID 6190349)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2796 (class 0 OID 6190339)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2817 (class 0 OID 6190536)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2812 (class 0 OID 6190473)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2770 (class 0 OID 6190047)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-556e-dee6-a802-b4d1159e7591	00010000-556e-dee6-1d71-28866712babf	2015-06-03 13:03:03	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO3Q0gWqXCNVS6MrPOucikNN37g/ycq0y";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2845 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2806 (class 0 OID 6190415)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2774 (class 0 OID 6190085)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-556e-dee6-cee8-bfbb8951c174	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-556e-dee6-bd2a-5e55fae7c3be	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-556e-dee6-cb48-6b09018a1283	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-556e-dee6-c8c4-8d0075e0ac50	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-556e-dee6-d64e-c7bcf64ae3a9	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-556e-dee6-fd23-f9370af8fe31	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2772 (class 0 OID 6190069)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-556e-dee6-a802-b4d1159e7591	00020000-556e-dee6-c8c4-8d0075e0ac50
00010000-556e-dee6-1d71-28866712babf	00020000-556e-dee6-c8c4-8d0075e0ac50
\.


--
-- TOC entry 2808 (class 0 OID 6190429)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2800 (class 0 OID 6190370)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2794 (class 0 OID 6190320)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 6190705)
-- Dependencies: 235
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-556e-dee6-ff91-5b5f8173c45d	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-556e-dee6-ab85-be708f4d8b54	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-556e-dee6-a6e1-c9f6f23fd3ad	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-556e-dee6-ec9f-6b60e2cb10ea	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-556e-dee6-6851-2f0625441104	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2830 (class 0 OID 6190698)
-- Dependencies: 234
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-556e-dee6-44ff-91696ac3e54e	00000000-556e-dee6-ec9f-6b60e2cb10ea	popa
00000000-556e-dee6-9578-e7953e925b48	00000000-556e-dee6-ec9f-6b60e2cb10ea	oseba
00000000-556e-dee6-0203-9a75fcbe563f	00000000-556e-dee6-ab85-be708f4d8b54	prostor
00000000-556e-dee6-d1ce-7bf85615f9db	00000000-556e-dee6-ec9f-6b60e2cb10ea	besedilo
00000000-556e-dee6-592f-9bb8bad5cdde	00000000-556e-dee6-ec9f-6b60e2cb10ea	uprizoritev
00000000-556e-dee6-dab7-10314496e2b3	00000000-556e-dee6-ec9f-6b60e2cb10ea	funkcija
00000000-556e-dee6-f887-64d572f00957	00000000-556e-dee6-ec9f-6b60e2cb10ea	tipfunkcije
00000000-556e-dee6-973e-1f50d3d8be82	00000000-556e-dee6-ec9f-6b60e2cb10ea	alternacija
00000000-556e-dee6-fe9c-ee2505752909	00000000-556e-dee6-ff91-5b5f8173c45d	pogodba
00000000-556e-dee6-b32a-3e2fe0bb581c	00000000-556e-dee6-ec9f-6b60e2cb10ea	zaposlitev
\.


--
-- TOC entry 2829 (class 0 OID 6190693)
-- Dependencies: 233
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2813 (class 0 OID 6190483)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2779 (class 0 OID 6190147)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2795 (class 0 OID 6190326)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-556e-dee7-b8ee-bb0b24d088eb	00180000-556e-dee7-d2e3-32c1790349c4	000c0000-556e-dee7-5dd7-1d7540ed3c60	00090000-556e-dee7-7e11-33faf2d13811	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556e-dee7-e0c2-c779f02e9d15	00180000-556e-dee7-d2e3-32c1790349c4	000c0000-556e-dee7-d45d-e8b88bb8c9fa	00090000-556e-dee7-ea71-fafdfee35208	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556e-dee7-c164-d3c7257b85a5	00180000-556e-dee7-d2e3-32c1790349c4	000c0000-556e-dee7-3f8d-a49adb16fe90	00090000-556e-dee7-12a9-7c05808700ff	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556e-dee7-d820-49a233328b4c	00180000-556e-dee7-d2e3-32c1790349c4	000c0000-556e-dee7-2a70-b4111371d9ab	00090000-556e-dee7-51d3-e7bc13f60761	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556e-dee7-e27f-479f8c19ae35	00180000-556e-dee7-d2e3-32c1790349c4	000c0000-556e-dee7-5cc8-60a2a2862489	00090000-556e-dee7-8b09-2f9b93e6a3e0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556e-dee7-8206-34bb9fb7f081	00180000-556e-dee7-7d26-22242f5cd49e	\N	00090000-556e-dee7-8b09-2f9b93e6a3e0	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2816 (class 0 OID 6190525)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-556e-dee6-14a7-6f569faaa0df	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-556e-dee6-2ffd-742930b7695f	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-556e-dee6-ce82-29ed0a0aacb2	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-556e-dee6-487d-d34c467dc69d	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-556e-dee6-459e-a106436e5ad7	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-556e-dee6-d148-87dba88da0f6	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-556e-dee6-46ac-418432f17f70	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-556e-dee6-8d1c-950514632afb	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-556e-dee6-70ca-9c63d0f8e8c5	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-556e-dee6-344f-a0b9fab1be20	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-556e-dee6-1baf-ecbb10588017	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-556e-dee6-170b-87a049aae573	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-556e-dee6-cd05-a6b3e2556c92	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-556e-dee6-d692-bc3feebda8b4	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-556e-dee6-72fc-857514fc30d7	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-556e-dee6-ae59-35c7c5a8d381	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2827 (class 0 OID 6190676)
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
-- TOC entry 2784 (class 0 OID 6190210)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2771 (class 0 OID 6190056)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-556e-dee6-1d71-28866712babf	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxRO0BoLFmXQFV1TzCU0TVynmTa5q2SrBIi	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-556e-dee7-09bd-df5d632c0db9	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-556e-dee7-a2e5-cb1234827970	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-556e-dee7-6ff7-375cac6623b7	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-556e-dee7-29ad-9bc50eec20c5	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-556e-dee7-284b-1308ab7fae47	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-556e-dee7-f302-cdb412bb3611	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-556e-dee6-a802-b4d1159e7591	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2821 (class 0 OID 6190581)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-556e-dee7-36b0-45c219729f3f	00160000-556e-dee7-d449-1b5fe979ece2	00150000-556e-dee6-d2c7-1169bb8ea860	00140000-556e-dee6-6448-86c31de4c51d	0001	produkcija	Sen kresne noči		Sanje	2016-02-01	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-556e-dee7-8cf4-ac4934de14ae
000e0000-556e-dee7-1d8f-cec0cbd2c38e	00160000-556e-dee7-61b9-c56c903cff45	00150000-556e-dee6-61ef-f7dc755fee89	00140000-556e-dee6-82e9-aaa6d13308ca	0002	predprodukcija-ideja	Smoletov vrt			2017-01-01	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-556e-dee7-f97f-f0bbc34bcc7f
\.


--
-- TOC entry 2789 (class 0 OID 6190272)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-556e-dee7-2194-0fd717923f4a	000e0000-556e-dee7-1d8f-cec0cbd2c38e	1	
00200000-556e-dee7-8ae1-103ca356fe96	000e0000-556e-dee7-1d8f-cec0cbd2c38e	2	
\.


--
-- TOC entry 2804 (class 0 OID 6190397)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2811 (class 0 OID 6190466)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2791 (class 0 OID 6190304)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2820 (class 0 OID 6190571)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-556e-dee6-6448-86c31de4c51d	Drama	drama (SURS 01)
00140000-556e-dee6-8779-9fa12a2d7733	Opera	opera (SURS 02)
00140000-556e-dee6-7c67-ad0e963c7788	Balet	balet (SURS 03)
00140000-556e-dee6-2b04-910036d18252	Plesne prireditve	plesne prireditve (SURS 04)
00140000-556e-dee6-434b-93dbde61c16a	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-556e-dee6-82e9-aaa6d13308ca	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-556e-dee6-0608-0b8d20585b06	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2810 (class 0 OID 6190456)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-556e-dee6-629c-6e8a0515d63c	Opera	opera
00150000-556e-dee6-542f-4bfa8965e787	Opereta	opereta
00150000-556e-dee6-4fba-42f7475ef1a7	Balet	balet
00150000-556e-dee6-8159-b3a9b67bec69	Plesne prireditve	plesne prireditve
00150000-556e-dee6-3117-68f9828ec9e3	Lutkovno gledališče	lutkovno gledališče
00150000-556e-dee6-69cb-0b9819694ab0	Raziskovalno gledališče	raziskovalno gledališče
00150000-556e-dee6-79f3-7972edd82946	Biografska drama	biografska drama
00150000-556e-dee6-d2c7-1169bb8ea860	Komedija	komedija
00150000-556e-dee6-077f-44cd2d6a78a7	Črna komedija	črna komedija
00150000-556e-dee6-1a63-c10ec478158f	E-igra	E-igra
00150000-556e-dee6-61ef-f7dc755fee89	Kriminalka	kriminalka
00150000-556e-dee6-aba4-3354b7a9655a	Musical	musical
\.


--
-- TOC entry 2364 (class 2606 OID 6190110)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 6190626)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 6190616)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 6190524)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 6190294)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 6190319)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 6190236)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 6190655)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 6190452)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 6190270)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 6190313)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 6190250)
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
-- TOC entry 2456 (class 2606 OID 6190362)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 6190389)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 6190208)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 6190119)
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
-- TOC entry 2371 (class 2606 OID 6190143)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 6190099)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2355 (class 2606 OID 6190084)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 6190395)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 6190428)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 6190566)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 6190172)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 6190196)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 6190368)
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
-- TOC entry 2386 (class 2606 OID 6190186)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 6190257)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 6190380)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 6190508)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 6190552)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 6190666)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 6190691)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 6190673)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 6190412)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 6190353)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 6190344)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 6190546)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 6190480)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 6190055)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 6190419)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2353 (class 2606 OID 6190073)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2357 (class 2606 OID 6190093)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 6190437)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 6190375)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 6190325)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 6190711)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 6190702)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 6190697)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 6190493)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 6190152)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 6190335)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 6190535)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 6190686)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 6190221)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 6190068)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 6190596)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 6190279)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 6190403)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 6190471)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 6190308)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 6190580)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 6190465)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 1259 OID 6190301)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2503 (class 1259 OID 6190494)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2504 (class 1259 OID 6190495)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2378 (class 1259 OID 6190174)
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
-- TOC entry 2469 (class 1259 OID 6190396)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2463 (class 1259 OID 6190382)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2464 (class 1259 OID 6190381)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2415 (class 1259 OID 6190280)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2491 (class 1259 OID 6190453)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2492 (class 1259 OID 6190455)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2493 (class 1259 OID 6190454)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2403 (class 1259 OID 6190252)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2404 (class 1259 OID 6190251)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2521 (class 1259 OID 6190568)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2522 (class 1259 OID 6190569)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2523 (class 1259 OID 6190570)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2529 (class 1259 OID 6190601)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2530 (class 1259 OID 6190598)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2531 (class 1259 OID 6190600)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2532 (class 1259 OID 6190599)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2393 (class 1259 OID 6190223)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2394 (class 1259 OID 6190222)
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
-- TOC entry 2369 (class 1259 OID 6190146)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2479 (class 1259 OID 6190420)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2433 (class 1259 OID 6190314)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2359 (class 1259 OID 6190100)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2360 (class 1259 OID 6190101)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2484 (class 1259 OID 6190440)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2485 (class 1259 OID 6190439)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2486 (class 1259 OID 6190438)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2407 (class 1259 OID 6190258)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2408 (class 1259 OID 6190260)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2409 (class 1259 OID 6190259)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2567 (class 1259 OID 6190704)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2443 (class 1259 OID 6190348)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2444 (class 1259 OID 6190346)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2445 (class 1259 OID 6190345)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2446 (class 1259 OID 6190347)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2350 (class 1259 OID 6190074)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2351 (class 1259 OID 6190075)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2472 (class 1259 OID 6190404)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2458 (class 1259 OID 6190369)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2499 (class 1259 OID 6190481)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2500 (class 1259 OID 6190482)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2550 (class 1259 OID 6190656)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2551 (class 1259 OID 6190658)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2552 (class 1259 OID 6190657)
-- Name: idx_8787a0e5b3836ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5b3836ea9 ON enotaprograma USING btree (tip_programske_enote_id);


--
-- TOC entry 2382 (class 1259 OID 6190188)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2383 (class 1259 OID 6190187)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2384 (class 1259 OID 6190189)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2562 (class 1259 OID 6190692)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2507 (class 1259 OID 6190509)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2508 (class 1259 OID 6190510)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2542 (class 1259 OID 6190630)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2543 (class 1259 OID 6190629)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2544 (class 1259 OID 6190632)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2545 (class 1259 OID 6190628)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2546 (class 1259 OID 6190631)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2496 (class 1259 OID 6190472)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2449 (class 1259 OID 6190357)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2450 (class 1259 OID 6190356)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2451 (class 1259 OID 6190354)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2452 (class 1259 OID 6190355)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2333 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2538 (class 1259 OID 6190618)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2539 (class 1259 OID 6190617)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2553 (class 1259 OID 6190667)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2414 (class 1259 OID 6190271)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2365 (class 1259 OID 6190121)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2366 (class 1259 OID 6190120)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2374 (class 1259 OID 6190153)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2375 (class 1259 OID 6190154)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2438 (class 1259 OID 6190338)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2439 (class 1259 OID 6190337)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2440 (class 1259 OID 6190336)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2556 (class 1259 OID 6190675)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2557 (class 1259 OID 6190674)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2421 (class 1259 OID 6190303)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2422 (class 1259 OID 6190299)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2423 (class 1259 OID 6190296)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2424 (class 1259 OID 6190297)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2425 (class 1259 OID 6190295)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2426 (class 1259 OID 6190300)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2427 (class 1259 OID 6190298)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2381 (class 1259 OID 6190173)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2399 (class 1259 OID 6190237)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2400 (class 1259 OID 6190239)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2401 (class 1259 OID 6190238)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2402 (class 1259 OID 6190240)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2457 (class 1259 OID 6190363)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2526 (class 1259 OID 6190567)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2533 (class 1259 OID 6190597)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2372 (class 1259 OID 6190144)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2373 (class 1259 OID 6190145)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2573 (class 1259 OID 6190712)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2392 (class 1259 OID 6190209)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2570 (class 1259 OID 6190703)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2477 (class 1259 OID 6190414)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2478 (class 1259 OID 6190413)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2547 (class 1259 OID 6190627)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2336 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2389 (class 1259 OID 6190197)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2519 (class 1259 OID 6190553)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 6190554)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2358 (class 1259 OID 6190094)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2428 (class 1259 OID 6190302)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2599 (class 2606 OID 6190854)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2602 (class 2606 OID 6190839)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2601 (class 2606 OID 6190844)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2597 (class 2606 OID 6190864)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2603 (class 2606 OID 6190834)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2598 (class 2606 OID 6190859)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2600 (class 2606 OID 6190849)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2633 (class 2606 OID 6191009)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2632 (class 2606 OID 6191014)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2584 (class 2606 OID 6190769)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2620 (class 2606 OID 6190949)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2618 (class 2606 OID 6190944)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2619 (class 2606 OID 6190939)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2596 (class 2606 OID 6190829)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2628 (class 2606 OID 6190979)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2626 (class 2606 OID 6190989)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2627 (class 2606 OID 6190984)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2590 (class 2606 OID 6190804)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2591 (class 2606 OID 6190799)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2616 (class 2606 OID 6190929)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2639 (class 2606 OID 6191034)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2638 (class 2606 OID 6191039)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2637 (class 2606 OID 6191044)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2640 (class 2606 OID 6191064)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2643 (class 2606 OID 6191049)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2641 (class 2606 OID 6191059)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2642 (class 2606 OID 6191054)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2588 (class 2606 OID 6190794)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2589 (class 2606 OID 6190789)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2580 (class 2606 OID 6190754)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2581 (class 2606 OID 6190749)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2622 (class 2606 OID 6190959)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2604 (class 2606 OID 6190869)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2577 (class 2606 OID 6190729)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2576 (class 2606 OID 6190734)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2623 (class 2606 OID 6190974)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2624 (class 2606 OID 6190969)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2625 (class 2606 OID 6190964)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2594 (class 2606 OID 6190809)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2592 (class 2606 OID 6190819)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2593 (class 2606 OID 6190814)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2658 (class 2606 OID 6191139)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2608 (class 2606 OID 6190904)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2610 (class 2606 OID 6190894)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2611 (class 2606 OID 6190889)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2609 (class 2606 OID 6190899)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2575 (class 2606 OID 6190719)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2574 (class 2606 OID 6190724)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2621 (class 2606 OID 6190954)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2617 (class 2606 OID 6190934)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2631 (class 2606 OID 6190999)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2630 (class 2606 OID 6191004)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 6191104)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2651 (class 2606 OID 6191114)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2652 (class 2606 OID 6191109)
-- Name: fk_8787a0e5b3836ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5b3836ea9 FOREIGN KEY (tip_programske_enote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2586 (class 2606 OID 6190779)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2587 (class 2606 OID 6190774)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2585 (class 2606 OID 6190784)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2657 (class 2606 OID 6191134)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2635 (class 2606 OID 6191019)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2634 (class 2606 OID 6191024)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2648 (class 2606 OID 6191089)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2649 (class 2606 OID 6191084)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2646 (class 2606 OID 6191099)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2650 (class 2606 OID 6191079)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2647 (class 2606 OID 6191094)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2629 (class 2606 OID 6190994)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2612 (class 2606 OID 6190924)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2613 (class 2606 OID 6190919)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2615 (class 2606 OID 6190909)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2614 (class 2606 OID 6190914)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2644 (class 2606 OID 6191074)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2645 (class 2606 OID 6191069)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2654 (class 2606 OID 6191119)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2595 (class 2606 OID 6190824)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2636 (class 2606 OID 6191029)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2578 (class 2606 OID 6190744)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2579 (class 2606 OID 6190739)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2583 (class 2606 OID 6190759)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2582 (class 2606 OID 6190764)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2605 (class 2606 OID 6190884)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2606 (class 2606 OID 6190879)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2607 (class 2606 OID 6190874)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2655 (class 2606 OID 6191129)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 6191124)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-03 13:03:04 CEST

--
-- PostgreSQL database dump complete
--

