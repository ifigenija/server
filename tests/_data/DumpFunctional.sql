--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-06-02 12:20:34 CEST

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
-- TOC entry 180 (class 1259 OID 6000818)
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
-- TOC entry 227 (class 1259 OID 6001335)
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
-- TOC entry 226 (class 1259 OID 6001318)
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
-- TOC entry 219 (class 1259 OID 6001227)
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
-- TOC entry 194 (class 1259 OID 6000997)
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
-- TOC entry 197 (class 1259 OID 6001031)
-- Name: dogodekizven; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodekizven (
    id uuid NOT NULL
);


--
-- TOC entry 189 (class 1259 OID 6000940)
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
-- TOC entry 228 (class 1259 OID 6001349)
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
-- TOC entry 213 (class 1259 OID 6001157)
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
-- TOC entry 192 (class 1259 OID 6000977)
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
-- TOC entry 196 (class 1259 OID 6001025)
-- Name: gostujoca; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE gostujoca (
    id uuid NOT NULL,
    uprizoritev_id uuid
);


--
-- TOC entry 190 (class 1259 OID 6000957)
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
-- TOC entry 202 (class 1259 OID 6001074)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 206 (class 1259 OID 6001099)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 187 (class 1259 OID 6000914)
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
-- TOC entry 181 (class 1259 OID 6000827)
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
-- TOC entry 182 (class 1259 OID 6000838)
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
-- TOC entry 177 (class 1259 OID 6000792)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 6000811)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 6001106)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 211 (class 1259 OID 6001137)
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
-- TOC entry 223 (class 1259 OID 6001271)
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
-- TOC entry 184 (class 1259 OID 6000871)
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
-- TOC entry 186 (class 1259 OID 6000906)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 203 (class 1259 OID 6001080)
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
-- TOC entry 185 (class 1259 OID 6000891)
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
-- TOC entry 191 (class 1259 OID 6000969)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    gostujoc_id uuid
);


--
-- TOC entry 205 (class 1259 OID 6001092)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 6001212)
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
-- TOC entry 222 (class 1259 OID 6001263)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 229 (class 1259 OID 6001375)
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
-- TOC entry 232 (class 1259 OID 6001403)
-- Name: programfestival; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programfestival (
    id integer NOT NULL,
    program_dela_id uuid
);


--
-- TOC entry 238 (class 1259 OID 6001433)
-- Name: programfestival_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programfestival_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 230 (class 1259 OID 6001384)
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
-- TOC entry 236 (class 1259 OID 6001429)
-- Name: programgostovanje_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programgostovanje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 209 (class 1259 OID 6001121)
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
-- TOC entry 201 (class 1259 OID 6001065)
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
-- TOC entry 200 (class 1259 OID 6001055)
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
-- TOC entry 221 (class 1259 OID 6001252)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 216 (class 1259 OID 6001189)
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
-- TOC entry 174 (class 1259 OID 6000763)
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
-- TOC entry 173 (class 1259 OID 6000761)
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
-- TOC entry 210 (class 1259 OID 6001131)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 178 (class 1259 OID 6000801)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 176 (class 1259 OID 6000785)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 212 (class 1259 OID 6001145)
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
-- TOC entry 204 (class 1259 OID 6001086)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 198 (class 1259 OID 6001036)
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
-- TOC entry 235 (class 1259 OID 6001421)
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
-- TOC entry 234 (class 1259 OID 6001414)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 6001409)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 6001199)
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
-- TOC entry 183 (class 1259 OID 6000863)
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
-- TOC entry 199 (class 1259 OID 6001042)
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
-- TOC entry 220 (class 1259 OID 6001241)
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
-- TOC entry 231 (class 1259 OID 6001392)
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
-- TOC entry 237 (class 1259 OID 6001431)
-- Name: tipprogramskeenote_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipprogramskeenote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 188 (class 1259 OID 6000926)
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
-- TOC entry 175 (class 1259 OID 6000772)
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
-- TOC entry 225 (class 1259 OID 6001297)
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
-- TOC entry 193 (class 1259 OID 6000988)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 208 (class 1259 OID 6001113)
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
-- TOC entry 215 (class 1259 OID 6001182)
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
-- TOC entry 195 (class 1259 OID 6001020)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 6001287)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    naziv character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 214 (class 1259 OID 6001172)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    opis character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 2174 (class 2604 OID 6000766)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2776 (class 0 OID 6000818)
-- Dependencies: 180
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 2823 (class 0 OID 6001335)
-- Dependencies: 227
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, sodelovanje_id, oseba_id, koprodukcija_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna) FROM stdin;
000c0000-556d-8371-e5d1-e3f0dbd74317	000d0000-556d-8371-f84c-1284d8087950	\N	00090000-556d-8371-44ab-efaf667efed3	\N	\N	0001	f	\N	\N	\N	\N	\N	\N
000c0000-556d-8371-0896-ba6a0274b2a7	000d0000-556d-8371-7247-bb299f7f5b71	\N	00090000-556d-8371-f1e2-50752bf372c0	\N	\N	0002	f	\N	\N	\N	\N	\N	\N
000c0000-556d-8371-75ee-90536cce3830	000d0000-556d-8371-d286-3c0bb0841582	\N	00090000-556d-8371-41fa-9bf461317933	\N	\N	0003	f	\N	\N	\N	\N	\N	\N
000c0000-556d-8372-84e7-0659a592213c	000d0000-556d-8371-b69c-19e0c1c3536b	\N	00090000-556d-8371-2715-5efac2c382e6	\N	\N	0004	f	\N	\N	\N	\N	\N	\N
000c0000-556d-8372-d6c9-3a398f0396b1	000d0000-556d-8371-6b0a-1e35a6e1975a	\N	00090000-556d-8371-434b-3935ec732596	\N	\N	0005	f	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 2822 (class 0 OID 6001318)
-- Dependencies: 226
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 2815 (class 0 OID 6001227)
-- Dependencies: 219
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, avtor, podnaslov, jezik, naslovizvirnika, datumprejema, moskevloge, zenskevloge, prevajalec, povzetekvsebine) FROM stdin;
00160000-556d-8371-b032-0ca1cce2b68f	0001	Sen kresne noči	William Shakespeare		slovenščina	A Midsummer Night's Dream	2015-04-26	5	5	5	Milan Jesih
00160000-556d-8371-eb8f-46d202688af0	0002	Bratje Karamazovi	Fjodor Mihajlovič Dostojevski		slovenščina	Bratja Karamazjovji	2015-12-04	4	1	1	Vladimir Levstik
00160000-556d-8371-0103-165bdf00f74e	0003	Smoletov Vrt	Berta Hočevar		slovenščina		2015-05-26	2	8	8	
\.


--
-- TOC entry 2790 (class 0 OID 6000997)
-- Dependencies: 194
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_izven_id, prostor_id, sezona_id, planiranzacetek, zacetek, konec, status, razred, termin, ime) FROM stdin;
00180000-556d-8371-79af-e4e7f841aa12	\N	\N	00200000-556d-8371-36fb-4464fecc0150	\N	\N	\N	\N	2015-06-26 10:00:00	2015-06-26 10:00:00	2015-06-26 12:00:00	4			
00180000-556d-8371-3714-76868d3a6317	\N	\N	00200000-556d-8371-6e2f-6d9711a73784	\N	\N	\N	\N	2015-06-27 10:00:00	2015-06-27 10:00:00	2015-06-27 12:00:00	4			
00180000-556d-8371-d2d9-c51b3b9e7f07	\N	\N	\N	\N	\N	\N	\N	2015-08-01 20:00:00	2015-08-01 20:00:00	2015-08-01 23:00:00	5			
\.


--
-- TOC entry 2793 (class 0 OID 6001031)
-- Dependencies: 197
-- Data for Name: dogodekizven; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodekizven (id) FROM stdin;
\.


--
-- TOC entry 2785 (class 0 OID 6000940)
-- Dependencies: 189
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-556d-8370-1222-bd73e5222350	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-556d-8370-45f6-0ac01d7aff37	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-556d-8370-2b53-af0ae051c742	AL	ALB	008	Albania 	Albanija	\N
00040000-556d-8370-fd5c-4b660f677dd9	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-556d-8370-e7e4-621db0688e39	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-556d-8370-add3-7f4c06717e98	AD	AND	020	Andorra 	Andora	\N
00040000-556d-8370-ea84-606f5f98f722	AO	AGO	024	Angola 	Angola	\N
00040000-556d-8370-a676-f632395affd2	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-556d-8370-6d39-d9d25e32c163	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-556d-8370-bc75-4cd1e1cde6af	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-556d-8370-05a8-e2779e36a8ef	AR	ARG	032	Argentina 	Argenitna	\N
00040000-556d-8370-83f6-988e7d1cff45	AM	ARM	051	Armenia 	Armenija	\N
00040000-556d-8370-f4b6-a8592e1048c8	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-556d-8370-f859-16478700de3f	AU	AUS	036	Australia 	Avstralija	\N
00040000-556d-8370-037a-f0234e12c4ec	AT	AUT	040	Austria 	Avstrija	\N
00040000-556d-8370-911e-1dd4f46536ec	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-556d-8370-4b50-7201c0c46789	BS	BHS	044	Bahamas 	Bahami	\N
00040000-556d-8370-dfcf-ede76cc2d549	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-556d-8370-bc8a-f674b1d7514e	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-556d-8370-163b-05d6c5a21542	BB	BRB	052	Barbados 	Barbados	\N
00040000-556d-8370-7cad-10438f80e996	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-556d-8370-ad8e-f03d879d0759	BE	BEL	056	Belgium 	Belgija	\N
00040000-556d-8370-953a-1e3243844c77	BZ	BLZ	084	Belize 	Belize	\N
00040000-556d-8370-d236-66b383f55e40	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-556d-8370-e8a9-1ca3de146954	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-556d-8370-d4d7-62292853f324	BT	BTN	064	Bhutan 	Butan	\N
00040000-556d-8370-a0d3-33fdbe7f5a92	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-556d-8370-7ab2-dc23cbdb8ec1	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-556d-8370-2713-8cf70ba34b51	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-556d-8370-4574-9be412cacd10	BW	BWA	072	Botswana 	Bocvana	\N
00040000-556d-8370-3532-e27aa0962d70	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-556d-8370-b7f5-50e9a79fe3f1	BR	BRA	076	Brazil 	Brazilija	\N
00040000-556d-8370-4061-700152a653a7	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-556d-8370-53d7-69becf508095	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-556d-8370-bc2e-4dc927439530	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-556d-8370-53ef-d12131598791	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-556d-8370-faf0-08d3f557b5b7	BI	BDI	108	Burundi 	Burundi 	\N
00040000-556d-8370-5f6a-b560ccd91dbd	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-556d-8370-3498-bf1c54ea235b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-556d-8370-0c88-583f74e9547c	CA	CAN	124	Canada 	Kanada	\N
00040000-556d-8370-4c0b-c540cfe7739a	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-556d-8370-5a41-b2e78d1fe615	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-556d-8370-540a-c8e8e68f675f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-556d-8370-8825-367f9f056cbb	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-556d-8370-24de-488b19703e86	CL	CHL	152	Chile 	Čile	\N
00040000-556d-8370-524e-a5f2b60ce664	CN	CHN	156	China 	Kitajska	\N
00040000-556d-8370-9807-b58a3b1c195d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-556d-8370-0988-68aae5d264ac	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-556d-8370-59f1-2ca020f2cf9a	CO	COL	170	Colombia 	Kolumbija	\N
00040000-556d-8370-8a38-a71c5dd3609d	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-556d-8370-2c4f-4451cde089f2	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-556d-8370-2dfd-3a0abf67d872	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-556d-8370-e6d9-d82f269be4cf	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-556d-8370-87c9-ed2767a89738	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-556d-8370-b3a9-6cec1deadc29	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-556d-8370-7cc3-7d312d5b0ea5	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-556d-8370-517b-64436b041131	CU	CUB	192	Cuba 	Kuba	\N
00040000-556d-8370-a656-633b8780de75	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-556d-8370-81bb-8e284760678c	CY	CYP	196	Cyprus 	Ciper	\N
00040000-556d-8370-4a02-c36c154d8a4c	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-556d-8370-62f8-fceacd3213b8	DK	DNK	208	Denmark 	Danska	\N
00040000-556d-8370-0278-356e3cf2d9c4	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-556d-8370-d4b8-5fec72e0135f	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-556d-8370-046f-ebe4f3b874a7	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-556d-8370-3a55-ac1fef9b5ab3	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-556d-8370-e273-6da220b01d7f	EG	EGY	818	Egypt 	Egipt	\N
00040000-556d-8370-241f-fe4994f95cc0	SV	SLV	222	El Salvador 	Salvador	\N
00040000-556d-8370-164a-e476f5fcb4ae	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-556d-8370-30f6-e6b8d3869b68	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-556d-8370-003c-2e3daea6baf3	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-556d-8370-e2d4-82bc3f2cabaf	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-556d-8370-b013-8a7101665b8c	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-556d-8370-3716-d9165bccd3ab	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-556d-8370-28bd-ecd31c1c2659	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-556d-8370-a990-4db577de68e1	FI	FIN	246	Finland 	Finska	\N
00040000-556d-8370-6bf5-1d6bb43213e6	FR	FRA	250	France 	Francija	\N
00040000-556d-8370-f17d-0044ae06714e	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-556d-8370-27c1-0708be11b92d	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-556d-8370-7bdc-1c844a6ba76e	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-556d-8370-eab2-70cde4b70ff3	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-556d-8370-1fdd-0f9734133a50	GA	GAB	266	Gabon 	Gabon	\N
00040000-556d-8370-e12c-c0254550f858	GM	GMB	270	Gambia 	Gambija	\N
00040000-556d-8370-5c02-169b4578fb2b	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-556d-8370-1bc5-aaae2848121d	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-556d-8370-e57c-c94862fb3470	GH	GHA	288	Ghana 	Gana	\N
00040000-556d-8370-63f4-14159e87ff00	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-556d-8370-8877-c9a0bc5ab89f	GR	GRC	300	Greece 	Grčija	\N
00040000-556d-8370-c8d5-09fccd796407	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-556d-8370-7789-37ef07cece2d	GD	GRD	308	Grenada 	Grenada	\N
00040000-556d-8370-097b-2d1570c81c22	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-556d-8370-754f-2feaa3e6ab44	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-556d-8370-2cf1-2ce83b35c6db	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-556d-8370-233c-95b07c19bd11	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-556d-8370-5b79-7ac70d602b63	GN	GIN	324	Guinea 	Gvineja	\N
00040000-556d-8370-0632-9c3c25c3a29e	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-556d-8370-2ae8-5abea38b70c1	GY	GUY	328	Guyana 	Gvajana	\N
00040000-556d-8370-7c1e-c5e2c3e428ea	HT	HTI	332	Haiti 	Haiti	\N
00040000-556d-8370-6887-428587223010	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-556d-8370-69a8-039e8ae5b479	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-556d-8370-68a2-7c4226c4a2a4	HN	HND	340	Honduras 	Honduras	\N
00040000-556d-8370-4308-566116380fce	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-556d-8370-356f-3edfd507a5aa	HU	HUN	348	Hungary 	Madžarska	\N
00040000-556d-8370-088c-559180abefe2	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-556d-8370-03b0-d090bf2121b7	IN	IND	356	India 	Indija	\N
00040000-556d-8370-39ee-9194e230c304	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-556d-8370-ac39-818de2f50f03	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-556d-8370-df74-3fc16952eda4	IQ	IRQ	368	Iraq 	Irak	\N
00040000-556d-8370-1a40-f81a52dd40c7	IE	IRL	372	Ireland 	Irska	\N
00040000-556d-8370-513e-8361dccb3f3a	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-556d-8370-32d7-c233459c2edb	IL	ISR	376	Israel 	Izrael	\N
00040000-556d-8370-f3bb-4f141c4f2060	IT	ITA	380	Italy 	Italija	\N
00040000-556d-8370-0ccd-58905aa5eae6	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-556d-8370-c037-ce69c7c7a9f4	JP	JPN	392	Japan 	Japonska	\N
00040000-556d-8370-aba4-6261911db99a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-556d-8370-6faf-a125aa938b3c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-556d-8370-e2b5-c4d0424ad43e	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-556d-8370-f262-48aaff91dae3	KE	KEN	404	Kenya 	Kenija	\N
00040000-556d-8370-080e-1233d9dc9b09	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-556d-8370-0f1f-f429da7d3c25	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-556d-8370-1536-41ef03930b7c	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-556d-8370-f005-87670c1d95ca	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-556d-8370-5010-cc55ac538493	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-556d-8370-d9e5-a7f904728182	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-556d-8370-a47f-6ac03e6419bb	LV	LVA	428	Latvia 	Latvija	\N
00040000-556d-8370-468e-dd038ea0d99b	LB	LBN	422	Lebanon 	Libanon	\N
00040000-556d-8370-71c4-86996df798c8	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-556d-8370-d160-6ae7fbfbeceb	LR	LBR	430	Liberia 	Liberija	\N
00040000-556d-8370-ea18-e18b4fb1bd38	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-556d-8370-fd8d-bee0449cabcc	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-556d-8370-0992-d29c19036ce4	LT	LTU	440	Lithuania 	Litva	\N
00040000-556d-8370-e676-bb49c9ddbd85	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-556d-8370-9e00-6072c80bdc62	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-556d-8370-c0d0-d3a0306a013b	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-556d-8370-8ea9-00b9f2158a1e	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-556d-8370-145d-26c650f8e556	MW	MWI	454	Malawi 	Malavi	\N
00040000-556d-8370-9dcf-b81d4da1a0a0	MY	MYS	458	Malaysia 	Malezija	\N
00040000-556d-8370-a987-eb3d134d1596	MV	MDV	462	Maldives 	Maldivi	\N
00040000-556d-8370-cb1e-a17fe7b0546c	ML	MLI	466	Mali 	Mali	\N
00040000-556d-8370-a503-dae8ee05e0e3	MT	MLT	470	Malta 	Malta	\N
00040000-556d-8370-1676-7d2a05d25399	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-556d-8370-0551-a3f5a8e7fee2	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-556d-8370-7ff8-4dd9271f7948	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-556d-8370-7894-d29e260ac612	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-556d-8370-732a-a18ac855e119	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-556d-8370-f364-1e48ca629cd3	MX	MEX	484	Mexico 	Mehika	\N
00040000-556d-8370-539c-893788ec7e18	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-556d-8370-1636-784fa65b65fe	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-556d-8370-023e-d7c09efa4cff	MC	MCO	492	Monaco 	Monako	\N
00040000-556d-8370-8751-c2794eedbfd6	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-556d-8370-3fb1-5c8407552285	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-556d-8370-5429-5b8eb695ebd7	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-556d-8370-f9ac-c66188758255	MA	MAR	504	Morocco 	Maroko	\N
00040000-556d-8370-8ecd-a2df195a50f8	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-556d-8370-e607-c89e4ecefeed	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-556d-8370-8f8c-75f303f5dda4	NA	NAM	516	Namibia 	Namibija	\N
00040000-556d-8370-5654-e9c10591375a	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-556d-8370-e717-89942340b172	NP	NPL	524	Nepal 	Nepal	\N
00040000-556d-8370-a216-e8ed7aac9991	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-556d-8370-5d6f-058d2f8b8d90	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-556d-8370-fd07-41cf6e9facff	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-556d-8370-b8cd-670ebc3bfe86	NE	NER	562	Niger 	Niger 	\N
00040000-556d-8370-998d-e253894e54bb	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-556d-8370-24df-dcd91ef6b05c	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-556d-8370-2284-904806aeef36	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-556d-8370-4f7c-b18fd235645a	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-556d-8370-4c19-ab3ca0627998	NO	NOR	578	Norway 	Norveška	\N
00040000-556d-8370-efd1-c8ce788ef2b4	OM	OMN	512	Oman 	Oman	\N
00040000-556d-8370-b6ba-41540972b06a	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-556d-8370-4a5f-6382055d23fe	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-556d-8370-4848-3bc5d3e81a5d	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-556d-8370-e464-832dd2e62779	PA	PAN	591	Panama 	Panama	\N
00040000-556d-8370-d582-46372e0510c7	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-556d-8370-f537-95e283180788	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-556d-8370-477b-abc3932a9ed7	PE	PER	604	Peru 	Peru	\N
00040000-556d-8370-2216-225de61788d6	PH	PHL	608	Philippines 	Filipini	\N
00040000-556d-8370-75e3-d55e05c18456	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-556d-8370-2540-1f693b0d41b4	PL	POL	616	Poland 	Poljska	\N
00040000-556d-8370-875a-c11b35b966fa	PT	PRT	620	Portugal 	Portugalska	\N
00040000-556d-8370-8cd2-f96a47b64356	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-556d-8370-af8e-5a5812fb89bd	QA	QAT	634	Qatar 	Katar	\N
00040000-556d-8370-8db9-07e05805cff3	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-556d-8370-e9a3-85bffdf29613	RO	ROU	642	Romania 	Romunija	\N
00040000-556d-8370-d29e-4cf1220d5386	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-556d-8370-39c8-d9cd04c9e5eb	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-556d-8370-a740-ec0ecff3fb4c	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-556d-8370-ec23-6f6b36311211	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-556d-8370-763b-749ae95e926a	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-556d-8370-62c3-4712729bb887	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-556d-8370-19ca-01f881e24220	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-556d-8370-2ef9-99d94d95d6b9	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-556d-8370-c105-c5746958d8ef	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-556d-8370-ef88-3b836072379a	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-556d-8370-d361-644b55459151	SM	SMR	674	San Marino 	San Marino	\N
00040000-556d-8370-7324-140324a8cf2f	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-556d-8370-320c-ea37d06f148a	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-556d-8370-69e7-9e5cfeeaecf3	SN	SEN	686	Senegal 	Senegal	\N
00040000-556d-8370-96e5-2ddf44099104	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-556d-8370-6730-6f7e6a20fb28	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-556d-8370-a5b4-0c9ca1a8e608	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-556d-8370-662c-6d0e5e194d02	SG	SGP	702	Singapore 	Singapur	\N
00040000-556d-8370-7d5a-779f3871286e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-556d-8370-e42d-61b08467e344	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-556d-8370-46c8-4832671a7157	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-556d-8370-9346-4dac0d6b933a	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-556d-8370-c6c4-30a485d16673	SO	SOM	706	Somalia 	Somalija	\N
00040000-556d-8370-5597-10efa8245eb1	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-556d-8370-e628-96e0e990288d	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-556d-8370-4172-27b3be70befe	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-556d-8370-91de-31ffc47abe64	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-556d-8370-5284-3babaa788f85	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-556d-8370-f3cd-10079426fa13	SD	SDN	729	Sudan 	Sudan	\N
00040000-556d-8370-045d-56fea3dfac33	SR	SUR	740	Suriname 	Surinam	\N
00040000-556d-8370-566a-c7f2b11c1c81	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-556d-8370-d9ee-388ce5e38cc1	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-556d-8370-f0a9-4183be4a2cb7	SE	SWE	752	Sweden 	Švedska	\N
00040000-556d-8370-a15a-0ab922c059ad	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-556d-8370-f146-20936f85f321	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-556d-8370-f7c9-5cfc0deed8af	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-556d-8370-ce3d-fd4b398a82af	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-556d-8370-4989-d85362bf0b4f	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-556d-8370-c518-30918e898634	TH	THA	764	Thailand 	Tajska	\N
00040000-556d-8370-87ea-0f9d7de55dbf	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-556d-8370-ef65-084a22ef116e	TG	TGO	768	Togo 	Togo	\N
00040000-556d-8370-d661-76ad165eac79	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-556d-8370-bce4-90fbdfff33d3	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-556d-8370-a928-60e68eb0d48b	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-556d-8371-38c0-3f1a9d3a21bb	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-556d-8371-5725-fead56ec8a3b	TR	TUR	792	Turkey 	Turčija	\N
00040000-556d-8371-3826-bacb2544431e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-556d-8371-df12-ca76b9b345b1	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-556d-8371-9d2f-7c938ad79f6b	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-556d-8371-4043-7dbfbd86811e	UG	UGA	800	Uganda 	Uganda	\N
00040000-556d-8371-1003-dbb2a76caa09	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-556d-8371-281f-647492f8f166	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-556d-8371-ad3c-d475a497265d	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-556d-8371-09f9-f96311b8724e	US	USA	840	United States 	Združene države Amerike	\N
00040000-556d-8371-2090-8d642f8ea7bd	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-556d-8371-5b44-435a87f0c030	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-556d-8371-eeb0-12be2a4aaddc	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-556d-8371-6204-1b7cb54422c2	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-556d-8371-5be7-9c2407003f58	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-556d-8371-bdc6-ab942f903771	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-556d-8371-0588-851bf6f01399	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-556d-8371-9179-cb229b3cbb9a	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-556d-8371-10d9-66e45199ebb5	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-556d-8371-655a-cb83d6dd87cd	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-556d-8371-d357-4fd2d8e2afce	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-556d-8371-0f23-68ae3ff9e28d	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-556d-8371-c5b2-9440b0ef903d	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 2824 (class 0 OID 6001349)
-- Dependencies: 228
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, tip_programske_enote_id, program_dela_id, celotnavrednost, zaproseno, lastnasredstva, avtorskihonorarji, tantieme, drugiviri, drugijavni, obiskdoma, obiskgost, obiskzamejo, obiskint, ponovidoma, ponovizamejo, ponovigost, ponoviint, utemeljitev, tip) FROM stdin;
\.


--
-- TOC entry 2809 (class 0 OID 6001157)
-- Dependencies: 213
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekirvanj, tipfunkcije_id) FROM stdin;
000d0000-556d-8371-251b-8bab234a6b31	000e0000-556d-8371-6e5c-ab16d2829b6e	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-556d-8370-b97d-58e3d72192a7
000d0000-556d-8371-f84c-1284d8087950	000e0000-556d-8371-6e5c-ab16d2829b6e	\N	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-556d-8370-b97d-58e3d72192a7
000d0000-556d-8371-7247-bb299f7f5b71	000e0000-556d-8371-6e5c-ab16d2829b6e	\N	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-556d-8370-bb41-ba878975ffa0
000d0000-556d-8371-d286-3c0bb0841582	000e0000-556d-8371-6e5c-ab16d2829b6e	\N	umetnik	t	Inšpicient			t	8	t	t	\N	000f0000-556d-8370-9c75-18579368bd99
000d0000-556d-8371-b69c-19e0c1c3536b	000e0000-556d-8371-6e5c-ab16d2829b6e	\N	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-556d-8370-9c75-18579368bd99
000d0000-556d-8371-6b0a-1e35a6e1975a	000e0000-556d-8371-6e5c-ab16d2829b6e	\N	tehnik	\N	Lučni mojster			t	3	t	t	\N	000f0000-556d-8370-9c75-18579368bd99
\.


--
-- TOC entry 2788 (class 0 OID 6000977)
-- Dependencies: 192
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2792 (class 0 OID 6001025)
-- Dependencies: 196
-- Data for Name: gostujoca; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostujoca (id, uprizoritev_id) FROM stdin;
\.


--
-- TOC entry 2786 (class 0 OID 6000957)
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
-- TOC entry 2798 (class 0 OID 6001074)
-- Dependencies: 202
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 2802 (class 0 OID 6001099)
-- Dependencies: 206
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2783 (class 0 OID 6000914)
-- Dependencies: 187
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-556d-8371-5b75-9d556f4851de	popa.tipkli	array	a:4:{s:10:"dobavitelj";a:1:{s:5:"label";s:10:"Dobavitelj";}s:5:"kupec";a:1:{s:5:"label";s:5:"Kupec";}s:11:"koproducent";a:1:{s:5:"label";s:11:"Koproducent";}s:5:"multi";a:1:{s:5:"label";s:9:"Več vlog";}}	f	t	f	\N	Tip poslovnega partnerja
00000000-556d-8371-54f3-5bc4eb1ff9f8	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-556d-8371-226a-d5c433fa7a41	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-556d-8371-8c46-94e8a47eb962	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-556d-8371-35e3-f6b658f0c1ad	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-556d-8371-936e-cae03f7891c5	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-556d-8371-6ef9-939e8b33feae	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-556d-8371-0bb9-24c13bc7c29e	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-556d-8371-0728-240c1824696c	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-556d-8371-6888-0816e700ea3f	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-556d-8371-b207-b9dbb6fd497b	dogodek.status	array	a:2:{s:7:"osnutek";a:1:{s:5:"label";s:11:"Dolgoročno";}s:8:"planiran";a:1:{s:5:"label";s:8:"Planiran";}}	f	f	t	\N	Tabela statusa dogodkov
00000000-556d-8371-9672-8f9f81ac808a	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-556d-8371-9318-e4da8e023965	funkcija.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-556d-8371-49c4-b1c33437ba81	tipfunkcije.podrocje	array	a:3:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}}	f	t	f	\N	Področje funkcije
00000000-556d-8371-e905-c7da44014723	funkcija.velikost	array	a:4:{s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}}	f	t	f	\N	Velikost funkcije
00000000-556d-8371-c95b-e5368c097f92	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
\.


--
-- TOC entry 2777 (class 0 OID 6000827)
-- Dependencies: 181
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-556d-8371-c2ec-46fd7b47b629	00000000-556d-8371-35e3-f6b658f0c1ad	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-556d-8371-d63a-a5ff9cf530a1	00000000-556d-8371-35e3-f6b658f0c1ad	00010000-556d-8371-f45a-0bbda7561fcb	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-556d-8371-ba5f-0d4effe808f1	00000000-556d-8371-936e-cae03f7891c5	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2778 (class 0 OID 6000838)
-- Dependencies: 182
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-556d-8371-6e24-92fc9a8bc274	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-556d-8371-2715-5efac2c382e6	00010000-556d-8371-656e-34af7043bf77	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-556d-8371-41fa-9bf461317933	00010000-556d-8371-8c02-04bf8d361adb	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-556d-8371-4ed1-0a46caa935a7	00010000-556d-8371-74e1-978e300b1b02	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-556d-8371-c359-700d914548e8	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-556d-8371-a7d9-a395cc7e1c92	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-556d-8371-3f5e-acf61d603cd1	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-556d-8371-b5c3-b6c0b9316821	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-556d-8371-44ab-efaf667efed3	00010000-556d-8371-e104-fb9ef11a84a7	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-556d-8371-f1e2-50752bf372c0	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-556d-8371-c874-7965836e45f7	\N	\N	0011		xx	write protected12345	\N		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-556d-8371-434b-3935ec732596	\N	\N	0012		Luka	Golob	luč		Luka  Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-556d-8371-58fd-71390d10342c	00010000-556d-8371-6ecb-220ae7e5de5b	\N	0013		Tatjana	Božič	tajnica		Tatjana  Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2768 (class 0 OID 4729417)
-- Dependencies: 172
-- Data for Name: oseba2popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba2popa (popa_id, oseba_id) FROM stdin;
\.


--
-- TOC entry 2773 (class 0 OID 6000792)
-- Dependencies: 177
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-556d-8371-74e7-9a7bca5590fe	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-556d-8371-2db7-234a511a41cf	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-556d-8371-6757-ca2ba95ef55b	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-556d-8371-a8f0-31ceddd4c811	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-556d-8371-69b2-34e252df23ad	Abonma-read	Abonma - branje	f
00030000-556d-8371-abae-abf47980af3c	Abonma-write	Abonma - spreminjanje	f
00030000-556d-8371-c5ba-1b9a4077fdb4	Alternacija-read	Alternacija - branje	f
00030000-556d-8371-95f5-c4d8d788c21b	Alternacija-write	Alternacija - spreminjanje	f
00030000-556d-8371-90dd-407477274efb	Arhivalija-read	Arhivalija - branje	f
00030000-556d-8371-2667-fbb8ae0cf4bf	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-556d-8371-0998-06f8cc2f7326	Besedilo-read	Besedilo - branje	f
00030000-556d-8371-cde9-c1bb5fb029fb	Besedilo-write	Besedilo - spreminjanje	f
00030000-556d-8371-cee4-6fb71fe0e5c9	DogodekIzven-read	DogodekIzven - branje	f
00030000-556d-8371-30b1-01135b65e926	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-556d-8371-bb5d-a809548618cd	Dogodek-read	Dogodek - branje	f
00030000-556d-8371-43da-66f2dbd78ca5	Dogodek-write	Dogodek - spreminjanje	f
00030000-556d-8371-040a-f739e0d60b5f	Drzava-read	Drzava - branje	f
00030000-556d-8371-e385-825e2cf7dbaf	Drzava-write	Drzava - spreminjanje	f
00030000-556d-8371-4b18-2a1a34fb1dec	Funkcija-read	Funkcija - branje	f
00030000-556d-8371-4b9c-d47831d31495	Funkcija-write	Funkcija - spreminjanje	f
00030000-556d-8371-31c2-d1511824cab6	Gostovanje-read	Gostovanje - branje	f
00030000-556d-8371-6a06-e221e6451641	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-556d-8371-0f9f-f84b037107dd	Gostujoca-read	Gostujoca - branje	f
00030000-556d-8371-43dd-14c261a986ee	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-556d-8371-010c-6ea54e592d1f	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-556d-8371-de1b-5b44a2c1d006	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-556d-8371-7311-57a948175661	Kupec-read	Kupec - branje	f
00030000-556d-8371-1d33-675ee7d4ae68	Kupec-write	Kupec - spreminjanje	f
00030000-556d-8371-1a57-2ea419dc0d5a	NacinPlacina-read	NacinPlacina - branje	f
00030000-556d-8371-fd10-622dc9798bc1	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-556d-8371-3cf2-6b67092654d4	Option-read	Option - branje	f
00030000-556d-8371-f7d0-679467ae9ee8	Option-write	Option - spreminjanje	f
00030000-556d-8371-c409-c92479de5f92	OptionValue-read	OptionValue - branje	f
00030000-556d-8371-22c8-8d087a2e9ce1	OptionValue-write	OptionValue - spreminjanje	f
00030000-556d-8371-6ad5-b7a1422cc2db	Oseba-read	Oseba - branje	f
00030000-556d-8371-78ff-d19d0b15ddff	Oseba-write	Oseba - spreminjanje	f
00030000-556d-8371-cdb4-de1e2b3e5605	Permission-read	Permission - branje	f
00030000-556d-8371-2a83-a8f486fd47de	Permission-write	Permission - spreminjanje	f
00030000-556d-8371-ff43-31e47faf88c1	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-556d-8371-0c48-19f750a6392f	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-556d-8371-6084-5fb2e247d32e	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-556d-8371-abda-b205dc4b16d6	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-556d-8371-9328-4a925c4e18f7	Pogodba-read	Pogodba - branje	f
00030000-556d-8371-1065-97176d471f21	Pogodba-write	Pogodba - spreminjanje	f
00030000-556d-8371-ae6f-333f0cede6bb	Popa-read	Popa - branje	f
00030000-556d-8371-646c-c01f2448d21b	Popa-write	Popa - spreminjanje	f
00030000-556d-8371-988f-f8c2f86d7b33	Posta-read	Posta - branje	f
00030000-556d-8371-9284-838324ae8f42	Posta-write	Posta - spreminjanje	f
00030000-556d-8371-ee70-bba934646d1c	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-556d-8371-822a-aca81afd52a5	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-556d-8371-6b76-087c5c1d1440	PostniNaslov-read	PostniNaslov - branje	f
00030000-556d-8371-857f-9fa22fb29259	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-556d-8371-6437-2dc4d5291232	Predstava-read	Predstava - branje	f
00030000-556d-8371-9688-1273dc55187c	Predstava-write	Predstava - spreminjanje	f
00030000-556d-8371-1305-bf9cea05c834	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-556d-8371-15ac-20f727b35dc3	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-556d-8371-2447-d99d57068c29	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-556d-8371-28d8-64b29397fb35	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-556d-8371-a414-1fe2ee48633b	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-556d-8371-cf03-acc2182fbf43	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-556d-8371-5db5-50fe1801a8d9	Prostor-read	Prostor - branje	f
00030000-556d-8371-b00c-f400be3c884b	Prostor-write	Prostor - spreminjanje	f
00030000-556d-8371-e8f5-bf80cf8d33dd	Racun-read	Racun - branje	f
00030000-556d-8371-5c4b-853cb36155f9	Racun-write	Racun - spreminjanje	f
00030000-556d-8371-4cf8-e3c1aceaa6ce	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-556d-8371-25fb-dd498acf0032	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-556d-8371-b020-e53b2dcc6bca	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-556d-8371-b994-d29873d36d55	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-556d-8371-cfcd-ae736b0048a6	Rekvizit-read	Rekvizit - branje	f
00030000-556d-8371-7f6c-a5aca1287e4e	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-556d-8371-5423-4ba8ea451bf8	Revizija-read	Revizija - branje	f
00030000-556d-8371-491f-433f438cb88c	Revizija-write	Revizija - spreminjanje	f
00030000-556d-8371-e5b5-141087f4aa9e	Rezervacija-read	Rezervacija - branje	f
00030000-556d-8371-b925-6a7f848bdeaf	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-556d-8371-96d5-09717735323c	Role-read	Role - branje	f
00030000-556d-8371-12d6-3d7251c1bfae	Role-write	Role - spreminjanje	f
00030000-556d-8371-2821-189fc7886326	SedezniRed-read	SedezniRed - branje	f
00030000-556d-8371-cd06-388b69a1dde6	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-556d-8371-c1b1-4c1ccf3dac62	Sedez-read	Sedez - branje	f
00030000-556d-8371-d033-5881f8a8715e	Sedez-write	Sedez - spreminjanje	f
00030000-556d-8371-3aa2-bfa58be9e26e	Sezona-read	Sezona - branje	f
00030000-556d-8371-f1e1-004461635ebe	Sezona-write	Sezona - spreminjanje	f
00030000-556d-8371-b370-1e21a2782c88	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-556d-8371-91f4-a310ecf0ce00	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-556d-8371-b2db-83934a2d61f8	Stevilcenje-read	Stevilcenje - branje	f
00030000-556d-8371-bce7-4235b129873d	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-556d-8371-8695-8603840eabc0	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-556d-8371-65ce-c69894a07d0c	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-556d-8371-e4c8-cc2802aa3bdb	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-556d-8371-abea-94dba00449ba	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-556d-8371-304c-936c04acf816	Telefonska-read	Telefonska - branje	f
00030000-556d-8371-4d51-6a84fb723532	Telefonska-write	Telefonska - spreminjanje	f
00030000-556d-8371-3569-7480b00b89f6	TerminStoritve-read	TerminStoritve - branje	f
00030000-556d-8371-261c-2c1b58ccff15	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-556d-8371-1f2b-3bbed4d76415	TipFunkcije-read	TipFunkcije - branje	f
00030000-556d-8371-5068-e3577e7b765e	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-556d-8371-ad46-fb488984a1a3	Trr-read	Trr - branje	f
00030000-556d-8371-f908-c4da71eb7b68	Trr-write	Trr - spreminjanje	f
00030000-556d-8371-ebb8-a2ad50739bc7	Uprizoritev-read	Uprizoritev - branje	f
00030000-556d-8371-8069-b345b24c7a79	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-556d-8371-f373-ab3ca7849c13	User-read	User - branje	f
00030000-556d-8371-3f01-55e18869c71a	User-write	User - spreminjanje	f
00030000-556d-8371-f04f-de6768936deb	Vaja-read	Vaja - branje	f
00030000-556d-8371-2f2b-fa6ead3e5d88	Vaja-write	Vaja - spreminjanje	f
00030000-556d-8371-03e1-25525656ab0b	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-556d-8371-e806-dbaa6fe310b8	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-556d-8371-8a14-0d76f6113092	Zaposlitev-read	Zaposlitev - branje	f
00030000-556d-8371-29c2-6e99ac6bf879	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-556d-8371-3a8a-575786dd6379	Zasedenost-read	Zasedenost - branje	f
00030000-556d-8371-54a7-5d58584fd384	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-556d-8371-cc98-70d4b965e9a5	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-556d-8371-7eb5-e8e4f8a92832	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-556d-8371-1006-bb61138e3e76	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-556d-8371-12c8-fb086eeae3b7	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
\.


--
-- TOC entry 2775 (class 0 OID 6000811)
-- Dependencies: 179
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-556d-8371-1a66-a8cff9e8c65e	00030000-556d-8371-040a-f739e0d60b5f
00020000-556d-8371-11c2-acd18e17ed4c	00030000-556d-8371-e385-825e2cf7dbaf
00020000-556d-8371-11c2-acd18e17ed4c	00030000-556d-8371-040a-f739e0d60b5f
\.


--
-- TOC entry 2803 (class 0 OID 6001106)
-- Dependencies: 207
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 2807 (class 0 OID 6001137)
-- Dependencies: 211
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 2819 (class 0 OID 6001271)
-- Dependencies: 223
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, vrednostdo, zacetek, konec, vrednostvaje, vrednostpredstave, vrednosture, aktivna, opis) FROM stdin;
\.


--
-- TOC entry 2780 (class 0 OID 6000871)
-- Dependencies: 184
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, tipkli, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo) FROM stdin;
00080000-556d-8371-88f6-5b03d2039333	00040000-556d-8370-1222-bd73e5222350	0988	c	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-556d-8371-0750-ace5010f236d	00040000-556d-8370-1222-bd73e5222350	0989	c	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-556d-8371-14df-7d86c75857e9	00040000-556d-8370-1222-bd73e5222350	0987	c	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
00080000-556d-8371-4232-38bd6483d739	00040000-556d-8370-1222-bd73e5222350	0986	c	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f
\.


--
-- TOC entry 2782 (class 0 OID 6000906)
-- Dependencies: 186
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-556d-8370-a3bb-c415087436a9	8341	Adlešiči
00050000-556d-8370-b854-7179e47af1d4	5270	Ajdovščina
00050000-556d-8370-918c-5407a116907b	6280	Ankaran/Ancarano
00050000-556d-8370-eea0-1a74a937a15b	9253	Apače
00050000-556d-8370-9398-ac2529cf1243	8253	Artiče
00050000-556d-8370-fe1b-40cc9d6bbfb2	4275	Begunje na Gorenjskem
00050000-556d-8370-672d-bad3a1a48437	1382	Begunje pri Cerknici
00050000-556d-8370-f330-5277a31f486e	9231	Beltinci
00050000-556d-8370-3eeb-2ceffd1cf680	2234	Benedikt
00050000-556d-8370-1908-196853fc5a8d	2345	Bistrica ob Dravi
00050000-556d-8370-f88a-dfb7d8c257be	3256	Bistrica ob Sotli
00050000-556d-8370-27c7-8fdb7978a05c	8259	Bizeljsko
00050000-556d-8370-c33c-ef3756333da4	1223	Blagovica
00050000-556d-8370-ba2f-8f20c5076174	8283	Blanca
00050000-556d-8370-eef3-808508a24f9e	4260	Bled
00050000-556d-8370-0b90-6c401186b0e3	4273	Blejska Dobrava
00050000-556d-8370-06ab-3abe1d6477f0	9265	Bodonci
00050000-556d-8370-7eee-d69560cbaf4c	9222	Bogojina
00050000-556d-8370-cf8e-d7573fd1935d	4263	Bohinjska Bela
00050000-556d-8370-638b-5ba59accb680	4264	Bohinjska Bistrica
00050000-556d-8370-063e-1a9503efd1d7	4265	Bohinjsko jezero
00050000-556d-8370-cd32-0e517dd045a2	1353	Borovnica
00050000-556d-8370-c6e3-5834b5300f72	8294	Boštanj
00050000-556d-8370-163f-6eb24b73377e	5230	Bovec
00050000-556d-8370-5acf-8c49a64bfe3b	5295	Branik
00050000-556d-8370-9dcb-43b3cfa07a06	3314	Braslovče
00050000-556d-8370-8b46-2960cd2d72fd	5223	Breginj
00050000-556d-8370-2498-fb63051986c1	8280	Brestanica
00050000-556d-8370-c4b3-f9083760d428	2354	Bresternica
00050000-556d-8370-2be6-dc3f8e591245	4243	Brezje
00050000-556d-8370-557c-bdb408d2ecb3	1351	Brezovica pri Ljubljani
00050000-556d-8370-728e-dff576626846	8250	Brežice
00050000-556d-8370-66a2-4390d36c3c42	4210	Brnik - Aerodrom
00050000-556d-8370-abcc-6d5c9ecb9fdf	8321	Brusnice
00050000-556d-8370-a7aa-2d0ab3e16118	3255	Buče
00050000-556d-8370-d447-25b6b1d89d66	8276	Bučka 
00050000-556d-8370-2e8d-8b58ec68e593	9261	Cankova
00050000-556d-8370-24f5-7bcfe79b704d	3000	Celje 
00050000-556d-8370-9f2d-d2f7e8a60ef2	3001	Celje - poštni predali
00050000-556d-8370-3c36-b197b4d6c615	4207	Cerklje na Gorenjskem
00050000-556d-8370-eeac-99dd7e13e596	8263	Cerklje ob Krki
00050000-556d-8370-75a0-c23f218bcd94	1380	Cerknica
00050000-556d-8370-d27d-df313fe36b96	5282	Cerkno
00050000-556d-8370-ff5d-e2afbe0bec2a	2236	Cerkvenjak
00050000-556d-8370-ff28-e8f22dcd0436	2215	Ceršak
00050000-556d-8370-3f35-4aa8f4ec9c88	2326	Cirkovce
00050000-556d-8370-b55b-f2891bb274cf	2282	Cirkulane
00050000-556d-8370-523f-0a400c074bbf	5273	Col
00050000-556d-8370-b3be-458e25f46686	8251	Čatež ob Savi
00050000-556d-8370-b1e0-93cf52a43390	1413	Čemšenik
00050000-556d-8370-023b-02df3c57b2ed	5253	Čepovan
00050000-556d-8370-c935-3e9bb59826a8	9232	Črenšovci
00050000-556d-8370-a28c-579cea453215	2393	Črna na Koroškem
00050000-556d-8370-6b64-7fe1de9a8b92	6275	Črni Kal
00050000-556d-8370-13f3-6e5be2fc9a78	5274	Črni Vrh nad Idrijo
00050000-556d-8370-35ed-e6a1c4da0809	5262	Črniče
00050000-556d-8370-4073-44df3993f6b2	8340	Črnomelj
00050000-556d-8370-5a98-cb045b41651b	6271	Dekani
00050000-556d-8370-5800-19ef07a0c41d	5210	Deskle
00050000-556d-8370-9888-9e953bee4dcb	2253	Destrnik
00050000-556d-8370-6f9e-22dba199e865	6215	Divača
00050000-556d-8370-098b-c5fe5e05a6ab	1233	Dob
00050000-556d-8370-aefc-ae27603d1939	3224	Dobje pri Planini
00050000-556d-8370-aeb6-a6d8c4b7cebe	8257	Dobova
00050000-556d-8370-7cd2-f7de76abe1a5	1423	Dobovec
00050000-556d-8370-f05f-6cc89bba4702	5263	Dobravlje
00050000-556d-8370-01b4-881999efa496	3204	Dobrna
00050000-556d-8370-1a11-753a354a1f93	8211	Dobrnič
00050000-556d-8370-207a-5ef0df3d19d6	1356	Dobrova
00050000-556d-8370-c100-772c58855763	9223	Dobrovnik/Dobronak 
00050000-556d-8370-0844-e23883c59dd0	5212	Dobrovo v Brdih
00050000-556d-8370-b2ff-913d6d0eab49	1431	Dol pri Hrastniku
00050000-556d-8370-d95e-c0d5487d3337	1262	Dol pri Ljubljani
00050000-556d-8370-131f-b0167aef1533	1273	Dole pri Litiji
00050000-556d-8370-66c3-5a9f72447d0b	1331	Dolenja vas
00050000-556d-8370-ecb3-88b378949242	8350	Dolenjske Toplice
00050000-556d-8370-7672-b53aa7596020	1230	Domžale
00050000-556d-8370-2394-fd0724afe28f	2252	Dornava
00050000-556d-8370-0015-997deac26529	5294	Dornberk
00050000-556d-8370-87ae-0db4303155c9	1319	Draga
00050000-556d-8370-746a-0c48997e6821	8343	Dragatuš
00050000-556d-8370-dc18-3eb3f98329a7	3222	Dramlje
00050000-556d-8370-fc28-d3cde8d85443	2370	Dravograd
00050000-556d-8370-a716-9e86f3f03a4b	4203	Duplje
00050000-556d-8370-c6b0-6f0a2e21e377	6221	Dutovlje
00050000-556d-8370-ccf8-308aa019dab4	8361	Dvor
00050000-556d-8370-bf7f-33cc35b24b3b	2343	Fala
00050000-556d-8370-a86a-9596fcd4004c	9208	Fokovci
00050000-556d-8370-3593-b9b9447c1d25	2313	Fram
00050000-556d-8370-4cc3-8ddfdf99331b	3213	Frankolovo
00050000-556d-8370-14a5-ac3ee92e689e	1274	Gabrovka
00050000-556d-8370-db02-33182a44abfc	8254	Globoko
00050000-556d-8370-5dda-6b6907de7fd2	5275	Godovič
00050000-556d-8370-382b-9d57ff9290e1	4204	Golnik
00050000-556d-8370-832d-4d9092e07566	3303	Gomilsko
00050000-556d-8370-8c28-71e7d1a40d07	4224	Gorenja vas
00050000-556d-8370-be13-85d0c7daf127	3263	Gorica pri Slivnici
00050000-556d-8370-4cb2-f36994ab2cef	2272	Gorišnica
00050000-556d-8370-6ca5-e65c78eaac62	9250	Gornja Radgona
00050000-556d-8370-0dbc-70f988a95a1f	3342	Gornji Grad
00050000-556d-8370-e668-e9104cb4810a	4282	Gozd Martuljek
00050000-556d-8370-c44f-65856a583acb	6272	Gračišče
00050000-556d-8370-55fc-db1d0facb113	9264	Grad
00050000-556d-8370-4e8b-79d81894d439	8332	Gradac
00050000-556d-8370-880f-9d0dbbb67e36	1384	Grahovo
00050000-556d-8370-858b-afc1f6080693	5242	Grahovo ob Bači
00050000-556d-8370-aea5-2869b699e7bf	5251	Grgar
00050000-556d-8370-9cc2-129b190653d3	3302	Griže
00050000-556d-8370-9cff-766965a541bd	3231	Grobelno
00050000-556d-8370-043e-e58ca69d30ed	1290	Grosuplje
00050000-556d-8370-ec4e-6734e051aadf	2288	Hajdina
00050000-556d-8370-623d-b6f7e78a037d	8362	Hinje
00050000-556d-8370-20b7-a4f65f992afc	2311	Hoče
00050000-556d-8370-df3f-6cd44899f346	9205	Hodoš/Hodos
00050000-556d-8370-b597-166d8628158d	1354	Horjul
00050000-556d-8370-94e8-bcceea3d75b8	1372	Hotedršica
00050000-556d-8370-f543-c01cb5381c4b	1430	Hrastnik
00050000-556d-8370-597f-09d35b243637	6225	Hruševje
00050000-556d-8370-df8c-473323d60092	4276	Hrušica
00050000-556d-8370-9f61-4d9b1b3486e4	5280	Idrija
00050000-556d-8370-03f4-d53dce137b86	1292	Ig
00050000-556d-8370-a09f-62a1e8ca1c3f	6250	Ilirska Bistrica
00050000-556d-8370-aa0e-d43b417b58a1	6251	Ilirska Bistrica-Trnovo
00050000-556d-8370-4aa1-53ba8e3901a3	1295	Ivančna Gorica
00050000-556d-8370-01b1-7c653e85ff26	2259	Ivanjkovci
00050000-556d-8370-d48e-1f03f85ebcd7	1411	Izlake
00050000-556d-8370-80dd-913b37bdb2d6	6310	Izola/Isola
00050000-556d-8370-0b4e-3510b35b8bec	2222	Jakobski Dol
00050000-556d-8370-78af-60ba12e37ee6	2221	Jarenina
00050000-556d-8370-cd10-fb688520688f	6254	Jelšane
00050000-556d-8370-2017-2b9a2723d243	4270	Jesenice
00050000-556d-8370-f5c3-31e940147592	8261	Jesenice na Dolenjskem
00050000-556d-8370-7af6-ebff89b993b6	3273	Jurklošter
00050000-556d-8370-16f7-187026ed7cb2	2223	Jurovski Dol
00050000-556d-8370-d358-be49bcfd3dc3	2256	Juršinci
00050000-556d-8370-4efe-7f09a6e749d9	5214	Kal nad Kanalom
00050000-556d-8370-a5fd-bb274d826d18	3233	Kalobje
00050000-556d-8370-501b-2c74ec03ab23	4246	Kamna Gorica
00050000-556d-8370-4374-2b28c1c01c17	2351	Kamnica
00050000-556d-8370-ae97-261519f0095b	1241	Kamnik
00050000-556d-8370-da4f-8b4c7f554b66	5213	Kanal
00050000-556d-8370-a10e-efc80ba49b5c	8258	Kapele
00050000-556d-8370-aaba-9a5e5e2d4eeb	2362	Kapla
00050000-556d-8370-4c13-e0c79d4b7186	2325	Kidričevo
00050000-556d-8370-9752-87ba7d4bec7a	1412	Kisovec
00050000-556d-8370-fed7-9944bbc7c352	6253	Knežak
00050000-556d-8370-5663-daf9c3af52cf	5222	Kobarid
00050000-556d-8370-4196-fd69bfb9ae3e	9227	Kobilje
00050000-556d-8370-debb-3e7cf9afede8	1330	Kočevje
00050000-556d-8370-f1a5-fd17a97a1e4a	1338	Kočevska Reka
00050000-556d-8370-657f-4670824e31c3	2276	Kog
00050000-556d-8370-d36c-c282b1482eaa	5211	Kojsko
00050000-556d-8370-4b1d-341fa95e908f	6223	Komen
00050000-556d-8370-cfd1-564bdba55d8c	1218	Komenda
00050000-556d-8370-3810-694cc9aa47e7	6000	Koper/Capodistria 
00050000-556d-8370-be71-1bb2bef1e053	6001	Koper/Capodistria - poštni predali
00050000-556d-8370-c2e0-a846deb1192b	8282	Koprivnica
00050000-556d-8370-7a20-6642c22be3ba	5296	Kostanjevica na Krasu
00050000-556d-8370-eb7a-c4cf4b1edb74	8311	Kostanjevica na Krki
00050000-556d-8370-1ceb-eb1992ae71ec	1336	Kostel
00050000-556d-8370-750b-92a822a1563f	6256	Košana
00050000-556d-8370-df97-3cbe9d8e0fd2	2394	Kotlje
00050000-556d-8370-f3a4-52e4cc0edfda	6240	Kozina
00050000-556d-8370-2d6a-cfc4369b72de	3260	Kozje
00050000-556d-8370-9a74-046fe3c6db26	4000	Kranj 
00050000-556d-8370-5735-946f48563cb3	4001	Kranj - poštni predali
00050000-556d-8370-3876-44a4f85c3fea	4280	Kranjska Gora
00050000-556d-8370-2f7a-f0a8e0a59ad7	1281	Kresnice
00050000-556d-8370-a5d0-6f00576ecb60	4294	Križe
00050000-556d-8370-796d-5d47cd168791	9206	Križevci
00050000-556d-8370-9ec9-5bc635584e36	9242	Križevci pri Ljutomeru
00050000-556d-8370-78a9-f61f149183ac	1301	Krka
00050000-556d-8370-6e8d-d4d3ce7c2529	8296	Krmelj
00050000-556d-8370-0f1b-8c60c86c10e6	4245	Kropa
00050000-556d-8370-563b-48359fa19b09	8262	Krška vas
00050000-556d-8370-99c7-e91f41c79553	8270	Krško
00050000-556d-8370-0aae-c0ec670416ef	9263	Kuzma
00050000-556d-8370-2f35-b547775b75ee	2318	Laporje
00050000-556d-8370-24b5-991c9ee22861	3270	Laško
00050000-556d-8370-b5b0-7a209548bb58	1219	Laze v Tuhinju
00050000-556d-8370-9e71-faa01f797cd8	2230	Lenart v Slovenskih goricah
00050000-556d-8370-45eb-095370085a90	9220	Lendava/Lendva
00050000-556d-8370-3935-a2650226ba8d	4248	Lesce
00050000-556d-8370-35ab-881641ee68c2	3261	Lesično
00050000-556d-8370-281c-8401dc70a0e3	8273	Leskovec pri Krškem
00050000-556d-8370-b290-fcce557febea	2372	Libeliče
00050000-556d-8370-075d-f00889035424	2341	Limbuš
00050000-556d-8370-13d0-862b6f5d2486	1270	Litija
00050000-556d-8370-c582-ae52d7f43dc6	3202	Ljubečna
00050000-556d-8370-485c-059b782e0b26	1000	Ljubljana 
00050000-556d-8370-90be-b346749a08e5	1001	Ljubljana - poštni predali
00050000-556d-8370-9094-461d2e2a7087	1231	Ljubljana - Črnuče
00050000-556d-8370-6cd6-0ba20a81ebfc	1261	Ljubljana - Dobrunje
00050000-556d-8370-6e6b-bf0ef52dd3d7	1260	Ljubljana - Polje
00050000-556d-8370-a420-e538921a7a07	1210	Ljubljana - Šentvid
00050000-556d-8370-0320-9214b4a1a849	1211	Ljubljana - Šmartno
00050000-556d-8370-8e2c-976aab1539d0	3333	Ljubno ob Savinji
00050000-556d-8370-77d5-6c1249eaa4ef	9240	Ljutomer
00050000-556d-8370-1035-8774a657b16f	3215	Loče
00050000-556d-8370-1682-4316b211e62c	5231	Log pod Mangartom
00050000-556d-8370-320b-ba1dc037b1fa	1358	Log pri Brezovici
00050000-556d-8370-3fc7-ef1b2288d795	1370	Logatec
00050000-556d-8370-4610-f25d3aadd553	1371	Logatec
00050000-556d-8370-6ca3-279a3d4dccba	1434	Loka pri Zidanem Mostu
00050000-556d-8370-234c-ad5b3c65de4d	3223	Loka pri Žusmu
00050000-556d-8370-54cc-2517f4ed8edb	6219	Lokev
00050000-556d-8370-3052-831e015e46e5	1318	Loški Potok
00050000-556d-8370-29f1-7906f506cb0c	2324	Lovrenc na Dravskem polju
00050000-556d-8370-8e03-3fb2ad43b0f9	2344	Lovrenc na Pohorju
00050000-556d-8370-e847-4a61244569cb	3334	Luče
00050000-556d-8370-5f84-64f2d02f44ec	1225	Lukovica
00050000-556d-8370-071c-df1ca27f745a	9202	Mačkovci
00050000-556d-8370-3fc8-95d6c9f94ee6	2322	Majšperk
00050000-556d-8370-0b25-7e2a4dbbcd34	2321	Makole
00050000-556d-8370-5b1a-7154747c8f2c	9243	Mala Nedelja
00050000-556d-8370-b0f9-24dea289b16c	2229	Malečnik
00050000-556d-8370-56c0-106b95208bda	6273	Marezige
00050000-556d-8370-9fd6-e636b0f42f70	2000	Maribor 
00050000-556d-8370-67f3-c09287885849	2001	Maribor - poštni predali
00050000-556d-8370-c3ca-a543eb78c300	2206	Marjeta na Dravskem polju
00050000-556d-8370-fca4-606ceba372d6	2281	Markovci
00050000-556d-8370-616d-31a1fd5466c8	9221	Martjanci
00050000-556d-8370-a0c1-2b4313eaecdb	6242	Materija
00050000-556d-8370-cc3f-e731ec1c03bd	4211	Mavčiče
00050000-556d-8370-03cd-810abef1f933	1215	Medvode
00050000-556d-8370-7e3f-754fee7f5c88	1234	Mengeš
00050000-556d-8370-99bf-0aa763cef0e4	8330	Metlika
00050000-556d-8370-89cb-e197705359e0	2392	Mežica
00050000-556d-8370-316b-e455ada69ca2	2204	Miklavž na Dravskem polju
00050000-556d-8370-2cf0-ccd7bab874a5	2275	Miklavž pri Ormožu
00050000-556d-8370-e0fd-8eea85fadd4b	5291	Miren
00050000-556d-8370-20e2-f335e219b483	8233	Mirna
00050000-556d-8370-7e30-390d21bcec88	8216	Mirna Peč
00050000-556d-8370-6f56-ab32ead90dd2	2382	Mislinja
00050000-556d-8370-5caf-cbd4b7314657	4281	Mojstrana
00050000-556d-8370-5951-d55087a54235	8230	Mokronog
00050000-556d-8370-162d-a4d5af30a512	1251	Moravče
00050000-556d-8370-e16c-18641e2f3094	9226	Moravske Toplice
00050000-556d-8370-40b8-fee65898995e	5216	Most na Soči
00050000-556d-8370-8540-7bbde2aa587f	1221	Motnik
00050000-556d-8370-0925-5fb9c9b5d514	3330	Mozirje
00050000-556d-8370-78ec-a190cf1a95b8	9000	Murska Sobota 
00050000-556d-8370-a8eb-f8d560a46479	9001	Murska Sobota - poštni predali
00050000-556d-8370-4410-ebc810dad739	2366	Muta
00050000-556d-8370-eed8-518d6c5a42ad	4202	Naklo
00050000-556d-8370-fd5f-b7b7231a9ec2	3331	Nazarje
00050000-556d-8370-a5db-ae8c4b755950	1357	Notranje Gorice
00050000-556d-8370-3752-4e426ee1d92a	3203	Nova Cerkev
00050000-556d-8370-838b-4cd4e868ea85	5000	Nova Gorica 
00050000-556d-8370-58b2-d01997781319	5001	Nova Gorica - poštni predali
00050000-556d-8370-c4fd-212e22cf7ac9	1385	Nova vas
00050000-556d-8370-3e0e-a8ef6284098d	8000	Novo mesto
00050000-556d-8370-2d12-1ea12e60e66b	8001	Novo mesto - poštni predali
00050000-556d-8370-b10f-905ea3226d4a	6243	Obrov
00050000-556d-8370-c07b-e6cb471b04b1	9233	Odranci
00050000-556d-8370-48f1-a662360a0bd2	2317	Oplotnica
00050000-556d-8370-4903-50ae848689fc	2312	Orehova vas
00050000-556d-8370-6e97-8bc50342ced8	2270	Ormož
00050000-556d-8370-8159-d228c257c968	1316	Ortnek
00050000-556d-8370-b3c4-537645b7f1ef	1337	Osilnica
00050000-556d-8370-9443-5667182d8dc6	8222	Otočec
00050000-556d-8370-8d6d-df500037d7aa	2361	Ožbalt
00050000-556d-8370-be14-c0c6b5a6e63a	2231	Pernica
00050000-556d-8370-20d2-165a8cc6a21f	2211	Pesnica pri Mariboru
00050000-556d-8370-404f-aac2e17ca47d	9203	Petrovci
00050000-556d-8370-c6ac-57d96e59f354	3301	Petrovče
00050000-556d-8370-91b3-78c7607fd6a1	6330	Piran/Pirano
00050000-556d-8370-6daf-24a5d3ac3c28	8255	Pišece
00050000-556d-8370-4192-d06a2bd767a1	6257	Pivka
00050000-556d-8370-ecb3-77fa27ad8aa7	6232	Planina
00050000-556d-8370-9d4b-6c970ea81824	3225	Planina pri Sevnici
00050000-556d-8370-ba2c-aaacbaf4a3a6	6276	Pobegi
00050000-556d-8370-47a6-17786df01dec	8312	Podbočje
00050000-556d-8370-02ad-a5ac8e180bef	5243	Podbrdo
00050000-556d-8370-6b5a-fdd84fac6d21	3254	Podčetrtek
00050000-556d-8370-4ed8-e66ffd07345c	2273	Podgorci
00050000-556d-8370-050b-50c6a37cedab	6216	Podgorje
00050000-556d-8370-a44a-c945b2625f83	2381	Podgorje pri Slovenj Gradcu
00050000-556d-8370-262b-68b826bc6fb0	6244	Podgrad
00050000-556d-8370-8a53-c1821c0effd7	1414	Podkum
00050000-556d-8370-840b-b8882b04c15b	2286	Podlehnik
00050000-556d-8370-23c6-c70ed80f43dd	5272	Podnanos
00050000-556d-8370-dd20-d3e1cf805275	4244	Podnart
00050000-556d-8370-d313-bb509289b6cd	3241	Podplat
00050000-556d-8370-8cc4-d81c90d37600	3257	Podsreda
00050000-556d-8370-2697-7b4f0c60c1da	2363	Podvelka
00050000-556d-8370-36ac-1824438ff0cb	2208	Pohorje
00050000-556d-8370-65c3-d09df659ceef	2257	Polenšak
00050000-556d-8370-8cd7-170e917359c8	1355	Polhov Gradec
00050000-556d-8370-4ef5-e396123b398f	4223	Poljane nad Škofjo Loko
00050000-556d-8370-e9a6-4e68c5697318	2319	Poljčane
00050000-556d-8370-eb5d-7aa992cfa27f	1272	Polšnik
00050000-556d-8370-2163-a3e77fa549c6	3313	Polzela
00050000-556d-8370-a9c4-8b783f95010a	3232	Ponikva
00050000-556d-8370-6777-a7d17ac460fa	6320	Portorož/Portorose
00050000-556d-8370-90d5-71cac27eb2da	6230	Postojna
00050000-556d-8370-19ce-4fd1fff621ef	2331	Pragersko
00050000-556d-8370-4471-8f560ca7ef68	3312	Prebold
00050000-556d-8370-1fae-a1816def500b	4205	Preddvor
00050000-556d-8370-590e-c1f3551e9071	6255	Prem
00050000-556d-8370-d567-62da57b6e21c	1352	Preserje
00050000-556d-8370-6ed9-2576b7e4599c	6258	Prestranek
00050000-556d-8370-7d7d-aef52cd3ab28	2391	Prevalje
00050000-556d-8370-4cf7-7890544a7868	3262	Prevorje
00050000-556d-8370-1b35-4bd85f6240ea	1276	Primskovo 
00050000-556d-8370-3b6e-1df5f7f93f8b	3253	Pristava pri Mestinju
00050000-556d-8370-1b6d-e4fd9be465f4	9207	Prosenjakovci/Partosfalva
00050000-556d-8370-d8a9-fab3b5b92346	5297	Prvačina
00050000-556d-8370-9bed-95030d21c6b5	2250	Ptuj
00050000-556d-8370-71ca-2f563640735e	2323	Ptujska Gora
00050000-556d-8370-8cdb-0bee8405aaa9	9201	Puconci
00050000-556d-8370-feea-df01048f4e8f	2327	Rače
00050000-556d-8370-53be-367a0eed164f	1433	Radeče
00050000-556d-8370-f991-3caa8680cadd	9252	Radenci
00050000-556d-8370-6d17-e5b8ca5c689f	2360	Radlje ob Dravi
00050000-556d-8370-c11e-d50b9a88e9be	1235	Radomlje
00050000-556d-8370-54e3-c154d8b3a492	4240	Radovljica
00050000-556d-8370-e7bc-7967c1df9413	8274	Raka
00050000-556d-8370-7d35-e2b6ed420b46	1381	Rakek
00050000-556d-8370-ace6-76e05762a8dc	4283	Rateče - Planica
00050000-556d-8370-176f-ac0dca76dbea	2390	Ravne na Koroškem
00050000-556d-8370-ccf1-feeebc7fc85a	9246	Razkrižje
00050000-556d-8370-d5bb-e47c089ec13d	3332	Rečica ob Savinji
00050000-556d-8370-1bee-4a5d5c49fe79	5292	Renče
00050000-556d-8370-cbb4-33535fd92406	1310	Ribnica
00050000-556d-8370-4c2d-d89aaf73aa23	2364	Ribnica na Pohorju
00050000-556d-8370-4810-fdacdba7483b	3272	Rimske Toplice
00050000-556d-8370-e027-c4bc400cdcb6	1314	Rob
00050000-556d-8370-0a88-43439267f435	5215	Ročinj
00050000-556d-8370-9f09-d865504b4fb2	3250	Rogaška Slatina
00050000-556d-8370-04bd-c58273f29d45	9262	Rogašovci
00050000-556d-8370-ef86-8f8a03fc794c	3252	Rogatec
00050000-556d-8370-1a53-0291187aac52	1373	Rovte
00050000-556d-8370-890b-4307f15743c9	2342	Ruše
00050000-556d-8370-8f5f-9ece668984d3	1282	Sava
00050000-556d-8370-77ed-3057ab1d1fa2	6333	Sečovlje/Sicciole
00050000-556d-8370-2fa5-dc42a6880aef	4227	Selca
00050000-556d-8370-e8ff-0c9a228122f5	2352	Selnica ob Dravi
00050000-556d-8370-7ef7-10f63437e737	8333	Semič
00050000-556d-8370-ec72-0fabc1a16ed0	8281	Senovo
00050000-556d-8370-2aaf-a14452aad90e	6224	Senožeče
00050000-556d-8370-ab89-192353ab4add	8290	Sevnica
00050000-556d-8370-afa9-36a659002105	6210	Sežana
00050000-556d-8370-cf2b-c53eaabda846	2214	Sladki Vrh
00050000-556d-8370-1fab-e561198abdbf	5283	Slap ob Idrijci
00050000-556d-8370-509b-a2e92c04fad2	2380	Slovenj Gradec
00050000-556d-8370-532b-63edb918692f	2310	Slovenska Bistrica
00050000-556d-8370-4b04-08d99c518bd6	3210	Slovenske Konjice
00050000-556d-8370-aa7d-8325061d73a0	1216	Smlednik
00050000-556d-8370-5a62-3cfa29d103fd	5232	Soča
00050000-556d-8370-d3f3-7e42441e0c9f	1317	Sodražica
00050000-556d-8370-de1d-3a26172c2558	3335	Solčava
00050000-556d-8370-7396-7139c9697247	5250	Solkan
00050000-556d-8370-06bd-36a86aec5f1d	4229	Sorica
00050000-556d-8370-5eeb-fd3c29787f3a	4225	Sovodenj
00050000-556d-8370-47fa-21a96b776754	5281	Spodnja Idrija
00050000-556d-8370-5bc0-9d09d549db26	2241	Spodnji Duplek
00050000-556d-8370-b4c2-5d88d21013bc	9245	Spodnji Ivanjci
00050000-556d-8370-e837-e7f2a047590c	2277	Središče ob Dravi
00050000-556d-8370-afca-15168db8351b	4267	Srednja vas v Bohinju
00050000-556d-8370-d889-ee035ab65730	8256	Sromlje 
00050000-556d-8370-1ee1-88100b1bca19	5224	Srpenica
00050000-556d-8370-3065-6c946cdd466e	1242	Stahovica
00050000-556d-8370-f72f-866beb5709ba	1332	Stara Cerkev
00050000-556d-8370-145d-b2a1d1c8c106	8342	Stari trg ob Kolpi
00050000-556d-8370-b97a-9bc2eff1cbf7	1386	Stari trg pri Ložu
00050000-556d-8370-e40a-5db54c6da143	2205	Starše
00050000-556d-8370-6625-72da243b3c50	2289	Stoperce
00050000-556d-8370-7e30-7d1882e36c71	8322	Stopiče
00050000-556d-8370-00a3-b195be8cd343	3206	Stranice
00050000-556d-8370-448b-2067568c5de1	8351	Straža
00050000-556d-8370-461e-abd166e17dc0	1313	Struge
00050000-556d-8370-1c55-18d698ff6ea6	8293	Studenec
00050000-556d-8370-3775-07995d8df096	8331	Suhor
00050000-556d-8370-56ac-b82bf72ab6f5	2233	Sv. Ana v Slovenskih goricah
00050000-556d-8370-eee9-618e6d22c0b9	2235	Sv. Trojica v Slovenskih goricah
00050000-556d-8370-a6dc-c50535e98469	2353	Sveti Duh na Ostrem Vrhu
00050000-556d-8370-aeea-dd4d5545fcc4	9244	Sveti Jurij ob Ščavnici
00050000-556d-8370-7fcf-993edfd48ff9	3264	Sveti Štefan
00050000-556d-8370-57d4-47110f53eaa8	2258	Sveti Tomaž
00050000-556d-8370-3d45-7b75a51b559e	9204	Šalovci
00050000-556d-8370-2765-8a85b67241d9	5261	Šempas
00050000-556d-8370-2f59-f1a166d5a75a	5290	Šempeter pri Gorici
00050000-556d-8370-3c06-94a92cc291a3	3311	Šempeter v Savinjski dolini
00050000-556d-8370-9291-66e3fcab32ca	4208	Šenčur
00050000-556d-8370-cf84-f00ea7ba95ba	2212	Šentilj v Slovenskih goricah
00050000-556d-8370-32d1-08b0e192a448	8297	Šentjanž
00050000-556d-8370-71ba-89c15f4ab84e	2373	Šentjanž pri Dravogradu
00050000-556d-8370-17e8-ea7fbd024394	8310	Šentjernej
00050000-556d-8370-9894-c4c0f0438917	3230	Šentjur
00050000-556d-8370-6c99-66a0e201c966	3271	Šentrupert
00050000-556d-8370-9ac3-d8c95be6c149	8232	Šentrupert
00050000-556d-8370-bc87-09a0ce121b8d	1296	Šentvid pri Stični
00050000-556d-8370-ffb9-4aeb9758a33f	8275	Škocjan
00050000-556d-8370-2f93-345256faff5c	6281	Škofije
00050000-556d-8370-4a3b-0939c9040f4c	4220	Škofja Loka
00050000-556d-8370-9d79-bd5debac2597	3211	Škofja vas
00050000-556d-8370-779a-b22a58147eaf	1291	Škofljica
00050000-556d-8370-2502-0e563c3d6692	6274	Šmarje
00050000-556d-8370-f185-5bc409a73994	1293	Šmarje - Sap
00050000-556d-8370-e182-683ef5244110	3240	Šmarje pri Jelšah
00050000-556d-8370-e458-a8952ed59dae	8220	Šmarješke Toplice
00050000-556d-8370-1813-f001158ce349	2315	Šmartno na Pohorju
00050000-556d-8370-1a96-1f5e467f5ebf	3341	Šmartno ob Dreti
00050000-556d-8370-e2ad-310548aa8754	3327	Šmartno ob Paki
00050000-556d-8370-839f-b5d9f4220ada	1275	Šmartno pri Litiji
00050000-556d-8370-f5df-6c1d290aa49c	2383	Šmartno pri Slovenj Gradcu
00050000-556d-8370-0c38-883a01896b02	3201	Šmartno v Rožni dolini
00050000-556d-8370-a4b9-3cf4e43e8f6f	3325	Šoštanj
00050000-556d-8370-0c8d-f85ab1a4c59e	6222	Štanjel
00050000-556d-8370-1018-35d92b88c5bc	3220	Štore
00050000-556d-8370-e860-7138d70c2631	3304	Tabor
00050000-556d-8370-979d-7b736073e401	3221	Teharje
00050000-556d-8370-e429-add90649bf24	9251	Tišina
00050000-556d-8370-85f5-c06cc6e338fb	5220	Tolmin
00050000-556d-8370-8527-3e9b13c1a06c	3326	Topolšica
00050000-556d-8370-9099-ffd71e9574f9	2371	Trbonje
00050000-556d-8370-1b05-357b8ba618a7	1420	Trbovlje
00050000-556d-8370-4706-1f62945b25c8	8231	Trebelno 
00050000-556d-8370-f03a-d92c1e641817	8210	Trebnje
00050000-556d-8370-bb19-00380b0ce15a	5252	Trnovo pri Gorici
00050000-556d-8370-5301-1cc2e30298e4	2254	Trnovska vas
00050000-556d-8370-abb0-f0ae7591798d	1222	Trojane
00050000-556d-8370-2829-7e2ae77d97cd	1236	Trzin
00050000-556d-8370-2f96-58dd72fdfd71	4290	Tržič
00050000-556d-8370-3fda-f408066f503d	8295	Tržišče
00050000-556d-8370-3353-7d199a3ffc9d	1311	Turjak
00050000-556d-8370-2515-7aad1d021cac	9224	Turnišče
00050000-556d-8370-80f3-ad3e55d5ae5f	8323	Uršna sela
00050000-556d-8370-af4a-241786e10f86	1252	Vače
00050000-556d-8370-cb43-e1119ec60f04	3320	Velenje 
00050000-556d-8370-1ce7-ea8a666f265e	3322	Velenje - poštni predali
00050000-556d-8370-317a-4ab47eb65dc2	8212	Velika Loka
00050000-556d-8370-55d4-ff753dcc8e00	2274	Velika Nedelja
00050000-556d-8370-b62d-e659f08c8391	9225	Velika Polana
00050000-556d-8370-3042-e7e079cf2dd6	1315	Velike Lašče
00050000-556d-8370-8698-e62b10f5f40d	8213	Veliki Gaber
00050000-556d-8370-1683-72df6a1f91d7	9241	Veržej
00050000-556d-8370-9634-f036c5f1a651	1312	Videm - Dobrepolje
00050000-556d-8370-ad87-cea22a0646cc	2284	Videm pri Ptuju
00050000-556d-8370-88c0-8def410b8f5b	8344	Vinica
00050000-556d-8370-6b93-8195b08c9c4b	5271	Vipava
00050000-556d-8370-f8a8-841e0974cf58	4212	Visoko
00050000-556d-8370-7f32-3a445dd3acc5	1294	Višnja Gora
00050000-556d-8370-63d6-7b84a0328330	3205	Vitanje
00050000-556d-8370-09fa-18b4dd70ff32	2255	Vitomarci
00050000-556d-8370-f69e-0fc9fae8fba7	1217	Vodice
00050000-556d-8370-8a5a-283e46b4344f	3212	Vojnik\t
00050000-556d-8370-03ec-a000fe39830b	5293	Volčja Draga
00050000-556d-8370-42b9-20005c617365	2232	Voličina
00050000-556d-8370-4bf1-1fcacfc2c5d4	3305	Vransko
00050000-556d-8370-d04a-d71eb7423dc3	6217	Vremski Britof
00050000-556d-8370-cf9f-fda4df086977	1360	Vrhnika
00050000-556d-8370-bb1a-83c09201adf6	2365	Vuhred
00050000-556d-8370-2add-cac80824cd76	2367	Vuzenica
00050000-556d-8370-e62f-33f844bef12e	8292	Zabukovje 
00050000-556d-8370-1b7c-cceba99ffecc	1410	Zagorje ob Savi
00050000-556d-8370-f961-245194d3fcdb	1303	Zagradec
00050000-556d-8370-cf28-56622497c2db	2283	Zavrč
00050000-556d-8370-4f37-845e7d9d9828	8272	Zdole 
00050000-556d-8370-a412-7f76cbb2b332	4201	Zgornja Besnica
00050000-556d-8370-0ce5-c859665f8d9d	2242	Zgornja Korena
00050000-556d-8370-8c6c-68225fe30586	2201	Zgornja Kungota
00050000-556d-8370-df07-654858ad904e	2316	Zgornja Ložnica
00050000-556d-8370-b6a3-0a14c89a10d0	2314	Zgornja Polskava
00050000-556d-8370-3ada-b7d3dbdca70d	2213	Zgornja Velka
00050000-556d-8370-db00-ce5575a69689	4247	Zgornje Gorje
00050000-556d-8370-6b73-b21b1b6c7a89	4206	Zgornje Jezersko
00050000-556d-8370-76c0-cb90b2c379ee	2285	Zgornji Leskovec
00050000-556d-8370-a347-6f11e20d7b0a	1432	Zidani Most
00050000-556d-8370-ba1c-065793ed75cf	3214	Zreče
00050000-556d-8370-7030-b8fcb270271d	4209	Žabnica
00050000-556d-8370-a497-5c2864571951	3310	Žalec
00050000-556d-8370-516c-02bb83433de3	4228	Železniki
00050000-556d-8370-7665-cf40260551e5	2287	Žetale
00050000-556d-8370-9a81-95b4b763d7e9	4226	Žiri
00050000-556d-8370-cc65-9ef8fb30f6a6	4274	Žirovnica
00050000-556d-8370-75eb-b8219748d5ae	8360	Žužemberk
\.


--
-- TOC entry 2799 (class 0 OID 6001080)
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
-- TOC entry 2781 (class 0 OID 6000891)
-- Dependencies: 185
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
\.


--
-- TOC entry 2787 (class 0 OID 6000969)
-- Dependencies: 191
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, gostujoc_id) FROM stdin;
\.


--
-- TOC entry 2801 (class 0 OID 6001092)
-- Dependencies: 205
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 2814 (class 0 OID 6001212)
-- Dependencies: 218
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, uprizoritev_id, koproducent_id, odstotekfinanciranja, nasstrosek, lastnasredstva, zaproseno, drugijavni, avtorskih, tantiemi, skupnistrosek, zaprosenprocent) FROM stdin;
\.


--
-- TOC entry 2818 (class 0 OID 6001263)
-- Dependencies: 222
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-556d-8371-c9f9-60f2c5b111bb	00080000-556d-8371-14df-7d86c75857e9	0987	A
00190000-556d-8371-ffc9-f3a0f2a0bdfc	00080000-556d-8371-0750-ace5010f236d	0989	A
\.


--
-- TOC entry 2825 (class 0 OID 6001375)
-- Dependencies: 229
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sezona_id, sifra, naziv, zacetek, konec, potrjenprogram) FROM stdin;
\.


--
-- TOC entry 2828 (class 0 OID 6001403)
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
-- TOC entry 2826 (class 0 OID 6001384)
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
-- TOC entry 2805 (class 0 OID 6001121)
-- Dependencies: 209
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, sifra, naziv, jeprizorisce, kapaciteta, opis) FROM stdin;
00220000-556d-8371-f0d7-c8a1fce66f33	0001	Poskusna 1	f	8	Poskusna učilnica v prvem
00220000-556d-8371-e927-a51254c71e72	0002	Poskusna 3	f	34	Poskusna učilnica v tretjem
00220000-556d-8371-109b-837ba51f992f	0003	Kazinska	t	84	Kazinska dvorana
00220000-556d-8371-d809-6c4c88512d3c	0004	Mali oder	t	24	Mali oder 
00220000-556d-8371-be31-75649f0640bf	0005	Komorni oder	t	15	Komorni oder
00220000-556d-8371-6b0c-7c1f47bf0da2	0006	Stara dvorana	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-556d-8371-35a6-4c6cced3faeb	0007	Velika dvorana	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2797 (class 0 OID 6001065)
-- Dependencies: 201
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2796 (class 0 OID 6001055)
-- Dependencies: 200
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 2817 (class 0 OID 6001252)
-- Dependencies: 221
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 2812 (class 0 OID 6001189)
-- Dependencies: 216
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2770 (class 0 OID 6000763)
-- Dependencies: 174
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	Aaa\\Entity\\User	00010000-556d-8371-f45a-0bbda7561fcb	00010000-556d-8371-e102-30a07cce6e6e	2015-06-02 12:20:34	UPD	a:1:{s:8:"password";a:2:{i:0;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxRO3US02bsCXYoKk4OacRnPceHE2PO99sq";i:1;s:60:"$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq";}}
\.


--
-- TOC entry 2845 (class 0 OID 0)
-- Dependencies: 173
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 1, true);


--
-- TOC entry 2806 (class 0 OID 6001131)
-- Dependencies: 210
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2774 (class 0 OID 6000801)
-- Dependencies: 178
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-556d-8371-6293-fb2c4defbe33	beri-vse	Polni dostop do vsega v aplikaciji.	t
00020000-556d-8371-0cf6-27feb7d11dff	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-556d-8371-1a66-a8cff9e8c65e	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-556d-8371-d3ac-e080537daa82	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-556d-8371-93ee-e1e3fd6d5576	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-556d-8371-11c2-acd18e17ed4c	admin	Polni dostop do vsega v aplikaciji.	t
\.


--
-- TOC entry 2772 (class 0 OID 6000785)
-- Dependencies: 176
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-556d-8371-f45a-0bbda7561fcb	00020000-556d-8371-d3ac-e080537daa82
00010000-556d-8371-e102-30a07cce6e6e	00020000-556d-8371-d3ac-e080537daa82
\.


--
-- TOC entry 2808 (class 0 OID 6001145)
-- Dependencies: 212
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2800 (class 0 OID 6001086)
-- Dependencies: 204
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2794 (class 0 OID 6001036)
-- Dependencies: 198
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, imesezone, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2831 (class 0 OID 6001421)
-- Dependencies: 235
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00000000-556d-8370-1442-24083b5bb7d9	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00000000-556d-8370-8858-5521a874af80	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00000000-556d-8370-27ed-7f4725bf059b	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00000000-556d-8370-8355-3997d6ce2d50	sif	Številčenje šifrant	\N	\N	1000	4	%n	t	f
00000000-556d-8370-b0ea-b4edb51e322a	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2830 (class 0 OID 6001414)
-- Dependencies: 234
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00000000-556d-8370-f3b1-532330904d2e	00000000-556d-8370-8355-3997d6ce2d50	popa
00000000-556d-8370-0d77-0d7312901506	00000000-556d-8370-8355-3997d6ce2d50	oseba
00000000-556d-8370-7b97-93c25f58e57d	00000000-556d-8370-8858-5521a874af80	prostor
00000000-556d-8370-57bd-fca1cb1f1baf	00000000-556d-8370-8355-3997d6ce2d50	besedilo
00000000-556d-8370-7556-bd82b4f7ee84	00000000-556d-8370-8355-3997d6ce2d50	uprizoritev
00000000-556d-8370-6ac0-fcf9afdcba6a	00000000-556d-8370-8355-3997d6ce2d50	funkcija
00000000-556d-8370-0cd5-026bdb4a906f	00000000-556d-8370-8355-3997d6ce2d50	tipfunkcije
00000000-556d-8370-38a2-55ff0914f7a3	00000000-556d-8370-8355-3997d6ce2d50	alternacija
00000000-556d-8370-0a8f-5ff21aa8fe4e	00000000-556d-8370-1442-24083b5bb7d9	pogodba
00000000-556d-8370-bc70-be33547194c4	00000000-556d-8370-8355-3997d6ce2d50	zaposlitev
\.


--
-- TOC entry 2829 (class 0 OID 6001409)
-- Dependencies: 233
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
\.


--
-- TOC entry 2813 (class 0 OID 6001199)
-- Dependencies: 217
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, sort) FROM stdin;
\.


--
-- TOC entry 2779 (class 0 OID 6000863)
-- Dependencies: 183
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2795 (class 0 OID 6001042)
-- Dependencies: 199
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-556d-8372-15eb-a31e9d7f60c0	00180000-556d-8371-79af-e4e7f841aa12	000c0000-556d-8371-e5d1-e3f0dbd74317	00090000-556d-8371-44ab-efaf667efed3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556d-8372-d4fa-1f4ebcd66c7b	00180000-556d-8371-79af-e4e7f841aa12	000c0000-556d-8371-0896-ba6a0274b2a7	00090000-556d-8371-f1e2-50752bf372c0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556d-8372-7c8f-349ec5c932cf	00180000-556d-8371-79af-e4e7f841aa12	000c0000-556d-8371-75ee-90536cce3830	00090000-556d-8371-41fa-9bf461317933	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556d-8372-2afc-3e5994f1c382	00180000-556d-8371-79af-e4e7f841aa12	000c0000-556d-8372-84e7-0659a592213c	00090000-556d-8371-2715-5efac2c382e6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556d-8372-4877-569e353d898b	00180000-556d-8371-79af-e4e7f841aa12	000c0000-556d-8372-d6c9-3a398f0396b1	00090000-556d-8371-434b-3935ec732596	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2
001a0000-556d-8372-64ac-2e73266050c6	00180000-556d-8371-d2d9-c51b3b9e7f07	\N	00090000-556d-8371-434b-3935ec732596	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2
\.


--
-- TOC entry 2816 (class 0 OID 6001241)
-- Dependencies: 220
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, ime, opis, nastopajoc, imezenski, podrocje) FROM stdin;
000f0000-556d-8370-b97d-58e3d72192a7	Igralec ali animator	Igralci in animatorji	t	Igralka ali animatorka	igralec
000f0000-556d-8370-b9d1-e242dca3a2dd	Baletnik ali plesalec	Baletniki in plesalci	t	Baletnica ali plesalka	igralec
000f0000-556d-8370-72aa-4c21dead943e	Avtor	Avtorji	t	Avtorka	umetnik
000f0000-556d-8370-bb41-ba878975ffa0	Režiser	Režiserji	t	Režiserka	umetnik
000f0000-556d-8370-955e-983aec46fae2	Scenograf	Scenografi	t	Scenografka	tehnik
000f0000-556d-8370-57fa-38dd46396ddf	Kostumograf	Kostumografi	t	Kostumografinja	tehnik
000f0000-556d-8370-2096-8ebf0cb8c5d7	Oblikovalec maske	Oblikovalci maske	t	Oblikovalka maske	tehnik
000f0000-556d-8370-749f-4415c84b68cd	Avtor glasbe	Avtorji glasbe	t	Avtorica glasbe	umetnik
000f0000-556d-8370-c1f3-436dafad5bf4	Oblikovalec svetlobe	Oblikovalci svetlobe	t	Oblikovalka svetlobe	tehnik
000f0000-556d-8370-5d30-4b98165b1a2e	Koreograf	Koreografi	t	Koreografinja	umetnik
000f0000-556d-8370-4cc4-7472d43f14d2	Dramaturg	Dramaturgi	t	Dramaturginja	umetnik
000f0000-556d-8370-46ce-7d24efbe5757	Lektorj	Lektorji	t	Lektorica	umetnik
000f0000-556d-8370-ee3d-42dec46a0b5a	Prevajalec	Prevajalci	t	Prevajalka	umetnik
000f0000-556d-8370-4ac9-97567d67834f	Oblikovalec videa	Oblikovalci videa	t	Oblikovalka videa	umetnik
000f0000-556d-8370-1408-5a114a910b7e	Intermedijski ustvarjalec	Intermedijski ustvarjalci	t	Intermedijska ustvarjalka	umetnik
000f0000-556d-8370-9c75-18579368bd99	Nerazvrščeno	Nerazvrščeno	t	Nerazvrščeno	\N
\.


--
-- TOC entry 2827 (class 0 OID 6001392)
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
-- TOC entry 2784 (class 0 OID 6000926)
-- Dependencies: 188
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2771 (class 0 OID 6000772)
-- Dependencies: 175
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-556d-8371-e102-30a07cce6e6e	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROfVCSjHtDVKd9qtYUrrafchdXCnP3e/.	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-556d-8371-8c02-04bf8d361adb	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROt5VFEDSxeo4CrFfOfBrzMhOUAHTav0i	t	\N			ivo@ifigenija.si	\N	\N	\N
00010000-556d-8371-656e-34af7043bf77	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROuHgDPHvnuuvmXYsrpntW8n37bZju1v.	t	\N			tona@ifigenija.si	\N	\N	\N
00010000-556d-8371-e104-fb9ef11a84a7	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxROHCjcNbVREn9nawuuTwtfkOVLsNbySkW	t	\N			irena@ifigenija.si	\N	\N	\N
00010000-556d-8371-6ecb-220ae7e5de5b	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROOgW.ZN1Nf2.iZeKaLaWrZKhT5kjT.AW	t	\N			tatjana@ifigenija.si	\N	\N	\N
00010000-556d-8371-74e1-978e300b1b02	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROtCwG0owcVu/Q21ELszmwIiJ3jdDi4IC	t	\N			joze@ifigenija.si	\N	\N	\N
00010000-556d-8371-f45a-0bbda7561fcb	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 2821 (class 0 OID 6001297)
-- Dependencies: 225
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, sifra, faza, naslov, podnaslov, delovninaslov, datumzacstudija, stevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-556d-8371-8790-5836ccf37e51	00160000-556d-8371-b032-0ca1cce2b68f	00150000-556d-8370-042d-ba22158dcab0	00140000-556d-8370-12fb-4348fa8934f3	0001	produkcija	Sen kresne noči		Sanje	2016-02-01	\N	2016-06-01	1	William Shakespeare	f	2				\N	f		00220000-556d-8371-be31-75649f0640bf
000e0000-556d-8371-6e5c-ab16d2829b6e	00160000-556d-8371-0103-165bdf00f74e	00150000-556d-8370-15fd-edc899fd1fa7	00140000-556d-8370-e7a2-5603129c1453	0002	predprodukcija-ideja	Smoletov vrt			2017-01-01	\N	2016-04-20	2	B. Hočevar	f	2				\N	f		00220000-556d-8371-6b0c-7c1f47bf0da2
\.


--
-- TOC entry 2789 (class 0 OID 6000988)
-- Dependencies: 193
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-556d-8371-36fb-4464fecc0150	000e0000-556d-8371-6e5c-ab16d2829b6e	1	
00200000-556d-8371-6e2f-6d9711a73784	000e0000-556d-8371-6e5c-ab16d2829b6e	2	
\.


--
-- TOC entry 2804 (class 0 OID 6001113)
-- Dependencies: 208
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 2811 (class 0 OID 6001182)
-- Dependencies: 215
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
\.


--
-- TOC entry 2791 (class 0 OID 6001020)
-- Dependencies: 195
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id) FROM stdin;
\.


--
-- TOC entry 2820 (class 0 OID 6001287)
-- Dependencies: 224
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, ime, naziv) FROM stdin;
00140000-556d-8370-12fb-4348fa8934f3	Drama	drama (SURS 01)
00140000-556d-8370-825a-a1951a6b0858	Opera	opera (SURS 02)
00140000-556d-8370-f37f-4b3ee06a5e4a	Balet	balet (SURS 03)
00140000-556d-8370-6f85-a925ff62af71	Plesne prireditve	plesne prireditve (SURS 04)
00140000-556d-8370-8542-a92cb25be17a	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-556d-8370-e7a2-5603129c1453	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-556d-8370-62b8-73e3afcc4adb	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 2810 (class 0 OID 6001172)
-- Dependencies: 214
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, ime, opis) FROM stdin;
00150000-556d-8370-a9ae-bdccc0b82625	Opera	opera
00150000-556d-8370-a9ec-9567fa6bb630	Opereta	opereta
00150000-556d-8370-fdeb-e54664d84acf	Balet	balet
00150000-556d-8370-70be-1787d8349f77	Plesne prireditve	plesne prireditve
00150000-556d-8370-a4fe-9dd26f061786	Lutkovno gledališče	lutkovno gledališče
00150000-556d-8370-ac8c-84a8ba07fe78	Raziskovalno gledališče	raziskovalno gledališče
00150000-556d-8370-5bdb-45667c884604	Biografska drama	biografska drama
00150000-556d-8370-042d-ba22158dcab0	Komedija	komedija
00150000-556d-8370-afb3-90b62ccf6dd8	Črna komedija	črna komedija
00150000-556d-8370-f869-aa87eabdea84	E-igra	E-igra
00150000-556d-8370-15fd-edc899fd1fa7	Kriminalka	kriminalka
00150000-556d-8370-250e-59f699b86a59	Musical	musical
\.


--
-- TOC entry 2364 (class 2606 OID 6000826)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 6001342)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 6001332)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 6001240)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2419 (class 2606 OID 6001010)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2435 (class 2606 OID 6001035)
-- Name: dogodekizven_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodekizven
    ADD CONSTRAINT dogodekizven_pkey PRIMARY KEY (id);


--
-- TOC entry 2398 (class 2606 OID 6000952)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2549 (class 2606 OID 6001371)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2490 (class 2606 OID 6001168)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2413 (class 2606 OID 6000986)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2432 (class 2606 OID 6001029)
-- Name: gostujoca_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT gostujoca_pkey PRIMARY KEY (id);


--
-- TOC entry 2406 (class 2606 OID 6000966)
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
-- TOC entry 2456 (class 2606 OID 6001078)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2468 (class 2606 OID 6001105)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2391 (class 2606 OID 6000924)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2368 (class 2606 OID 6000835)
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
-- TOC entry 2371 (class 2606 OID 6000859)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2362 (class 2606 OID 6000815)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2355 (class 2606 OID 6000800)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 6001111)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2483 (class 2606 OID 6001144)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2525 (class 2606 OID 6001282)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2380 (class 2606 OID 6000888)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2388 (class 2606 OID 6000912)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2460 (class 2606 OID 6001084)
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
-- TOC entry 2386 (class 2606 OID 6000902)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2411 (class 2606 OID 6000973)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2466 (class 2606 OID 6001096)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 6001224)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2518 (class 2606 OID 6001268)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2555 (class 2606 OID 6001382)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2564 (class 2606 OID 6001407)
-- Name: programfestival_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT programfestival_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 6001389)
-- Name: programgostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT programgostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 6001128)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2454 (class 2606 OID 6001069)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2448 (class 2606 OID 6001060)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2516 (class 2606 OID 6001262)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 6001196)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2347 (class 2606 OID 6000771)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2481 (class 2606 OID 6001135)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2353 (class 2606 OID 6000789)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2357 (class 2606 OID 6000809)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 6001153)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2462 (class 2606 OID 6001091)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2437 (class 2606 OID 6001041)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2572 (class 2606 OID 6001427)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 6001418)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 6001413)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 6001209)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2377 (class 2606 OID 6000868)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2442 (class 2606 OID 6001051)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2514 (class 2606 OID 6001251)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 2606 OID 6001402)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2396 (class 2606 OID 6000937)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2349 (class 2606 OID 6000784)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2535 (class 2606 OID 6001312)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2417 (class 2606 OID 6000995)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 6001119)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2498 (class 2606 OID 6001187)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2430 (class 2606 OID 6001024)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2528 (class 2606 OID 6001296)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 6001181)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2420 (class 1259 OID 6001017)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2503 (class 1259 OID 6001210)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2504 (class 1259 OID 6001211)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2378 (class 1259 OID 6000890)
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
-- TOC entry 2469 (class 1259 OID 6001112)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2463 (class 1259 OID 6001098)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2464 (class 1259 OID 6001097)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2415 (class 1259 OID 6000996)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2491 (class 1259 OID 6001169)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2492 (class 1259 OID 6001171)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2493 (class 1259 OID 6001170)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2403 (class 1259 OID 6000968)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2404 (class 1259 OID 6000967)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2521 (class 1259 OID 6001284)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2522 (class 1259 OID 6001285)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2523 (class 1259 OID 6001286)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2529 (class 1259 OID 6001317)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2530 (class 1259 OID 6001314)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2531 (class 1259 OID 6001316)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2532 (class 1259 OID 6001315)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2393 (class 1259 OID 6000939)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2394 (class 1259 OID 6000938)
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
-- TOC entry 2369 (class 1259 OID 6000862)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2479 (class 1259 OID 6001136)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2433 (class 1259 OID 6001030)
-- Name: idx_4a45d07962b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4a45d07962b4ffca ON gostujoca USING btree (uprizoritev_id);


--
-- TOC entry 2359 (class 1259 OID 6000816)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2360 (class 1259 OID 6000817)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2484 (class 1259 OID 6001156)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2485 (class 1259 OID 6001155)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2486 (class 1259 OID 6001154)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2407 (class 1259 OID 6000974)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2408 (class 1259 OID 6000976)
-- Name: idx_602f6e466f7e7a33; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e466f7e7a33 ON predstava USING btree (gostujoc_id);


--
-- TOC entry 2409 (class 1259 OID 6000975)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2567 (class 1259 OID 6001420)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2443 (class 1259 OID 6001064)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2444 (class 1259 OID 6001062)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2445 (class 1259 OID 6001061)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2446 (class 1259 OID 6001063)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2350 (class 1259 OID 6000790)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2351 (class 1259 OID 6000791)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2472 (class 1259 OID 6001120)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2458 (class 1259 OID 6001085)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2499 (class 1259 OID 6001197)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2500 (class 1259 OID 6001198)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2550 (class 1259 OID 6001372)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2551 (class 1259 OID 6001374)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2552 (class 1259 OID 6001373)
-- Name: idx_8787a0e5b3836ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5b3836ea9 ON enotaprograma USING btree (tip_programske_enote_id);


--
-- TOC entry 2382 (class 1259 OID 6000904)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2383 (class 1259 OID 6000903)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2384 (class 1259 OID 6000905)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2562 (class 1259 OID 6001408)
-- Name: idx_8b6db2e8771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8b6db2e8771ec7bd ON programfestival USING btree (program_dela_id);


--
-- TOC entry 2507 (class 1259 OID 6001225)
-- Name: idx_97af082e62b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e62b4ffca ON produkcijadelitev USING btree (uprizoritev_id);


--
-- TOC entry 2508 (class 1259 OID 6001226)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2542 (class 1259 OID 6001346)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2543 (class 1259 OID 6001345)
-- Name: idx_a4b7244f1f9ae227; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f1f9ae227 ON alternacija USING btree (sodelovanje_id);


--
-- TOC entry 2544 (class 1259 OID 6001348)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2545 (class 1259 OID 6001344)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2546 (class 1259 OID 6001347)
-- Name: idx_a4b7244f93fdaf0b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f93fdaf0b ON alternacija USING btree (koprodukcija_id);


--
-- TOC entry 2496 (class 1259 OID 6001188)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2449 (class 1259 OID 6001073)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2450 (class 1259 OID 6001072)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2451 (class 1259 OID 6001070)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2452 (class 1259 OID 6001071)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2333 (class 1259 OID 529292)
-- Name: idx_b7229ce169e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b7229ce169e8d4 ON kose USING btree (naslov_id);


--
-- TOC entry 2538 (class 1259 OID 6001334)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2539 (class 1259 OID 6001333)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2553 (class 1259 OID 6001383)
-- Name: idx_c81bc37f3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c81bc37f3a0e32e3 ON programdela USING btree (sezona_id);


--
-- TOC entry 2414 (class 1259 OID 6000987)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2365 (class 1259 OID 6000837)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2366 (class 1259 OID 6000836)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2374 (class 1259 OID 6000869)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2375 (class 1259 OID 6000870)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2438 (class 1259 OID 6001054)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2439 (class 1259 OID 6001053)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2440 (class 1259 OID 6001052)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2556 (class 1259 OID 6001391)
-- Name: idx_ffeaf2ff4ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff4ae1cd1c ON programgostovanje USING btree (gostitelj_id);


--
-- TOC entry 2557 (class 1259 OID 6001390)
-- Name: idx_ffeaf2ff771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ffeaf2ff771ec7bd ON programgostovanje USING btree (program_dela_id);


--
-- TOC entry 2421 (class 1259 OID 6001019)
-- Name: konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX konec ON dogodek USING btree (konec);


--
-- TOC entry 2422 (class 1259 OID 6001015)
-- Name: uniq_11e93b5d10398482; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d10398482 ON dogodek USING btree (dogodek_izven_id);


--
-- TOC entry 2423 (class 1259 OID 6001012)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2424 (class 1259 OID 6001013)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2425 (class 1259 OID 6001011)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2426 (class 1259 OID 6001016)
-- Name: uniq_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2427 (class 1259 OID 6001014)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2381 (class 1259 OID 6000889)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2399 (class 1259 OID 6000953)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2400 (class 1259 OID 6000955)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2401 (class 1259 OID 6000954)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2402 (class 1259 OID 6000956)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2457 (class 1259 OID 6001079)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2526 (class 1259 OID 6001283)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2533 (class 1259 OID 6001313)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2372 (class 1259 OID 6000860)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2373 (class 1259 OID 6000861)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2573 (class 1259 OID 6001428)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2392 (class 1259 OID 6000925)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2570 (class 1259 OID 6001419)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2477 (class 1259 OID 6001130)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2478 (class 1259 OID 6001129)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2547 (class 1259 OID 6001343)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2336 (class 1259 OID 529293)
-- Name: uniq_b7229ce1a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b7229ce1a76ed395 ON kose USING btree (user_id);


--
-- TOC entry 2389 (class 1259 OID 6000913)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2519 (class 1259 OID 6001269)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 6001270)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2358 (class 1259 OID 6000810)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2428 (class 1259 OID 6001018)
-- Name: zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2599 (class 2606 OID 6001570)
-- Name: fk_11e93b5d10398482; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d10398482 FOREIGN KEY (dogodek_izven_id) REFERENCES dogodekizven(id);


--
-- TOC entry 2602 (class 2606 OID 6001555)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2601 (class 2606 OID 6001560)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2597 (class 2606 OID 6001580)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2603 (class 2606 OID 6001550)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2598 (class 2606 OID 6001575)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2600 (class 2606 OID 6001565)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2633 (class 2606 OID 6001725)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2632 (class 2606 OID 6001730)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2584 (class 2606 OID 6001485)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2620 (class 2606 OID 6001665)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2618 (class 2606 OID 6001660)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2619 (class 2606 OID 6001655)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2596 (class 2606 OID 6001545)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2628 (class 2606 OID 6001695)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2626 (class 2606 OID 6001705)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2627 (class 2606 OID 6001700)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2590 (class 2606 OID 6001520)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2591 (class 2606 OID 6001515)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2616 (class 2606 OID 6001645)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2639 (class 2606 OID 6001750)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2638 (class 2606 OID 6001755)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2637 (class 2606 OID 6001760)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2640 (class 2606 OID 6001780)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2643 (class 2606 OID 6001765)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2641 (class 2606 OID 6001775)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2642 (class 2606 OID 6001770)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2588 (class 2606 OID 6001510)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2589 (class 2606 OID 6001505)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2580 (class 2606 OID 6001470)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2581 (class 2606 OID 6001465)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2622 (class 2606 OID 6001675)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2604 (class 2606 OID 6001585)
-- Name: fk_4a45d07962b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostujoca
    ADD CONSTRAINT fk_4a45d07962b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2577 (class 2606 OID 6001445)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2576 (class 2606 OID 6001450)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2623 (class 2606 OID 6001690)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2624 (class 2606 OID 6001685)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2625 (class 2606 OID 6001680)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2594 (class 2606 OID 6001525)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2592 (class 2606 OID 6001535)
-- Name: fk_602f6e466f7e7a33; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e466f7e7a33 FOREIGN KEY (gostujoc_id) REFERENCES gostujoca(id);


--
-- TOC entry 2593 (class 2606 OID 6001530)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2658 (class 2606 OID 6001855)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2608 (class 2606 OID 6001620)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2610 (class 2606 OID 6001610)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2611 (class 2606 OID 6001605)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2609 (class 2606 OID 6001615)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2575 (class 2606 OID 6001435)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2574 (class 2606 OID 6001440)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2621 (class 2606 OID 6001670)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2617 (class 2606 OID 6001650)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2631 (class 2606 OID 6001715)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2630 (class 2606 OID 6001720)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2653 (class 2606 OID 6001820)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2651 (class 2606 OID 6001830)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2652 (class 2606 OID 6001825)
-- Name: fk_8787a0e5b3836ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5b3836ea9 FOREIGN KEY (tip_programske_enote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2586 (class 2606 OID 6001495)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2587 (class 2606 OID 6001490)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2585 (class 2606 OID 6001500)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2657 (class 2606 OID 6001850)
-- Name: fk_8b6db2e8771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programfestival
    ADD CONSTRAINT fk_8b6db2e8771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2635 (class 2606 OID 6001735)
-- Name: fk_97af082e62b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e62b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2634 (class 2606 OID 6001740)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2648 (class 2606 OID 6001805)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2649 (class 2606 OID 6001800)
-- Name: fk_a4b7244f1f9ae227; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f1f9ae227 FOREIGN KEY (sodelovanje_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2646 (class 2606 OID 6001815)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2650 (class 2606 OID 6001795)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2647 (class 2606 OID 6001810)
-- Name: fk_a4b7244f93fdaf0b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f93fdaf0b FOREIGN KEY (koprodukcija_id) REFERENCES produkcijadelitev(id);


--
-- TOC entry 2629 (class 2606 OID 6001710)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2612 (class 2606 OID 6001640)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2613 (class 2606 OID 6001635)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2615 (class 2606 OID 6001625)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2614 (class 2606 OID 6001630)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2644 (class 2606 OID 6001790)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2645 (class 2606 OID 6001785)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2654 (class 2606 OID 6001835)
-- Name: fk_c81bc37f3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT fk_c81bc37f3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2595 (class 2606 OID 6001540)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2636 (class 2606 OID 6001745)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2578 (class 2606 OID 6001460)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2579 (class 2606 OID 6001455)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2583 (class 2606 OID 6001475)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2582 (class 2606 OID 6001480)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2605 (class 2606 OID 6001600)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2606 (class 2606 OID 6001595)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2607 (class 2606 OID 6001590)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2655 (class 2606 OID 6001845)
-- Name: fk_ffeaf2ff4ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff4ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2656 (class 2606 OID 6001840)
-- Name: fk_ffeaf2ff771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programgostovanje
    ADD CONSTRAINT fk_ffeaf2ff771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


-- Completed on 2015-06-02 12:20:34 CEST

--
-- PostgreSQL database dump complete
--

