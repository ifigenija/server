--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.7
-- Dumped by pg_dump version 9.3.7
-- Started on 2015-06-05 09:35:31 CEST

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
-- TOC entry 180 (class 1259 OID 6333818)
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
-- TOC entry 227 (class 1259 OID 6334342)
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
-- TOC entry 226 (class 1259 OID 6334325)
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
-- TOC entry 219 (class 1259 OID 6334228)
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
-- TOC entry 194 (class 1259 OID 6333997)
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
-- TOC entry 197 (class 1259 OID 6334031)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6333940)
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
-- TOC entry 228 (class 1259 OID 6334356)
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
-- TOC entry 213 (class 1259 OID 6334157)
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
-- TOC entry 192 (class 1259 OID 6333977)
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
-- TOC entry 196 (class 1259 OID 6334025)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6333957)
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
-- TOC entry 202 (class 1259 OID 6334074)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6334099)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6333914)
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
-- TOC entry 181 (class 1259 OID 6333827)
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
-- TOC entry 182 (class 1259 OID 6333838)
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
-- TOC entry 177 (class 1259 OID 6333792)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6333811)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6334106)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6334137)
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
-- TOC entry 223 (class 1259 OID 6334276)
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
-- TOC entry 184 (class 1259 OID 6333871)
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
-- TOC entry 186 (class 1259 OID 6333906)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6334080)
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
-- TOC entry 185 (class 1259 OID 6333891)
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
-- TOC entry 191 (class 1259 OID 6333969)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6334092)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6334213)
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
-- TOC entry 222 (class 1259 OID 6334268)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6334382)
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
-- TOC entry 232 (class 1259 OID 6334410)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id integer NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 238 (class 1259 OID 6334444)
-- Name: programfestival_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programfestival_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 230 (class 1259 OID 6334391)
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
-- TOC entry 236 (class 1259 OID 6334440)
-- Name: programgostovanje_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programgostovanje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 209 (class 1259 OID 6334121)
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
-- TOC entry 201 (class 1259 OID 6334065)
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
-- TOC entry 200 (class 1259 OID 6334055)
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
-- TOC entry 221 (class 1259 OID 6334257)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6334190)
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
-- TOC entry 174 (class 1259 OID 6333763)
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
-- TOC entry 173 (class 1259 OID 6333761)
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
-- TOC entry 210 (class 1259 OID 6334131)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6333801)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6333785)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6334145)
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
-- TOC entry 204 (class 1259 OID 6334086)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6334036)
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
-- TOC entry 235 (class 1259 OID 6334429)
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
-- TOC entry 234 (class 1259 OID 6334421)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 233 (class 1259 OID 6334416)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 217 (class 1259 OID 6334200)
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
-- TOC entry 183 (class 1259 OID 6333863)
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
-- TOC entry 199 (class 1259 OID 6334042)
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
-- TOC entry 220 (class 1259 OID 6334246)
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
-- TOC entry 231 (class 1259 OID 6334399)
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
-- TOC entry 237 (class 1259 OID 6334442)
-- Name: tipprogramskeenote_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipprogramskeenote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 188 (class 1259 OID 6333926)
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
-- TOC entry 175 (class 1259 OID 6333772)
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
-- TOC entry 225 (class 1259 OID 6334303)
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
-- TOC entry 193 (class 1259 OID 6333988)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6334113)
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
-- TOC entry 215 (class 1259 OID 6334183)
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
-- TOC entry 195 (class 1259 OID 6334020)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6334293)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 214 (class 1259 OID 6334173)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2174 (class 2604 OID 6333766)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2786 (class 0 OID 6333818)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2833 (class 0 OID 6334342)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo) FROM stdin;
000c0000-5571-5143-6402-a5b2d601a960	000d0000-5571-5143-4615-fbf3247932f7	\N	00090000-5571-5143-3f61-f7bafdf34678	\N	\N	0001	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5571-5143-705d-2ce677dd89ef	000d0000-5571-5143-d56d-45a2c058df98	\N	00090000-5571-5143-22d0-c0b187a4f6ee	\N	\N	0002	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5571-5143-3ba9-2c09704dc5ca	000d0000-5571-5143-5188-27847926b946	\N	00090000-5571-5143-34ec-41ec3158a589	\N	\N	0003	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5571-5143-cba0-d5c4cfbbbc46	000d0000-5571-5143-d666-a630d88e3328	\N	00090000-5571-5143-f835-3421958d69b2	\N	\N	0004	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5571-5143-4afa-4a0722c528a6	000d0000-5571-5143-603a-97ebfa329a80	\N	00090000-5571-5143-9058-cd80af8fe87d	\N	\N	0005	f	\N	\N	\N	\N	\N	\N	\N
000c0000-5571-5143-3c4b-14ea86a119c6	000d0000-5571-5143-8cef-123a97805459	\N	00090000-5571-5143-22d0-c0b187a4f6ee	\N	\N	0006	f	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2832 (class 0 OID 6334325)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2825 (class 0 OID 6334228)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine, letoizida, krajizida, zaloznik) FROM stdin;
00160000-5571-5142-bc7b-6074902c3529	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	5	Milan Jesih	\N	\N	\N
00160000-5571-5142-9df7-69cd11d9d8bf	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	1	Vladimir Levstik	\N	\N	\N
00160000-5571-5142-d1fd-5c3b87923ada	0003	Smoletov Vrt	Berta Hočevar		slovenščina		\N	2015-05-26	2	8	8		\N	\N	\N
\.


--
-- TOC entry 2800 (class 0 OID 6333997)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-5571-5143-b885-3b47046e6775	\N	\N	00200000-5571-5143-75f0-482cac154968	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	3			
00180000-5571-5143-ae60-2e834d4c3508	\N	\N	00200000-5571-5143-c374-bfee0801ed24	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-5571-5143-af4f-792db72248ae	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
00180000-5571-5143-6906-b8c55795d734	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	2			
00180000-5571-5143-b4c2-01bca605090b	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	7			
\.


--
-- TOC entry 2803 (class 0 OID 6334031)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2795 (class 0 OID 6333940)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5571-5141-083d-3cb581f10095	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5571-5141-86a4-8631ae556e83	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5571-5141-c9b7-9df199bf470e	AL	ALB	008	Albania 	Albanija	\N
00040000-5571-5141-6b20-ef5c4cf88f09	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5571-5141-3ab7-b8e098367d38	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5571-5141-d575-91a7d45d27ce	AD	AND	020	Andorra 	Andora	\N
00040000-5571-5141-e438-f82a76f7df08	AO	AGO	024	Angola 	Angola	\N
00040000-5571-5141-094a-8e1cf59860c2	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5571-5141-2dfb-da6a117066a9	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5571-5141-a109-6a08fde7c446	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5571-5141-af6b-719316094aa8	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5571-5141-828d-fd397081afd9	AM	ARM	051	Armenia 	Armenija	\N
00040000-5571-5141-03da-65f208c7b891	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5571-5141-fd51-7d6d679686a9	AU	AUS	036	Australia 	Avstralija	\N
00040000-5571-5141-1069-c3ee3fe1a572	AT	AUT	040	Austria 	Avstrija	\N
00040000-5571-5141-c263-ddee620445c3	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5571-5141-e9d0-a34af54763d3	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5571-5141-dff7-64d89a87c8fc	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5571-5141-2611-43e3ceb92997	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5571-5141-c1e2-b5e87346c371	BB	BRB	052	Barbados 	Barbados	\N
00040000-5571-5141-eb39-9b30fb555c23	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5571-5141-37d4-a89efffe4789	BE	BEL	056	Belgium 	Belgija	\N
00040000-5571-5141-10e7-b22e2e608f99	BZ	BLZ	084	Belize 	Belize	\N
00040000-5571-5141-8ae1-1bf3cbacabfb	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5571-5141-846e-2aa2fbe78354	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5571-5141-3e00-576120b29442	BT	BTN	064	Bhutan 	Butan	\N
00040000-5571-5141-0429-19ba8fe3b1bd	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5571-5141-fd95-c8fb0de59dd7	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5571-5141-e236-d0ffc223726c	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5571-5141-40c1-1339d956a3d9	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5571-5141-d640-1da6357f86ab	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5571-5141-9cb9-f2efc810ad9b	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5571-5141-8352-4c4d39a1b180	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5571-5141-abe2-2f315fb768e8	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5571-5141-6ebf-c14c8aabbe53	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5571-5141-efcb-4c27adc4b5f8	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5571-5141-2ea5-79512e2fc576	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5571-5141-df42-be22be7dbe5b	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5571-5141-4984-a32ed45ab12b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5571-5141-b792-b629f9daccfd	CA	CAN	124	Canada 	Kanada	\N
00040000-5571-5141-ca87-c39fe46b0c39	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5571-5141-21f3-8c52e18fa58a	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5571-5141-2d03-464a3f7f50d1	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5571-5141-f953-422f62a5dfc7	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5571-5141-c5be-95eaa2f065bc	CL	CHL	152	Chile 	Čile	\N
00040000-5571-5141-8f38-db68cfcc6c74	CN	CHN	156	China 	Kitajska	\N
00040000-5571-5141-5289-f59ba69137e6	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5571-5141-a87e-88565965ccd8	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5571-5141-f0b5-3152ff03a634	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5571-5141-5acd-83dbebf7ff6b	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5571-5141-29b7-e22e9df02d15	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5571-5141-e43a-cd3b075ff20e	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5571-5141-f5be-2b0bebf5b8e1	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5571-5141-b215-fa1df956b7d0	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5571-5141-e539-5dc24029a9a3	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5571-5141-1161-c8b94096eef8	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5571-5141-d7c1-2f7adaeeba9b	CU	CUB	192	Cuba 	Kuba	\N
00040000-5571-5141-4a1b-984ccf76d317	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5571-5141-cb76-e85685b2e37b	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5571-5141-277e-f01a829dc940	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5571-5141-af96-91dd227bfd52	DK	DNK	208	Denmark 	Danska	\N
00040000-5571-5141-e80f-6eef8b840a5f	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5571-5141-2cd9-d7050798307f	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5571-5141-5e32-661ff676f9f0	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5571-5141-6d3f-f1a9904e3362	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5571-5141-7d8f-078d9425587d	EG	EGY	818	Egypt 	Egipt	\N
00040000-5571-5141-cc61-51c1d4dac1b3	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5571-5141-82be-3dcd677a5a98	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5571-5141-5879-8187c75c60a9	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5571-5141-f422-7f3524138ef3	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5571-5141-f49c-2c3a3efe2434	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5571-5141-3a99-5db94c717127	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5571-5141-8af7-98781f2ce088	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5571-5141-6ff1-79bd59ca1c1e	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5571-5141-3def-c51cf52d686f	FI	FIN	246	Finland 	Finska	\N
00040000-5571-5141-1044-7ef61f121960	FR	FRA	250	France 	Francija	\N
00040000-5571-5141-f17c-0797df38f9e0	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5571-5142-4bd9-dc65bb78ffec	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5571-5141-ec90-0299c67ec1c6	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5571-5141-ca5b-f68210552a40	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5571-5141-d03b-a71f937577c9	GA	GAB	266	Gabon 	Gabon	\N
00040000-5571-5141-13b9-be8e89a8e5dd	GM	GMB	270	Gambia 	Gambija	\N
00040000-5571-5141-5583-666f544ca0e3	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5571-5141-3999-538ae55128c3	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5571-5141-d36e-86e2310482ba	GH	GHA	288	Ghana 	Gana	\N
00040000-5571-5141-4390-c051ac47c4d4	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5571-5141-a17c-18b7212b7f00	GR	GRC	300	Greece 	Grčija	\N
00040000-5571-5141-e4e3-34921dc66979	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5571-5141-691c-0a8b953ad29d	GD	GRD	308	Grenada 	Grenada	\N
00040000-5571-5141-8e3a-ec23f5eb17ab	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5571-5141-28ac-a1f104f359e9	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5571-5141-ab1c-a061f04fbfc3	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5571-5141-a403-c54a92009045	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5571-5141-9044-e0dbf472d4a3	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5571-5141-cdf1-e42ceb68ae7c	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5571-5141-7132-acbd304d0ad6	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5571-5141-11d2-9615d512f3d7	HT	HTI	332	Haiti 	Haiti	\N
00040000-5571-5141-d3b2-8a71e06007de	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5571-5141-77ee-c54f424585f2	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5571-5141-e441-c53d8267a61a	HN	HND	340	Honduras 	Honduras	\N
00040000-5571-5141-9358-3ae369bac5c5	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5571-5141-f37e-deaac5cf619c	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5571-5141-9750-070c4ce84c14	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5571-5141-970c-1376f7eeca91	IN	IND	356	India 	Indija	\N
00040000-5571-5141-a822-8f94f317698d	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5571-5141-b106-fbb0bff9017d	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5571-5141-8a1b-e854cfee6474	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5571-5141-fc97-c14642f0868d	IE	IRL	372	Ireland 	Irska	\N
00040000-5571-5141-5b34-de98c18f36eb	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5571-5142-7a99-6d7425aa678b	IL	ISR	376	Israel 	Izrael	\N
00040000-5571-5142-d04b-d1cd488252f5	IT	ITA	380	Italy 	Italija	\N
00040000-5571-5142-31a6-e1c248b85926	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5571-5142-ce42-347137f8ae01	JP	JPN	392	Japan 	Japonska	\N
00040000-5571-5142-d0f6-4e519dc5398b	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5571-5142-c2f1-84d2bc0d2c1f	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5571-5142-c409-ae2c832c68ce	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5571-5142-6bab-9c2b6b223f4b	KE	KEN	404	Kenya 	Kenija	\N
00040000-5571-5142-2b1b-900126662192	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5571-5142-26b5-821c8d4c966a	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5571-5142-3e47-2f6c78916bbd	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5571-5142-6f71-d71b0a081d6e	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5571-5142-6f1f-d92c85745c86	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5571-5142-dd59-2a59763bf3f5	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5571-5142-d0b8-22fc193900a7	LV	LVA	428	Latvia 	Latvija	\N
00040000-5571-5142-0bc6-21319a703746	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5571-5142-487b-21cbe885c52e	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5571-5142-8749-87f7ff38f416	LR	LBR	430	Liberia 	Liberija	\N
00040000-5571-5142-c3ca-a01ff995e8c5	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5571-5142-1d52-f01a52d5737b	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5571-5142-16e9-b3734546bce8	LT	LTU	440	Lithuania 	Litva	\N
00040000-5571-5142-0667-9aaf62260dae	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5571-5142-7ff4-e7f3b11f37a9	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5571-5142-998c-f23e6a3d96ca	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5571-5142-3f27-9170b4933395	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5571-5142-305b-afd4e0418593	MW	MWI	454	Malawi 	Malavi	\N
00040000-5571-5142-59cc-e5639ed7df66	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5571-5142-4ed6-7ea2ae5cfbd9	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5571-5142-75cd-1585dfef0395	ML	MLI	466	Mali 	Mali	\N
00040000-5571-5142-bf4f-62ace4469d23	MT	MLT	470	Malta 	Malta	\N
00040000-5571-5142-dc9c-14ec3bc38822	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5571-5142-9b82-0ebad47806e9	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5571-5142-2c59-4e86297df58f	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5571-5142-6a25-440d9f29d0a5	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5571-5142-026a-4f39a75b4516	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5571-5142-39c0-47326cdeb532	MX	MEX	484	Mexico 	Mehika	\N
00040000-5571-5142-40f9-c8ed0a991af5	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5571-5142-8288-75994fbf575f	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5571-5142-023d-c84ff31dbb68	MC	MCO	492	Monaco 	Monako	\N
00040000-5571-5142-2dad-dbae045e2116	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5571-5142-4a99-393d021234bd	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5571-5142-f4af-def6631fbeea	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5571-5142-529a-7aef6da900f4	MA	MAR	504	Morocco 	Maroko	\N
00040000-5571-5142-6869-b3b3de9655f3	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5571-5142-e8c9-867e0983de8e	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5571-5142-050d-4efe5b28d535	NA	NAM	516	Namibia 	Namibija	\N
00040000-5571-5142-5485-98af6f637ab9	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5571-5142-20f1-b5c84619c478	NP	NPL	524	Nepal 	Nepal	\N
00040000-5571-5142-ef50-8e5cc404bb1e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5571-5142-7629-9049da0b8b66	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5571-5142-e2e6-7cbaa118b09a	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5571-5142-eb80-67ff00fa8eb9	NE	NER	562	Niger 	Niger 	\N
00040000-5571-5142-8f56-6f032ae5080c	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5571-5142-28cc-0f3679e020c5	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5571-5142-387e-6164c67d8264	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5571-5142-1f4d-c7e772966d8f	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5571-5142-df5f-f4870c008147	NO	NOR	578	Norway 	Norveška	\N
00040000-5571-5142-b038-8f4f921fa27e	OM	OMN	512	Oman 	Oman	\N
00040000-5571-5142-0e9c-0c42b4b91699	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5571-5142-31d7-795dcb6baf5f	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5571-5142-eb38-0dd04e137944	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5571-5142-4a0a-e7993b9b3753	PA	PAN	591	Panama 	Panama	\N
00040000-5571-5142-49d2-e92bd9697c02	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5571-5142-4f91-eb6d62cc474a	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5571-5142-6aa5-141e5e043680	PE	PER	604	Peru 	Peru	\N
00040000-5571-5142-0928-07437275b21c	PH	PHL	608	Philippines 	Filipini	\N
00040000-5571-5142-8c94-e065c6d166b4	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5571-5142-9e11-88aa8950d6a3	PL	POL	616	Poland 	Poljska	\N
00040000-5571-5142-46a7-d4391c73cfc5	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5571-5142-eaf1-de417874371e	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5571-5142-d526-d1f100cf5e18	QA	QAT	634	Qatar 	Katar	\N
00040000-5571-5142-ee4e-da788a8d20e4	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5571-5142-c5fb-490581cd83dc	RO	ROU	642	Romania 	Romunija	\N
00040000-5571-5142-ace6-0f4057b4c7bd	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5571-5142-3659-fcde8bf31dbf	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5571-5142-0f08-41a8a9aaab9c	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5571-5142-a254-ef1df7dd6976	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5571-5142-5bf4-476d6b99d090	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5571-5142-0e2d-80700c21bd3c	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5571-5142-d054-9742e5a45b11	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5571-5142-df94-95a921e81e25	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5571-5142-aaf4-6e43bbf75c29	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5571-5142-f6e3-3f615d973021	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5571-5142-7ba5-94acf9a82484	SM	SMR	674	San Marino 	San Marino	\N
00040000-5571-5142-c836-09b60361ac46	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5571-5142-2980-d108b73ea6e5	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5571-5142-7940-13907bb155f8	SN	SEN	686	Senegal 	Senegal	\N
00040000-5571-5142-6a69-4fe3d319ccf2	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5571-5142-d8a9-fcc2125af70d	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5571-5142-b33d-125219322e4a	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5571-5142-044d-6be490c547ea	SG	SGP	702	Singapore 	Singapur	\N
00040000-5571-5142-f45f-32f3e4296f82	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5571-5142-2d7a-ea8c65d826c3	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5571-5142-1e66-bc44ed04668f	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5571-5142-ae60-118c2b19adf3	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5571-5142-fc86-e034bcbfb1de	SO	SOM	706	Somalia 	Somalija	\N
00040000-5571-5142-2605-f673a10b62ac	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5571-5142-f784-3e6ba7dcfed8	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5571-5142-7c75-6df3fb6406da	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5571-5142-1fb0-c98e81710468	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5571-5142-f654-ba8e29407532	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5571-5142-4f2b-e8b2f37152f5	SD	SDN	729	Sudan 	Sudan	\N
00040000-5571-5142-8f0b-ca8e878caf6c	SR	SUR	740	Suriname 	Surinam	\N
00040000-5571-5142-9d2f-a8801532fefa	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5571-5142-a1fe-bdcf088ca0de	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5571-5142-1f3c-2869a1cb25a9	SE	SWE	752	Sweden 	Švedska	\N
00040000-5571-5142-4b7f-91cd4e3d1c2a	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5571-5142-d552-7b224462a459	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5571-5142-0eaf-c9dec8ce6910	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5571-5142-783a-e6378ce4334a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5571-5142-4751-bec53df9434d	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5571-5142-65ea-79eaf6b64d8d	TH	THA	764	Thailand 	Tajska	\N
00040000-5571-5142-7e66-d200a1a711ca	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5571-5142-370d-0459230b1183	TG	TGO	768	Togo 	Togo	\N
00040000-5571-5142-3a27-0a4c59b18922	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5571-5142-bfc8-4dc1771a7549	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5571-5142-064b-141f1f603c9c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5571-5142-0477-17bda94e355c	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5571-5142-b1ac-b3049b718aa2	TR	TUR	792	Turkey 	Turčija	\N
00040000-5571-5142-0afe-ce7146e762eb	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5571-5142-8635-1aa0e8a39ddd	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5571-5142-ed30-dc2037d50fae	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5571-5142-854d-589010c1b5fd	UG	UGA	800	Uganda 	Uganda	\N
00040000-5571-5142-2a79-24c41f0c0cb3	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5571-5142-5b54-124e791645d0	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5571-5142-d56f-427cf62527a5	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5571-5142-fa04-8f68a8ebdb33	US	USA	840	United States 	Združene države Amerike	\N
00040000-5571-5142-28d6-72e71d9dcbad	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5571-5142-0f12-904d64d5ad86	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5571-5142-5a5a-cfb0c4acdb89	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5571-5142-61d0-96bd168963dd	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5571-5142-614b-442551d8db01	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5571-5142-c8dd-fc5082330efb	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5571-5142-abba-2c9458c4a510	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5571-5142-6685-3a85e2b4a46a	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5571-5142-3cf8-9468cd87e4d9	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5571-5142-e4b7-fba8c5f4980f	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5571-5142-201f-bd62b3a6b3dd	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5571-5142-6a4d-22f6119fddc6	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5571-5142-b1a8-054e7620e237	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2834 (class 0 OID 6334356)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, tip_programske_enote_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tip) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 6334157)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5571-5143-ba4f-9cb3c54e62ac	000e0000-5571-5143-9fad-032a88a9be97	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5571-5141-438e-bfb48fd355cb
000d0000-5571-5143-4615-fbf3247932f7	000e0000-5571-5143-9fad-032a88a9be97	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5571-5141-438e-bfb48fd355cb
000d0000-5571-5143-d56d-45a2c058df98	000e0000-5571-5143-9fad-032a88a9be97	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5571-5141-8f24-20ba17ec10bb
000d0000-5571-5143-5188-27847926b946	000e0000-5571-5143-9fad-032a88a9be97	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-5571-5141-8de4-21b3efadf048
000d0000-5571-5143-d666-a630d88e3328	000e0000-5571-5143-9fad-032a88a9be97	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5571-5141-8de4-21b3efadf048
000d0000-5571-5143-603a-97ebfa329a80	000e0000-5571-5143-9fad-032a88a9be97	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-5571-5141-8de4-21b3efadf048
000d0000-5571-5143-8cef-123a97805459	000e0000-5571-5143-9fad-032a88a9be97	\N	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5571-5141-438e-bfb48fd355cb
\.


--
-- TOC entry 2798 (class 0 OID 6333977)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2802 (class 0 OID 6334025)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2796 (class 0 OID 6333957)
-- Dependencies: 190
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00000000-5571-5143-2591-712375e89f56	00080000-5571-5142-e595-c932229a8a47	00090000-5571-5143-3f61-f7bafdf34678	AK		
\.


--
-- TOC entry 2776 (class 0 OID 529271)
-- Dependencies: 170
-- Data for Name: kose; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kose (id, naslov_id, user_id, naziv, ime, priimek, pesvdonim, funkcija, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
\.


--
-- TOC entry 2808 (class 0 OID 6334074)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2812 (class 0 OID 6334099)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2793 (class 0 OID 6333914)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5571-5142-60a9-d0e7f3c0282c	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-5571-5142-aa13-2baebbea7908	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5571-5142-1fcd-239ea36d85d3	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5571-5142-c503-2d5e2fa18777	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5571-5142-c164-fb967ea338e8	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5571-5142-38ff-1f467b38b35e	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5571-5142-6550-6c2488d1ac6f	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5571-5142-0813-f17c13228f79	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5571-5142-ac13-10463d7b4b42	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5571-5142-939b-45a69897b129	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5571-5142-7364-80870e92433a	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-5571-5142-d8de-93aec0111fd7	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5571-5142-8422-f8dd7d617c28	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5571-5142-3385-7abaea07fdd6	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-5571-5142-0813-8ef9a217d829	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-5571-5142-cf6b-2db295d851c0	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2787 (class 0 OID 6333827)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5571-5142-1918-14b133bd2aec	00000000-5571-5142-c164-fb967ea338e8	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5571-5142-bcb7-07631cd008cb	00000000-5571-5142-c164-fb967ea338e8	00010000-5571-5142-7f20-3d5831141ac4	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5571-5142-039e-93fda3418e81	00000000-5571-5142-38ff-1f467b38b35e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2788 (class 0 OID 6333838)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5571-5143-edf1-6bda46d535b5	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5571-5143-f835-3421958d69b2	00010000-5571-5143-df92-ef29999f7025	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5571-5143-34ec-41ec3158a589	00010000-5571-5143-bc78-88557106162a	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5571-5143-50c8-531f533d2221	00010000-5571-5143-d301-f25b439c4cd7	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5571-5143-fcee-c36c9ff6ed20	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5571-5143-b33b-a3ebb51a5102	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5571-5143-1ae7-07a61c62d3b4	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5571-5143-e8b5-40095ae7de71	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5571-5143-3f61-f7bafdf34678	00010000-5571-5143-3d5e-4c15a8d21206	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5571-5143-22d0-c0b187a4f6ee	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5571-5143-a938-2ca818349425	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5571-5143-9058-cd80af8fe87d	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5571-5143-3dab-15cfb047b77e	00010000-5571-5143-1dce-f698a08392fd	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2778 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2783 (class 0 OID 6333792)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5571-5142-d7f3-1e051d56c8bf	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5571-5142-6e33-d29be8c48b73	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5571-5142-dd7e-d920634cfd58	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5571-5142-6450-6906decfecc5	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5571-5142-b9b7-7004a2c59668	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5571-5142-993d-a7cd30db3ba3	Abonma-read	Abonma - branje	f
00030000-5571-5142-aedb-3899b90819b5	Abonma-write	Abonma - spreminjanje	f
00030000-5571-5142-dcca-7da7e7544d8a	Alternacija-read	Alternacija - branje	f
00030000-5571-5142-7216-472207200f14	Alternacija-write	Alternacija - spreminjanje	f
00030000-5571-5142-891e-cfbf8a3084a6	Arhivalija-read	Arhivalija - branje	f
00030000-5571-5142-3e92-88e314dddf35	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5571-5142-862b-81d2788a4337	Besedilo-read	Besedilo - branje	f
00030000-5571-5142-00ff-bf86ca4cad23	Besedilo-write	Besedilo - spreminjanje	f
00030000-5571-5142-5fe1-8cd0fe74fdd5	DogodekIzven-read	DogodekIzven - branje	f
00030000-5571-5142-7183-61b6a352a809	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5571-5142-0bb3-4da81b50889b	Dogodek-read	Dogodek - branje	f
00030000-5571-5142-1a6a-cb12ad405166	Dogodek-write	Dogodek - spreminjanje	f
00030000-5571-5142-4036-ae056bd789f5	Drzava-read	Drzava - branje	f
00030000-5571-5142-670f-fc16949c9b95	Drzava-write	Drzava - spreminjanje	f
00030000-5571-5142-1dcf-0d9815d528dc	Funkcija-read	Funkcija - branje	f
00030000-5571-5142-b199-7e672b4d3d9e	Funkcija-write	Funkcija - spreminjanje	f
00030000-5571-5142-93ce-96779391e44f	Gostovanje-read	Gostovanje - branje	f
00030000-5571-5142-a711-4dbf84e88d89	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5571-5142-11df-042bfd461292	Gostujoca-read	Gostujoca - branje	f
00030000-5571-5142-8a77-bbd63ba7a817	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5571-5142-631b-01e3f0efa0f1	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5571-5142-2b03-f3b6f1688a10	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5571-5142-fc4e-73dcbbdcfa6c	Kupec-read	Kupec - branje	f
00030000-5571-5142-b3f1-a1a0b44a1195	Kupec-write	Kupec - spreminjanje	f
00030000-5571-5142-769a-f69dadd31550	NacinPlacina-read	NacinPlacina - branje	f
00030000-5571-5142-db01-302ef9c131f3	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5571-5142-81e1-9f5d2cdf4e07	Option-read	Option - branje	f
00030000-5571-5142-8bfa-7a8b2ea90e7c	Option-write	Option - spreminjanje	f
00030000-5571-5142-c91f-5d157a1b6724	OptionValue-read	OptionValue - branje	f
00030000-5571-5142-7a33-c153c38fc6e0	OptionValue-write	OptionValue - spreminjanje	f
00030000-5571-5142-42c5-3245fa8f38ac	Oseba-read	Oseba - branje	f
00030000-5571-5142-0038-5ca21d43af22	Oseba-write	Oseba - spreminjanje	f
00030000-5571-5142-e2ae-5ac7338eb08a	Permission-read	Permission - branje	f
00030000-5571-5142-18f5-02001c0c0512	Permission-write	Permission - spreminjanje	f
00030000-5571-5142-9589-fc3eefb8851c	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5571-5142-a186-d1c3caf48da2	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5571-5142-8683-2fbab4bb93d9	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5571-5142-1fd2-169905864237	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5571-5142-c48f-6825512a9f9c	Pogodba-read	Pogodba - branje	f
00030000-5571-5142-462d-e51936f70a53	Pogodba-write	Pogodba - spreminjanje	f
00030000-5571-5142-648c-4929f68ce135	Popa-read	Popa - branje	f
00030000-5571-5142-d520-d39633e6721f	Popa-write	Popa - spreminjanje	f
00030000-5571-5142-90d9-169c3d74358d	Posta-read	Posta - branje	f
00030000-5571-5142-7343-a2565712d388	Posta-write	Posta - spreminjanje	f
00030000-5571-5142-3016-5c8caa2fcd9b	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5571-5142-a951-889e93304863	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5571-5142-67cc-feb9d4494339	PostniNaslov-read	PostniNaslov - branje	f
00030000-5571-5142-df45-20e7b8709500	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5571-5142-60a8-1ab0c565f752	Predstava-read	Predstava - branje	f
00030000-5571-5142-88ed-5928fd601d07	Predstava-write	Predstava - spreminjanje	f
00030000-5571-5142-d0a7-010983e1c2bb	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5571-5142-f647-7d7f4df3dfd2	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5571-5142-96a4-c96dfbf9ef73	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5571-5142-8fdd-5e8ec6ae8251	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5571-5142-c28e-1fec48ae6616	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5571-5142-496a-fca4e8140aad	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5571-5142-0657-7a8f12edce8f	Prostor-read	Prostor - branje	f
00030000-5571-5142-8381-809c041955ea	Prostor-write	Prostor - spreminjanje	f
00030000-5571-5142-da1b-0baa3b7c4674	Racun-read	Racun - branje	f
00030000-5571-5142-d73b-2c64ab046a49	Racun-write	Racun - spreminjanje	f
00030000-5571-5142-0bbf-523f1b828e56	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5571-5142-96d2-aad0d4e83748	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5571-5142-7908-dd06cac64af2	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5571-5142-2f15-b7b90df55708	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5571-5142-6517-6cafdb521452	Rekvizit-read	Rekvizit - branje	f
00030000-5571-5142-8eee-882fd75f7887	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5571-5142-c310-77bbfc077e28	Revizija-read	Revizija - branje	f
00030000-5571-5142-d34c-911c0c4e820a	Revizija-write	Revizija - spreminjanje	f
00030000-5571-5142-3098-d7ec2bcb73ee	Rezervacija-read	Rezervacija - branje	f
00030000-5571-5142-d1e9-e00c5618f073	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5571-5142-aaac-6ed0c2ae2834	Role-read	Role - branje	f
00030000-5571-5142-2193-5942737e2f41	Role-write	Role - spreminjanje	f
00030000-5571-5142-b565-bea5235efeab	SedezniRed-read	SedezniRed - branje	f
00030000-5571-5142-b143-60d813b3a12e	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5571-5142-ebc2-569c766c06f8	Sedez-read	Sedez - branje	f
00030000-5571-5142-6e94-ae8fd72962d8	Sedez-write	Sedez - spreminjanje	f
00030000-5571-5142-6f18-6dfdfa276d07	Sezona-read	Sezona - branje	f
00030000-5571-5142-79be-7c764caab0f9	Sezona-write	Sezona - spreminjanje	f
00030000-5571-5142-ec3f-09d1db18bd31	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5571-5142-02f0-9e7accf4dcf3	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5571-5142-c509-ff8ec5597cf4	Stevilcenje-read	Stevilcenje - branje	f
00030000-5571-5142-8c71-209370851db5	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5571-5142-a3fd-a524ccd521bd	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5571-5142-69a3-9e67f6b3c846	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5571-5142-e475-2ca1deec54b8	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5571-5142-a472-c8f1fb1e5e24	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5571-5142-4e0a-102e7ef25129	Telefonska-read	Telefonska - branje	f
00030000-5571-5142-e978-5425bb321d5a	Telefonska-write	Telefonska - spreminjanje	f
00030000-5571-5142-18ec-5d94cf80ec3b	TerminStoritve-read	TerminStoritve - branje	f
00030000-5571-5142-11f2-013df9df601f	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5571-5142-1e7e-98774698c0fd	TipFunkcije-read	TipFunkcije - branje	f
00030000-5571-5142-218f-85203fe5c528	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5571-5142-a61d-3638a678c9df	Trr-read	Trr - branje	f
00030000-5571-5142-85d6-cd7bc51025e3	Trr-write	Trr - spreminjanje	f
00030000-5571-5142-a434-748999a692a1	Uprizoritev-read	Uprizoritev - branje	f
00030000-5571-5142-1e15-bc8328d70a21	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5571-5142-1a9b-912c8e8095d6	User-read	User - branje	f
00030000-5571-5142-8bfa-a75910e002af	User-write	User - spreminjanje	f
00030000-5571-5142-2a6e-39a0ef71f4f3	Vaja-read	Vaja - branje	f
00030000-5571-5142-6c26-62417827ae37	Vaja-write	Vaja - spreminjanje	f
00030000-5571-5142-d1ee-1865bca5c4cf	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5571-5142-83c7-2dd407c9610d	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5571-5142-712c-eb1ef2a49491	Zaposlitev-read	Zaposlitev - branje	f
00030000-5571-5142-6b05-b0bf03ae9def	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5571-5142-defa-d548550b54dc	Zasedenost-read	Zasedenost - branje	f
00030000-5571-5142-0945-beca5d304d16	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5571-5142-a455-64063290c3b7	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5571-5142-9301-b00ad7bd5ec0	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5571-5142-dc51-48dea164cec0	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5571-5142-a52e-6929de097106	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2785 (class 0 OID 6333811)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5571-5142-3acb-6b08597c4f88	00030000-5571-5142-4036-ae056bd789f5
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-993d-a7cd30db3ba3
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-aedb-3899b90819b5
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-dcca-7da7e7544d8a
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-7216-472207200f14
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-891e-cfbf8a3084a6
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-0bb3-4da81b50889b
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-6450-6906decfecc5
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-1a6a-cb12ad405166
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-4036-ae056bd789f5
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-670f-fc16949c9b95
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-1dcf-0d9815d528dc
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-b199-7e672b4d3d9e
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-93ce-96779391e44f
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-a711-4dbf84e88d89
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-11df-042bfd461292
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-8a77-bbd63ba7a817
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-631b-01e3f0efa0f1
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-2b03-f3b6f1688a10
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-81e1-9f5d2cdf4e07
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-c91f-5d157a1b6724
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-42c5-3245fa8f38ac
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-0038-5ca21d43af22
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-648c-4929f68ce135
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-d520-d39633e6721f
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-90d9-169c3d74358d
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-7343-a2565712d388
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-67cc-feb9d4494339
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-df45-20e7b8709500
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-60a8-1ab0c565f752
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-88ed-5928fd601d07
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-c28e-1fec48ae6616
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-496a-fca4e8140aad
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-0657-7a8f12edce8f
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-8381-809c041955ea
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-7908-dd06cac64af2
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-2f15-b7b90df55708
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-6517-6cafdb521452
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-8eee-882fd75f7887
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-6f18-6dfdfa276d07
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-79be-7c764caab0f9
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-1e7e-98774698c0fd
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-a434-748999a692a1
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-1e15-bc8328d70a21
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-2a6e-39a0ef71f4f3
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-6c26-62417827ae37
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-defa-d548550b54dc
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-0945-beca5d304d16
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-a455-64063290c3b7
00020000-5571-5142-2fac-f425612123e5	00030000-5571-5142-dc51-48dea164cec0
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-993d-a7cd30db3ba3
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-891e-cfbf8a3084a6
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-0bb3-4da81b50889b
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-4036-ae056bd789f5
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-93ce-96779391e44f
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-11df-042bfd461292
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-631b-01e3f0efa0f1
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-2b03-f3b6f1688a10
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-81e1-9f5d2cdf4e07
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-c91f-5d157a1b6724
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-42c5-3245fa8f38ac
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-0038-5ca21d43af22
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-648c-4929f68ce135
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-90d9-169c3d74358d
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-67cc-feb9d4494339
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-df45-20e7b8709500
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-60a8-1ab0c565f752
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-0657-7a8f12edce8f
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-7908-dd06cac64af2
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-6517-6cafdb521452
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-6f18-6dfdfa276d07
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-4e0a-102e7ef25129
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-e978-5425bb321d5a
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-a61d-3638a678c9df
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-85d6-cd7bc51025e3
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-712c-eb1ef2a49491
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-6b05-b0bf03ae9def
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-a455-64063290c3b7
00020000-5571-5142-c33f-674bc9a5d388	00030000-5571-5142-dc51-48dea164cec0
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-993d-a7cd30db3ba3
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-dcca-7da7e7544d8a
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-891e-cfbf8a3084a6
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-3e92-88e314dddf35
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-862b-81d2788a4337
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-5fe1-8cd0fe74fdd5
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-0bb3-4da81b50889b
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-4036-ae056bd789f5
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-1dcf-0d9815d528dc
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-93ce-96779391e44f
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-11df-042bfd461292
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-631b-01e3f0efa0f1
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-81e1-9f5d2cdf4e07
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-c91f-5d157a1b6724
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-42c5-3245fa8f38ac
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-648c-4929f68ce135
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-90d9-169c3d74358d
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-60a8-1ab0c565f752
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-c28e-1fec48ae6616
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-0657-7a8f12edce8f
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-7908-dd06cac64af2
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-6517-6cafdb521452
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-6f18-6dfdfa276d07
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-1e7e-98774698c0fd
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-2a6e-39a0ef71f4f3
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-defa-d548550b54dc
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-a455-64063290c3b7
00020000-5571-5142-7552-2b94b0c3ad08	00030000-5571-5142-dc51-48dea164cec0
00020000-5571-5142-3fbc-fbbbd152fad5	00030000-5571-5142-993d-a7cd30db3ba3
00020000-5571-5142-3fbc-fbbbd152fad5	00030000-5571-5142-aedb-3899b90819b5
00020000-5571-5142-3fbc-fbbbd152fad5	00030000-5571-5142-7216-472207200f14
00020000-5571-5142-3fbc-fbbbd152fad5	00030000-5571-5142-891e-cfbf8a3084a6
00020000-5571-5142-3fbc-fbbbd152fad5	00030000-5571-5142-0bb3-4da81b50889b
00020000-5571-5142-3fbc-fbbbd152fad5	00030000-5571-5142-4036-ae056bd789f5
00020000-5571-5142-3fbc-fbbbd152fad5	00030000-5571-5142-93ce-96779391e44f
00020000-5571-5142-3fbc-fbbbd152fad5	00030000-5571-5142-11df-042bfd461292
00020000-5571-5142-3fbc-fbbbd152fad5	00030000-5571-5142-81e1-9f5d2cdf4e07
00020000-5571-5142-3fbc-fbbbd152fad5	00030000-5571-5142-c91f-5d157a1b6724
00020000-5571-5142-3fbc-fbbbd152fad5	00030000-5571-5142-648c-4929f68ce135
00020000-5571-5142-3fbc-fbbbd152fad5	00030000-5571-5142-90d9-169c3d74358d
00020000-5571-5142-3fbc-fbbbd152fad5	00030000-5571-5142-60a8-1ab0c565f752
00020000-5571-5142-3fbc-fbbbd152fad5	00030000-5571-5142-0657-7a8f12edce8f
00020000-5571-5142-3fbc-fbbbd152fad5	00030000-5571-5142-7908-dd06cac64af2
00020000-5571-5142-3fbc-fbbbd152fad5	00030000-5571-5142-6517-6cafdb521452
00020000-5571-5142-3fbc-fbbbd152fad5	00030000-5571-5142-6f18-6dfdfa276d07
00020000-5571-5142-3fbc-fbbbd152fad5	00030000-5571-5142-1e7e-98774698c0fd
00020000-5571-5142-3fbc-fbbbd152fad5	00030000-5571-5142-a455-64063290c3b7
00020000-5571-5142-3fbc-fbbbd152fad5	00030000-5571-5142-dc51-48dea164cec0
00020000-5571-5142-859e-1b6a115970eb	00030000-5571-5142-993d-a7cd30db3ba3
00020000-5571-5142-859e-1b6a115970eb	00030000-5571-5142-891e-cfbf8a3084a6
00020000-5571-5142-859e-1b6a115970eb	00030000-5571-5142-0bb3-4da81b50889b
00020000-5571-5142-859e-1b6a115970eb	00030000-5571-5142-4036-ae056bd789f5
00020000-5571-5142-859e-1b6a115970eb	00030000-5571-5142-93ce-96779391e44f
00020000-5571-5142-859e-1b6a115970eb	00030000-5571-5142-11df-042bfd461292
00020000-5571-5142-859e-1b6a115970eb	00030000-5571-5142-81e1-9f5d2cdf4e07
00020000-5571-5142-859e-1b6a115970eb	00030000-5571-5142-c91f-5d157a1b6724
00020000-5571-5142-859e-1b6a115970eb	00030000-5571-5142-648c-4929f68ce135
00020000-5571-5142-859e-1b6a115970eb	00030000-5571-5142-90d9-169c3d74358d
00020000-5571-5142-859e-1b6a115970eb	00030000-5571-5142-60a8-1ab0c565f752
00020000-5571-5142-859e-1b6a115970eb	00030000-5571-5142-0657-7a8f12edce8f
00020000-5571-5142-859e-1b6a115970eb	00030000-5571-5142-7908-dd06cac64af2
00020000-5571-5142-859e-1b6a115970eb	00030000-5571-5142-6517-6cafdb521452
00020000-5571-5142-859e-1b6a115970eb	00030000-5571-5142-6f18-6dfdfa276d07
00020000-5571-5142-859e-1b6a115970eb	00030000-5571-5142-18ec-5d94cf80ec3b
00020000-5571-5142-859e-1b6a115970eb	00030000-5571-5142-dd7e-d920634cfd58
00020000-5571-5142-859e-1b6a115970eb	00030000-5571-5142-1e7e-98774698c0fd
00020000-5571-5142-859e-1b6a115970eb	00030000-5571-5142-a455-64063290c3b7
00020000-5571-5142-859e-1b6a115970eb	00030000-5571-5142-dc51-48dea164cec0
\.


--
-- TOC entry 2813 (class 0 OID 6334106)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2817 (class 0 OID 6334137)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2829 (class 0 OID 6334276)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, vrednostdopremiere, aktivna, zaposlenvdrjz, opis) FROM stdin;
\.


--
-- TOC entry 2790 (class 0 OID 6333871)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-5571-5142-e595-c932229a8a47	00040000-5571-5141-083d-3cb581f10095	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5571-5142-8521-81fb2057054c	00040000-5571-5141-083d-3cb581f10095	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5571-5142-1f7f-3a9697c92506	00040000-5571-5141-083d-3cb581f10095	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-5571-5143-2ca8-20ea20873385	00040000-5571-5141-083d-3cb581f10095	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2792 (class 0 OID 6333906)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5571-5141-33d2-baf7d86990c1	8341	Adlešiči
00050000-5571-5141-f78e-e493510f8e7f	5270	Ajdovščina
00050000-5571-5141-649c-2dd49a67ebf4	6280	Ankaran/Ancarano
00050000-5571-5141-092b-db624908a1fd	9253	Apače
00050000-5571-5141-f66b-a62a6e1b9113	8253	Artiče
00050000-5571-5141-3c1e-3b03efb50f4e	4275	Begunje na Gorenjskem
00050000-5571-5141-7974-51ca2bbeedc0	1382	Begunje pri Cerknici
00050000-5571-5141-eac4-faf1e9d83c2a	9231	Beltinci
00050000-5571-5141-5230-0493312f230c	2234	Benedikt
00050000-5571-5141-a0dc-f222138902c4	2345	Bistrica ob Dravi
00050000-5571-5141-a55c-f6b7a3ecfb9f	3256	Bistrica ob Sotli
00050000-5571-5141-8a47-9ba3c56656f6	8259	Bizeljsko
00050000-5571-5141-3f39-d347c5e55267	1223	Blagovica
00050000-5571-5141-e60d-b986fc7919ab	8283	Blanca
00050000-5571-5141-84a5-a2c6aa0e9489	4260	Bled
00050000-5571-5141-c24e-f11970cda628	4273	Blejska Dobrava
00050000-5571-5141-d614-22bd59fdf7c9	9265	Bodonci
00050000-5571-5141-0416-2ebaff9e1d9f	9222	Bogojina
00050000-5571-5141-a439-140e54d8c8a5	4263	Bohinjska Bela
00050000-5571-5141-2d54-f36065addf87	4264	Bohinjska Bistrica
00050000-5571-5141-1f02-f834d7163ba7	4265	Bohinjsko jezero
00050000-5571-5141-20f6-140945414f03	1353	Borovnica
00050000-5571-5141-2925-76062ed357f8	8294	Boštanj
00050000-5571-5141-5160-09e85969cc8e	5230	Bovec
00050000-5571-5141-8f98-bcbf1a6464ed	5295	Branik
00050000-5571-5141-841e-24cce88da716	3314	Braslovče
00050000-5571-5141-7146-e51baaec25f1	5223	Breginj
00050000-5571-5141-65a9-fdcde79220b9	8280	Brestanica
00050000-5571-5141-6fdb-6a35d7437dfa	2354	Bresternica
00050000-5571-5141-2747-8ea15e57cd76	4243	Brezje
00050000-5571-5141-e2f4-b5c535591ed3	1351	Brezovica pri Ljubljani
00050000-5571-5141-6170-4b39d45d5e4c	8250	Brežice
00050000-5571-5141-8485-49dcffe4e2be	4210	Brnik - Aerodrom
00050000-5571-5141-8f10-31c56e18b9b2	8321	Brusnice
00050000-5571-5141-04d5-c8b3134c3c94	3255	Buče
00050000-5571-5141-f66f-a22ea4ac6e35	8276	Bučka 
00050000-5571-5141-2bd6-793dc338f40d	9261	Cankova
00050000-5571-5141-f5ce-b6bdac14f3f3	3000	Celje 
00050000-5571-5141-ece3-0883ef0be9ab	3001	Celje - poštni predali
00050000-5571-5141-7a74-934e2540b039	4207	Cerklje na Gorenjskem
00050000-5571-5141-1466-608c759be091	8263	Cerklje ob Krki
00050000-5571-5141-66b4-e87f1fbbb70e	1380	Cerknica
00050000-5571-5141-e886-939174802150	5282	Cerkno
00050000-5571-5141-701a-7592eec62b0a	2236	Cerkvenjak
00050000-5571-5141-16e5-0aa1dc047dfb	2215	Ceršak
00050000-5571-5141-b7e8-11fed4d1c438	2326	Cirkovce
00050000-5571-5141-2cd4-0379a7e27eac	2282	Cirkulane
00050000-5571-5141-ac2d-8b6a7f473bf3	5273	Col
00050000-5571-5141-6aaf-6b780b051384	8251	Čatež ob Savi
00050000-5571-5141-0e1a-e4ea3ba3fda2	1413	Čemšenik
00050000-5571-5141-4334-aae2d192418d	5253	Čepovan
00050000-5571-5141-85a8-c16303abc862	9232	Črenšovci
00050000-5571-5141-955b-e6b0442029fb	2393	Črna na Koroškem
00050000-5571-5141-dd85-5f8b9084a8b2	6275	Črni Kal
00050000-5571-5141-2f21-0b235b0a42df	5274	Črni Vrh nad Idrijo
00050000-5571-5141-6452-a809e8a410d2	5262	Črniče
00050000-5571-5141-0708-cc0ccdd01664	8340	Črnomelj
00050000-5571-5141-2541-afdd8cbff468	6271	Dekani
00050000-5571-5141-b4d6-8ebdacedc2ca	5210	Deskle
00050000-5571-5141-0654-c43fa3053fd0	2253	Destrnik
00050000-5571-5141-8702-ad1fbba433ab	6215	Divača
00050000-5571-5141-7392-685aa71d994c	1233	Dob
00050000-5571-5141-6579-d5f6e2431f12	3224	Dobje pri Planini
00050000-5571-5141-b3e1-30e7d2ba85c0	8257	Dobova
00050000-5571-5141-10d0-d6d853507679	1423	Dobovec
00050000-5571-5141-9ba7-1df40c8fa080	5263	Dobravlje
00050000-5571-5141-e040-b97b63b529ca	3204	Dobrna
00050000-5571-5141-e3ad-8c9b9607e7c8	8211	Dobrnič
00050000-5571-5141-73dd-2510dbd7d90d	1356	Dobrova
00050000-5571-5141-314c-0263e0e3b039	9223	Dobrovnik/Dobronak 
00050000-5571-5141-8a2a-530a1c59b334	5212	Dobrovo v Brdih
00050000-5571-5141-9512-09841d2b42f0	1431	Dol pri Hrastniku
00050000-5571-5141-53f9-86019118cce8	1262	Dol pri Ljubljani
00050000-5571-5141-bf02-e1126eb6c331	1273	Dole pri Litiji
00050000-5571-5141-72bc-cb24fc2d2fdf	1331	Dolenja vas
00050000-5571-5141-9066-9bb391ba0228	8350	Dolenjske Toplice
00050000-5571-5141-e569-35d3a24bfb96	1230	Domžale
00050000-5571-5141-065b-99d2c35f4d7c	2252	Dornava
00050000-5571-5141-6be4-7e6903a9d4c3	5294	Dornberk
00050000-5571-5141-6c85-acba1b7eb015	1319	Draga
00050000-5571-5141-0318-b9ba3626a1de	8343	Dragatuš
00050000-5571-5141-cdb2-8a0c43cdfad7	3222	Dramlje
00050000-5571-5141-719c-271d582ba7cc	2370	Dravograd
00050000-5571-5141-8443-b17c61814a35	4203	Duplje
00050000-5571-5141-91df-4b5fc38913d8	6221	Dutovlje
00050000-5571-5141-f8b6-7f7b71e9e083	8361	Dvor
00050000-5571-5141-a9f7-98312ce23d4d	2343	Fala
00050000-5571-5141-c51f-1cd025de61e1	9208	Fokovci
00050000-5571-5141-df38-ddd175afb5c5	2313	Fram
00050000-5571-5141-ac43-e3acf65b1fab	3213	Frankolovo
00050000-5571-5141-023c-cda4846fb271	1274	Gabrovka
00050000-5571-5141-5ab2-868b909cfe21	8254	Globoko
00050000-5571-5141-5759-8b06427f49a5	5275	Godovič
00050000-5571-5141-b03f-d4a17275b3e8	4204	Golnik
00050000-5571-5141-af03-18e20a70b4a6	3303	Gomilsko
00050000-5571-5141-f4f3-7144b1ec8943	4224	Gorenja vas
00050000-5571-5141-f240-d05def74843d	3263	Gorica pri Slivnici
00050000-5571-5141-20fb-a09a12a77505	2272	Gorišnica
00050000-5571-5141-9d19-8f2c944af21b	9250	Gornja Radgona
00050000-5571-5141-7533-3d931b551ae1	3342	Gornji Grad
00050000-5571-5141-37a2-03a1b1c7ba91	4282	Gozd Martuljek
00050000-5571-5141-defd-7de60ab7ece8	6272	Gračišče
00050000-5571-5141-b1d5-fea8774599c6	9264	Grad
00050000-5571-5141-a34e-b1bcb0772122	8332	Gradac
00050000-5571-5141-b216-95183f08fbb8	1384	Grahovo
00050000-5571-5141-af04-5d4d5b25af70	5242	Grahovo ob Bači
00050000-5571-5141-a7c2-c9264601a757	5251	Grgar
00050000-5571-5141-6d8d-eea176b8a252	3302	Griže
00050000-5571-5141-1305-d0acbd7ca8a0	3231	Grobelno
00050000-5571-5141-bc50-93eb63f07c4e	1290	Grosuplje
00050000-5571-5141-c281-77ab0bd2e2ee	2288	Hajdina
00050000-5571-5141-0c80-521fda3ea970	8362	Hinje
00050000-5571-5141-63b4-159395fff170	2311	Hoče
00050000-5571-5141-c992-6a19efc41cc3	9205	Hodoš/Hodos
00050000-5571-5141-48cb-80e1b1fa78b9	1354	Horjul
00050000-5571-5141-a12d-a4449edbb047	1372	Hotedršica
00050000-5571-5141-da92-f1df424184de	1430	Hrastnik
00050000-5571-5141-274e-f69c8581e6a7	6225	Hruševje
00050000-5571-5141-cbe3-7bac32c0c0c7	4276	Hrušica
00050000-5571-5141-a8a4-2cbb1b5deb34	5280	Idrija
00050000-5571-5141-36ad-9488be25aa12	1292	Ig
00050000-5571-5141-3a69-de1b6e36b666	6250	Ilirska Bistrica
00050000-5571-5141-5efa-71358bf01fe8	6251	Ilirska Bistrica-Trnovo
00050000-5571-5141-0d22-92a520942f45	1295	Ivančna Gorica
00050000-5571-5141-08d4-51b08768afc2	2259	Ivanjkovci
00050000-5571-5141-8db3-d28fb301d901	1411	Izlake
00050000-5571-5141-80ea-d513a75d68b3	6310	Izola/Isola
00050000-5571-5141-fbfa-22ec6400d1fe	2222	Jakobski Dol
00050000-5571-5141-a411-e12ac8271dbc	2221	Jarenina
00050000-5571-5141-b0da-b3701afe8919	6254	Jelšane
00050000-5571-5141-d1d6-d6d9f8c4a543	4270	Jesenice
00050000-5571-5141-1bad-c64c58a837a2	8261	Jesenice na Dolenjskem
00050000-5571-5141-7660-3e4128b48083	3273	Jurklošter
00050000-5571-5141-89b8-a19edd6348d6	2223	Jurovski Dol
00050000-5571-5141-4ce8-0748aaf93aa9	2256	Juršinci
00050000-5571-5141-af13-41c6e61a2585	5214	Kal nad Kanalom
00050000-5571-5141-f062-5aacc4949aec	3233	Kalobje
00050000-5571-5141-0bd7-754e9bda85d1	4246	Kamna Gorica
00050000-5571-5141-052c-ef5ee6fff6e4	2351	Kamnica
00050000-5571-5141-e91a-3388f20af8ee	1241	Kamnik
00050000-5571-5141-9b97-9e22076ba5d7	5213	Kanal
00050000-5571-5141-73dc-beec41b32c60	8258	Kapele
00050000-5571-5141-af0f-7b9ab86f5499	2362	Kapla
00050000-5571-5141-1624-7c3f432249c9	2325	Kidričevo
00050000-5571-5141-67d2-98a05a6138bf	1412	Kisovec
00050000-5571-5141-b8b2-6d793fc38672	6253	Knežak
00050000-5571-5141-b8d1-fc6d09ddab2d	5222	Kobarid
00050000-5571-5141-738c-0facc5e47b7b	9227	Kobilje
00050000-5571-5141-a778-e1ddcb9c6c97	1330	Kočevje
00050000-5571-5141-b65d-4320d78c5901	1338	Kočevska Reka
00050000-5571-5141-7e99-d012b621dd9d	2276	Kog
00050000-5571-5141-50e4-a0ce7c1b95c0	5211	Kojsko
00050000-5571-5141-2a62-6bd0ed1b53e7	6223	Komen
00050000-5571-5141-5ca7-462469c34e84	1218	Komenda
00050000-5571-5141-11f0-0d0bb1759f01	6000	Koper/Capodistria 
00050000-5571-5141-4fc5-7ef2d5d43340	6001	Koper/Capodistria - poštni predali
00050000-5571-5141-a5e3-ef3cbc199a27	8282	Koprivnica
00050000-5571-5141-b700-6e95e77f5ef9	5296	Kostanjevica na Krasu
00050000-5571-5141-9848-7b9126d0a73c	8311	Kostanjevica na Krki
00050000-5571-5141-d890-b292780ec41c	1336	Kostel
00050000-5571-5141-9f5c-ad6e6cf3fc71	6256	Košana
00050000-5571-5141-35f9-83d629799125	2394	Kotlje
00050000-5571-5141-f1ba-b09f4386b7a9	6240	Kozina
00050000-5571-5141-d073-d4873c3b0393	3260	Kozje
00050000-5571-5141-f79c-3a2cf7134686	4000	Kranj 
00050000-5571-5141-8b3a-7cb6743adf16	4001	Kranj - poštni predali
00050000-5571-5141-7364-cdbe543458d0	4280	Kranjska Gora
00050000-5571-5141-419b-67fecb150b6c	1281	Kresnice
00050000-5571-5141-26bc-f2d9995aba8c	4294	Križe
00050000-5571-5141-dc0b-208623c295bb	9206	Križevci
00050000-5571-5141-0bae-3b7004bfdcfd	9242	Križevci pri Ljutomeru
00050000-5571-5141-3cd7-92caa005ed6d	1301	Krka
00050000-5571-5141-021e-5f5ee8d5e59b	8296	Krmelj
00050000-5571-5141-e1c5-2b8e02084f4e	4245	Kropa
00050000-5571-5141-426a-6c09a49cca2c	8262	Krška vas
00050000-5571-5141-62db-37fed93e9de0	8270	Krško
00050000-5571-5141-481a-b1c52a7001dc	9263	Kuzma
00050000-5571-5141-0625-99a73f38a50f	2318	Laporje
00050000-5571-5141-0e6d-2be0eab89e16	3270	Laško
00050000-5571-5141-8d1b-7903420303ef	1219	Laze v Tuhinju
00050000-5571-5141-a4b5-24188fb66d3d	2230	Lenart v Slovenskih goricah
00050000-5571-5141-a314-f2887f597b64	9220	Lendava/Lendva
00050000-5571-5141-30b7-7cb9b1eeec27	4248	Lesce
00050000-5571-5141-fc7d-44c07000fcf9	3261	Lesično
00050000-5571-5141-9cfa-679027308525	8273	Leskovec pri Krškem
00050000-5571-5141-6e27-7a2707c1d4af	2372	Libeliče
00050000-5571-5141-456b-37b68fa7dd5c	2341	Limbuš
00050000-5571-5141-1cf5-09e531333463	1270	Litija
00050000-5571-5141-51a9-532a3d953bc8	3202	Ljubečna
00050000-5571-5141-d498-607791a293a7	1000	Ljubljana 
00050000-5571-5141-6ee7-b4270ec538f0	1001	Ljubljana - poštni predali
00050000-5571-5141-8437-2bd95d917ee9	1231	Ljubljana - Črnuče
00050000-5571-5141-bb90-a5182e58b295	1261	Ljubljana - Dobrunje
00050000-5571-5141-5f42-ab0b7ca7460d	1260	Ljubljana - Polje
00050000-5571-5141-20f1-3a4e9cd388bc	1210	Ljubljana - Šentvid
00050000-5571-5141-5a1c-50cd3b53629c	1211	Ljubljana - Šmartno
00050000-5571-5141-70ad-67e2e90a9733	3333	Ljubno ob Savinji
00050000-5571-5141-04e7-515fc1e52e76	9240	Ljutomer
00050000-5571-5141-a180-c9d04c60ba54	3215	Loče
00050000-5571-5141-4286-79de03a11356	5231	Log pod Mangartom
00050000-5571-5141-ea56-2e77724b03c9	1358	Log pri Brezovici
00050000-5571-5141-2dd2-3011ec60f46c	1370	Logatec
00050000-5571-5141-dd8d-aae06448fb8a	1371	Logatec
00050000-5571-5141-ecd5-c28a03dfef0d	1434	Loka pri Zidanem Mostu
00050000-5571-5141-3cce-e1e9ddc7b601	3223	Loka pri Žusmu
00050000-5571-5141-f48d-538410dc9f35	6219	Lokev
00050000-5571-5141-81c9-e9ff9eb3a78e	1318	Loški Potok
00050000-5571-5141-7a97-d092d4dd3ad2	2324	Lovrenc na Dravskem polju
00050000-5571-5141-6aee-42dbc60d8a00	2344	Lovrenc na Pohorju
00050000-5571-5141-8f2e-1ad77a4766f7	3334	Luče
00050000-5571-5141-77ba-4f78c52e8ee3	1225	Lukovica
00050000-5571-5141-51c2-445920d2e90d	9202	Mačkovci
00050000-5571-5141-0362-2afe59c7d89b	2322	Majšperk
00050000-5571-5141-0bba-a6d584105d43	2321	Makole
00050000-5571-5141-e643-148322344057	9243	Mala Nedelja
00050000-5571-5141-6ba0-1a4592134ef8	2229	Malečnik
00050000-5571-5141-a3ff-776e6b1757eb	6273	Marezige
00050000-5571-5141-24ca-c332d3a41286	2000	Maribor 
00050000-5571-5141-dbce-8add2d0ad448	2001	Maribor - poštni predali
00050000-5571-5141-cdcd-90247bf88749	2206	Marjeta na Dravskem polju
00050000-5571-5141-d611-935527d7ecf8	2281	Markovci
00050000-5571-5141-6c6d-7efeb063374c	9221	Martjanci
00050000-5571-5141-99fb-532a188551b8	6242	Materija
00050000-5571-5141-c1ff-065b441db17c	4211	Mavčiče
00050000-5571-5141-d4a3-c0955ce110a3	1215	Medvode
00050000-5571-5141-2f57-0c9c403be2a8	1234	Mengeš
00050000-5571-5141-908f-36dc5855f16b	8330	Metlika
00050000-5571-5141-0bf2-8267fd6b9057	2392	Mežica
00050000-5571-5141-0ef9-d82e5a472bd3	2204	Miklavž na Dravskem polju
00050000-5571-5141-0fe8-c965479ba6b2	2275	Miklavž pri Ormožu
00050000-5571-5141-e989-7f4745368cc1	5291	Miren
00050000-5571-5141-3b3b-c0d0fac33cb5	8233	Mirna
00050000-5571-5141-163f-758326d71b1d	8216	Mirna Peč
00050000-5571-5141-8927-930927aa143e	2382	Mislinja
00050000-5571-5141-382e-58608ae1631d	4281	Mojstrana
00050000-5571-5141-355f-b4967f35594c	8230	Mokronog
00050000-5571-5141-771f-abf8b93e1b34	1251	Moravče
00050000-5571-5141-ebbc-91c2c02b83a4	9226	Moravske Toplice
00050000-5571-5141-737e-afbc6150321c	5216	Most na Soči
00050000-5571-5141-d31e-8b902e8efa46	1221	Motnik
00050000-5571-5141-75b7-6cbd74b1f833	3330	Mozirje
00050000-5571-5141-5c57-456846aeb58c	9000	Murska Sobota 
00050000-5571-5141-212b-4881f8977667	9001	Murska Sobota - poštni predali
00050000-5571-5141-7f18-03da63950da3	2366	Muta
00050000-5571-5141-6bef-a060b736752a	4202	Naklo
00050000-5571-5141-d264-e5a0e6711b54	3331	Nazarje
00050000-5571-5141-17d6-b95fed5c4d6a	1357	Notranje Gorice
00050000-5571-5141-9415-74452fb5b8cb	3203	Nova Cerkev
00050000-5571-5141-f46e-e87f9fb6faca	5000	Nova Gorica 
00050000-5571-5141-0597-baf3954ace73	5001	Nova Gorica - poštni predali
00050000-5571-5141-6764-29049938e7de	1385	Nova vas
00050000-5571-5141-f986-ee60c4b40958	8000	Novo mesto
00050000-5571-5141-3cc5-082d50632968	8001	Novo mesto - poštni predali
00050000-5571-5141-6c1e-40a272b29521	6243	Obrov
00050000-5571-5141-2421-172685b7978b	9233	Odranci
00050000-5571-5141-41a7-a26d1814c799	2317	Oplotnica
00050000-5571-5141-4f81-df8b831cff66	2312	Orehova vas
00050000-5571-5141-3ff4-d11fc7138d9a	2270	Ormož
00050000-5571-5141-94bd-0e61f6535ed0	1316	Ortnek
00050000-5571-5141-9b6d-40cc2dcd36f6	1337	Osilnica
00050000-5571-5141-01db-17834c2a71f4	8222	Otočec
00050000-5571-5141-10a9-c39a49f363da	2361	Ožbalt
00050000-5571-5141-2512-0c4e5b943892	2231	Pernica
00050000-5571-5141-b2fa-4c911e3c88b8	2211	Pesnica pri Mariboru
00050000-5571-5141-4c1f-935fdc13c3fa	9203	Petrovci
00050000-5571-5141-1bab-f5ac3e39e439	3301	Petrovče
00050000-5571-5141-12f6-215eea06bf57	6330	Piran/Pirano
00050000-5571-5141-13e7-34d224a747f8	8255	Pišece
00050000-5571-5141-d148-3c0fc6ffcdd4	6257	Pivka
00050000-5571-5141-4013-1939047a1d80	6232	Planina
00050000-5571-5141-188b-d58ca780eb97	3225	Planina pri Sevnici
00050000-5571-5141-6994-8435d08c06b5	6276	Pobegi
00050000-5571-5141-a507-134e675b0bc6	8312	Podbočje
00050000-5571-5141-950e-d38ac8366f2b	5243	Podbrdo
00050000-5571-5141-15be-4d6bba7fb08b	3254	Podčetrtek
00050000-5571-5141-9590-0f0f138a3b60	2273	Podgorci
00050000-5571-5141-1d1f-27372a4d2a01	6216	Podgorje
00050000-5571-5141-c27e-e742cc4a39ab	2381	Podgorje pri Slovenj Gradcu
00050000-5571-5141-3bd9-c50a0b0ba367	6244	Podgrad
00050000-5571-5141-4b25-23b3f826bab5	1414	Podkum
00050000-5571-5141-4446-699c7e7fc7eb	2286	Podlehnik
00050000-5571-5141-9b5a-2fdf4720852c	5272	Podnanos
00050000-5571-5141-f446-1d067cbeb371	4244	Podnart
00050000-5571-5141-c99e-b9040a13946b	3241	Podplat
00050000-5571-5141-4a55-b3e33b0886f4	3257	Podsreda
00050000-5571-5141-1dde-4d6756f97edb	2363	Podvelka
00050000-5571-5141-4137-8bc397dd1de1	2208	Pohorje
00050000-5571-5141-ef27-f96acaba0088	2257	Polenšak
00050000-5571-5141-3aac-ad4571731fa5	1355	Polhov Gradec
00050000-5571-5141-a46c-d1fbc3fc568c	4223	Poljane nad Škofjo Loko
00050000-5571-5141-a66c-854fb6ec19f8	2319	Poljčane
00050000-5571-5141-c8c5-b573d8b3597d	1272	Polšnik
00050000-5571-5141-467d-7c95bab9ec63	3313	Polzela
00050000-5571-5141-34af-67429e8e4b2f	3232	Ponikva
00050000-5571-5141-ba59-2a167526b6d5	6320	Portorož/Portorose
00050000-5571-5141-cc9d-009b641109ad	6230	Postojna
00050000-5571-5141-2a0d-cf09f6b07607	2331	Pragersko
00050000-5571-5141-ded0-b7ea21a550d4	3312	Prebold
00050000-5571-5141-c965-1a119dcb4ab1	4205	Preddvor
00050000-5571-5141-db66-a6bec7086c7f	6255	Prem
00050000-5571-5141-640b-39a00fc9c0a4	1352	Preserje
00050000-5571-5141-f16c-5c05fa67d507	6258	Prestranek
00050000-5571-5141-a2bf-49ef1013af3f	2391	Prevalje
00050000-5571-5141-a2ce-0bfdddd1e2dc	3262	Prevorje
00050000-5571-5141-8ece-f50853ef79bb	1276	Primskovo 
00050000-5571-5141-64ce-fd282469ba98	3253	Pristava pri Mestinju
00050000-5571-5141-04ca-7aef687d67f2	9207	Prosenjakovci/Partosfalva
00050000-5571-5141-75ee-44b6f3458973	5297	Prvačina
00050000-5571-5141-a379-e087bac6deef	2250	Ptuj
00050000-5571-5141-fe3f-4470fe73573e	2323	Ptujska Gora
00050000-5571-5141-4e4a-636ed5330abc	9201	Puconci
00050000-5571-5141-0ce9-4f45133bc9c8	2327	Rače
00050000-5571-5141-1593-c0e01daa4694	1433	Radeče
00050000-5571-5141-7871-e4ffafc7f0b7	9252	Radenci
00050000-5571-5141-27c1-c79f36e16a42	2360	Radlje ob Dravi
00050000-5571-5141-54d2-bd0275a08042	1235	Radomlje
00050000-5571-5141-a09f-7136a79f7c86	4240	Radovljica
00050000-5571-5141-730c-7f8ee64ea3c3	8274	Raka
00050000-5571-5141-b484-ccefd8cf967c	1381	Rakek
00050000-5571-5141-ce99-4a2ef64ebf39	4283	Rateče - Planica
00050000-5571-5141-62d6-7c808b6c25a4	2390	Ravne na Koroškem
00050000-5571-5141-1b0e-58f139928a9f	9246	Razkrižje
00050000-5571-5141-dac3-cfdd9fcf70a4	3332	Rečica ob Savinji
00050000-5571-5141-6219-2d8dd246a3c8	5292	Renče
00050000-5571-5141-6db8-c0dc315c4ab9	1310	Ribnica
00050000-5571-5141-0835-42d260a31539	2364	Ribnica na Pohorju
00050000-5571-5141-43c6-1f1a49994428	3272	Rimske Toplice
00050000-5571-5141-1f18-32ca997c5dab	1314	Rob
00050000-5571-5141-b41e-f8b088443460	5215	Ročinj
00050000-5571-5141-4dbb-75a259fd4ad8	3250	Rogaška Slatina
00050000-5571-5141-7db5-0b9e70dd548c	9262	Rogašovci
00050000-5571-5141-cc45-5bbef7b34e84	3252	Rogatec
00050000-5571-5141-f256-ab880703cfde	1373	Rovte
00050000-5571-5141-7002-2c1b656f056c	2342	Ruše
00050000-5571-5141-7bd9-3db4e1153eb0	1282	Sava
00050000-5571-5141-2fd1-4d1f2e59f713	6333	Sečovlje/Sicciole
00050000-5571-5141-0d06-1ffc6310d5cd	4227	Selca
00050000-5571-5141-9785-e8713baf487e	2352	Selnica ob Dravi
00050000-5571-5141-e34a-d0925a4d794d	8333	Semič
00050000-5571-5141-8005-23fe10b769f4	8281	Senovo
00050000-5571-5141-ed90-721947382e38	6224	Senožeče
00050000-5571-5141-a2dc-18630f03258f	8290	Sevnica
00050000-5571-5141-f20a-89dd678333b8	6210	Sežana
00050000-5571-5141-07f7-d616bb2a394b	2214	Sladki Vrh
00050000-5571-5141-fe7e-2c98b4664e71	5283	Slap ob Idrijci
00050000-5571-5141-c0a6-529344fbfffa	2380	Slovenj Gradec
00050000-5571-5141-04b9-60720109c1d9	2310	Slovenska Bistrica
00050000-5571-5141-2d8e-fb15044f6e10	3210	Slovenske Konjice
00050000-5571-5141-a711-c6c56a553106	1216	Smlednik
00050000-5571-5141-35da-f3cf7020b22a	5232	Soča
00050000-5571-5141-505e-fc41a982a22d	1317	Sodražica
00050000-5571-5141-e1da-6f4749eca5fc	3335	Solčava
00050000-5571-5141-8121-9323f78b4155	5250	Solkan
00050000-5571-5141-13d3-2836c7a685ed	4229	Sorica
00050000-5571-5141-1bfc-0cc525b83393	4225	Sovodenj
00050000-5571-5141-8d68-b25ac2a20ece	5281	Spodnja Idrija
00050000-5571-5141-3240-88a8e39e549f	2241	Spodnji Duplek
00050000-5571-5141-c885-00db834098b2	9245	Spodnji Ivanjci
00050000-5571-5141-9c9b-2d001809006f	2277	Središče ob Dravi
00050000-5571-5141-ec7d-c92fb0a7c697	4267	Srednja vas v Bohinju
00050000-5571-5141-4e54-04358a4538c7	8256	Sromlje 
00050000-5571-5141-0f63-4b755eb7209f	5224	Srpenica
00050000-5571-5141-f500-5bad44b9bbd0	1242	Stahovica
00050000-5571-5141-88f8-24c73cb81e1d	1332	Stara Cerkev
00050000-5571-5141-e6a6-31cb60de8dae	8342	Stari trg ob Kolpi
00050000-5571-5141-57bd-c9cde91a6f6c	1386	Stari trg pri Ložu
00050000-5571-5141-5ff9-b0d18b6e1d4c	2205	Starše
00050000-5571-5141-5384-89f176c7adb0	2289	Stoperce
00050000-5571-5141-a658-336b847db115	8322	Stopiče
00050000-5571-5141-cb9f-a26594441a0d	3206	Stranice
00050000-5571-5141-8e3f-81985937ab44	8351	Straža
00050000-5571-5141-420e-dd8d27778955	1313	Struge
00050000-5571-5141-162b-f7f640e99c65	8293	Studenec
00050000-5571-5141-d74d-e055def3fcd5	8331	Suhor
00050000-5571-5141-618c-915772527fb2	2233	Sv. Ana v Slovenskih goricah
00050000-5571-5141-aaf5-1eedff29494d	2235	Sv. Trojica v Slovenskih goricah
00050000-5571-5141-b0cb-0132cfa7ef3f	2353	Sveti Duh na Ostrem Vrhu
00050000-5571-5141-e764-077c39836fd2	9244	Sveti Jurij ob Ščavnici
00050000-5571-5141-1c4f-0e57116feb78	3264	Sveti Štefan
00050000-5571-5141-9ed5-6522cc73f7ea	2258	Sveti Tomaž
00050000-5571-5141-686a-05cc39c38f61	9204	Šalovci
00050000-5571-5141-431d-e7a4302c511e	5261	Šempas
00050000-5571-5141-c3d8-6e8822368162	5290	Šempeter pri Gorici
00050000-5571-5141-cc80-a8228159806f	3311	Šempeter v Savinjski dolini
00050000-5571-5141-16a6-5b31bf27f7c8	4208	Šenčur
00050000-5571-5141-313a-da48f1d2c0e4	2212	Šentilj v Slovenskih goricah
00050000-5571-5141-1abf-fd109f572953	8297	Šentjanž
00050000-5571-5141-10e9-dd449ef81046	2373	Šentjanž pri Dravogradu
00050000-5571-5141-f0b5-eda9fae51551	8310	Šentjernej
00050000-5571-5141-2c36-682a0b8d95c4	3230	Šentjur
00050000-5571-5141-bd2d-a49bc1ed92ba	3271	Šentrupert
00050000-5571-5141-1a06-d3eab3ce0178	8232	Šentrupert
00050000-5571-5141-6265-bae7a0125d2c	1296	Šentvid pri Stični
00050000-5571-5141-0c4c-67b8f9ad72fa	8275	Škocjan
00050000-5571-5141-cab0-a018502565f0	6281	Škofije
00050000-5571-5141-3070-e7edd7ccbfa5	4220	Škofja Loka
00050000-5571-5141-a08f-94119b6932ae	3211	Škofja vas
00050000-5571-5141-4b44-30100e4fb4c7	1291	Škofljica
00050000-5571-5141-08b4-3a3cd627bf47	6274	Šmarje
00050000-5571-5141-fdd7-7456d05cc21e	1293	Šmarje - Sap
00050000-5571-5141-b3ea-93e670edf523	3240	Šmarje pri Jelšah
00050000-5571-5141-bb63-5488aea8dc63	8220	Šmarješke Toplice
00050000-5571-5141-ac2d-dd7f7b19515d	2315	Šmartno na Pohorju
00050000-5571-5141-08e7-645cdb9c24cb	3341	Šmartno ob Dreti
00050000-5571-5141-d0cc-6ef4aff17f27	3327	Šmartno ob Paki
00050000-5571-5141-4a67-97fc19dfe9fb	1275	Šmartno pri Litiji
00050000-5571-5141-3afc-c897c84c93bd	2383	Šmartno pri Slovenj Gradcu
00050000-5571-5141-0187-515fabef2122	3201	Šmartno v Rožni dolini
00050000-5571-5141-517f-011488cb2e38	3325	Šoštanj
00050000-5571-5141-0e2e-ae99e9e902f1	6222	Štanjel
00050000-5571-5141-6e6c-cb628178ff6c	3220	Štore
00050000-5571-5141-a220-c86077c877af	3304	Tabor
00050000-5571-5141-cd17-6e20055b4db0	3221	Teharje
00050000-5571-5141-2ebb-1eec7ce1d682	9251	Tišina
00050000-5571-5141-82e1-e70e9deac81b	5220	Tolmin
00050000-5571-5141-e16b-209d16ee1de0	3326	Topolšica
00050000-5571-5141-09de-619fcd812b94	2371	Trbonje
00050000-5571-5141-d6c7-8fb876eaced7	1420	Trbovlje
00050000-5571-5141-3a71-6e85a057ffd8	8231	Trebelno 
00050000-5571-5141-0ae4-ee2b13cf203d	8210	Trebnje
00050000-5571-5141-8038-85adefc61fe9	5252	Trnovo pri Gorici
00050000-5571-5141-cf6c-29a3dca0acac	2254	Trnovska vas
00050000-5571-5141-5670-e93530483c2a	1222	Trojane
00050000-5571-5141-62eb-4245289cc8f5	1236	Trzin
00050000-5571-5141-ccab-3a6c9d2aadbc	4290	Tržič
00050000-5571-5141-9b73-b69a9e240546	8295	Tržišče
00050000-5571-5141-8f56-3dd03494a08c	1311	Turjak
00050000-5571-5141-a530-3ed82cb7ce57	9224	Turnišče
00050000-5571-5141-d721-da86bcf18723	8323	Uršna sela
00050000-5571-5141-4f11-a23db4b369f6	1252	Vače
00050000-5571-5141-08fe-0a4dc2500e56	3320	Velenje 
00050000-5571-5141-7e50-8d26bf6b5490	3322	Velenje - poštni predali
00050000-5571-5141-44a2-8542b19ce8ee	8212	Velika Loka
00050000-5571-5141-7a2d-e801cbcc338c	2274	Velika Nedelja
00050000-5571-5141-b3f9-1622596b4930	9225	Velika Polana
00050000-5571-5141-6412-d25a18434e51	1315	Velike Lašče
00050000-5571-5141-d1fa-139477d42778	8213	Veliki Gaber
00050000-5571-5141-7711-e340a873c5b0	9241	Veržej
00050000-5571-5141-82e7-9f0a9ec5f143	1312	Videm - Dobrepolje
00050000-5571-5141-47f7-06d21c2646fe	2284	Videm pri Ptuju
00050000-5571-5141-8d14-3124f3f68a89	8344	Vinica
00050000-5571-5141-d644-6e64e4b05203	5271	Vipava
00050000-5571-5141-ccd7-c077cad79999	4212	Visoko
00050000-5571-5141-9952-9b61e27bdd87	1294	Višnja Gora
00050000-5571-5141-0364-99915d2cb98e	3205	Vitanje
00050000-5571-5141-2d42-7053801a44b0	2255	Vitomarci
00050000-5571-5141-3771-947cdaca1d12	1217	Vodice
00050000-5571-5141-9b67-851de7509e56	3212	Vojnik\t
00050000-5571-5141-2e8d-def0ce1fdaa9	5293	Volčja Draga
00050000-5571-5141-ecb9-36d33f2f6fe9	2232	Voličina
00050000-5571-5141-d044-52fa3aad1b6d	3305	Vransko
00050000-5571-5141-1af7-c0b6154384f3	6217	Vremski Britof
00050000-5571-5141-59c1-7d119158c0a7	1360	Vrhnika
00050000-5571-5141-3c0f-0d69d33e0c93	2365	Vuhred
00050000-5571-5141-21c0-3769e176c3a1	2367	Vuzenica
00050000-5571-5141-99ab-438b60121994	8292	Zabukovje 
00050000-5571-5141-1243-d4a487a1e953	1410	Zagorje ob Savi
00050000-5571-5141-6285-8d016e2163d1	1303	Zagradec
00050000-5571-5141-a815-72dd9b0c7aac	2283	Zavrč
00050000-5571-5141-31d3-0e62400b17e0	8272	Zdole 
00050000-5571-5141-3f9d-37ca74e295a3	4201	Zgornja Besnica
00050000-5571-5141-c729-c201ea55ee15	2242	Zgornja Korena
00050000-5571-5141-8807-c4cb0ac80673	2201	Zgornja Kungota
00050000-5571-5141-bba0-b91be1a04e53	2316	Zgornja Ložnica
00050000-5571-5141-5bbb-69f5065f22d2	2314	Zgornja Polskava
00050000-5571-5141-8b5c-943f616ced5e	2213	Zgornja Velka
00050000-5571-5141-dae9-4ea7f35d16fd	4247	Zgornje Gorje
00050000-5571-5141-9ef5-05bc5376470a	4206	Zgornje Jezersko
00050000-5571-5141-148b-d7f6cf745b57	2285	Zgornji Leskovec
00050000-5571-5141-1e04-e43b350f997b	1432	Zidani Most
00050000-5571-5141-172b-6eba4d6a4cb3	3214	Zreče
00050000-5571-5141-0235-38b8bf194935	4209	Žabnica
00050000-5571-5141-2b74-1b23d150daa7	3310	Žalec
00050000-5571-5141-d860-147fb3b83e17	4228	Železniki
00050000-5571-5141-3d0a-e56a4451991e	2287	Žetale
00050000-5571-5141-1c0b-794a8d89c7c5	4226	Žiri
00050000-5571-5141-c6cd-a9df3b564b07	4274	Žirovnica
00050000-5571-5141-809d-5ddb09c804ee	8360	Žužemberk
\.


--
-- TOC entry 2809 (class 0 OID 6334080)
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
-- TOC entry 2791 (class 0 OID 6333891)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2797 (class 0 OID 6333969)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2811 (class 0 OID 6334092)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2824 (class 0 OID 6334213)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 6334268)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5571-5143-6a7a-fb25ebcb5dcc	00080000-5571-5142-1f7f-3a9697c92506	0987	A
00190000-5571-5143-076a-742443bc64be	00080000-5571-5142-8521-81fb2057054c	0989	A
\.


--
-- TOC entry 2835 (class 0 OID 6334382)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram) FROM stdin;
\.


--
-- TOC entry 2838 (class 0 OID 6334410)
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
-- TOC entry 2836 (class 0 OID 6334391)
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
-- TOC entry 2815 (class 0 OID 6334121)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-5571-5143-6946-19f75fff7c65	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-5571-5143-ef6d-63f6c7a95ecf	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-5571-5143-6dd8-bc52ce08bb4e	0003	Kazinska	t	84	Kazinska dvorana
00220000-5571-5143-384a-ba0326271243	0004	Mali oder	t	24	Mali oder 
00220000-5571-5143-5e57-4f6da8503517	0005	Komorni oder	t	15	Komorni oder
00220000-5571-5143-31f6-704672d12eba	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5571-5143-322a-9db747662e1c	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2807 (class 0 OID 6334065)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2806 (class 0 OID 6334055)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2827 (class 0 OID 6334257)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2822 (class 0 OID 6334190)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2780 (class 0 OID 6333763)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-5571-5142-7f20-3d5831141ac4	00010000-5571-5142-74f2-581b7a406c54	2015-06-05 09:35:31	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROmxlzNJHfCjyej.gnncJ11H4sIztvine";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2855 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2816 (class 0 OID 6334131)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2784 (class 0 OID 6333801)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5571-5142-3abc-79e6df224e1e	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5571-5142-3acb-6b08597c4f88	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5571-5142-a3f9-412405cc18b2	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5571-5142-d7af-f392d18de277	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5571-5142-2fac-f425612123e5	planer	Planer dogodkov v koledarju	t
00020000-5571-5142-c33f-674bc9a5d388	kadrovska	Kadrovska služba	t
00020000-5571-5142-7552-2b94b0c3ad08	arhivar	Ažuriranje arhivalij	t
00020000-5571-5142-3fbc-fbbbd152fad5	igralec	Igralec	t
00020000-5571-5142-859e-1b6a115970eb	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
\.


--
-- TOC entry 2782 (class 0 OID 6333785)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5571-5142-7f20-3d5831141ac4	00020000-5571-5142-a3f9-412405cc18b2
00010000-5571-5142-74f2-581b7a406c54	00020000-5571-5142-a3f9-412405cc18b2
\.


--
-- TOC entry 2818 (class 0 OID 6334145)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2810 (class 0 OID 6334086)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2804 (class 0 OID 6334036)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2841 (class 0 OID 6334429)
-- Dependencies: 235
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-5571-5141-c67d-dbe482f2019d	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-5571-5141-fd92-8d1ccdeac3c4	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-5571-5141-1b6a-9dae85d81024	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-5571-5141-9a3a-acdc4139e1f8	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-5571-5141-8679-1f0a2074bf14	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2840 (class 0 OID 6334421)
-- Dependencies: 234
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-5571-5141-3472-52429010c010	00000000-5571-5141-9a3a-acdc4139e1f8	popa
00000000-5571-5141-3132-dec15d808508	00000000-5571-5141-9a3a-acdc4139e1f8	oseba
00000000-5571-5141-7b75-89358a36e6d9	00000000-5571-5141-fd92-8d1ccdeac3c4	prostor
00000000-5571-5141-1317-8de49e72ef33	00000000-5571-5141-9a3a-acdc4139e1f8	besedilo
00000000-5571-5141-0868-902430e90e4d	00000000-5571-5141-9a3a-acdc4139e1f8	uprizoritev
00000000-5571-5141-2b7c-e40780ab38ea	00000000-5571-5141-9a3a-acdc4139e1f8	funkcija
00000000-5571-5141-2421-c00e4dd5d907	00000000-5571-5141-9a3a-acdc4139e1f8	tipfunkcije
00000000-5571-5141-75ca-ddb110e3c290	00000000-5571-5141-9a3a-acdc4139e1f8	alternacija
00000000-5571-5141-cf74-bdc0398e5b95	00000000-5571-5141-c67d-dbe482f2019d	pogodba
00000000-5571-5141-6357-0454022773f7	00000000-5571-5141-9a3a-acdc4139e1f8	zaposlitev
\.


--
-- TOC entry 2839 (class 0 OID 6334416)
-- Dependencies: 233
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 6334200)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2789 (class 0 OID 6333863)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2805 (class 0 OID 6334042)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5571-5143-92e9-750631dd6dcc	00180000-5571-5143-b885-3b47046e6775	000c0000-5571-5143-6402-a5b2d601a960	00090000-5571-5143-3f61-f7bafdf34678	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5571-5143-315c-18bc6734d664	00180000-5571-5143-b885-3b47046e6775	000c0000-5571-5143-705d-2ce677dd89ef	00090000-5571-5143-22d0-c0b187a4f6ee	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5571-5143-2447-ce265f81ab4c	00180000-5571-5143-b885-3b47046e6775	000c0000-5571-5143-3ba9-2c09704dc5ca	00090000-5571-5143-34ec-41ec3158a589	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5571-5143-bc30-305ba599d4fa	00180000-5571-5143-b885-3b47046e6775	000c0000-5571-5143-cba0-d5c4cfbbbc46	00090000-5571-5143-f835-3421958d69b2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5571-5143-cd7d-656d23f46a9e	00180000-5571-5143-b885-3b47046e6775	000c0000-5571-5143-4afa-4a0722c528a6	00090000-5571-5143-9058-cd80af8fe87d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-5571-5143-d61f-fe1e864a7dff	00180000-5571-5143-af4f-792db72248ae	\N	00090000-5571-5143-9058-cd80af8fe87d	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2826 (class 0 OID 6334246)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-5571-5141-438e-bfb48fd355cb	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-5571-5141-cc89-c91544660ba5	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-5571-5141-fc3e-d2ff0e42a845	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-5571-5141-8f24-20ba17ec10bb	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-5571-5141-2626-e622574e8af7	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-5571-5141-009f-3285835fce54	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-5571-5141-d34f-8c56b461f9f0	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-5571-5141-9c64-010ce28885b9	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-5571-5141-c77c-9db9e35c8909	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-5571-5141-1565-1ba396c401e2	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-5571-5141-ec21-b1198109adb2	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-5571-5141-60a5-8387100a4c97	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-5571-5141-b0d8-80a712e7210b	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-5571-5141-ee2a-ac2cf2a50e5a	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-5571-5141-dae7-b40c7d06ff49	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-5571-5141-8de4-21b3efadf048	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2837 (class 0 OID 6334399)
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
-- TOC entry 2794 (class 0 OID 6333926)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2781 (class 0 OID 6333772)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5571-5142-74f2-581b7a406c54	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROSL3skVbD8pe2FwzOaEm3ECCG/JJ7Zma	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5571-5143-bc78-88557106162a	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-5571-5143-df92-ef29999f7025	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-5571-5143-3d5e-4c15a8d21206	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-5571-5143-1dce-f698a08392fd	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-5571-5143-d301-f25b439c4cd7	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-5571-5143-9a29-f1cb9b0a440b	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxROLIrrC0bKKtyrf2ZkVW0vRX0XsDFJP1i	t	\N			petra@ifigenija.si	\N	\N	\N
00010000-5571-5142-7f20-3d5831141ac4	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2831 (class 0 OID 6334303)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5571-5143-1183-59c0973f48a7	00160000-5571-5142-bc7b-6074902c3529	00150000-5571-5141-40ba-03ecd0829c16	00140000-5571-5141-0580-417513659f2b	0001	produkcija	Sen kresne noči		Sanje	\N	2016-02-01	\N	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-5571-5143-5e57-4f6da8503517
000e0000-5571-5143-9fad-032a88a9be97	00160000-5571-5142-d1fd-5c3b87923ada	00150000-5571-5141-0ef3-66a41b95ffed	00140000-5571-5141-e2a4-5f154da2f41d	0002	predprodukcija-ideja	Smoletov vrt			\N	2017-01-01	\N	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-5571-5143-31f6-704672d12eba
\.


--
-- TOC entry 2799 (class 0 OID 6333988)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5571-5143-75f0-482cac154968	000e0000-5571-5143-9fad-032a88a9be97	1	
00200000-5571-5143-c374-bfee0801ed24	000e0000-5571-5143-9fad-032a88a9be97	2	
\.


--
-- TOC entry 2814 (class 0 OID 6334113)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2821 (class 0 OID 6334183)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2801 (class 0 OID 6334020)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2830 (class 0 OID 6334293)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5571-5141-0580-417513659f2b	01	Drama	drama (SURS 01)
00140000-5571-5141-6aa1-0fb97b6166a9	02	Opera	opera (SURS 02)
00140000-5571-5141-0b55-07c3805f17ab	03	Balet	balet (SURS 03)
00140000-5571-5141-7f20-e51eaefce62c	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5571-5141-15ac-4261313b8f08	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5571-5141-e2a4-5f154da2f41d	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5571-5141-377a-d7402e6bb119	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2820 (class 0 OID 6334173)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
00150000-5571-5141-ea40-2e034ee42ad1	01	Opera	opera
00150000-5571-5141-cf9b-14d126b94566	02	Opereta	opereta
00150000-5571-5141-cace-974e27ce8170	03	Balet	balet
00150000-5571-5141-a57d-3818213472f4	04	Plesne prireditve	plesne prireditve
00150000-5571-5141-4c66-67f49e4948d1	05	Lutkovno gledališče	lutkovno gledališče
00150000-5571-5141-1c61-9626be58a517	06	Raziskovalno gledališče	raziskovalno gledališče
00150000-5571-5141-a2b4-2bf247329930	07	Biografska drama	biografska drama
00150000-5571-5141-40ba-03ecd0829c16	08	Komedija	komedija
00150000-5571-5141-a0da-6252907455a4	09	Črna komedija	črna komedija
00150000-5571-5141-3f7b-4db235225768	10	E-igra	E-igra
00150000-5571-5141-0ef3-66a41b95ffed	11	Kriminalka	kriminalka
00150000-5571-5141-7af1-2834aaf3678f	12	Musical	musical
\.


--
-- TOC entry 2372 (class 2606 OID 6333826)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2551 (class 2606 OID 6334349)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2547 (class 2606 OID 6334339)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 6334245)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2427 (class 2606 OID 6334010)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2443 (class 2606 OID 6334035)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 6333952)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 6334378)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 6334168)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2421 (class 2606 OID 6333986)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2440 (class 2606 OID 6334029)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2414 (class 2606 OID 6333966)
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
-- TOC entry 2464 (class 2606 OID 6334078)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 6334105)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2399 (class 2606 OID 6333924)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2376 (class 2606 OID 6333835)
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
-- TOC entry 2379 (class 2606 OID 6333859)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2370 (class 2606 OID 6333815)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2363 (class 2606 OID 6333800)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 6334111)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2491 (class 2606 OID 6334144)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2534 (class 2606 OID 6334288)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 6333888)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 6333912)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 6334084)
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
-- TOC entry 2394 (class 2606 OID 6333902)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 6333973)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 6334096)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 6334225)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 6334273)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 6334389)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 6334414)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 6334396)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 6334128)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 6334069)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2456 (class 2606 OID 6334060)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 6334267)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 6334197)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2355 (class 2606 OID 6333771)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2489 (class 2606 OID 6334135)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2361 (class 2606 OID 6333789)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2365 (class 2606 OID 6333809)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2496 (class 2606 OID 6334153)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2470 (class 2606 OID 6334091)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2445 (class 2606 OID 6334041)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 6334438)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 6334426)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 6334420)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 6334210)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2385 (class 2606 OID 6333868)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2450 (class 2606 OID 6334051)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 6334256)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 6334409)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2404 (class 2606 OID 6333937)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2357 (class 2606 OID 6333784)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2545 (class 2606 OID 6334319)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2425 (class 2606 OID 6333995)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 6334119)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2507 (class 2606 OID 6334188)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2438 (class 2606 OID 6334024)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2538 (class 2606 OID 6334301)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 2606 OID 6334181)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2428 (class 1259 OID 6334017)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2512 (class 1259 OID 6334211)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2513 (class 1259 OID 6334212)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2386 (class 1259 OID 6333890)
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
-- TOC entry 2477 (class 1259 OID 6334112)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2471 (class 1259 OID 6334098)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2472 (class 1259 OID 6334097)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2423 (class 1259 OID 6333996)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2499 (class 1259 OID 6334169)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2500 (class 1259 OID 6334172)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2501 (class 1259 OID 6334171)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2411 (class 1259 OID 6333968)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2412 (class 1259 OID 6333967)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2530 (class 1259 OID 6334290)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2531 (class 1259 OID 6334291)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2532 (class 1259 OID 6334292)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2539 (class 1259 OID 6334324)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2540 (class 1259 OID 6334321)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2541 (class 1259 OID 6334323)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2542 (class 1259 OID 6334322)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2401 (class 1259 OID 6333939)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2402 (class 1259 OID 6333938)
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
-- TOC entry 2377 (class 1259 OID 6333862)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2487 (class 1259 OID 6334136)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2441 (class 1259 OID 6334030)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2367 (class 1259 OID 6333816)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2368 (class 1259 OID 6333817)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2492 (class 1259 OID 6334156)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2493 (class 1259 OID 6334155)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2494 (class 1259 OID 6334154)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2415 (class 1259 OID 6333974)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2416 (class 1259 OID 6333976)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2417 (class 1259 OID 6333975)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2577 (class 1259 OID 6334428)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2451 (class 1259 OID 6334064)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2452 (class 1259 OID 6334062)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2453 (class 1259 OID 6334061)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2454 (class 1259 OID 6334063)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2358 (class 1259 OID 6333790)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2359 (class 1259 OID 6333791)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2480 (class 1259 OID 6334120)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2466 (class 1259 OID 6334085)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2508 (class 1259 OID 6334198)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2509 (class 1259 OID 6334199)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2560 (class 1259 OID 6334379)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2561 (class 1259 OID 6334381)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2562 (class 1259 OID 6334380)
-- Name: idx_8787a0e5b3836ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5b3836ea9 ON enotaprograma USING btree (tip_programske_enote_id);


--
-- TOC entry 2390 (class 1259 OID 6333904)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2391 (class 1259 OID 6333903)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2392 (class 1259 OID 6333905)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2572 (class 1259 OID 6334415)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2516 (class 1259 OID 6334226)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2517 (class 1259 OID 6334227)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2552 (class 1259 OID 6334353)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2553 (class 1259 OID 6334355)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2554 (class 1259 OID 6334351)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2555 (class 1259 OID 6334354)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2556 (class 1259 OID 6334352)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2505 (class 1259 OID 6334189)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2457 (class 1259 OID 6334073)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2458 (class 1259 OID 6334072)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2459 (class 1259 OID 6334070)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2460 (class 1259 OID 6334071)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2341 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2548 (class 1259 OID 6334341)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2549 (class 1259 OID 6334340)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2563 (class 1259 OID 6334390)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2422 (class 1259 OID 6333987)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2373 (class 1259 OID 6333837)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2374 (class 1259 OID 6333836)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2382 (class 1259 OID 6333869)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2383 (class 1259 OID 6333870)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2446 (class 1259 OID 6334054)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2447 (class 1259 OID 6334053)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2448 (class 1259 OID 6334052)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2566 (class 1259 OID 6334398)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2567 (class 1259 OID 6334397)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2429 (class 1259 OID 6334019)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2430 (class 1259 OID 6334015)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2431 (class 1259 OID 6334012)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2432 (class 1259 OID 6334013)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2433 (class 1259 OID 6334011)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2434 (class 1259 OID 6334016)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2435 (class 1259 OID 6334014)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2389 (class 1259 OID 6333889)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2407 (class 1259 OID 6333953)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2408 (class 1259 OID 6333955)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2409 (class 1259 OID 6333954)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2410 (class 1259 OID 6333956)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2465 (class 1259 OID 6334079)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2535 (class 1259 OID 6334289)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2543 (class 1259 OID 6334320)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2380 (class 1259 OID 6333860)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2381 (class 1259 OID 6333861)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2502 (class 1259 OID 6334182)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2583 (class 1259 OID 6334439)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2400 (class 1259 OID 6333925)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2580 (class 1259 OID 6334427)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2485 (class 1259 OID 6334130)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2486 (class 1259 OID 6334129)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2557 (class 1259 OID 6334350)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2344 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2397 (class 1259 OID 6333913)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2536 (class 1259 OID 6334302)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2528 (class 1259 OID 6334274)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2529 (class 1259 OID 6334275)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2366 (class 1259 OID 6333810)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2436 (class 1259 OID 6334018)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2609 (class 2606 OID 6334581)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2612 (class 2606 OID 6334566)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2611 (class 2606 OID 6334571)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2607 (class 2606 OID 6334591)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2613 (class 2606 OID 6334561)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2608 (class 2606 OID 6334586)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2610 (class 2606 OID 6334576)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2643 (class 2606 OID 6334736)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2642 (class 2606 OID 6334741)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2594 (class 2606 OID 6334496)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2630 (class 2606 OID 6334676)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2628 (class 2606 OID 6334671)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2629 (class 2606 OID 6334666)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2606 (class 2606 OID 6334556)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2638 (class 2606 OID 6334706)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2636 (class 2606 OID 6334716)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2637 (class 2606 OID 6334711)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2600 (class 2606 OID 6334531)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2601 (class 2606 OID 6334526)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2626 (class 2606 OID 6334656)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2649 (class 2606 OID 6334761)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2648 (class 2606 OID 6334766)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2647 (class 2606 OID 6334771)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2650 (class 2606 OID 6334791)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2653 (class 2606 OID 6334776)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2651 (class 2606 OID 6334786)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2652 (class 2606 OID 6334781)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2598 (class 2606 OID 6334521)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2599 (class 2606 OID 6334516)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2590 (class 2606 OID 6334481)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2591 (class 2606 OID 6334476)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2632 (class 2606 OID 6334686)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2614 (class 2606 OID 6334596)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2587 (class 2606 OID 6334456)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2586 (class 2606 OID 6334461)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2633 (class 2606 OID 6334701)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2634 (class 2606 OID 6334696)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2635 (class 2606 OID 6334691)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2604 (class 2606 OID 6334536)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2602 (class 2606 OID 6334546)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2603 (class 2606 OID 6334541)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2668 (class 2606 OID 6334866)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2618 (class 2606 OID 6334631)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2620 (class 2606 OID 6334621)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2621 (class 2606 OID 6334616)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2619 (class 2606 OID 6334626)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2585 (class 2606 OID 6334446)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2584 (class 2606 OID 6334451)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2631 (class 2606 OID 6334681)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2627 (class 2606 OID 6334661)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2641 (class 2606 OID 6334726)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2640 (class 2606 OID 6334731)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2663 (class 2606 OID 6334831)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2661 (class 2606 OID 6334841)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2662 (class 2606 OID 6334836)
-- Name: fk_8787a0e5b3836ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5b3836ea9 FOREIGN KEY (tip_programske_enote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2596 (class 2606 OID 6334506)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2597 (class 2606 OID 6334501)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2595 (class 2606 OID 6334511)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2667 (class 2606 OID 6334861)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2645 (class 2606 OID 6334746)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2644 (class 2606 OID 6334751)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2658 (class 2606 OID 6334816)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2656 (class 2606 OID 6334826)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2660 (class 2606 OID 6334806)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2657 (class 2606 OID 6334821)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2659 (class 2606 OID 6334811)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2639 (class 2606 OID 6334721)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2622 (class 2606 OID 6334651)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2623 (class 2606 OID 6334646)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2625 (class 2606 OID 6334636)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2624 (class 2606 OID 6334641)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2654 (class 2606 OID 6334801)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2655 (class 2606 OID 6334796)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2664 (class 2606 OID 6334846)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2605 (class 2606 OID 6334551)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2646 (class 2606 OID 6334756)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2588 (class 2606 OID 6334471)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2589 (class 2606 OID 6334466)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2593 (class 2606 OID 6334486)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2592 (class 2606 OID 6334491)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2615 (class 2606 OID 6334611)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2616 (class 2606 OID 6334606)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2617 (class 2606 OID 6334601)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2665 (class 2606 OID 6334856)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2666 (class 2606 OID 6334851)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-05 09:35:31 CEST

--
-- PostgreSQL database dump complete
--

